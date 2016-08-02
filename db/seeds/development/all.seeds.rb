user = FactoryGirl.create(:user, email: "user@example.com")
FactoryGirl.create_list(:article, 10, user: user)
