     @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             DRIVER=winspool
DEVICE=Foxit Reader PDF Printer
OUTPUT=FOXIT_Reader:
ORIENTATION=0
PAPERSIZE=9
PAPERLENGTH=2970
PAPERWIDTH=2100
SCALE=100
ASCII=0
COPIES=1
DEFAULTSOURCE=1
PRINTQUALITY=300
COLOR=2
DUPLEX=1
YRESOLUTION=300
TTOPTION=2
COLLATE=0
                                                           K  ,  winspool  Foxit Reader PDF Printer  FOXIT_Reader:                                                                    �Foxit Reader PDF Printer        � _�� 	 �4d   ,  ,   A4                                                                               C : \ U s e r s \ M a r t i n a \ A p p D a t a \ R o a m i n g \ F o x i t   S o f t w a r e \ F o x i t   P D F   C r e a t o r \ F o x i t   R e a d e r   P D F   P r i n t e r \ 1 5 5 5 8 2 7 2 1 0 _ 3 6 7 6 _ _ f o x i t t e m p . x m l                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Arial                                                         invoices.customer                                             "Customer:"                                                   Arial Black                                                   customer                                                      Arial Black                                                   invoices.invoiceno                                            "9999"                                                        Arial                                                         invoices.product                                              Arial                                                         invoices.quantity                                             Arial                                                         quantity>=0                                                   invoices.price                                                
"9 999.99"                                                    Arial                                                         !invoices.quantity* invoices.price                             "999 999.99"                                                  Arial                                                         $"Total for "+allt(invoices.customer)                          Arial                                                         !invoices.quantity* invoices.price                             "999 999.99"                                                  Arial                                                         "Grand Total:"                                                Arial                                                         "Invoice List"                                               |<VFPData>
	<reportdata name="" type="R" script="" execute="LPARAMETERS toFX, toListener, tcMethodToken,;
   tP1, tP2, tP3, tP4, tP5, tP6,;
   tP7, tP8, tP9, tP10, tP11, tP12

*---------------------------------------------
* MemberDataScripting Tips
*
* If you do not begin your script with
* a PARAMETERS or LPARAMETERS statement,
* the statement shown above will be added
* during runtime execution.
*
* Parameters:
* -----------
* toFx          - a ref to the executing object
* toListener    - a ref to the running ReportListener
* tcMethodToken - an uppercase version of the 
*                 executing event, e.g. &quot;BEFOREREPORT&quot;
*
* Additional parameters depend on the executing event.
*
* If you use your own parameter statement with more 
* descriptive variable names, you must still include 
* the full set of parameters (through tP12), even if 
* you are limiting the events for which the script 
* will be executed.
*
* ExecWhen:
* --------------
* You can use any of the following values in ExecWhen
* to limit when this script is called. (Remove the 
* quotation marks shown here):
*
*    -- a single (case-insensitive) method token, 
*       such as &quot;Render&quot;
*        
*    -- an expression that will evaluate to a logical 
*       value, such as &quot;MyApplication.IncludeScript&quot; 
*       or &quot;MyTable.MyLogicalField&quot;.
*
*    -- a &quot;|&quot;-delimited set of method tokens (case-
*       insensitive), such as &quot;|BeforeReport|AfterReport|&quot;
*
* ExecWhen is evaluated dynamically.  
*
* You can even change the expression being evaluated in 
* ExecWhen, or the script being executed, dynamically in 
* the script itself. These two items are held in a 
* read-write cursor (toFX.ScriptAlias) in the 
* ReportListener's FRXDataSession.
*
* ExecWhen is evaluated in the ReportListener's 
* CurrentDataSession, and script is executed within the 
* CurrentDataSession unless you change the session within 
* the script.
*---------------------------------------------


a=0" execwhen=".F." class="" classlib="" declass="" declasslib="" penrgb="" fillrgb="" pena="" filla="" fname="" fsize="" fstyle=""/>
</VFPData>
                                                                  ""                                                            #UR OUTLINE="Invoice List"                                    tooltip                                                       Arial Black                                                   "Invoice No."                                                 K#UR A NAME=customer
#UR OUTLINE=customer
#UR OUTLINEPARENT="Invoice List"                                                   Arial                                                         	"Product"                                                     Arial                                                         "Qty"                                                         Arial                                                         "Unit Price"                                                  Arial                                                         "Total"                                                       Arial                                                         "Go to Customer List"                                         #UR A HREF="#custlist"                                        Arial                                                         invoices.quantity                                             Arial                                                         
quantity<0                                                    " "                                                           Arial Black                                                    invoices.price*invoices.quantity                              Arial                                                         
refprinted                                                    .f.                                                           .f.                                                           Arial                                                         Arial Black                                                   Arial Black                                                   Arial                                                         Arial                                                         Arial Black                                                   Arial                                                         dataenvironment                                               _Top = 220
Left = 1
Width = 440
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
                              DRIVER=winspool
