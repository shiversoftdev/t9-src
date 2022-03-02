#using scripts\core_common\lui_shared.csc;

class class_6b831806 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_6b831806
		Checksum: 0x50E48056
		Offset: 0x358
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_6b831806
		Checksum: 0x339DE60F
		Offset: 0x4B0
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_6b831806
		Checksum: 0x417F4CCE
		Offset: 0x448
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_26d9350e
		Namespace: namespace_6b831806
		Checksum: 0x34A132E7
		Offset: 0x478
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_26d9350e(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "deployProgress", value);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_6b831806
		Checksum: 0x452D64DB
		Offset: 0x3D0
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("BlackSeaJetskiDeployPrompt");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_6b831806
		Checksum: 0x2F7EB72C
		Offset: 0x378
		Size: 0x4C
		Parameters: 1
		Flags: None
	*/
	function setup_clientfields(var_8c9ddf96)
	{
		namespace_6aaccc24::setup_clientfields("BlackSeaJetskiDeployPrompt");
		namespace_6aaccc24::function_da693cbe("deployProgress", 1, 5, "float", var_8c9ddf96);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_6b831806
		Checksum: 0xA579396D
		Offset: 0x3F8
		Size: 0x48
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "deployProgress", 0);
	}

}

#namespace blackseajetskideployprompt;

/*
	Name: function_bb459e0c
	Namespace: blackseajetskideployprompt
	Checksum: 0x24E8E667
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_bb459e0c()
{
	level notify(672822232);
}

/*
	Name: register
	Namespace: blackseajetskideployprompt
	Checksum: 0x4597D42
	Offset: 0xF0
	Size: 0x176
	Parameters: 1
	Flags: None
*/
function register(var_8c9ddf96)
{
	elem = new class_6b831806();
	[[ elem ]]->setup_clientfields(var_8c9ddf96);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"blackseajetskideployprompt"]))
	{
		level.var_ae746e8f[#"blackseajetskideployprompt"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"blackseajetskideployprompt"]))
	{
		level.var_ae746e8f[#"blackseajetskideployprompt"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"blackseajetskideployprompt"]))
	{
		level.var_ae746e8f[#"blackseajetskideployprompt"] = array(level.var_ae746e8f[#"blackseajetskideployprompt"]);
	}
	level.var_ae746e8f[#"blackseajetskideployprompt"][level.var_ae746e8f[#"blackseajetskideployprompt"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: blackseajetskideployprompt
	Checksum: 0xE786992D
	Offset: 0x270
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_6b831806();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: blackseajetskideployprompt
	Checksum: 0x57DB6BC0
	Offset: 0x2B0
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
	Namespace: blackseajetskideployprompt
	Checksum: 0x8141E466
	Offset: 0x2D8
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
	Namespace: blackseajetskideployprompt
	Checksum: 0x583CFA11
	Offset: 0x300
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: function_26d9350e
	Namespace: blackseajetskideployprompt
	Checksum: 0x374C34E7
	Offset: 0x328
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_26d9350e(localclientnum, value)
{
	[[ self ]]->function_26d9350e(localclientnum, value);
}

