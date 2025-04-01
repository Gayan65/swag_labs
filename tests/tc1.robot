*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  https://gayan65.github.io/swag_labs/swag_labs.html
${BROWSER}  Chrome
${USERNAME}  standard_user
${PASSWORD}  secret_sauce
${FIRSTNAME}    Gayan
${LASTNAME}     Gamage
${POSTALCODE}   5010

*** Test Cases ***
Login and Purchase Flow
    Open Browser  ${URL}  ${BROWSER}
    Wait Until Element Is Visible  id=username
    Input Text  id=username  ${USERNAME}
    Input Text  id=password  ${PASSWORD}
    Click Button  id=login-button
    Wait Until Element Is Visible  id=product-page

    # Add items to cart
    Click Element  xpath=//button[contains(@onclick, 'addToCart(1)')]
    Click Element  xpath=//button[contains(@onclick, 'addToCart(2)')]
    Click Element  xpath=//div[@class='cart-icon']
    Wait Until Element Is Visible  id=checkout-page

    # Checkout process
    Input Text  id=first-name  ${FIRSTNAME}}
    Input Text  id=last-name  ${LASTNAME}}
    Input Text  id=postal-code  ${POSTALCODE}}
    Click Element  xpath=//button[contains(@onclick, 'completeCheckout()')]
    Sleep   5s

    Close Browser
