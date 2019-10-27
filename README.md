# Unix cheatsheet #

## Ogólne ##
* Należy pamiętać, że rejestr liter użytych przy pisaniu polecenia ma znaczenie: `pwd` - to aktualna ściężka, pod którą pracujemy i jest czymś innym niż polecenie `PWD`.
* Gotowość do wykonywania poleceń jest sygnalizowana przez powłokę wyświetleniem ciągu znaków o zwyczajowej nazwie prompt.  
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
  * Symbol potoku `|` - pozwala przekazywać rezultat jakiegoś polecenia np. do more lub less
  * Symbol asterisk `*` - dopasowuję zero lub więcej znaków
  * Symbol question mark `?` - dopasowuje tylko jeden dowolny znak
* Długość polecenia nie jest ograniczona, terminal linię wykraczającą poza prawy margines ekranu „przełamie”, ale można  też przerwać pisanie polecenia w dowolnym momencie za pomocą znaku backward slash `\ ` i naciskając klawisz Enter. System uzna, że polecenie będzie kontynuowane w kolejnej linii i wstrzyma się z jego wykonaniem do chwili skompletowania całości, a zamiast prompta na początku nowej linii zostanie wyświetlony znak `>`
* Uzyskiwanie pomocy (manual pages)  
  Dostęp do dokumentacji możliwy jest dzięki przeglądarce interaktywnej, którą uruchamia się poleceniem: `man nazwa_polecenia`  
* Pomoc systemowa wyświetlana jest za pomocą przeglądarki `more`, którą obsługuje się za pomocą następujących poleceń klawiszowych:
  * `spacja` - Przejście do następnej strony
  * &darr; - Przejście jedną linijke niżej
  * `ctrl+b` - Przejście do poprzedniej strony
  * &uarr; - Przejście jedną linijke wyżej
  * `q` - Opuszczenie przeglądarki
* Wyszukiwanie stron pomocy systemowej jest możliwe dzięki programom `apropos` oraz `whatis`, które wyszukują podanych słów w pomocy systemowej, np.: `apropos passwd`, `whatis passwd`
* Ścieżka względna - to ścieżka rozpoczynająca się w naszym aktualnym katalogu roboczym 
  * W przypadku pracy w terminalu jest to ścieżka w promptcie
  * W przypadku uruchamiania skryptu jest to ściężka w której znajduję się skrypt
* Ścieżka bezwględna - to ścieżka rozpoczynająca się od naszego katalogu domowego `~`, lub katalogu głównego `/`
* Switche mogą być łączone ze sobą w dowolnej kolejności: `ls -l -a` == `ls -a -l` == `ls -la` == `ls -al`
* **Aby uruchomić nowy proces z poziomu terminala oraz niedopuścić do sytuacji zamrożenia okna terminala na czas pracy nowego procesu musimy dodać znak ampersand `&` na koniec komendy. Np. `gedit plik.txt &`**
* Spis komend Unixowych - https://en.wikipedia.org/wiki/List_of_Unix_commands
  
