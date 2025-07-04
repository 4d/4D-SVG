//%attributes = {"invisible":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method : Compiler_SVG_Public
// Created 04/07/08 by Vincent de Lachaux
// ----------------------------------------------------

//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//Structure  & definition
//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
If (False:C215)
	
	//SVG_Define_gradient_r_by_arrays
	C_TEXT:C284(SVG_Define_gradient_r_by_arrays; $1)
	C_TEXT:C284(SVG_Define_gradient_r_by_arrays; $2)
	C_LONGINT:C283(SVG_Define_gradient_r_by_arrays; $3)
	C_LONGINT:C283(SVG_Define_gradient_r_by_arrays; $4)
	C_LONGINT:C283(SVG_Define_gradient_r_by_arrays; $5)
	C_LONGINT:C283(SVG_Define_gradient_r_by_arrays; $6)
	C_LONGINT:C283(SVG_Define_gradient_r_by_arrays; $7)
	C_TEXT:C284(SVG_Define_gradient_r_by_arrays; ${8})
	
	//SVG_Define_linear_gradient
	C_TEXT:C284(SVG_Define_linear_gradient; $0)
	C_TEXT:C284(SVG_Define_linear_gradient; $1)
	C_TEXT:C284(SVG_Define_linear_gradient; $2)
	C_TEXT:C284(SVG_Define_linear_gradient; $3)
	C_TEXT:C284(SVG_Define_linear_gradient; $4)
	C_LONGINT:C283(SVG_Define_linear_gradient; $5)
	C_TEXT:C284(SVG_Define_linear_gradient; $6)
	C_REAL:C285(SVG_Define_linear_gradient; ${7})  //C_REEL(SVG_Define_linear_gradient ;${-1})
	
	//SVG_Define_pattern
	C_TEXT:C284(SVG_Define_pattern; $0)
	C_TEXT:C284(SVG_Define_pattern; $1)
	C_TEXT:C284(SVG_Define_pattern; $2)
	C_REAL:C285(SVG_Define_pattern; $3)
	C_REAL:C285(SVG_Define_pattern; $4)
	C_REAL:C285(SVG_Define_pattern; $5)
	C_REAL:C285(SVG_Define_pattern; $6)
	C_TEXT:C284(SVG_Define_pattern; $7)
	C_TEXT:C284(SVG_Define_pattern; $8)
	
	//SVG_Define_radial_gradient
	C_TEXT:C284(SVG_Define_radial_gradient; $0)
	C_TEXT:C284(SVG_Define_radial_gradient; $1)
	C_TEXT:C284(SVG_Define_radial_gradient; $2)
	C_TEXT:C284(SVG_Define_radial_gradient; $3)
	C_TEXT:C284(SVG_Define_radial_gradient; $4)
	C_LONGINT:C283(SVG_Define_radial_gradient; $5)
	C_LONGINT:C283(SVG_Define_radial_gradient; $6)
	C_LONGINT:C283(SVG_Define_radial_gradient; $7)
	C_LONGINT:C283(SVG_Define_radial_gradient; $8)
	C_LONGINT:C283(SVG_Define_radial_gradient; $9)
	C_TEXT:C284(SVG_Define_radial_gradient; $10)
	
	//SVG_Define_marker
	C_TEXT:C284(SVG_Define_marker; $0)
	C_TEXT:C284(SVG_Define_marker; $1)
	C_TEXT:C284(SVG_Define_marker; $2)
	C_REAL:C285(SVG_Define_marker; $3)
	C_REAL:C285(SVG_Define_marker; $4)
	C_REAL:C285(SVG_Define_marker; $5)
	C_REAL:C285(SVG_Define_marker; $6)
	C_REAL:C285(SVG_Define_marker; $7)
	C_TEXT:C284(SVG_Define_marker; $8)
	
	//SVG_Define_style
	C_TEXT:C284(SVG_Define_style; $0)
	C_TEXT:C284(SVG_Define_style; $1)
	C_TEXT:C284(SVG_Define_style; $2)
	C_TEXT:C284(SVG_Define_style; $3)
	C_TEXT:C284(SVG_Define_style; $4)
	C_TEXT:C284(SVG_Define_style; $5)
	
	//SVG_Define_style_with_arrays
	C_TEXT:C284(SVG_DEFINE_STYLE_WITH_ARRAYS; $0)
	C_TEXT:C284(SVG_DEFINE_STYLE_WITH_ARRAYS; $1)
	C_POINTER:C301(SVG_DEFINE_STYLE_WITH_ARRAYS; $2)
	C_POINTER:C301(SVG_DEFINE_STYLE_WITH_ARRAYS; $3)
	C_TEXT:C284(SVG_DEFINE_STYLE_WITH_ARRAYS; $4)
	C_TEXT:C284(SVG_DEFINE_STYLE_WITH_ARRAYS; $5)
	C_TEXT:C284(SVG_DEFINE_STYLE_WITH_ARRAYS; $6)
	C_TEXT:C284(SVG_DEFINE_STYLE_WITH_ARRAYS; $7)
	
	//SVG_Define_symbol
	C_TEXT:C284(SVG_Define_symbol; $0)
	C_TEXT:C284(SVG_Define_symbol; $1)
	C_TEXT:C284(SVG_Define_symbol; $2)
	C_REAL:C285(SVG_Define_symbol; $3)
	C_REAL:C285(SVG_Define_symbol; $4)
	C_REAL:C285(SVG_Define_symbol; $5)
	C_REAL:C285(SVG_Define_symbol; $6)
	C_TEXT:C284(SVG_Define_symbol; $7)
	
	//SVG_Define_symbol_from_file
	C_TEXT:C284(SVG_Define_symbol_from_file; $0)
	C_TEXT:C284(SVG_Define_symbol_from_file; $1)
	C_TEXT:C284(SVG_Define_symbol_from_file; $2)
	C_TEXT:C284(SVG_Define_symbol_from_file; $3)
	C_REAL:C285(SVG_Define_symbol_from_file; $4)
	C_REAL:C285(SVG_Define_symbol_from_file; $5)
	C_REAL:C285(SVG_Define_symbol_from_file; $6)
	C_REAL:C285(SVG_Define_symbol_from_file; $7)
	C_TEXT:C284(SVG_Define_symbol_from_file; $8)
	
	//SVG_New_group
	C_TEXT:C284(SVG_New_group; $0)
	C_TEXT:C284(SVG_New_group; $1)
	C_TEXT:C284(SVG_New_group; $2)
	C_TEXT:C284(SVG_New_group; $3)
	C_TEXT:C284(SVG_New_group; $4)
	
	//SVG_Post_comment
	C_TEXT:C284(SVG_Post_comment; $0)
	C_TEXT:C284(SVG_Post_comment; $1)
	C_TEXT:C284(SVG_Post_comment; $2)
	
	//SVG_Set_description
	C_TEXT:C284(SVG_Set_description; $0)
	C_TEXT:C284(SVG_Set_description; $1)
	C_TEXT:C284(SVG_Set_description; $2)
	
	//SVG_SET_PATTERN_CONTENT_UNITS
	C_TEXT:C284(SVG_SET_PATTERN_CONTENT_UNITS; $1)
	C_TEXT:C284(SVG_SET_PATTERN_CONTENT_UNITS; $2)
	
	//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
