#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class czm_hint_text : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: czm_hint_text
		Checksum: 0x85AC975A
		Offset: 0x200
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
		Checksum: 0xE6EA947C
		Offset: 0x438
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
		Checksum: 0x6CCACA03
		Offset: 0x298
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
		Checksum: 0xF38172DA
		Offset: 0x2E0
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
		Checksum: 0x3178285B
		Offset: 0x220
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
		Checksum: 0x4DF982DF
		Offset: 0x3E8
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
		Checksum: 0x9287ED2D
		Offset: 0x310
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
	Name: register
	Namespace: zm_hint_text
	Checksum: 0xDA83A945
	Offset: 0xD0
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
	Checksum: 0x66AF6895
	Offset: 0x110
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
	Checksum: 0xCF4D1283
	Offset: 0x150
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
	Checksum: 0xD7BC2ED4
	Offset: 0x178
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
	Checksum: 0x263269A1
	Offset: 0x1A0
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
	Checksum: 0x57DD2A56
	Offset: 0x1D0
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_text(player, value)
{
	[[ self ]]->set_text(player, value);
}

