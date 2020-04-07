//%attributes = {"invisible":true,"preemptive":"capable"}
  // ----------------------------------------------------
  // Method : PREFERENCES
  // Created 06/10/08 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description
  //
  // ----------------------------------------------------
C_TEXT:C284($1)
C_POINTER:C301(${2})

C_BOOLEAN:C305($Boo_Set)
C_LONGINT:C283($Lon_bottom;$Lon_i;$Lon_left;$Lon_right;$Lon_top)
C_TEXT:C284($kTxt_Tool;$Txt_buffer;$Txt_elementRef;$Txt_EntryPoint;$Txt_onErrorCallMethod;$Txt_Path)
C_TEXT:C284($Txt_Reference;$Txt_root;$Txt_value;$Txt_Xpath)

If (False:C215)
	C_TEXT:C284(PREFERENCES ;$1)
	C_POINTER:C301(PREFERENCES ;${2})
End if 

$Txt_EntryPoint:=$1

$Txt_Path:=Get 4D folder:C485+"4dPop v11 preference.xml"

$kTxt_Tool:="SVG4D"

If (Test path name:C476($Txt_Path)#Is a document:K24:1)
	
	  //open
	$Txt_root:=DOM Create XML Ref:C861("preference")
	
Else 
	
	  //create
	$Txt_root:=DOM Parse XML source:C719($Txt_Path)
	
End if 

If (OK=1)
	
	If ($Txt_EntryPoint="@.set")
		
		$Boo_Set:=True:C214
		$Txt_EntryPoint:=Replace string:C233($Txt_EntryPoint;".set";"")
		
	Else 
		
		$Txt_EntryPoint:=Replace string:C233($Txt_EntryPoint;".get";"")
		
	End if 
	
	$Txt_Xpath:="preference/"+$kTxt_Tool+"/"+$Txt_EntryPoint
	$Txt_elementRef:=DOM Find XML element:C864($Txt_root;$Txt_Xpath)
	
	Case of 
			
			  //______________________________________________________
		: ($Txt_EntryPoint="openRecent")
			
			If ($Boo_Set)
				
				If (OK=1)
					
					DOM REMOVE XML ELEMENT:C869($Txt_elementRef)
					
				End if 
				
				$Txt_elementRef:=DOM Create XML element:C865($Txt_root;$Txt_Xpath)
				
				For ($Lon_i;1;Size of array:C274($2->);1)
					
					DOM SET XML ELEMENT VALUE:C868(DOM Create XML element:C865($Txt_elementRef;"path");\
						$2->{$Lon_i})
					
				End for 
				
			Else 
				
				DELETE FROM ARRAY:C228($2->;Num:C11(Size of array:C274($2->)>0);Size of array:C274($2->))
				
				If (OK=1)
					
					$Txt_Reference:=DOM Get first child XML element:C723($Txt_elementRef;$Txt_buffer;$Txt_value)
					
					Repeat 
						
						If (OK=1)
							
							If (Test path name:C476($Txt_value)=Is a document:K24:1)
								
								APPEND TO ARRAY:C911($2->;$Txt_value)
								
							End if 
							
							$Txt_Reference:=DOM Get next sibling XML element:C724($Txt_Reference;$Txt_buffer;$Txt_value)
							
						End if 
					Until (OK=0)
				End if 
			End if 
			
			  //______________________________________________________
		: ($Txt_EntryPoint="viewerOptions")
			
			If ($Boo_Set)
				
				If (OK=0)
					
					$Txt_elementRef:=DOM Create XML element:C865($Txt_root;$Txt_Xpath)
					
				End if 
				
				DOM SET XML ATTRIBUTE:C866($Txt_elementRef;\
					"showColoredBackground";$2->;\
					"backgroundColor";$3->;\
					"automaticallyResize";$4->;\
					"font-size";$5->)
				
			Else 
				
				If (OK=1)
					
					$Txt_onErrorCallMethod:=Method called on error:C704
					ON ERR CALL:C155("xml_noError")  //=========================== < NO ERROR >
					
					DOM GET XML ATTRIBUTE BY NAME:C728($Txt_elementRef;"showColoredBackground";$2->)
					
					If (OK=0)
						
						$2->:=False:C215
						
					End if 
					
					DOM GET XML ATTRIBUTE BY NAME:C728($Txt_elementRef;"backgroundColor";$3->)
					
					If (OK=0)
						
						$3->:=0x00FFFFFF
						
					End if 
					
					DOM GET XML ATTRIBUTE BY NAME:C728($Txt_elementRef;"automaticallyResize";$4->)
					
					If (OK=0)
						
						$4->:=False:C215
						
					End if 
					
					DOM GET XML ATTRIBUTE BY NAME:C728($Txt_elementRef;"font-size";$5->)
					
					If (OK=0)
						
						$5->:=12
						
					End if 
					
					ON ERR CALL:C155($Txt_onErrorCallMethod)  //=================== </ NO ERROR >
					
				Else 
					
					$2->:=False:C215
					$3->:=0x00FFFFFF
					$4->:=False:C215
					$5->:=12
					
				End if 
			End if 
			
			  //______________________________________________________
		: ($Txt_EntryPoint="@WindowPosition")
			
			If ($Boo_Set)
				
				$Lon_left:=$2->
				$Lon_top:=$3->
				$Lon_right:=$4->
				$Lon_bottom:=$5->
				
				If (OK=0)
					
					$Txt_elementRef:=DOM Create XML element:C865($Txt_root;$Txt_Xpath;\
						"left";$Lon_left;\
						"top";$Lon_top;\
						"right";$Lon_right;\
						"bottom";$Lon_bottom)
					
				Else 
					
					DOM SET XML ATTRIBUTE:C866($Txt_elementRef;\
						"left";$Lon_left;\
						"top";$Lon_top;\
						"right";$Lon_right;\
						"bottom";$Lon_bottom)
					
				End if 
				
			Else 
				
				If (OK=1)
					
					DOM GET XML ATTRIBUTE BY NAME:C728($Txt_elementRef;"left";$2->)
					DOM GET XML ATTRIBUTE BY NAME:C728($Txt_elementRef;"top";$3->)
					DOM GET XML ATTRIBUTE BY NAME:C728($Txt_elementRef;"right";$4->)
					DOM GET XML ATTRIBUTE BY NAME:C728($Txt_elementRef;"bottom";$5->)
					
				End if 
				
				If (OK=0)
					
					$2->:=-1
					$3->:=-1
					$4->:=-1
					$5->:=-1
					
				End if 
			End if 
			
			  //________________________________________
	End case 
	
	If ($Boo_Set)
		
		DOM SET XML DECLARATION:C859($Txt_root;"UTF-8";True:C214;True:C214)
		DOM EXPORT TO FILE:C862($Txt_root;$Txt_Path)
		
	End if 
	
	DOM CLOSE XML:C722($Txt_root)
	
End if 