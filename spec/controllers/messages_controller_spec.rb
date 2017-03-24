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
    context "successful save" do
      before do
        @message = attributes_for(:message)
      end

      it "a new record is saved in the database" do
        expect{
          post :create, params: { message: @message, group_id: group.id }
        }.to change(Message, :count).by(1)
      end

      it "redirect to messages#index" do
        post :create, params: { message: @message, group_id: group.id }
        expect(response).to redirect_to group_messages_path(group)
      end
    end

    context "failed to save" do
      before do
        @invalid_message = attributes_for(:invalid_message)
      end

      it "is not saved in the database" do
        expect{
          post :create, params: { message: @invalid_message, group_id: group.id }
        }.to change(Message, :count).by(0)
      end

      it "redirect to messages#index" do
        post :create, params: { message: @invalid_message, group_id: group.id }
        expect(response).to render_template :index
      end

      it "sets a flsh[:alert]" do
        post :create, params: { message: @invalid_message, group_id: group.id }
        expect(flash[:alert]).to include("メッセージを入力してください。")
      end
    end
  end
end
