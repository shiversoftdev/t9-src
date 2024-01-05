#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace status_effect_dot;

/*
	Name: __init__system__
	Namespace: status_effect_dot
	Checksum: 0x4C60707
	Offset: 0xB0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"status_effect_dot", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: status_effect_dot
	Checksum: 0x87102033
	Offset: 0xF8
	Size: 0x94
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("toplayer", "dot_splatter", 1, 1, "counter", &on_dot_splatter, 0, 0);
	clientfield::register("toplayer", "dot_no_splatter", 1, 1, "counter", &on_dot_no_splatter, 0, 0);
}

/*
	Name: on_dot_splatter
	Namespace: status_effect_dot
	Checksum: 0xC4683F01
	Offset: 0x198
	Size: 0x4A
	Parameters: 7
	Flags: Linked
*/
function on_dot_splatter(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self.dot_damaged = 1;
}

/*
	Name: on_dot_no_splatter
	Namespace: status_effect_dot
	Checksum: 0xEEDFABA8
	Offset: 0x1F0
	Size: 0x4A
	Parameters: 7
	Flags: Linked
*/
function on_dot_no_splatter(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self.dot_no_splatter = 1;
}

