**** minha barra de ferramentas personalizada
_SCREEN.AddProperty ('myTOOLBAR')
_SCREEN.myTOOLBAR = CREATEOBJECT('myTOOLBAR')
_SCREEN.myTOolbar.VISIBLE=.T.
_SCREEN.myTOolbar.DOCK(3)
DEFINE CLASS myTOOLBAR AS Toolbar
	VISIBLE = .T.
	CAPTION = 'ToolBar Casi?n'
	cUPGFORM = ''
	
	ADD OBJECT cmdSUSP AS COMMANDBUTTON WITH;
		CAPTION = 'Debugar',;
		SPECIALEFFECT = 2,;
		VISIBLE=.T.,;
		WIDTH = 140,;
		HEIGHT = 36,;
		picture = 'c:\mytoolbar\images\suspend.ico'

	ADD OBJECT cmdRESUME AS COMMANDBUTTON WITH;
		CAPTION = 'Resumir',;
		SPECIALEFFECT = 2,;
		VISIBLE=.F.,;
		WIDTH = 140,;
		HEIGHT = 36,;
		picture = 'images\RESUME.ICO',;
		pictureposition = 2

	ADD OBJECT cmdTROCAMENU AS COMMANDBUTTON WITH;
		CAPTION = 'Menu do Fox',;
		SPECIALEFFECT = 2,;
		VISIBLE=.T.,;
		WIDTH = 140,;
		HEIGHT = 36,;
		picture = 'images\vfp9.BMP',;
		pictureposition = 2
	
	ADD OBJECT cmdAJUSTAR AS COMMANDBUTTON WITH;
		CAPTION = 'Ajustar tela',;
		SPECIALEFFECT = 2,;
		VISIBLE=.F.,;
		WIDTH = 140,;
		HEIGHT = 36,;
		picture = 'images\ajustar.ico',;
		pictureposition = 2

	ADD OBJECT cmdMODIFY AS COMMANDBUTTON WITH;
		CAPTION = 'Modificar form',;
		SPECIALEFFECT = 2,;
		VISIBLE=.T.,;
		WIDTH = 140,;
		HEIGHT = 36,;
		picture = 'images\MODIFY.ICO',;
		pictureposition = 2

	ADD OBJECT sprLOT AS SEPARATOR WITH;
		VISIBLE = .T.,;
		STYLE=1
		
	ADD OBJECT edtEXEC AS EDITBOX WITH;
		FONTSIZE = 8,;
		VISIBLE = .T.,;
		HEIGHT = 36,;
		WIDTH = 140,;
		ARQTEMP = SYS(2023)+'\TOOLBARCASION.DAT'

	ADD OBJECT cmdEXEC AS COMMANDBUTTON WITH;
		CAPTION = 'Executar cmd',;
		SPECIALEFFECT = 2,;
		VISIBLE=.T.,;
		WIDTH = 140,;
		HEIGHT = 36,;
		picture = 'images\EXEC.ICO',;
		pictureposition = 2
	
	ADD OBJECT sprLOT2 AS SEPARATOR WITH;
		VISIBLE = .T.,;
		STYLE=1
	
	ADD OBJECT cmdADDUPG AS COMMANDBUTTON WITH;
		CAPTION = 'Upgrade',;
		SPECIALEFFECT = 2,;
		VISIBLE=.T.,;
		WIDTH = 140,;
		HEIGHT = 36,;
		picture = 'images\plus.ico',;
		pictureposition = 2
			
	ADD OBJECT txtNR_UPG AS TEXTBOX WITH;
		FONTSIZE = 14,;
		ALIGNMENT = 2,;
		VISIBLE = .F.,;
		VALUE = 0,;
		ENABLED = .F.,;
		DISABLEDFORECOLOR = RGB(0,0,0),;
		HEIGHT = 36,;
		WIDTH = 50

	ADD OBJECT cmdGERARUPG AS COMMANDBUTTON WITH;
		VISIBLE = .F.,;
		CAPTION = 'Gerar UPG',;
		SPECIALEFFECT = 2,;
		WIDTH = 140,;
		HEIGHT = 36,;
		picture = 'images\upgrader.ico',;
		pictureposition = 2

	PROC INIT
	*********
		THIS.AddProperty ('ISSYSMENU',.T.)
		THIS.AddProperty('ISSUSPEND',.F.)
		LOCAL lcBUILDER AS STRING
		lcBUILDER = 'g:\testesvf\plata\builder\mybuilder.prg'
		MESSAGEBOX('BUILDER: '+lcBUILDER)
		IF FILE(lcBUILDER)
			_builder = lcBUILDER
		ENDIF
	RETURN
	
	PROC cmdSUSP.INIT
	*****************
		THIS.pictureposition = 2
	RETURN

	PROC cmdRESUME.INIT
	*****************
		THIS.pictureposition = 2
	RETURN
	

	PROC cmdTROCAMENU.INIT
	**********************
		THIS.pictureposition = 2
	RETURN	
	
	PROC cmdSUSP.CLICK
	******************
		THIS.Parent.CMDRESUME.VISIBLE=.T.
		THIS.Visible=.F.
		THIS.Parent.ISSUSPEND = .T.
		LOCAL lcSYSCOMANDO AS String
		STORE '' TO lcSYSCOMANDO
		TRY 
			_VFP.DoCmd('DEBUG')
			_VFP.DoCmd('SUSP')
		CATCH
		ENDTRY

	ENDPROC

	PROC cmdRESUME.CLICK
	******************
	THIS.Parent.CMDSUSP.VISIBLE=.T.
	THIS.Visible=.F.
		THIS.Parent.ISSUSPEND = .F.
		TRY 
			_VFP.DOCMD('CLOSE DEBUG')
		CATCH
		ENDTRY
		
		LOCAL llSYSERRO AS Logical
		STORE .F. TO llSYSERRO

		DO WHILE NOT llSYSERRO
			TRY 
				RESUME
				_VFP.DOCMD('RESUME')
			CATCH
				llSYSERRO=.T.
			ENDTRY
		ENDDO
	ENDPROC

	PROC cmdTROCAMENU.CLICK
	***********************
		IF THIS.Parent.ISSYSMENU
			TRY
				SET SYSMENU TO DEFA
			CATCH
			ENDTRY
			THIS.Parent.ISSYSMENU = .F.
			THIS.Caption = 'Menu do sistema'
			this.picture = 'images\menusys.ico'
		ELSE
			TRY
				DO OBJETOS\MENUTOPO.MPX
				CATCH
			ENDTRY
			IF TYPE('goDESKTOP')='O'
				LOCAL lcCURSOR AS String
				STORE ALIAS() TO lcCURSOR
				TRY 
					=CRIAMENUSYS('TMPSYS')
					SELE TMPSYS
					DO MENUTOPO
					USE IN TMPSYS
					SELE (lcCURSOR)
				CATCH
				ENDTRY
			ENDIF
			THIS.Caption = 'Menu do Fox'
			this.picture = 'images\vfp9.BMP'
			THIS.Parent.ISSYSMENU = .T.
		ENDIF
	ENDPROC
	
	PROC cmdAJUSTAR.CLICK
	*********************
		_SCREEN.Height = 668
	ENDPROC
	
	PROC cmdMODIFY.CLICK
	********************
		LOCAL lcFORM AS String
		lcFORM = SYS(1271,_SCREEN.ActiveForm)
		lcFORM = ALLTRIM(lcFORM)
		TRY
			_SCREEN.ActiveForm.RELEASE()
		CATCH
		ENDTRY

		TRY
			KEYBOARD '{CTRL+F2}'
			KEYBOARD '{CTRL+END}'
			KEYBOARD 'SUSP'
			KEYBOARD '{SHIFT+HOME}'
			KEYBOARD '{ENTER}'
			KEYBOARD '{CTRL+F2}' 
			KEYBOARD 'MODIFY FORM '+lcFORM
			KEYBOARD '{ENTER}'
		CATCH
		ENDTRY
