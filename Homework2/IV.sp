*********************************************
.inc '90nm_bulk.l'
.SUBCKT Inv DVDD GND In Out
*.PININFO DVDD:I GND:I In:I Out:O
MM1 Out In GND GND NMOS l=0.1u w=0.25u m=1
MM2 Out In DVDD DVDD PMOS l=0.1u w=0.5u m=1
.ENDS
*********************************************


Vdd DVDD    0   1
Vss GND     0   0

Va A      0   pulse (0 1 0 10n 10n 0.49u 1u)

x1 DVDD     GND A  Z     Inv

.tran 10n 1.1u
.op
.option post
.end
