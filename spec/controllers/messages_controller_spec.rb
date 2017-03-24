require 'rails_helper'

describe MessagesController do
  login_user
  let(:group) { create(:group) }

  describe 'GET #index' do
    before do
      get :index, params: { group_id: group.id }
    end

    it "assigns the requested contact @message" do
      expect(assigns(:message)).to be_a_new(Message)
    end

    it "assigns the requested contact @group" do
      expect(assigns(:group)).to eq group
    end

    it "assigns the requested contact @groups" do
      expect(assigns(:groups)).to eq subject.current_user.groups
    end

    it "assigns the reqested contact @messages" do
      expect(assigns(:messages)).to eq group.messages
    end

    it "renders the :index template" do
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do
    it "saves the new contact in the database" do
      expect{
        post :create, params: { message: attributes_for(:message), group_id: group.id }}.to change(Message, :count).by(1)
    end

    context "successful save" do
      before do
        @message = attributes_for(:message)
      end

      it "redirect to messages#index" do
        post :create, params: { message:@message, group_id: group.id }
        expect(response).to redirect_to group_messages_path(group)
      end
    end

    context "failed to save" do
      before do
        @invalid_message = attributes_for(:invalid_message)
      end

      it "redirect to messages#index" do
        post :create, params: { message: @invalid_message, group_id: group.id }
        expect(response).to render_template :index
      end
    end
  end
end
