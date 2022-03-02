#using scripts\core_common\exploder_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace flowgraph_fx;

/*
	Name: playfxatposition
	Namespace: flowgraph_fx
	Checksum: 0x7E2CFF2
	Offset: 0x70
	Size: 0x60
	Parameters: 6
	Flags: None
*/
function playfxatposition(x, fx_effect, v_position, v_forward, v_up, i_time)
{
	playfx(self.owner.localclientnum, fx_effect, v_position, v_forward, v_up, i_time);
	return true;
}

/*
	Name: playfxontagfunc
	Namespace: flowgraph_fx
	Checksum: 0x8547385B
	Offset: 0xD8
	Size: 0x50
	Parameters: 4
	Flags: None
*/
function playfxontagfunc(x, e_entity, fx_effect, str_tagname)
{
	util::playfxontag(self.owner.localclientnum, fx_effect, e_entity, str_tagname);
	return true;
}

/*
	Name: function_f4373d13
	Namespace: flowgraph_fx
	Checksum: 0xC9FB607A
	Offset: 0x130
	Size: 0x60
	Parameters: 6
	Flags: None
*/
function function_f4373d13(x, fx_effect, v_offset, v_forward, v_up, i_time)
{
	playfxoncamera(self.owner.localclientnum, fx_effect, v_offset, v_forward, v_up, i_time);
	return true;
}

#namespace namespace_84ba1809;

/*
	Name: playexploder
	Namespace: namespace_84ba1809
	Checksum: 0x63C509CA
	Offset: 0x198
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
	Checksum: 0xC0E199D6
	Offset: 0x1D0
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
	Checksum: 0x831239A1
	Offset: 0x208
	Size: 0x30
	Parameters: 2
	Flags: None
*/
function killexploder(x, str_name)
{
	exploder::kill_exploder(str_name);
	return true;
}

