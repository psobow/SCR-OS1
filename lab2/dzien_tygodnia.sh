#!/bin/bash

	#W bashu białe znaki są ważne,np. podczas przypisania nie można dawać spacji obok znaku "="

	# date +u% zwraca numer dnia tygodnia 1-7
dayNumber=$(date +%u)  

test="witam test"

	# za pomocą $ odwołujemy się do zawartości zmiennej nr_dnia_tygodnia
if [ $dayNumber -ge 6 ]; then
	echo "It is weekend!"
else
	echo "It is workday"
fi

# nie rozumiem dlaczego tutaj musi być koniecznie pojedyncza klamra [] w wyrażeniu logicznym..
# w dokumentacji zalecają używanie [[ ]] https://ss64.com/bash/test.html

