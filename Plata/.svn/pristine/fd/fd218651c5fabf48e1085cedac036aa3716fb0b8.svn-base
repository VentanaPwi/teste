********************************************************************************
*!* ctl32_functions.prg
********************************************************************************

#Include ctl32.h
If Not Juststem(Sys(16)) $ Set("Procedure") Then
	Set Procedure To Sys(16) Additive
Endif
Return

********************************************************************************
Function ctlClientToScreen(m.nHWnd As Integer, m.pnx As Integer, m.pny As Integer)
********************************************************************************
*!* ctlClientToScreen(m.nHWnd, @m.pnx, @m.pny)
*!* Returns client coords x,y translated into screen coords x,y
********************************************************************************
	Local m.lcPoint As String, m.lnRetVal As Integer

	m.lcPoint = BinToC(m.pnx, "4RS") + BinToC(m.pny, "4RS")
	m.lnRetVal = apiClientToScreen(m.nHWnd, @m.lcPoint)

	m.pnx = CToBin(Substr(m.lcPoint , 1, 4), "4RS")
	m.pny = CToBin(Substr(m.lcPoint , 5, 4), "4RS")

	Return m.lnRetVal <> 0
Endfunc

********************************************************************************
Function ctlCToLargeInteger(m.pcLargeInt As String)
********************************************************************************
	Local ;
		m.lnLow As Integer, ;
		m.lnHigh As Integer, ;
		m.lnLargeInt As Integer

	m.lnLow = CToBin(Left(m.pcLargeInt, 4), "4rs")
	m.lnHigh = CToBin(Right(m.pcLargeInt, 4), "4rs")
	m.lnLargeInt = ctlLowHighToLargeInteger(m.lnLow, m.lnHigh)

	Return m.lnLargeInt
Endfunc

********************************************************************************
Function ctlGetOsVersion()
********************************************************************************
*!* Returns the operating system fullversion number
*!*
*!* NTDDI version constants
*!* http://forums.microsoft.com/MSDN/ShowPost.aspx?PostID=2095548&SiteID=1

***	#define NTDDI_WIN2K                         05000000
***	#define NTDDI_WIN2KSP1                      05000100
***	#define NTDDI_WIN2KSP2                      05000200
***	#define NTDDI_WIN2KSP3                      05000300
***	#define NTDDI_WIN2KSP4                      05000400

***	#define NTDDI_WINXP                         05010000
***	#define NTDDI_WINXPSP1                      05010100
***	#define NTDDI_WINXPSP2                      05010200
***	#define NTDDI_WINXPSP3                      05010300
***	#define NTDDI_WINXPSP4                      05010400

***	#define NTDDI_WS03                          05020000
***	#define NTDDI_WS03SP1                       05020100
***	#define NTDDI_WS03SP2                       05020200
***	#define NTDDI_WS03SP3                       05020300
***	#define NTDDI_WS03SP4                       05020400

***	#define NTDDI_WIN6                          06000000
***	#define NTDDI_WIN6SP1                       06000100
***	#define NTDDI_WIN6SP2                       06000200
***	#define NTDDI_WIN6SP3                       06000300
***	#define NTDDI_WIN6SP4                       06000400

***	#define NTDDI_VISTA                         NTDDI_WIN6
***	#define NTDDI_VISTASP1                      NTDDI_WIN6SP1
***	#define NTDDI_VISTASP2                      NTDDI_WIN6SP2
***	#define NTDDI_VISTASP3                      NTDDI_WIN6SP3
***	#define NTDDI_VISTASP4                      NTDDI_WIN6SP4
***
***	#define NTDDI_WS08                          NTDDI_WIN6SP1
***	#define NTDDI_WS08SP2                       NTDDI_WIN6SP2
***	#define NTDDI_WS08SP3                       NTDDI_WIN6SP3
***	#define NTDDI_WS08SP4                       NTDDI_WIN6SP4

***	#define NTDDI_LONGHORN  					NTDDI_VISTA

********************************************************************************
	Return Val(Os(3)) * 1000000 + Val(Os(4)) * 10000 + Val(Os(8)) * 100 + Val(Os(9))
Endfunc

********************************************************************************
Function ctlGetCaretPos(m.pnx As Integer, m.pny As Integer)
********************************************************************************
*!* ctlGetCaretPos(@m.pnx, @m.pny)
**
*!* Returns the position of the caret in CLIENT coordinates.
**
********************************************************************************
	Local m.lcPoint As String, m.lnRetVal As Integer
	m.lcPoint = 0h0000000000000000
	m.lnRetVal = apiGetCaretPos(@m.lcPoint)
	m.pnx = CToBin(Substr(m.lcPoint, 1, 4), "4RS")
	m.pny = CToBin(Substr(m.lcPoint, 5, 4), "4RS")
	Return m.lnRetVal <> 0
Endfunc

********************************************************************************
Function ctlGetCaretPosX()
********************************************************************************
	Local m.lcPoint As String
	m.lcPoint = 0h0000000000000000
	apiGetCaretPos(@m.lcPoint)
	Return CToBin(Substr(m.lcPoint, 1, 4), "4RS")
Endfunc

********************************************************************************
Function ctlGetCaretPosY()
********************************************************************************
	Local m.lcPoint As String
	m.lcPoint = 0h0000000000000000
	m.lnRetVal = apiGetCaretPos(@m.lcPoint)
	Return CToBin(Substr(m.lcPoint, 5, 4), "4RS")
Endfunc

********************************************************************************
Function ctlGetCursorPos(m.pnx As Integer, m.pny As Integer)
********************************************************************************
*!* ctlGetCursorPos(@m.pnx, @m.pny)
*!* Returns the position of the caret in SCREEN coordinates.
********************************************************************************
	Local m.lcPoint As String, m.lnRetVal As Integer
	m.lcPoint = 0h0000000000000000
	m.lnRetVal = apiGetCursorPos(@m.lcPoint)
	m.pnx = CToBin(Substr(m.lcPoint, 1, 4), "4RS")
	m.pny = CToBin(Substr(m.lcPoint, 5, 4), "4RS")
	Return m.lnRetVal <> 0
