#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class cwz_revive_prompt : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cwz_revive_prompt
		Checksum: 0xB3ADB5ED
		Offset: 0x290
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cwz_revive_prompt
		Checksum: 0x4A2D3C05
		Offset: 0x530
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cwz_revive_prompt
		Checksum: 0x9CD447C6
		Offset: 0x378
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
		Name: set_clientnum
		Namespace: cwz_revive_prompt
		Checksum: 0x66AEB658
		Offset: 0x3F0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_clientnum(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "clientnum", value);
	}

	/*
		Name: set_reviveprogress
		Namespace: cwz_revive_prompt
		Checksum: 0xD2690992
		Offset: 0x490
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_reviveprogress(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "reviveProgress", value);
	}

	/*
		Name: close
		Namespace: cwz_revive_prompt
		Checksum: 0x3CD59A6B
		Offset: 0x3C0
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: setup_clientfields
		Namespace: cwz_revive_prompt
		Checksum: 0xD715ED02
		Offset: 0x2B0
		Size: 0xBC
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("wz_revive_prompt");
		cluielem::add_clientfield("clientnum", 1, 7, "int");
		cluielem::add_clientfield("progress", 1, 5, "float");
		cluielem::add_clientfield("reviveProgress", 1, 5, "float");
		cluielem::add_clientfield("cowardsWay", 1, 1, "int");
	}

	/*
		Name: set_progress
		Namespace: cwz_revive_prompt
		Checksum: 0x4F536927
		Offset: 0x440
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_progress(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "progress", value);
	}

	/*
		Name: set_cowardsway
		Namespace: cwz_revive_prompt
		Checksum: 0xDA6E1711
		Offset: 0x4E0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_cowardsway(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "cowardsWay", value);
	}

}

#namespace wz_revive_prompt;

/*
	Name: register
	Namespace: wz_revive_prompt
	Checksum: 0x416CAEA6
	Offset: 0x100
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new cwz_revive_prompt();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: wz_revive_prompt
	Checksum: 0x9E0FBA10
	Offset: 0x140
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
	Namespace: wz_revive_prompt
	Checksum: 0xB2A10D20
	Offset: 0x1A8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_clientnum
	Namespace: wz_revive_prompt
	Checksum: 0x95FB87A0
	Offset: 0x1D0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_clientnum(player, value)
{
	[[ self ]]->set_clientnum(player, value);
}

/*
	Name: set_progress
	Namespace: wz_revive_prompt
	Checksum: 0x7F4A4FC5
	Offset: 0x200
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_progress(player, value)
{
	[[ self ]]->set_progress(player, value);
}

/*
	Name: set_reviveprogress
	Namespace: wz_revive_prompt
	Checksum: 0x8B6F1D5F
	Offset: 0x230
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_reviveprogress(player, value)
{
	[[ self ]]->set_reviveprogress(player, value);
}

/*
	Name: set_cowardsway
	Namespace: wz_revive_prompt
	Checksum: 0xF05635A5
	Offset: 0x260
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_cowardsway(player, value)
{
	[[ self ]]->set_cowardsway(player, value);
}

