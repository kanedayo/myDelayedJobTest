■参考: RailsでAcitiveJobとDelayedJobを使ってバックグランド処理を行う
cf. http://ruby-rails.hatenadiary.com/entry/20150304/1425396671
■参考: Active Job の基礎
cf. http://railsguides.jp/active_job_basics.html

非同期実行
ActiveJob  : Rails標準
DelayedJob : 専用テーブル(redis不要)
Resque     : redis/管理画面あり/フォーク
Sidekiq    : redis/管理画面あり/マルチスレッド


○主な手順
Gemfile:
gem 'delayed_job_active_record'
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
rake jobs:work # 終了は、Ctrl+C

# 例. bg処理(2woker)
./bin/delayed_job -n 2 start
./bin/delayed_job stop
./bin/delayed_job -n 2 restart
./bin/delayed_job status # 起動確認
