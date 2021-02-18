*********************************************
.inc '90nm_bulk.l'
.SUBCKT Nor DVDD GND A B Out
*.PININFO DVDD:I GND:I A:I B:I Out:O
MN1 Out A GND GND NMOS l=0.1u w=0.25u m=1
MN2 Out B GND GND NMOS l=0.1u w=0.25u m=1
MP1 W1 A DVDD DVDD PMOS l=0.1u w=0.5u m=1
MP2 Out B W1 DVDD PMOS l=0.1u w=0.5u m=1
.ENDS
*********************************************


Vdd DVDD    0   1
Vss GND     0   0

Va A      0   pulse (0 1 0 10n 10n 0.99u 2u)
Vb B      0   pulse (0 1 0 10n 10n 0.49u 1u)

x1 DVDD     GND A B  Z     Nor

.tran 10n 2.1u
.op
.option post
.end
