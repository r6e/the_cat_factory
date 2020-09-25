release: bin/rails db:migrate assets:precompile
clock: bundle exec clockwork scheduler.rb
worker: bundle exec sidekiq -t 25
web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}
