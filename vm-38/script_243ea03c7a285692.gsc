#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class crevive_hud : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: crevive_hud
		Checksum: 0x85A85551
		Offset: 0x260
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: crevive_hud
		Checksum: 0x49F8F1E5
		Offset: 0x488
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: crevive_hud
		Checksum: 0xA3BBE23E
		Offset: 0x320
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
		Name: set_fadetime
		Namespace: crevive_hud
		Checksum: 0x99BCAF8A
		Offset: 0x438
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_fadetime(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "fadeTime", value);
	}

	/*
		Name: set_clientnum
		Namespace: crevive_hud
		Checksum: 0x20EB5534
		Offset: 0x3E8
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_clientnum(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "clientNum", value);
	}

	/*
		Name: close
		Namespace: crevive_hud
		Checksum: 0x9B0C8B67
		Offset: 0x368
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
		Namespace: crevive_hud
		Checksum: 0xBFFB4A2F
		Offset: 0x280
		Size: 0x94
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("revive_hud");
		cluielem::function_dcb34c80("string", "text", 1);
		cluielem::add_clientfield("clientNum", 1, 7, "int");
		cluielem::add_clientfield("fadeTime", 1, 5, "int");
	}

	/*
		Name: set_text
		Namespace: crevive_hud
		Checksum: 0xC1D154ED
		Offset: 0x398
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_text(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "text", value);
	}

}

#namespace revive_hud;

/*
	Name: function_d7560939
	Namespace: revive_hud
	Checksum: 0x14933BB3
	Offset: 0xE0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d7560939()
{
	level notify(-885510103);
}

/*
	Name: register
	Namespace: revive_hud
	Checksum: 0x11BCF2F1
	Offset: 0x100
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new crevive_hud();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: revive_hud
	Checksum: 0x3A6790E3
	Offset: 0x140
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
	Namespace: revive_hud
	Checksum: 0x2AD0B106
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
	Namespace: revive_hud
	Checksum: 0x1E0592EA
	Offset: 0x1A8
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_text
	Namespace: revive_hud
	Checksum: 0xCC6C0C8B
	Offset: 0x1D0
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_text(player, value)
{
	[[ self ]]->set_text(player, value);
}

/*
	Name: set_clientnum
	Namespace: revive_hud
	Checksum: 0x1A3EDE94
	Offset: 0x200
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_clientnum(player, value)
{
	[[ self ]]->set_clientnum(player, value);
}

/*
	Name: set_fadetime
	Namespace: revive_hud
	Checksum: 0x637205F8
	Offset: 0x230
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_fadetime(player, value)
{
	[[ self ]]->set_fadetime(player, value);
}

