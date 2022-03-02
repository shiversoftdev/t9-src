#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_5c7b7dcc : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_5c7b7dcc
		Checksum: 0xA022DF69
		Offset: 0x1F8
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_5c7b7dcc
		Checksum: 0xA2CBEE09
		Offset: 0x330
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_5c7b7dcc
		Checksum: 0xD022D25A
		Offset: 0x268
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
		Namespace: namespace_5c7b7dcc
		Checksum: 0xB728AC2B
		Offset: 0x2B0
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: function_8c8674a4
		Namespace: namespace_5c7b7dcc
		Checksum: 0x1312B564
		Offset: 0x2E0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_8c8674a4(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "infectionTimeRemaining", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_5c7b7dcc
		Checksum: 0x2D502691
		Offset: 0x218
		Size: 0x44
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("mp_infect_timer");
		namespace_6aaccc24::function_da693cbe("infectionTimeRemaining", 1, 4, "int", 0);
	}

}

#namespace mp_infect_timer;

/*
	Name: function_53658969
	Namespace: mp_infect_timer
	Checksum: 0x4B263254
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_53658969()
{
	level notify(1441040466);
}

/*
	Name: register
	Namespace: mp_infect_timer
	Checksum: 0x2DD51CB
	Offset: 0xF8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_5c7b7dcc();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: mp_infect_timer
	Checksum: 0x22B7D0A0
	Offset: 0x138
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
	Namespace: mp_infect_timer
	Checksum: 0xBEEC1AC2
	Offset: 0x178
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
	Namespace: mp_infect_timer
	Checksum: 0xD0CA6291
	Offset: 0x1A0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: function_8c8674a4
	Namespace: mp_infect_timer
	Checksum: 0x7D699924
	Offset: 0x1C8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_8c8674a4(player, value)
{
	[[ self ]]->function_8c8674a4(player, value);
}

