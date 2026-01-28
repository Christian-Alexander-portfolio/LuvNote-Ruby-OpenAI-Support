source "https://rubygems.org"

ruby "3.4.8"

# Rails
gem "rails", "~> 8.1.2"

# The modern asset pipeline for Rails
gem "propshaft"

# DB
gem "pg", "~> 1.1"

# Web server
gem "puma", ">= 5.0"

# Hotwire / importmaps
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"

# JSON builder (handy for admin/API responses)
gem "jbuilder"

# Windows does not include zoneinfo files
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Rails 8 default DB-backed adapters for cache/job/cable
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

# Boot performance
gem "bootsnap", require: false

# Deployment helpers (optional but fine to keep)
gem "kamal", require: false
gem "thruster", require: false

# Active Storage variants (brings libvips warnings on Windows; safe)
gem "image_processing", "~> 1.2"

# ================================
# AI Integration
# ================================
gem "ruby-openai"

# ================================
# Support Site Features
# ================================

# Render Markdown support pages safely/fast
gem "commonmarker"

# Pagination for admin dashboard
gem "kaminari"

# Rate limiting / abuse protection
gem "rack-attack"

# If you add API endpoints later (optional, safe)
gem "rack-cors"

# Cleaner structured logs (optional but useful for observability)
gem "lograge"

group :development, :test do
  # Debugging
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  # Local env vars from .env (DO NOT use in production)
  gem "dotenv-rails"

  # Security tools
  gem "bundler-audit", require: false
  gem "brakeman", require: false

  # Style / lint (optional)
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
