Feature: A nice welcome page

	Scenario: Displaying a welcome message
		When I visit the "/" page
		Then I should see "Hi"
