# OWASP ZAP

## Como um serviço

Interface Gráfica: `localhost:8080/zap`

URI para testes: http://testphp.vulnweb.com/

## Como um estágio de pipeline

> O exemplo leva apenas em consideração a configuração de uma pipeline para Gitlab

### Arquivos

- `.gitlab-ci.yml`: arquivo de manifesto que configura os estágios e trabalhos (job) da pipeline do Gitlab, nele deve está incluso pelo menos um job para o ZAP.
- `zap_scan.sh`: arquivo chamado pelo job da pipeline. Ele modifica o arquivo de plano de automação substituindo variáveis pelos seus respectivos valores nas variáveis de ambiente definidas pelo manifesto `.gitlab-ci.yml` e executa o plano dentro da contêiner do ZAP.
- `zap/automation_plan.yaml`: arquivo de manifesto que define os contextos e trabalhos de teste de segurança que o ZAP deve executar.

> Não existe nenhuma limitação para os nomes do arquivos, o nomes escolhidos para este documento foram para deixar uma maior conformidade com as palavras chaves do ecossistema da ferramenta.
