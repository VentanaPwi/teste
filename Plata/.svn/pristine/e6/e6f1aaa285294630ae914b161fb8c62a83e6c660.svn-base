* FUNCOES PARA COMPARAR FORMS USANDO SVNMERGE, BeyondCompare

FUNC MAKECOMPAREFILE
********************
	lparameters tcFile AS String, toFORM AS FORM, tnORDEM AS Integer

	local lcRetVal, CRLF, lcPrg, lcNBewPrg, lcName, lcUniqueID, ;
	      lcObjName, lcParseID, lcTempP, lcProperties, lcTempM, lcMethods

	close databases all
	lcRetVal = ""
	CRLF     = chr(13) + chr(10)
	lcPRG    = ""
	lcRoot   = "Thing"


	if file(tcfile)
	   select 0
	   create cursor csrAlphaSections(name c(200))
	   select 0
	   use (tcFile) alias csrFile
	   
	   if not upper(dbf("csrFile")) == upper(tcFile)
	      messagebox("Compare doesn't seem to be finding the right file. You specified:" + chr(13) + ;
	                 tcFile + " and FoxCompare can only find: " + chr(13) + dbf("csrFile"), 64, "Message:")
	   endif
	   
	   *   Class.Thing.Thing

	   scan
	      if recno() = 1
	         do case
	            case upper(alltrim(Platform)) == "COMMENT" and upper(alltrim(UniqueID)) == "SCREEN"
	                 lcRoot = "Form"
	            case upper(alltrim(Platform)) == "COMMENT" and upper(alltrim(UniqueID)) == "CLASS"
	                 lcRoot = "ClassLib"
	         endcase
	      endif
	      if recno() = 1 or upper(alltrim(Platform)) == "WINDOWS"
	         lcUniqueID   = alltrim(uniqueid)
	         lcParent     = alltrim(parent)
	         lcObjName    = alltrim(ObjName)
	         
	         lcFQName     = lcRoot + iif(empty(lcParent), "", "." + lcParent) + iif(empty(lcObjName), "", "." + lcObjName)
	         lcParseID    = padr(lcFQName + "~" + lcUniqueID, 200, "_")
	         insert into csrAlphaSections (name) values (lcParseID)

	         select csrFile
	         lcProperties = CleanString(csrFile.Properties)
	         lcTempP      = Alphabetize(lcProperties, "Properties", "")
	         lcProperties = MTag(lcFQName + " Properties", CRLF + lcTempP)
	         lcMethods    = CleanString(csrFile.Methods)
	         lcTempM      = Alphabetize(lcMethods, "Methods", lcObjName)
	         lcMethods    = MTag(lcFQName + " Methods",    CRLF + lcTempM)

	         if not empty(lcTempM + lcTempP)
	            lcPRG = lcPRG + MTag(lcParseID, CRLF + lcProperties + CRLF + lcMethods + CRLF) + CRLF
	         endif
	      endif
	   endscan
	   
	   lcNewPrg = ""
	   
	   select * from csrAlphaSections into cursor csrAlphaSections order by name
	   scan
	       lcName = csrAlphaSections.Name
	       lcNewPrg = lcNewPrg + ParseN(lcName, lcPrg) + CRLF
	   endscan
	   
	   use in select("csrFile")
	   lcRetVal = GetWorkingFileName(tcFile,.F., toFORM,tnORDEM)
	   CleanDestination(lcRetVal)
	   strtofile(lcNewPRG, lcRetVal)
	endif
	use in select("csrAlphaSections")
	return lcRetVal

PROC CleanDestination
	lparameters tcFile
	if file(tcFile)
	   set safety off
	   delete file (tcFile)
	   set safety on
	ENDIF
ENDPROC

FUNC ParseN
	lparameters tcTag, tcSource, tcType, tlReturnTags
	local lxRetVal
	if tlReturnTags
	   lxRetVal = PullTagSet(tcTag, tcSource)
	else
	   tcType        = iif(vartype(tcType) <> "C", "C", tcType)
	   *tnForceLength = iif(vartype(tnForceLength) <> "N", -1, tnForceLength)
	   lxRetVal      = Parse(tcTag, tcSource, tcType, tlReturnTags)
	   if isnull(lxRetVal)
	      do case
	         case tcType == "N"
	              lxRetVal = 0
	         case tcType $ "DT"
	              lxRetVal = {}
	         case tcType == "L"
	              lxRetVal = .f.
	         otherwise
	              lxRetVal = ""
	      endcase
	   endif
	endif
	return lxRetVal

