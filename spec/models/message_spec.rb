require 'rails_helper'

describe Message do
  describe '#create' do
    it "is valid with a body, image, user_id, group_id" do
      message = build(:message)
      expect(message).to be_valid
    end

    it "is invalid without a body" do
      message = build(:message, body: nil)
      message.valid?
      expect(message.errors[:body]).to include("が入力されていません")
    end
  end
end
