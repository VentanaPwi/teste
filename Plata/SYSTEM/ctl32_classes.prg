********************************************************************************
*!* ctl32_classes.prg
********************************************************************************

#Include ctl32.h
If Not Juststem(Sys(16)) $ Set("Procedure") Then
	Set Procedure To Sys(16) Additive
Endif
Return

********************************************************************************
Define Class ctl32_MenuPopUp As Custom
********************************************************************************
	HostID = 0
	MenuHeight = 0
	MenuItemHeight = 0
	PictureHeight = 0
	PKey = 0
	SelfID = 0

	Protected _MemberData
	_MemberData = '<VFPData>' + ;
		'<memberdata name="" type="property" display=""/>' + ;
		'</VFPData>'

Enddefine

********************************************************************************
Define Class ctl32_MenuItem As Custom
********************************************************************************
	Caption = ""
	Default = FALSE
	Enabled = FALSE
	KeyShortcut = ""
	Mark = FALSE
	MarkStyle = 0
	HostID = 0
	MenuPKey = ""
	hBitmap = 0
	PictureHeight = 0
	Picture = ""
	PictureVal = ""
	oBitmap = ""
	PKey = ""
	MenuItemHeight = 0
	SelfID = 0
	StatusBarText = ""
	SubMenuID = 0

	Procedure Caption_Assign
		Lparameters vNewVal
		This.Caption = m.vNewVal
	Endproc

	Procedure Caption_Access
		Return This.Caption
	Endproc

	Procedure Default_Assign
		Lparameters vNewVal

		If Vartype(m.vNewVal) = "N" Then
			If m.vNewVal = 0 Then
				m.vNewVal = FALSE
			Else
				m.vNewVal = TRUE
			Endif
		Endif

		This.Default = m.vNewVal

		If This.SelfID = 0 Then
			Return
		Endif

		If This.Default = TRUE Then
			apiSetMenuDefaultItem(This.HostID, This.SelfID, MF_BYCOMMAND)
		Else
			apiSetMenuDefaultItem(This.HostID, -1, MF_BYPOSITION)
		Endif
	Endproc

	Procedure Enabled_Assign
		Lparameters vNewVal

		If Vartype(m.vNewVal) = "N" Then
			If m.vNewVal = 0 Then
				m.vNewVal = FALSE
			Else
				m.vNewVal = TRUE
			Endif
		Endif

		This.Enabled = m.vNewVal

		If This.SelfID = 0 Then
			Return
		Endif

		If This.Enabled = TRUE Then
			apiEnableMenuItem(This.HostID, This.SelfID, Bitor(MF_BYCOMMAND, MF_ENABLED))
		Else
			apiEnableMenuItem(This.HostID, This.SelfID, Bitor(MF_BYCOMMAND, MF_GRAYED))
		Endif
	Endproc

	Procedure Mark_Assign
		Lparameters vNewVal

		If Vartype(m.vNewVal) = "N" Then
			If m.vNewVal = 0 Then
				m.vNewVal = FALSE
			Else
				m.vNewVal = TRUE
			Endif
		Endif

		This.Mark = m.vNewVal

		If This.SelfID = 0 Then
			Return
		Endif

		If This.Mark = TRUE Then
			apiCheckMenuItem(This.HostID, This.SelfID , Bitor(MF_BYCOMMAND, MF_CHECKED))
		Else
			apiCheckMenuItem(This.HostID, This.SelfID , Bitor(MF_BYCOMMAND, MF_UNCHECKED))
		Endif
	Endproc

	Procedure MarkStyle_Assign
		Lparameters vNewVal

		This.MarkStyle = m.vNewVal

		If This.SelfID = 0 Then
			Return
		Endif

*!* Get current fType, we set fMask to MIIM_FTYPE
		Local ;
			m.lcMenuItemInfo As String, ;
			m.loMenuItemInfo As ctlMenuItemInfo Of ctl32-classes.prg, ;
			m.lfType As Integer

		m.loMenuItemInfo = Createobject("ctlMenuItemInfo")

*!* Build MenuItemInfo structure:
		m.loMenuItemInfo.fMask = MIIM_FTYPE
		m.lcMenuItemInfo = m.loMenuItemInfo.Value

		If apiGetMenuItemInfo(This.HostID, This.SelfID , MF_BYCOMMAND, @m.lcMenuItemInfo) <> 0 Then

			m.loMenuItemInfo.Value = m.lcMenuItemInfo

			If This.MarkStyle <> 0 Then
				m.loMenuItemInfo.fType = Bitor(MFT_RADIOCHECK, m.loMenuItemInfo.fType)
			Else
				m.loMenuItemInfo.fType = Bitxor(MFT_RADIOCHECK, Bitor(MFT_RADIOCHECK, m.loMenuItemInfo.fType))
			Endif

			m.lcMenuItemInfo = m.loMenuItemInfo.Value

			apiSetMenuItemInfo(This.HostID, This.SelfID , MF_BYCOMMAND, m.lcMenuItemInfo)

			m.loMenuItemInfo = Null

		Endif

	Endproc

	Protected _MemberData
	_MemberData = '<VFPData>' + ;
		'<memberdata name="" type="property" display=""/>' + ;
		'</VFPData>'

