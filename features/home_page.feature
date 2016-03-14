Feature: Home page

  Scenario: Viewing application's home page
    Given there's a product named "My first" with "Hello, BDD world!" description
    When I am on the homepage
    Then I should see the "My first" product