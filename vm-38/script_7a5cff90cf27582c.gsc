#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class cblackseajetskideployprompt : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cblackseajetskideployprompt
		Checksum: 0xDD162454
		Offset: 0x1F8
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
		Checksum: 0x5DCA77CC
		Offset: 0x330
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
		Checksum: 0x9806AE76
		Offset: 0x268
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
		Checksum: 0x8DBAB234
		Offset: 0x2E0
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
		Checksum: 0xF4792E4E
		Offset: 0x2B0
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
		Checksum: 0x5DDFB015
		Offset: 0x218
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
	Name: function_f245841a
	Namespace: blackseajetskideployprompt
	Checksum: 0xE7E785B3
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f245841a()
{
	level notify(-1615659129);
}

/*
	Name: register
	Namespace: blackseajetskideployprompt
	Checksum: 0xC52BF7E
	Offset: 0xF8
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
	Checksum: 0x83B95F3F
	Offset: 0x138
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
	Checksum: 0xDE74B2A0
	Offset: 0x178
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
	Checksum: 0x686D9D85
	Offset: 0x1A0
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
	Checksum: 0xCC4922BF
	Offset: 0x1C8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_deployprogress(player, value)
{
	[[ self ]]->set_deployprogress(player, value);
}

