LPARAMETERS tcPROPERTY AS String

* VERIFICA SE EST? DENTRO DO SISTEMA
IF VARTYPE(goAPLICATIVO) <> 'O' OR VARTYPE(goCONEXAO) <> 'O'
	*OBS: NECESS?RIO SER MESSAGEBOX POIS SE N?O EXISTE GOAPLICATIVO N?O EXISE A ROTINA "MENS"
	MESSAGEBOX('Necess?rio estar no ambiente de desenvolvimento para utilizar essa funcionalidade!',0,'AVISO!')
	RETURN(.T.)
ENDIF

*!*	IF NOT 'SQL SERVER' $ goCONEXAO.DRIVER
*!*		DO MENS WITH 'Op??o v?lida somente para conex?o com Sql Server'
*!*		RETURN(.F.)
*!*	ENDIF

IF VARTYPE(tcPROPERTY) <> 'C'
	DO MENS WITH 'Necess?rio informar propriedade!'
	RETURN(.F.)
ENDIF

* LISTA COM AS OP??ES PARA CADA PROPRIEDADE
DO CASE
	CASE tcPROPERTY = 'CONTROLSOURCE'
		=TRATACONTROLSOURCE()
		
	OTHERWISE
		DO MENS WITH 'Propriedade n?o configurada'
ENDCASE

PROC TRATACONTROLSOURCE
************************
	LOCAL lcCOMANDO, lcTABELA AS String
	LOCAL lnRETORNO AS Integer
	LOCAL loOBJETO AS Object
	LOCAL ARRAY laOBJ[1]

	lnRETORNO = ASELOBJ(laOBJ,1)
	IF lnRETORNO < 1
		RETURN(.F.)
	ENDIF

	LOCAL loFORM AS Form
	STORE NULL TO loFORM
	
	* PROCURA OBJETO FORM PARA PEGAR myTABELA E VERIFICAR CAMPOS
	IF VARTYPE(laOBJ[1]) = 'O'
		loFORM = laOBJ[1]
	ENDIF

	DO WHILE .T.
		IF UPPER(loFORM.CLASS) == 'FORMDIG'
			EXIT
		ELSE
			IF TYPE('loFORM.Parent') <> 'O'
				loFORM = NULL
				EXIT
			ENDIF
		ENDIF
		loFORM = loFORM.Parent
	ENDDO

	IF ISNULL(loFORM)
		RETURN(.F.)
	ENDIF

	loOBJETO = laOBJ[1].ACTIVECONTROL
		
	lcTABELA = loFORM.myTABELA

	IF EMPTY(lcTABELA)
		DO MENS WITH 'Necess?rio preencher campo MyTabela do Formdig'
		RETURN(.F.)
	ENDIF

	LOCAL lcRETORNO AS String
	STORE '' TO lcRETORNO

	=SQLCOLUMNS(GOCONEXAO.ALCA, ALLTRIM(lcTABELA), 'FOXPRO', 'TMPCOLUNAS')
	SELECT * FROM TMPCOLUNAS ORDER BY FIELD_NAME INTO CURSOR TMPCOLUNAS READWRITE
	SELE TMPCOLUNAS
	GO TOP
	
