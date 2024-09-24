//%attributes = {"invisible":true,"preemptive":"capable"}
#DECLARE($ref : Text)

Use (Storage:C1525.svg)
	
	Storage:C1525.svg.docs:=Storage:C1525.svg.docs || New shared collection:C1527
	Storage:C1525.svg.docs.push($ref)
	
End use 