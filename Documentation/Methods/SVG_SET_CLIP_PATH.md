<!-- SVG_SET_CLIP_PATH ( root ; ID )
 -> root (Text)
 -> ID (Text)-->
# SVG_SET_CLIP_PATH

> SVG_SET_CLIP_PATH ( svgObject ; clipPathID )

| Parameter |     | Type |     |     |     | Description |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
| svgObject |     | SVG_Ref |     | ➡️ |     | Reference of SVG element |     |
| clipPathID |     | Text |     | ➡️ |     | Name of clip path |     |

## Description

The SVG_SET_CLIP_PATH command sets the clip path named [clipPathID](## "Name of clip path") for the object passed in [svgObject](## "Reference of SVG element"). An error is generated if [svgObject](## "Reference of SVG element") is not a valid reference or if the clip path is not defined.

**See Also:** [http://www.w3.org/TR/2001/REC-SVG-20010904/masking.html#EstablishingANewClippingPath](http://www.w3.org/TR/2001/REC-SVG-20010904/masking.html#EstablishingANewClippingPath)

### Example 1  

Defining a circular clip path that will then be assigned to an image:  
![](https://doc.4d.com/4Dv19/picture/359066/pict359066.en.png)

```4d
  // Defining a circular clip path  
 $Dom_clipPath:=SVG_Define_clip_path ($Dom_SVG;"theClip")  
 $Dom_circle:=SVG_New_circle ($Dom_clipPath;150;100;100)  
   
  // Creating a group  
 $Dom_g:=SVG_New_group ($Dom_SVG)  
   
  // Inserting an image  
 $Txt_path:=Get 4D folder(6)+"logo.svg"  
 READ PICTURE FILE($Txt_path;$Pic_buffer)  
 $Dom_picture:=SVG_New_embedded_image ($Dom_g;$Pic_buffer)  
 SVG_SET_ID ($Dom_picture;"MyPicture")  
   
  // Applying clip path to group  
 SVG_SET_CLIP_PATH ($Dom_g;"theClip")
```

### Example 2  

The same image with a rectangular clip path with rounded corners:  
![](https://doc.4d.com/4Dv19/picture/359069/pict359069.en.png)

```4d
  // Defining a rectangular clip path  
 $Dom_clipPath:=SVG_Define_clip_path ($Dom_SVG;"theClip")  
 $Dom_rect:=SVG_New_rect ($Dom_clipPath;5;10;320;240;10;10)  
   
  // Creating a group  
 $Dom_g:=SVG_New_group ($Dom_SVG)  
   
  // Inserting an image  
 $Txt_path:=Get 4D folder(6)+"logo.svg"  
 READ PICTURE FILE($Txt_path;$Pic_buffer)  
 $Dom_picture:=SVG_New_embedded_image ($Dom_g;$Pic_buffer)  
 SVG_SET_ID ($Dom_picture;"MyPicture")  
   
  // Applying clip path to group  
 SVG_SET_CLIP_PATH ($Dom_g;"theClip")
```

## See also

[SVG_Define_clip_path](SVG_Define_clip_path.md)