*!*		TEXT TO lcCOMANDO NOSHOW PRETEXT 7
*!*			SELECT
*!*				CASE WHEN COL.XPREC = 0 THEN 'C' ELSE 'N' END AS TG_TIPO,
*!*				UPPER(COL.NAME) AS DS_NAME,
*!*				UPPER(TYP.NAME) AS DS_TIPO,
*!*				COL.LENGTH AS NR_TAMANHO,
*!*				COL.XPREC AS NR_PRECISAO,
*!*				COL.XSCALE AS NR_ESCALA
*!*			FROM
*!*				SYSOBJECTS AS TAB
*!*			LEFT JOIN SYSCOLUMNS AS COL ON COL.ID=TAB.ID
*!*			LEFT JOIN SYSTYPES AS TYP ON TYP.XTYPE=COL.XTYPE
*!*			WHERE
*!*				TAB.XTYPE='u'
*!*			AND
*!*				TAB.NAME <> 'dtproperties'
*!*			AND
*!*				NOT TYP.NAME = 'sysname'
*!*			AND
*!*				TAB.NAME = '[TABELA]'
*!*			ORDER BY
*!*				COL.NAME
*!*		ENDTEXT
*!*		lcCOMANDO = STRTRAN(lcCOMANDO,'[TABELA]',ALLTRIM(lcTABELA))
*!*		=PESQUISASQL(lcCOMANDO,'TMPCOLUNAS')

	DO FORM G:\TESTESVF\PLATA\UPDATEVF\FORM_CONTROLSOURCE WITH loOBJETO TO lcRETORNO

	IF EMPTY(lcRETORNO)
		USE IN TMPCOLUNAS
		RETURN(.F.)
	ENDIF

	LOCAL llERRO AS Logical
	STORE .F. TO llERRO
	
	LOCAL lcSELECIONADO, lcTIPOOBJ AS String
	STORE '' TO lcSELECIONADO, lcTIPOOBJ
	
	LOCAL lnTAMANHO, lnRENOMEAR, lnFORMATAR AS Integer
	STORE 0 TO lnTAMANHO, lnRENOMEAR, lnFORMATAR
	
	* EXTRAINDO INFORMA??ES DO RETORNO 
	lcSELECIONADO 	= UPPER(STREXTRACT(lcRETORNO,'<SELECIONADO>','</SELECIONADO>'))
	lnRENOMEAR		= VAL(STREXTRACT(lcRETORNO,'<RENOMEAR>','</RENOMEAR>'))
	lnFORMATAR 		= VAL(STREXTRACT(lcRETORNO,'<FORMATAR>','</FORMATAR>'))

	SELE TMPCOLUNAS
	GO TOP
	LOCATE FOR ALLTRIM(FIELD_NAME) = lcSELECIONADO
	
	* FORMATANDO TAMANHO DO OBJETO
	IF TMPCOLUNAS.FIELD_TYPE $ 'T'
		lnTAMANHO = 10
	ELSE
		lnTAMANHO = TMPCOLUNAS.FIELD_LEN
	ENDIF

	DO CASE
		CASE UPPER(loOBJETO.CLASS) == 'TEXTBOX'
			lcTIPOOBJ 	= 'txt'

		CASE UPPER(loOBJETO.CLASS) == 'COMBOBOX'
			lcTIPOOBJ 	= 'cbo'
			lnFORMATAR 	= 0

		CASE UPPER(loOBJETO.CLASS) == 'CHECKBOX'
			lcTIPOOBJ	= 'chk'
			lnFORMATAR 	= 0

		CASE UPPER(loOBJETO.CLASS) == 'EDITBOX'
			lcTIPOOBJ 	= 'edt'
			lnFORMATAR 	= 0

		CASE UPPER(loOBJETO.CLASS) == 'SPINNER'
			lcTIPOOBJ 	= 'spn'
			lnFORMATAR 	= 0

		OTHERWISE
			lcTIPOOBJ 	= ''
			lnFORMATAR 	= 0
	OTHERWISE

	ENDCASE
	* PREENCHENDO CONTROLSOURCE
	loOBJETO.CONTROLSOURCE 	= 'THISFORM.EE.'+lcSELECIONADO
	
	* RENOMEANDO OBJETO
	IF lnRENOMEAR =  1
		TRY
			loOBJETO.NAME = lcTIPOOBJ+lcSELECIONADO
		CATCH
			llERRO = .T.
		ENDTRY

		IF llERRO
			DO MENS WITH 'N?o foi poss?vel alterar "ControlSource" e "Name" do objeto'+CHR(13)+CHR(13)+;
							'ERRO: '+MESSAGE()
		ENDIF
	ENDIF

	* FORMATANDO OBJETO
	IF lnFORMATAR = 1 AND NOT llERRO
		loOBJETO.WIDTH = TAMANHOTX(lnTAMANHO)
	ENDIF
	
	IF USED('TMPCOLUNAS')
		USE IN TMPCOLUNAS
	ENDIF

ENDPROC