## Skróty klawiszowe ##
* &uarr; &darr; - przywołanie poprzedniego/następnego polecenia z historii poleceń  
* `Tab` aktywowanie „podpowiadacza” nazw plików. Uzupełnia wpisywane polecenie, jeśli da się je zresolvować na podstawie wpisanego ciągu znaków. Jeśli się nie da, to drugie wciśniecie przycisku `Tab` spowoduje wyświetlenie nazw plików pasujących do ciągu znaków, który wpisaliśmy.
* `ctrl+z` - Przerzucenie bieżącego procesu na drugi plan
* `ctrl+l` - Wyczyszczenie okna terminala
* `ctrl+c` - Przerwanie bieżącego procesu
* `ctrl+d` - Wysłanie znaku końca pliku (EOF) do bieżącego procesu. wysłanie tej kombinacji do powłoki systemowej wywołuje efekt natychmiastowego wylogowania się z systemu
* `ctrl+alt+t` - Uruchamia terminal
* `ctrl+u` - Kasuje wszystkie znaki znajdujące się przed kursorem w terminalu
* `ctrl+k` - Kasuje wszystkie znaki znajdujące się za kursorem w terminalu
* `ctrl+r` - Interaktywna wyszukiwarka uprzednio wprowadzonych poleceń
* `ctrl+shift+c` -Kopiuj w terminalu
* `ctrl+shift+v` - Wklej w terminalu

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
- W Linuxie inaczej niż w Windows, nie jest wymagane stosowanie w nazwach plików rozszerzeń, określających jaki program powinien zostać użyty do otwarcia pliku. Zawartość pliku i program jaki nalezy użyć do otwarcia linux określa na podstawie nagłówka `MIME` pliku.  
- W nazwach plików lepiej nie stosować znaku spacji. (utrudnia to wykonywanie polecań)
- Znak kropki `.` nie powinien rozpoczynać nazwy pliku (na linuxie znak kropki na początku nazwy pliku oznacza pliki ukryte)
 
1. Poruszanie się po katalogach  
    * `cd nowy_katalog` (change directory) - zmień katalog roboczy na nowy_katalog  
    * Komenda `cd` bez argumentu przeniesie nas do naszego katalogu domowego.
    * Więcej informacji: <https://en.wikipedia.org/wiki/Cd_(command)>
    
2. Wyświetlanie informacji o zawartości katalogu
    * `ls` - wyświetla(listuję) tylko nazwy wszystkich plików i katalogów w katalogu bieżącym
    * Najważniejsze switche:  
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
          * Zapis pierwszej kolumny (`-rw-rw-r--`) składa się z czterech elementów. Pierwsza litera zawsze określa typ elementu.  
          Symbole oznaczające typy elementów:
            * `-` - Zwykły plik
            * `b` - Specjalny plik blokowy
            * `c` - Specjalny plik znakowy
            * `d` - Katalog
            * `l` - Dowiząnie symboliczne
            * `s` - Gniazdo  
            A więc rozpatrywany obiekt jest zwykłym plikiem. bo zaczyna się od `-`
        * Interpretacja praw dostępu
          * Prawa dostępu określne są przez literki `r`, `w`, `x`, następujące po literze definiującej typ elementu
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
      * `-d */` - Powoduje wypisanie tylko katalogów
      * Wyszukiwanie przy pomocy wzorca:
        * `ls p*` - Wyszukaj wszystkie pliki które zaczynają się na litere `p`
        * `ls --ignore='p*'` - Wyszukaj wszystkie pliki które NIE zaczynają się na litere `p`
    * Więcej informacji: https://en.wikipedia.org/wiki/Ls
    
3. Tworzenie katalogów
    * Polecenie `mkdir nazwa_katalogu` (make directory) - służy do utworzenia nowego katalogu jako parametr podajemy nazwe katalogu który ma zostać utworzony.
      ```
      patryk@heaven31415:~/mydir$ mkdir newdir
      patryk@heaven31415:~/mydir$ ls -l
      drwxrwxr-x 2 patryk patryk 4096 Oct 13 12:58 newdir
      ```
    * `-p` służy do tworzenia drzewa katalogów np. `mkdir -p a/b` utworzy katalog `a` jeśli ten nie istnieje, następnie wewnątrz `a` utworzy katalog `b` jeśli ten nie istnieje 
    * `-m` pozwala nadać prawa dostępu do katalogu np. `mkdir -m 111 katalog` utworzy katalog o prawach dostępu `--x--x--x`
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
    * `-f`, `--force` - Powoduje usuwanie plików bez pytania o potwierdzenie i bez zgłaszania błędów w przypadku gdy nie może usunąć elementu
    
