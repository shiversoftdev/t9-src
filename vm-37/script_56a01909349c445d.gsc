#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace status_effect_dot;

/*
	Name: function_89f2df9
	Namespace: status_effect_dot
	Checksum: 0x4C60707
	Offset: 0xB0
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
	Checksum: 0x87102033
	Offset: 0xF8
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
	Checksum: 0xC4683F01
	Offset: 0x198
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
	Checksum: 0xEEDFABA8
	Offset: 0x1F0
	Size: 0x4A
	Parameters: 7
	Flags: Linked
*/
function function_b7f70b8a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self.dot_no_splatter = 1;
}

