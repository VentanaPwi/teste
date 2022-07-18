@echo off
cls
@echo *************************************
@echo *Mapeamento de impressoras para LPT1*
@echo *************************************
set /p srv="Digite o nome do servidor / maquina: "
set /p com="Digite o nome do compartilhamento: "
@echo on
net use lpt1 \\%srv%\%com% /persistent:yes
@echo off
pause