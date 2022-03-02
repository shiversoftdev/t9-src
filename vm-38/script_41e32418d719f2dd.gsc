#using script_359683f0ff3b3fbb;
#using script_427cc4c66630a8dc;
#using script_55772e8c48402596;
#using scripts\core_common\system_shared.csc;

#namespace namespace_77bd50da;

/*
	Name: function_fed0bd28
	Namespace: namespace_77bd50da
	Checksum: 0x6BCC9A58
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_fed0bd28()
{
	level notify(1435072627);
}

/*
	Name: function_89f2df9
	Namespace: namespace_77bd50da
	Checksum: 0xA36D6535
	Offset: 0xA0
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_7b30b3878fc15536", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_77bd50da
	Checksum: 0xB5E4BE34
	Offset: 0xF8
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	sr_message_box::register();
	if(!isdefined(level.var_352498c6))
	{
		prototype_hud::register();
		level.var_352498c6 = 1;
	}
	prototype_self_revive::register();
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_77bd50da
	Checksum: 0x80F724D1
	Offset: 0x158
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_8ac3bea9()
{
}

