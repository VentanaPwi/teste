LOCAL lcPATHATUAL AS String 
STORE '' TO lcPATHATUAL  

* OBTEM PASTA ATUAL 
lcPATHATUAL = ADDBS(UPPER(ALLTRIM(FULLPATH(CURDIR()))))

* CASO PROGRAMADOR INICIE PRG FORA DO G:\ TRATA-SE DE CLIENTE SVN E DEVE SER FEITO UPDATE
IF JUSTDRIVE(lcPATHATUAL) <> 'G'
	LOCAL			llSCAN AS Boolean
	STORE .T. TO	llSCAN

	LOCAL loLOCATOR AS 'WBEMScripting.SWBEMLocator'
	LOCAL loWS AS 'WScript.Shell'
	LOCAL loPROC
	LOCAL loWMI

	* CRIA OBJETOS SHELL 
	loWS		= CREATEOBJECT('WScript.Shell')
	loLOCATOR	= CREATEOBJECT('WBEMScripting.SWBEMLocator')

	loWS.Run('"c:\Program Files\TortoiseSVN\bin\TortoiseProc.exe" /command:commit /path:"' + lcPATHATUAL + '" /closeonend:0')

	* MENSAGEM DE ESPERA
	WAIT WIND 'SVN : Atualizando fontes...' + CHR(13) + CHR(10) + 'quando terminar, tecle ESC para fechar o SVN.' NOWAIT

	DO WHILE llSCAN
		loWMI		= loLOCATOR.ConnectServer()
		loWMI.Security_.ImpersonationLevel = 3
		loPROC		= loWMI.ExecQuery("SELECT * FROM WIN32_PROCESS WHERE NAME = 'TortoiseProc.exe'")
		
		IF EMPTY(loPROC.Count)
			llSCAN = .F.
		ENDIF
		
		RELEASE poWMI
	ENDDO

	WAIT CLEAR
ENDIF 

* STARTA MENURAIZ, SE FOR PASTA DO VOLPE
WAIT CLEAR
RELEASE laDIR
LOCAL lnVOLPE AS INTERGER
lnVOLPE = ADIR(laDIR,'stob','D')
RELEASE laDIR

