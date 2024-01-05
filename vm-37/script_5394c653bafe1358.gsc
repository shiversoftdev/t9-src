#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class cmp_revive_prompt : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cmp_revive_prompt
		Checksum: 0xF8A4071C
		Offset: 0x250
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cmp_revive_prompt
		Checksum: 0x72BE4F6F
		Offset: 0x478
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cmp_revive_prompt
		Checksum: 0xBA6F5B9D
		Offset: 0x310
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
		Namespace: cmp_revive_prompt
		Checksum: 0x19F5D6C0
		Offset: 0x388
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
		Namespace: cmp_revive_prompt
		Checksum: 0xEEB0877C
		Offset: 0x428
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
		Namespace: cmp_revive_prompt
		Checksum: 0xEA462724
		Offset: 0x358
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
		Namespace: cmp_revive_prompt
		Checksum: 0xB78E8ED5
		Offset: 0x270
		Size: 0x94
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("mp_revive_prompt");
		cluielem::add_clientfield("clientnum", 1, 7, "int", 0);
		cluielem::add_clientfield("progress", 1, 5, "float", 0);
		cluielem::add_clientfield("reviveProgress", 1, 5, "float", 0);
	}

	/*
		Name: set_progress
		Namespace: cmp_revive_prompt
		Checksum: 0xD96480A0
		Offset: 0x3D8
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_progress(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "progress", value);
	}

}

#namespace mp_revive_prompt;

/*
	Name: register
	Namespace: mp_revive_prompt
	Checksum: 0x7CAFF88
	Offset: 0xF0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new cmp_revive_prompt();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: mp_revive_prompt
	Checksum: 0xA54E9789
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
	Namespace: mp_revive_prompt
	Checksum: 0x86736221
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
	Namespace: mp_revive_prompt
	Checksum: 0x7D032A4E
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
	Name: set_clientnum
	Namespace: mp_revive_prompt
	Checksum: 0x210C5B26
	Offset: 0x1C0
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
	Namespace: mp_revive_prompt
	Checksum: 0x6AEA3316
	Offset: 0x1F0
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
	Namespace: mp_revive_prompt
	Checksum: 0x7E01236
	Offset: 0x220
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_reviveprogress(player, value)
{
	[[ self ]]->set_reviveprogress(player, value);
}

