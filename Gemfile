source 'https://rubygems.org'

gem 'rake'
gem 'rspec'
gem 'trollop'
gem 'sequel'
gem 'mysql2' #For MySQL

group 'debugger' do
  if /^2/.match RUBY_VERSION
    gem 'pry'
    gem 'pry-byebug'
  else
    gem 'pry-debugger'
  end
end
