//%attributes = {"invisible":true,"preemptive":"capable"}
// ----------------------------------------------------
// Method : Compiler_SVG_Public
// Created 04/07/08 by Vincent de Lachaux
// ----------------------------------------------------

//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//Structure  & definition
//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
If (False:C215)
	
	//SVG_ADD_NAME_SPACE
	//_O_C_TEXT(SVG_ADD_NAMESPACE; $1)
	//_O_C_TEXT(SVG_ADD_NAMESPACE; $2)
	//_O_C_TEXT(SVG_ADD_NAMESPACE; $3)
	
	//SVG_Define_clip_Path
	//_O_C_TEXT(SVG_Define_clip_Path; $0)
	//_O_C_TEXT(SVG_Define_clip_Path; $1)
	//_O_C_TEXT(SVG_Define_clip_Path; $2)
	
	//SVG_Define_solidColor
	//_O_C_TEXT(SVG_Define_solidColor; $0)
	//_O_C_TEXT(SVG_Define_solidColor; $1)
	//_O_C_TEXT(SVG_Define_solidColor; $2)
	//_O_C_TEXT(SVG_Define_solidColor; $3)
	//_O_C_LONGINT(SVG_Define_solidColor; $4)
	
	//SVG_Define_filter
	//_O_C_TEXT(SVG_Define_filter; $0)
	//_O_C_TEXT(SVG_Define_filter; $1)
	//_O_C_TEXT(SVG_Define_filter; $2)
	//_O_C_REAL(SVG_Define_filter; $3)
	//_O_C_REAL(SVG_Define_filter; $4)
	//_O_C_REAL(SVG_Define_filter; $5)
	//_O_C_REAL(SVG_Define_filter; $6)
	//_O_C_TEXT(SVG_Define_filter; $7)
	//_O_C_TEXT(SVG_Define_filter; $8)
	
	//SVG_Define_shadow
	//_O_C_TEXT(SVG_Define_shadow; $0)
	//_O_C_TEXT(SVG_Define_shadow; $1)
	//_O_C_TEXT(SVG_Define_shadow; $2)
	//_O_C_LONGINT(SVG_Define_shadow; $3)
	//_O_C_LONGINT(SVG_Define_shadow; $4)
	//_O_C_LONGINT(SVG_Define_shadow; $5)
	
	//SVG_Define_gradient_l_by_arrays
	_O_C_TEXT:C284(SVG_Define_gradient_l_by_arrays; $1)
	_O_C_TEXT:C284(SVG_Define_gradient_l_by_arrays; $2)
	_O_C_LONGINT:C283(SVG_Define_gradient_l_by_arrays; $3)
	_O_C_LONGINT:C283(SVG_Define_gradient_l_by_arrays; $4)
	_O_C_LONGINT:C283(SVG_Define_gradient_l_by_arrays; $5)
	_O_C_LONGINT:C283(SVG_Define_gradient_l_by_arrays; $6)
	_O_C_TEXT:C284(SVG_Define_gradient_l_by_arrays; ${7})
	
	//SVG_Define_gradient_r_by_arrays
	_O_C_TEXT:C284(SVG_Define_gradient_r_by_arrays; $1)
	_O_C_TEXT:C284(SVG_Define_gradient_r_by_arrays; $2)
	_O_C_LONGINT:C283(SVG_Define_gradient_r_by_arrays; $3)
	_O_C_LONGINT:C283(SVG_Define_gradient_r_by_arrays; $4)
	_O_C_LONGINT:C283(SVG_Define_gradient_r_by_arrays; $5)
	_O_C_LONGINT:C283(SVG_Define_gradient_r_by_arrays; $6)
	_O_C_LONGINT:C283(SVG_Define_gradient_r_by_arrays; $7)
	_O_C_TEXT:C284(SVG_Define_gradient_r_by_arrays; ${8})
	
	//SVG_Define_image
	_O_C_TEXT:C284(SVG_Define_image; $0)
	_O_C_TEXT:C284(SVG_Define_image; $1)
	_O_C_TEXT:C284(SVG_Define_image; $2)
	_O_C_PICTURE:C286(SVG_Define_image; $3)
	_O_C_TEXT:C284(SVG_Define_image; $4)
	
	//SVG_Define_linear_gradient
	_O_C_TEXT:C284(SVG_Define_linear_gradient; $0)
	_O_C_TEXT:C284(SVG_Define_linear_gradient; $1)
	_O_C_TEXT:C284(SVG_Define_linear_gradient; $2)
	_O_C_TEXT:C284(SVG_Define_linear_gradient; $3)
	_O_C_TEXT:C284(SVG_Define_linear_gradient; $4)
	_O_C_LONGINT:C283(SVG_Define_linear_gradient; $5)
	_O_C_TEXT:C284(SVG_Define_linear_gradient; $6)
	_O_C_REAL:C285(SVG_Define_linear_gradient; ${7})  //C_REEL(SVG_Define_linear_gradient ;${-1})
	
	//SVG_Define_pattern
	_O_C_TEXT:C284(SVG_Define_pattern; $0)
	_O_C_TEXT:C284(SVG_Define_pattern; $1)
	_O_C_TEXT:C284(SVG_Define_pattern; $2)
	_O_C_REAL:C285(SVG_Define_pattern; $3)
	_O_C_REAL:C285(SVG_Define_pattern; $4)
	_O_C_REAL:C285(SVG_Define_pattern; $5)
	_O_C_REAL:C285(SVG_Define_pattern; $6)
	_O_C_TEXT:C284(SVG_Define_pattern; $7)
	_O_C_TEXT:C284(SVG_Define_pattern; $8)
	
	//SVG_Define_radial_gradient
	_O_C_TEXT:C284(SVG_Define_radial_gradient; $0)
	_O_C_TEXT:C284(SVG_Define_radial_gradient; $1)
	_O_C_TEXT:C284(SVG_Define_radial_gradient; $2)
	_O_C_TEXT:C284(SVG_Define_radial_gradient; $3)
	_O_C_TEXT:C284(SVG_Define_radial_gradient; $4)
	_O_C_LONGINT:C283(SVG_Define_radial_gradient; $5)
	_O_C_LONGINT:C283(SVG_Define_radial_gradient; $6)
	_O_C_LONGINT:C283(SVG_Define_radial_gradient; $7)
	_O_C_LONGINT:C283(SVG_Define_radial_gradient; $8)
	_O_C_LONGINT:C283(SVG_Define_radial_gradient; $9)
	_O_C_TEXT:C284(SVG_Define_radial_gradient; $10)
	
	//SVG_Define_marker
	_O_C_TEXT:C284(SVG_Define_marker; $0)
	_O_C_TEXT:C284(SVG_Define_marker; $1)
	_O_C_TEXT:C284(SVG_Define_marker; $2)
	_O_C_REAL:C285(SVG_Define_marker; $3)
	_O_C_REAL:C285(SVG_Define_marker; $4)
	_O_C_REAL:C285(SVG_Define_marker; $5)
	_O_C_REAL:C285(SVG_Define_marker; $6)
	_O_C_REAL:C285(SVG_Define_marker; $7)
	_O_C_TEXT:C284(SVG_Define_marker; $8)
	
	//SVG_Define_style
	_O_C_TEXT:C284(SVG_Define_style; $0)
	_O_C_TEXT:C284(SVG_Define_style; $1)
	_O_C_TEXT:C284(SVG_Define_style; $2)
	_O_C_TEXT:C284(SVG_Define_style; $3)
	_O_C_TEXT:C284(SVG_Define_style; $4)
	_O_C_TEXT:C284(SVG_Define_style; $5)
	
	//SVG_Define_style_with_arrays
	_O_C_TEXT:C284(SVG_DEFINE_STYLE_WITH_ARRAYS; $0)
	_O_C_TEXT:C284(SVG_DEFINE_STYLE_WITH_ARRAYS; $1)
	_O_C_POINTER:C301(SVG_DEFINE_STYLE_WITH_ARRAYS; $2)
	_O_C_POINTER:C301(SVG_DEFINE_STYLE_WITH_ARRAYS; $3)
	_O_C_TEXT:C284(SVG_DEFINE_STYLE_WITH_ARRAYS; $4)
	_O_C_TEXT:C284(SVG_DEFINE_STYLE_WITH_ARRAYS; $5)
	_O_C_TEXT:C284(SVG_DEFINE_STYLE_WITH_ARRAYS; $6)
	_O_C_TEXT:C284(SVG_DEFINE_STYLE_WITH_ARRAYS; $7)
	
	//SVG_Define_symbol
	_O_C_TEXT:C284(SVG_Define_symbol; $0)
	_O_C_TEXT:C284(SVG_Define_symbol; $1)
	_O_C_TEXT:C284(SVG_Define_symbol; $2)
	_O_C_REAL:C285(SVG_Define_symbol; $3)
	_O_C_REAL:C285(SVG_Define_symbol; $4)
	_O_C_REAL:C285(SVG_Define_symbol; $5)
	_O_C_REAL:C285(SVG_Define_symbol; $6)
	_O_C_TEXT:C284(SVG_Define_symbol; $7)
	
	//SVG_Define_symbol_from_file
	_O_C_TEXT:C284(SVG_Define_symbol_from_file; $0)
	_O_C_TEXT:C284(SVG_Define_symbol_from_file; $1)
	_O_C_TEXT:C284(SVG_Define_symbol_from_file; $2)
	_O_C_TEXT:C284(SVG_Define_symbol_from_file; $3)
	_O_C_REAL:C285(SVG_Define_symbol_from_file; $4)
	_O_C_REAL:C285(SVG_Define_symbol_from_file; $5)
	_O_C_REAL:C285(SVG_Define_symbol_from_file; $6)
	_O_C_REAL:C285(SVG_Define_symbol_from_file; $7)
	_O_C_TEXT:C284(SVG_Define_symbol_from_file; $8)
	
	//SVG_DELETE_OBJECT
	_O_C_TEXT:C284(SVG_DELETE_OBJECT; $1)
	
	//SVG_Get_root_reference
	_O_C_TEXT:C284(SVG_Get_root_reference; $0)
	_O_C_TEXT:C284(SVG_Get_root_reference; $1)
	
	//SVG_New_group
	_O_C_TEXT:C284(SVG_New_group; $0)
	_O_C_TEXT:C284(SVG_New_group; $1)
	_O_C_TEXT:C284(SVG_New_group; $2)
	_O_C_TEXT:C284(SVG_New_group; $3)
	_O_C_TEXT:C284(SVG_New_group; $4)
	
	//SVG_Post_comment
	_O_C_TEXT:C284(SVG_Post_comment; $0)
	_O_C_TEXT:C284(SVG_Post_comment; $1)
	_O_C_TEXT:C284(SVG_Post_comment; $2)
	
	//SVG_Set_description
	_O_C_TEXT:C284(SVG_Set_description; $0)
	_O_C_TEXT:C284(SVG_Set_description; $1)
	_O_C_TEXT:C284(SVG_Set_description; $2)
	
	//SVG_SET_PATTERN_CONTENT_UNITS
	_O_C_TEXT:C284(SVG_SET_PATTERN_CONTENT_UNITS; $1)
	_O_C_TEXT:C284(SVG_SET_PATTERN_CONTENT_UNITS; $2)
	
	//SVG_SET_PATTERN_UNITS
	_O_C_TEXT:C284(SVG_SET_PATTERN_UNITS; $1)
	_O_C_TEXT:C284(SVG_SET_PATTERN_UNITS; $2)
	
	//SVG_Set_title
	_O_C_TEXT:C284(SVG_Set_title; $0)
	_O_C_TEXT:C284(SVG_Set_title; $1)
	_O_C_TEXT:C284(SVG_Set_title; $2)
	
	//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