Enddefine

**************************************************
*-- Class:        ctl32_statusbar_panel
*-- ParentClass:  custom
*-- BaseClass:    custom
*-- Time Stamp:   11/10/07 12:19:13 PM
*
Define Class ctl32_statusbar_panel As Custom

	Height = 16
	Width = 120
*-- Specifies the icon displayed for a Form at run time when the Form is minimized.
	ctlicon = ""
	ctlcaption = ""
	ctlformat = 0
*-- Specifies the text that appears as a ToolTip for a control.
	ctltooltiptext = ""
	ctlindex = 0
*-- Right x value position for Panel
	_right = -1
	_oicon = ""
*-- Specifies if an object is visible or hidden.
	ctlvisible = .T.
*-- Specifies if a control is automatically resized to fit its contents.
	ctlautosize = .T.
	_width = 0
*-- Specifies the alignment of text associated with a control.
	ctlalignment = 0
	ctlwidth = ""
	ctlname = ""
	Name = "ctl32_statusbar_panel"

	Procedure ctlicon_assign
		Lparameters vNewVal

		Local lnHandle

		This.ctlicon = m.vNewVal
		This._oicon = .Null.

*!* 2006-07-17 Now takes icon handle too //Anton
		Do Case
			Case Vartype(This.ctlicon) = T_NUMERIC
				m.lnHandle = m.vNewVal
			Case Vartype(This.ctlicon) = T_CHARACTER  And File(This.ctlicon)
				This._oicon = LoadPicture(This.ctlicon)
				m.lnHandle = This._oicon.Handle
			Otherwise
				m.lnHandle = 0
		Endcase

		apiSendMessageN(This.Parent._ControlHWnd, SB_SETICON, This.ctlindex, m.lnHandle)

		If This.Parent._ControlHWnd <> 0 And This.ctlindex <> 0 And This.Parent._Creating = FALSE Then
			This.Parent.ctlResizePanels()
		Endif
	Endproc

	Procedure ctlcaption_assign
		Lparameters vNewVal
*!* 2006-06-27 Added Transform()
		This.ctlcaption = Alltrim(Transform(m.vNewVal))

		Local lcPadLeft, lcPadRight, lcCaption

		m.lcCaption =  m.vNewVal

*!* we add spaces so text does not fit and tooltips show
		Do Case
			Case This.ctlalignment = 1	And This.ctlautosize = FALSE		&& Right
				m.lcPadLeft  = Chr(9) + Chr(9)
				m.lcPadRight = Space(1)

			Case This.ctlalignment = 2	And This.ctlautosize = FALSE		&& Center
				m.lcPadLeft  = Chr(9)
				m.lcPadRight = Space(0)

			Otherwise										&& Left
				m.lcPadLeft  = Space(0)
				m.lcPadRight = Space(10)

*!* Add one space to left if this is PanelMessage and
*!* ctlAlignment is left, so it separates the text a little from border
				If This.ctlindex = 0
					m.lcPadLeft = m.lcPadLeft + Space(1)
				Endif
		Endcase

*!* If changing indicator panels Caption, let tmrUpdater update captions:
		If This.Name =  "PanelOvr" Then
			This.Parent._OldOVR  = Not Insmode()
		Endif

		If This.Name =  "PanelNum" Then
			This.Parent._OldNUM  = Not Numlock()
		Endif

		If This.Name =  "PanelCaps" Then
			This.Parent._OldCAPS = Not Capslock()
		Endif

*!* If setting Caption for Message Panel
		If This.ctlindex = 0
			This.Parent._OldMessage = Sys(2015)
		Endif

		m.lcCaption = m.lcPadLeft + m.lcCaption + m.lcPadRight + Chr(0)

*!* Do not set Panel Caption for ProgressBar:
		If This.ctlindex <> 1 Then
			apiSendMessageC(This.Parent._ControlHWnd, SB_SETTEXTA, This.ctlindex , m.lcCaption)
		Endif

		If This.Parent._ControlHWnd <> 0 And This.ctlindex <> 0 And This.Parent._Creating = FALSE Then
			This.Parent.ctlResizePanels()
		Endif
	Endproc

	Procedure ctlformat_assign
*!* Property only valid for PanelDate

		Lparameters vNewVal

		This.ctlformat = m.vNewVal

		If This.Name = "PanelDate" Then
			If This.ctlformat > 0 Then
				This.ctlcaption = ctlGetDateFormat(This.ctlformat)
			Else
				This.ctlcaption = ""
			Endif
		Endif
	Endproc

	Procedure ctltooltiptext_assign
		Lparameters vNewVal

		This.ctltooltiptext = m.vNewVal

		If Len(m.vNewVal) > 0 Then
			m.vNewVal = Space(1) + This.ctltooltiptext + Space(1)
		Endif

		apiSendMessageC(This.Parent._ControlHWnd,SB_SETTIPTEXTA, This.ctlindex, m.vNewVal)
	Endproc

	Procedure ctlvisible_assign
		Lparameters vNewVal

		If Vartype(m.vNewVal) = "N" Then
			If m.vNewVal = 0 Then
				m.vNewVal = FALSE
			Else
				m.vNewVal = TRUE
			Endif
		Endif

		If Vartype(m.vNewVal) <> "L" Then
			Messagebox("Parameter must be Logical: " + Program(), 16)
			Return
		Endif

		This.ctlvisible = m.vNewVal

		If This.Parent._ControlHWnd <> 0 And This.Parent._Creating = FALSE Then
			This.Parent.ctlResizePanels()
		Endif
	Endproc

