#using scripts\core_common\exploder_shared.gsc;

#namespace flowgraph_fx;

/*
	Name: playfxatposition
	Namespace: flowgraph_fx
	Checksum: 0xD1E03804
	Offset: 0x68
	Size: 0x50
	Parameters: 5
	Flags: None
*/
function playfxatposition(x, fx_effect, v_position, v_forward, v_up)
{
	playfx(fx_effect, v_position, v_forward, v_up);
	return true;
}

/*
	Name: function_f4373d13
	Namespace: flowgraph_fx
	Checksum: 0x44D9E37D
	Offset: 0xC0
	Size: 0x58
	Parameters: 6
	Flags: None
*/
function function_f4373d13(x, fx_effect, v_offset, v_forward, v_up, var_a1a2ff27)
{
	playfxoncamera(fx_effect, v_offset, v_forward, v_up, var_a1a2ff27);
	return true;
}

#namespace namespace_84ba1809;

/*
	Name: playexploder
	Namespace: namespace_84ba1809
	Checksum: 0x71DFD678
	Offset: 0x120
	Size: 0x30
	Parameters: 2
	Flags: None
*/
function playexploder(x, str_name)
{
	exploder::exploder(str_name);
	return true;
}

/*
	Name: stopexploder
	Namespace: namespace_84ba1809
	Checksum: 0x7DC39C20
	Offset: 0x158
	Size: 0x30
	Parameters: 2
	Flags: None
*/
function stopexploder(x, str_name)
{
	exploder::stop_exploder(str_name);
	return true;
}

/*
	Name: killexploder
	Namespace: namespace_84ba1809
	Checksum: 0xF20C0AB5
	Offset: 0x190
	Size: 0x30
	Parameters: 2
	Flags: None
*/
function killexploder(x, str_name)
{
	exploder::kill_exploder(str_name);
	return true;
}

