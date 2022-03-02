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
	Name: function_89f2df9
	Namespace: status_effect_dot
	Checksum: 0x8DC7E2B7
	Offset: 0xD0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
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
	clientfield::register("toplayer", "dot_splatter", 1, 1, "counter", &function_ed8f4835, 0, 0);
	clientfield::register("toplayer", "dot_no_splatter", 1, 1, "counter", &function_b7f70b8a, 0, 0);
}

/*
	Name: function_ed8f4835
	Namespace: status_effect_dot
	Checksum: 0x7D8197D7
	Offset: 0x1B8
	Size: 0x4A
	Parameters: 7
	Flags: Linked
*/
function function_ed8f4835(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self.var_430c4b70 = 1;
}

/*
	Name: function_b7f70b8a
	Namespace: status_effect_dot
	Checksum: 0x85F6903F
	Offset: 0x210
	Size: 0x4A
	Parameters: 7
	Flags: Linked
*/
function function_b7f70b8a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self.dot_no_splatter = 1;
}

