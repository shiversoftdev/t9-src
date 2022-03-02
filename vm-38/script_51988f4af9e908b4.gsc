#using script_13da4e6b98ca81a1;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\lui_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\util_shared.csc;

#namespace control;

/*
	Name: function_2652e159
	Namespace: control
	Checksum: 0xDF977D49
	Offset: 0x228
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2652e159()
{
	level notify(334712528);
}

/*
	Name: main
	Namespace: control
	Checksum: 0x9BBB3A62
	Offset: 0x248
	Size: 0x630
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	level.current_zone_mask = [];
	level.current_zone_state_mask = [];
	level.visuals = [];
	level.warzonefx = [];
	level.zones = [];
	level.var_2c71eaf8 = [];
	level.zoneindices = [];
	for(i = 0; i < 4; i++)
	{
		level.current_zone_mask[i] = 0;
		level.current_zone_state_mask[i] = 0;
		level.warzonefx[i] = [];
	}
	clientfield::register("world", "activeZoneTriggers", 1, 5, "int", &function_c3ac47f5, 0, 0);
	clientfield::register("world", "warzone", 1, 5, "int", &warzone, 0, 0);
	clientfield::register("world", "warzonestate", 1, 10, "int", &warzone_state, 0, 0);
	clientfield::function_5b7d846d("hudItems.missions.captureMultiplierStatus", #"hash_410fe12a68d6e801", [1:#"capturemultiplierstatus", 0:#"missions"], 1, 2, "int", undefined, 0, 1);
	clientfield::function_5b7d846d("hudItems.war.attackingTeam", #"hash_11ea1e04b846f98e", #"attackingteam", 1, 2, "int", undefined, 0, 1);
	clientfield::register("scriptmover", "scriptid", 1, 5, "int", &function_e116df6c, 0, 0);
	level.effect_scriptbundles = [];
	level.effect_scriptbundles[#"zoneedgemarker"] = getscriptbundle("teamcolorfx_koth_edge_marker");
	level.effect_scriptbundles[#"zoneedgemarkerwndw"] = getscriptbundle("teamcolorfx_koth_edge_marker_window");
	level._effect[#"zoneedgemarker"] = [];
	level._effect[#"zoneedgemarker"][0] = #"hash_1f447aeb1973f7b6";
	level._effect[#"zoneedgemarker"][1] = #"hash_5c2ae9f4f331d4b9";
	level._effect[#"zoneedgemarker"][2] = #"hash_7d1b0f001ea88b82";
	level._effect[#"zoneedgemarker"][3] = #"hash_7981eb245ea536fc";
	level._effect[#"zoneedgemarkerwndw"] = [];
	level._effect[#"zoneedgemarkerwndw"][0] = #"hash_35ab4f45bbfba6b3";
	level._effect[#"zoneedgemarkerwndw"][1] = #"hash_5565c3fc2c7742fe";
	level._effect[#"zoneedgemarkerwndw"][2] = #"hash_3283b765fe480df7";
	level._effect[#"zoneedgemarkerwndw"][3] = #"hash_6a512c225256a2e9";
	level.mission_bundle = getscriptbundle("mission_settings_control");
	level.mission_bundle = getscriptbundle("mission_settings_control");
	callback::on_localclient_connect(&on_localclient_connect);
	callback::on_spawned(&function_6e3affdc);
	callback::add_callback(#"hash_34e39ee0c9fa0092", &function_3022f6ba);
	fields = getmapfields();
	level.var_117b4a3a = [];
	level.var_117b4a3a[0] = (isdefined(fields.var_306136ca) ? fields.var_306136ca : #"hash_280d5153e1276d");
	level.var_117b4a3a[1] = (isdefined(fields.var_e1ef0bf1) ? fields.var_e1ef0bf1 : #"hash_4b1a3a0285bea14d");
	level.var_117b4a3a[2] = (isdefined(fields.var_97278b57) ? fields.var_97278b57 : #"hash_36a94457406aea0e");
	level.var_117b4a3a[3] = (isdefined(fields.var_29209af9) ? fields.var_29209af9 : #"hash_5a60154937b01557");
}

/*
	Name: function_c3ac47f5
	Namespace: control
	Checksum: 0x3DE2D316
	Offset: 0x880
	Size: 0xE4
	Parameters: 7
	Flags: None
*/
function function_c3ac47f5(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump != fieldname)
	{
		var_cad692a8 = getentarray(binitialsnap, "control_zone_trigger", "targetname");
		for(i = 0; i < var_cad692a8.size; i++)
		{
			if(bwastimejump & (1 << i))
			{
				var_cad692a8[i] function_c06a8682(binitialsnap);
				continue;
			}
			var_cad692a8[i] function_c6c4ce9f(binitialsnap);
		}
	}
}

