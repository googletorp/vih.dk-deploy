Feature: An administrator should be able to login
In order change content on the site
As an administrator user
I want to be able to access the backend

  @api
  Scenario: An adminitrator can create a course
    Given I am logged in as a user with the "administrator" role
    Then I should see "Log out"
