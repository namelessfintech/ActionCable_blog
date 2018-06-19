require 'rails_helper'

RSpec.feature "Deleting an Article" do

  before do
    pablo = User.create(email:"pablo@example.com", password: "password")
    login_as(pablo)
    @article = Article.create(title: "Title One", body: "Body of article one", user: pablo)
  end

  scenario "A user deletes an article" do

    visit "/"
    click_link @article.title
    click_link "Delete Article"

    expect(page).to have_content("Article has been deleted")
    expect(current_path).to eq(articles_path)
  end


end
