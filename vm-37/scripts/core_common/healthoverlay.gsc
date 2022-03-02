#using script_256b8879317373de;
#using script_4663ec59d864e437;
#using script_47fb62300ac0bd60;
#using script_62d13df4c3e9336d;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\visionset_mgr_shared.gsc;

#namespace healthoverlay;

/*
	Name: function_89f2df9
	Namespace: healthoverlay
	Checksum: 0x3583C16D
	Offset: 0xD0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"healthoverlay", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: healthoverlay
	Checksum: 0xBC48AE67
	Offset: 0x118
	Size: 0x1D4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_start_gametype(&init);
	level.new_health_model = getdvarint(#"new_health_model", 1) > 0;
	level.var_a7985066 = getdvarint(#"hash_1b8e30b9cc6b8dbc", 50);
	level.var_9b350462 = getdvarint(#"hash_3dfb7b6187d80898", 70);
	callback::on_joined_team(&function_5c4a1c21);
	callback::on_joined_spectate(&function_5c4a1c21);
	callback::on_disconnect(&end_health_regen);
	callback::on_player_killed(&function_5c4a1c21);
	if(level.new_health_model)
	{
		callback::on_spawned(&player_health_regen);
		level.start_player_health_regen = &player_health_regen;
	}
	else
	{
		callback::on_spawned(&player_health_regen_t7);
		level.start_player_health_regen = &player_health_regen_t7;
	}
	level thread function_b506b922();
}

/*
	Name: init
	Namespace: healthoverlay
	Checksum: 0x18AFBEC5
	Offset: 0x2F8
	Size: 0x14
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level.healthoverlaycutoff = 0.55;
}

/*
	Name: restart_player_health_regen
	Namespace: healthoverlay
	Checksum: 0xDB330F2C
	Offset: 0x318
	Size: 0x30
	Parameters: 0
	Flags: None
*/
function restart_player_health_regen()
{
	self end_health_regen();
	self thread [[level.start_player_health_regen]]();
}

