#using script_28212a1c4376c358;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_39000839;

/*
	Name: function_5f5d6b19
	Namespace: namespace_39000839
	Checksum: 0x86B5AD2F
	Offset: 0x248
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5f5d6b19()
{
	level notify(166199532);
}

#namespace smart_cover;

/*
	Name: init_shared
	Namespace: smart_cover
	Checksum: 0xB3C871E
	Offset: 0x268
	Size: 0x27C
	Parameters: 0
	Flags: Linked
*/
function init_shared()
{
	callback::on_localplayer_spawned(&on_local_player_spawned);
	clientfield::register("scriptmover", "smartcover_placed", 1, 5, "float", &smartcover_placed, 0, 0);
	clientfield::function_a8bbc967("hudItems.smartCoverState", #"hud_items", #"hash_5900ed71df246132", 1, 1, "int", undefined, 0, 0);
	clientfield::register("scriptmover", "start_smartcover_microwave", 1, 1, "int", &function_f80b166e, 0, 0);
	level.var_5101157d = spawnstruct();
	level.var_5101157d.previewmodels = [];
	level.var_5101157d.var_aef370a9 = [];
	level.var_5101157d.weapon = getweapon(#"ability_smart_cover");
	deployable::function_2e088f73(level.var_5101157d.weapon, 1);
	if(sessionmodeismultiplayergame())
	{
		level.var_5101157d.bundle = getscriptbundle(#"hash_25c242b3e86ced05");
	}
	else
	{
		if(function_f99d2668())
		{
			level.var_5101157d.bundle = getscriptbundle(#"hash_25e448b3e889dd9d");
		}
		else if(sessionmodeiscampaigngame())
		{
			level.var_5101157d.bundle = getscriptbundle(#"hash_25a046b3e8500d6b");
		}
	}
	function_8434338d();
}

/*
	Name: function_8434338d
	Namespace: smart_cover
	Checksum: 0x15D9DE8A
	Offset: 0x4F0
	Size: 0x284
	Parameters: 0
	Flags: Linked
*/
function function_8434338d()
{
	setdvar(#"hash_25f7092e7c7b66f2", 0);
	setdvar(#"hash_4332205cbf1cc384", 0);
	setdvar(#"hash_6e04e8c9b344f745", 1000);
	setdvar(#"hash_436fc2fad44e9041", 1);
	setdvar(#"hash_1d8eb304f5cf8033", 0);
	setdvar(#"hash_4c7f3e5c0af7fdc0", level.var_5101157d.bundle.var_1f0ae388);
	setdvar(#"hash_13c23fd3a4387b84", 8);
	setdvar(#"hash_55a8dba3350b8b7c", 4);
	setdvar(#"hash_4f4ce3cb18b004bc", 10);
	setdvar(#"hash_417afa70d515fba5", (isdefined(level.var_5101157d.bundle.var_76d79155) ? level.var_5101157d.bundle.var_76d79155 : 0));
	setdvar(#"hash_71f8bd4cd30de4b3", (isdefined(level.var_5101157d.bundle.var_e35fc674) ? level.var_5101157d.bundle.var_e35fc674 : 0));
	setdvar(#"hash_39a564d4801c4b2e", (isdefined(level.var_5101157d.bundle.var_1f0ae388) ? level.var_5101157d.bundle.var_1f0ae388 : 0));
}

/*
	Name: function_f80b166e
	Namespace: smart_cover
	Checksum: 0xE848ADF3
	Offset: 0x780
	Size: 0xAE
	Parameters: 7
	Flags: Linked
*/
function function_f80b166e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(is_true(level.var_5101157d.bundle.var_f4e0e7d7) && bwastimejump == 1)
	{
		self thread startmicrowavefx(fieldname);
	}
	else if(bwastimejump == 0)
	{
		self notify(#"beam_stop");
	}
}

/*
	Name: smartcover_placed
	Namespace: smart_cover
	Checksum: 0x98C08653
	Offset: 0x838
	Size: 0x194
	Parameters: 7
	Flags: Linked
*/
function smartcover_placed(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(self))
	{
		return;
	}
	self endon(#"death");
	self util::waittill_dobj(binitialsnap);
	if(!isdefined(level.var_5101157d.bundle.deployanim))
	{
		return;
	}
	self useanimtree("generic");
	if(fieldname == 1)
	{
		self setanimrestart(level.var_5101157d.bundle.deployanim, 1, 0, 1);
	}
	else if(bwastimejump)
	{
		var_e72a224a = self getanimtime(level.var_5101157d.bundle.deployanim);
		var_f56117a2 = 1 - fieldname;
		if(var_f56117a2 < var_e72a224a)
		{
			self setanimtime(level.var_5101157d.bundle.deployanim, var_f56117a2);
		}
	}
}

/*
	Name: function_112e3e89
	Namespace: smart_cover
	Checksum: 0x905DE0F2
	Offset: 0x9D8
	Size: 0xC0
	Parameters: 1
	Flags: Linked
*/
function function_112e3e89(localclientnum)
{
	if(!isdefined(level.var_5101157d.previewmodels[localclientnum]))
	{
		return;
	}
	foreach(var_688ed1a6 in level.var_5101157d.previewmodels[localclientnum])
	{
		var_688ed1a6 hide();
	}
}

/*
	Name: function_fd04d5d5
	Namespace: smart_cover
	Checksum: 0x86A1BBA2
	Offset: 0xAA0
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function function_fd04d5d5(localclientnum)
{
	player = self;
	player function_112e3e89(localclientnum);
	level.var_5101157d.var_aef370a9[localclientnum] = 0;
}

/*
	Name: function_1c2930c7
	Namespace: smart_cover
	Checksum: 0x18369020
	Offset: 0xAF8
	Size: 0x308
	Parameters: 1
	Flags: None
*/
function function_1c2930c7(localclientnum)
{
	player = function_5c10bd79(localclientnum);
	player notify(#"hash_5c7dbac0591cb11f");
	player endon(#"hash_5c7dbac0591cb11f", #"game_ended");
	level endon(#"game_ended");
	level.var_5101157d.var_aef370a9[localclientnum] = 1;
	function_722fc669(localclientnum);
	var_ccfe777 = 0;
	while(true)
	{
		waitframe(1);
		player = function_5c10bd79(localclientnum);
		if(!isdefined(player))
		{
			break;
		}
		var_b43e8dc2 = player function_287dcf4b(level.var_5101157d.bundle.var_63aab046, level.var_5101157d.bundle.maxwidth, 1, 1, level.var_5101157d.var_8d86ade8);
		if(!isdefined(var_b43e8dc2) && !var_ccfe777)
		{
			var_ccfe777 = 1;
			player function_112e3e89(localclientnum);
			player function_bf191832(0, (0, 0, 0), (0, 0, 0));
			continue;
		}
		else
		{
			if(isdefined(var_b43e8dc2) && var_ccfe777)
			{
				var_ccfe777 = 0;
			}
			else if(!isdefined(var_b43e8dc2))
			{
				player function_bf191832(0, (0, 0, 0), (0, 0, 0));
				continue;
			}
		}
		if((isdefined(level.var_5101157d.bundle.var_8fa9aac4) ? level.var_5101157d.bundle.var_8fa9aac4 : 0))
		{
			if(var_b43e8dc2.var_bf9ca9b0)
			{
				var_688ed1a6 = player function_8fb44aff(localclientnum, var_b43e8dc2.origin, var_b43e8dc2.angles, var_b43e8dc2.isvalid, 0, 1);
			}
			else
			{
				var_688ed1a6 = player function_8fb44aff(localclientnum, var_b43e8dc2.origin, var_b43e8dc2.angles, var_b43e8dc2.isvalid, 2, 3);
				var_688ed1a6 function_dbaf4647(localclientnum);
				var_688ed1a6 function_5a8becdc(localclientnum, player, var_b43e8dc2, 1);
			}
		}
	}
}

/*
	Name: function_59605cb
	Namespace: smart_cover
	Checksum: 0x547A52CC
	Offset: 0xE08
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function function_59605cb(localclientnum)
{
	player = self;
	player notify(#"hash_5c7dbac0591cb11f");
	player function_fd04d5d5(localclientnum);
}

/*
	Name: function_17d973ec
	Namespace: smart_cover
	Checksum: 0xECE7C345
	Offset: 0xE60
	Size: 0x7A
	Parameters: 1
	Flags: None
*/
function function_17d973ec(localclientnum)
{
	player = function_5c10bd79(localclientnum);
	player notify(#"hash_5c39bdc22418d792");
	player endon(#"hash_5c39bdc22418d792");
	if(!isdefined(player.smartcover))
	{
		player.smartcover = spawnstruct();
	}
}

/*
	Name: function_5d802b86
	Namespace: smart_cover
	Checksum: 0x2B7B0BF2
	Offset: 0xEE8
	Size: 0x78
	Parameters: 1
	Flags: None
*/
function function_5d802b86(localclientnum)
{
	player = self;
	player endon(#"disconnect");
	player waittill(#"death");
	player function_59605cb(localclientnum);
	player notify(#"hash_5c39bdc22418d792");
}

/*
	Name: on_local_player_spawned
	Namespace: smart_cover
	Checksum: 0xB7A60922
	Offset: 0xF68
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function on_local_player_spawned(localclientnum)
{
}

/*
	Name: function_641491ac
	Namespace: smart_cover
	Checksum: 0xC9D7752B
	Offset: 0xF80
	Size: 0x88
	Parameters: 2
	Flags: Linked
*/
function function_641491ac(localclientnum, modelname)
{
	var_688ed1a6 = spawn(localclientnum, (0, 0, 0), "script_model");
	var_688ed1a6 setmodel(modelname);
	var_688ed1a6 hide();
	var_688ed1a6 notsolid();
	return var_688ed1a6;
}

/*
	Name: function_722fc669
	Namespace: smart_cover
	Checksum: 0x642DF32F
	Offset: 0x1010
	Size: 0x16E
	Parameters: 1
	Flags: Linked
*/
function function_722fc669(localclientnum)
{
	player = self;
	if(isdefined(level.var_5101157d.previewmodels[localclientnum]))
	{
		return;
	}
	level.var_5101157d.previewmodels[localclientnum] = [];
	level.var_5101157d.previewmodels[localclientnum][0] = function_641491ac(localclientnum, level.var_5101157d.bundle.placementmodel);
	level.var_5101157d.previewmodels[localclientnum][1] = function_641491ac(localclientnum, level.var_5101157d.bundle.var_46732914);
	level.var_5101157d.previewmodels[localclientnum][2] = function_641491ac(localclientnum, level.var_5101157d.bundle.var_1b5c037d);
	level.var_5101157d.previewmodels[localclientnum][3] = function_641491ac(localclientnum, level.var_5101157d.bundle.var_76ac23f2);
}

/*
	Name: function_8fb44aff
	Namespace: smart_cover
	Checksum: 0xCDC04AA8
	Offset: 0x1188
	Size: 0x19E
	Parameters: 6
	Flags: Linked
*/
function function_8fb44aff(localclientnum, origin, angles, isvalid, var_eb65925c, var_4b3e5e0a)
{
	player = self;
	var_688ed1a6 = undefined;
	var_80f43370 = undefined;
	var_ff5a387e = (isvalid ? var_eb65925c : var_4b3e5e0a);
	for(var_a6932c26 = 0; var_a6932c26 < level.var_5101157d.previewmodels[localclientnum].size; var_a6932c26++)
	{
		if(var_a6932c26 == var_ff5a387e)
		{
			continue;
		}
		level.var_5101157d.previewmodels[localclientnum][var_a6932c26] hide();
	}
	level.var_5101157d.previewmodels[localclientnum][var_ff5a387e].origin = origin;
	level.var_5101157d.previewmodels[localclientnum][var_ff5a387e].angles = angles;
	level.var_5101157d.previewmodels[localclientnum][var_ff5a387e] show();
	player function_bf191832(0, origin, angles);
	return level.var_5101157d.previewmodels[localclientnum][var_ff5a387e];
}

/*
	Name: function_d66a0190
	Namespace: smart_cover
	Checksum: 0xA2982289
	Offset: 0x1330
	Size: 0x70
	Parameters: 2
	Flags: Linked
*/
function function_d66a0190(row, column)
{
	var_c21dfa9e = (row * level.var_5101157d.bundle.var_f0b4da50) + column;
	if(var_c21dfa9e < 10)
	{
		return "joint_0" + var_c21dfa9e;
	}
	return "joint_" + var_c21dfa9e;
}

/*
	Name: function_dbaf4647
	Namespace: smart_cover
	Checksum: 0x4BCBAD16
	Offset: 0x13A8
	Size: 0xC4
	Parameters: 1
	Flags: Linked
*/
function function_dbaf4647(localclientnum)
{
	smartcover = self;
	for(rowindex = 0; rowindex < level.var_5101157d.bundle.var_f0b4da50; rowindex++)
	{
		for(colindex = 1; colindex <= level.var_5101157d.bundle.var_b118698f; colindex++)
		{
			var_c4027b0a = function_d66a0190(rowindex, colindex);
			smartcover showpart(localclientnum, var_c4027b0a);
		}
	}
}

/*
	Name: function_5a8becdc
	Namespace: smart_cover
	Checksum: 0xFE1B24F
	Offset: 0x1478
	Size: 0x444
	Parameters: 4
	Flags: Linked
*/
function function_5a8becdc(localclientnum, player, var_7daa4df9, var_4b1c8937)
{
	smartcover = self;
	var_59cc3b18 = level.var_5101157d.bundle.maxheight / level.var_5101157d.bundle.var_f0b4da50;
	var_6d7689d4 = level.var_5101157d.bundle.maxwidth / level.var_5101157d.bundle.var_b118698f;
	var_b963136f = int(var_4b1c8937.width / var_6d7689d4);
	var_227adab7 = var_4b1c8937.width - (var_6d7689d4 * var_b963136f);
	if(var_227adab7 > 0 && (var_227adab7 / 2) < level.var_5101157d.bundle.var_3dfbdbeb && (var_b963136f + 2) <= level.var_5101157d.bundle.var_b118698f)
	{
		var_b963136f = var_b963136f + 2;
	}
	var_9de92bd5 = int(var_4b1c8937.height / var_59cc3b18);
	var_2582dbd = var_4b1c8937.height - (var_59cc3b18 * var_9de92bd5);
	if(var_2582dbd > 0 && var_2582dbd < level.var_5101157d.bundle.var_3dfbdbeb && var_2582dbd < level.var_5101157d.bundle.var_f0b4da50)
	{
		var_9de92bd5++;
	}
	var_5e91d5a8 = [];
	var_e465f403 = level.var_5101157d.bundle.var_f0b4da50 - var_9de92bd5;
	for(rowindex = 0; rowindex < var_e465f403; rowindex++)
	{
		rownum = (level.var_5101157d.bundle.var_f0b4da50 - rowindex) - 1;
		for(colindex = 1; colindex < level.var_5101157d.bundle.var_b118698f; colindex++)
		{
			var_c4027b0a = function_d66a0190(rownum, colindex);
			smartcover hidepart(var_7daa4df9, var_c4027b0a);
		}
	}
	var_f636c423 = level.var_5101157d.bundle.var_b118698f - var_b963136f;
	for(var_688bc60 = 0; var_688bc60 < int(var_f636c423 / 2); var_688bc60++)
	{
		cola = var_688bc60 + 1;
		var_b2d5a637 = level.var_5101157d.bundle.var_b118698f - var_688bc60;
		for(rowindex = 0; rowindex < level.var_5101157d.bundle.var_f0b4da50; rowindex++)
		{
			var_e5b19696 = function_d66a0190(rowindex, cola);
			var_1ffc0b2e = function_d66a0190(rowindex, var_b2d5a637);
			smartcover hidepart(var_7daa4df9, var_e5b19696);
			smartcover hidepart(var_7daa4df9, var_1ffc0b2e);
		}
	}
}

/*
	Name: debug_trace
	Namespace: smart_cover
	Checksum: 0xAB938A97
	Offset: 0x18C8
	Size: 0xE4
	Parameters: 2
	Flags: None
*/
function debug_trace(origin, trace)
{
	/#
		if(trace[#"fraction"] < 1)
		{
			color = (0.95, 0.05, 0.05);
		}
		else
		{
			color = (0.05, 0.95, 0.05);
		}
		sphere(trace[#"position"], 5, color, 0.75, 1, 10, 100);
		util::debug_line(origin, trace[#"position"], color, 100);
	#/
}

/*
	Name: startmicrowavefx
	Namespace: smart_cover
	Checksum: 0x6C479035
	Offset: 0x19B8
	Size: 0x4AC
	Parameters: 1
	Flags: Linked
*/
function startmicrowavefx(localclientnum)
{
	turret = self;
	turret endon(#"death");
	turret endon(#"beam_stop");
	turret.should_update_fx = 1;
	angles = turret.angles;
	origin = turret.origin + vectorscale((0, 0, 1), 30);
	microwavefxent = spawn(localclientnum, origin, "script_model");
	microwavefxent setmodel(#"tag_microwavefx");
	microwavefxent.angles = angles;
	microwavefxent.fxhandles = [];
	microwavefxent.fxnames = [];
	microwavefxent.fxhashs = [];
	self thread cleanupfx(localclientnum, microwavefxent);
	wait(0.3);
	while(true)
	{
		/#
			if(getdvarint(#"hash_93503b23ed2be27", 0))
			{
				turret.should_update_fx = 1;
				microwavefxent.fxhashs[#"center"] = 0;
			}
		#/
		if(turret.should_update_fx == 0)
		{
			wait(1);
			continue;
		}
		if(isdefined(level.last_microwave_turret_fx_trace) && level.last_microwave_turret_fx_trace == gettime())
		{
			waitframe(1);
			continue;
		}
		angles = turret.angles;
		origin = turret.origin + vectorscale((0, 0, 1), 30);
		forward = anglestoforward(angles);
		forward = vectorscale(forward, (isdefined(level.var_5101157d.bundle.var_b345c668) ? level.var_5101157d.bundle.var_b345c668 : 0) + 40);
		var_e2e9fefa = anglestoforward(angles + (0, 55 / 3, 0));
		var_e2e9fefa = vectorscale(var_e2e9fefa, (isdefined(level.var_5101157d.bundle.var_b345c668) ? level.var_5101157d.bundle.var_b345c668 : 0) + 40);
		trace = bullettrace(origin, origin + forward, 0, turret);
		traceright = bullettrace(origin, origin - var_e2e9fefa, 0, turret);
		traceleft = bullettrace(origin, origin + var_e2e9fefa, 0, turret);
		/#
			if(getdvarint(#"hash_93503b23ed2be27", 0))
			{
				debug_trace(origin, trace);
				debug_trace(origin, traceright);
				debug_trace(origin, traceleft);
			}
		#/
		need_to_rebuild = microwavefxent microwavefxhash(trace, origin, "center");
		need_to_rebuild = need_to_rebuild | microwavefxent microwavefxhash(traceright, origin, "right");
		need_to_rebuild = need_to_rebuild | microwavefxent microwavefxhash(traceleft, origin, "left");
		level.last_microwave_turret_fx_trace = gettime();
		if(!need_to_rebuild)
		{
			wait(1);
			continue;
		}
		wait(0.1);
		microwavefxent playmicrowavefx(localclientnum, trace, traceright, traceleft, origin, turret.team);
		turret.should_update_fx = 0;
		wait(1);
	}
}

/*
	Name: microwavefxhash
	Namespace: smart_cover
	Checksum: 0x790A1F84
	Offset: 0x1E70
	Size: 0x17A
	Parameters: 3
	Flags: Linked
*/
function microwavefxhash(trace, origin, name)
{
	hash = 0;
	counter = 2;
	for(i = 0; i < 5; i++)
	{
		endofhalffxsq = sqr((i * 150) + 125);
		endoffullfxsq = sqr((i * 150) + 200);
		tracedistsq = distancesquared(origin, trace[#"position"]);
		if(tracedistsq >= endofhalffxsq || i == 0)
		{
			if(tracedistsq < endoffullfxsq)
			{
				hash = hash + 1;
			}
			else
			{
				hash = hash + counter;
			}
		}
		counter = counter * 2;
	}
	if(!isdefined(self.fxhashs[name]))
	{
		self.fxhashs[name] = 0;
	}
	last_hash = self.fxhashs[name];
	self.fxhashs[name] = hash;
	return last_hash != hash;
}

/*
	Name: cleanupfx
	Namespace: smart_cover
	Checksum: 0xD3B08281
	Offset: 0x1FF8
	Size: 0xDC
	Parameters: 2
	Flags: Linked
*/
function cleanupfx(localclientnum, microwavefxent)
{
	self waittill(#"death", #"beam_stop");
	foreach(handle in microwavefxent.fxhandles)
	{
		if(isdefined(handle))
		{
			stopfx(localclientnum, handle);
		}
	}
	microwavefxent delete();
}

/*
	Name: play_fx_on_tag
	Namespace: smart_cover
	Checksum: 0xED10DC7C
	Offset: 0x20E0
	Size: 0xBC
	Parameters: 4
	Flags: Linked
*/
function play_fx_on_tag(localclientnum, fxname, tag, team)
{
	if(!isdefined(self.fxhandles[tag]) || fxname != self.fxnames[tag])
	{
		stop_fx_on_tag(localclientnum, fxname, tag);
		self.fxnames[tag] = fxname;
		self.fxhandles[tag] = util::playfxontag(localclientnum, fxname, self, tag);
		setfxteam(localclientnum, self.fxhandles[tag], team);
	}
}

/*
	Name: stop_fx_on_tag
	Namespace: smart_cover
	Checksum: 0x49CA91AD
	Offset: 0x21A8
	Size: 0x74
	Parameters: 3
	Flags: Linked
*/
function stop_fx_on_tag(localclientnum, fxname, tag)
{
	if(isdefined(self.fxhandles[tag]))
	{
		stopfx(fxname, self.fxhandles[tag]);
		self.fxhandles[tag] = undefined;
		self.fxnames[tag] = undefined;
	}
}

/*
	Name: render_debug_sphere
	Namespace: smart_cover
	Checksum: 0xE092676A
	Offset: 0x2228
	Size: 0x94
	Parameters: 3
	Flags: None
*/
function render_debug_sphere(tag, color, fxname)
{
	/#
		if(getdvarint(#"hash_93503b23ed2be27", 0))
		{
			origin = self gettagorigin(color);
			sphere(origin, 2, fxname, 0.75, 1, 10, 100);
		}
	#/
}

/*
	Name: stop_or_start_fx
	Namespace: smart_cover
	Checksum: 0x35777699
	Offset: 0x22C8
	Size: 0xEC
	Parameters: 5
	Flags: Linked
*/
function stop_or_start_fx(localclientnum, fxname, tag, start, team)
{
	if(start)
	{
		self play_fx_on_tag(localclientnum, fxname, tag, team);
		/#
			if(fxname == "")
			{
				render_debug_sphere(tag, vectorscale((1, 1, 0), 0.5), fxname);
			}
			else
			{
				render_debug_sphere(tag, (0, 1, 0), fxname);
			}
		#/
	}
	else
	{
		stop_fx_on_tag(localclientnum, fxname, tag);
		/#
			render_debug_sphere(tag, (1, 0, 0), fxname);
		#/
	}
}

/*
	Name: playmicrowavefx
	Namespace: smart_cover
	Checksum: 0x2CD8E481
	Offset: 0x23C0
	Size: 0x56A
	Parameters: 6
	Flags: Linked
*/
function playmicrowavefx(localclientnum, trace, traceright, traceleft, origin, team)
{
	for(i = 0; i < 5; i++)
	{
		endofhalffxsq = sqr((i * 150) + 125);
		endoffullfxsq = sqr((i * 150) + 200);
		tracedistsq = distancesquared(origin, trace[#"position"]);
		startfx = tracedistsq >= endofhalffxsq || i == 0;
		fxname = (tracedistsq < endoffullfxsq ? "weapon/fx8_equip_smart_cover_microwave_sm" : "weapon/fx8_equip_smart_cover_microwave");
		switch(i)
		{
			case 0:
			{
				self play_fx_on_tag(localclientnum, fxname, "tag_fx11", team);
				break;
			}
			case 1:
			{
				break;
			}
			case 2:
			{
				self stop_or_start_fx(localclientnum, fxname, "tag_fx32", startfx, team);
				break;
			}
			case 3:
			{
				self stop_or_start_fx(localclientnum, fxname, "tag_fx42", startfx, team);
				self stop_or_start_fx(localclientnum, fxname, "tag_fx43", startfx, team);
				break;
			}
			case 4:
			{
				self stop_or_start_fx(localclientnum, fxname, "tag_fx53", startfx, team);
				break;
			}
		}
		tracedistsq = distancesquared(origin, traceleft[#"position"]);
		startfx = tracedistsq >= endofhalffxsq;
		fxname = (tracedistsq < endoffullfxsq ? "weapon/fx8_equip_smart_cover_microwave_sm" : "weapon/fx8_equip_smart_cover_microwave");
		switch(i)
		{
			case 0:
			{
				break;
			}
			case 1:
			{
				self stop_or_start_fx(localclientnum, fxname, "tag_fx22", startfx, team);
				break;
			}
			case 2:
			{
				self stop_or_start_fx(localclientnum, fxname, "tag_fx33", startfx, team);
				break;
			}
			case 3:
			{
				self stop_or_start_fx(localclientnum, fxname, "tag_fx44", startfx, team);
				break;
			}
			case 4:
			{
				self stop_or_start_fx(localclientnum, fxname, "tag_fx54", startfx, team);
				self stop_or_start_fx(localclientnum, fxname, "tag_fx55", startfx, team);
				break;
			}
		}
		tracedistsq = distancesquared(origin, traceright[#"position"]);
		startfx = tracedistsq >= endofhalffxsq;
		fxname = (tracedistsq < endoffullfxsq ? "weapon/fx8_equip_smart_cover_microwave_sm" : "weapon/fx8_equip_smart_cover_microwave");
		switch(i)
		{
			case 0:
			{
				break;
			}
			case 1:
			{
				self stop_or_start_fx(localclientnum, fxname, "tag_fx21", startfx, team);
				break;
			}
			case 2:
			{
				self stop_or_start_fx(localclientnum, fxname, "tag_fx31", startfx, team);
				break;
			}
			case 3:
			{
				self stop_or_start_fx(localclientnum, fxname, "tag_fx41", startfx, team);
				break;
			}
			case 4:
			{
				self stop_or_start_fx(localclientnum, fxname, "tag_fx51", startfx, team);
				self stop_or_start_fx(localclientnum, fxname, "tag_fx52", startfx, team);
				break;
			}
		}
	}
}

