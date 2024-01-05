#using scripts\core_common\lui_shared.csc;

class cfull_screen_movie : cluielem
{

	/*
		Name: constructor
		Namespace: cfull_screen_movie
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
		Namespace: cfull_screen_movie
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
		Name: set_moviename
		Namespace: cfull_screen_movie
		Checksum: 0x462811A4
		Offset: 0x808
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_moviename(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "movieName", value);
	}

	/*
		Name: open
		Namespace: cfull_screen_movie
		Checksum: 0x5AE13558
		Offset: 0x7D8
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: set_moviekey
		Namespace: cfull_screen_movie
		Checksum: 0x2557E44C
		Offset: 0x958
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_moviekey(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "movieKey", value);
	}

	/*
		Name: set_playoutromovie
		Namespace: cfull_screen_movie
		Checksum: 0x924072EF
		Offset: 0x8E8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_playoutromovie(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "playOutroMovie", value);
	}

	/*
		Name: set_additive
		Namespace: cfull_screen_movie
		Checksum: 0xD7277BA1
		Offset: 0x8B0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_additive(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "additive", value);
	}

	/*
		Name: register_clientside
		Namespace: cfull_screen_movie
		Checksum: 0xC0543E71
		Offset: 0x6A0
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function register_clientside()
	{
		cluielem::register_clientside("full_screen_movie");
	}

	/*
		Name: set_looping
		Namespace: cfull_screen_movie
		Checksum: 0x834F58E6
		Offset: 0x878
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_looping(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "looping", value);
	}

	/*
		Name: registerplayer_callout_traversal
		Namespace: cfull_screen_movie
		Checksum: 0xE16B37DC
		Offset: 0x920
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function registerplayer_callout_traversal(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "skippable", value);
	}

	/*
		Name: set_showblackscreen
		Namespace: cfull_screen_movie
		Checksum: 0x53D4E580
		Offset: 0x840
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_showblackscreen(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "showBlackScreen", value);
	}

	/*
		Name: setup_clientfields
		Namespace: cfull_screen_movie
		Checksum: 0xA64AEC5A
		Offset: 0x528
		Size: 0x16C
		Parameters: 7
		Flags: Linked
	*/
	function setup_clientfields(var_f7b454f9, var_d5b04ae3, var_e4decd0, var_e545d4b9, var_78184b90, var_8ba396cb, var_ea38d488)
	{
		cluielem::setup_clientfields("full_screen_movie");
		cluielem::function_dcb34c80("moviefile", "movieName", 1);
		cluielem::add_clientfield("showBlackScreen", 1, 1, "int", var_e4decd0);
		cluielem::add_clientfield("looping", 1, 1, "int", var_e545d4b9);
		cluielem::add_clientfield("additive", 1, 1, "int", var_78184b90);
		cluielem::add_clientfield("playOutroMovie", 1, 1, "int", var_8ba396cb);
		cluielem::add_clientfield("skippable", 1, 1, "int", var_ea38d488);
		cluielem::function_dcb34c80("moviefile", "movieKey", 1);
	}

	/*
		Name: function_fa582112
		Namespace: cfull_screen_movie
		Checksum: 0xBF3E5240
		Offset: 0x6C8
		Size: 0x104
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "movieName", #"");
		[[ self ]]->set_data(localclientnum, "showBlackScreen", 0);
		[[ self ]]->set_data(localclientnum, "looping", 0);
		[[ self ]]->set_data(localclientnum, "additive", 0);
		[[ self ]]->set_data(localclientnum, "playOutroMovie", 0);
		[[ self ]]->set_data(localclientnum, "skippable", 0);
		[[ self ]]->set_data(localclientnum, "movieKey", #"");
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
	level notify(-195605949);
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
	elem = new cfull_screen_movie();
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
	Name: register_clientside
	Namespace: full_screen_movie
	Checksum: 0xBB064C02
	Offset: 0x300
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new cfull_screen_movie();
	[[ elem ]]->register_clientside();
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
	Name: set_moviename
	Namespace: full_screen_movie
	Checksum: 0x887AA533
	Offset: 0x3B8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_moviename(localclientnum, value)
{
	[[ self ]]->set_moviename(localclientnum, value);
}

/*
	Name: set_showblackscreen
	Namespace: full_screen_movie
	Checksum: 0x2D38F00B
	Offset: 0x3E8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_showblackscreen(localclientnum, value)
{
	[[ self ]]->set_showblackscreen(localclientnum, value);
}

/*
	Name: set_looping
	Namespace: full_screen_movie
	Checksum: 0xB3F2E077
	Offset: 0x418
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_looping(localclientnum, value)
{
	[[ self ]]->set_looping(localclientnum, value);
}

/*
	Name: set_additive
	Namespace: full_screen_movie
	Checksum: 0x5CF1A625
	Offset: 0x448
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_additive(localclientnum, value)
{
	[[ self ]]->set_additive(localclientnum, value);
}

/*
	Name: set_playoutromovie
	Namespace: full_screen_movie
	Checksum: 0x5A355436
	Offset: 0x478
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_playoutromovie(localclientnum, value)
{
	[[ self ]]->set_playoutromovie(localclientnum, value);
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
	Name: set_moviekey
	Namespace: full_screen_movie
	Checksum: 0x17597F2C
	Offset: 0x4D8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_moviekey(localclientnum, value)
{
	[[ self ]]->set_moviekey(localclientnum, value);
}

