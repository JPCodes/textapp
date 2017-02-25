require 'rails_helper'

describe Message, vcr: true do
  it 'does not save the message if twilio gives an error' do
    message = Message.new(body: 'hi', to: '1234567898', from: '9494080528')
    expect(message.save).to(eq(false))
  end

  it 'adds an error if the number is invalid' do
    message = Message.new(body: 'hi', to: '1234567898', from: '9494080528')
    message.save
    expect(message.errors[:base]).to(eq(["The 'To' number 1234567898 is not a valid phone number."]))
  end
end
