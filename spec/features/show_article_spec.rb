require 'rails_helper'

RSpec.feature "Show Articles" do

  before do
    @pablo = User.create(email:"pablo@example.com", password: "password")
    @michael = User.create(email: "michael@example.com", password: "password")


    @article = Article.create(title: "The first article", body: "Lorem ipsum 1", user: @pablo)
  end

  scenario "to non-signed in user hide the edit and delete buttons" do
      visit '/'
      click_link @article.title

      expect(page).to have_content(@article.title)
      expect(page).to have_content(@article.body)
      expect(current_path).to eq(article_path(@article))

      expect(page).not_to have_link("Edit Article")
      expect(page).not_to have_link("Delete Article")

  end

  scenario "to non-owner hide the edit and delete buttons" do
      login_as(@michael)
      visit '/'
      click_link @article.title

      expect(page).to have_content(@article.title)
      expect(page).to have_content(@article.body)
      expect(current_path).to eq(article_path(@article))

      expect(page).not_to have_link("Edit Article")
      expect(page).not_to have_link("Delete Article")

  end


end