End if 

//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//Drawing
//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
If (False:C215)
	
	//SVG_Add_object
	_O_C_TEXT:C284(SVG_Add_object; $0)
	_O_C_TEXT:C284(SVG_Add_object; $1)
	_O_C_TEXT:C284(SVG_Add_object; $2)
	
	//SVG_ADD_POINT
	_O_C_TEXT:C284(SVG_ADD_POINT; $1)
	_O_C_REAL:C285(SVG_ADD_POINT; ${2})
	
	//SVG_New_arc
	_O_C_TEXT:C284(SVG_New_arc; $0)
	_O_C_TEXT:C284(SVG_New_arc; $1)
	_O_C_REAL:C285(SVG_New_arc; $2)
	_O_C_REAL:C285(SVG_New_arc; $3)
	_O_C_REAL:C285(SVG_New_arc; $4)
	_O_C_REAL:C285(SVG_New_arc; $5)
	_O_C_REAL:C285(SVG_New_arc; $6)
	_O_C_TEXT:C284(SVG_New_arc; $7)
	_O_C_TEXT:C284(SVG_New_arc; $8)
	_O_C_REAL:C285(SVG_New_arc; $9)
	
	//SVG_New_circle
	_O_C_TEXT:C284(SVG_New_circle; $0)
	_O_C_TEXT:C284(SVG_New_circle; $1)
	_O_C_REAL:C285(SVG_New_circle; $2)
	_O_C_REAL:C285(SVG_New_circle; $3)
	_O_C_REAL:C285(SVG_New_circle; $4)
	_O_C_TEXT:C284(SVG_New_circle; $5)
	_O_C_TEXT:C284(SVG_New_circle; $6)
	_O_C_REAL:C285(SVG_New_circle; $7)
	
	//SVG_New_ellipse
	_O_C_TEXT:C284(SVG_New_ellipse; $0)
	_O_C_TEXT:C284(SVG_New_ellipse; $1)
	_O_C_REAL:C285(SVG_New_ellipse; $2)
	_O_C_REAL:C285(SVG_New_ellipse; $3)
	_O_C_REAL:C285(SVG_New_ellipse; $4)
	_O_C_REAL:C285(SVG_New_ellipse; $5)
	_O_C_TEXT:C284(SVG_New_ellipse; $6)
	_O_C_TEXT:C284(SVG_New_ellipse; $7)
	_O_C_REAL:C285(SVG_New_ellipse; $8)
	
	//SVG_New_ellipse_bounded
	_O_C_TEXT:C284(SVG_New_ellipse_bounded; $0)
	_O_C_TEXT:C284(SVG_New_ellipse_bounded; $1)
	_O_C_REAL:C285(SVG_New_ellipse_bounded; $2)
	_O_C_REAL:C285(SVG_New_ellipse_bounded; $3)
	_O_C_REAL:C285(SVG_New_ellipse_bounded; $4)
	_O_C_REAL:C285(SVG_New_ellipse_bounded; $5)
	_O_C_TEXT:C284(SVG_New_ellipse_bounded; $6)
	_O_C_TEXT:C284(SVG_New_ellipse_bounded; $7)
	_O_C_REAL:C285(SVG_New_ellipse_bounded; $8)
	
	//SVG_New_embedded_image
	_O_C_TEXT:C284(SVG_New_embedded_image; $0)
	_O_C_TEXT:C284(SVG_New_embedded_image; $1)
	_O_C_PICTURE:C286(SVG_New_embedded_image; $2)
	_O_C_REAL:C285(SVG_New_embedded_image; $3)
	_O_C_REAL:C285(SVG_New_embedded_image; $4)
	_O_C_TEXT:C284(SVG_New_embedded_image; $5)
	
	//SVG_New_image
	_O_C_TEXT:C284(SVG_New_image; $0)
	_O_C_TEXT:C284(SVG_New_image; $1)
	_O_C_TEXT:C284(SVG_New_image; $2)
	_O_C_REAL:C285(SVG_New_image; $3)
	_O_C_REAL:C285(SVG_New_image; $4)
	_O_C_REAL:C285(SVG_New_image; $5)
	_O_C_REAL:C285(SVG_New_image; $6)
	
	//SVG_New_Line
	_O_C_TEXT:C284(SVG_New_line; $0)
	_O_C_TEXT:C284(SVG_New_line; $1)
	_O_C_REAL:C285(SVG_New_line; $2)
	_O_C_REAL:C285(SVG_New_line; $3)
	_O_C_REAL:C285(SVG_New_line; $4)
	_O_C_REAL:C285(SVG_New_line; $5)
	_O_C_TEXT:C284(SVG_New_line; $6)
	_O_C_REAL:C285(SVG_New_line; $7)
	
	//SVG_New_path
	_O_C_TEXT:C284(SVG_New_path; $0)
	_O_C_TEXT:C284(SVG_New_path; $1)
	_O_C_REAL:C285(SVG_New_path; $2)
	_O_C_REAL:C285(SVG_New_path; $3)
	_O_C_TEXT:C284(SVG_New_path; $4)
	_O_C_TEXT:C284(SVG_New_path; $5)
	_O_C_REAL:C285(SVG_New_path; $6)
	
	//SVG_New_polygon
	_O_C_TEXT:C284(SVG_New_polygon; $0)
	_O_C_TEXT:C284(SVG_New_polygon; $1)
	_O_C_TEXT:C284(SVG_New_polygon; $2)
	_O_C_TEXT:C284(SVG_New_polygon; $3)
	_O_C_TEXT:C284(SVG_New_polygon; $4)
	_O_C_REAL:C285(SVG_New_polygon; $5)
	
	//SVG_New_polygon_by_arrays
	_O_C_TEXT:C284(SVG_New_polygon_by_arrays; $0)
	_O_C_TEXT:C284(SVG_New_polygon_by_arrays; $1)
	_O_C_POINTER:C301(SVG_New_polygon_by_arrays; $2)
	_O_C_POINTER:C301(SVG_New_polygon_by_arrays; $3)
	_O_C_TEXT:C284(SVG_New_polygon_by_arrays; $4)
	_O_C_TEXT:C284(SVG_New_polygon_by_arrays; $5)
	_O_C_REAL:C285(SVG_New_polygon_by_arrays; $6)
	
	//SVG_New_polyline
	_O_C_TEXT:C284(SVG_New_polyline; $0)
	_O_C_TEXT:C284(SVG_New_polyline; $1)
	_O_C_TEXT:C284(SVG_New_polyline; $2)
	_O_C_TEXT:C284(SVG_New_polyline; $3)
	_O_C_TEXT:C284(SVG_New_polyline; $4)
	_O_C_REAL:C285(SVG_New_polyline; $5)
	
	//SVG_New_polyline_by_arrays
	_O_C_TEXT:C284(SVG_New_polyline_by_arrays; $0)
	_O_C_TEXT:C284(SVG_New_polyline_by_arrays; $1)
	_O_C_POINTER:C301(SVG_New_polyline_by_arrays; $2)
	_O_C_POINTER:C301(SVG_New_polyline_by_arrays; $3)
	_O_C_TEXT:C284(SVG_New_polyline_by_arrays; $4)
	_O_C_TEXT:C284(SVG_New_polyline_by_arrays; $5)
	_O_C_REAL:C285(SVG_New_polyline_by_arrays; $6)
	
	//SVG_New_rect
	_O_C_TEXT:C284(SVG_New_rect; $0)
	_O_C_TEXT:C284(SVG_New_rect; $1)
	_O_C_REAL:C285(SVG_New_rect; $2)
	_O_C_REAL:C285(SVG_New_rect; $3)
	_O_C_REAL:C285(SVG_New_rect; $4)
	_O_C_REAL:C285(SVG_New_rect; $5)
	_O_C_REAL:C285(SVG_New_rect; $6)
	_O_C_REAL:C285(SVG_New_rect; $7)
	_O_C_TEXT:C284(SVG_New_rect; $8)
	_O_C_TEXT:C284(SVG_New_rect; $9)
	_O_C_REAL:C285(SVG_New_rect; $10)
	
	//SVG_New_regular_polygon
	_O_C_TEXT:C284(SVG_New_regular_polygon; $0)
	_O_C_TEXT:C284(SVG_New_regular_polygon; $1)
	_O_C_REAL:C285(SVG_New_regular_polygon; $2)
	_O_C_LONGINT:C283(SVG_New_regular_polygon; $3)
	_O_C_REAL:C285(SVG_New_regular_polygon; $4)
	_O_C_REAL:C285(SVG_New_regular_polygon; $5)
	_O_C_TEXT:C284(SVG_New_regular_polygon; $6)
	_O_C_TEXT:C284(SVG_New_regular_polygon; $7)
	_O_C_REAL:C285(SVG_New_regular_polygon; $8)
	
	//SVG_PATH_ARC
	_O_C_TEXT:C284(SVG_PATH_ARC; $1)
	_O_C_REAL:C285(SVG_PATH_ARC; $2)
	_O_C_REAL:C285(SVG_PATH_ARC; $3)
	_O_C_REAL:C285(SVG_PATH_ARC; $4)
	_O_C_REAL:C285(SVG_PATH_ARC; $5)
	_O_C_REAL:C285(SVG_PATH_ARC; $6)
	_O_C_LONGINT:C283(SVG_PATH_ARC; $7)
	
	//SVG_PATH_CLOSE
	_O_C_TEXT:C284(SVG_PATH_CLOSE; $1)
	
	//SVG_PATH_CURVE
	_O_C_TEXT:C284(SVG_PATH_CURVE; $1)
	_O_C_REAL:C285(SVG_PATH_CURVE; $2)
	_O_C_REAL:C285(SVG_PATH_CURVE; $3)
	_O_C_REAL:C285(SVG_PATH_CURVE; $4)
	_O_C_REAL:C285(SVG_PATH_CURVE; $5)
	_O_C_REAL:C285(SVG_PATH_CURVE; $6)
	_O_C_REAL:C285(SVG_PATH_CURVE; $7)
	
	//SVG_PATH_LINE_TO
	_O_C_TEXT:C284(SVG_PATH_LINE_TO; $1)
	_O_C_REAL:C285(SVG_PATH_LINE_TO; $2)
	_O_C_REAL:C285(SVG_PATH_LINE_TO; $3)
	_O_C_REAL:C285(SVG_PATH_LINE_TO; ${4})
	
	//SVG_PATH_MOVE_TO
	_O_C_TEXT:C284(SVG_PATH_MOVE_TO; $1)
	_O_C_REAL:C285(SVG_PATH_MOVE_TO; $2)
	_O_C_REAL:C285(SVG_PATH_MOVE_TO; $3)
	
	//SVG_PATH_QCURVE
	_O_C_TEXT:C284(SVG_PATH_QCURVE; $1)
	_O_C_REAL:C285(SVG_PATH_QCURVE; $2)
	_O_C_REAL:C285(SVG_PATH_QCURVE; $3)
	_O_C_REAL:C285(SVG_PATH_QCURVE; $4)
	_O_C_REAL:C285(SVG_PATH_QCURVE; $5)
	
	//SVG_Use
	_O_C_TEXT:C284(SVG_Use; $0)
	_O_C_TEXT:C284(SVG_Use; $1)
	_O_C_TEXT:C284(SVG_Use; $2)
	_O_C_REAL:C285(SVG_Use; $3)
	_O_C_REAL:C285(SVG_Use; $4)
	_O_C_REAL:C285(SVG_Use; $5)
	_O_C_REAL:C285(SVG_Use; $6)
	
	//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