7. Wyświetlanie zawartości pliku
    * Możemy to zrealizować przy pomocy polecenia `cat` (concatenate)
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
    * Polecenie `echo 2 > plik2` nadpisuje zawartość `plik2`, czyli zawartość plik2 zostanie zastąpiona przez to co wyślemy przy pomocy echo
    * Aby dopisać informacje do pliku, na jego koniec, zamiast je podmieniać musimy użyć operatora `>>` np. `echo "This text will be added to the end of the file" >> file`
    * Więcej informacji: <https://en.wikipedia.org/wiki/Cat_(Unix)>
    
8. Zmiana dat modyfikacji elementów i dostępu do nich  
    * Zmiane tych zawartości umożliwia polecenie `touch` 
    * Jeżeli podamy nazwe pliku, który jeszcze nie istnieje polecenie `touch` utworzy nowy plik. Aby zapobiec temu stosujemy opcje `-c`: `touch -c nazwa_pliku` - polecenie to nie utworzy pliku o nazwie nazwa_pliku, w przypadku gdy ten  nie istnieje
      ```
      patryk@heaven31415:~/mydir$ ls -l
      drwxrwxr-x 2 patryk patryk 4096 Oct 13 12:58 newdir
      patryk@heaven31415:~/mydir$ touch -c newdir/
      patryk@heaven31415:~/mydir$ ls -l
      drwxrwxr-x 2 patryk patryk 4096 Oct 13 13:00 newdir
      ```
    
9. Kopiowanie Plików i katalogów  
    * Kopiowanie plików i katalogów odbywa się za pomocą polecenia `cp`. Ogólnie składnia tego polecenia określa element, który zamierzamy skopiować, oraz miejsce w którym ma się znaleźć kopiowany element: `cp plik1 katalog1` - Skopiujemy plik o nazwie `plik1` do katalogu o nazwie `katalog1`. Jeżeli nie podamy nazwy pliku w katalogu docelowym plik zachowa swoją nazwe.
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
    * Jeżeli kopiujemy element do jakiejś lokalizacji i tam już znajduję się element o takiej samej nazwie to stary element zostanie nadpisany. Jeżeli jednak użyjemy opcji `-b` plik istniejący w danej lokalizacji zostanie zapisany jako kopia zapasowa.
    * `-i`, `--interactive` - Jeżeli w katalogu do którego kopiujemy element występuje element o identycznej nazwie to system zapyta czy chcemy go nadpisać.
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
    * Podczas przenoszenie elementu różnica polega na tym że drugi argument to ścieżka względna lub bezwzględna, do której chcemy przenieść element. Ta ścieżka musi istnieć w systemie, jeśli będzie inaczej to poprostu zmienimy nazwe elementu
      ```
      patryk@heaven31415:~/mydir$ ls
      newdir  newdir2
      patryk@heaven31415:~/mydir$ mv newdir newdir2
      patryk@heaven31415:~/mydir$ ls
      newdir2
      patryk@heaven31415:~/mydir$ ls newdir2/
      newdir
      ```
    * Jeżeli przenosimy plik do katalogu, w którym istenieje już plik o tej samej nazwie, ten drugi zostanie nadpisany. Aby tego uniknąć możemy użyć opcji `-b`. Jeżeli ww. sytuacja wystąpi to zostanie utworzona kopia istniejącego już pliku, a jego oryginał zostanie nadpisany przez przenoszony plik.
    * `-i`, `--interactive` - Jeżeli w katalogu do którego kopiujemy element występuje element o identycznej nazwie to system zapyta czy chcemy go nadpisać.
    * Więcej informacji: https://en.wikipedia.org/wiki/Mv

