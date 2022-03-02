#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_442ed2b4 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_442ed2b4
		Checksum: 0xB09D89E
		Offset: 0x1E0
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_442ed2b4
		Checksum: 0xCF7B22A9
		Offset: 0x318
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_442ed2b4
		Checksum: 0xF400424F
		Offset: 0x250
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
		Namespace: namespace_442ed2b4
		Checksum: 0xC0D8907
		Offset: 0x298
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
		Namespace: namespace_442ed2b4
		Checksum: 0xBCA44D17
		Offset: 0x200
		Size: 0x44
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("mp_gamemode_onslaught_bossalert_msg");
		namespace_6aaccc24::function_dcb34c80("string", "bossAlertText", 1);
	}

	/*
		Name: function_b73d2d7c
		Namespace: namespace_442ed2b4
		Checksum: 0xFE66C53
		Offset: 0x2C8
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_b73d2d7c(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "bossAlertText", value);
	}

}

#namespace mp_gamemode_onslaught_bossalert_msg;

/*
	Name: register
	Namespace: mp_gamemode_onslaught_bossalert_msg
	Checksum: 0xA3D62D1
	Offset: 0xE0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_442ed2b4();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: mp_gamemode_onslaught_bossalert_msg
	Checksum: 0x34E39DA0
	Offset: 0x120
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
	Namespace: mp_gamemode_onslaught_bossalert_msg
	Checksum: 0x74CB4E3A
	Offset: 0x160
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
	Namespace: mp_gamemode_onslaught_bossalert_msg
	Checksum: 0xA9AD379B
	Offset: 0x188
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: function_b73d2d7c
	Namespace: mp_gamemode_onslaught_bossalert_msg
	Checksum: 0x6DD5D213
	Offset: 0x1B0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_b73d2d7c(player, value)
{
	[[ self ]]->function_b73d2d7c(player, value);
}

