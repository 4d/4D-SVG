C_LONGINT:C283($Lon_i)

ARRAY TEXT:C222($tTxt_methodNames;0)
ARRAY TEXT:C222($tTxt_methodShared;0)

METHOD GET NAMES:C1166($tTxt_methodNames)
SORT ARRAY:C229($tTxt_methodNames)

For ($Lon_i;1;Size of array:C274($tTxt_methodNames);1)
	
	If (METHOD Get attribute:C1169($tTxt_methodNames{$Lon_i};Attribute shared:K72:10))
		
		APPEND TO ARRAY:C911($tTxt_methodShared;$tTxt_methodNames{$Lon_i})
		
	End if 
	
End for 

  //%W-518.1
COPY ARRAY:C226($tTxt_methodNames;(OBJECT Get pointer:C1124(Object named:K67:5;"methodNames"))->)
COPY ARRAY:C226($tTxt_methodShared;(OBJECT Get pointer:C1124(Object named:K67:5;"methodShared"))->)
  //%W+518.1