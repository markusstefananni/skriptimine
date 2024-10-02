
 #!/bin/bash

# Võtame eesnimed ja paneme faili
cut -f2 -d" " inimesed.txt | cut -f1 -d";" | sed 's/[A-Z]/\L&/g' > eesnimed.txt

# Võtame perekonnanimed ja paneme faili
cut -f2 -d":" inimesed.txt | cut -f1 -d"," | sed 's/[A-Z]/\L&/g' > perenimed.txt

# Võtame domeenid ja paneme faili
cut -f2 -d"-" inimesed.txt | cut -f1 -d" " | sed 's/[A-Z]/\L&/g' > domeenid.txt

# Teeme kasutajanimed ja paneme faili
paste -d"." eesnimed.txt perenimed.txt > kasutajad.txt

# Teeme e-mailid ja paneme faili
paste -d"@" kasutajad.txt domeenid.txt > meilid.txt

# Kuvan, et kus mingi faili sisu asub.
#
echo "Eesnimed: eesnimed.txt"
#
echo "Perenimed: perenimed.txt"
#
echo "Domeenid: domeenid.txt"
#
echo "Kasutajad: kasutajad.txt"
#
echo "E-mailid: meilid.txt"

