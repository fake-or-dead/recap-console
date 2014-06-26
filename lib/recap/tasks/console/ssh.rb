require 'recap'
require 'recap/support/namespace'

module Recap::Tasks::Console
  extend Recap::Support::Namespace

  namespace :ssh do
    desc "Remote ssh terminal"
    task :console, roles: :app do
      run_interactively
    end

    desc "Execute a command remotely"
    task :command, roles: :app do
      cmd = ENV['RUN'] || ""
      if cmd.empty?
        logger.important %Q{You must provide a command via 'RUN="foo" cap ssh:command' flag}
      else
        logger.info "Executing '#{cmd}'"
        run_interactively cmd
      end
    end
  end

  def run_interactively(command="bash", server=nil)
    server ||= find_servers_for_task(current_task).first
    setup = "cd #{deploy_to} && export PATH=./bin:$PATH"
    exec %Q{ssh #{user}@#{server.host} -t 'sudo su - #{application} -c "#{setup} && #{command}"'}
    # system 'ssh', '-l', user, server.host, '-t', "cd '#{current_path}' && env #{environment} #{command}"
  end
end
