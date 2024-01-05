#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class class_c982469d : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_c982469d
		Checksum: 0x651807DD
		Offset: 0x268
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_c982469d
		Checksum: 0x3642E974
		Offset: 0x490
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_c982469d
		Checksum: 0x2DB15A0B
		Offset: 0x328
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
		cluielem::open_luielem(player, flags);
	}

	/*
		Name: close
		Namespace: namespace_c982469d
		Checksum: 0xBB478849
		Offset: 0x370
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: set_armor_vis
		Namespace: namespace_c982469d
		Checksum: 0x5C8A1C32
		Offset: 0x440
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_armor_vis(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "armor_vis", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_c982469d
		Checksum: 0x2E5FC827
		Offset: 0x288
		Size: 0x94
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("zm_corrupted_health_bar");
		cluielem::add_clientfield("health", 4000, 7, "float");
		cluielem::add_clientfield("armor", 4000, 7, "float");
		cluielem::add_clientfield("armor_vis", 4000, 1, "int");
	}

	/*
		Name: set_armor
		Namespace: namespace_c982469d
		Checksum: 0xDB448747
		Offset: 0x3F0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_armor(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "armor", value);
	}

	/*
		Name: set_health
		Namespace: namespace_c982469d
		Checksum: 0x79D54B4C
		Offset: 0x3A0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_health(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "health", value);
	}

}

#namespace zm_corrupted_health_bar;

/*
	Name: function_5cfe9464
	Namespace: zm_corrupted_health_bar
	Checksum: 0xFC7921B5
	Offset: 0xE8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5cfe9464()
{
	level notify(1302001240);
}

/*
	Name: register
	Namespace: zm_corrupted_health_bar
	Checksum: 0x7FD4BDF9
	Offset: 0x108
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_c982469d();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: zm_corrupted_health_bar
	Checksum: 0x584B4B43
	Offset: 0x148
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
	Namespace: zm_corrupted_health_bar
	Checksum: 0x5189623B
	Offset: 0x188
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
	Namespace: zm_corrupted_health_bar
	Checksum: 0xC3D6EA8D
	Offset: 0x1B0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_health
	Namespace: zm_corrupted_health_bar
	Checksum: 0x4538EA91
	Offset: 0x1D8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_health(player, value)
{
	[[ self ]]->set_health(player, value);
}

/*
	Name: set_armor
	Namespace: zm_corrupted_health_bar
	Checksum: 0x2F5A58B5
	Offset: 0x208
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_armor(player, value)
{
	[[ self ]]->set_armor(player, value);
}

/*
	Name: set_armor_vis
	Namespace: zm_corrupted_health_bar
	Checksum: 0x58AD17FA
	Offset: 0x238
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_armor_vis(player, value)
{
	[[ self ]]->set_armor_vis(player, value);
}

