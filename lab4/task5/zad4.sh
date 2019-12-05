#!/bin/bash

while true ;
do 
    echo "$$"
    date 
    sleep 1
done

# kill pid - domyślnie wysyła SIGTERM

# 1- zabija proces (hangup)
# 2- SIGINT zabicie z klawiatury (sygnał przerwania) ctrl+c
# 3- SIGQUIT zabicie z klawiatury (sygnał wyjścia) ctrl+d
# 4- zabicie proces oraz dump core (illegal instruction)
# 5- zabicie procesu oraz dump core (trace trap)
# 6- zabicie procesu oraz dump core (abort signal)
# 7- zabicie proces oraz dump core (bus error)
# 8- zabicie procesu oraz dump core (floating point exception)
# 9- zabicie procesu (kill)
# 10- sygnał użytkownika, system nie powinien wysyłać tego sygnalu do innych procesów (domyślnie zabija proces)
# 11- zabicie procesu i dump core (invalid memory referance)
# 12- sygnał użytkownika 2, (domyślnie zabija proces)
# 13- zabicie procesu (broken pipe)
# 14- zabicie procesu (timer signal)
# 15- zabicie procesu (termination signal)