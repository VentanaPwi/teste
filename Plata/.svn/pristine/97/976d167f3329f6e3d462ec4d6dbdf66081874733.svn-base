********************************************************************************
*!* ctl32_api.prg
********************************************************************************
*!* http://www.codeplex.com/VFPX/Thread/View.aspx?ThreadId=11535
*!* GDIPLUSX method of declaring and protecting api declares
********************************************************************************

#Include ctl32.h
If Not Juststem(Sys(16)) $ Set("Procedure") Then
	Set Procedure To Sys(16) Additive
Endif
Return

********************************************************************************
Function apiAppendMenu(m.hMenu, m.wFlags, m.uIDNewItem, m.lpNewItem)
********************************************************************************
	Declare Integer AppendMenu In win32api As apiAppendMenu ;
		Integer hMenu, ;
		Integer wFlags, ;
		Integer uIDNewItem, ;
		String  lpNewItem
	Return apiAppendMenu(m.hMenu, m.wFlags, m.uIDNewItem, m.lpNewItem)
Endfunc

********************************************************************************
Function apiAttachThreadInput(m.idAttach, m.idAttachTo, m.fAttach)
********************************************************************************
	Declare Integer AttachThreadInput In win32api As apiAttachThreadInput;
		Integer idAttach, ;
		Integer idAttachTo, ;
		Integer fAttach
	Return apiAttachThreadInput(m.idAttach, m.idAttachTo, m.fAttach)
Endfunc

********************************************************************************
Function apiCallWindowProc(m.lpPrevWndFunc, m.nHWnd, m.msg, m.wParam, m.lParam)
********************************************************************************
	
	Declare Integer CallWindowProc In win32api As apiCallWindowProc ;
		Integer lpPrevWndFunc, ;
		Integer nHWnd, ;
		Integer msg, ;
		Integer wParam, ;
		Integer Lparam

	Return apiCallWindowProc(m.lpPrevWndFunc, m.nHWnd, m.msg, m.wParam, m.lParam)
Endfunc

********************************************************************************
Function apiCheckMenuItem(m.hMenu, m.uIDCheckItem, m.uCheck)
********************************************************************************
	Declare Integer CheckMenuItem In win32api As apiCheckMenuItem ;
		Integer hmenu, ;
		Integer uIDCheckItem, ;
		Integer uCheck
	Return apiCheckMenuItem(m.hMenu, m.uIDCheckItem, m.uCheck)
Endfunc

********************************************************************************
Function apiChildWindowFromPoint(m.HWndParent, m.px, m.py)
********************************************************************************
	Declare Integer ChildWindowFromPoint In win32api As apiChildWindowFromPoint ;
		Integer HWndParent,;
		Integer px,;
		Integer py
	Return apiChildWindowFromPoint(m.HWndParent, m.px, m.py)
Endfunc

********************************************************************************
Function apiCheckMenuRadioItem(m.hMenu, m.idFirst, m.idLast, m.idCheck, m.uFlags)
********************************************************************************
	Declare Integer CheckMenuRadioItem In win32api As apiCheckMenuRadioItem ;
		Integer hmenu, ;
		Integer idFirst, ;
		Integer idLast, ;
		Integer idCheck, ;
		Integer uFlags
	Return apiCheckMenuRadioItem(m.hMenu, m.idFirst, m.idLast, m.idCheck, m.uFlags)
Endfunc

********************************************************************************
Function apiClientToScreen(m.nHWnd, m.lpPoint)
********************************************************************************
	Declare Integer ClientToScreen In win32api As apiClientToScreen ;
		Integer nHWnd, ;
		String  @lpPoint
	Return apiClientToScreen(m.nHWnd, @m.lpPoint)
Endfunc

********************************************************************************
Function apiCloseHandle(m.hObject)
********************************************************************************
	Declare Integer CloseHandle In win32api As apiCloseHandle ;
		Integer hObject
	Return apiCloseHandle(m.hObject)
Endfunc

********************************************************************************
Function apiCloseThemeData(m.hTheme)
********************************************************************************
	If ctlGetOsVersion() >= NTDDI_WINXP
		Declare Integer CloseThemeData In uxtheme.Dll As apiCloseThemeData ;
			integer hTheme
		Return apiCloseThemeData(m.hTheme)
	Else
		Return 0
	Endif
Endfunc

********************************************************************************
Function apiCoCreateGuid(m.lcGuidStruc)
********************************************************************************
	Declare Integer CoCreateGuid In Ole32.Dll As apiCoCreateGuid;
		String  @lcGuidStruc
	Return apiCoCreateGuid(@m.lcGuidStruc)
Endfunc

********************************************************************************
Function apiCreateFile(m.lpFileName, m.dwDesiredAccess, m.dwShareMode, m.lpSecurityAttributes, m.dwCreationDisposition, m.dwFlagsAndAttributes, m.hTemplateFile)
********************************************************************************
	Declare Integer CreateFile In win32api As apiCreateFile ;
		String  lpFileName, ;
		Integer dwDesiredAccess, ;
		Integer dwShareMode, ;
		Integer lpSecurityAttributes, ;
		Integer dwCreationDisposition, ;
		Integer dwFlagsAndAttributes, ;
		Integer hTemplateFile
	Return apiCreateFile(m.lpFileName, m.dwDesiredAccess, m.dwShareMode, m.lpSecurityAttributes, m.dwCreationDisposition, m.dwFlagsAndAttributes, m.hTemplateFile)
Endfunc

********************************************************************************
Function apiCreateFont(m.nHeight, m.nWidth, m.nEscapement, m.nOrientation, m.fnWeight, m.fdwItalic, m.fdwUnderline, m.fdwStrikeOut, m.fdwCharSet, m.fdwOutputPrecision, m.fdwClipPrecision, m.fdwQuality, m.fdwPitchAndFamily, m.lpszFace)
********************************************************************************
** lpszFace
** [in] Pointer to a null-terminated string that specifies the typeface
** name of the font. The length of this string must not exceed 32 characters,
** including the terminating null character.
********************************************************************************
	Declare Integer CreateFont In win32api As apiCreateFont ;
		Integer nHeight, ;
		Integer nWidth, ;
		Integer nEscapement, ;
		Integer nOrientation, ;
		Integer fnWeight, ;
		Integer fdwItalic, ;
		Integer fdwUnderline, ;
		Integer fdwStrikeOut, ;
		Integer fdwCharSet, ;
		Integer fdwOutputPrecision, ;
		Integer fdwClipPrecision, ;
		Integer fdwQuality, ;
		Integer fdwPitchAndFamily, ;
		String  lpszFace
	Return apiCreateFont(m.nHeight, m.nWidth, m.nEscapement, m.nOrientation, m.fnWeight, m.fdwItalic, m.fdwUnderline, m.fdwStrikeOut, m.fdwCharSet, m.fdwOutputPrecision, m.fdwClipPrecision, m.fdwQuality, m.fdwPitchAndFamily, m.lpszFace)
Endfunc

********************************************************************************
Function apiCreateFontIndirect(m.lpLogFont)
********************************************************************************
	Declare Integer CreateFontIndirect In win32api As apiCreateFontIndirect ;
		String  lpLogFont
	Return apiCreateFontIndirect(m.lpLogFont)
Endfunc

********************************************************************************
Function apiCreateMenu()
********************************************************************************
	Declare Integer CreateMenu In win32api As apiCreateMenu
	Return apiCreateMenu()
Endfunc

********************************************************************************
Function apiCreatePopupMenu()
********************************************************************************
	Declare Integer CreatePopupMenu In win32api As apiCreatePopupMenu
	Return apiCreatePopupMenu()
Endfunc

********************************************************************************
Function apiCreateSolidBrush(m.crColor)
********************************************************************************
	Declare Integer CreateSolidBrush In win32api As apiCreateSolidBrush ;
		Integer crColor
	Return apiCreateSolidBrush(m.crColor)
Endfunc

********************************************************************************
Function apiCreateWindowEx(m.dwExStyle, m.lpClassName, m.lpWindowName, m.dwStyle, m.nx, m.ny, m.nWidth, m.nHeight, m.HWndParent, m.hMenu, m.hInstance, m.lpParam)
********************************************************************************
	Declare Integer CreateWindowEx In win32api As apiCreateWindowEx ;
		Integer dwExStyle, ;
		String  lpClassName, ;
		String  lpWindowName, ;
		Integer dwStyle, ;
		Integer nx, ;
		Integer ny, ;
		Integer nWidth, ;
		Integer nHeight, ;
		Integer hWndParent, ;
		Integer hMenu, ;
		Integer hInstance, ;
		Integer lpParam
	Return apiCreateWindowEx(m.dwExStyle, m.lpClassName, m.lpWindowName, m.dwStyle, m.nx, m.ny, m.nWidth, m.nHeight, m.HWndParent, m.hMenu, m.hInstance, m.lpParam)
