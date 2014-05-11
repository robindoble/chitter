Feature: Peeps allow users to post snippets of commentary
So that friends can read their posts


Scenario: Seeing a peep on the homepage
Given I am on the homepage and there exists one peep "This is a peep test"
Then I should see the peep "This is a peep test"

Scenario: Peeps have a user handle
Given I am on the homepage and there is a user "robin@test.com" and they have created a peep
Then I should see the user name "robin_user"
