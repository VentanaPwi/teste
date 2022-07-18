lnResponse = MessageBox('Run SSCText to generate ascii code files?', 3, 'Building GoFish...')

If lnResponse <> 6
	Return
EndIf

Set ClassLib to && Must clear them out, cause we're about to generate ascii files of them

DoSCCTextOnProject()

? ' '
? ' '
? ' '
? 'Done.'
*----------------------------------------------------------------
Procedure DoSccTextOnFile

Lparameters tcFile

Local lcOutput, lcType

If !File(tcFile)
	Messagebox('File not found: ' + tcFile, 0, 'Error')
	Return .F.
Endif

Do Case
Case '.VCX' $ Upper(tcFile)
	lcOutput = Getwordnum(tcFile, 1, '.') + '.vca'
	lcType = 'V'
Case '.SCX' $ Upper(tcFile)
	lcOutput = Getwordnum(tcFile, 1, '.') + '.sca'
	lcType = 'K'
Otherwise
	Return
Endcase

Do (SCCText) With  tcFile, lcType, lcOutput, .T.

Endproc


*----------------------------------------------------------------------
Procedure DoSCCTextOnProject

Local loFile, loProject

lcSCCText = Home(1) + 'SCCText.prg'

If !File(lcSCCText)
	Messagebox('Unable to find file ' + lcSCCText, 16, 'Error')
	Return
Endif

Try
	loProject = _vfp.ActiveProject
Catch To loEx
Endtry

If Type('loEx') = 'O'
	Messagebox('There are no active projects', 64, 'Error')
	Return
Endif

lcSkipFiles = 'GoFishProjectHook.vcx'

For Each loFile In loProject.Files

	If Inlist(loFile.Type, 'V', 'K', 'R') and ;
		 !InList(Upper(JustFname(loFile.name)), Upper(lcSkipFiles)) 
				? 'Generating: ' + loFile.Name
				Do (lcSCCText) With loFile.Name
	Endif
Endfor 


 