#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class cself_respawn : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cself_respawn
		Checksum: 0xA022DF69
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
		Namespace: cself_respawn
		Checksum: 0xD3D54A55
		Offset: 0x320
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: set_percent
		Namespace: cself_respawn
		Checksum: 0x52B88E8D
		Offset: 0x2D0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_percent(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "percent", value);
	}

	/*
		Name: open
		Namespace: cself_respawn
		Checksum: 0x692ED424
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
		cluielem::open_luielem(player, flags);
	}

	/*
		Name: close
		Namespace: cself_respawn
		Checksum: 0x232E70C1
		Offset: 0x2A0
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
		Namespace: cself_respawn
		Checksum: 0x9C2E51AF
		Offset: 0x208
		Size: 0x44
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("self_respawn");
		cluielem::add_clientfield("percent", 1, 6, "float");
	}

}

#namespace self_respawn;

/*
	Name: function_eefe6667
	Namespace: self_respawn
	Checksum: 0x9FB4B861
	Offset: 0xC8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_eefe6667()
{
	level notify(815622696);
}

/*
	Name: register
	Namespace: self_respawn
	Checksum: 0xAC07D18E
	Offset: 0xE8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new cself_respawn();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: self_respawn
	Checksum: 0x22B7D0A0
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
	Namespace: self_respawn
	Checksum: 0xBEEC1AC2
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
	Namespace: self_respawn
	Checksum: 0xD0CA6291
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
	Name: set_percent
	Namespace: self_respawn
	Checksum: 0xCA8A7E8E
	Offset: 0x1B8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_percent(player, value)
{
	[[ self ]]->set_percent(player, value);
}

