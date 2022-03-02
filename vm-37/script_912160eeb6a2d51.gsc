#using script_1883fa4e60abbf9f;
#using script_21cbc79d1d70402;
#using script_3dc93ca9902a9cda;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_214c1803;

/*
	Name: scalevolume
	Namespace: namespace_214c1803
	Checksum: 0xD3BA6371
	Offset: 0x268
	Size: 0x14
	Parameters: 2
	Flags: None
*/
function scalevolume(ent, vol)
{
}

#namespace namespace_6c0cd084;

/*
	Name: function_89f2df9
	Namespace: namespace_6c0cd084
	Checksum: 0xB8A239E
	Offset: 0x288
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_299575137124db03", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_6c0cd084
	Checksum: 0x8475354D
	Offset: 0x2D0
	Size: 0x1B4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	register_clientfields();
	level.var_53ad6e22 = [];
	util::init_dvar("ai_threatForcedRate", 0.4, &function_4c75a19);
	util::init_dvar("ai_threatForcedMax", 0.5, &function_4c75a19);
	util::init_dvar("ai_threatsight", 0, &function_4c75a19);
	util::init_dvar("ai_threatForcedRate", 0, &function_4c75a19);
	util::init_dvar("ai_threatsightFakeThreat", 0, &function_4c75a19);
	util::init_dvar("ai_threatsightFakeX", 0, &function_4c75a19);
	util::init_dvar("ai_threatsightFakeY", 0, &function_4c75a19);
	util::init_dvar("ai_threatsightFakeZ", 0, &function_4c75a19);
	util::init_dvar("ai_threatUseDisplay", 0, &function_4c75a19);
}

/*
	Name: register_clientfields
	Namespace: namespace_6c0cd084
	Checksum: 0x573E85B6
	Offset: 0x490
	Size: 0x64
	Parameters: 0
	Flags: Linked, Private
*/
function private register_clientfields()
{
	clientfield::register("actor", "threat_sight", 1, 6, "int");
	clientfield::register("actor", "threat_state", 1, 2, "int");
}

