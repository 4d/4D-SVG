# SVG_Copy

>**SVG_Copy** ( *svgObject* ) -> Function result

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#8594; | Reference of SVG objec to copy |
| Function result | SVG_Ref | &#8592; | Reference of new SVG object |



#### Description 

The SVG\_Copy command creates a new SVG document that is a copy of the document referenced by *svgObject*.

The command returns a 32-character string ([SVG\_Ref](# "Unique ID of an SVG file")) that consists of the reference in memory of the document virtual structure. This reference must be used with the other commands of the component.

**Important:** Once you no longer need it, do not forget to call the *SVG\_CLEAR* command with this reference in order to free up the memory.

#### Example 

```4d
 svgRef:=SVG_New
 ...
 svgRef Copy:=SVG_Copy(svgRef)
```

#### See also 

[SVG\_CLEAR](SVG_CLEAR.md)  
[SVG\_New](SVG_New.md)  