*!*			
*!*			TRY
*!*				DO FORM (lcFORM)
*!*			CATCH
*!*				TRY 
*!*					REPORT FORM  (lcFORM) PREVIEW
*!*				CATCH
*!*				ENDTRY
*!*			ENDTRY

	PROC cmdEXEC.CLICK
	*********************
		TRY 
			=EXECSCRIPT(THIS.Parent.edtEXEC.VALUE)
		CATCH
		ENDTRY
	ENDPROC
	
	PROC edtEXEC.INIT
	*****************
		IF FILE(THIS.ARQTEMP)
			THIS.VALUE = FILETOSTR(THIS.ARQTEMP)
		ELSE
			TRY 
				STRTOFILE('',THIS.ARQTEMP)
			CATCH
			ENDTRY
		ENDIF
	ENDPROC
	
	PROC edtEXEC.VALID
	******************
		TRY 
			STRTOFILE(THIS.VALUE,THIS.ARQTEMP)
		CATCH
		ENDTRY

	ENDPROC
	
	* COMMAND ADICIONA FORM PARA GERAR UPGRADE
	PROC cmdADDUPG.click
	********************
		LOCAL llERRO AS Logical
		STORE .F. TO llERRO
		
		* CASO SEJA UPGRADE MUDA BOTAO PARA ADD FORM
		IF UPPER(THIS.Caption) = 'UPGRADE'
			THIS.Caption = 'Add Form'
			THIS.PARENT.txtNR_UPG.VISIBLE = .T.
			THIS.Parent.cmdGERARUPG.VISIBLE = .T.
			RETURN
		ENDIF
		* TENTA PEGAR O NOME DO FORM
		TRY 
			lcFORM = SYS(1271,_SCREEN.ActiveForm)
		CATCH
			llERRO = .T.	
		ENDTRY
		* VERIFICA SE DEU ERRO
		IF llERRO = .T.
			DO MENS WITH 'NAO FOI POSSIVEL ADICIONAR FORM ATIVO PARA O UPGRADE'
			RETURN
		ENDIF
		* VERIFICA SE REALMENTE ? UM FORM
		IF VARTYPE(_SCREEN.ActiveForm) <> 'O'
			RETURN
		ENDIF
		IF VARTYPE(lcFORM) <> 'C'
			RETURN
		ENDIF
		IF NOT FILE(lcFORM)
			RETURN
		ENDIF
		THIS.Parent.txtNR_UPG.VALUE = THIS.Parent.txtNR_UPG.VALUE + 1
		THIS.Parent.cUPGFORM = THIS.Parent.cUPGFORM + lcFORM + '|'
		_SCREEN.ActiveForm.RELEASE()
	ENDPROC

	* COMMAND GERA UPGRADE
	PROC cmdGERARUPG.CLICK
	***********************
		THIS.PARENT.GERAR_UPGRADER()
		THIS.PARENT.cmdGERARUPG.Visible = .F.
		THIS.PARENT.txtNR_UPG.Visible = .F.
		THIS.PARENT.txtNR_UPG.Value = 0
		THIS.PARENT.cmdADDUPG.Caption = 'Upgrade'
		THIS.PARENT.cUPGFORM = ''
	ENDPROC