End if 

//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//Drawing
//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
If (False:C215)
	
	//SVG_Add_object
	C_TEXT:C284(SVG_Add_object; $0)
	C_TEXT:C284(SVG_Add_object; $1)
	C_TEXT:C284(SVG_Add_object; $2)
	
	//SVG_ADD_POINT
	C_TEXT:C284(SVG_ADD_POINT; $1)
	C_REAL:C285(SVG_ADD_POINT; ${2})
	
	//SVG_New_arc
	C_TEXT:C284(SVG_New_arc; $0)
	C_TEXT:C284(SVG_New_arc; $1)
	C_REAL:C285(SVG_New_arc; $2)
	C_REAL:C285(SVG_New_arc; $3)
	C_REAL:C285(SVG_New_arc; $4)
	C_REAL:C285(SVG_New_arc; $5)
	C_REAL:C285(SVG_New_arc; $6)
	C_TEXT:C284(SVG_New_arc; $7)
	C_TEXT:C284(SVG_New_arc; $8)
	C_REAL:C285(SVG_New_arc; $9)
	
	//SVG_New_circle
	C_TEXT:C284(SVG_New_circle; $0)
	C_TEXT:C284(SVG_New_circle; $1)
	C_REAL:C285(SVG_New_circle; $2)
	C_REAL:C285(SVG_New_circle; $3)
	C_REAL:C285(SVG_New_circle; $4)
	C_TEXT:C284(SVG_New_circle; $5)
	C_TEXT:C284(SVG_New_circle; $6)
	C_REAL:C285(SVG_New_circle; $7)
	
	//SVG_New_ellipse
	C_TEXT:C284(SVG_New_ellipse; $0)
	C_TEXT:C284(SVG_New_ellipse; $1)
	C_REAL:C285(SVG_New_ellipse; $2)
	C_REAL:C285(SVG_New_ellipse; $3)
	C_REAL:C285(SVG_New_ellipse; $4)
	C_REAL:C285(SVG_New_ellipse; $5)
	C_TEXT:C284(SVG_New_ellipse; $6)
	C_TEXT:C284(SVG_New_ellipse; $7)
	C_REAL:C285(SVG_New_ellipse; $8)
	
	//SVG_New_ellipse_bounded
	C_TEXT:C284(SVG_New_ellipse_bounded; $0)
	C_TEXT:C284(SVG_New_ellipse_bounded; $1)
	C_REAL:C285(SVG_New_ellipse_bounded; $2)
	C_REAL:C285(SVG_New_ellipse_bounded; $3)
	C_REAL:C285(SVG_New_ellipse_bounded; $4)
	C_REAL:C285(SVG_New_ellipse_bounded; $5)
	C_TEXT:C284(SVG_New_ellipse_bounded; $6)
	C_TEXT:C284(SVG_New_ellipse_bounded; $7)
	C_REAL:C285(SVG_New_ellipse_bounded; $8)
	
	//SVG_New_embedded_image
	C_TEXT:C284(SVG_New_embedded_image; $0)
	C_TEXT:C284(SVG_New_embedded_image; $1)
	C_PICTURE:C286(SVG_New_embedded_image; $2)
	C_REAL:C285(SVG_New_embedded_image; $3)
	C_REAL:C285(SVG_New_embedded_image; $4)
	C_TEXT:C284(SVG_New_embedded_image; $5)
	
	//SVG_New_image
	C_TEXT:C284(SVG_New_image; $0)
	C_TEXT:C284(SVG_New_image; $1)
	C_TEXT:C284(SVG_New_image; $2)
	C_REAL:C285(SVG_New_image; $3)
	C_REAL:C285(SVG_New_image; $4)
	C_REAL:C285(SVG_New_image; $5)
	C_REAL:C285(SVG_New_image; $6)
	
	//SVG_New_Line
	C_TEXT:C284(SVG_New_line; $0)
	C_TEXT:C284(SVG_New_line; $1)
	C_REAL:C285(SVG_New_line; $2)
	C_REAL:C285(SVG_New_line; $3)
	C_REAL:C285(SVG_New_line; $4)
	C_REAL:C285(SVG_New_line; $5)
	C_TEXT:C284(SVG_New_line; $6)
	C_REAL:C285(SVG_New_line; $7)
	
	//SVG_New_path
	C_TEXT:C284(SVG_New_path; $0)
	C_TEXT:C284(SVG_New_path; $1)
	C_REAL:C285(SVG_New_path; $2)
	C_REAL:C285(SVG_New_path; $3)
	C_TEXT:C284(SVG_New_path; $4)
	C_TEXT:C284(SVG_New_path; $5)
	C_REAL:C285(SVG_New_path; $6)
	
	//SVG_New_polygon
	C_TEXT:C284(SVG_New_polygon; $0)
	C_TEXT:C284(SVG_New_polygon; $1)
	C_TEXT:C284(SVG_New_polygon; $2)
	C_TEXT:C284(SVG_New_polygon; $3)
	C_TEXT:C284(SVG_New_polygon; $4)
	C_REAL:C285(SVG_New_polygon; $5)
	
	//SVG_New_polygon_by_arrays
	C_TEXT:C284(SVG_New_polygon_by_arrays; $0)
	C_TEXT:C284(SVG_New_polygon_by_arrays; $1)
	C_POINTER:C301(SVG_New_polygon_by_arrays; $2)
	C_POINTER:C301(SVG_New_polygon_by_arrays; $3)
	C_TEXT:C284(SVG_New_polygon_by_arrays; $4)
	C_TEXT:C284(SVG_New_polygon_by_arrays; $5)
	C_REAL:C285(SVG_New_polygon_by_arrays; $6)
	
	//SVG_New_polyline
	C_TEXT:C284(SVG_New_polyline; $0)
	C_TEXT:C284(SVG_New_polyline; $1)
	C_TEXT:C284(SVG_New_polyline; $2)
	C_TEXT:C284(SVG_New_polyline; $3)
	C_TEXT:C284(SVG_New_polyline; $4)
	C_REAL:C285(SVG_New_polyline; $5)
	
	//SVG_New_polyline_by_arrays
	C_TEXT:C284(SVG_New_polyline_by_arrays; $0)
	C_TEXT:C284(SVG_New_polyline_by_arrays; $1)
	C_POINTER:C301(SVG_New_polyline_by_arrays; $2)
	C_POINTER:C301(SVG_New_polyline_by_arrays; $3)
	C_TEXT:C284(SVG_New_polyline_by_arrays; $4)
	C_TEXT:C284(SVG_New_polyline_by_arrays; $5)
	C_REAL:C285(SVG_New_polyline_by_arrays; $6)
	
	//SVG_New_rect
	C_TEXT:C284(SVG_New_rect; $0)
	C_TEXT:C284(SVG_New_rect; $1)
	C_REAL:C285(SVG_New_rect; $2)
	C_REAL:C285(SVG_New_rect; $3)
	C_REAL:C285(SVG_New_rect; $4)
	C_REAL:C285(SVG_New_rect; $5)
	C_REAL:C285(SVG_New_rect; $6)
	C_REAL:C285(SVG_New_rect; $7)
	C_TEXT:C284(SVG_New_rect; $8)
	C_TEXT:C284(SVG_New_rect; $9)
	C_REAL:C285(SVG_New_rect; $10)
	
	//SVG_New_regular_polygon
	C_TEXT:C284(SVG_New_regular_polygon; $0)
	C_TEXT:C284(SVG_New_regular_polygon; $1)
	C_REAL:C285(SVG_New_regular_polygon; $2)
	C_LONGINT:C283(SVG_New_regular_polygon; $3)
	C_REAL:C285(SVG_New_regular_polygon; $4)
	C_REAL:C285(SVG_New_regular_polygon; $5)
	C_TEXT:C284(SVG_New_regular_polygon; $6)
	C_TEXT:C284(SVG_New_regular_polygon; $7)
	C_REAL:C285(SVG_New_regular_polygon; $8)
	
	//SVG_PATH_ARC
	C_TEXT:C284(SVG_PATH_ARC; $1)
	C_REAL:C285(SVG_PATH_ARC; $2)
	C_REAL:C285(SVG_PATH_ARC; $3)
	C_REAL:C285(SVG_PATH_ARC; $4)
	C_REAL:C285(SVG_PATH_ARC; $5)
	C_REAL:C285(SVG_PATH_ARC; $6)
	C_LONGINT:C283(SVG_PATH_ARC; $7)
	
	//SVG_PATH_CLOSE
	C_TEXT:C284(SVG_PATH_CLOSE; $1)
	
	//SVG_PATH_CURVE
	C_TEXT:C284(SVG_PATH_CURVE; $1)
	C_REAL:C285(SVG_PATH_CURVE; $2)
	C_REAL:C285(SVG_PATH_CURVE; $3)
	C_REAL:C285(SVG_PATH_CURVE; $4)
	C_REAL:C285(SVG_PATH_CURVE; $5)
	C_REAL:C285(SVG_PATH_CURVE; $6)
	C_REAL:C285(SVG_PATH_CURVE; $7)
	
	//SVG_PATH_LINE_TO
	C_TEXT:C284(SVG_PATH_LINE_TO; $1)
	C_REAL:C285(SVG_PATH_LINE_TO; $2)
	C_REAL:C285(SVG_PATH_LINE_TO; $3)
	C_REAL:C285(SVG_PATH_LINE_TO; ${4})
	
	//SVG_PATH_MOVE_TO
	C_TEXT:C284(SVG_PATH_MOVE_TO; $1)
	C_REAL:C285(SVG_PATH_MOVE_TO; $2)
	C_REAL:C285(SVG_PATH_MOVE_TO; $3)
	
	//SVG_PATH_QCURVE
	C_TEXT:C284(SVG_PATH_QCURVE; $1)
	C_REAL:C285(SVG_PATH_QCURVE; $2)
	C_REAL:C285(SVG_PATH_QCURVE; $3)
	C_REAL:C285(SVG_PATH_QCURVE; $4)
	C_REAL:C285(SVG_PATH_QCURVE; $5)
	
	//SVG_Use
	C_TEXT:C284(SVG_Use; $0)
	C_TEXT:C284(SVG_Use; $1)
	C_TEXT:C284(SVG_Use; $2)
	C_REAL:C285(SVG_Use; $3)
	C_REAL:C285(SVG_Use; $4)
	C_REAL:C285(SVG_Use; $5)
	C_REAL:C285(SVG_Use; $6)
	
	//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
