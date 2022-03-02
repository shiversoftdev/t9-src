#using scripts\core_common\lui_shared.csc;

class class_ba33e0c1 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_ba33e0c1
		Checksum: 0xAE7533B
		Offset: 0x3D8
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_ba33e0c1
		Checksum: 0xD284EB80
		Offset: 0x6B8
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_ba33e0c1
		Checksum: 0xBFDE55EC
		Offset: 0x560
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_4aa46834
		Namespace: namespace_ba33e0c1
		Checksum: 0xB65BE9F1
		Offset: 0x680
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_4aa46834(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "activatorCount", value);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_ba33e0c1
		Checksum: 0xF04F683E
		Offset: 0x4A8
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("EncodedRadio_UseBar");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_ba33e0c1
		Checksum: 0x9A86972
		Offset: 0x3F8
		Size: 0xA4
		Parameters: 2
		Flags: None
	*/
	function setup_clientfields(var_ec85b709, var_193163f7)
	{
		namespace_6aaccc24::setup_clientfields("EncodedRadio_UseBar");
		namespace_6aaccc24::function_da693cbe("_state", 1, 1, "int");
		namespace_6aaccc24::function_da693cbe("progressFrac", 1, 10, "float", var_ec85b709);
		namespace_6aaccc24::function_da693cbe("activatorCount", 1, 3, "int", var_193163f7);
	}

	/*
		Name: set_state
		Namespace: namespace_ba33e0c1
		Checksum: 0xF62E4D2B
		Offset: 0x590
		Size: 0xAC
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
			if(#"hash_5fba3d476e0b33f8" == state_name)
			{
				[[ self ]]->function_d7d2fcce(localclientnum, "_state", 1);
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
		Name: function_f0df5702
		Namespace: namespace_ba33e0c1
		Checksum: 0x74921D4F
		Offset: 0x648
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_f0df5702(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "progressFrac", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_ba33e0c1
		Checksum: 0x41A1F363
		Offset: 0x4D0
		Size: 0x84
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->set_state(localclientnum, #"defaultstate");
		[[ self ]]->function_d7d2fcce(localclientnum, "progressFrac", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "activatorCount", 0);
	}

}

#namespace namespace_4d6a580c;

/*
	Name: function_73aa7ff5
	Namespace: namespace_4d6a580c
	Checksum: 0x8351EA6
	Offset: 0xE8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_73aa7ff5()
{
	level notify(217624107);
}

/*
	Name: register
	Namespace: namespace_4d6a580c
	Checksum: 0xB2AAE15B
	Offset: 0x108
	Size: 0x17E
	Parameters: 2
	Flags: None
*/
function register(var_ec85b709, var_193163f7)
{
	elem = new class_ba33e0c1();
	[[ elem ]]->setup_clientfields(var_ec85b709, var_193163f7);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"hash_76125f00bacdbe99"]))
	{
		level.var_ae746e8f[#"hash_76125f00bacdbe99"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"hash_76125f00bacdbe99"]))
	{
		level.var_ae746e8f[#"hash_76125f00bacdbe99"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"hash_76125f00bacdbe99"]))
	{
		level.var_ae746e8f[#"hash_76125f00bacdbe99"] = array(level.var_ae746e8f[#"hash_76125f00bacdbe99"]);
	}
	level.var_ae746e8f[#"hash_76125f00bacdbe99"][level.var_ae746e8f[#"hash_76125f00bacdbe99"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: namespace_4d6a580c
	Checksum: 0xF3BD5896
	Offset: 0x290
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_ba33e0c1();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: namespace_4d6a580c
	Checksum: 0x6B8F324B
	Offset: 0x2D0
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
	Namespace: namespace_4d6a580c
	Checksum: 0xB381FE23
	Offset: 0x2F8
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
	Namespace: namespace_4d6a580c
	Checksum: 0xA3FFB018
	Offset: 0x320
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
	Namespace: namespace_4d6a580c
	Checksum: 0xA1F35BE2
	Offset: 0x348
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_state(localclientnum, state_name)
{
	[[ self ]]->set_state(localclientnum, state_name);
}

/*
	Name: function_f0df5702
	Namespace: namespace_4d6a580c
	Checksum: 0x49B4A999
	Offset: 0x378
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_f0df5702(localclientnum, value)
{
	[[ self ]]->function_f0df5702(localclientnum, value);
}

/*
	Name: function_4aa46834
	Namespace: namespace_4d6a580c
	Checksum: 0x2C4FBCC9
	Offset: 0x3A8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_4aa46834(localclientnum, value)
{
	[[ self ]]->function_4aa46834(localclientnum, value);
}

