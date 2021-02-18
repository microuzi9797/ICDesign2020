*********************************************
.inc '90nm_bulk.l'
.SUBCKT Xor3 DVDD GND A B C Out
*.PININFO DVDD:I GND:I A:I B:I C:I Out:O
MN1 W1 A GND GND NMOS l=0.1u w=0.25u m=1
MP1 W1 A DVDD DVDD PMOS l=0.1u w=0.5u m=1
MN2 W2 B A GND NMOS l=0.1u w=0.25u m=1
MP2 W2 B W1 DVDD PMOS l=0.1u w=0.5u m=1
MN3 W2 A B GND NMOS l=0.1u w=0.25u m=1
MP3 W2 W1 B DVDD PMOS l=0.1u w=0.5u m=1
MN4 W3 C GND GND NMOS l=0.1u w=0.25u m=1
MP4 W3 C DVDD DVDD PMOS l=0.1u w=0.5u m=1
MN5 W4 W2 W3 GND NMOS l=0.1u w=0.25u m=1
MP5 W4 W2 C DVDD PMOS l=0.1u w=0.5u m=1
MN6 W4 W3 W2 GND NMOS l=0.1u w=0.25u m=1
MP6 W4 C W2 DVDD PMOS l=0.1u w=0.5u m=1
MN7 Out W4 GND GND NMOS l=0.1u w=0.25u m=1
MP7 Out W4 DVDD DVDD PMOS l=0.1u w=0.5u m=1
.ENDS
*********************************************


Vdd DVDD    0   1
Vss GND     0   0

Va A      0   pulse (0 1 0 10n 10n 1.99u 4u)
Vb B      0   pulse (0 1 0 10n 10n 0.99u 2u)
Vc C      0   pulse (0 1 0 10n 10n 0.49u 1u)

x1 DVDD     GND A B C  Z     Xor3

.tran 10n 4.1u
.op
.option post
.end