End if 

//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//Text
//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
If (False:C215)
	
	//SVG_APPEND_TEXT_TO_TEXTAREA
	C_TEXT:C284(SVG_APPEND_TEXT_TO_TEXTAREA; $1)
	C_TEXT:C284(SVG_APPEND_TEXT_TO_TEXTAREA; $2)
	
	//SVG_Get_text
	C_TEXT:C284(SVG_Get_text; $0)
	C_TEXT:C284(SVG_Get_text; $1)
	
	//SVG_Get_text
	C_TEXT:C284(SVG_Get_styled_text; $0)
	C_TEXT:C284(SVG_Get_styled_text; $1)
	C_BOOLEAN:C305(SVG_Get_styled_text; $2)
	
	//SVG_New_text
	C_TEXT:C284(SVG_New_text; $0)
	C_TEXT:C284(SVG_New_text; $1)
	C_TEXT:C284(SVG_New_text; $2)
	C_REAL:C285(SVG_New_text; $3)
	C_REAL:C285(SVG_New_text; $4)
	C_TEXT:C284(SVG_New_text; $5)
	C_LONGINT:C283(SVG_New_text; $6)
	C_LONGINT:C283(SVG_New_text; $7)
	C_LONGINT:C283(SVG_New_text; $8)
	C_TEXT:C284(SVG_New_text; $9)
	C_REAL:C285(SVG_New_text; $10)
	C_REAL:C285(SVG_New_text; $11)
	C_REAL:C285(SVG_New_text; $12)
	
	//SVG_New_textArea
	C_TEXT:C284(SVG_New_textArea; $0)
	C_TEXT:C284(SVG_New_textArea; $1)
	C_TEXT:C284(SVG_New_textArea; $2)
	C_REAL:C285(SVG_New_textArea; $3)
	C_REAL:C285(SVG_New_textArea; $4)
	C_REAL:C285(SVG_New_textArea; $5)
	C_REAL:C285(SVG_New_textArea; $6)
	C_TEXT:C284(SVG_New_textArea; $7)
	C_LONGINT:C283(SVG_New_textArea; $8)
	C_LONGINT:C283(SVG_New_textArea; $9)
	C_LONGINT:C283(SVG_New_textArea; $10)
	
	//SVG_New_tspan
	C_TEXT:C284(SVG_New_tspan; $0)
	C_TEXT:C284(SVG_New_tspan; $1)
	C_TEXT:C284(SVG_New_tspan; $2)
	C_REAL:C285(SVG_New_tspan; $3)
	C_REAL:C285(SVG_New_tspan; $4)
	C_TEXT:C284(SVG_New_tspan; $5)
	C_LONGINT:C283(SVG_New_tspan; $6)
	C_LONGINT:C283(SVG_New_tspan; $7)
	C_LONGINT:C283(SVG_New_tspan; $8)
	C_TEXT:C284(SVG_New_tspan; $9)
	
	//SVG_New_vertical_text
	C_TEXT:C284(SVG_New_vertical_text; $0)
	C_TEXT:C284(SVG_New_vertical_text; $1)
	C_TEXT:C284(SVG_New_vertical_text; $2)
	C_REAL:C285(SVG_New_vertical_text; $3)
	C_REAL:C285(SVG_New_vertical_text; $4)
	C_TEXT:C284(SVG_New_vertical_text; $5)
	C_LONGINT:C283(SVG_New_vertical_text; $6)
	C_LONGINT:C283(SVG_New_vertical_text; $7)
	C_LONGINT:C283(SVG_New_vertical_text; $8)
	C_TEXT:C284(SVG_New_vertical_text; $9)
	C_REAL:C285(SVG_New_vertical_text; $10)
	
	//SVG_SET_FONT_COLOR
	C_TEXT:C284(SVG_SET_FONT_COLOR; $1)
	C_TEXT:C284(SVG_SET_FONT_COLOR; $2)
	C_TEXT:C284(SVG_SET_FONT_COLOR; $3)
	
	//SVG_SET_FONT_FAMILY
	C_TEXT:C284(SVG_SET_FONT_FAMILY; $1)
	C_TEXT:C284(SVG_SET_FONT_FAMILY; ${2})
	
	//SVG_SET_FONT_SIZE
	C_TEXT:C284(SVG_SET_FONT_SIZE; $1)
	C_LONGINT:C283(SVG_SET_FONT_SIZE; $2)
	
	//SVG_SET_FONT_STYLE
	C_TEXT:C284(SVG_SET_FONT_STYLE; $1)
	C_LONGINT:C283(SVG_SET_FONT_STYLE; $2)
	
	////SVG_SET_TEXT_ANCHOR
	//C_TEXT(SVG_SET_TEXT_ANCHOR; $1)
	//C_LONGINT(SVG_SET_TEXT_ANCHOR; $2)
	
	//SVG_SET_TEXT_LETTER_SPACING
	C_TEXT:C284(SVG_SET_TEXT_LETTER_SPACING; $1)
	C_REAL:C285(SVG_SET_TEXT_LETTER_SPACING; $2)
	C_TEXT:C284(SVG_SET_TEXT_LETTER_SPACING; $3)
	
	//SVG_SET_TEXT_KERNING
	C_TEXT:C284(SVG_SET_TEXT_KERNING; $1)
	C_REAL:C285(SVG_SET_TEXT_KERNING; $2)
	C_TEXT:C284(SVG_SET_TEXT_KERNING; $3)
	
	//SVG_SET_TEXT_RENDERING
	C_TEXT:C284(SVG_SET_TEXT_RENDERING; $1)
	C_TEXT:C284(SVG_SET_TEXT_RENDERING; $2)
	
	//SVG_SET_TEXTAREA_TEXT
	C_TEXT:C284(SVG_SET_TEXTAREA_TEXT; $1)
	C_TEXT:C284(SVG_SET_TEXTAREA_TEXT; $2)
	
	//SVG_SET_TEXT_WRITING_MODE
	C_TEXT:C284(SVG_SET_TEXT_WRITING_MODE; $1)
	C_TEXT:C284(SVG_SET_TEXT_WRITING_MODE; $2)
	
	//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