PROC GERAR_UPGRADER
********************
	LOCAL loZIP AS Object

	LOCAL lcUPG, lcZIP, lcCOMANDO, lcFORMS AS String
	STORE '' TO lcUPG, lcZIP, lcCOMANDO ,lcFORMS

	lcUPG = ALLTRIM(INPUTBOX('ESCOLHA O NOME PARA O ARQUIVO UPG'))
	IF EMPTY(lcUPG)
		DO MENS WITH 'UPGRADE CANCELADO!'
		RETURN
	ENDIF
	lcUPG	= FULLPATH('') + 'UPGRADE\' + ALLTRIM(UPPER(lcUPG)) + '.UPG'

	IF FILE(lcUPG)
		DELETE FILE (lcUPG)
		IF FILE(lcUPG)
			DO MENS WITH 'FALHA: ARQUIVO DE UPGRADE N?O PODE SER APAGADO: '+lcUPG
			RETURN
		ENDIF
	ENDIF

	IF SIMOUNAO('GERAR UPGRADE DOS FORMS SELECIONADOS?','CONFIRMACAO PARA GERAR UPGRADE',1)
		lcZIP = FULLPATH('') + 'TOOLS\ZIP.EXE'

		DO ESPERANDO WITH 'COMPACTANDO ARQUIVOS...'

		loZIP = CreateObject( "WScript.Shell" )

		lcFORMS = '|' + UPPER(this.cUPGFORM)
		FOR lnI = 1 TO OCCURS('|',lcFORMS)
		lcARQUIVO = STREXTRACT(lcFORMS,'|','|',lnI)
			FOR lnI2 = 1 TO 2
				IF lnI2 = 2
					lcARQUIVO = STRTRAN(lcARQUIVO,'.SCX','.SCT')
				ENDIF
				IF FILE(lcARQUIVO)
					lcCOMANDO = lcZIP + " -o -j " + lcUPG + ' ' + lcARQUIVO
					loZIP.Run(lcCOMANDO, 0,.T.)
				ENDIF
			ENDFOR
		ENDFOR
		WAIT CLEAR
		DO MENS WITH 'ARQUIVO GERADO COM SUCESSO!' + CHR(13) + lcARQUIVO 
	ENDIF
ENDPROC
	
ENDDEFINE
