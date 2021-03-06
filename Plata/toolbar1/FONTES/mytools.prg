**** minha barra de ferramentas personalizada

SET PROCEDURE TO COMPARE ADDITIVE

_SCREEN.AddProperty ('myTOOLBAR')
_SCREEN.myTOOLBAR = CREATEOBJECT('myTOOLBAR')
_SCREEN.myTOolbar.VISIBLE=.T.
_SCREEN.myTOolbar.DOCK(0)
ON KEY LABEL CTRL+F2 activate windo command
ON KEY LABEL F8
_SCREEN.myToolbar.cmdMENU.CLICK()
ON KEY LABEL F9 DETALHESOBJETO()
ON KEY LABEL CTRL+Q DO SISSAIR

* CTRL+F1 SER? ATALHO PARA O WTBOX
*ON KEY LABEL CTRL+F1 DO FORM G:\SISTEMAS\WTBOX\WTBOX_MAIN.SCX WITH 'ONLINE'

PROC MENS
*********
LPARAMETERS tcMENSAGEM,tnERRO
* MENSAGEM AO USUARIO, SE TNERRO=1 A MENSAGEM ? MAIS GRAVE.
	IF TYPE('tnERRO')<>'N'
		tnERRO = 0
	ENDIF
	tnERRO = IIF(tnERRO>0,48,64)
	=MESSAGEBOX(tcMENSAGEM,'AVISO',tnERRO)
RETURN

PROC SIMOUNAO
*************
LPARAMETERS tcPERGUNTA, tcTITULO, tnDEFAULT
	LOCAL lnBOTAO AS Number
	IF VARTYPE(tnDEFAULT) <> 'N'
		tnDEFAULT = 0
	ENDIF
	IF tnDEFAULT = 1
		tnBOTAO = 0
	ELSE
		tnBOTAO = 256
	ENDIF
	IF MESSAGEBOX( tcPERGUNTA, tcTITULO, 32+4+tnBOTAO )=6
		RETURN(.T.)
	ENDIF
RETURN(.F.)

PROC STARTAFILE
***************
LPARAMETERS tcARQUIVO AS String, tnOUTROS AS Integer 
* tcARQUIVO   ->   ARQUIVO OU COMANDO A SER EXECUTADO
* tcOUTROS    ->   COMANDOS ADICIONAIS 
*			  ->   0 - NADA FAZ (COMO ANTES)
*			  ->   1 - N?O VERIFICA SE O ARQUIVO EXISTE

	IF TYPE('tcARQUIVO') <> 'C'
		tcARQUIVO = ''	
	ENDIF
	IF EMPTY(tcARQUIVO)
		RETURN
	ENDIF
	IF TYPE('tnOUTROS') <> 'N'
		tnOUTROS = 0
	ENDIF
	
	* CASO SEJA ZERO, VERIFICA EXISTENCIA DO ARQUIVO
	IF tnOUTROS = 0
		IF NOT FILE(tcARQUIVO)
			DO MENS WITH 'Arquivo n?o encontrado: '+tcARQUIVO
			RETURN
		ENDIF
	ENDIF

	DECLARE LONG ShellExecute IN "shell32.dll" ;
		LONG HWND, STRING lpszOp, ;
		STRING lpszFile, STRING lpszParams, ;
		STRING lpszDir, LONG nShowCmd
		
	* SE FOR IGUAL A 1 N?O PASSA O FULLPATH NO COMANDO	
	IF tnOUTROS = 1
		SHELLEXECUTE( 0, 'Open', tcARQUIVO, 0, 0, 1)
	ELSE
		SHELLEXECUTE( 0, 'Open', FULLPATH(tcARQUIVO), 0, 0, 1)		
	ENDIF

RETURN

PROC SISSAIR
	IF TYPE('goAPLICATIVO')='O'
		TRY
			DO ENCERRAR WITH 1
		CATCH
		ENDTRY
	ENDIF
ENDPROC

