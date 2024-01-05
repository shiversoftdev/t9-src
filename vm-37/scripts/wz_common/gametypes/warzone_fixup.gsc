#using script_54f593f5beb1464a;

#namespace warzone_fixup;

/*
	Name: __init__
	Namespace: warzone_fixup
	Checksum: 0xC534402
	Offset: 0x68
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
	Checksum: 0xF5E4A95
	Offset: 0x188
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
	Checksum: 0x929310D9
	Offset: 0x278
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
	Checksum: 0x764938CF
	Offset: 0x350
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
	Offset: 0x380
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
	Offset: 0x390
	Size: 0x4
	Parameters: 0
	Flags: Private
*/
function private function_91d1fd09()
{
}

