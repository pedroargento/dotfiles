#!/bin/bash
value=$1

CSLL=2.88
IRPJ=4.80

echo "Valor total da nota R\$ $value"
echo "Serviço de desenvolvimento de software na empresa Cartesi em Ilhas Cayman"
echo ""
echo "CSLL($CSLL%): R\$ $(echo "scale=2; $value * $CSLL / 100" | bc)"
echo "IRPJ($IRPJ%): R\$ $(echo "scale=2; $value * $IRPJ / 100" | bc)"
echo "fonte IBPT"
