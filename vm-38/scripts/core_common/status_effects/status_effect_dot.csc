#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace status_effect_dot;

/*
	Name: function_a74c624a
	Namespace: status_effect_dot
	Checksum: 0xC685766C
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a74c624a()
{
	level notify(1697191059);
}

/*
	Name: __init__system__
	Namespace: status_effect_dot
	Checksum: 0x8DC7E2B7
	Offset: 0xD0
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
	Checksum: 0xD35CF6F1
	Offset: 0x118
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
	Checksum: 0x7D8197D7
	Offset: 0x1B8
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
	Checksum: 0x85F6903F
	Offset: 0x210
	Size: 0x4A
	Parameters: 7
	Flags: Linked
*/
function on_dot_no_splatter(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self.dot_no_splatter = 1;
}