FUNC pulltagset
	lparameters tcTag, tcSource, tlReturnNull
	local lcSource, lcTag, lnAt, lcRetVal

	lcTag = "<" + tcTag + ">"
	lnAt  = atc(lcTag, tcSource)

	if lnAt = 0
	   lcRetVal = iif(tlReturnNull, .null., lcTag + "</" + tcTag + ">")
	else
	   lcRetVal = substr(tcSource, lnAt)
	   lnAt     = atc("</" + tcTag + ">", lcRetVal) + len(tcTag) + 2
	   lcRetVal = left(lcRetVal, lnAt)
	endif

	return lcRetVal

FUNC parse
	&&parse a parameter out of an XML string
	lparameters tcTag, tcSource, tcType, tlReturnTags
	local lnPCount, lcTag, lnAt, lvRetVal, lcTag, lcSource
	if tlReturnTags
	   lvRetVal = this.PullTagSet(tcTag, tcSource, .t.)
	else
	   tcType    = iif(vartype(tcType) <> "C", "C", upper(tcType))
	   lcTag     = "<" + tcTag + ">"
	   lnAt      = atc(lcTag, tcSource)
	   if lnAt = 0
	      lvRetVal = .null.
	   else
	      lvRetVal = substr(tcSource, lnAt + len(lcTag))
	      lnAt     = atc("</" + tcTag + ">", lvRetVal) - 1
	      lvRetVal = left(lvRetVal, lnAt)
	      do case
	         case tcType == "N"
	              lvRetVal = val(lvRetVal)
	              if lvRetVal == int(lvRetVal)
	                 lvRetVal = int(lvRetVal)
	              endif
	         case tcType == "D"
	              lvRetVal = ttod(ctot(lvRetVal))
	         case tcType == "T"
	              lvRetVal = ctot(lvRetVal)
	         case tcType == "L"
	              lvRetVal = inlist(upper(lvRetVal), ".T.", "ON", "TRUE", "YES", "1", "T")
	      endcase
	   endif
	endif
	return lvRetVal


FUNC GetStartupInfo
	lparameters lnShowWindow
	LOCAL lnFlags
	* creates the STARTUP structure to specify main window
	* properties if a new window is created for a new process
	 
	IF EMPTY(lnShowWindow)
	  lnShowWindow = 1
	ENDIF
	 
	*| typedef struct _STARTUPINFO {
	*| DWORD cb; 4
	*| LPTSTR lpReserved; 4
	*| LPTSTR lpDesktop; 4
	*| LPTSTR lpTitle; 4
	*| DWORD dwX; 4
	*| DWORD dwY; 4
	*| DWORD dwXSize; 4
	*| DWORD dwYSize; 4
	*| DWORD dwXCountChars; 4
	*| DWORD dwYCountChars; 4
	*| DWORD dwFillAttribute; 4
	*| DWORD dwFlags; 4
	*| WORD wShowWindow; 2
	*| WORD cbReserved2; 2
	*| LPBYTE lpReserved2; 4
	*| HANDLE hStdInput; 4
	*| HANDLE hStdOutput; 4
	*| HANDLE hStdError; 4
	*| } STARTUPINFO, *LPSTARTUPINFO; total: 68 bytes
	 
	#DEFINE STARTF_USESTDHANDLES 0x0100
	#DEFINE STARTF_USESHOWWINDOW 1
	#DEFINE SW_HIDE 0
	#DEFINE SW_SHOWMAXIMIZED 3
	#DEFINE SW_SHOWNORMAL 1
	 
	lnFlags = STARTF_USESHOWWINDOW
	 
	RETURN binToChar(80) +;
	       binToChar(0) + binToChar(0) + binToChar(0) +;
	       binToChar(0) + binToChar(0) + binToChar(0) + binToChar(0) +;
		   binToChar(0) + binToChar(0) + binToChar(0) +;
		   binToChar(lnFlags) +;
		   binToWordChar(lnShowWindow) +;
		   binToWordChar(0) + binToChar(0) +;
		   binToChar(0) + binToChar(0) + binToChar(0) + replicate(chr(0),30)

FUNC binToWordChar
	lparameters lnValue
	************************************************************************
	***  Function: Creates a DWORD value from a number
	***      Pass: lnValue - VFP numeric integer (unsigned)
	***    Return: binary string
	************************************************************************
	RETURN Chr(MOD(m.lnValue,256)) + CHR(INT(m.lnValue/256))

