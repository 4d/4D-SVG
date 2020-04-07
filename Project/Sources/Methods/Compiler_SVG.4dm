//%attributes = {"invisible":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : Compiler_SVG
  // Created 16/06/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  // The goal of this method is to group all declarations
  // and initialisations for a good execution of the component
  // ----------------------------------------------------

  //===============================
  // %W-518.7
  // %W-518.1
  // %W-518.5
  // %W-529.17
  //===============================

C_BOOLEAN:C305($1)

C_BOOLEAN:C305($Boo_init)

If (Count parameters:C259>0)
	
	$Boo_init:=$1
	
End if 

  //The use of this sequence makes the test valide in code both interpreted and compiled {
  //$Boo_init:=($Boo_init | (<>svg_Boo_Inited=Undefined))
  //C_BOOLEAN(<>svg_Boo_Inited)
  //$Boo_init:=($Boo_init | Not(<>svg_Boo_Inited))
  //}

  // ----------------------------------------------------
  //Process variables
C_LONGINT:C283(SVG_Lon_Error)
C_TEXT:C284(SVG_Txt_Command)

  // ----------------------------------------------------

If (($Boo_init | (Storage:C1525.svg=Null:C1517)))
	
	  // ----------------------------------------------------
	  //INITIALISATION
	  //   The method must return true or false in accordance with the success of initialisation.
	  //   The method manages, if necessary, of the update of the stored datas according to the version number
	
	If (Component_init )
		
		  // ----------------------------------------------------
		  //USES {
		  //Compiler_SVG_Public
		  //Compiler_SVG_Private
		  //}
		  // ----------------------------------------------------
		  //Interprocess variables {
		  // ----------------------------------------------------
		  //C_TEXT(<>SVG_Encoding)
		  //Component options {
		  //C_LONGINT(<>SVG_Lon_Options)
		  //bit 00 = RESERVED
		  //bit 01 = Dont automatically assign ID
		  //bit 02 = Do not automatically close objects drawn
		  //bit 03 = Background
		  //bit 04 = Absolute coordinate (versus relative)
		  //bit 05 = indentation
		  //bit 06 = BEEP on error
		  //bit 07 = Mode debug : Don't install the error-catching method
		  //bit 08 = Image avec fond
		  //bit 09 = Origine trigo
		  //bit 10 = Substitute 'Arial Unicode MS' to 'Arial'
		  //bit 11 = Set shape-rendering='crispEdges' as default for a new canvas
		  //bit 12 = NO ERROR
		  //}
		  //Default values {
		  //C_TEXT(<>kTxt_strokeColor)
		  //C_TEXT(<>kTxt_fillColor)
		  //}
		  //C_LONGINT(<>SVG_Lon_Error)
		  //C_TEXT(<>SVG_Txt_Current_Error_Method)
		  //C_TEXT(<>SVG_Txt_Host_Error_Method)
		  //C_TEXT(<>kTxt_fe_inValues)
		  //C_TEXT(<>kTxt_fe_in2Values)
		  //C_TEXT(<>kTxt_feComposite_operatorValues)
		  //C_TEXT(<>kTxt_feColorMatrix_typeValues)
		  //<4DPop>
		  //</4DPop>
		  // ----------------------------------------------------
		  //Interprocess arrays {
		  // ----------------------------------------------------
		  //The last error occured for a  document
		  //(in ◊svg_tLon_Errors{0} contains the last error occurred)
		  //ARRAY LONGINT(<>svg_tLon_Errors;0)
		  //}
		  // ----------------------------------------------------
		
	Else 
		
		  //Alert or quit if initialisation fails {
		
		  //}
	End if 
End if 

  // Added by Vincent de Lachaux (11/04/12)
SVG_SET_OPTIONS (Storage:C1525.svg.options)