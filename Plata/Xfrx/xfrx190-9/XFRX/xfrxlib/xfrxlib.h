* XFRX debug constantes
#DEFINE XFRX_DEBUG_EVENT 0 && 1 - Init/Destroy, 0 - Silent

* API constantes
#DEFINE GWL_WNDPROC             -4
#DEFINE GWL_HINSTANCE           -6 
#DEFINE GW_CHILD                 5

#DEFINE WS_VISIBLE          0x10000000 
#DEFINE WS_CHILD            0x40000000 
#DEFINE WM_COMMAND          0x0111

#DEFINE SS_NOTIFY           0x00000100
#DEFINE SS_CENTERIMAGE      0x00000200
#DEFINE SS_RIGHTJUST        0x00000400
#DEFINE SS_REALSIZEIMAGE    0x00000800
#DEFINE SS_SUNKEN           0x00001000

#DEFINE SS_OWNERDRAW        0x0000000D



#define SW_HIDE             0
#define SW_SHOWNORMAL       1
#define SW_NORMAL           1
#define SW_SHOWMINIMIZED    2
#define SW_SHOWMAXIMIZED    3
#define SW_MAXIMIZE         3
#define SW_SHOWNOACTIVATE   4
#define SW_SHOW             5
#define SW_MINIMIZE         6
#define SW_SHOWMINNOACTIVE  7
#define SW_SHOWNA           8
#define SW_RESTORE          9
#define SW_SHOWDEFAULT      10
#define SW_FORCEMINIMIZE    11
#define SW_MAX              11



* XFRX system constantes
#DEFINE _XFRX_BasePosition 1
#DEFINE _XFRX_LeftTop      2
#DEFINE _XFRX_RightTop     3
#DEFINE _XFRX_LeftBottom   4
#DEFINE _XFRX_RightBottom  5

#DEFINE _XFRX_X0 1
#DEFINE _XFRX_Y0 2
#DEFINE _XFRX_XX 3
#DEFINE _XFRX_YY 4



#DEFINE __xfrxlib_tlb_Disable -1
#DEFINE __xfrxlib_tlb_Hide     0
#DEFINE __xfrxlib_tlb_Show     1

#DEFINE __xfrxlib_Book_Disable -1
#DEFINE __xfrxlib_Book_Hide     0
#DEFINE __xfrxlib_Book_Show     1
#DEFINE __xfrxlib_Book_Auto     2

#DEFINE __xfrxlib_DM_Disable -1
#DEFINE __xfrxlib_DM_Hide     0
#DEFINE __xfrxlib_DM_Show     1

#DEFINE __xfrxlib_Prop_Disable -1
#DEFINE __xfrxlib_Prop_Hide     0
#DEFINE __xfrxlib_Prop_Show     1


#DEFINE __xfrxlib_UI_tlb    0
#DEFINE __xfrxlib_UI_html   1
#DEFINE __xfrxlib_UI_menu   2
#DEFINE __xfrxlib_UI_status 3



* XFRX language constants
#DEFINE __xfrxlib_NotFound 1  && "Not Found" 

#DEFINE __xfrxlib_NoPrinters 85 && There are no printers installed.

* Tooltipes
#DEFINE __xfrxlib_Bookmark_ttt 2 && "Show/hide bookmark panel"
#DEFINE __xfrxlib_FirstP_ttt  3  &&  "Go to first page"
#DEFINE __xfrxlib_LastP_ttt   4 &&  "Go to last page"
#DEFINE __xfrxlib_PrevP_ttt    5 && "Go to previous page"
#DEFINE __xfrxlib_NextP_ttt   6 &&  "Go to next page"
#DEFINE __xfrxlib_Print_ttt   7 &&  "Print report..."
#DEFINE __xfrxlib_Find_ttt    8 &&  "Find..."
#DEFINE __xfrxlib_Quit_ttt    9 &&  "Quit report preview"
#DEFINE __xfrxlib_Zoom_ttt    10 &&  "Set zoom"
#DEFINE __xfrxlib_PageDisp_ttt 11 && "Active page %Start% of %End%"
#DEFINE __xfrxlib_PageDisp     65 && "%Start% of %End%"
#DEFINE __xfrxlib_DM_ttt     12 &&   "Design Mode"
#DEFINE __xfrxlib_Prop_ttt   13 &&   "Object properties"
#DEFINE __xfrxlib_Page_ttt   14 &&   "Go to page..."
#DEFINE __xfrxlib_Save_ttt   15 &&   "Save changes"
#DEFINE __xfrxlib_Export_ttt   86 &&  "Export report..."

#DEFINE __xfrxlib_Picture  16 && "Picture"
#DEFINE __xfrxlib_Page  17 && "Page "

