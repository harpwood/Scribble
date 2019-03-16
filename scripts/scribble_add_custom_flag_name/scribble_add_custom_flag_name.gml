/// @param name
/// @param index

var _name  = argument0;
var _index = argument1;

if ( !is_string(_name) )
{
    show_error( "Custom flag names should be strings.\n ", false );
    exit;
}

if ( !is_real(_index) || (_index != floor(_index)) || (_index < 0) || (_index > SCRIBBLE_MAX_FLAGS) )
{
    show_error( "Custom flag indexes should be an integer from 0 to " + string(SCRIBBLE_MAX_FLAGS) + ".\nTo increase the maximum number of flags, see __scribble_config()\n(Index was \"" + string(_index) + "\"\n ", false );
    exit;
}

var _old_name = global.__scribble_flags[? _index ];
if ( _old_name != undefined )
{
    show_debug_message( "Scribble: WARNING! Overwriting flag index " + string( _index ) + " \"" + _old_name + "\"" );
    ds_map_delete( global.__scribble_flags, _old_name );
}

//Bidrectional lookup in the same map made possible because the datatypes are different
global.__scribble_flags[? _index ] = _name;
global.__scribble_flags[? _name  ] = _index;

show_debug_message( "Scribble: Added flag name \"" + _name + "\" as index " + string(_index) );