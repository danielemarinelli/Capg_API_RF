*** Settings ***
Documentation    To validate PetStore (user module) CRUD calls
Resource    ../resources/UserAPI.robot

*** Variables ***



*** Test Cases ***

TC001_Create a user
    UserAPI.Select the correct endpoint to send a post request

TC002_Get the user details that was created in TC001
    UserAPI.Retrieve the user by username