11. Nadawanie praw dostępu do plików i katalogów, po ich utworzeniu
    * Prawa dostępu nadajemy za pomocą `chmod` (change mode)
    * `chmod 777 nazwa_pliku_lub_katalogu`
    * liczby `744` oznaczają odpowiednie litery `r`, `w`, `x`, 
      * 4 - `r`
      * 2 - `w`
      * 1 - `x`
      * Znaczenie każdej z cyfr w `744`
      * Pierwsza cyfra - 7 - to prawa właściciela
      * Druga cyfra - 4 - to prawa grupy przypisanej do elementu
      * Trzecia cyfra - 4 - to prawa pozostałych użytkowników systemu 
    * Prawa można także nadawać w inny sposób np.:
      * `chmod +x plik` - nada prawo wykonywania/wejścia do katalogu dla właściciela(user), przypisanej grupy(group) oraz innych użytkowników(other)
      * `chmod u-x plik` - zabierze prawo wykonywania/wejścia do katalogu dla właściciela
      * `chmod g-x plik` - zabierze prawo wykonywania/wejścia do katalogu dla przypisanej grupy
      * `chmod o-x plik` - zabierze prawo wykonywania/wejścia do katalogu dla innych użytkowników
    * Więcej informacji: https://en.wikipedia.org/wiki/Chmod

12. Zmiana właściciela pliku oraz grupy
    * Aby zmienić właściciela pliku oraz grupe należy użyć polecenia `sudo chown -R new-owner-user-name:new-group-name /path/to/file`. (-R - recursive, czyli zmienia właściciela i grupe rekurencyjnie dla wszystkich plików znajdujących się w ścieżce która podaliśmy)
    
13. Wyszukiwanie plików i katalogów
    * Zastosowanie polecenia `find` pozwala znaleźć  pliki i katalogi na dysku. Jako parametr podajemy ścieżkę, w której system ma szukać elementów, i opcje jakie ten element ma posiadać.  
    * `-name 'wzorzec'` - Wyszukuje pliki których nazwa pasuje do wzorca
      ```
      patryk@heaven31415:~/mydir$ ls
      newdir  plik1
      patryk@heaven31415:~/mydir$ ls newdir/
      plik2  plik3
      patryk@heaven31415:~/mydir$ find ./ -name 'p*'
      ./plik1
      ```
    * `-regex 'wzorzec'` - Wyszukuje pliki których nazwa pasuje do wzorca zapisanego zgodnie z semantyką wyrażeń regularnych
      ```
      patryk@dell:~/Documents/test$ ls 
      plik  skrypt
      patryk@dell:~/Documents/test$ find ./ -regex '^./p[a-z]+$'
      ./plik
      ```
    * `-maxdepth` - pozwala zdefiniować głębokość szukania
      ```
      patryk@heaven31415:~/mydir$ ls
      newdir  plik1
      patryk@heaven31415:~/mydir$ ls newdir/
      plik2  plik3
      patryk@heaven31415:~/mydir$ find ./ -maxdepth 1 -name "p*"
      ./plik1
      patryk@heaven31415:~/mydir$ find ./ -maxdepth 2 -name "p*"
      ./newdir/plik2
      ./newdir/plik3
      ./plik1
      ```
    * Znajdź jednym poleceniem wszystkie pliki o rozmiarze 1kB w folderze /etc, utworzone w ciągu ostatnich 3 dni oraz pliki większe niż 250kB utworzone w przedziale czasu więcej niż miesiąc temu i mniej niż trzy miesiące temu:
      * Najpierw znajdźmy wszystkie pliki w folderze /etc. 
        * `find /etc`
      * Pliki w folderze /etc, o rozmiarze 1KB:
        * użyjemy do tego `-size n` - gdzie n to rozmiar bloku pamięci o 512 bajtach 
        * `find /etc -size 2`
      * Pliki w folderze /etc, o zmodyfikowane w ciągu ostatnich 3 dni
        * użyjemy `-mtime n` - gdzie n to ilość dni (istnieje też`-mmin n` - gdzie n to ilośc minut)
        * `find /etc -mtime -3`
       * Pliki w folderze /etc o rozmiarze mniejszym niż 1KB i zmodyfikowane w ciągu trzech ostatnich dni
        * `find /etc -size -2 -mtime -3`
      * Pliki w folderze /etc o rozmiarze mniejszym niż 1KB zmodyfikowane w ciągu ostatnich 3 dni lub pliki większe niż 250kB
        * switch `-o` oznacza logiczny operator OR
        * switch `-a` oznacza logiczny operator AND
        * `find /etc -size -2 -o -size +500 -a -mtime -3`
      * Ostatecznie przechodzimy do finalnego polecenia, w dodatku pogrupujemy kategorie wyszukiwania w nawiasy
        * `find /etc \( -size -2 -a -mtime -3 \) -o \( -size +500 -a \( -mtime +30 -o -mtime -90 \) \)`
    * Na rezultacie programu find możemy wykonać inne polecenia przy pomocy switcha `-exec`. polecenie musi kończyć się `\;` oraz można użyć `{}` jako symbolu zastępczego dla każdego pliku, który zostanie zlokalizowany przez wywołanie `find`. 
    * Przykład `-exec ls -l \;`
      ```
      patryk@dell:~/Documents/code/SCR-OS1 [master]$ date
      Wed 23 Oct 19:19:14 CEST 2019
      patryk@dell:~/Documents/code/SCR-OS1 [master]$ find ./ -maxdepth 1 -mmin -20 -o -mtime +15
      ./README.md
      ./lab2
      patryk@dell:~/Documents/code/SCR-OS1 [master]$ find ./ -maxdepth 1 -mmin -20 -o -mtime +15 -exec ls -l  \;
      total 28
      drwxr-xr-x 2 patryk patryk  4096 Oct  3 20:11 lab2
      -rw-r--r-- 1 patryk patryk 23909 Oct 23 19:12 README.md
      ```  
    * Tak więc aby uzyskać szczegółowe informacje na temat wyszukanych plikow możemy użyc polecenia  
    `find /etc \( -size -2 -a -mtime -3 \) -o \( -size +500 -a \( -mtime +30 -o -mtime -90 \) \) -exec ls -l \;`
    * Więcej informacji: <https://en.wikipedia.org/wiki/Find_(Unix)>
    