Endfunc

********************************************************************************
Function apiDeleteObject(m.hObject)
********************************************************************************
	Declare Integer DeleteObject In win32api As apiDeleteObject;
		Integer hObject
	Return apiDeleteObject(m.hObject)
Endfunc

********************************************************************************
Function apiDestroyMenu(m.hMenu)
********************************************************************************
	Declare Integer DestroyMenu In win32api As apiDestroyMenu;
		Integer hMenu
	Return apiDestroyMenu(m.hMenu)
Endfunc

********************************************************************************
Function apiDestroyWindow(nHWnd)
********************************************************************************
	Declare Integer DestroyWindow In win32api As apiDestroyWindow ;
		Integer nHWnd
	Return apiDestroyWindow(nHWnd)
Endfunc

********************************************************************************
Function apiDrawThemeBackground(m.hTheme, m.hdc, m.iPartId, m.iStateId, m.pRect, m.pClipRect)
********************************************************************************
	If ctlGetOsVersion() >= NTDDI_WINXP
		Declare Integer DrawThemeBackground In uxtheme.Dll As apiDrawThemeBackground ;
			Integer hTheme, ;
			Integer hdc, ;
			Integer iPartId, ;
			Integer iStateId, ;
			String  pRect, ;
			String  pClipRect
		Return apiDrawThemeBackground(m.hTheme, m.hdc, m.iPartId, m.iStateId, m.pRect, m.pClipRect)
	Else
		Return 0
	Endif
Endfunc

********************************************************************************
Function apiEnableMenuItem(m.hMenu, m.uIDEnableItem, m.uEnable)
********************************************************************************
	Declare Integer EnableMenuItem In win32api As apiEnableMenuItem;
		Integer hMenu, ;
		Integer uIDEnableItem, ;
		Integer uEnable
	Return apiEnableMenuItem(m.hMenu, m.uIDEnableItem, m.uEnable)
Endfunc

********************************************************************************
Function apiEnableWindow(m.nHWnd, m.bEnable)
********************************************************************************
	Declare Integer EnableWindow In win32api As apiEnableWindow ;
		integer nHWnd, ;
		integer bEnable
	Return apiEnableWindow(m.nHWnd, m.bEnable)
Endfunc

********************************************************************************
Function apiFileTimeToSystemTime(m.lpFileTime, m.lpSystemTime)
********************************************************************************
	Declare Integer FileTimeToSystemTime In win32api As apiFileTimeToSystemTime ;
		String  lpFileTime, ;
		String  @lpSystemTime
	Return apiFileTimeToSystemTime(m.lpFileTime, @m.lpSystemTime)
Endfunc

********************************************************************************
Function apiFileTimeToLocalFileTime(m.lpFileTime, m.lpLocalFileTime)
********************************************************************************
	Declare Integer FileTimeToLocalFileTime In win32api As apiFileTimeToLocalFileTime ;
		String  lpFileTime, ;
		String  @lpLocalFileTime
	Return apiFileTimeToLocalFileTime(m.lpFileTime, @m.lpLocalFileTime)
Endfunc

********************************************************************************
Function apiFindFirstFile(m.lpFileName, m.lpFindFileData)
********************************************************************************
	Declare Integer FindFirstFile In WIN32API As apiFindFirstFile ;
		string  lpFileName, ;
		string  @lpFindFileData
	Return apiFindFirstFile(m.lpFileName, @m.lpFindFileData)
Endfunc

********************************************************************************
Function apiFindWindow(m.lpClassName, m.lpWindowName)
********************************************************************************
	Declare Integer FindWindow In win32api As apiFindWindow;
		String  lpClassName, ;
		String  lpWindowName
	Return apiFindWindow(m.lpClassName, m.lpWindowName)
Endfunc

********************************************************************************
Function apiFormatMessage(m.dwFlags, m.lpSource, m.dwMessageId, m.dwLanguageId, m.lpBuffer, m.nSize, m.Arguments)
********************************************************************************
	Declare Integer FormatMessage In win32api As apiFormatMessage ;
		Integer dwFlags, ;
		Integer lpSource, ;
		Integer dwMessageId, ;
		Integer dwLanguageId, ;
		String  @lpBuffer, ;
		Integer nSize, ;
		Integer Arguments
	Return apiFormatMessage(m.dwFlags, m.lpSource, m.dwMessageId, m.dwLanguageId, @m.lpBuffer, m.nSize, m.Arguments)
Endfunc

********************************************************************************
Function apiFreeLibrary(m.hLibModule)
********************************************************************************
	Declare Integer FreeLibrary In win32api As apiFreeLibrary ;
		Integer hLibModule
	Return apiFreeLibrary(m.hLibModule)
Endfunc

********************************************************************************
Function apiFtpCommand(m.hConnect, m.fExpectResponse, m.dwFlags, m.lpszCommand, m.dwContext, m.phFtpCommand)
********************************************************************************
	Declare Integer FtpCommand In wininet.Dll As apiFtpCommand ;
		Integer hConnect, ;
		Integer fExpectResponse, ;
		Integer dwFlags, ;
		String  lpszCommand, ;
		Integer dwContext, ;
		Integer @phFtpCommand
	Return apiFtpCommand(m.hConnect, m.fExpectResponse, m.dwFlags, m.lpszCommand, m.dwContext, @m.phFtpCommand)
Endfunc

********************************************************************************
Function apiFtpCreateDirectory(m.hConnect, m.lpszDirectory)
********************************************************************************
	Declare Integer FtpCreateDirectory In wininet.Dll As apiFtpCreateDirectory ;
		Integer hConnect, ;
		String  lpszDirectory
	Return apiFtpCreateDirectory(m.hConnect, m.lpszDirectory)
Endfunc

********************************************************************************
Function apiFtpDeleteFile(m.hConnect, m.lpszFileName)
********************************************************************************
	Declare Integer FtpDeleteFile In wininet.Dll As apiFtpDeleteFile ;
		Integer hConnect, ;
		String  lpszFileName
	Return apiFtpDeleteFile(m.hConnect, m.lpszFileName)
Endfunc

********************************************************************************
Function apiFtpFindFirstFile(m.hConnect, m.lpszSearchFile, m.lpFindFileData, m.dwFlags, m.dwContext)
********************************************************************************
	Declare Integer FtpFindFirstFile In wininet.Dll As apiFtpFindFirstFile ;
		Integer hConnect, ;
		String  lpszSearchFile, ;
		String  @lpFindFileData, ;
		Integer dwFlags, ;
		Integer dwContext
	Return apiFtpFindFirstFile(m.hConnect, m.lpszSearchFile, @m.lpFindFileData, m.dwFlags, m.dwContext)
Endfunc

********************************************************************************
Function apiFtpGetCurrentDirectory(m.hConnect, m.lpszCurrentDirectory, m.lpdwCurrentDirectory)
********************************************************************************
	Declare Integer FtpGetCurrentDirectory In wininet.Dll As apiFtpGetCurrentDirectory ;
		Integer hConnect, ;
		String  @lpszCurrentDirectory, ;
		Integer @lpdwCurrentDirectory
	Return apiFtpGetCurrentDirectory(m.hConnect, @m.lpszCurrentDirectory, @m.lpdwCurrentDirectory)
Endfunc

********************************************************************************
Function apiFtpGetFile(m.hConnect, m.lpszRemoteFile, m.lpszNewFile, m.fFailIfExists, m.dwFlagsAndAttributes, m.dwFlags, m.dwContext)
********************************************************************************
	Declare Integer FtpGetFile In wininet.Dll As apiFtpGetFile ;
		Integer hConnect, ;
		String  lpszRemoteFile, ;
		String  lpszNewFile, ;
		Integer fFailIfExists, ;
		Integer dwFlagsAndAttributes, ;
		Integer dwFlags, ;
		Integer dwContext
	Return apiFtpGetFile(m.hConnect, m.lpszRemoteFile, m.lpszNewFile, m.fFailIfExists, m.dwFlagsAndAttributes, m.dwFlags, m.dwContext)