DEVICE=Foxit Reader PDF Printer
OUTPUT=FOXIT_Reader:
ORIENTATION=0
PAPERSIZE=9
PAPERLENGTH=2970
PAPERWIDTH=2100
SCALE=100
ASCII=0
COPIES=1
DEFAULTSOURCE=1
PRINTQUALITY=300
COLOR=2
DUPLEX=1
YRESOLUTION=300
TTOPTION=2
COLLATE=0
                                                           K  ,  winspool  Foxit Reader PDF Printer  FOXIT_Reader:                                                                    �Foxit Reader PDF Printer        � _�� 	 �4d   ,  ,   A4                                                                               C : \ U s e r s \ M a r t i n a \ A p p D a t a \ R o a m i n g \ F o x i t   S o f t w a r e \ F o x i t   P D F   C r e a t o r \ F o x i t   R e a d e r   P D F   P r i n t e r \ 1 5 5 5 8 2 7 2 1 0 _ 3 6 7 6 _ _ f o x i t t e m p . x m l                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Arial                                                         invoices.customer                                             "Customer:"                                                   Arial Black                                                   customer                                                      Arial Black                                                   invoices.invoiceno                                            "9999"                                                        Arial                                                         invoices.product                                              Arial                                                         invoices.quantity                                             Arial                                                         quantity>=0                                                   invoices.price                                                
"9 999.99"                                                    Arial                                                         !invoices.quantity* invoices.price                             "999 999.99"                                                  Arial                                                         $"Total for "+allt(invoices.customer)                          Arial                                                         !invoices.quantity* invoices.price                             "999 999.99"                                                  Arial                                                         "Grand Total:"                                                Arial                                                         "Invoice List"                                               |<VFPData>
	<reportdata name="" type="R" script="" execute="LPARAMETERS toFX, toListener, tcMethodToken,;
   tP1, tP2, tP3, tP4, tP5, tP6,;
   tP7, tP8, tP9, tP10, tP11, tP12

*---------------------------------------------
* MemberDataScripting Tips
*
* If you do not begin your script with
* a PARAMETERS or LPARAMETERS statement,
* the statement shown above will be added
* during runtime execution.
*
* Parameters:
* -----------
* toFx          - a ref to the executing object
* toListener    - a ref to the running ReportListener
* tcMethodToken - an uppercase version of the 
*                 executing event, e.g. &quot;BEFOREREPORT&quot;
*
* Additional parameters depend on the executing event.
*
* If you use your own parameter statement with more 
* descriptive variable names, you must still include 
* the full set of parameters (through tP12), even if 
* you are limiting the events for which the script 
* will be executed.
*
* ExecWhen:
* --------------
* You can use any of the following values in ExecWhen
* to limit when this script is called. (Remove the 
* quotation marks shown here):
*
*    -- a single (case-insensitive) method token, 
*       such as &quot;Render&quot;
*        
*    -- an expression that will evaluate to a logical 
*       value, such as &quot;MyApplication.IncludeScript&quot; 
*       or &quot;MyTable.MyLogicalField&quot;.
*
*    -- a &quot;|&quot;-delimited set of method tokens (case-
*       insensitive), such as &quot;|BeforeReport|AfterReport|&quot;
*
* ExecWhen is evaluated dynamically.  
*
* You can even change the expression being evaluated in 
* ExecWhen, or the script being executed, dynamically in 
* the script itself. These two items are held in a 
* read-write cursor (toFX.ScriptAlias) in the 
* ReportListener's FRXDataSession.
*
* ExecWhen is evaluated in the ReportListener's 
* CurrentDataSession, and script is executed within the 
* CurrentDataSession unless you change the session within 
* the script.
*---------------------------------------------


a=0" execwhen=".F." class="" classlib="" declass="" declasslib="" penrgb="" fillrgb="" pena="" filla="" fname="" fsize="" fstyle=""/>
</VFPData>
                                                                  ""                                                            #UR OUTLINE="Invoice List"                                    tooltip                                                       Arial Black                                                   "Invoice No."                                                 K#UR A NAME=customer
#UR OUTLINE=customer
#UR OUTLINEPARENT="Invoice List"                                                   Arial                                                         	"Product"                                                     Arial                                                         "Qty"                                                         Arial                                                         "Unit Price"                                                  Arial                                                         "Total"                                                       Arial                                                         "Go to Customer List"                                         #UR A HREF="#custlist"                                        Arial                                                         invoices.quantity                                             Arial                                                         
quantity<0                                                    " "                                                           Arial Black                                                    invoices.price*invoices.quantity                              Arial                                                         
refprinted                                                    .f.                                                           .f.                                                           Arial                                                         Arial Black                                                   Arial Black                                                   Arial                                                         Arial                                                         Arial Black                                                   Arial                                                         dataenvironment                                               _Top = 220
Left = 1
Width = 440
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
                         