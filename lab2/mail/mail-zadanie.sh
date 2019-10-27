#!/bin/bash                                                                     

for adress_mail in $(cat adresy.txt)
do
    subject="Email testowy"
    tresc=$(cat tresc.txt)    
	file1="cos.pdf"

	echo "wysyłam e-mail do: $adress_mail"
	echo "temat: $subject"
	echo "o treści: $tresc"
	echo "załączone pliki: $file1"
	
    mailx -s "$subject" -a $file1 $adress_mail < $tresc
done

# pętla for http://bash.0x1fff.com/petla-for

# -s parametr po którym podajemy temat
# -a parametr po którym podajemy nazwe, wraz z rozszerzeniem, załączanego pliku
