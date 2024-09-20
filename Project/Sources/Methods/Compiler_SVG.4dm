//%attributes = {"invisible":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method : Compiler_SVG
// Created 16/06/08 by Vincent de Lachaux
// ----------------------------------------------------
// Description
// The goal of this method is to group all declarations
// And initialisations for a good execution of the component
// ----------------------------------------------------
#DECLARE($Boo_init : Boolean)

var SVG_Lon_Error : Integer
var SVG_Txt_Command : Text

If (($Boo_init | (Storage:C1525.svg=Null:C1517)))
	
	//    The method must return true or false in accordance with the success of initialisation.
	// The method manages, if necessary, of the update of the stored datas according to the version number
	
	If (Component_init)
		
		// Component options
		// C_LONGINT(<>SVG_Lon_Options)
		// Bit 00 = RESERVED
		// Bit 01 = Dont automatically assign ID
		// Bit 02 = Do not automatically close objects drawn
		// Bit 03 = Background
		// Bit 04 = Absolute coordinate (versus relative)
		// Bit 05 = indentation
		// Bit 06 = BEEP on error
		// Bit 07 = Mode debug : Don't install the error-catching method
		// Bit 08 = Image avec fond
		// Bit 09 = Origine trigo
		// Bit 10 = Substitute 'Arial Unicode MS' to 'Arial'
		// Bit 11 = Set shape-rendering='crispEdges' as default for a new canvas
		// Bit 12 = NO ERROR
		
	Else 
		
		// Alert or quit if initialisation fails
		
	End if 
End if 

// Added by Vincent de Lachaux (11/04/12)
SVG_SET_OPTIONS(Storage:C1525.svg.options)