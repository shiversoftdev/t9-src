#using scripts\core_common\lui_shared.csc;

class class_1a456b75 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_1a456b75
		Checksum: 0x7DE0B810
		Offset: 0x428
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_1a456b75
		Checksum: 0x6CFCADAA
		Offset: 0x678
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_1a456b75
		Checksum: 0x40220C7F
		Offset: 0x568
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_3b1f1b69
		Namespace: namespace_1a456b75
		Checksum: 0x4CCC11ED
		Offset: 0x598
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_3b1f1b69(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "progFracA", value);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_1a456b75
		Checksum: 0xDBD45BBF
		Offset: 0x490
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("sr_objective_secure_hud");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_1a456b75
		Checksum: 0x76C915FF
		Offset: 0x448
		Size: 0x3C
		Parameters: 4
		Flags: None
	*/
	function setup_clientfields(var_62534560, var_de4b1193, var_b661e7d8, var_2c613188)
	{
		namespace_6aaccc24::setup_clientfields("sr_objective_secure_hud");
	}

	/*
		Name: function_a1cd68d0
		Namespace: namespace_1a456b75
		Checksum: 0xE59C0345
		Offset: 0x5D0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_a1cd68d0(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "progFracB", value);
	}

	/*
		Name: function_d2f341fe
		Namespace: namespace_1a456b75
		Checksum: 0x9306C77A
		Offset: 0x608
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_d2f341fe(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "objectiveWhiteA", value);
	}

	/*
		Name: function_e4a4e561
		Namespace: namespace_1a456b75
		Checksum: 0x3FA1AF64
		Offset: 0x640
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_e4a4e561(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "objectiveWhiteB", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_1a456b75
		Checksum: 0x8BF7C11F
		Offset: 0x4B8
		Size: 0xA4
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "progFracA", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "progFracB", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "objectiveWhiteA", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "objectiveWhiteB", 0);
	}

}

#namespace namespace_30e191ea;

/*
	Name: function_5a723dd2
	Namespace: namespace_30e191ea
	Checksum: 0x4EEFAB08
	Offset: 0xF0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5a723dd2()
{
	level notify(1467016351);
}

/*
	Name: register
	Namespace: namespace_30e191ea
	Checksum: 0x5BFE41BC
	Offset: 0x110
	Size: 0x196
	Parameters: 4
	Flags: None
*/
function register(var_62534560, var_de4b1193, var_b661e7d8, var_2c613188)
{
	elem = new class_1a456b75();
	[[ elem ]]->setup_clientfields(var_62534560, var_de4b1193, var_b661e7d8, var_2c613188);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"hash_2005a876548b4b56"]))
	{
		level.var_ae746e8f[#"hash_2005a876548b4b56"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"hash_2005a876548b4b56"]))
	{
		level.var_ae746e8f[#"hash_2005a876548b4b56"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"hash_2005a876548b4b56"]))
	{
		level.var_ae746e8f[#"hash_2005a876548b4b56"] = array(level.var_ae746e8f[#"hash_2005a876548b4b56"]);
	}
	level.var_ae746e8f[#"hash_2005a876548b4b56"][level.var_ae746e8f[#"hash_2005a876548b4b56"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: namespace_30e191ea
	Checksum: 0xB3504105
	Offset: 0x2B0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_1a456b75();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: namespace_30e191ea
	Checksum: 0xB9E73D81
	Offset: 0x2F0
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
	Namespace: namespace_30e191ea
	Checksum: 0x6F5221DB
	Offset: 0x318
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
	Namespace: namespace_30e191ea
	Checksum: 0xA104C566
	Offset: 0x340
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: function_3b1f1b69
	Namespace: namespace_30e191ea
	Checksum: 0xD05D616A
	Offset: 0x368
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_3b1f1b69(localclientnum, value)
{
	[[ self ]]->function_3b1f1b69(localclientnum, value);
}

/*
	Name: function_a1cd68d0
	Namespace: namespace_30e191ea
	Checksum: 0xA8046A4C
	Offset: 0x398
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_a1cd68d0(localclientnum, value)
{
	[[ self ]]->function_a1cd68d0(localclientnum, value);
}

/*
	Name: function_d2f341fe
	Namespace: namespace_30e191ea
	Checksum: 0x95128040
	Offset: 0x3C8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_d2f341fe(localclientnum, value)
{
	[[ self ]]->function_d2f341fe(localclientnum, value);
}

/*
	Name: function_e4a4e561
	Namespace: namespace_30e191ea
	Checksum: 0x9D76353E
	Offset: 0x3F8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_e4a4e561(localclientnum, value)
{
	[[ self ]]->function_e4a4e561(localclientnum, value);
}

