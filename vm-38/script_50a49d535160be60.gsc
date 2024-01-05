#using scripts\core_common\lui_shared.csc;

class czm_hint_text : cluielem
{

	/*
		Name: constructor
		Namespace: czm_hint_text
		Checksum: 0x71617B1E
		Offset: 0x380
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: czm_hint_text
		Checksum: 0x233DAE8
		Offset: 0x5E0
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: czm_hint_text
		Checksum: 0x2475CF17
		Offset: 0x4C0
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: register_clientside
		Namespace: czm_hint_text
		Checksum: 0x2702F1C4
		Offset: 0x420
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function register_clientside()
	{
		cluielem::register_clientside("zm_hint_text");
	}

	/*
		Name: setup_clientfields
		Namespace: czm_hint_text
		Checksum: 0x11A60DD1
		Offset: 0x3A0
		Size: 0x74
		Parameters: 1
		Flags: Linked
	*/
	function setup_clientfields(var_f5852d69)
	{
		cluielem::setup_clientfields("zm_hint_text");
		cluielem::add_clientfield("_state", 1, 1, "int");
		cluielem::function_dcb34c80("string", "text", 1);
	}

	/*
		Name: set_text
		Namespace: czm_hint_text
		Checksum: 0x63A9567
		Offset: 0x5A8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_text(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "text", value);
	}

	/*
		Name: set_state
		Namespace: czm_hint_text
		Checksum: 0x3464873D
		Offset: 0x4F0
		Size: 0xAC
		Parameters: 2
		Flags: Linked
	*/
	function set_state(localclientnum, state_name)
	{
		if(#"defaultstate" == state_name)
		{
			[[ self ]]->set_data(localclientnum, "_state", 0);
		}
		else
		{
			if(#"visible" == state_name)
			{
				[[ self ]]->set_data(localclientnum, "_state", 1);
			}
			else
			{
				/#
					assertmsg("");
				#/
				/#
				#/
			}
		}
	}

	/*
		Name: function_fa582112
		Namespace: czm_hint_text
		Checksum: 0x276C1C3E
		Offset: 0x448
		Size: 0x6C
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_state(localclientnum, #"defaultstate");
		[[ self ]]->set_data(localclientnum, "text", #"");
	}

}

#namespace zm_hint_text;

/*
	Name: function_90000b1a
	Namespace: zm_hint_text
	Checksum: 0x28FC6F60
	Offset: 0xC8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_90000b1a()
{
	level notify(-93375423);
}

/*
	Name: register
	Namespace: zm_hint_text
	Checksum: 0xD8B47B33
	Offset: 0xE8
	Size: 0x176
	Parameters: 1
	Flags: Linked
*/
function register(var_f5852d69)
{
	elem = new czm_hint_text();
	[[ elem ]]->setup_clientfields(var_f5852d69);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"zm_hint_text"]))
	{
		level.var_ae746e8f[#"zm_hint_text"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"zm_hint_text"]))
	{
		level.var_ae746e8f[#"zm_hint_text"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"zm_hint_text"]))
	{
		level.var_ae746e8f[#"zm_hint_text"] = array(level.var_ae746e8f[#"zm_hint_text"]);
	}
	level.var_ae746e8f[#"zm_hint_text"][level.var_ae746e8f[#"zm_hint_text"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: zm_hint_text
	Checksum: 0x82DE0225
	Offset: 0x268
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new czm_hint_text();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: zm_hint_text
	Checksum: 0x50C9B987
	Offset: 0x2A8
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
	Namespace: zm_hint_text
	Checksum: 0x1F42E9D6
	Offset: 0x2D0
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
	Namespace: zm_hint_text
	Checksum: 0x715ED0C4
	Offset: 0x2F8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_state
	Namespace: zm_hint_text
	Checksum: 0x1BF8E9FF
	Offset: 0x320
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_state(localclientnum, state_name)
{
	[[ self ]]->set_state(localclientnum, state_name);
}

/*
	Name: set_text
	Namespace: zm_hint_text
	Checksum: 0x37C49801
	Offset: 0x350
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_text(localclientnum, value)
{
	[[ self ]]->set_text(localclientnum, value);
}

