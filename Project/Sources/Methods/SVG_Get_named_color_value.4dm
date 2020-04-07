//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Project method : SVG_Get_named_color_value
  // Database: 4D SVG
  // ID[7575DDE486844DE59EE3C67968103647]
  // Created 12-2-2013 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description:
  // Return the longint (default) value for a svg named color ($1)
  // If $2 is "r", "b" or "g" return the red, blue or green color component
  // ----------------------------------------------------
  // Declarations
C_LONGINT:C283($0)
C_TEXT:C284($1)
C_TEXT:C284($2)

C_LONGINT:C283($Lon_color;$Lon_parameters;$Lon_x)
C_TEXT:C284($Txt_colorName;$Txt_what)
C_OBJECT:C1216($Obj_colors)

ARRAY TEXT:C222($tTxt_colorNames;0)
ARRAY OBJECT:C1221($tObj_colorValues;0)

If (False:C215)
	C_LONGINT:C283(SVG_Get_named_color_value ;$0)
	C_TEXT:C284(SVG_Get_named_color_value ;$1)
	C_TEXT:C284(SVG_Get_named_color_value ;$2)
End if 

  // ----------------------------------------------------
  // Initialisations
$Lon_parameters:=Count parameters:C259

If ($Lon_parameters>=1)
	
	$Txt_colorName:=$1  // svg color name
	
	If ($Lon_parameters>=2)
		
		$Txt_what:=$2  //{what value} "r" or "g" or "v" or "b" for the color component, else long color
		
	End if 
	
	  //ACI0096809 {
	  //********************************************************
	  //FOR THE REPORT:
	  //               • DELETE LIST "color_values"
	  //               • SUBMIT file "colors.json
	  //********************************************************
	  //$Lst_colors:=Load list("color_values")
	  //$Lon_id:=Find in list($Lst_colors;$Txt_colorName;0;*)
	  //GET LIST ITEM PARAMETER($Lst_colors;$Lon_id;"R";$Lon_R)
	  //GET LIST ITEM PARAMETER($Lst_colors;$Lon_id;"G";$Lon_G)
	  //GET LIST ITEM PARAMETER($Lst_colors;$Lon_id;"B";$Lon_B)
	  //Case of
	  //  //______________________________________________________
	  //: ($Txt_what="r")
	  //$Lon_color:=$Lon_R
	  //  //______________________________________________________
	  //: ($Txt_what="g")| ($Txt_what="v")
	  //$Lon_color:=$Lon_G
	  //  //______________________________________________________
	  //: ($Txt_what="b")
	  //$Lon_color:=$Lon_B
	  //  //______________________________________________________
	  //Else
	  //$Lon_color:=($Lon_R << 16)+($Lon_G << 8)+$Lon_B
	  //  //______________________________________________________
	  //End case
	  //  //#ACI0091143
	  //CLEAR LIST($Lst_colors)
	
	$Obj_colors:=JSON Parse:C1218(Document to text:C1236(Get 4D folder:C485(Current resources folder:K5:16)+"colors.json"))
	
	OB GET ARRAY:C1229($Obj_colors;"colors";$tTxt_colorNames)
	OB GET ARRAY:C1229($Obj_colors;"values";$tObj_colorValues)
	
	$Lon_x:=Find in array:C230($tTxt_colorNames;$Txt_colorName)
	
	Case of 
			
			  //______________________________________________________
		: ($Lon_x=-1)
			
			ASSERT:C1129(Component_putError (8857;"SVG_Get_named_color_value"))  //Invalid Value for an Argument
			
			  //______________________________________________________
		: ($Txt_what="r")
			
			$Lon_color:=OB Get:C1224($tObj_colorValues{$Lon_x};"r";Is longint:K8:6)
			
			  //______________________________________________________
		: ($Txt_what="g")\
			 | ($Txt_what="v")
			
			$Lon_color:=OB Get:C1224($tObj_colorValues{$Lon_x};"g";Is longint:K8:6)
			
			  //______________________________________________________
		: ($Txt_what="b")
			
			$Lon_color:=OB Get:C1224($tObj_colorValues{$Lon_x};"b";Is longint:K8:6)
			
			  //______________________________________________________
		Else 
			
			$Lon_color:=(OB Get:C1224($tObj_colorValues{$Lon_x};"r";Is longint:K8:6) << 16)\
				+(OB Get:C1224($tObj_colorValues{$Lon_x};"g";Is longint:K8:6) << 8)\
				+OB Get:C1224($tObj_colorValues{$Lon_x};"b";Is longint:K8:6)
			
			  //______________________________________________________
	End case 
	  //}
	
	$0:=$Lon_color
	
Else 
	
	ASSERT:C1129(Component_putError (8850;Current method name:C684))  //Argument missing
	
End if 

  // ----------------------------------------------------
  // End