End if 

If (False:C215)  //ATTRIBUTES
	
	If (False:C215)  //GETTER
		
		//SVG_GET_ATTRIBUTES
		C_TEXT:C284(SVG_GET_ATTRIBUTES; $1)
		C_POINTER:C301(SVG_GET_ATTRIBUTES; $2)
		C_POINTER:C301(SVG_GET_ATTRIBUTES; $3)
		
		//SVG_Get_class
		C_TEXT:C284(SVG_Get_class; $0)
		C_TEXT:C284(SVG_Get_class; $1)
		C_POINTER:C301(SVG_Get_class; $2)
		
		//SVG_Get_fill_brush
		C_TEXT:C284(SVG_Get_fill_brush; $0)
		C_TEXT:C284(SVG_Get_fill_brush; $1)
		
		//SVG_Get_ID
		C_TEXT:C284(SVG_Get_ID; $0)
		C_TEXT:C284(SVG_Get_ID; $1)
	End if 
	
	If (False:C215)  //SETTER
		
		//SVG_SET_STROKE_DASHARRAY
		C_TEXT:C284(SVG_SET_STROKE_DASHARRAY; $1)
		C_REAL:C285(SVG_SET_STROKE_DASHARRAY; $2)
		C_LONGINT:C283(SVG_SET_STROKE_DASHARRAY; ${3})
		
		//SVG_SET_CLASS
		C_TEXT:C284(SVG_SET_CLASS; $1)
		C_TEXT:C284(SVG_SET_CLASS; $2)
		
		//SVG_SET_CLIP_PATH
		C_TEXT:C284(SVG_SET_CLIP_PATH; $1)
		C_TEXT:C284(SVG_SET_CLIP_PATH; $2)
		
		//SVG_SET_ATTRIBUT
		C_TEXT:C284(SVG_SET_ATTRIBUTES; $1)
		C_TEXT:C284(SVG_SET_ATTRIBUTES; ${2})
		
		//SVG_SET_ATTRIBUTES_BY_ARRAYS
		C_TEXT:C284(SVG_SET_ATTRIBUTES_BY_ARRAYS; $1)
		C_POINTER:C301(SVG_SET_ATTRIBUTES_BY_ARRAYS; $2)
		C_POINTER:C301(SVG_SET_ATTRIBUTES_BY_ARRAYS; $3)
		
		//SVG_SET_DIMENSIONS
		C_TEXT:C284(SVG_SET_DIMENSIONS; $1)
		C_REAL:C285(SVG_SET_DIMENSIONS; $2)
		C_REAL:C285(SVG_SET_DIMENSIONS; $3)
		C_TEXT:C284(SVG_SET_DIMENSIONS; $4)
		
		//SVG_SET_FILL_BRUSH
		C_TEXT:C284(SVG_SET_FILL_BRUSH; $1)
		C_TEXT:C284(SVG_SET_FILL_BRUSH; $2)
		C_LONGINT:C283(SVG_SET_FILL_BRUSH; $3)
		
		//SVG_SET_FILL_RULE
		C_TEXT:C284(SVG_SET_FILL_RULE; $1)
		C_TEXT:C284(SVG_SET_FILL_RULE; $2)
		
		//SVG_SET_FILTER
		C_TEXT:C284(SVG_SET_FILTER; $1)
		C_TEXT:C284(SVG_SET_FILTER; $2)
		
		//SVG_SET_ID
		C_TEXT:C284(SVG_SET_ID; $1)
		C_TEXT:C284(SVG_SET_ID; $2)
		
		//SVG_SET_MARKER
		C_TEXT:C284(SVG_SET_MARKER; $1)
		C_TEXT:C284(SVG_SET_MARKER; $2)
		C_TEXT:C284(SVG_SET_MARKER; $3)
		
		//SVG_SET_OPACITY
		C_TEXT:C284(SVG_SET_OPACITY; $1)
		C_LONGINT:C283(SVG_SET_OPACITY; $2)
		C_LONGINT:C283(SVG_SET_OPACITY; $3)
		
		//SVG_SET_ROUNDING_RECT
		C_TEXT:C284(SVG_SET_ROUNDING_RECT; $1)
		C_REAL:C285(SVG_SET_ROUNDING_RECT; $2)
		C_REAL:C285(SVG_SET_ROUNDING_RECT; $3)
		
		//SVG_SET_SHAPE_RENDERING
		C_TEXT:C284(SVG_SET_SHAPE_RENDERING; $1)
		C_TEXT:C284(SVG_SET_SHAPE_RENDERING; $2)
		
		//SVG_SET_STROKE_BRUSH
		C_TEXT:C284(SVG_SET_STROKE_BRUSH; $1)
		C_TEXT:C284(SVG_SET_STROKE_BRUSH; $2)
		C_LONGINT:C283(SVG_SET_STROKE_BRUSH; $3)
		
		//SVG_SET_STROKE_LINECAP
		C_TEXT:C284(SVG_SET_STROKE_LINECAP; $1)
		C_TEXT:C284(SVG_SET_STROKE_LINECAP; $2)
		
		//SVG_SET_STROKE_LINEJOIN
		C_TEXT:C284(SVG_SET_STROKE_LINEJOIN; $1)
		C_TEXT:C284(SVG_SET_STROKE_LINEJOIN; $2)
		
		//SVG_SET_STROKE_MITERLIMIT
		C_TEXT:C284(SVG_SET_STROKE_MITERLIMIT; $1)
		C_LONGINT:C283(SVG_SET_STROKE_MITERLIMIT; $2)
		
		//SVG_SET_STROKE_VECTOR_EFFECT
		C_TEXT:C284(SVG_SET_STROKE_VECTOR_EFFECT; $1)
		C_TEXT:C284(SVG_SET_STROKE_VECTOR_EFFECT; $2)
		
		//SVG_SET_STROKE_WIDTH
		C_TEXT:C284(SVG_SET_STROKE_WIDTH; $1)
		C_REAL:C285(SVG_SET_STROKE_WIDTH; $2)
		C_TEXT:C284(SVG_SET_STROKE_WIDTH; $3)
		
		//SVG_SET_TRANSFORM_MATRIX
		C_TEXT:C284(SVG_SET_TRANSFORM_MATRIX; $1)
		C_REAL:C285(SVG_SET_TRANSFORM_MATRIX; $2)
		C_REAL:C285(SVG_SET_TRANSFORM_MATRIX; $3)
		C_REAL:C285(SVG_SET_TRANSFORM_MATRIX; $4)
		C_REAL:C285(SVG_SET_TRANSFORM_MATRIX; $5)
		C_REAL:C285(SVG_SET_TRANSFORM_MATRIX; $6)
		C_REAL:C285(SVG_SET_TRANSFORM_MATRIX; $7)
		
		//SVG_SET_TRANSFORM_ROTATE
		C_TEXT:C284(SVG_SET_TRANSFORM_ROTATE; $1)
		C_REAL:C285(SVG_SET_TRANSFORM_ROTATE; $2)
		C_REAL:C285(SVG_SET_TRANSFORM_ROTATE; $3)
		C_REAL:C285(SVG_SET_TRANSFORM_ROTATE; $4)
		
		//SVG_SET_TRANSFORM_SCALE
		C_TEXT:C284(SVG_SET_TRANSFORM_SCALE; $1)
		C_REAL:C285(SVG_SET_TRANSFORM_SCALE; $2)
		C_REAL:C285(SVG_SET_TRANSFORM_SCALE; $3)
		
		//SVG_SET_TRANSFORM_SKEW
		C_TEXT:C284(SVG_SET_TRANSFORM_SKEW; $1)
		C_REAL:C285(SVG_SET_TRANSFORM_SKEW; $2)
		C_REAL:C285(SVG_SET_TRANSFORM_SKEW; $3)
		
		//SVG_SET_TRANSFORM_TRANSLATE
		C_TEXT:C284(SVG_SET_TRANSFORM_TRANSLATE; $1)
		C_REAL:C285(SVG_SET_TRANSFORM_TRANSLATE; $2)
		C_REAL:C285(SVG_SET_TRANSFORM_TRANSLATE; $3)
		
		//SVG_SET_VIEWBOX
		C_TEXT:C284(SVG_SET_VIEWBOX; $1)
		C_REAL:C285(SVG_SET_VIEWBOX; $2)
		C_REAL:C285(SVG_SET_VIEWBOX; $3)
		C_REAL:C285(SVG_SET_VIEWBOX; $4)
		C_REAL:C285(SVG_SET_VIEWBOX; $5)
		C_TEXT:C284(SVG_SET_VIEWBOX; $6)
		
		//SVG_SET_VIEWPORT_FILL
		C_TEXT:C284(SVG_SET_VIEWPORT_FILL; $1)
		C_TEXT:C284(SVG_SET_VIEWPORT_FILL; $2)
		C_LONGINT:C283(SVG_SET_VIEWPORT_FILL; $3)
		
		//SVG_SET_VISIBILITY
		C_TEXT:C284(SVG_SET_VISIBILITY; $1)
		C_BOOLEAN:C305(SVG_SET_VISIBILITY; $2)
		
		//SVG_SET_XY
		C_TEXT:C284(SVG_SET_XY; $1)
		C_REAL:C285(SVG_SET_XY; $2)
		C_REAL:C285(SVG_SET_XY; $3)
	End if 
