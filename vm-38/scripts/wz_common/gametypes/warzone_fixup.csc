#using script_309ce7f5a9a023de;

#namespace warzone_fixup;

/*
	Name: function_eb30d4e4
	Namespace: warzone_fixup
	Checksum: 0xE205503
	Offset: 0x68
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_eb30d4e4()
{
	level notify(1554186740);
}

/*
	Name: __init__
	Namespace: warzone_fixup
	Checksum: 0xF01DBBA
	Offset: 0x88
	Size: 0x114
	Parameters: 0
	Flags: AutoExec
*/
function autoexec __init__()
{
	waitframe(1);
	maxteamplayers = (isdefined(getgametypesetting(#"maxteamplayers")) ? getgametypesetting(#"maxteamplayers") : 1);
	switch(maxteamplayers)
	{
		case 1:
		{
			function_d0dc6619();
			break;
		}
		case 2:
		{
			function_f16631fc();
			break;
		}
		case 4:
		default:
		{
			function_91d1fd09();
			break;
		}
	}
	function_c94723bd();
}

/*
	Name: function_c94723bd
	Namespace: warzone_fixup
	Checksum: 0xA3D4C812
	Offset: 0x1A8
	Size: 0xE4
	Parameters: 0
	Flags: Private
*/
function private function_c94723bd()
{
	var_d1d7eefb = (isdefined(getgametypesetting(#"hash_50b1121aee76a7e4")) ? getgametypesetting(#"hash_50b1121aee76a7e4") : 0);
	if(!var_d1d7eefb)
	{
		function_9b8d4d02();
	}
	if(!(isdefined(getgametypesetting(#"hash_1d02e28ba907a343")) ? getgametypesetting(#"hash_1d02e28ba907a343") : 0))
	{
		item_world_fixup::remove_item(#"perk_item_bloody_tracker");
	}
}

/*
	Name: function_9b8d4d02
	Namespace: warzone_fixup
	Checksum: 0x82C8405F
	Offset: 0x298
	Size: 0xD0
	Parameters: 1
	Flags: Private
*/
function private function_9b8d4d02(prematch)
{
	var_3a1737b4 = getscriptbundles(#"hash_10587321f369e7f3");
	foreach(var_28f8f6a9 in var_3a1737b4)
	{
		if(var_28f8f6a9.itemtype == #"quest")
		{
			item_world_fixup::remove_item(var_1461de43);
		}
	}
}

/*
	Name: function_d0dc6619
	Namespace: warzone_fixup
	Checksum: 0x38D19A0E
	Offset: 0x370
	Size: 0x24
	Parameters: 0
	Flags: Private
*/
function private function_d0dc6619()
{
	item_world_fixup::remove_item(#"perk_item_squadlink");
}

/*
	Name: function_f16631fc
	Namespace: warzone_fixup
	Checksum: 0x80F724D1
	Offset: 0x3A0
	Size: 0x4
	Parameters: 0
	Flags: Private
*/
function private function_f16631fc()
{
}

/*
	Name: function_91d1fd09
	Namespace: warzone_fixup
	Checksum: 0x80F724D1
	Offset: 0x3B0
	Size: 0x4
	Parameters: 0
	Flags: Private
*/
function private function_91d1fd09()
{
}

