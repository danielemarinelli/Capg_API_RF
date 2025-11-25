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


Update the phone number and the email of the user
    [Arguments]    ${new_email}    ${new_mobile}
    &{payload_updated}=    Create Dictionary    id=${id}     username=${name}    firstName=${fName}   lastName=${lName}    email=${new_email}    password=${pw}    phone=${new_mobile}     userStatus=${userStatus}
    ${put_response}=    PUT    ${BaseURL}${endpoint}/${name}    json=${payload_updated}    expected_status=200
    Log    ${put_response.json()}
    Dictionary Should Contain Key    ${put_response.json()}    code    type    message
    ${userID}=    Get From Dictionary    ${put_response.json()}    message
    Should Be Equal As Strings    ${put_response.json()}[message]    ${userID}
    Dictionary Should Contain Item    ${put_response.json()}     type    unknown


Check that the phone and email after the update are as expected
    [Arguments]    ${new_email}    ${new_mobile}
    ${get_response_after_update}=    GET    ${BaseURL}${endpoint}/${name}    expected_status=200
    Log    ${get_response_after_update.json()}
    Should Be Equal As Strings    ${get_response_after_update.json()}[email]    ${new_email}
    Should Be Equal As Strings    ${get_response_after_update.json()}[phone]    ${new_mobile}


UserAPI.Select the correct endpoint to delete the user previously
    &{delete_user}=    Create Dictionary    username=${name}
    ${delete_resp}=    DELETE    ${BaseURL}${endpoint}/${name}    json=${delete_user}    expected_status=200
    Log    ${delete_resp.json()}
    Dictionary Should Contain Key    ${delete_resp.json()}    code    type    message
    Should Be Equal As Strings    ${delete_resp.json()}[message]    ${name}

Send the get request to verify the user does not exist
    ${get_response_after_delete}=    GET    ${BaseURL}${endpoint}/${name}    expected_status=404
    Dictionary Should Contain Key    ${get_response_after_delete.json()}    code    type    message
    Should Be Equal As Strings    ${get_response_after_delete.json()}[code]    1
    Should Be Equal As Strings    ${get_response_after_delete.json()}[type]    error
    Should Be Equal As Strings    ${get_response_after_delete.json()}[message]    User not found


Send a get request with payload
    &{payload_body}=    Create Dictionary    id=${id}     username=${name}    firstName=${fName}   lastName=${lName}    email=${email}    password=${pw}    phone=${mobile}     userStatus=${userStatus}
    ${response}=    GET    ${BaseURL}${endpoint}/${name}     expected_status=404


Send a post request with wrong payload
    &{payload_body}=    Create Dictionary    job=QA    id=${id}     username=${name}    firstName=${fName}   lastName=${lName}    email=${email}    password=${pw}    phone=${mobile}     userStatus=${userStatus}
    ${response}=    POST    ${BaseURL}${endpoint}     expected_status=415


Send a get request without username endpoint
    GET    ${BaseURL}${endpoint}     expected_status=405
