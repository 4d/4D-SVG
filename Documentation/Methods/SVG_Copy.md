<!-- -->
# SVG_Copy

> SVG_Copy ( svgObject ) -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of SVG objec to copy |     |
| Function result |     | SVG_Ref |     | ↩️ |     | Reference of new SVG object |     |

## Description

The SVG_Copy command creates a new SVG document that is a copy of the document referenced by [svgObject](# "Reference of SVG objec to copy").

The command returns a 32-character string ([SVG_Ref](# "Unique ID of an SVG file")) that consists of the reference in memory of the document virtual structure. This reference must be used with the other commands of the component.

**Important:** Once you no longer need it, do not forget to call the [SVG_CLEAR](SVG_CLEAR.md)  command with this reference in order to free up the memory.

### Example  

```4d
 svgRef:=SVG_New   
 ...  
 svgRef Copy:=SVG_Copy (svgRef)
```

## See also

[SVG_CLEAR](SVG_CLEAR.md)  
[SVG_New](SVG_New.md)
