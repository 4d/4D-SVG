//%attributes = {"invisible":true,"preemptive":"incapable"}
C_OBJECT:C1216($1)

C_TEXT:C284($Txt_property)

If (False:C215)
	C_OBJECT:C1216(fallBack_Not_thread_safe ;$1)
End if 

For each ($Txt_property;$1)
	
	Case of 
			
			  //______________________________________________________
		: ($Txt_property="set")
			
			<>Ptr_Document:=$1[$Txt_property]
			
			Use (Storage:C1525.svg)
				
				If (Is nil pointer:C315(<>Ptr_Document))
					
					  // Decrement usage
					Storage:C1525.svg.variableDocument:=Storage:C1525.svg.variableDocument-1
					
				Else 
					
					  // Increment usage
					Storage:C1525.svg.variableDocument:=Num:C11(Storage:C1525.svg.variableDocument)+1
					
				End if 
			End use 
			
			  //______________________________________________________
		: ($Txt_property="document")
			
			<>Ptr_Document->:=$1[$Txt_property]
			
			  //______________________________________________________
		Else 
			
			  //______________________________________________________
	End case 
End for each 