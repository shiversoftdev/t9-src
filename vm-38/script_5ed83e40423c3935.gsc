#using scripts\core_common\lui_shared.csc;

class cwz_revive_prompt : cluielem
{

	/*
		Name: constructor
		Namespace: cwz_revive_prompt
		Checksum: 0x8645E56
		Offset: 0x440
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cwz_revive_prompt
		Checksum: 0x215C2F00
		Offset: 0x740
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cwz_revive_prompt
		Checksum: 0x47FE5F82
		Offset: 0x630
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: set_clientnum
		Namespace: cwz_revive_prompt
		Checksum: 0x2908B57C
		Offset: 0x660
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_clientnum(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "clientnum", value);
	}

	/*
		Name: set_reviveprogress
		Namespace: cwz_revive_prompt
		Checksum: 0x305A4353
		Offset: 0x6D0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_reviveprogress(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "reviveProgress", value);
	}

	/*
		Name: register_clientside
		Namespace: cwz_revive_prompt
		Checksum: 0xBE69C0AD
		Offset: 0x558
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("wz_revive_prompt");
	}

	/*
		Name: setup_clientfields
		Namespace: cwz_revive_prompt
		Checksum: 0x9D6EFCD9
		Offset: 0x460
		Size: 0xEC
		Parameters: 6
		Flags: None
	*/
	function setup_clientfields(var_c05c67e2, var_afaddf7a, var_d65e5a18, var_f228b5fa, var_7cb8f98a, var_bda3bf84)
	{
		cluielem::setup_clientfields("wz_revive_prompt");
		cluielem::add_clientfield("clientnum", 1, 7, "int", var_d65e5a18);
		cluielem::add_clientfield("progress", 1, 5, "float", var_f228b5fa);
		cluielem::add_clientfield("reviveProgress", 1, 5, "float", var_7cb8f98a);
		cluielem::add_clientfield("cowardsWay", 1, 1, "int", var_bda3bf84);
	}

	/*
		Name: set_progress
		Namespace: cwz_revive_prompt
		Checksum: 0xD4CDDF6F
		Offset: 0x698
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_progress(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "progress", value);
	}

	/*
		Name: set_cowardsway
		Namespace: cwz_revive_prompt
		Checksum: 0xC89FA6B3
		Offset: 0x708
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_cowardsway(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "cowardsWay", value);
	}

	/*
		Name: function_fa582112
		Namespace: cwz_revive_prompt
		Checksum: 0xD2B897AD
		Offset: 0x580
		Size: 0xA4
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "clientnum", 0);
		[[ self ]]->set_data(localclientnum, "progress", 0);
		[[ self ]]->set_data(localclientnum, "reviveProgress", 0);
		[[ self ]]->set_data(localclientnum, "cowardsWay", 0);
	}

}

#namespace wz_revive_prompt;

/*
	Name: function_360c2a40
	Namespace: wz_revive_prompt
	Checksum: 0xD8F0C53E
	Offset: 0xF8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_360c2a40()
{
	level notify(-1329352256);
}

/*
	Name: register
	Namespace: wz_revive_prompt
	Checksum: 0xEDBD296D
	Offset: 0x118
	Size: 0x1A6
	Parameters: 6
	Flags: None
*/
function register(var_c05c67e2, var_afaddf7a, var_d65e5a18, var_f228b5fa, var_7cb8f98a, var_bda3bf84)
{
	elem = new cwz_revive_prompt();
	[[ elem ]]->setup_clientfields(var_c05c67e2, var_afaddf7a, var_d65e5a18, var_f228b5fa, var_7cb8f98a, var_bda3bf84);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"wz_revive_prompt"]))
	{
		level.var_ae746e8f[#"wz_revive_prompt"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"wz_revive_prompt"]))
	{
		level.var_ae746e8f[#"wz_revive_prompt"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"wz_revive_prompt"]))
	{
		level.var_ae746e8f[#"wz_revive_prompt"] = array(level.var_ae746e8f[#"wz_revive_prompt"]);
	}
	level.var_ae746e8f[#"wz_revive_prompt"][level.var_ae746e8f[#"wz_revive_prompt"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: wz_revive_prompt
	Checksum: 0xE3989488
	Offset: 0x2C8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new cwz_revive_prompt();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: wz_revive_prompt
	Checksum: 0x1F949D96
	Offset: 0x308
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
	Namespace: wz_revive_prompt
	Checksum: 0xDE529BFB
	Offset: 0x330
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
	Namespace: wz_revive_prompt
	Checksum: 0xE8F983A3
	Offset: 0x358
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_clientnum
	Namespace: wz_revive_prompt
	Checksum: 0x5CA11903
	Offset: 0x380
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_clientnum(localclientnum, value)
{
	[[ self ]]->set_clientnum(localclientnum, value);
}

/*
	Name: set_progress
	Namespace: wz_revive_prompt
	Checksum: 0x44452A45
	Offset: 0x3B0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_progress(localclientnum, value)
{
	[[ self ]]->set_progress(localclientnum, value);
}

/*
	Name: set_reviveprogress
	Namespace: wz_revive_prompt
	Checksum: 0x4BEA42C2
	Offset: 0x3E0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_reviveprogress(localclientnum, value)
{
	[[ self ]]->set_reviveprogress(localclientnum, value);
}

/*
	Name: set_cowardsway
	Namespace: wz_revive_prompt
	Checksum: 0x61A231F
	Offset: 0x410
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_cowardsway(localclientnum, value)
{
	[[ self ]]->set_cowardsway(localclientnum, value);
}

