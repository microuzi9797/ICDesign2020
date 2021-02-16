*********************************************
.inc '90nm_bulk.l'
.SUBCKT Inv DVDD GND In Out
*.PININFO DVDD:I GND:I In:I Out:O
MM1 Out In GND GND NMOS l=0.1u w=0.25u m=1
MM2 Out In DVDD DVDD PMOS l=0.1u w=0.5u m=1
.ENDS
*********************************************


Vdd DVDD    0   1.8
Vss GND     0   0

Vin In      0   pulse (0 1.8 0 100n 100n 0.4u 1u)

x1 DVDD     GND In  Out     Inv

.tran 10n 2.1u
.op
.option post
.end
