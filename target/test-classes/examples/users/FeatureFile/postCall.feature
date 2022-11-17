@template
Feature: Validating post calls for user
  
  Background: 
    * url 'https://jsonplaceholder.typicode.com/'

    Scenario: Creating post request
      Given path 'posts'
      * def payload = read('../JSON/postCallPayload.json')
      And replace payload.title = 'Raghav'
      And replace payload.body = 'Testing'
 #     And payload.title = 'Raghav'
 #     And payload.body = 'Testing'

      # set and eval - t overide

      And request payload
      When method POST
      Then status 201
  #    Then print response
      Then karate.log(response)
      Then match response.title == 'Raghav'
      Then match response.body ==  'Testing'

    @tag1
    Scenario: Updating post request
      Given path 'posts/1'
      * def putPayload = read('../JSON/putPayload.json')
      And request putPayload
      When method PUT
      Then status 200
   #   And print response
      And karate.log(response)
      Then match response == putPayload

  Scenario: Validating put and get call
      Given path 'posts/1'
      When method GET
    # schema validation - API contract
      Then status 200
 #     Then print response
      Then  karate.log(response)
    * def putcall = call read('classpath:examples/users/FeatureFile/postCall.feature@tag1')
    Then print putcall.response
   # Then match response == putcall.response



