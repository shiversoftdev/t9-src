#using scripts\core_common\fx_shared.gsc;
#using scripts\core_common\sound_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;

#namespace exploder_shared;

/*
	Name: function_7a672f8c
	Namespace: exploder_shared
	Checksum: 0xD3100B5F
	Offset: 0x180
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7a672f8c()
{
	level notify(1189008317);
}

#namespace exploder;

/*
	Name: function_89f2df9
	Namespace: exploder
	Checksum: 0x6B9380C9
	Offset: 0x1A0
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"exploder", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: exploder
	Checksum: 0x77FA6FCE
	Offset: 0x1F8
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level._client_exploders = [];
	level._client_exploder_ids = [];
}

/*
	Name: function_8ac3bea9
	Namespace: exploder
	Checksum: 0xC98E27FA
	Offset: 0x220
	Size: 0xD38
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
	level.exploders = [];
	ents = getentarray("script_brushmodel", "classname");
	smodels = getentarray("script_model", "classname");
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
		if(isdefined(ents[i].script_exploder))
		{
			if(ents[i].script_exploder < 10000)
			{
				level.exploders[ents[i].script_exploder] = 1;
			}
			if(ents[i].model == "fx" && (!isdefined(ents[i].targetname) || ents[i].targetname != "exploderchunk"))
			{
				ents[i] hide();
				continue;
			}
			if(isdefined(ents[i].targetname) && ents[i].targetname == "exploder")
			{
				ents[i] hide();
				ents[i] notsolid();
				if(isdefined(ents[i].script_disconnectpaths))
				{
					ents[i] connectpaths();
				}
				continue;
			}
			if(isdefined(ents[i].targetname) && ents[i].targetname == "exploderchunk")
			{
				ents[i] hide();
				ents[i] notsolid();
				if(isdefined(ents[i].spawnflags) && (ents[i].spawnflags & 1) == 1)
				{
					ents[i] connectpaths();
				}
			}
		}
	}
	script_exploders = [];
	potentialexploders = getentarray("script_brushmodel", "classname");
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
	/#
		println("" + potentialexploders.size);
	#/
	potentialexploders = getentarray("script_model", "classname");
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
	/#
		println("" + potentialexploders.size);
	#/
	potentialexploders = getentarray("item_health", "classname");
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
	/#
		println("" + potentialexploders.size);
	#/
	if(!isdefined(level.createfxent))
	{
		level.createfxent = [];
	}
	acceptabletargetnames = [];
	acceptabletargetnames[#"hash_7a9dcee99d931917"] = 1;
	acceptabletargetnames[#"exploderchunk"] = 1;
	acceptabletargetnames[#"exploder"] = 1;
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
		ent.v[#"earthquake"] = exploder.script_earthquake;
		ent.v[#"damage"] = exploder.script_damage;
		ent.v[#"damage_radius"] = exploder.script_radius;
		ent.v[#"soundalias"] = exploder.script_soundalias;
		ent.v[#"repeat"] = exploder.script_repeat;
		ent.v[#"delay_min"] = exploder.script_delay_min;
		ent.v[#"delay_max"] = exploder.script_delay_max;
		ent.v[#"target"] = exploder.target;
		ent.v[#"ender"] = exploder.script_ender;
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
		/#
			assert(isdefined(exploder.script_exploder), ("" + exploder.origin) + "");
		#/
		if(!isdefined(ent.v[#"delay"]))
		{
			ent.v[#"delay"] = 0;
		}
		if(isdefined(exploder.target))
		{
			e_target = getent(ent.v[#"target"], "targetname");
			if(!isdefined(e_target))
			{
				e_target = struct::get(ent.v[#"target"], "targetname");
			}
			org = e_target.origin;
			ent.v[#"angles"] = vectortoangles(org - ent.v[#"origin"]);
		}
		if(exploder.classname == "script_brushmodel" || isdefined(exploder.model))
		{
			ent.model = exploder;
			ent.model.disconnect_paths = exploder.script_disconnectpaths;
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
	level.radiantexploders = [];
	reportexploderids();
	foreach(trig in trigger::get_all())
	{
		if(isdefined(trig.script_prefab_exploder))
		{
			trig.script_exploder = trig.script_prefab_exploder;
		}
		if(isdefined(trig.script_exploder))
		{
			level thread exploder_trigger(trig, trig.script_exploder);
		}
		if(isdefined(trig.script_exploder_radiant))
		{
			level thread exploder_trigger(trig, trig.script_exploder_radiant);
		}
		if(isdefined(trig.script_stop_exploder))
		{
			level trigger::add_function(trig, undefined, &stop_exploder, trig.script_stop_exploder);
		}
		if(isdefined(trig.script_stop_exploder_radiant))
		{
			level trigger::add_function(trig, undefined, &stop_exploder, trig.script_stop_exploder_radiant);
		}
	}
}

/*
	Name: exploder_before_load
	Namespace: exploder
	Checksum: 0x2C6C6F9
	Offset: 0xF60
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function exploder_before_load(num)
{
	waittillframeend();
	waittillframeend();
	exploder(num);
}

/*
	Name: exploder
	Namespace: exploder
	Checksum: 0xE0B7759C
	Offset: 0xF90
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
	Checksum: 0x7D05B48F
	Offset: 0xFF0
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function function_993369d6(exploder_string)
{
	if(isstring(exploder_string))
	{
		activate_radiant_exploder(exploder_string, 1);
		return;
	}
	/#
		assertmsg("");
	#/
}

/*
	Name: exploder_stop
	Namespace: exploder
	Checksum: 0x85157D2E
	Offset: 0x1060
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function exploder_stop(num)
{
	stop_exploder(num);
}

/*
	Name: exploder_sound
	Namespace: exploder
	Checksum: 0x5B8F9D9F
	Offset: 0x1090
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function exploder_sound()
{
	if(isdefined(self.script_delay))
	{
		wait(self.script_delay);
	}
	self playsound(level.scr_sound[self.script_sound]);
}

/*
	Name: cannon_effect
	Namespace: exploder
	Checksum: 0x4704BCEA
	Offset: 0x10D8
	Size: 0x1E4
	Parameters: 0
	Flags: Linked
*/
function cannon_effect()
{
	if(isdefined(self.v[#"repeat"]))
	{
		for(i = 0; i < self.v[#"repeat"]; i++)
		{
			playfx(level._effect[self.v[#"fxid"]], self.v[#"origin"], self.v[#"forward"], self.v[#"up"]);
			self exploder_delay();
		}
		return;
	}
	self exploder_delay();
	if(isdefined(self.looper))
	{
		self.looper delete();
	}
	self.looper = spawnfx(fx::get(self.v[#"fxid"]), self.v[#"origin"], self.v[#"forward"], self.v[#"up"]);
	triggerfx(self.looper);
	exploder_playsound();
}

/*
	Name: fire_effect
	Namespace: exploder
	Checksum: 0xDFE564A6
	Offset: 0x12C8
	Size: 0x1A4
	Parameters: 0
	Flags: Linked
*/
function fire_effect()
{
	forward = self.v[#"forward"];
	up = self.v[#"up"];
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
	if(isdefined(firefxsound))
	{
		level thread sound::loop_fx_sound(firefxsound, origin, ender);
	}
	playfx(level._effect[firefx], self.v[#"origin"], forward, up);
}

/*
	Name: sound_effect
	Namespace: exploder
	Checksum: 0xB7E177EA
	Offset: 0x1478
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function sound_effect()
{
	self effect_soundalias();
}

/*
	Name: effect_soundalias
	Namespace: exploder
	Checksum: 0xA47157A6
	Offset: 0x14A0
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function effect_soundalias()
{
	origin = self.v[#"origin"];
	alias = self.v[#"soundalias"];
	self exploder_delay();
	sound::play_in_space(alias, origin);
}

/*
	Name: trail_effect
	Namespace: exploder
	Checksum: 0x1C0E36D6
	Offset: 0x1520
	Size: 0x304
	Parameters: 0
	Flags: Linked
*/
function trail_effect()
{
	self exploder_delay();
	if(!isdefined(self.v[#"trailfxtag"]))
	{
		self.v[#"trailfxtag"] = "tag_origin";
	}
	temp_ent = undefined;
	if(self.v[#"trailfxtag"] == "tag_origin")
	{
		playfxontag(level._effect[self.v[#"trailfx"]], self.model, self.v[#"trailfxtag"]);
	}
	else
	{
		temp_ent = spawn("script_model", self.model.origin);
		temp_ent.targetname = "exploder_fx";
		temp_ent setmodel(#"tag_origin");
		temp_ent linkto(self.model, self.v[#"trailfxtag"]);
		playfxontag(level._effect[self.v[#"trailfx"]], temp_ent, "tag_origin");
	}
	if(isdefined(self.v[#"trailfxsound"]))
	{
		if(!isdefined(temp_ent))
		{
			self.model playloopsound(self.v[#"trailfxsound"]);
		}
		else
		{
			temp_ent playloopsound(self.v[#"trailfxsound"]);
		}
	}
	if(isdefined(self.v[#"ender"]) && isdefined(temp_ent))
	{
		level thread trail_effect_ender(temp_ent, self.v[#"ender"]);
	}
	if(!isdefined(self.v[#"trailfxtimeout"]))
	{
		return;
	}
	wait(self.v[#"trailfxtimeout"]);
	if(isdefined(temp_ent))
	{
		temp_ent delete();
	}
}

/*
	Name: trail_effect_ender
	Namespace: exploder
	Checksum: 0xA532C018
	Offset: 0x1830
	Size: 0x4C
	Parameters: 2
	Flags: Linked
*/
function trail_effect_ender(ent, ender)
{
	ent endon(#"death");
	self waittill(ender);
	ent delete();
}

/*
	Name: exploder_delay
	Namespace: exploder
	Checksum: 0x8289E003
	Offset: 0x1888
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
	Checksum: 0x83009E99
	Offset: 0x19B0
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
	sound::play_in_space(self.v[#"soundalias"], self.v[#"origin"]);
}

/*
	Name: brush_delete
	Namespace: exploder
	Checksum: 0x6153F13F
	Offset: 0x1A48
	Size: 0x114
	Parameters: 0
	Flags: Linked
*/
function brush_delete()
{
	num = self.v[#"exploder"];
	if(isdefined(self.v[#"delay"]))
	{
		wait(self.v[#"delay"]);
	}
	else
	{
		wait(0.05);
	}
	if(!isdefined(self.model))
	{
		return;
	}
	/#
		assert(isdefined(self.model));
	#/
	if(!isdefined(self.v[#"fxid"]) || self.v[#"fxid"] == "No FX")
	{
		self.v[#"exploder"] = undefined;
	}
	waittillframeend();
	self.model delete();
}

/*
	Name: brush_show
	Namespace: exploder
	Checksum: 0x9F43A777
	Offset: 0x1B68
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function brush_show()
{
	if(isdefined(self.v[#"delay"]))
	{
		wait(self.v[#"delay"]);
	}
	/#
		assert(isdefined(self.model));
	#/
	self.model show();
	self.model solid();
}

/*
	Name: brush_throw
	Namespace: exploder
	Checksum: 0xE3813DF6
	Offset: 0x1C00
	Size: 0x21C
	Parameters: 0
	Flags: Linked
*/
function brush_throw()
{
	if(isdefined(self.v[#"delay"]))
	{
		wait(self.v[#"delay"]);
	}
	ent = undefined;
	if(isdefined(self.v[#"target"]))
	{
		ent = getent(self.v[#"target"], "targetname");
	}
	if(!isdefined(ent))
	{
		self.model delete();
		return;
	}
	self.model show();
	startorg = self.v[#"origin"];
	startang = self.v[#"angles"];
	org = ent.origin;
	temp_vec = org - self.v[#"origin"];
	x = temp_vec[0];
	y = temp_vec[1];
	z = temp_vec[2];
	self.model rotatevelocity((x, y, z), 12);
	self.model movegravity((x, y, z), 12);
	self.v[#"exploder"] = undefined;
	wait(6);
	self.model delete();
}

/*
	Name: exploder_trigger
	Namespace: exploder
	Checksum: 0xF4F216F4
	Offset: 0x1E28
	Size: 0xFA
	Parameters: 2
	Flags: Linked
*/
function exploder_trigger(trigger, script_value)
{
	trigger endon(#"death");
	level endon("killexplodertridgers" + script_value);
	trigger trigger::wait_till();
	if(isdefined(trigger.script_chance) && randomfloat(1) > trigger.script_chance)
	{
		if(isdefined(trigger.script_delay))
		{
			wait(trigger.script_delay);
		}
		else
		{
			wait(4);
		}
		level thread exploder_trigger(trigger, script_value);
		return;
	}
	exploder(script_value);
	level notify("killexplodertridgers" + script_value);
}

/*
	Name: reportexploderids
	Namespace: exploder
	Checksum: 0xE53FEAC5
	Offset: 0x1F30
	Size: 0xC8
	Parameters: 0
	Flags: Linked
*/
function reportexploderids()
{
	/#
		if(!isdefined(level._exploder_ids))
		{
			return;
		}
		println("");
		foreach(v in level._exploder_ids)
		{
			println((k + "") + v);
		}
	#/
}

/*
	Name: getexploderid
	Namespace: exploder
	Checksum: 0xAB79BFFB
	Offset: 0x2000
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
	Name: createexploder
	Namespace: exploder
	Checksum: 0xA2129771
	Offset: 0x20C0
	Size: 0x80
	Parameters: 1
	Flags: Linked
*/
function createexploder(fxid)
{
	ent = fx::create_effect("exploder", fxid);
	ent.v[#"delay"] = 0;
	ent.v[#"exploder"] = 1;
	ent.v[#"exploder_type"] = "normal";
	return ent;
}

/*
	Name: activate_exploder
	Namespace: exploder
	Checksum: 0x4FD546CF
	Offset: 0x2148
	Size: 0x11C
	Parameters: 1
	Flags: Linked
*/
function activate_exploder(num)
{
	num = int(num);
	level notify("exploder" + num);
	client_send = 1;
	if(isdefined(level.createfxexploders[num]))
	{
		for(i = 0; i < level.createfxexploders[num].size; i++)
		{
			if(client_send && isdefined(level.createfxexploders[num][i].v[#"exploder_server"]))
			{
				client_send = 0;
			}
			level.createfxexploders[num][i] activate_individual_exploder(num);
		}
	}
	if(level.clientscripts)
	{
		if(client_send == 1)
		{
			activate_exploder_on_clients(num);
		}
	}
}

/*
	Name: activate_radiant_exploder
	Namespace: exploder
	Checksum: 0xCFBF7A85
	Offset: 0x2270
	Size: 0x6C
	Parameters: 2
	Flags: Linked
*/
function activate_radiant_exploder(string, immediate)
{
	level notify("exploder" + string);
	if(is_true(immediate))
	{
		function_2f822355(string);
	}
	else
	{
		activateclientradiantexploder(string);
	}
}

/*
	Name: activate_individual_exploder
	Namespace: exploder
	Checksum: 0x3B1F5CA
	Offset: 0x22E8
	Size: 0x304
	Parameters: 1
	Flags: Linked
*/
function activate_individual_exploder(num)
{
	level notify("exploder" + self.v[#"exploder"]);
	if(!level.clientscripts || !isdefined(level._exploder_ids[int(self.v[#"exploder"])]) || isdefined(self.v[#"exploder_server"]))
	{
		/#
			println(("" + self.v[#"exploder"]) + "");
		#/
		if(isdefined(self.v[#"firefx"]))
		{
			self thread fire_effect();
		}
		if(isdefined(self.v[#"fxid"]) && self.v[#"fxid"] != "No FX")
		{
			self thread cannon_effect();
		}
		else if(isdefined(self.v[#"soundalias"]))
		{
			self thread sound_effect();
		}
		if(isdefined(self.v[#"earthquake"]))
		{
			self thread earthquake();
		}
		if(isdefined(self.v[#"rumble"]))
		{
			self thread rumble();
		}
	}
	if(isdefined(self.v[#"trailfx"]))
	{
		self thread trail_effect();
	}
	if(isdefined(self.v[#"damage"]))
	{
		self thread exploder_damage();
	}
	if(self.v[#"exploder_type"] == "exploder")
	{
		self thread brush_show();
	}
	else
	{
		if(self.v[#"exploder_type"] == "exploderchunk" || self.v[#"exploder_type"] == "exploderchunk visible")
		{
			self thread brush_throw();
		}
		else
		{
			self thread brush_delete();
		}
	}
}

/*
	Name: activate_exploder_on_clients
	Namespace: exploder
	Checksum: 0x30C6FC9D
	Offset: 0x25F8
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function activate_exploder_on_clients(num)
{
	if(!isdefined(level._exploder_ids[num]))
	{
		return;
	}
	if(!isdefined(level._client_exploders[num]))
	{
		level._client_exploders[num] = 1;
	}
	if(!isdefined(level._client_exploder_ids[num]))
	{
		level._client_exploder_ids[num] = 1;
	}
	activateclientexploder(level._exploder_ids[num]);
}

/*
	Name: stop_exploder
	Namespace: exploder
	Checksum: 0xCBBD483E
	Offset: 0x2698
	Size: 0xBC
	Parameters: 1
	Flags: Linked
*/
function stop_exploder(num)
{
	if(level.clientscripts)
	{
		delete_exploder_on_clients(num);
	}
	if(isdefined(level.createfxexploders[num]))
	{
		for(i = 0; i < level.createfxexploders[num].size; i++)
		{
			if(!isdefined(level.createfxexploders[num][i].looper))
			{
				continue;
			}
			level.createfxexploders[num][i].looper delete();
		}
	}
}

/*
	Name: delete_exploder_on_clients
	Namespace: exploder
	Checksum: 0x53F1E33A
	Offset: 0x2760
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function delete_exploder_on_clients(exploder_id)
{
	if(isstring(exploder_id))
	{
		deactivateclientradiantexploder(exploder_id);
		return;
	}
	if(!isdefined(level._exploder_ids[exploder_id]))
	{
		return;
	}
	if(!isdefined(level._client_exploders[exploder_id]))
	{
		return;
	}
	level._client_exploders[exploder_id] = undefined;
	level._client_exploder_ids[exploder_id] = undefined;
	deactivateclientexploder(level._exploder_ids[exploder_id]);
}

/*
	Name: kill_exploder
	Namespace: exploder
	Checksum: 0xF93F8170
	Offset: 0x2818
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function kill_exploder(exploder_string)
{
	if(isstring(exploder_string))
	{
		killclientradiantexploder(exploder_string);
		return;
	}
	/#
		assertmsg("");
	#/
}

/*
	Name: exploder_damage
	Namespace: exploder
	Checksum: 0x7B784343
	Offset: 0x2880
	Size: 0x114
	Parameters: 0
	Flags: Linked
*/
function exploder_damage()
{
	if(isdefined(self.v[#"delay"]))
	{
		delay = self.v[#"delay"];
	}
	else
	{
		delay = 0;
	}
	if(isdefined(self.v[#"damage_radius"]))
	{
		radius = self.v[#"damage_radius"];
	}
	else
	{
		radius = 128;
	}
	damage = self.v[#"damage"];
	origin = self.v[#"origin"];
	wait(delay);
	self.model radiusdamage(origin, radius, damage, damage / 3);
}

/*
	Name: earthquake
	Namespace: exploder
	Checksum: 0x8F51BB
	Offset: 0x29A0
	Size: 0x10C
	Parameters: 0
	Flags: Linked
*/
function earthquake()
{
	earthquake_name = self.v[#"earthquake"];
	/#
		assert(isdefined(level.earthquake) && isdefined(level.earthquake[earthquake_name]), ("" + earthquake_name) + "");
	#/
	self exploder_delay();
	eq = level.earthquake[earthquake_name];
	earthquake(eq[#"magnitude"], eq[#"duration"], self.v[#"origin"], eq[#"radius"]);
}

/*
	Name: rumble
	Namespace: exploder
	Checksum: 0xB98C4779
	Offset: 0x2AB8
	Size: 0x17C
	Parameters: 0
	Flags: Linked
*/
function rumble()
{
	self exploder_delay();
	a_players = getplayers();
	if(isdefined(self.v[#"damage_radius"]))
	{
		n_rumble_threshold_squared = self.v[#"damage_radius"] * self.v[#"damage_radius"];
	}
	else
	{
		/#
			println(("" + self.v[#"exploder"]) + "");
		#/
		n_rumble_threshold_squared = 16384;
	}
	for(i = 0; i < a_players.size; i++)
	{
		n_player_dist_squared = distancesquared(a_players[i].origin, self.v[#"origin"]);
		if(n_player_dist_squared < n_rumble_threshold_squared)
		{
			a_players[i] playrumbleonentity(self.v[#"rumble"]);
		}
	}
}

/*
	Name: stop_after_duration
	Namespace: exploder
	Checksum: 0xB0426449
	Offset: 0x2C40
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
	Checksum: 0xD06DDBCA
	Offset: 0x2C78
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

