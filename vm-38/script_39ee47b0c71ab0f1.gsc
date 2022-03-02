#using scripts\core_common\lui_shared.csc;

class class_12bf89f7 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_12bf89f7
		Checksum: 0x50D4A747
		Offset: 0x348
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_12bf89f7
		Checksum: 0x7059FDB2
		Offset: 0x4D8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: function_1e74977
		Namespace: namespace_12bf89f7
		Checksum: 0x73C8BDB9
		Offset: 0x460
		Size: 0x6C
		Parameters: 1
		Flags: Linked
	*/
	function function_1e74977(localclientnum)
	{
		current_val = [[ self ]]->function_92ba69fa(localclientnum, "show_icon");
		new_val = (current_val + 1) % 2;
		[[ self ]]->function_d7d2fcce(localclientnum, "show_icon", new_val);
	}

	/*
		Name: open
		Namespace: namespace_12bf89f7
		Checksum: 0xAB2F901B
		Offset: 0x430
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_12bf89f7
		Checksum: 0x231AA368
		Offset: 0x3C0
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("zm_trial_weapon_locked");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_12bf89f7
		Checksum: 0xB753C22D
		Offset: 0x368
		Size: 0x4C
		Parameters: 1
		Flags: Linked
	*/
	function setup_clientfields(var_18c795d0)
	{
		namespace_6aaccc24::setup_clientfields("zm_trial_weapon_locked");
		namespace_6aaccc24::function_da693cbe("show_icon", 1, 1, "counter", var_18c795d0);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_12bf89f7
		Checksum: 0xB983646F
		Offset: 0x3E8
		Size: 0x40
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "show_icon", 0);
	}

}

#namespace zm_trial_weapon_locked;

/*
	Name: function_76cbbb1a
	Namespace: zm_trial_weapon_locked
	Checksum: 0x23FBF0A5
	Offset: 0xC8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_76cbbb1a()
{
	level notify(236353079);
}

/*
	Name: register
	Namespace: zm_trial_weapon_locked
	Checksum: 0xED2A2CB1
	Offset: 0xE8
	Size: 0x176
	Parameters: 1
	Flags: None
*/
function register(var_18c795d0)
{
	elem = new class_12bf89f7();
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
	Name: function_5c1bb138
	Namespace: zm_trial_weapon_locked
	Checksum: 0xF312C59B
	Offset: 0x268
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_5c1bb138()
{
	elem = new class_12bf89f7();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: zm_trial_weapon_locked
	Checksum: 0xAB7C1ABF
	Offset: 0x2A8
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
	Checksum: 0x2C2BB37
	Offset: 0x2D0
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
	Checksum: 0x71B19878
	Offset: 0x2F8
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
	Checksum: 0xCB27C72A
	Offset: 0x320
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function function_1e74977(localclientnum)
{
	[[ self ]]->function_1e74977(localclientnum);
}

