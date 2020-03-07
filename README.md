### Pokaż najbliższe 10 zdarzeń z kalendarza

* <b>localhost:8080/show</b>

### Dodaj zdarzenie do kalendarza:

* <b>localhost:8080/add</b>

W razie gdyby po wprowadzeniu zmian w plikach API przestałoby nagle działać, 
albo zaczęło zwracać błędy pokroju 500, 401, 405 to należy usunąć stare tokeny
 (trzeba znaleźć gdzie jest zainstalowany Tomcat i w nim w <b>/bin</b> skasować folder <b>tokens</b> ).
 
 A potem wyczyścić i przekompilować projekt, wciskasz dwa razy CTRL w IntelliJ i wpisujesz:
 * <b>mvn clean package</b> 
 
 I potem normalnie odpalić, rozwiązuje to z reguły większość problemów :)
