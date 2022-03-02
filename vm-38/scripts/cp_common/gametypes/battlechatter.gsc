#using script_42e8ee8721f5e6ef;
#using script_6809bf766eba194a;
#using script_68d2ee1489345a1d;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace battlechatter;

/*
	Name: function_9a26b072
	Namespace: battlechatter
	Checksum: 0xF2BBE4E8
	Offset: 0x330
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_9a26b072()
{
	level notify(1421587594);
}

/*
	Name: function_89f2df9
	Namespace: battlechatter
	Checksum: 0xC75CA4E
	Offset: 0x350
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_2c8719a97b3c90fa", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: battlechatter
	Checksum: 0x2C745A48
	Offset: 0x398
	Size: 0xAC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_start_gametype(&init);
	aispawnerarray = getactorspawnerarray();
	callback::on_ai_spawned(&on_joined_ai);
	/#
		function_5ac4dc99("", 0);
	#/
	namespace_bec1e8ca::function_c5dda35e("combat", [0:#"hash_2a1fada6b78bcec4"]);
}

/*
	Name: init
	Namespace: battlechatter
	Checksum: 0xA97B3F8
	Offset: 0x450
	Size: 0xEC
	Parameters: 0
	Flags: Linked
*/
function init()
{
	callback::on_spawned(&on_player_spawned);
	level.battlechatter_init = 1;
	level.allowbattlechatter = [];
	level.allowbattlechatter[#"bc"] = 1;
	level.allowbattlechatter[#"allies"] = 1;
	level.allowbattlechatter[#"axis"] = 1;
	level.allowbattlechatter[#"team3"] = 1;
	level.var_69427377 = [];
	level.var_69427377[#"cover_exit"] = "cover_break";
	level.var_69427377[#"moving_up"] = "moving_up_other";
}

/*
	Name: is_hero
	Namespace: battlechatter
	Checksum: 0xDB2A3FBC
	Offset: 0x548
	Size: 0x46
	Parameters: 1
	Flags: Linked
*/
function is_hero(ai)
{
	if(!isstring(ai.voiceprefix))
	{
		return false;
	}
	if(ai.voiceprefix.size >= 8)
	{
		return true;
	}
	return false;
}

/*
	Name: function_51759b03
	Namespace: battlechatter
	Checksum: 0x21CC8362
	Offset: 0x598
	Size: 0x16E
	Parameters: 2
	Flags: Linked
*/
function function_51759b03(var_84d1299, eventstruct)
{
	if(!isdefined(eventstruct))
	{
		eventstruct = undefined;
	}
	if(is_true(level.deadops))
	{
		return false;
	}
	if(!isactor(self))
	{
		if(isplayer(self))
		{
			if(!is_true(var_84d1299))
			{
				return false;
			}
		}
		else
		{
			return false;
		}
	}
	if(isdefined(self.archetype) && self.archetype == "zombie")
	{
		return false;
	}
	if(isdefined(self.archetype) && self.archetype == "direwolf")
	{
		return false;
	}
	if(isdefined(self.team) && !is_true(level.allowbattlechatter[self.team]))
	{
		return false;
	}
	if(isdefined(level.var_8b7cb19c) && isdefined(eventstruct))
	{
		result = self [[level.var_8b7cb19c]](eventstruct);
		if(!is_true(result))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: function_2346ea47
	Namespace: battlechatter
	Checksum: 0x39F9133B
	Offset: 0x710
	Size: 0x6E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2346ea47(event)
{
	if(event == #"flanked")
	{
		if(self haspath() || absangleclamp180(self aiutility::function_dc8e1a0a()) < 45)
		{
			return false;
		}
	}
	return true;
}

/*
	Name: function_4a19b47a
	Namespace: battlechatter
	Checksum: 0x9D560087
	Offset: 0x788
	Size: 0x112
	Parameters: 0
	Flags: Linked
*/
function function_4a19b47a()
{
	/#
		assert(isdefined(self.voiceprefix));
	#/
	if(is_hero(self))
	{
		self.bcvoicenumber = "";
	}
	else
	{
		switch(self.voiceprefix)
		{
			case "hash_6600f5c535189183":
			{
				self.bcvoicenumber = randomintrange(1, 3);
				break;
			}
			case "hash_6d6e10c538f37ef3":
			{
				self.bcvoicenumber = randomintrange(1, 5);
				break;
			}
			default:
			{
				self.bcvoicenumber = randomintrange(1, 4);
				break;
			}
		}
	}
}

/*
	Name: on_joined_ai
	Namespace: battlechatter
	Checksum: 0x439163B4
	Offset: 0x8A8
	Size: 0x10C
	Parameters: 0
	Flags: Linked
*/
function on_joined_ai()
{
	self endon(#"disconnect");
	if(!self function_51759b03())
	{
		return;
	}
	if(isdefined(self.archetype) && self.archetype == "zombie_dog")
	{
		self thread function_d85f6f61();
		self thread function_124ccedf();
		return;
	}
	if(!isdefined(self.voiceprefix))
	{
		self.voiceprefix = "vox_ax";
	}
	self function_4a19b47a();
	self.isspeaking = 0;
	self.soundmod = "player";
	self thread function_158cbf3();
	if(self.team == #"allies")
	{
		self thread function_e1c920f9();
	}
}

/*
	Name: function_158cbf3
	Namespace: battlechatter
	Checksum: 0x27EDD084
	Offset: 0x9C0
	Size: 0x88
	Parameters: 0
	Flags: Linked, Private
*/
function private function_158cbf3()
{
	self endon(#"death");
	while(true)
	{
		result = undefined;
		result = self waittill(#"asm_notify");
		if(self function_2346ea47(result.param))
		{
			self bc_ainotifyconvert(result.param);
		}
	}
}

/*
	Name: function_e1c920f9
	Namespace: battlechatter
	Checksum: 0x4E671ADD
	Offset: 0xA50
	Size: 0xA0
	Parameters: 0
	Flags: Linked
*/
function function_e1c920f9()
{
	self endon(#"death");
	while(true)
	{
		result = undefined;
		result = self waittill(#"damage");
		if(isplayer(result.attacker) && damage_is_valid_for_friendlyfire_warning(result.mod))
		{
			self bc_ainotifyconvert("friendlyfire");
		}
	}
}

/*
	Name: damage_is_valid_for_friendlyfire_warning
	Namespace: battlechatter
	Checksum: 0x1FE9CF3B
	Offset: 0xAF8
	Size: 0x86
	Parameters: 1
	Flags: Linked
*/
function damage_is_valid_for_friendlyfire_warning(mod)
{
	if(!isdefined(mod))
	{
		return false;
	}
	switch(mod)
	{
		case "mod_grenade":
		case "mod_crush":
		case "mod_grenade_splash":
		case "mod_impact":
		case "mod_melee":
		{
			return false;
		}
	}
	return true;
}

/*
	Name: function_a94f4749
	Namespace: battlechatter
	Checksum: 0xD95436AE
	Offset: 0xB88
	Size: 0x40C
	Parameters: 1
	Flags: Event
*/
event function_a94f4749(eventstruct)
{
	if(!self function_51759b03())
	{
		return;
	}
	if(isdefined(self.archetype) && self.archetype == "zombie_dog")
	{
		return;
	}
	if(is_true(self.diequietly))
	{
		return;
	}
	if(!isdefined(self.voiceprefix) || !isdefined(self.bcvoicenumber))
	{
		return;
	}
	attacker = eventstruct.attacker;
	meansofdeath = eventstruct.mod;
	if(isdefined(self.archetype) && self.archetype == #"robot")
	{
		if(isdefined(attacker) && !isplayer(attacker))
		{
			if(meansofdeath == "MOD_MELEE")
			{
				attacker thread bc_ainotifyconvert("meleeKill");
			}
			else
			{
				attacker thread bc_ainotifyconvert("enemyKill");
			}
		}
	}
	else if(isdefined(self))
	{
		meleeassassinate = isdefined(meansofdeath) && meansofdeath == "MOD_MELEE_ASSASSINATE";
		if(isdefined(self.archetype) && self.archetype == "warlord")
		{
			self playsound(#"hash_2083f6ebc94b5bc7");
		}
		if(!is_true(self.quiet_death) && !meleeassassinate && isdefined(attacker))
		{
			if(namespace_bec1e8ca::function_4e83ff35("combat", "announce", meansofdeath) > 0)
			{
				self thread bc_ainotifyconvert(meansofdeath);
			}
			else
			{
				self thread bc_ainotifyconvert("death");
			}
			self.var_c719b698 = 1;
		}
		if(is_true(self.sndissniper) && isdefined(attacker) && !isplayer(attacker))
		{
			attacker thread bc_ainotifyconvert("sniperdown");
			return;
		}
		if(isdefined(attacker) && !isplayer(attacker))
		{
			if(meansofdeath == "MOD_MELEE")
			{
				attacker thread bc_ainotifyconvert("meleeKill");
			}
			else
			{
				attacker thread bc_ainotifyconvert("enemyKill");
			}
		}
		sniper = isdefined(attacker) && isdefined(attacker.scoretype) && attacker.scoretype == "_sniper";
		if(!meleeassassinate)
		{
			close_ai = get_closest_ai_on_sameteam(self);
			if(isdefined(close_ai) && !is_true(close_ai.quiet_death))
			{
				if(sniper)
				{
					attacker.sndissniper = 1;
					close_ai thread bc_ainotifyconvert("sniperthreat");
				}
				else
				{
					close_ai thread bc_ainotifyconvert("friendlydown");
				}
			}
		}
	}
}

/*
	Name: function_8f82e45e
	Namespace: battlechatter
	Checksum: 0xAEDB1154
	Offset: 0xFA0
	Size: 0xBC
	Parameters: 1
	Flags: Event
*/
event function_8f82e45e(eventstruct)
{
	if(!self function_51759b03(0, eventstruct))
	{
		return;
	}
	if(is_true(self.diequietly) || is_true(self.var_c719b698) && eventstruct.action === "death")
	{
		return;
	}
	if(isdefined(self.archetype) && self.archetype == "zombie_dog")
	{
		return;
	}
	self thread bc_ainotifyconvert(eventstruct.action);
}

/*
	Name: function_535f1141
	Namespace: battlechatter
	Checksum: 0x84719D09
	Offset: 0x1068
	Size: 0xC
	Parameters: 1
	Flags: Event
*/
event function_535f1141(eventstruct)
{
}

/*
	Name: bc_ainotifyconvert
	Namespace: battlechatter
	Checksum: 0x54EBABA9
	Offset: 0x1080
	Size: 0xB4
	Parameters: 1
	Flags: Linked
*/
function bc_ainotifyconvert(notify_string)
{
	self function_4e7b6f6d("combat", "announce", notify_string);
	var_73691c34 = level.var_69427377[notify_string];
	if(isdefined(var_73691c34))
	{
		var_97a035a7 = self function_fb35fc43(1, 15);
		if(var_97a035a7.size > 0)
		{
			var_97a035a7[randomint(var_97a035a7.size)] bc_ainotifyconvert(var_73691c34);
		}
	}
}

/*
	Name: function_4e7b6f6d
	Namespace: battlechatter
	Checksum: 0xD81E4FCA
	Offset: 0x1140
	Size: 0x23A
	Parameters: 3
	Flags: Linked
*/
function function_4e7b6f6d(category, type, modifier)
{
	if(!isdefined(modifier))
	{
		return;
	}
	var_c25ca4e6 = (isdefined(modifier) ? modifier : "") == "death";
	probability = namespace_bec1e8ca::function_4e83ff35(category, type, modifier);
	if(probability >= 100 || randomfloatrange(0, 100) <= probability)
	{
		delay = namespace_bec1e8ca::function_2d2570e3(category, type, modifier);
		key = modifier;
		if(!function_7a600918(modifier))
		{
			key = (((("" + category) + "_") + type) + "_") + modifier;
		}
		var_db05b8ae = (isdefined(level.var_5eabfd9[key]) ? level.var_5eabfd9[key] : 0);
		if(delay <= 0 || gettime() > var_db05b8ae)
		{
			var_cba6af0b = namespace_bec1e8ca::function_ac3d3b19(category, type, modifier);
			if(isdefined(var_cba6af0b) && isdefined(var_cba6af0b[0]) && var_cba6af0b[0] != "")
			{
				alias = var_cba6af0b[randomint(var_cba6af0b.size)];
				self bc_makeline(self, alias, undefined, undefined, 1, undefined, var_c25ca4e6);
				if(delay > 0)
				{
					level.var_5eabfd9[key] = gettime() + (delay * 1000);
				}
				return true;
			}
		}
	}
}

/*
	Name: function_edd0c161
	Namespace: battlechatter
	Checksum: 0xB146E9B7
	Offset: 0x1388
	Size: 0x1DC
	Parameters: 1
	Flags: Event
*/
event function_edd0c161(eventstruct)
{
	if(!self function_51759b03(1))
	{
		return;
	}
	if(isai(self) && isdefined(self.archetype) && self.archetype == "zombie_dog")
	{
		return;
	}
	grenade = eventstruct.projectile;
	weapon = eventstruct.weapon;
	if(weapon.name == #"hash_34b7eb9fde56bd35" || weapon.name == #"frag_grenade" || weapon.name == #"hash_15ed0347f1459a04")
	{
		self thread bc_ainotifyconvert("grenadetoss");
		level thread bc_incominggrenadewatcher(self, grenade, "grenadeincoming");
	}
	else if(weapon.name == #"eq_flash_grenade" || weapon.name == #"flash_grenade" || weapon.name == #"hash_ae7d40bb12f5ab6")
	{
		self thread bc_ainotifyconvert("flashtoss");
		level thread bc_incominggrenadewatcher(self, grenade, "flashincoming");
	}
}

/*
	Name: bc_incominggrenadewatcher
	Namespace: battlechatter
	Checksum: 0x6BA59CA4
	Offset: 0x1570
	Size: 0xC4
	Parameters: 3
	Flags: Linked
*/
function bc_incominggrenadewatcher(thrower, grenade, event)
{
	wait(1);
	if(!isdefined(thrower) || !isdefined(grenade))
	{
		return;
	}
	team = #"axis";
	if(isdefined(thrower.team) && team == thrower.team)
	{
		team = #"allies";
	}
	ai = get_closest_ai_to_object(team, grenade);
	if(isdefined(ai))
	{
		ai thread bc_ainotifyconvert(event);
	}
}

/*
	Name: function_2a82bb92
	Namespace: battlechatter
	Checksum: 0x5921F8BE
	Offset: 0x1640
	Size: 0xAC
	Parameters: 1
	Flags: Event
*/
event function_2a82bb92(eventstruct)
{
	if(!self function_51759b03())
	{
		return;
	}
	if(isdefined(self.archetype) && self.archetype == "zombie_dog")
	{
		return;
	}
	grenade = eventstruct.projectile;
	if(isdefined(grenade))
	{
		grenade.stucktoplayer = self;
	}
	if(isalive(self))
	{
		self thread bc_ainotifyconvert("stickyincoming");
	}
}

/*
	Name: function_e0d850d2
	Namespace: battlechatter
	Checksum: 0x99AF7CD4
	Offset: 0x16F8
	Size: 0xDC
	Parameters: 0
	Flags: None
*/
function function_e0d850d2()
{
	self endon(#"disconnect");
	waitresult = undefined;
	waitresult = self waittill(#"death");
	attacker = waitresult.attacker;
	meansofdeath = waitresult.mod;
	if(isdefined(attacker) && !isplayer(attacker))
	{
		if(meansofdeath == "MOD_MELEE")
		{
			attacker thread bc_ainotifyconvert("meleeKill");
		}
		else
		{
			attacker thread bc_ainotifyconvert("enemyKill");
		}
	}
}

/*
	Name: bc_ainearexplodable
	Namespace: battlechatter
	Checksum: 0x2F3905B1
	Offset: 0x17E0
	Size: 0xC4
	Parameters: 2
	Flags: None
*/
function bc_ainearexplodable(object, type)
{
	wait(randomfloatrange(0.1, 0.4));
	ai = get_closest_ai_to_object("both", object, 500);
	if(isdefined(ai))
	{
		if(type == "car")
		{
			level thread bc_makeline(ai, "destructiblecar");
		}
		else
		{
			level thread bc_makeline(ai, "destructiblebarrel");
		}
	}
}

/*
	Name: bc_robotbehindvox
	Namespace: battlechatter
	Checksum: 0x1AD78BCA
	Offset: 0x18B0
	Size: 0x4E6
	Parameters: 0
	Flags: Linked
*/
function bc_robotbehindvox()
{
	level endon(#"unloaded");
	self endon(#"death", #"disconnect", #"hash_2e0d16928139b87e");
	if(!isdefined(level._bc_robotbehindvoxtime))
	{
		level._bc_robotbehindvoxtime = 0;
		enemies = getaiteamarray(#"axis", #"team3");
		level._bc_robotbehindarray = array();
		foreach(enemy in enemies)
		{
			if(isdefined(enemy.archetype) && enemy.archetype == #"robot")
			{
				array::add(level._bc_robotbehindarray, enemy, 0);
			}
		}
	}
	while(true)
	{
		wait(1);
		t = gettime();
		if(t > level._bc_robotbehindvoxtime + 1000)
		{
			level._bc_robotbehindvoxtime = t;
			enemies = getaiteamarray(#"axis", #"team3");
			function_1eaaceab(level._bc_robotbehindarray);
			arrayremovevalue(level._bc_robotbehindarray, undefined);
			foreach(enemy in enemies)
			{
				if(isdefined(enemy.archetype) && enemy.archetype == #"robot")
				{
					array::add(level._bc_robotbehindarray, enemy, 0);
				}
			}
		}
		if(level._bc_robotbehindarray.size <= 0)
		{
			continue;
		}
		played_sound = 0;
		foreach(robot in level._bc_robotbehindarray)
		{
			if(!isdefined(robot))
			{
				continue;
			}
			if(distancesquared(robot.origin, self.origin) < 90000)
			{
				if(isdefined(robot.current_scene))
				{
					continue;
				}
				if(isdefined(robot.health) && robot.health <= 0)
				{
					continue;
				}
				if(isdefined(level.scenes) && level.scenes.size >= 1)
				{
					continue;
				}
				yaw = self getyawtospot(robot.origin);
				diff = self.origin[2] - robot.origin[2];
				if(yaw < -95 || yaw > 95 && abs(diff) < 200)
				{
					robot playsound(#"chr_robot_behind");
					played_sound = 1;
					break;
				}
			}
		}
		if(played_sound)
		{
			wait(5);
		}
	}
}

/*
	Name: getyawtospot
	Namespace: battlechatter
	Checksum: 0x70D33B68
	Offset: 0x1DA0
	Size: 0x62
	Parameters: 1
	Flags: Linked
*/
function getyawtospot(spot)
{
	pos = spot;
	yaw = self.angles[1] - getyaw(pos);
	yaw = angleclamp180(yaw);
	return yaw;
}

/*
	Name: getyaw
	Namespace: battlechatter
	Checksum: 0x5B2901AD
	Offset: 0x1E10
	Size: 0x3E
	Parameters: 1
	Flags: Linked
*/
function getyaw(org)
{
	angles = vectortoangles(org - self.origin);
	return angles[1];
}

/*
	Name: function_bf4d6a54
	Namespace: battlechatter
	Checksum: 0x5C0EEB1C
	Offset: 0x1E58
	Size: 0x34
	Parameters: 1
	Flags: Private, Event
*/
event private function_bf4d6a54(parms)
{
	self bc_makeline(self, parms.suffix, undefined, undefined, 1);
}

/*
	Name: bc_makeline
	Namespace: battlechatter
	Checksum: 0xAA71BDB0
	Offset: 0x1E98
	Size: 0x1EC
	Parameters: 7
	Flags: Linked
*/
function bc_makeline(ai, line, causeresponse, category, alwaysplay, var_a8bd89dd, var_c25ca4e6)
{
	if(!isdefined(var_c25ca4e6))
	{
		var_c25ca4e6 = 0;
	}
	if(!isdefined(ai))
	{
		return;
	}
	ai endon(#"death", #"disconnect");
	if(isdefined(causeresponse))
	{
		/#
			assert(!isdefined(var_a8bd89dd));
		#/
		var_a8bd89dd = [0:line + "_response"];
	}
	if(!isdefined(ai.voiceprefix) || !isdefined(ai.bcvoicenumber))
	{
		return;
	}
	if(isdefined(ai.archetype) && ai.archetype == #"robot")
	{
		soundalias = ((ai.voiceprefix + ai.bcvoicenumber) + "_") + "chatter";
	}
	else
	{
		if(!is_hero(ai) && strstartswith(line, "exert_"))
		{
			if(line == "exert_immolation")
			{
				line = "exert_death_scream";
			}
			soundalias = "vox_male_" + line;
		}
		else
		{
			soundalias = ((ai.voiceprefix + ai.bcvoicenumber) + "_") + line;
		}
	}
	ai thread do_sound(soundalias, alwaysplay, var_a8bd89dd, category, var_c25ca4e6);
}

/*
	Name: do_sound
	Namespace: battlechatter
	Checksum: 0x2AE659F2
	Offset: 0x2090
	Size: 0x44C
	Parameters: 5
	Flags: Linked
*/
function do_sound(soundalias, alwaysplay, var_a8bd89dd, category, var_c25ca4e6)
{
	if(!isdefined(var_c25ca4e6))
	{
		var_c25ca4e6 = 0;
	}
	if(!isdefined(soundalias))
	{
		return;
	}
	if(!isdefined(alwaysplay))
	{
		alwaysplay = 0;
	}
	if(self bc_allowed(category) && (!is_true(self.isspeaking) || alwaysplay))
	{
		if(!isdefined(self.enemy) && !alwaysplay)
		{
			return;
		}
		function_14984343();
		if(!isalive(self) && !var_c25ca4e6)
		{
			return;
		}
		if(!isdefined(self))
		{
			return;
		}
		if(is_true(self.istalking))
		{
			return;
		}
		if(is_true(self.isspeaking))
		{
			self notify(#"bc_interrupt");
		}
		if(soundexists(soundalias))
		{
			/#
				if(getdvarint(#"hash_2abde9f4bcb01a86"))
				{
					print3d(self.origin + vectorscale((0, 0, 1), 60), soundalias, (0, 1, 0), 1, 1, 100);
				}
			#/
			if(isalive(self) && isactor(self) && self.archetype !== #"zombie_dog" && self.archetype !== #"mp_dog")
			{
				self playsoundontag(soundalias, "j_head");
			}
			else
			{
				self playsound(soundalias);
			}
			self thread wait_playback_time(soundalias);
			result = undefined;
			result = self waittill(soundalias, #"death", #"disconnect", #"bc_interrupt");
			if(isdefined(self))
			{
				if(result._notify == soundalias)
				{
					if(isdefined(var_a8bd89dd) && var_a8bd89dd.size > 0)
					{
						response = var_a8bd89dd[0];
						arrayremovevalue(var_a8bd89dd, response);
						ai = get_closest_ai_on_sameteam(self);
						if(isdefined(ai) && isdefined(response))
						{
							level thread bc_makeline(ai, response, undefined, undefined, undefined, var_a8bd89dd);
						}
					}
				}
				else
				{
					if(result._notify == "bc_interrupt")
					{
						self stopsound(soundalias);
					}
					else if(!is_true(var_c25ca4e6))
					{
						self stopsound(soundalias);
					}
				}
			}
		}
		else
		{
			/#
				print3d(self.origin + vectorscale((0, 0, 1), 60), soundalias, (1, 0, 0), 1, 1, 100);
			#/
			if(getdvarint(#"hash_2abde9f4bcb01a86"))
			{
			}
		}
	}
}

/*
	Name: function_14984343
	Namespace: battlechatter
	Checksum: 0x8B185076
	Offset: 0x24E8
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function function_14984343()
{
	if(!isdefined(level.var_c3687237))
	{
		level thread function_aacf773a();
	}
	while(level.var_c3687237 != 0)
	{
		util::wait_network_frame();
	}
	level.var_c3687237++;
}

/*
	Name: function_aacf773a
	Namespace: battlechatter
	Checksum: 0x1C6542C1
	Offset: 0x2558
	Size: 0x30
	Parameters: 0
	Flags: Linked
*/
function function_aacf773a()
{
	while(true)
	{
		level.var_c3687237 = 0;
		util::wait_network_frame();
	}
}

/*
	Name: bc_allowed
	Namespace: battlechatter
	Checksum: 0xCED9CD6C
	Offset: 0x2590
	Size: 0x92
	Parameters: 1
	Flags: Linked
*/
function bc_allowed(str_category)
{
	if(!isdefined(str_category))
	{
		str_category = "bc";
	}
	if(isdefined(level.allowbattlechatter) && !is_true(level.allowbattlechatter[str_category]))
	{
		return false;
	}
	if(isdefined(self.allowbattlechatter) && !is_true(self.allowbattlechatter[str_category]))
	{
		return false;
	}
	return true;
}

/*
	Name: on_player_spawned
	Namespace: battlechatter
	Checksum: 0x2443F932
	Offset: 0x2630
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	self endon(#"disconnect");
	self.soundmod = "player";
	self.voxshouldgasp = 0;
	self.voxshouldgasploop = 1;
	self.isspeaking = 0;
	self thread pain_vox();
	self thread bc_robotbehindvox();
}

/*
	Name: bc_doplayervox
	Namespace: battlechatter
	Checksum: 0x2DC951A2
	Offset: 0x26B0
	Size: 0xAC
	Parameters: 1
	Flags: None
*/
function bc_doplayervox(suffix)
{
	soundalias = "vox_plyr_" + suffix;
	if(self bc_allowed() && !is_true(self.istalking) && !is_true(self.isspeaking))
	{
		self playsoundtoplayer(soundalias, self);
		self thread wait_playback_time(soundalias);
	}
}

/*
	Name: pain_vox
	Namespace: battlechatter
	Checksum: 0x9F9977A3
	Offset: 0x2768
	Size: 0x118
	Parameters: 0
	Flags: Linked
*/
function pain_vox()
{
	self endon(#"death", #"disconnect");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"snd_pain_player");
		if(randomintrange(0, 100) <= 100)
		{
			if(isalive(self))
			{
				if(waitresult.mod == "MOD_DROWN")
				{
					soundalias = "chr_swimming_drown";
					self.voxshouldgasp = 1;
					if(self.voxshouldgasploop)
					{
						self thread water_gasp();
					}
				}
				soundalias = "vox_plyr_exert_pain";
				self thread do_sound(soundalias, 1);
			}
		}
		wait(0.5);
	}
}

/*
	Name: water_gasp
	Namespace: battlechatter
	Checksum: 0x20BACCB1
	Offset: 0x2888
	Size: 0xDC
	Parameters: 0
	Flags: Linked
*/
function water_gasp()
{
	self endon(#"death", #"disconnect", #"snd_gasp");
	level endon(#"game_ended");
	self.voxshouldgasploop = 0;
	while(true)
	{
		if(!self isplayerunderwater() && self.voxshouldgasp)
		{
			self.voxshouldgasp = 0;
			self.voxshouldgasploop = 1;
			self thread do_sound("vox_pm1_gas_gasp", 1);
			self notify(#"snd_gasp");
		}
		wait(0.5);
	}
}

/*
	Name: wait_playback_time
	Namespace: battlechatter
	Checksum: 0xA914A576
	Offset: 0x2970
	Size: 0xAE
	Parameters: 2
	Flags: Linked
*/
function wait_playback_time(soundalias, timeout)
{
	self endon(#"death", #"disconnect");
	playbacktime = soundgetplaybacktime(timeout);
	self.isspeaking = 1;
	if(playbacktime >= 0)
	{
		waittime = playbacktime * 0.001;
		wait(waittime);
	}
	else
	{
		wait(1);
	}
	self notify(timeout);
	self.isspeaking = 0;
}

/*
	Name: get_closest_ai_on_sameteam
	Namespace: battlechatter
	Checksum: 0x4C14E7AF
	Offset: 0x2A28
	Size: 0x202
	Parameters: 2
	Flags: Linked
*/
function get_closest_ai_on_sameteam(some_ai, maxdist)
{
	if(isdefined(some_ai))
	{
		aiarray = getaiteamarray(some_ai.team);
		aiarray = arraysort(aiarray, some_ai.origin);
		if(!isdefined(maxdist))
		{
			maxdist = 1000;
		}
		foreach(dude in aiarray)
		{
			if(!isdefined(some_ai))
			{
				return undefined;
			}
			if(!isdefined(dude) || !isalive(dude) || !isdefined(dude.bcvoicenumber))
			{
				continue;
			}
			if(dude == some_ai)
			{
				continue;
			}
			if(isvehicle(dude))
			{
				continue;
			}
			if(isdefined(dude.archetype) && dude.archetype == #"robot")
			{
				continue;
			}
			if(!is_hero(dude) && !is_hero(some_ai))
			{
				if(dude.bcvoicenumber == some_ai.bcvoicenumber)
				{
					continue;
				}
			}
			if(distance(some_ai.origin, dude.origin) > maxdist)
			{
				continue;
			}
			return dude;
		}
	}
	return undefined;
}

/*
	Name: get_closest_ai_to_object
	Namespace: battlechatter
	Checksum: 0xCB223E6
	Offset: 0x2C38
	Size: 0x1FA
	Parameters: 3
	Flags: Linked
*/
function get_closest_ai_to_object(team, object, maxdist)
{
	if(!isdefined(object))
	{
		return;
	}
	if(team == "both")
	{
		aiarray = getaiteamarray(#"axis", #"allies");
	}
	else
	{
		aiarray = getaiteamarray(team);
	}
	aiarray = arraysort(aiarray, object.origin);
	if(!isdefined(maxdist))
	{
		maxdist = 1000;
	}
	foreach(dude in aiarray)
	{
		if(!isdefined(dude) || !isalive(dude))
		{
			continue;
		}
		if(isvehicle(dude))
		{
			continue;
		}
		if(isdefined(dude.archetype) && dude.archetype == #"robot")
		{
			continue;
		}
		if(!isdefined(dude.voiceprefix) || !isdefined(dude.bcvoicenumber))
		{
			continue;
		}
		if(distance(dude.origin, object.origin) > maxdist)
		{
			continue;
		}
		return dude;
	}
	return undefined;
}

/*
	Name: function_2ab9360b
	Namespace: battlechatter
	Checksum: 0x61BD141F
	Offset: 0x2E40
	Size: 0x54
	Parameters: 2
	Flags: Linked
*/
function function_2ab9360b(b_allow, str_category)
{
	if(!isdefined(str_category))
	{
		str_category = "bc";
	}
	/#
		assert(isdefined(b_allow), "");
	#/
	self.allowbattlechatter[str_category] = b_allow;
}

/*
	Name: function_d85f6f61
	Namespace: battlechatter
	Checksum: 0xDAD1D065
	Offset: 0x2EA0
	Size: 0x78
	Parameters: 0
	Flags: Linked
*/
function function_d85f6f61()
{
	self endon(#"death", #"disconnect");
	while(true)
	{
		self playsoundontag("aml_dog_bark", "tag_eye");
		wait(randomfloatrange(1, 3.5));
	}
}

/*
	Name: function_124ccedf
	Namespace: battlechatter
	Checksum: 0x6A6E9D19
	Offset: 0x2F20
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_124ccedf()
{
	self waittill(#"death");
	if(isdefined(self))
	{
		self playsound(#"aml_dog_death");
	}
}

