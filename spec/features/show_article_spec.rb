require 'rails_helper'

RSpec.feature "Show Articles" do

  before do
    pablo = User.create(email:"pablo@example.com", password: "password")
    login_as(pablo)
    @article = Article.create(title: "The first article", body: "Lorem ipsum 1", user:pablo)
  end

  scenario "A user shows an article" do
      visit '/'

      click_link @article.title

      expect(page).to have_content(@article.title)
      expect(page).to have_content(@article.body)
      expect(current_path).to eq(article_path(@article))

  end


end
