#using scripts\core_common\lui_shared.csc;

class czm_gold_align_satellite_hud : cluielem
{

	/*
		Name: constructor
		Namespace: czm_gold_align_satellite_hud
		Checksum: 0xDC4084E4
		Offset: 0x308
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: czm_gold_align_satellite_hud
		Checksum: 0xCB392D6D
		Offset: 0x3D8
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: czm_gold_align_satellite_hud
		Checksum: 0x6BBE1073
		Offset: 0x3A8
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
		Namespace: czm_gold_align_satellite_hud
		Checksum: 0x1C8CEAA7
		Offset: 0x350
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("zm_gold_align_satellite_hud");
	}

	/*
		Name: setup_clientfields
		Namespace: czm_gold_align_satellite_hud
		Checksum: 0xD6F94C2A
		Offset: 0x328
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("zm_gold_align_satellite_hud");
	}

	/*
		Name: function_fa582112
		Namespace: czm_gold_align_satellite_hud
		Checksum: 0x1D2B076A
		Offset: 0x378
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
	}

}

#namespace zm_gold_align_satellite_hud;

/*
	Name: function_11404e50
	Namespace: zm_gold_align_satellite_hud
	Checksum: 0xAA6382CA
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_11404e50()
{
	level notify(1650278560);
}

/*
	Name: register
	Namespace: zm_gold_align_satellite_hud
	Checksum: 0xB4981A7E
	Offset: 0xD8
	Size: 0x16E
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new czm_gold_align_satellite_hud();
	[[ elem ]]->setup_clientfields();
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"zm_gold_align_satellite_hud"]))
	{
		level.var_ae746e8f[#"zm_gold_align_satellite_hud"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"zm_gold_align_satellite_hud"]))
	{
		level.var_ae746e8f[#"zm_gold_align_satellite_hud"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"zm_gold_align_satellite_hud"]))
	{
		level.var_ae746e8f[#"zm_gold_align_satellite_hud"] = array(level.var_ae746e8f[#"zm_gold_align_satellite_hud"]);
	}
	level.var_ae746e8f[#"zm_gold_align_satellite_hud"][level.var_ae746e8f[#"zm_gold_align_satellite_hud"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: zm_gold_align_satellite_hud
	Checksum: 0x97CE3BCE
	Offset: 0x250
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new czm_gold_align_satellite_hud();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: zm_gold_align_satellite_hud
	Checksum: 0xDC8037A3
	Offset: 0x290
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
	Namespace: zm_gold_align_satellite_hud
	Checksum: 0x9A28CCE
	Offset: 0x2B8
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
	Namespace: zm_gold_align_satellite_hud
	Checksum: 0x9AC1CC48
	Offset: 0x2E0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

