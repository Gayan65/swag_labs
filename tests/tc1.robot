*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  https://gayan65.github.io/swag_labs/swag_labs.html
${BROWSER}  Chrome
${USERNAME}  standard_user
${PASSWORD}  secret_sauce

*** Test Cases ***
Login and Purchase Flow
    Open Browser  ${URL}  ${BROWSER}
    Wait Until Element Is Visible  id=username
    Input Text  id=username  ${USERNAME}
    Input Text  id=password  ${PASSWORD}
    Click Button  id=login-button
    Wait Until Element Is Visible  id=inventory_container

    # Add items to cart
    Click Button  id=add-to-cart-sauce-labs-backpack
    Click Button  id=add-to-cart-sauce-labs-bike-light
    Click Button  id=shopping_cart_container
    Wait Until Element Is Visible  class=cart_list

    # Remove an item from the cart
    Click Button  id=remove-sauce-labs-bike-light

    # Checkout process
    Click Button  id=checkout
    Input Text  id=first-name  John
    Input Text  id=last-name  Doe
    Input Text  id=postal-code  12345
    Click Button  id=continue

    # Confirm purchase
    Click Button  id=finish
    Wait Until Element Is Visible  class=complete-header
    Element Should Contain  class=complete-header  Thank you for your order!

    Close Browser
