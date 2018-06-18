@sort_data_table
Feature: Sorting Data table

  As a user
  I want to be able to sort the data columns in the user tables
  So that I will be able to traverse through and find data with ease

  @sort_ascending
  Scenario: Verify I should be able to sort the Last Name column in Example 2 table in ascending order
    Given I am on the Data Tables page
    When I sort the Last Name column in Example_II table in ascending order
    Then I should see the names sorted in ascending order successfully

  @sort_descending @regression
  Scenario: Verify I should be able to sort the Last Name column in Example 2 table in descending order
    Given I am on the Data Tables page
    When I sort the Last Name column in Example_II table in descending order
    Then I should see the names sorted in descending order successfully
