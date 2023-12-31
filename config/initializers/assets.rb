# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = "1.0"

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
Rails.application.config.assets.paths << Rails.root.join("node_modules")
Rails.application.config.assets.paths << Rails.root.join("vendor", "stylesheets")

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.

# /app/assets
Rails.application.config.assets.precompile += %w( admins_backoffice.js admins_backoffice.css
                                                  users_backoffice.js users_backoffice.css
                                                  admin_devise.js admin_devise.css
                                                  user_devise.js user_devise.css
                                                  site.js site.css )

# /lib/assets
Rails.application.config.assets.precompile += %w( img.jpg )

# /vendor
Rails.application.config.assets.precompile += %w( jquery-2.2.3/dist/jquery.js
                                                  custom.js custom.css
                                                  sb-admin-2.js sb-admin-2.css
                                                  navbar.css
                                                  surface-fix.js surface-fix.css )

# /node_modules
Rails.application.config.assets.precompile += %w( jquery/dist/jquery.js
                                                  bootstrap/dist/js/bootstrap.js
                                                  metismenu/dist/metisMenu.js )
