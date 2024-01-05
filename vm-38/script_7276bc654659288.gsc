#using scripts\core_common\lui_shared.csc;

class class_ab111f2c : cluielem
{

	/*
		Name: constructor
		Namespace: namespace_ab111f2c
		Checksum: 0x895D9D63
		Offset: 0x418
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_ab111f2c
		Checksum: 0xC5DF173
		Offset: 0x7C0
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_ab111f2c
		Checksum: 0x76AFE754
		Offset: 0x5F0
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: function_1c78fe1e
		Namespace: namespace_ab111f2c
		Checksum: 0x2A493AB8
		Offset: 0x6D0
		Size: 0x6C
		Parameters: 1
		Flags: Linked
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
		Checksum: 0x6A2ED9B6
		Offset: 0x520
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function register_clientside()
	{
		cluielem::register_clientside("cp_hint_text");
	}

	/*
		Name: function_64d95cad
		Namespace: namespace_ab111f2c
		Checksum: 0x46EF0C30
		Offset: 0x658
		Size: 0x6C
		Parameters: 1
		Flags: Linked
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
		Checksum: 0x9664DB8E
		Offset: 0x438
		Size: 0xDC
		Parameters: 4
		Flags: Linked
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
		Checksum: 0x60271853
		Offset: 0x620
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_hint_text(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "hint_text", value);
	}

	/*
		Name: function_a981d6b6
		Namespace: namespace_ab111f2c
		Checksum: 0x2D146011
		Offset: 0x748
		Size: 0x6C
		Parameters: 1
		Flags: Linked
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
		Checksum: 0x1EE4CEB
		Offset: 0x548
		Size: 0xA0
		Parameters: 1
		Flags: Linked
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
	Name: function_63b5114e
	Namespace: cp_hint_text
	Checksum: 0xE8E65FC9
	Offset: 0xF8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_63b5114e()
{
	level notify(-1854134345);
}

/*
	Name: register
	Namespace: cp_hint_text
	Checksum: 0x30372835
	Offset: 0x118
	Size: 0x196
	Parameters: 4
	Flags: Linked
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
	Checksum: 0xF7880D40
	Offset: 0x2B8
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
	Checksum: 0x7E49EABF
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
	Namespace: cp_hint_text
	Checksum: 0x4E86ABE3
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
	Namespace: cp_hint_text
	Checksum: 0x1EC1353B
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
	Name: set_hint_text
	Namespace: cp_hint_text
	Checksum: 0xE789A536
	Offset: 0x370
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
	Checksum: 0x1445E665
	Offset: 0x3A0
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
	Checksum: 0xD861F8FB
	Offset: 0x3C8
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
	Checksum: 0xD04CEA32
	Offset: 0x3F0
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function function_a981d6b6(localclientnum)
{
	[[ self ]]->function_a981d6b6(localclientnum);
}