Endfunc

********************************************************************************
Function apiFtpGetFileSize(m.hFile, m.lpdwFileSizeHigh)
********************************************************************************
	Declare Integer FtpGetFileSize In wininet.Dll As apiFtpGetFileSize ;
		Integer hFile, ;
		Integer @lpdwFileSizeHigh
	Return apiFtpGetFileSize(m.hFile, @m.lpdwFileSizeHigh)
Endfunc

********************************************************************************
Function apiFtpOpenFile(m.hConnect, m.lpszFileName, m.dwAccess, m.dwFlags, m.dwContext)
********************************************************************************
	Declare Integer FtpOpenFile In wininet.Dll As apiFtpOpenFile ;
		Integer hConnect, ;
		String  lpszFileName, ;
		Integer dwAccess, ;
		Integer dwFlags, ;
		Integer dwContext
	Return apiFtpOpenFile(m.hConnect, m.lpszFileName, m.dwAccess, m.dwFlags, m.dwContext)
Endfunc

********************************************************************************
Function apiFtpPutFile(m.hConnect, m.lpszLocalFile, m.lpszNewRemoteFile, m.dwFlags, m.dwContext)
********************************************************************************
	Declare Integer FtpPutFile In wininet.Dll As apiFtpPutFile ;
		Integer hConnect, ;
		String  lpszLocalFile, ;
		String  lpszNewRemoteFile, ;
		Integer dwFlags, ;
		Integer dwContext
	Return apiFtpPutFile(m.hConnect, m.lpszLocalFile, m.lpszNewRemoteFile, m.dwFlags, m.dwContext)
Endfunc

********************************************************************************
Function apiFtpRemoveDirectory(m.hConnect, m.lpszDirectory)
********************************************************************************
	Declare Integer FtpRemoveDirectory In wininet.Dll As apiFtpRemoveDirectory ;
		Integer hConnect, ;
		String  lpszDirectory
	Return apiFtpRemoveDirectory(m.hConnect, m.lpszDirectory)
Endfunc

********************************************************************************
Function apiFtpRenameFile(m.hConnect, m.lpszExisting, m.lpszNew)
********************************************************************************
	Declare Integer FtpRenameFile In wininet.Dll As apiFtpRenameFile ;
		Integer hConnect, ;
		String  lpszExisting, ;
		String  lpszNew
	Return apiFtpRenameFile(m.hConnect, m.lpszExisting, m.lpszNew)
Endfunc

********************************************************************************
Function apiFtpSetCurrentDirectory(m.hConnect, m.lpszDirectory)
********************************************************************************
	Declare Integer FtpSetCurrentDirectory In wininet.Dll As apiFtpSetCurrentDirectory ;
		Integer hConnect, ;
		String  lpszDirectory
	Return apiFtpSetCurrentDirectory(m.hConnect, m.lpszDirectory)
Endfunc

********************************************************************************
Function apiGetCaretPos(m.lpPoint)
********************************************************************************
	Declare Integer GetCaretPos In win32api As apiGetCaretPos;
		String @lpPoint
	Return apiGetCaretPos(@m.lpPoint)

********************************************************************************
Function apiGetClientRect(m.nHWnd, m.lcRect)
********************************************************************************
	Declare Integer GetClientRect In win32api As apiGetClientRect ;
		Integer nHWnd,;
		String  @lcRect
	Return apiGetClientRect(m.nHWnd, @m.lcRect)
Endfunc

********************************************************************************
Function apiGetCursorPos(m.lpPoint)
********************************************************************************
	Declare Integer GetCursorPos In win32api As apiGetCursorPos;
		String  @lpPoint
	Return apiGetCursorPos(@m.lpPoint)
Endfunc

********************************************************************************
Function apiGetDateFormat(m.Locale, m.dwFlags, m.lpDate, m.lpFormat, m.lpDateStr, m.cchDate)
********************************************************************************
	Declare Integer GetDateFormat In win32api As apiGetDateFormat ;
		Integer Locale, ;
		Integer dwFlags, ;
		String  lpDate, ;
		String  lpFormat, ;
		String  @lpDateStr, ;
		Integer cchDate
	Return apiGetDateFormat(m.Locale, m.dwFlags, m.lpDate, m.lpFormat, @m.lpDateStr, m.cchDate)
Endfunc

********************************************************************************
Function apiGetDC(m.nHWnd)
********************************************************************************
	Declare Integer GetDC In win32api As apiGetDC ;
		Integer nHWnd
	Return apiGetDC(m.nHWnd)
Endfunc

********************************************************************************
Function apiGetDesktopWindow()
********************************************************************************
	Declare Integer GetDesktopWindow In win32api As apiGetDesktopWindow
	Return apiGetDesktopWindow()
Endfunc

********************************************************************************
Function apiGetDeviceCaps(m.hdc, m.nIndex)
********************************************************************************
	Declare Integer GetDeviceCaps In win32api As apiGetDeviceCaps ;
		Integer hdc, ;
		Integer nIndex
	Return apiGetDeviceCaps(m.hdc, m.nIndex)
Endfunc

********************************************************************************
Function apiGetFileSizeEx(m.hFile, m.lpFileSize)
********************************************************************************
	Declare Integer GetFileSizeEx In win32api As apiGetFileSizeEx ;
		Integer hFile, ;
		String  @lpFileSize
	Return apiGetFileSizeEx(m.hFile, @m.lpFileSize)
Endfunc

********************************************************************************
Function apiGetForegroundWindow()
********************************************************************************
	Declare Integer GetForegroundWindow In win32api As apiGetForegroundWindow
	Return apiGetForegroundWindow()
Endfunc

********************************************************************************
Function apiGetIpAddrTable(m.pIpAddrTable, m.pdwSize, m.nbOrder)
********************************************************************************
	Declare Integer GetIpAddrTable In iphlpapi.Dll As apiGetIpAddrTable ;
		String  @pIpAddrTable, ;
		Integer @pdwSize, ;
		Integer  nbOrder
	Return apiGetIpAddrTable(@m.pIpAddrTable, @m.pdwSize, m.nbOrder)
Endfunc

********************************************************************************
Function apiGetKeyState(m.nVirtKey)
********************************************************************************
	Declare Integer GetKeyState In win32api As apiGetKeyState ;
		Integer nVirtKey
	Return apiGetKeyState(m.nVirtKey)
Endfunc

********************************************************************************
Function apiGetLastError()
********************************************************************************
	Declare Integer GetLastError In win32api As apiGetLastError
	Return apiGetLastError()
Endfunc

********************************************************************************
Function apiGetLocaleInfo(m.Locale, m.LCType, m.lpLCData, m.cchData)
********************************************************************************
	Declare Integer GetLocaleInfo In win32api As apiGetLocaleInfo;
		Integer Locale, ;
		Integer LCType, ;
		String  @lpLCData, ;
		Integer cchData
	Return apiGetLocaleInfo(m.Locale, m.LCType, @m.lpLCData, m.cchData)
Endfunc

********************************************************************************
Function apiGetMenu(m.nHWnd)
********************************************************************************
	Declare Integer GetMenu In win32api As apiGetMenu ;
		Integer nhwnd
	Return apiGetMenu(m.nHWnd)
Endfunc

********************************************************************************
Function apiGetMenuBarInfo(m.nHWnd, m.idObject, m.idItem, m.pmbi)
********************************************************************************
	Declare Integer GetMenuBarInfo In win32api As apiGetMenuBarInfo ;
		Integer nhwnd, ;
		Integer idObject, ;
		Integer idItem, ;
		String  @pmbi
	Return apiGetMenuBarInfo(m.nHWnd, m.idObject, m.idItem, m.pmbi)
Endfunc

********************************************************************************
Function apiGetMenuCheckMarkDimensions()
********************************************************************************
*!* The GetMenuCheckMarkDimensions function is included only for compatibility
*!* with 16-bit versions of Microsoft Windows. Applications should use the
*!* GetSystemMetrics function with the CXMENUCHECK and CYMENUCHECK values to
*!* retrieve the bitmap dimensions.
	Return apiGetSystemMetrics(SM_CXMENUCHECK) + apiGetSystemMetrics(SM_CYMENUCHECK) * 0x10000
Endfunc