End if 

If (False:C215)  //COLOR & GRADIENTS
	
	//SVG_Color_from_index
	C_TEXT:C284(SVG_Color_from_index; $0)
	C_LONGINT:C283(SVG_Color_from_index; $1)
	
	//SVG_Color_grey
	C_TEXT:C284(SVG_Color_grey; $0)
	C_LONGINT:C283(SVG_Color_grey; $1)
	
	//SVG_Color_RGB_from_CMYK
	C_TEXT:C284(SVG_Color_RGB_from_CMYK; $0)
	C_LONGINT:C283(SVG_Color_RGB_from_CMYK; $1)
	C_LONGINT:C283(SVG_Color_RGB_from_CMYK; $2)
	C_LONGINT:C283(SVG_Color_RGB_from_CMYK; $3)
	C_LONGINT:C283(SVG_Color_RGB_from_CMYK; $4)
	C_LONGINT:C283(SVG_Color_RGB_from_CMYK; $5)
	
	//SVG_Color_RGB_from_HLS
	C_TEXT:C284(SVG_Color_RGB_from_HLS; $0)
	C_LONGINT:C283(SVG_Color_RGB_from_HLS; $1)
	C_LONGINT:C283(SVG_Color_RGB_from_HLS; $2)
	C_LONGINT:C283(SVG_Color_RGB_from_HLS; $3)
	C_LONGINT:C283(SVG_Color_RGB_from_HLS; $4)
	
	//SVG_Color_RGB_from_long
	C_TEXT:C284(SVG_Color_RGB_from_long; $0)
	C_LONGINT:C283(SVG_Color_RGB_from_long; $1)
	C_LONGINT:C283(SVG_Color_RGB_from_long; $2)
	
	//SVG_FADE_TO_GREY_SCALE
	C_TEXT:C284(SVG_FADE_TO_GREY_SCALE; $1)
	C_REAL:C285(SVG_FADE_TO_GREY_SCALE; $2)
	
	//SVG_GET_COLORS_ARRAY
	C_POINTER:C301(SVG_GET_COLORS_ARRAY; $1)
	
	//SVG_GET_DEFAULT_BRUSHES
	C_POINTER:C301(SVG_GET_DEFAULT_BRUSHES; $1)
	C_POINTER:C301(SVG_GET_DEFAULT_BRUSHES; $2)
	
	//SVG_Get_named_color_value
	C_LONGINT:C283(SVG_Get_named_color_value; $0)
	C_TEXT:C284(SVG_Get_named_color_value; $1)
	C_TEXT:C284(SVG_Get_named_color_value; $2)
	
	//SVG_SET_BRIGHTNESS
	C_TEXT:C284(SVG_SET_BRIGHTNESS; $1)
	C_REAL:C285(SVG_SET_BRIGHTNESS; ${2})
	
	//SVG_SET_DEFAULT_BRUSHES
	C_TEXT:C284(SVG_SET_DEFAULT_BRUSHES; $1)
	C_TEXT:C284(SVG_SET_DEFAULT_BRUSHES; $2)
	
	//SVG_SET_HUE
	C_TEXT:C284(SVG_SET_HUE; $1)
	C_LONGINT:C283(SVG_SET_HUE; $2)
	
	//SVG_SET_SATURATION
	C_TEXT:C284(SVG_SET_SATURATION; $1)
	C_LONGINT:C283(SVG_SET_SATURATION; $2)
