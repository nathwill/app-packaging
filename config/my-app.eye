
Eye.config do
  logger File.join(Dir.pwd, 'log', 'eye.log')
end

Eye.application 'my-app' do
  group 'web' do
    process :rack do
      working_dir Dir.pwd
      pid_file 'tmp/my-app.pid'
      stdall 'log/my-app.log'

      daemonize true
      start_command 'bundle exec rackup -o 0.0.0.0 -p 8080'
      stop_signals [:USR1, 0, :TERM, 10.seconds, :KILL]

      check :cpu, every: 20.seconds, below: 30, times: [3, 5]
      check :memory, every: 20.seconds, below: 100.megabytes, times: [3, 5]
    end
  end
end
