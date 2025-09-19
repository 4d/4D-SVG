# SVG_ADD_NAMESPACE

>**SVG_ADD_NAMESPACE** ( *svgObject* ; *prefix* {; *URI*} )

| Parameter | Type |  | Description |
| --- | --- | --- | --- |
| svgObject | SVG_Ref | &#8594; | SVG object reference |
| prefix | Text | &#8594; | Prefix of namespace |
| URI | Text | &#8594; | URI of namespace |



#### Description 

The **SVG\_ADD\_NAMESPACE** method adds an XML namespace attribute to the root of the DOM Tree for the SVG object designated by the *svgObject* parameter. You can use this method, more specifically, to add a namespace to an SVG code snippet.

In *prefix*, pass a string containing the prefix of the namespace attribute. You can use one of the following constants:

* "svgNS" for a standard SVG namespace (<http://www.w3.org/2000/svg>)
* "xlinkNS" for a standard XLink namespace (<http://www.w3.org/1999/xlink>)

In this case, the *URI* parameter is unnecessary. 

You can also pass the prefix of a custom namespace in the *prefix* parameter and its URI in the corresponding parameter. In this case, the *URI* parameter is mandatory and if it is omitted, an error is generated. 

#### Example 

The following code:

```4d
 SVG_ADD_NAMESPACE($svgRef;"svgNS")
```

... adds the following code to the root of the SVG object:

```XML
<xmlns="http://www.w3.org/2000/svg">
```
