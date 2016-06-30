■ RailsでAcitiveJobとDelayedJobを使ってバックグランド処理を行う
cf. http://ruby-rails.hatenadiary.com/entry/20150304/1425396671


Gemfile:
gem 'delayed_job_actie_record'

rails g scaffold letter title description delivered_at:time
rake db:migrate