14. Archwizacja danych
    * Dane możemy archiwizować przy pomocy polecenia `tar`. Archiwizowanie czyli łączenie wielu plików w jedno archiwum w celu ich łatwiejszej dystrybucji.
    * Tworzenie archiwum:
      * dodawanie kilku plików do archiwum:
        * `tar -cvf my-files.tar file1 file2`
      * Dodawanie folderu do archiwum:
        * `tar -cvf my-files.tar /path/to/my/directory`
    * Tworzenie skompresowanego archiwum:
      * switch `-z` używa programu `gzip` do kompresji
      * dodawanie kilku plików do archiwum oraz ich kompresja:
        * `tar -cvzf my-files.tar.gz file1 file2`
      * dodawanie folderu do archiwum oraz kompresja:
        * `tar -cvzf my-files.tar.gz /path/to/my/directory`
    * Dearchiwizacja danych:
      * Na nieskompresowanym archiwum:
        * `tar -xvf my-files.tar`
      * Na skompresowanym archiwum:
        * `tar -xvzf my-files.tar.gz`
    
15. Ustalanie ile miejsca zajmuje plik lub katalog
    * Służy do tego polecenie `du nazwa_elementu`
    * najlepiej użyć switchy `-h` `--human-readable` oraz `s` `--summarize` - które wyświetlą informacje o całkowitej ilości zajmowanej przez folder
      ```
      patryk@dell:~/Documents/code$ du -hs C++/
      1.2G	C++/
      ```

16. Polecenia more i less
    * Polecenia `more` i `less` są pomocne kiedy chcemy przeczytać plik lub rezultat wykonania jakiegoś polecenia nie mieści się na ekranie
    * Pomoc w obsłudze progamów możemy uzyskać klikając przycisk `h` będąc w tym programie
    * Przekazywanie wyników innego polecenia do `more` jest realizowane przy użyciu znaku potoku: `|` 
    * `ls -l /etc | more` - polecenie to przekaże swój rezultat do programu more i w nim będzie mogli go przeglądać

