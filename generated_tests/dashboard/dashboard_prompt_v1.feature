Feature: Dashboard functionality

  Scenario: Dashboard widgets load successfully
    Given the user is logged into the application
    When the user navigates to the Dashboard
    Then all configured dashboard widgets should be displayed
    And each widget should load without errors

  Scenario: Dashboard displays accurate data
    Given the user is logged into the application
    When the Dashboard is displayed
    Then each widget should show accurate and up-to-date information
    And the displayed data should match the system records

  Scenario: Filter dashboard data
    Given the user is on the Dashboard
    When the user applies a valid filter
    Then the dashboard data should be updated according to the selected filter
    And only matching records should be displayed

  Scenario: Remove applied filter
    Given a filter is applied on the Dashboard
    When the user clears the filter
    Then all dashboard data should be displayed

  Scenario: Sort dashboard data in ascending order
    Given the Dashboard contains sortable data
    When the user sorts the data in ascending order
    Then the records should be displayed in ascending order

  Scenario: Sort dashboard data in descending order
    Given the Dashboard contains sortable data
    When the user sorts the data in descending order
    Then the records should be displayed in descending order

  Scenario: Dashboard adapts to different screen sizes
    Given the user accesses the Dashboard from different devices
    When the Dashboard is displayed
    Then the layout should adjust correctly for desktop, tablet, and mobile devices
    And no UI elements should overlap or be truncated

  Scenario: Admin user can view all dashboard widgets
    Given the user has Administrator privileges
    When the user opens the Dashboard
    Then all authorized widgets should be visible

  Scenario: Standard user sees only permitted widgets
    Given the user has Standard User privileges
    When the user opens the Dashboard
    Then only widgets permitted for that role should be displayed
    And restricted widgets should not be visible