#using scripts\core_common\lui_shared.csc;

class cscavenger_icon : cluielem
{

	/*
		Name: constructor
		Namespace: cscavenger_icon
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
		Namespace: cscavenger_icon
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
		Namespace: cscavenger_icon
		Checksum: 0x44524308
		Offset: 0x668
		Size: 0x6C
		Parameters: 1
		Flags: Linked
	*/
	function function_65b281a(localclientnum)
	{
		current_val = [[ self ]]->get_data(localclientnum, "armorPlatePulse");
		new_val = (current_val + 1) % 2;
		[[ self ]]->set_data(localclientnum, "armorPlatePulse", new_val);
	}

	/*
		Name: open
		Namespace: cscavenger_icon
		Checksum: 0x784FC58D
		Offset: 0x5C0
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: function_417df30c
		Namespace: cscavenger_icon
		Checksum: 0xC9116EDD
		Offset: 0x758
		Size: 0x6C
		Parameters: 1
		Flags: Linked
	*/
	function function_417df30c(localclientnum)
	{
		current_val = [[ self ]]->get_data(localclientnum, "rareScrapPulse");
		new_val = (current_val + 1) % 2;
		[[ self ]]->set_data(localclientnum, "rareScrapPulse", new_val);
	}

	/*
		Name: function_47e82a09
		Namespace: cscavenger_icon
		Checksum: 0xB48E27C2
		Offset: 0x6E0
		Size: 0x6C
		Parameters: 1
		Flags: Linked
	*/
	function function_47e82a09(localclientnum)
	{
		current_val = [[ self ]]->get_data(localclientnum, "scrapPulse");
		new_val = (current_val + 1) % 2;
		[[ self ]]->set_data(localclientnum, "scrapPulse", new_val);
	}

	/*
		Name: register_clientside
		Namespace: cscavenger_icon
		Checksum: 0x19EB9362
		Offset: 0x4F8
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function register_clientside()
	{
		cluielem::register_clientside("scavenger_icon");
	}

	/*
		Name: setup_clientfields
		Namespace: cscavenger_icon
		Checksum: 0x771768F4
		Offset: 0x410
		Size: 0xDC
		Parameters: 4
		Flags: Linked
	*/
	function setup_clientfields(var_c21a7363, var_acffa825, var_32c73fea, var_d239de43)
	{
		cluielem::setup_clientfields("scavenger_icon");
		cluielem::add_clientfield("ammoPulse", 1, 1, "counter", var_c21a7363);
		cluielem::add_clientfield("armorPlatePulse", 1, 1, "counter", var_acffa825);
		cluielem::add_clientfield("scrapPulse", 1, 1, "counter", var_32c73fea);
		cluielem::add_clientfield("rareScrapPulse", 4000, 1, "counter", var_d239de43);
	}

	/*
		Name: function_e4e9c303
		Namespace: cscavenger_icon
		Checksum: 0x983CE65B
		Offset: 0x5F0
		Size: 0x6C
		Parameters: 1
		Flags: Linked
	*/
	function function_e4e9c303(localclientnum)
	{
		current_val = [[ self ]]->get_data(localclientnum, "ammoPulse");
		new_val = (current_val + 1) % 2;
		[[ self ]]->set_data(localclientnum, "ammoPulse", new_val);
	}

	/*
		Name: function_fa582112
		Namespace: cscavenger_icon
		Checksum: 0x54F19A54
		Offset: 0x520
		Size: 0x94
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "ammoPulse", 0);
		[[ self ]]->set_data(localclientnum, "armorPlatePulse", 0);
		[[ self ]]->set_data(localclientnum, "scrapPulse", 0);
		[[ self ]]->set_data(localclientnum, "rareScrapPulse", 0);
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
	elem = new cscavenger_icon();
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
	Name: register_clientside
	Namespace: scavenger_icon
	Checksum: 0xA6A979DD
	Offset: 0x298
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new cscavenger_icon();
	[[ elem ]]->register_clientside();
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

