Feature: Peeps allow users to post snippets of commentary
So that friends can read their posts


Scenario: Seeing a peep on the homepage
Given I am on the homepage
When there exists one peep "This is a peep test"
Then I should see the peep "This is a peep test"