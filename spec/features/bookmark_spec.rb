context "Bookmark" do
  describe "User" do
    let! (:webdev) {Cohort.create(name: "Web Development")}
    let! (:kevin) {User.create(user_name: "kwebster2")}
    let! (:google) { Resource.create(name: "Google", url: "https://www.google.com", user: kevin)}

    it 'can save a resource to their bookmarks' do
      visit '/cohorts/web-development'
      page.find(".bookmark-btn").click
      expect(page).to have_content("Saved")
    end

  end
end
