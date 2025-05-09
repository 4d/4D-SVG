<!-- SVG_SET_FILTER ( parentReference ; URL )
 -> parentReference (Text)
 -> URL (Text)-->
# SVG_SET_FILTER

> SVG_SET_FILTER ( svgObject ; id )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of SVG element |     |
| id  |     | String |     | ➡️ |     | Name of filter |     |

## Description

The SVG_SET_FILTER command can be used to associate a filter with the object having the [svgObject](## "Reference of SVG element") reference. If [svgObject](## "Reference of SVG element") is not a valid reference, an error is generated. If the attribute already exists, its value is replaced.

The url parameter is the name of the filter to be used as specified by the [SVG_Define_filter](SVG_Define_filter.md)  command. If this name does not exist, an error is generated.

### Example  

See the [SVG_Define_filter](SVG_Define_filter.md)  command.

## See also

[SVG Filters](../SVG%20Filters.md)  
[SVG_Define_filter](SVG_Define_filter.md)
