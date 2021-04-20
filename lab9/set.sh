echo "123456789" > "/dev/cipher_key"
echo "123456789" > "/proc/cipher_key"



echo "Andrew Nady Zaki OS lab" > "/dev/cipher"

s="/dev/cipher"
c="/proc/cipher"

cat $s 
echo "-----------------------------------------"
cat $c

