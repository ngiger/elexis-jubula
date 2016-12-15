source 'https://rubygems.org'

gem 'rake'
gem 'rspec'
gem 'trollop'
gem 'sequel'
if /^2/.match RUBY_VERSION
  gem 'mysql2'
else
  gem 'mysql'
end
gem 'pg', '0.18.4'

group 'debugger' do
  if /^2/.match RUBY_VERSION
    gem 'pry'
    gem 'pry-byebug'
  else
    gem 'pry-debugger'
  end
end