*-- Called when creating the statusbar to update all data of Panels
	Procedure _updateall
		This.ctlcaption     = This.ctlcaption
		This.ctlformat      = This.ctlformat
		This.ctlicon        = This.ctlicon
		This.ctltooltiptext = This.ctltooltiptext
		This.ctlvisible     = This.ctlvisible
	Endproc

	Procedure ctlautosize_assign
		Lparameters vNewVal

		If Vartype(m.vNewVal) = "N" Then
			If m.vNewVal = 0 Then
				m.vNewVal = FALSE
			Else
				m.vNewVal = TRUE
			Endif
		Endif

*!* Index 0 is first Panel, PanelMessage, that should always have ctlAutosize = FALSE
		If This.ctlindex = 0 Then
			This.ctlautosize = FALSE
		Else
			This.ctlautosize = m.vNewVal
*!* Reset caption to get rid of center/right codes if ctlAutosize is TRUE
			This.ctlcaption = This.ctlcaption
		Endif
	Endproc

	Procedure ctlalignment_assign
		Lparameters vNewVal

		This.ctlalignment = m.vNewVal

*!* If message panel, force update
		If This.ctlindex = 0
			This.Parent._OldMessage = Sys(2015)
		Endif

		This.ctlcaption = This.ctlcaption
	Endproc

	Procedure ctlname_access
		Return This.Name
	Endproc

	Procedure ctlname_assign
		Lparameters vNewVal
		This.Name = m.vNewVal
	Endproc

	Procedure ctlwidth_access
		Return This.Width
	Endproc

	Procedure ctlwidth_assign
		Lparameters vNewVal
		This.Width = m.vNewVal
	Endproc

	Procedure Destroy
		This._oicon = .Null.
	Endproc

Enddefine
*
*-- EndDefine: ctl32_statusbar_panel
**************************************************

**************************************************
*-- Class:        ctl32_statusbar_toolbar
*-- ParentClass:  toolbar
*-- BaseClass:    toolbar
*-- Time Stamp:   11/10/07 12:19:14 PM
*
Define Class ctl32_statusbar_toolbar As Toolbar

	Caption = "ctl32_statusbar_toolbar"
	Height = 16
	Left = 0
	Top = 51
	Visible = .F.
	Width = 32028
	ShowWindow = 1
	Name = "ctl32_statusbar_toolbar"

	Add Object ctlheightshape As Shape With ;
		Top = 3, ;
		Left = 5, ;
		Height = 13, ;
		Width = 16384, ;
		Name = "ctlHeightShape"

	Procedure Init
*!* Hide the toolbar trhu API so it is still there but invisible
		With This
			.Dock(TOOL_BOTTOM, 0, 0)
			.Visible = TRUE
			apiShowWindow(.HWnd, SW_HIDE)
		Endwith
	Endproc

	Procedure ctlheightshape.Click
		This.Parent.Dock(3, 0, 0)
	Endproc

	Procedure ctlheightshape.Init

		If ctlGetOsVersion() >= NTDDI_VISTA		&& Vista
			This.Height = 13
		Else
			This.Height = 17
		Endif
	Endproc

Enddefine
*
*-- EndDefine: ctl32_statusbar_toolbar
**************************************************

**************************************************
*-- Class:        ctl32_statusbar_timer
*-- ParentClass:  timer
*-- BaseClass:    timer
*-- Time Stamp:   11/15/07 03:51:10 AM
*
Define Class ctl32_statusbar_timer As Timer


	Height = 23
	Width = 23
	Interval = 100
	_Interval = 0
	_IntervalTrace = 10000
	Name = "ctl32_statusbar_timer"


	Procedure Timer
*!* 20070701 Added trace aware timer, suggested by ajh
		TRY 
			If Wvisible("trace") Or  ;
				Wvisible("debugger") Or ;
				Wvisible("call") Or ;
				Wvisible("watch") Or ;
				Wvisible("locals")

			If This.Interval <> This._IntervalTrace
				This._Interval = This.Interval
				This.Interval = This._IntervalTrace
			Endif

			Else

				If This.Interval = This._IntervalTrace
					This.Interval = This._Interval
				Endif
				This._Interval = This.Interval

			Endif

			This.Parent.ctlUpdatePanels()
		CATCH

		FINALLY

		ENDTRY
		
	Endproc


Enddefine
*
*-- EndDefine: ctl32_statusbar_timer
**************************************************