End if 

//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//Text
//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
If (False:C215)
	
	//SVG_APPEND_TEXT_TO_TEXTAREA
	_O_C_TEXT:C284(SVG_APPEND_TEXT_TO_TEXTAREA; $1)
	_O_C_TEXT:C284(SVG_APPEND_TEXT_TO_TEXTAREA; $2)
	
	//SVG_Get_text
	_O_C_TEXT:C284(SVG_Get_text; $0)
	_O_C_TEXT:C284(SVG_Get_text; $1)
	
	//SVG_Get_text
	_O_C_TEXT:C284(SVG_Get_styled_text; $0)
	_O_C_TEXT:C284(SVG_Get_styled_text; $1)
	_O_C_BOOLEAN:C305(SVG_Get_styled_text; $2)
	
	//SVG_New_text
	_O_C_TEXT:C284(SVG_New_text; $0)
	_O_C_TEXT:C284(SVG_New_text; $1)
	_O_C_TEXT:C284(SVG_New_text; $2)
	_O_C_REAL:C285(SVG_New_text; $3)
	_O_C_REAL:C285(SVG_New_text; $4)
	_O_C_TEXT:C284(SVG_New_text; $5)
	_O_C_LONGINT:C283(SVG_New_text; $6)
	_O_C_LONGINT:C283(SVG_New_text; $7)
	_O_C_LONGINT:C283(SVG_New_text; $8)
	_O_C_TEXT:C284(SVG_New_text; $9)
	_O_C_REAL:C285(SVG_New_text; $10)
	_O_C_REAL:C285(SVG_New_text; $11)
	_O_C_REAL:C285(SVG_New_text; $12)
	
	//SVG_New_textArea
	_O_C_TEXT:C284(SVG_New_textArea; $0)
	_O_C_TEXT:C284(SVG_New_textArea; $1)
	_O_C_TEXT:C284(SVG_New_textArea; $2)
	_O_C_REAL:C285(SVG_New_textArea; $3)
	_O_C_REAL:C285(SVG_New_textArea; $4)
	_O_C_REAL:C285(SVG_New_textArea; $5)
	_O_C_REAL:C285(SVG_New_textArea; $6)
	_O_C_TEXT:C284(SVG_New_textArea; $7)
	_O_C_LONGINT:C283(SVG_New_textArea; $8)
	_O_C_LONGINT:C283(SVG_New_textArea; $9)
	_O_C_LONGINT:C283(SVG_New_textArea; $10)
	
	//SVG_New_tspan
	_O_C_TEXT:C284(SVG_New_tspan; $0)
	_O_C_TEXT:C284(SVG_New_tspan; $1)
	_O_C_TEXT:C284(SVG_New_tspan; $2)
	_O_C_REAL:C285(SVG_New_tspan; $3)
	_O_C_REAL:C285(SVG_New_tspan; $4)
	_O_C_TEXT:C284(SVG_New_tspan; $5)
	_O_C_LONGINT:C283(SVG_New_tspan; $6)
	_O_C_LONGINT:C283(SVG_New_tspan; $7)
	_O_C_LONGINT:C283(SVG_New_tspan; $8)
	_O_C_TEXT:C284(SVG_New_tspan; $9)
	
	//SVG_New_vertical_text
	_O_C_TEXT:C284(SVG_New_vertical_text; $0)
	_O_C_TEXT:C284(SVG_New_vertical_text; $1)
	_O_C_TEXT:C284(SVG_New_vertical_text; $2)
	_O_C_REAL:C285(SVG_New_vertical_text; $3)
	_O_C_REAL:C285(SVG_New_vertical_text; $4)
	_O_C_TEXT:C284(SVG_New_vertical_text; $5)
	_O_C_LONGINT:C283(SVG_New_vertical_text; $6)
	_O_C_LONGINT:C283(SVG_New_vertical_text; $7)
	_O_C_LONGINT:C283(SVG_New_vertical_text; $8)
	_O_C_TEXT:C284(SVG_New_vertical_text; $9)
	_O_C_REAL:C285(SVG_New_vertical_text; $10)
	
	//SVG_SET_FONT_COLOR
	_O_C_TEXT:C284(SVG_SET_FONT_COLOR; $1)
	_O_C_TEXT:C284(SVG_SET_FONT_COLOR; $2)
	_O_C_TEXT:C284(SVG_SET_FONT_COLOR; $3)
	
	//SVG_SET_FONT_FAMILY
	_O_C_TEXT:C284(SVG_SET_FONT_FAMILY; $1)
	_O_C_TEXT:C284(SVG_SET_FONT_FAMILY; ${2})
	
	//SVG_SET_FONT_SIZE
	_O_C_TEXT:C284(SVG_SET_FONT_SIZE; $1)
	_O_C_LONGINT:C283(SVG_SET_FONT_SIZE; $2)
	
	//SVG_SET_FONT_STYLE
	_O_C_TEXT:C284(SVG_SET_FONT_STYLE; $1)
	_O_C_LONGINT:C283(SVG_SET_FONT_STYLE; $2)
	
	//SVG_SET_TEXT_ANCHOR
	_O_C_TEXT:C284(SVG_SET_TEXT_ANCHOR; $1)
	_O_C_LONGINT:C283(SVG_SET_TEXT_ANCHOR; $2)
	
	//SVG_SET_TEXT_LETTER_SPACING
	_O_C_TEXT:C284(SVG_SET_TEXT_LETTER_SPACING; $1)
	_O_C_REAL:C285(SVG_SET_TEXT_LETTER_SPACING; $2)
	_O_C_TEXT:C284(SVG_SET_TEXT_LETTER_SPACING; $3)
	
	//SVG_SET_TEXT_KERNING
	_O_C_TEXT:C284(SVG_SET_TEXT_KERNING; $1)
	_O_C_REAL:C285(SVG_SET_TEXT_KERNING; $2)
	_O_C_TEXT:C284(SVG_SET_TEXT_KERNING; $3)
	
	//SVG_SET_TEXT_RENDERING
	_O_C_TEXT:C284(SVG_SET_TEXT_RENDERING; $1)
	_O_C_TEXT:C284(SVG_SET_TEXT_RENDERING; $2)
	
	//SVG_SET_TEXTAREA_TEXT
	_O_C_TEXT:C284(SVG_SET_TEXTAREA_TEXT; $1)
	_O_C_TEXT:C284(SVG_SET_TEXTAREA_TEXT; $2)
	
	//SVG_SET_TEXT_WRITING_MODE
	_O_C_TEXT:C284(SVG_SET_TEXT_WRITING_MODE; $1)
	_O_C_TEXT:C284(SVG_SET_TEXT_WRITING_MODE; $2)
	
	//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
