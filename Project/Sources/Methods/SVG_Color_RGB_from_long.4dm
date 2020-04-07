//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_Color_RGB_from_long
  // Created 09/07/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
C_TEXT:C284($0)
C_LONGINT:C283($1)
C_LONGINT:C283($2)

C_LONGINT:C283($Lon_color;$Lon_parameters;$Lon_type)
C_TEXT:C284($kTxt_color;$kTxt_currentMethod;$Txt_color)

If (False:C215)
	C_TEXT:C284(SVG_Color_RGB_from_long ;$0)
	C_LONGINT:C283(SVG_Color_RGB_from_long ;$1)
	C_LONGINT:C283(SVG_Color_RGB_from_long ;$2)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:=Current method name:C684

If ($Lon_parameters>=1)
	
	$Lon_color:=$1
	$Lon_type:=1
	
	If ($Lon_parameters>=2)
		
		$Lon_type:=$2  //{format} [1 (default) rgb(r,g,b); 2 #rgb; 3 #rrggbb; 4 rgb(r%, g%, b%)]
		
	End if 
	
	$kTxt_color:="rgb({red},{green},{blue})"
	
	Case of 
			
			  //______________________________________________________
		: ($Lon_type=1)  //rgb(r,g,b)
			
			$Txt_color:=Replace string:C233($kTxt_color;"{red}";String:C10(($Lon_color & 0x00FF0000) >> 16))
			$Txt_color:=Replace string:C233($Txt_color;"{green}";String:C10(($Lon_color & 0xFF00) >> 8))
			$Txt_color:=Replace string:C233($Txt_color;"{blue}";String:C10(($Lon_color & 0x00FF)))
			
			  //______________________________________________________
		: ($Lon_type=2)  //#rgb
			
			$Txt_color:=Substring:C12(String:C10($Lon_color+0x01000000;"&x");5)
			$Txt_color:="#"+$Txt_color[[1]]+$Txt_color[[3]]+$Txt_color[[5]]
			
			  //______________________________________________________
		: ($Lon_type=3)  //#rrggbb
			
			$Txt_color:="#"+Substring:C12(String:C10($Lon_color+0x01000000;"&x");5)
			
			  //______________________________________________________
		: ($Lon_type=4)  //rgb(100%, 0%, 0%)
			
			$Txt_color:="rgb("+String:C10((($Lon_color & 0x00FF0000) >> 16)/2.55;"&xml")+"%,"
			$Txt_color:=$Txt_color+String:C10((($Lon_color & 0xFF00) >> 8)/2.55;"&xml")+"%,"
			$Txt_color:=$Txt_color+String:C10(($Lon_color & 0x00FF)/2.55;"&xml")+"%)"
			
			  //______________________________________________________
		Else 
			
			ASSERT:C1129(Component_putError (8857;$kTxt_currentMethod))  //Invalid Value for an Argument
			
			  //______________________________________________________
	End case 
	
	$0:=$Txt_color
	
Else 
	
	ASSERT:C1129(Component_putError (8850;$kTxt_currentMethod))  //Parameters Missing
	
End if 