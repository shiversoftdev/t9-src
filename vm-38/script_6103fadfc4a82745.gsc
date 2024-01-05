#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class cscavenger_icon : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cscavenger_icon
		Checksum: 0x37DF1D99
		Offset: 0x290
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cscavenger_icon
		Checksum: 0xE1328C46
		Offset: 0x510
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: function_65b281a
		Namespace: cscavenger_icon
		Checksum: 0xFC4CA4D
		Offset: 0x438
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
		Namespace: cscavenger_icon
		Checksum: 0x31716144
		Offset: 0x378
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
		cluielem::open_luielem(player, flags);
	}

	/*
		Name: function_417df30c
		Namespace: cscavenger_icon
		Checksum: 0xF47D9D44
		Offset: 0x4C8
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
		Namespace: cscavenger_icon
		Checksum: 0x2AB76318
		Offset: 0x480
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
		Namespace: cscavenger_icon
		Checksum: 0x4161A525
		Offset: 0x3C0
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: setup_clientfields
		Namespace: cscavenger_icon
		Checksum: 0xB2C40628
		Offset: 0x2B0
		Size: 0xBC
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("scavenger_icon");
		cluielem::add_clientfield("ammoPulse", 1, 1, "counter");
		cluielem::add_clientfield("armorPlatePulse", 1, 1, "counter");
		cluielem::add_clientfield("scrapPulse", 1, 1, "counter");
		cluielem::add_clientfield("rareScrapPulse", 4000, 1, "counter");
	}

	/*
		Name: function_e4e9c303
		Namespace: cscavenger_icon
		Checksum: 0x71FFC07A
		Offset: 0x3F0
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
	Name: function_e2357b6b
	Namespace: scavenger_icon
	Checksum: 0x45BE2D97
	Offset: 0x100
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e2357b6b()
{
	level notify(-869192725);
}

/*
	Name: register
	Namespace: scavenger_icon
	Checksum: 0xC6B58ED4
	Offset: 0x120
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new cscavenger_icon();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: scavenger_icon
	Checksum: 0xA4DF70D2
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
	Namespace: scavenger_icon
	Checksum: 0x2FDF789
	Offset: 0x1A0
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
	Checksum: 0xE6010A6A
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
	Name: function_e4e9c303
	Namespace: scavenger_icon
	Checksum: 0x1EDA2909
	Offset: 0x1F0
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
	Checksum: 0x6D63A85D
	Offset: 0x218
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
	Checksum: 0x6372563F
	Offset: 0x240
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
	Checksum: 0x35FF7EFD
	Offset: 0x268
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function function_417df30c(player)
{
	[[ self ]]->function_417df30c(player);
}

