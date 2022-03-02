#using scripts\core_common\lui_shared.csc;

class class_e5d48e46 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_e5d48e46
		Checksum: 0x3B6F9BE4
		Offset: 0x3F0
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
		Checksum: 0x6C645E71
		Offset: 0x7D0
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
		Checksum: 0x44524308
		Offset: 0x668
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
		Checksum: 0x784FC58D
		Offset: 0x5C0
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
		Checksum: 0xC9116EDD
		Offset: 0x758
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
		Checksum: 0xB48E27C2
		Offset: 0x6E0
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
		Checksum: 0x19EB9362
		Offset: 0x4F8
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
		Checksum: 0x771768F4
		Offset: 0x410
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
		Checksum: 0x983CE65B
		Offset: 0x5F0
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
		Checksum: 0x54F19A54
		Offset: 0x520
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
	Name: register
	Namespace: scavenger_icon
	Checksum: 0x48C22E18
	Offset: 0xF8
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
	Checksum: 0xA6A979DD
	Offset: 0x298
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
	Checksum: 0xD47B7FEE
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
	Namespace: scavenger_icon
	Checksum: 0x4C7D16E2
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
	Namespace: scavenger_icon
	Checksum: 0xA16BCE07
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
	Name: function_e4e9c303
	Namespace: scavenger_icon
	Checksum: 0x1CF3C4A1
	Offset: 0x350
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
	Checksum: 0xE85D389
	Offset: 0x378
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
	Checksum: 0x132116BF
	Offset: 0x3A0
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
	Checksum: 0x8A2D5848
	Offset: 0x3C8
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function function_417df30c(localclientnum)
{
	[[ self ]]->function_417df30c(localclientnum);
}