Endfunc

********************************************************************************
Function ctlGetCursorPosX()
********************************************************************************
	Local m.lcPoint As String
	m.lcPoint = 0h0000000000000000
	apiGetCursorPos(@m.lcPoint)
	Return CToBin(Substr(m.lcPoint, 1, 4), "4RS")
Endfunc

********************************************************************************
Function ctlGetCursorPosY()
********************************************************************************
	Local m.lcPoint As String
	m.lcPoint = 0h0000000000000000
	apiGetCursorPos(@m.lcPoint)
	Return CToBin(Substr(m.lcPoint, 5, 4), "4RS")
Endfunc

********************************************************************************
Function ctlIsObjectInPage(m.poObject As Object)
********************************************************************************
*!* Determines if a control is contained in a page somewhere
*!* along its object hierarchy
	Local ;
		m.llIsInPage As Boolean, ;
		m.loParent As Control

	m.llIsInPage = FALSE

	m.loParent = m.poObject

*!* 20070711 Modified to account for toolbars
	Do While Inlist(Upper(m.loParent.BaseClass), "FORM", "TOOLBAR") = FALSE
		If Upper(m.loParent.BaseClass) == "PAGE" Then
			m.llIsInPage = TRUE
			Exit
		Endif
		m.loParent = m.loParent.Parent
	Enddo

	m.loParent = .Null.
	m.poObject = .Null.

	Return m.llIsInPage
Endfunc

********************************************************************************
Function ctlIsThemeActive(m.poObject As Object)
********************************************************************************
	If Vartype(m.poObject) = "O" Then

		Local ;
			m.loForm As Form, ;
			m.llFormThemeActive As Boolean, ;
			m.llControlThemeActive As Boolean

*!* Get theme status of object:
		Do Case
			Case Pemstatus(m.poObject, "ctlThemes", CON_PEMSTAT_DEFINED)
				m.llControlThemeActive = m.poObject.ctlThemes
			Case Pemstatus(m.poObject, "Themes", CON_PEMSTAT_DEFINED)
				m.llControlThemeActive = m.poObject.Themes
			Otherwise
				m.llControlThemeActive = TRUE
		Endcase

*!* Get theme status of parent form
		m.loForm = m.poObject

		Do While Inlist(Upper(m.loForm.BaseClass), "FORM", "TOOLBAR") = FALSE
			m.loForm = m.loForm.Parent
		Enddo

		m.llFormThemeActive = m.loForm.Themes

		m.loForm = .Null.
		m.poObject = .Null.

		Return apiIsThemeActive() = 1 And _Screen.Themes And m.llFormThemeActive And m.llControlThemeActive
	Else
		Return apiIsThemeActive() <> 0
	Endif
Endfunc

********************************************************************************
Function ctlMemAlloc(m.pnBytesToAllocate)
********************************************************************************
*!* Allocates a block of memory of m.pnBytes
*!* Returns a handle to the allocated memory
*!* Must be freed after use
********************************************************************************
	Return apiHeapAlloc(apiGetProcessHeap(), HEAP_ZERO_MEMORY, m.pnBytesToAllocate)
Endfunc

********************************************************************************
Function ctlMemFree(m.pnMem)
********************************************************************************
*!* Frees a block of memory allocated with ctlMemAlloc
********************************************************************************
	Return apiHeapFree(apiGetProcessHeap(), 0, m.pnMem)
Endfunc

********************************************************************************
Function ctlMemRead(m.pnMem, m.pnBytesToRead)
********************************************************************************
*!* Reads from a memory handle exactly m.pnBytes
********************************************************************************
	If Vartype(m.pnMem) <> "N" Or m.pnMem <= 0 Then
		Return ""
	Endif
	If Vartype(m.pnBytesToRead) <> "N" Or m.pnBytesToRead <= 0 Then
		m.pnBytesToRead = apiHeapSize(apiGetProcessHeap(), 0, m.pnMem)
	Endif
	Return Sys(2600, m.pnMem, m.pnBytesToRead)
Endfunc
********************************************************************************
Function ctlMemSize(m.pnMem)
********************************************************************************
*!* Returns the size of a block of memory allocated with ctlMemAlloc
*!* Returns -1 on failure
********************************************************************************
	Return apiHeapSize(apiGetProcessHeap(), 0, m.pnMem)
Endfunc

********************************************************************************
Function ctlMemWrite(m.pnMem, m.pcData, m.pnBytesToWrite)
********************************************************************************
*!* Writes to a memory heap handle, m.pnBytes of m.pcData
*!* pads with NULAs if len(m.pcData) < m.pnBytes
********************************************************************************
	If Vartype(m.pcData) = "N" Then
		m.pcData = BinToC(m.pcData, "4rs")
	Endif
	If Vartype(m.pnBytesToWrite) = "N" And m.pnBytesToWrite > Len(m.pcData) Then
		m.pcData = m.pcData + Replicate(Chr(0), m.pnBytesToWrite - Len(m.pcData))
	Else
		m.pnBytesToWrite = Len(m.pcData)
	Endif
	If m.pnMem = 0 Then
		m.pnMem = ctlMemAlloc(m.pnBytesToWrite)
	Endif
	m.pcData = Sys(2600, m.pnMem, m.pnBytesToWrite, m.pcData)
	Return m.pnMem
Endfunc

********************************************************************************
Function ctlIntegerToUnsigned(pnValue)
********************************************************************************
*!* converts an integer to an unsigned integer
********************************************************************************
	Local lnRetVal

	If m.pnValue < 0 Then
		m.lnRetVal = m.pnValue + 4294967296
	Else
		m.lnRetVal = m.pnValue
	Endif

	Return m.lnRetVal
Endfunc

