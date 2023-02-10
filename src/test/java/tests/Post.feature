Feature: Post API demo

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def expectedOutput = read("response1.json")

  # Simple Post request
  Scenario: Post demo 1
    Given url 'https://reqres.in/api/users'
    And request {"name": "SanthoshaUG","job": "Teacher"}
    When method POST
    Then status 201
    And print response

  # Post with Background
  Scenario: Post demo 2
    Given path '/users'
    And request {"name": "SanthoshaUG","job": "Teacher"}
    When method POST
    Then status 201
    And print response

  # Post with Assertions
  Scenario: Post demo 3
    Given path '/users'
    And request {"name": "SanthoshaUG","job": "Teacher"}
    When method POST
    Then status 201
    And match response == {"name": "SanthoshaUG","job": "Teacher","id": "#string","createdAt": "#ignore"}
    And print response

  # Post with read response from file
  Scenario: Post demo 4
    Given path '/users'
    And request {"name": "SanthoshaUG","job": "Teacher"}
    When method POST
    Then status 201
    And match response == expectedOutput
    And match $ == expectedOutput
    And print response

  # Post with read request body from file
  Scenario: Post demo 5
    Given path '/users'
    And def projectPath = karate.properties['user.dir']
    And print projectPath
    And def filePath = projectPath+'/java/data/request1.json'
    And print filePath
    And def requestBody1 = filePath
    And request requestBody = requestBody1
    When method POST
    Then status 201
    And match response == expectedOutput
    And match $ == expectedOutput
    And print response
    
    
    # Post with read response from file
  Scenario: Post demo 6
    Given path '/users'
    And def reqBody = read("request1.json")
    # to change a data in the file from code
    And set reqBody.job = 'engineer'
    And request reqBody
    When method POST
    Then status 201
    And match response == expectedOutput
    And match $ == expectedOutput
    And print response