PROC DETALHESOBJETO
*******************
	LOCAL loOBJETO AS Object

	LOCAL cMENSAGEM  AS String

	loOBJETO = SYS(1270)

	IF VARTYPE(loOBJETO) <> 'O'
		WAIT WINDOW 'POSICIONE O MOUSE EM CIMA DE UM OBJETO'
		RETURN
	ENDIF

	DO CASE
		CASE UPPER(loOBJETO.BASECLASS) == 'FORM'
			TEXT TO lcMENSAGEM NOSHOW PRETEXT 7
			    Propriedades do Form:
				Name:           [[NAME]]
				Caption:        [[CAPTION]]
				Class:          [[CLASS]]
				Height:         [[HEIGHT]]
				Width:          [[WIDTH]]
			ENDTEXT
			lcMENSAGEM = STRTRAN(lcMENSAGEM,'[[CAPTION]]',ALLTRIM(loOBJETO.CAPTION))
			lcMENSAGEM = STRTRAN(lcMENSAGEM,'[[HEIGHT]]',ALLTRIM(STR(loOBJETO.HEIGHT)))

		CASE UPPER(loOBJETO.BASECLASS) == 'TEXTBOX'
			TEXT TO lcMENSAGEM NOSHOW PRETEXT 7
			    Propriedades do Textbox:
				Name:           [[NAME]]
				Comment:        [[COMMENT]]
				InputMask:      [[INPUTMASK]]
				Format:         [[FORMAT]]
				ControlSource:  [[CONTROLSOURCE]]
				Tag:            [[TAG]]
			ENDTEXT
			lcMENSAGEM = STRTRAN(lcMENSAGEM,'[[CONTROLSOURCE]]',ALLTRIM(loOBJETO.CONTROLSOURCE))
			lcMENSAGEM = STRTRAN(lcMENSAGEM,'[[INPUTMASK]]',ALLTRIM(loOBJETO.INPUTMASK))
			lcMENSAGEM = STRTRAN(lcMENSAGEM,'[[FORMAT]]',ALLTRIM(loOBJETO.FORMAT))

		CASE UPPER(loOBJETO.BASECLASS) == 'COLUMN'
			TEXT TO lcMENSAGEM NOSHOW PRETEXT 7
			    Propriedades do Column:
				Name:           [[NAME]]
				Caption:        [[CAPTION]]
				Width:          [[WIDTH]]
				ControlSource:  [[CONTROLSOURCE]]
			ENDTEXT
			lcMENSAGEM = STRTRAN(lcMENSAGEM,'[[CONTROLSOURCE]]',ALLTRIM(loOBJETO.CONTROLSOURCE))
			lcMENSAGEM = STRTRAN(lcMENSAGEM,'[[CAPTION]]',ALLTRIM(loOBJETO.HEADER1.CAPTION))

		CASE UPPER(loOBJETO.BASECLASS) == 'COMBOBOX'
			TEXT TO lcMENSAGEM NOSHOW PRETEXT 7
			    Propriedades do Combobox:
				Name:           [[NAME]]
				Rowsource:   	[[ROWSOURCE]]
				Rowsourcetype:  [[ROWSOURCETYPE]]
			ENDTEXT
			lcMENSAGEM = STRTRAN(lcMENSAGEM,'[[ROWSOURCE]]',ALLTRIM(loOBJETO.ROWSOURCE))
			lcMENSAGEM = STRTRAN(lcMENSAGEM,'[[ROWSOURCETYPE]]',ALLTRIM(STR(loOBJETO.ROWSOURCETYPE)))
		
		OTHERWISE
			WAIT WINDOW ('OBJETO N?O DEFINIDO: ' + CHR(13) + ALLTRIM(loOBJETO.BASECLASS) + ': ' + ALLTRIM(loOBJETO.NAME)) AT MROW(_SCREEN.Name,0), MCOL(_SCREEN.Name,0)
			RETURN(.F.)
	ENDCASE

	lcMENSAGEM = STRTRAN(lcMENSAGEM,'[[CLASS]]',ALLTRIM(loOBJETO.CLASS))
	lcMENSAGEM = STRTRAN(lcMENSAGEM,'[[COMMENT]]',ALLTRIM(loOBJETO.COMMENT))
	lcMENSAGEM = STRTRAN(lcMENSAGEM,'[[TAG]]',ALLTRIM(loOBJETO.TAG))
	lcMENSAGEM = STRTRAN(lcMENSAGEM,'[[WIDTH]]',ALLTRIM(STR(loOBJETO.WIDTH)))
	lcMENSAGEM = STRTRAN(lcMENSAGEM,'[[NAME]]',ALLTRIM(loOBJETO.NAME))

	WAIT WINDOW lcMENSAGEM AT MROW(_SCREEN.Name,0), MCOL(_SCREEN.Name,0)

