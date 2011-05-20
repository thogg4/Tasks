# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_tasks_session',
  :secret      => '23f2326d07d01a7402e0c2e0842f5e566a956787588a588b906f2d553dd11190ddf502fabe3943bff9e5cc623deaaa5cc46b807481cc114b0d2fcb57fc14b4ee'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
