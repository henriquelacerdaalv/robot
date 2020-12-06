*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${URL}                                  http://automationpractice.com
${BROWSER}                              chrome

*** Keywords ***
###Setup e teardown
Abrir navegador
    Open Browser                        http://automationpractice.com                                      ${BROWSER}

Fechar navegador
    Close Browser

Acessar Home do site
    Title Should Be                     My Store

Digitar o texto ${PRODUTO} no campo de pesquisa
    Input Text                          id=search_query_top                                                 ${PRODUTO}

Clicar no botão pesquisar 
    Click Element                       name=submit_search

Conferir se o produto "${PRODUTO}" foi exibido
    Wait Until Element Is Visible       css=#center_column > h1
    Title Should Be                     Search - My Store
    Page Should Contain Image           xpath=//*[@id="center_column"]//*[@src="http://automationpractice.com/img/p/7/7-home_default.jpg"] 
    Page Should Contain Link            xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(),"${PRODUTO}")]

Conferir se a página exibiu a mensagem 'No results found for your search "${PRODUTO}"
    Wait Until Element Is Visible       id=center_column
    Title Should Be                     Search - My Store
    Page Should Contain Element                //*[@id="center_column"]/p[@class='alert alert-warning']
    Element Text Should Be              //*[@id="center_column"]/p[@class='alert alert-warning']            No results were found for your search "${PRODUTO}"