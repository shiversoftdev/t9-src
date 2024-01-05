#using script_3d703ef87a841fe4;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\player\player_loadout.gsc;
#using scripts\core_common\player\player_stats.gsc;

#namespace player_role;

/*
	Name: __init__system__
	Namespace: player_role
	Checksum: 0x278F9D91
	Offset: 0x98
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"player_role", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: player_role
	Checksum: 0x23A37D97
	Offset: 0xE0
	Size: 0x20
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!isdefined(world.var_7407953c))
	{
		world.var_7407953c = [];
	}
}

/*
	Name: get_category_for_index
	Namespace: player_role
	Checksum: 0x985C62EC
	Offset: 0x108
	Size: 0xAA
	Parameters: 1
	Flags: Linked
*/
function get_category_for_index(characterindex)
{
	categoryname = getplayerrolecategory(characterindex, currentsessionmode());
	if(isdefined(categoryname))
	{
		categoryinfo = getplayerrolecategoryinfo(categoryname);
		/#
			assert(isdefined(categoryinfo));
		#/
		if(is_true(categoryinfo.enabled))
		{
			return categoryname;
		}
	}
	return "default";
}

/*
	Name: get_category
	Namespace: player_role
	Checksum: 0x703023A1
	Offset: 0x1C0
	Size: 0xA2
	Parameters: 0
	Flags: None
*/
function get_category()
{
	player = self;
	/#
		assert(isplayer(player));
	#/
	characterindex = player get();
	/#
		assert(is_valid(characterindex));
	#/
	return get_category_for_index(characterindex);
}

/*
	Name: function_c1f61ea2
	Namespace: player_role
	Checksum: 0x42ACE7F9
	Offset: 0x270
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_c1f61ea2()
{
	return world.var_7407953c[self getentitynumber()];
}

/*
	Name: function_965ea244
	Namespace: player_role
	Checksum: 0x338EF842
	Offset: 0x2A0
	Size: 0x12E
	Parameters: 2
	Flags: None
*/
function function_965ea244(var_6c93328a, var_f99420aa)
{
	if(!isdefined(var_6c93328a))
	{
		var_6c93328a = 0;
	}
	if(!isdefined(var_f99420aa))
	{
		var_f99420aa = 0;
	}
	var_ba015ed = getplayerroletemplatecount(currentsessionmode());
	var_13711f02 = [];
	for(i = 0; i < var_ba015ed; i++)
	{
		var_d5557bda = var_6c93328a === 1 || function_f4bf7e3f(i);
		var_e6df8df4 = var_f99420aa === 1 || function_63d13ea3(i);
		if(var_d5557bda && var_e6df8df4)
		{
			var_13711f02[var_13711f02.size] = i;
		}
	}
	roleindex = var_13711f02[randomint(var_13711f02.size)];
	return roleindex;
}

