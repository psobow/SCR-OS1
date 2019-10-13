# Unix cheatsheet #

## Ogólne ##
* Należy pamiętać, że rejestr liter użytych przy pisaniu polecenia ma znaczenie: `pwd` jest czymś 
  innym niż `PWD`.
* Gotowość do wykonywania poleceń jest sygnalizowana przez powłokę wyświetleniem ciągu znaków  
  o zwyczajowej nazwie prompt.  
  `user@host: dir $`  
  gdzie:
    * `user` - nazwa zalogowanego użytkownika
    * `host` - nazwa komputera, na którym pracuje powłoka
    * `dir` - nazwa katalogu bieżącego
    * `$` - oznacza, że powłoka pracuje na rzecz normalnego użytkownika
* Symbole:
  * Symbol dolara w prompt `$` - zwykły user
  * Symbol hashu w prompt `#` - administrator (root)
  * Symbol tyldy `~` - oznacza nasz katalog domowy
  * Symbol forward slash `/` - katalog główny
  * Symbol kropki `.` - odnosi się do katalogu w którym obecnie się znajdujemy
  * Symbol dwie kropki `..` - odnosi się do katalogu nadrzędnego
  * Symbol asterisk `*` - dopasowuję zero lub więcej znaków
  * Symbol question mark `?` - dopasowuje tylko jeden dowolny znak
* Długość polecenia nie jest ograniczona, terminal linię wykraczającą poza prawy margines ekranu  
  „przełamie”, ale można też przerwać pisanie polecenia w dowolnym momencie za pomocą znaku   
   backward slash `\ ` i naciskając klawisz Enter. System uzna, że polecenie będzie kontynuowane w   
  kolejnej linii i wstrzyma się z jego wykonaniem do chwili skompletowania całości, a zamiast prompta na  
  początku nowej linii zostanie wyświetlony znak `>`
* Uzyskiwanie pomocy (manual pages)  
  Dostęp do dokumentacji możliwy jest dzięki przeglądarce interaktywnej, którą uruchamia się
  poleceniem: `man nazwa_polecenia`  
* Pomoc systemowa wyświetlana jest za pomocą przeglądarki `more`, którą obsługuje się za pomocą
  następujących poleceń klawiszowych:
  * `spacja` - Przejście do następnej strony
  * &darr; - Przejście jedną linijke niżej
  * `ctrl-b` - Przejście do poprzedniej strony
  * &uarr; - Przejście jedną linijke wyżej
  * `q` - Opuszczenie przeglądarki
* Wyszukiwanie stron pomocy systemowej jest możliwe dzięki programom `apropos` oraz `whatis`,
  które wyszukują podanych słów w pomocy systemowej, np.:  
  `apropos passwd`  
  `whatis passwd`
* Ścieżka względna - to ścieżka rozpoczynająca się w naszym aktualnym katalogu roboczym 
  * W przypadku pracy w terminalu jest to ścieżka w promptcie
  * W przypadku uruchamiania skryptu jest to ściężka w której znajduję się skrypt
* Ścieżka bezwględna - to ścieżka rozpoczynająca się od naszego katalogu domowego `~`, lub katalogu  
głównego `/`
* Spis komend Unixowych - https://en.wikipedia.org/wiki/List_of_Unix_commands
  
## Skróty klawiszowe ##
* &uarr; &darr; - przywołanie poprzedniego/następnego polecenia z historii poleceń  
* `Tab` aktywowanie „podpowiadacza” nazw plików.  
uzupełnia wpisywane polecenie, jeśli da się je zresolvować na podstawie wpisanego ciągu znaków.  
Jeśli się nie da, to drugie wciśniecie przycisku `Tab` spowoduje wyświetlenie nazw plików pasujących  
do ciągu znaków który wpisaliśmy.
* `ctrl-z` - Przerzucenie bieżącego procesu na drugi plan
* `ctrl-l` - Wyczyszczenie okna terminala
* `ctrl-c` - Przerwanie bieżącego procesu
* `ctrl-d` - Wysłanie znaku końca pliku (EOF) do bieżącego procesu. wysłanie tej kombinacji do powłoki  
 systemowej wywołuje efekt natychmiastowego wylogowania się z systemu

