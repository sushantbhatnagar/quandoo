@hover
Feature: I should be able to hover over the avatars

  As a user
  I want to be able to hover over the Avatars displayed on Hover page
  So that I will be able to see the users name successfully

  @hover_users @regression
  Scenario: Verify I should be able to hover over different avatars successfully
    Given I am on the Secure Area Hover page
    When I hover over all avatars displayed on the page
    Then below users text should be displayed on hovering over its respective avatars
      | user1 |
      | user2 |
      | user3 |
