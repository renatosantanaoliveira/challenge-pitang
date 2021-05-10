@login
Feature: Log-In

    I as a user of the bookstore
    I want to login in store
    To carry out my purchases

    Background:
        Given that I am on the login page

    @register
    Scenario: Register new user
        When click in button "New User"
        And fill fields first name, last name, username and password
        And I click on captcha
        And click in button "Register"

    @success
    Scenario: Log-In successfully
        When I input username and password
        And click in button "Login"
        Then log-in will be successfully

    @unsuccessfully
    Scenario: Log-In without successfully
        When I input username and password invalid
        And click in button "Login"
        Then return message error on screen