#using scripts\core_common\lui_shared.csc;

class class_ab111f2c : cluielem
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
		cluielem::open(localclientnum);
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
		current_val = [[ self ]]->get_data(localclientnum, "fadeout");
		new_val = (current_val + 1) % 2;
		[[ self ]]->set_data(localclientnum, "fadeout", new_val);
	}

	/*
		Name: register_clientside
		Namespace: namespace_ab111f2c
		Checksum: 0xB6DE3C6D
		Offset: 0x500
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("cp_hint_text");
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
		current_val = [[ self ]]->get_data(localclientnum, "display_blink");
		new_val = (current_val + 1) % 2;
		[[ self ]]->set_data(localclientnum, "display_blink", new_val);
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
		cluielem::setup_clientfields("cp_hint_text");
		cluielem::function_dcb34c80("string", "hint_text", 1);
		cluielem::add_clientfield("display_blink", 1, 1, "counter", var_8f133ca4);
		cluielem::add_clientfield("fadeout", 1, 1, "counter", var_b38e91b5);
		cluielem::add_clientfield("display_noblink", 1, 1, "counter", var_101d8535);
	}

	/*
		Name: set_hint_text
		Namespace: namespace_ab111f2c
		Checksum: 0x8D24C80D
		Offset: 0x600
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_hint_text(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "hint_text", value);
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
		current_val = [[ self ]]->get_data(localclientnum, "display_noblink");
		new_val = (current_val + 1) % 2;
		[[ self ]]->set_data(localclientnum, "display_noblink", new_val);
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
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "hint_text", #"");
		[[ self ]]->set_data(localclientnum, "display_blink", 0);
		[[ self ]]->set_data(localclientnum, "fadeout", 0);
		[[ self ]]->set_data(localclientnum, "display_noblink", 0);
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
	Name: register_clientside
	Namespace: cp_hint_text
	Checksum: 0xE4EA823E
	Offset: 0x298
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new class_ab111f2c();
	[[ elem ]]->register_clientside();
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
	Name: set_hint_text
	Namespace: cp_hint_text
	Checksum: 0xB92D3D45
	Offset: 0x350
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_hint_text(localclientnum, value)
{
	[[ self ]]->set_hint_text(localclientnum, value);
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

