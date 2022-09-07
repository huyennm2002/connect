require "active_support/core_ext/integer/time"
require 'carrierwave/orm/activerecord'

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded any time
  # it changes. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable server timing
  config.server_timing = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join("tmp/caching-dev.txt").exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      "Cache-Control" => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Store uploaded files on the local file system (see config/storage.yml for options).
  config.active_storage.service = :local

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise exceptions for disallowed deprecations.
  config.active_support.disallowed_deprecation = :raise

  # Tell Active Support which deprecation messages to disallow.
  config.active_support.disallowed_deprecation_warnings = []

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations.
  # config.i18n.raise_on_missing_translations = true

  # Annotate rendered view with file names.
  # config.action_view.annotate_rendered_view_with_filenames = true

  # Uncomment if you wish to allow Action Cable access from any origin.
  # config.action_cable.disable_request_forgery_protection = true
  config.action_mailer.default_url_options = { :host => 'localhost:3001', protocol: 'https' }
  config.action_mailer.delivery_method = :smtp


  # SMTP settings for gmail
  config.action_mailer.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :user_name            => 'huyennm1104@gmail.com',
    :password             => 'trjjmfacqnfdgnoc',
    :authentication       => "plain",
    :enable_starttls_auto => true
  }
  # config.action_mailer.smtp_settings = {
  #     :address              => "smtp.mailgun.org",
  #     :port                 => 587,
  #     :user_name            => 'postmaster@sandbox0a19474f12b34a158085bf4e8a014ad7.mailgun.org',
  #     :password             => '52006f29798e354fbf2a3bb100380b3f-77985560-1a88228a',
  #     :authentication       => "plain",
  #     :enable_starttls_auto => true
  # }

  config.sass.inline_source_maps = true
  config.sass.line_comments = false
  # config.hosts << "337d-123-16-89-232.ap.ngrok.io"
  config.hosts << "my-connect.link"
  config.hosts << "www.my-connect.link"
end