********************************************************************************
Function apiGetMenuContextHelpId(m.hMenu)
********************************************************************************
	Declare Integer GetMenuContextHelpId In win32api As apiGetMenuContextHelpId ;
		Integer hMenu
	Return apiGetMenuContextHelpId(m.hMenu)
Endfunc

********************************************************************************
Function apiGetMenuDefaultItem(m.hMenu, m.fByPos, m.gmdiFlags)
********************************************************************************
	Declare Integer GetMenuDefaultItem In win32api As apiGetMenuDefaultItem ;
		Integer hMenu, ;
		Integer fByPos, ;
		Integer gmdiFlags
	Return apiGetMenuDefaultItem(m.hMenu, m.fByPos, m.gmdiFlags)
Endfunc

********************************************************************************
Function apiGetMenuInfo(m.hMenu, m.lpcmi)
********************************************************************************
	Declare Integer GetMenuInfo In win32api As apiGetMenuInfo ;
		Integer hmenu, ;
		String  @lpcmi
	Return apiGetMenuInfo(m.hMenu, m.lpcmi)
Endfunc

********************************************************************************
Function apiGetMenuItemCount(m.hMenu)
********************************************************************************
	Declare Integer GetMenuItemCount In win32api As apiGetMenuItemCount ;
		Integer hMenu
	Return apiGetMenuItemCount(m.hMenu)
Endfunc

********************************************************************************
Function apiGetMenuItemID(m.hMenu, m.nPos)
********************************************************************************
	Declare Integer GetMenuItemID In win32api As apiGetMenuItemID ;
		Integer hMenu, ;
		Integer nPos
	Return apiGetMenuItemID(m.hMenu, m.nPos)
Endfunc

********************************************************************************
Function apiGetMenuItemInfo(m.hMenu, m.uItem, m.fByPosition, m.lpmii)
********************************************************************************
	Declare Integer GetMenuItemInfo In win32api As apiGetMenuItemInfo ;
		Integer hMenu, ;
		Integer uItem, ;
		Integer fByPosition, ;
		String  @lpmii
	Return apiGetMenuItemInfo(m.hMenu, m.uItem, m.fByPosition, @m.lpmii)
Endfunc

********************************************************************************
Function apiGetMenuItemRect(m.nHWnd, m.hMenu, m.uItem, m.lprcItem)
********************************************************************************
	Declare Integer GetMenuItemRect In win32api As apiGetMenuItemRect ;
		Integer nHWnd, ;
		Integer hMenu, ;
		Integer uItem, ;
		String  @lprcItem
	Return apiGetMenuItemRect(m.nHWnd, m.hMenu, m.uItem, @m.lprcItem)
Endfunc

********************************************************************************
Function apiGetMenuState(m.hMenu, m.uID, m.uwFlags)
********************************************************************************
	Declare Integer GetMenuState In win32api As apiGetMenuState ;
		Integer hMenu, ;
		Integer uID, ;
		Integer uFlags
	Return apiGetMenuState(m.hMenu, m.uID, m.uwFlags)
Endfunc

********************************************************************************
Function apiGetMenuString(m.hMenu, m.uIDItem , m.lpString , m.nMaxCount , m.uFlag)
********************************************************************************
	Declare Integer GetMenuString In win32api As apiGetMenuString ;
		Integer hMenu, ;
		Integer uIDItem, ;
		String  @lpString, ;
		Integer nMaxCount, ;
		Integer uFlag
	Return apiGetMenuString(m.hMenu, m.uIDItem , @m.lpString , m.nMaxCount , m.uFlag)
Endfunc

********************************************************************************
Function apiGetModuleHandle(m.lpModule)
********************************************************************************
	Declare Integer GetModuleHandle In win32api As apiGetModuleHandle ;
		String  lpModule
	Return apiGetModuleHandle(m.lpModule)
Endfunc

********************************************************************************
Function apiGetMonitorInfo(m.hMonitor, m.lpmi)
********************************************************************************
	Declare Integer GetMonitorInfo In win32api As apiGetMonitorInfo ;
		Integer hMonitor, ;
		String  @lpmi
	Return apiGetMonitorInfo(m.hMonitor, @m.lpmi)
Endfunc

********************************************************************************
Function apiGetObject(m.hObject, m.nCount, m.lpObject)
********************************************************************************
*#beautify keyword_nochange
	Declare Integer GetObject In win32api as apiGetObject ;
		Integer hObject, ;
		Integer nCount, ;
		String  @lpObject
*#beautify
	Return apiGetObject(m.hObject, m.nCount, @m.lpObject)
Endfunc

********************************************************************************
Function apiGetParent(m.nHWnd)
********************************************************************************
	Declare Integer GetParent In win32api As apiGetParent;
		Integer nHWnd
	Return apiGetParent(m.nHWnd)
Endfunc

********************************************************************************
Function apiGetProcAddress(m.hModule, m.lpProcName)
********************************************************************************
	Declare Integer GetProcAddress In win32api As apiGetProcAddress;
		Integer hModule, ;
		String lpProcName
	Return apiGetProcAddress(m.hModule, m.lpProcName)
Endfunc

********************************************************************************
Function apiGetProcessHeap()
********************************************************************************
	Declare Integer GetProcessHeap In win32api As apiGetProcessHeap
	Return apiGetProcessHeap()
Endfunc

********************************************************************************
Function apiGetProp(m.nHWnd, m.lpString)
********************************************************************************
	Declare Integer GetProp In win32api As apiGetProp ;
		Integer nHWnd, ;
		String  lpString
	Return apiGetProp(m.nHWnd, m.lpString)
Endfunc

********************************************************************************
Function apiGetSubMenu(m.hMenu, m.nPos)
********************************************************************************
	Declare Integer GetSubMenu In win32api As apiGetSubMenu ;
		Integer hMenu, ;
		Integer nPos
	Return apiGetSubMenu(m.hMenu, m.nPos)
Endfunc

********************************************************************************
Function apiGetSysColor(m.nIndex)
********************************************************************************
	Declare Integer GetSysColor In win32api As apiGetSysColor ;
		Integer nIndex
	Return apiGetSysColor(m.nIndex)
Endfunc

********************************************************************************
Function apiGetTextExtentPoint32(m.hdc, m.lpsz, m.cbString, m.lpSize)
********************************************************************************
	Declare Integer GetTextExtentPoint32 In win32api As apiGetTextExtentPoint32 ;
		Integer hdc, ;
		String  lpsz, ;
		Integer cbString, ;
		String  @lpSize
	Return apiGetTextExtentPoint32(m.hdc, m.lpsz, m.cbString, @m.lpSize)
Endfunc

********************************************************************************
Function apiGetThemeBitmap(m.hTheme, m.iPartId, m.iStateId , m.iPropId, m.dwFlags, m.phBitmap)
********************************************************************************
	If ctlGetOsVersion() >= NTDDI_VISTA
		Declare Integer GetThemeBitmap In uxtheme.Dll As apiGetThemeBitmap ;
			Integer hTheme, ;
			Integer iPartId, ;
			Integer iStateId, ;
			Integer dwFlags, ;
			Integer @phBitmap
		Return apiGetThemeBitmap(m.hTheme, m.iPartId, m.iStateId , m.iPropId, m.dwFlags, m.phBitmap)
	Else
		Return 0
	Endif
Endfunc

********************************************************************************
Function apiGetThemeColor(m.hTheme, m.iPartId , m.iStateId , m.iPropId, m.pColor)
********************************************************************************
	If ctlGetOsVersion() >= NTDDI_WINXP
		Declare Integer GetThemeColor In uxtheme.Dll As apiGetThemeColor ;
			Integer hTheme, ;
			Integer iPartId, ;
			Integer iStateId, ;
			Integer iPropId, ;
			Integer @pColor
		Return apiGetThemeColor(m.hTheme, m.iPartId , m.iStateId , m.iPropId , @m.pColor )
	Else
		Return 0
	Endif
Endfunc

********************************************************************************
Function apiGetThemePartSize(m.hTheme, m.hdc, m.iPartId, m.iStateId, m.prc, m.eSize, m.psz)
********************************************************************************
	If ctlGetOsVersion() >= NTDDI_WINXP
		Declare Integer GetThemePartSize In uxtheme.Dll As apiGetThemePartSize ;
			Integer hTheme, ;
			Integer hdc, ;
			Integer iPartId, ;
			Integer iStateId, ;
			String  prc, ;
			Integer eSize, ;
			String  @psz
		Return apiGetThemePartSize(m.hTheme, m.hdc, m.iPartId, m.iStateId, m.prc, m.eSize, @m.psz)
	Else
		Return 0
	Endif
