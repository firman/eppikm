# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_eppikm_session',
  :secret      => '3e89b4abadd58c2a7d1aef8c7482b77c3894e251b5f2d660e092a66ebd835ea6dd625afa0caa60c32649f00327f2241412278c90bf27bc5e66dd06693176b8d2'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

