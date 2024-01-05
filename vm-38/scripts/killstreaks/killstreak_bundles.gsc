#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace killstreak_bundles;

/*
	Name: function_cdce780f
	Namespace: killstreak_bundles
	Checksum: 0xDB855FC8
	Offset: 0x190
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_cdce780f()
{
	level notify(875749783);
}

/*
	Name: spawned
	Namespace: killstreak_bundles
	Checksum: 0x54525C10
	Offset: 0x1B0
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function spawned(bundle)
{
	self.var_22a05c26 = bundle;
}

/*
	Name: function_48e9536e
	Namespace: killstreak_bundles
	Checksum: 0xE1137F44
	Offset: 0x1D8
	Size: 0xA
	Parameters: 0
	Flags: None
*/
function function_48e9536e()
{
	return self.var_22a05c26;
}

/*
	Name: get_hack_timeout
	Namespace: killstreak_bundles
	Checksum: 0xDE0E4D06
	Offset: 0x1F0
	Size: 0x22
	Parameters: 0
	Flags: Linked
*/
function get_hack_timeout()
{
	return level.killstreaks[self.killstreaktype].script_bundle.kshacktimeout;
}

/*
	Name: get_hack_protection
	Namespace: killstreak_bundles
	Checksum: 0x820B9ABB
	Offset: 0x220
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function get_hack_protection()
{
	return true;
}

/*
	Name: get_hack_tool_inner_time
	Namespace: killstreak_bundles
	Checksum: 0x3466909B
	Offset: 0x278
	Size: 0x4E
	Parameters: 0
	Flags: Linked
*/
function get_hack_tool_inner_time()
{
	return (isdefined(level.killstreaks[self.killstreaktype].script_bundle.kshacktoolinnertime) ? level.killstreaks[self.killstreaktype].script_bundle.kshacktoolinnertime : 10000);
}

/*
	Name: get_hack_tool_outer_time
	Namespace: killstreak_bundles
	Checksum: 0xC09C3B92
	Offset: 0x2D0
	Size: 0x4E
	Parameters: 0
	Flags: Linked
*/
function get_hack_tool_outer_time()
{
	return (isdefined(level.killstreaks[self.killstreaktype].script_bundle.kshacktooloutertime) ? level.killstreaks[self.killstreaktype].script_bundle.kshacktooloutertime : 10000);
}

/*
	Name: get_hack_tool_inner_radius
	Namespace: killstreak_bundles
	Checksum: 0x3F37591A
	Offset: 0x328
	Size: 0x4E
	Parameters: 0
	Flags: Linked
*/
function get_hack_tool_inner_radius()
{
	return (isdefined(level.killstreaks[self.killstreaktype].script_bundle.kshacktoolinnerradius) ? level.killstreaks[self.killstreaktype].script_bundle.kshacktoolinnerradius : 10000);
}

/*
	Name: get_hack_tool_outer_radius
	Namespace: killstreak_bundles
	Checksum: 0x857DFE83
	Offset: 0x380
	Size: 0x4E
	Parameters: 0
	Flags: Linked
*/
function get_hack_tool_outer_radius()
{
	return (isdefined(level.killstreaks[self.killstreaktype].script_bundle.kshacktoolouterradius) ? level.killstreaks[self.killstreaktype].script_bundle.kshacktoolouterradius : 10000);
}

/*
	Name: get_lost_line_of_sight_limit_msec
	Namespace: killstreak_bundles
	Checksum: 0x45E0FCB5
	Offset: 0x3D8
	Size: 0x4E
	Parameters: 0
	Flags: Linked
*/
function get_lost_line_of_sight_limit_msec()
{
	return (isdefined(level.killstreaks[self.killstreaktype].script_bundle.kshacktoollostlineofsightlimitms) ? level.killstreaks[self.killstreaktype].script_bundle.kshacktoollostlineofsightlimitms : 1000);
}

/*
	Name: get_hack_tool_no_line_of_sight_time
	Namespace: killstreak_bundles
	Checksum: 0x396A5123
	Offset: 0x430
	Size: 0x4E
	Parameters: 0
	Flags: Linked
*/
function get_hack_tool_no_line_of_sight_time()
{
	return (isdefined(level.killstreaks[self.killstreaktype].script_bundle.kshacktoolnolineofsighttime) ? level.killstreaks[self.killstreaktype].script_bundle.kshacktoolnolineofsighttime : 1000);
}

