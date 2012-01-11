@order_items
Feature: Order Items
  In order to have order_items on my website
  As an administrator
  I want to manage order_items

  Background:
    Given I am a logged in refinery user
    And I have no order_items

  @order_items-list @list
  Scenario: Order Items List
   Given I have order_items titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of order_items
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @order_items-valid @valid
  Scenario: Create Valid Order Item
    When I go to the list of order_items
    And I follow "Add New Order Item"
    And I fill in "Product Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 order_item

  @order_items-invalid @invalid
  Scenario: Create Invalid Order Item (without product_name)
    When I go to the list of order_items
    And I follow "Add New Order Item"
    And I press "Save"
    Then I should see "Product Name can't be blank"
    And I should have 0 order_items

  @order_items-edit @edit
  Scenario: Edit Existing Order Item
    Given I have order_items titled "A product_name"
    When I go to the list of order_items
    And I follow "Edit this order_item" within ".actions"
    Then I fill in "Product Name" with "A different product_name"
    And I press "Save"
    Then I should see "'A different product_name' was successfully updated."
    And I should be on the list of order_items
    And I should not see "A product_name"

  @order_items-duplicate @duplicate
  Scenario: Create Duplicate Order Item
    Given I only have order_items titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of order_items
    And I follow "Add New Order Item"
    And I fill in "Product Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 order_items

  @order_items-delete @delete
  Scenario: Delete Order Item
    Given I only have order_items titled UniqueTitleOne
    When I go to the list of order_items
    And I follow "Remove this order item forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 order_items
 