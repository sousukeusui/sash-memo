# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = "1.0"

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
Rails.application.config.assets.paths << Rails.root.join("node_modules/bootstrap/dist/js")
Rails.application.config.assets.paths << Rails.root.join("node_modules/bootstrap-icons/font")
Rails.application.config.assets.paths << Rails.root.join("node_modules/bootstrap/dist/js")

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.precompile += %w( 
  bootstrap.min.js 
  popper.js 
  cocoon.js
  top.css
  index.css
  show.css
  new.css
  google-icon.png
  line_44.png
  background4.jpg
  h_cross_section.png
  w_cross_section.png
  choice.png
  management.png
  add.png
  reading.png
  setup.png
  progress.png
  logo.png
)