End if 

If (False:C215)  //ATTRIBUTES
	
	If (False:C215)  //GETTER
		
		//SVG_GET_ATTRIBUTES
		_O_C_TEXT:C284(SVG_GET_ATTRIBUTES; $1)
		_O_C_POINTER:C301(SVG_GET_ATTRIBUTES; $2)
		_O_C_POINTER:C301(SVG_GET_ATTRIBUTES; $3)
		
		//SVG_Get_class
		_O_C_TEXT:C284(SVG_Get_class; $0)
		_O_C_TEXT:C284(SVG_Get_class; $1)
		_O_C_POINTER:C301(SVG_Get_class; $2)
		
		//SVG_Get_fill_brush
		_O_C_TEXT:C284(SVG_Get_fill_brush; $0)
		_O_C_TEXT:C284(SVG_Get_fill_brush; $1)
		
		//SVG_Get_ID
		_O_C_TEXT:C284(SVG_Get_ID; $0)
		_O_C_TEXT:C284(SVG_Get_ID; $1)
	End if 
	
	If (False:C215)  //SETTER
		
		//SVG_SET_STROKE_DASHARRAY
		_O_C_TEXT:C284(SVG_SET_STROKE_DASHARRAY; $1)
		_O_C_REAL:C285(SVG_SET_STROKE_DASHARRAY; $2)
		_O_C_LONGINT:C283(SVG_SET_STROKE_DASHARRAY; ${3})
		
		//SVG_SET_CLASS
		_O_C_TEXT:C284(SVG_SET_CLASS; $1)
		_O_C_TEXT:C284(SVG_SET_CLASS; $2)
		
		//SVG_SET_CLIP_PATH
		_O_C_TEXT:C284(SVG_SET_CLIP_PATH; $1)
		_O_C_TEXT:C284(SVG_SET_CLIP_PATH; $2)
		
		//SVG_SET_ATTRIBUT
		_O_C_TEXT:C284(SVG_SET_ATTRIBUTES; $1)
		_O_C_TEXT:C284(SVG_SET_ATTRIBUTES; ${2})
		
		//SVG_SET_ATTRIBUTES_BY_ARRAYS
		_O_C_TEXT:C284(SVG_SET_ATTRIBUTES_BY_ARRAYS; $1)
		_O_C_POINTER:C301(SVG_SET_ATTRIBUTES_BY_ARRAYS; $2)
		_O_C_POINTER:C301(SVG_SET_ATTRIBUTES_BY_ARRAYS; $3)
		
		//SVG_SET_DIMENSIONS
		_O_C_TEXT:C284(SVG_SET_DIMENSIONS; $1)
		_O_C_REAL:C285(SVG_SET_DIMENSIONS; $2)
		_O_C_REAL:C285(SVG_SET_DIMENSIONS; $3)
		_O_C_TEXT:C284(SVG_SET_DIMENSIONS; $4)
		
		//SVG_SET_FILL_BRUSH
		_O_C_TEXT:C284(SVG_SET_FILL_BRUSH; $1)
		_O_C_TEXT:C284(SVG_SET_FILL_BRUSH; $2)
		_O_C_LONGINT:C283(SVG_SET_FILL_BRUSH; $3)
		
		//SVG_SET_FILL_RULE
		_O_C_TEXT:C284(SVG_SET_FILL_RULE; $1)
		_O_C_TEXT:C284(SVG_SET_FILL_RULE; $2)
		
		//SVG_SET_FILTER
		_O_C_TEXT:C284(SVG_SET_FILTER; $1)
		_O_C_TEXT:C284(SVG_SET_FILTER; $2)
		
		//SVG_SET_ID
		_O_C_TEXT:C284(SVG_SET_ID; $1)
		_O_C_TEXT:C284(SVG_SET_ID; $2)
		
		//SVG_SET_MARKER
		_O_C_TEXT:C284(SVG_SET_MARKER; $1)
		_O_C_TEXT:C284(SVG_SET_MARKER; $2)
		_O_C_TEXT:C284(SVG_SET_MARKER; $3)
		
		//SVG_SET_OPACITY
		_O_C_TEXT:C284(SVG_SET_OPACITY; $1)
		_O_C_LONGINT:C283(SVG_SET_OPACITY; $2)
		_O_C_LONGINT:C283(SVG_SET_OPACITY; $3)
		
		//SVG_SET_ROUNDING_RECT
		_O_C_TEXT:C284(SVG_SET_ROUNDING_RECT; $1)
		_O_C_REAL:C285(SVG_SET_ROUNDING_RECT; $2)
		_O_C_REAL:C285(SVG_SET_ROUNDING_RECT; $3)
		
		//SVG_SET_SHAPE_RENDERING
		_O_C_TEXT:C284(SVG_SET_SHAPE_RENDERING; $1)
		_O_C_TEXT:C284(SVG_SET_SHAPE_RENDERING; $2)
		
		//SVG_SET_STROKE_BRUSH
		_O_C_TEXT:C284(SVG_SET_STROKE_BRUSH; $1)
		_O_C_TEXT:C284(SVG_SET_STROKE_BRUSH; $2)
		_O_C_LONGINT:C283(SVG_SET_STROKE_BRUSH; $3)
		
		//SVG_SET_STROKE_LINECAP
		_O_C_TEXT:C284(SVG_SET_STROKE_LINECAP; $1)
		_O_C_TEXT:C284(SVG_SET_STROKE_LINECAP; $2)
		
		//SVG_SET_STROKE_LINEJOIN
		_O_C_TEXT:C284(SVG_SET_STROKE_LINEJOIN; $1)
		_O_C_TEXT:C284(SVG_SET_STROKE_LINEJOIN; $2)
		
		//SVG_SET_STROKE_MITERLIMIT
		_O_C_TEXT:C284(SVG_SET_STROKE_MITERLIMIT; $1)
		_O_C_LONGINT:C283(SVG_SET_STROKE_MITERLIMIT; $2)
		
		//SVG_SET_STROKE_VECTOR_EFFECT
		_O_C_TEXT:C284(SVG_SET_STROKE_VECTOR_EFFECT; $1)
		_O_C_TEXT:C284(SVG_SET_STROKE_VECTOR_EFFECT; $2)
		
		//SVG_SET_STROKE_WIDTH
		_O_C_TEXT:C284(SVG_SET_STROKE_WIDTH; $1)
		_O_C_REAL:C285(SVG_SET_STROKE_WIDTH; $2)
		_O_C_TEXT:C284(SVG_SET_STROKE_WIDTH; $3)
		
		//SVG_SET_TRANSFORM_MATRIX
		_O_C_TEXT:C284(SVG_SET_TRANSFORM_MATRIX; $1)
		_O_C_REAL:C285(SVG_SET_TRANSFORM_MATRIX; $2)
		_O_C_REAL:C285(SVG_SET_TRANSFORM_MATRIX; $3)
		_O_C_REAL:C285(SVG_SET_TRANSFORM_MATRIX; $4)
		_O_C_REAL:C285(SVG_SET_TRANSFORM_MATRIX; $5)
		_O_C_REAL:C285(SVG_SET_TRANSFORM_MATRIX; $6)
		_O_C_REAL:C285(SVG_SET_TRANSFORM_MATRIX; $7)
		
		//SVG_SET_TRANSFORM_ROTATE
		_O_C_TEXT:C284(SVG_SET_TRANSFORM_ROTATE; $1)
		_O_C_REAL:C285(SVG_SET_TRANSFORM_ROTATE; $2)
		_O_C_REAL:C285(SVG_SET_TRANSFORM_ROTATE; $3)
		_O_C_REAL:C285(SVG_SET_TRANSFORM_ROTATE; $4)
		
		//SVG_SET_TRANSFORM_SCALE
		_O_C_TEXT:C284(SVG_SET_TRANSFORM_SCALE; $1)
		_O_C_REAL:C285(SVG_SET_TRANSFORM_SCALE; $2)
		_O_C_REAL:C285(SVG_SET_TRANSFORM_SCALE; $3)
		
		//SVG_SET_TRANSFORM_SKEW
		_O_C_TEXT:C284(SVG_SET_TRANSFORM_SKEW; $1)
		_O_C_REAL:C285(SVG_SET_TRANSFORM_SKEW; $2)
		_O_C_REAL:C285(SVG_SET_TRANSFORM_SKEW; $3)
		
		//SVG_SET_TRANSFORM_TRANSLATE
		_O_C_TEXT:C284(SVG_SET_TRANSFORM_TRANSLATE; $1)
		_O_C_REAL:C285(SVG_SET_TRANSFORM_TRANSLATE; $2)
		_O_C_REAL:C285(SVG_SET_TRANSFORM_TRANSLATE; $3)
		
		//SVG_SET_VIEWBOX
		_O_C_TEXT:C284(SVG_SET_VIEWBOX; $1)
		_O_C_REAL:C285(SVG_SET_VIEWBOX; $2)
		_O_C_REAL:C285(SVG_SET_VIEWBOX; $3)
		_O_C_REAL:C285(SVG_SET_VIEWBOX; $4)
		_O_C_REAL:C285(SVG_SET_VIEWBOX; $5)
		_O_C_TEXT:C284(SVG_SET_VIEWBOX; $6)
		
		//SVG_SET_VIEWPORT_FILL
		_O_C_TEXT:C284(SVG_SET_VIEWPORT_FILL; $1)
		_O_C_TEXT:C284(SVG_SET_VIEWPORT_FILL; $2)
		_O_C_LONGINT:C283(SVG_SET_VIEWPORT_FILL; $3)
		
		//SVG_SET_VISIBILITY
		_O_C_TEXT:C284(SVG_SET_VISIBILITY; $1)
		_O_C_BOOLEAN:C305(SVG_SET_VISIBILITY; $2)
		
		//SVG_SET_XY
		_O_C_TEXT:C284(SVG_SET_XY; $1)
		_O_C_REAL:C285(SVG_SET_XY; $2)
		_O_C_REAL:C285(SVG_SET_XY; $3)
	End if 
