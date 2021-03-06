*---------------------------------------------------------------------------
Define Class GF_FileResult as Custom

	Process = .f.
	FileName = ''
	FilePath = ''
	_BaseClass = ''
	_ParentClass = ''
	_Class = ''
	ObjectName = ''
	ObjectClass = ''
	ObjectBaseClass = ''
	FileType = ''
	MatchType = ''
	Recno = 0
	IsText = .f.
	TimeStamp =  {// :: AM}
		
EndDefine

*---------------------------------------------------------------------------
Define Class GF_SearchResult as Custom

	Type = ''
	MethodName = ''
	ClassName = ''
	MatchLine = ''
	TrimmedMatchLine = ''
	MatchType = ''
	ProcStart = 0
	MatchStart = 0
	MatchLen = 0
	Code = '' && Stores the entire method code that was passed in for searching
	UserField = .null.
	oProcedure = .null.
	oMatch = .null.
	
	Procedure Init
		This.oProcedure = CreateObject('GF_Procedure')
	EndProc
		
EndDefine

*---------------------------------------------------------------------------
Define Class GF_Procedure as Custom

	Type = ''
	StartByte = 0
	_Name = ''
	_ClassName = ''

EndDefine

*---------------------------------------------------------------------------
Define Class GF_SearchResultsFilter as Custom

	FileName = ''
	FilePath = ''
	ObjectName = ''
	ParentName = ''
	
	MatchType_BaseClass = .f.
	MatchType_ClassDef = .f.
	MatchType_Class = .f.
	MatchType_Filename = .f.
	MatchType_Function= .f.
	MatchType_Method = .f.
	MatchType_MethodDef = .f.
	MatchType_MethodDesc = .f.
	MatchType_ObjectBaseclass = .f.
	MatchType_ObjectClass = .f.
	MatchType_ObjectName = .f.
	MatchType_Parent = .f.
	MatchType_ParentClass = .f.
	MatchType_Procedure = .f.
	MatchType_PropertyDef = .f.
	MatchType_PropertyName = .f.
	MatchType_PropertyValue = .f.
	MatchType_PropertyDesc = .f.
	MatchType_Code = .f.
	MatchType_Constant = .f.
	MatchType_Comment = .f.

	MatchType_FileDate = .f.
	MatchType_TimeStamp = .f.
	
	FileType_SCX = .f.
	FileType_VCX = .f.
	FileType_FRX = .f.
	FileType_LBX = .f.
	FileType_MNX = .f.
	FileType_PJX = .f.
	FileType_DBC = .f.
	FileType_PRG = .f.
	FileType_MPR = .f.
	FileType_SPR = .f.
	FileType_INI = .f.
	FileType_H = .f.
	FileType_HTML = .f.
	FileType_XML = .f.
	FileType_TXT = .f.
	FileType_ASP = .f.
	FileType_JAVA = .f.
	FileType_JSP = .f.

	*Type_Procedure = .f.
	*Type_Method = .f.
	*Type_Class = .f.
	*Type_Blank = .f.
	
	Filename_Filter = ''
	FilePath_Filter = ''
	BaseClass_Filter = ''
	ParentClass_Filter = ''
	Class_Filter = ''
	MethodName_Filter = ''
	ObjectName_Filter = ''
	ObjectClass_Filter = ''
	ObjectBaseCLass_Filter = ''
	MatchLine_Filter = ''

	TextFiles = .f.
	TableFiles = .t.
	
	Timestamp_FilterFrom = {//}
	Timestamp_FilterTo = {//}
	Timestamp_Filter = .f.	

EndDefine


*---------------------------------------------------------------------------
Procedure PropNvl
Lparameters toObject, tcProperty, tuDefaultValue, tlAddPropertyIfNotPresent

If PemStatus(toObject, Alltrim(tcProperty), 5)
	Return Evaluate('toObject.' + Alltrim(tcProperty))
Else
	If tlAddPropertyIfNotPresent
		AddProperty(toObject, tcProperty, tuDefaultValue)
	EndIf
	Return tuDefaultValue
EndIf

EndProc

