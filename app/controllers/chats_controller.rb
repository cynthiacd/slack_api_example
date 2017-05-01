class ChatsController < ApplicationController

  def index
    @channels = SlackChannel.all
  end
end
