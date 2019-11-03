#!/bin/bash

# Jak wywołamy skrypt z niepoprawnym argumentem to printujemy usage, zamiast wywalić się na plecy.
# $0 - zmienna wbudowana basha, zwraca nazwe skryptu.
usage()
{
    echo "Uzyj: $0 [-a 'nazwa-paczki'] [-m 'szukana-nazwa'] [-n dni-od-statniej-modyfikacji] " ;
    exit 1;
}

# Funkcja getopts to wbudowana funkcja basha, która służy do sparsowania argumentów podanych w lini poleceń do naszego skryptu. 
# Funkcja getopts przyjmuje 3 parametry. 
    # pierwszy określa jakie switche są poprawne dla naszego programu, 
    # drugi argument to zmienna która będzie odpowiadać kolejnym switchą sparsowanym przez getopts
    # trzeci argument domyślnie to $@ czyli zawartość przekazanych argumentów
    # więcej informacji https://sookocheff.com/post/bash/parsing-bash-script-arguments-with-shopts/
# materiały pomocnicze: https://stackoverflow.com/questions/16483119/an-example-of-how-to-use-getopts-in-bash

# TODO: Zaimplementować awaryjne działanie programu nawypadek nieprawidłowego inputu.
while getopts ":a:m:n:" option; # "Leading colon turn on silence error reporting mode"
do
    case "${option}" in
        a)
            a=${OPTARG}
            ;;
        m)
            m=${OPTARG}
            ;;
        n)
            n=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1)) # Usuwamy z $@ switche które zostaly już sparsowane przez getops


# TODO: Zaimplementować awaryjne działanie programu nawypadek nieprawidłowego inputu.
if [[ -z $a ]] ; # -z = zwraca true jeśli długość stringa wynosi zero
then 
    echo "Podaj wynikowa nazwe archiwum (np. 'archiv.tar'): " 
    read a
fi

if [[ -z $m ]] ;
then 
    echo "Podaj szukana nazwe (np. '*.txt'): "
    read m
fi

if [[ -z $n ]] ;
then 
    echo "Podaj dni od ostatniej modyfikacji: "
    read n
fi

# -n zwraca true jeśli długośc stringa jest różna od zera
# TODO: 
if [[ -n $(find -name "$m" -mtime -$n -exec tar -rvf "$a" {} \;) ]]
then
    echo "Utworzono archiwum/Dodano pliki do archiwum"
else
    echo "Nieznaleziono plikow spelniajacych podane kryteria."
fi


# example usage: bash ./skrypt2.sh -a arc2.tar -m '*.txt' -n 1
# Jeżeli w katalogu roboczym będzie znajdować się tylko jeden plik z rozszerzeniem .txt to polecenie bez apostrofów zadziała.
# natomiast jeśli będzie więcej plików z .txt to musimy pamiętać aby użyć apostrofów, ponieważ jeśli tego nie zrobimy to regex zostanie zresolwowany na etapie polecenia w terminalu, a nie na etapie wykonywania skryptu