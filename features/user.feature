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

Scenario: Users cant have same email or inconsistent passwords
Given I already have a user with email "robin@test.com"
And I am on the homepage
When I click "register" 
And I enter "robin_name" in "name" 
And I enter "robin_user" in "user_name"
And I enter "robin@test.com" in "email"
And I enter "password123" in "password"
And I enter "password456" in "password_confirmation"
And I click "register"
Then I should see "This email is already taken"
And I should see "Password does not match the confirmation"
