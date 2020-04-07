//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_GET_COLORS_ARRAY
  // Created 28/10/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  // Give a pointer to a text array, it will be filled with the name of the svg colors
  // ----------------------------------------------------
C_POINTER:C301($1)

C_LONGINT:C283($Lon_index)
C_POINTER:C301($Ptr_colorNamesArray)
C_TEXT:C284($kTxt_currentMethod;$Txt_buffer)

If (False:C215)
	C_POINTER:C301(SVG_GET_COLORS_ARRAY ;$1)
End if 

Compiler_SVG 

$kTxt_currentMethod:="SVG_GET_COLORS_ARRAY"  //Nom methode courante

Case of 
		
		  //______________________________________________________
	: (Count parameters:C259=0)
		
		ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Argument missing
		
		  //______________________________________________________
	: (Is nil pointer:C315($1))
		
		ASSERT:C1129(Component_putError (8851;$kTxt_currentMethod))  //Invalid type for an argument
		
		  //______________________________________________________
	: (Type:C295($1->)#Text array:K8:16)
		
		ASSERT:C1129(Component_putError (8851;$kTxt_currentMethod))  //Invalid type for an argument
		
		  //______________________________________________________
	Else 
		
		$Ptr_colorNamesArray:=$1
		
		Component_errorHandler ("init";$kTxt_currentMethod)
		
		DELETE FROM ARRAY:C228($Ptr_colorNamesArray->;Num:C11(Size of array:C274($Ptr_colorNamesArray->)>0);Size of array:C274($Ptr_colorNamesArray->))
		
		Repeat 
			
			$Lon_index:=$Lon_index+1
			$Txt_buffer:=Get localized string:C991("color_"+String:C10($Lon_index))
			
			If (OK=1)
				
				APPEND TO ARRAY:C911($Ptr_colorNamesArray->;$Txt_buffer)
				
			End if 
		Until (OK=0)
		
		ASSERT:C1129(Component_errorHandler ("deinit"))
		
		  //______________________________________________________
End case 