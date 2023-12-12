<!-- <span style="font-family:sans-serif;color:gray;">style := <span style="font-family:sans-serif;color:gray;font-weight:bold;font-style:italic">SVG_DEFINE_STYLE_WITH_ARRAYS</span> ( svgObject ; attributes ; values ; class ; type ; media ; title )
 -&gt; svgObject (Text)
 -&gt; attributes (Pointer)
 -&gt; values (Pointer)
 -&gt; class (Text)
 -&gt; type (Text)
 -&gt; media (Text)
 -&gt; title (Text)
 &lt;- style (Text)</span>-->
# SVG_DEFINE_STYLE_WITH_ARRAYS

> SVG_DEFINE_STYLE_WITH_ARRAYS ( svgObject ; namesArrayPointer ; valuesArrayPointer {; className {; type {; media {; title}}}} )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | SVG object reference |     |
| namesArrayPointer |     | Pointer |     | ➡️ |     | Pointer to array of style names |     |
| valuesArrayPointer |     | Pointer |     | ➡️ |     | Pointer to array of style values |     |
| className |     | Text |     | ➡️ |     | CSS class name |     |
| type |     | Text |     | ➡️ |     | Type of contents |     |
| media |     | Text |     | ➡️ |     | Media descriptor |     |
| title |     | Text |     | ➡️ |     | Style name |     |

## Description

The **SVG_DEFINE_STYLE_WITH_ARRAYS** method defines styles (using arrays) for the SVG object designated in the svgObject. parameter.

* If the [svgObject](## "SVG object reference") parameter designates the root element, styles are set as "style" elements included in the "defs" section (Internal Style Sheet). In this case, the [className](## "CSS class name") parameter is mandatory (if it is missing, an error is returned). You can then assign the [className](## "CSS class name") style sheet to the SVG objects by passing its name to the [SVG_SET_CLASS](SVG_SET_CLASS.md) method (see example 1).
* If the [svgObject](## "SVG object reference") parameter designates an SVG element other than the root element, the style is set as a style attribute for this element (Inline Style Sheet) (see example 2).

The optional [type](## "Type of contents") parameter specifies the language of the style sheet for the contents of the element. The default value is "text/css".

The optional [media](## "Media descriptor") parameter indicates the desired destination media for the style information. If you omit this parameter, the default value used is "all". If the value is not included in the list of media types recognized by CSS2, an error is generated.

The optional [title](## "Style name") parameter adds an attribute of the "title" type.

### Example 1  

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
 SVG_DEFINE_STYLE_WITH_ARRAYS ($svg;->$arrnames;->$arrvalues;"title")  
 $object:=SVG_New_textArea ($svg;"Hello World!";10;10;200;310)  
 SVG_SET_CLASS ($object;"title")
```

This method generates the following code:

```xml
<?xml version="1.0" encoding="UTF-8" standalone="yes" ?>
<svg xmlns="http://www.w3.org/2000/svg">
    <defs id="4D">
        <style type="text/css">.title{fill:red;font-family:'Lucida Grande' Verdana;font-size:20px;text-align:center;}</style>
    </defs>
    <textArea class="title" height="310" width="200" x="10" y="10">Hello World!</textArea>
</svg>
```

### Example 2  

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
 $object:=SVG_New_textArea ($svg;"Hello World!";10;10;200;310)  
 SVG_DEFINE_STYLE_WITH_ARRAYS ($object;->$arrnames;->$arrvalues)
```

This method generates the following code:

```xml
<?xml version="1.0" encoding="UTF-8" standalone="yes" ?>
<svg xmlns="http://www.w3.org/2000/svg">
    <textArea height="310" style="fill:red;font-family:'Lucida Grande' Verdana;font-size:20px;text-align:center;" width="200" x="10" y="10">Hello World!</textArea>
</svg>
```
