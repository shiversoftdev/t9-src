#using scripts\core_common\lui_shared.csc;

class ccp_test_journalist1_uni_download_hack_luielem : cluielem
{

	/*
		Name: constructor
		Namespace: ccp_test_journalist1_uni_download_hack_luielem
		Checksum: 0xC127D46
		Offset: 0x3B0
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: ccp_test_journalist1_uni_download_hack_luielem
		Checksum: 0x85FE121
		Offset: 0x640
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: ccp_test_journalist1_uni_download_hack_luielem
		Checksum: 0xEFE9524A
		Offset: 0x4E8
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
		Namespace: ccp_test_journalist1_uni_download_hack_luielem
		Checksum: 0x2E990741
		Offset: 0x450
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("cp_test_journalist1_uni_download_hack_luielem");
	}

	/*
		Name: setup_clientfields
		Namespace: ccp_test_journalist1_uni_download_hack_luielem
		Checksum: 0xE99A5412
		Offset: 0x3D0
		Size: 0x74
		Parameters: 1
		Flags: None
	*/
	function setup_clientfields(var_fff52af4)
	{
		cluielem::setup_clientfields("cp_test_journalist1_uni_download_hack_luielem");
		cluielem::add_clientfield("_state", 1, 2, "int");
		cluielem::add_clientfield("download_progress", 1, 7, "float", var_fff52af4);
	}

	/*
		Name: set_download_progress
		Namespace: ccp_test_journalist1_uni_download_hack_luielem
		Checksum: 0xA091F39F
		Offset: 0x608
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_download_progress(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "download_progress", value);
	}

	/*
		Name: set_state
		Namespace: ccp_test_journalist1_uni_download_hack_luielem
		Checksum: 0xCE9E5530
		Offset: 0x518
		Size: 0xE4
		Parameters: 2
		Flags: None
	*/
	function set_state(localclientnum, state_name)
	{
		if(#"defaultstate" == state_name)
		{
			[[ self ]]->set_data(localclientnum, "_state", 0);
		}
		else
		{
			if(#"paused" == state_name)
			{
				[[ self ]]->set_data(localclientnum, "_state", 1);
			}
			else
			{
				if(#"finished" == state_name)
				{
					[[ self ]]->set_data(localclientnum, "_state", 2);
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
	}

	/*
		Name: function_fa582112
		Namespace: ccp_test_journalist1_uni_download_hack_luielem
		Checksum: 0x1EBEFA05
		Offset: 0x478
		Size: 0x68
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_state(localclientnum, #"defaultstate");
		[[ self ]]->set_data(localclientnum, "download_progress", 0);
	}

}

#namespace cp_test_journalist1_uni_download_hack_luielem;

/*
	Name: function_b552a3f6
	Namespace: cp_test_journalist1_uni_download_hack_luielem
	Checksum: 0xDA6A36EF
	Offset: 0xF8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b552a3f6()
{
	level notify(650543102);
}

/*
	Name: register
	Namespace: cp_test_journalist1_uni_download_hack_luielem
	Checksum: 0x216CF29C
	Offset: 0x118
	Size: 0x176
	Parameters: 1
	Flags: None
*/
function register(var_fff52af4)
{
	elem = new ccp_test_journalist1_uni_download_hack_luielem();
	[[ elem ]]->setup_clientfields(var_fff52af4);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"cp_test_journalist1_uni_download_hack_luielem"]))
	{
		level.var_ae746e8f[#"cp_test_journalist1_uni_download_hack_luielem"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"cp_test_journalist1_uni_download_hack_luielem"]))
	{
		level.var_ae746e8f[#"cp_test_journalist1_uni_download_hack_luielem"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"cp_test_journalist1_uni_download_hack_luielem"]))
	{
		level.var_ae746e8f[#"cp_test_journalist1_uni_download_hack_luielem"] = array(level.var_ae746e8f[#"cp_test_journalist1_uni_download_hack_luielem"]);
	}
	level.var_ae746e8f[#"cp_test_journalist1_uni_download_hack_luielem"][level.var_ae746e8f[#"cp_test_journalist1_uni_download_hack_luielem"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: cp_test_journalist1_uni_download_hack_luielem
	Checksum: 0x6A006570
	Offset: 0x298
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new ccp_test_journalist1_uni_download_hack_luielem();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: cp_test_journalist1_uni_download_hack_luielem
	Checksum: 0xB263B40E
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
	Namespace: cp_test_journalist1_uni_download_hack_luielem
	Checksum: 0x2210D8D
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
	Namespace: cp_test_journalist1_uni_download_hack_luielem
	Checksum: 0x1E6B5B9B
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
	Name: set_state
	Namespace: cp_test_journalist1_uni_download_hack_luielem
	Checksum: 0xDE9C13F9
	Offset: 0x350
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_state(localclientnum, state_name)
{
	[[ self ]]->set_state(localclientnum, state_name);
}

/*
	Name: set_download_progress
	Namespace: cp_test_journalist1_uni_download_hack_luielem
	Checksum: 0x369B1AFE
	Offset: 0x380
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_download_progress(localclientnum, value)
{
	[[ self ]]->set_download_progress(localclientnum, value);
}

