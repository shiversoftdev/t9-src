#using scripts\core_common\lui_shared.csc;

class class_7ca06143 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_7ca06143
		Checksum: 0xA69E3E59
		Offset: 0x4E8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_7ca06143
		Checksum: 0x8BADE1D2
		Offset: 0x970
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: function_87bb24
		Namespace: namespace_7ca06143
		Checksum: 0x75974C77
		Offset: 0x7E8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_87bb24(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "movieName", value);
	}

	/*
		Name: open
		Namespace: namespace_7ca06143
		Checksum: 0xB5D5236D
		Offset: 0x7B8
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_251fc818
		Namespace: namespace_7ca06143
		Checksum: 0x451C2CF6
		Offset: 0x938
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_251fc818(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "movieKey", value);
	}

	/*
		Name: function_3a81612d
		Namespace: namespace_7ca06143
		Checksum: 0xB50C32A7
		Offset: 0x8C8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_3a81612d(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "playOutroMovie", value);
	}

	/*
		Name: function_493305af
		Namespace: namespace_7ca06143
		Checksum: 0xBC69789A
		Offset: 0x890
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_493305af(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "additive", value);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_7ca06143
		Checksum: 0x7BFC453E
		Offset: 0x680
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("full_screen_movie");
	}

	/*
		Name: function_5caa21cb
		Namespace: namespace_7ca06143
		Checksum: 0x122E3F66
		Offset: 0x858
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_5caa21cb(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "looping", value);
	}

	/*
		Name: registerplayer_callout_traversal
		Namespace: namespace_7ca06143
		Checksum: 0xEEFA8556
		Offset: 0x900
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function registerplayer_callout_traversal(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "skippable", value);
	}

	/*
		Name: function_8f7a8b9c
		Namespace: namespace_7ca06143
		Checksum: 0xA781F287
		Offset: 0x820
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_8f7a8b9c(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "showBlackScreen", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_7ca06143
		Checksum: 0xF93C7021
		Offset: 0x508
		Size: 0x16C
		Parameters: 7
		Flags: Linked
	*/
	function setup_clientfields(var_f7b454f9, var_d5b04ae3, var_e4decd0, var_e545d4b9, var_78184b90, var_8ba396cb, var_ea38d488)
	{
		namespace_6aaccc24::setup_clientfields("full_screen_movie");
		namespace_6aaccc24::function_dcb34c80("moviefile", "movieName", 1);
		namespace_6aaccc24::function_da693cbe("showBlackScreen", 1, 1, "int", var_e4decd0);
		namespace_6aaccc24::function_da693cbe("looping", 1, 1, "int", var_e545d4b9);
		namespace_6aaccc24::function_da693cbe("additive", 1, 1, "int", var_78184b90);
		namespace_6aaccc24::function_da693cbe("playOutroMovie", 1, 1, "int", var_8ba396cb);
		namespace_6aaccc24::function_da693cbe("skippable", 1, 1, "int", var_ea38d488);
		namespace_6aaccc24::function_dcb34c80("moviefile", "movieKey", 1);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_7ca06143
		Checksum: 0x8F7672F
		Offset: 0x6A8
		Size: 0x104
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "movieName", #"");
		[[ self ]]->function_d7d2fcce(localclientnum, "showBlackScreen", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "looping", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "additive", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "playOutroMovie", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "skippable", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "movieKey", #"");
	}

}

#namespace full_screen_movie;

/*
	Name: register
	Namespace: full_screen_movie
	Checksum: 0xA65C5604
	Offset: 0x120
	Size: 0x1B6
	Parameters: 7
	Flags: Linked
*/
function register(var_f7b454f9, var_d5b04ae3, var_e4decd0, var_e545d4b9, var_78184b90, var_8ba396cb, var_ea38d488)
{
	elem = new class_7ca06143();
	[[ elem ]]->setup_clientfields(var_f7b454f9, var_d5b04ae3, var_e4decd0, var_e545d4b9, var_78184b90, var_8ba396cb, var_ea38d488);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"full_screen_movie"]))
	{
		level.var_ae746e8f[#"full_screen_movie"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"full_screen_movie"]))
	{
		level.var_ae746e8f[#"full_screen_movie"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"full_screen_movie"]))
	{
		level.var_ae746e8f[#"full_screen_movie"] = array(level.var_ae746e8f[#"full_screen_movie"]);
	}
	level.var_ae746e8f[#"full_screen_movie"][level.var_ae746e8f[#"full_screen_movie"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: full_screen_movie
	Checksum: 0xBE3BD53F
	Offset: 0x2E0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_7ca06143();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: full_screen_movie
	Checksum: 0x509F8928
	Offset: 0x320
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
	Namespace: full_screen_movie
	Checksum: 0xF0F2E9F0
	Offset: 0x348
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
	Namespace: full_screen_movie
	Checksum: 0x69728375
	Offset: 0x370
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: function_87bb24
	Namespace: full_screen_movie
	Checksum: 0xDF0075BB
	Offset: 0x398
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_87bb24(localclientnum, value)
{
	[[ self ]]->function_87bb24(localclientnum, value);
}

/*
	Name: function_8f7a8b9c
	Namespace: full_screen_movie
	Checksum: 0xD9C3169F
	Offset: 0x3C8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_8f7a8b9c(localclientnum, value)
{
	[[ self ]]->function_8f7a8b9c(localclientnum, value);
}

/*
	Name: function_5caa21cb
	Namespace: full_screen_movie
	Checksum: 0x57975C5
	Offset: 0x3F8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_5caa21cb(localclientnum, value)
{
	[[ self ]]->function_5caa21cb(localclientnum, value);
}

/*
	Name: function_493305af
	Namespace: full_screen_movie
	Checksum: 0x48465463
	Offset: 0x428
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_493305af(localclientnum, value)
{
	[[ self ]]->function_493305af(localclientnum, value);
}

/*
	Name: function_3a81612d
	Namespace: full_screen_movie
	Checksum: 0x23EFE9BA
	Offset: 0x458
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_3a81612d(localclientnum, value)
{
	[[ self ]]->function_3a81612d(localclientnum, value);
}

/*
	Name: registerplayer_callout_traversal
	Namespace: full_screen_movie
	Checksum: 0xE4F086BA
	Offset: 0x488
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function registerplayer_callout_traversal(localclientnum, value)
{
	[[ self ]]->registerplayer_callout_traversal(localclientnum, value);
}

/*
	Name: function_251fc818
	Namespace: full_screen_movie
	Checksum: 0xB460A970
	Offset: 0x4B8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_251fc818(localclientnum, value)
{
	[[ self ]]->function_251fc818(localclientnum, value);
}