ENDPROC

PROC STARTAFILETOOLS
***************
LPARAMETERS tcARQUIVO AS String, tcPARAMETROS AS STRING
	IF TYPE('tcARQUIVO') <> 'C'
		tcARQUIVO = ''	
	ENDIF
	IF EMPTY(tcARQUIVO)
		RETURN
	ENDIF
	IF NOT FILE(tcARQUIVO)
		MESSAGEBOX( 'EXECUTAVEL N?O ENCONTRADO: '+tcARQUIVO, 0, 'AVISO')
		RETURN
	ENDIF
	
	DECLARE LONG ShellExecute IN "shell32.dll" ;
		LONG HWND, STRING lpszOp, ;
		STRING lpszFile, STRING lpszParams, ;
		STRING lpszDir, LONG nShowCmd

	SHELLEXECUTE( 0, 'Open', FULLPATH(tcARQUIVO), tcPARAMETROS, JUSTPATH(FULLPATH(tcARQUIVO)), 1)
RETURN

DEFINE CLASS myTOOLBAR AS Toolbar
	VISIBLE = .T.
	CAPTION = 'ToolBar F1'
	cUPGFORM = ''
	cMENU    = 'SYS'
	
	ADD OBJECT cmdCLOSE AS COMMANDBUTTON WITH;
		CAPTION = ' ',;
		SPECIALEFFECT = 2,;
		VISIBLE=.T.,;
		WIDTH = 24,;
		HEIGHT = 24,;
		picture = 'CLOSE.bmp',;
		tooltiptext = 'Fechar',;
		pictureposition = 14

	ADD OBJECT cmdENCERRAR AS COMMANDBUTTON WITH;
		CAPTION = ' ',;
		SPECIALEFFECT = 2,;
		VISIBLE=.T.,;
		WIDTH = 24,;
		HEIGHT = 24,;
		picture = 'ENCERRAR.bmp',;
		tooltiptext = 'Finalizar sistema',;
		pictureposition = 14

	ADD OBJECT sprLOT1 AS SEPARATOR WITH;
		VISIBLE = .T.,;
		STYLE=1
	
	ADD OBJECT cmdSUSP AS COMMANDBUTTON WITH;
		CAPTION = ' ',;
		SPECIALEFFECT = 2,;
		VISIBLE=.T.,;
		WIDTH = 24,;
		HEIGHT = 24,;
		picture = 'suspend.bmp',;
		tooltiptext = 'Suspender (susp)',;
		pictureposition = 14
		
	ADD OBJECT cmdRESUME AS COMMANDBUTTON WITH;
		CAPTION = ' ',;
		SPECIALEFFECT = 2,;
		VISIBLE=.T.,;
		WIDTH = 24,;
		HEIGHT = 24,;
		picture = 'resume.bmp',;
		tooltiptext = 'Continuar (resume)',;
		pictureposition = 14

	ADD OBJECT cmdMODIFY AS COMMANDBUTTON WITH;
		caption = ' ',;
		tooltiptext = 'Modificar form',;
		SPECIALEFFECT = 2,;
		VISIBLE=.T.,;
		WIDTH = 24,;
		HEIGHT = 24,;
		picture = 'MODIFY.bmp',;
		pictureposition = 14

	ADD OBJECT cmdSTOBGER AS COMMANDBUTTON WITH;
		caption = ' ',;
		tooltiptext = 'Gerenciador de vers?es-stob',;
		SPECIALEFFECT = 2,;
		VISIBLE=.T.,;
		WIDTH = 24,;
		HEIGHT = 24,;
		picture = 'STOBGER.bmp',;
		pictureposition = 14

	ADD OBJECT cmdMENU AS COMMANDBUTTON WITH;
		caption = ' ',;
		tooltiptext = 'Trocar menu sys/fox',;
		SPECIALEFFECT = 2,;
		VISIBLE=.T.,;
		WIDTH = 24,;
		HEIGHT = 24,;
		picture = 'MENUFOX.bmp',;
		pictureposition = 14

	ADD OBJECT sprLOT2 AS SEPARATOR WITH;
		VISIBLE = .T.,;
		STYLE=1		

	ADD OBJECT cmdDEBSQL AS COMMANDBUTTON WITH;
		caption = ' ',;
		tooltiptext = 'Debugar SQL',;
		SPECIALEFFECT = 2,;
		VISIBLE=.T.,;
		WIDTH = 24,;
		HEIGHT = 24,;
		picture = 'SQLOFF.BMP',;
		pictureposition = 14

	ADD OBJECT cmdMINISQL AS COMMANDBUTTON WITH;
		caption = ' ',;
		tooltiptext = 'miniSQL',;
		SPECIALEFFECT = 2,;
		VISIBLE=.T.,;
		WIDTH = 24,;
		HEIGHT = 24,;
		picture = 'MINISQL.BMP',;
		pictureposition = 14


	ADD OBJECT sprLOT3 AS SEPARATOR WITH;
		VISIBLE = .T.,;
		STYLE=1

	ADD OBJECT cmdALARM AS COMMANDBUTTON WITH;
		caption = ' ',;
		tooltiptext = 'Liga\Desliga alarmes do sistema',;
		SPECIALEFFECT = 2,;
		VISIBLE=.T.,;
		WIDTH = 24,;
		HEIGHT = 24,;
		picture = 'Alarm_off.png',;
		pictureposition = 14

	ADD OBJECT sprLOT4 AS SEPARATOR WITH;
		VISIBLE = .T.,;
		STYLE=1