********************************************************************************
Function ctlObjToClient(m.poControl As Control, m.pcValueToReturn As String)
********************************************************************************
*!* pcValueToReturn can be: T, B, L, R for Top, Bottom, Left, Right
*!* This replaces OBJTOCLIENT that has bugs with pageframes
********************************************************************************

	Local m.lnPosition As Integer

	m.pcValueToReturn = Upper(m.pcValueToReturn)
	m.lnPosition = 0

	Do Case

		Case m.pcValueToReturn $ "TB"
*!* 20070711 Modified to account for toolbars
			Do While Inlist(Upper(m.poControl.BaseClass), "FORM", "TOOLBAR") = FALSE
				If Pemstatus(m.poControl, "Top", CON_PEMSTAT_DEFINED) Then
					m.lnPosition = m.lnPosition + m.poControl.Top
				Endif
				If Upper(m.poControl.BaseClass) == "PAGE" Then
					If m.poControl.Parent.TabOrientation = CON_TABOR_TOP Then	&& Top
						m.lnPosition = m.lnPosition + ;
							m.poControl.Parent.Height - ;
							m.poControl.Parent.PageHeight - ;
							m.poControl.Parent.BorderWidth * 2
					Else
						m.lnPosition = m.lnPosition + 1
					Endif
				Endif
				m.poControl = m.poControl.Parent
			Enddo

			If m.pcValueToReturn == "B" Then
				m.lnPosition = m.lnPosition + This.Height
			Endif

		Case m.pcValueToReturn $ "LR"
*!* 20070711 Modified to account for toolbars
			Do While Inlist(Upper(m.poControl.BaseClass), "FORM", "TOOLBAR") = FALSE
				If Pemstatus(m.poControl, "Left", CON_PEMSTAT_DEFINED) Then
					m.lnPosition = m.lnPosition + m.poControl.Left
				Endif
				If Upper(m.poControl.BaseClass) == "PAGE"
					If m.poControl.Parent.TabOrientation = CON_TABOR_LEFT Then	&& Left
						m.lnPosition = m.lnPosition + ;
							m.poControl.Parent.Width - ;
							m.poControl.Parent.PageWidth - ;
							m.poControl.Parent.BorderWidth * 2
					Else
						m.lnPosition = m.lnPosition + 1
					Endif
				Endif
				m.poControl = m.poControl.Parent
			Enddo

			If m.pcValueToReturn == "R" Then
				m.lnPosition = m.lnPosition + This.Width
			Endif

	Endcase

	Return m.lnPosition

********************************************************************************
Function ctlStrFormatByteSize(m.pnSizeInBytes)
********************************************************************************
*!* Converts a numeric value into a string that represents the number expressed
*!* as a size value in bytes, kilobytes, megabytes, or gigabytes, depending on the size.
*!* API StrFormatByteSize only work for files up to 4GB
*!*	Local ;
*!*		m.lcBuffer As String
*!*	m.lcBuffer = Space(254)
*!*	StrFormatByteSize(m.pnSizeInBytes, @m.lcBuffer, Len(m.lcBuffer))
*!*	* Remove chr(0)
*!*	m.lcBuffer = Left(m.lcBuffer, At(NULA, m.lcBuffer) - 1)
*!*	Return m.lcBuffer
********************************************************************************
	Local m.lnSize As Integer, m.lcUnit As String

	Do Case
		Case m.pnSizeInBytes < 999					&& Bytes
			m.lnSize = m.pnSizeInBytes
			m.lcUnit = " Bytes"
		Case m.pnSizeInBytes < 1024^1 * 999			&& KiloBytes
			m.lnSize = m.pnSizeInBytes / 1024^1
			m.lcUnit = " KB"
		Case m.pnSizeInBytes < 1024^2 * 999			&& MegaBytes
			m.lnSize = m.pnSizeInBytes / 1024^2
			m.lcUnit = " MB"
		Case m.pnSizeInBytes < 1024^3 * 999			&& GigaBytes
			m.lnSize = m.pnSizeInBytes / 1024^3
			m.lcUnit = " GB"
		Otherwise
			m.lnSize = m.pnSizeInBytes / 1024^4		&& TeraBytes
			m.lcUnit = " TB"
	Endcase

	Do Case
		Case m.lnSize > 100
			m.lnSize = Round(m.lnSize , 0)
		Case m.lnSize > 10
			m.lnSize = Round(m.lnSize , 1)
		Otherwise
			m.lnSize = Round(m.lnSize , 2)
	Endcase

	Return Transform(m.lnSize) + m.lcUnit
Endfunc

********************************************************************************
Function ctlStrFormatSeconds(m.pnSeconds)
********************************************************************************
	m.pnSeconds = Round(m.pnSeconds, 0)

	Local ;
		m.lcHours As String, ;
		m.lcMinutes As String, ;
		m.lcSeconds As String

	If Int(m.pnSeconds / 3600) > 0 Then
		m.lcHours 	= Padl(Alltrim(Str(Int(m.pnSeconds / 3600))), 2, "0") + ":"
	Else
		m.lcHours   = ""
	Endif

	m.lcMinutes = Padl(Alltrim(Str(Int((m.pnSeconds % 3600) / 60))), 2, "0") + ":"
	m.lcSeconds = Padl(Alltrim(Str((m.pnSeconds % 3600) % 60)), 2, "0")

	Return m.lcHours +  m.lcMinutes +  m.lcSeconds
Endfunc

********************************************************************************
Function ctlUnsignedToInteger(m.pnValue As Integer)
********************************************************************************
*!* Converts an unsigned integer to an integer.
********************************************************************************
	Local lnRetVal

	If m.pnValue <= 2147483647 Then
		m.lnRetVal = m.pnValue
	Else
		m.lnRetVal= m.pnValue - 4294967296
	Endif

	Return m.lnRetVal
Endfunc

********************************************************************************
Function ctlFClose(m.pnFileHandle As Integer)
********************************************************************************
	Local ;
		m.lnApiRetVal As Integer, ;
		m.llRetVal As Boolean

	m.lnApiRetVal = apiCloseHandle(m.pnFileHandle)

	If m.lnApiRetVal = 0 Then
		m.llRetVal = FALSE
	Else
		m.llRetVal = TRUE
	Endif

	Return m.llRetVal
