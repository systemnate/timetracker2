# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :cookie_store, key: '_timetracker2_session'

#Rails.application.config.session_store :cookie_store, key: '_timetracker2_session', domain: {
#  production: '.taskclash.com',
#  development: '.taskclash.dev'
#}.fetch(Rails.env.to_sym, :all)
