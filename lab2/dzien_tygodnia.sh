#!/bin/bash

# W bashu białe znaki są ważne,np. podczas przypisania nie można dawać spacji obok znaku "="
# date +u% zwraca numer dnia tygodnia 1-7
dayNumber=$(date +%u)  

# za pomocą $ odwołujemy się do zawartości zmiennej nr_dnia_tygodnia
if [[ $dayNumber -ge 6 ]]; 
then
	echo "It is weekend!"
else
	echo "It is workday"
fi

