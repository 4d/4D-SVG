//%attributes = {"invisible":true,"preemptive":"incapable"}
#DECLARE($properties : Object)

var $property : Text

For each ($property; $properties)
	
	Case of 
			
			//______________________________________________________
		: ($property="set")
			
			<>Ptr_Document:=$properties[$property]
			
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
		: ($property="document")
			
			<>Ptr_Document->:=$properties[$property]
			
			//______________________________________________________
	End case 
End for each 