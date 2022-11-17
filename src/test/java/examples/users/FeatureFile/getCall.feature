Feature:  Validating get calls for users

  Background:
    * url 'https://jsonplaceholder.typicode.com/'

    Scenario: Posts for user with id 1
      Given path 'posts/1'
      When method GET
      Then status 200
   #   Then print response
      And karate.log(response)
      * def expectedoutput = read('../JSON/getCallOutput.json')
      And match response == expectedoutput
      And match response.id == 1


    Scenario: Comments for user with id 1
      Given path 'comments'
      And param postId = 1
      When method GET
      Then status 200
  #    Then print response
      And karate.log(response)
      * def expectedoutput = read('../JSON/getCallComments.json')
      And match response == expectedoutput
      * def value = response.postId
    #  Then print value
      * karate.log(value.toString)
      And match response.[0].postId == 1