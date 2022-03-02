#using script_13da4e6b98ca81a1;
#using scripts\core_common\beam_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace gadget_tripwire;

/*
	Name: function_89f2df9
	Namespace: gadget_tripwire
	Checksum: 0x18CAD11F
	Offset: 0x1E0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"gadget_tripwire", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: gadget_tripwire
	Checksum: 0x877D6265
	Offset: 0x228
	Size: 0x254
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	callback::function_e9e16e2f(&function_330a13a6);
	callback::function_4f6cafea(&function_330a13a6);
	callback::add_callback(#"hash_2fc4cfecaed47583", &function_bd054816);
	clientfield::register("missile", "tripwire_state", 1, 2, "int", &function_6868fab3, 1, 1);
	clientfield::register("scriptmover", "tripwire_solo_beam_fx", 1, 1, "int", &function_9233eb94, 0, 0);
	level.var_c27600b0 = getweapon("eq_tripwire");
	if(isdefined(level.var_c27600b0.var_4dd46f8a))
	{
		level.var_c72e8c51 = getscriptbundle(level.var_c27600b0.var_4dd46f8a);
	}
	else
	{
		level.var_c72e8c51 = getscriptbundle("tripwire_custom_settings");
	}
	if(!isdefined(level.var_77cae643))
	{
		level.var_77cae643 = [];
	}
	level.tripwire = {#localclients:[], #wires:[]};
	for(i = 0; i < getmaxlocalclients(); i++)
	{
		level.tripwire.localclients[i] = {#model:undefined, #previs:0, #beams:[]};
	}
}

/*
	Name: function_330a13a6
	Namespace: gadget_tripwire
	Checksum: 0x8412B532
	Offset: 0x488
	Size: 0xDE
	Parameters: 1
	Flags: None
*/
function function_330a13a6(params)
{
	foreach(beam_id in level.tripwire.localclients[params.localclientnum].beams)
	{
		if(isdefined(beam_id))
		{
			beamkill(params.localclientnum, beam_id);
		}
	}
	level.tripwire.localclients[params.localclientnum].beams = [];
}

