Feature: Login functionality

  Scenario: Successful login with valid credentials
    Given the user is on the Login page
    When the user enters a valid username and password
    And clicks the Login button
    Then the user should be redirected to the Dashboard

  Scenario: Login with invalid password
    Given the user is on the Login page
    When the user enters a valid username and an invalid password
    And clicks the Login button
    Then an "Invalid username or password" error message should be displayed

  Scenario: Login with invalid username
    Given the user is on the Login page
    When the user enters an invalid username and a valid password
    And clicks the Login button
    Then an "Invalid username or password" error message should be displayed

  Scenario: Login with empty username
    Given the user is on the Login page
    When the user leaves the username field empty
    And enters a valid password
    And clicks the Login button
    Then a validation message should indicate that the username is required

  Scenario: Login with empty password
    Given the user is on the Login page
    When the user enters a valid username
    And leaves the password field empty
    And clicks the Login button
    Then a validation message should indicate that the password is required

  Scenario: Login with empty username and password
    Given the user is on the Login page
    When the user leaves both username and password fields empty
    And clicks the Login button
    Then validation messages should be displayed for both required fields

  Scenario: Forgot password request
    Given the user is on the Login page
    When the user clicks the "Forgot Password" link
    And enters a registered email address
    And submits the request
    Then a password reset email should be sent
    And a confirmation message should be displayed

  Scenario: Forgot password with unregistered email
    Given the user is on the Forgot Password page
    When the user enters an unregistered email address
    And submits the request
    Then an appropriate error message should be displayed

  Scenario: Session expires after inactivity
    Given the user is logged in
    When the user remains inactive until the session timeout period expires
    Then the user should be redirected to the Login page
    And a "Session expired" message should be displayed

  Scenario: User attempts to access a protected page after session expiry
    Given the user's session has expired
    When the user attempts to access a protected page
    Then the user should be redirected to the Login page

  Scenario: Account is locked after multiple failed login attempts
    Given the user is on the Login page
    When the user enters an incorrect password five consecutive times
    Then the account should be temporarily locked
    And an account lockout message should be displayed

  Scenario: Login attempt while account is locked
    Given the user's account is locked
    When the user enters valid credentials
    Then the login should be denied
    And a message indicating the account is locked should be displayed