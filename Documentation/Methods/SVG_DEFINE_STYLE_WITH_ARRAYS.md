# SVG_DEFINE_STYLE_WITH_ARRAYS

>**SVG_DEFINE_STYLE_WITH_ARRAYS** ( *svgObject* ; *namesArrayPointer* ; *valuesArrayPointer* {; *className* {; *type* {; *media* {; *title*}}}} )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#8594; | SVG object reference |
| namesArrayPointer | Pointer | &#8594; | Pointer to array of style names |
| valuesArrayPointer | Pointer | &#8594; | Pointer to array of style values |
| className | Text | &#8594; | CSS class name |
| type | Text | &#8594; | Type of contents |
| media | Text | &#8594; | Media descriptor |
| title | Text | &#8594; | Style name |



#### Description 

The **SVG\_DEFINE\_STYLE\_WITH\_ARRAYS** method defines styles (using arrays) for the SVG object designated in the *svgObject.* parameter. 

* If the *svgObject* parameter designates the root element, styles are set as "style" elements included in the "defs" section (Internal Style Sheet). In this case, the *className* parameter is mandatory (if it is missing, an error is returned). You can then assign the *className* style sheet to the SVG objects by passing its name to the *SVG\_SET\_CLASS* method (see example 1).
* If the *svgObject* parameter designates an SVG element other than the root element, the style is set as a style attribute for this element (Inline Style Sheet) (see example 2).

The optional *type* parameter specifies the language of the style sheet for the contents of the element. The default value is "text/css". 

The optional *media* parameter indicates the desired destination media for the style information. If you omit this parameter, the default value used is "all". If the value is not included in the list of media types recognized by CSS2, an error is generated.

The optional *title* parameter adds an attribute of the "title" type. 

#### Example 1 

Example of definition of internal styles:

```4d
 ARRAY TEXT($arrnames;0)
 ARRAY TEXT($arrvalues;0)
 APPEND TO ARRAY($arrnames;"fill")
 APPEND TO ARRAY($arrvalues;"black")
 APPEND TO ARRAY($arrnames;"font-family")
 APPEND TO ARRAY($arrvalues;"'Lucida Grande' Verdana")
 APPEND TO ARRAY($arrnames;"font-size")
 APPEND TO ARRAY($arrvalues;"20px")
 APPEND TO ARRAY($arrnames;"text-align")
 APPEND TO ARRAY($arrvalues;"center")
 
 $svg:=SVG_New
 SVG_DEFINE_STYLE_WITH_ARRAYS($svg;->$arrnames;->$arrvalues;"title")
 $object:=SVG_New_textArea($svg;"Hello World!";10;10;200;310)
 SVG_SET_CLASS($object;"title")
```

This method generates the following code:

```XML
<?xml version="1.0" encoding="UTF-8" standalone="yes" ?>
<svg xmlns="http://www.w3.org/2000/svg">
    <defs id="4D">
        <style type="text/css">.title{fill:red;font-family:'Lucida Grande' Verdana;font-size:20px;text-align:center;}</style>
    </defs>
    <textArea class="title" height="310" width="200" x="10" y="10">Hello World!</textArea>
</svg>
```

#### Example 2 

Example of definition of inline styles:

```4d
 ARRAY TEXT($arrnames;0)
 ARRAY TEXT($arrvalues;0)
 APPEND TO ARRAY($arrnames;"fill")
 APPEND TO ARRAY($arrvalues;"black")
 APPEND TO ARRAY($arrnames;"font-family")
 APPEND TO ARRAY($arrvalues;"'Lucida Grande' Verdana")
 APPEND TO ARRAY($arrnames;"font-size")
 APPEND TO ARRAY($arrvalues;"20px")
 APPEND TO ARRAY($arrnames;"text-align")
 APPEND TO ARRAY($arrvalues;"center")
 
 $svg:=SVG_New
 $object:=SVG_New_textArea($svg;"Hello World!";10;10;200;310)
 SVG_DEFINE_STYLE_WITH_ARRAYS($object;->$arrnames;->$arrvalues)
```

This method generates the following code:

```XML
<?xml version="1.0" encoding="UTF-8" standalone="yes" ?>
<svg xmlns="http://www.w3.org/2000/svg">
    <textArea height="310" style="fill:red;font-family:'Lucida Grande' Verdana;font-size:20px;text-align:center;" width="200" x="10" y="10">Hello World!</textArea>
</svg>
```