Endfunc

********************************************************************************
Function apiGetTickCount()
********************************************************************************
	Declare Integer GetTickCount In win32api As apiGetTickCount
	Return apiGetTickCount()
Endfunc

********************************************************************************
Function apiGetScrollPos (m.nWnd, m.nBar)
********************************************************************************
	Declare Integer GetScrollPos In win32api As apiGetScrollPos ;
		Integer nHWnd, ;
		Integer nBar
	Return apiGetScrollPos(m.nWnd, m.nBar)
Endfunc

********************************************************************************
Function apiGetScrollRange(m.nHWnd, m.nBar, m.lpMinPos, m.lpMaxPos)
********************************************************************************
	Declare Integer GetScrollRange In win32api As apiGetScrollRange ;
		Integer nHWnd, ;
		Integer nBar, ;
		Integer @lpMinPos, ;
		Integer @lpMaxPos
	Return apiGetScrollRange(m.nHWnd, m.nBar, @m.lpMinPos, @m.lpMaxPos)
Endfunc

********************************************************************************
Function apiGetSystemMetrics(m.nIndex)
********************************************************************************
	Declare Integer GetSystemMetrics In win32api As apiGetSystemMetrics ;
		Integer nIndex
	Return apiGetSystemMetrics(m.nIndex)
Endfunc

********************************************************************************
Function apiGetWindow(m.nHWnd, m.wCmd)
********************************************************************************
	Declare Integer GetWindow In win32api As apiGetWindow;
		Integer nHWnd, ;
		Integer wCmd
	Return apiGetWindow(m.nHWnd, m.wCmd)
Endfunc

********************************************************************************
Function apiGetWindowLong(m.nHWnd, m.nIndex)
********************************************************************************
	Declare Integer GetWindowLong In win32api As apiGetWindowLong;
		Integer nHWnd, ;
		Integer nIndex
	Return apiGetWindowLong(m.nHWnd, m.nIndex)
Endfunc

********************************************************************************
Function apiGetWindowPlacement(m.nHWnd, m.lpwndpl)
********************************************************************************
	Declare Integer GetWindowPlacement In win32api As apiGetWindowPlacement ;
		Integer nHWnd, ;
		String  @lpwndpl
	Return apiGetWindowPlacement(m.nHWnd, @m.lpwndpl)
Endfunc

********************************************************************************
Function apiGetWindowRect(m.nHWnd, m.lcRect)
********************************************************************************
	Declare Integer GetWindowRect In win32api As apiGetWindowRect ;
		Integer nHWnd, ;
		String  @lcRect
	Return apiGetWindowRect(m.nHWnd, @m.lcRect)
Endfunc

********************************************************************************
Function apiGetWindowThreadProcessId(m.nHWnd, m.lpdwProcessId)
********************************************************************************
	Declare Integer GetWindowThreadProcessId In win32api As apiGetWindowThreadProcessId;
		Integer nHWnd, ;
		Integer lpdwProcessId
	Return apiGetWindowThreadProcessId(m.nHWnd, m.lpdwProcessId)
Endfunc

********************************************************************************
Function apiHeapAlloc(m.hHeap, m.dwFlags, m.dwBytes)
********************************************************************************
	Declare Integer HeapAlloc In win32api As apiHeapAlloc ;
		Integer hHeap, ;
		Integer dwFlags, ;
		Integer dwBytes
	Return apiHeapAlloc(m.hHeap, m.dwFlags, m.dwBytes)
Endfunc

********************************************************************************
Function apiHeapSize(m.hHeap, m.dwFlags, m.lpMem)
********************************************************************************
	Declare Integer HeapSize In win32api As apiHeapSize;
		Integer hHeap, ;
		Integer dwFlags, ;
		Integer lpMem
	Return apiHeapFree(m.hHeap, m.dwFlags, m.lpMem)
Endfunc

********************************************************************************
Function apiHeapFree(m.hHeap, m.dwFlags, m.lpMem)
********************************************************************************
	Declare Integer HeapFree In win32api As apiHeapFree;
		Integer hHeap, ;
		Integer dwFlags, ;
		Integer lpMem
	Return apiHeapFree(m.hHeap, m.dwFlags, m.lpMem)
Endfunc

********************************************************************************
Function apiInsertMenuItem(m.hMenu, m.uItem, m.fByPosition, lpmii)
********************************************************************************
	Declare Integer InsertMenuItem In win32api As apiInsertMenuItem ;
		Integer hMenu, ;
		Integer uItem, ;
		Integer fByPosition, ;
		String  @lpmii
	Return apiInsertMenuItem(m.hMenu, m.uItem, m.fByPosition, @lpmii)
Endfunc

********************************************************************************
Function apiInitCommonControlsEx(m.lpInitCtrls)
********************************************************************************
	Declare Integer InitCommonControlsEx In comctl32.Dll As apiInitCommonControlsEx ;
		String  lpInitCtrls
	Return apiInitCommonControlsEx(m.lpInitCtrls)
Endfunc

********************************************************************************
Function apiInternetCloseHandle(m.hInternet)
********************************************************************************
	Declare Integer InternetCloseHandle In wininet.Dll As apiInternetCloseHandle ;
		Integer hInternet
	Return apiInternetCloseHandle(m.hInternet)
Endfunc

********************************************************************************
Function apiInternetConnect(m.hInternet, m.lpszServerName, m.nServerPort, m.lpszUserName, m.lpszPassword, m.dwService, m.dwFlags, m.dwContext)
********************************************************************************
	Declare Integer InternetConnect In wininet.Dll As apiInternetConnect ;
		Integer hInternet, ;
		String  lpszServerName, ;
		Integer nServerPort, ;
		String  lpszUserName, ;
		String  lpszPassword, ;
		Integer dwService, ;
		Integer dwFlags, ;
		Integer dwContext
	Return apiInternetConnect(m.hInternet, m.lpszServerName, m.nServerPort, m.lpszUserName, m.lpszPassword, m.dwService, m.dwFlags, m.dwContext)
Endfunc

********************************************************************************
Function apiInternetCrackUrl(m.lpszUrl, m.dwUrlLength, m.dwFlags, m.lpUrlComponents)
********************************************************************************
	Declare Integer InternetCrackUrl In wininet.Dll As apiInternetCrackUrl ;
		String  lpszUrl, ;
		Integer dwUrlLength, ;
		Integer dwFlags, ;
		String  @lpUrlComponents
	Return apiInternetCrackUrl(m.lpszUrl, m.dwUrlLength, m.dwFlags, @m.lpUrlComponents)
Endfunc

********************************************************************************
Function apiInternetErrorDlg(m.nHWnd, m.hRequest, m.dwError, m.dwFlags, m.lppvData)
********************************************************************************
	Declare Integer InternetErrorDlg In wininet.Dll As apiInternetErrorDlg ;
		Integer nhWnd, ;
		Integer hRequest, ;
		Integer dwError, ;
		Integer dwFlags, ;
		Integer lppvData
	Return apiInternetErrorDlg(m.nHWnd, m.hRequest, m.dwError, m.dwFlags, m.lppvData)
Endfunc

********************************************************************************
Function apiInternetFindNextFile(m.hFind, m.lpFindFileData)
********************************************************************************
	Declare Integer InternetFindNextFile In wininet.Dll As apiInternetFindNextFile ;
		Integer hFind, ;
		String  @lpFindFileData
	Return apiInternetFindNextFile(m.hFind, @m.lpFindFileData)
Endfunc

********************************************************************************
Function apiInternetGetLastResponseInfo(m.lpdwError, m.lpszBuffer, m.lpdwBufferLength)
********************************************************************************
	Declare Integer InternetGetLastResponseInfo In wininet.Dll As apiInternetGetLastResponseInfo ;
		Integer @lpdwError, ;
		String  @lpszBuffer, ;
		Integer @lpdwBufferLength
	Return apiInternetGetLastResponseInfo(@m.lpdwError, @m.lpszBuffer, @m.lpdwBufferLength)
Endfunc

********************************************************************************
Function apiInternetOpen(m.lpszAgent, m.dwAccessType, m.lpszProxy, m.lpszProxyBypass, m.dwFlags)
********************************************************************************
	Declare Integer InternetOpen In wininet.Dll As apiInternetOpen ;
		String  lpszAgent, ;
		Integer dwAccessType, ;
		String  lpszProxy, ;
		String  lpszProxyBypass, ;
		Integer dwFlags
	Return apiInternetOpen(m.lpszAgent, m.dwAccessType, m.lpszProxy, m.lpszProxyBypass, m.dwFlags)