FUNC BinToChar
	lparameters lnValue
	************************************************************************
	***  Function: Creates a DWORD value from a number
	***      Pass: lnValue - VFP numeric integer (unsigned)
	***    Return: binary string
	************************************************************************
	Local byte(4)
	If lnValue < 0
	    lnValue = lnValue + 4294967296
	EndIf
	byte(1) = lnValue % 256
	byte(2) = BitRShift(lnValue, 8) % 256
	byte(3) = BitRShift(lnValue, 16) % 256
	byte(4) = BitRShift(lnValue, 24) % 256
	RETURN Chr(byte(1))+Chr(byte(2))+Chr(byte(3))+Chr(byte(4))

FUNC CharToBin
	************************************************************************
	lparameters lcBinString, llSigned
	****************************************
	***  Function: Binary Numeric conversion routine.
	***            Converts DWORD or Unsigned Integer string
	***            to Fox numeric integer value.
	***      Pass: lcBinString -  String that contains the binary data
	***            llSigned    -  if .T. uses signed conversion
	***                           otherwise value is unsigned (DWORD)
	***    Return: Fox number
	************************************************************************
	LOCAL m.i, lnWord
	 
	lnWord = 0
	FOR m.i = 1 TO LEN(lcBinString)
	    lnWord = lnWord + (ASC(SUBSTR(lcBinString, m.i, 1)) * (2 ^ (8 * (m.i - 1))))
	ENDFOR
	 
	IF llSigned AND lnWord > 0x80000000
	  lnWord = lnWord - 1 - 0xFFFFFFFF
	ENDIF
	 
	RETURN lnWord

FUNC CREATEPROCESS
	* Stolen from Rick Strahl at west-wind.com
	lparameters lcExe, lcCommandLine, lnShowWindow, llWaitForCompletion
	LOCAL hProcess, cProcessInfo, cStartupInfo
	 
	DECLARE INTEGER CreateProcess IN kernel32 as _CreateProcess;
	    STRING   lpApplicationName,;
	    STRING   lpCommandLine,;
	    INTEGER  lpProcessAttributes,;
	    INTEGER  lpThreadAttributes,;
	    INTEGER  bInheritHandles,;
	    INTEGER  dwCreationFlags,;
	    INTEGER  lpEnvironment,;
	    STRING   lpCurrentDirectory,;
	    STRING   lpStartupInfo,;
	    STRING @ lpProcessInformation
	 
	 
	cProcessinfo = replicate(chr(0),128)
	cStartupInfo = GetStartupInfo(lnShowWindow)
	 
	if !empty(lcCommandLine)
	   lcCommandLine = ["] + lcExe + [" ]+ lcCommandLine
	else
	   lcCommandLine = ""
	endif
	 
	lnResult =  _CreateProcess(lcExe,lcCommandLine,0,0,1,0,0,;
	            sys(5)+curdir(),cStartupInfo,@cProcessInfo)
	 
	lhProcess = CharToBin(substr(cProcessInfo,1,4))
	 
	IF llWaitForCompletion
	   #DEFINE WAIT_TIMEOUT 0x00000102
	   DECLARE INTEGER WaitForSingleObject IN kernel32.DLL ;
	           INTEGER hHandle, INTEGER dwMilliseconds
	 
	   do while .T.
	       *** Update every 100 milliseconds
	       if WaitForSingleObject(lhProcess, 100) != WAIT_TIMEOUT
	          exit
	       else
	          doevents
	       endif
	   enddo
	endif
	 
	 
	DECLARE INTEGER CloseHandle IN kernel32.DLL ;
	        INTEGER hObject
	 
	CloseHandle(lhProcess)
	 
	RETURN IIF(lnResult=1,.t.,.f.)

FUNC MTag
	lparameters tcTag, txData, tcString, tlNuke
	local lcRetVal, lcData, lcTagSet, lnAt1, lnAt2, lcVarType

	txData    = iif(vartype(txData) = "O", "", txData)
	tlNuke    = iif(vartype(tlNuke) <> "L", .f., tlNuke)
	lcVarType = vartype(txData)

	do case
	   case lcVarType = "Y"
	        lcData = transform(mton(txData))
	   case lcVarType = "N" and int(txData) == txData
	        lcData = alltrim(str(txData, 20, 0)) && prevents weirdness when using transform with very large numbers
	   otherwise
	        lcData = transform(txData)
	endcase

	lcTagSet = "<" + tcTag + ">" + lcData + "</" + tcTag + ">"
	if vartype(tcString) = "C"
	   * Check to see if the tag is in there.  If it is, replace the value with this one
	   * otherwise, just tack it on the end and return the whole thing.
	   * If tlNuke is .T. and lcData is blank, nuke the tags and data out of the string.
	   lnAt1    = atc("<"  + tcTag + ">", tcString)
	   lnAt2    = atc("</" + tcTag + ">", tcString)
	   if lnAt1 > 0 and lnAt2 > 0
	      lcRetVal = left(tcString, lnAt1 - 1) + iif(empty(lcData) and tlNuke, "", lcTagSet) + ;
	      substr(tcString, lnAt2 + len(tcTag) + 3)
	   else
	      lcRetVal = tcString + iif(empty(lcData) and tlNuke, "", lcTagSet)
	   endif
	else
	   lcRetVal = lcTagSet
	endif
	return lcRetVal

