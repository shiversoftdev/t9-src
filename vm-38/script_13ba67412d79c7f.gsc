#using scripts\core_common\lui_shared.csc;

class czm_trial_timer : cluielem
{

	/*
		Name: constructor
		Namespace: czm_trial_timer
		Checksum: 0xDEE7B245
		Offset: 0x3A0
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
		Checksum: 0xE6A7EED4
		Offset: 0x580
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
		Checksum: 0xA9294514
		Offset: 0x4E0
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
		Namespace: czm_trial_timer
		Checksum: 0xE4905A51
		Offset: 0x448
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function register_clientside()
	{
		cluielem::register_clientside("zm_trial_timer");
	}

	/*
		Name: set_under_round_rules
		Namespace: czm_trial_timer
		Checksum: 0xEC3D7553
		Offset: 0x548
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_under_round_rules(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "under_round_rules", value);
	}

	/*
		Name: set_timer_text
		Namespace: czm_trial_timer
		Checksum: 0x6A56D6D5
		Offset: 0x510
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_timer_text(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "timer_text", value);
	}

	/*
		Name: setup_clientfields
		Namespace: czm_trial_timer
		Checksum: 0xB78A7FFD
		Offset: 0x3C0
		Size: 0x7C
		Parameters: 2
		Flags: Linked
	*/
	function setup_clientfields(var_96b8e5ea, var_33be6591)
	{
		cluielem::setup_clientfields("zm_trial_timer");
		cluielem::function_dcb34c80("string", "timer_text", 1);
		cluielem::add_clientfield("under_round_rules", 1, 1, "int", var_33be6591);
	}

	/*
		Name: function_fa582112
		Namespace: czm_trial_timer
		Checksum: 0x46309204
		Offset: 0x470
		Size: 0x68
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "timer_text", #"");
		[[ self ]]->set_data(localclientnum, "under_round_rules", 0);
	}

}

#namespace zm_trial_timer;

/*
	Name: function_6df52484
	Namespace: zm_trial_timer
	Checksum: 0x60A6152C
	Offset: 0xE0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_6df52484()
{
	level notify(1684658858);
}

/*
	Name: register
	Namespace: zm_trial_timer
	Checksum: 0x1A09C66C
	Offset: 0x100
	Size: 0x17E
	Parameters: 2
	Flags: Linked
*/
function register(var_96b8e5ea, var_33be6591)
{
	elem = new czm_trial_timer();
	[[ elem ]]->setup_clientfields(var_96b8e5ea, var_33be6591);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"zm_trial_timer"]))
	{
		level.var_ae746e8f[#"zm_trial_timer"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"zm_trial_timer"]))
	{
		level.var_ae746e8f[#"zm_trial_timer"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"zm_trial_timer"]))
	{
		level.var_ae746e8f[#"zm_trial_timer"] = array(level.var_ae746e8f[#"zm_trial_timer"]);
	}
	level.var_ae746e8f[#"zm_trial_timer"][level.var_ae746e8f[#"zm_trial_timer"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: zm_trial_timer
	Checksum: 0xA0FB9D13
	Offset: 0x288
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new czm_trial_timer();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: zm_trial_timer
	Checksum: 0xEBC29BF4
	Offset: 0x2C8
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function open(player)
{
	[[ self ]]->open(player);
}

/*
	Name: close
	Namespace: zm_trial_timer
	Checksum: 0xFE874146
	Offset: 0x2F0
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
	Namespace: zm_trial_timer
	Checksum: 0x62973A6A
	Offset: 0x318
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_timer_text
	Namespace: zm_trial_timer
	Checksum: 0xAD4A2609
	Offset: 0x340
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_timer_text(localclientnum, value)
{
	[[ self ]]->set_timer_text(localclientnum, value);
}

/*
	Name: set_under_round_rules
	Namespace: zm_trial_timer
	Checksum: 0x118895AA
	Offset: 0x370
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_under_round_rules(localclientnum, value)
{
	[[ self ]]->set_under_round_rules(localclientnum, value);
}

