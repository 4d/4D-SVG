# SVG_SET_PATTERN_UNITS

>**SVG_SET_PATTERN_UNITS** ( *patternObject* ; *sysCoord* )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| patternObject | SVG_Ref | &#8594; | Reference of pattern to modify |
| sysCoord | Text | &#8594; | System of coordinates to be used |



#### Description 

The SVG\_SET\_PATTERN\_UNITS command is used to set the system coordinates for the *x*, *y*, *width* and *height* attributes of the pattern designated by *patternObject*. If *patternObject* is not a pattern, an error is generated.

The *sysCoord* parameter specifies the name of the system to be used. It must be set to "userSpaceOnUse" or "objectBoundingBox", otherwise an error is generated. 

**See Also:** *http://www.w3.org/TR/SVG/pservers.html#Patterns*

#### See also 

[SVG\_SET\_PATTERN\_CONTENT\_UNITS](SVG%5FSET%5FPATTERN%5FCONTENT%5FUNITS.md)  