Endfunc

********************************************************************************
Function ctlFGets(m.pnFileHandle As Integer, m.pnBytesToRead As Integer)
********************************************************************************
	If Vartype(m.pnBytesToRead) <> "N" Then
		m.pnBytesToRead = 254
	Endif

	Local;
		m.lcByteString As String, ;
		m.lnBytesRead As Integer, ;
		m.lnApiRetVal As Integer, ;
		m.lnOverlapped As Integer

	m.lnBytesRead = 0
	m.lcByteString = Space(m.pnBytesToRead)
	m.lnOverlapped = 0

	m.lnApiRetVal = apiReadFile(m.pnFileHandle, ;
		@m.lcByteString, ;
		m.pnBytesToRead , ;
		@m.lnBytesRead , ;
		m.lnOverlapped)

	If m.lnApiRetVal = 0 Then
		m.lcByteString = ""
	Else
		m.lcByteString = Left(m.lcByteString, m.lnBytesRead)
	Endif

*!* Now search for CRLF in the string:
	Local m.lnCrLfPos As Integer
	m.lnCrLfPos = At(CRLF, m.lcByteString)

*!* if we find a CRLF in the string
	If m.lnCrLfPos <> 0 Then

*!* Set file pointer for next read to after CRLF
		Local m.lnOffset As Integer
		m.lnOffset = (m.lnBytesRead - m.lnCrLfPos - 1) * (-1)
		ctlFSeek(m.pnFileHandle, m.lnOffset , 1)

*!* Remove trailing characters after CRLF
		m.lcByteString = Left(m.lcByteString, m.lnCrLfPos - 1)
	Endif

	Return m.lcByteString
Endfunc

********************************************************************************
Function ctlFileTimeToDateTime(m.poFileTime As ctlFILETIME)
********************************************************************************
	Local m.loSystemTime, m.lcSystemTime, m.lcFileTime

	m.loSystemTime = Createobject("ctlSYSTEMTIME")
	m.lcSystemTime = m.loSystemTime.Value
	m.lcFileTime = m.poFileTime.Value

	If apiFileTimeToSystemTime(@m.lcFileTime, @m.lcSystemTime) = 1 Then
		With m.loSystemTime
			.Value = m.lcSystemTime
			m.ltFileDateTime = Datetime(.wYear, .wMonth, .wDay, .wHour, .wMinute, .wSecond)
		Endwith
	Else
		m.ltFileDateTime = Ctot("")
	Endif

	m.loSystemTime = .Null.

	Return m.ltFileDateTime
Endfunc

********************************************************************************
Function ctlFontHeightToPoints(m.pnValue As Integer)
********************************************************************************
	Local m.lnDc As Integer, m.lnLogPixelsY As Integer
	m.lnDc = apiGetDC(0)
	m.lnLogPixelsY = apiGetDeviceCaps(m.lnDc, LOGPIXELSY)
	apiReleaseDC(0, m.lnDc)
	Return Round(72 * m.pnValue / m.lnLogPixelsY * (-1), 0)
Endfunc

********************************************************************************
Function ctlFontPointsToHeight(m.pnValue As Integer)
********************************************************************************
	m.lnDc = apiGetDC(0)
	m.lnLogPixelsY = apiGetDeviceCaps(m.lnDc, LOGPIXELSY)
	apiReleaseDC(0, m.lnDc)
	Return Round(m.pnValue * m.lnLogPixelsY / 72 * (-1), 0)
Endfunc

********************************************************************************
Function ctlFOpen(m.pcFilename As String, m.pnAttribute As Integer)
********************************************************************************
*!* _Fopen(cFilename, "nAttribute")
*!*
*!*  0 READ-ONLY	BUFFERED
*!*  1 WRITE-ONLY	BUFFERED
*!*  2 READ-WRITE	BUFFERED
*!* 10 READ-ONLY	UNBUFFERED
*!* 11 WRITE-ONLY	UNBUFFERED
*!* 12 READ-WRITE	UNBUFFERED
********************************************************************************
	Local ;
		m.lcFilename As String, ;
		m.lnDesiredAccess As Integer, ;
		m.lnShareMode As Integer, ;
		m.lnSecurityAttributes As Integer, ;
		m.lnCreationDisposition As Integer, ;
		m.lnFlagsAndAttributes As Integer, ;
		m.lnTemplateFile As Integer, ;
		m.lnBufferFlag As Integer

	m.lcFilename = Alltrim(m.pcFilename)

	If Vartype(m.pnAttribute) <> T_NUMERIC Then
		m.pnAttribute = 0
	Endif

	Do Case
		Case m.pnAttribute = 0
			m.lnDesiredAccess = GENERIC_READ
			m.lnBufferFlag = 0
		Case m.pnAttribute = 1
			m.lnDesiredAccess = GENERIC_WRITE
			m.lnBufferFlag = 0
		Case m.pnAttribute = 2
			m.lnDesiredAccess = Bitor(GENERIC_READ, GENERIC_WRITE)
			m.lnBufferFlag = 0
		Case m.pnAttribute = 10
			m.lnDesiredAccess = GENERIC_READ
			m.lnBufferFlag = FILE_FLAG_WRITE_THROUGH
		Case m.pnAttribute = 11
			m.lnDesiredAccess = GENERIC_WRITE
			m.lnBufferFlag = FILE_FLAG_WRITE_THROUGH
		Case m.pnAttribute = 12
			m.lnDesiredAccess = Bitor(GENERIC_READ, GENERIC_WRITE)
			m.lnBufferFlag = FILE_FLAG_WRITE_THROUGH
		Otherwise
			m.lnDesiredAccess = GENERIC_READ
			m.lnBufferFlag = 0
	Endcase

	m.lnShareMode = 0
	m.lnSecurityAttributes = 0
	m.lnCreationDisposition = OPEN_EXISTING
	m.lnFlagsAndAttributes = Bitor(FILE_ATTRIBUTE_NORMAL, m.lnBufferFlag)
	m.lnTemplateFile = 0

	m.hFile = apiCreateFile( ;
		m.lcFilename, ;
		m.lnDesiredAccess, ;
		m.lnShareMode, ;
		m.lnSecurityAttributes, ;
		m.lnCreationDisposition, ;
		m.lnFlagsAndAttributes, ;
		m.lnTemplateFile)

	Return m.hFile