#DEFINE __xfrxlib_Cursor_ttt  18 &&   "Cursor"
#DEFINE __xfrxlib_Label_ttt   19 &&   "Label"
#DEFINE __xfrxlib_Image_ttt   20 &&   "Image"
#DEFINE __xfrxlib_Shape_ttt   21 &&   "Shape"
#DEFINE __xfrxlib_Hyperlink_ttt 22 && "Hyperlink"
#DEFINE __xfrxlib_Line_ttt    23 &&   "Line"


* Zoom values
#DEFINE __xfrxlib_Zoom_1000 96 && "1000%"
#DEFINE __xfrxlib_Zoom_800  97 && "800%"
#DEFINE __xfrxlib_Zoom_500  98 && "500%"
#DEFINE __xfrxlib_Zoom_300  24 && "300%"
#DEFINE __xfrxlib_Zoom_200  25 && "200%"
#DEFINE __xfrxlib_Zoom_175  26 && "175%"
#DEFINE __xfrxlib_Zoom_150  27 && "150%"
#DEFINE __xfrxlib_Zoom_125  28 && "125%"
#DEFINE __xfrxlib_Zoom_100  29 && "100%"
#DEFINE __xfrxlib_Zoom_75   30 && " 75%"
#DEFINE __xfrxlib_Zoom_50   31 && " 50%"
#DEFINE __xfrxlib_Zoom_25   32 && " 25%"
#DEFINE __xfrxlib_Zoom_10   33 && " 10%"
#DEFINE __xfrxlib_Zoom_FWd  34 && "Fit Width"
#DEFINE __xfrxlib_Zoom_FWi  35 && "Fit in Window"

* Menu
#DEFINE __xfrxlib_Book_prm 36 && "Bookmark"
#DEFINE __xfrxlib_Book_stt __xfrxlib_Bookmark_ttt
#DEFINE __xfrxlib_Quit_prm 37 && "Quit"
#DEFINE __xfrxlib_Quit_stt __xfrxlib_Quit_ttt
#DEFINE __xfrxlib_Zoom_prm 38 && "Zoom"
#DEFINE __xfrxlib_Zoom_stt __xfrxlib_Zoom_ttt
#DEFINE __xfrxlib_Find_prm 39 && "Find..."
#DEFINE __xfrxlib_Find_stt __xfrxlib_Find_ttt
#DEFINE __xfrxlib_Print_prm 40 && "Print..."
#DEFINE __xfrxlib_Print_stt __xfrxlib_Print_ttt
#DEFINE __xfrxlib_Go_prm 41 && "Go"
#DEFINE __xfrxlib_Go_stt 42 && "Go to page"
#DEFINE __xfrxlib_GoToPage_prm 43 && "Go to page..."
#DEFINE __xfrxlib_GoToPage_stt 44 && "Go to page..."
#DEFINE __xfrxlib_Toolbar_prm 45 && "Toolbar"
#DEFINE __xfrxlib_Toolbar_stt 46 && "Show/hide report preview toolbar"

#DEFINE __xfrxlib_FirstP_prm   47 && "First"
#DEFINE __xfrxlib_FirstP_stt   __xfrxlib_FirstP_ttt
#DEFINE __xfrxlib_LastP_prm    48 && "Last"
#DEFINE __xfrxlib_LastP_stt    __xfrxlib_LastP_ttt
#DEFINE __xfrxlib_PrevP_prm    49 && "Previous"
#DEFINE __xfrxlib_PrevP_stt    __xfrxlib_PrevP_ttt
#DEFINE __xfrxlib_NextP_prm    50 && "Next"
#DEFINE __xfrxlib_NextP_stt    __xfrxlib_NextP_ttt


