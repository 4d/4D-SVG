//%attributes = {"invisible":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method : PREFERENCES
// Created 06/10/08 by Vincent de Lachaux
// ----------------------------------------------------
#DECLARE($action : Text;  ...  : Pointer)

var $set : Boolean
var $bottom; $i; $left; $right; $top : Integer
var $TOOL; $t; $node; $pathname : Text
var $root; $value; $XPATH : Text

$pathname:=Get 4D folder:C485+"4dPop v11 preference.xml"

$TOOL:="SVG4D"

If (Test path name:C476($pathname)#Is a document:K24:1)
	
	// Open
	$root:=DOM Create XML Ref:C861("preference")
	
Else 
	
	// Create
	$root:=DOM Parse XML source:C719($pathname)
	
End if 

If (OK=1)
	
	If ($action="@.set")
		
		$set:=True:C214
		$action:=Replace string:C233($action; ".set"; "")
		
	Else 
		
		$action:=Replace string:C233($action; ".get"; "")
		
	End if 
	
	$XPATH:="preference/"+$TOOL+"/"+$action
	
	$node:=DOM Find XML element:C864($root; $XPATH)
	
	Case of 
			
			//______________________________________________________
		: ($action="openRecent")
			
			If ($set)
				
				If (OK=1)
					
					DOM REMOVE XML ELEMENT:C869($node)
					
				End if 
				
				$node:=DOM Create XML element:C865($root; $XPATH)
				
				For ($i; 1; Size of array:C274($2->); 1)
					
					DOM SET XML ELEMENT VALUE:C868(DOM Create XML element:C865($node; "path"); \
						$2->{$i})
					
				End for 
				
			Else 
				
				DELETE FROM ARRAY:C228($2->; Num:C11(Size of array:C274($2->)>0); Size of array:C274($2->))
				
				If (OK=1)
					
					$node:=DOM Get first child XML element:C723($node; $t; $value)
					
					Repeat 
						
						If (OK=1)
							
							If (Test path name:C476($value)=Is a document:K24:1)
								
								APPEND TO ARRAY:C911($2->; $value)
								
							End if 
							
							$node:=DOM Get next sibling XML element:C724($node; $t; $value)
							
						End if 
					Until (OK=0)
				End if 
			End if 
			
			//______________________________________________________
		: ($action="viewerOptions")
			
			If ($set)
				
				If (OK=0)
					
					$node:=DOM Create XML element:C865($root; $XPATH)
					
				End if 
				
				DOM SET XML ATTRIBUTE:C866($node; \
					"showColoredBackground"; $2->; \
					"backgroundColor"; $3->; \
					"automaticallyResize"; $4->; \
					"font-size"; $5->)
				
			Else 
				
				If (Bool:C1537(OK))
					
					Try
						
						DOM GET XML ATTRIBUTE BY NAME:C728($node; "showColoredBackground"; $2->)
						
						If (OK=0)
							
							$2->:=False:C215
							
						End if 
						
						DOM GET XML ATTRIBUTE BY NAME:C728($node; "backgroundColor"; $3->)
						
						If (OK=0)
							
							$3->:=0x00FFFFFF
							
						End if 
						
						DOM GET XML ATTRIBUTE BY NAME:C728($node; "automaticallyResize"; $4->)
						
						If (OK=0)
							
							$4->:=False:C215
							
						End if 
						
						DOM GET XML ATTRIBUTE BY NAME:C728($node; "font-size"; $5->)
						
						If (OK=0)
							
							$5->:=12
							
						End if 
						
					End try
					
				Else 
					
					$2->:=False:C215
					$3->:=0x00FFFFFF
					$4->:=False:C215
					$5->:=12
					
				End if 
			End if 
			
			//______________________________________________________
		: ($action="@WindowPosition")
			
			If ($set)
				
				$left:=$2->
				$top:=$3->
				$right:=$4->
				$bottom:=$5->
				
				If (OK=0)
					
					$node:=DOM Create XML element:C865($root; $XPATH; \
						"left"; $left; \
						"top"; $top; \
						"right"; $right; \
						"bottom"; $bottom)
					
				Else 
					
					DOM SET XML ATTRIBUTE:C866($node; \
						"left"; $left; \
						"top"; $top; \
						"right"; $right; \
						"bottom"; $bottom)
					
				End if 
				
			Else 
				
				If (OK=1)
					
					DOM GET XML ATTRIBUTE BY NAME:C728($node; "left"; $2->)
					DOM GET XML ATTRIBUTE BY NAME:C728($node; "top"; $3->)
					DOM GET XML ATTRIBUTE BY NAME:C728($node; "right"; $4->)
					DOM GET XML ATTRIBUTE BY NAME:C728($node; "bottom"; $5->)
					
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
	
	If ($set)
		
		DOM SET XML DECLARATION:C859($root; "UTF-8"; True:C214; True:C214)
		DOM EXPORT TO FILE:C862($root; $pathname)
		
	End if 
	
	DOM CLOSE XML:C722($root)
	
End if 