End if 

If (False:C215)  //COLOR & GRADIENTS
	
	//SVG_Color_from_index
	_O_C_TEXT:C284(SVG_Color_from_index; $0)
	_O_C_LONGINT:C283(SVG_Color_from_index; $1)
	
	//SVG_Color_grey
	_O_C_TEXT:C284(SVG_Color_grey; $0)
	_O_C_LONGINT:C283(SVG_Color_grey; $1)
	
	//SVG_Color_RGB_from_CMYK
	_O_C_TEXT:C284(SVG_Color_RGB_from_CMYK; $0)
	_O_C_LONGINT:C283(SVG_Color_RGB_from_CMYK; $1)
	_O_C_LONGINT:C283(SVG_Color_RGB_from_CMYK; $2)
	_O_C_LONGINT:C283(SVG_Color_RGB_from_CMYK; $3)
	_O_C_LONGINT:C283(SVG_Color_RGB_from_CMYK; $4)
	_O_C_LONGINT:C283(SVG_Color_RGB_from_CMYK; $5)
	
	//SVG_Color_RGB_from_HLS
	_O_C_TEXT:C284(SVG_Color_RGB_from_HLS; $0)
	_O_C_LONGINT:C283(SVG_Color_RGB_from_HLS; $1)
	_O_C_LONGINT:C283(SVG_Color_RGB_from_HLS; $2)
	_O_C_LONGINT:C283(SVG_Color_RGB_from_HLS; $3)
	_O_C_LONGINT:C283(SVG_Color_RGB_from_HLS; $4)
	
	//SVG_Color_RGB_from_long
	_O_C_TEXT:C284(SVG_Color_RGB_from_long; $0)
	_O_C_LONGINT:C283(SVG_Color_RGB_from_long; $1)
	_O_C_LONGINT:C283(SVG_Color_RGB_from_long; $2)
	
	//SVG_FADE_TO_GREY_SCALE
	_O_C_TEXT:C284(SVG_FADE_TO_GREY_SCALE; $1)
	_O_C_REAL:C285(SVG_FADE_TO_GREY_SCALE; $2)
	
	//SVG_GET_COLORS_ARRAY
	_O_C_POINTER:C301(SVG_GET_COLORS_ARRAY; $1)
	
	//SVG_GET_DEFAULT_BRUSHES
	_O_C_POINTER:C301(SVG_GET_DEFAULT_BRUSHES; $1)
	_O_C_POINTER:C301(SVG_GET_DEFAULT_BRUSHES; $2)
	
	//SVG_Get_named_color_value
	_O_C_LONGINT:C283(SVG_Get_named_color_value; $0)
	_O_C_TEXT:C284(SVG_Get_named_color_value; $1)
	_O_C_TEXT:C284(SVG_Get_named_color_value; $2)
	
	//SVG_SET_BRIGHTNESS
	_O_C_TEXT:C284(SVG_SET_BRIGHTNESS; $1)
	_O_C_REAL:C285(SVG_SET_BRIGHTNESS; ${2})
	
	//SVG_SET_DEFAULT_BRUSHES
	_O_C_TEXT:C284(SVG_SET_DEFAULT_BRUSHES; $1)
	_O_C_TEXT:C284(SVG_SET_DEFAULT_BRUSHES; $2)
	
	//SVG_SET_HUE
	_O_C_TEXT:C284(SVG_SET_HUE; $1)
	_O_C_LONGINT:C283(SVG_SET_HUE; $2)
	
	//SVG_SET_SATURATION
	_O_C_TEXT:C284(SVG_SET_SATURATION; $1)
	_O_C_LONGINT:C283(SVG_SET_SATURATION; $2)
