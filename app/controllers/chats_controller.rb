require 'slack_channel'
class ChatsController < ApplicationController

  def index
    @channels = SlackChannel.all
  end

  def new_message
    @channel = SlackChannel.new(params[:channel])
  end

  def send_message
  end

end
