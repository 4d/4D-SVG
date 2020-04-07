//%attributes = {}
  //C_ENTIER LONG($Lon_bottom;$Lon_height;$Lon_left;$Lon_right;$Lon_top)
  //C_ENTIER LONG($Lon_width)
  //C_TEXTE($Dom_clip;$Dom_g;$Dom_rect;$Dom_svg;$Dom_text)
  //C_TEXTE($Txt_buffer)
  //
  //LIRE MARGE IMPRESSION($Lon_left;$Lon_top;$Lon_right;$Lon_bottom)
  //LIRE ZONE IMPRESSION($Lon_height;$Lon_width)
  //
  //$Lon_width:=$Lon_width-$Lon_left-$Lon_right
  //$Lon_height:=$Lon_height-$Lon_top-$Lon_bottom
  //
  //$Lon_pages:=2
  //
  //SVG_SET_OPTIONS (SVG_Get_options  ?+ 5)
  //
  //$Dom_svg:=SVG_New ($Lon_width;$Lon_height)
  //
  //SVG_ADD_NAMESPACE ($Dom_svg;"d4";"http://4d.com")
  //
  //  //$Dom_pageSet:=DOM Creer element XML($Dom_svg;"g")  //;"pageSet")
  //
  //$Dom_page:=DOM Creer element XML($Dom_svg;"g";"d4:page";1)
  //SVG_SET_VISIBILITY ($Dom_page;Faux)
  //$Dom_rect:=SVG_New_rect ($Dom_page;0;0;$Lon_width;$Lon_height;0;0;"black";"red:10")
  //$Dom_text:=SVG_New_textArea ($Dom_page;"PAGE - 1";0;0;$Lon_width;$Lon_height;"Arial";36;Gras;Aligné au centre)
  //
  //SVG_New_group ($Dom_svg)
  //
  //$Dom_page:=DOM Creer element XML($Dom_svg;"g";"d4:page";2)
  //SVG_SET_VISIBILITY ($Dom_page;Vrai)
  //$Dom_rect:=SVG_New_rect ($Dom_page;0;0;$Lon_width;$Lon_height;0;0;"black";"blue:10")
  //$Dom_text:=SVG_New_textArea ($Dom_page;"PAGE - 2";0;0;$Lon_width;$Lon_height;"Arial";36;Gras;Aligné au centre)
  //
  //
  //$Dom_buffer:=DOM Chercher element XML($Dom_svg;"svg/g";$tDom_group)
  //
  //APPELER SUR ERREUR("xml_noError")
  //
  //$Lon_x:=0
  //
  //Boucle ($Lon_i;Taille tableau($tDom_group);1;-1)
  //
  //$Lon_page:=0
  //DOM LIRE ATTRIBUT XML PAR NOM($tDom_group{$Lon_i};"d4:page";$Lon_page)
  //
  //Si ($Lon_page=0)
  //
  //SUPPRIMER DANS TABLEAU($tDom_group;$Lon_i;1)
  //
  //Fin de si 
  //
  //Fin de boucle 
  //
  //APPELER SUR ERREUR("")
  //
  //$Lon_pages:=Taille tableau($tDom_group)
  //
  //Boucle ($Lon_page;1;$Lon_pages;1)
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //Fin de boucle 
  //
  //
  //
  //
  //
  //  //
  //  //Au cas ou 
  //  //  //______________________________________________________
  //  //: (Vrai)  // page 1
  //  //
  //  //$Txt_buffer:="page-1.pdf"
  //  //SVG_SET_CLIP_PATH ($Dom_g;"page-1")
  //  //
  //  //  //______________________________________________________
  //  //: (Vrai)  // page 2
  //  //
  //  //$Txt_buffer:="page-2.pdf"
  //  //SVG_SET_CLIP_PATH ($Dom_g;"page-2")
  //  //SVG_SET_TRANSFORM_TRANSLATE ($Dom_svg;0;-$Lon_height)
  //  //
  //  //  //______________________________________________________
  //  //Sinon 
  //  //
  //  //  //______________________________________________________
  //  //Fin de cas 
  //
  //SVGTool_SHOW_IN_VIEWER ($Dom_svg)
  //
  //  //SVG_SAVE_AS_PICTURE ($Dom_svg;Dossier systeme(Bureau)+$Txt_buffer;".pdf")
  //
  //  //Don't forget to clear the memory
  //SVG_CLEAR ($Dom_svg)