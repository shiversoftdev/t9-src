#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_af345a5f : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_af345a5f
		Checksum: 0x254D8A8C
		Offset: 0x280
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_af345a5f
		Checksum: 0x857B5FE4
		Offset: 0x4A8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_af345a5f
		Checksum: 0xC9EE4F46
		Offset: 0x340
		Size: 0x3C
		Parameters: 2
		Flags: Linked
	*/
	function open(player, flags)
	{
		if(!isdefined(flags))
		{
			flags = 0;
		}
		namespace_6aaccc24::function_8b8089ba(player, flags);
	}

	/*
		Name: close
		Namespace: namespace_af345a5f
		Checksum: 0x3FF70F9B
		Offset: 0x388
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: function_65194707
		Namespace: namespace_af345a5f
		Checksum: 0xB4673573
		Offset: 0x458
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_65194707(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "num_downs", value);
	}

	/*
		Name: function_67bdfe40
		Namespace: namespace_af345a5f
		Checksum: 0x46131FF2
		Offset: 0x3B8
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_67bdfe40(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "bleedout_progress", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_af345a5f
		Checksum: 0x3809594F
		Offset: 0x2A0
		Size: 0x94
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("zm_laststand_client");
		namespace_6aaccc24::function_da693cbe("bleedout_progress", 1, 8, "float");
		namespace_6aaccc24::function_da693cbe("revive_progress", 1, 8, "float");
		namespace_6aaccc24::function_da693cbe("num_downs", 1, 8, "int");
	}

	/*
		Name: function_d50fdde9
		Namespace: namespace_af345a5f
		Checksum: 0xD0591381
		Offset: 0x408
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_d50fdde9(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "revive_progress", value);
	}

}

#namespace zm_laststand_client;

/*
	Name: function_2078a265
	Namespace: zm_laststand_client
	Checksum: 0x4C8385E1
	Offset: 0x100
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2078a265()
{
	level notify(845858926);
}

/*
	Name: register
	Namespace: zm_laststand_client
	Checksum: 0x511D09CE
	Offset: 0x120
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new class_af345a5f();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: zm_laststand_client
	Checksum: 0x22B7D0A0
	Offset: 0x160
	Size: 0x38
	Parameters: 2
	Flags: Linked
*/
function open(player, flags)
{
	if(!isdefined(flags))
	{
		flags = 0;
	}
	[[ self ]]->open(player, flags);
}

/*
	Name: close
	Namespace: zm_laststand_client
	Checksum: 0xBEEC1AC2
	Offset: 0x1A0
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function close(player)
{
	[[ self ]]->close(player);
}

/*
	Name: is_open
	Namespace: zm_laststand_client
	Checksum: 0xD0CA6291
	Offset: 0x1C8
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: function_67bdfe40
	Namespace: zm_laststand_client
	Checksum: 0x672C06A3
	Offset: 0x1F0
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_67bdfe40(player, value)
{
	[[ self ]]->function_67bdfe40(player, value);
}

/*
	Name: function_d50fdde9
	Namespace: zm_laststand_client
	Checksum: 0xF84C0D7F
	Offset: 0x220
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_d50fdde9(player, value)
{
	[[ self ]]->function_d50fdde9(player, value);
}

/*
	Name: function_65194707
	Namespace: zm_laststand_client
	Checksum: 0x49DDF8F5
	Offset: 0x250
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_65194707(player, value)
{
	[[ self ]]->function_65194707(player, value);
}

