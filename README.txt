■参考: RailsでAcitiveJobとDelayedJobを使ってバックグランド処理を行う
cf. http://ruby-rails.hatenadiary.com/entry/20150304/1425396671

ActiveJob: バックエンド処理(Job)の管理
DelayedJob : 非同期実行 : 専用テーブル(redis不要)
Sidekiq    : 非同期実行 : redis/管理画面/マルチスレッド
Resque     : 非同期実行 : redis/管理画面/フォーク


○主な手順
Gemfile:
gem 'delayed_job_actie_record'
gem 'daemons'

rails g delayed_job:active_record # job管理テーブル
rake db:migrate

rails g scaffold letter title description delivered_at:time
rake db:migrate


○fg/bg切り替え:「.delay」を挟むだけ
# app/controllers/letters_controller.rb
@letter.deliver       # fg処理
@letter.delay.deliver # bg処理


○workerの起動
# 例. fg処理
bin/rake jobs:work # 

# 例. bg処理(2woker)
bin/delayed_job -n 2 start
bin/delayed_job stop
bin/delayed_job -n 2 restart
# ls -1 tmp/pids/delayed_job.?.pid # 起動中のpids