End if 

If (False:C215)  //FILTER
	
	//SVG_Filter_Blend
	_O_C_TEXT:C284(SVG_Filter_Blend; $0)
	_O_C_TEXT:C284(SVG_Filter_Blend; $1)
	_O_C_TEXT:C284(SVG_Filter_Blend; $2)
	_O_C_TEXT:C284(SVG_Filter_Blend; $3)
	_O_C_TEXT:C284(SVG_Filter_Blend; $4)
	_O_C_TEXT:C284(SVG_Filter_Blend; $5)
	
	//• SVG_Filter_Blur
	_O_C_TEXT:C284(SVG_Filter_Blur; $0)
	_O_C_TEXT:C284(SVG_Filter_Blur; $1)
	_O_C_LONGINT:C283(SVG_Filter_Blur; $2)
	_O_C_TEXT:C284(SVG_Filter_Blur; $3)
	_O_C_TEXT:C284(SVG_Filter_Blur; $4)
	
	//SVG_Filter_ColorMatrix
	_O_C_TEXT:C284(SVG_Filter_ColorMatrix; $0)
	_O_C_TEXT:C284(SVG_Filter_ColorMatrix; $1)
	_O_C_TEXT:C284(SVG_Filter_ColorMatrix; $2)
	_O_C_TEXT:C284(SVG_Filter_ColorMatrix; $3)
	_O_C_TEXT:C284(SVG_Filter_ColorMatrix; $4)
	_O_C_TEXT:C284(SVG_Filter_ColorMatrix; $5)
	
	//SVG_Filter_Composite
	_O_C_TEXT:C284(SVG_Filter_Composite; $0)
	_O_C_TEXT:C284(SVG_Filter_Composite; $1)
	_O_C_TEXT:C284(SVG_Filter_Composite; $2)
	_O_C_TEXT:C284(SVG_Filter_Composite; $3)
	_O_C_TEXT:C284(SVG_Filter_Composite; $4)
	_O_C_TEXT:C284(SVG_Filter_Composite; $5)
	
	//SVG_Filter_Merge
	_O_C_TEXT:C284(SVG_Filter_Merge; $0)
	_O_C_TEXT:C284(SVG_Filter_Merge; $1)
	_O_C_TEXT:C284(SVG_Filter_Merge; ${2})
	
	//SVG_Filter_MergeNode
	_O_C_TEXT:C284(SVG_Filter_MergeNode; $0)
	_O_C_TEXT:C284(SVG_Filter_MergeNode; $1)
	_O_C_TEXT:C284(SVG_Filter_MergeNode; $2)
	
	//• SVG_Filter_Offset
	_O_C_TEXT:C284(SVG_Filter_Offset; $0)
	_O_C_TEXT:C284(SVG_Filter_Offset; $1)
	_O_C_LONGINT:C283(SVG_Filter_Offset; $2)
	_O_C_LONGINT:C283(SVG_Filter_Offset; $3)
	_O_C_TEXT:C284(SVG_Filter_Offset; $4)
	_O_C_TEXT:C284(SVG_Filter_Offset; $5)
	
	//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
