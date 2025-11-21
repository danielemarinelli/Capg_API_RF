*** Settings ***
Documentation    To validate PetStore negative tests
Resource    ../resources/UserAPI.robot


*** Test Cases ***

TC007_Send GET request and validate status code 404
    UserAPI.Send a get request with payload


TC008_Send POST request and validate status code 415
    UserAPI.Send a post request with wrong payload


TC009_Send GET request and validate status code 405
    UserAPI.Send a get request without username endpoint