17. Dowiązania 
    * Dowiązanie twarde możemy utworzyć na dwa sposoby:
      * `link file1 file2` - file2 jest nazwą nowego dowiązania do zawartości file1
      * `ln file1 file2` - file2 jest nazwą nowego dowiązania do zawartości file1
      * Rezultatem takiego wywołanie jest to że plik `file2` wskazuje do miejsca na dysku, w którym znajduję się zawartość `file1`
      * Jeżeli usuniemy teraz file1 np. `rm file1` to rezultatem takiego wywołania będzie usunięcie tylko jednego wskaźnika do pliku. Plik pozostanie ciągle na dysku ponieważ istenieje do niego wskaźnik `file2`. Za pomocą file2 ciągle możemy zobaczyć dane np. `cat file2`
    * Dowiązania symboliczne to coś co przypomina skróty w Windowsie. Takie dowiązanie nie wskazuje do zawartości na dysku.
    * Dowiązanie symboliczne tworzymy za pomocą polecenia `ln -s ścieżka-do-elementu nazwa-dowiązania`
    * `ln -s file1 file2` - file2 jest nazwą nowego dowiązania symbolicznego które wskazuję na plik file1
    * Rezultatem takiego działania jest to iż kiedy usuniemy file1 `rm file1` to usuwamy faktyczny plik i nie możemy uzyskać dostępu do jego zawartości za pomocą dowiązania symbolicznego `file2`
    * Więcej informacji: https://www.computerhope.com/unix/uln.htm

    
## 2. Zarządzanie kontem ## 

1. Zmiana hasła
    * Zmianę hasła realizujemy przy pomocy polecenia `passwd`
    * Gdybyśmy byli zalogowani na koncie root'a i chcieli zmienić hasło użytkownika to wtedy: `passwd nazwa_użytkownika`
        
2. Przełączanie się na konto innego użytkownika
    * Używamy do tego polecenia `su nazwa_użytkownika` (switch user)
    * Aby zalogowac się na konto administratora: `su root`, następnie system zapyta nas o hasło 
    * Aby wylogować się z konta roota musimy wpisać `exit`
## 3. Operacje na procesach ##

1. Informacje na temat procesów:  
    * Informacje na temat obecnie działajcych procesów uzyskujemy przy pomocy komendy `ps`  
      ```
      ps
      PID  TTY          TIME CMD
      5763 pts/3    00:00:00 zsh
      8534 pts/3    00:00:00 ps
      ```  
    * Opis kolumn:
      * `PID` - Identyfikator procesu
      * `TTY` - Nazwa konsoli do której użytkownik jest zalogowany
      * `TIME` - Ilość minut i sekund czasu pracy procesora, które wykorzystał proces
      * `CMD` - Nazwa komendy która uruchomiła proces  
    * Aby wylistować wszystkie procesy używamy switcha `-e`
    * Switch `-f` pokazuje więcej informacji o procesach
    * Program `top` to program wyświetlający odświeżającą się listę procesów aktualnie działających w systemie. Dzięki niemu możemy monitorować co aktualnie dzieje się w systemie. Jaki proces zużywa najwięcej zasobów etc. więcej informacji: <https://en.wikipedia.org/wiki/Top_(software)>
 
2. Zabijanie procesów:
    * Komenda służy do wysyłania sygnału do procesu, domyślnie `SIGTERM`(terminate) lub `SIGKILL`(kill)  
      * Jeśli wyślemy `SIGTERM` proces może zakończyć prace w sposób normalny i zapisać jakieś informacje przed zamknięciem. (O ile program implementuje specjalny handler obsługujący ten sygnał)
      * Natomiast `SIGKILL` jest obsługiwany nie przez program, a jądro systemu
      * `SIGTERM` odpowiada numer 15
      * `SIGKILL` odpowiada numer 9
    * Przykłady użycia:
      * Cztery sposoby na wysłanie `SIGTERM` do procesu o ID 1234:
        ```
        kill 1234
        kill -s TERM 1234
        kill -TERM 1234
        kill -15 1234
        ```
      * Trzy sposoby na wysłanie `SIGKILL` do procesu o ID 1234:
        ```
        kill -s KILL 1234
        kill -KILL 1234
        kill -9 1234
        ```
    * Więcej informacji: <https://en.wikipedia.org/wiki/Kill_(command)>

