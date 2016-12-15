source 'https://rubygems.org'

gem 'rake'
gem 'rspec'
gem 'trollop'
gem 'sequel'
if /java/i.match(RUBY_PLATFORM)
  gem 'mysql2', platform: :ruby
  gem 'jdbc-mysql', platform: :jruby
  gem 'activerecord-jdbc-adapter', platform: :jruby
  gem 'jdbc-postgres',platform: :jruby
  gem 'jdbc-h2',platform: :jruby
else
 gem 'mysql2' #For MySQL
 gem 'pg', '0.18.4' # for postgreSQL
end

group 'debugger' do
  if /java/i.match(RUBY_PLATFORM)
    gem 'pry'
    gem 'pry-nav'
#    gem 'pry-byebug'
  elsif /^2/.match RUBY_VERSION
    gem 'pry'
    gem 'pry-byebug'
  else
    gem 'pry-debugger'
  end
end
