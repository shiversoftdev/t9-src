#using scripts\core_common\clientfield_shared.csc;

#namespace namespace_98521e8b;

/*
	Name: function_a0f409f7
	Namespace: namespace_98521e8b
	Checksum: 0x324CD5E3
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a0f409f7()
{
	level notify(62057128);
}

/*
	Name: function_9347830c
	Namespace: namespace_98521e8b
	Checksum: 0x45402E6D
	Offset: 0xA0
	Size: 0x64
	Parameters: 1
	Flags: Event
*/
event function_9347830c(eventstruct)
{
	clientfield::register("world", "" + #"hash_6789a69336880f89", 10000, 1, "int", &function_e3b277ad, 0, 0);
}

/*
	Name: function_e3b277ad
	Namespace: namespace_98521e8b
	Checksum: 0xBB775F20
	Offset: 0x110
	Size: 0x8C
	Parameters: 7
	Flags: Linked
*/
function function_e3b277ad(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		forcestreamxmodel(#"vehicle_t9_mil_us_helicopter_large_mp_intro");
	}
	else
	{
		stopforcestreamingxmodel(#"vehicle_t9_mil_us_helicopter_large_mp_intro");
	}
}

