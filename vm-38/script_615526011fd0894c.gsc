#using scripts\core_common\lui_shared.csc;

class class_1a456b75 : cluielem
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
		cluielem::open(localclientnum);
	}

	/*
		Name: set_progfraca
		Namespace: namespace_1a456b75
		Checksum: 0x4CCC11ED
		Offset: 0x598
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_progfraca(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "progFracA", value);
	}

	/*
		Name: register_clientside
		Namespace: namespace_1a456b75
		Checksum: 0xDBD45BBF
		Offset: 0x490
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("sr_objective_secure_hud");
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
		cluielem::setup_clientfields("sr_objective_secure_hud");
	}

	/*
		Name: set_progfracb
		Namespace: namespace_1a456b75
		Checksum: 0xE59C0345
		Offset: 0x5D0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_progfracb(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "progFracB", value);
	}

	/*
		Name: set_objectivewhitea
		Namespace: namespace_1a456b75
		Checksum: 0x9306C77A
		Offset: 0x608
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_objectivewhitea(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "objectiveWhiteA", value);
	}

	/*
		Name: set_objectivewhiteb
		Namespace: namespace_1a456b75
		Checksum: 0x3FA1AF64
		Offset: 0x640
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_objectivewhiteb(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "objectiveWhiteB", value);
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
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "progFracA", 0);
		[[ self ]]->set_data(localclientnum, "progFracB", 0);
		[[ self ]]->set_data(localclientnum, "objectiveWhiteA", 0);
		[[ self ]]->set_data(localclientnum, "objectiveWhiteB", 0);
	}

}

#namespace sr_objective_secure_hud;

/*
	Name: function_5a723dd2
	Namespace: sr_objective_secure_hud
	Checksum: 0x4EEFAB08
	Offset: 0xF0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5a723dd2()
{
	level notify(-1467016351);
}

/*
	Name: register
	Namespace: sr_objective_secure_hud
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
	if(!isdefined(level.var_ae746e8f[#"sr_objective_secure_hud"]))
	{
		level.var_ae746e8f[#"sr_objective_secure_hud"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"sr_objective_secure_hud"]))
	{
		level.var_ae746e8f[#"sr_objective_secure_hud"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"sr_objective_secure_hud"]))
	{
		level.var_ae746e8f[#"sr_objective_secure_hud"] = array(level.var_ae746e8f[#"sr_objective_secure_hud"]);
	}
	level.var_ae746e8f[#"sr_objective_secure_hud"][level.var_ae746e8f[#"sr_objective_secure_hud"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: sr_objective_secure_hud
	Checksum: 0xB3504105
	Offset: 0x2B0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new class_1a456b75();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: sr_objective_secure_hud
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
	Namespace: sr_objective_secure_hud
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
	Namespace: sr_objective_secure_hud
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
	Name: set_progfraca
	Namespace: sr_objective_secure_hud
	Checksum: 0xD05D616A
	Offset: 0x368
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_progfraca(localclientnum, value)
{
	[[ self ]]->set_progfraca(localclientnum, value);
}

/*
	Name: set_progfracb
	Namespace: sr_objective_secure_hud
	Checksum: 0xA8046A4C
	Offset: 0x398
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_progfracb(localclientnum, value)
{
	[[ self ]]->set_progfracb(localclientnum, value);
}

/*
	Name: set_objectivewhitea
	Namespace: sr_objective_secure_hud
	Checksum: 0x95128040
	Offset: 0x3C8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_objectivewhitea(localclientnum, value)
{
	[[ self ]]->set_objectivewhitea(localclientnum, value);
}

/*
	Name: set_objectivewhiteb
	Namespace: sr_objective_secure_hud
	Checksum: 0x9D76353E
	Offset: 0x3F8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_objectivewhiteb(localclientnum, value)
{
	[[ self ]]->set_objectivewhiteb(localclientnum, value);
}

