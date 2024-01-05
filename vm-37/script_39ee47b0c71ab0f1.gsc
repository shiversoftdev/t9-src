#using scripts\core_common\lui_shared.csc;

class czm_trial_weapon_locked : cluielem
{

	/*
		Name: constructor
		Namespace: czm_trial_weapon_locked
		Checksum: 0xBBD0A668
		Offset: 0x328
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: czm_trial_weapon_locked
		Checksum: 0xCF9FA462
		Offset: 0x4B8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: function_1e74977
		Namespace: czm_trial_weapon_locked
		Checksum: 0x1A9BB768
		Offset: 0x440
		Size: 0x6C
		Parameters: 1
		Flags: Linked
	*/
	function function_1e74977(localclientnum)
	{
		current_val = [[ self ]]->get_data(localclientnum, "show_icon");
		new_val = (current_val + 1) % 2;
		[[ self ]]->set_data(localclientnum, "show_icon", new_val);
	}

	/*
		Name: open
		Namespace: czm_trial_weapon_locked
		Checksum: 0xBAAA93F7
		Offset: 0x410
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: register_clientside
		Namespace: czm_trial_weapon_locked
		Checksum: 0x51B4FE0
		Offset: 0x3A0
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function register_clientside()
	{
		cluielem::register_clientside("zm_trial_weapon_locked");
	}

	/*
		Name: setup_clientfields
		Namespace: czm_trial_weapon_locked
		Checksum: 0x8C7F5CE6
		Offset: 0x348
		Size: 0x4C
		Parameters: 1
		Flags: Linked
	*/
	function setup_clientfields(var_18c795d0)
	{
		cluielem::setup_clientfields("zm_trial_weapon_locked");
		cluielem::add_clientfield("show_icon", 1, 1, "counter", var_18c795d0);
	}

	/*
		Name: function_fa582112
		Namespace: czm_trial_weapon_locked
		Checksum: 0xAC08602C
		Offset: 0x3C8
		Size: 0x40
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "show_icon", 0);
	}

}

#namespace zm_trial_weapon_locked;

/*
	Name: register
	Namespace: zm_trial_weapon_locked
	Checksum: 0x19676B7D
	Offset: 0xC8
	Size: 0x176
	Parameters: 1
	Flags: None
*/
function register(var_18c795d0)
{
	elem = new czm_trial_weapon_locked();
	[[ elem ]]->setup_clientfields(var_18c795d0);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"zm_trial_weapon_locked"]))
	{
		level.var_ae746e8f[#"zm_trial_weapon_locked"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"zm_trial_weapon_locked"]))
	{
		level.var_ae746e8f[#"zm_trial_weapon_locked"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"zm_trial_weapon_locked"]))
	{
		level.var_ae746e8f[#"zm_trial_weapon_locked"] = array(level.var_ae746e8f[#"zm_trial_weapon_locked"]);
	}
	level.var_ae746e8f[#"zm_trial_weapon_locked"][level.var_ae746e8f[#"zm_trial_weapon_locked"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: zm_trial_weapon_locked
	Checksum: 0x42E5545B
	Offset: 0x248
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register_clientside()
{
	elem = new czm_trial_weapon_locked();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: zm_trial_weapon_locked
	Checksum: 0xA013B51C
	Offset: 0x288
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function open(player)
{
	[[ self ]]->open(player);
}

/*
	Name: close
	Namespace: zm_trial_weapon_locked
	Checksum: 0x26818F9B
	Offset: 0x2B0
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
	Namespace: zm_trial_weapon_locked
	Checksum: 0x4631A662
	Offset: 0x2D8
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: function_1e74977
	Namespace: zm_trial_weapon_locked
	Checksum: 0x89F357AA
	Offset: 0x300
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function function_1e74977(localclientnum)
{
	[[ self ]]->function_1e74977(localclientnum);
}