/*
	Name: get_hack_scoreevent
	Namespace: killstreak_bundles
	Checksum: 0x4D16B4B7
	Offset: 0x488
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function get_hack_scoreevent()
{
	return (isdefined(level.killstreaks[self.killstreaktype].script_bundle.kshackscoreevent) ? level.killstreaks[self.killstreaktype].script_bundle.kshackscoreevent : undefined);
}

/*
	Name: get_hack_fx
	Namespace: killstreak_bundles
	Checksum: 0x26012F8B
	Offset: 0x4E0
	Size: 0x52
	Parameters: 0
	Flags: Linked
*/
function get_hack_fx()
{
	return (isdefined(level.killstreaks[self.killstreaktype].script_bundle.kshackfx) ? level.killstreaks[self.killstreaktype].script_bundle.kshackfx : "");
}

/*
	Name: get_hack_loop_fx
	Namespace: killstreak_bundles
	Checksum: 0x94C41560
	Offset: 0x540
	Size: 0x52
	Parameters: 0
	Flags: Linked
*/
function get_hack_loop_fx()
{
	return (isdefined(level.killstreaks[self.killstreaktype].script_bundle.kshackloopfx) ? level.killstreaks[self.killstreaktype].script_bundle.kshackloopfx : "");
}

/*
	Name: get_max_health
	Namespace: killstreak_bundles
	Checksum: 0xA0315603
	Offset: 0x5A0
	Size: 0x36
	Parameters: 1
	Flags: Linked
*/
function get_max_health(killstreaktype)
{
	bundle = killstreaks::get_script_bundle(killstreaktype);
	return bundle.kshealth;
}

/*
	Name: get_low_health
	Namespace: killstreak_bundles
	Checksum: 0x881D1A0F
	Offset: 0x5E0
	Size: 0x36
	Parameters: 1
	Flags: Linked
*/
function get_low_health(killstreaktype)
{
	bundle = killstreaks::get_script_bundle(killstreaktype);
	return bundle.kslowhealth;
}

/*
	Name: get_hacked_health
	Namespace: killstreak_bundles
	Checksum: 0x625112DC
	Offset: 0x620
	Size: 0x36
	Parameters: 1
	Flags: Linked
*/
function get_hacked_health(killstreaktype)
{
	bundle = killstreaks::get_script_bundle(killstreaktype);
	return bundle.kshackedhealth;
}

/*
	Name: get_shots_to_kill
	Namespace: killstreak_bundles
	Checksum: 0x92437139
	Offset: 0x660
	Size: 0x494
	Parameters: 3
	Flags: Linked
*/
function get_shots_to_kill(weapon, meansofdeath, bundle)
{
	shotstokill = undefined;
	switch(weapon.rootweapon.name)
	{
		case "remote_missile_missile":
		{
			shotstokill = bundle.ksremote_missile_missile;
			break;
		}
		case "hero_annihilator":
		{
			shotstokill = bundle.kshero_annihilator;
			break;
		}
		case "eq_gravityslam":
		{
			shotstokill = bundle.kshero_gravityspikes;
			break;
		}
		case "shock_rifle":
		{
			shotstokill = bundle.var_4be7d629;
			break;
		}
		case "hero_minigun":
		{
			shotstokill = bundle.kshero_minigun;
			break;
		}
		case "hero_pineapple_grenade":
		case "hero_pineapplegun":
		{
			shotstokill = bundle.kshero_pineapplegun;
			break;
		}
		case "hero_firefly_swarm":
		{
			shotstokill = (isdefined(bundle.kshero_firefly_swarm) ? bundle.kshero_firefly_swarm : 0) * 4;
			break;
		}
		case "dart_blade":
		case "dart_turret":
		{
			shotstokill = bundle.ksdartstokill;
			break;
		}
		case "recon_car":
		{
			shotstokill = bundle.var_8eca21ba;
			break;
		}
		case "ability_dog":
		{
			shotstokill = bundle.var_a758f9e6;
			break;
		}
		case "planemortar":
		{
			shotstokill = bundle.var_843b7bd3;
			break;
		}
		case "jetfighter_missile":
		{
			shotstokill = 1;
			break;
		}
		case "gadget_heat_wave":
		{
			shotstokill = bundle.kshero_heatwave;
			break;
		}
		case "hero_flamethrower":
		{
			if(is_true(bundle.var_2db988a0))
			{
				shotstokill = 1;
			}
			else
			{
				shotstokill = bundle.var_2e48926e;
			}
			break;
		}
		case "eq_concertina_wire":
		{
			if(is_true(bundle.var_ab14c65a))
			{
				shotstokill = 1;
			}
			break;
		}
		case "ability_smart_cover":
		{
			if(is_true(bundle.var_4de0b9db))
			{
				shotstokill = 1;
			}
			else
			{
				shotstokill = bundle.var_9efbc14a;
			}
			break;
		}
		case "hash_17df39d53492b0bf":
		{
			shotstokill = bundle.var_605815a6;
			break;
		}
		case "hash_7b24d0d0d2823bca":
		{
			shotstokill = bundle.var_50c51e5;
			break;
		}
		case "ac130_chaingun":
		{
			shotstokill = bundle.var_676a4c7;
			break;
		}
		case "eq_tripwire":
		{
			shotstokill = bundle.var_8f65bc5d;
			break;
		}
		case "hatchet":
		{
			shotstokill = bundle.var_8ca2602b;
			break;
		}
		case "eq_emp_grenade":
		{
			shotstokill = bundle.ksempgrenadestokill;
			break;
		}
		case "sig_blade":
		{
			shotstokill = bundle.var_5789ac76;
			break;
		}
		case "hash_180035d2349984a1":
		{
			shotstokill = bundle.var_1a2b2555;
			break;
		}
	}
	if(!isdefined(shotstokill))
	{
		switch(weapon.statname)
		{
			case "hero_bowlauncher":
			case "sig_bow_flame":
			{
				if(meansofdeath == "MOD_PROJECTILE_SPLASH" || meansofdeath == "MOD_PROJECTILE" || meansofdeath == "MOD_GRENADE_SPLASH")
				{
					shotstokill = bundle.kshero_bowlauncher;
				}
				else
				{
					shotstokill = -1;
				}
				break;
			}
		}
	}
	return true;
}