*	ADD OBJECT cmdCONSTRAINT AS COMMANDBUTTON WITH;
*		caption = ' ',;
*		tooltiptext = 'Gerenciador de constraint',;
*		SPECIALEFFECT = 2,;
*		VISIBLE=.T.,;
*		WIDTH = 24,;
*		HEIGHT = 24,;
*		picture = 'CONSTRAINT.bmp',;
*		pictureposition = 14

	ADD OBJECT cmdHOTKEY AS COMMANDBUTTON WITH;
		caption = ' ',;
		tooltiptext = 'Hot Keys',;
		SPECIALEFFECT = 2,;
		VISIBLE=.T.,;
		WIDTH = 24,;
		HEIGHT = 24,;
		picture = 'HOTKEY.bmp',;
		pictureposition = 14

	ADD OBJECT cmdRECONECTAR AS COMMANDBUTTON WITH;
		caption = ' ',;
		tooltiptext = 'Reconectar',;
		SPECIALEFFECT = 2,;
		VISIBLE=.T.,;
		WIDTH = 24,;
		HEIGHT = 24,;
		picture = 'reconnect.png',;
		pictureposition = 14
		
	ADD OBJECT cmdWTBOX AS COMMANDBUTTON WITH;
		caption = ' ',;
		tooltiptext = 'WTBox - Wiki & Toolbox',;
		SPECIALEFFECT = 2,;
		VISIBLE=.T.,;
		WIDTH = 24,;
		HEIGHT = 24,;
		picture = 'wtbox.png',;
		pictureposition = 14	
	
	ADD OBJECT cmdUTILITARIOS AS COMMANDBUTTON WITH;
		caption = ' ',;
		tooltiptext = 'Utilit?rios F8',;
		SPECIALEFFECT = 2,;
		VISIBLE=.T.,;
		WIDTH = 24,;
		HEIGHT = 24,;
		picture = 'Utilit.PNG',;
		pictureposition = 14
		
	ADD OBJECT cmdSVN AS COMMANDBUTTON WITH;
		caption = ' ',;
		tooltiptext = 'Utilit?rios SVN',;
		SPECIALEFFECT = 2,;
		VISIBLE=.T.,;
		WIDTH = 24,;
		HEIGHT = 24,;
		picture = 'SVN.PNG',;
		pictureposition = 14
			
	PROC INIT
	*********
		LOCAL lcBUILDER AS STRING
		lcBUILDER = 'g:\testesvf\plata\builder\mybuilder.prg'
		IF FILE(lcBUILDER)
			_builder = lcBUILDER
		ENDIF		
	RETURN
	
	PROC DESTROY
		ON KEY LABEL F9
		ON KEY LABEL CTRL+Q
	ENDPROC
	
	PROC cmdCLOSE.CLICK
	******************
		this.Parent.release()
	ENDPROC

	PROC cmdENCERRAR.CLICK
	**********************
		TRY 
			DO SISSAIR
		CATCH
		ENDTRY
	ENDPROC
		
	PROC cmdSUSP.CLICK
	******************
		LOCAL lcSYSCOMANDO AS String
		STORE '' TO lcSYSCOMANDO
		TRY 
			_VFP.DoCmd('DEBUG')
			_VFP.DoCmd('SUSP')
			KEYBOARD '{F8}'
