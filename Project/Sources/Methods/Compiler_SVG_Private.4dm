//%attributes = {"invisible":true}
// ----------------------------------------------------
// Method : Compiler_SVG_Private
// Created 04/07/08 by vdl
// ----------------------------------------------------

If (False:C215)
	
	// ----------------------------------------------------
	C_TEXT:C284(svg_relativeURL; $0)
	C_POINTER:C301(svg_relativeURL; $1)
	
	// ----------------------------------------------------
	C_TEXT:C284(url_encode; $0)
	C_TEXT:C284(url_encode; $1)
	
	// ----------------------------------------------------
	C_TEXT:C284(url_decode; $0)
	C_TEXT:C284(url_decode; $1)
	
	// ----------------------------------------------------
	C_BOOLEAN:C305(Compiler_SVG; $1)
	
	// ----------------------------------------------------
	C_TEXT:C284(Component_about; $1)
	
	// ----------------------------------------------------
	C_LONGINT:C283(Component_defaultOptions; $0)
	
	// ----------------------------------------------------
	C_BOOLEAN:C305(Component_errorHandler; $0)
	C_TEXT:C284(Component_errorHandler; $1)
	C_TEXT:C284(Component_errorHandler; $2)
	C_TEXT:C284(Component_errorHandler; $3)
	
	// ----------------------------------------------------
	C_BOOLEAN:C305(Component_init; $0)
	
	// ----------------------------------------------------
	C_TEXT:C284(fontReplaceArial; $0)
	C_TEXT:C284(fontReplaceArial; $1)
	
	// ----------------------------------------------------
	C_BOOLEAN:C305(str_styledText; $0)
	C_TEXT:C284(str_styledText; $1)
	
	
	
	// ----------------------------------------------------
	C_REAL:C285(SVG_Get_string_width; $0)
	C_TEXT:C284(SVG_Get_string_width; $1)
	C_TEXT:C284(SVG_Get_string_width; $2)
	C_LONGINT:C283(SVG_Get_string_width; $3)
	C_LONGINT:C283(SVG_Get_string_width; $4)
	
	// ----------------------------------------------------
	C_TEXT:C284(xToolbox_GetLastItemFromPath; $0)
	C_TEXT:C284(xToolbox_GetLastItemFromPath; $1)
	C_TEXT:C284(xToolbox_GetLastItemFromPath; $2)
	
	// ----------------------------------------------------
	C_BOOLEAN:C305(Component_putError; $0)
	C_LONGINT:C283(Component_putError; $1)
	C_TEXT:C284(Component_putError; $2)
	
	// ----------------------------------------------------
	C_TEXT:C284(xToolBox_RELEASE_MENU; $1)
	
	// ----------------------------------------------------
	C_TEXT:C284(PREFERENCES; $1)
	C_POINTER:C301(PREFERENCES; ${2})
	
	// ----------------------------------------------------
	C_TEXT:C284(setFontStyles; $1)
	C_LONGINT:C283(setFontStyles; $2)
	
	// ----------------------------------------------------
End if 