## 4. Uzyskiwanie informacji o użytkownikach ##

1. Who
    * Komenda `who` wyświetla liste użytkowników obecnie zalogowanych do systemu
    * Jest domyślnie zainstalowany w systemie
    * Więcej informacji: <https://en.wikipedia.org/wiki/Who_(Unix)>
    
2. Finger
    * Komenda `finger` służy do wyświetlenia informacji o użytkowniku  (shell, homedir, last login time, mailbox status)
    * `finger` może zostać użyty przez internet
    * Nie jest domyślnie zainstalowany
    
3. Last
    * Komenda `last` wyświetla informacje kto i kiedy ostatnio logował się do systemu
    * Więcej informacji: <https://www.cyberciti.biz/faq/linux-unix-last-command-examples/>
     
## 5. Skrypty ##
  * Utworzenie przykładowego skryptu printującego obecną date:
    ```
    #!/bin/bash
    NOW="$(date)"
    printf "Current date and time:  %s\n" "${NOW}"
    
    NOW="$(date +'%d/%m/%Y')"
    printf "Current date in dd/mm/yyyy:  %s\n" "${NOW}"

    # This is a comment! It won't be executed 
    ```
    * Wykrzyknik poprzedzony drabinką po angielsku nazywa się shabang. (połączenie słów sharp = `#` oraz bang = `!`)
    * Pierwsza linijka określa jaki program/powłoka powinna zostać użyta do wykonania instrukcji w skrypcie
    * Następnie tworzymy zmienną NOW, do której przypisujemy rezultat wywołania programu date. **Nie może być spacji w okół znaku równości!**
    * Nazwy zmiennych mogą zawierać jedynie litery, cyfry i podkreślenia. Konwencja nazewnicza jest taka że piszemy nazwy wielkimi literami
    * Wielkość liter w nazwach zmiennych ma znaczenie, bash rozróżnia wielkość liter w nazwach zmiennych
    * komenda printf należy do wbudowanych komend powłoki. możemy to sprawdzić przy pomocy polecenia `type printf`
  * Następnie nadajemy prawo do wykonania skryptu przy pomocy `chmod +x nazwa_skryptu`
  * Następnie uruchamiamy skrypt `./nazwa_skryptu`
  * Output:
    ```
    Current date and time:  Mon 14 Oct 14:06:44 CEST 2019
    Current date in dd/mm/yyyy:  14/10/2019
    ```
  * Utworzenie skryptu z instrukcją warunkową:
    ```
    #!/bin/bash

    # Determine whether the user executing this script is the root user or not.

    # Display user UID (UID - is the be built in bash variable)
    echo "Your UID is ${UID}."

    # Display if the user is root or not.
    # -eq means equals
    # spaces in forthcoming if statment are greatly important!
    # double bracket syntax is a new syntax it's better to use [[ ]]
    if [[ "${UID}" -eq 0 ]]
    then
      echo "You are root."
    else
      echo "You are not root."
    fi
    ```
    * Aby przetestować działanie skryptu jako root możemy wykonać następujące polecenie: `sudo ./example-script.sh` a następnie wpisać hasło root'a. (sudo - super user do)
  