/*
	Name: function_3022f6ba
	Namespace: control
	Checksum: 0xE795C919
	Offset: 0x970
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function function_3022f6ba(eventstruct)
{
	local_client_num = eventstruct.localclientnum;
	objid = eventstruct.id;
	function_dd2493cc(local_client_num, objid);
}

/*
	Name: function_dd2493cc
	Namespace: control
	Checksum: 0x64A7F762
	Offset: 0x9C8
	Size: 0x378
	Parameters: 2
	Flags: None
*/
function function_dd2493cc(local_client_num, objid)
{
	while(!isdefined(level.var_2c71eaf8[0]))
	{
		waitframe(1);
	}
	zone_index = level.zoneindices[objid];
	if(!isdefined(zone_index))
	{
		return;
	}
	iscodcaster = codcaster::function_b8fe9b52(local_client_num);
	team = serverobjective_getobjectiveteam(local_client_num, objid);
	if(iscodcaster)
	{
		var_4bb78aa3 = function_8147db19(local_client_num, objid, #"allies");
		var_c7fc4f01 = function_8147db19(local_client_num, objid, #"axis");
	}
	else
	{
		friendlyteam = function_9b3f0ed1(local_client_num);
		enemyteam = util::get_enemy_team(friendlyteam);
		var_4bb78aa3 = function_8147db19(local_client_num, objid, friendlyteam);
		var_c7fc4f01 = function_8147db19(local_client_num, objid, enemyteam);
	}
	suffix = (iscodcaster ? "_codcaster" : "");
	state = 0;
	if(var_4bb78aa3)
	{
		state = 1;
	}
	if(var_c7fc4f01)
	{
		state = 2;
	}
	if(var_4bb78aa3 && var_c7fc4f01)
	{
		state = 3;
	}
	if(isdefined(level.othervisuals[zone_index]))
	{
		foreach(entid in level.othervisuals[zone_index])
		{
			entity = getentbynum(local_client_num, entid);
			if(!isdefined(entity))
			{
				continue;
			}
			for(var_e8c72d8f = 0; var_e8c72d8f < 4; var_e8c72d8f++)
			{
				rob = level.var_117b4a3a[var_e8c72d8f] + suffix;
				if(entity function_d2503806(rob))
				{
					if(state != var_e8c72d8f)
					{
						entity function_5d482e78(rob);
					}
					continue;
				}
				if(state == var_e8c72d8f)
				{
					entity function_bf9d3071(rob);
					if(iscodcaster)
					{
						codcaster::function_773f6e31(local_client_num, entity, rob, state);
						continue;
					}
					util::function_f5b24d2d(local_client_num, entity, rob, state);
				}
			}
		}
	}
}

/*
	Name: function_e116df6c
	Namespace: control
	Checksum: 0xC91350E
	Offset: 0xD48
	Size: 0x284
	Parameters: 7
	Flags: None
*/
function function_e116df6c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump != fieldname || !isdefined(self.script_index))
	{
		script_index = bwastimejump;
		self.script_index = script_index;
		if(!isdefined(level.othervisuals[script_index]))
		{
			level.othervisuals[script_index] = [];
		}
		entnum = self getentitynumber();
		if(!isinarray(level.othervisuals[script_index], entnum))
		{
			if(!isdefined(level.othervisuals[script_index]))
			{
				level.othervisuals[script_index] = [];
			}
			else if(!isarray(level.othervisuals[script_index]))
			{
				level.othervisuals[script_index] = array(level.othervisuals[script_index]);
			}
			if(!isinarray(level.othervisuals[script_index], entnum))
			{
				level.othervisuals[script_index][level.othervisuals[script_index].size] = entnum;
			}
			iscodcaster = codcaster::function_b8fe9b52(binitialsnap);
			suffix = (iscodcaster ? "_codcaster" : "");
			rob = level.var_117b4a3a[0] + suffix;
			if(!self function_d2503806(rob))
			{
				self function_bf9d3071(rob);
			}
			if(iscodcaster)
			{
				codcaster::function_773f6e31(binitialsnap, self, rob, 0);
			}
			else
			{
				util::function_f5b24d2d(binitialsnap, self, rob, 0);
			}
		}
	}
}

