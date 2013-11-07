require 'recap'
require 'recap/support/namespace'
require 'recap/recipes/rails'
require 'recap/tasks/console/ssh'

module Recap::Tasks::Console::Rails
  extend Recap::Support::Namespace
  
  namespace :rails do
    desc "Remote console"
    task :console, roles: :app do
      run_interactively "bin/rails console"
    end

    desc "Remote dbconsole"
    task :dbconsole, roles: :app do
      run_interactively "bin/rails dbconsole --include-password"
    end
  end
end
