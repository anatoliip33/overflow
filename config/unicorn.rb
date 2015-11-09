app_path = '/home/overflows/app'
current_path = "#{app_path}/current"
shared_path = "#{app_path}/shared"

worker_processes 2

working_directory current_path

listen "#{shared_path}/tmp/unicorn.sock", backlog: 1024

timeout 60

pid "#{shared_path}/tmp/unicorn.pid"

stderr_path "#{shared_path}/log/unicorn.stderr.log"
stdout_path "#{shared_path}/log/unicorn.stdout.log"

preload_app true

GC.respond_to?(:copy_on_write_friendly=) and GC.copy_on_write_friendly = true

check_client_connection false

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!

  old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end
