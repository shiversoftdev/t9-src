#using scripts\core_common\lui_shared.csc;

class cconsequences_notification : cluielem
{

	/*
		Name: constructor
		Namespace: cconsequences_notification
		Checksum: 0xC0A6ABC9
		Offset: 0x378
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cconsequences_notification
		Checksum: 0x2EC21205
		Offset: 0x550
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cconsequences_notification
		Checksum: 0x77EE885D
		Offset: 0x4B0
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: register_clientside
		Namespace: cconsequences_notification
		Checksum: 0x3DF2C520
		Offset: 0x420
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("consequences_notification");
	}

	/*
		Name: setup_clientfields
		Namespace: cconsequences_notification
		Checksum: 0x1EC39CF0
		Offset: 0x398
		Size: 0x7C
		Parameters: 2
		Flags: None
	*/
	function setup_clientfields(var_6ad1a3bb, var_b8233aa2)
	{
		cluielem::setup_clientfields("consequences_notification");
		cluielem::add_clientfield("visible", 1, 1, "int", var_6ad1a3bb);
		cluielem::add_clientfield("content_index", 1, 4, "int", var_b8233aa2);
	}

	/*
		Name: set_content_index
		Namespace: cconsequences_notification
		Checksum: 0x90B6CA86
		Offset: 0x518
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_content_index(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "content_index", value);
	}

	/*
		Name: set_visible
		Namespace: cconsequences_notification
		Checksum: 0xDDCE1E85
		Offset: 0x4E0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_visible(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "visible", value);
	}

	/*
		Name: function_fa582112
		Namespace: cconsequences_notification
		Checksum: 0xAE031439
		Offset: 0x448
		Size: 0x5C
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "visible", 0);
		[[ self ]]->set_data(localclientnum, "content_index", 0);
	}

}

#namespace consequences_notification;

/*
	Name: register
	Namespace: consequences_notification
	Checksum: 0x7D2F923
	Offset: 0xD8
	Size: 0x17E
	Parameters: 2
	Flags: None
*/
function register(var_6ad1a3bb, var_b8233aa2)
{
	elem = new cconsequences_notification();
	[[ elem ]]->setup_clientfields(var_6ad1a3bb, var_b8233aa2);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"consequences_notification"]))
	{
		level.var_ae746e8f[#"consequences_notification"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"consequences_notification"]))
	{
		level.var_ae746e8f[#"consequences_notification"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"consequences_notification"]))
	{
		level.var_ae746e8f[#"consequences_notification"] = array(level.var_ae746e8f[#"consequences_notification"]);
	}
	level.var_ae746e8f[#"consequences_notification"][level.var_ae746e8f[#"consequences_notification"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: consequences_notification
	Checksum: 0xFFBDCAED
	Offset: 0x260
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new cconsequences_notification();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: consequences_notification
	Checksum: 0xFBE067A2
	Offset: 0x2A0
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
	Namespace: consequences_notification
	Checksum: 0xF53814AC
	Offset: 0x2C8
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
	Namespace: consequences_notification
	Checksum: 0xF237DECB
	Offset: 0x2F0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_visible
	Namespace: consequences_notification
	Checksum: 0xB94E3884
	Offset: 0x318
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_visible(localclientnum, value)
{
	[[ self ]]->set_visible(localclientnum, value);
}

/*
	Name: set_content_index
	Namespace: consequences_notification
	Checksum: 0xA40D54B6
	Offset: 0x348
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_content_index(localclientnum, value)
{
	[[ self ]]->set_content_index(localclientnum, value);
}