#DEFINE __xfrxlib_Zoom_1000_prm __xfrxlib_Zoom_1000
#DEFINE __xfrxlib_Zoom_1000_stt 99 && "Zoom to 1000%"
#DEFINE __xfrxlib_Zoom_800_prm __xfrxlib_Zoom_800
#DEFINE __xfrxlib_Zoom_800_stt 100 && "Zoom to 800%"
#DEFINE __xfrxlib_Zoom_500_prm __xfrxlib_Zoom_500
#DEFINE __xfrxlib_Zoom_500_stt 101 && "Zoom to 500%"
#DEFINE __xfrxlib_Zoom_300_prm __xfrxlib_Zoom_300
#DEFINE __xfrxlib_Zoom_300_stt 51 && "Zoom to 300%"
#DEFINE __xfrxlib_Zoom_200_prm __xfrxlib_Zoom_200
#DEFINE __xfrxlib_Zoom_200_stt 52 && "Zoom to 200%"
#DEFINE __xfrxlib_Zoom_175_prm __xfrxlib_Zoom_175
#DEFINE __xfrxlib_Zoom_175_stt 53 && "Zoom to 175%"
#DEFINE __xfrxlib_Zoom_150_prm __xfrxlib_Zoom_150
#DEFINE __xfrxlib_Zoom_150_stt 54 && "Zoom to 150%"
#DEFINE __xfrxlib_Zoom_125_prm __xfrxlib_Zoom_125
#DEFINE __xfrxlib_Zoom_125_stt 55 && "Zoom to 125%"
#DEFINE __xfrxlib_Zoom_100_prm __xfrxlib_Zoom_100
#DEFINE __xfrxlib_Zoom_100_stt 56 && "Zoom to 100%"
#DEFINE __xfrxlib_Zoom_75_prm  __xfrxlib_Zoom_75
#DEFINE __xfrxlib_Zoom_75_stt  57 && "Zoom to 75%"
#DEFINE __xfrxlib_Zoom_50_prm  __xfrxlib_Zoom_50
#DEFINE __xfrxlib_Zoom_50_stt  58 && "Zoom to 50%"
#DEFINE __xfrxlib_Zoom_25_prm  __xfrxlib_Zoom_25
#DEFINE __xfrxlib_Zoom_25_stt  59 && "Zoom to 25%"
#DEFINE __xfrxlib_Zoom_10_prm  __xfrxlib_Zoom_10
#DEFINE __xfrxlib_Zoom_10_stt  60 && "Zoom to 10%"
#DEFINE __xfrxlib_Zoom_FWd_prm __xfrxlib_Zoom_FWd
#DEFINE __xfrxlib_Zoom_FWd_stt 61 && "Fit Width"
#DEFINE __xfrxlib_Zoom_FWi_prm __xfrxlib_Zoom_FWi
#DEFINE __xfrxlib_Zoom_FWi_stt 62 && "Fit in Window"

#DEFINE _xfrx_prop_Name   63 && "Name"
#DEFINE _xfrx_prop_Value  64 && "Value"

#DEFINE __xfrxlib_tlbLayout    66 && "Layout"
#DEFINE __xfrxlib_tlbToolbar   67 && "Report toolbar"
#DEFINE __xfrxlib_tlbRControls 68 && "Report Controls"


#DEFINE __xfrxlib_AL_ttt 69 &&  Align Left Sides
#DEFINE __xfrxlib_AR_ttt 70 &&  Align Right Sides
#DEFINE __xfrxlib_AT_ttt 71 &&  Align Top Edges
#DEFINE __xfrxlib_AB_ttt 72 &&  Align Bottom Edges
#DEFINE __xfrxlib_ACV_ttt 73 && Align Vertical Centers
#DEFINE __xfrxlib_ACH_ttt 74 && Align Horizontal Centers
#DEFINE __xfrxlib_SW_ttt  75 && Same Width
#DEFINE __xfrxlib_SH_ttt  76 && Same Height
#DEFINE __xfrxlib_SM_ttt  77 && Same Size

#DEFINE __xfrxlib_CH_ttt  78 && Center Horizontally
#DEFINE __xfrxlib_CV_ttt  79 && Center Vertikally
#DEFINE __xfrxlib_ZT_ttt  80 && Bring to Front
#DEFINE __xfrxlib_ZB_ttt  81 && Send to Back

#DEFINE __xfrxlib_SMW_ttt  82 && Same Min Width
#DEFINE __xfrxlib_SMH_ttt  83 && Same Min Height
#DEFINE __xfrxlib_SMS_ttt  84 && Same Min Size

#DEFINE __xfrxlib_PageOne   87 && "page" word
#DEFINE __xfrxlib_Pages  88 && "pages" word
#DEFINE __xfrxlib_Pages2  89 && "pages" word for more than 4
#DEFINE __xfrxlib_AllPagesInRange 90
#DEFINE __xfrxlib_OddPagesOnly    91
#DEFINE __xfrxlib_EvenPagesOnly   92

#DEFINE __xfrxlib_Email_ttt  93  &&   "Email report..."

#DEFINE __xfrxlib_IE_Close  94  &&   "Close"

#DEFINE __xfrxlib_EmptyOutputFile  95  &&   "Output file is empty."


#DEFINE CRLF CHR(13)+CHR(10)

*********************************
*
*********************************

#DEFINE __xfrxlib_None_val      0
#DEFINE __xfrxlib_Book_val      2
#DEFINE __xfrxlib_Quit_val      1
#DEFINE __xfrxlib_Find_val      3
#DEFINE __xfrxlib_Print_val     4
#DEFINE __xfrxlib_Toolbar_val   7
#DEFINE __xfrxlib_GoToPage_val  8

