#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class czm_build_progress : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: czm_build_progress
		Checksum: 0x7DB406EC
		Offset: 0x1E8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: czm_build_progress
		Checksum: 0xE4393D0
		Offset: 0x320
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: czm_build_progress
		Checksum: 0xFC149B61
		Offset: 0x258
		Size: 0x3C
		Parameters: 2
		Flags: Linked
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
		Name: close
		Namespace: czm_build_progress
		Checksum: 0x613304B5
		Offset: 0x2A0
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: setup_clientfields
		Namespace: czm_build_progress
		Checksum: 0xFD5A5AB2
		Offset: 0x208
		Size: 0x44
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("zm_build_progress");
		cluielem::add_clientfield("progress", 1, 6, "float");
	}

	/*
		Name: set_progress
		Namespace: czm_build_progress
		Checksum: 0xAB1BE2AE
		Offset: 0x2D0
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_progress(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "progress", value);
	}

}

#namespace zm_build_progress;

/*
	Name: function_56ca68cc
	Namespace: zm_build_progress
	Checksum: 0x12DB3627
	Offset: 0xC8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_56ca68cc()
{
	level notify(-436559314);
}

/*
	Name: register
	Namespace: zm_build_progress
	Checksum: 0xC59579A1
	Offset: 0xE8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new czm_build_progress();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: zm_build_progress
	Checksum: 0x40D59CB0
	Offset: 0x128
	Size: 0x38
	Parameters: 2
	Flags: Linked
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
	Namespace: zm_build_progress
	Checksum: 0x6221B1B7
	Offset: 0x168
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function close(player)
{
	[[ self ]]->close(player);
}

/*
	Name: is_open
	Namespace: zm_build_progress
	Checksum: 0xD7920DB2
	Offset: 0x190
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_progress
	Namespace: zm_build_progress
	Checksum: 0xC30483AF
	Offset: 0x1B8
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_progress(player, value)
{
	[[ self ]]->set_progress(player, value);
}

