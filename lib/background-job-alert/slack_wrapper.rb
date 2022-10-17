# frozen_string_literal: true
require "slack"

class SlackWrapper
  CHANNEL_NAME = "background-job-alert"

  def self.post_message(text: nil, channel: CHANNEL_NAME)
    client = Slack::Web::Client.new
    client.chat_postMessage(channel: channel, text: text)
  rescue Slack::Web::Api::Error => ex
    raise "Slackwrapper#post_message Slack::Web::Api::Error channel: #{channel}, text: #{text}, error: #{ex.message}"
  end
end