Endfunc

********************************************************************************
Function ctlFRead(m.pnFileHandle As Integer, m.pnBytesToRead As Integer)
********************************************************************************
	Local;
		m.lcByteString As String, ;
		m.lnBytesRead As Integer, ;
		m.lnApiRetVal As Integer, ;
		m.lnOverlapped As Integer

	m.lnBytesRead = 0
	m.lcByteString = Space(m.pnBytesToRead)
	m.lnOverlapped = 0

	m.lnApiRetVal = apiReadFile(m.pnFileHandle, ;
		@m.lcByteString, ;
		m.pnBytesToRead , ;
		@m.lnBytesRead , ;
		m.lnOverlapped)

	If m.lnApiRetVal = 0 Then
		m.lcByteString = ""
	Else
		m.lcByteString = Left(m.lcByteString, m.lnBytesRead)
	Endif

	Return m.lcByteString
Endfunc

********************************************************************************
Function ctlFSeek(m.pnFileHandle As Integer, m.pnBytesMoved As Integer , m.pnRelativePosition As Integer)
********************************************************************************
*!* _Fseek(nFileHandle, nBytesMoved ", nRelativePosition")
*!*	#DEFINE FILE_BEGIN								0
*!*	#DEFINE FILE_CURRENT							1
*!*	#DEFINE FILE_END								2
*!*	#DEFINE INVALID_SET_FILE_POINTER				-1
********************************************************************************
	Local ;
		m.lnLow As Integer, ;
		m.lnHigh As Integer, ;
		m.lcNewFilePointer As String, ;
		m.lnNewFilePointer As Integer, ;
		m.lnApiRetVal As Integer

	If Vartype(m.pnRelativePosition) <> T_NUMERIC Then
		m.pnRelativePosition = 0
	Endif

*!* Split large integer into low unsigned and high signed

	m.lnLow = 0
	m.lnHigh = 0
	ctlLargeIntegerToLowHigh(m.pnBytesMoved, @m.lnLow, @m.lnHigh)

	m.lcNewFilePointer = Replicate(Chr(0), 8)

	m.lnApiRetVal = ;
		apiSetFilePointerEx( ;
		m.pnFileHandle , ;
		m.lnLow , ;
		m.lnHigh, ;
		@m.lcNewFilePointer, ;
		m.pnRelativePosition )

	If m.lnApiRetVal = 0 Then
		m.lnNewFilePointer = -1
	Else
		m.lnNewFilePointer = ctlCToLargeInteger(m.lcNewFilePointer)
	Endif

	Return m.lnNewFilePointer
Endfunc

********************************************************************************
Function ctlFSize(m.puFnameOrFhandle As variant)
********************************************************************************
*!* _Fsize(cFilename|nFileHandle)
********************************************************************************
	Local ;
		m.llCloseFile As Boolean, ;
		m.lnFileHandle As Integer, ;
		m.lcLargeInt As String, ;
		m.lnApiRetVal As Integer

	m.lnFileSize = -1
	m.lnFileHandle = HFILE_ERROR
	m.llCloseFile = FALSE

	Do Case
		Case Vartype(m.puFnameOrFhandle) = T_NUMERIC
			m.lnFileHandle = m.puFnameOrFhandle

		Case Vartype(m.puFnameOrFhandle) = T_CHARACTER
			m.llCloseFile = TRUE
			m.lnFileHandle = ctlFOpen(m.puFnameOrFhandle, 0)

		Otherwise
			Return m.lnFileSize
	Endcase

	If m.lnFileHandle <> HFILE_ERROR

		m.lcLargeInt = Replicate(Chr(0), 8)
		m.lnApiRetVal = apiGetFileSizeEx(m.lnFileHandle, @m.lcLargeInt)

		If m.lnApiRetVal <> 0 Then
			m.lnFileSize = ctlCToLargeInteger(m.lcLargeInt)
		Endif
	Endif

*!* Close file
	If m.llCloseFile = TRUE
		ctlFClose(m.lnFileHandle)
	Endif

	Return m.lnFileSize
Endfunc

********************************************************************************
Function ctlFWrite(m.pnFileHandle As Integer, m.pcExpression As String, m.pnCharactersWritten As Integer)
********************************************************************************
*!* _Fwrite(nFileHandle, cExpression ", nCharactersWritten")
********************************************************************************
	Local ;
		m.lnBytesWritten As Integer, ;
		m.lnOverlapped As Integer, ;
		m.lnApiRetVal As Integer

	m.lnBytesWritten = 0
	m.lnOverlapped = 0

	If Vartype(m.pnCharactersWritten) <> T_NUMERIC Then
		m.pnCharactersWritten = Len(m.pcExpression)
	Endif

	m.lnApiRetVal = apiWriteFile(m.pnFileHandle, ;
		m.pcExpression, ;
		m.pnCharactersWritten , ;
		@m.lnBytesWritten, ;
		m.lnOverlapped)

	Return m.lnBytesWritten
Endfunc

********************************************************************************
Function ctlLargeIntegerToC(m.pnLargeInt As Integer)
********************************************************************************
	Local ;
		m.lnLow As Integer, ;
		m.lnHigh As Integer, ;
		m.lcLargeInt As String

	m.lnLow  = 0
	m.lnHigh = 0

	ctlLargeIntegerToLowHigh(m.pnLargeInt, @m.lnLow, @m.lnHigh)
	m.lcLargeInt = BinToC(m.lnLow, "4rs") + BinToC(m.lnHigh, "4rs")
	Return m.lcLargeInt
Endfunc

