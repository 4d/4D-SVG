//%attributes = {"invisible":true}
// ----------------------------------------------------
// Method : Compiler_SVG_Private
// Created 04/07/08 by vdl
// ----------------------------------------------------

If (False:C215)
	
	// ----------------------------------------------------
	//_O_C_TEXT(svg_relativeURL; $0)
	//_O_C_POINTER(svg_relativeURL; $1)
	
	// ----------------------------------------------------
	//_O_C_TEXT(url_encode; $0)
	//_O_C_TEXT(url_encode; $1)
	
	// ----------------------------------------------------
	//_O_C_TEXT(url_decode; $0)
	//_O_C_TEXT(url_decode; $1)
	
	// ----------------------------------------------------
	//_O_C_BOOLEAN(Compiler_SVG; $1)
	
	// ----------------------------------------------------
	//_O_C_TEXT(Component_about; $1)
	
	// ----------------------------------------------------
	//_O_C_LONGINT(Component_defaultOptions; $0)
	
	// ----------------------------------------------------
	_O_C_BOOLEAN:C305(Component_errorHandler; $0)
	_O_C_TEXT:C284(Component_errorHandler; $1)
	_O_C_TEXT:C284(Component_errorHandler; $2)
	_O_C_TEXT:C284(Component_errorHandler; $3)
	
	// ----------------------------------------------------
	//_O_C_BOOLEAN(Component_init; $0)
	
	// ----------------------------------------------------
	_O_C_TEXT:C284(fontReplaceArial; $0)
	_O_C_TEXT:C284(fontReplaceArial; $1)
	
	// ----------------------------------------------------
	_O_C_BOOLEAN:C305(str_styledText; $0)
	_O_C_TEXT:C284(str_styledText; $1)
	
	
	
	// ----------------------------------------------------
	_O_C_REAL:C285(SVG_Get_string_width; $0)
	_O_C_TEXT:C284(SVG_Get_string_width; $1)
	_O_C_TEXT:C284(SVG_Get_string_width; $2)
	_O_C_LONGINT:C283(SVG_Get_string_width; $3)
	_O_C_LONGINT:C283(SVG_Get_string_width; $4)
	
	// ----------------------------------------------------
	//_O_C_TEXT(xToolbox_GetLastItemFromPath; $0)
	//_O_C_TEXT(xToolbox_GetLastItemFromPath; $1)
	//_O_C_TEXT(xToolbox_GetLastItemFromPath; $2)
	
	// ----------------------------------------------------
	_O_C_BOOLEAN:C305(Component_putError; $0)
	_O_C_LONGINT:C283(Component_putError; $1)
	_O_C_TEXT:C284(Component_putError; $2)
	
	// ----------------------------------------------------
	//_O_C_TEXT(xToolBox_RELEASE_MENU; $1)
	
	// ----------------------------------------------------
	_O_C_TEXT:C284(PREFERENCES; $1)
	_O_C_POINTER:C301(PREFERENCES; ${2})
	
	// ----------------------------------------------------
	_O_C_TEXT:C284(setFontStyles; $1)
	_O_C_LONGINT:C283(setFontStyles; $2)
	
	// ----------------------------------------------------
End if 