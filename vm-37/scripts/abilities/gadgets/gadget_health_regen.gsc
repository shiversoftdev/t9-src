#using script_4a1e83805671ae57;
#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\abilities\ability_util.gsc;
#using scripts\abilities\ability_player.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using script_725554a59d6a75b9;

#namespace gadget_health_regen;

/*
	Name: __init__system__
	Namespace: gadget_health_regen
	Checksum: 0xA9FC50A0
	Offset: 0x138
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"gadget_health_regen", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: gadget_health_regen
	Checksum: 0xCD0B8A89
	Offset: 0x180
	Size: 0x28C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	ability_player::register_gadget_activation_callbacks(23, &gadget_health_regen_on, &gadget_health_regen_off);
	ability_player::register_gadget_possession_callbacks(23, &gadget_health_regen_on_give, &gadget_health_regen_on_take);
	clientfield::register("toplayer", "healthregen", 1, 1, "int");
	clientfield::register_clientuimodel("hudItems.healingActive", 1, 1, "int");
	clientfield::register_clientuimodel("hudItems.numHealthPickups", 1, 2, "int");
	callback::on_spawned(&on_player_spawned);
	callback::on_player_damage(&on_player_damage);
	callback::add_callback(#"on_status_effect", &on_status_effect);
	callback::add_callback(#"on_buff", &on_buff);
	callback::add_callback(#"on_ai_killed", &function_3a6741ee);
	level.var_3a536ce3 = getweapon(#"hash_5768c7fdf2dc422e");
	if(!isdefined(level.var_f71267dc))
	{
		level.var_f71267dc = &function_b5b7d60e;
	}
	if(!isdefined(level.var_11e731d7))
	{
		level.var_11e731d7 = &function_582035b1;
	}
	if(!isdefined(level.var_a77fcfbe))
	{
		level.var_a77fcfbe = &function_dafd9cd;
	}
	/#
		assert(level.var_3a536ce3.name != "", "");
	#/
}

/*
	Name: on_status_effect
	Namespace: gadget_health_regen
	Checksum: 0x9DE7EC0A
	Offset: 0x418
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function on_status_effect(var_756fda07)
{
	if(is_true(var_756fda07.var_29f71617))
	{
		self function_aba28004();
	}
}

/*
	Name: on_buff
	Namespace: gadget_health_regen
	Checksum: 0xC198849C
	Offset: 0x460
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function on_buff()
{
	self function_aba28004();
}

/*
	Name: gadget_health_regen_on_give
	Namespace: gadget_health_regen
	Checksum: 0x79D566CB
	Offset: 0x488
	Size: 0x84
	Parameters: 2
	Flags: Linked
*/
function gadget_health_regen_on_give(slot, weapon)
{
	self.gadget_health_regen_slot = slot;
	self.gadget_health_regen_weapon = weapon;
	weapon.ignore_grenade = 1;
	if(isdefined(weapon) && weapon.maxheal)
	{
		self player::function_9080887a(weapon.maxheal);
	}
	else
	{
		self player::function_9080887a();
	}
}

/*
	Name: gadget_health_regen_on_take
	Namespace: gadget_health_regen
	Checksum: 0x6FBAF1D1
	Offset: 0x518
	Size: 0x34
	Parameters: 2
	Flags: Linked
*/
function gadget_health_regen_on_take(slot, weapon)
{
	self.gadget_health_regen_slot = undefined;
	self player::function_9080887a();
}

