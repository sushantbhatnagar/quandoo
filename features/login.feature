Feature: Login to Secure Area

  As a user
  I want to be able to login to the Secure Area Website successfully
  So that I will be able to successfully use the website

  @login_success
  Scenario: Verify I should be able to login to Secure Area Website
    Given I am on the Secure Area Login page
    When I login with a valid credentials
    Then I should be able to login successfully with below success message
    """
    You logged into a secure area
    """

  @login_failure @invalid_username
  Scenario: Verify I should not be able to login to Secure Area Website with invalid UserName
    Given I am on the Secure Area Login page
    When I login with a invalid_username but valid password
    Then I should get below message preventing me to login
    """
    Your username is invalid
    """

  @login_failure @invalid_password
  Scenario: Verify I should not be able to login to Secure Area Website with invalid UserName
    Given I am on the Secure Area Login page
    When I login with a invalid password and valid username
    Then I should get below message preventing me to login
    """
    Your password is invalid
    """