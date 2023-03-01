# OWASP ZAP

> Ferramenta para execução de testes de segurança em aplicações em execução

## DAST

A etapa DAST (Dynamic Application Security Testing) em uma pipeline CI/CD é responsável pelo teste automatizado que avalia a segurança de um aplicativo web em tempo de execução, simulando ataques reais e identificando vulnerabilidades.

Durante a etapa de DAST, a ferramenta de teste automatizado realiza uma varredura no aplicativo web, enviando requisições HTTP e analisando as respostas para identificar vulnerabilidades.

Isso permite que os desenvolvedores e times de segurança detectem e resolvam vulnerabilidades precocemente, reduzindo o risco de violações de segurança e aumentando a confiança no aplicativo.

## ZAP

O **OWASP ZAP** (Zed Attack Proxy) é uma ferramenta de segurança de aplicativos web de código aberto que permite aos usuários identificar e corrigir vulnerabilidades em seus aplicativos. A ferramenta é desenvolvida e mantida pela Open Web Application Security Project (OWASP), uma comunidade global sem fins lucrativos que tem como objetivo melhorar a segurança do software.

O ZAP pode ser usado por desenvolvedores, testadores de segurança e gerentes de projetos para avaliar a segurança de aplicativos web durante o desenvolvimento, testes e operação. Ele pode ajudar a identificar vulnerabilidades comuns, como injeções de SQL, cross-site scripting (XSS), falsificação de solicitação entre sites (CSRF), autenticação e autorização inadequadas e outras ameaças.

A ferramenta possui uma interface gráfica de usuário (GUI) que permite o usuário executar testes manuais, e também possui uma API que permite aos usuários integrá-lo em seus processos de desenvolvimento e testes automatizados. A API pode ser usada para automatizar testes de segurança em um pipeline de entrega contínua (CI/CD), permitindo a detecção precoce de vulnerabilidades em aplicativos web.

### Propósito

Classificar e mostrar as possíveis vulnerabilidades do sistema que está sendo implementado e testado. Aponta para as equipes de desenvolvimento o teste e onde é necessário corrigir e reforçar a segurança.

## Básico sobre testes de segurança

Teste de segurança é o processo de avaliar e testar um sistema para descobrir riscos de segurança e vulnerabilidades desse sistema. O testes de segurança podem ser categorizados em quatro tipos, que são:

- Vulnerability Assessment
- Penetration Testing
- Runtime Testing
- Code Review

### Teste de penetração

O **teste de penetração** (_pentesting_) é realizado como se o testador fosse um invasor externo malicioso com o objetivo de invadir o sistema. Ele pode ser dividido em três estágio, que são:

1. Explore
1. Attack
1. Report

## Funcionamento

Essencialmente o ZAP é conhecido como "proxy man-in-the-middle". Ele fica entre o navegador do testador e o aplicação web para que possa interceptar e inspecionar as mensagens enviadas entre eles, modificar o conteúdo, se necessário, e encaminhar esses pacotes para o destino.

![Fluxo do ZAP](browser-no-proxy.png)

O ZAP pode ser usado como um aplicativo autônomo e como um processo de segundo plano.

### Automation Framework

O **Automation Framework** permite que você controle o ZAP por meio de um arquivo YAML e oferece mais flexibilidade sem estar vinculado a nenhuma tecnologia de contêiner específica. Com o tempo, o Automation Framework se tornará o padrão de execução do ZAP. Ele está incluído na versão mais recente do ZAP, bem como na imagem estável do docker.

#### Contexto

Um **contexto** é um recurso que permite que o testador defina as informações do ambiente em que a aplicação web está sendo executada durante uma sessão de testes de segurança. Isso inclui as URLs, cookies, cabeçalhos e outros parâmetros da sessão que podem ser usados para criar cenários de teste específicos.

#### Job

Um **job** é um recurso que permitem o testador automatizar tarefas de teste de segurança. Com um job, o testador pode definir um conjunto de ações a serem executadas de forma sequencial, como enviar solicitações HTTP para uma aplicação web, identificar vulnerabilidades, gerar relatórios, entre outros.

##### Spider

Um **spider** é um recurso que permite a ferramenta mapear automaticamente a aplicação web, identificando todas as páginas acessíveis a partir de uma página inicial e coletando informações sobre elas.

## Prós e contras

Esta seção mostra uma lista de possíveis prós e contras na utilização do ZAP.

### Prós

- Gratuito
- Escaneamento automático e relatórios detalhados
- Multiplataforma
- Versátil e extensível
- Bem mantido e possui boa comunidade (Nikto)

### Contras

- Pode consumir muito da máquina
- GUI pouco intuitiva (soluções pagas)
- Requer razoável conhecimento técnico
- A ferramenta não pode detectar todas as vulnerabilidades
