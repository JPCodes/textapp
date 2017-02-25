require 'rails_helper'

describe Message do
  it 'does not save the message if twilio gives an error' do
    message = Message.new(body: 'hi', to: '1234567898', from: '9494080528')
    expect(message.save).to(eq(false))
  end
end
