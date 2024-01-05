#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class czm_trial_timer : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: czm_trial_timer
		Checksum: 0x3140F0BF
		Offset: 0x238
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: czm_trial_timer
		Checksum: 0xB4CFEF60
		Offset: 0x3E8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: czm_trial_timer
		Checksum: 0x630E84EC
		Offset: 0x2D0
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
		Namespace: czm_trial_timer
		Checksum: 0xB64D9DE9
		Offset: 0x318
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: set_under_round_rules
		Namespace: czm_trial_timer
		Checksum: 0x650B3E34
		Offset: 0x398
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_under_round_rules(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "under_round_rules", value);
	}

	/*
		Name: set_timer_text
		Namespace: czm_trial_timer
		Checksum: 0x1D5C70F3
		Offset: 0x348
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_timer_text(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "timer_text", value);
	}

	/*
		Name: setup_clientfields
		Namespace: czm_trial_timer
		Checksum: 0x7A215DF3
		Offset: 0x258
		Size: 0x6C
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("zm_trial_timer");
		cluielem::function_dcb34c80("string", "timer_text", 1);
		cluielem::add_clientfield("under_round_rules", 1, 1, "int");
	}

}

#namespace zm_trial_timer;

/*
	Name: function_de724a26
	Namespace: zm_trial_timer
	Checksum: 0xF266B4EF
	Offset: 0xE8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_de724a26()
{
	level notify(-2053755473);
}

/*
	Name: register
	Namespace: zm_trial_timer
	Checksum: 0x3D926E4B
	Offset: 0x108
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new czm_trial_timer();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: zm_trial_timer
	Checksum: 0xAA4B8EB3
	Offset: 0x148
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
	Namespace: zm_trial_timer
	Checksum: 0xF8A9CA82
	Offset: 0x188
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
	Namespace: zm_trial_timer
	Checksum: 0xA2C3BD60
	Offset: 0x1B0
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_timer_text
	Namespace: zm_trial_timer
	Checksum: 0x64D923CF
	Offset: 0x1D8
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_timer_text(player, value)
{
	[[ self ]]->set_timer_text(player, value);
}

/*
	Name: set_under_round_rules
	Namespace: zm_trial_timer
	Checksum: 0xD5366668
	Offset: 0x208
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_under_round_rules(player, value)
{
	[[ self ]]->set_under_round_rules(player, value);
}

