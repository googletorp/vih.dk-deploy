Feature: Anonymous user should be able to decide interest area
In order to make a better course
As an course administrator
I want to be able create a checklist with different options

  Scenario: When viewing a course a checkbox with interests is shown
    Given I am on "/kortekurser"
    When I follow "Kajakkursus"
    Then I should see radio buttons with "Interested in EPP2 course"
      And radiobuttons with "Interested in kayak trip"

  Scenario: Buy a kayak course without renting a kayak and pay online
    Given I am on "/kortekurser"
    When I follow "Kajakkursus"
      Then I should see "Vil du leje en kajak?"
    When I fill in the following:
        | Navn       | Svend Aage Thomsen |
        | CPR-nummer | 101010-1942        |
        | Sambo      | Knud Lundberg      |
      And I press "Tilmeld"
    Then I should see "Du har allerede tilføjet nogen til tilmeldingen."
    When I follow "gå til betaling"
      And I fill in the following:
        | Fulde navn     | Svend Aage Thomsen |
        | Land           | DK                 |
        | Adresselinje 1 | Ørnebjergvej 28    |
        | Postnummer     | 7100               |
        | By             | Vejle              |
        | Telefon        | 75820811           |
      And I press "Fortsæt til næste trin"
    Then I should see "Gennemgå ordre"
    When I press "Fortsæt til næste trin"
    Then I should see "Betaling"

  
  @api
  Scenario: Be able to add different options for each course
    Given I am logged in as a user with the "administrator" role
    When I edit "Kajakkursus"
    Then I should see "Interesser"
      And be able to add different options for the interest field as the anonymous user should be able to choose between when going to the add to cart form
    When I edit "Kajakkursus"
    Then I should see "Interesser"
      And be able to add different options for the interest field as the anonymous user should be able to choose between when going to the add to cart form
