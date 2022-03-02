#using scripts\core_common\lui_shared.csc;

class class_e5d48e46 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_e5d48e46
		Checksum: 0x70C4EE11
		Offset: 0x410
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_e5d48e46
		Checksum: 0x77D1B4D3
		Offset: 0x7F0
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: function_65b281a
		Namespace: namespace_e5d48e46
		Checksum: 0x731937F2
		Offset: 0x688
		Size: 0x6C
		Parameters: 1
		Flags: Linked
	*/
	function function_65b281a(localclientnum)
	{
		current_val = [[ self ]]->function_92ba69fa(localclientnum, "armorPlatePulse");
		new_val = (current_val + 1) % 2;
		[[ self ]]->function_d7d2fcce(localclientnum, "armorPlatePulse", new_val);
	}

	/*
		Name: open
		Namespace: namespace_e5d48e46
		Checksum: 0x9E331489
		Offset: 0x5E0
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_417df30c
		Namespace: namespace_e5d48e46
		Checksum: 0xA65878F1
		Offset: 0x778
		Size: 0x6C
		Parameters: 1
		Flags: Linked
	*/
	function function_417df30c(localclientnum)
	{
		current_val = [[ self ]]->function_92ba69fa(localclientnum, "rareScrapPulse");
		new_val = (current_val + 1) % 2;
		[[ self ]]->function_d7d2fcce(localclientnum, "rareScrapPulse", new_val);
	}

	/*
		Name: function_47e82a09
		Namespace: namespace_e5d48e46
		Checksum: 0x9FD56A
		Offset: 0x700
		Size: 0x6C
		Parameters: 1
		Flags: Linked
	*/
	function function_47e82a09(localclientnum)
	{
		current_val = [[ self ]]->function_92ba69fa(localclientnum, "scrapPulse");
		new_val = (current_val + 1) % 2;
		[[ self ]]->function_d7d2fcce(localclientnum, "scrapPulse", new_val);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_e5d48e46
		Checksum: 0x6319BC2C
		Offset: 0x518
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("scavenger_icon");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_e5d48e46
		Checksum: 0x405AB23B
		Offset: 0x430
		Size: 0xDC
		Parameters: 4
		Flags: Linked
	*/
	function setup_clientfields(var_c21a7363, var_acffa825, var_32c73fea, var_d239de43)
	{
		namespace_6aaccc24::setup_clientfields("scavenger_icon");
		namespace_6aaccc24::function_da693cbe("ammoPulse", 1, 1, "counter", var_c21a7363);
		namespace_6aaccc24::function_da693cbe("armorPlatePulse", 1, 1, "counter", var_acffa825);
		namespace_6aaccc24::function_da693cbe("scrapPulse", 1, 1, "counter", var_32c73fea);
		namespace_6aaccc24::function_da693cbe("rareScrapPulse", 4000, 1, "counter", var_d239de43);
	}

	/*
		Name: function_e4e9c303
		Namespace: namespace_e5d48e46
		Checksum: 0x8BA0B740
		Offset: 0x610
		Size: 0x6C
		Parameters: 1
		Flags: Linked
	*/
	function function_e4e9c303(localclientnum)
	{
		current_val = [[ self ]]->function_92ba69fa(localclientnum, "ammoPulse");
		new_val = (current_val + 1) % 2;
		[[ self ]]->function_d7d2fcce(localclientnum, "ammoPulse", new_val);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_e5d48e46
		Checksum: 0x2E6E267C
		Offset: 0x540
		Size: 0x94
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "ammoPulse", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "armorPlatePulse", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "scrapPulse", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "rareScrapPulse", 0);
	}

}

#namespace scavenger_icon;

/*
	Name: function_f9a9c71d
	Namespace: scavenger_icon
	Checksum: 0x595315F2
	Offset: 0xF8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f9a9c71d()
{
	level notify(1049016570);
}

/*
	Name: register
	Namespace: scavenger_icon
	Checksum: 0xEC129DD5
	Offset: 0x118
	Size: 0x196
	Parameters: 4
	Flags: Linked
*/
function register(var_c21a7363, var_acffa825, var_32c73fea, var_d239de43)
{
	elem = new class_e5d48e46();
	[[ elem ]]->setup_clientfields(var_c21a7363, var_acffa825, var_32c73fea, var_d239de43);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"scavenger_icon"]))
	{
		level.var_ae746e8f[#"scavenger_icon"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"scavenger_icon"]))
	{
		level.var_ae746e8f[#"scavenger_icon"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"scavenger_icon"]))
	{
		level.var_ae746e8f[#"scavenger_icon"] = array(level.var_ae746e8f[#"scavenger_icon"]);
	}
	level.var_ae746e8f[#"scavenger_icon"][level.var_ae746e8f[#"scavenger_icon"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: scavenger_icon
	Checksum: 0xA1DDFD1F
	Offset: 0x2B8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_e5d48e46();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: scavenger_icon
	Checksum: 0x2517E541
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
	Namespace: scavenger_icon
	Checksum: 0x34EADF50
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
	Namespace: scavenger_icon
	Checksum: 0x813CD002
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
	Name: function_e4e9c303
	Namespace: scavenger_icon
	Checksum: 0xF1F9B11F
	Offset: 0x370
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function function_e4e9c303(localclientnum)
{
	[[ self ]]->function_e4e9c303(localclientnum);
}

/*
	Name: function_65b281a
	Namespace: scavenger_icon
	Checksum: 0x5565409E
	Offset: 0x398
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function function_65b281a(localclientnum)
{
	[[ self ]]->function_65b281a(localclientnum);
}

/*
	Name: function_47e82a09
	Namespace: scavenger_icon
	Checksum: 0x3A8EB503
	Offset: 0x3C0
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function function_47e82a09(localclientnum)
{
	[[ self ]]->function_47e82a09(localclientnum);
}

/*
	Name: function_417df30c
	Namespace: scavenger_icon
	Checksum: 0x924D14E2
	Offset: 0x3E8
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function function_417df30c(localclientnum)
{
	[[ self ]]->function_417df30c(localclientnum);
}