Endfunc

********************************************************************************
Function apiInternetQueryDataAvailable(m.hFile, m.lpdwNumberOfBytesAvailable, m.dwFlags, m.dwContext)
********************************************************************************
	Declare Integer InternetQueryDataAvailable In wininet.Dll As apiInternetQueryDataAvailable ;
		Integer hFile, ;
		Integer @lpdwNumberOfBytesAvailable, ;
		Integer dwFlags, ;
		Integer dwContext
	Return apiInternetQueryDataAvailable(m.hFile, @m.lpdwNumberOfBytesAvailable, m.dwFlags, m.dwContext)
Endfunc

********************************************************************************
Function apiInternetQueryOption(m.hInternet, m.dwOption, m.lpBuffer, m.lpdwBufferLength)
********************************************************************************
	Declare Integer InternetQueryOption In wininet.Dll As apiInternetQueryOption ;
		Integer hInternet, ;
		Integer dwOption, ;
		String  @lpBuffer, ;
		Integer @lpdwBufferLength
	Return apiInternetQueryOption(m.hInternet, m.dwOption, @m.lpBuffer, @m.lpdwBufferLength)
Endfunc

********************************************************************************
Function apiInternetReadFile(m.hFile, m.lpBuffer, m.dwNumberOfBytesToRead, m.lpdwNumberOfBytesRead)
********************************************************************************
	Declare Integer InternetReadFile In wininet.Dll As apiInternetReadFile ;
		Integer hFile, ;
		String  @lpBuffer, ;
		Integer dwNumberOfBytesToRead, ;
		Integer @lpdwNumberOfBytesRead
	Return apiInternetReadFile(m.hFile, @m.lpBuffer, m.dwNumberOfBytesToRead, @m.lpdwNumberOfBytesRead)
Endfunc

********************************************************************************
Function apiInternetReadFileEx(m.hFile, m.lpBuffersOut, m.dwFlags, m.dwContext)
********************************************************************************
	Declare Integer InternetReadFileEx In wininet.Dll As apiInternetReadFileEx ;
		Integer hFile, ;
		String  @lpBuffersOut, ;
		Integer dwFlags, ;
		Integer dwContext
	Return apiInternetReadFileEx(m.hFile, m.lpBuffersOut, m.dwFlags, m.dwContext)
Endfunc

********************************************************************************
Function apiInternetSetFilePointer(m.hFile, m.lDistanceToMove, m.pReserved, m.dwMoveMethod, m.dwContext)
********************************************************************************
	Declare Integer InternetSetFilePointer In wininet.Dll As apiInternetSetFilePointer ;
		Integer hFile, ;
		Integer lDistanceToMove, ;
		String  pReserved, ;
		Integer dwMoveMethod, ;
		Integer dwContext
	Return apiInternetSetFilePointer(m.hFile, m.lDistanceToMove, m.pReserved, m.dwMoveMethod, m.dwContext)
Endfunc

********************************************************************************
Function apiInternetSetOption(m.hInternet, m.dwOption, m.lpBuffer, m.dwBufferLength)
********************************************************************************
	Declare Integer InternetSetOption In wininet.Dll As apiInternetSetOption ;
		Integer hInternet, ;
		Integer dwOption, ;
		String  lpBuffer, ;
		Integer dwBufferLength
	Return apiInternetSetOption(m.hInternet, m.dwOption, m.lpBuffer, m.dwBufferLength)
Endfunc

********************************************************************************
Function apiInternetWriteFile(m.hFile, m.lpBuffer, m.dwNumberOfBytesToWrite, m.lpdwNumberOfBytesWritten)
********************************************************************************
	Declare Integer InternetWriteFile In wininet.Dll As apiInternetWriteFile ;
		Integer hFile, ;
		String  lpBuffer, ;
		Integer dwNumberOfBytesToWrite, ;
		Integer @lpdwNumberOfBytesWritten
	Return apiInternetWriteFile(m.hFile, m.lpBuffer, m.dwNumberOfBytesToWrite, @m.lpdwNumberOfBytesWritten)
Endfunc

********************************************************************************
Function apiIsIconic(m.nHWnd)
********************************************************************************
	Declare Integer IsIconic In win32api As apiIsIconic;
		Integer nHWnd
	Return apiIsIconic(m.nHWnd)
Endfunc

********************************************************************************
Function apiIsThemeActive()
********************************************************************************
	If ctlGetOsVersion() >= NTDDI_WINXP
		Declare Integer IsThemeActive In uxtheme.Dll As apiIsThemeActive
		Return apiIsThemeActive()
	Else
		Return 0
	Endif
Endfunc

********************************************************************************
Function apiIsWindow(m.nHWnd)
********************************************************************************
	Declare Integer IsWindow In win32api As apiIsWindow ;
		Integer nHWnd
	Return apiIsWindow(m.nHWnd)
Endfunc

********************************************************************************
Function apiLoadLibrary(m.lpLibFileName)
********************************************************************************
	Declare Integer LoadLibrary In win32api As apiLoadLibrary;
		String lpLibFileName
	Return apiLoadLibrary(m.lpLibFileName)
Endfunc

********************************************************************************
Function apiLoadMenu(m.hInstance, m.lpMenuName)
********************************************************************************
	Declare Integer LoadMenu In WIN32API As apiLoadMenu ;
		Integer hInstance, ;
		Integer lpMenuName
	Return apiLoadMenu(m.hInstance, m.lpMenuName)
Endfunc

********************************************************************************
Function apiMonitorFromRect(m.lprc, m.dwFlags)
********************************************************************************
	Declare Integer MonitorFromRect In win32api As apiMonitorFromRect ;
		String  @lprc, ;
		Integer dwFlags
	Return apiMonitorFromRect(@m.lprc, m.dwFlags)
Endfunc

********************************************************************************
Function apiMulDiv(m.nNumber, m.nNumerator, m.nDenominator)
********************************************************************************
	Declare Integer MulDiv In win32api As apiMulDiv ;
		Integer nNumber, ;
		Integer nNumerator, ;
		Integer nDenominator
	Return apiMulDiv(m.nNumber, m.nNumerator, m.nDenominator)
Endfunc

********************************************************************************
Function apiReadFile(m.hFile, m.lpBuffer, m.nNumberOfBytesToRead, m.lpNumberOfBytesRead, m.lpOverlapped)
********************************************************************************
	Declare Integer ReadFile In win32api As apiReadFile ;
		Integer hFile, ;
		String  @lpBuffer, ;
		Integer nNumberOfBytesToRead, ;
		Integer @lpNumberOfBytesRead, ;
		Integer lpOverlapped
	Return apiReadFile(m.hFile, @m.lpBuffer, m.nNumberOfBytesToRead, @m.lpNumberOfBytesRead, m.lpOverlapped)
Endfunc

********************************************************************************
Function apiRealGetWindowClass(m.nHWnd, m.pszType, m.cchType)
********************************************************************************
	Declare Integer RealGetWindowClass In win32api As apiRealGetWindowClass ;
		Integer nHWnd,;
		String  @pszType,;
		Integer cchType
	Return apiRealGetWindowClass(m.nHWnd, @m.pszType, m.cchType)
Endfunc

********************************************************************************
Function apiOpenFile(m.lpFileName, m.lpReOpenBuff, m.wStyle)
********************************************************************************
**
** Only use this function with 16-bit versions of Windows. For newer
** applications, use the CreateFile function.
**
********************************************************************************
	Declare Integer OpenFile In win32api As apiOpenFile ;
		String  lpFileName, ;
		String  @lpReOpenBuff, ;
		Integer wStyle
	Return apiOpenFile(m.lpFileName, @m.lpReOpenBuff, m.wStyle)
Endfunc

********************************************************************************
Function apiOpenThemeData(m.nHWnd, m.pszClassList)
********************************************************************************
	If ctlGetOsVersion() >= NTDDI_WINXP
		Declare Integer OpenThemeData In uxtheme.Dll As apiOpenThemeData ;
			Integer nHwnd, ;
			String  pszClassList
		Return apiOpenThemeData(m.nHWnd, m.pszClassList)
	Else
		Return 0
	Endif
Endfunc

