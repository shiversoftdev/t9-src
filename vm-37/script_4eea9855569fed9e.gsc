#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class ccp_test_journalist1_uni_download_hack_luielem : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: ccp_test_journalist1_uni_download_hack_luielem
		Checksum: 0xDFE8B952
		Offset: 0x230
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
		Checksum: 0x7B4CBB9D
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
		Namespace: ccp_test_journalist1_uni_download_hack_luielem
		Checksum: 0x2EBE4882
		Offset: 0x2C8
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
		Checksum: 0xFD4D17AF
		Offset: 0x310
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
		Checksum: 0x138BED95
		Offset: 0x250
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
		Checksum: 0x45CE62D6
		Offset: 0x460
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
		Checksum: 0xB2119B8B
		Offset: 0x340
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
	Name: register
	Namespace: cp_test_journalist1_uni_download_hack_luielem
	Checksum: 0x92837D67
	Offset: 0x100
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
	Checksum: 0x52224920
	Offset: 0x140
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
	Checksum: 0x753C763F
	Offset: 0x180
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
	Checksum: 0xEFF97288
	Offset: 0x1A8
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
	Checksum: 0xF6E05EF2
	Offset: 0x1D0
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
	Checksum: 0x32FB24A1
	Offset: 0x200
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_download_progress(player, value)
{
	[[ self ]]->set_download_progress(player, value);
}

