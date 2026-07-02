Feature: Login functionality

  As a registered user
  I want to securely log in to the application
  So that I can access my test management dashboard.

  Background:
    Given the user is on the Login page

  # Positive Scenarios

  Scenario: Successful login with valid credentials
    When the user enters a valid username
    And enters a valid password
    And clicks the Login button
    Then the user should be successfully logged in
    And the Dashboard page should be displayed

  Scenario: Login with Remember Me enabled
    When the user enters valid credentials
    And selects the "Remember Me" checkbox
    And clicks the Login button
    Then the user should be logged in
    And the login session should persist after reopening the browser

  Scenario: Successful logout
    Given the user is logged into the application
    When the user clicks the Logout button
    Then the user should be redirected to the Login page
    And the session should be terminated

  # Invalid Credential Scenarios

  Scenario: Login with invalid username
    When the user enters an invalid username
    And enters a valid password
    And clicks the Login button
    Then login should fail
    And an "Invalid username or password" message should be displayed

  Scenario: Login with invalid password
    When the user enters a valid username
    And enters an invalid password
    And clicks the Login button
    Then login should fail
    And an "Invalid username or password" message should be displayed

  Scenario: Login with both invalid username and password
    When the user enters an invalid username
    And enters an invalid password
    And clicks the Login button
    Then login should fail
    And an "Invalid username or password" message should be displayed

  # Required Field Validation

  Scenario: Login with empty username
    When the username field is left blank
    And the user enters a valid password
    And clicks the Login button
    Then a validation message should indicate that username is required

  Scenario: Login with empty password
    When the user enters a valid username
    And leaves the password field blank
    And clicks the Login button
    Then a validation message should indicate that password is required

  Scenario: Login with both fields empty
    When the username field is empty
    And the password field is empty
    And clicks the Login button
    Then validation messages should be displayed for both fields

  # Forgot Password

  Scenario: Reset password using registered email
    When the user clicks the Forgot Password link
    And enters a registered email address
    And submits the request
    Then a password reset email should be sent
    And a confirmation message should be displayed

  Scenario: Reset password using unregistered email
    When the user clicks the Forgot Password link
    And enters an unregistered email address
    And submits the request
    Then an appropriate error message should be displayed

  # Session Management

  Scenario: Session expires after inactivity
    Given the user is logged in
    When the user remains inactive until the configured timeout
    Then the session should expire
    And the user should be redirected to the Login page
    And a "Session Expired" message should be displayed

  Scenario: Access protected page after session expiration
    Given the session has expired
    When the user attempts to access a protected page
    Then the user should be redirected to the Login page

  # Security

  Scenario: Account lockout after multiple failed login attempts
    When the user enters an incorrect password five consecutive times
    Then the account should be temporarily locked
    And an account lockout message should be displayed

  Scenario: Login attempt while account is locked
    Given the account is locked
    When the user enters valid credentials
    Then login should be denied
    And a lockout message should be displayed

  Scenario: SQL Injection attempt in username field
    When the user enters "' OR '1'='1" as the username
    And enters any password
    And clicks the Login button
    Then login should fail
    And no database error should be exposed
    And the application should remain secure

  Scenario: SQL Injection attempt in password field
    When the user enters a valid username
    And enters "' OR '1'='1" as the password
    And clicks the Login button
    Then login should fail
    And no sensitive information should be exposed

  Scenario: XSS attempt in username field
    When the user enters "<script>alert('XSS')</script>" in the username field
    And enters any password
    And clicks the Login button
    Then the script should not execute
    And the input should be sanitized
    And login should fail

  Scenario: XSS attempt in password field
    When the user enters a valid username
    And enters "<script>alert('XSS')</script>" as the password
    And clicks the Login button
    Then the script should not execute
    And login should fail

  # UI Validation

  Scenario: Password field should mask entered characters
    When the user enters a password
    Then the password should be displayed as masked characters

  Scenario: Username field maximum length validation
    When the user enters more than the maximum allowed characters in the username field
    Then an appropriate validation message should be displayed

  Scenario: Password field maximum length validation
    When the user enters more than the maximum allowed characters in the password field
    Then an appropriate validation message should be displayed

  Scenario: Username field should not accept only whitespace
    When the user enters only whitespace in the username field
    And enters a valid password
    And clicks the Login button
    Then a validation message should be displayed

  Scenario: Password field should not accept only whitespace
    When the user enters a valid username
    And enters only whitespace in the password field
    And clicks the Login button
    Then a validation message should be displayed

  Scenario: Error message disappears after successful login
    Given an error message is displayed after a failed login
    When the user logs in successfully
    Then the previous error message should no longer be displayed

  Scenario: Error message should be consistent for invalid credentials
    When the user enters invalid credentials
    Then the application should display a generic error message
    And the message should not reveal whether the username or password is incorrect

  # Edge Cases

  Scenario: Login using username with leading and trailing spaces
    When the user enters a valid username with leading and trailing spaces
    And enters a valid password
    And clicks the Login button
    Then the spaces should be trimmed
    And the user should be logged in successfully

  Scenario: Login using maximum allowed username length
    When the user enters a username with the maximum allowed length
    And enters a valid password
    Then login should succeed

  Scenario: Login using maximum allowed password length
    When the user enters a valid username
    And enters a password with the maximum allowed length
    Then login should succeed