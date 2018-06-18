@login
Feature: Login to Secure Area

  As a user
  I want to be able to login to the Secure Area Website successfully
  So that I will be able to feel secure

  @login_success @regression
  Scenario: Verify I should be able to login to Secure Area website with valid credentials
    Given I am on the Secure Area Login page
    When I input valid_user_credentials
    And I login
    Then I should see below success message
    """
    You logged into a secure area
    """

  @login_failure
  Scenario Outline: Verify I should not be able to login to Secure Area website with invalid credentials
    Given I am on the Secure Area Login page
    When I input below "<username>" and "<password>"
    And I login
    Then I should see "<message>" preventing me to login
  @invalid_username
    Examples:
      | username  | password             | message                  |
      | WrongUser | SuperSecretPassword! | Your username is invalid |
  @invalid_password
    Examples:
      | username | password  | message                  |
      | tomsmith | WrongPass | Your password is invalid |
