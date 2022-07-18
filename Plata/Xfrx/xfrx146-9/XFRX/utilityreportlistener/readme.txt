Last update: 1/22/2008
Please send questions/feedback to eqeus@eqeus.com

===== UtilityReportListener class in XFRX =====

Since version 12.4 the XFRXListener class (which is used when running reports in VFP 9.0 in the object assisted (report listener) mode) is derived from the UtilityReportListener class, which is not included inside XFRX.PRG (XFRX.FXP) and needs to be provided for XFRX to run correctly. 

UtilityReportListener is a FFC class which takes care, via its predecessor FXListener, of the new dynamic reporting features introduced in VFP 9.0 SP2. It implemented in ReportListener.vcx class library, which is by default stored in the FFC subdirectory of the VFP home directory. In the development environment you make it available by executing the following command:

SET CLASSLIB TO (HOME()+"ffc\_reportlistener")

To distribute UtilityReportListener with your application you need to include the following FFC files (all available in the FFC directory):

- _reportlistener.vcx
- reportlisteners.h
- reportlisteners_locs.h
- foxpro_reporting.h
- _frxcursor.vcx
- _frxcursor.h
- _gdiplus.vcx
- gdiplus.h

A drawback of including the FFC classes to your project is that they add almost 1MB to the final exe size so alternatively, if you don't use the dynamic features in SP2 and you would like to reduce the final exe size, you can use a UtilityReportListener implementation that comes in with the XFRX package in UtilityReportListener.zip. This implementation corresponds to the pre-SP2 FFC class and is only about 30KB. To use the alternative implementation add the following files to your project (all available in the UtilityReportListener.zip archive):

- reportlisteners.h
- reportlisteners_locs.h
- foxpro_reporting.h
- utilityReportListener.prg

and make the implementation visible by executing the following command before running XFRX:

SET PROCEDURE TO utilityReportListener.prg ADDITIVE

