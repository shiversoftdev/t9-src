#using scripts\core_common\lui_shared.csc;

class class_c33e75d1 : class_6aaccc24
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
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_1870151b
		Namespace: namespace_c33e75d1
		Checksum: 0x325923AA
		Offset: 0x6A0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_1870151b(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "raceTotalLap", value);
	}

	/*
		Name: function_2b44c64e
		Namespace: namespace_c33e75d1
		Checksum: 0xC244C3EB
		Offset: 0x630
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_2b44c64e(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "raceRanking", value);
	}

	/*
		Name: function_2b80b614
		Namespace: namespace_c33e75d1
		Checksum: 0x83BC05F3
		Offset: 0x6D8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_2b80b614(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "raceRewardTier", value);
	}

	/*
		Name: function_307daa91
		Namespace: namespace_c33e75d1
		Checksum: 0xCE8311EE
		Offset: 0x668
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_307daa91(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "raceCurrentLap", value);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_c33e75d1
		Checksum: 0xB6D2C54
		Offset: 0x538
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("zm_tungsten_grandprix");
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
		namespace_6aaccc24::setup_clientfields("zm_tungsten_grandprix");
		namespace_6aaccc24::function_da693cbe("raceRanking", 28000, 2, "int", var_20264c25);
		namespace_6aaccc24::function_da693cbe("raceCurrentLap", 28000, 2, "int", var_bbda5b4d);
		namespace_6aaccc24::function_da693cbe("raceTotalLap", 28000, 2, "int", var_19161bc0);
		namespace_6aaccc24::function_da693cbe("raceRewardTier", 28000, 2, "int", var_b6adcd73);
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
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "raceRanking", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "raceCurrentLap", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "raceTotalLap", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "raceRewardTier", 0);
	}

}

#namespace namespace_5ac3cdbb;

/*
	Name: function_bc2a2f71
	Namespace: namespace_5ac3cdbb
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
	Namespace: namespace_5ac3cdbb
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
	if(!isdefined(level.var_ae746e8f[#"hash_6fd9b5f86786cd9b"]))
	{
		level.var_ae746e8f[#"hash_6fd9b5f86786cd9b"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"hash_6fd9b5f86786cd9b"]))
	{
		level.var_ae746e8f[#"hash_6fd9b5f86786cd9b"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"hash_6fd9b5f86786cd9b"]))
	{
		level.var_ae746e8f[#"hash_6fd9b5f86786cd9b"] = array(level.var_ae746e8f[#"hash_6fd9b5f86786cd9b"]);
	}
	level.var_ae746e8f[#"hash_6fd9b5f86786cd9b"][level.var_ae746e8f[#"hash_6fd9b5f86786cd9b"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: namespace_5ac3cdbb
	Checksum: 0x432597CA
	Offset: 0x2B8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_c33e75d1();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: namespace_5ac3cdbb
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
	Namespace: namespace_5ac3cdbb
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
	Namespace: namespace_5ac3cdbb
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
	Name: function_2b44c64e
	Namespace: namespace_5ac3cdbb
	Checksum: 0xEF530716
	Offset: 0x370
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_2b44c64e(localclientnum, value)
{
	[[ self ]]->function_2b44c64e(localclientnum, value);
}

/*
	Name: function_307daa91
	Namespace: namespace_5ac3cdbb
	Checksum: 0xE01D3B48
	Offset: 0x3A0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_307daa91(localclientnum, value)
{
	[[ self ]]->function_307daa91(localclientnum, value);
}

/*
	Name: function_1870151b
	Namespace: namespace_5ac3cdbb
	Checksum: 0xB239F0ED
	Offset: 0x3D0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_1870151b(localclientnum, value)
{
	[[ self ]]->function_1870151b(localclientnum, value);
}

/*
	Name: function_2b80b614
	Namespace: namespace_5ac3cdbb
	Checksum: 0x9C8361CA
	Offset: 0x400
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_2b80b614(localclientnum, value)
{
	[[ self ]]->function_2b80b614(localclientnum, value);
}

