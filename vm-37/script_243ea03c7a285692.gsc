#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class crevive_hud : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: crevive_hud
		Checksum: 0xBF886762
		Offset: 0x240
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
		Checksum: 0xC953619C
		Offset: 0x468
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
		Checksum: 0xDEA97527
		Offset: 0x300
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
		Checksum: 0xBD584B69
		Offset: 0x418
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
		Checksum: 0x824F8708
		Offset: 0x3C8
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
		Checksum: 0x31FB18EE
		Offset: 0x348
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
		Checksum: 0x2B6A7C79
		Offset: 0x260
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
		Checksum: 0xE964BF0C
		Offset: 0x378
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
	Name: register
	Namespace: revive_hud
	Checksum: 0x691918E7
	Offset: 0xE0
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
	Checksum: 0x52224920
	Offset: 0x120
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
	Checksum: 0x753C763F
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
	Namespace: revive_hud
	Checksum: 0xEFF97288
	Offset: 0x188
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
	Checksum: 0xF09DE045
	Offset: 0x1B0
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
	Checksum: 0x21AD3619
	Offset: 0x1E0
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
	Checksum: 0x4D5C4296
	Offset: 0x210
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_fadetime(player, value)
{
	[[ self ]]->set_fadetime(player, value);
}

