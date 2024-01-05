#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class czm_hint_text : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: czm_hint_text
		Checksum: 0x1FFDEF9E
		Offset: 0x220
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: czm_hint_text
		Checksum: 0x661FEDC0
		Offset: 0x458
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: czm_hint_text
		Checksum: 0xCCCE31D2
		Offset: 0x2B8
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
		Namespace: czm_hint_text
		Checksum: 0x19835CE
		Offset: 0x300
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
		Namespace: czm_hint_text
		Checksum: 0x3C72D175
		Offset: 0x240
		Size: 0x6C
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("zm_hint_text");
		cluielem::add_clientfield("_state", 1, 1, "int");
		cluielem::function_dcb34c80("string", "text", 1);
	}

	/*
		Name: set_text
		Namespace: czm_hint_text
		Checksum: 0xF92612DE
		Offset: 0x408
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_text(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "text", value);
	}

	/*
		Name: set_state
		Namespace: czm_hint_text
		Checksum: 0xC1B8DF4F
		Offset: 0x330
		Size: 0xCC
		Parameters: 2
		Flags: Linked
	*/
	function set_state(player, state_name)
	{
		if(#"defaultstate" == state_name)
		{
			player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 0);
		}
		else
		{
			if(#"visible" == state_name)
			{
				player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 1);
			}
			else
			{
				/#
					assertmsg("");
				#/
				/#
				#/
			}
		}
	}

}

#namespace zm_hint_text;

/*
	Name: function_f32b0a00
	Namespace: zm_hint_text
	Checksum: 0xEE8DBDC9
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f32b0a00()
{
	level notify(1331617674);
}

/*
	Name: register
	Namespace: zm_hint_text
	Checksum: 0x40F7EDB4
	Offset: 0xF0
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new czm_hint_text();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: zm_hint_text
	Checksum: 0x584B4B43
	Offset: 0x130
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
	Namespace: zm_hint_text
	Checksum: 0x5189623B
	Offset: 0x170
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
	Namespace: zm_hint_text
	Checksum: 0xC3D6EA8D
	Offset: 0x198
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_state
	Namespace: zm_hint_text
	Checksum: 0x9478374C
	Offset: 0x1C0
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_state(player, state_name)
{
	[[ self ]]->set_state(player, state_name);
}

/*
	Name: set_text
	Namespace: zm_hint_text
	Checksum: 0x5FEA39FF
	Offset: 0x1F0
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_text(player, value)
{
	[[ self ]]->set_text(player, value);
}