/*
	Name: function_bd054816
	Namespace: gadget_tripwire
	Checksum: 0x3CC3898A
	Offset: 0x570
	Size: 0x66
	Parameters: 1
	Flags: None
*/
function function_bd054816(params)
{
	if(level.var_c27600b0 != params.var_e088b6aa)
	{
		return;
	}
	if(params.var_c67e16d2)
	{
		function_17d973ec(params.localclientnum);
	}
	else
	{
		self notify(#"hash_726805ec8cfae188");
	}
}

/*
	Name: function_6868fab3
	Namespace: gadget_tripwire
	Checksum: 0x6434A922
	Offset: 0x5E0
	Size: 0x262
	Parameters: 7
	Flags: None
*/
function function_6868fab3(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(self))
	{
		return;
	}
	self endon(#"death");
	starttime = gettime();
	while(isdefined(self) && !self hasdobj(binitialsnap))
	{
		if(gettime() - starttime > 1000)
		{
			return;
		}
		waitframe(1);
	}
	if(!isdefined(self))
	{
		return;
	}
	if(bwastimejump)
	{
		function_6230a8a5(binitialsnap);
	}
	switch(fieldname)
	{
		case 1:
		{
			arrayinsert(level.tripwire.wires, self, level.tripwire.wires.size);
			self callback::on_shutdown(&function_6230a8a5);
			self thread function_55c50f15();
			break;
		}
		case 2:
		case 3:
		{
			foreach(beam_id in level.tripwire.localclients[binitialsnap].beams)
			{
				if(isdefined(beam_id))
				{
					beamkill(binitialsnap, beam_id);
				}
			}
			level.tripwire.localclients[binitialsnap].beams = [];
			self thread function_55c50f15();
			break;
		}
	}
}

/*
	Name: function_6230a8a5
	Namespace: gadget_tripwire
	Checksum: 0x3BB0D447
	Offset: 0x850
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function function_6230a8a5(localclientnum)
{
	arrayremovevalue(level.tripwire.wires, self);
}

/*
	Name: function_a4b3da97
	Namespace: gadget_tripwire
	Checksum: 0x821AA229
	Offset: 0x890
	Size: 0x2E
	Parameters: 1
	Flags: None
*/
function function_a4b3da97(trace)
{
	if(trace[#"fraction"] < 1)
	{
		return false;
	}
	return true;
}

/*
	Name: function_55c50f15
	Namespace: gadget_tripwire
	Checksum: 0xB8C48163
	Offset: 0x8C8
	Size: 0x3EC
	Parameters: 0
	Flags: None
*/
function function_55c50f15()
{
	self endon(#"death");
	foreach(tripwire in level.tripwire.wires)
	{
		if(!isdefined(tripwire))
		{
			continue;
		}
		if(self.var_ea0b7690 != tripwire.var_ea0b7690)
		{
			continue;
		}
		if(self == tripwire)
		{
			continue;
		}
		if(distancesquared(tripwire.origin, self.origin) >= 100 && distancesquared(tripwire.origin, self.origin) <= (level.var_c72e8c51.var_831055cb * level.var_c72e8c51.var_831055cb))
		{
			pos = self gettagorigin("tag_fx");
			var_ccfd8635 = tripwire gettagorigin("tag_fx");
			if(isdefined(pos) && isdefined(var_ccfd8635))
			{
				trace = beamtrace(pos, var_ccfd8635, 0, self, 0, tripwire);
				var_f2edf308 = beamtrace(var_ccfd8635, pos, 0, self, 0, tripwire);
				if(self function_a4b3da97(trace) && self function_a4b3da97(var_f2edf308))
				{
					if(isdefined(level.localplayers))
					{
						foreach(player in level.localplayers)
						{
							if(isdefined(player))
							{
								if(player util::isenemyteam(self.owner.team))
								{
									if(is_true(level.var_c72e8c51.var_10e5bb56))
									{
										var_6e75c10a = "beam8_plyr_equip_ied_enmy_wz";
									}
									else
									{
										var_6e75c10a = "beam8_plyr_equip_ied_enmy";
									}
								}
								else
								{
									if(is_true(level.var_c72e8c51.var_10e5bb56))
									{
										var_6e75c10a = "beam8_plyr_equip_ied_frnd_wz";
									}
									else
									{
										var_6e75c10a = "beam8_plyr_equip_ied_frnd";
									}
								}
								beam_id = player beam::launch(tripwire, "tag_fx", self, "tag_fx", var_6e75c10a);
								arrayinsert(level.tripwire.localclients[player.localclientnum].beams, beam_id, level.tripwire.localclients[player.localclientnum].beams.size);
							}
						}
					}
				}
			}
		}
	}
}

/*
	Name: function_9233eb94
	Namespace: gadget_tripwire
	Checksum: 0xAB0AD04D
	Offset: 0xCC0
	Size: 0xCC
	Parameters: 7
	Flags: None
*/
function function_9233eb94(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self endon(#"death");
		self util::waittill_dobj(fieldname);
		self.var_808217fb = util::playfxontag(fieldname, #"hash_253c31a9114d6029", self, "tag_origin");
	}
	else if(isdefined(self.var_808217fb))
	{
		killfx(fieldname, self.var_808217fb);
	}
}

/*
	Name: function_2a919ef0
	Namespace: gadget_tripwire
	Checksum: 0xB8762FC4
	Offset: 0xD98
	Size: 0x7E
	Parameters: 1
	Flags: None
*/
function function_2a919ef0(localclientnum)
{
	currentoffhand = function_e9fe14ee(localclientnum);
	if(level.var_c27600b0 != currentoffhand)
	{
		return false;
	}
	if(!function_96d4f30e(localclientnum))
	{
		return false;
	}
	if(!function_182a2ad3(localclientnum))
	{
		return false;
	}
	return true;
}

/*
	Name: function_17d973ec
	Namespace: gadget_tripwire
	Checksum: 0x3DB13F11
	Offset: 0xE20
	Size: 0x2DE
	Parameters: 1
	Flags: None
*/
function function_17d973ec(localclientnum)
{
	self endon(#"death");
	self notify(#"hash_726805ec8cfae188");
	self endon(#"hash_726805ec8cfae188");
	self thread function_b882ca33(localclientnum);
	level.tripwire.localclients[localclientnum].previs = 0;
	var_9480bc93 = 0;
	level.var_41427f32 = undefined;
	while(true)
	{
		var_9480bc93 = level.tripwire.localclients[localclientnum].previs;
		level.tripwire.localclients[localclientnum].previs = function_2a919ef0(localclientnum);
		if(level.tripwire.localclients[localclientnum].previs)
		{
			if(!isdefined(level.tripwire.localclients[localclientnum].model))
			{
				spawn_previs(localclientnum);
			}
			if(!var_9480bc93)
			{
				var_e7640260 = 1;
				level.tripwire.localclients[localclientnum].model show();
			}
			function_82a8db78(localclientnum);
		}
		else if(var_9480bc93 && !level.tripwire.localclients[localclientnum].previs)
		{
			level.tripwire.localclients[localclientnum].model notify(#"death");
			level.tripwire.localclients[localclientnum].model delete();
			level.tripwire.localclients[localclientnum].model = undefined;
			function_c51a3b22();
			function_dc76d0d0(localclientnum);
			if(objective_state(localclientnum, self.var_61df85ff) != "invisible")
			{
				objective_setstate(localclientnum, self.var_61df85ff, "invisible");
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_b882ca33
	Namespace: gadget_tripwire
	Checksum: 0xBE155FEB
	Offset: 0x1108
	Size: 0xA4
	Parameters: 1
	Flags: None
*/
function function_b882ca33(localclientnum)
{
	self waittill(#"death");
	if(isdefined(level.tripwire.localclients[self.localclientnum].model))
	{
		level.tripwire.localclients[self.localclientnum].model hide();
	}
	function_6b69576b();
	function_dc76d0d0(localclientnum);
}

/*
	Name: spawn_previs
	Namespace: gadget_tripwire
	Checksum: 0x30267669
	Offset: 0x11B8
	Size: 0x82
	Parameters: 1
	Flags: None
*/
function spawn_previs(localclientnum)
{
	localplayer = function_5c10bd79(localclientnum);
	level.tripwire.localclients[localclientnum].model = spawn(localclientnum, (0, 0, 0), "script_model", localplayer getentitynumber());
}

/*
	Name: function_3e8d9b27
	Namespace: gadget_tripwire
	Checksum: 0x91B51876
	Offset: 0x1248
	Size: 0xCC
	Parameters: 3
	Flags: None
*/
function function_3e8d9b27(local_client_num, previs_weapon, var_120d5014)
{
	if(var_120d5014)
	{
		level.tripwire.localclients[previs_weapon].model setmodel(#"hash_2edbbbe63af8213d");
	}
	else
	{
		level.tripwire.localclients[previs_weapon].model setmodel(#"hash_6c54a3e97ce636f0");
	}
	level.tripwire.localclients[previs_weapon].model notsolid();
}

/*
	Name: function_95d56693
	Namespace: gadget_tripwire
	Checksum: 0x3820E5A9
	Offset: 0x1320
	Size: 0x5C
	Parameters: 0
	Flags: None
*/
function function_95d56693()
{
	for(i = 0; i < level.var_77cae643.size; i++)
	{
		if(level.var_77cae643[i].var_5fe52b5a == 0)
		{
			return i;
		}
	}
	return level.var_77cae643.size;
}

/*
	Name: function_82a8db78
	Namespace: gadget_tripwire
	Checksum: 0x2360BF44
	Offset: 0x1388
	Size: 0x51C
	Parameters: 1
	Flags: None
*/
function function_82a8db78(localclientnum)
{
	player = self;
	function_3e8d9b27(localclientnum, level.var_c27600b0, 1);
	facing_angles = getlocalclientangles(localclientnum);
	forward = anglestoforward(facing_angles);
	up = anglestoup(facing_angles);
	velocity = function_711c258(forward, up, level.var_c27600b0);
	eye_pos = getlocalclienteyepos(localclientnum);
	trace1 = function_e6ba3ec9(eye_pos, velocity, 0, level.var_c27600b0, level.var_41427f32);
	level.tripwire.localclients[localclientnum].model.origin = trace1[#"position"];
	level.tripwire.localclients[localclientnum].model.angles = (angleclamp180(vectortoangles(trace1[#"normal"])[0] + 90), vectortoangles(trace1[#"normal"])[1], 0);
	level.tripwire.localclients[localclientnum].model.hitent = trace1[#"entity"];
	if(isdefined(level.tripwire.localclients[localclientnum].model.hitent) && level.tripwire.localclients[localclientnum].model.hitent.weapon == level.var_c27600b0)
	{
		level.var_41427f32 = level.tripwire.localclients[localclientnum].model.hitent;
	}
	if(level.tripwire.wires.size > 0)
	{
		level.tripwire.localclients[localclientnum].model function_adb3eb2c(localclientnum);
	}
	else if(!isdefined(level.tripwire.localclients[localclientnum].model.var_2045ae5c))
	{
		level.tripwire.localclients[localclientnum].model.var_2045ae5c = util::playfxontag(localclientnum, #"hash_79d94632506eafee", level.tripwire.localclients[localclientnum].model, "tag_fx");
	}
	if(!isdefined(player.var_61df85ff))
	{
		player.var_61df85ff = util::getnextobjid(localclientnum);
		player thread function_810faece(localclientnum, player.var_61df85ff);
	}
	if(isdefined(player.var_61df85ff) && !gamepadusedlast(localclientnum))
	{
		obj_id = player.var_61df85ff;
		if(function_a8cb5322(localclientnum) && !codcaster::function_b8fe9b52(localclientnum))
		{
			objective_add(localclientnum, obj_id, "active", #"hash_410b4c975bc3f66f", trace1[#"position"]);
			objective_setgamemodeflags(localclientnum, obj_id, 0);
		}
		else if(objective_state(localclientnum, obj_id) != "invisible")
		{
			objective_setstate(localclientnum, obj_id, "invisible");
		}
	}
	function_c51a3b22();
	function_dc76d0d0(localclientnum);
}

/*
	Name: function_26c580d9
	Namespace: gadget_tripwire
	Checksum: 0x40B2671D
	Offset: 0x18B0
	Size: 0x13A
	Parameters: 4
	Flags: None
*/
function function_26c580d9(localclientnum, tripwire, trace, var_f2edf308)
{
	if(isdefined(level.tripwire.localclients[localclientnum].model.hitent) && isplayer(level.tripwire.localclients[localclientnum].model.hitent))
	{
		return false;
	}
	if(distancesquared(tripwire.origin, self.origin) < 100)
	{
		return false;
	}
	if(distancesquared(tripwire.origin, self.origin) > level.var_c72e8c51.var_831055cb * level.var_c72e8c51.var_831055cb)
	{
		return false;
	}
	if(!self function_a4b3da97(trace) || !self function_a4b3da97(var_f2edf308))
	{
		return false;
	}
	return true;
}

/*
	Name: function_adb3eb2c
	Namespace: gadget_tripwire
	Checksum: 0xAD1D6FE5
	Offset: 0x19F8
	Size: 0x2DA
	Parameters: 1
	Flags: None
*/
function function_adb3eb2c(localclientnum)
{
	self.var_c2f0f6da = 0;
	for(i = 0; i < level.tripwire.wires.size; i++)
	{
		tripwire = level.tripwire.wires[i];
		if(!isdefined(tripwire))
		{
			continue;
		}
		if(self.var_ea0b7690 != tripwire.var_ea0b7690)
		{
			continue;
		}
		var_1eb381e1 = function_8c308396(self, tripwire);
		pos = self gettagorigin("tag_fx");
		if(!isdefined(pos))
		{
			pos = self.origin;
		}
		var_ccfd8635 = tripwire gettagorigin("tag_fx");
		if(!isdefined(var_ccfd8635))
		{
			var_ccfd8635 = tripwire.origin;
		}
		trace = beamtrace(pos, var_ccfd8635, 0, self, 0, tripwire);
		var_f2edf308 = beamtrace(var_ccfd8635, pos, 0, self, 0, tripwire);
		if(function_26c580d9(localclientnum, tripwire, trace, var_f2edf308))
		{
			self.var_c2f0f6da = 1;
			if(!isdefined(var_1eb381e1))
			{
				var_b92e175e = spawnstruct();
				var_b92e175e.ent1 = self;
				var_b92e175e.ent2 = tripwire;
				var_b92e175e.var_5fe52b5a = 1;
				var_b92e175e.beam_id = undefined;
				level.var_77cae643[function_95d56693()] = var_b92e175e;
			}
			else if(isdefined(var_1eb381e1) && !var_1eb381e1.var_5fe52b5a)
			{
				var_1eb381e1.var_5fe52b5a = 1;
			}
			if(isdefined(self.var_2045ae5c))
			{
				killfx(localclientnum, self.var_2045ae5c);
				self.var_2045ae5c = undefined;
			}
			continue;
		}
		if(isdefined(var_1eb381e1))
		{
			var_1eb381e1.var_5fe52b5a = 0;
		}
	}
	if(!isdefined(self.var_2045ae5c) && !self.var_c2f0f6da)
	{
		self.var_2045ae5c = util::playfxontag(localclientnum, #"hash_79d94632506eafee", self, "tag_fx");
	}
}

/*
	Name: function_dc76d0d0
	Namespace: gadget_tripwire
	Checksum: 0xDD349AE7
	Offset: 0x1CE0
	Size: 0x146
	Parameters: 1
	Flags: None
*/
function function_dc76d0d0(localclientnum)
{
	for(i = 0; i < level.var_77cae643.size; i++)
	{
		beam = level.var_77cae643[i];
		if(beam.var_5fe52b5a && !isdefined(beam.beam_id) && isdefined(beam.ent1) && isdefined(beam.ent2))
		{
			level.var_77cae643[i].beam_id = level beam::function_cfb2f62a(localclientnum, beam.ent1, "tag_fx", beam.ent2, "tag_fx", "beam8_plyr_equip_ied_previs");
			continue;
		}
		if(beam.var_5fe52b5a == 0 && isdefined(beam.beam_id))
		{
			beam::function_47deed80(localclientnum, beam.beam_id);
			level.var_77cae643[i].beam_id = undefined;
		}
	}
}

/*
	Name: function_c51a3b22
	Namespace: gadget_tripwire
	Checksum: 0x12202460
	Offset: 0x1E30
	Size: 0x92
	Parameters: 0
	Flags: None
*/
function function_c51a3b22()
{
	for(i = 0; i < level.var_77cae643.size; i++)
	{
		beam = level.var_77cae643[i];
		if(!isdefined(beam) || !isdefined(beam.ent1) || !isdefined(beam.ent2))
		{
			level.var_77cae643[i].var_5fe52b5a = 0;
		}
	}
}

/*
	Name: function_6b69576b
	Namespace: gadget_tripwire
	Checksum: 0x7DDBD838
	Offset: 0x1ED0
	Size: 0x46
	Parameters: 0
	Flags: None
*/
function function_6b69576b()
{
	for(i = 0; i < level.var_77cae643.size; i++)
	{
		level.var_77cae643[i].var_5fe52b5a = 0;
	}
}

/*
	Name: function_8c308396
	Namespace: gadget_tripwire
	Checksum: 0x92F5D296
	Offset: 0x1F20
	Size: 0xB6
	Parameters: 2
	Flags: None
*/
function function_8c308396(ent1, ent2)
{
	foreach(beam in level.var_77cae643)
	{
		if(beam.ent1 == ent1 && beam.ent2 == ent2)
		{
			return beam;
		}
	}
	return undefined;
}

/*
	Name: function_810faece
	Namespace: gadget_tripwire
	Checksum: 0x7A20F081
	Offset: 0x1FE0
	Size: 0x6C
	Parameters: 2
	Flags: None
*/
function function_810faece(local_client_num, objective_id)
{
	self waittill(#"death", #"disconnect", #"team_changed");
	if(isdefined(objective_id))
	{
		objective_delete(local_client_num, objective_id);
	}
}

