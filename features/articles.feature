Feature: Administrating the blog
	As an administrator
	I want to be able to administrate articles
	In order to display them on the blog later

	Scenario: Listing Articles
		Given I have a list of articles with the following content:
			|title		| body									|
			|Test		| First!!11!!!eleventy					|
			|Second		| And another really important post.	|
		When I visit the "/articles" page
		Then I should see "Test"
		And I should see "First!!11!!!eleventy"
		And I should see "Second"
		And I should see "And another really important post."
