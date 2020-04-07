//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : SVG_Color_RGB_from_HLS
  // Created 09/10/08 by Vincent de Lachaux
  // Adapted from a method of Roland Lannuzel
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
C_TEXT:C284($0)
C_LONGINT:C283($1)
C_LONGINT:C283($2)
C_LONGINT:C283($3)
C_LONGINT:C283($4)

C_LONGINT:C283($Lon_blue;$Lon_color;$Lon_delta;$Lon_green;$Lon_hue;$Lon_luminosity)
C_LONGINT:C283($Lon_max;$Lon_min;$Lon_parameters;$Lon_red;$Lon_saturation;$Lon_type)
C_TEXT:C284($kTxt_color;$kTxt_currentMethod;$Txt_color)

If (False:C215)
	C_TEXT:C284(SVG_Color_RGB_from_HLS ;$0)
	C_LONGINT:C283(SVG_Color_RGB_from_HLS ;$1)
	C_LONGINT:C283(SVG_Color_RGB_from_HLS ;$2)
	C_LONGINT:C283(SVG_Color_RGB_from_HLS ;$3)
	C_LONGINT:C283(SVG_Color_RGB_from_HLS ;$4)
End if 

Compiler_SVG 

$Lon_parameters:=Count parameters:C259
$kTxt_currentMethod:="SVG_Color_RGB_from_HLS"  //Nom methode courante

If ($Lon_parameters>=3)
	
	$Lon_hue:=$1%360  //0 à 360°
	$Lon_luminosity:=$2  //0 à 100%
	$Lon_saturation:=$3  //0 à 100%
	
	$Lon_type:=1
	
	If ($Lon_parameters>=4)
		
		$Lon_type:=$4  //{format} [1 (default) rgb(r,g,b); 2 #rgb; 3 #rrggbb; 4 rgb(r%, g%, b%)]
		
	End if 
	
	$Lon_max:=$Lon_luminosity*255/100  //RGB vont de 0 à 255
	$Lon_min:=$Lon_max*((100-$Lon_saturation)/100)
	$Lon_delta:=$Lon_max-$Lon_min
	
	Case of 
			
			  //:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		: ($Lon_hue>=300)
			
			$Lon_hue:=$Lon_hue-300
			$Lon_red:=$Lon_max
			$Lon_green:=$Lon_min
			$Lon_blue:=$Lon_max-($Lon_delta*($Lon_hue/60))  //Bleu décroissant
			
			  //:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		: ($Lon_hue>=240)
			
			$Lon_hue:=$Lon_hue-240
			$Lon_blue:=$Lon_max
			$Lon_green:=$Lon_min
			$Lon_red:=$Lon_min+($Lon_delta*($Lon_hue/60))  //Rouge croissant
			
			  //:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		: ($Lon_hue>=180)
			
			$Lon_hue:=$Lon_hue-180
			$Lon_blue:=$Lon_max
			$Lon_red:=$Lon_min
			$Lon_green:=$Lon_max-($Lon_delta*($Lon_hue/60))  //Vert décroissant
			
			  //:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		: ($Lon_hue>=120)
			
			$Lon_hue:=$Lon_hue-120
			$Lon_green:=$Lon_max
			$Lon_red:=$Lon_min
			$Lon_blue:=$Lon_min+($Lon_delta*($Lon_hue/60))  //bleu croissant
			
			  //:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		: ($Lon_hue>=60)
			
			$Lon_hue:=$Lon_hue-60
			$Lon_green:=$Lon_max
			$Lon_blue:=$Lon_min
			$Lon_red:=$Lon_max-($Lon_delta*($Lon_hue/60))  //Rouge décroissant
			
			  //:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		: ($Lon_hue>=0)
			
			$Lon_hue:=$Lon_hue-0  //pour la symétrie des autres cas :-)
			$Lon_red:=$Lon_max
			$Lon_blue:=$Lon_min
			$Lon_green:=$Lon_min+($Lon_delta*($Lon_hue/60))  //vert croissant
			
			  //:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	End case 
	
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