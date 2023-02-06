<!-- SVG_SET_OPTIONS ( Param_1 )
 -> Param_1 (Long Integer)-->
# SVG_SET_OPTIONS

> SVG_SET_OPTIONS {( options )}

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| options |     | Longint |     | ➡️ |     | 4D SVG component options |     |

## Description

The SVG_SET_OPTIONS command can be used to set the options of the 4D SVG component with the [options](# "4D SVG component options") longint. For more information about the contents of [options](# "4D SVG component options"), please refer to the description of the [SVG_Get_options](SVG_Get_options.md)  command.

Since all options will be set at once, this command must have been preceded with a call to the [SVG_Get_options](SVG_Get_options.md)  command, followed by the use of the `Bitwise Operators` of 4D.

If the [options](# "4D SVG component options") parameter is not passed, all the options are reset to their default value (see the [SVG_Get_options](SVG_Get_options.md)  command).

### Example 1  

Create readable code:

```4d

```4d
 $Options :=SVG_Get_options   
 $Options :=$Options ?+5 
```

enable the option  
 SVG_SET_OPTIONS ($Options)

```

```4d


### Example 2  

Draw a pie chart diagram:  
![](https://doc.4d.com/4Dv19/picture/196638/pict196638.en.png)


```4d

```4d
 $svg:=SVG_New   
   
  
```

Enable automatic closing of objects  
 [SVG_SET_OPTIONS](SVG_SET_OPTIONS.md)([SVG_Get_options](SVG_SET_OPTIONS](SVG_SET_OPTIONS.md)([SVG_Get_options.md) ?+2)  

 SVG_New_arc ($svg;100;100;90;0;105;"gray";"lightcoral";1)  
 SVG_New_arc ($svg;100;100;90;105;138;"gray";"lightskyblue";1)  
 SVG_New_arc ($svg;100;100;90;138;230;"gray";"lightgreen";1)  
 SVG_New_arc ($svg;100;100;90;230;270;"gray";"lightsteelblue";1)  
 SVG_New_arc ($svg;100;100;90;270;360;"gray";"lightyellow";1)

```

```4d


### Example 3  

Displaying multiple spaces in text objects using the _Keep extra spaces_ option (13) (added in v14):


```4d
 $Txt_buffer:="abc      def"  
 $Dom_text:=SVG_New_textArea ($Dom_svg;$Txt_buffer;50;50)
```

is displayed as "abc def"

```4d
 [SVG_SET_OPTIONS](SVG_SET_OPTIONS.md)([SVG_Get_options](SVG_SET_OPTIONS](SVG_SET_OPTIONS.md)([SVG_Get_options.md) ?+13) //  keep spaces in text objects  
 $Txt_buffer:="abc      def"  
 $Dom_text:=SVG_New_textArea ($Dom_svg;$Txt_buffer;50;50)
```

is displayed as "abc      def"

## See also

[SVG_Get_options](SVG_Get_options.md)
