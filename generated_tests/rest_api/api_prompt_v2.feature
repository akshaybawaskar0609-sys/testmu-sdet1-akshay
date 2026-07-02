Feature: REST API Testing

  As an API consumer
  I want the REST API to behave reliably and securely
  So that client applications can perform operations correctly.

  Background:
    Given the REST API is available
    And the API base URL is configured

  # Authentication

  Scenario: Access API with a valid authentication token
    Given a valid authentication token is available
    When the client sends an authenticated GET request
    Then the API should return a 200 OK response
    And the requested resource should be returned

  Scenario: Access API without an authentication token
    Given no authentication token is provided
    When the client sends a GET request
    Then the API should return a 401 Unauthorized response

  Scenario: Access API with an invalid authentication token
    Given an invalid authentication token is provided
    When the client sends a GET request
    Then the API should return a 401 Unauthorized response

  Scenario: Access API with an expired authentication token
    Given an expired authentication token is provided
    When the client sends a GET request
    Then the API should return a 401 Unauthorized response
    And an appropriate authentication error message should be returned

  Scenario: Access restricted resource without sufficient permissions
    Given a valid authentication token with insufficient privileges
    When the client requests an administrator-only resource
    Then the API should return a 403 Forbidden response

  # Create Operations

  Scenario: Create a resource with valid data
    Given a valid request payload
    When the client sends a POST request
    Then the API should return a 201 Created response
    And the resource should be created successfully

  Scenario: Create a resource with missing required fields
    Given a request payload missing mandatory fields
    When the client sends a POST request
    Then the API should return a 400 Bad Request response
    And validation errors should be returned

  Scenario: Create a resource with invalid payload
    Given an invalid request payload
    When the client sends a POST request
    Then the API should return a 400 Bad Request response

  # Read Operations

  Scenario: Retrieve an existing resource
    Given the requested resource exists
    When the client sends a GET request
    Then the API should return a 200 OK response
    And the correct resource should be returned

  Scenario: Retrieve a non-existing resource
    Given the requested resource does not exist
    When the client sends a GET request
    Then the API should return a 404 Not Found response

  # Update Operations

  Scenario: Update an existing resource
    Given the resource exists
    And a valid update payload is available
    When the client sends a PUT request
    Then the API should return a 200 OK response
    And the resource should be updated successfully

  Scenario: Update a non-existing resource
    Given the resource does not exist
    When the client sends a PUT request
    Then the API should return a 404 Not Found response

  Scenario: Update with invalid payload
    Given an invalid update payload
    When the client sends a PUT request
    Then the API should return a 400 Bad Request response

  # Delete Operations

  Scenario: Delete an existing resource
    Given the resource exists
    When the client sends a DELETE request
    Then the API should return a 204 No Content response

  Scenario: Delete a non-existing resource
    Given the resource does not exist
    When the client sends a DELETE request
    Then the API should return a 404 Not Found response

  # Error Handling

  Scenario: Unsupported HTTP method
    Given the endpoint supports only GET requests
    When the client sends a PATCH request
    Then the API should return a 405 Method Not Allowed response

  Scenario: Unsupported media type
    Given the client sends an unsupported Content-Type header
    When the API receives the request
    Then the API should return a 415 Unsupported Media Type response

  Scenario: Internal server error
    Given an unexpected server exception occurs
    When the client sends a request
    Then the API should return a 500 Internal Server Error response

  Scenario: Service temporarily unavailable
    Given the service is under maintenance
    When the client sends a request
    Then the API should return a 503 Service Unavailable response

  # Rate Limiting

  Scenario: Requests within the allowed limit
    Given the client has not exceeded the request limit
    When multiple requests are sent
    Then all requests should succeed

  Scenario: Exceed the rate limit
    Given the client has reached the maximum request limit
    When another request is sent
    Then the API should return a 429 Too Many Requests response

  # JSON Schema Validation

  Scenario: Validate response schema for GET request
    Given the client sends a valid GET request
    When the response is received
    Then the response should match the expected JSON schema

  Scenario: Validate response schema after resource creation
    Given a resource is successfully created
    When the POST response is received
    Then the response body should conform to the expected JSON schema

  # Boundary and Edge Cases

  Scenario: Create resource using maximum allowed field length
    Given all fields contain the maximum allowed values
    When the client sends a POST request
    Then the resource should be created successfully

  Scenario: Create resource using minimum allowed field length
    Given all required fields contain the minimum valid values
    When the client sends a POST request
    Then the resource should be created successfully

  Scenario: Create resource with empty required fields
    Given required fields are empty
    When the client sends a POST request
    Then the API should return a 400 Bad Request response

  Scenario: Send malformed JSON payload
    Given the request body contains malformed JSON
    When the client sends a POST request
    Then the API should return a 400 Bad Request response

  Scenario: Verify response time under normal load
    Given the API is operational
    When the client sends a valid request
    Then the response should be returned within the acceptable response time

  Scenario: Concurrent requests from multiple clients
    Given multiple clients send requests simultaneously
    When the API processes the requests
    Then all valid requests should be processed correctly
    And no data corruption should occur