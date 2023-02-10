Feature: Sample API test

  Scenario: test a sample GET API
    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200
