#!/usr/bin/env ruby
# encoding: utf-8
require 'timeout'
require 'pty'
require 'expect'

if ARGV.size != 2
  puts "Expecting two arguments: HOST PORT"
  exit 3
end
HOST = ARGV[0]
PORT = ARGV[1]
unless PORT.to_i > 0
  puts "PORT #{PORT} must be a positive integer"
  exit 1
end

CMD = "telnet #{HOST} #{PORT}"
def progress(msg)
  msg = "#{Time.now.strftime('%Y.%m.%d %H:%M:%S:%L')} install_sw_medelexis: #{msg}"
  puts msg
  STDOUT.flush
end
progress "Starting with CMD #{CMD.inspect} pid #{Process.pid}"

def get_status
  uptimedata = []
  status = Timeout::timeout(2) do PTY.spawn(CMD) do |ssh_read,ssh_write,pid|
    ssh_read.expect(/osgi> /) { |msg| ssh_write.printf("ss\n") }
      loop do
          ssh_read.expect(/\n/) { |line| uptimedata.push line}
          break if /.*org.eclipse.jubula.rc.rcp.*/.match(uptimedata[-1].to_s)
        end
    end
    id = /(\d+)/.match(uptimedata[-1].to_s)
    status = /([A-Z]+)/.match(uptimedata[-1].to_s)
    [status[1], id[1]]
  end
rescue Timeout::Error
  progress "Timeout while trying to connect via #{CMD}"
  return [nil, nil]
rescue Errno::EIO
  progress " Errno::EIO while opening  #{PORT} on #{HOST}"
  return [nil, nil]
end

def start(id)
  PTY.spawn(CMD) do |ssh_read,ssh_write,pid|
    ssh_write.printf("start #{id}\n")
  end
end

MAX = 50
count = 0
sleep(1)
progress "#{count}/#{MAX}"
while true
  status, id  = get_status
  progress "#{count}/#{MAX}: Status for #{PORT} on #{HOST} for #{id.inspect} was #{status.inspect}" if count > 0
  if status && status.eql?('ACTIVE')
    progress "#{count}/#{MAX}: exit as status ACTIVE #{status.inspect}" if count > 0
    count = -5
  end
  start(id) if status && status.eql?('RESOLVED')
  count += 1
  sleep(3)
end
progress "Unexexpected exit #{count} as counter #{count} > #{MAX} exit 1"
exit 1