********************************************************************************
Function apiRegCloseKey(m.hKeyHandle)
********************************************************************************
	Declare Integer RegCloseKey In win32api As apiRegCloseKey;
		Integer hKeyHandle
	Return apiRegCloseKey(m.hKeyHandle)
Endfunc

********************************************************************************
Function apiRegCreateKeyEx(m.hKey, m.lpSubKey, m.Reserved, m.lpClass, m.dwOptions, m.samDesired, m.lpSecurityAttributes, m.phkResult, m.lpdwDisposition)
********************************************************************************
	Declare Integer RegCreateKeyEx In win32api As apiRegCreateKeyEx ;
		Integer hKey, ;
		String  lpSubKey, ;
		Integer Reserved, ;
		String  lpClass, ;
		Integer dwOptions, ;
		Integer samDesired, ;
		Integer lpSecurityAttributes, ;
		Integer @phkResult, ;
		Integer @lpdwDisposition
	Return apiRegCreateKeyEx(m.hKey, m.lpSubKey, m.Reserved, m.lpClass, m.dwOptions, m.samDesired, m.lpSecurityAttributes, @m.phkResult, @m.lpdwDisposition)
Endfunc

********************************************************************************
Function apiRegDeleteValue(m.hKey, m.lpValueName)
********************************************************************************
	Declare Integer RegDeleteValue In advapi32.Dll As apiRegDeleteValue ;
		Integer hKey, ;
		String  lpValueName
	Return apiRegDeleteValue(m.hKey, m.lpValueName)
Endfunc

********************************************************************************
Function apiRegOpenKeyEx(m.hKey, m.lpSubKey, m.ulOptions, m.samDesired, m.phkResult)
********************************************************************************
	Declare Integer RegOpenKeyEx In win32api As apiRegOpenKeyEx;
		Integer hKey, ;
		String  lpSubKey, ;
		Integer ulOptions, ;
		Integer samDesired, ;
		Integer @phkResult
	Return apiRegOpenKeyEx(m.hKey, m.lpSubKey, m.ulOptions, m.samDesired, @m.phkResult)
Endfunc

********************************************************************************
Function apiRegQueryValueEx(m.hKeyHandle, m.lpValueName, m.lpReserved, m.lpType, m.lpData, m.lpcbData)
********************************************************************************
	Declare Integer RegQueryValueEx In win32api As apiRegQueryValueEx ;
		Integer hKeyHandle, ;
		String  lpValueName, ;
		Integer lpReserved, ;
		Integer @lpType, ;
		String  @lpData, ;
		Integer @lpcbData
	Return apiRegQueryValueEx(m.hKeyHandle, m.lpValueName, m.lpReserved, @m.lpType, @m.lpData, @m.lpcbData)
Endfunc

********************************************************************************
Function apiRegSetValueEx(m.hKeyHandle, m.lpValueName, m.Reserved, m.dwType, m.lpData, m.cbData)
********************************************************************************
	Declare Integer RegSetValueEx In win32api As apiRegSetValueEx ;
		Integer hKeyHandle, ;
		String  lpValueName, ;
		Integer Reserved, ;
		Integer dwType, ;
		String  @lpData, ;
		Integer cbData
	Return apiRegSetValueEx(m.hKeyHandle, m.lpValueName, m.Reserved, m.dwType, @m.lpData, m.cbData)
Endfunc

********************************************************************************
Function apiReleaseDC(m.nHWnd, m.hdc)
********************************************************************************
	Declare Integer ReleaseDC In win32api As apiReleaseDC ;
		Integer nHWnd, ;
		Integer hdc
	Return apiReleaseDC(m.nHWnd, m.hdc)
Endfunc

********************************************************************************
Function apiScreenToClient(m.nHWnd, m.lpPoint)
********************************************************************************
	Declare Integer ScreenToClient In win32api As apiScreenToClient ;
		Integer nHWnd, ;
		String  @lpPoint
	Return apiScreenToClient(m.nHWnd, @m.lpPoint)
Endfunc

********************************************************************************
Function apiSelectObject(m.hdc, m.hObject)
********************************************************************************
	Declare Integer SelectObject In win32api As apiSelectObject ;
		Integer hdc, ;
		Integer hObject
	Return apiSelectObject(m.hdc, m.hObject)
Endfunc

********************************************************************************
Function apiSendMessage(m.nHWnd, m.msg, m.wParam, m.lParam)
********************************************************************************
	Declare Integer SendMessage In win32api As apiSendMessage ;
		Integer nHWnd, ;
		Integer Msg, ;
		Integer wParam, ;
		Integer Lparam
	Return  apiSendMessage(m.nHWnd, m.msg, m.wParam, m.lParam)
Endfunc

********************************************************************************
Function apiSendMessageC(m.nHWnd, m.msg, m.wParam, m.lParam)
********************************************************************************
	Declare Integer SendMessage In win32api As apiSendMessageC ;
		Integer nHWnd, ;
		Integer Msg, ;
		Integer wParam, ;
		String  Lparam
	Return apiSendMessageC(m.nHWnd, m.msg, m.wParam, m.lParam)
Endfunc

********************************************************************************
Function apiSendMessageN(m.nHWnd, m.msg, m.wParam, m.lParam)
********************************************************************************
	Declare Integer SendMessage In win32api As apiSendMessageN ;
		Integer nHWnd, ;
		Integer Msg, ;
		Integer wParam, ;
		Integer Lparam
	Return apiSendMessageN(m.nHWnd, m.msg, m.wParam, m.lParam)
Endfunc

********************************************************************************
Function apiSetFilePointerEx(m.hFile, m.iDistanceToMoveLow, m.iDistanceToMoveHigh, m.lpNewFilePointer, m.dwMoveMethod)
********************************************************************************
	Declare Integer SetFilePointerEx In win32api As apiSetFilePointerEx ;
		Integer hFile, ;
		Integer iDistanceToMoveLow, ;
		Integer iDistanceToMoveHigh, ;
		String  @lpNewFilePointer, ;
		Integer dwMoveMethod
	Return apiSetFilePointerEx(m.hFile, m.iDistanceToMoveLow, m.iDistanceToMoveHigh, @m.lpNewFilePointer, m.dwMoveMethod)
Endfunc

********************************************************************************
Function apiSetFocus(m.nHWnd)
********************************************************************************
	Declare Integer SetFocus In win32api As apiSetFocus ;
		Integer nHWnd
	Return apiSetFocus(m.nHWnd)
Endfunc

********************************************************************************
Function apiSetForegroundWindow(m.nHWnd)
********************************************************************************
	Declare Integer SetForegroundWindow In win32api As apiSetForegroundWindow ;
		Integer nHWnd
	Return apiSetForegroundWindow(m.nHWnd)
Endfunc

********************************************************************************
Function apiSetMenu(m.nHWnd, m.hMenu)
********************************************************************************
	Declare Integer SetMenu In win32api As apiSetMenu;
		Integer nhWnd, ;
		Integer hMenu
	Return apiSetMenu(m.nHWnd, m.hMenu)
Endfunc

********************************************************************************
Function apiSetMenuDefaultItem(m.hMenu, m.uItem, m.fByPos)
********************************************************************************
	Declare Integer SetMenuDefaultItem In win32api As apiSetMenuDefaultItem;
		Integer hMenu, ;
		Integer uItem, ;
		Integer fByPos
	Return apiSetMenuDefaultItem(m.hMenu, m.uItem, m.fByPos)
Endfunc

********************************************************************************
Function apiSetMenuInfo(m.hMenu, m.lpcmi)
********************************************************************************
	Declare Integer SetMenuInfo In win32api As apiSetMenuInfo;
		Integer hmenu, ;
		String  @lpcmi
	Return apiSetMenuInfo(m.hMenu, @m.lpcmi)
Endfunc

********************************************************************************
Function apiSetMenuItemBitmaps(m.hMenu, m.uPosition, m.uFlags, m.hBitmapUnchecked, m.hBitmapChecked)
********************************************************************************
	Declare Integer SetMenuItemBitmaps In win32api As apiSetMenuItemBitmaps ;
		Integer hMenu, ;
		Integer uPosition, ;
		Integer uFlags, ;
		Integer hBitmapUnchecked, ;
		Integer hBitmapChecked
	Return apiSetMenuItemBitmaps(m.hMenu, m.uPosition, m.uFlags, m.hBitmapUnchecked, m.hBitmapChecked)
Endfunc

