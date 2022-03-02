#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_1b0cb7b1 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_1b0cb7b1
		Checksum: 0x54ABEFC7
		Offset: 0x2B0
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_1b0cb7b1
		Checksum: 0xC183DF32
		Offset: 0x550
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_1b0cb7b1
		Checksum: 0x699064BF
		Offset: 0x398
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
		Name: function_3b7b386a
		Namespace: namespace_1b0cb7b1
		Checksum: 0x344F412B
		Offset: 0x410
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_3b7b386a(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "clientnum", value);
	}

	/*
		Name: function_4b3fb8b8
		Namespace: namespace_1b0cb7b1
		Checksum: 0xB0EC630E
		Offset: 0x4B0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_4b3fb8b8(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "reviveProgress", value);
	}

	/*
		Name: close
		Namespace: namespace_1b0cb7b1
		Checksum: 0x68FE9D0E
		Offset: 0x3E0
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
		Namespace: namespace_1b0cb7b1
		Checksum: 0xDB4813D9
		Offset: 0x2D0
		Size: 0xBC
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("wz_revive_prompt");
		namespace_6aaccc24::function_da693cbe("clientnum", 1, 7, "int");
		namespace_6aaccc24::function_da693cbe("progress", 1, 5, "float");
		namespace_6aaccc24::function_da693cbe("reviveProgress", 1, 5, "float");
		namespace_6aaccc24::function_da693cbe("cowardsWay", 1, 1, "int");
	}

	/*
		Name: function_affe8f61
		Namespace: namespace_1b0cb7b1
		Checksum: 0xD20548C6
		Offset: 0x460
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_affe8f61(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "progress", value);
	}

	/*
		Name: function_f52e0186
		Namespace: namespace_1b0cb7b1
		Checksum: 0x6116BEBC
		Offset: 0x500
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_f52e0186(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "cowardsWay", value);
	}

}

#namespace wz_revive_prompt;

/*
	Name: function_f465100d
	Namespace: wz_revive_prompt
	Checksum: 0xC5ABB0BA
	Offset: 0x100
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f465100d()
{
	level notify(870198272);
}

/*
	Name: register
	Namespace: wz_revive_prompt
	Checksum: 0x78303AD3
	Offset: 0x120
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_1b0cb7b1();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: wz_revive_prompt
	Checksum: 0xA4DF70D2
	Offset: 0x160
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
	Namespace: wz_revive_prompt
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
	Namespace: wz_revive_prompt
	Checksum: 0xE6010A6A
	Offset: 0x1C8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: function_3b7b386a
	Namespace: wz_revive_prompt
	Checksum: 0xB7ECE126
	Offset: 0x1F0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_3b7b386a(player, value)
{
	[[ self ]]->function_3b7b386a(player, value);
}

/*
	Name: function_affe8f61
	Namespace: wz_revive_prompt
	Checksum: 0x5D3E40C5
	Offset: 0x220
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_affe8f61(player, value)
{
	[[ self ]]->function_affe8f61(player, value);
}

/*
	Name: function_4b3fb8b8
	Namespace: wz_revive_prompt
	Checksum: 0xE488204D
	Offset: 0x250
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_4b3fb8b8(player, value)
{
	[[ self ]]->function_4b3fb8b8(player, value);
}

/*
	Name: function_f52e0186
	Namespace: wz_revive_prompt
	Checksum: 0x4B070CCA
	Offset: 0x280
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_f52e0186(player, value)
{
	[[ self ]]->function_f52e0186(player, value);
}