********************************************************************************
Function ctlLargeIntegerToLowHigh(m.pnLargeInt, m.lnLow, m.lnHigh)
********************************************************************************
*!* _LargeIntToLowHigh(nLargeInt, @nLow, @nHigh)
********************************************************************************
	m.lnLow  = m.pnLargeInt % 2^32
	m.lnHigh = Int((m.pnLargeInt - m.lnLow) / 2^32)

	If m.lnLow < 0 Then
		m.lnLow = m.lnLow + 2^32
	Endif

	Return
Endfunc

********************************************************************************
Function ctlLowHighToLargeInteger(m.pnLow As Integer, m.pnHigh As Integer)
********************************************************************************
	Local m.lnLargeInt As Integer

	If m.pnLow < 0 Then
		m.pnLow = m.pnLow + 2^32
	Endif
	m.lnLargeInt = m.pnLow + m.pnHigh * 2^32

	Return m.lnLargeInt
Endfunc

********************************************************************************
Function ctlGetLangID(m.pnLocale As Integer, m.pnWhatToReturn As Integer)
********************************************************************************
*!* pnLocale could be LOCALE_USER_DEFAULT, LOCALE_SYSTEM_DEFAULT
*!* http://msdn.microsoft.com/library/default.asp?url=/library/en-us/intl/nls_34rz.asp
*!* http://msdn.microsoft.com/library/default.asp?url=/library/en-us/intl/nls_8xo3.asp
*!* http://msdn.microsoft.com/library/default.asp?url=/library/en-us/intl/nls_61df.asp
*!* Sets the value of strings that are language dependant.
********************************************************************************
	Local ;
		lnLocale As Integer, ;
		lcLocaleInfo As String, ;
		lnCharsRet As Integer, ;
		lnLangID As Integer, ;
		lnPrimaryLangID As Integer, ;
		lnSubLangID As Integer, ;
		lnRetVal As Integer

	If Pcount() > 0 .And. Vartype(m.pnLocale) = T_NUMERIC Then
		m.lnLocale = m.pnLocale
	Else
		m.lnLocale = LOCALE_SYSTEM_DEFAULT
	Endif

	m.lcLocaleInfo = Replicate(Chr(0), 5)
	m.lnCharsRet = apiGetLocaleInfo(m.pnLocale , LOCALE_ILANGUAGE, @m.lcLocaleInfo, Len(m.lcLocaleInfo))
*!* remove nul chars
	m.lcLocaleInfo = Strtran(m.lcLocaleInfo, Chr(0), "")
*!* m.lcLocaleInfo is now a character representation of a hex number
	m.lnLangID = Evaluate("0x" + m.lcLocaleInfo)
*!*	m.lnPrimaryLangID = Bitand(m.lnLangID, 0x3FF)
*!*	m.lnSubLangID = Bitrshift(m.lnLangID, 10)

	Do Case
		Case Pcount() < 2 Or m.pnWhatToReturn = 1
			m.lnRetVal =  m.lnLangID
		Case m.pnWhatToReturn = 2
			m.lnRetVal =  Bitand(m.lnLangID, 0x3FF)
		Case m.pnWhatToReturn = 3
			m.lnRetVal =  Bitrshift(m.lnLangID, 10)
		Otherwise
			m.lnRetVal =  m.lnLangID
	Endcase

	Return m.lnRetVal
Endfunc

********************************************************************************
Function ctlGetPrimaryLangID(m.pnLocale As Integer)
********************************************************************************
*!* pnLocale could be LOCALE_USER_DEFAULT, LOCALE_SYSTEM_DEFAULT
********************************************************************************
	Return ctlGetLangID(m.pnLocale, 2)
Endfunc

********************************************************************************
Function ctlGetStringHeightFromHwnd(m.pcString, m.pnHwnd)
********************************************************************************
*!* Returns the width of a certain string in the font selected into a hwnd
	Local ;
		lnDc As Integer, ;
		lnWidth As Integer, ;
		lcSize As String, ;
		lnFont As Integer, ;
		lnPrevFont As Integer

*!* Get font
	m.lnFont = apiSendMessageN(m.pnHwnd, WM_GETFONT, 0, 0)
*!* Get DC
	m.lnDc = apiGetDC(m.pnHwnd)
*!* Apply font to DC, we get previous font as result
	m.lnPrevFont = apiSelectObject(m.lnDc, m.lnFont)

	m.lcSize = Space(8)

	apiGetTextExtentPoint32(m.lnDc, m.pcString, Len(m.pcString), @ m.lcSize)

	m.lnWidth = CToBin(Substr(m.lcSize, 1, 4), "4RS")	&& Width
	m.lnHeight = CToBin(Substr(m.lcSize, 5, 4), "4RS")	&& Height

*!* Restore previous font
	apiSelectObject(m.lnDc, m.lnPrevFont )

*!* Release DC
	apiReleaseDC(m.pnHwnd, m.lnDc)

	Return m.lnWidth
Endfunc

Function ctlGetStringWidthFromHwnd(m.lcString, m.lnHwnd)
Endfunc

********************************************************************************
Function ctlGetSubLangID(m.pnLocale As Integer)
********************************************************************************
*!* pnLocale could be LOCALE_USER_DEFAULT, LOCALE_SYSTEM_DEFAULT
********************************************************************************
	Return ctlGetLangID(m.pnLocale, 3)
Endfunc

********************************************************************************
Function ctlGetPrimaryLangIDFromLangID(m.pnLangID As Integer)
********************************************************************************
	Return Bitand(m.pnLangID, 0x3FF)
Endfunc

********************************************************************************
Function ctlGetSubLangIDFromLangID(m.pnLangID As Integer)
********************************************************************************
	Return Bitrshift(m.pnLangID, 10)
Endfunc

********************************************************************************
Function ctlGetHostHWnd(m.poObject As Object)
********************************************************************************
*!* ctlGetHostHWnd()
*!* Returns the HWnd of a form, or the HWnd of the inner window in case of
*!* top level forms or forms with scrollbars
*!* Parameter can be a form, toolbar or control
********************************************************************************
	Local ;
		m.loForm As Form, ;
		m.nHWnd As Integer

