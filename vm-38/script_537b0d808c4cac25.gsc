#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_600b033d : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_600b033d
		Checksum: 0x7DB406EC
		Offset: 0x1F0
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_600b033d
		Checksum: 0xE4393D0
		Offset: 0x328
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_600b033d
		Checksum: 0xFC149B61
		Offset: 0x260
		Size: 0x3C
		Parameters: 2
		Flags: None
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
		Namespace: namespace_600b033d
		Checksum: 0x613304B5
		Offset: 0x2A8
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_600b033d
		Checksum: 0x665DFBA6
		Offset: 0x210
		Size: 0x44
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("self_revive_visuals_rush");
		namespace_6aaccc24::function_da693cbe("revive_time", 1, 4, "int");
	}

	/*
		Name: set_revive_time
		Namespace: namespace_600b033d
		Checksum: 0x9043E3BA
		Offset: 0x2D8
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_revive_time(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "revive_time", value);
	}

}

#namespace self_revive_visuals_rush;

/*
	Name: function_8f4c2f6f
	Namespace: self_revive_visuals_rush
	Checksum: 0x35A98144
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8f4c2f6f()
{
	level notify(2093432496);
}

/*
	Name: register
	Namespace: self_revive_visuals_rush
	Checksum: 0xDB795715
	Offset: 0xF0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_600b033d();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: self_revive_visuals_rush
	Checksum: 0x40D59CB0
	Offset: 0x130
	Size: 0x38
	Parameters: 2
	Flags: None
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
	Namespace: self_revive_visuals_rush
	Checksum: 0x6221B1B7
	Offset: 0x170
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
	Namespace: self_revive_visuals_rush
	Checksum: 0xD7920DB2
	Offset: 0x198
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_revive_time
	Namespace: self_revive_visuals_rush
	Checksum: 0xD2CAC9CF
	Offset: 0x1C0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_revive_time(player, value)
{
	[[ self ]]->set_revive_time(player, value);
}

