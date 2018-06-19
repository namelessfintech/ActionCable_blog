require 'rails_helper'

RSpec.describe "Comments", type: :request do

  before do
    @pablo = User.create(email: "pablo@example.com", password: "password")
    @michael = User.create(email: "michael@example.com", password: "password")
    @article = Article.create!(title:"Title one", body:"Body of article one", user:@pablo)
  end

  describe 'POST /articles/:id/comments' do
    context 'with a non signed-in user' do
      before do
        post "/articles/#{@article.id}/comments",params: {comment:{body: "Awesome blog"}}
      end

      it "redirects user to the sign in page" do
        flash_message = "Please sign in or sign up first"
        expect(response).to redirect_to(new_user_session_path)
        expect(response.status).to eq 302
        expect(flash[:alert]).to eq flash_message
      end
    end

    context 'with a logged in user' do
      before do
        login_as(@michael)
        post "/articles/#{@article.id}/comments",params: {comment:{body: "Awesome blog"}}
      end

      it "create the comment successfully" do
        flash_message = "Comment has been created"
        expect(response).to redirect_to article_path(@article.id)
        expect(response.status).to eq 302
        expect(flash[:notice]).to eq flash_message
      end
    end
  end
end
