# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

Rails.application.config.assets.precompile += %w(new-age.min.js )
Rails.application.config.assets.precompile += %w(cable.js )
Rails.application.config.assets.precompile += %w( new-age.min.css )

Rails.application.config.assets.precompile += %w(css/simple-line-icons )
Rails.application.config.assets.precompile += %w( device-mockups.css )

Rails.application.config.assets.precompile += %w( dashboard/index.js )

Rails.application.config.assets.precompile += %w( supports-show.scss )

Rails.application.config.assets.precompile += %w( supports-show.coffee )

Rails.application.config.assets.precompile += %w( channels/support.js )

Rails.application.config.assets.precompile += %w( sidebar.css )


