#using scripts\weapons\deployable.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace smart_cover;

/*
	Name: init_shared
	Namespace: smart_cover
	Checksum: 0xE53AF55F
	Offset: 0x248
	Size: 0x27C
	Parameters: 0
	Flags: Linked
*/
function init_shared()
{
	callback::on_localplayer_spawned(&on_local_player_spawned);
	clientfield::register("scriptmover", "smartcover_placed", 1, 5, "float", &smartcover_placed, 0, 0);
	clientfield::register_clientuimodel("hudItems.smartCoverState", #"hud_items", #"hash_5900ed71df246132", 1, 1, "int", undefined, 0, 0);
	clientfield::register("scriptmover", "start_smartcover_microwave", 1, 1, "int", &smartcover_start_microwave, 0, 0);
	level.var_5101157d = spawnstruct();
	level.var_5101157d.previewmodels = [];
	level.var_5101157d.var_aef370a9 = [];
	level.var_5101157d.weapon = getweapon(#"ability_smart_cover");
	deployable::register_deployable(level.var_5101157d.weapon, 1);
	if(sessionmodeismultiplayergame())
	{
		level.var_5101157d.bundle = getscriptbundle(#"hash_25c242b3e86ced05");
	}
	else
	{
		if(sessionmodeiswarzonegame())
		{
			level.var_5101157d.bundle = getscriptbundle(#"smartcover_settings_wz");
		}
		else if(sessionmodeiscampaigngame())
		{
			level.var_5101157d.bundle = getscriptbundle(#"hash_25a046b3e8500d6b");
		}
	}
	setupdvars();
}

/*
	Name: setupdvars
	Namespace: smart_cover
	Checksum: 0xE105F2A1
	Offset: 0x4D0
	Size: 0x284
	Parameters: 0
	Flags: Linked
*/
function setupdvars()
{
	setdvar(#"hash_25f7092e7c7b66f2", 0);
	setdvar(#"hash_4332205cbf1cc384", 0);
	setdvar(#"smartcover_drawtime", 1000);
	setdvar(#"hash_436fc2fad44e9041", 1);
	setdvar(#"hash_1d8eb304f5cf8033", 0);
	setdvar(#"smartcover_tracedistance", level.var_5101157d.bundle.var_1f0ae388);
	setdvar(#"hash_13c23fd3a4387b84", 8);
	setdvar(#"hash_55a8dba3350b8b7c", 4);
	setdvar(#"hash_4f4ce3cb18b004bc", 10);
	setdvar(#"hash_417afa70d515fba5", (isdefined(level.var_5101157d.bundle.var_76d79155) ? level.var_5101157d.bundle.var_76d79155 : 0));
	setdvar(#"hash_71f8bd4cd30de4b3", (isdefined(level.var_5101157d.bundle.var_e35fc674) ? level.var_5101157d.bundle.var_e35fc674 : 0));
	setdvar(#"hash_39a564d4801c4b2e", (isdefined(level.var_5101157d.bundle.var_1f0ae388) ? level.var_5101157d.bundle.var_1f0ae388 : 0));
}

/*
	Name: smartcover_start_microwave
	Namespace: smart_cover
	Checksum: 0xB9F20EF6
	Offset: 0x760
	Size: 0xAE
	Parameters: 7
	Flags: Linked
*/
function smartcover_start_microwave(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
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
	Checksum: 0x79EDB3A5
	Offset: 0x818
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
	Checksum: 0x21AC2325
	Offset: 0x9B8
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
	foreach(previewmodel in level.var_5101157d.previewmodels[localclientnum])
	{
		previewmodel hide();
	}
}

/*
	Name: function_fd04d5d5
	Namespace: smart_cover
	Checksum: 0x15FC8CD8
	Offset: 0xA80
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
	Checksum: 0xAD38CBDD
	Offset: 0xAD8
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
				previewmodel = player function_8fb44aff(localclientnum, var_b43e8dc2.origin, var_b43e8dc2.angles, var_b43e8dc2.isvalid, 0, 1);
			}
			else
			{
				previewmodel = player function_8fb44aff(localclientnum, var_b43e8dc2.origin, var_b43e8dc2.angles, var_b43e8dc2.isvalid, 2, 3);
				previewmodel function_dbaf4647(localclientnum);
				previewmodel function_5a8becdc(localclientnum, player, var_b43e8dc2, 1);
			}
		}
	}
}

/*
	Name: function_59605cb
	Namespace: smart_cover
	Checksum: 0xD37473BC
	Offset: 0xDE8
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
	Checksum: 0x51BA817C
	Offset: 0xE40
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
	Checksum: 0x871C094B
	Offset: 0xEC8
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
	Checksum: 0x79315720
	Offset: 0xF48
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
	Checksum: 0xF97CAAAB
	Offset: 0xF60
	Size: 0x88
	Parameters: 2
	Flags: Linked
*/
function function_641491ac(localclientnum, modelname)
{
	previewmodel = spawn(localclientnum, (0, 0, 0), "script_model");
	previewmodel setmodel(modelname);
	previewmodel hide();
	previewmodel notsolid();
	return previewmodel;
}

/*
	Name: function_722fc669
	Namespace: smart_cover
	Checksum: 0x8482444C
	Offset: 0xFF0
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
	Checksum: 0x362BD844
	Offset: 0x1168
	Size: 0x19E
	Parameters: 6
	Flags: Linked
*/
function function_8fb44aff(localclientnum, origin, angles, isvalid, var_eb65925c, var_4b3e5e0a)
{
	player = self;
	previewmodel = undefined;
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
	Checksum: 0xF34139EF
	Offset: 0x1310
	Size: 0x70
	Parameters: 2
	Flags: Linked
*/
function function_d66a0190(row, column)
{
	cellindex = (row * level.var_5101157d.bundle.rowcount) + column;
	if(cellindex < 10)
	{
		return "joint_0" + cellindex;
	}
	return "joint_" + cellindex;
}

/*
	Name: function_dbaf4647
	Namespace: smart_cover
	Checksum: 0xE825F0B4
	Offset: 0x1388
	Size: 0xC4
	Parameters: 1
	Flags: Linked
*/
function function_dbaf4647(localclientnum)
{
	smartcover = self;
	for(rowindex = 0; rowindex < level.var_5101157d.bundle.rowcount; rowindex++)
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
	Checksum: 0xDC3F7B86
	Offset: 0x1458
	Size: 0x444
	Parameters: 4
	Flags: Linked
*/
function function_5a8becdc(localclientnum, player, buildinfo, var_4b1c8937)
{
	smartcover = self;
	var_59cc3b18 = level.var_5101157d.bundle.maxheight / level.var_5101157d.bundle.rowcount;
	cellwidth = level.var_5101157d.bundle.maxwidth / level.var_5101157d.bundle.var_b118698f;
	var_b963136f = int(var_4b1c8937.width / cellwidth);
	var_227adab7 = var_4b1c8937.width - (cellwidth * var_b963136f);
	if(var_227adab7 > 0 && (var_227adab7 / 2) < level.var_5101157d.bundle.var_3dfbdbeb && (var_b963136f + 2) <= level.var_5101157d.bundle.var_b118698f)
	{
		var_b963136f = var_b963136f + 2;
	}
	var_9de92bd5 = int(var_4b1c8937.height / var_59cc3b18);
	var_2582dbd = var_4b1c8937.height - (var_59cc3b18 * var_9de92bd5);
	if(var_2582dbd > 0 && var_2582dbd < level.var_5101157d.bundle.var_3dfbdbeb && var_2582dbd < level.var_5101157d.bundle.rowcount)
	{
		var_9de92bd5++;
	}
	var_5e91d5a8 = [];
	var_e465f403 = level.var_5101157d.bundle.rowcount - var_9de92bd5;
	for(rowindex = 0; rowindex < var_e465f403; rowindex++)
	{
		rownum = (level.var_5101157d.bundle.rowcount - rowindex) - 1;
		for(colindex = 1; colindex < level.var_5101157d.bundle.var_b118698f; colindex++)
		{
			var_c4027b0a = function_d66a0190(rownum, colindex);
			smartcover hidepart(buildinfo, var_c4027b0a);
		}
	}
	var_f636c423 = level.var_5101157d.bundle.var_b118698f - var_b963136f;
	for(var_688bc60 = 0; var_688bc60 < int(var_f636c423 / 2); var_688bc60++)
	{
		cola = var_688bc60 + 1;
		colb = level.var_5101157d.bundle.var_b118698f - var_688bc60;
		for(rowindex = 0; rowindex < level.var_5101157d.bundle.rowcount; rowindex++)
		{
			microwave_sh_turr = function_d66a0190(rowindex, cola);
			var_1ffc0b2e = function_d66a0190(rowindex, colb);
			smartcover hidepart(buildinfo, microwave_sh_turr);
			smartcover hidepart(buildinfo, var_1ffc0b2e);
		}
	}
}

/*
	Name: debug_trace
	Namespace: smart_cover
	Checksum: 0x1C6105DE
	Offset: 0x18A8
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
	Checksum: 0x9F95270E
	Offset: 0x1998
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
	Checksum: 0xF8947D90
	Offset: 0x1E50
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
	Checksum: 0x5BCAAF7B
	Offset: 0x1FD8
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
	Checksum: 0x2955E51F
	Offset: 0x20C0
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
	Checksum: 0xAC35106
	Offset: 0x2188
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
	Checksum: 0x649CD1A1
	Offset: 0x2208
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
	Checksum: 0x5439FAF8
	Offset: 0x22A8
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
	Checksum: 0x9BB57BFD
	Offset: 0x23A0
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

