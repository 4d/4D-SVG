# SVG_CLEAR

>**SVG_CLEAR** {( *svgObject* )}

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#8594; | SVG object reference |



#### Description 

The **SVG\_CLEAR** command frees the memory taken up by the SVG object designated by *svgObject*.

*svgObject* can be an SVG root object (created with the *SVG\_New*, *SVG\_Copy* or *SVG\_Open\_file* commands) or any valid SVG object. 

If *svgObject* is not passed, the command frees all the SVG objects created using *SVG\_New*, *SVG\_Copy* or *SVG\_Open\_file* commands.This syntax is useful during the development phase during which an SVG reference can be created but the memory was not released becauses of an error that prevents the execution of the method from completing. In a final development, any SVG reference that is no longer used must be freed using the SVG\_CLEAR command.

#### See also 

[SVG\_Copy](SVG_Copy.md)  
[SVG\_New](SVG_New.md)  
[SVG\_Open\_file](SVG_Open_file.md)  