/*
	Name: on_localclient_connect
	Namespace: control
	Checksum: 0x6D7997A6
	Offset: 0xFD8
	Size: 0x12C
	Parameters: 1
	Flags: None
*/
function on_localclient_connect(local_client_num)
{
	zone_count = 3;
	while(!isdefined(level.var_2c71eaf8[0]))
	{
		for(zi = 0; zi < zone_count; zi++)
		{
			level.var_2c71eaf8[zi] = serverobjective_getobjective(local_client_num, "control_" + zi);
		}
		waitframe(1);
	}
	for(zi = 0; zi < zone_count; zi++)
	{
		if(isdefined(level.var_2c71eaf8[zi]))
		{
			level.zoneindices[level.var_2c71eaf8[zi]] = zi + 1;
		}
	}
	if(is_true(getgametypesetting(#"hash_4091f2d0019b1f4a")))
	{
		lui::function_ca036b2c(local_client_num, "control_zone_trigger");
	}
}

/*
	Name: function_64ffa588
	Namespace: control
	Checksum: 0x15096F60
	Offset: 0x1110
	Size: 0x200
	Parameters: 1
	Flags: None
*/
function function_64ffa588(local_client_num)
{
	effects = [];
	effects[#"zoneedgemarker"] = level._effect[#"zoneedgemarker"];
	effects[#"zoneedgemarkerwndw"] = level._effect[#"zoneedgemarkerwndw"];
	effects[#"zoneedgemarker"][2] = #"hash_682365220f952226";
	effects[#"zoneedgemarker"][1] = #"hash_5c0d472966d09d41";
	effects[#"zoneedgemarker"][3] = [];
	effects[#"zoneedgemarker"][3][2] = #"hash_3d943e08d321081c";
	effects[#"zoneedgemarker"][3][1] = #"hash_6328e922e5ef809f";
	effects[#"zoneedgemarkerwndw"][2] = #"hash_6bfa43a02f3672e3";
	effects[#"zoneedgemarkerwndw"][1] = #"hash_7e0524ef3f409d16";
	effects[#"zoneedgemarkerwndw"][3] = [];
	effects[#"zoneedgemarkerwndw"][3][2] = #"hash_252ee62d9ea8dcc9";
	effects[#"zoneedgemarkerwndw"][3][1] = #"hash_7495c7dec3ebf9dc";
	return effects;
}

/*
	Name: get_fx_state
	Namespace: control
	Checksum: 0x978E5CEB
	Offset: 0x1318
	Size: 0x100
	Parameters: 4
	Flags: None
*/
function get_fx_state(local_client_num, state, attackers, var_b8fe9b52)
{
	if(var_b8fe9b52)
	{
		if(attackers == #"allies")
		{
			return state;
		}
		if(state == 1)
		{
			return 2;
		}
		if(state == 2)
		{
			return 1;
		}
		return state;
	}
	if(state == 1)
	{
		if(function_9b3f0ed1(local_client_num) != attackers)
		{
			return 1;
		}
		return 2;
	}
	if(state == 2)
	{
		if(function_9b3f0ed1(local_client_num) == attackers)
		{
			return 1;
		}
		return 2;
	}
	return state;
}

/*
	Name: get_fx
	Namespace: control
	Checksum: 0x6E1EDB96
	Offset: 0x1420
	Size: 0x26
	Parameters: 3
	Flags: None
*/
function get_fx(fx_name, fx_state, effects)
{
	return effects[fx_name][fx_state];
}

/*
	Name: get_attacking_team
	Namespace: control
	Checksum: 0xE018D3A
	Offset: 0x1450
	Size: 0x62
	Parameters: 0
	Flags: Private
*/
function private get_attacking_team()
{
	attackers_key = codegetworlduimodelfield("hudItems.war.attackingTeam");
	attackers = #"allies";
	if(attackers_key == 2)
	{
		attackers = #"axis";
	}
	return attackers;
}

/*
	Name: function_6e3affdc
	Namespace: control
	Checksum: 0xE9482513
	Offset: 0x14C0
	Size: 0xDC
	Parameters: 0
	Flags: None
*/
function function_6e3affdc()
{
	local_client_num = self getlocalclientnumber();
	if(isdefined(local_client_num))
	{
		foreach(objid in level.var_2c71eaf8)
		{
			function_dd2493cc(local_client_num, objid);
		}
		if(isdefined(level.current_zone_state_mask))
		{
			setup_warzone_fx(local_client_num);
		}
	}
}

/*
	Name: setup_warzone_fx
	Namespace: control
	Checksum: 0x5A431C8C
	Offset: 0x15A8
	Size: 0x39C
	Parameters: 1
	Flags: None
*/
function setup_warzone_fx(local_client_num)
{
	for(zi = 0; zi < level.zones.size; zi++)
	{
		zonestate = (level.current_zone_state_mask[local_client_num] >> (zi * 2)) & 3;
		effects = [];
		if(codcaster::function_b8fe9b52(local_client_num))
		{
			effects = function_64ffa588(local_client_num);
		}
		else
		{
			effects[#"zoneedgemarker"] = level._effect[#"zoneedgemarker"];
			effects[#"zoneedgemarkerwndw"] = level._effect[#"zoneedgemarkerwndw"];
		}
		if(isdefined(level.warzonefx[local_client_num][zi]))
		{
			foreach(fx in level.warzonefx[local_client_num][zi])
			{
				stopfx(local_client_num, fx);
			}
		}
		level.warzonefx[local_client_num][zi] = [];
		if(level.current_zone_mask[local_client_num] & (1 << zi))
		{
			if(isdefined(level.visuals[zi]))
			{
				attackers = get_attacking_team();
				fx_state = get_fx_state(local_client_num, zonestate, attackers, codcaster::function_b8fe9b52(local_client_num));
				foreach(visual in level.visuals[zi])
				{
					if(!isdefined(visual.script_fxid))
					{
						continue;
					}
					fxid = get_fx(visual.script_fxid, fx_state, effects);
					if(isarray(fxid))
					{
						zonestate = 2;
						function_ca8ebccf(local_client_num, visual, fxid[zonestate], zi, zonestate, attackers);
						zonestate = 1;
						function_ca8ebccf(local_client_num, visual, fxid[zonestate], zi, zonestate, attackers);
						continue;
					}
					function_ca8ebccf(local_client_num, visual, fxid, zi, zonestate, attackers);
				}
			}
		}
	}
	thread watch_for_team_change(local_client_num);
}

/*
	Name: function_ca8ebccf
	Namespace: control
	Checksum: 0xB395B909
	Offset: 0x1950
	Size: 0x164
	Parameters: 6
	Flags: Private
*/
function private function_ca8ebccf(local_client_num, visual, fxid, zi, zonestate, attackers)
{
	if(isdefined(visual.angles))
	{
		forward = anglestoforward(visual.angles);
	}
	else
	{
		forward = (0, 0, 0);
	}
	fxhandle = playfx(local_client_num, fxid, visual.origin, forward);
	level.warzonefx[local_client_num][zi][level.warzonefx[local_client_num][zi].size] = fxhandle;
	if(isdefined(fxhandle))
	{
		if(zonestate == 2)
		{
			setfxteam(local_client_num, fxhandle, attackers);
		}
		else
		{
			if(zonestate == 1)
			{
				defenders = util::get_other_team(attackers);
				setfxteam(local_client_num, fxhandle, defenders);
			}
			else
			{
				setfxteam(local_client_num, fxhandle, #"none");
			}
		}
	}
}

/*
	Name: compare_zone_indicies
	Namespace: control
	Checksum: 0x618F4AC8
	Offset: 0x1AC0
	Size: 0xE8
	Parameters: 2
	Flags: None
*/
function compare_zone_indicies(zone_a, zone_b)
{
	script_index_a = zone_a.script_index;
	script_index_b = zone_b.script_index;
	if(!isdefined(script_index_a) && !isdefined(script_index_b))
	{
		return false;
	}
	if(!isdefined(script_index_a) && isdefined(script_index_b))
	{
		/#
			println("" + zone_a.origin);
		#/
		return true;
	}
	if(isdefined(script_index_a) && !isdefined(script_index_b))
	{
		/#
			println("" + zone_b.origin);
		#/
		return false;
	}
	if(script_index_a > script_index_b)
	{
		return true;
	}
	return false;
}

/*
	Name: get_zone_array
	Namespace: control
	Checksum: 0x1CE9D806
	Offset: 0x1BB0
	Size: 0x29E
	Parameters: 0
	Flags: None
*/
function get_zone_array()
{
	allzones = struct::get_array("control_zone_center", "targetname");
	if(allzones.size > 1)
	{
		if(!isdefined(allzones))
		{
			return;
		}
		zoneindices = [];
		numberofzones = allzones.size;
		for(i = 0; i < numberofzones; i++)
		{
			fieldname = ("zoneinfo" + numberofzones) + (i + 1);
			index = (isdefined(level.mission_bundle.(fieldname)) ? level.mission_bundle.(fieldname) : 0);
			zoneindices[zoneindices.size] = index;
		}
		zones = [];
		for(i = 0; i < allzones.size; i++)
		{
			ind = allzones[i].script_index;
			if(isdefined(ind))
			{
				for(j = 0; j < zoneindices.size; j++)
				{
					if(zoneindices[j] == ind)
					{
						zones[zones.size] = allzones[i];
						break;
					}
				}
			}
		}
	}
	else
	{
		zones = struct::get_array("control_zone_center", "targetname");
	}
	if(!isdefined(zones))
	{
		return undefined;
	}
	swapped = 1;
	n = zones.size;
	while(swapped)
	{
		swapped = 0;
		for(i = 0; i < n - 1; i++)
		{
			if(compare_zone_indicies(zones[i], zones[i + 1]))
			{
				temp = zones[i];
				zones[i] = zones[i + 1];
				zones[i + 1] = temp;
				swapped = 1;
			}
		}
		n--;
	}
	for(i = 0; i < zones.size; i++)
	{
		zones[i].zone_index = i;
	}
	return zones;
}

/*
	Name: warzone
	Namespace: control
	Checksum: 0x7B937E89
	Offset: 0x1E58
	Size: 0x22C
	Parameters: 7
	Flags: None
*/
function warzone(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(level.zones.size == 0)
	{
		level.zones = get_zone_array();
		for(zi = 0; zi < level.zones.size; zi++)
		{
			if(isdefined(level.zones[zi].target))
			{
				level.visuals[zi] = struct::get_array(level.zones[zi].target, "targetname");
			}
			level.zones[zi].objectiveid = serverobjective_getobjective(binitialsnap, "control_" + zi);
			level.zones[zi].var_6d7365a9 = spawn(0, level.zones[zi].origin, "script_origin");
			level.zones[zi].var_ce6accbd = 0;
		}
		level notify(#"hash_3f294ebbb7ff9154");
	}
	level.current_zone_mask[binitialsnap] = bwastimejump;
	for(zi = 0; zi < level.zones.size; zi++)
	{
		if((fieldname & (1 << zi)) != (bwastimejump & (1 << zi)))
		{
			level.current_zone_state_mask[binitialsnap] = level.current_zone_state_mask[binitialsnap] & (~(3 << zi));
		}
	}
	setup_warzone_fx(binitialsnap);
}

/*
	Name: warzone_state
	Namespace: control
	Checksum: 0x16D94FA0
	Offset: 0x2090
	Size: 0x74
	Parameters: 7
	Flags: None
*/
function warzone_state(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump != level.current_zone_state_mask[fieldname])
	{
		level.current_zone_state_mask[fieldname] = bwastimejump;
		setup_warzone_fx(fieldname);
	}
}

/*
	Name: watch_for_team_change
	Namespace: control
	Checksum: 0xC466E663
	Offset: 0x2110
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function watch_for_team_change(localclientnum)
{
	level notify(#"end_team_change_watch");
	level endon(#"end_team_change_watch");
	level waittill(#"team_changed");
	thread setup_warzone_fx(localclientnum);
}

/*
	Name: function_185b0894
	Namespace: control
	Checksum: 0x34962394
	Offset: 0x2180
	Size: 0x284
	Parameters: 3
	Flags: None
*/
function function_185b0894(localclientnum, oldval, newval)
{
	level endon(#"game_ended");
	self notify("2d51bad247b8c8a1");
	self endon("2d51bad247b8c8a1");
	var_4a614782 = 0.8;
	var_9a7dc638 = 1;
	var_f802a6b1 = 255;
	var_8261032c = 1 / var_f802a6b1;
	waitresult = undefined;
	waitresult = level waittill(#"hash_3f294ebbb7ff9154");
	while(true)
	{
		foreach(zone in level.zones)
		{
			if(!isdefined(zone.objectiveid))
			{
				continue;
			}
			progress = serverobjective_getobjectiveprogress(newval, zone.objectiveid);
			change = progress - (isdefined(zone.lastprogress) ? zone.lastprogress : 0);
			if(change <= 0)
			{
				if(zone.var_ce6accbd)
				{
					zone.var_6d7365a9 stoploopsound(zone.soundid);
					zone.var_ce6accbd = 0;
				}
			}
			else
			{
				if(!zone.var_ce6accbd)
				{
					zone.soundid = zone.var_6d7365a9 playloopsound(#"hash_5a0b392405d5f148");
					zone.var_ce6accbd = 1;
				}
				var_535a15b1 = var_4a614782 + (var_9a7dc638 * (progress * var_8261032c));
				setsoundpitch(zone.soundid, var_535a15b1);
			}
			zone.lastprogress = progress;
		}
		wait(0.25);
	}
}

