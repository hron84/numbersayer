Feature: Convert numbers
    Visitor wants to convert numbers

    Scenario:
        Given I am on the converter form
        When I fill in "calculate_number" with "42"
        And I press "Translate!"
        Then I should see "fourty-two" within "calculate_result"
