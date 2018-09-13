Feature: Demo karate against jenkins

Scenario: Verify that jenkins is up and running

Given url 'http://ergast.com/api/f1/2017/Circuits.json'
When method get
Then status 200
And match response.MRData.CircuitTable.Circuits[*].circuitId contains [albert_park]

Scenario: post a rest request api

Given url 'https://reqres.in/api/users'
And header Accept = 'application/json'
And form field name = 'morpheus'
And form field job = 'leader'
When method post
Then status 201
And match responseHeaders contains {Content-Type: [application/json; charset=utf-8]}
And match responseHeaders contains {Connection: [keep-alive]}
And match response contains {name: morpheus}
And match response contains {job: leader}

Scenario: put a rest request api

Given url 'https://reqres.in/api/users/2'
And header Accept = 'application/json'
And form field name = 'morpheus'
And form field job = 'zion resident'
When method put
Then status 200
And match responseHeaders contains {Content-Type: [application/json; charset=utf-8]}
And match responseHeaders contains {Connection: [keep-alive]}
And match response contains {name: morpheus}
And match response contains {job: zion resident}

Scenario: Delete a rest request api

Given url 'https://reqres.in/api/users/2'
And header Accept = 'application/json'
When method delete
Then status 204
And match responseHeaders contains {Connection: [keep-alive]}		