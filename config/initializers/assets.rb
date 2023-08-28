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
Rails.application.config.assets.precompile += %w( admins_backoffice.js admins_backoffice.css )
Rails.application.config.assets.precompile += %w( users_backoffice.js users_backoffice.css )

# /lib/assets
Rails.application.config.assets.precompile += %w( img.jpg )

# /vendor
Rails.application.config.assets.precompile += %w( jquery-2.2.3/dist/jquery.js )
Rails.application.config.assets.precompile += %w( custom.js custom.css )
Rails.application.config.assets.precompile += %w( sb-admin-2.js sb-admin-2.css )

# /node_modules
Rails.application.config.assets.precompile += %w( bootstrap/dist/js/bootstrap.js bootstrap/dist/css/bootstrap.css )
Rails.application.config.assets.precompile += %w( fastclick/lib/fastclick.js )
Rails.application.config.assets.precompile += %w( font-awesome/css/font-awesome.css )
Rails.application.config.assets.precompile += %w( jquery/dist/jquery.js )
Rails.application.config.assets.precompile += %w( malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.js malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css )
Rails.application.config.assets.precompile += %w( metismenu/dist/metisMenu.js metismenu/dist/metisMenu.css )
Rails.application.config.assets.precompile += %w( nprogress/nprogress.js nprogress/nprogress.css )
