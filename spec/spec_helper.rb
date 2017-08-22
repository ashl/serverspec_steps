require 'serverspec'
require 'turnip'
require 'net/ssh'

Dir.glob("spec/steps/*steps.rb") { |f| load f, true }

set :backend, :exec
