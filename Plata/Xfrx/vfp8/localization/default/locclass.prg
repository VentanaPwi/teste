LPARAMETERS tcLang

IF EMPTY(tcLang)
	RETURN
ENDIF

IF VARTYPE(tcLang)!="C"
	RETURN
ENDIF

CREATE CLASS ("xfrxfrmfind_"+tcLang) OF ("xfrxlib_"+tcLang) as xfrxfrmfind from xfrxlib nowait
CREATE CLASS ("xfrxfrmpage_"+tcLang) OF ("xfrxlib_"+tcLang) as xfrxfrmpage from xfrxlib nowait
