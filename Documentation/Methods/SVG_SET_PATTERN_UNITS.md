<!-- SVG_SET_PATTERN_UNITS ( svgObject ; patternUnit )
 -> svgObject (Text)
 -> patternUnit (Text)-->
# SVG_SET_PATTERN_UNITS

> SVG_SET_PATTERN_UNITS ( patternObject ; sysCoord )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| patternObject |     | SVG_Ref |     | ➡️ |     | Reference of pattern to modify |     |
| sysCoord |     | Text |     | ➡️ |     | System of coordinates to be used |     |

## Description

The SVG_SET_PATTERN_UNITS command is used to set the system coordinates for the x, y, width and height attributes of the pattern designated by [patternObject](# "Reference of pattern to modify"). If [patternObject](# "Reference of pattern to modify") is not a pattern, an error is generated.

The [sysCoord](# "System of coordinates to be used") parameter specifies the name of the system to be used. It must be set to "userSpaceOnUse" or "objectBoundingBox", otherwise an error is generated.

**See Also:** [www.w3.org/TR/SVG/pservers.html#Patterns](www.w3.org/TR/SVG/pservers.html#Patterns)

## See also

[SVG_SET_PATTERN_CONTENT_UNITS](SVG_SET_PATTERN_CONTENT_UNITS.md)