*!* traverse the object hierarchy until we find the form:
*!* Modified 20070603 to check for toolbars
	Do While Inlist(Upper(m.poObject.BaseClass), "FORM", "TOOLBAR") = FALSE
		m.poObject = m.poObject.Parent
	Enddo

	m.loForm = m.poObject
	m.poObject = Null
	m.nHWnd = m.loForm.HWnd

*!* If the form is a top level form, or it has scrollbars, get hWnd of inner window:
	If Upper(m.loForm.BaseClass) = "FORM" Then
		If m.loForm.ShowWindow = 2 Or m.loForm.ScrollBars > 0 Then
*!* Get hWnd of client window of Top Level Form //Craig Boyd//
			If Version(CON_VER_NUM) >= 900
				m.nHWnd = Sys(2327, Sys(2325, Sys(2326, m.loForm.HWnd)))
			Else
				m.nHWnd = apiGetWindow(m.loForm.HWnd, GW_CHILD)
			Endif
		Endif
	Endif

	m.loForm = Null

	Return m.nHWnd
Endfunc

********************************************************************************
Function ctlGet_X_lParam(m.pnlParam As Integer)
********************************************************************************
*!*	int GET_X_LPARAM(
*!*	    LPARAM lParam
*!*	);
*!*	Parameters
*!*	lParam
*!*	Specifies the value to be converted.
*!*	Return Value
*!*	The return value is the low-order int of the specified value.
********************************************************************************
	Return Bitand(m.pnlParam, 0xFFFF)
Endfunc

********************************************************************************
Function ctlGetXFromLparam(m.pnlParam As Integer)
********************************************************************************
	Return Bitand(m.pnlParam, 0xFFFF)
Endfunc

********************************************************************************
Function ctlGet_Y_lParam(m.pnlParam As Integer)
********************************************************************************
*!*	int GET_Y_LPARAM(
*!*	    LPARAM lParam
*!*	);
*!*	Parameters
*!*	lParam
*!*	Specifies the value to be converted.
*!*	Return Value
*!*	The return value is the high-order int of the specified value.
********************************************************************************
	Return Bitrshift(m.pnlParam, 16)		&& Bitand(Int(m.pnlParam / 0x10000), 0xFFFF)
Endfunc

********************************************************************************
Function ctlGetYFromLparam(m.pnlParam As Integer)
********************************************************************************
	Return Bitrshift(m.pnlParam, 16)		&& Bitand(Int(m.pnlParam / 0x10000), 0xFFFF)
Endfunc

********************************************************************************
Function ctlGetWindowProcedure(m.pnHwnd As Integer)
********************************************************************************
	If Empty(m.pnHwnd) Then
		m.pnHwnd = _vfp.HWnd
	Endif
	Return apiGetWindowLong(m.pnHwnd, GWL_WNDPROC)
Endfunc

********************************************************************************
Function ctlHiByte(m.pnlParam As Integer)
********************************************************************************
*!*	BYTE HIBYTE(
*!*	Word wValue
*!*	);
*!*	Parameters
*!*	wValue
*!*	Specifies the Value To be converted.
*!*	Return Value
*!*	the Return Value Is the High-Order BYTE Of the specified Value.
********************************************************************************
	Return Bitrshift(m.pnlParam, 8)		&& Bitand(Int(m.pnlParam / 0x10000), 0xFFFF)
Endfunc

********************************************************************************
Function ctlLoByte(m.pnlParam As Integer)
********************************************************************************
*!*	BYTE LOBYTE(
*!*	Word wValue
*!*	);
*!*	Parameters
*!*	wValue
*!*	Specifies the Value To be converted.
*!*	Return Value
*!*	the Return Value Is the low-Order BYTE Of the specified Value.
********************************************************************************
	Return Bitand(m.pnlParam , 0xFF)
Endfunc

********************************************************************************
Function ctlHiWord(m.pnlParam As Integer)
********************************************************************************
*!*	Word HIWORD(
*!*	DWORD dwValue
*!*	);
*!*	Parameters
*!*	dwValue
*!*	Specifies the Value To be converted.
*!*	Return Value
*!*	the Return Value Is the High-Order Word Of the specified Value.
********************************************************************************
	Return Bitrshift(m.pnlParam, 16)		&& Bitand(Int(m.pnlParam / 0x10000), 0xFFFF)
Endfunc

********************************************************************************
Function ctlLoWord(m.pnlParam As Integer)
********************************************************************************
*!*	Word LOWORD(
*!*	DWORD dwValue
*!*	);
*!*	Parameters
*!*	dwValue
*!*	Specifies the Value To be converted.
*!*	Return Value
*!*	the Return Value Is the low-Order Word Of the specified Value.
	Return Bitand(m.pnlParam, 0xFFFF)
Endfunc

