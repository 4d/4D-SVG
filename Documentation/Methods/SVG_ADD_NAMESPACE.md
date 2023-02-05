<!-- SVG_ADD_NAMESPACE ( svgObject ; prefix ; URI )
-> svgObject (Text)
-> prefix (Text)
-> URI (Text)-->
# SVG_ADD_NAMESPACE

> SVG_ADD_NAMESPACE ( svgObject ; prefix {; URI} )

|     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Parameter |     | Type |     |     |     | Description |     |
| svgObject |     | SVG_Ref |     | ➡️ |     | SVG object reference |     |
| prefix |     | Text |     | ➡️ |     | Prefix of namespace |     |
| URI |     | Text |     | ➡️ |     | URI of namespace |     |

## Description

The **SVG_ADD_NAMESPACE** method adds an XML namespace attribute to the root of the DOM Tree for the SVG object designated by the [svgObject](# "SVG object reference") parameter. You can use this method, more specifically, to add a namespace to an SVG code snippet.

In [prefix](# "Prefix of namespace"), pass a string containing the prefix of the namespace attribute. You can use one of the following constants:

* "svgNS" for a standard SVG namespace ([www.w3.orgHome.md2000Home.mdsvg](www.w3.orgHome.md2000Home.mdsvg))
* "xlinkNS" for a standard XLink namespace ([www.w3.orgHome.md1999Home.mdxlink](www.w3.orgHome.md1999Home.mdxlink))

In this case, the [URI](# "URI of namespace") parameter is unnecessary.

You can also pass the prefix of a custom namespace in the [prefix](# "Prefix of namespace") parameter and its URI in the corresponding parameter. In this case, the [URI](# "URI of namespace") parameter is mandatory and if it is omitted, an error is generated.

### Example  

The following code:

```4d
 [SVG_ADD_NAMESPACE](SVG_ADD_NAMESPACE.md) ($svgRef;"svgNS")
```

... adds the following code to the root of the SVG object:

&lt;xmlns="www.w3.orgHome.md2000Home.mdsvg"&gt;
