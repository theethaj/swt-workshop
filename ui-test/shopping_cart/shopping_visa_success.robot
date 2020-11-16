*** Settings ***
Library    SeleniumLibrary
Suite Teardown    Close All Browsers

*** Variables ***

*** Test Cases ***
User ซื้อของเล่นให้ลูกสาว เลือกวิธีจัดส่งเป็น kerry ชำระเงินด้วยบัตรเครดิตด้วย visa และชำระเงินสำเร็จ
    แสดงสินค้า
    แสดงรายละเอียดสินค้า
    ระบุจำนวนสินค้า
    นำสินค้าใส่ตะกร้า
    ยืนยันสั่งซื้อและชำระเงินด้วยบัตร visa card
    ขอบคุณ

*** Keywords ***
แสดงสินค้า
    Open Browser    https://dminer.in.th/Product-list.html    chrome
    Page Should Contain    43 Piece Dinner Set
    Element Should Contain    id=productPrice-1    12.95 USD

แสดงรายละเอียดสินค้า
    Click Button    id=viewMore-1
    Wait Until Element Contains    id=productName    43 Piece dinner Set

ระบุจำนวนสินค้า
    Input Text    id:productQuantity    1

นำสินค้าใส่ตะกร้า
    Press Keys    id:addToCart    RETURN

ยืนยันสั่งซื้อและชำระเงินด้วยบัตร visa card
    Wait Until Element Contains    id=productName-1    43 Piece dinner Set
    Element Should Contain    id=recevierPhonenumber    0970809292
    Element Should Contain    id=totalProductPrice    12.95 USD
    Element Should Contain    id=totalShippingCharge    2.00 USD
    Element Should Contain    id=totalAmount    14.95 USD
    Press Keys    id:confirmPayment    RETURN

    Wait Until Element Contains    id=labelCardNumber    เลขบัตร:
    Input Text    id:cardNumber    4719700591590995
    Input Text    id:expiredMonth    7
    Input Text    id:expiredYear    20
    Input Text    id:cvv    752
    Input Text    id:cardName    Karnwat Wongudom
    Press Keys    id:Payment    RETURN

ขอบคุณ
    Wait Until Element Contains    id=title    ชำระเงินสำเร็จ