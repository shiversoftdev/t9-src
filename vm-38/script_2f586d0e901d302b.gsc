#using scripts\core_common\lui_shared.csc;

class cmobile_armory_loadout : cluielem
{

	/*
		Name: constructor
		Namespace: cmobile_armory_loadout
		Checksum: 0xF58476EA
		Offset: 0x300
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cmobile_armory_loadout
		Checksum: 0x9604EE4A
		Offset: 0x3D0
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cmobile_armory_loadout
		Checksum: 0xE9672F07
		Offset: 0x3A0
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: register_clientside
		Namespace: cmobile_armory_loadout
		Checksum: 0x343720C7
		Offset: 0x348
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("mobile_armory_loadout");
	}

	/*
		Name: setup_clientfields
		Namespace: cmobile_armory_loadout
		Checksum: 0xA460A7EA
		Offset: 0x320
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("mobile_armory_loadout");
	}

	/*
		Name: function_fa582112
		Namespace: cmobile_armory_loadout
		Checksum: 0xBB37DD6E
		Offset: 0x370
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
	}

}

#namespace mobile_armory_loadout;

/*
	Name: function_7f94b310
	Namespace: mobile_armory_loadout
	Checksum: 0xFAA91B18
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7f94b310()
{
	level notify(-561756894);
}

/*
	Name: register
	Namespace: mobile_armory_loadout
	Checksum: 0xD22CE38C
	Offset: 0xD0
	Size: 0x16E
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new cmobile_armory_loadout();
	[[ elem ]]->setup_clientfields();
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"mobile_armory_loadout"]))
	{
		level.var_ae746e8f[#"mobile_armory_loadout"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"mobile_armory_loadout"]))
	{
		level.var_ae746e8f[#"mobile_armory_loadout"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"mobile_armory_loadout"]))
	{
		level.var_ae746e8f[#"mobile_armory_loadout"] = array(level.var_ae746e8f[#"mobile_armory_loadout"]);
	}
	level.var_ae746e8f[#"mobile_armory_loadout"][level.var_ae746e8f[#"mobile_armory_loadout"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: mobile_armory_loadout
	Checksum: 0x5723437D
	Offset: 0x248
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new cmobile_armory_loadout();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: mobile_armory_loadout
	Checksum: 0xB035C16B
	Offset: 0x288
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
	Namespace: mobile_armory_loadout
	Checksum: 0x8A5D773E
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
	Namespace: mobile_armory_loadout
	Checksum: 0xEAA27B4E
	Offset: 0x2D8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

