#!/bin/bash

# Os comando sed faz a substituição de valores no arquivo especificado
# Ex.: "s/PASSWORD/$PASSWORD/g"
#   Cada correspondência de 'PASSWORD' é substituído pelo valor da variável de
#   ambiente $PASSWORD

sed -i "s/PASSWORD/$PASSWORD/g" zap/automation_plan.yaml
sed -i "s/USERNAME/$USERNAME/g" zap/automation_plan.yaml
sed -i "s/ZAP_REPORT/$ZAP_REPORT/g" zap/automation_plan.yaml
ESCAPED_CI_PROJECT_DIR=$(sed -e 's/[&\\/]/\\&/g; s/$/\\/' -e '$s/\\$//' <<< "$CI_PROJECT_DIR")
sed -i "s/CI_PROJECT_DIR/$ESCAPED_CI_PROJECT_DIR/g" zap/automation_plan.yaml
sed -i "s/ZAP_ALERT_REPORT/$ZAP_ALERT_REPORT/g" zap/automation_plan.yaml

# Executa em modo linha de comando (sem GUI) o plano especificado
/zap/zap.sh -cmd -autorun $CI_PROJECT_DIR/zap/automation_plan.yaml

returnCode=0
# Verifica a exsitência de instâncias de falhas no relatório,
# se encontrar alguma, mostra um resumo das falhas e
# modifica o valor de retorno para 1 (falha a pipeline)
if grep -q "Instances" alert-report.md; then
  head -n 20 $ZAP_ALERT_REPORT.md
  echo "DAST RESULT: There are some vulnerabilities that ZAP has found (those visible here may not be the only ones). See the detailed report for more information." 
  returnCode=1
fi

# Retorna um valor para a pipeline
exit $returnCode