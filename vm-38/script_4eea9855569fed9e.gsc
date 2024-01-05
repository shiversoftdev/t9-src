#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class ccp_test_journalist1_uni_download_hack_luielem : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: ccp_test_journalist1_uni_download_hack_luielem
		Checksum: 0x110E35C0
		Offset: 0x250
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: ccp_test_journalist1_uni_download_hack_luielem
		Checksum: 0x4B221B28
		Offset: 0x4D0
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: ccp_test_journalist1_uni_download_hack_luielem
		Checksum: 0x6441D80C
		Offset: 0x2E8
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
		Name: close
		Namespace: ccp_test_journalist1_uni_download_hack_luielem
		Checksum: 0x62042216
		Offset: 0x330
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
		Namespace: ccp_test_journalist1_uni_download_hack_luielem
		Checksum: 0x5E5768B2
		Offset: 0x270
		Size: 0x6C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("cp_test_journalist1_uni_download_hack_luielem");
		cluielem::add_clientfield("_state", 1, 2, "int");
		cluielem::add_clientfield("download_progress", 1, 7, "float");
	}

	/*
		Name: set_download_progress
		Namespace: ccp_test_journalist1_uni_download_hack_luielem
		Checksum: 0x5AF05847
		Offset: 0x480
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_download_progress(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "download_progress", value);
	}

	/*
		Name: set_state
		Namespace: ccp_test_journalist1_uni_download_hack_luielem
		Checksum: 0xA3021583
		Offset: 0x360
		Size: 0x114
		Parameters: 2
		Flags: None
	*/
	function set_state(player, state_name)
	{
		if(#"defaultstate" == state_name)
		{
			player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 0);
		}
		else
		{
			if(#"paused" == state_name)
			{
				player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 1);
			}
			else
			{
				if(#"finished" == state_name)
				{
					player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 2);
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

}

#namespace cp_test_journalist1_uni_download_hack_luielem;

/*
	Name: function_1165d6b6
	Namespace: cp_test_journalist1_uni_download_hack_luielem
	Checksum: 0xBB9F2F66
	Offset: 0x100
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_1165d6b6()
{
	level notify(1759762735);
}

/*
	Name: register
	Namespace: cp_test_journalist1_uni_download_hack_luielem
	Checksum: 0xEA269771
	Offset: 0x120
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new ccp_test_journalist1_uni_download_hack_luielem();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: cp_test_journalist1_uni_download_hack_luielem
	Checksum: 0x3A6790E3
	Offset: 0x160
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
	Namespace: cp_test_journalist1_uni_download_hack_luielem
	Checksum: 0x2AD0B106
	Offset: 0x1A0
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
	Checksum: 0x1E0592EA
	Offset: 0x1C8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_state
	Namespace: cp_test_journalist1_uni_download_hack_luielem
	Checksum: 0xCA11B23C
	Offset: 0x1F0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_state(player, state_name)
{
	[[ self ]]->set_state(player, state_name);
}

/*
	Name: set_download_progress
	Namespace: cp_test_journalist1_uni_download_hack_luielem
	Checksum: 0x968CC2C
	Offset: 0x220
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_download_progress(player, value)
{
	[[ self ]]->set_download_progress(player, value);
}