End if 

If (False:C215)  //FILTER
	
	//SVG_Filter_Blend
	C_TEXT:C284(SVG_Filter_Blend; $0)
	C_TEXT:C284(SVG_Filter_Blend; $1)
	C_TEXT:C284(SVG_Filter_Blend; $2)
	C_TEXT:C284(SVG_Filter_Blend; $3)
	C_TEXT:C284(SVG_Filter_Blend; $4)
	C_TEXT:C284(SVG_Filter_Blend; $5)
	
	//• SVG_Filter_Blur
	C_TEXT:C284(SVG_Filter_Blur; $0)
	C_TEXT:C284(SVG_Filter_Blur; $1)
	C_LONGINT:C283(SVG_Filter_Blur; $2)
	C_TEXT:C284(SVG_Filter_Blur; $3)
	C_TEXT:C284(SVG_Filter_Blur; $4)
	
	//SVG_Filter_ColorMatrix
	C_TEXT:C284(SVG_Filter_ColorMatrix; $0)
	C_TEXT:C284(SVG_Filter_ColorMatrix; $1)
	C_TEXT:C284(SVG_Filter_ColorMatrix; $2)
	C_TEXT:C284(SVG_Filter_ColorMatrix; $3)
	C_TEXT:C284(SVG_Filter_ColorMatrix; $4)
	C_TEXT:C284(SVG_Filter_ColorMatrix; $5)
	
	//SVG_Filter_Composite
	C_TEXT:C284(SVG_Filter_Composite; $0)
	C_TEXT:C284(SVG_Filter_Composite; $1)
	C_TEXT:C284(SVG_Filter_Composite; $2)
	C_TEXT:C284(SVG_Filter_Composite; $3)
	C_TEXT:C284(SVG_Filter_Composite; $4)
	C_TEXT:C284(SVG_Filter_Composite; $5)
	
	//SVG_Filter_Merge
	C_TEXT:C284(SVG_Filter_Merge; $0)
	C_TEXT:C284(SVG_Filter_Merge; $1)
	C_TEXT:C284(SVG_Filter_Merge; ${2})
	
	//SVG_Filter_MergeNode
	C_TEXT:C284(SVG_Filter_MergeNode; $0)
	C_TEXT:C284(SVG_Filter_MergeNode; $1)
	C_TEXT:C284(SVG_Filter_MergeNode; $2)
	
	//• SVG_Filter_Offset
	C_TEXT:C284(SVG_Filter_Offset; $0)
	C_TEXT:C284(SVG_Filter_Offset; $1)
	C_LONGINT:C283(SVG_Filter_Offset; $2)
	C_LONGINT:C283(SVG_Filter_Offset; $3)
	C_TEXT:C284(SVG_Filter_Offset; $4)
	C_TEXT:C284(SVG_Filter_Offset; $5)
	
	//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