/*
	Name: on_player_spawned
	Namespace: gadget_health_regen
	Checksum: 0x200BCF42
	Offset: 0x558
	Size: 0xDC
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	self function_d91a057d();
	if(isdefined(level.var_c018953f))
	{
		if(!level.var_c018953f stim_count::is_open(self))
		{
			level.var_c018953f stim_count::open(self, 1);
		}
	}
	/#
		if(getdvarint(#"hash_4a424b02130fa0c0", 0) > 0)
		{
			stim_count = getdvarint(#"hash_4a424b02130fa0c0", 0);
			self set_stim_count(stim_count);
		}
	#/
}

/*
	Name: set_stim_count
	Namespace: gadget_health_regen
	Checksum: 0xB2D23B1F
	Offset: 0x640
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function set_stim_count(stim_count)
{
	stim_count = math::clamp(stim_count, 0, 9);
	self.var_f2a5bd01 = stim_count;
	if(isdefined(level.var_c018953f))
	{
		level.var_c018953f stim_count::set_stim_count(self, stim_count);
	}
}

/*
	Name: function_36ac3c21
	Namespace: gadget_health_regen
	Checksum: 0x8944348A
	Offset: 0x6B0
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_36ac3c21()
{
	self clientfield::set_to_player("healthregen", 1);
}

/*
	Name: function_ddfdddb1
	Namespace: gadget_health_regen
	Checksum: 0x79F59932
	Offset: 0x6E0
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function function_ddfdddb1()
{
	self clientfield::set_to_player("healthregen", 1);
	battlechatter::function_30146e82(self);
}

/*
	Name: function_1e02d458
	Namespace: gadget_health_regen
	Checksum: 0xC5186454
	Offset: 0x728
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_1e02d458()
{
	self notify(#"healing");
	self clientfield::set_player_uimodel("hudItems.healingActive", 1);
}

/*
	Name: function_7993d50e
	Namespace: gadget_health_regen
	Checksum: 0xA97CAA10
	Offset: 0x768
	Size: 0xCC
	Parameters: 0
	Flags: Linked
*/
function function_7993d50e()
{
	if(!isdefined(self) || !isdefined(self.heal))
	{
		return;
	}
	self.heal.var_a1cac2f1 = 0;
	self.heal.enabled = 0;
	self.heal.var_bc840360 = 0;
	self.heal.var_f0f1ff36 = 0;
	self notify(#"healing_disabled");
	self player::function_9080887a();
	self clientfield::set_player_uimodel("hudItems.healingActive", 0);
	self clientfield::set_to_player("healthregen", 0);
}

/*
	Name: function_a1a8b5e5
	Namespace: gadget_health_regen
	Checksum: 0x428171BD
	Offset: 0x840
	Size: 0xB6
	Parameters: 0
	Flags: Linked
*/
function function_a1a8b5e5()
{
	modifier = 1;
	if(self function_6c32d092(#"hash_504b40f717f89167") || self function_6c32d092(#"hash_504b3ff717f88fb4") || self function_6c32d092(#"hash_504b3ef717f88e01") || self function_6c32d092(#"hash_504b3df717f88c4e"))
	{
		modifier = 0.5;
	}
	return modifier;
}

/*
	Name: function_ef6c7869
	Namespace: gadget_health_regen
	Checksum: 0xD6E3B279
	Offset: 0x900
	Size: 0xFE
	Parameters: 1
	Flags: Linked
*/
function function_ef6c7869(now)
{
	if(self.laststand === 1)
	{
		return;
	}
	var_337562a8 = (isdefined(self.var_337562a8) ? self.var_337562a8 : level.var_3a536ce3);
	var_f60dece = function_a1a8b5e5();
	total_time = [[level.var_11e731d7]](var_337562a8) * var_f60dece;
	if(now - self.lastdamagetime < total_time)
	{
		return;
	}
	self function_36ac3c21();
	self thread enable_healing_after_wait(undefined, var_337562a8, getdvarfloat(#"hash_57be38bf0a00809d", 0), 0.5, self);
}

/*
	Name: function_34daf34a
	Namespace: gadget_health_regen
	Checksum: 0xFB0E49AC
	Offset: 0xA08
	Size: 0xD4
	Parameters: 2
	Flags: Linked
*/
function function_34daf34a(slot, weapon)
{
	if(self gadgetsdisabled())
	{
		return;
	}
	if(weapon === getweapon(#"gadget_health_regen_squad"))
	{
		self function_bc0ce7d5(slot, weapon);
	}
	else
	{
		self function_ddfdddb1();
		self thread enable_healing_after_wait(slot, weapon, getdvarfloat(#"hash_57be38bf0a00809d", 0), 0.5, self);
	}
}

/*
	Name: function_bc0ce7d5
	Namespace: gadget_health_regen
	Checksum: 0x504D2BBA
	Offset: 0xAE8
	Size: 0x12E
	Parameters: 2
	Flags: Linked
*/
function function_bc0ce7d5(slot, weapon)
{
	var_1594ab5 = self function_941ed5d6();
	for(i = 0; i < 4; i++)
	{
		if(isalive(var_1594ab5[i]))
		{
			if(is_true(var_1594ab5[i].laststand))
			{
				if(isdefined(var_1594ab5[i].var_84c0402e))
				{
					var_1594ab5[i].bleedout_time = var_1594ab5[i].var_84c0402e;
				}
			}
			else
			{
				var_1594ab5[i] function_ddfdddb1();
				var_1594ab5[i] thread enable_healing_after_wait(slot, weapon, getdvarfloat(#"hash_57be38bf0a00809d", 0), 0.5, self);
			}
		}
	}
}

/*
	Name: function_941ed5d6
	Namespace: gadget_health_regen
	Checksum: 0x2004A09D
	Offset: 0xC20
	Size: 0x5A
	Parameters: 0
	Flags: Linked
*/
function function_941ed5d6()
{
	if(isdefined(self.team))
	{
		var_1594ab5 = getplayers(self.team, self.origin, 1500);
	}
	else
	{
		var_1594ab5 = array(self);
	}
	return var_1594ab5;
}

/*
	Name: function_aa2c622b
	Namespace: gadget_health_regen
	Checksum: 0x39A6327
	Offset: 0xC88
	Size: 0x66
	Parameters: 1
	Flags: Linked
*/
function function_aa2c622b(weapon)
{
	return weapon.name === #"gadget_health_regen" || weapon.name === #"gadget_medicalinjectiongun" || weapon.name === #"hash_788c96e19cc7a46e";
}

/*
	Name: gadget_health_regen_on
	Namespace: gadget_health_regen
	Checksum: 0x2AC5B664
	Offset: 0xCF8
	Size: 0x6C
	Parameters: 2
	Flags: Linked
*/
function gadget_health_regen_on(slot, weapon)
{
	if(sessionmodeiswarzonegame() && !function_aa2c622b(weapon))
	{
		self.var_eedfcc6e = gettime();
	}
	else
	{
		function_34daf34a(slot, weapon);
	}
}

/*
	Name: gadget_health_regen_off
	Namespace: gadget_health_regen
	Checksum: 0x5D164F10
	Offset: 0xD70
	Size: 0x126
	Parameters: 2
	Flags: Linked
*/
function gadget_health_regen_off(slot, weapon)
{
	if(!sessionmodeiswarzonegame() && !function_aa2c622b(weapon))
	{
	}
	else if(isdefined(self.var_eedfcc6e))
	{
		var_d9dbb072 = 0;
		usage_rate = self function_c1b7eefa(weapon);
		if(usage_rate > 0)
		{
			var_d9dbb072 = weapon.gadget_powermax / usage_rate;
		}
		if(((int(var_d9dbb072 * 1000)) + self.var_eedfcc6e) <= (gettime() + 100))
		{
			function_34daf34a(slot, weapon);
		}
		else
		{
			self gadgetpowerset(slot, weapon.gadget_powermax);
		}
		self.var_eedfcc6e = undefined;
	}
}

/*
	Name: enable_healing_after_wait
	Namespace: gadget_health_regen
	Checksum: 0x27B8170C
	Offset: 0xEA0
	Size: 0xE4
	Parameters: 5
	Flags: Linked
*/
function enable_healing_after_wait(slot, weapon, wait_time, var_5818bd22, player)
{
	self notify(#"healing_preamble");
	self.heal.var_a1cac2f1 = gettime() + var_5818bd22;
	waitresult = undefined;
	waitresult = self waittilltimeout(wait_time, #"death", #"disconnect", #"healing_disabled", #"healing_preamble");
	if(waitresult._notify != "timeout")
	{
		return;
	}
	self enable_healing(slot, weapon, player);
}

/*
	Name: enable_healing
	Namespace: gadget_health_regen
	Checksum: 0x8508EF3
	Offset: 0xF90
	Size: 0x63C
	Parameters: 3
	Flags: Linked
*/
function enable_healing(slot, weapon, player)
{
	if(!isdefined(self))
	{
		return;
	}
	if(self gadgetsdisabled())
	{
		return;
	}
	self function_1e02d458();
	if(isdefined(weapon) && weapon.maxheal)
	{
		self player::function_9080887a(weapon.maxheal);
	}
	else
	{
		self player::function_9080887a();
	}
	if(isdefined(self.var_9cd2c51d))
	{
		if(!self.heal.enabled)
		{
			self.var_9cd2c51d.var_c54af9a9 = gettime();
			self.var_9cd2c51d.var_6e219f3c = self.health;
		}
		self.var_9cd2c51d.var_43797ec0 = weapon;
		if(weapon !== level.var_3a536ce3)
		{
			self.var_9cd2c51d.var_63362b1e = gettime();
			self.var_9cd2c51d.var_158e75d4 = weapon.statname;
		}
	}
	var_bc840360 = self.health;
	if(self.heal.enabled)
	{
		if(isdefined(self.heal.var_bc840360) && self.heal.var_bc840360 > 0)
		{
			var_bc840360 = self.heal.var_bc840360;
		}
	}
	if(weapon.heal)
	{
		max_health = self.maxhealth;
		if(weapon.maxheal && !getdvarint(#"hash_573a1edd4b4143e4", 0))
		{
			max_health = weapon.maxheal;
		}
		self.heal.var_bc840360 = math::clamp(weapon.heal + var_bc840360, 0, max_health);
		if(self.heal.var_bc840360 == 0)
		{
			return;
		}
	}
	else
	{
		self.heal.var_bc840360 = 0;
	}
	self.heal.var_f0f1ff36 = weapon === level.var_3a536ce3;
	var_b16fafc9 = 0;
	if(!self.heal.enabled)
	{
		if(self secondaryoffhandbuttonpressed())
		{
			if(isdefined(self.var_f2a5bd01) && self.var_f2a5bd01 > 0)
			{
				self set_stim_count(self.var_f2a5bd01 - 1);
				var_b16fafc9 = 1;
				self playrumbleonentity("stim_heal");
			}
		}
	}
	var_4465ef1e = player [[level.var_f71267dc]](var_b16fafc9, weapon);
	if(var_4465ef1e > 0)
	{
		heal_amount = weapon.heal;
		if(heal_amount <= 0 && isdefined(self.var_66cb03ad))
		{
			heal_amount = self.var_66cb03ad;
		}
		self.heal.rate = heal_amount / (float(var_4465ef1e) / 1000);
		self.heal.heal_amount = heal_amount;
		self.heal.var_4e6c244d = weapon.var_db003065;
	}
	else
	{
		self.heal.rate = 0;
	}
	if(isdefined(slot))
	{
		self function_820a63e9(slot, 1);
	}
	if(isdefined(level.var_d3b4a4db) && self === player)
	{
		self [[level.var_d3b4a4db]](var_b16fafc9);
	}
	if(isdefined(self.var_121392a1))
	{
		foreach(se in self.var_121392a1)
		{
			params = se.var_4f6b79a4;
			if(params.var_abac379d === 1)
			{
				status_effect::function_408158ef(params.setype, params.var_18d16a6b);
			}
		}
	}
	var_915fee20 = self.heal.enabled;
	self.heal.enabled = 1;
	if(getdvarint(#"hash_7f9cfdea69a18091", 1) == 1)
	{
		if(!var_915fee20)
		{
			self.heal.var_f37a08a8 = gettime();
			self.heal.var_fa57541f = self.health;
		}
	}
	self callback::callback(#"hash_4b807b1167b4a811");
	self callback::function_d8abfc3d(#"done_healing", &function_4e449209);
	if(isdefined(self.health) && isdefined(self.var_66cb03ad) && self.health >= self.var_66cb03ad)
	{
		self function_4e449209();
	}
}

/*
	Name: function_b5b7d60e
	Namespace: gadget_health_regen
	Checksum: 0x6A4D37CC
	Offset: 0x15D8
	Size: 0x4A
	Parameters: 2
	Flags: Linked
*/
function function_b5b7d60e(var_b16fafc9, weapon)
{
	return (var_b16fafc9 ? self function_442af617(weapon) : self function_89a98197(weapon));
}

/*
	Name: function_582035b1
	Namespace: gadget_health_regen
	Checksum: 0x6D719C12
	Offset: 0x1630
	Size: 0x16
	Parameters: 1
	Flags: Linked
*/
function function_582035b1(var_337562a8)
{
	return var_337562a8.var_5b053313;
}

/*
	Name: function_d91a057d
	Namespace: gadget_health_regen
	Checksum: 0x8010F48A
	Offset: 0x1650
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function function_d91a057d(slot)
{
	if(!isdefined(slot))
	{
		slot = ability_util::gadget_slot_for_type(23);
	}
	if(isdefined(slot))
	{
		self function_820a63e9(slot, 0);
	}
	if(is_healing())
	{
		self function_7993d50e();
	}
}

/*
	Name: is_healing
	Namespace: gadget_health_regen
	Checksum: 0x30AAF6DF
	Offset: 0x16D8
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function is_healing()
{
	return isdefined(self) && isdefined(self.heal) && is_true(self.heal.enabled);
}

/*
	Name: function_4e449209
	Namespace: gadget_health_regen
	Checksum: 0xE651DC01
	Offset: 0x1720
	Size: 0xE4
	Parameters: 0
	Flags: Linked
*/
function function_4e449209()
{
	self endon(#"disconnect");
	if(isdefined(self))
	{
		self.heal.var_a1cac2f1 = 0;
		if(isdefined(level.var_d9ae19f0))
		{
			level [[level.var_d9ae19f0]](self);
		}
		self callback::function_52ac9652(#"done_healing", &function_4e449209);
		if(self is_healing())
		{
			if(!isdefined(self.var_c443b227))
			{
				self thread battlechatter::function_78c16252();
			}
		}
		self function_d91a057d();
	}
}

/*
	Name: on_player_damage
	Namespace: gadget_health_regen
	Checksum: 0x9B2DFF01
	Offset: 0x1810
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function on_player_damage(params)
{
	if(!self is_healing())
	{
		return;
	}
	attacker = params.eattacker;
	damage = params.idamage;
	if(self [[level.var_a77fcfbe]](attacker, damage) == 0)
	{
		self.heal.var_bc840360 = math::clamp(self.heal.var_bc840360 - damage, 0, self.heal.var_bc840360);
		return;
	}
	function_18e0320b();
}

/*
	Name: function_aba28004
	Namespace: gadget_health_regen
	Checksum: 0x7DC84E56
	Offset: 0x18E8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_aba28004()
{
	if(!isplayer(self))
	{
		return;
	}
	self function_18e0320b();
}

/*
	Name: function_18e0320b
	Namespace: gadget_health_regen
	Checksum: 0xDFBC316D
	Offset: 0x1928
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_18e0320b()
{
	if(self is_healing())
	{
		self function_d91a057d();
	}
}

/*
	Name: function_dafd9cd
	Namespace: gadget_health_regen
	Checksum: 0xB74DA3B2
	Offset: 0x1968
	Size: 0xA6
	Parameters: 2
	Flags: Linked, Private
*/
function private function_dafd9cd(attacker, damage)
{
	if(gettime() < self.heal.var_a1cac2f1)
	{
		return false;
	}
	if(damage < getdvarfloat(#"hash_3671f84e911fb747", (isdefined(level.var_5714f442) ? level.var_5714f442 : 0)))
	{
		return false;
	}
	if(isdefined(level.deathcircle) && level.deathcircle === attacker)
	{
		return false;
	}
	return true;
}

/*
	Name: function_831bf182
	Namespace: gadget_health_regen
	Checksum: 0xA3608714
	Offset: 0x1A18
	Size: 0x4A
	Parameters: 0
	Flags: Linked
*/
function function_831bf182()
{
	can_set = isdefined(self.gadget_health_regen_slot);
	if(!can_set || "ammo" == self.gadget_health_regen_weapon.gadget_powerusetype)
	{
		return 0;
	}
	return can_set;
}

/*
	Name: power_off
	Namespace: gadget_health_regen
	Checksum: 0xD221700
	Offset: 0x1A70
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function power_off()
{
	if(self function_831bf182())
	{
		self gadgetpowerset(self.gadget_health_regen_slot, 0);
	}
}

/*
	Name: power_on
	Namespace: gadget_health_regen
	Checksum: 0xDA24530C
	Offset: 0x1AB8
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function power_on()
{
	if(self function_831bf182())
	{
		self gadgetpowerset(self.gadget_health_regen_slot, self.gadget_health_regen_weapon.gadget_powermax);
	}
}

/*
	Name: function_3a6741ee
	Namespace: gadget_health_regen
	Checksum: 0xD7AA0E24
	Offset: 0x1B10
	Size: 0x1C4
	Parameters: 1
	Flags: Linked
*/
function function_3a6741ee(params)
{
	attacker = params.eattacker;
	if(!isplayer(attacker))
	{
		return;
	}
	player = attacker;
	if(player function_831bf182() == 0)
	{
		return;
	}
	var_312418a2 = getweapon(#"gadget_health_regen");
	var_d1c7ac6d = var_312418a2.var_4db0917a;
	if(!isdefined(var_d1c7ac6d) || var_d1c7ac6d == 0)
	{
		return;
	}
	/#
		assert(isdefined(player) && isdefined(player.gadget_health_regen_slot));
	#/
	/#
		assert(isdefined(player) && (isdefined(player.gadget_health_regen_weapon) && isdefined(player.gadget_health_regen_weapon.gadget_powermax)));
	#/
	gadgetslot = player.gadget_health_regen_slot;
	var_5d74fac3 = player.gadget_health_regen_weapon.gadget_powermax;
	var_db3ef30b = player gadgetpowerget(gadgetslot);
	var_d4a51b2 = var_db3ef30b + var_d1c7ac6d;
	if(var_d4a51b2 < 0)
	{
		var_d4a51b2 = 0;
	}
	else if(var_d4a51b2 > var_5d74fac3)
	{
		var_d4a51b2 = var_5d74fac3;
	}
	player gadgetpowerset(gadgetslot, var_d4a51b2);
}

