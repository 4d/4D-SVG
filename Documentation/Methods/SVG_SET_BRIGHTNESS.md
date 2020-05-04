<!-- <span style="font-family:sans-serif;color:gray;"><span style="font-family:sans-serif;color:gray;font-weight:bold;font-style:italic">SVG_SET_BRIGHTNESS</span> ( svgObject ; Param_2 ; … ; N ) -&gt; svgObject (Text) -&gt; Param_2 ; … ; N (Real)</span>-->## DescriptionSets the brightness of an image or a container* 2 parameters : $2 is the brightness factor to apply: < 1 for darken; > 1 for brighten* 4 parameters : $2, $3 and $4 are used as values to define the matrix

|1|2|3|4|5|
|---|---|---|---|---|
|$1|0|0|0|0|
|0|$2|0|0|0|
|0|0|$3|0|0|
|0|0|0|1|0|