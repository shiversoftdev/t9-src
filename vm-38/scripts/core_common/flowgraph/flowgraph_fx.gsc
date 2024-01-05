#using scripts\core_common\exploder_shared.gsc;

#namespace flowgraph_fx;

/*
	Name: function_d6d9848d
	Namespace: flowgraph_fx
	Checksum: 0xCFC73414
	Offset: 0x68
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d6d9848d()
{
	level notify(-597142506);
}

/*
	Name: playfxatposition
	Namespace: flowgraph_fx
	Checksum: 0xF5AE6DD6
	Offset: 0x88
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
	Checksum: 0x5F31E67E
	Offset: 0xE0
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
	Checksum: 0x72C759B6
	Offset: 0x140
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
	Checksum: 0x79A08961
	Offset: 0x178
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
	Checksum: 0x65CC773A
	Offset: 0x1B0
	Size: 0x30
	Parameters: 2
	Flags: None
*/
function killexploder(x, str_name)
{
	exploder::kill_exploder(str_name);
	return true;
}

