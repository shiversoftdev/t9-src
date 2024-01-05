#using scripts\core_common\lui_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\util_shared.csc;
#using script_13da4e6b98ca81a1;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace dom;

/*
	Name: main
	Namespace: dom
	Checksum: 0x3BD530A3
	Offset: 0x210
	Size: 0x5DC
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	callback::on_localclient_connect(&on_localclient_connect);
	if(getgametypesetting(#"silentplant") != 0)
	{
		setsoundcontext("bomb_plant", "silent");
	}
	clientfield::register("scriptmover", "scriptid", 1, 5, "int", &function_e116df6c, 0, 0);
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
	level.zonemarkers = [];
	level.zonemarkers[#"a"] = struct::get_array("doma", "targetname");
	level.zonemarkers[#"b"] = struct::get_array("domb", "targetname");
	level.zonemarkers[#"c"] = struct::get_array("domc", "targetname");
	level.zonemarkers[#"d"] = struct::get_array("domd", "targetname");
	level.zonemarkers[#"e"] = struct::get_array("dome", "targetname");
	level.zonemarkers[#"f"] = struct::get_array("domf", "targetname");
	level.othervisuals = [];
	fields = getmapfields();
	level.var_117b4a3a = [];
	level.var_117b4a3a[0] = (isdefined(fields.var_306136ca) ? fields.var_306136ca : #"hash_280d5153e1276d");
	level.var_117b4a3a[1] = (isdefined(fields.var_e1ef0bf1) ? fields.var_e1ef0bf1 : #"hash_4b1a3a0285bea14d");
	level.var_117b4a3a[2] = (isdefined(fields.var_97278b57) ? fields.var_97278b57 : #"hash_36a94457406aea0e");
	level.var_117b4a3a[3] = (isdefined(fields.var_29209af9) ? fields.var_29209af9 : #"hash_5a60154937b01557");
	level.var_117b4a3a[4] = (isdefined(fields.var_cd9dabc7) ? fields.var_cd9dabc7 : #"hash_c102abd4eb802c2");
	level.var_117b4a3a[5] = (isdefined(fields.var_66b704d1) ? fields.var_66b704d1 : #"hash_1f6942044733abd");
	level.var_117b4a3a[6] = (isdefined(fields.var_43647dc0) ? fields.var_43647dc0 : #"hash_5a5907512d97c7dc");
	level.var_117b4a3a[7] = (isdefined(fields.var_f605c142) ? fields.var_f605c142 : #"hash_1ebd257fc3bf9843");
	callback::on_spawned(&function_df78674f);
	callback::add_callback(#"hash_34e39ee0c9fa0092", &function_3022f6ba);
}

/*
	Name: function_3022f6ba
	Namespace: dom
	Checksum: 0xAA5954DF
	Offset: 0x7F8
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function function_3022f6ba(eventstruct)
{
	localclientnum = eventstruct.localclientnum;
	objid = eventstruct.id;
	function_dd2493cc(localclientnum, objid);
}

/*
	Name: function_64ffa588
	Namespace: dom
	Checksum: 0x6C1636EA
	Offset: 0x850
	Size: 0x200
	Parameters: 1
	Flags: None
*/
function function_64ffa588(local_client_num)
{
	effects = [];
	effects[#"zoneedgemarker"] = level._effect[#"zoneedgemarker"];
	effects[#"zoneedgemarkerwndw"] = level._effect[#"zoneedgemarkerwndw"];
	effects[#"zoneedgemarker"][1] = #"hash_682365220f952226";
	effects[#"zoneedgemarker"][2] = #"hash_5c0d472966d09d41";
	effects[#"zoneedgemarker"][3] = [];
	effects[#"zoneedgemarker"][3][1] = #"hash_3d943e08d321081c";
	effects[#"zoneedgemarker"][3][2] = #"hash_6328e922e5ef809f";
	effects[#"zoneedgemarkerwndw"][1] = #"hash_6bfa43a02f3672e3";
	effects[#"zoneedgemarkerwndw"][2] = #"hash_7e0524ef3f409d16";
	effects[#"zoneedgemarkerwndw"][3] = [];
	effects[#"zoneedgemarkerwndw"][3][1] = #"hash_252ee62d9ea8dcc9";
	effects[#"zoneedgemarkerwndw"][3][2] = #"hash_7495c7dec3ebf9dc";
	return effects;
}

/*
	Name: on_localclient_connect
	Namespace: dom
	Checksum: 0xC6870F3A
	Offset: 0xA58
	Size: 0x4A0
	Parameters: 1
	Flags: None
*/
function on_localclient_connect(localclientnum)
{
	level.domflags = [];
	level.var_4c3d5929 = [];
	while(!isdefined(level.domflags[#"a"]))
	{
		level.domflags[#"a"] = serverobjective_getobjective(localclientnum, "dom_a");
		level.domflags[#"b"] = serverobjective_getobjective(localclientnum, "dom_b");
		level.domflags[#"c"] = serverobjective_getobjective(localclientnum, "dom_c");
		level.domflags[#"d"] = serverobjective_getobjective(localclientnum, "dom_d");
		level.domflags[#"e"] = serverobjective_getobjective(localclientnum, "dom_e");
		level.domflags[#"f"] = serverobjective_getobjective(localclientnum, "dom_f");
		waitframe(1);
	}
	if(isdefined(level.domflags[#"a"]))
	{
		level.var_882f7b6a[level.domflags[#"a"]] = 1;
	}
	if(isdefined(level.domflags[#"b"]))
	{
		level.var_882f7b6a[level.domflags[#"b"]] = 2;
	}
	if(isdefined(level.domflags[#"c"]))
	{
		level.var_882f7b6a[level.domflags[#"c"]] = 3;
	}
	if(isdefined(level.domflags[#"d"]))
	{
		level.var_882f7b6a[level.domflags[#"d"]] = 4;
	}
	if(isdefined(level.domflags[#"e"]))
	{
		level.var_882f7b6a[level.domflags[#"e"]] = 5;
	}
	if(isdefined(level.domflags[#"f"]))
	{
		level.var_882f7b6a[level.domflags[#"f"]] = 6;
	}
	var_f06ec6c3 = getentarray(localclientnum, "flag_descriptor", "targetname");
	foreach(descriptor in var_f06ec6c3)
	{
		/#
			assert(isdefined(descriptor.target), ("" + descriptor.origin) + "");
		#/
		function_ca036b2c(localclientnum, descriptor.target);
	}
	foreach(flag_objective in level.domflags)
	{
		level thread monitor_flag_fx(localclientnum, flag_objective, key);
	}
}

/*
	Name: function_ca036b2c
	Namespace: dom
	Checksum: 0x659C89A7
	Offset: 0xF00
	Size: 0x64
	Parameters: 2
	Flags: None
*/
function function_ca036b2c(localclientnum, var_e0fe7fde)
{
	if(is_false(getgametypesetting(#"hash_4091f2d0019b1f4a")))
	{
		return;
	}
	lui::function_ca036b2c(localclientnum, var_e0fe7fde);
}

/*
	Name: function_e116df6c
	Namespace: dom
	Checksum: 0x512BD927
	Offset: 0xF70
	Size: 0x1C4
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
		if(!isdefined(level.othervisuals[script_index]))
		{
			level.othervisuals[script_index] = [];
		}
		else if(!isarray(level.othervisuals[script_index]))
		{
			level.othervisuals[script_index] = array(level.othervisuals[script_index]);
		}
		if(!isinarray(level.othervisuals[script_index], self getentitynumber()))
		{
			level.othervisuals[script_index][level.othervisuals[script_index].size] = self getentitynumber();
		}
		if(!self function_d2503806(level.var_117b4a3a[0]))
		{
			self playrenderoverridebundle(level.var_117b4a3a[0]);
		}
	}
}

/*
	Name: monitor_flag_fx
	Namespace: dom
	Checksum: 0x3F939577
	Offset: 0x1140
	Size: 0x396
	Parameters: 3
	Flags: None
*/
function monitor_flag_fx(localclientnum, flag_objective, flag_name)
{
	if(!isdefined(flag_objective))
	{
		return;
	}
	flag = spawnstruct();
	flag.name = flag_name;
	flag.objectiveid = flag_objective;
	flag.origin = serverobjective_getobjectiveorigin(localclientnum, flag_objective);
	flag.angles = (0, 0, 0);
	flag.var_28a64002 = struct::get_array("dom" + flag_name, "targetname");
	flag_entity = serverobjective_getobjectiveentity(localclientnum, flag_objective);
	if(isdefined(flag_entity))
	{
		flag.origin = flag_entity.origin;
		flag.angles = flag_entity.angles;
	}
	fx_name = get_base_fx(flag, #"neutral");
	play_base_fx(localclientnum, flag, fx_name, #"neutral");
	function_7f6bca11(localclientnum, flag_name, 0);
	flag.last_progress = 0;
	while(true)
	{
		team = serverobjective_getobjectiveteam(localclientnum, flag_objective);
		if(team != flag.last_team)
		{
			flag update_base_fx(localclientnum, flag, team);
			state = 0;
			if(team == #"allies")
			{
				state = 1;
			}
			else if(team == #"axis")
			{
				state = 2;
			}
			function_7f6bca11(localclientnum, flag_name, state);
		}
		progress = serverobjective_getobjectiveprogress(localclientnum, flag_objective) > 0;
		if(progress != flag.last_progress)
		{
			var_76587cfe = team;
			if(var_76587cfe == #"neutral")
			{
				var_4e8c1813 = serverobjective_getobjectivegamemodeflags(localclientnum, flag_objective);
				if(var_4e8c1813 == 2)
				{
					var_76587cfe = (codcaster::function_b8fe9b52(localclientnum) ? #"axis" : #"allies");
				}
				else if(var_4e8c1813 == 1)
				{
					var_76587cfe = (codcaster::function_b8fe9b52(localclientnum) ? #"allies" : #"axis");
				}
			}
			else if(codcaster::function_b8fe9b52(localclientnum))
			{
				var_76587cfe = util::get_other_team(var_76587cfe);
			}
			flag update_cap_fx(localclientnum, flag, var_76587cfe, progress);
		}
		waitframe(1);
	}
}

/*
	Name: play_base_fx
	Namespace: dom
	Checksum: 0x5B3D6E6B
	Offset: 0x14E0
	Size: 0xAA
	Parameters: 4
	Flags: None
*/
function play_base_fx(localclientnum, flag, fx_name, team)
{
	if(isdefined(fx_name.base_fx))
	{
		stopfx(flag, fx_name.base_fx);
	}
	up = anglestoup(fx_name.angles);
	forward = anglestoforward(fx_name.angles);
	fx_name.last_team = team;
}

/*
	Name: update_base_fx
	Namespace: dom
	Checksum: 0x15B875C8
	Offset: 0x1598
	Size: 0x172
	Parameters: 3
	Flags: None
*/
function update_base_fx(localclientnum, flag, team)
{
	fx_name = get_base_fx(flag, team);
	if(codcaster::function_b8fe9b52(localclientnum) && team != #"neutral")
	{
		fx_name = fx_name + (team == #"allies" ? "_codcaster_allies" : "_codcaster_axis");
	}
	if(team == #"neutral")
	{
		play_base_fx(localclientnum, flag, fx_name, team);
	}
	else
	{
		if(flag.last_team == #"neutral" || codcaster::function_b8fe9b52(localclientnum))
		{
			play_base_fx(localclientnum, flag, fx_name, team);
		}
		else
		{
			if(isdefined(flag.base_fx))
			{
				setfxteam(localclientnum, flag.base_fx, team);
			}
			flag.last_team = team;
		}
	}
}

/*
	Name: play_cap_fx
	Namespace: dom
	Checksum: 0x8B802513
	Offset: 0x1718
	Size: 0x9E
	Parameters: 4
	Flags: None
*/
function play_cap_fx(localclientnum, flag, fx_name, team)
{
	if(isdefined(team.cap_fx))
	{
		killfx(fx_name, team.cap_fx);
	}
	up = anglestoup(team.angles);
	forward = anglestoforward(team.angles);
}

/*
	Name: update_cap_fx
	Namespace: dom
	Checksum: 0xE1ABDD75
	Offset: 0x17C0
	Size: 0x11A
	Parameters: 4
	Flags: None
*/
function update_cap_fx(localclientnum, flag, team, progress)
{
	if(progress == 0)
	{
		if(isdefined(flag.cap_fx))
		{
			killfx(localclientnum, flag.cap_fx);
		}
		flag.last_progress = progress;
		return;
	}
	fx_name = get_cap_fx(flag, team);
	if(codcaster::function_b8fe9b52(localclientnum) && team != #"neutral")
	{
		fx_name = fx_name + (team == #"allies" ? "_codcaster_allies" : "_codcaster_axis");
	}
	play_cap_fx(localclientnum, flag, fx_name, team);
	flag.last_progress = progress;
}

/*
	Name: get_base_fx
	Namespace: dom
	Checksum: 0x2457CD19
	Offset: 0x18E8
	Size: 0x7A
	Parameters: 2
	Flags: None
*/
function get_base_fx(flag, team)
{
	if(isdefined(level.domflagbasefxoverride))
	{
		fx = [[level.domflagbasefxoverride]](flag, team);
		if(isdefined(fx))
		{
			return fx;
		}
	}
	if(team == #"neutral")
	{
		return "ui/fx_dom_marker_neutral";
	}
	return "ui/fx_dom_marker_team";
}

/*
	Name: get_cap_fx
	Namespace: dom
	Checksum: 0x647F3E7A
	Offset: 0x1970
	Size: 0x7A
	Parameters: 2
	Flags: None
*/
function get_cap_fx(flag, team)
{
	if(isdefined(level.domflagcapfxoverride))
	{
		fx = [[level.domflagcapfxoverride]](flag, team);
		if(isdefined(fx))
		{
			return fx;
		}
	}
	if(team == #"neutral")
	{
		return "ui/fx_dom_cap_indicator_neutral";
	}
	return "ui/fx_dom_cap_indicator_team";
}

/*
	Name: function_7f6bca11
	Namespace: dom
	Checksum: 0x6854A9CE
	Offset: 0x19F8
	Size: 0x318
	Parameters: 3
	Flags: None
*/
function function_7f6bca11(local_client_num, zone, state)
{
	effects = [];
	if(codcaster::function_39bce377(local_client_num))
	{
	}
	else
	{
		effects[#"zoneedgemarker"] = level._effect[#"zoneedgemarker"];
		effects[#"zoneedgemarkerwndw"] = level._effect[#"zoneedgemarkerwndw"];
	}
	if(isdefined(level.var_4c3d5929[local_client_num]) && isdefined(level.var_4c3d5929[local_client_num][zone]))
	{
		foreach(fx in level.var_4c3d5929[local_client_num][zone])
		{
			stopfx(local_client_num, fx);
		}
	}
	if(!isdefined(level.var_4c3d5929[local_client_num]))
	{
		level.var_4c3d5929[local_client_num] = [];
	}
	level.var_4c3d5929[local_client_num][zone] = [];
	if(isdefined(level.zonemarkers[zone]))
	{
		fx_state = get_fx_state(local_client_num, state, codcaster::function_b8fe9b52(local_client_num));
		foreach(visual in level.zonemarkers[zone])
		{
			if(!isdefined(visual.script_fxid))
			{
				continue;
			}
			fxid = get_fx(visual.script_fxid, fx_state, effects);
			if(isarray(fxid))
			{
				state = 1;
				function_ca8ebccf(local_client_num, zone, visual, fxid[state], state);
				state = 2;
				function_ca8ebccf(local_client_num, zone, visual, fxid[state], state);
				continue;
			}
			function_ca8ebccf(local_client_num, zone, visual, fxid, state);
		}
	}
}

/*
	Name: function_df78674f
	Namespace: dom
	Checksum: 0x25EB2F37
	Offset: 0x1D18
	Size: 0x118
	Parameters: 1
	Flags: None
*/
function function_df78674f(localclientnum)
{
	self endon(#"death", #"disconnect");
	while(!isdefined(level.domflags[#"a"]) || !isdefined(level.var_882f7b6a[level.domflags[#"a"]]))
	{
		waitframe(1);
	}
	if(isdefined(localclientnum))
	{
		foreach(objid in level.domflags)
		{
			function_dd2493cc(localclientnum, objid);
		}
	}
}

/*
	Name: function_dd2493cc
	Namespace: dom
	Checksum: 0xA3DFFBC3
	Offset: 0x1E38
	Size: 0x428
	Parameters: 2
	Flags: None
*/
function function_dd2493cc(local_client_num, objid)
{
	iscodcaster = codcaster::function_b8fe9b52(local_client_num);
	team = serverobjective_getobjectiveteam(local_client_num, objid);
	friendlyteam = function_9b3f0ed1(local_client_num);
	enemyteam = util::get_enemy_team(friendlyteam);
	if(iscodcaster)
	{
		var_4bb78aa3 = function_8147db19(local_client_num, objid, #"allies");
		var_c7fc4f01 = function_8147db19(local_client_num, objid, #"axis");
	}
	else
	{
		var_4bb78aa3 = function_8147db19(local_client_num, objid, friendlyteam);
		var_c7fc4f01 = function_8147db19(local_client_num, objid, enemyteam);
	}
	zone_index = level.var_882f7b6a[objid];
	suffix = (iscodcaster ? "_codcaster" : "");
	state = 0;
	if(friendlyteam == team)
	{
		state = 1;
	}
	if(enemyteam == team)
	{
		state = 2;
	}
	if(var_4bb78aa3 && (team == #"neutral" || team == #"none"))
	{
		state = 4;
	}
	if(var_4bb78aa3 && team == enemyteam)
	{
		state = 7;
	}
	if(var_c7fc4f01 && (team == #"neutral" || team == #"none"))
	{
		state = 5;
	}
	if(var_c7fc4f01 && team == friendlyteam)
	{
		state = 6;
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
			for(si = 0; si < level.var_117b4a3a.size; si++)
			{
				rob = level.var_117b4a3a[si] + suffix;
				if(entity function_d2503806(rob))
				{
					if(state != si)
					{
						entity stoprenderoverridebundle(rob);
					}
					continue;
				}
				if(state == si)
				{
					entity playrenderoverridebundle(rob);
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
	Name: function_ca8ebccf
	Namespace: dom
	Checksum: 0x2BE3DDFB
	Offset: 0x2268
	Size: 0x14C
	Parameters: 5
	Flags: Private
*/
function private function_ca8ebccf(local_client_num, zone, visual, fxid, state)
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
	level.var_4c3d5929[local_client_num][zone][level.var_4c3d5929[local_client_num][zone].size] = fxhandle;
	if(isdefined(fxhandle))
	{
		if(state == 1)
		{
			setfxteam(local_client_num, fxhandle, #"allies");
		}
		else
		{
			if(state == 2)
			{
				setfxteam(local_client_num, fxhandle, #"axis");
			}
			else
			{
				setfxteam(local_client_num, fxhandle, #"none");
			}
		}
	}
}

/*
	Name: get_fx
	Namespace: dom
	Checksum: 0x6459DD36
	Offset: 0x23C0
	Size: 0x26
	Parameters: 3
	Flags: None
*/
function get_fx(fx_name, fx_state, effects)
{
	return effects[fx_name][fx_state];
}

/*
	Name: get_fx_state
	Namespace: dom
	Checksum: 0xC2576063
	Offset: 0x23F0
	Size: 0xBC
	Parameters: 3
	Flags: None
*/
function get_fx_state(local_client_num, state, var_b8fe9b52)
{
	if(var_b8fe9b52)
	{
		return state;
	}
	if(state == 1)
	{
		if(function_9b3f0ed1(local_client_num) == #"allies")
		{
			return 1;
		}
		return 2;
	}
	if(state == 2)
	{
		if(function_9b3f0ed1(local_client_num) == #"axis")
		{
			return 1;
		}
		return 2;
	}
	return state;
}