/*
	Name: function_63d13ea3
	Namespace: player_role
	Checksum: 0x6279E413
	Offset: 0x3D8
	Size: 0x16A
	Parameters: 1
	Flags: Linked
*/
function function_63d13ea3(characterindex)
{
	maxuniqueroles = getgametypesetting(#"maxuniquerolesperteam", characterindex);
	if(maxuniqueroles == 0)
	{
		return false;
	}
	rolecount = 0;
	foreach(player in level.players)
	{
		if(player == self)
		{
			continue;
		}
		playercharacterindex = player get();
		if(isdefined(player.pers[#"team"]) && player.pers[#"team"] == self.pers[#"team"] && playercharacterindex == characterindex)
		{
			rolecount++;
			if(rolecount >= maxuniqueroles)
			{
				return false;
			}
		}
	}
	return true;
}

/*
	Name: is_valid
	Namespace: player_role
	Checksum: 0x88F5C1BA
	Offset: 0x550
	Size: 0x10E
	Parameters: 1
	Flags: Linked
*/
function is_valid(index)
{
	if(!isdefined(index))
	{
		return 0;
	}
	if(currentsessionmode() == 2)
	{
		return index >= 0 && index < getplayerroletemplatecount(currentsessionmode());
	}
	/#
		if(getdvarint(#"allowdebugcharacter", 0) == 1)
		{
			return index >= 0 && index < getplayerroletemplatecount(currentsessionmode());
		}
	#/
	return index > 0 && index < getplayerroletemplatecount(currentsessionmode());
}

/*
	Name: get
	Namespace: player_role
	Checksum: 0xBE17721F
	Offset: 0x668
	Size: 0x4A
	Parameters: 0
	Flags: Linked
*/
function get()
{
	/#
		/#
			assert(isplayer(self));
		#/
	#/
	return self getspecialistindex();
}

/*
	Name: update_fields
	Namespace: player_role
	Checksum: 0x87428474
	Offset: 0x6C0
	Size: 0x22
	Parameters: 0
	Flags: Linked
*/
function update_fields()
{
	self.playerrole = self getrolefields();
}

/*
	Name: set
	Namespace: player_role
	Checksum: 0xD09C7241
	Offset: 0x6F0
	Size: 0x238
	Parameters: 2
	Flags: Linked
*/
function set(index, force)
{
	player = self;
	/#
		assert(isplayer(player));
	#/
	/#
		assert(is_valid(index));
	#/
	player.pers[#"characterindex"] = index;
	player setspecialistindex(index);
	if(isbot(self) && getdvarint(#"hash_542c037530526acb", 0) && !is_true(force))
	{
		self botsetrandomcharactercustomization();
	}
	player update_fields();
	world.var_7407953c[self getentitynumber()] = index;
	if(getdvarint(#"hash_1f80dbba75375e3d", 0))
	{
		if(currentsessionmode() == 2)
		{
			customloadoutindex = self stats::get_stat(#"selectedcustomclass");
		}
		else
		{
			if(currentsessionmode() == 3 && !loadout::function_87bcb1b())
			{
				customloadoutindex = 0;
			}
			else
			{
				customloadoutindex = self.pers[#"loadoutindex"];
			}
		}
		if(isdefined(customloadoutindex))
		{
			self [[level.curclass]]("custom" + customloadoutindex);
		}
	}
}

/*
	Name: clear
	Namespace: player_role
	Checksum: 0xE4F506A4
	Offset: 0x930
	Size: 0x76
	Parameters: 0
	Flags: None
*/
function clear()
{
	player = self;
	/#
		assert(isplayer(player));
	#/
	player setspecialistindex(0);
	player.pers[#"characterindex"] = undefined;
	player.playerrole = undefined;
}

/*
	Name: get_custom_loadout_index
	Namespace: player_role
	Checksum: 0xAA262916
	Offset: 0x9B0
	Size: 0x22
	Parameters: 1
	Flags: None
*/
function get_custom_loadout_index(characterindex)
{
	return getcharacterclassindex(characterindex);
}

/*
	Name: function_97d19493
	Namespace: player_role
	Checksum: 0xEAA8BC5
	Offset: 0x9E0
	Size: 0x98
	Parameters: 1
	Flags: None
*/
function function_97d19493(name)
{
	sessionmode = currentsessionmode();
	playerroletemplatecount = getplayerroletemplatecount(sessionmode);
	for(i = 0; i < playerroletemplatecount; i++)
	{
		var_3c6fd4f7 = function_b14806c6(i, sessionmode);
		if(var_3c6fd4f7 == name)
		{
			return i;
		}
	}
	return undefined;
}

/*
	Name: function_2a911680
	Namespace: player_role
	Checksum: 0x7219E2DE
	Offset: 0xA80
	Size: 0x92
	Parameters: 0
	Flags: Linked
*/
function function_2a911680()
{
	if(level.var_d1455682.var_67bfde2a === 1)
	{
		faction = teams::function_20cfd8b5(self.pers[#"team"]);
		var_cdee2d01 = faction.superfaction;
	}
	character_index = self function_d882da68(var_cdee2d01);
	return character_index;
}