********************************************************************************
Function apiSetMenuItemInfo(m.hMenu, m.uItem, m.fByPosition, m.lpmii)
********************************************************************************
	Declare Integer SetMenuItemInfo In win32api As apiSetMenuItemInfo;
		Integer hMenu, ;
		Integer uItem, ;
		Integer fByPosition, ;
		String  @lpmii
	Return apiSetMenuItemInfo(m.hMenu, m.uItem, m.fByPosition, @m.lpmii)
Endfunc

********************************************************************************
Function apiSetParent(m.hWndChild, m.hWndNewParent)
********************************************************************************
	Declare Integer SetParent In win32api As apiSetParent ;
		integer hWndChild, ;
		integer hWndNewParent
	Return apiSetParent(m.hWndChild, m.hWndNewParent)
Endfunc

********************************************************************************
Function apiSetProp(m.nHWnd, m.lpString, m.hData)
********************************************************************************
	Declare Integer SetProp In win32api As apiSetProp ;
		Integer nHWnd, ;
		String  lpString, ;
		Integer hData
	Return apiSetProp(m.nHWnd, m.lpString, m.hData)
Endfunc

********************************************************************************
Function apiSetScrollInfo(m.nHWnd, m.fnBar, m.lpsi, m.fRedraw)
********************************************************************************
	Declare Integer SetScrollInfo In win32api As apiSetScrollInfo ;
		Integer nHWnd, ;
		Integer fnBar, ;
		String  @lpsi, ;
		Integer fRedraw
	Return apiSetScrollInfo(m.nHWnd, m.fnBar, @m.lpsi, m.fRedraw)
Endfunc

********************************************************************************
Function apiShowScrollBar(m.nHWnd, m.wBar, m.bShow)
********************************************************************************
	Declare Integer ShowScrollBar In win32api As apiShowScrollBar ;
		Integer nHWnd, ;
		Integer wBar, ;
		Integer bShow
	Return apiShowScrollBar(m.nHWnd, m.wBar, m.bShow)
Endfunc

********************************************************************************
Function apiSetWindowLong(m.nHWnd, m.nIndex, m.dwNewLong)
********************************************************************************
	Declare Integer SetWindowLong In win32api As apiSetWindowLong ;
		Integer nHWnd, ;
		Integer nIndex, ;
		Integer dwNewLong
	Return apiSetWindowLong(m.nHWnd, m.nIndex, m.dwNewLong)
Endfunc

********************************************************************************
Function apiSetWindowPlacement(m.nHWnd, m.lpwndpl)
********************************************************************************
	Declare Integer SetWindowPlacement In win32api As apiSetWindowPlacement;
		Integer nHWnd, ;
		String  lpwndpl
	Return apiSetWindowPlacement(m.nHWnd, m.lpwndpl)
Endfunc

********************************************************************************
Function apiSetWindowPos(m.nHWnd, m.HWndInsertAfter, m.nx, m.ny, m.cx, m.cy, m.wFlags)
********************************************************************************
	Declare Integer SetWindowPos In win32api As apiSetWindowPos ;
		Integer nHWnd, ;
		Integer HWndInsertAfter, ;
		Integer nx, ;
		Integer ny, ;
		Integer cx, ;
		Integer cy, ;
		Integer wFlags
	Return apiSetWindowPos(m.nHWnd, m.HWndInsertAfter, m.nx, m.ny, m.cx, m.cy, m.wFlags)
Endfunc

********************************************************************************
Function apiSetWindowTheme(m.nHWnd, m.pszSubAppName, m.pszSubIdList)
********************************************************************************
	If ctlGetOsVersion() >= NTDDI_WINXP
		Declare Integer SetWindowTheme In uxtheme.Dll As apiSetWindowTheme ;
			Integer nHWnd, ;
			String  pszSubAppName, ;
			String  pszSubIdList
		Return  apiSetWindowTheme(m.nHWnd, m.pszSubAppName, m.pszSubIdList)
	Else
		Return 0
	Endif
Endfunc

********************************************************************************
Function apiShellExecute(m.nHWnd, m.lpOperation, m.lpFile, m.lpParameters, m.lpDirectory, m.nShowCmd)
********************************************************************************
	Declare Integer ShellExecute In shell32.Dll As apiShellExecute ;
		Integer nHWnd, ;
		String  lpOperation, ;
		String  lpFile, ;
		String  lpParameters, ;
		String  lpDirectory, ;
		Integer nShowCmd
	Return apiShellExecute(m.nHWnd, m.lpOperation, m.lpFile, m.lpParameters, m.lpDirectory, m.nShowCmd)
Endfunc

********************************************************************************
Function apiSHGetFolderPath(m.hwndOwner, m.nFolder, m.hToken, m.dwFlags, m.pszPath)
********************************************************************************
	Declare Integer SHGetFolderPath In shfolder.Dll As apiSHGetFolderPath;
		Integer hwndOwner, ;
		Integer nFolder, ;
		Integer hToken, ;
		Integer dwFlags, ;
		String  @pszPath
	Return apiSHGetFolderPath(m.hwndOwner, m.nFolder, m.hToken, m.dwFlags, @m.pszPath)
Endfunc

********************************************************************************
Function apiShowWindow(m.nHWnd, m.nCmdShow)
********************************************************************************
*#beautify keyword_nochange
	Declare Integer ShowWindow In win32api As apiShowWindow ;
		Integer nHWnd, ;
		Integer nCmdShow
*#beautify
	Return apiShowWindow(m.nHWnd, m.nCmdShow)
Endfunc

********************************************************************************
Function apiStrFormatByteSize(m.dw, m.szBuf, m.uiBufSize)
********************************************************************************
	Declare Integer StrFormatByteSize In shlwapi.Dll As apiStrFormatByteSize;
		Integer dw, ;
		String  @szBuf, ;
		Integer uiBufSize
	Return apiStrFormatByteSize(m.dw, @m.szBuf, m.uiBufSize)
Endfunc

********************************************************************************
Function apiStrFormatByteSize64(m.dw, m.szBuf, m.uiBufSize)
********************************************************************************
	Declare Integer StrFormatByteSize64 In shlwapi.Dll As apiStrFormatByteSize64;
		Integer dw, ;
		String  @szBuf, ;
		Integer uiBufSize
	Return apiStrFormatByteSize64(m.dw, @m.szBuf, m.uiBufSize)
Endfunc

********************************************************************************
Function apiSystemParametersInfo(m.uiAction, m.uiParam, m.pvParam, m.fWinIni)
********************************************************************************
	Declare Integer SystemParametersInfo In win32api As apiSystemParametersInfo ;
		Integer uiAction, ;
		Integer uiParam, ;
		String  @pvParam, ;
		Integer fWinIni
	Return apiSystemParametersInfo(m.uiAction, m.uiParam, @m.pvParam, m.fWinIni)
Endfunc

********************************************************************************
Function apiTrackPopupMenuEx(m.hMenu, m.fuFlags, m.nx, m.ny, m.nHWnd, m.lptpm)
********************************************************************************
	Declare Integer TrackPopupMenuEx In win32api As apiTrackPopupMenuEx;
		Integer hMenu, ;
		Integer fuFlags, ;
		Integer nX, ;
		Integer nY, ;
		Integer nHWnd, ;
		String  @lptpm
	Return apiTrackPopupMenuEx(m.hMenu, m.fuFlags, m.nx, m.ny, m.nHWnd, @m.lptpm)
Endfunc

********************************************************************************
Function apiWindowFromPoint(m.xPoint, m.yPoint)
********************************************************************************
	Declare Integer WindowFromPoint In win32api As apiWindowFromPoint ;
		Integer xPoint, ;
		Integer yPoint
	Return apiWindowFromPoint(m.xPoint, m.yPoint)
Endfunc

********************************************************************************
Function apiWriteFile(hFile, m.lpBuffer, m.nNumberOfBytesToWrite, m.lpNumberOfBytesWritten, m.lpOverlapped)
********************************************************************************
	Declare Integer WriteFile In win32api As apiWriteFile ;
		Integer hFile, ;
		String  lpBuffer, ;
		Integer nNumberOfBytesToWrite, ;
		Integer @lpNumberOfBytesWritten, ;
		Integer lpOverlapped
	Return apiWriteFile(hFile, m.lpBuffer, m.nNumberOfBytesToWrite, m.lpNumberOfBytesWritten, m.lpOverlapped)
Endfunc

