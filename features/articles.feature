Feature: Administrating the blog
	As an administrator
	I want to be able to administrate articles
	In order to display them on the blog later

	Scenario: Listing Articles
		Given I have a list of articles with the following content:
			|title		| body					|
			|Test		| First!!11!!!eleventy	|
		When I visit the "/articles" page
		Then I want to see "Test"
		And I want to see "First!!11!!!eleventy"
