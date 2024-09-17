<!-- rootReference := SVG_New ( width ; height ; title ; description ; viewBox ; preserveAspectRatio )
 -> width (Real)
 -> height (Real)
 -> title (Text)
 -> description (Text)
 -> viewBox (Boolean)
 -> preserveAspectRatio (Long Integer)
 <- rootReference (Text)-->
# SVG_New

> SVG_New {( width ; height {; title {; description {; rectangle {; display}}}} )} -> Function result

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| width |     | Longint |     | ➡️ |     | Document width |     |
| height |     | Longint |     | ➡️ |     | Document height |     |
| title |     | String |     | ➡️ |     | Document title |     |
| description |     | String |     | ➡️ |     | Description |     |
| rectangle |     | Boolean |     | ➡️ |     | Set viewbox |     |
| display |     | Integer |     | ➡️ |     | Picture display format |     |
| Function result |     | SVG_Ref |     | ↩️ |     | SVG object reference |     |

## Description

The SVG_New command creates a new SVG document and returns its reference number.

The optional [width](## "Document width") and [height](## "Document height") parameters can be used to limit the space of the SVG document to the dimensions indicated. These 2 parameters are expected in user points ('px'); if you want to specify another unit, you must use the [SVG_SET_DIMENSIONS](SVG_SET_DIMENSIONS.md)  command.

The optional [title](## "Document title") and [description](## "Description") parameters can be used to give information about the contents.

If you pass True in the optional [rectangle](## "Set viewbox") parameter, the viewbox ('viewBox' attribute) is automatically set to the size of the document created.

**Note:** It is possible to modify the coordinates of the graphic viewbox and to adjust the fitting of the picture to it more precisely using the [SVG_SET_VIEWBOX](SVG_SET_VIEWBOX.md)  command.

The optional [display](## "Picture display format") parameter can be used to indicate whether the graphic must be fitted to the size of the document. You can pass one of the following 4D picture display format constants as parameter: Scaled to fit prop centered or Scaled to Fit.

The command returns a 32-character string ([SVG_Ref](## "Unique ID of an SVG file")) that consists of the reference in memory of the document virtual structure. This reference must be used with the other commands of the component.

**Important:** Once you no longer need it, do not forget to call the [SVG_CLEAR](SVG_CLEAR.md)  command with this reference in order to free up the memory.

### Example  

```4d
 svgRef:=SVG_New   
 svgRef:=SVG_New (500;200)  
 svgRef:=SVG_New (900;700;"SVG component test";"This is an example";True;Scaled to fit)
```

## See also

[SVG_CLEAR](SVG_CLEAR.md)  
[SVG_Copy](SVG_Copy.md)  
[SVG_Open_file](SVG_Open_file.md)
