#using script_54f593f5beb1464a;
#using script_2a30ac7aa0ee8988;

#namespace namespace_2d440395;

/*
	Name: function_88ff61e0
	Namespace: namespace_2d440395
	Checksum: 0xE3100E2B
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec
*/
function autoexec function_88ff61e0()
{
	thread function_45a212c0();
}

/*
	Name: function_45a212c0
	Namespace: namespace_2d440395
	Checksum: 0x38D1FF65
	Offset: 0x90
	Size: 0x70
	Parameters: 0
	Flags: Linked
*/
function function_45a212c0()
{
	var_87d0eef8 = &item_world_fixup::remove_item;
	var_74257310 = &item_world_fixup::add_item_replacement;
	var_f8a4c541 = &item_world_fixup::function_6991057;
	while(!isdefined(level))
	{
		waitframe(1);
	}
	level.var_21f73755 = 1;
}

/*
	Name: function_205a8326
	Namespace: namespace_2d440395
	Checksum: 0xA131A2AA
	Offset: 0x108
	Size: 0x74
	Parameters: 2
	Flags: Private
*/
function private function_205a8326(msg, var_9fb99f62)
{
	/#
		if(isdefined(var_9fb99f62))
		{
			println((("" + msg) + "") + var_9fb99f62);
		}
		else
		{
			println("" + msg);
		}
	#/
}

/*
	Name: function_48b77dbf
	Namespace: namespace_2d440395
	Checksum: 0x256D9EB4
	Offset: 0x188
	Size: 0x124
	Parameters: 1
	Flags: Private
*/
function private function_48b77dbf(customgame)
{
	/#
		var_9fb99f62 = "";
		if(!is_true(getgametypesetting(#"wzenablespraycans")))
		{
			var_9fb99f62 = "" + (isdefined(getgametypesetting(#"wzenablespraycans")) ? getgametypesetting(#"wzenablespraycans") : "");
		}
		else if(customgame)
		{
			if(gamemodeismode(1))
			{
				var_9fb99f62 = "";
			}
			else if(gamemodeismode(7))
			{
				var_9fb99f62 = "";
			}
		}
		function_205a8326("", var_9fb99f62);
	#/
}

