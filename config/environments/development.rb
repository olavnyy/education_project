Rails.application.configure do
  #Settings for Amazon S3 and paperclip
  config.paperclip_defaults = {
  storage: :s3,
  s3_credentials: {
    bucket: 'lv-197',
    access_key_id: 'AKIAJAOPVG2YVDOB7YNQ',
    secret_access_key: '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',
    s3_region: 'us-west-2',
    s3_host_name:'s3-us-west-2.amazonaws.com'
  }
}
  # Settings specified here will take precedence over those in config/application.rb.
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => 'public, max-age=172800'
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load


  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
end