/*
	Name: function_4c75a19
	Namespace: namespace_6c0cd084
	Checksum: 0xED68DB2F
	Offset: 0x500
	Size: 0x28
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4c75a19(dvar)
{
	level.var_53ad6e22[dvar.name] = dvar.value;
}

/*
	Name: threat_sight_set_enabled
	Namespace: namespace_6c0cd084
	Checksum: 0xBB3158A
	Offset: 0x530
	Size: 0x260
	Parameters: 1
	Flags: Linked
*/
function threat_sight_set_enabled(enabled)
{
	/#
		assert(isdefined(level.stealth));
	#/
	wasenabled = isdefined(level.stealth.threat_sight_enabled) && level.stealth.threat_sight_enabled;
	level.stealth.threat_sight_enabled = enabled;
	threat_sight_set_dvar(enabled);
	if(!enabled && wasenabled)
	{
		level notify(#"hash_34d443ce908d0498");
		foreach(player in getplayers())
		{
			player.stealth.threat_thread = undefined;
		}
	}
	else if(enabled && !wasenabled)
	{
		level notify(#"threat_sight_enabled");
	}
	allai = getactorarray();
	foreach(guy in allai)
	{
		if(isalive(guy) && isdefined(guy.stealth) && isdefined(guy.stealth.threat_sight_state))
		{
			guy threat_sight_set_state(guy.stealth.threat_sight_state);
		}
	}
}

/*
	Name: threat_sight_set_dvar
	Namespace: namespace_6c0cd084
	Checksum: 0xA1F3E81B
	Offset: 0x798
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function threat_sight_set_dvar(enabled)
{
	if(enabled && (!isdefined(level.stealth.threat_sight_enabled) || !level.stealth.threat_sight_enabled))
	{
		return;
	}
	setsaveddvar(#"hash_608e38c8a93de439", enabled);
	level thread threat_sight_set_dvar_display(enabled);
}

/*
	Name: threat_sight_set_dvar_display
	Namespace: namespace_6c0cd084
	Checksum: 0x85E4F3B8
	Offset: 0x828
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function threat_sight_set_dvar_display(enabled)
{
	self notify(#"threat_sight_set_dvar_display");
	self endon(#"threat_sight_set_dvar_display");
	if(!enabled)
	{
		wait(1);
	}
	if(level.var_53ad6e22[#"hash_58c18472bda63bb3"])
	{
		setsaveddvar(#"hash_7bf40e4b6a830d11", enabled);
	}
	setdvar(#"hash_28758912434b7866", enabled);
}

/*
	Name: threat_sight_enabled
	Namespace: namespace_6c0cd084
	Checksum: 0x7C0D6B81
	Offset: 0x8D0
	Size: 0x74
	Parameters: 0
	Flags: None
*/
function threat_sight_enabled()
{
	if(!level.var_53ad6e22[#"hash_608e38c8a93de439"])
	{
		return 0;
	}
	if(self == level)
	{
		return isdefined(level.stealth.threat_sight_enabled) && level.stealth.threat_sight_enabled;
	}
	return isdefined(self.threatsight) && self.threatsight;
}

/*
	Name: threat_sight_set_state
	Namespace: namespace_6c0cd084
	Checksum: 0x307B8782
	Offset: 0x950
	Size: 0x2F4
	Parameters: 1
	Flags: Linked
*/
function threat_sight_set_state(statename)
{
	if(isdefined(self.stealth))
	{
		self.stealth.threat_sight_state = statename;
	}
	if(!isdefined(level.stealth.threat_sight_enabled) || !level.stealth.threat_sight_enabled)
	{
		if(!is_true(self.threat_sight_immediate_thread))
		{
			self thread threat_sight_immediate_thread();
			self.threat_sight_immediate_thread = 1;
		}
		return;
	}
	if(is_true(self.threat_sight_immediate_thread))
	{
		self notify(#"threat_sight_immediate_thread");
		self.threat_sight_immediate_thread = undefined;
	}
	switch(statename)
	{
		case "hidden":
		{
			self.threatsight = 1;
			self.stealth.threat_sight_count = undefined;
			self.stealth.threat_sight_lost = undefined;
			break;
		}
		case "investigate":
		{
			self.threatsight = 1;
			break;
		}
		case "hash_5689f41e8c0ad00":
		case "hash_4b55a59a56c4bdb3":
		{
			self.threatsight = 1;
			break;
		}
		case "blind":
		{
			break;
		}
		case "spotted":
		{
			self.threatsight = 0;
			break;
		}
		case "death":
		{
			self.threatsight = 0;
			break;
		}
		default:
		{
			/#
				iprintlnbold(("" + statename) + "");
			#/
			break;
		}
	}
	foreach(player in getplayers())
	{
		if(isdefined(player))
		{
			player threat_sight_player_entity_state_set(self, statename);
		}
	}
	if(statename != "death")
	{
		self threat_sight_set_state_parameters(statename);
	}
	if(self.threatsight)
	{
		self thread function_3a739b35();
	}
}

/*
	Name: threat_sight_set_state_parameters
	Namespace: namespace_6c0cd084
	Checksum: 0x3C95CF69
	Offset: 0xC50
	Size: 0x70
	Parameters: 1
	Flags: Linked
*/
function threat_sight_set_state_parameters(statename)
{
	/#
		assert(isdefined(level.stealth));
	#/
	/#
		assert(isdefined(level.stealth.fnthreatsightsetstateparameters));
	#/
	self [[level.stealth.fnthreatsightsetstateparameters]](statename);
}

/*
	Name: function_eefd0bb3
	Namespace: namespace_6c0cd084
	Checksum: 0xBB490233
	Offset: 0xCC8
	Size: 0x4C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_eefd0bb3(str_notify)
{
	self clientfield::set("threat_sight", 0);
	self clientfield::set("threat_state", 0);
}

/*
	Name: function_60514e0b
	Namespace: namespace_6c0cd084
	Checksum: 0x32B6537B
	Offset: 0xD20
	Size: 0x16
	Parameters: 0
	Flags: Linked
*/
function function_60514e0b()
{
	self notify(#"hash_247b691774e7a2e2");
}

/*
	Name: function_3a739b35
	Namespace: namespace_6c0cd084
	Checksum: 0xC4E25E26
	Offset: 0xD40
	Size: 0x388
	Parameters: 0
	Flags: Linked, Private
*/
function private function_3a739b35()
{
	self notify(#"hash_3b836f1c1e601c4d");
	self endoncallback(&function_eefd0bb3, #"hash_3b836f1c1e601c4d", #"hash_247b691774e7a2e2", #"death");
	var_403d799 = 0;
	while(true)
	{
		waitframe(1);
		if(!self namespace_979752dc::function_b60a878a())
		{
			self clientfield::set("threat_sight", 0);
			self clientfield::set("threat_state", 0);
		}
		else
		{
			if(level flag::get("stealth_spotted") && level flag::get("stealth_meter_combat_alerted"))
			{
				self clientfield::set("threat_sight", 0);
				self clientfield::set("threat_state", 0);
			}
			else if(getplayers().size > 0)
			{
				player = getplayers()[0];
				var_214c1803 = self getthreatsight(player);
				var_97c4563c = 0;
				if(self.awarenesslevelcurrent === "combat")
				{
					var_97c4563c = 3;
					level flag::set("stealth_meter_combat_alerted");
				}
				else
				{
					if(self.stealth.bsmstate === 2)
					{
						var_97c4563c = 2;
					}
					else if(self.awarenesslevelcurrent !== "unaware")
					{
						if(self namespace_979752dc::function_d58e1c1c() && self.awarenesslevelcurrent == "high_alert" && var_214c1803 > 0)
						{
							var_214c1803 = 1;
						}
						if(var_214c1803 >= 1)
						{
							var_97c4563c = 1;
						}
					}
				}
				var_91b6ad45 = int(var_214c1803 * ((1 << 6) - 1));
				if(var_97c4563c == 1 || var_97c4563c == 2 && var_91b6ad45 == 0)
				{
					var_403d799 = var_403d799 + (float(function_60d95f53()) / 1000);
					if(var_403d799 > 1)
					{
						var_97c4563c = 0;
					}
				}
				else
				{
					var_403d799 = 0;
				}
				self clientfield::set("threat_sight", var_91b6ad45);
				self clientfield::set("threat_state", var_97c4563c);
			}
		}
	}
}

/*
	Name: threat_sight_immediate_thread
	Namespace: namespace_6c0cd084
	Checksum: 0xE7E9C1F2
	Offset: 0x10D0
	Size: 0x194
	Parameters: 0
	Flags: Linked
*/
function threat_sight_immediate_thread()
{
	self notify(#"threat_sight_immediate_thread");
	self endon(#"threat_sight_immediate_thread", #"death");
	level endon(#"threat_sight_enabled");
	while(true)
	{
		level flag::wait_till("stealth_enabled");
		level flag::wait_till_clear("stealth_spotted");
		wait(randomfloatrange(0.4, 0.6));
		foreach(player in getplayers())
		{
			if(isdefined(player.ignore_stealth_sight))
			{
				continue;
			}
			if(player.ignoreme)
			{
				continue;
			}
			if(self cansee(player))
			{
				self function_a3fcf9e0("sight", player, player.origin);
			}
		}
	}
}

/*
	Name: threat_sight_player_init
	Namespace: namespace_6c0cd084
	Checksum: 0xC63CA989
	Offset: 0x1270
	Size: 0xA2
	Parameters: 0
	Flags: Linked
*/
function threat_sight_player_init()
{
	if(!isdefined(self.stealth.threat_entities))
	{
		self.stealth.threat_entities = [];
	}
	if(!isdefined(self.stealth.threat_visible))
	{
		self.stealth.threat_visible = 0;
	}
	if(!isdefined(self.stealth.threat_combat))
	{
		self.stealth.threat_combat = 0;
	}
	if(!isdefined(self.stealth.threat_sighted))
	{
		self.stealth.threat_sighted = [];
	}
}

/*
	Name: threat_sight_player_entity_state_set
	Namespace: namespace_6c0cd084
	Checksum: 0x2D36F75F
	Offset: 0x1320
	Size: 0x1DC
	Parameters: 2
	Flags: Linked
*/
function threat_sight_player_entity_state_set(ai, statename)
{
	if(!isdefined(self.stealth))
	{
		self thread stealth_player::main();
	}
	self threat_sight_player_init();
	entid = ai getentitynumber();
	switch(statename)
	{
		case "hidden":
		{
			self.stealth.threat_sighted[entid] = undefined;
			break;
		}
		case "hash_4b55a59a56c4bdb3":
		{
			ai setthreatsight(self, 0);
			break;
		}
		case "investigate":
		{
			break;
		}
		case "death":
		{
			ai setthreatsight(self, 0);
			break;
		}
	}
	switch(statename)
	{
		case "death":
		{
			self.stealth.threat_entities[entid] = undefined;
			self.stealth.threat_sighted[entid] = undefined;
			break;
		}
		default:
		{
			self.stealth.threat_entities[entid] = ai;
			break;
		}
	}
	if(!isdefined(self.stealth.threat_thread))
	{
		self.stealth.threat_thread = 1;
		self thread threat_sight_player_entity_state_thread();
	}
}

/*
	Name: function_36a6a90
	Namespace: namespace_6c0cd084
	Checksum: 0xBCE3DA78
	Offset: 0x1508
	Size: 0x22
	Parameters: 0
	Flags: Linked
*/
function function_36a6a90()
{
	return is_true(self.stealth.var_56d82ea8);
}

/*
	Name: function_79fc894b
	Namespace: namespace_6c0cd084
	Checksum: 0x779111B1
	Offset: 0x1538
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function function_79fc894b(player)
{
	if(self namespace_979752dc::function_a54113fb())
	{
		snd::play("uin_stealth_alert", [1:"j_head", 0:self]);
	}
	self.stealth.var_56d82ea8 = 1;
	self threat_sight_sighted(player);
}

/*
	Name: function_ee9635fa
	Namespace: namespace_6c0cd084
	Checksum: 0x33616E15
	Offset: 0x15C8
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function function_ee9635fa(player)
{
	if(self namespace_979752dc::function_a54113fb())
	{
		snd::play("uin_stealth_grace", [1:"j_head", 0:self]);
	}
	self threat_sight_sighted(player);
}

/*
	Name: function_740f4859
	Namespace: namespace_6c0cd084
	Checksum: 0x4DAD9F7D
	Offset: 0x1648
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function function_740f4859(player)
{
	if(self namespace_979752dc::function_a54113fb())
	{
		snd::play("uin_stealth_spotted", [1:"j_head", 0:self]);
	}
	self threat_sight_sighted(player);
}

/*
	Name: threat_sight_sighted
	Namespace: namespace_6c0cd084
	Checksum: 0x634111F2
	Offset: 0x16C8
	Size: 0x2EC
	Parameters: 1
	Flags: Linked
*/
function threat_sight_sighted(player)
{
	self endon(#"death", #"hash_32b0a9d6ca03306f");
	player endon(#"death");
	/#
		assert(isdefined(player.stealth));
	#/
	/#
		assert(isdefined(player.stealth.threat_sighted));
	#/
	entid = self getentitynumber();
	if(self [[self.fnisinstealthhunt]]())
	{
		self getenemyinfo(player);
		self function_a3fcf9e0("combat", player, player.origin);
		return;
	}
	player.stealth.threat_sighted[entid] = self;
	self function_a3fcf9e0("sight", player, player.origin);
	if(!isdefined(self.stealth.threat_sight_count))
	{
		self.stealth.threat_sight_count = 0;
	}
	else
	{
		self.stealth.threat_sight_count++;
	}
	waittime = self namespace_979752dc::alert_delay_distance_time(player);
	waittime = waittime / pow(2, self.stealth.threat_sight_count);
	waittime = waittime * 1000;
	curtime = gettime();
	self.stealth.reactendtime = curtime + waittime;
	starttime = curtime;
	reactendtime = curtime + waittime;
	while(gettime() < reactendtime)
	{
		if(is_true(self.stealth.blind) || !isdefined(self.stealth.threat_sight_count))
		{
			break;
		}
		waittime = self namespace_979752dc::alert_delay_distance_time(player);
		waittime = waittime / pow(2, self.stealth.threat_sight_count);
		waittime = waittime * 1000;
		if(starttime + waittime < reactendtime)
		{
			reactendtime = starttime + waittime;
		}
		waitframe(1);
	}
	self thread threat_sight_sighted_wait_lost(player);
}

/*
	Name: threat_sight_sighted_wait_lost
	Namespace: namespace_6c0cd084
	Checksum: 0x81D5462E
	Offset: 0x19C0
	Size: 0xFC
	Parameters: 1
	Flags: Linked
*/
function threat_sight_sighted_wait_lost(player)
{
	var_4897dbc7 = player getentitynumber();
	self notify("threat_sight_sighted_wait_lost_" + var_4897dbc7);
	self endon("threat_sight_sighted_wait_lost_" + var_4897dbc7, #"death");
	player endon(#"death");
	entid = self getentitynumber();
	player.stealth.threat_sighted[entid] = undefined;
	while(true)
	{
		self.stealth.threat_sight_lost = self getthreatsight(player) < 0.75;
		if(self.stealth.threat_sight_lost)
		{
			return;
		}
		wait(0.05);
	}
}

/*
	Name: threat_sight_force_visible
	Namespace: namespace_6c0cd084
	Checksum: 0xB23DF63F
	Offset: 0x1AC8
	Size: 0x174
	Parameters: 2
	Flags: Linked
*/
function threat_sight_force_visible(var_4efdd43, durationseconds)
{
	end = gettime() + (int(1000 * durationseconds));
	entnum = var_4efdd43 getentitynumber();
	if(!isdefined(self.stealth.force_visible))
	{
		self.stealth.force_visible = [];
	}
	if(isdefined(self.stealth.force_visible[entnum]))
	{
		self.stealth.force_visible[entnum].end = max(self.stealth.force_visible[entnum].end, end);
	}
	else
	{
		self.stealth.force_visible[entnum] = spawnstruct();
		self.stealth.force_visible[entnum].end = end;
	}
	self.stealth.force_visible[entnum].ent = var_4efdd43;
	self thread threat_sight_force_visible_thread();
}

/*
	Name: threat_sight_force_visible_thread
	Namespace: namespace_6c0cd084
	Checksum: 0x384437B3
	Offset: 0x1C48
	Size: 0x406
	Parameters: 0
	Flags: Linked
*/
function threat_sight_force_visible_thread()
{
	if(is_true(self.stealth.force_visible_thread))
	{
		return;
	}
	self notify(#"threat_sight_force_visible_thread");
	self endon(#"threat_sight_force_visible_thread", #"death");
	self.stealth.force_visible_thread = 1;
	waittime = 0.05;
	notified = 0;
	while(isdefined(self.stealth.force_visible) && self.stealth.force_visible.size > 0)
	{
		now = gettime();
		remove = [];
		delta = level.var_53ad6e22[#"hash_558c10dc4ef11317"] * waittime;
		foreach(var_ece722e0 in self.stealth.force_visible)
		{
			if(now < var_ece722e0.end && issentient(var_ece722e0.ent) && !self cansee(var_ece722e0.ent))
			{
				newthreat = self getthreatsight(var_ece722e0.ent);
				if(isplayer(var_ece722e0.ent))
				{
					var_ece722e0.ent thread threat_sight_player_sight_audio(1, max(var_ece722e0.ent.stealth.maxthreat, newthreat));
				}
				if(newthreat + delta < level.var_53ad6e22[#"hash_5d465b52a32fbc49"])
				{
					newthreat = newthreat + delta;
					self setthreatsight(var_ece722e0.ent, newthreat);
					if(level.var_53ad6e22[#"hash_5d465b52a32fbc49"] >= 1 && newthreat >= 1 && !notified)
					{
						self function_a3fcf9e0("sight", var_ece722e0.ent, var_ece722e0.ent.origin);
						notified = 1;
					}
					else if(newthreat < 0.75 && notified)
					{
						notified = 0;
					}
				}
				continue;
			}
			remove[remove.size] = key;
		}
		foreach(key in remove)
		{
			self.stealth.force_visible[key] = undefined;
		}
		wait(waittime);
	}
	self.stealth.force_visible = undefined;
	self.stealth.force_visible_thread = undefined;
}

/*
	Name: function_7af4fa05
	Namespace: namespace_6c0cd084
	Checksum: 0xB3891545
	Offset: 0x2058
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_7af4fa05(entity)
{
	self setthreatsight(entity, 0.05);
}

/*
	Name: threat_sight_player_entity_state_thread
	Namespace: namespace_6c0cd084
	Checksum: 0xA94B11D2
	Offset: 0x2090
	Size: 0x684
	Parameters: 0
	Flags: Linked
*/
function threat_sight_player_entity_state_thread()
{
	self endon(#"death");
	level endon(#"hash_34d443ce908d0498");
	var_94603cb7 = 0;
	while(true)
	{
		var_6330dd7b = 0;
		self.stealth.maxthreat = 0;
		self.stealth.maxalertlevel = -1;
		playereye = self getplayercamerapos();
		var_2efc79ea = 0.2588;
		foreach(entity in self.stealth.threat_entities)
		{
			if(!isalive(entity))
			{
				continue;
			}
			if(is_true(entity.in_melee_death))
			{
				continue;
			}
			entid = entity getentitynumber();
			self.stealth.maxalertlevel = max(self.stealth.maxalertlevel, entity.alertlevelint);
			if(level.var_53ad6e22[#"hash_608e38c8a93de439"])
			{
				if(!isdefined(entity.fnisinstealthcombat) || entity [[entity.fnisinstealthcombat]]())
				{
					continue;
				}
				var_17c874ba = entity getthreatsight(self);
				var_3f0097e8 = isdefined(entity.stealth.investigateevent) && entity.stealth.investigateevent.typeorig == "sight";
				var_566de12 = entity cansee(self);
				if(var_566de12)
				{
					var_94603cb7 = gettime();
				}
				if(var_566de12 && isplayer(self) && var_17c874ba > 0.09 && self player_is_sprinting_at_me(entity))
				{
					entity function_a3fcf9e0("sight", self, self.origin);
				}
				else
				{
					if(!isdefined(entity.stealth.investigateevent) && !is_true(entity.var_c5553760) && !entity function_36a6a90() && var_17c874ba >= 0.5)
					{
						if(!isdefined(self.stealth.threat_sighted[entid]))
						{
							entity thread function_79fc894b(self);
						}
					}
					else
					{
						if(var_17c874ba >= 1)
						{
							if(entity namespace_979752dc::function_d58e1c1c() && entity.awarenesslevelcurrent != "high_alert")
							{
								entity thread function_ee9635fa(self);
							}
							else if(!isdefined(self.stealth.threat_sighted[entid]))
							{
								entity thread function_740f4859(self);
							}
						}
						else if(var_3f0097e8 && entity namespace_979752dc::function_d58e1c1c() && entity.alertlevel == "high_alert")
						{
							var_751fc2b7 = entity namespace_979752dc::function_196ad164();
							if(var_17c874ba > 0)
							{
								if(!var_751fc2b7)
								{
									entity namespace_979752dc::function_3249d5ff();
								}
							}
							else if(var_751fc2b7)
							{
								entity namespace_979752dc::function_64608a78();
							}
						}
					}
				}
				var_8735c97f = self.stealth.maxthreat;
				self.stealth.maxthreat = max(self.stealth.maxthreat, entity getthreatsight(self));
				if(self.stealth.maxthreat > 0.05)
				{
					if(!isdefined(self.stealth.maxthreat_enemy) || self.stealth.maxthreat !== var_8735c97f)
					{
						self.stealth.maxthreat_enemy = entity;
					}
				}
			}
			if(entity.alertlevel == "combat" || !entity.threatsight)
			{
				var_6330dd7b = 1;
			}
		}
		var_56a7a731 = !var_6330dd7b && var_94603cb7 > 0 && (gettime() - var_94603cb7) < 250;
		if(level.var_53ad6e22[#"hash_aaa65a819f18898"] <= 0)
		{
			self thread threat_sight_player_sight_audio(var_56a7a731, self.stealth.maxthreat);
		}
		self.stealth.threat_visible = var_56a7a731;
		wait(0.05);
	}
}

/*
	Name: player_is_sprinting_at_me
	Namespace: namespace_6c0cd084
	Checksum: 0x63642604
	Offset: 0x2720
	Size: 0xBA
	Parameters: 1
	Flags: Linked
*/
function player_is_sprinting_at_me(ai)
{
	if(!self issprinting())
	{
		return 0;
	}
	if(isdefined(level.stealth.var_6fd6463b))
	{
		distancesq = distancesquared(self.origin, ai.origin);
		if(distancesq > level.stealth.var_6fd6463b)
		{
			return 0;
		}
	}
	return util::within_fov(self.origin, self.angles, ai.origin, 0.93969);
}

/*
	Name: threat_sight_fake
	Namespace: namespace_6c0cd084
	Checksum: 0x3728DC37
	Offset: 0x27E8
	Size: 0x184
	Parameters: 2
	Flags: None
*/
function threat_sight_fake(origin, amount)
{
	self notify(#"threat_sight_fake");
	self endon(#"threat_sight_fake");
	setsaveddvar(#"hash_aaa65a819f18898", amount);
	setsaveddvar(#"hash_db3d6b4a347dd10", origin[0]);
	setsaveddvar(#"hash_db3d7b4a347dec3", origin[1]);
	setsaveddvar(#"hash_db3d8b4a347e076", origin[2]);
	if(!isdefined(self.stealth.maxthreat))
	{
		self.stealth.maxthreat = 0;
	}
	while(amount > 0)
	{
		self thread threat_sight_player_sight_audio(1, max(self.stealth.maxthreat, amount));
		wait(0.05);
	}
	self thread threat_sight_player_sight_audio(0, max(self.stealth.maxthreat, amount));
}

/*
	Name: threat_sight_player_sight_audio
	Namespace: namespace_6c0cd084
	Checksum: 0x582A8EAF
	Offset: 0x2978
	Size: 0x68
	Parameters: 3
	Flags: Linked
*/
function threat_sight_player_sight_audio(var_56a7a731, maxthreat, var_2107b994)
{
	if(isdefined(level.stealth) && isdefined(level.stealth.fnthreatsightplayersightaudio))
	{
		self thread [[level.stealth.fnthreatsightplayersightaudio]](var_56a7a731, maxthreat, var_2107b994);
	}
}

