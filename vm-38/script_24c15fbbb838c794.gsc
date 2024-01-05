#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class cinteractive_shot : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cinteractive_shot
		Checksum: 0xBD4A911F
		Offset: 0x1E8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cinteractive_shot
		Checksum: 0x8CBEA994
		Offset: 0x320
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cinteractive_shot
		Checksum: 0xA2D77DAF
		Offset: 0x258
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
		Name: close
		Namespace: cinteractive_shot
		Checksum: 0x9A9D75F9
		Offset: 0x2A0
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
		Namespace: cinteractive_shot
		Checksum: 0x4FA789FE
		Offset: 0x208
		Size: 0x44
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("interactive_shot");
		cluielem::function_dcb34c80("string", "text", 1);
	}

	/*
		Name: set_text
		Namespace: cinteractive_shot
		Checksum: 0xF3D03845
		Offset: 0x2D0
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_text(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "text", value);
	}

}

#namespace interactive_shot;

/*
	Name: function_b0be759a
	Namespace: interactive_shot
	Checksum: 0x58EBF1DE
	Offset: 0xC8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b0be759a()
{
	level notify(766088391);
}

/*
	Name: register
	Namespace: interactive_shot
	Checksum: 0xE4DDE142
	Offset: 0xE8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new cinteractive_shot();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: interactive_shot
	Checksum: 0xAA4B8EB3
	Offset: 0x128
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
	Namespace: interactive_shot
	Checksum: 0xF8A9CA82
	Offset: 0x168
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function close(player)
{
	[[ self ]]->close(player);
}

/*
	Name: is_open
	Namespace: interactive_shot
	Checksum: 0xA2C3BD60
	Offset: 0x190
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
	Namespace: interactive_shot
	Checksum: 0x20D43DAC
	Offset: 0x1B8
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_text(player, value)
{
	[[ self ]]->set_text(player, value);
}

