#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_e6fa6527 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_e6fa6527
		Checksum: 0x94C99E74
		Offset: 0x1E8
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_e6fa6527
		Checksum: 0xC9C4E90C
		Offset: 0x320
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_e6fa6527
		Checksum: 0xD1ACEF65
		Offset: 0x258
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
		Name: function_3820c524
		Namespace: namespace_e6fa6527
		Checksum: 0xAEB05A44
		Offset: 0x2D0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_3820c524(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "shutdown_sec", value);
	}

	/*
		Name: close
		Namespace: namespace_e6fa6527
		Checksum: 0x5770F9DD
		Offset: 0x2A0
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
		Namespace: namespace_e6fa6527
		Checksum: 0xF0D89840
		Offset: 0x208
		Size: 0x44
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("death_zone");
		namespace_6aaccc24::function_da693cbe("shutdown_sec", 1, 9, "int");
	}

}

#namespace death_zone;

/*
	Name: function_3f6c463f
	Namespace: death_zone
	Checksum: 0xB36B739
	Offset: 0xC8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_3f6c463f()
{
	level notify(499683823);
}

/*
	Name: register
	Namespace: death_zone
	Checksum: 0xDDC7EC02
	Offset: 0xE8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_e6fa6527();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: death_zone
	Checksum: 0xA4DF70D2
	Offset: 0x128
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
	Namespace: death_zone
	Checksum: 0x2FDF789
	Offset: 0x168
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
	Namespace: death_zone
	Checksum: 0xE6010A6A
	Offset: 0x190
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: function_3820c524
	Namespace: death_zone
	Checksum: 0xAFBBE804
	Offset: 0x1B8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_3820c524(player, value)
{
	[[ self ]]->function_3820c524(player, value);
}

