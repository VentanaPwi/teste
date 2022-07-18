LOCAL lcCAMINHO AS STRING
STORE '' to lcCAMINHO

lcCAMINHO = ADDBS(UPPER(ALLTRIM(FULLPATH(CURDIR()))))

LOCAL			llSCAN AS Boolean
STORE .T. TO	llSCAN

LOCAL loLOCATOR AS 'WBEMScripting.SWBEMLocator'
LOCAL loWS AS 'WScript.Shell'
LOCAL loPROC
LOCAL loWMI

loWS		= CREATEOBJECT('WScript.Shell')
loLOCATOR	= CREATEOBJECT('WBEMScripting.SWBEMLocator')

loWS.Run('"c:\Program Files\TortoiseSVN\bin\TortoiseProc.exe" /command:commit /path:"'+lcCAMINHO+'" /closeonend:0')

WAIT WIND 'PROCESSO EM EXECUÇÃO' NOWAIT

DO WHILE llSCAN
	loWMI		= loLOCATOR.ConnectServer()
	loWMI.Security_.ImpersonationLevel = 3
	loPROC		= loWMI.ExecQuery("SELECT * FROM WIN32_PROCESS WHERE NAME = 'TortoiseProc.exe'")
	
	IF EMPTY(loPROC.Count)
		llSCAN = .F.
	ENDIF
	
	RELEASE loWMI
ENDDO

WAIT CLEAR