## Zawartość katalogu głównego (/) ##
- bin - Katalog ten zawiera programy dostępne dla użytkownikó systemu
- dev - Katalog, w którym znajdują się urządzenia blokowe i znakowe
- etc - Katalog z plikami konfiguracyjnymi systemu
- home - Katalog przeznaczony na katalogi domowe użykowników systemu
- lib - Katalog z plikami bibliotek dla programów
- mnt - Katalog, w kórym montowane są dyski
- proc - Katalog z informacjami o systemi
- root - Katalog domowy użytkownika root
- sbin - Katalog z programami specjalnymi dla użytkowników o odpowiednich uprawnieniach
- tmp - Katalog na pliki tymczasowe
- usr - Katalog z programami
- var - Katalog używany przez system do przechowywania danych wygenerowanych przez programy 

## 1.System plików Unixa i polecenia na katalogach i plikach: ##
- W Linuxie inaczej niż w Windows, nie jest wymagane stosowanie w nazwach plików rozszerzeń, określających  
jaki program powinien zostać użyty do otwarcia pliku. Zawartość pliku i program jaki nalezy użyć  
do otwarcia linux określa na podstawie nagłówka `MIME` pliku.  
- W nazwach plików lepiej nie stosować znaku spacji. (utrudnia to wykonywanie polecań)
- Znak kropki `.` nie powinien rozpoczynać nazwy pliku (na linuxie znak kropki na początku nazwy pliku  
oznacza pliki ukryte)
 
1. Poruszanie się po katalogach  
    * `cd nowy_katalog` (change directory) - zmień katalog roboczy na nowy_katalog  
    * Komenda `cd` bez argumentu przeniesie nas do naszego katalogu domowego.
    * Więcej informacji: <https://en.wikipedia.org/wiki/Cd_(command)>
    
2. Wyświetlanie informacji o zawartości katalogu
    * `ls` - wyświetla(listuję) tylko nazwy wszystkich plików i katalogów w katalogu bieżącym
    * Najważniejsze switche:  
    Switche mogą być łączone ze sobą w dowolnej kolejności: `ls -l -a` == `ls -a -l` == `ls -la` == `ls -al`
      * `-l` (to samo co polecenie `vdir`) - Daje więcej informacji na temat elementów.
        ```
        patryk@heaven31415:~/mydir$ ls -l
        -rw-rw-r-- 1 patryk patryk 0 Oct 11 13:58 plik1
        ```
        * Kolumna 1: `-rw-rw-r--` typ elementu i prawa dostępu do niego
        * Kolumna 2: `1` liczba powiązań do tego elementu
        * Kolumna 3: `patryk` właściciel pliku
        * Kolumna 4: `patryk` grupa, która została przypisana do tego pliku
        * Kolumna 5: `0` rozmiar elementu w bajtach
        * Kolumna 6: `Oct 11 13:58` ostatnia data modyfikacji
        * Kolumna 7: `plik1` nazwa elementu 
        * Rozpoznawanie typu elementu:
          * Zapis pierwszej kolumny (`-rw-rw-r--`) składa się z czterech elementów. Pierwsza litera   
          zawsze określa typ elementu.  
          Symbole oznaczające typy elementów:
            * `-` - Zwykły plik
            * `b` - Specjalny plik blokowy
            * `c` - Specjalny plik znakowy
            * `d` - Katalog
            * `l` - Dowiząnie symboliczne
            * `s` - Gniazdo  
            A więc rozpatrywany obiekt jest zwykłym plikiem. bo zaczyna się od `-`
        * Interpretacja praw dostępu
          * Prawa dostępu określne są przez literki `r`, `w`, `x`, następujące po literze definiującej  
          typ elementu
          * W przypadku katalogu: 
            * `r` - Do przeszukiwania zwartości
            * `w` - Do zmiany zawartości
            * `x` - Do wejścia do katalogu
          * W przypadku pliku:
            * `r` - Do odczytania pliku
            * `w` - Do zmiany zawartości pliku
            * `x` - Do uruchomienia pliku
          * Rozważmy element z następującymi prawami dostępu: (`rw-rw-r--`)
            * Pierwsze trzy bity odnoszą się do właściciela elementu (`rw-`)
            * Drugie trzy bity odnoszą się do grupy przypisanej do elementu (`rw-`)
            * Ostatnie trzy bity odnoszą się do innych użytkowników systemu (`r--`)
      * `-a` - Zostaną dodatkowo wyświetlone pliku ukryte
      * `-t, --sort=time` - Sortuje wynik według czasu modyfikacji. Najnowsze jako pierwsze
      * `-r, --reverse` - Powoduje odwrócenie kolejności wświetlania
      * `-d` - Powoduje wypisanie tylko katalogów
      * Wyszukiwanie przy pomocy wzorca:
        * `ls p*` - Wyszukaj wszystkie pliki które zaczynają się na litere `p`
        * `ls --ignore='p*'` - Wyszukaj wszystkie pliki które NIE zaczynają się na litere `p`
    * Więcej informacji: https://en.wikipedia.org/wiki/Ls
    
