require 'rails_helper'

describe MessagesController do
  login_user
  let(:group) { create(:group) }
  let(:group_id) {{group_id: group.id}}


  describe 'GET #index' do
    it "assigns the requested contact @message" do
      get :index, group_id
      expect(assigns(:message)).to be_a_new(Message)
    end

    it "assigns the requested contact @group" do
      get :index, group_id
      expect(assigns(:group)).to eq group
    end

    it "assigns the requested contact @groups" do
      get :index, group_id
      expect(assigns(:groups)).to eq subject.current_user.groups
    end

    it "assigns the reqested contact @messages" do
      get :index, group_id
      expect(assigns(:messages)).to eq group.messages
    end

    it "renders the :index template" do
      get :index, group_id
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do
    it "saves the new contact in the database" do
      group_id
      expect{
        post :create, params: { message: attributes_for(:message), group_id: group.id }}.to change(Message, :count).by(1)
    end

    context "successful save" do
      before do
        @message = attributes_for(:message)
      end

      it "redirect to messages#index" do
        group_id
        post :create, params: { message:@message, group_id: group.id }
        expect(response).to redirect_to group_messages_path(group)
      end
    end

      before do
        @invalid_message = attributes_for(:invalid_message)
      end

      it "redirect to messages#index" do
        group_id
        post :create, params: { message: @invalid_message, group_id: group.id }
        expect(response).to render_template :index
      end
    end
  end
end
