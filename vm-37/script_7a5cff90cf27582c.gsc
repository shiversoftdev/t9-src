#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class cblackseajetskideployprompt : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cblackseajetskideployprompt
		Checksum: 0x98395614
		Offset: 0x1D8
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cblackseajetskideployprompt
		Checksum: 0xC42AC60D
		Offset: 0x310
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cblackseajetskideployprompt
		Checksum: 0xDFBBA459
		Offset: 0x248
		Size: 0x3C
		Parameters: 2
		Flags: None
	*/
	function open(player, flags)
	{
		if(!isdefined(flags))
		{
			flags = 0;
		}
		cluielem::open_luielem(player, flags);
	}

	/*
		Name: set_deployprogress
		Namespace: cblackseajetskideployprompt
		Checksum: 0x24C20A87
		Offset: 0x2C0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_deployprogress(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "deployProgress", value);
	}

	/*
		Name: close
		Namespace: cblackseajetskideployprompt
		Checksum: 0xF9619DC5
		Offset: 0x290
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: setup_clientfields
		Namespace: cblackseajetskideployprompt
		Checksum: 0x32DD98BA
		Offset: 0x1F8
		Size: 0x44
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("BlackSeaJetskiDeployPrompt");
		cluielem::add_clientfield("deployProgress", 1, 5, "float");
	}

}

#namespace blackseajetskideployprompt;

/*
	Name: register
	Namespace: blackseajetskideployprompt
	Checksum: 0x31190987
	Offset: 0xD8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new cblackseajetskideployprompt();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: blackseajetskideployprompt
	Checksum: 0x555E5116
	Offset: 0x118
	Size: 0x38
	Parameters: 2
	Flags: None
*/
function open(player, flags)
{
	if(!isdefined(flags))
	{
		flags = 0;
	}
	[[ self ]]->open(player, flags);
}

/*
	Name: close
	Namespace: blackseajetskideployprompt
	Checksum: 0x2780A85B
	Offset: 0x158
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
	Checksum: 0x5FE370E6
	Offset: 0x180
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_deployprogress
	Namespace: blackseajetskideployprompt
	Checksum: 0xFDAD504D
	Offset: 0x1A8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_deployprogress(player, value)
{
	[[ self ]]->set_deployprogress(player, value);
}

