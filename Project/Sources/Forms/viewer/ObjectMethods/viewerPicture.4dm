C_LONGINT:C283($0)

C_PICTURE:C286($Pic_buffer)
C_POINTER:C301($Ptr_object)
C_TEXT:C284($Txt_ID;$Txt_path;$Txt_root)

$0:=-1

Case of 
		
		  //______________________________________________________
	: (Form event:C388=On Drag Over:K2:13)
		
		$Txt_path:=Get file from pasteboard:C976(1)
		
		If (Length:C16($Txt_path)>0)
			
			If ($Txt_path="@.svgz")
				
				$0:=0
				
			Else 
				
				ON ERR CALL:C155("Viewer_main")  //=========================== < NO ERROR >
				
				$Txt_root:=DOM Parse XML source:C719($Txt_path;False:C215)
				
				If (OK=1)
					
					READ PICTURE FILE:C678($Txt_path;$Pic_buffer)
					
					If (OK=1)
						
						$0:=0
						
					End if 
				End if 
				
				ON ERR CALL:C155("")  //==================================== </ NO ERROR >
				
			End if 
		End if 
		
		  //______________________________________________________
	: (Form event:C388=On Drop:K2:12)
		
		Viewer_main ("menu";"open"+Get file from pasteboard:C976(1))
		
		  //______________________________________________________
	: (Form event:C388=On Begin Drag Over:K2:44)
		
		$Txt_path:=Temporary folder:C486+"4DSVG.svg"
		WRITE PICTURE FILE:C680($Txt_path;<>SVG_viewerPicture;".svg")
		
		If (OK=1)
			
			SET FILE TO PASTEBOARD:C975($Txt_path)
			
		End if 
		
		  //______________________________________________________
	Else 
		
		$Txt_ID:=SVG Find element ID by coordinates:C1054(*;"viewerPicture";MouseX;MouseY)
		
		$Ptr_object:=OBJECT Get pointer:C1124(Object named:K67:5;"id")
		$Ptr_object->:=$Txt_ID
		
		  //______________________________________________________
		If (Length:C16(<>SVG_Txt_Viewer_Callback_Method)>0)
			
			EXECUTE METHOD:C1007(<>SVG_Txt_Viewer_Callback_Method;*;$Txt_ID)
			
		End if 
		
		  //______________________________________________________
End case 

If (Form event:C388=On Mouse Leave:K2:34)
	
	MouseX:=-1
	MouseY:=-1
	
End if 