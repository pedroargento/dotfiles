#!/usr/bin/env python
import sys
import pandas as pd

pd.options.display.float_format = "{:,.2f}".format


def main():
    CONFINS = 0.03
    CSLL = 0.01
    IRPJ = 0.015
    PIS = 0.0065

    valor = float(sys.argv[1])
    CONFINS_val = CONFINS * valor
    CSLL_val = CSLL * valor
    IRPJ_val = IRPJ * valor
    PIS_val = PIS * valor

    imposto_total = CONFINS_val + CSLL_val + IRPJ_val + PIS_val

    impostos = pd.DataFrame(
        {
            "CONFINS": [str(CONFINS * 100) + "%", CONFINS_val],
            "CSLL": [str(CSLL * 100) + "%", CSLL_val],
            "IRPJ": [str(IRPJ * 100) + "%", IRPJ_val],
            "PIS": [str(PIS * 100) + "%", PIS_val],
        },
        index=["Aliquota", "Valor (R$)"],
    )
    print("\n\n")
    print("Valor da nota: R$ " + "{0:.2f}".format(valor))
    print(impostos)
    print("TOTAL: R$ " + "{0:.2f}".format(imposto_total))
    print("\n")
    print("=====================BRASIL===========================")
    print(
        "Valor aproximado dos Tributos será de 16,33% - Fonte IBPT \n Dados para depósito: \n Banco: Itaú \n Agência: 0272 \n Conta: 18633-9 \n"
    )

    print("=====================CARTESI==========================")
    print("Serviço de desenvolvimento de software na empresa Cartesi em Singapura\n")
    print("Valor dos tributos:")
    print("CSSL 2.88%: R$" + "{0:.2f}".format(valor * 2.88 / 100))
    print("IRPF 4.80%: R$" + "{0:.2f}".format(valor * 4.8 / 100))
    print("fonte IBPT")


if __name__ == "__main__":
    main()
