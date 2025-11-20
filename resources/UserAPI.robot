*** Settings ***
Documentation    File with all the CRUD calls
Library    RequestsLibrary
Library     Collections
Resource    ../variables/env_variables.robot


*** Keywords ***
Select the correct endpoint to send a post request
    #payload
#{
#  "id": 0,
#  "username": "dan",
#  "firstName": "mar",
#  "lastName": "string",
#  "email": "string",
#  "password": "string",
#  "phone": "string",
#  "userStatus": 0
#}
    &{payload_body}=    Create Dictionary    id=${id}     username=${name}    firstName=${fName}   lastName=${lName}    email=${email}    password=${pw}    phone=${mobile}     userStatus=${userStatus}
    ${response}=    POST    ${BaseURL}${endpoint}    json=${payload_body}    expected_status=200
    Log    ${response.json()}
    Dictionary Should Contain Key    ${response.json()}    code    type    message
    ${userID}=    Get From Dictionary    ${response.json()}    message
    Should Be Equal As Strings    ${response.json()}[message]    ${userID}
    Should Be Equal As Strings    ${response.json()}[type]    unknown


Retrieve the user by username
    ${get_response}=    GET    ${BaseURL}${endpoint}/${name}    expected_status=200
    Log    ${get_response.json()}
    Dictionary Should Contain Key    ${get_response.json()}    id    username    firstName    
    Dictionary Should Contain Key    ${get_response.json()}    lastName    email    password
    Dictionary Should Contain Key    ${get_response.json()}    phone    userStatus
    Should Be Equal As Strings    ${get_response.json()}[id]    ${id}
    Should Be Equal As Strings    ${get_response.json()}[username]    ${name}
    Should Be Equal As Strings    ${get_response.json()}[firstName]    ${fName}
    Should Be Equal As Strings    ${get_response.json()}[lastName]    ${lName}
    Should Be Equal As Strings    ${get_response.json()}[email]    ${email}
    Should Be Equal As Strings    ${get_response.json()}[password]    ${pw}
    Should Be Equal As Strings    ${get_response.json()}[phone]    ${mobile}
    Should Be Equal As Strings    ${get_response.json()}[userStatus]    ${userStatus}


