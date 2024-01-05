#using scripts\cp_common\util.gsc;
#using scripts\cp_common\bb.gsc;
#using script_7d0013bbc05623b9;
#using script_52da18c20f45c56a;
#using script_3626f1b2cf51a99c;
#using scripts\cp_common\gametypes\battlechatter.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using script_522aeb6ae906391e;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\math_shared.gsc;

#namespace namespace_9c83b58d;

/*
	Name: __init__system__
	Namespace: namespace_9c83b58d
	Checksum: 0x77A09EA2
	Offset: 0x328
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_7e93e9089f28804f", &function_70a657d8, undefined, undefined, #"actions");
}

/*
	Name: function_70a657d8
	Namespace: namespace_9c83b58d
	Checksum: 0x47D7A313
	Offset: 0x378
	Size: 0x26C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!isdefined(level.var_c8b4a78a))
	{
		function_5ac4dc99("takedown_scene", "");
		/#
			function_5ac4dc99("", 0);
		#/
		/#
			function_5ac4dc99("", 0);
		#/
		level.var_c8b4a78a = spawnstruct();
		level.var_c8b4a78a.var_c8b4a78a = [];
		level.var_c8b4a78a.var_44025b0b = [];
		function_4cb18218();
		animation::add_global_notetrack_handler("death", &function_64852b21, 0);
		animation::add_global_notetrack_handler("ragdoll", &function_caa295ea, 0);
		animation::add_global_notetrack_handler("start_ragdoll", &function_caa295ea, 0);
		actions::function_9ddfe2d("takedown", &function_69bc40d4);
		function_cd140ee9("player_useRadius", &function_c30fad9a);
		function_cd140ee9("ai_corpseSynch", &function_c30fad9a);
		/#
			function_cd140ee9("", &function_c30fad9a);
		#/
		/#
			function_cd140ee9("", &function_c30fad9a);
		#/
		/#
			function_cd140ee9("", &function_c30fad9a);
		#/
		function_cd140ee9("takedown_scene", &function_c30fad9a);
	}
}

/*
	Name: function_c30fad9a
	Namespace: namespace_9c83b58d
	Checksum: 0x4613F46B
	Offset: 0x5F0
	Size: 0x2CE
	Parameters: 0
	Flags: Private
*/
function private function_c30fad9a()
{
	foreach(player in getplayers())
	{
		if(!isdefined(player.takedown))
		{
			player.takedown = spawnstruct();
		}
		if(!isdefined(player.takedown.victim))
		{
			player.takedown.victim = [];
		}
		/#
			if(!isdefined(player.takedown.debug))
			{
				player.takedown.debug = spawnstruct();
			}
			player.takedown.debug.var_c03e7127 = (getdvarint(#"hash_2ea233605fe3be4", 0) ? 1 : undefined);
			player.takedown.debug.var_e2adb106 = (getdvarint(#"hash_65ef9879f3b39ad5", 0) ? 1 : undefined);
			player.takedown.debug.var_b47c9f89 = (getdvarint(#"hash_38e86dc5164822fe", 0) ? 1 : undefined);
			if(is_true(player.takedown.debug.var_c03e7127))
			{
				player thread actions::function_d661f822();
			}
			else
			{
				player notify(#"hash_2eaf8be0116c39a9");
			}
		#/
		player.takedown.var_70354814 = getdvarstring(#"takedown_scene", "");
		player.takedown.use_radius = getdvarfloat(#"player_useradius");
		player.takedown.ai_corpsesynch = getdvarint(#"ai_corpsesynch", 0);
	}
}

/*
	Name: function_4cb18218
	Namespace: namespace_9c83b58d
	Checksum: 0x76AE86B4
	Offset: 0x8C8
	Size: 0xA8
	Parameters: 0
	Flags: Private
*/
function private function_4cb18218()
{
	var_223ffdd1 = getscriptbundlenames("takedown");
	foreach(var_fc96f513 in var_223ffdd1)
	{
		level function_8528a766(var_fc96f513);
	}
}

/*
	Name: function_8528a766
	Namespace: namespace_9c83b58d
	Checksum: 0x7896655D
	Offset: 0x978
	Size: 0x6DC
	Parameters: 1
	Flags: Private
*/
function private function_8528a766(var_fc96f513)
{
	takedown = getscriptbundle(var_fc96f513);
	if(!isdefined(takedown))
	{
		return;
	}
	/#
		assert(takedown.type == "");
	#/
	/#
		assert(isdefined(level.var_c8b4a78a));
	#/
	var_1d5a6fd3 = spawnstruct();
	var_1d5a6fd3.scenes = [];
	if(isdefined(takedown.scenes))
	{
		foreach(scene in takedown.scenes)
		{
			if(isdefined(scene.scene) && scene.scene != "")
			{
				var_1d5a6fd3.scenes[var_1d5a6fd3.scenes.size] = scene.scene;
			}
		}
	}
	if(var_1d5a6fd3.scenes.size > 0)
	{
		var_1d5a6fd3.name = takedown.name;
		var_1d5a6fd3.prompt = (isdefined(takedown.prompt) ? takedown.prompt : undefined);
		var_1d5a6fd3.combat = (is_true(takedown.combat) ? 1 : undefined);
		var_1d5a6fd3.var_72a597df = (is_true(takedown.var_72a597df) ? 1 : undefined);
		var_1d5a6fd3.sprint = (is_true(takedown.sprint) ? 1 : undefined);
		var_1d5a6fd3.var_7b381548 = (is_true(takedown.var_7b381548) ? 1 : undefined);
		var_1d5a6fd3.slide = (is_true(takedown.slide) ? 1 : undefined);
		var_1d5a6fd3.var_10f9a19c = (is_true(takedown.var_10f9a19c) ? 1 : undefined);
		if(isdefined(takedown.action))
		{
			actions = strtok(takedown.action, " ,");
			foreach(actionname in actions)
			{
				var_1d5a6fd3.actions[actionname] = 1;
			}
		}
		var_1d5a6fd3.var_ad61bf60 = (takedown.yawrange < 180 ? anglestoforward((0, (isdefined(takedown.yaw) ? takedown.yaw : 0), 0)) : undefined);
		var_1d5a6fd3.var_8f4fda5a = (takedown.yawrange < 180 ? cos(takedown.yawrange) : undefined);
		var_1d5a6fd3.minrangesqr = (takedown.minrange > 0 ? sqr(takedown.minrange) : undefined);
		var_1d5a6fd3.maxrangesqr = (isdefined(takedown.maxrange) ? sqr(takedown.maxrange) : undefined);
		var_1d5a6fd3.minheight = (isdefined(takedown.minheight) ? takedown.minheight : undefined);
		var_1d5a6fd3.maxheight = (isdefined(takedown.maxheight) ? takedown.maxheight : undefined);
		var_1d5a6fd3.trace = (is_true(takedown.trace) ? 1 : undefined);
		var_1d5a6fd3.traceheight = (is_true(takedown.trace) ? takedown.traceheight : undefined);
		var_1d5a6fd3.var_72970ce2 = (is_true(takedown.var_72970ce2) ? 1 : undefined);
		var_1d5a6fd3.var_38190f69 = (is_true(takedown.var_38190f69) ? 1 : undefined);
		var_1d5a6fd3.var_a1aba651 = (is_true(takedown.var_a1aba651) ? 1 : undefined);
		level.var_c8b4a78a.var_c8b4a78a[takedown.name] = var_1d5a6fd3;
		level.var_c8b4a78a.maxrange = max((isdefined(level.var_c8b4a78a.maxrange) ? level.var_c8b4a78a.maxrange : 0), (isdefined(takedown.maxrange) ? takedown.maxrange : 0));
	}
	else
	{
		/#
			assertmsg(("" + takedown.name) + "");
		#/
	}
}

/*
	Name: player_init
	Namespace: namespace_9c83b58d
	Checksum: 0x570D3A2
	Offset: 0x1060
	Size: 0xD4
	Parameters: 0
	Flags: Private
*/
function private player_init()
{
	/#
		assert(isplayer(self));
	#/
	if(!isdefined(self.takedown))
	{
		if(!isdefined(self.takedown))
		{
			self.takedown = spawnstruct();
		}
		/#
			if(!isdefined(self.takedown.debug))
			{
				self.takedown.debug = spawnstruct();
			}
		#/
		self.takedown.disabled = undefined;
		self.takedown.var_546f8f54 = undefined;
		self.takedown.victim = [];
		function_c30fad9a();
	}
}

/*
	Name: function_69bc40d4
	Namespace: namespace_9c83b58d
	Checksum: 0x789C7EC4
	Offset: 0x1140
	Size: 0xBE
	Parameters: 1
	Flags: Private
*/
function private function_69bc40d4(action)
{
	self endon(action.ender);
	self player_init();
	self thread function_e3bc3dc9(action);
	var_3f34aa83 = self actions::function_83bde308(action, "melee");
	if(is_true(var_3f34aa83))
	{
		self actions::function_8488e359();
		return self function_3bab44ea(action);
	}
	return 0;
}

/*
	Name: function_3bab44ea
	Namespace: namespace_9c83b58d
	Checksum: 0x22C1126C
	Offset: 0x1208
	Size: 0x18C
	Parameters: 3
	Flags: None
*/
function function_3bab44ea(action, fullbody, var_a2ca14bc)
{
	self endon(fullbody.ender);
	if(is_true(self.takedown.disabled))
	{
		return false;
	}
	if(function_f8af9078(fullbody.name))
	{
		return false;
	}
	if(isalive(self.takedown.victim[fullbody.name]))
	{
		victim = self.takedown.victim[fullbody.name];
		scene = self.takedown.scene[fullbody.name];
		if(isdefined(victim) && isdefined(scene))
		{
			self notify("takedown_monitor_generic_" + fullbody.name);
			if(isdefined(level.var_c8b4a78a.var_44025b0b[fullbody.name]))
			{
				self thread [[level.var_c8b4a78a.var_44025b0b[fullbody.name]]]();
			}
			else
			{
				self thread takedown_begin(fullbody, var_a2ca14bc, victim, scene);
			}
			return true;
		}
	}
	return false;
}

/*
	Name: takedown_begin
	Namespace: namespace_9c83b58d
	Checksum: 0xF8FAA4F
	Offset: 0x13A0
	Size: 0x414
	Parameters: 4
	Flags: None
*/
function takedown_begin(action, fullbody, victim, scene)
{
	self endoncallback(&function_cee18456, action.ender);
	if(!is_true(self.takedown.debug.var_b47c9f89))
	{
		self function_7a061b23(0, undefined);
	}
	self.takedown.weapon = self getcurrentweapon();
	self.takedown.var_e62b225a = self namespace_594b67e::function_1a2a3654();
	self.takedown.start_origin = self.origin;
	self.in_melee_death = 1;
	self flag::set("in_action");
	self val::set(#"action", "takedamage", 0);
	if(!isalive(victim))
	{
		self actions::function_942d9213();
		return;
	}
	if(isdefined(victim))
	{
		victim notify(#"takedown_begin");
		victim notify(#"stop_going_to_node");
		victim namespace_594b67e::function_71180c30(1);
		victim prompts::remove(#"melee");
		victim util::remove_cursor_hint();
		victim.in_melee_death = 1;
		if(isdefined(level.var_ab828d57))
		{
			victim util::delay(0.1, undefined, level.var_ab828d57);
		}
		victim flag::set("scripted_lookat_disable");
		victim ai::look_at(undefined, 0);
		victim flag::set("in_action");
		victim util::delay(0.5, "takedown_executed", &namespace_594b67e::function_71180c30, 0);
		if(isdefined(level.var_b19e4f0a))
		{
			victim util::delay(1, undefined, level.var_b19e4f0a, "ally_damaged", "ally_hurt_peripheral", self, 50, 500);
		}
		victim.animname = "generic";
	}
	self namespace_594b67e::function_b0190b65(action);
	self namespace_594b67e::function_c0f7b46e(fullbody, 1);
	self namespace_594b67e::function_e2fcacb2(10);
	if(actions::function_1028d928(action.name, "grab"))
	{
		self.takedown.var_67582ca5 = victim;
		self function_6940d001(action, scene, 0.25, "grab");
	}
	self thread function_7ef965ed(action);
	self function_7a061b23(1, undefined);
	victim thread function_970b3d76(action, scene, self);
}

/*
	Name: function_cee18456
	Namespace: namespace_9c83b58d
	Checksum: 0xEEDB4398
	Offset: 0x17C0
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function function_cee18456(parms)
{
	if(parms == #"hash_20dda4a52ba67955")
	{
		self thread takedown_cleanup();
	}
}

/*
	Name: function_6940d001
	Namespace: namespace_9c83b58d
	Checksum: 0xD69EC6E1
	Offset: 0x1800
	Size: 0x184
	Parameters: 4
	Flags: None
*/
function function_6940d001(action, scene, time, var_9386e7ce)
{
	victim = self.takedown.victim[action.name];
	/#
		assert(isalive(victim));
	#/
	self namespace_594b67e::allow_weapon(0);
	scene_root = victim function_4c0949f2(self, scene);
	var_86b37828 = self.takedown.takedown[action.name].name;
	if(time > 0)
	{
		wait(time);
	}
	self util::delay(0.2, undefined, &function_1c85708e);
	if(self actions::function_ae44e21b(action, "melee"))
	{
		if(isweapon(self.takedown.var_e62b225a))
		{
			self namespace_594b67e::function_b56ad054();
			self actions::function_3af7d065(1, var_9386e7ce);
		}
	}
}

/*
	Name: function_1c85708e
	Namespace: namespace_9c83b58d
	Checksum: 0xD9A96D93
	Offset: 0x1990
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function function_1c85708e()
{
	self.var_6639d45b namespace_594b67e::function_30b535ff(0);
}

/*
	Name: function_41abe76e
	Namespace: namespace_9c83b58d
	Checksum: 0xB286E214
	Offset: 0x19B8
	Size: 0x32A
	Parameters: 1
	Flags: None
*/
function function_41abe76e(action)
{
	/#
		assert(isplayer(self));
	#/
	now = gettime();
	if((isdefined(self.takedown.var_e38a7cb3) ? self.takedown.var_e38a7cb3 : -1) == now)
	{
		return self.takedown.var_41abe76e;
	}
	self.takedown.var_41abe76e = 1;
	stance = self getstance();
	if(!isalive(self))
	{
		self.takedown.var_41abe76e = 0;
	}
	else
	{
		if(isdefined(self getlinkedent()))
		{
			self.takedown.var_41abe76e = 0;
		}
		else
		{
			if(is_true(self.takedown.disabled))
			{
				self.takedown.var_41abe76e = 0;
			}
			else
			{
				if(stance == "prone")
				{
					self.takedown.var_41abe76e = 0;
				}
				else
				{
					if(self isthrowinggrenade())
					{
						self.takedown.var_41abe76e = 0;
					}
					else
					{
						if(self getcurrentweapon().name == "none")
						{
							self.takedown.var_41abe76e = 0;
						}
						else if(stance !== "stand")
						{
							if(!self isstanceallowed("stand"))
							{
								self.takedown.var_41abe76e = 0;
							}
							else
							{
								var_25b46261 = 5;
								endz = var_25b46261 + 0.1;
								traceresult = playerphysicstrace(self.origin + (0, 0, var_25b46261), self.origin + (0, 0, endz));
								if(traceresult[2] < self.origin[2] + endz)
								{
									/#
										box(self.origin + (0, 0, var_25b46261), vectorscale((-1, -1, 0), 15), (15, 15, 70), 0, (1, 0, 0), 1, 1, 1);
									#/
									self.takedown.var_41abe76e = 0;
								}
							}
						}
					}
				}
			}
		}
	}
	self.takedown.var_e38a7cb3 = now;
	return self.takedown.var_41abe76e;
}

/*
	Name: function_e3bc3dc9
	Namespace: namespace_9c83b58d
	Checksum: 0xF954AB5C
	Offset: 0x1CF0
	Size: 0xAA4
	Parameters: 1
	Flags: None
*/
function function_e3bc3dc9(action)
{
	self notify("takedown_monitor_generic_" + action.name);
	self endoncallback(&function_7d4b1333, action.ender, #"death", #"disconnect", "takedown_monitor_generic_" + action.name);
	self.takedown.var_bf0ca7db[action.name] = 0;
	var_ac859813 = "take_down";
	if(isdefined(level.var_c8b4a78a.var_ac859813) && isdefined(level.var_c8b4a78a.var_ac859813[action.name]))
	{
		var_ac859813 = level.var_c8b4a78a.var_ac859813[action.name];
	}
	while(true)
	{
		waitframe(1);
		if(isdefined(self.takedown.victim[action.name]) && self.takedown.allow_melee)
		{
			self function_db07e398(action.name, undefined);
		}
		if(level flag::get("hold_context_melee"))
		{
			self function_7a061b23(1, action.name);
			level flag::wait_till_clear("hold_context_melee");
		}
		if(!self function_41abe76e(action))
		{
			self function_7a061b23(1, action.name);
			continue;
		}
		var_ebd06be2 = self function_5ca78f5a(action);
		if(isdefined(var_ebd06be2))
		{
			self function_db07e398(action.name, var_ebd06be2[0]);
			self.takedown.scene[action.name] = var_ebd06be2[1];
			self.takedown.takedown[action.name] = var_ebd06be2[2];
			if(!self.takedown.var_bf0ca7db[action.name] && self.var_2cb06cc6.name == "root")
			{
				var_22a9143 = actions::function_1028d928(action.name, "grab");
				var_86b37828 = self.takedown.takedown[action.name].name;
				var_6e051 = self.takedown.takedown[action.name].prompt;
				self.takedown.victim[action.name] prompts::create(#"melee", var_6e051);
				self.takedown.victim[action.name] prompts::function_a4cf2cde({#tag:"j_spine4"});
				self.takedown.victim[action.name] prompts::function_92127496(1);
				self.takedown.victim[action.name] prompts::function_44d7831a(#"melee", 0);
				self.takedown.victim[action.name] prompts::function_8f5eb0a6(#"melee", 0);
				self.takedown.victim[action.name] prompts::function_d03d79d6(#"melee", 0);
				self.takedown.victim[action.name] prompts::function_4cb5d3a1(#"melee", 0);
				self.takedown.victim[action.name] prompts::function_dcf99fad(#"melee", 1);
				self.takedown.victim[action.name] prompts::function_3171730f(#"melee", #"actions");
				self.takedown.victim[action.name] prompts::function_68782902(#"melee", 1000);
				self.takedown.victim[action.name] prompts::function_b95d71cd(#"melee", 180);
				self.takedown.victim[action.name] prompts::create(#"hash_3c5c65155dfb1731", #"hash_4759bc1b8324047c");
				self.takedown.victim[action.name] prompts::function_46df0bc7(#"melee", 5);
				self.takedown.victim[action.name] prompts::function_44d7831a(#"hash_3c5c65155dfb1731", 0);
				self.takedown.victim[action.name] prompts::function_8f5eb0a6(#"hash_3c5c65155dfb1731", 0.1);
				self.takedown.victim[action.name] prompts::function_d03d79d6(#"hash_3c5c65155dfb1731", 0.2);
				self.takedown.victim[action.name] prompts::function_a4a9acfc(#"hash_3c5c65155dfb1731", &function_3cadc363);
				self.takedown.victim[action.name] prompts::function_4cb5d3a1(#"hash_3c5c65155dfb1731", 0);
				self.takedown.victim[action.name] prompts::function_dcf99fad(#"hash_3c5c65155dfb1731", 1);
				self.takedown.victim[action.name] prompts::function_3171730f(#"hash_3c5c65155dfb1731", #"actions");
				self.takedown.victim[action.name] prompts::function_68782902(#"hash_3c5c65155dfb1731", 1000);
				self.takedown.victim[action.name] prompts::function_b95d71cd(#"hash_3c5c65155dfb1731", 180);
				self thread takedown_prompt_monitor(action, var_86b37828);
				self.takedown.var_bf0ca7db[action.name] = 1;
			}
			self function_7a061b23(0, action.name);
			/#
				if(is_true(self.takedown.debug.var_c03e7127) && isentity(var_ebd06be2[0]) && isdefined(var_ebd06be2[1]))
				{
					debugstar(var_ebd06be2[0].origin + vectorscale((0, 0, 1), 30), 1, (1, 0, 0), var_ebd06be2[1], 0.1);
				}
			#/
		}
		else
		{
			self function_db07e398(action.name, undefined);
			self function_7a061b23(1, action.name);
		}
		foreach(key, value in self.takedown.victim)
		{
			if(!isdefined(value))
			{
				self function_db07e398(key, undefined);
			}
		}
	}
}

/*
	Name: function_3cadc363
	Namespace: namespace_9c83b58d
	Checksum: 0xCF035A48
	Offset: 0x27A0
	Size: 0x92
	Parameters: 1
	Flags: Private
*/
function private function_3cadc363(var_248cbbcf)
{
	/#
		assert(isplayer(var_248cbbcf.player));
	#/
	if(self.var_f467e5b0.enabled[#"body_shield"] === 0)
	{
		return 0;
	}
	return isweapon(var_248cbbcf.player namespace_594b67e::function_1a2a3654());
}

/*
	Name: function_7d4b1333
	Namespace: namespace_9c83b58d
	Checksum: 0xE8B0C35B
	Offset: 0x2840
	Size: 0x54
	Parameters: 1
	Flags: Private
*/
function private function_7d4b1333(var_201c5b1f)
{
	if(var_201c5b1f != #"death" && var_201c5b1f != #"disconnect")
	{
		self function_7a061b23(1, undefined);
	}
}

/*
	Name: takedown_prompt_monitor
	Namespace: namespace_9c83b58d
	Checksum: 0x869BC7BE
	Offset: 0x28A0
	Size: 0x160
	Parameters: 3
	Flags: None
*/
function takedown_prompt_monitor(action, var_d426470, var_72612ea0)
{
	/#
		assert(isplayer(self));
	#/
	loc_00002904:
	self notify(("takedown_prompt_monitor" + (isdefined(var_d426470) ? var_d426470 : "_")) + (isdefined(var_72612ea0) ? var_72612ea0 : "_"));
	loc_00002940:
	self endon(("takedown_prompt_monitor" + (isdefined(var_d426470) ? var_d426470 : "_")) + (isdefined(var_72612ea0) ? var_72612ea0 : "_"));
	self endon(action.ender);
	while(true)
	{
		if(!isdefined(self.takedown.victim) || self.takedown.victim.size == 0 || is_true(self.in_melee_death))
		{
			self function_db07e398(action.name, undefined, self.in_melee_death);
			return;
		}
		waitframe(1);
	}
}

/*
	Name: function_146a3d56
	Namespace: namespace_9c83b58d
	Checksum: 0x5EAAA597
	Offset: 0x2A08
	Size: 0x6A
	Parameters: 1
	Flags: None
*/
function function_146a3d56(enemy)
{
	/#
		assert(isplayer(self));
	#/
	return vectornormalize(enemy.var_97e2c0da.check_origin - self getplayercamerapos());
}

/*
	Name: function_5ca78f5a
	Namespace: namespace_9c83b58d
	Checksum: 0xD5C56DAE
	Offset: 0x2A80
	Size: 0x604
	Parameters: 1
	Flags: None
*/
function function_5ca78f5a(action)
{
	/#
		assert(isplayer(self));
	#/
	now = gettime();
	result = undefined;
	if((isdefined(self.takedown.var_8630163b) ? self.takedown.var_8630163b : -1) != now)
	{
		self.takedown.potential_victims = function_e45cbe76(self.origin, level.var_c8b4a78a.maxrange, "axis");
		self.takedown.var_8630163b = now;
	}
	if(self.takedown.potential_victims.size > 0)
	{
		fwd = anglestoforward(self getplayerangles());
		var_e3cd155d = vectornormalize((fwd[0], fwd[1], 0));
		playereye = self getplayercamerapos();
		best_dot = -1;
		foreach(enemy in self.takedown.potential_victims)
		{
			if(!isalive(enemy))
			{
				continue;
			}
			if(is_true(enemy.var_c681e4c1))
			{
				continue;
			}
			if(enemy.takedamage === 0)
			{
				continue;
			}
			if(enemy.species !== #"human")
			{
				continue;
			}
			if(enemy.var_f467e5b0.enabled[#"takedown"] === 0)
			{
				continue;
			}
			var_2dcf841c = function_3c43bd2a(action, enemy, self);
			if(isdefined(enemy.var_7b026ceb))
			{
				if(distance2dsquared(enemy.origin, self.origin) > sqr(enemy.var_7b026ceb))
				{
					continue;
				}
			}
			if(isdefined(var_2dcf841c.scene))
			{
				dir = self function_146a3d56(enemy);
				dot = vectordot(fwd, dir);
				if(dot > best_dot)
				{
					best_dot = dot;
					if(isdefined(enemy.takedown_scene))
					{
						var_2dcf841c.scene = enemy.takedown_scene;
					}
					else if(isdefined(enemy.var_d3f0031c) || isdefined(enemy.var_59212ad0))
					{
						var_ee55055 = -0.7071068;
						var_59f39012 = anglestoforward(enemy.angles);
						var_78662e77 = vectornormalize(self.origin - enemy.origin);
						dot = vectordot(var_78662e77, var_59f39012);
						if(isdefined(enemy.var_d3f0031c) && dot < var_ee55055)
						{
							var_2dcf841c.scene = enemy.var_d3f0031c;
							if(isdefined(enemy.var_4f8ed4b2) && isdefined(enemy.var_3e95b88f))
							{
								enemy prompts::function_263320e2(#"melee", enemy.var_4f8ed4b2);
							}
						}
						else
						{
							if(isdefined(enemy.var_59212ad0) && dot >= var_ee55055)
							{
								var_2dcf841c.scene = enemy.var_59212ad0;
								if(isdefined(enemy.var_f535b314) && isdefined(enemy.var_3e95b88f))
								{
									enemy prompts::function_263320e2(#"melee", enemy.var_f535b314);
								}
							}
							else if(isdefined(enemy.var_3e95b88f))
							{
								enemy prompts::function_263320e2(#"melee", #"hash_6a4c1594be34b79f");
							}
						}
					}
					if(isdefined(self.takedown.var_70354814) && self.takedown.var_70354814 != "" && isdefined(getscriptbundle(self.takedown.var_70354814)))
					{
						var_2dcf841c.scene = self.takedown.var_70354814;
					}
					result = [2:var_2dcf841c.takedown, 1:var_2dcf841c.scene, 0:enemy];
				}
			}
		}
	}
	return result;
}

/*
	Name: function_3c43bd2a
	Namespace: namespace_9c83b58d
	Checksum: 0xEF397842
	Offset: 0x3090
	Size: 0x1C4
	Parameters: 3
	Flags: None
*/
function function_3c43bd2a(action, victim, player)
{
	/#
		assert(isplayer(player));
	#/
	/#
		assert(isai(victim));
	#/
	var_879156ee = undefined;
	var_bf2073bc = undefined;
	victim function_8c04a084(player);
	foreach(takedown in level.var_c8b4a78a.var_c8b4a78a)
	{
		validplayer = player function_be279d34(action, takedown, victim);
		if(validplayer)
		{
			var_2cd3ac21 = victim function_c943b729(action, takedown, player);
			if(var_2cd3ac21)
			{
				var_879156ee = self function_945b4efe(takedown);
				var_bf2073bc = takedown;
				break;
			}
		}
	}
	return {#takedown:var_bf2073bc, #scene:var_879156ee};
}

/*
	Name: function_be279d34
	Namespace: namespace_9c83b58d
	Checksum: 0xCEF92544
	Offset: 0x3260
	Size: 0x292
	Parameters: 3
	Flags: None
*/
function function_be279d34(action, takedown, enemy)
{
	/#
		assert(isplayer(self));
	#/
	/#
		assert(isdefined(takedown));
	#/
	if(isdefined(takedown.actions) && !is_true(takedown.actions[action.name]))
	{
		return false;
	}
	if((isdefined(self.health) ? self.health : 0) <= 0)
	{
		return false;
	}
	if(self isthrowinggrenade())
	{
		return false;
	}
	/#
		if(is_true(self.takedown.debug.var_e2adb106))
		{
			return false;
		}
	#/
	dir = self function_146a3d56(enemy);
	dir_2d = vectornormalize((dir[0], dir[1], 0));
	if(vectordot(dir_2d, anglestoforward(self.angles)) < 0.7)
	{
		return false;
	}
	if(!is_true(takedown.sprint) && self issprinting())
	{
		return false;
	}
	if(!is_true(takedown.var_7b381548) && !self issprinting())
	{
		return false;
	}
	if(!is_true(takedown.slide) && self issliding())
	{
		return false;
	}
	if(!is_true(takedown.var_10f9a19c) && !self issliding())
	{
		return false;
	}
	return true;
}

/*
	Name: function_c943b729
	Namespace: namespace_9c83b58d
	Checksum: 0x21B2F059
	Offset: 0x3500
	Size: 0x564
	Parameters: 3
	Flags: None
*/
function function_c943b729(action, takedown, player)
{
	/#
		assert(isactor(self));
	#/
	if(!(isdefined(takedown) && isdefined(player)))
	{
		return false;
	}
	distsqr = distancesquared(player.origin, self.origin);
	combat = self function_2ae12730(player);
	if(!is_true(takedown.combat) && combat)
	{
		return false;
	}
	if(!is_true(takedown.var_72a597df) && !combat)
	{
		return false;
	}
	if(isdefined(takedown.minrangesqr) && distsqr < takedown.minrangesqr)
	{
		return false;
	}
	if(isdefined(takedown.maxrangesqr) && distsqr > takedown.maxrangesqr)
	{
		return false;
	}
	switch(blackboard::getstructblackboardattribute(self, "_stance"))
	{
		case "stand":
		{
			if(!is_true(takedown.var_72970ce2))
			{
				return false;
			}
			break;
		}
		case "crouch":
		{
			if(!is_true(takedown.var_38190f69))
			{
				return false;
			}
			break;
		}
		case "prone":
		{
			if(!is_true(takedown.var_a1aba651))
			{
				return false;
			}
			break;
		}
		default:
		{
			return false;
		}
	}
	if(isdefined(takedown.var_ad61bf60) && isdefined(takedown.var_8f4fda5a))
	{
		var_d96cb66d = anglestoright(self gettagangles("j_head")) * -1;
		var_a15c1f47 = anglestoforward(self.angles);
		var_da1c47f = lerpvector(var_d96cb66d, var_a15c1f47, 0.5);
		var_582b05a9 = rotatepoint(takedown.var_ad61bf60, (0, vectortoyaw(var_da1c47f), 0));
		if(vectordot(var_582b05a9, self.var_97e2c0da.dir_to_player) < takedown.var_8f4fda5a)
		{
			return false;
		}
	}
	deltaz = self.origin[2] - player.origin[2];
	if(isdefined(takedown.minheight) && deltaz < takedown.minheight)
	{
		return false;
	}
	if(isdefined(takedown.maxheight) && deltaz > takedown.maxheight)
	{
		return false;
	}
	if(is_true(takedown.trace))
	{
		zoffset = vectorscale((0, 0, 1), 24);
		if(isdefined(takedown.traceheight))
		{
			zoffset = (0, 0, takedown.traceheight);
		}
		start = player.origin + zoffset;
		end = self.var_97e2c0da.check_origin + zoffset;
		radius = 0;
		trace = physicstrace(start, end, (radius * -1, radius * -1, radius * -1), (radius, radius, radius), self.var_a08ba405, 32 | 1, 32768 | 8388608);
		if(trace[#"fraction"] < 1)
		{
			/#
				if(is_true(player.takedown.debug.var_c03e7127))
				{
					line(start, end, (0.8, 0.25, 0.25), 1, 1, 1);
				}
			#/
			return false;
		}
	}
	return true;
}

/*
	Name: function_a4e4cef5
	Namespace: namespace_9c83b58d
	Checksum: 0xE11D9BF5
	Offset: 0x3A70
	Size: 0x1B2
	Parameters: 2
	Flags: None
*/
function function_a4e4cef5(action_name, player)
{
	/#
		assert(isplayer(player));
	#/
	if(!isdefined(self.var_234d269) || self.var_234d269 != gettime())
	{
		self.var_b87cdd12 = 1;
		var_4df98d7a = anglestoforward(player getplayerangles());
		playereye = player getplayercamerapos();
		delta = self geteye() - playereye;
		var_9354ec35 = math::clamp(distance(self geteye(), playereye) - 30, 0, 120);
		var_da2162f9 = 0.5 + (0.44 * ((var_9354ec35 / 150) - 30));
		if(vectordot(vectornormalize(delta), var_4df98d7a) < var_da2162f9)
		{
			self.var_b87cdd12 = 0;
		}
		self.var_234d269 = gettime();
	}
	return self.var_b87cdd12;
}

/*
	Name: function_5169db86
	Namespace: namespace_9c83b58d
	Checksum: 0xED1D4AF4
	Offset: 0x3C30
	Size: 0x92
	Parameters: 0
	Flags: None
*/
function function_5169db86()
{
	/#
		assert(isplayer(self));
	#/
	if(isdefined(self.takedown.scene_root))
	{
		return self.takedown.scene_root;
	}
	scene_root = spawnstruct();
	scene_root.origin = self.origin;
	scene_root.angles = self.angles;
	return scene_root;
}

/*
	Name: function_dce515a6
	Namespace: namespace_9c83b58d
	Checksum: 0xD1B222D9
	Offset: 0x3CD0
	Size: 0x38E
	Parameters: 7
	Flags: None
*/
function function_dce515a6(guy, modelname, attach_model, attach_tag, var_5f373dfe, var_a18e300c, aitype)
{
	/#
		assert(isplayer(self));
	#/
	/#
		assert(isdefined(attach_tag) == isdefined(attach_model));
	#/
	if(isdefined(attach_tag))
	{
		/#
			assert(attach_tag.size == attach_model.size);
		#/
	}
	if(!isdefined(aitype))
	{
		aitype = guy.aitype;
	}
	if(!is_true(var_a18e300c))
	{
		if(isalive(guy) && guy !== self.takedown.body)
		{
			if(isdefined(self.takedown.body) && !self.takedown.body namespace_594b67e::function_30b535ff(0))
			{
				if(isdefined(self.takedown.body.magic_bullet_shield))
				{
					self.takedown.body util::stop_magic_bullet_shield();
				}
				self.takedown.body delete();
				self.takedown.body = undefined;
			}
			self.takedown.body = guy;
		}
		else if(isdefined(self.takedown.body) && isdefined(modelname) && self.takedown.body.modelname !== modelname)
		{
			self.takedown.body setmodel(modelname);
			self.takedown.body.modelname = modelname;
		}
	}
	if(!isdefined(self.takedown.body) || is_true(var_a18e300c))
	{
		bodymodel = spawn("script_model", self.origin);
		bodymodel.angles = self.angles;
		bodymodel.team = "axis";
		bodymodel.animname = "generic";
		bodymodel setmodel(modelname);
		bodymodel.modelname = modelname;
		bodymodel.ai_type = aitype;
		bodymodel namespace_594b67e::function_77af90aa(attach_model, attach_tag);
		bodymodel useanimtree("generic");
		bodymodel namespace_594b67e::function_30b535ff(1);
		self.takedown.body = bodymodel;
	}
	return self.takedown.body;
}

/*
	Name: function_4c0949f2
	Namespace: namespace_9c83b58d
	Checksum: 0xEACE9F4
	Offset: 0x4068
	Size: 0x1D6
	Parameters: 2
	Flags: None
*/
function function_4c0949f2(player, scene)
{
	/#
		assert(isplayer(player));
	#/
	entid = self getentitynumber();
	if(!isdefined(player.takedown.scene_root))
	{
		player.takedown.scene_root = spawnstruct();
	}
	scene_root = player.takedown.scene_root;
	if(isdefined(self.var_1f1bd6ed))
	{
		scene_root.origin = self.var_1f1bd6ed;
	}
	else
	{
		if(isdefined(player.takedown.var_4378b074[entid]))
		{
			scene_root.origin = player.takedown.var_4378b074[entid];
		}
		else
		{
			scene_root.origin = self.origin;
		}
	}
	if(isdefined(self.var_598a8a9))
	{
		scene_root.angles = self.var_598a8a9;
	}
	else
	{
		if(isdefined(player.takedown.var_b3f41b40[entid]))
		{
			scene_root.angles = player.takedown.var_b3f41b40[entid];
		}
		else
		{
			scene_root.angles = (0, vectortoyaw(scene_root.origin - player.origin), 0);
		}
	}
	scene_root.scriptbundlename = scene;
	scene_root.script_play_multiple = 1;
	scene_root.var_146935c1 = 1;
	return scene_root;
}

/*
	Name: function_970b3d76
	Namespace: namespace_9c83b58d
	Checksum: 0xF388ABE
	Offset: 0x4248
	Size: 0x4B4
	Parameters: 3
	Flags: None
*/
function function_970b3d76(action, scene, player)
{
	if(isalive(self))
	{
		if(self scene::function_c935c42())
		{
			[[ self._scene_object._o_scene ]]->stop();
		}
		self stopanimscripted();
	}
	if(!isalive(self))
	{
		player actions::function_942d9213();
		return;
	}
	if(is_true(player.takedown.takedown[action.name].var_72a597df))
	{
		player stats::function_dad108fa("cp_clandestine_stealth_kills", 1);
	}
	bb::logplayermapnotification("takedown", player);
	player endon(action.ender);
	self notify(#"hash_15ec42f1846ef9d0");
	player flag::set("takedown_active");
	player notify(#"takedown_cleanup");
	self prompts::remove(#"hash_3c5c65155dfb1731");
	self prompts::function_86eedc();
	waittillframeend();
	player thread actions::function_c004e236("carry_body");
	groundpos = util::ground_position(player.origin, 16, 64, player);
	player thread takedown_cleanup(action, [1:"takedown_cleanup", 0:action.ender], groundpos, player.takedown.stance[action.name]);
	scene_root = self function_4c0949f2(player, scene);
	player.var_edbc8698 = self;
	self.og_maxsightdistsqrd = self.maxsightdistsqrd;
	self.var_4285accc = self.newenemyreactiondistsq;
	self.var_577bde5e = self.battlechatter;
	self.var_f2c6a60d = self.allowdeath;
	self.allowantigrav = 0;
	self.dontmelee = 1;
	self.maxsightdistsqrd = 1;
	self.fixednode = 0;
	self.ignoreme = 1;
	self.ignoreall = 1;
	self.newenemyreactiondistsq = 0;
	self.allowdeath = 0;
	self.a.disablepain = 1;
	self.allowpain = 0;
	self battlechatter::function_2ab9360b(0);
	self.var_e690137d = scene;
	self.remove_from_animloop = 1;
	self notify(#"takedown_executed");
	if(isdefined(self) || isalive(self))
	{
		self util::delay(5, "takedown_cleanup", &function_9e3a2c7f, self);
		scene_root namespace_594b67e::scene_play(scene, player, self);
		player thread namespace_594b67e::function_d76eed10(action);
		function_64852b21(self);
	}
	player notify(#"takedown_cleanup");
	player notify(#"hash_1c024a9ada1dc600");
	waitframe(1);
	player actions::function_942d9213();
	player namespace_594b67e::function_e2fcacb2(3);
	player flag::clear("in_action");
}

/*
	Name: function_7a061b23
	Namespace: namespace_9c83b58d
	Checksum: 0xF24CE4AF
	Offset: 0x4708
	Size: 0x34E
	Parameters: 2
	Flags: None
*/
function function_7a061b23(enabled, action_name)
{
	if(!isdefined(self.takedown.var_9871533))
	{
		self.takedown.var_9871533 = [];
		self.takedown.var_d4da26de = 0;
		self.takedown.allow_melee = 1;
	}
	if(isdefined(action_name) && !isdefined(self.takedown.var_9871533[action_name]))
	{
		/#
			assert(self.takedown.var_9871533.size <= 31);
		#/
		self.takedown.var_9871533[action_name] = self.takedown.var_9871533.size;
	}
	bitmask = 0;
	if(isdefined(action_name))
	{
		bitmask = 1 << self.takedown.var_9871533[action_name];
	}
	else
	{
		foreach(shaderanimopacity_opacity in self.takedown.var_9871533)
		{
			bitmask = bitmask | (1 << shaderanimopacity_opacity);
		}
	}
	if(enabled)
	{
		self.takedown.var_d4da26de = self.takedown.var_d4da26de & (~bitmask);
	}
	else
	{
		self.takedown.var_d4da26de = self.takedown.var_d4da26de | bitmask;
	}
	var_b381ae79 = !self.takedown.var_d4da26de;
	self.takedown.allow_melee = var_b381ae79;
	var_32d84328 = var_b381ae79;
	curweap = self getcurrentweapon();
	if(curweap.name == #"knife_loadout" && is_true(self.var_31df4786))
	{
		var_32d84328 = 1;
	}
	if(is_true(self.takedown.var_f75c6733) == var_32d84328)
	{
		return;
	}
	if(!is_true(var_32d84328))
	{
		self val::set(#"hash_791e389c6b7a4657", "allow_melee", 0);
	}
	else
	{
		self val::reset(#"hash_791e389c6b7a4657", "allow_melee");
	}
	self.takedown.var_f75c6733 = var_32d84328;
}

/*
	Name: function_f8af9078
	Namespace: namespace_9c83b58d
	Checksum: 0x68901D1E
	Offset: 0x4A60
	Size: 0xA6
	Parameters: 1
	Flags: None
*/
function function_f8af9078(action_name)
{
	if(isdefined(action_name))
	{
		if(!isdefined(self.takedown.var_9871533) || !isdefined(self.takedown.var_9871533[action_name]))
		{
			return 1;
		}
		bitmask = 1 << self.takedown.var_9871533[action_name];
		return (self.takedown.var_d4da26de & bitmask) == 0;
	}
	return self.takedown.var_d4da26de == 0;
}

/*
	Name: function_64852b21
	Namespace: namespace_9c83b58d
	Checksum: 0x78D931DE
	Offset: 0x4B10
	Size: 0x176
	Parameters: 1
	Flags: None
*/
function function_64852b21(guy)
{
	if(!isdefined(guy))
	{
		return;
	}
	player = getplayers()[0];
	guy.skipdeathanim = 1;
	guy.noragdoll = 1;
	guy pushplayer(0);
	guy thread namespace_594b67e::function_91639a4c(0);
	if(isdefined(level.var_ab828d57))
	{
		guy util::delay(0.1, undefined, level.var_ab828d57);
	}
	guy.allowdeath = 1;
	guy.diequietly = 1;
	guy util::stop_magic_bullet_shield();
	if(isdefined(guy.stealth))
	{
		guy.stealth.override_damage_auto_range = 60;
	}
	if(isalive(guy))
	{
		guy kill((0, 0, 0), player, player);
	}
	if(!is_true(guy.var_caa295ea))
	{
		player.takedown.kill_origin = guy.origin;
	}
}

/*
	Name: function_caa295ea
	Namespace: namespace_9c83b58d
	Checksum: 0xD6DB53C2
	Offset: 0x4C90
	Size: 0x24A
	Parameters: 1
	Flags: None
*/
function function_caa295ea(guy)
{
	player = getplayers()[0];
	if(!isdefined(guy) && isdefined(player.takedown.kill_origin))
	{
		foreach(corpse in getcorpsearray(player.origin, 500))
		{
			if(is_true(corpse.var_caa295ea))
			{
				continue;
			}
			if(corpse isragdoll())
			{
				continue;
			}
			var_2501cbe2 = corpse.origin;
			if(is_true(player.takedown.ai_corpsesynch))
			{
				var_2501cbe2 = corpse getcorpsephysicsorigin();
			}
			if(isdefined(var_2501cbe2) && distancesquared(var_2501cbe2, player.takedown.kill_origin) < sqr(60))
			{
				corpse startragdoll();
				corpse.var_caa295ea = 1;
			}
		}
	}
	else if(isdefined(guy) && !is_true(guy.var_caa295ea))
	{
		guy startragdoll();
		guy.var_caa295ea = 1;
	}
	player.takedown.kill_origin = undefined;
}

/*
	Name: function_8c04a084
	Namespace: namespace_9c83b58d
	Checksum: 0x1FCA6DC3
	Offset: 0x4EE8
	Size: 0x38E
	Parameters: 1
	Flags: None
*/
function function_8c04a084(player)
{
	now = gettime();
	if((isdefined(self.var_9959f16e) ? self.var_9959f16e : -1) != now)
	{
		if(!isdefined(self.var_97e2c0da))
		{
			self.var_97e2c0da = {};
		}
		tag = "tag_origin";
		tagangles = self gettagangles(tag);
		tagpos = self gettagorigin(tag);
		var_da4521b5 = anglestoright(tagangles);
		var_a38620f = anglestoforward(tagangles);
		var_b6db82af = player.origin - tagpos;
		var_b6db82af = (var_b6db82af[0], var_b6db82af[1], 0);
		var_b6db82af = vectornormalize(var_b6db82af);
		var_cc854834 = abs(vectordot(var_a38620f, (0, 0, 1)));
		if(var_cc854834 > 0.7)
		{
			var_a38620f = vectornormalize((var_da4521b5[0], var_da4521b5[1], 0));
		}
		else
		{
			var_a38620f = vectornormalize((var_a38620f[0], var_a38620f[1], 0));
		}
		var_e3a10f71 = anglestoforward(self.angles);
		if(vectordot(var_b6db82af, var_e3a10f71) > vectordot(var_a38620f, var_e3a10f71))
		{
			var_a38620f = var_e3a10f71;
		}
		var_da4521b5 = vectorcross(var_a38620f, (0, 0, 1));
		self.var_97e2c0da.dir_to_player = var_b6db82af;
		self.var_97e2c0da.dot_forward = vectordot(var_a38620f, var_b6db82af);
		self.var_97e2c0da.dot_right = vectordot(var_da4521b5, var_b6db82af);
		self.var_97e2c0da.height = self.origin[2] - player.origin[2];
		self.var_97e2c0da.var_bd87dbc5 = abs(self.var_97e2c0da.height);
		self.var_97e2c0da.check_origin = self gettagorigin(tag);
		self.var_97e2c0da.distsq = distancesquared(self.var_97e2c0da.check_origin, player getplayercamerapos());
		self.var_9959f16e = now;
	}
	return self.var_97e2c0da;
}

/*
	Name: function_945b4efe
	Namespace: namespace_9c83b58d
	Checksum: 0x7D06C2EF
	Offset: 0x5280
	Size: 0x184
	Parameters: 2
	Flags: None
*/
function function_945b4efe(takedown, advance)
{
	/#
		assert(isplayer(self));
	#/
	if(!isdefined(self.takedown.var_d701e48f))
	{
		self.takedown.var_d701e48f = [];
	}
	if(!isdefined(self.takedown.var_d701e48f[takedown.name]) || self.takedown.var_d701e48f[takedown.name].size == 0)
	{
		if(isdefined(takedown.scenes))
		{
			self.takedown.var_d701e48f[takedown.name] = array::randomize(arraycopy(takedown.scenes));
		}
	}
	deck = self.takedown.var_d701e48f[takedown.name];
	if(!isdefined(deck))
	{
		return undefined;
	}
	result = deck[deck.size - 1];
	if(is_true(advance))
	{
		deck[deck.size - 1] = undefined;
	}
	return result;
}

/*
	Name: takedown_cleanup
	Namespace: namespace_9c83b58d
	Checksum: 0xEBBBAF7E
	Offset: 0x5410
	Size: 0x1DC
	Parameters: 4
	Flags: None
*/
function takedown_cleanup(action, var_949a9f8b, originalorigin, var_d8ba335a)
{
	self notify(#"hash_7ef80ca5708348b8");
	self endon(#"hash_7ef80ca5708348b8");
	/#
		assert(isplayer(self));
	#/
	if(isdefined(originalorigin))
	{
		if(!isarray(originalorigin))
		{
			originalorigin = [0:originalorigin];
		}
		self waittill(originalorigin);
	}
	self namespace_594b67e::function_44a46209(var_d8ba335a);
	self val::reset_all(#"action");
	if(isalive(self.var_edbc8698) && !is_true(self.var_edbc8698.var_69defa17))
	{
		self.var_edbc8698 stopanimscripted();
		self.var_edbc8698 kill(self.origin, self, self);
		self.var_edbc8698 = undefined;
	}
	if(isdefined(var_949a9f8b))
	{
		self function_945b4efe(self.takedown.takedown[var_949a9f8b.name], 1);
	}
	self.in_melee_death = undefined;
	self flag::clear("takedown_active");
}

/*
	Name: function_9e3a2c7f
	Namespace: namespace_9c83b58d
	Checksum: 0x44CB96F9
	Offset: 0x55F8
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function function_9e3a2c7f(guy)
{
	if(isdefined(guy))
	{
		if(isalive(guy))
		{
			if(isdefined(guy.magic_bullet_shield))
			{
				guy util::stop_magic_bullet_shield();
			}
			/#
				println("");
			#/
		}
	}
}

/*
	Name: function_7ef965ed
	Namespace: namespace_9c83b58d
	Checksum: 0x2BD87984
	Offset: 0x5678
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function function_7ef965ed(action)
{
	self waittill(action.ender);
	self function_7a061b23(1, action.name);
	self function_db07e398(action.name, undefined);
}

/*
	Name: function_db07e398
	Namespace: namespace_9c83b58d
	Checksum: 0xD854476F
	Offset: 0x56E8
	Size: 0x110
	Parameters: 3
	Flags: None
*/
function function_db07e398(action_name, var_1d3e20c8, var_c9453f35)
{
	if(isdefined(self.takedown.victim[action_name]) && self.takedown.victim[action_name] !== var_1d3e20c8)
	{
		self.takedown.victim[action_name] prompts::remove(#"melee");
		if(!is_true(var_c9453f35))
		{
			self.takedown.victim[action_name] prompts::remove(#"hash_3c5c65155dfb1731");
		}
		self.takedown.var_bf0ca7db[action_name] = 0;
	}
	self.takedown.victim[action_name] = var_1d3e20c8;
}

/*
	Name: function_a3b724c6
	Namespace: namespace_9c83b58d
	Checksum: 0xD99E2744
	Offset: 0x5800
	Size: 0x76
	Parameters: 1
	Flags: None
*/
function function_a3b724c6(var_42b3f9a9)
{
	/#
		assert(isplayer(self));
	#/
	if(!isdefined(self.takedown))
	{
		self.takedown = {};
	}
	self.takedown.var_42b3f9a9 = (is_true(var_42b3f9a9) ? 1 : undefined);
}

/*
	Name: function_2ae12730
	Namespace: namespace_9c83b58d
	Checksum: 0x3AC2A8F3
	Offset: 0x5880
	Size: 0x94
	Parameters: 1
	Flags: None
*/
function function_2ae12730(player)
{
	/#
		assert(isplayer(player));
	#/
	/#
		assert(isactor(self));
	#/
	if(is_true(player.takedown.var_42b3f9a9))
	{
		return 0;
	}
	return self.awarenesslevelcurrent == "combat";
}

