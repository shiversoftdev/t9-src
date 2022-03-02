#using script_1435f3c9fc699e04;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;

#namespace namespace_38ee089b;

/*
	Name: function_70a657d8
	Namespace: namespace_38ee089b
	Checksum: 0x1CD67A60
	Offset: 0x78
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	if(!sessionmodeisprivate())
	{
		if(function_59116c33() || !getdvarint(#"hash_199dcc375667485", 0))
		{
			return;
		}
	}
	onstartgametype = function_72b9b674();
	if(isdefined(onstartgametype))
	{
		callback::on_start_gametype(onstartgametype);
	}
}

/*
	Name: function_72b9b674
	Namespace: namespace_38ee089b
	Checksum: 0x4FEDEC59
	Offset: 0x118
	Size: 0x1E4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_72b9b674()
{
	if(!isdefined(level.gametype))
	{
		return undefined;
	}
	switch(level.gametype)
	{
		case "conf":
		case "hash_40e7fa1f82c9a9a9":
		{
			return &function_13821498;
		}
		case "control":
		case "hash_1acc245ba0adf546":
		case "hash_594c4ab1d31aa150":
		{
			return &function_750b5743;
		}
		case "dm":
		case "dm_hc":
		case "hash_768858163b52fe75":
		{
			return &function_13821498;
		}
		case "hash_2b1e0466676a9e7d":
		case "dom":
		case "hash_5e13d8428d20cfa6":
		{
			return &dom_start;
		}
		case "dropkick":
		{
			return &function_35d61d4;
		}
		case "hash_c5acc1898a61b54":
		case "gunfight":
		{
			return &function_8d249e99;
		}
		case "koth":
		case "hash_35a6541d081acef5":
		{
			return &koth_start;
		}
		case "hash_ce0d2a7056f9c17":
		case "hash_2ad10ed6e94a349c":
		case "tdm":
		{
			return &function_13821498;
		}
	}
	return undefined;
}

/*
	Name: function_750b5743
	Namespace: namespace_38ee089b
	Checksum: 0x5A12334
	Offset: 0x308
	Size: 0x4C2
	Parameters: 0
	Flags: Linked, Private
*/
function private function_750b5743()
{
	level endon(#"game_ended");
	foreach(team in level.teams)
	{
		level function_8f96464(team, undefined, #"chase_enemy", #"patrol");
	}
	while(!isdefined(level.zones) || level.zones.size <= 0)
	{
		waitframe(1);
	}
	var_5c6dcdf9 = [];
	foreach(zone in level.zones)
	{
		info = level function_5f64ef84(zone.gameobject);
		var_5c6dcdf9[var_5c6dcdf9.size] = info;
		foreach(team in level.teams)
		{
			order = #"defend";
			weight = &function_e8d188ad;
			if(team == game.attackers)
			{
				order = #"capture";
				weight = &function_1fb784fb;
			}
			level function_8f96464(team, info, order, #"assault", weight);
		}
	}
	while(!isdefined(level.capturedzones))
	{
		waitframe(1);
	}
	while(true)
	{
		var_23c361c9 = [];
		foreach(info in var_5c6dcdf9)
		{
			object = info.target;
			if(!object.trigger istriggerenabled())
			{
				var_23c361c9[var_23c361c9.size] = info;
				continue;
			}
			objectives = level function_574923ee(info);
			foreach(objective in objectives)
			{
				objective.secure = function_84750938(object, objective.team);
			}
		}
		foreach(info in var_23c361c9)
		{
			level function_add82897(info);
			arrayremovevalue(var_5c6dcdf9, info);
		}
		waitframe(1);
	}
}

/*
	Name: function_e8d188ad
	Namespace: namespace_38ee089b
	Checksum: 0x41C26A5F
	Offset: 0x7D8
	Size: 0x10
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e8d188ad(objective)
{
	return 5;
}

/*
	Name: function_1fb784fb
	Namespace: namespace_38ee089b
	Checksum: 0xCBC05B7C
	Offset: 0x7F0
	Size: 0x10
	Parameters: 1
	Flags: Linked, Private
*/
function private function_1fb784fb(objective)
{
	return 5;
}

/*
	Name: dom_start
	Namespace: namespace_38ee089b
	Checksum: 0x3EE3A9F7
	Offset: 0x808
	Size: 0x4AC
	Parameters: 0
	Flags: Linked, Private
*/
function private dom_start()
{
	level endon(#"game_ended");
	foreach(team in level.teams)
	{
		level function_8f96464(team, undefined, #"chase_enemy", #"patrol", undefined);
	}
	var_654bc2bc = [#"defend":&function_d5bf23f5, #"capture":&function_19d221fa];
	while(!isdefined(level.domflags) || level.domflags.size <= 0)
	{
		waitframe(1);
	}
	var_647c4a69 = [];
	foreach(object in level.domflags)
	{
		info = level function_5f64ef84(object);
		var_647c4a69[var_647c4a69.size] = info;
		var_ba83b5af = #"capture";
		foreach(team in level.teams)
		{
			level function_8f96464(team, info, var_ba83b5af, #"assault", var_654bc2bc[var_ba83b5af]);
		}
	}
	waitframe(1);
	while(true)
	{
		foreach(info in var_647c4a69)
		{
			object = info.target;
			ownerteam = object gameobjects::get_owner_team();
			objectives = level function_574923ee(info);
			foreach(objective in objectives)
			{
				team = objective.team;
				order = (team == ownerteam ? #"defend" : #"capture");
				if(objective.var_a1980fcb != order)
				{
					level function_80af6d(objective);
					weight = var_654bc2bc[order];
					level function_8f96464(team, info, order, #"assault", weight);
				}
				objective.secure = function_84750938(object, team);
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_19d221fa
	Namespace: namespace_38ee089b
	Checksum: 0x15B15AEA
	Offset: 0xCC0
	Size: 0x6C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_19d221fa(objective)
{
	teamcount = getplayers(self.team).size;
	objectivecount = level function_994c497(objective);
	if(objectivecount > 0)
	{
		return teamcount / objectivecount;
	}
	return teamcount;
}

/*
	Name: function_d5bf23f5
	Namespace: namespace_38ee089b
	Checksum: 0xF4C0CB4F
	Offset: 0xD38
	Size: 0x6C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d5bf23f5(objective)
{
	teamcount = getplayers(self.team).size;
	objectivecount = level function_994c497(objective);
	if(objectivecount > 0)
	{
		return teamcount / objectivecount;
	}
	return teamcount;
}

/*
	Name: function_35d61d4
	Namespace: namespace_38ee089b
	Checksum: 0x5224FB8A
	Offset: 0xDB0
	Size: 0x3A8
	Parameters: 0
	Flags: Linked, Private
*/
function private function_35d61d4()
{
	level endon(#"game_ended");
	while(!isdefined(level.var_bb695b91))
	{
		waitframe(1);
	}
	var_b84a8f51 = function_5f64ef84(level.var_bb695b91);
	var_9c4aa862 = {#hash_23f1621e:var_b84a8f51.var_23f1621e, #hash_dd2331cb:var_b84a8f51.var_dd2331cb};
	while(true)
	{
		foreach(team in level.teams)
		{
			level function_8f96464(team, var_b84a8f51, #"capture", #"assault");
		}
		while(!isdefined(var_b84a8f51.target.carrier))
		{
			waitframe(1);
		}
		level function_add82897(var_b84a8f51);
		carrier = var_b84a8f51.target.carrier;
		var_9c4aa862.target = carrier;
		var_8cc3a02f = carrier.team;
		level function_8f96464(var_8cc3a02f, var_9c4aa862, #"hash_2fc0534d4a96a7ea", #"camp", &function_69fcc325);
		level function_8f96464(var_8cc3a02f, var_9c4aa862, #"defend", #"assault", &function_dda40c33);
		foreach(team in level.teams)
		{
			if(team == var_8cc3a02f)
			{
				level function_8f96464(team, var_9c4aa862, #"chase_enemy", #"patrol", &function_a4ce3b72);
				continue;
			}
			level function_8f96464(team, var_9c4aa862, #"chase_enemy", #"patrol", undefined);
		}
		waitframe(1);
		while(isdefined(var_b84a8f51.target.carrier))
		{
			level function_e58e3486(var_9c4aa862);
			waitframe(1);
		}
		level function_add82897(var_9c4aa862);
	}
}

/*
	Name: function_69fcc325
	Namespace: namespace_38ee089b
	Checksum: 0xC5F61C18
	Offset: 0x1160
	Size: 0x48
	Parameters: 1
	Flags: Linked, Private
*/
function private function_69fcc325(objective)
{
	carrier = objective.info.target;
	if(isdefined(carrier) && carrier == self)
	{
		return true;
	}
	return false;
}

/*
	Name: function_dda40c33
	Namespace: namespace_38ee089b
	Checksum: 0x55E63396
	Offset: 0x11B0
	Size: 0x68
	Parameters: 1
	Flags: Linked, Private
*/
function private function_dda40c33(objective)
{
	carrier = objective.info.target;
	if(isdefined(carrier) && carrier == self)
	{
		return 0;
	}
	if(objective.count < 3)
	{
		return 3;
	}
	return 1;
}

/*
	Name: function_a4ce3b72
	Namespace: namespace_38ee089b
	Checksum: 0xA391C72B
	Offset: 0x1220
	Size: 0x48
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a4ce3b72(objective)
{
	carrier = objective.info.target;
	if(isdefined(carrier) && carrier == self)
	{
		return false;
	}
	return true;
}

/*
	Name: function_8d249e99
	Namespace: namespace_38ee089b
	Checksum: 0xAF5C75EB
	Offset: 0x1270
	Size: 0x3DC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8d249e99()
{
	level endon(#"game_ended");
	var_f0ed42da = {};
	foreach(team in level.teams)
	{
		level function_8f96464(team, var_f0ed42da, #"chase_enemy", #"patrol", &function_8b5d7508);
	}
	var_a5e6be6d = {};
	foreach(team in level.teams)
	{
		level function_8f96464(team, var_a5e6be6d, #"hash_2fc0534d4a96a7ea", #"camp", &function_b4c402b);
	}
	zoneinfo = undefined;
	while(!isdefined(level.zones) || level.zones.size <= 0 || !isdefined(level.zones[0].gameobject))
	{
		waitframe(1);
	}
	zoneinfo = function_5f64ef84(level.zones[0].gameobject);
	while(zoneinfo.target.interactteam != #"hash_5ccfd7bbbf07c770")
	{
		waitframe(1);
	}
	foreach(team in level.teams)
	{
		level function_8f96464(team, zoneinfo, #"capture", #"assault", undefined);
	}
	level function_add82897(var_f0ed42da);
	foreach(team in level.teams)
	{
		level function_8f96464(team, var_f0ed42da, #"chase_enemy", #"patrol", &function_a6535861);
	}
	level function_add82897(var_a5e6be6d);
}

/*
	Name: function_8b5d7508
	Namespace: namespace_38ee089b
	Checksum: 0xC5206E06
	Offset: 0x1658
	Size: 0x10
	Parameters: 1
	Flags: Linked, Private
*/
function private function_8b5d7508(objective)
{
	return true;
}

/*
	Name: function_b4c402b
	Namespace: namespace_38ee089b
	Checksum: 0x61F571DA
	Offset: 0x1670
	Size: 0x10
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b4c402b(objective)
{
	return 4;
}

/*
	Name: function_a6535861
	Namespace: namespace_38ee089b
	Checksum: 0xCAFA7E56
	Offset: 0x1688
	Size: 0x26
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a6535861(objective)
{
	if(self.bot.var_e8c84f98)
	{
		return 3;
	}
	return 0;
}

/*
	Name: koth_start
	Namespace: namespace_38ee089b
	Checksum: 0xD01E434D
	Offset: 0x16B8
	Size: 0x540
	Parameters: 0
	Flags: Linked, Private
*/
function private koth_start()
{
	level endon(#"game_ended");
	foreach(team in level.teams)
	{
		level function_8f96464(team, undefined, #"chase_enemy", #"patrol", undefined);
	}
	while(!isdefined(level.zones) || level.zones.size <= 0)
	{
		waitframe(1);
	}
	var_4185bc81 = [];
	foreach(zone in level.zones)
	{
		if(!isdefined(zone.gameobject))
		{
			continue;
		}
		info = level function_5f64ef84(zone.gameobject);
		var_4185bc81[var_4185bc81.size] = info;
	}
	var_df910e1 = undefined;
	while(true)
	{
		if(isdefined(var_df910e1))
		{
			object = var_df910e1.target;
			if(!object.trigger istriggerenabled())
			{
				level function_add82897(var_df910e1);
				var_df910e1 = undefined;
			}
		}
		if(!isdefined(var_df910e1))
		{
			foreach(info in var_4185bc81)
			{
				object = info.target;
				if(object.trigger istriggerenabled())
				{
					var_df910e1 = info;
					foreach(team in level.teams)
					{
						level function_8f96464(team, info, #"capture", #"assault", &function_16dd5162);
						level function_8f96464(team, info, #"defend", #"assault", &function_9cb54b7c);
					}
					break;
				}
			}
		}
		if(isdefined(var_df910e1))
		{
			object = var_df910e1.target;
			objectives = function_574923ee(var_df910e1);
			var_c0121fed = [];
			foreach(team in level.teams)
			{
				var_c0121fed[team] = function_84750938(object, team);
			}
			foreach(objective in objectives)
			{
				secure = var_c0121fed[objective.team];
				objective.secure = secure;
				objective.secure = secure;
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_16dd5162
	Namespace: namespace_38ee089b
	Checksum: 0xFAC0644D
	Offset: 0x1C00
	Size: 0x10
	Parameters: 1
	Flags: Linked, Private
*/
function private function_16dd5162(objective)
{
	return 5;
}

/*
	Name: function_9cb54b7c
	Namespace: namespace_38ee089b
	Checksum: 0xB16213AF
	Offset: 0x1C18
	Size: 0x10
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9cb54b7c(objective)
{
	return 4;
}

/*
	Name: function_13821498
	Namespace: namespace_38ee089b
	Checksum: 0xD45A25DA
	Offset: 0x1C30
	Size: 0xB0
	Parameters: 0
	Flags: Linked, Private
*/
function private function_13821498()
{
	foreach(team in level.teams)
	{
		level function_8f96464(team, undefined, #"chase_enemy", #"patrol", undefined);
	}
}

/*
	Name: function_5f64ef84
	Namespace: namespace_38ee089b
	Checksum: 0x35F43EAB
	Offset: 0x1CE8
	Size: 0xB6
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5f64ef84(target)
{
	info = {#target:target};
	regions = level function_5c2d40ff(target);
	neighbors = level function_323a3bdf(regions);
	info.var_dd2331cb = level function_8d2aa32e(regions);
	info.var_23f1621e = level function_8d2aa32e(neighbors);
	return info;
}

/*
	Name: function_e58e3486
	Namespace: namespace_38ee089b
	Checksum: 0x319428E
	Offset: 0x1DA8
	Size: 0x126
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e58e3486(info)
{
	if(!isdefined(info.target))
	{
		return;
	}
	regions = level function_5c2d40ff(info.target);
	if(regions.size <= 0)
	{
		return;
	}
	var_dd2331cb = level function_8d2aa32e(regions);
	if(var_dd2331cb.size == info.var_dd2331cb.size)
	{
		intersect = arrayintersect(var_dd2331cb, info.var_dd2331cb);
		if(var_dd2331cb.size == intersect.size)
		{
			return;
		}
	}
	neighbors = level function_323a3bdf(regions);
	var_23f1621e = level function_8d2aa32e(neighbors);
	info.var_dd2331cb = var_dd2331cb;
	info.var_23f1621e = var_23f1621e;
}

/*
	Name: function_5c2d40ff
	Namespace: namespace_38ee089b
	Checksum: 0x477C70F6
	Offset: 0x1ED8
	Size: 0x19C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5c2d40ff(target)
{
	regions = [];
	if(isdefined(target.trigger))
	{
		points = tacticalquery(#"hash_6ab834dd93762a6e", target.trigger);
		foreach(point in points)
		{
			info = function_b507a336(point.region);
			if(info.tacpoints.size < 5)
			{
				continue;
			}
			regions[info.id] = info;
		}
	}
	if(regions.size <= 0)
	{
		tpoint = function_ad6356f5(target.origin);
		if(isdefined(tpoint))
		{
			region = function_b507a336(tpoint.region);
			regions[region.id] = region;
		}
	}
	return regions;
}

/*
	Name: function_84750938
	Namespace: namespace_38ee089b
	Checksum: 0x41981BD1
	Offset: 0x2080
	Size: 0x92
	Parameters: 2
	Flags: Linked, Private
*/
function private function_84750938(object, team)
{
	if(object gameobjects::function_3a29539b(team))
	{
		return false;
	}
	if(object gameobjects::get_num_touching(team))
	{
		return true;
	}
	owner = object gameobjects::get_owner_team();
	if(isdefined(owner) && owner == team)
	{
		return true;
	}
	return false;
}

/*
	Name: function_323a3bdf
	Namespace: namespace_38ee089b
	Checksum: 0x2691D59B
	Offset: 0x2120
	Size: 0x14A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_323a3bdf(regions)
{
	neighbors = [];
	foreach(var_8cc7a4e in regions)
	{
		foreach(id in var_8cc7a4e.neighbors)
		{
			if(isdefined(regions[id]))
			{
				continue;
			}
			region = function_b507a336(id);
			if(region.tacpoints.size < 5)
			{
				continue;
			}
			neighbors[id] = region;
		}
	}
	return neighbors;
}

/*
	Name: function_8d2aa32e
	Namespace: namespace_38ee089b
	Checksum: 0x33B85601
	Offset: 0x2278
	Size: 0x96
	Parameters: 1
	Flags: Linked, Private
*/
function private function_8d2aa32e(regions)
{
	ids = [];
	foreach(region in regions)
	{
		ids[ids.size] = id;
	}
	return ids;
}

/*
	Name: function_8f96464
	Namespace: namespace_38ee089b
	Checksum: 0x2FBB8698
	Offset: 0x2318
	Size: 0xDC
	Parameters: 5
	Flags: Linked, Private
*/
function private function_8f96464(team, info, var_a1980fcb, var_5e99151a, weight)
{
	objective = {#active:1, #weight:weight, #count:0, #hash_5e99151a:var_5e99151a, #hash_a1980fcb:var_a1980fcb, #info:info, #team:team};
	objectives = level.var_774ed7e9[team];
	objectives[objectives.size] = objective;
	return objective;
}

/*
	Name: function_80af6d
	Namespace: namespace_38ee089b
	Checksum: 0xD70D36CE
	Offset: 0x2400
	Size: 0x4C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_80af6d(objective)
{
	objective.active = 0;
	objectives = level.var_774ed7e9[objective.team];
	arrayremovevalue(objectives, objective);
}

/*
	Name: function_add82897
	Namespace: namespace_38ee089b
	Checksum: 0x6C1E6065
	Offset: 0x2458
	Size: 0xB0
	Parameters: 1
	Flags: Linked, Private
*/
function private function_add82897(info)
{
	objectives = function_574923ee(info);
	foreach(objective in objectives)
	{
		function_80af6d(objective);
	}
}

/*
	Name: function_574923ee
	Namespace: namespace_38ee089b
	Checksum: 0x97BE11D6
	Offset: 0x2510
	Size: 0x12A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_574923ee(info)
{
	var_554456a7 = [];
	foreach(objectives in level.var_774ed7e9)
	{
		foreach(objective in objectives)
		{
			if(isdefined(objective.info) && objective.info == info)
			{
				var_554456a7[var_554456a7.size] = objective;
			}
		}
	}
	return var_554456a7;
}

/*
	Name: function_994c497
	Namespace: namespace_38ee089b
	Checksum: 0xE1A7C299
	Offset: 0x2648
	Size: 0xFA
	Parameters: 1
	Flags: Linked, Private
*/
function private function_994c497(objective)
{
	count = objective.count;
	players = objective.info.target.users[objective.team].touching.players;
	if(!isdefined(players))
	{
		return count;
	}
	foreach(player in players)
	{
		if(!isbot(player))
		{
			count++;
		}
	}
	return count;
}

