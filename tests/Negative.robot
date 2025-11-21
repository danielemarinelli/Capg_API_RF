*** Settings ***
Documentation    To validate PetStore negative tests
Resource    ../resources/UserAPI.robot


*** Test Cases ***

TC007_Send a GET request and validate status code 404
    UserAPI.Send a GET request with payload

