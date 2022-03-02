#using scripts\core_common\lui_shared.csc;

class class_a19c3039 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_a19c3039
		Checksum: 0x467B1168
		Offset: 0x2E0
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_a19c3039
		Checksum: 0x143F04C3
		Offset: 0x3B0
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_a19c3039
		Checksum: 0x120E04A5
		Offset: 0x380
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
		Namespace: namespace_a19c3039
		Checksum: 0x3F426332
		Offset: 0x328
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("sr_perk_machine_choice");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_a19c3039
		Checksum: 0xB43775F5
		Offset: 0x300
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("sr_perk_machine_choice");
	}

	/*
		Name: function_fa582112
		Namespace: namespace_a19c3039
		Checksum: 0xB96C3F2B
		Offset: 0x350
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
	}

}

#namespace sr_perk_machine_choice;

/*
	Name: register
	Namespace: sr_perk_machine_choice
	Checksum: 0x6C61521E
	Offset: 0xB0
	Size: 0x16E
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new class_a19c3039();
	[[ elem ]]->setup_clientfields();
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"sr_perk_machine_choice"]))
	{
		level.var_ae746e8f[#"sr_perk_machine_choice"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"sr_perk_machine_choice"]))
	{
		level.var_ae746e8f[#"sr_perk_machine_choice"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"sr_perk_machine_choice"]))
	{
		level.var_ae746e8f[#"sr_perk_machine_choice"] = array(level.var_ae746e8f[#"sr_perk_machine_choice"]);
	}
	level.var_ae746e8f[#"sr_perk_machine_choice"][level.var_ae746e8f[#"sr_perk_machine_choice"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: sr_perk_machine_choice
	Checksum: 0x62338E08
	Offset: 0x228
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_a19c3039();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: sr_perk_machine_choice
	Checksum: 0xFA87EE0E
	Offset: 0x268
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
	Namespace: sr_perk_machine_choice
	Checksum: 0x7C6BAA87
	Offset: 0x290
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
	Namespace: sr_perk_machine_choice
	Checksum: 0xF5E5C0E0
	Offset: 0x2B8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

