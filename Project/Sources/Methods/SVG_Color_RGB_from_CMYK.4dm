//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_Color_RGB_from_CMYK
  // Created 23/04/10 by Vincent de Lachaux
  // Adapted from a method of Reiner Kief
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
  // Declarations
C_TEXT:C284($0)
C_LONGINT:C283($1)
C_LONGINT:C283($2)
C_LONGINT:C283($3)
C_LONGINT:C283($4)
C_LONGINT:C283($5)

C_LONGINT:C283($Lon_blue;$Lon_C;$Lon_color;$Lon_green;$Lon_K;$Lon_M)
C_LONGINT:C283($Lon_parameters;$Lon_red;$Lon_type;$Lon_Y)
C_TEXT:C284($kTxt_color;$kTxt_currentMethod;$Txt_color)

If (False:C215)
	C_TEXT:C284(SVG_Color_RGB_from_CMYK ;$0)
	C_LONGINT:C283(SVG_Color_RGB_from_CMYK ;$1)
	C_LONGINT:C283(SVG_Color_RGB_from_CMYK ;$2)
	C_LONGINT:C283(SVG_Color_RGB_from_CMYK ;$3)
	C_LONGINT:C283(SVG_Color_RGB_from_CMYK ;$4)
	C_LONGINT:C283(SVG_Color_RGB_from_CMYK ;$5)
End if 

  // ----------------------------------------------------
  // Initialisations
Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_Color_RGB_from_CMYK"

  // ----------------------------------------------------
If ($Lon_parameters>=4)
	
	$Lon_C:=$1  // 0 - 100%
	$Lon_M:=$2  // 0 - 100%
	$Lon_Y:=$3  // 0 - 100%
	$Lon_K:=$4  // 0 - 100%
	
	$Lon_C:=Round:C94($Lon_C*2.55;0)
	$Lon_M:=Round:C94($Lon_M*2.55;0)
	$Lon_Y:=Round:C94($Lon_Y*2.55;0)
	$Lon_K:=Round:C94($Lon_K*2.55;0)
	
	$Lon_type:=1
	
	If ($Lon_parameters>=5)
		
		$Lon_type:=$5  //{format} [1 (default) rgb(r,g,b); 2 #rgb; 3 #rrggbb; 4 rgb(r%, g%, b%)]
		
	End if 
	
	If (($Lon_C+$Lon_K)<255)
		
		$Lon_red:=255-($Lon_C+$Lon_K)
		
	End if 
	
	If (($Lon_M+$Lon_K)<255)
		
		$Lon_green:=255-($Lon_M+$Lon_K)
		
	End if 
	
	If (($Lon_Y+$Lon_K)<255)
		
		$Lon_blue:=255-($Lon_Y+$Lon_K)
		
	End if 
	
	$Lon_color:=($Lon_red << 16)+($Lon_green << 8)+$Lon_blue
	
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