Feature: Allows users to signup and login and logout

Scenario: Users can register on the home page
Given I am on the homepage
When I click "register" 
And I enter "robin_name" in "name" 
And I enter "robin_user" in "user_name"
And I enter "robin@test.com" in "email"
And I enter "password" in "password"
And I enter "password" in "password_confirmation"
And I click "register"
Then I should see on homepage "robin_user"
