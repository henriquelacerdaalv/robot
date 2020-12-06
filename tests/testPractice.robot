*** Settings ***
Test Setup          Abrir navegador 
Test Teardown       Fechar navegador
Resource            ../resources/resources.robot 

*** Test Cases ***
Caso de Teste 01: Pesquisar produto existente
    Acessar Home do site 
    Digitar o texto Blouse no campo de pesquisa
    Clicar no botão pesquisar
    Conferir se o produto "Blouse" foi exibido

Caso de Teste 02: Pesquisar produto inexistente
    Acessar Home do site 
    Digitar o texto itemNaoExistente no campo de pesquisa
    Clicar no botão pesquisar
    Conferir se a página exibiu a mensagem 'No results found for your search "itemNaoExistente"
# *** Keywords ***