End if 

If (False:C215)  //UTILITIES
	
	//SVG_Count_elements
	_O_C_LONGINT:C283(SVG_Count_elements; $0)
	_O_C_TEXT:C284(SVG_Count_elements; $1)
	
	//SVG_ELEMENTS_TO_ARRAYS
	_O_C_TEXT:C284(SVG_ELEMENTS_TO_ARRAYS; $1)
	_O_C_POINTER:C301(SVG_ELEMENTS_TO_ARRAYS; $2)
	_O_C_POINTER:C301(SVG_ELEMENTS_TO_ARRAYS; $3)
	_O_C_POINTER:C301(SVG_ELEMENTS_TO_ARRAYS; $4)
	
	//SVG_Estimate_weight
	_O_C_REAL:C285(SVG_Estimate_weight; $0)
	_O_C_TEXT:C284(SVG_Estimate_weight; $1)
	
	//SVG_Find_ID
	_O_C_TEXT:C284(SVG_Find_ID; $0)
	_O_C_TEXT:C284(SVG_Find_ID; $1)
	_O_C_TEXT:C284(SVG_Find_ID; $2)
	
	//SVG_Get_options
	//_O_C_LONGINT(SVG_Get_options; $0)
	
	//SVG_Get_version
	_O_C_TEXT:C284(SVG_Get_version; $0)
	
	//SVG_Is_reference_valid
	_O_C_BOOLEAN:C305(SVG_Is_reference_valid; $0)
	_O_C_TEXT:C284(SVG_Is_reference_valid; $1)
	
	//SVG_Read_element_type
	_O_C_TEXT:C284(SVG_Read_element_type; $0)
	_O_C_TEXT:C284(SVG_Read_element_type; $1)
	
	//SVG_Read_last_error
	_O_C_LONGINT:C283(SVG_Read_last_error; $0)
	_O_C_TEXT:C284(SVG_Read_last_error; $1)
	_O_C_POINTER:C301(SVG_Read_last_error; $2)
	
	//SVG_References_array
	_O_C_LONGINT:C283(SVG_References_array; $0)
	_O_C_POINTER:C301(SVG_References_array; $1)
	
	//SVG_SET_DOCUMENT_VARIABLE
	_O_C_POINTER:C301(SVG_SET_DOCUMENT_VARIABLE; $1)
	
	//SVG_Set_error_handler
	_O_C_TEXT:C284(SVG_Set_error_handler; $0)
	_O_C_TEXT:C284(SVG_Set_error_handler; $1)
	
	//SVG_Set_options
	//_O_C_LONGINT(SVG_SET_OPTIONS; $1)
	
	//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
End if 

If (False:C215)  //MISCELLANEOUS
	
	//SVG_ROTATION_CENTERED
	_O_C_TEXT:C284(SVG_ROTATION_CENTERED; $1)
	_O_C_REAL:C285(SVG_ROTATION_CENTERED; $2)
	
	//SVG_SCALLING_CENTERED
	_O_C_TEXT:C284(SVG_SCALING_CENTERED; $1)
	_O_C_REAL:C285(SVG_SCALING_CENTERED; $2)
	_O_C_REAL:C285(SVG_SCALING_CENTERED; $3)
	_O_C_REAL:C285(SVG_SCALING_CENTERED; $4)
	
	//SVG_SET_TRANSFORM_FLIP
	_O_C_TEXT:C284(SVG_SET_TRANSFORM_FLIP; $1)
	_O_C_BOOLEAN:C305(SVG_SET_TRANSFORM_FLIP; $2)
	_O_C_BOOLEAN:C305(SVG_SET_TRANSFORM_FLIP; $3)
	
End if 