# SVG_SET_PATTERN_CONTENT_UNITS

>**SVG_SET_PATTERN_CONTENT_UNITS** ( *patternObject* ; *sysCoord* )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| patternObject | SVG_Ref | &#8594; | Reference of pattern to modify |
| sysCoord | Text | &#8594; | System of coordinates to be used |



#### Description 

The SVG\_SET\_PATTERN\_CONTENT\_UNITS command is used to set the system of coordinates for the contents of the pattern designated by *patternObject*. If *patternObject* is not a pattern, an error is generated.

The *sysCoord* parameter specifies the name of the system to be used. It must be set to "userSpaceOnUse" or "objectBoundingBox", otherwise an error is generated. 

**See Also:** *http://www.w3.org/TR/SVG/pservers.html#Patterns*

#### See also 

[SVG\_SET\_PATTERN\_UNITS](SVG_SET_PATTERN_UNITS.md)  