3. Tworzenie katalogów
    * Polecenie `mkdir nazwa_katalogu` (make directory) - służy do utworzenia nowego katalogu jako  
    parametr podajemy nazwe katalogu który ma zostać utworzony.
    ```
      patryk@heaven31415:~/mydir$ mkdir newdir
      patryk@heaven31415:~/mydir$ ls -l
      drwxrwxr-x 2 patryk patryk 4096 Oct 13 12:58 newdir
    ```
    
    * `-p` służy do tworzenia drzewa katalogów np. `mkdir -p a/b` utworzy katalog `a` jeśli ten  
    nie istnieje, następnie wewnątrz `a` utworzy katalog `b` jeśli ten nie istnieje 
    * `-m` pozwala nadać prawa dostępu do katalogu np. `mkdir -m 111 katalog`  
    utworzy katalog o prawach dostępu `--x--x--x`
    * Więcej informacji: https://en.wikipedia.org/wiki/Mkdir
    
4. Tworzenie plików
    * Pliki tworzymy przy pomocy polecenia `touch nazwa_pliku`
    ```
       patryk@heaven31415:~/mydir$ touch plik1
       patryk@heaven31415:~/mydir$ ls -l
       -rw-rw-r-- 1 patryk patryk 0 Oct 13 12:56 plik1
    ```
    * Więcej informacji: <https://en.wikipedia.org/wiki/Touch_(command)>
    
5. Usuwanie plików
    * Usuwanie plików realizujemy przy pomocy polecenia `rm nazwa_pliku`
    * Aby usunąć wszystkie pliki w folderze `rm *` (opcja ta nie usunie katalogów)
    * Więcej informacji: <https://en.wikipedia.org/wiki/Rm_(Unix)>
    
6. Usuwanie katalogów
    * Jeśli chcemy usunąć pusty katalog `rmdir nazwa_katalogu`
    * Jeśli chcemy usunąć całą strukture katalogów razem z ich plikami musimy uzyć `rm -rf`  
    * `r`, `-R`, `--recursive` - Pozwala na rekurencyjne usuwanie całych struktur na dysku
    * `-f`, `--force` - Powoduje usuwanie plików bez pytania o potwierdzenie i bez zgłaszania błędów  
    w przypadku gdy nie może usunąć elementu
    
7. Wyświetlanie zawartości pliku
    * Możemy to zrealizować przy pomocy polecenia `cat` 
    ```
      patryk@heaven31415:~/mydir$ ls
      patryk@heaven31415:~/mydir$ echo 1 > plik1
      patryk@heaven31415:~/mydir$ echo 2 > plik2
      patryk@heaven31415:~/mydir$ ls
      plik1  plik2
      patryk@heaven31415:~/mydir$ cat plik1 plik2
      1
      2
    ```
    * Więcej informacji: <https://en.wikipedia.org/wiki/Cat_(Unix)>
    
8. Zmiana dat modyfikacji elementów i dostępu do nich  
    * Zmiane tych zawartości umożliwia polecenie `touch` 
    * Jeżeli podamy nazwe pliku, który jeszcze nie istnieje polecenie `touch` utworzy nowy plik.  
    Aby zapobiec temu stosujemy opcje `-c`:  
    `touch -c nazwa_pliku` - polecenie to nie utworzy pliku o nazwie nazwa_pliku, w przypadku gdy ten  
    nie istnieje
    ```
      patryk@heaven31415:~/mydir$ ls -l
      drwxrwxr-x 2 patryk patryk 4096 Oct 13 12:58 newdir
      patryk@heaven31415:~/mydir$ touch -c newdir/
      patryk@heaven31415:~/mydir$ ls -l
      drwxrwxr-x 2 patryk patryk 4096 Oct 13 13:00 newdir
    ```
    