*			KEYBOARD '{F8}'
		CATCH
		ENDTRY
	ENDPROC

	PROC cmdRESUME.CLICK
	******************
		LOCAL lcSYSCOMANDO AS String
		STORE '' TO lcSYSCOMANDO
		TRY 
			_VFP.DoCmd('RESUME')
*			KEYBOARD '{F8}'
		CATCH
		ENDTRY
	ENDPROC
	
	PROC cmdMODIFY.CLICK
	********************
		LOCAL lcFORM AS String
		LOCAL lnFORM AS INTEGER
		TRY
			lcFORM = SYS(1271,_SCREEN.ActiveForm)
			lcFORM = UPPER(ALLTRIM(lcFORM))
			lnFORM = _SCREEN.ActiveForm.HWnd
			*LOform = _SCREEN.ActiveForm
			
			IF '\PLATA\SYSTEM\' $ UPPER(lcFORM)
				DO FORM TOOLBAR_PLATAAVISO WITH lcFORM
				RETURN			
			ENDIF

			IF '\STOB\'$UPPER(lcFORM)
				DO FORM TOOLBAR_STOBAVISO WITH lcFORM TO llRET
				IF llRET
					THIS.Parent.cmdSTOBGER.CLICK()
				ENDIF
				
				RETURN
			ENDIF
			
			IF _SCREEN.ActiveForm.HWnd=lnFORM
				_SCREEN.ActiveForm.RELEASE()
			ENDIF
			
			ON KEY LABEL CTRL+F2 activate windo command
			KEYBOARD '{CTRL+F2}'
			KEYBOARD '{CTRL+END}'
			KEYBOARD 'MODIFY FORM '+lcFORM
			KEYBOARD '{ENTER}'
		CATCH
		ENDTRY
	ENDPROC
	
	PROC cmdSTOBGER.CLICK
	********************
		LOCAL lcFORM AS String
		LOCAL llerro AS Boolean
		
		LOCAL lcRET as String
		STORE '' to lcRET
		
		llerro = .F.
		
		TRY 
			lcFORM = SYS(1271,_SCREEN.ActiveForm)
			lcFORM = UPPER(ALLTRIM(lcFORM))
			
			IF '\PLATA\SYSTEM\' $ UPPER(lcFORM)
				DO FORM TOOLBAR_PLATAAVISO WITH lcFORM
				RETURN
			ENDIF
		CATCH
			llerro = .t.
		ENDTRY 
		
		IF llerro
			RETURN
		ENDIF
			
		TRY 
			_SCREEN.ActiveForm.release()
		CATCH
			llerro=.t.
		ENDTRY
		
		IF llerro
			RETURN
		ENDIF

		DO FORM TOOLBAR_VERIFICARFORM WITH lcFORM TO lcRET
		IF  empty(lcRET)
			RETURN
		ENDIF

		lcFORM = lcRET 
		
		ON KEY LABEL CTRL+F2 ACTIVATE WINDO COMMAND
		KEYBOARD '{CTRL+END}'
		KEYBOARD 'MODIFY FORM '+lcFORM
		KEYBOARD '{ENTER}'

	ENDPROC
		
	PROC cmdMENU.CLICK
	********************
		DO CASE
			CASE THIS.Parent.cMENU = 'SYS'
				PUSH MENU _MSYSMENU
				SET SYSMENU TO DEFAULT
				THIS.Parent.cMENU = 'FOX'
				THIS.Picture = 'MENUSYS.bmp'
		
			CASE THIS.Parent.cMENU = 'FOX'
				POP MENU _MSYSMENU
				THIS.Parent.cMENU = 'SYS'
				THIS.Picture = 'MENUFOX.bmp'
		ENDCASE
	ENDPROC	
	
	PROC cmdHOTKEY.CLICK
	********************
		LOCAL lcFILE AS String
		STORE '' TO lcFILE
		
		lcFILE = 'G:\TRAB\public\Tecnico\Platavf\HOTKEYS_HELP.TXT'
		
		IF FILE(lcFILE)
			MODIFY FILE &lcFILE NOEDIT
		ELSE
			* SE AINDA ASSIM N?O EXISTIR ARQUIVO DE HOTKEYS, USA M?TODO ANTIGO DA HOTKEY
			LOCAL lcMESSAGEM AS STRING
			STORE ' ' TO lcMENSAGEM
			
			TEXT TO lcMENSAGEM NOSHOW PRETEXT 2
				Dicas resumidas:
				----------------
				SHIFT+F1 = abrir a tooblbar
				SHIFT+F9 = navegar pela pasta corrente
				----
				OBS: n?o foi encontrado o arquivo TXT com dicas completas de hetkeys
			ENDTEXT
			MESSAGEBOX(lcMENSAGEM,64,'Hot keys')	
		ENDIF

	ENDPROC

	PROC cmdDEBSQL.CLICK
	********************
		IF TYPE('goAPLICATIVO')<>'O'
			RETURN
		ENDIF
		
		IF TYPE('goAPLICATIVO.DEBUGSQL')<>'N'
			RETURN
		ENDIF
		
		IF goAPLICATIVO.DEBUGSQL = 0
			goAPLICATIVO.DEBUGSQL = 1
			THIS.PICTURE = 'SQLON.BMP'
		ELSE
			goAPLICATIVO.DEBUGSQL = 0		
			THIS.PICTURE = 'SQLOFF.BMP'
		ENDIF
	ENDPROC
	
	PROC cmdMINISQL.click
	*********************
		DO FORM SQLMINI.SCX
	ENDPROC

	PROC cmdALARM.Init()
		IF TYPE('GOAPLICATIVO.tmrTIMER') = 'O'
			IF GOAPLICATIVO.tmrTIMER.Enabled = .T.
				THIS.Picture = 'ALARM_ON.PNG'
			ELSE
				THIS.Picture = 'ALARM_OFF.PNG'
			ENDIF
		ENDIF
	ENDPROC
	
	PROC cmdALARM.Click
		DO FORM TOOLBAR_ALARM.SCX TO lnOK
		IF TYPE('GOAPLICATIVO.tmrTIMER') = 'O'
			IF GOAPLICATIVO.tmrTIMER.Enabled = .T.
				THIS.Picture = 'ALARM_ON.PNG'
			ELSE
				THIS.Picture = 'ALARM_OFF.PNG'
			ENDIF
		ENDIF
	ENDPROC

