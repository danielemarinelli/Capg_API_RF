*** Settings ***
Documentation    To validate PetStore (user module) CRUD calls
Resource    ../resources/UserAPI.robot

*** Variables ***



*** Test Cases ***

TC001_Create a new user
    UserAPI.Select the correct endpoint to send a post request

TC002_Get the user details that was created in TC001
    UserAPI.Retrieve the user by username

TC003_Update the user created in TC001
    UserAPI.Update the phone number and the email of the user         bflo@gmail.it    3897879

TC004_Get the user with the updated fields and verify them
    UserAPI.Check that the phone and email after the update are as expected     bflo@gmail.it    3897879

TC005_Delete User created in TC001
    UserAPI.Select the correct endpoint to delete the user previously
    UserAPI.Send the get request to verify the user does not exist

#TC006_Verify the User is deleted successfully
    #UserAPI.Send the get request to verify the user does not exist