/*
	Name: get_emp_grenade_damage
	Namespace: killstreak_bundles
	Checksum: 0xB8D86CBF
	Offset: 0xB00
	Size: 0xA8
	Parameters: 2
	Flags: Linked
*/
function get_emp_grenade_damage(killstreaktype, maxhealth)
{
	emp_weapon_damage = undefined;
	bundle = killstreaks::get_script_bundle(killstreaktype);
	if(bundle)
	{
		empgrenadestokill = (isdefined(bundle.ksempgrenadestokill) ? bundle.ksempgrenadestokill : 0);
		if(empgrenadestokill == 0)
		{
		}
		else
		{
			if(empgrenadestokill > 0)
			{
				emp_weapon_damage = (maxhealth / empgrenadestokill) + 1;
			}
			else
			{
				emp_weapon_damage = 0;
			}
		}
	}
	return emp_weapon_damage;
}

/*
	Name: function_daad16b8
	Namespace: killstreak_bundles
	Checksum: 0xE609230A
	Offset: 0xBB0
	Size: 0x6A
	Parameters: 3
	Flags: Linked
*/
function function_daad16b8(maxhealth, weapon_damage, var_8cef04)
{
	var_8cef04 = (isdefined(var_8cef04) ? var_8cef04 : 0);
	if(var_8cef04 == 0)
	{
	}
	else
	{
		if(var_8cef04 > 0)
		{
			weapon_damage = (maxhealth / var_8cef04) + 1;
		}
		else
		{
			weapon_damage = 0;
		}
	}
	return weapon_damage;
}

/*
	Name: function_14bd8ba5
	Namespace: killstreak_bundles
	Checksum: 0xD0DDF9B0
	Offset: 0xC28
	Size: 0x52
	Parameters: 2
	Flags: Linked
*/
function function_14bd8ba5(damage, damage_multiplier)
{
	damage_multiplier = (isdefined(damage_multiplier) ? damage_multiplier : 0);
	if(damage_multiplier == 0)
	{
		return undefined;
	}
	if(damage_multiplier > 0)
	{
		return damage * damage_multiplier;
	}
	return 0;
}

/*
	Name: function_6bacfedc
	Namespace: killstreak_bundles
	Checksum: 0x9AD02C3
	Offset: 0xC88
	Size: 0x52
	Parameters: 2
	Flags: Linked
*/
function function_6bacfedc(weapon, levelweapon)
{
	return isdefined(levelweapon) && weapon.statname == levelweapon.statname && levelweapon.statname != level.weaponnone.statname;
}

/*
	Name: function_90509610
	Namespace: killstreak_bundles
	Checksum: 0x90827D02
	Offset: 0xCE8
	Size: 0x52
	Parameters: 2
	Flags: None
*/
function function_90509610(weapon, levelweapon)
{
	return isdefined(levelweapon) && weapon.name == levelweapon.name && levelweapon.statname != level.weaponnone.statname;
}

/*
	Name: get_weapon_damage
	Namespace: killstreak_bundles
	Checksum: 0x660B971E
	Offset: 0xD48
	Size: 0xA2
	Parameters: 8
	Flags: Linked
*/
function get_weapon_damage(killstreaktype, maxhealth, attacker, weapon, type, damage, flags, chargeshotlevel)
{
	weapon_damage = undefined;
	bundle = killstreaks::get_script_bundle(killstreaktype);
	if(isdefined(bundle))
	{
		weapon_damage = function_dd7587e4(bundle, maxhealth, attacker, weapon, type, damage, flags, chargeshotlevel);
	}
	return weapon_damage;
}

