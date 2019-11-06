echo "Script started. My Proces PID: $$"
echo "Aby wysłać sygnał do procesu wykonaj w nowym oknie terminalu następujące polecenia:"
echo "Aby przetestować SIGHUP:  kill -1 $$"
echo "Aby przetestować SIGINT:  kill -2 $$"
echo "Aby przetestować SIGQUIT: kill -3 $$"
echo "Aby przetestować SIGFPE:  kill -8 $$"
echo "Aby przetestować SIGKILL: kill -9 $$ (Ten sygnał zabije proces, pomimo instrukcji trap)"


while true ;
do 
    # Handlery sygnałów
    trap 'echo "SIGHUP mnie nie zabije"' SIGHUP
    trap 'echo "SIGINT mnie nie zabije"' SIGINT
    trap 'echo "SIGQUIT mnie nie zabije"' SIGQUIT
    trap 'echo "SIGFPE  mnie nie zabije"' SIGFPE
    trap 'echo "SIGKILL mnie nie zabije"' SIGKILL # ten handler nic nie daje, SIGKILL zawsze zabije proces

    # Wypisywanie obecnej daty i godziny co podany czas
    date 
    sleep 5
done

# Dodatkowe informacje: https://en.wikipedia.org/wiki/Signal_(IPC)