/*
	Name: function_5c4a1c21
	Namespace: healthoverlay
	Checksum: 0xF7539357
	Offset: 0x350
	Size: 0x26
	Parameters: 1
	Flags: Linked
*/
function function_5c4a1c21(params)
{
	self.var_4d9b2bc3 = 0;
	self notify(#"end_healthregen");
}

/*
	Name: end_health_regen
	Namespace: healthoverlay
	Checksum: 0x50A6DF77
	Offset: 0x380
	Size: 0x1E
	Parameters: 0
	Flags: Linked
*/
function end_health_regen()
{
	self.var_4d9b2bc3 = 0;
	self notify(#"end_healthregen");
}

/*
	Name: player_health_regen_t7
	Namespace: healthoverlay
	Checksum: 0x34C61AF5
	Offset: 0x3A8
	Size: 0x4A6
	Parameters: 0
	Flags: Linked
*/
function player_health_regen_t7()
{
	self endon(#"end_healthregen");
	if(self.health <= 0)
	{
		/#
			assert(!isalive(self));
		#/
		return;
	}
	maxhealth = self.health;
	oldhealth = maxhealth;
	player = self;
	regenrate = 0.1;
	usetrueregen = 0;
	veryhurt = 0;
	player.breathingstoptime = -10000;
	thread player_breathing_sound(maxhealth * 0.35);
	thread player_heartbeat_sound(maxhealth * 0.35);
	lastsoundtime_recover = 0;
	hurttime = 0;
	newhealth = 0;
	for(;;)
	{
		waitframe(1);
		if(isdefined(player.regenrate))
		{
			regenrate = player.regenrate;
			usetrueregen = 1;
		}
		if(player.health == maxhealth)
		{
			veryhurt = 0;
			if(isdefined(self.atbrinkofdeath))
			{
				self notify(#"challenge_survived_from_death");
				self.atbrinkofdeath = undefined;
			}
			continue;
		}
		if(player.health <= 0)
		{
			return;
		}
		if(isdefined(player.laststand) && player.laststand)
		{
			continue;
		}
		wasveryhurt = veryhurt;
		ratio = player.health / maxhealth;
		if(ratio <= level.healthoverlaycutoff)
		{
			veryhurt = 1;
			self.atbrinkofdeath = 1;
			self.isneardeath = 1;
			if(!wasveryhurt)
			{
				hurttime = gettime();
			}
		}
		else
		{
			self.isneardeath = 0;
		}
		if(player.health >= oldhealth)
		{
			regentime = 5000;
			if(player hasperk(#"specialty_healthregen"))
			{
				regentime = int(regentime / getdvarfloat(#"perk_healthregenmultiplier", 0));
			}
			if(gettime() - hurttime < regentime)
			{
				continue;
			}
			if(regentime <= 0)
			{
				continue;
			}
			if(gettime() - lastsoundtime_recover > regentime)
			{
				lastsoundtime_recover = gettime();
				self notify(#"snd_breathing_better");
			}
			if(veryhurt)
			{
				newhealth = ratio;
				veryhurttime = 3000;
				if(player hasperk(#"specialty_healthregen"))
				{
					veryhurttime = int(veryhurttime / getdvarfloat(#"perk_healthregenmultiplier", 0));
				}
				if(gettime() > hurttime + veryhurttime)
				{
					newhealth = newhealth + regenrate;
				}
			}
			else
			{
				if(usetrueregen)
				{
					newhealth = ratio + regenrate;
				}
				else
				{
					newhealth = 1;
				}
			}
			if(newhealth >= 1)
			{
				self player::reset_attacker_list();
				newhealth = 1;
			}
			if(newhealth <= 0)
			{
				return;
			}
			player setnormalhealth(newhealth);
			change = player.health - oldhealth;
			if(change > 0)
			{
				player decay_player_damages(change);
			}
			oldhealth = player.health;
			continue;
		}
		oldhealth = player.health;
		hurttime = gettime();
		player.breathingstoptime = hurttime + 6000;
	}
}

/*
	Name: function_f7a21c4
	Namespace: healthoverlay
	Checksum: 0x7C9FA58
	Offset: 0x858
	Size: 0x4E
	Parameters: 0
	Flags: Linked
*/
function function_f7a21c4()
{
	self endon(#"hash_2d775ef016d5c651");
	while(true)
	{
		if(!isdefined(self))
		{
			return;
		}
		level visionset_mgr::set_state_active(self, 1);
		waitframe(1);
	}
}

/*
	Name: function_8335b12
	Namespace: healthoverlay
	Checksum: 0xFFBA918C
	Offset: 0x8B0
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function function_8335b12()
{
	if(getdvarint(#"new_blood_version", 3) != 3)
	{
		self visionset_mgr::activate("visionset", "crithealth", self, 0.5, &function_f7a21c4, 0.5);
	}
}

/*
	Name: function_306c4d60
	Namespace: healthoverlay
	Checksum: 0x7AA5C556
	Offset: 0x930
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function function_306c4d60()
{
	if(getdvarint(#"new_blood_version", 3) != 3)
	{
		self notify(#"hash_2d775ef016d5c651");
		self visionset_mgr::deactivate_per_player("visionset", "crithealth", self);
	}
}

/*
	Name: function_c48cb1fc
	Namespace: healthoverlay
	Checksum: 0x1C604561
	Offset: 0x9A8
	Size: 0x2A
	Parameters: 0
	Flags: Linked
*/
function function_c48cb1fc()
{
	self thread function_8335b12();
	self.var_61e6c24d = 1;
}

/*
	Name: function_df115fb1
	Namespace: healthoverlay
	Checksum: 0xA6C55B77
	Offset: 0x9E0
	Size: 0x26
	Parameters: 0
	Flags: Linked
*/
function function_df115fb1()
{
	self thread function_306c4d60();
	self.var_61e6c24d = 0;
}

/*
	Name: function_2eee85c1
	Namespace: healthoverlay
	Checksum: 0x44DD3947
	Offset: 0xA10
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_2eee85c1()
{
	if(self.var_61e6c24d)
	{
		self function_df115fb1();
	}
}

/*
	Name: function_df99db2
	Namespace: healthoverlay
	Checksum: 0xBC1A71D5
	Offset: 0xA40
	Size: 0x68
	Parameters: 0
	Flags: Linked, Private
*/
function private function_df99db2()
{
	player = self;
	if(player.health <= 0)
	{
		return false;
	}
	if(player isremotecontrolling())
	{
		return false;
	}
	if(isdefined(player.laststand) && player.laststand)
	{
		return false;
	}
	return true;
}

/*
	Name: function_f09367a0
	Namespace: healthoverlay
	Checksum: 0xA9F5933B
	Offset: 0xAB0
	Size: 0xA8
	Parameters: 2
	Flags: Linked, Private
*/
function private function_f09367a0(var_dc77251f, regen_delay)
{
	if(is_true(self.disable_health_regen_delay))
	{
		var_dc77251f.var_ba47a7a3 = 1;
	}
	if(!is_true(self.ignore_health_regen_delay) && (var_dc77251f.var_fc296337 - var_dc77251f.var_ba47a7a3) < regen_delay)
	{
		return false;
	}
	if(regen_delay <= 0)
	{
		return false;
	}
	if(self.health >= self.var_66cb03ad)
	{
		return false;
	}
	return true;
}

/*
	Name: function_53964fa3
	Namespace: healthoverlay
	Checksum: 0xC1B4B615
	Offset: 0xB60
	Size: 0x25A
	Parameters: 2
	Flags: Linked, Private
*/
function private function_53964fa3(var_bc840360, var_dc77251f)
{
	if(self.heal.enabled == 0)
	{
		return 0;
	}
	var_d12d33e7 = self function_8ca62ae3();
	if(var_d12d33e7 <= 0)
	{
		return 0;
	}
	heal_amount = self.heal.heal_amount;
	if(!isdefined(heal_amount) || heal_amount <= 0)
	{
		return 0;
	}
	if(!isdefined(var_dc77251f.var_fc296337))
	{
		var_dc77251f.var_fc296337 = gettime();
	}
	if(!isdefined(self.heal.var_fa57541f))
	{
		self.heal.var_fa57541f = self.health;
	}
	var_c59b0d1e = heal_amount / var_d12d33e7;
	nt = ((float(var_dc77251f.var_fc296337 - (isdefined(self.heal.var_f37a08a8) ? self.heal.var_f37a08a8 : var_dc77251f.var_fc296337))) / 1000) / var_c59b0d1e;
	exp = (isdefined(self.heal.var_4e6c244d) ? self.heal.var_4e6c244d : 1);
	if(nt != 1)
	{
		var_6f934ab = self.heal.var_fa57541f + (var_bc840360 * (1 / (1 + (pow(nt / (1 - nt), exp * -1)))));
	}
	else
	{
		var_6f934ab = self.heal.var_fa57541f + var_bc840360;
	}
	var_6f934ab = min(var_6f934ab, var_bc840360);
	regen_amount = (var_6f934ab - var_dc77251f.old_health) / var_bc840360;
	return regen_amount;
}

/*
	Name: function_8ca62ae3
	Namespace: healthoverlay
	Checksum: 0x76CDD96B
	Offset: 0xDC8
	Size: 0xE4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ca62ae3()
{
	if(self.heal.enabled == 0)
	{
		return 0;
	}
	var_d12d33e7 = self.heal.rate;
	if(var_d12d33e7 == 0)
	{
		var_d12d33e7 = (isdefined(self.n_regen_rate) ? self.n_regen_rate : self.playerrole.healthhealrate);
		if(self hasperk(#"specialty_quickrevive"))
		{
			var_d12d33e7 = var_d12d33e7 * 1.5;
		}
		if(isdefined(self.var_5762241e))
		{
			var_d12d33e7 = var_d12d33e7 + self.var_5762241e;
		}
		var_d12d33e7 = var_d12d33e7 * self function_4e64ede5();
	}
	return var_d12d33e7;
}

/*
	Name: function_f8139729
	Namespace: healthoverlay
	Checksum: 0xE07FA886
	Offset: 0xEB8
	Size: 0x10A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_f8139729()
{
	/#
		assert(isdefined(self.var_66cb03ad));
	#/
	/#
		assert(isdefined(self.maxhealth));
	#/
	/#
		assert(isplayer(self));
	#/
	var_bc840360 = (isdefined(self.heal.var_bc840360) ? self.heal.var_bc840360 : 0);
	if(var_bc840360 == 0)
	{
		var_bc840360 = self.var_66cb03ad;
	}
	var_bc840360 = math::clamp(var_bc840360, 0, max(self.maxhealth, self.var_66cb03ad));
	return var_bc840360;
}

/*
	Name: heal
	Namespace: healthoverlay
	Checksum: 0x49B0C0BD
	Offset: 0xFD0
	Size: 0x524
	Parameters: 1
	Flags: Linked, Private
*/
function private heal(var_dc77251f)
{
	player = self;
	healing_enabled = player.heal.enabled == 1;
	regen_delay = 1;
	if(healing_enabled && player.heal.var_c8777194 === 1)
	{
		regen_delay = (isdefined(player.var_edd3eb35) ? player.var_edd3eb35 : player.healthregentime);
		regen_delay = int(int(regen_delay * 1000));
		specialty_healthregen_enabled = 0;
		if(specialty_healthregen_enabled && player hasperk(#"specialty_healthregen") || player hasperk(#"specialty_quickrevive"))
		{
			regen_delay = int(regen_delay / getdvarfloat(#"perk_healthregenmultiplier", 0));
		}
	}
	if(!function_f09367a0(var_dc77251f, regen_delay))
	{
		return;
	}
	if(var_dc77251f.var_fc296337 - var_dc77251f.var_7cb44c56 > regen_delay)
	{
		var_dc77251f.var_7cb44c56 = var_dc77251f.var_fc296337;
		self notify(#"snd_breathing_better");
	}
	var_bc840360 = player function_f8139729();
	/#
		assert(var_bc840360 > 0);
	#/
	if(is_true(player.var_44d52546))
	{
		regen_amount = 1;
	}
	else
	{
		if(getdvarint(#"hash_7f9cfdea69a18091", 1) == 1)
		{
			regen_amount = player function_53964fa3(var_bc840360, var_dc77251f);
		}
		else
		{
			var_d12d33e7 = player function_8ca62ae3();
			regen_amount = (var_d12d33e7 * (float(var_dc77251f.time_elapsed) / 1000)) / var_bc840360;
		}
	}
	if(regen_amount == 0)
	{
		return;
	}
	var_dc77251f.var_ec8863bf = math::clamp(var_dc77251f.ratio + regen_amount, 0, 1);
	if(var_dc77251f.var_ec8863bf <= 0)
	{
		return;
	}
	if(player.var_61e6c24d && var_dc77251f.var_ec8863bf > var_dc77251f.var_dae4d7ea)
	{
		player function_df115fb1();
	}
	new_health = (var_dc77251f.var_ec8863bf * var_bc840360) + var_dc77251f.var_e65dca8d;
	if(new_health < player.health)
	{
		new_health = player.health;
	}
	player.health = int(math::clamp(floor(new_health), 0, max(self.maxhealth, self.var_66cb03ad)));
	var_dc77251f.var_e65dca8d = new_health - player.health;
	if(player.health >= var_bc840360 && var_dc77251f.old_health < var_bc840360)
	{
		player player::function_c6fe9951();
	}
	if(player.health >= player.var_66cb03ad && var_dc77251f.old_health < player.var_66cb03ad)
	{
		player player::reset_attacker_list();
		player player::function_d1768e8e();
	}
	else
	{
		change = player.health - var_dc77251f.old_health;
		if(change > 0)
		{
			player decay_player_damages(change);
			if(sessionmodeismultiplayergame())
			{
				player stats::function_dad108fa(#"hash_448216881a2ea3a1", change);
			}
		}
	}
}

/*
	Name: function_c1efb72d
	Namespace: healthoverlay
	Checksum: 0xDC7BEDE9
	Offset: 0x1500
	Size: 0x9E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c1efb72d(var_dc77251f)
{
	player = self;
	var_66cb03ad = (player.var_66cb03ad > 0 ? player.var_66cb03ad : player.maxhealth);
	if(player.health >= var_66cb03ad)
	{
		if(isdefined(self.atbrinkofdeath))
		{
			self notify(#"challenge_survived_from_death");
			self.atbrinkofdeath = undefined;
		}
		var_dc77251f.old_health = player.health;
		return true;
	}
	return false;
}

/*
	Name: function_69e7b01c
	Namespace: healthoverlay
	Checksum: 0x2A666E74
	Offset: 0x15A8
	Size: 0x4A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_69e7b01c(ratio)
{
	if(ratio <= level.healthoverlaycutoff)
	{
		self.atbrinkofdeath = 1;
		self.isneardeath = 1;
	}
	else
	{
		self.isneardeath = 0;
	}
}

/*
	Name: player_health_regen
	Namespace: healthoverlay
	Checksum: 0xA014E64D
	Offset: 0x1600
	Size: 0x14C
	Parameters: 0
	Flags: Linked
*/
function player_health_regen()
{
	if(self.health <= 0)
	{
		/#
			assert(!isalive(self));
		#/
		self.var_4d9b2bc3 = 0;
		return;
	}
	player = self;
	player.var_4d9b2bc3 = 1;
	player.breathingstoptime = -10000;
	player.var_dc77251f = {#hash_d1e06a5f:gettime(), #hash_7cb44c56:0, #old_health:player.health, #hash_dae4d7ea:0, #hash_215539de:0, #hash_e65dca8d:0, #hash_ec8863bf:0, #ratio:0, #time_elapsed:0, #hash_fc296337:0, #hash_ba47a7a3:0};
	player function_df115fb1();
}

/*
	Name: function_8f2722f6
	Namespace: healthoverlay
	Checksum: 0xBEC2B609
	Offset: 0x1758
	Size: 0x376
	Parameters: 2
	Flags: Linked, Private
*/
function private function_8f2722f6(now, var_677a3e37)
{
	player = self;
	if(!is_true(player.var_4d9b2bc3))
	{
		return;
	}
	if(player.maxhealth == 0)
	{
		return;
	}
	if(!isalive(player))
	{
		return;
	}
	if(level.var_b1e41c9b && !var_677a3e37)
	{
		if(player.health < player.var_66cb03ad && player.heal.enabled !== 1)
		{
			player gadget_health_regen::function_ef6c7869(now);
		}
	}
	var_dc77251f = player.var_dc77251f;
	if(player function_c1efb72d(var_dc77251f))
	{
		var_dc77251f.var_e65dca8d = 0;
		player function_2eee85c1();
		return;
	}
	if(!player function_df99db2())
	{
		var_dc77251f.var_e65dca8d = 0;
		player function_2eee85c1();
		return;
	}
	var_bc840360 = player function_f8139729();
	if(var_bc840360 <= player.health)
	{
		player.health = var_bc840360;
		var_dc77251f.var_e65dca8d = 0;
		player function_2eee85c1();
		return;
	}
	var_dc77251f.ratio = player.health / var_bc840360;
	var_dc77251f.var_ec8863bf = var_dc77251f.ratio;
	player function_69e7b01c(player.health / player.maxhealth);
	var_dc77251f.var_fc296337 = now;
	if(player.health < var_dc77251f.old_health)
	{
		player.breathingstoptime = now + 6000;
		var_dc77251f.var_ba47a7a3 = now;
	}
	else
	{
		var_dc77251f.time_elapsed = now - var_dc77251f.var_d1e06a5f;
		player heal(var_dc77251f);
		if(var_dc77251f.var_ec8863bf <= 0)
		{
			player.var_4d9b2bc3 = 0;
			return;
		}
	}
	var_dc77251f.var_a83bd8fd = level.var_a7985066 / player.maxhealth;
	var_dc77251f.var_dae4d7ea = level.var_9b350462 / player.maxhealth;
	if(!player.var_61e6c24d && var_dc77251f.var_ec8863bf <= var_dc77251f.var_a83bd8fd)
	{
		player function_c48cb1fc();
	}
	else if(player.var_61e6c24d && var_dc77251f.var_ec8863bf > var_dc77251f.var_dae4d7ea)
	{
		player function_df115fb1();
	}
	var_dc77251f.old_health = player.health;
}

/*
	Name: function_b506b922
	Namespace: healthoverlay
	Checksum: 0xD6C21DA5
	Offset: 0x1AD8
	Size: 0x178
	Parameters: 0
	Flags: Linked, Private
*/
function private function_b506b922()
{
	level endon(#"game_ended");
	while(true)
	{
		var_677a3e37 = getdvarint(#"hash_4371c604abfbb2eb", 0) > 0;
		var_1556c25 = function_8168c82a();
		now = gettime();
		foreach(player in getplayers())
		{
			if(((player getentitynumber() + var_1556c25) & 1) != 0)
			{
				continue;
			}
			if(!isdefined(player.var_dc77251f))
			{
				continue;
			}
			player function_8f2722f6(now, var_677a3e37);
			player.var_dc77251f.var_d1e06a5f = now;
		}
		waitframe(1);
		util::function_5355d311();
	}
}

/*
	Name: decay_player_damages
	Namespace: healthoverlay
	Checksum: 0x6051D3E7
	Offset: 0x1C58
	Size: 0x112
	Parameters: 1
	Flags: Linked
*/
function decay_player_damages(decay)
{
	if(!isdefined(self.attackerdamage))
	{
		return;
	}
	if(!isdefined(self.attackers))
	{
		return;
	}
	for(j = 0; j < self.attackers.size; j++)
	{
		player = self.attackers[j];
		if(!isdefined(player))
		{
			continue;
		}
		if(self.attackerdamage[player.clientid].damage == 0)
		{
			continue;
		}
		self.attackerdamage[player.clientid].damage = self.attackerdamage[player.clientid].damage - decay;
		if(self.attackerdamage[player.clientid].damage < 0)
		{
			self.attackerdamage[player.clientid].damage = 0;
		}
	}
}

/*
	Name: player_breathing_sound
	Namespace: healthoverlay
	Checksum: 0x681E4AC2
	Offset: 0x1D78
	Size: 0xEA
	Parameters: 1
	Flags: Linked
*/
function player_breathing_sound(healthcap)
{
	self endon(#"end_healthregen");
	wait(2);
	player = self;
	for(;;)
	{
		wait(0.2);
		if(player.health <= 0)
		{
			return;
		}
		if(player util::isusingremote())
		{
			continue;
		}
		if(player.health >= healthcap)
		{
			continue;
		}
		if(player.healthregentime <= 0 && gettime() > player.breathingstoptime)
		{
			continue;
		}
		player notify(#"snd_breathing_hurt");
		wait(0.784);
		wait(0.1 + randomfloat(0.8));
	}
}

/*
	Name: player_heartbeat_sound
	Namespace: healthoverlay
	Checksum: 0xCCC1ECB6
	Offset: 0x1E70
	Size: 0x12E
	Parameters: 1
	Flags: Linked
*/
function player_heartbeat_sound(healthcap)
{
	self endon(#"end_healthregen");
	self.hearbeatwait = 0.2;
	wait(2);
	player = self;
	for(;;)
	{
		wait(0.2);
		if(player.health <= 0)
		{
			return;
		}
		if(player util::isusingremote())
		{
			continue;
		}
		if(player.health >= healthcap)
		{
			self.hearbeatwait = 0.3;
			continue;
		}
		if(player.healthregentime <= 0 && gettime() > player.breathingstoptime)
		{
			self.hearbeatwait = 0.3;
			continue;
		}
		player playlocalsound(#"mpl_player_heartbeat");
		wait(self.hearbeatwait);
		if(self.hearbeatwait <= 0.6)
		{
			self.hearbeatwait = self.hearbeatwait + 0.1;
		}
	}
}

/*
	Name: function_d2880c8f
	Namespace: healthoverlay
	Checksum: 0xFFD73D2C
	Offset: 0x1FA8
	Size: 0x56
	Parameters: 0
	Flags: Linked
*/
function function_d2880c8f()
{
	if(is_true(self.heal.enabled))
	{
		self.health = self function_f8139729();
	}
	else
	{
		self.health = self.maxhealth;
	}
}

