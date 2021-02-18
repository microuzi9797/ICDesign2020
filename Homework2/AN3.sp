*********************************************
.inc '90nm_bulk.l'
.SUBCKT Nand3 DVDD GND A B C Out
*.PININFO DVDD:I GND:I A:I B:I C:I Out:O
MN1 W1 A GND GND NMOS l=0.1u w=0.25u m=1
MN2 W2 B W1 GND NMOS l=0.1u w=0.25u m=1
MN3 Out C W2 GND NMOS l=0.1u w=0.25u m=1
MP1 Out A DVDD DVDD PMOS l=0.1u w=0.5u m=1
MP2 Out B DVDD DVDD PMOS l=0.1u w=0.5u m=1
MP3 Out C DVDD DVDD PMOS l=0.1u w=0.5u m=1
.ENDS

.SUBCKT Inv DVDD GND In Out
*.PININFO DVDD:I GND:I In:I Out:O
MM1 Out In GND GND NMOS l=0.1u w=0.25u m=1
MM2 Out In DVDD DVDD PMOS l=0.1u w=0.5u m=1
.ENDS
*********************************************


Vdd DVDD    0   1
Vss GND     0   0

Va A      0   pulse (0 1 0 10n 10n 1.99u 4u)
Vb B      0   pulse (0 1 0 10n 10n 0.99u 2u)
Vc C      0   pulse (0 1 0 10n 10n 0.49u 1u)

x1 DVDD     GND A B C  V1     Nand3
x2 DVDD     GND V1  Z     Inv

.tran 10n 4.1u
.op
.option post
.end
