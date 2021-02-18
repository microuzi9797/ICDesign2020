*********************************************
.inc '90nm_bulk.l'
.SUBCKT Sum DVDD GND A B CI S
*.PININFO DVDD:I GND:I A:I B:I CI:I S:O
MN1 W1 A GND GND NMOS l=0.1u w=0.25u m=1
MP1 W1 A DVDD DVDD PMOS l=0.1u w=0.5u m=1
MN2 W2 B A GND NMOS l=0.1u w=0.25u m=1
MP2 W2 B W1 DVDD PMOS l=0.1u w=0.5u m=1
MN3 W2 A B GND NMOS l=0.1u w=0.25u m=1
MP3 W2 W1 B DVDD PMOS l=0.1u w=0.5u m=1
MN4 W3 CI GND GND NMOS l=0.1u w=0.25u m=1
MP4 W3 CI DVDD DVDD PMOS l=0.1u w=0.5u m=1
MN5 W4 W2 W3 GND NMOS l=0.1u w=0.25u m=1
MP5 W4 W2 CI DVDD PMOS l=0.1u w=0.5u m=1
MN6 W4 W3 W2 GND NMOS l=0.1u w=0.25u m=1
MP6 W4 CI W2 DVDD PMOS l=0.1u w=0.5u m=1
MN7 S W4 GND GND NMOS l=0.1u w=0.25u m=1
MP7 S W4 DVDD DVDD PMOS l=0.1u w=0.5u m=1
.ENDS

.SUBCKT Cout DVDD GND A B CI CO
*.PININFO DVDD:I GND:I A:I B:I CI:I CO:O
MN1 W1 CI W2 GND NMOS l=0.1u w=0.25u m=1
MN2 W2 A GND GND NMOS l=0.1u w=0.25u m=1
MN3 W2 B GND GND NMOS l=0.1u w=0.25u m=1
MN4 W1 A W3 GND NMOS l=0.1u w=0.25u m=1
MN5 W3 B GND GND NMOS l=0.1u w=0.25u m=1
MP1 W4 A DVDD DVDD PMOS l=0.1u w=0.5u m=1
MP2 W4 B DVDD DVDD PMOS l=0.1u w=0.5u m=1
MP3 W1 CI W4 DVDD PMOS l=0.1u w=0.5u m=1
MP4 W1 A W5 DVDD PMOS l=0.1u w=0.5u m=1
MP5 W5 B DVDD DVDD PMOS l=0.1u w=0.5u m=1
MN6 CO W1 GND GND NMOS l=0.1u w=0.25u m=1
MP6 CO W1 DVDD DVDD PMOS l=0.1u w=0.5u m=1
.ENDS
*********************************************


Vdd DVDD    0   1
Vss GND     0   0

Va A      0   pulse (0 1 0 10n 10n 1.99u 4u)
Vb B      0   pulse (0 1 0 10n 10n 0.99u 2u)
Vci CI      0   pulse (0 1 0 10n 10n 0.49u 1u)

x1 DVDD     GND A B CI  S     Sum
x2 DVDD     GND A B CI  CO     Cout

.tran 10n 4.1u
.op
.option post
.end