## 6. Podstawy obsługi Vim'a ##
  * Kiedy uruchomimy Vim'a znajdujemy się w domyślnym trybie, który służy do poruszania się po pliku i wykonywania różnych operacji. Aby przejść do trybu pisania musimy kliknąć literkę `i`, aby opuścić tryb pisania naciskamy `esc`.
  * W trybie domyślnym możemy poruszać się za pomocą strzałek lub klawiszy `h`, `j`, `k`, `l`
  * Aby opuścić edytor musimy być w trybie domyślnym oraz wpisać `:q` spowoduje to wyjście bez zapisania pliku. Polecenie `:wq` (kolejnośc literek ma znaczenie!) spowoduje wyjście i zapisanie pliku, natomiast jeśli chcemy wyjść z pliku i niezapisywać wprowadzonych zmian musimy użyć `:q!` (tutaj też kolejność ważne)
  * Kopiuj, wytnij, wklej w vimie:
    * Aby zaznaczyć obszar który chcemy skopiować lub wyciać w trybie domyślnym musimy nacisnąć klawisz `v`, spowoduje to uruchomienie trybu pozwalającego zaznaczyć dowolny obszar pliku.
    * aby skopiować zaznaczony obszar `y`
    * aby wyciąć zaznaczony obszar `d`
    * aby wkleić to za kursorem naciskamy `p`
    * aby wkleić to przed kursorem naciskamy `P` (wielka literka)
    * aby zaniechać zaznaczania poprostu `esc` dwukrotnie
    
## 7. Podstawy SSH ##
  * SSH - Secure Shell jest protokołem komunikacyjnym służącym do bezpiecznej komunikacji z innymi komputerami przez internet. Za pomocą SSH możemy zalogować się do innego komputera przez internet i wykonywać na nim różne operacje instalować programy, używać programów znajdujących się na tym komputerze, zarządzać systemem plików etc. Wszystkie te operacje są szyfrowane.
  * Aby można było połączyć się do jakiegoś komputera za pomocą SSH, na kompuerze musi działać SSHD (Open SSH Daemon), który nasłuchuje połączeń SSH.
  * Aby połączyć się z serwerem można użyć kilku opcji autoryzacji naszej tożsamości:
    * Hasło - W tym przypadku po udanej próbie nawiązania połączenia po wykonnania takiego polecenia w konsoli: `ssh user-name@host-name-or-IP-adress` zostaniemy poproszeni o podanie hasła użytkownika `user-name`
    * Klucz publiczny / Klucz prywatny - Pozwala logować się na serwer bez konieczności wpisywania hasła. Jest to bezpieczniejsza metoda łączenia się z serwerem, ponieważ hasła są narażone na złamanie np. brute-force attack
      * Aby wygenerować zestaw kluczy musimy użyć komendy `ssh-keygen` (Tą operacje wykonujemy w naszym clientcie za pomocą którego chcemy łączyć się z serwerem) - Po wywołaniu tego polecenia, terminal zapyta nas czy chcemy utworzyć klucze pod domyślną ściężką `~/.ssh/id_rsa.pub` oraz `~/.ssh/id_rsa`. Dobrą praktyką jest aby generować osobne klucze dla osobnych usług oraz nadać im odpowiednią nazwę. np. Kiedy zostaniemy zapytani o nazwe klucza podajemy: `Users/patryk/.ssh/id_rsa_github`. Następnie musimy dodać nasz klucz prywatny za pomocą polecenia `ssh-add ~/.ssh/id_rsa_github`.
      * Na serwerze będzie folder `.ssh` w którym będzie plik `authorized_keys` (jeśli ich nie będzie to musimy stworzyć samodzielnie)  do którego musimy dodać nasz klucz publiczny. W ten sposób kiedy będziemy łączyć się z serwerem, będziemy wysyłać nasz klucz publiczny, a serwer będzie potrafił go rozpoznać i automatycznie nas zaloguje.
    * Na podstawie hosta - Na serwerze znajduję się plik konfiguracyjny, w którym znajdują się nazwy hostów lub ich adresy IP, które są upoważnione do połączenia z tym serwerem.
  * Aby zakończyć połączenie ze zdalnym serwerem wpisujemy `exit`
  * SCP - Secure File Copy - Program który służy do kopiowania plików z serwera lub na serwer za pomocą protokołu SSH
    * Przykładowe użycie, kopiowanie z clienta na serwer: `scp ~/test.txt user-name@host-name-or-IP:~` - Polecenie to skopiuje plik test.txt na serwer do katalogu domowego