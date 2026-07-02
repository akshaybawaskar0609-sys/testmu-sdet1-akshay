Feature: REST API functionality

  Scenario: Access API with a valid authentication token
    Given a valid authentication token is available
    When the client sends a request to the API
    Then the request should be authenticated successfully
    And the API should return a 200 OK response

  Scenario: Access API with an invalid authentication token
    Given an invalid authentication token is available
    When the client sends a request to the API
    Then the API should return a 401 Unauthorized response

  Scenario: Create a new resource
    Given the API endpoint is available
    When the client sends a valid POST request
    Then the resource should be created successfully
    And the API should return a 201 Created response

  Scenario: Retrieve an existing resource
    Given a resource already exists
    When the client sends a GET request
    Then the resource details should be returned
    And the API should return a 200 OK response

  Scenario: Update an existing resource
    Given a resource already exists
    When the client sends a valid PUT request
    Then the resource should be updated successfully
    And the API should return a 200 OK response

  Scenario: Delete an existing resource
    Given a resource already exists
    When the client sends a DELETE request
    Then the resource should be deleted successfully
    And the API should return a 204 No Content response

  Scenario: Invalid request returns client error
    Given an invalid request is sent
    When the API processes the request
    Then the API should return an appropriate 4xx status code

  Scenario: Server error handling
    Given the server encounters an internal error
    When the client sends a request
    Then the API should return a 500 Internal Server Error response

  Scenario: API rate limiting
    Given the client exceeds the allowed request limit
    When another request is sent
    Then the API should return a 429 Too Many Requests response

  Scenario: Validate response schema
    Given the client sends a valid GET request
    When the API returns a response
    Then the response body should conform to the defined JSON schema