# SVG_New

>**SVG_New** {( *width* ; *height* {; *title* {; *description* {; *rectangle* {; *display*}}}} )} -> Function result

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| width | Longint | &#8594; | Document width |
| height | Longint | &#8594; | Document height |
| title | String | &#8594; | Document title |
| description | String | &#8594; | Description |
| rectangle | Boolean | &#8594; | Set viewbox |
| display | Integer | &#8594; | Picture display format |
| Function result | SVG_Ref | &#8592; | SVG object reference |



#### Description 

The SVG\_New command creates a new SVG document and returns its reference number.

The optional *width* and *height* parameters can be used to limit the space of the SVG document to the dimensions indicated. These 2 parameters are expected in user points ('px'); if you want to specify another unit, you must use the *SVG\_SET\_DIMENSIONS* command.

The optional *title* and *description* parameters can be used to give information about the contents.

If you pass True in the optional *rectangle* parameter, the viewbox ('viewBox' attribute) is automatically set to the size of the document created.

**Note:** It is possible to modify the coordinates of the graphic viewbox and to adjust the fitting of the picture to it more precisely using the *SVG\_SET\_VIEWBOX* command.

The optional *display* parameter can be used to indicate whether the graphic must be fitted to the size of the document. You can pass one of the following 4D picture display format constants as parameter: Scaled to fit prop centered or Scaled to Fit.

The command returns a 32-character string ([SVG\_Ref](# "Unique ID of an SVG file")) that consists of the reference in memory of the document virtual structure. This reference must be used with the other commands of the component.

**Important:** Once you no longer need it, do not forget to call the *SVG\_CLEAR* command with this reference in order to free up the memory.

#### Example 

```4d
 svgRef:=SVG_New
 svgRef:=SVG_New(500;200)
 svgRef:=SVG_New(900;700;"SVG component test";"This is an example";True;Scaled to fit)
```

#### See also 

[SVG\_CLEAR](SVG_CLEAR.md)  
[SVG\_Copy](SVG_Copy.md)  
[SVG\_Open\_file](SVG_Open_file.md)  