End if 

If (False:C215)  //UTILITIES
	
	//SVG_Count_elements
	C_LONGINT:C283(SVG_Count_elements; $0)
	C_TEXT:C284(SVG_Count_elements; $1)
	
	//SVG_ELEMENTS_TO_ARRAYS
	C_TEXT:C284(SVG_ELEMENTS_TO_ARRAYS; $1)
	C_POINTER:C301(SVG_ELEMENTS_TO_ARRAYS; $2)
	C_POINTER:C301(SVG_ELEMENTS_TO_ARRAYS; $3)
	C_POINTER:C301(SVG_ELEMENTS_TO_ARRAYS; $4)
	
	//SVG_Estimate_weight
	C_REAL:C285(SVG_Estimate_weight; $0)
	C_TEXT:C284(SVG_Estimate_weight; $1)
	
	//SVG_Find_ID
	C_TEXT:C284(SVG_Find_ID; $0)
	C_TEXT:C284(SVG_Find_ID; $1)
	C_TEXT:C284(SVG_Find_ID; $2)
	
	//SVG_Get_options
	//_O_C_LONGINT(SVG_Get_options; $0)
	
	//SVG_Get_version
	C_TEXT:C284(SVG_Get_version; $0)
	
	//SVG_Is_reference_valid
	C_BOOLEAN:C305(SVG_Is_reference_valid; $0)
	C_TEXT:C284(SVG_Is_reference_valid; $1)
	
	//SVG_Read_element_type
	C_TEXT:C284(SVG_Read_element_type; $0)
	C_TEXT:C284(SVG_Read_element_type; $1)
	
	//SVG_Read_last_error
	C_LONGINT:C283(SVG_Read_last_error; $0)
	C_TEXT:C284(SVG_Read_last_error; $1)
	C_POINTER:C301(SVG_Read_last_error; $2)
	
	//SVG_References_array
	C_LONGINT:C283(SVG_References_array; $0)
	C_POINTER:C301(SVG_References_array; $1)
	
	//SVG_SET_DOCUMENT_VARIABLE
	C_POINTER:C301(SVG_SET_DOCUMENT_VARIABLE; $1)
	
	//SVG_Set_error_handler
	C_TEXT:C284(SVG_Set_error_handler; $0)
	C_TEXT:C284(SVG_Set_error_handler; $1)
	
	//SVG_Set_options
	//_O_C_LONGINT(SVG_SET_OPTIONS; $1)
	
	//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
End if 

If (False:C215)  //MISCELLANEOUS
	
	
	//SVG_SCALLING_CENTERED
	C_TEXT:C284(SVG_SCALING_CENTERED; $1)
	C_REAL:C285(SVG_SCALING_CENTERED; $2)
	C_REAL:C285(SVG_SCALING_CENTERED; $3)
	C_REAL:C285(SVG_SCALING_CENTERED; $4)
	
	//SVG_SET_TRANSFORM_FLIP
	C_TEXT:C284(SVG_SET_TRANSFORM_FLIP; $1)
	C_BOOLEAN:C305(SVG_SET_TRANSFORM_FLIP; $2)
	C_BOOLEAN:C305(SVG_SET_TRANSFORM_FLIP; $3)
	
End if 