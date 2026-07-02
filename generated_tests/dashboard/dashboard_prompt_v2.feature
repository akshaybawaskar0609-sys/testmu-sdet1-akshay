Feature: Dashboard functionality

  As a logged-in user
  I want to view and interact with the Dashboard
  So that I can monitor testing activities and project status.

  Background:
    Given the user is logged into the application
    And the Dashboard page is accessible

  # Widget Loading

  Scenario: All dashboard widgets load successfully
    When the user opens the Dashboard
    Then all configured widgets should be displayed
    And each widget should load without errors
    And loading indicators should disappear after data is loaded

  Scenario: Widget displays empty state when no data exists
    Given there is no available data for a widget
    When the Dashboard is opened
    Then the widget should display an appropriate "No Data Available" message
    And the application should remain responsive

  Scenario: Widget loading failure
    Given a widget service is unavailable
    When the Dashboard is opened
    Then an appropriate error message should be displayed
    And other widgets should continue loading normally

  # Data Accuracy

  Scenario: Dashboard displays accurate widget data
    When the Dashboard is loaded
    Then each widget should display accurate information
    And the values should match the backend data

  Scenario: Dashboard reflects latest data after refresh
    Given the dashboard data has changed
    When the user refreshes the Dashboard
    Then the latest information should be displayed

  # Filter Functionality

  Scenario: Filter dashboard using valid values
    When the user applies a valid filter
    Then only matching records should be displayed
    And all widgets should update accordingly

  Scenario: Apply multiple filters
    When the user applies multiple valid filters
    Then the Dashboard should display data satisfying all selected filters

  Scenario: Remove applied filters
    Given filters are already applied
    When the user clears all filters
    Then the Dashboard should display all available data

  Scenario: Apply invalid filter value
    When the user enters an invalid filter value
    Then no matching records should be displayed
    And an appropriate message should be shown

  Scenario: Apply empty filter
    When the user submits an empty filter
    Then the Dashboard should remain unchanged

  # Sorting

  Scenario: Sort data in ascending order
    Given sortable data is available
    When the user sorts by a column in ascending order
    Then the records should appear in ascending order

  Scenario: Sort data in descending order
    Given sortable data is available
    When the user sorts by a column in descending order
    Then the records should appear in descending order

  Scenario: Sort different dashboard columns
    Given multiple sortable columns exist
    When the user sorts each column
    Then each column should be sorted correctly

  # Responsive Layout

  Scenario: Dashboard layout on desktop
    When the Dashboard is viewed on a desktop
    Then all widgets should be properly aligned
    And no content should overlap

  Scenario: Dashboard layout on tablet
    When the Dashboard is viewed on a tablet
    Then the layout should adjust appropriately
    And all widgets should remain accessible

  Scenario: Dashboard layout on mobile device
    When the Dashboard is viewed on a mobile device
    Then widgets should stack correctly
    And horizontal scrolling should not occur unnecessarily

  Scenario: Responsive behavior after screen resize
    When the browser window is resized
    Then the Dashboard layout should automatically adjust

  # Permission Validation

  Scenario: Administrator can view all widgets
    Given the user has Administrator privileges
    When the Dashboard is opened
    Then all widgets should be visible

  Scenario: Manager can view permitted widgets
    Given the user has Manager privileges
    When the Dashboard is opened
    Then only authorized widgets should be displayed

  Scenario: Standard user has restricted access
    Given the user has Standard User privileges
    When the Dashboard is opened
    Then restricted widgets should not be visible

  Scenario: Unauthorized user attempts to access restricted widget
    Given the user lacks permission
    When the user attempts to access a restricted widget directly
    Then access should be denied
    And an appropriate authorization message should be displayed

  # Boundary and Edge Cases

  Scenario: Dashboard with a large volume of data
    Given the Dashboard contains a large number of records
    When the Dashboard loads
    Then all widgets should load successfully
    And performance should remain acceptable

  Scenario: Dashboard with no widgets configured
    Given no widgets are configured
    When the Dashboard is opened
    Then an appropriate empty Dashboard message should be displayed

  Scenario: Dashboard with slow network connection
    Given the network connection is slow
    When the Dashboard is opened
    Then loading indicators should be displayed
    And the Dashboard should load without crashing

  Scenario: Session expires while viewing Dashboard
    Given the user is viewing the Dashboard
    When the session expires
    Then the user should be redirected to the Login page
    And a session expiration message should be displayed

  Scenario: Refresh Dashboard after session expiration
    Given the session has expired
    When the user refreshes the Dashboard
    Then the Login page should be displayed