********************************************************************************
Function ctlMakeLong(m.pnLow As Integer, m.pnHigh As Integer)
********************************************************************************
*!*	DWORD MAKELONG(
*!*	Word wLow,
*!*	Word wHigh
*!*	);
*!*	Parameters
*!*	wLow
*!*	Specifies the low-Order Word Of the new Value.
*!*	wHigh
*!*	Specifies the High-Order Word Of the new Value.
*!*	Return Value
*!*	the Return Value Is a Long Value.
********************************************************************************
	Return m.pnLow + m.pnHigh * 0x10000	&& Bitor(m.wLow, BITLSHIFT(m.wHigh, 16)
Endfunc

********************************************************************************
Function ctlMakelParam(m.pnLow As Integer, m.pnHigh As Integer)
********************************************************************************
*!*	LPARAM MAKELPARAM(
*!*	    WORD wLow,
*!*	    WORD wHigh
*!*	);
*!*	Parameters
*!*	wLow
*!*	Specifies the low-order word of the new value.
*!*	wHigh
*!*	Specifies the high-order word of the new value.
*!*	Return Value
*!*	The return value is an LPARAM value.
********************************************************************************
	Return m.pnLow + m.pnHigh * 0x10000	&& Bitor(m.wLow, BITLSHIFT(m.wHigh, 16)
Endfunc

********************************************************************************
Function ctlMakePoint(m.pnx As Integer, m.pny As Integer)
********************************************************************************
*!*	POINT
*!*	The POINT structure defines the x- and y- coordinates of a point.
*!*	typedef struct tagPOINT {
*!*	  LONG x;
*!*	  LONG y;
*!*	} POINT, *PPOINT;
*!*	Members
*!*	x
*!*	Specifies the x-coordinate of the point.
*!*	y
*!*	Specifies the y-coordinate of the point.
*!* This is not a Windows Macro
********************************************************************************
	Return BinToC(m.pnx, "4RS") + BinToC(m.pny, "4RS")
Endfunc

********************************************************************************
Function ctlMakewParam(m.pnLow As Integer, m.pnHigh As Integer)
********************************************************************************
	Return ctlMakelParam(m.pnLow, m.pnHigh)
Endfunc

********************************************************************************
Function ctlGetXFromPoint(m.pcPoint As String)
********************************************************************************
*!*	POINT
*!*	The POINT structure defines the x- and y- coordinates of a point.
*!*	typedef struct tagPOINT {
*!*	  LONG x;
*!*	  LONG y;
*!*	} POINT, *PPOINT;
*!*	Members
*!*	x
*!*	Specifies the x-coordinate of the point.
*!*	y
*!*	Specifies the y-coordinate of the point.
*!* This is not a Windows Macro
********************************************************************************
	Return CToBin(Substr(m.pcPoint, 1, 4), "4RS")
Endfunc

********************************************************************************
Function ctlGetYFromPoint(m.pcPoint As String)
********************************************************************************
*!*	POINT
*!*	The POINT structure defines the x- and y- coordinates of a point.
*!*	typedef struct tagPOINT {
*!*	  LONG x;
*!*	  LONG y;
*!*	} POINT, *PPOINT;
*!*	Members
*!*	x
*!*	Specifies the x-coordinate of the point.
*!*	y
*!*	Specifies the y-coordinate of the point.
*!* This is not a Windows Macro
********************************************************************************
	Return CToBin(Substr(m.pcPoint, 5, 4), "4RS")
Endfunc

********************************************************************************
Function ctlGetParentForm(m.toForm As Form)
********************************************************************************
*!* This returns an object reference to the parent form
*!* of a non top level form:
*!* the _Screen, or some Top Level Form

*!* accepts as parameter a form reference
********************************************************************************
	Local;
		m.lnHwnd As Integer, ;
		m.loForm As Form, ;
		m.lnX As Integer

	m.lnHwnd = apiGetParent(m.toForm.HWnd)

	If _Screen.HWnd = m.lnHwnd Then
		m.loForm = _Screen
	Else
*!* Parent is a Top Level Form, get HWnd of form, what we have
*!* now is HWnd of inner window of Top Level Form:
		m.lnHwnd = apiGetParent(m.lnHwnd)

*!* Find the Top Level Form that has this HWnd:
		For m.lnX = 1 To _Screen.FormCount
			If _Screen.Forms(m.lnX).HWnd = m.lnHwnd Then
				m.loForm = _Screen.Forms(m.lnX)
				Exit
			Endif
		Endfor
	Endif

	Return m.loForm
Endfunc

********************************************************************************
Function ctlGetDateFormat(pnFlags As Integer)
********************************************************************************
*!* Returns current date formated string
*!* 1 DATE_SHORTDATE
*!* 2 DATE_LONGDATE

	Local ;
		lnLocale As Integer, ;
		lcDate As String, ;
		lcFormat As String, ;
		lcDateStr As String, ;
		lnDateStrLen As Integer

	m.lnLocale = LOCALE_USER_DEFAULT

	m.lcDate = .Null.
	m.lcFormat = .Null.

	m.lnDateStrLen = 0xFF
	m.lcDateStr = Space(m.lnDateStrLen)

	m.lnDateStrLen = apiGetDateFormat( ;
		m.lnLocale, ;
		m.pnFlags, ;
		@m.lcDate, ;
		@m.lcFormat, ;
		@m.lcDateStr, ;
		m.lnDateStrLen)
	m.lcDateStr= Left(m.lcDateStr, m.lnDateStrLen - 1)

	Return m.lcDateStr
Endfunc

********************************************************************************
Function ctlGetFormType(m.poObject As Object)
********************************************************************************
*!* Returns the type of container a control is in, or the type of form
*!* accepts as parameter a control or a form reference

*!*	 CON_FORMTYPE_DEFAULT       0
*!*	 CON_FORMTYPE_TOPLEVEL      1
*!*	 CON_FORMTYPE_SCREEN        2

*!* Determine the type of form the control parameter is in,
*!* or the type of form, if the passed parameter is a form

*!* Parameter can be a form, toolbar or control
********************************************************************************

	Local ;
		m.loForm As Form, ;
		m.lnFormType As Integer

	m.loForm = m.poObject

*!* Go up the object hierarchy until we find a form:
*!* 20070711 Modified to account for toolbars
	Do While Inlist(Upper(m.loForm.BaseClass), "FORM", "TOOLBAR") = FALSE
		m.loForm = m.loForm.Parent
	Enddo

	m.lnFormType = CON_FORMTYPE_DEFAULT

*!*	If container is a TLF, must have ShowWindow = 2
	If m.loForm.ShowWindow = CON_SHOWWIN_ASTOPLEVELFORM Then
		m.lnFormType = CON_FORMTYPE_TOPLEVEL
	Endif

*!*	If Form.Name equals the _Screen.Name, then container is _Screen
	If m.loForm.Name == _Screen.Name Then
		m.lnFormType = CON_FORMTYPE_SCREEN
	Endif

	m.loForm = Null

	Return m.lnFormType

********************************************************************************
********************************************************************************
********************************************************************************
********************************************************************************
********************************************************************************
********************************************************************************
