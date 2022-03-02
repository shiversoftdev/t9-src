#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\zm_common\zm_utility.csc;

#namespace zm_items;

/*
	Name: function_89f2df9
	Namespace: zm_items
	Checksum: 0x5580605B
	Offset: 0xC8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_items", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_items
	Checksum: 0x7442CF0A
	Offset: 0x110
	Size: 0x64
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("item", "highlight_item", 1, 2, "int", &function_39e7c9dd, 0, 0);
	level thread function_f88c74e1();
}

/*
	Name: function_f88c74e1
	Namespace: zm_items
	Checksum: 0xF5FC4ED1
	Offset: 0x180
	Size: 0x70
	Parameters: 0
	Flags: Linked, Private
*/
function private function_f88c74e1()
{
	while(isdefined(self))
	{
		var_7f729179 = undefined;
		var_7f729179 = level waittill(#"inventory_pickup");
		function_c79ecd60(var_7f729179.param1, var_7f729179.param2, undefined, undefined, var_7f729179.param3, undefined, undefined, undefined, undefined);
	}
}

/*
	Name: function_39e7c9dd
	Namespace: zm_items
	Checksum: 0xA7C8087D
	Offset: 0x1F8
	Size: 0x84
	Parameters: 7
	Flags: Linked
*/
function function_39e7c9dd(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self function_bf9d3071("rob_sonar_set_friendly");
	}
	else
	{
		self function_5d482e78("rob_sonar_set_friendly");
	}
}

