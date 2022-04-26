require "test_helper"

class MessageTest < ActiveSupport::TestCase
  test "should create versions" do
    message = Message.create!(content: "Version 1")
    
    assert_difference("message.versions.count", 1) do
      message.update!(content: "Version 2")
    end

    assert_equal "Version 1", message.content.versions.last.reify.body.to_plain_text
  end
end
