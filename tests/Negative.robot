*** Settings ***
Documentation    To validate PetStore negative tests
Resource    ../resources/UserAPI.robot


*** Test Cases ***

TC007_Send GET request and validate status code 404
    [Tags]    REGRESSION    NEGATIVE_TESTS
    UserAPI.Send a get request with payload    ${username}


TC008_Send POST request and validate status code 415
    [Tags]    REGRESSION    NEGATIVE_TESTS
    UserAPI.Send a post request with wrong payload    ${username}


TC009_Send GET request and validate status code 405
    [Tags]    REGRESSION    NEGATIVE_TESTS
    UserAPI.Send a get request without username endpoint