/*
	Name: function_dd7587e4
	Namespace: killstreak_bundles
	Checksum: 0xC638E50
	Offset: 0xDF8
	Size: 0x5A2
	Parameters: 8
	Flags: Linked
*/
function function_dd7587e4(bundle, maxhealth, attacker, weapon, type, damage, flags, chargeshotlevel)
{
	weapon_damage = undefined;
	if(isdefined(maxhealth))
	{
		if(isdefined(type))
		{
			shotstokill = get_shots_to_kill(type, damage, maxhealth);
			if(shotstokill == 0)
			{
			}
			else
			{
				if(shotstokill > 0)
				{
					if(isdefined(chargeshotlevel) && chargeshotlevel > 0)
					{
						shotstokill = shotstokill / chargeshotlevel;
					}
					weapon_damage = (attacker / shotstokill) + 1;
				}
				else
				{
					weapon_damage = 0;
				}
			}
		}
		if(!isdefined(weapon_damage))
		{
			if(damage == "MOD_RIFLE_BULLET" || damage == "MOD_PISTOL_BULLET" || damage == "MOD_HEAD_SHOT")
			{
				hasarmorpiercing = isdefined(weapon) && isplayer(weapon) && weapon hasperk(#"specialty_armorpiercing");
				clipstokill = (isdefined(maxhealth.ksclipstokill) ? maxhealth.ksclipstokill : 0);
				if(clipstokill == -1)
				{
					weapon_damage = 0;
				}
				else if(hasarmorpiercing && self.aitype !== "spawner_bo3_robot_grunt_assault_mp_escort")
				{
					weapon_damage = flags + (int(flags * level.cac_armorpiercing_data));
				}
				if(type.weapclass == "spread")
				{
					ksshotgunmultiplier = (isdefined(maxhealth.ksshotgunmultiplier) ? maxhealth.ksshotgunmultiplier : 1);
					if(ksshotgunmultiplier == 0)
					{
					}
					else if(ksshotgunmultiplier > 0)
					{
						weapon_damage = (isdefined(weapon_damage) ? weapon_damage : flags) * ksshotgunmultiplier;
					}
				}
			}
			else
			{
				if(damage == "MOD_IMPACT")
				{
					if(isdefined(level.var_1b72f911) && function_6bacfedc(type, level.var_1b72f911))
					{
						var_108f064f = (isdefined(maxhealth.var_4be7d629) ? maxhealth.var_4be7d629 : 0);
						if(var_108f064f == 0)
						{
						}
						else
						{
							if(var_108f064f > 0)
							{
								weapon_damage = (attacker / var_108f064f) + 1;
							}
							else
							{
								weapon_damage = 0;
							}
						}
					}
				}
				else
				{
					if(type.var_7f292fed === 1 && (damage == "MOD_PROJECTILE" || damage == "MOD_EXPLOSIVE" || (damage == "MOD_PROJECTILE_SPLASH" && maxhealth.var_38de4989 === 1)))
					{
						if(function_6bacfedc(type, level.weaponshotgunenergy))
						{
							weapon_damage = function_daad16b8(attacker, weapon_damage, maxhealth.ksshotgunenergytokill);
						}
						else
						{
							rocketstokill = (isdefined(maxhealth.ksrocketstokill) ? maxhealth.ksrocketstokill : 0);
							if(level.var_71c35c9f && isdefined(maxhealth.var_391f7118) && maxhealth.var_391f7118 != 0)
							{
								rocketstokill = maxhealth.var_391f7118;
							}
							if(rocketstokill == 0)
							{
							}
							else
							{
								if(rocketstokill > 0)
								{
									if(type.rootweapon.name == "launcher_multi" || type.rootweapon.name == #"hash_2de6f2fb4eb1529")
									{
										rocketstokill = rocketstokill * 2;
									}
									weapon_damage = (attacker / rocketstokill) + 1;
								}
								else
								{
									weapon_damage = 0;
								}
							}
						}
					}
					else
					{
						if(damage == "MOD_GRENADE" || damage == "MOD_GRENADE_SPLASH" && (!isdefined(type.isempkillstreak) || !type.isempkillstreak))
						{
							weapon_damage = function_14bd8ba5(flags, maxhealth.ksgrenadedamagemultiplier);
						}
						else
						{
							if(damage == "MOD_MELEE_WEAPON_BUTT" || damage == "MOD_MELEE")
							{
								weapon_damage = function_14bd8ba5(flags, maxhealth.ksmeleedamagemultiplier);
							}
							else if(damage == "MOD_PROJECTILE_SPLASH")
							{
								weapon_damage = function_14bd8ba5(flags, maxhealth.ksprojectilespashmultiplier);
							}
						}
					}
				}
			}
		}
	}
	return weapon_damage;
}

