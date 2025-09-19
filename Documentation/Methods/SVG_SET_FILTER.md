# SVG_SET_FILTER

>**SVG_SET_FILTER** ( *svgObject* ; *id* )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#x1F852; | Reference of SVG element |
| id | String | &#x1F852; | Name of filter |



#### Description 

The SVG\_SET\_FILTER command can be used to associate a filter with the object having the *svgObject* reference. If *svgObject* is not a valid reference, an error is generated. If the attribute already exists, its value is replaced.

The *url* parameter is the name of the filter to be used as specified by the *SVG\_Define\_filter* command. If this name does not exist, an error is generated.

#### Example 

See the *SVG\_Define\_filter* command.

#### See also 

[SVG Filters](../SVG%20Filters.md)  
[SVG\_Define\_filter](SVG%5FDefine%5Ffilter.md)  