Feature: PUT API demo

  Scenario: Put demo 1
    Given url 'https://reqres.in/api/users/2'
    And request {"name": "SanthoshaUG","job": "zion resident"}
    When method PUT
    Then status 200
    And print response
