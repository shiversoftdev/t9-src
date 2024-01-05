#using scripts\core_common\system_shared.csc;
#using scripts\core_common\sound_shared.csc;
#using scripts\core_common\fx_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\struct.csc;

#namespace exploder_shared;

/*
	Name: function_4b1de0f3
	Namespace: exploder_shared
	Checksum: 0x9B780A95
	Offset: 0x108
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4b1de0f3()
{
	level notify(-1447529666);
}

#namespace exploder;

/*
	Name: __init__system__
	Namespace: exploder
	Checksum: 0x1B8D35BD
	Offset: 0x128
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"exploder", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: exploder
	Checksum: 0x1B61B5DA
	Offset: 0x170
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(sessionmodeiscampaigngame())
	{
		callback::on_localclient_connect(&player_init);
	}
}

/*
	Name: player_init
	Namespace: exploder
	Checksum: 0xB86F6982
	Offset: 0x1B0
	Size: 0xB14
	Parameters: 1
	Flags: Linked
*/
function player_init(clientnum)
{
	script_exploders = [];
	ents = struct::get_array("script_brushmodel", "classname");
	smodels = struct::get_array("script_model", "classname");
	for(i = 0; i < smodels.size; i++)
	{
		ents[ents.size] = smodels[i];
	}
	for(i = 0; i < ents.size; i++)
	{
		if(isdefined(ents[i].script_prefab_exploder))
		{
			ents[i].script_exploder = ents[i].script_prefab_exploder;
		}
	}
	potentialexploders = struct::get_array("script_brushmodel", "classname");
	for(i = 0; i < potentialexploders.size; i++)
	{
		if(isdefined(potentialexploders[i].script_prefab_exploder))
		{
			potentialexploders[i].script_exploder = potentialexploders[i].script_prefab_exploder;
		}
		if(isdefined(potentialexploders[i].script_exploder))
		{
			script_exploders[script_exploders.size] = potentialexploders[i];
		}
	}
	potentialexploders = struct::get_array("script_model", "classname");
	for(i = 0; i < potentialexploders.size; i++)
	{
		if(isdefined(potentialexploders[i].script_prefab_exploder))
		{
			potentialexploders[i].script_exploder = potentialexploders[i].script_prefab_exploder;
		}
		if(isdefined(potentialexploders[i].script_exploder))
		{
			script_exploders[script_exploders.size] = potentialexploders[i];
		}
	}
	if(isdefined(level.struct))
	{
		for(i = 0; i < level.struct.size; i++)
		{
			if(isdefined(level.struct[i].script_prefab_exploder))
			{
				level.struct[i].script_exploder = level.struct[i].script_prefab_exploder;
			}
			if(isdefined(level.struct[i].script_exploder))
			{
				script_exploders[script_exploders.size] = level.struct[i];
			}
		}
	}
	if(!isdefined(level.createfxent))
	{
		level.createfxent = [];
	}
	acceptabletargetnames = [];
	acceptabletargetnames[#"exploderchunk visible"] = 1;
	acceptabletargetnames[#"exploderchunk"] = 1;
	acceptabletargetnames[#"exploder"] = 1;
	exploder_id = 1;
	for(i = 0; i < script_exploders.size; i++)
	{
		exploder = script_exploders[i];
		ent = createexploder(exploder.script_fxid);
		ent.v = [];
		ent.v[#"origin"] = exploder.origin;
		ent.v[#"angles"] = exploder.angles;
		ent.v[#"delay"] = exploder.script_delay;
		ent.v[#"firefx"] = exploder.script_firefx;
		ent.v[#"firefxdelay"] = exploder.script_firefxdelay;
		ent.v[#"firefxsound"] = exploder.script_firefxsound;
		ent.v[#"firefxtimeout"] = exploder.script_firefxtimeout;
		ent.v[#"trailfx"] = exploder.script_trailfx;
		ent.v[#"trailfxtag"] = exploder.script_trailfxtag;
		ent.v[#"trailfxdelay"] = exploder.script_trailfxdelay;
		ent.v[#"trailfxsound"] = exploder.script_trailfxsound;
		ent.v[#"trailfxtimeout"] = exploder.script_firefxtimeout;
		ent.v[#"earthquake"] = exploder.script_earthquake;
		ent.v[#"rumble"] = exploder.script_rumble;
		ent.v[#"damage"] = exploder.script_damage;
		ent.v[#"damage_radius"] = exploder.script_radius;
		ent.v[#"repeat"] = exploder.script_repeat;
		ent.v[#"delay_min"] = exploder.script_delay_min;
		ent.v[#"delay_max"] = exploder.script_delay_max;
		ent.v[#"target"] = exploder.target;
		ent.v[#"ender"] = exploder.script_ender;
		ent.v[#"physics"] = exploder.script_physics;
		ent.v[#"type"] = "exploder";
		if(!isdefined(exploder.script_fxid))
		{
			ent.v[#"fxid"] = "No FX";
		}
		else
		{
			ent.v[#"fxid"] = exploder.script_fxid;
		}
		ent.v[#"exploder"] = exploder.script_exploder;
		if(!isdefined(ent.v[#"delay"]))
		{
			ent.v[#"delay"] = 0;
		}
		if(isdefined(exploder.script_sound))
		{
			ent.v[#"soundalias"] = exploder.script_sound;
		}
		else if(ent.v[#"fxid"] != "No FX")
		{
			if(isdefined(level.scr_sound) && isdefined(level.scr_sound[ent.v[#"fxid"]]))
			{
				ent.v[#"soundalias"] = level.scr_sound[ent.v[#"fxid"]];
			}
		}
		fixup_set = 0;
		if(isdefined(ent.v[#"target"]))
		{
			ent.needs_fixup = exploder_id;
			exploder_id++;
			fixup_set = 1;
			temp_ent = struct::get(ent.v[#"target"], "targetname");
			if(isdefined(temp_ent))
			{
				org = temp_ent.origin;
			}
			if(isdefined(org))
			{
				ent.v[#"angles"] = vectortoangles(org - ent.v[#"origin"]);
			}
			if(isdefined(ent.v[#"angles"]))
			{
				ent fx::set_forward_and_up_vectors();
			}
		}
		if(isdefined(exploder.classname) && exploder.classname == "script_brushmodel" || isdefined(exploder.model))
		{
			ent.model = exploder;
			if(fixup_set == 0)
			{
				ent.needs_fixup = exploder_id;
				exploder_id++;
			}
		}
		if(isdefined(exploder.targetname) && isdefined(acceptabletargetnames[exploder.targetname]))
		{
			ent.v[#"exploder_type"] = exploder.targetname;
			continue;
		}
		ent.v[#"exploder_type"] = "normal";
	}
	level.createfxexploders = [];
	for(i = 0; i < level.createfxent.size; i++)
	{
		ent = level.createfxent[i];
		if(ent.v[#"type"] != "exploder")
		{
			continue;
		}
		ent.v[#"exploder_id"] = getexploderid(ent);
		if(!isdefined(level.createfxexploders[ent.v[#"exploder"]]))
		{
			level.createfxexploders[ent.v[#"exploder"]] = [];
		}
		level.createfxexploders[ent.v[#"exploder"]][level.createfxexploders[ent.v[#"exploder"]].size] = ent;
	}
	reportexploderids();
}

/*
	Name: getexploderid
	Namespace: exploder
	Checksum: 0xDFBDBF3D
	Offset: 0xCD0
	Size: 0xB8
	Parameters: 1
	Flags: Linked
*/
function getexploderid(ent)
{
	if(!isdefined(level._exploder_ids))
	{
		level._exploder_ids = [];
		level._exploder_id = 1;
	}
	if(!isdefined(level._exploder_ids[ent.v[#"exploder"]]))
	{
		level._exploder_ids[ent.v[#"exploder"]] = level._exploder_id;
		level._exploder_id++;
	}
	return level._exploder_ids[ent.v[#"exploder"]];
}

/*
	Name: reportexploderids
	Namespace: exploder
	Checksum: 0x80F724D1
	Offset: 0xD90
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function reportexploderids()
{
}

/*
	Name: exploder
	Namespace: exploder
	Checksum: 0x5BE4BFEA
	Offset: 0xDA0
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function exploder(exploder_id)
{
	if(isint(exploder_id))
	{
		activate_exploder(exploder_id);
	}
	else
	{
		activate_radiant_exploder(exploder_id);
	}
}

/*
	Name: function_993369d6
	Namespace: exploder
	Checksum: 0xA4B30246
	Offset: 0xE00
	Size: 0x84
	Parameters: 1
	Flags: None
*/
function function_993369d6(exploder_id)
{
	if(isstring(exploder_id) || ishash(exploder_id))
	{
		activate_radiant_exploder(exploder_id, 1);
		return;
	}
	/#
		assertmsg("" + exploder_id);
	#/
}

/*
	Name: activate_exploder
	Namespace: exploder
	Checksum: 0x81ACCFBA
	Offset: 0xE90
	Size: 0xFC
	Parameters: 1
	Flags: Linked
*/
function activate_exploder(num)
{
	num = int(num);
	if(isdefined(level.createfxexploders) && isdefined(level.createfxexploders[num]))
	{
		for(i = 0; i < level.createfxexploders[num].size; i++)
		{
			level.createfxexploders[num][i] activate_individual_exploder();
		}
	}
	if(exploder_is_lightning_exploder(num))
	{
		if(isdefined(level.lightningnormalfunc) && isdefined(level.lightningflashfunc))
		{
			thread fx::lightning(level.lightningnormalfunc, level.lightningflashfunc);
		}
	}
}

/*
	Name: activate_individual_exploder
	Namespace: exploder
	Checksum: 0x972F4A01
	Offset: 0xF98
	Size: 0x10C
	Parameters: 0
	Flags: Linked
*/
function activate_individual_exploder()
{
	if(!isdefined(self.v[#"angles"]))
	{
		self.v[#"angles"] = (0, 0, 0);
		self fx::set_forward_and_up_vectors();
	}
	if(isdefined(self.v[#"firefx"]))
	{
		self thread fire_effect();
	}
	if(isdefined(self.v[#"fxid"]) && self.v[#"fxid"] != "No FX")
	{
		self thread cannon_effect();
	}
	if(isdefined(self.v[#"earthquake"]))
	{
		self thread exploder_earthquake();
	}
}

/*
	Name: activate_radiant_exploder
	Namespace: exploder
	Checksum: 0xB5CD6EEE
	Offset: 0x10B0
	Size: 0xB4
	Parameters: 2
	Flags: Linked
*/
function activate_radiant_exploder(string, immediate)
{
	var_2639b9f6 = getlocalplayers();
	if(is_true(immediate))
	{
		for(localclientnum = 0; localclientnum < var_2639b9f6.size; localclientnum++)
		{
			function_87ed546d(localclientnum, string);
		}
	}
	else
	{
		for(localclientnum = 0; localclientnum < var_2639b9f6.size; localclientnum++)
		{
			playradiantexploder(localclientnum, string);
		}
	}
}

/*
	Name: stop_exploder
	Namespace: exploder
	Checksum: 0xCC433F28
	Offset: 0x1170
	Size: 0x196
	Parameters: 1
	Flags: Linked
*/
function stop_exploder(exploder_id)
{
	if(isstring(exploder_id) || ishash(exploder_id))
	{
		var_2639b9f6 = getlocalplayers();
		for(localclientnum = 0; localclientnum < var_2639b9f6.size; localclientnum++)
		{
			stopradiantexploder(localclientnum, exploder_id);
		}
		return;
	}
	num = int(exploder_id);
	if(isdefined(level.createfxexploders[exploder_id]))
	{
		for(i = 0; i < level.createfxexploders[exploder_id].size; i++)
		{
			ent = level.createfxexploders[exploder_id][i];
			if(isdefined(ent.loopfx))
			{
				for(j = 0; j < ent.loopfx.size; j++)
				{
					if(isdefined(ent.loopfx[j]))
					{
						stopfx(j, ent.loopfx[j]);
						ent.loopfx[j] = undefined;
					}
				}
				ent.loopfx = [];
			}
		}
	}
}

/*
	Name: kill_exploder
	Namespace: exploder
	Checksum: 0x81479981
	Offset: 0x1310
	Size: 0xBC
	Parameters: 1
	Flags: None
*/
function kill_exploder(exploder_id)
{
	var_2639b9f6 = getlocalplayers();
	if(isstring(exploder_id) || ishash(exploder_id))
	{
		for(localclientnum = 0; localclientnum < var_2639b9f6.size; localclientnum++)
		{
			killradiantexploder(localclientnum, exploder_id);
		}
		return;
	}
	/#
		assertmsg("" + exploder_id);
	#/
}

/*
	Name: exploder_delay
	Namespace: exploder
	Checksum: 0x1606ED9A
	Offset: 0x13D8
	Size: 0x11C
	Parameters: 0
	Flags: Linked
*/
function exploder_delay()
{
	if(!isdefined(self.v[#"delay"]))
	{
		self.v[#"delay"] = 0;
	}
	min_delay = self.v[#"delay"];
	max_delay = self.v[#"delay"] + 0.001;
	if(isdefined(self.v[#"delay_min"]))
	{
		min_delay = self.v[#"delay_min"];
	}
	if(isdefined(self.v[#"delay_max"]))
	{
		max_delay = self.v[#"delay_max"];
	}
	if(min_delay > 0)
	{
		wait(randomfloatrange(min_delay, max_delay));
	}
}

/*
	Name: exploder_playsound
	Namespace: exploder
	Checksum: 0xE0D200CA
	Offset: 0x1500
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function exploder_playsound()
{
	if(!isdefined(self.v[#"soundalias"]) || self.v[#"soundalias"] == "nil")
	{
		return;
	}
	sound::play_in_space(0, self.v[#"soundalias"], self.v[#"origin"]);
}

/*
	Name: exploder_earthquake
	Namespace: exploder
	Checksum: 0x3EB360BE
	Offset: 0x1598
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function exploder_earthquake()
{
	self exploder_delay();
	eq = level.earthquake[self.v[#"earthquake"]];
	if(isdefined(eq))
	{
		earthquake(0, eq[#"magnitude"], eq[#"duration"], self.v[#"origin"], eq[#"radius"]);
	}
}

/*
	Name: exploder_is_lightning_exploder
	Namespace: exploder
	Checksum: 0x553DE6D5
	Offset: 0x1658
	Size: 0x66
	Parameters: 1
	Flags: Linked
*/
function exploder_is_lightning_exploder(num)
{
	if(isdefined(level.lightningexploder))
	{
		for(i = 0; i < level.lightningexploder.size; i++)
		{
			if(level.lightningexploder[i] == num)
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: stoplightloopexploder
	Namespace: exploder
	Checksum: 0x5BD1698
	Offset: 0x16C8
	Size: 0x15E
	Parameters: 1
	Flags: None
*/
function stoplightloopexploder(exploderindex)
{
	num = int(exploderindex);
	if(isdefined(level.createfxexploders[num]))
	{
		for(i = 0; i < level.createfxexploders[num].size; i++)
		{
			ent = level.createfxexploders[num][i];
			if(!isdefined(ent.looperfx))
			{
				ent.looperfx = [];
			}
			for(clientnum = 0; clientnum < level.max_local_clients; clientnum++)
			{
				if(localclientactive(clientnum))
				{
					if(isdefined(ent.looperfx[clientnum]))
					{
						for(looperfxcount = 0; looperfxcount < ent.looperfx[clientnum].size; looperfxcount++)
						{
							deletefx(clientnum, ent.looperfx[clientnum][looperfxcount]);
						}
					}
				}
				ent.looperfx[clientnum] = [];
			}
			ent.looperfx = [];
		}
	}
}

/*
	Name: playlightloopexploder
	Namespace: exploder
	Checksum: 0x4B207992
	Offset: 0x1830
	Size: 0x13A
	Parameters: 1
	Flags: None
*/
function playlightloopexploder(exploderindex)
{
	num = int(exploderindex);
	if(isdefined(level.createfxexploders[num]))
	{
		for(i = 0; i < level.createfxexploders[num].size; i++)
		{
			ent = level.createfxexploders[num][i];
			if(!isdefined(ent.looperfx))
			{
				ent.looperfx = [];
			}
			for(clientnum = 0; clientnum < level.max_local_clients; clientnum++)
			{
				if(localclientactive(clientnum))
				{
					if(!isdefined(ent.looperfx[clientnum]))
					{
						ent.looperfx[clientnum] = [];
					}
					ent.looperfx[clientnum][ent.looperfx[clientnum].size] = ent playexploderfx(clientnum);
				}
			}
		}
	}
}

/*
	Name: createexploder
	Namespace: exploder
	Checksum: 0xD3167F62
	Offset: 0x1978
	Size: 0x68
	Parameters: 1
	Flags: Linked
*/
function createexploder(fxid)
{
	ent = fx::create_effect("exploder", fxid);
	ent.v[#"delay"] = 0;
	ent.v[#"exploder_type"] = "normal";
	return ent;
}

/*
	Name: cannon_effect
	Namespace: exploder
	Checksum: 0x4EC20E7B
	Offset: 0x19E8
	Size: 0x30C
	Parameters: 0
	Flags: Linked
*/
function cannon_effect()
{
	if(isdefined(self.v[#"repeat"]))
	{
		for(i = 0; i < self.v[#"repeat"]; i++)
		{
			players = getlocalplayers();
			for(player = 0; player < players.size; player++)
			{
				playfx(player, level._effect[self.v[#"fxid"]], self.v[#"origin"], self.v[#"forward"], self.v[#"up"]);
			}
			self exploder_delay();
		}
		return;
	}
	self exploder_delay();
	players = getlocalplayers();
	if(isdefined(self.loopfx))
	{
		for(i = 0; i < self.loopfx.size; i++)
		{
			stopfx(i, self.loopfx[i]);
		}
		self.loopfx = [];
	}
	if(!isdefined(self.loopfx))
	{
		self.loopfx = [];
	}
	if(!isdefined(level._effect[self.v[#"fxid"]]))
	{
		/#
			assertmsg(("" + self.v[#"fxid"]) + "");
		#/
		return;
	}
	for(i = 0; i < players.size; i++)
	{
		if(isdefined(self.v[#"fxid"]))
		{
			self.loopfx[i] = playfx(i, level._effect[self.v[#"fxid"]], self.v[#"origin"], self.v[#"forward"], self.v[#"up"]);
		}
	}
	self exploder_playsound();
}

/*
	Name: fire_effect
	Namespace: exploder
	Checksum: 0xBEE0C3DB
	Offset: 0x1D00
	Size: 0x284
	Parameters: 0
	Flags: Linked
*/
function fire_effect()
{
	forward = self.v[#"forward"];
	if(!isdefined(forward))
	{
		forward = anglestoforward(self.v[#"angles"]);
	}
	up = self.v[#"up"];
	if(!isdefined(up))
	{
		up = anglestoup(self.v[#"angles"]);
	}
	firefxsound = self.v[#"firefxsound"];
	origin = self.v[#"origin"];
	firefx = self.v[#"firefx"];
	ender = self.v[#"ender"];
	if(!isdefined(ender))
	{
		ender = "createfx_effectStopper";
	}
	firefxdelay = 0.5;
	if(isdefined(self.v[#"firefxdelay"]))
	{
		firefxdelay = self.v[#"firefxdelay"];
	}
	self exploder_delay();
	players = getlocalplayers();
	for(i = 0; i < players.size; i++)
	{
		if(isdefined(firefxsound))
		{
			level thread sound::loop_fx_sound(i, firefxsound, origin, ender);
		}
		playfx(i, level._effect[firefx], self.v[#"origin"], forward, up, 0, self.v[#"primlightfrac"], self.v[#"lightoriginoffs"]);
	}
}

/*
	Name: playexploderfx
	Namespace: exploder
	Checksum: 0xE62DBF0A
	Offset: 0x1F90
	Size: 0x11A
	Parameters: 1
	Flags: Linked
*/
function playexploderfx(clientnum)
{
	/#
		if(!isdefined(self.v[#"origin"]))
		{
			return;
		}
		if(!isdefined(self.v[#"forward"]))
		{
			return;
		}
		if(!isdefined(self.v[#"up"]))
		{
			return;
		}
	#/
	return playfx(clientnum, level._effect[self.v[#"fxid"]], self.v[#"origin"], self.v[#"forward"], self.v[#"up"], 0, self.v[#"primlightfrac"], self.v[#"lightoriginoffs"]);
}

/*
	Name: stop_after_duration
	Namespace: exploder
	Checksum: 0xCD85400C
	Offset: 0x20B8
	Size: 0x2C
	Parameters: 2
	Flags: Linked
*/
function stop_after_duration(name, duration)
{
	wait(duration);
	stop_exploder(name);
}

/*
	Name: exploder_duration
	Namespace: exploder
	Checksum: 0xA97F9C98
	Offset: 0x20F0
	Size: 0x64
	Parameters: 2
	Flags: None
*/
function exploder_duration(name, duration)
{
	if(!is_true(duration))
	{
		return;
	}
	exploder(name);
	level thread stop_after_duration(name, duration);
}

