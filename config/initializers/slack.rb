Slack.configure do |config|
  config.token = Rails.application.credentials.dig(:slack, :api_key)
end