*!*		PROC cmdCONSTRAINT.click
*!*		************************
*!*			IF TYPE('goCONEXAO.ALCA')<>'N'
*!*				MESSAGEBOX('Objeto de conex?o n?o encontrado.',48,'Aviso')
*!*				RETURN
*!*			ENDIF
*!*			IF goCONEXAO.ALCA<=0
*!*				MESSAGEBOX('N?o existe nenhuma conex?o.',48,'Aviso')
*!*				RETURN
*!*			ENDIF
*!*		
*!*			DO FORM CONSTRAINT_GERENCIAR.SCX

	PROC cmdUTILITARIOS.Click
	************************
		LOCAL lcTOOLS AS String
		lcTOOLS = "\\FILESERVER\FILES\TRAB\EQUIPES\F8\UTILITARIOSPWI\UTILITARIOSPWI.APP"
		IF NOT FILE(lcTOOLS)
			MESSAGEBOX('Starter do Utilit?rio F8 n?o encontrado:' + CHR(13) + lcTOOLS, 48, 'Aviso')
			RETURN .F.
		ENDIF
		DO (lcTOOLS)
	ENDPROC
	
	PROC cmdRECONECTAR.click
	************************
		LOCAL lnALCA AS Integer
		STORE 0 TO lnALCA
		
		IF TYPE('goCONEXAO') <> 'O'
			RETURN(.F.)
		ENDIF

		* TENTA EFETUAR A RECONEX?O
		TRY 
			lnALCA = SQLSTRINGCONNECT(SQLGETPROP(goCONEXAO.ALCA,"ConnectString"))
		CATCH
		FINALLY
		ENDTRY

		IF lnALCA > 0
			goCONEXAO.ALCA = lnALCA
			MESSAGEBOX('Reconex?o efetuada com sucesso!')
		ELSE
			MESSAGEBOX('Falha ao tentar reconectar')
		ENDIF
	ENDPROC
	
	* WTBOX 
	PROC cmdWTBOX.Click
		DO FORM "\\FILESERVER\FILES\SISTEMAS\WTBOX\WTBOX_MAIN.SCX" WITH 'ONLINE'
	ENDPROC
	
	* UTILITARIOS SVN
	PROC cmdSVN.Click
		* DEFINE MENU DE CONTEXTO A SER EXIBIDO.
		DEFINE POPUP SVN_MENUPRINCIPAL FROM MROW(), MCOL() MARGIN SHORTCUT
			* DEFINE OP??ES DO MENU
			DEFINE BAR 1 OF SVN_MENUPRINCIPAL PROMPT "Verificar arquivos"
			DEFINE BAR 2 OF SVN_MENUPRINCIPAL PROMPT "Atualizar arquivos de configura??o do Tortoise SVN"
			DEFINE BAR 3 OF SVN_MENUPRINCIPAL PROMPT "\-"
			DEFINE BAR 4 OF SVN_MENUPRINCIPAL PROMPT "Commit SVN"
			DEFINE BAR 5 OF SVN_MENUPRINCIPAL PROMPT "Update SVN"

			* A??ES DO MENU
			ON SELECTION BAR 1 OF SVN_MENUPRINCIPAL DO FORM "UTILITARIOS_SVN\VERIFICAR_ARQUIVOS.SCX"
			ON SELECTION BAR 2 OF SVN_MENUPRINCIPAL DO FORM "UTILITARIOS_SVN\ATUALIZAR_CONFIGURACAOSVN.SCX"
			ON SELECTION BAR 4 OF SVN_MENUPRINCIPAL DO "UTILITARIOS_SVN\AUTO_COMMIT.FXP"
			ON SELECTION BAR 5 OF SVN_MENUPRINCIPAL DO "UTILITARIOS_SVN\AUTO_UPDATE.FXP"
		ACTIVATE POPUP SVN_MENUPRINCIPAL
		RELEASE POPUP SVN_MENUPRINCIPAL
	ENDPROC
	
ENDDEFINE