#using scripts\core_common\lui_shared.csc;

class cfull_screen_movie : cluielem
{

	/*
		Name: constructor
		Namespace: cfull_screen_movie
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
		Namespace: cfull_screen_movie
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
		Name: set_moviename
		Namespace: cfull_screen_movie
		Checksum: 0x75974C77
		Offset: 0x7E8
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
		Checksum: 0xB5D5236D
		Offset: 0x7B8
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
		Checksum: 0x451C2CF6
		Offset: 0x938
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
		Checksum: 0xB50C32A7
		Offset: 0x8C8
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
		Checksum: 0xBC69789A
		Offset: 0x890
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
		Checksum: 0x7BFC453E
		Offset: 0x680
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
		Checksum: 0x122E3F66
		Offset: 0x858
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
		Checksum: 0xEEFA8556
		Offset: 0x900
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
		Checksum: 0xA781F287
		Offset: 0x820
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
		Checksum: 0xF93C7021
		Offset: 0x508
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
		Checksum: 0x8F7672F
		Offset: 0x6A8
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
	Checksum: 0xBE3BD53F
	Offset: 0x2E0
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
	Name: set_moviename
	Namespace: full_screen_movie
	Checksum: 0xDF0075BB
	Offset: 0x398
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
	Checksum: 0xD9C3169F
	Offset: 0x3C8
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
	Checksum: 0x57975C5
	Offset: 0x3F8
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
	Checksum: 0x48465463
	Offset: 0x428
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
	Checksum: 0x23EFE9BA
	Offset: 0x458
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
	Name: set_moviekey
	Namespace: full_screen_movie
	Checksum: 0xB460A970
	Offset: 0x4B8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_moviekey(localclientnum, value)
{
	[[ self ]]->set_moviekey(localclientnum, value);
}

