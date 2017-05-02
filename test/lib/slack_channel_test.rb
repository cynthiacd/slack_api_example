require 'test_helper'

describe SlackChannel do

  describe 'initialize' do
    it 'takes a name' do
      name = "test channel"
      sc = SlackChannel.new(name)
      sc.must_be_instance_of SlackChannel
      sc.name.must_equal name
    end

    it 'requies a name' do
      proc {
        SlackChannel.new
      }.must_raise ArgumentError
    end
  end

  # this require API calls so we need to learn how to mock first
  describe 'send' do

  end

  describe 'self.all' do

  end

end
