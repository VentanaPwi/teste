* OPENFOLDER.PRG
************************************************************************************************
LPARAMETERS tcPASTA
	IF TYPE('tcPASTA')<>'C'
		tcPASTA = FULLPATH(CURDIR())
	ENDIF

	DECLARE LONG ShellExecute IN "shell32.dll" ;
	LONG HWND, STRING lpszOp, STRING lpszFile, STRING lpszParams, STRING lpszDir, LONG nShowCmd
		
	SHELLEXECUTE( 0, 'Open', tcPASTA, 0, 0, 1)
RETURN