#DEFINE __xfrxlib_FirstP_val   51
#DEFINE __xfrxlib_PrevP_val    52
#DEFINE __xfrxlib_NextP_val    53
#DEFINE __xfrxlib_LastP_val    54

#DEFINE __xfrxlib_Zoom_300_val 61
#DEFINE __xfrxlib_Zoom_200_val 62
#DEFINE __xfrxlib_Zoom_175_val 63
#DEFINE __xfrxlib_Zoom_150_val 64
#DEFINE __xfrxlib_Zoom_125_val 65
#DEFINE __xfrxlib_Zoom_100_val 66
#DEFINE __xfrxlib_Zoom_75_val  67
#DEFINE __xfrxlib_Zoom_50_val  68
#DEFINE __xfrxlib_Zoom_25_val  69
#DEFINE __xfrxlib_Zoom_10_val  70
#DEFINE __xfrxlib_Zoom_FWd_val 71
#DEFINE __xfrxlib_Zoom_FWi_val 72
#DEFINE __xfrxlib_Zoom_1000_val 73
#DEFINE __xfrxlib_Zoom_800_val  74
#DEFINE __xfrxlib_Zoom_500_val  75


#DEFINE __xfrxlib_ERROR_MESSAGE_0  1000 && "OK"
#DEFINE __xfrxlib_ERROR_MESSAGE_1  1001 && "Cannot load Word application."
#DEFINE __xfrxlib_ERROR_MESSAGE_2  1002 && "The Word application version must be 2000 or higher."
#DEFINE __xfrxlib_ERROR_MESSAGE_3  1003 && "Cannot create or open the output file."
#DEFINE __xfrxlib_ERROR_MESSAGE_4  1004 && "Unknown output target."
#DEFINE __xfrxlib_ERROR_MESSAGE_5  1005 && "Hndlib.dll cannot be loaded (it is missing or an old version is used)."
#DEFINE __xfrxlib_ERROR_MESSAGE_6  1006 && "Xfrxlib.fll cannot be loaded (it is missing or invalid)."
#DEFINE __xfrxlib_ERROR_MESSAGE_7  1007 && "Zlib.dll cannot be loaded."
#DEFINE __xfrxlib_ERROR_MESSAGE_8  1008 && "An old version of xfrxlib.fll is used."
#DEFINE __xfrxlib_ERROR_MESSAGE_9  1009 && "Sorry, Word 2007 or higher is required for docx format!"
#DEFINE __xfrxlib_ERROR_MESSAGE_10 1010 && "The existing document is either corrupted or in an unsupported format."
#DEFINE __xfrxlib_ERROR_MESSAGE_11 1011 && "Signature file not found."
#DEFINE __xfrxlib_ERROR_MESSAGE_12 1012 && "Cannot use the signature file."
#DEFINE __xfrxlib_ERROR_MESSAGE_13 1013 && "The output folder does not exist or you do not have write access."
#DEFINE __xfrxlib_ERROR_MESSAGE_14 1014 && "The existing document use xref stream - it's no possibly append data."
#DEFINE __xfrxlib_ERROR_MESSAGE_15 1015 && "Cannot load Excel application."
#DEFINE __xfrxlib_ERROR_MESSAGE_16 1016 && "The Excel application version must be 2000 or higher."
#DEFINE __xfrxlib_ERROR_MESSAGE_XX 1099 && "Unknown error"




#DEFINE _xfrx_Mode_None            0
#DEFINE _xfrx_Mode_MoveObject      1
#DEFINE _xfrx_Mode_MoveSheet       3
#DEFINE _xfrx_Mode_ROL             4
#DEFINE _xfrx_Mode_ROT             5
#DEFINE _xfrx_Mode_ROR             6
#DEFINE _xfrx_Mode_ROB             7
#DEFINE _xfrx_Mode_SelectObjectes  8
#DEFINE _xfrx_Mode_NewObject       9
#DEFINE _xfrx_Mode_MoveSheetTimer 10

****************************
#DEFINE _xfrx_ROP_A    0 && All
#DEFINE _xfrx_ROP_L    1 && Left
#DEFINE _xfrx_ROP_T    2 && Top
#DEFINE _xfrx_ROP_W    4 && Width
#DEFINE _xfrx_ROP_H    8 && Height


* ID classes
#DEFINE _xfrxrectangle   1
#DEFINE _xfrxline        2
#DEFINE _xfrxlabel       8
#DEFINE _xfrximage      16
#DEFINE _xfrxhyperlink  32


#DEFINE _xfrxrectangle_c   "xfrxrectangle"
#DEFINE _xfrxline_c        "xfrxline"
#DEFINE _xfrxlabel_c       "xfrxlabel"
#DEFINE _xfrximage_c       "xfrximage"
#DEFINE _xfrxhyperlink_c   "xfrxhyperlink"
