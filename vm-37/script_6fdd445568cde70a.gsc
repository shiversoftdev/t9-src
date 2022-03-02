#using scripts\core_common\lui_shared.csc;

class class_b201538a : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_b201538a
		Checksum: 0x7F922B9B
		Offset: 0x390
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_b201538a
		Checksum: 0xD4974
		Offset: 0x620
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_b201538a
		Checksum: 0xFC81CCE5
		Offset: 0x4C8
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_b201538a
		Checksum: 0x2C58A
		Offset: 0x430
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("cp_test_journalist1_uni_download_hack_luielem");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_b201538a
		Checksum: 0xF1B0C7B7
		Offset: 0x3B0
		Size: 0x74
		Parameters: 1
		Flags: None
	*/
	function setup_clientfields(var_fff52af4)
	{
		namespace_6aaccc24::setup_clientfields("cp_test_journalist1_uni_download_hack_luielem");
		namespace_6aaccc24::function_da693cbe("_state", 1, 2, "int");
		namespace_6aaccc24::function_da693cbe("download_progress", 1, 7, "float", var_fff52af4);
	}

	/*
		Name: function_97bf49cb
		Namespace: namespace_b201538a
		Checksum: 0xEBA8C6FA
		Offset: 0x5E8
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_97bf49cb(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "download_progress", value);
	}

	/*
		Name: set_state
		Namespace: namespace_b201538a
		Checksum: 0x27EFEC54
		Offset: 0x4F8
		Size: 0xE4
		Parameters: 2
		Flags: None
	*/
	function set_state(localclientnum, state_name)
	{
		if(#"defaultstate" == state_name)
		{
			[[ self ]]->function_d7d2fcce(localclientnum, "_state", 0);
		}
		else
		{
			if(#"paused" == state_name)
			{
				[[ self ]]->function_d7d2fcce(localclientnum, "_state", 1);
			}
			else
			{
				if(#"finished" == state_name)
				{
					[[ self ]]->function_d7d2fcce(localclientnum, "_state", 2);
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
		Namespace: namespace_b201538a
		Checksum: 0xFA968833
		Offset: 0x458
		Size: 0x68
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->set_state(localclientnum, #"defaultstate");
		[[ self ]]->function_d7d2fcce(localclientnum, "download_progress", 0);
	}

}

#namespace cp_test_journalist1_uni_download_hack_luielem;

/*
	Name: register
	Namespace: cp_test_journalist1_uni_download_hack_luielem
	Checksum: 0xEAD135DA
	Offset: 0xF8
	Size: 0x176
	Parameters: 1
	Flags: None
*/
function register(var_fff52af4)
{
	elem = new class_b201538a();
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
	Name: function_5c1bb138
	Namespace: cp_test_journalist1_uni_download_hack_luielem
	Checksum: 0x3976E0A1
	Offset: 0x278
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_b201538a();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: cp_test_journalist1_uni_download_hack_luielem
	Checksum: 0x72FD141F
	Offset: 0x2B8
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
	Checksum: 0x54104530
	Offset: 0x2E0
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
	Checksum: 0x3F25B63B
	Offset: 0x308
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
	Checksum: 0x1A8EFF
	Offset: 0x330
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_state(localclientnum, state_name)
{
	[[ self ]]->set_state(localclientnum, state_name);
}

/*
	Name: function_97bf49cb
	Namespace: cp_test_journalist1_uni_download_hack_luielem
	Checksum: 0xC2586AD2
	Offset: 0x360
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_97bf49cb(localclientnum, value)
{
	[[ self ]]->function_97bf49cb(localclientnum, value);
}

