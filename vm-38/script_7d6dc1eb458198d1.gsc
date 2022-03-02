#using scripts\core_common\lui_shared.csc;

class class_a0b518ca : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_a0b518ca
		Checksum: 0xEBE96DB9
		Offset: 0x4B8
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_a0b518ca
		Checksum: 0xC0102AB4
		Offset: 0x8B8
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_a0b518ca
		Checksum: 0x6CB4A5E9
		Offset: 0x738
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_338d48a0
		Namespace: namespace_a0b518ca
		Checksum: 0xF919D998
		Offset: 0x880
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_338d48a0(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "hasDamage", value);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_a0b518ca
		Checksum: 0x50681D08
		Offset: 0x620
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("zm_control_point_hud");
	}

	/*
		Name: function_62264c81
		Namespace: namespace_a0b518ca
		Checksum: 0xC7C85E5C
		Offset: 0x768
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_62264c81(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "chargePct", value);
	}

	/*
		Name: function_751f7270
		Namespace: namespace_a0b518ca
		Checksum: 0xD9B3B77
		Offset: 0x848
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_751f7270(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "hasCharge", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_a0b518ca
		Checksum: 0x2E323B83
		Offset: 0x4D8
		Size: 0x13C
		Parameters: 6
		Flags: None
	*/
	function setup_clientfields(var_4bf38eea, var_7cc0b11d, var_14431277, var_db1c4294, var_87048abd, var_dd55685a)
	{
		namespace_6aaccc24::setup_clientfields("zm_control_point_hud");
		namespace_6aaccc24::function_da693cbe("chargePct", 8000, 7, "float", var_4bf38eea);
		namespace_6aaccc24::function_da693cbe("damagePct", 8000, 7, "float", var_7cc0b11d);
		namespace_6aaccc24::function_da693cbe("ordaHealthPct", 16000, 7, "float", var_14431277);
		namespace_6aaccc24::function_da693cbe("hasOrda", 16000, 1, "int", var_db1c4294);
		namespace_6aaccc24::function_da693cbe("hasCharge", 16000, 1, "int", var_87048abd);
		namespace_6aaccc24::function_da693cbe("hasDamage", 16000, 1, "int", var_dd55685a);
	}

	/*
		Name: function_a04ff29a
		Namespace: namespace_a0b518ca
		Checksum: 0x4D120C86
		Offset: 0x7A0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_a04ff29a(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "damagePct", value);
	}

	/*
		Name: function_a59aefa6
		Namespace: namespace_a0b518ca
		Checksum: 0x8F220BEE
		Offset: 0x7D8
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_a59aefa6(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "ordaHealthPct", value);
	}

	/*
		Name: function_a95c34f3
		Namespace: namespace_a0b518ca
		Checksum: 0x1427C44F
		Offset: 0x810
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_a95c34f3(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "hasOrda", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_a0b518ca
		Checksum: 0x327E3D77
		Offset: 0x648
		Size: 0xE4
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "chargePct", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "damagePct", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "ordaHealthPct", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "hasOrda", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "hasCharge", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "hasDamage", 0);
	}

}

#namespace namespace_72133e5;

/*
	Name: function_4552498
	Namespace: namespace_72133e5
	Checksum: 0x77F7A34B
	Offset: 0x110
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4552498()
{
	level notify(697194221);
}

/*
	Name: register
	Namespace: namespace_72133e5
	Checksum: 0x593FE275
	Offset: 0x130
	Size: 0x1A6
	Parameters: 6
	Flags: None
*/
function register(var_4bf38eea, var_7cc0b11d, var_14431277, var_db1c4294, var_87048abd, var_dd55685a)
{
	elem = new class_a0b518ca();
	[[ elem ]]->setup_clientfields(var_4bf38eea, var_7cc0b11d, var_14431277, var_db1c4294, var_87048abd, var_dd55685a);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"hash_53727b8181275445"]))
	{
		level.var_ae746e8f[#"hash_53727b8181275445"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"hash_53727b8181275445"]))
	{
		level.var_ae746e8f[#"hash_53727b8181275445"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"hash_53727b8181275445"]))
	{
		level.var_ae746e8f[#"hash_53727b8181275445"] = array(level.var_ae746e8f[#"hash_53727b8181275445"]);
	}
	level.var_ae746e8f[#"hash_53727b8181275445"][level.var_ae746e8f[#"hash_53727b8181275445"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: namespace_72133e5
	Checksum: 0x715F0657
	Offset: 0x2E0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_a0b518ca();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: namespace_72133e5
	Checksum: 0xB48954B
	Offset: 0x320
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
	Namespace: namespace_72133e5
	Checksum: 0x1F89F37C
	Offset: 0x348
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
	Namespace: namespace_72133e5
	Checksum: 0x68A997EB
	Offset: 0x370
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: function_62264c81
	Namespace: namespace_72133e5
	Checksum: 0xFB1617AF
	Offset: 0x398
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_62264c81(localclientnum, value)
{
	[[ self ]]->function_62264c81(localclientnum, value);
}

/*
	Name: function_a04ff29a
	Namespace: namespace_72133e5
	Checksum: 0x55D47F1F
	Offset: 0x3C8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_a04ff29a(localclientnum, value)
{
	[[ self ]]->function_a04ff29a(localclientnum, value);
}

/*
	Name: function_a59aefa6
	Namespace: namespace_72133e5
	Checksum: 0x979D2497
	Offset: 0x3F8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_a59aefa6(localclientnum, value)
{
	[[ self ]]->function_a59aefa6(localclientnum, value);
}

/*
	Name: function_a95c34f3
	Namespace: namespace_72133e5
	Checksum: 0xAB8A1C2
	Offset: 0x428
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_a95c34f3(localclientnum, value)
{
	[[ self ]]->function_a95c34f3(localclientnum, value);
}

/*
	Name: function_751f7270
	Namespace: namespace_72133e5
	Checksum: 0x2A676EA9
	Offset: 0x458
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_751f7270(localclientnum, value)
{
	[[ self ]]->function_751f7270(localclientnum, value);
}

/*
	Name: function_338d48a0
	Namespace: namespace_72133e5
	Checksum: 0x64D1EE95
	Offset: 0x488
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_338d48a0(localclientnum, value)
{
	[[ self ]]->function_338d48a0(localclientnum, value);
}

