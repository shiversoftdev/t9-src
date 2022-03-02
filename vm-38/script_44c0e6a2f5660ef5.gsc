#using scripts\core_common\lui_shared.csc;

class class_f91fc158 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_f91fc158
		Checksum: 0x244E4AA3
		Offset: 0x3E0
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_f91fc158
		Checksum: 0x72F03CDC
		Offset: 0x648
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_f91fc158
		Checksum: 0x2B05C345
		Offset: 0x570
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
		Namespace: namespace_f91fc158
		Checksum: 0xBDE8DD87
		Offset: 0x4B8
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("zm_roots_health_bar");
	}

	/*
		Name: function_74adcd8a
		Namespace: namespace_f91fc158
		Checksum: 0xB8DDF899
		Offset: 0x610
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_74adcd8a(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "armor_vis", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_f91fc158
		Checksum: 0x6A054CF4
		Offset: 0x400
		Size: 0xAC
		Parameters: 3
		Flags: Linked
	*/
	function setup_clientfields(var_663a86fa, var_4ec2b207, var_ed81ff07)
	{
		namespace_6aaccc24::setup_clientfields("zm_roots_health_bar");
		namespace_6aaccc24::function_da693cbe("health", 4000, 7, "float", var_663a86fa);
		namespace_6aaccc24::function_da693cbe("armor", 4000, 7, "float", var_4ec2b207);
		namespace_6aaccc24::function_da693cbe("armor_vis", 4000, 1, "int", var_ed81ff07);
	}

	/*
		Name: set_armor
		Namespace: namespace_f91fc158
		Checksum: 0x4C5CE9B9
		Offset: 0x5D8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_armor(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "armor", value);
	}

	/*
		Name: set_health
		Namespace: namespace_f91fc158
		Checksum: 0xFF55EAE
		Offset: 0x5A0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_health(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "health", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_f91fc158
		Checksum: 0xB16A7852
		Offset: 0x4E0
		Size: 0x88
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "health", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "armor", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "armor_vis", 0);
	}

}

#namespace namespace_fb27ba0b;

/*
	Name: function_3c951193
	Namespace: namespace_fb27ba0b
	Checksum: 0x2E7C2356
	Offset: 0xE0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_3c951193()
{
	level notify(2050894685);
}

/*
	Name: register
	Namespace: namespace_fb27ba0b
	Checksum: 0xF0CD6A7F
	Offset: 0x100
	Size: 0x18E
	Parameters: 3
	Flags: Linked
*/
function register(var_663a86fa, var_4ec2b207, var_ed81ff07)
{
	elem = new class_f91fc158();
	[[ elem ]]->setup_clientfields(var_663a86fa, var_4ec2b207, var_ed81ff07);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"hash_3c23185e6b098063"]))
	{
		level.var_ae746e8f[#"hash_3c23185e6b098063"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"hash_3c23185e6b098063"]))
	{
		level.var_ae746e8f[#"hash_3c23185e6b098063"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"hash_3c23185e6b098063"]))
	{
		level.var_ae746e8f[#"hash_3c23185e6b098063"] = array(level.var_ae746e8f[#"hash_3c23185e6b098063"]);
	}
	level.var_ae746e8f[#"hash_3c23185e6b098063"][level.var_ae746e8f[#"hash_3c23185e6b098063"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: namespace_fb27ba0b
	Checksum: 0xFABB66BF
	Offset: 0x298
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_f91fc158();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: namespace_fb27ba0b
	Checksum: 0xC5ABC4DD
	Offset: 0x2D8
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
	Namespace: namespace_fb27ba0b
	Checksum: 0x5109DAB0
	Offset: 0x300
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
	Namespace: namespace_fb27ba0b
	Checksum: 0x16B5421B
	Offset: 0x328
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_health
	Namespace: namespace_fb27ba0b
	Checksum: 0xCE60EA1D
	Offset: 0x350
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_health(localclientnum, value)
{
	[[ self ]]->set_health(localclientnum, value);
}

/*
	Name: set_armor
	Namespace: namespace_fb27ba0b
	Checksum: 0xEBD4F0D3
	Offset: 0x380
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_armor(localclientnum, value)
{
	[[ self ]]->set_armor(localclientnum, value);
}

/*
	Name: function_74adcd8a
	Namespace: namespace_fb27ba0b
	Checksum: 0xC0B2B6E
	Offset: 0x3B0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_74adcd8a(localclientnum, value)
{
	[[ self ]]->function_74adcd8a(localclientnum, value);
}

