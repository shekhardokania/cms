# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Cms::Application.config.secret_key_base = 'e0b6e65d01758f2f7f19c7d1b88dd938f983d17429dbff5a7404b49eaa5b92ddd38ed3cb775ef2d67d99a4817b6b3c1a19ff68b47862d27e5d02bdaeca89f55a'