FUNC CleanString
	lparameters tcString
	tcString = chrtran(tcString, chr(0) + chr(1) + chr(2) + chr(3) + chr(4) + chr(5) + chr(6) + chr(7) + chr(8) + ;
	                             chr(11) + chr(12) + chr(14) + chr(15) + chr(16) + ;
	                             chr(17) + chr(18) + chr(19) + chr(20) + chr(21) + chr(22) + chr(23) + chr(24) + ;
	                             chr(25) + chr(26) + chr(27) + chr(28) + chr(29) + chr(30) + chr(31), ;
	                             "") &&replicate("`", 32))
	return tcString	

FUNC Alphabetize
	lparameters tcString, tcWhat, tcClassPath
	local lcStart, lcEnd, llProperties, lcCR, llDone, lcRetVal, lcPiece, lnCount, lnAt, lnOldSelect

	if empty(tcString)
	   return ""
	endif

	lnOldSelect  = select()
	lcCR         = chr(13) + chr(10)
	tcString     = lcCR + tcString + lcCR
	llProperties = upper(tcWhat) == "PROPERTIES"
	lcStart      = lcCR
	lcEnd        = lcCR
	lcRetVal     = ""
	tcClassPath  = iif(left(tcClassPath, 1) == ".", substr(tcClassPath, 2), tcClassPath)

	if not llProperties
	   lcStart = lcCR + "PROCEDURE "
	   lcEnd   = lcCR + "ENDPROC"
	endif

	use in select("csrAlpha")
	create cursor csrAlpha(name c(200), value M)

	llDone  = .f.
	lnCount = 0
	do while not llDone
	   lnCount = lnCount + 1
	   lcPiece = strextract(tcString, lcStart, lcEnd, lnCount, 1)
	   if empty(lcPiece)
	      llDone = .t.
	   else
	      if llProperties
	         lnAt    = at("=", lcPiece, 1)
	         lcName  = left(lcPiece, lnAt - 2)
	         lcValue = substr(lcPiece, lnAt + 2)
	      else
	         lnAt    = at(lcCR, lcPiece, 1)
	         lcName  = left(lcPiece, lnAt - 1)
	         lcValue = substr(lcPiece, lnAt + 2)
	      endif
	      insert into csrAlpha values (lcName, lcValue)
	   endif
	enddo

	select * from csrAlpha into cursor csrAlpha order by name
	lcIndent = space(3)
	scan
	   if llProperties
	      lcRetVal = lcRetVal + lcIndent + alltrim(name) + " = " + value + lcCR
	   else
	      lcProcHeader = replicate("*", 80) + lcCR + "***" + space(10) + ;
	                     tcClassPath + "." + alltrim(name) + "()" + lcCR + replicate("*", 80)
	      lcRetVal = lcRetVal + lcProcHeader + lcCR + "PROCEDURE " + alltrim(name) + lcCR + lcIndent + ;
	                            strtran(value, lcCR, lcCR + lcIndent) + lcCR + "ENDPROC" + lcCR + lcCR
	   endif
	endscan

	use in select("csrAlpha")
	select (lnOldSelect)

	return lcRetVal + lcCR

FUNC Getworkingfilename
	* Return a foxpro prg file name for any type of file passed
	lparameters tcFile, tlConverted,toFORM AS Form, tnORDEM AS Integer
	
	local lcExtension, lcFile, lcOrigem

	lcExtension = upper(justext(tcFile))
	lcFile      = tcFile
	
	lcOrigem = 'toFORM.usCOMP' + ALLTRIM( STR( tnORDEM ) )
	lcOrigem = &lcOrigem
	
	if lcExtension $ ("SCX;FRX;VCX;MNX")
	   lcFile = toFORM.TempDir + "\" +;
	   			strextract(justpath(tcFile), '/', '', occurs('/', justpath(tcFile))) +;
	   			juststem(tcFile) + "_" + lcOrigem + "_" + ;
	            dtos(date()) + '_' + strtran(TIME(), ":") + SYS(2015) + ;
	            lcExtension + ".txt" &&".S" + left(lcExtension, 1) + "4"
	endif

	if tlConverted
	   lcFile = justpath(lcFile) + "\_Converted\" + justfname(lcFile)
	endif

	return lcFile