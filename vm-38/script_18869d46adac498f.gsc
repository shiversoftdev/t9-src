#using scripts\core_common\lui_shared.csc;

class class_c33e75d1 : cluielem
{

	/*
		Name: constructor
		Namespace: namespace_c33e75d1
		Checksum: 0x7DE0B810
		Offset: 0x430
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_c33e75d1
		Checksum: 0xF44C9857
		Offset: 0x710
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_c33e75d1
		Checksum: 0x860D5E6
		Offset: 0x600
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: set_racetotallap
		Namespace: namespace_c33e75d1
		Checksum: 0x325923AA
		Offset: 0x6A0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_racetotallap(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "raceTotalLap", value);
	}

	/*
		Name: set_raceranking
		Namespace: namespace_c33e75d1
		Checksum: 0xC244C3EB
		Offset: 0x630
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_raceranking(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "raceRanking", value);
	}

	/*
		Name: set_racerewardtier
		Namespace: namespace_c33e75d1
		Checksum: 0x83BC05F3
		Offset: 0x6D8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_racerewardtier(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "raceRewardTier", value);
	}

	/*
		Name: set_racecurrentlap
		Namespace: namespace_c33e75d1
		Checksum: 0xCE8311EE
		Offset: 0x668
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_racecurrentlap(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "raceCurrentLap", value);
	}

	/*
		Name: register_clientside
		Namespace: namespace_c33e75d1
		Checksum: 0xB6D2C54
		Offset: 0x538
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function register_clientside()
	{
		cluielem::register_clientside("zm_tungsten_grandprix");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_c33e75d1
		Checksum: 0x568D7D45
		Offset: 0x450
		Size: 0xDC
		Parameters: 4
		Flags: Linked
	*/
	function setup_clientfields(var_20264c25, var_bbda5b4d, var_19161bc0, var_b6adcd73)
	{
		cluielem::setup_clientfields("zm_tungsten_grandprix");
		cluielem::add_clientfield("raceRanking", 28000, 2, "int", var_20264c25);
		cluielem::add_clientfield("raceCurrentLap", 28000, 2, "int", var_bbda5b4d);
		cluielem::add_clientfield("raceTotalLap", 28000, 2, "int", var_19161bc0);
		cluielem::add_clientfield("raceRewardTier", 28000, 2, "int", var_b6adcd73);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_c33e75d1
		Checksum: 0xD5953493
		Offset: 0x560
		Size: 0x94
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "raceRanking", 0);
		[[ self ]]->set_data(localclientnum, "raceCurrentLap", 0);
		[[ self ]]->set_data(localclientnum, "raceTotalLap", 0);
		[[ self ]]->set_data(localclientnum, "raceRewardTier", 0);
	}

}

#namespace zm_tungsten_grandprix;

/*
	Name: function_bc2a2f71
	Namespace: zm_tungsten_grandprix
	Checksum: 0xD82074FE
	Offset: 0xF8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_bc2a2f71()
{
	level notify(1930771358);
}

/*
	Name: register
	Namespace: zm_tungsten_grandprix
	Checksum: 0xE1CBCA42
	Offset: 0x118
	Size: 0x196
	Parameters: 4
	Flags: Linked
*/
function register(var_20264c25, var_bbda5b4d, var_19161bc0, var_b6adcd73)
{
	elem = new class_c33e75d1();
	[[ elem ]]->setup_clientfields(var_20264c25, var_bbda5b4d, var_19161bc0, var_b6adcd73);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"zm_tungsten_grandprix"]))
	{
		level.var_ae746e8f[#"zm_tungsten_grandprix"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"zm_tungsten_grandprix"]))
	{
		level.var_ae746e8f[#"zm_tungsten_grandprix"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"zm_tungsten_grandprix"]))
	{
		level.var_ae746e8f[#"zm_tungsten_grandprix"] = array(level.var_ae746e8f[#"zm_tungsten_grandprix"]);
	}
	level.var_ae746e8f[#"zm_tungsten_grandprix"][level.var_ae746e8f[#"zm_tungsten_grandprix"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: zm_tungsten_grandprix
	Checksum: 0x432597CA
	Offset: 0x2B8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new class_c33e75d1();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: zm_tungsten_grandprix
	Checksum: 0xB9E73D81
	Offset: 0x2F8
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
	Namespace: zm_tungsten_grandprix
	Checksum: 0x6F5221DB
	Offset: 0x320
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
	Namespace: zm_tungsten_grandprix
	Checksum: 0xA104C566
	Offset: 0x348
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_raceranking
	Namespace: zm_tungsten_grandprix
	Checksum: 0xEF530716
	Offset: 0x370
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_raceranking(localclientnum, value)
{
	[[ self ]]->set_raceranking(localclientnum, value);
}

/*
	Name: set_racecurrentlap
	Namespace: zm_tungsten_grandprix
	Checksum: 0xE01D3B48
	Offset: 0x3A0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_racecurrentlap(localclientnum, value)
{
	[[ self ]]->set_racecurrentlap(localclientnum, value);
}

/*
	Name: set_racetotallap
	Namespace: zm_tungsten_grandprix
	Checksum: 0xB239F0ED
	Offset: 0x3D0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_racetotallap(localclientnum, value)
{
	[[ self ]]->set_racetotallap(localclientnum, value);
}

/*
	Name: set_racerewardtier
	Namespace: zm_tungsten_grandprix
	Checksum: 0x9C8361CA
	Offset: 0x400
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_racerewardtier(localclientnum, value)
{
	[[ self ]]->set_racerewardtier(localclientnum, value);
}

