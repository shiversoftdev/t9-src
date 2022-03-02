#using script_306215d6cfd5f1f4;
#using script_6167e26342be354b;
#using script_75da5547b1822294;
#using scripts\core_common\spectating.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_8a203916;

/*
	Name: function_89f2df9
	Namespace: namespace_8a203916
	Checksum: 0x251F474C
	Offset: 0xE0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_62a9656d2aaa46aa", &function_70a657d8, undefined, undefined, #"spectating");
}

/*
	Name: codecallback_menuresponse
	Namespace: namespace_8a203916
	Checksum: 0x8C93B298
	Offset: 0x130
	Size: 0x174
	Parameters: 1
	Flags: Event
*/
event codecallback_menuresponse(eventstruct)
{
	var_53227942 = self;
	menu = eventstruct.menu;
	response = eventstruct.response;
	var_8893508d = eventstruct.intpayload;
	if(!isdefined(menu))
	{
		menu = "";
	}
	if(!isdefined(response))
	{
		response = "";
	}
	if(!isdefined(var_8893508d))
	{
		var_8893508d = 0;
	}
	if(menu == "Hud_NavigableUI")
	{
		if(self.sessionstate === "playing")
		{
			return;
		}
		if(response == "set_spawn_view_overhead" && !level.var_1c15a724)
		{
			self function_86df9236();
		}
		else
		{
			if(response == "set_spawn_view_squad" && level.var_1ba484ad == 2 && !level.var_1c15a724)
			{
				self function_86df9236();
			}
			else if(response == "set_spawn_view_squad" && !level.var_8bace951)
			{
				self function_888901cb();
			}
		}
	}
}

/*
	Name: function_70a657d8
	Namespace: namespace_8a203916
	Checksum: 0x8D00E148
	Offset: 0x2B0
	Size: 0x9C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_5d013349 = currentsessionmode() != 4 && (isdefined(getgametypesetting(#"hash_2c55a3723cd9fdf9")) ? getgametypesetting(#"hash_2c55a3723cd9fdf9") : 0);
	if(level.var_5d013349)
	{
		level.var_18c9a2d1 = &function_363802ea;
	}
}

/*
	Name: function_500047aa
	Namespace: namespace_8a203916
	Checksum: 0x77500CED
	Offset: 0x358
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_500047aa(view)
{
	if(self.var_8a203916 === view)
	{
		return true;
	}
	return false;
}

/*
	Name: function_363802ea
	Namespace: namespace_8a203916
	Checksum: 0xC745A78A
	Offset: 0x388
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function function_363802ea(players, attacker)
{
	self function_86df9236();
	self squad_spawn::function_e2ec8e07(1);
}

/*
	Name: function_86df9236
	Namespace: namespace_8a203916
	Checksum: 0x3AAF159
	Offset: 0x3D8
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_86df9236()
{
	self.var_8a203916 = 1;
	self squad_spawn::function_a0bd2fd6(1);
}

/*
	Name: function_888901cb
	Namespace: namespace_8a203916
	Checksum: 0x70728FE2
	Offset: 0x410
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_888901cb()
{
	self.var_8a203916 = 0;
	self squad_spawn::function_a0bd2fd6(0);
}

