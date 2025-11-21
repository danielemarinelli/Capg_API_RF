*** Settings ***
Documentation    To validate PetStore negative tests
Resource    ../resources/UserAPI.robot


*** Test Cases ***

TC007_Send a GET request and validate status code 404
    UserAPI.Send a get request with payload


TC008_Send a POST request and validate status code 415
    UserAPI.Send a post request with wrong payload