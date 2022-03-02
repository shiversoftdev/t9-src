#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_3df1eeda : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_3df1eeda
		Checksum: 0x6CD10FC2
		Offset: 0x218
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_3df1eeda
		Checksum: 0xDBBE6BBF
		Offset: 0x3C8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_3df1eeda
		Checksum: 0x3CE8F43F
		Offset: 0x2B0
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
		namespace_6aaccc24::function_8b8089ba(player, flags);
	}

	/*
		Name: close
		Namespace: namespace_3df1eeda
		Checksum: 0xA4B4A135
		Offset: 0x2F8
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: function_6ad54036
		Namespace: namespace_3df1eeda
		Checksum: 0x3990EA26
		Offset: 0x378
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_6ad54036(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "under_round_rules", value);
	}

	/*
		Name: function_8ede8e82
		Namespace: namespace_3df1eeda
		Checksum: 0xFA96A625
		Offset: 0x328
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_8ede8e82(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "timer_text", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_3df1eeda
		Checksum: 0x81FD52AD
		Offset: 0x238
		Size: 0x6C
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("zm_trial_timer");
		namespace_6aaccc24::function_dcb34c80("string", "timer_text", 1);
		namespace_6aaccc24::function_da693cbe("under_round_rules", 1, 1, "int");
	}

}

#namespace zm_trial_timer;

/*
	Name: register
	Namespace: zm_trial_timer
	Checksum: 0xD873AC6
	Offset: 0xE8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new class_3df1eeda();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: zm_trial_timer
	Checksum: 0xAAD9FD56
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
	Namespace: zm_trial_timer
	Checksum: 0xD115B182
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
	Namespace: zm_trial_timer
	Checksum: 0x853CA0D4
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
	Name: function_8ede8e82
	Namespace: zm_trial_timer
	Checksum: 0x2C04B88E
	Offset: 0x1B8
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_8ede8e82(player, value)
{
	[[ self ]]->function_8ede8e82(player, value);
}

/*
	Name: function_6ad54036
	Namespace: zm_trial_timer
	Checksum: 0x5D7C665E
	Offset: 0x1E8
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_6ad54036(player, value)
{
	[[ self ]]->function_6ad54036(player, value);
}

