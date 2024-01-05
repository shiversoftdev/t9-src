#using scripts\core_common\lui_shared.csc;

class cwz_revive_prompt : cluielem
{

	/*
		Name: constructor
		Namespace: cwz_revive_prompt
		Checksum: 0xF018E793
		Offset: 0x420
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
		Checksum: 0x94F206D6
		Offset: 0x720
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
		Checksum: 0x51AA7584
		Offset: 0x610
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
		Checksum: 0x9DD21121
		Offset: 0x640
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
		Checksum: 0x29044160
		Offset: 0x6B0
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
		Checksum: 0x83AA9D22
		Offset: 0x538
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
		Checksum: 0x659A0AD6
		Offset: 0x440
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
		Checksum: 0xA32BD28D
		Offset: 0x678
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
		Checksum: 0x921A5D81
		Offset: 0x6E8
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
		Checksum: 0xC7D60B72
		Offset: 0x560
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
	Name: register
	Namespace: wz_revive_prompt
	Checksum: 0xF48F35E6
	Offset: 0xF8
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
	Checksum: 0x5498BA54
	Offset: 0x2A8
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
	Checksum: 0x688B0E02
	Offset: 0x2E8
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
	Checksum: 0x7FC32036
	Offset: 0x310
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
	Checksum: 0x3DC4273F
	Offset: 0x338
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
	Checksum: 0xBCB47A96
	Offset: 0x360
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
	Checksum: 0xD826D2C6
	Offset: 0x390
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
	Checksum: 0xC39B55F4
	Offset: 0x3C0
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
	Checksum: 0x9C7CBE41
	Offset: 0x3F0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_cowardsway(localclientnum, value)
{
	[[ self ]]->set_cowardsway(localclientnum, value);
}

