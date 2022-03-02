#using scripts\core_common\lui_shared.csc;

class class_7ca06143 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_7ca06143
		Checksum: 0xE712E817
		Offset: 0x508
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
		Checksum: 0x291BE1E8
		Offset: 0x990
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
		Checksum: 0x462811A4
		Offset: 0x808
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
		Checksum: 0x5AE13558
		Offset: 0x7D8
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
		Checksum: 0x2557E44C
		Offset: 0x958
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
		Checksum: 0x924072EF
		Offset: 0x8E8
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
		Checksum: 0xD7277BA1
		Offset: 0x8B0
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
		Checksum: 0xC0543E71
		Offset: 0x6A0
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
		Checksum: 0x834F58E6
		Offset: 0x878
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
		Checksum: 0xE16B37DC
		Offset: 0x920
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
		Checksum: 0x53D4E580
		Offset: 0x840
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
		Checksum: 0xA64AEC5A
		Offset: 0x528
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
		Checksum: 0xBF3E5240
		Offset: 0x6C8
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
	Name: function_36331744
	Namespace: full_screen_movie
	Checksum: 0xDB759154
	Offset: 0x120
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_36331744()
{
	level notify(195605949);
}

/*
	Name: register
	Namespace: full_screen_movie
	Checksum: 0x8D595093
	Offset: 0x140
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
	Checksum: 0xBB064C02
	Offset: 0x300
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
	Checksum: 0xE14C6BFF
	Offset: 0x340
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
	Checksum: 0x77DFB2B
	Offset: 0x368
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
	Checksum: 0xE82F6E5
	Offset: 0x390
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
	Checksum: 0x887AA533
	Offset: 0x3B8
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
	Checksum: 0x2D38F00B
	Offset: 0x3E8
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
	Checksum: 0xB3F2E077
	Offset: 0x418
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
	Checksum: 0x5CF1A625
	Offset: 0x448
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
	Checksum: 0x5A355436
	Offset: 0x478
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
	Checksum: 0x8F6C2AD6
	Offset: 0x4A8
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
	Checksum: 0x17597F2C
	Offset: 0x4D8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_251fc818(localclientnum, value)
{
	[[ self ]]->function_251fc818(localclientnum, value);
}

