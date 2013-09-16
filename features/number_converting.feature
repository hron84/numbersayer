Feature: Convert numbers
    Visitor wants to convert numbers

    Scenario:
        Given I am on the converter form
        When I fill in "calculate_number" with "42"
        And I press "Translate!"
        Then I dump page content as "result.html"
        And the "Result" field should contain "fourty-two"
