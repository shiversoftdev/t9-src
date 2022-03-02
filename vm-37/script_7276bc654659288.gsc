#using scripts\core_common\lui_shared.csc;

class class_ab111f2c : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_ab111f2c
		Checksum: 0x8DD87CCB
		Offset: 0x3F8
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_ab111f2c
		Checksum: 0x74C2EEDF
		Offset: 0x7A0
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_ab111f2c
		Checksum: 0xD603B82B
		Offset: 0x5D0
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_1c78fe1e
		Namespace: namespace_ab111f2c
		Checksum: 0x2130E7E
		Offset: 0x6B0
		Size: 0x6C
		Parameters: 1
		Flags: None
	*/
	function function_1c78fe1e(localclientnum)
	{
		current_val = [[ self ]]->function_92ba69fa(localclientnum, "fadeout");
		new_val = (current_val + 1) % 2;
		[[ self ]]->function_d7d2fcce(localclientnum, "fadeout", new_val);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_ab111f2c
		Checksum: 0xB6DE3C6D
		Offset: 0x500
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("cp_hint_text");
	}

	/*
		Name: function_64d95cad
		Namespace: namespace_ab111f2c
		Checksum: 0xA491BCD8
		Offset: 0x638
		Size: 0x6C
		Parameters: 1
		Flags: None
	*/
	function function_64d95cad(localclientnum)
	{
		current_val = [[ self ]]->function_92ba69fa(localclientnum, "display_blink");
		new_val = (current_val + 1) % 2;
		[[ self ]]->function_d7d2fcce(localclientnum, "display_blink", new_val);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_ab111f2c
		Checksum: 0x1301DDFC
		Offset: 0x418
		Size: 0xDC
		Parameters: 4
		Flags: None
	*/
	function setup_clientfields(var_4f361551, var_8f133ca4, var_b38e91b5, var_101d8535)
	{
		namespace_6aaccc24::setup_clientfields("cp_hint_text");
		namespace_6aaccc24::function_dcb34c80("string", "hint_text", 1);
		namespace_6aaccc24::function_da693cbe("display_blink", 1, 1, "counter", var_8f133ca4);
		namespace_6aaccc24::function_da693cbe("fadeout", 1, 1, "counter", var_b38e91b5);
		namespace_6aaccc24::function_da693cbe("display_noblink", 1, 1, "counter", var_101d8535);
	}

	/*
		Name: function_a16f86c1
		Namespace: namespace_ab111f2c
		Checksum: 0x8D24C80D
		Offset: 0x600
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_a16f86c1(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "hint_text", value);
	}

	/*
		Name: function_a981d6b6
		Namespace: namespace_ab111f2c
		Checksum: 0x25818226
		Offset: 0x728
		Size: 0x6C
		Parameters: 1
		Flags: None
	*/
	function function_a981d6b6(localclientnum)
	{
		current_val = [[ self ]]->function_92ba69fa(localclientnum, "display_noblink");
		new_val = (current_val + 1) % 2;
		[[ self ]]->function_d7d2fcce(localclientnum, "display_noblink", new_val);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_ab111f2c
		Checksum: 0xCC66457A
		Offset: 0x528
		Size: 0xA0
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "hint_text", #"");
		[[ self ]]->function_d7d2fcce(localclientnum, "display_blink", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "fadeout", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "display_noblink", 0);
	}

}

#namespace cp_hint_text;

/*
	Name: register
	Namespace: cp_hint_text
	Checksum: 0x8B8957C
	Offset: 0xF8
	Size: 0x196
	Parameters: 4
	Flags: None
*/
function register(var_4f361551, var_8f133ca4, var_b38e91b5, var_101d8535)
{
	elem = new class_ab111f2c();
	[[ elem ]]->setup_clientfields(var_4f361551, var_8f133ca4, var_b38e91b5, var_101d8535);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"cp_hint_text"]))
	{
		level.var_ae746e8f[#"cp_hint_text"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"cp_hint_text"]))
	{
		level.var_ae746e8f[#"cp_hint_text"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"cp_hint_text"]))
	{
		level.var_ae746e8f[#"cp_hint_text"] = array(level.var_ae746e8f[#"cp_hint_text"]);
	}
	level.var_ae746e8f[#"cp_hint_text"][level.var_ae746e8f[#"cp_hint_text"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: cp_hint_text
	Checksum: 0xE4EA823E
	Offset: 0x298
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_ab111f2c();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: cp_hint_text
	Checksum: 0x9E374032
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
	Namespace: cp_hint_text
	Checksum: 0x5DCF4BBE
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
	Namespace: cp_hint_text
	Checksum: 0xD3C43F00
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
	Name: function_a16f86c1
	Namespace: cp_hint_text
	Checksum: 0xB92D3D45
	Offset: 0x350
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_a16f86c1(localclientnum, value)
{
	[[ self ]]->function_a16f86c1(localclientnum, value);
}

/*
	Name: function_64d95cad
	Namespace: cp_hint_text
	Checksum: 0xF2056AF6
	Offset: 0x380
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function function_64d95cad(localclientnum)
{
	[[ self ]]->function_64d95cad(localclientnum);
}

/*
	Name: function_1c78fe1e
	Namespace: cp_hint_text
	Checksum: 0x92EA3905
	Offset: 0x3A8
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function function_1c78fe1e(localclientnum)
{
	[[ self ]]->function_1c78fe1e(localclientnum);
}

/*
	Name: function_a981d6b6
	Namespace: cp_hint_text
	Checksum: 0x1A750132
	Offset: 0x3D0
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function function_a981d6b6(localclientnum)
{
	[[ self ]]->function_a981d6b6(localclientnum);
}

