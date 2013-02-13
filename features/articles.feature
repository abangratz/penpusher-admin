Feature: Administrating the blog
	As an administrator
	I want to be able to administrate articles
	In order to display them on the blog later


	Scenario: Adding an Article
		When I visit the "/articles/new" page
		And I fill in "Title" with "The Title"
		And I fill in "Body" with "Body Blah"
		And I click "Create article"
		Then I should be on the "/articles" page
		And I should see "The Title"
		And I should see "Body Blah"
		And I should see "The article has been successfully saved."

	Scenario: Listing Articles
		Given I have a list of articles with the following content:
			|title		| body					|
			|Test		| First!!11!!!eleventy	|
			|Not a Test	| Second. You lose.		|
		When I visit the "/articles" page
		Then I should see "Test"
		And I should see "First!!11!!!eleventy"
		And I should see "Not a Test"
		And I should see "Second. You lose."