9. Kopiowanie Plików i katalogów  
    * Kopiowanie plików i katalogów odbywa się za pomocą polecenia `cp`. Ogólnie składnia tego polecenia  
    określa element który zamierzamy skopiować, oraz miejsce w którym ma się znaleźć kopiowany element  
    `cp plik1 katalog1` - Skopiujemy plik o nazwie `plik1` do katalogu o nazwie `katalog1`.   
    Jeżeli nie podamy nazwy pliku w katalogu docelowym plik zachowa swoją nazwe. 
    ```
      patryk@heaven31415:~/mydir$ ls
      newdir  plik1
      patryk@heaven31415:~/mydir$ ls newdir/
      patryk@heaven31415:~/mydir$ cp plik1 newdir/
      patryk@heaven31415:~/mydir$ ls newdir/
      plik1
    ``` 
    * Natomiast jeśli zrobimy `cp plik1 katalog1/plik2` - skopiowany plik będzie miał nazwe plik2  
    ```
      patryk@heaven31415:~/mydir$ ls
      newdir  plik1
      patryk@heaven31415:~/mydir$ ls newdir/
      patryk@heaven31415:~/mydir$ cp plik1 newdir/plik2
      patryk@heaven31415:~/mydir$ ls newdir/
      plik2
    ```
    * Jeżeli kopiujemy element do jakiejś lokalizacji i tam już znajduję się element o takiej samej nazwie  
    to stary element zostanie nadpisany.   
    Jeżeli jednak użyjemy opcji `-b` plik istniejący w danej lokalizacji zostanie zapisany jako kopia  
    zapasowa.
    * `-i`, `--interactive` - Jeżeli w katalogu do którego kopiujemy element występuje element o  
    identycznej nazwie to system zapyta czy chcemy go nadpisać.
    * Więcej informacji: <https://en.wikipedia.org/wiki/Cp_(Unix)>
    
10. Przenoszenie plików i katalogów oraz zmiana ich nazwy
    * Przenieszenie elementów oraz zmiana ich nazwy realizowana jest za pomoca polecenia `mv`
    * Aby zmienić nazwe elementu: `mv obecna_nazwa nowa_nazwa`
    ```
      patryk@heaven31415:~/mydir$ ls
      newdir  plik1
      patryk@heaven31415:~/mydir$ mv plik1 plik2
      patryk@heaven31415:~/mydir$ ls
      newdir  plik2
    ```
    * Podczas przenoszenie elementu różnica polega na tym że drugi argument to ścieżka względna lub  
    bezwzględna do której chcemy przenieść element. Ta ścieżka musi istnieć w systemie, jeśli będzie  
    inaczej to poprostu zmienimy nazwe elementu
    ```
      patryk@heaven31415:~/mydir$ ls
      newdir  newdir2
      patryk@heaven31415:~/mydir$ mv newdir newdir2
      patryk@heaven31415:~/mydir$ ls
      newdir2
      patryk@heaven31415:~/mydir$ ls newdir2/
      newdir
    ```
    * Jeżeli przenosimy plik do katalogu, w którym istenieje już plik o tej samej nazwie, ten drugi  
    zostanie nadpisany. Aby tego uniknąć możemy użyć opcji `-b`. Jeżeli ww. sytuacja wystąpi to  
    zostanie utworzona kopia istniejącego już pliku a jego oryginał zostanie nadpisany przez przenoszony plik
    * `-i`, `--interactive` - Jeżeli w katalogu do którego kopiujemy element występuje element o  
        identycznej nazwie to system zapyta czy chcemy go nadpisać.
    * Więcej informacji: https://en.wikipedia.org/wiki/Mv

11. Nadawanie praw dostępu do plików i katalogów
    * Prawa dostępu nadajemy za pomocą `chmod` 