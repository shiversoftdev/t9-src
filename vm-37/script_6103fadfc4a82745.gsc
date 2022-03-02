#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_e5d48e46 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_e5d48e46
		Checksum: 0x621B070E
		Offset: 0x270
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_e5d48e46
		Checksum: 0x30234048
		Offset: 0x4F0
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: function_65b281a
		Namespace: namespace_e5d48e46
		Checksum: 0xC2063F53
		Offset: 0x418
		Size: 0x3C
		Parameters: 1
		Flags: Linked
	*/
	function function_65b281a(player)
	{
		player clientfield::function_bb878fc3(var_d5213cbb, var_bf9c8c95, "armorPlatePulse");
	}

	/*
		Name: open
		Namespace: namespace_e5d48e46
		Checksum: 0x279AED2D
		Offset: 0x358
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
		Name: function_417df30c
		Namespace: namespace_e5d48e46
		Checksum: 0xB737BD45
		Offset: 0x4A8
		Size: 0x3C
		Parameters: 1
		Flags: Linked
	*/
	function function_417df30c(player)
	{
		player clientfield::function_bb878fc3(var_d5213cbb, var_bf9c8c95, "rareScrapPulse");
	}

	/*
		Name: function_47e82a09
		Namespace: namespace_e5d48e46
		Checksum: 0xAC5E9A58
		Offset: 0x460
		Size: 0x3C
		Parameters: 1
		Flags: Linked
	*/
	function function_47e82a09(player)
	{
		player clientfield::function_bb878fc3(var_d5213cbb, var_bf9c8c95, "scrapPulse");
	}

	/*
		Name: close
		Namespace: namespace_e5d48e46
		Checksum: 0x806CE840
		Offset: 0x3A0
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_e5d48e46
		Checksum: 0xE4E0A204
		Offset: 0x290
		Size: 0xBC
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("scavenger_icon");
		namespace_6aaccc24::function_da693cbe("ammoPulse", 1, 1, "counter");
		namespace_6aaccc24::function_da693cbe("armorPlatePulse", 1, 1, "counter");
		namespace_6aaccc24::function_da693cbe("scrapPulse", 1, 1, "counter");
		namespace_6aaccc24::function_da693cbe("rareScrapPulse", 4000, 1, "counter");
	}

	/*
		Name: function_e4e9c303
		Namespace: namespace_e5d48e46
		Checksum: 0x9D5C8D84
		Offset: 0x3D0
		Size: 0x3C
		Parameters: 1
		Flags: Linked
	*/
	function function_e4e9c303(player)
	{
		player clientfield::function_bb878fc3(var_d5213cbb, var_bf9c8c95, "ammoPulse");
	}

}

#namespace scavenger_icon;

/*
	Name: register
	Namespace: scavenger_icon
	Checksum: 0xFFE91AA1
	Offset: 0x100
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new class_e5d48e46();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: scavenger_icon
	Checksum: 0x9E0FBA10
	Offset: 0x140
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
	Namespace: scavenger_icon
	Checksum: 0x43870681
	Offset: 0x180
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function close(player)
{
	[[ self ]]->close(player);
}

/*
	Name: is_open
	Namespace: scavenger_icon
	Checksum: 0xB2A10D20
	Offset: 0x1A8
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: function_e4e9c303
	Namespace: scavenger_icon
	Checksum: 0x31EB0CE4
	Offset: 0x1D0
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function function_e4e9c303(player)
{
	[[ self ]]->function_e4e9c303(player);
}

/*
	Name: function_65b281a
	Namespace: scavenger_icon
	Checksum: 0xAECB0210
	Offset: 0x1F8
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function function_65b281a(player)
{
	[[ self ]]->function_65b281a(player);
}

/*
	Name: function_47e82a09
	Namespace: scavenger_icon
	Checksum: 0xE11358F
	Offset: 0x220
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function function_47e82a09(player)
{
	[[ self ]]->function_47e82a09(player);
}

/*
	Name: function_417df30c
	Namespace: scavenger_icon
	Checksum: 0x6B7B4E8F
	Offset: 0x248
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function function_417df30c(player)
{
	[[ self ]]->function_417df30c(player);
}

