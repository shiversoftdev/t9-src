#using script_309ce7f5a9a023de;
#using script_644007a8c3885fc;

#namespace namespace_2d440395;

/*
	Name: function_3189c184
	Namespace: namespace_2d440395
	Checksum: 0xB7716D3F
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_3189c184()
{
	level notify(1525108493);
}

/*
	Name: function_88ff61e0
	Namespace: namespace_2d440395
	Checksum: 0xC637CCE8
	Offset: 0x90
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
	Checksum: 0x82318C2D
	Offset: 0xB0
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
	Checksum: 0x46A315F1
	Offset: 0x128
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
	Checksum: 0x41EA0EBC
	Offset: 0x1A8
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

