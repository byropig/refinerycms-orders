@orders
Feature: Orders
  In order to have orders on my website
  As an administrator
  I want to manage orders

  Background:
    Given I am a logged in refinery user
    And I have no orders

  @orders-list @list
  Scenario: Orders List
   Given I have orders titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of orders
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @orders-valid @valid
  Scenario: Create Valid Order
    When I go to the list of orders
    And I follow "Add New Order"
    And I fill in "Order Number" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 order

  @orders-invalid @invalid
  Scenario: Create Invalid Order (without order_number)
    When I go to the list of orders
    And I follow "Add New Order"
    And I press "Save"
    Then I should see "Order Number can't be blank"
    And I should have 0 orders

  @orders-edit @edit
  Scenario: Edit Existing Order
    Given I have orders titled "A order_number"
    When I go to the list of orders
    And I follow "Edit this order" within ".actions"
    Then I fill in "Order Number" with "A different order_number"
    And I press "Save"
    Then I should see "'A different order_number' was successfully updated."
    And I should be on the list of orders
    And I should not see "A order_number"

  @orders-duplicate @duplicate
  Scenario: Create Duplicate Order
    Given I only have orders titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of orders
    And I follow "Add New Order"
    And I fill in "Order Number" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 orders

  @orders-delete @delete
  Scenario: Delete Order
    Given I only have orders titled UniqueTitleOne
    When I go to the list of orders
    And I follow "Remove this order forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 orders
 