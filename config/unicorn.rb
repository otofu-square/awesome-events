# リスンするIPアドレスとポート番号の設定
listen '127.0.0.1:3000'

# pid_fileの位置を設定
pid File.expand_path('tmp/pids/unicorn.pid', __FILE__)

# Unicornは複数のワーカーで起動するのでワーカー数を定義
# サーバーのメモリなどによって変更すること。
worker_processes 2

# 接続タイムアウト時間
timeout 15

# Unicornの再起動時にダウンタイムなしで再起動が行われる。
preload_app true

# Unicornのエラーログと通常ログの位置を指定。
ROOT = File.dirname(File.dirname(__FILE__))
stderr_path File.expand_path("#{ROOT}/log/unicorn_stderr.log', __FILE__")
stdout_path File.expand_path("#{ROOT}/log/unicorn_stdout.log', __FILE__")

# USR2シグナルを受けると古いプロセスを止める。
# 後述するが、記述しておくとNginxと連携する時に良いことがある。
before_fork do |server, worker|
  defined?(ActiveRecord::Base) and
      ActiveRecord::Base.connection.disconnect!

  old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
      Process.kill :QUIT, File.read(old_pid).to_i
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end
