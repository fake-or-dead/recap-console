require 'recap'
require 'recap/support/namespace'
require 'recap/recipes/rails'

module Recap::Tasks::Rails::Console
  extend Recap::Support::Namespace
  
  namespace :rails do
    desc "Remote console"
    task :console, roles: :app do
      run_interactively "bin/rails console"
    end

    desc "Remote dbconsole"
    task :dbconsole, roles: :app do
      run_interactively "bin/rails dbconsole"
    end
  end

  def run_interactively(command, server=nil)
    server ||= find_servers_for_task(current_task).first
    exec %Q(ssh #{server.host} -t 'sudo su - #{application} -c "cd #{deploy_to} && #{command}"')
  end
end
