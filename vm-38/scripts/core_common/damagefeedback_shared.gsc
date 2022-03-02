#using script_5399f402045d7abd;
#using script_68d2ee1489345a1d;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\weapons_shared.gsc;

#namespace damagefeedback_shared;

/*
	Name: function_c12ae4cd
	Namespace: damagefeedback_shared
	Checksum: 0xB5C55253
	Offset: 0x1A8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c12ae4cd()
{
	level notify(969133504);
}

#namespace damagefeedback;

/*
	Name: function_89f2df9
	Namespace: damagefeedback
	Checksum: 0xBF9ADF
	Offset: 0x1C8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	/#
		system::register(#"damagefeedback", &function_70a657d8, undefined, undefined, undefined);
	#/
}

/*
	Name: function_70a657d8
	Namespace: damagefeedback
	Checksum: 0xEABF4353
	Offset: 0x210
	Size: 0x2C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	/#
		callback::on_connect(&on_player_connect);
	#/
}

/*
	Name: on_player_connect
	Namespace: damagefeedback
	Checksum: 0x6674F5B
	Offset: 0x248
	Size: 0x8
	Parameters: 0
	Flags: None
*/
function on_player_connect()
{
	/#
	#/
}

/*
	Name: should_play_sound
	Namespace: damagefeedback
	Checksum: 0x313599CE
	Offset: 0x258
	Size: 0x96
	Parameters: 1
	Flags: Linked
*/
function should_play_sound(mod)
{
	if(!isdefined(mod))
	{
		return false;
	}
	switch(mod)
	{
		case "mod_melee_weapon_butt":
		case "mod_crush":
		case "mod_hit_by_object":
		case "mod_grenade_splash":
		case "mod_melee_assassinate":
		case "mod_melee":
		{
			return false;
		}
	}
	return true;
}

/*
	Name: play_hit_alert_sfx
	Namespace: damagefeedback
	Checksum: 0xCA117391
	Offset: 0x2F8
	Size: 0x12A
	Parameters: 9
	Flags: Linked
*/
function play_hit_alert_sfx(mod, inflictor, perkfeedback, weapon, victim, psoffsettime, shitloc, fatal, idflags)
{
	if(sessionmodeiscampaigngame())
	{
		hitalias = hit_alert_sfx_cp(mod, inflictor, perkfeedback, weapon, victim, psoffsettime, shitloc, fatal);
	}
	if(sessionmodeismultiplayergame() || function_f99d2668())
	{
		hitalias = hit_alert_sfx_mp(mod, inflictor, perkfeedback, weapon, victim, psoffsettime, shitloc, fatal, idflags);
	}
	if(sessionmodeiszombiesgame())
	{
		hitalias = hit_alert_sfx_zm(mod, inflictor, perkfeedback, weapon, victim, psoffsettime, shitloc, fatal, idflags);
	}
	return hitalias;
}

/*
	Name: hit_alert_sfx_cp
	Namespace: damagefeedback
	Checksum: 0x2B677FDD
	Offset: 0x430
	Size: 0x18A
	Parameters: 8
	Flags: Linked
*/
function hit_alert_sfx_cp(mod, inflictor, perkfeedback, weapon, victim, psoffsettime, shitloc, fatal)
{
	hitalias = undefined;
	suffix = "";
	if(should_play_sound(weapon))
	{
		if(isplayer(self))
		{
			if(self isinvehicle() && !is_true(level.var_95b5c0fe))
			{
				return hitalias;
			}
		}
		if(is_true(fatal))
		{
			suffix = "_fatal";
		}
		else
		{
			suffix = "_nf";
		}
		if(weapons::isheadshot(victim, shitloc, weapon))
		{
			hitalias = #"hash_7049f87709615569";
		}
		else
		{
			hitalias = #"hash_66f38123cad3a33b";
		}
		if(isdefined(hitalias))
		{
			hitalias = hitalias + suffix;
		}
		if(isvehicle(psoffsettime))
		{
			hitalias = #"hash_2ce81d103e923201";
		}
	}
	return hitalias;
}

/*
	Name: hit_alert_sfx_mp
	Namespace: damagefeedback
	Checksum: 0xEFDB1F38
	Offset: 0x5C8
	Size: 0x8BA
	Parameters: 9
	Flags: Linked
*/
function hit_alert_sfx_mp(mod, inflictor, perkfeedback, weapon, victim, psoffsettime, shitloc, fatal, idflags)
{
	hitalias = undefined;
	if(!isdefined(victim))
	{
		return;
	}
	if(isdefined(inflictor) && inflictor === "MOD_EXECUTION")
	{
		return #"hash_58d3709b34454b17";
	}
	if(isdefined(victim.hitsound) && victim.hitsound != "")
	{
		hitalias = victim.hitsound;
		return hitalias;
	}
	if(victim.var_965cc0b3)
	{
		if(is_true(fatal))
		{
			hitalias = #"hash_6d7fa87ddd50800";
		}
		else
		{
			hitalias = #"hash_644a18cd873e501d";
		}
	}
	if(should_play_sound(inflictor))
	{
		if(isdefined(victim.hitsound) && victim.hitsound != "")
		{
			hitalias = victim.hitsound;
		}
		else
		{
			if(victim.grappleweapon)
			{
				hitalias = #"hash_671bc9a2de453f2e";
			}
			else
			{
				if(victim.name == #"snowball")
				{
					hitalias = #"hash_65089a4793316b63";
				}
				else
				{
					if(victim.name == #"hash_1888d1367d69b3a7")
					{
						hitalias = #"hash_1fd605562fb1fd3a";
					}
					else
					{
						if(isvehicle(psoffsettime))
						{
							hitalias = #"hash_2ce81d103e923201";
						}
						else
						{
							if(isdefined(psoffsettime) && isdefined(psoffsettime.victimsoundmod))
							{
								switch(psoffsettime.victimsoundmod)
								{
									case "safeguard_robot":
									{
										hitalias = #"mpl_hit_alert_escort";
										break;
									}
									case "vehicle":
									{
										hitalias = #"hash_2ce81d103e923201";
										break;
									}
									default:
									{
										hitalias = #"mpl_hit_alert";
										break;
									}
								}
							}
							else
							{
								if(isdefined(perkfeedback) && isdefined(perkfeedback.soundmod))
								{
									switch(perkfeedback.soundmod)
									{
										case "player":
										{
											if(isdefined(idflags) && idflags & 2048 && isdefined(psoffsettime))
											{
												if(isdefined(psoffsettime.var_426947c4))
												{
													if(weapons::isheadshot(victim, shitloc, inflictor))
													{
														hitalias = #"hash_6b219a0cac330e0b";
													}
													else
													{
														hitalias = #"hash_74a7b6ba3604ede9";
													}
												}
												else
												{
													hitalias = #"hash_2248618b48085ce5";
												}
											}
											else
											{
												if(isdefined(psoffsettime) && is_true(psoffsettime.isaiclone))
												{
													hitalias = #"mpl_hit_alert_clone";
												}
												else
												{
													if(isdefined(psoffsettime) && is_true(psoffsettime.isaiclone))
													{
														hitalias = #"mpl_hit_alert_clone";
													}
													else
													{
														if(isdefined(psoffsettime) && is_true(psoffsettime.var_342564dd))
														{
															hitalias = #"hash_3e284f9a53e3010b";
														}
														else
														{
															if(isdefined(psoffsettime) && isplayer(psoffsettime) && isdefined(psoffsettime.carryobject) && isdefined(psoffsettime.carryobject.hitsound) && isdefined(weapon) && weapon == "armor")
															{
																hitalias = psoffsettime.carryobject.hitsound;
															}
															else
															{
																if(inflictor == "MOD_BURNED")
																{
																	hitalias = #"mpl_hit_alert_burn";
																}
																else
																{
																	if(is_true(fatal))
																	{
																		if(weapons::isheadshot(victim, shitloc, inflictor))
																		{
																			hitalias = #"hash_616dd8ea01d089ac";
																		}
																		else
																		{
																			hitalias = #"hash_31e38d8520839566";
																		}
																	}
																	else
																	{
																		if(weapons::isheadshot(victim, shitloc, inflictor))
																		{
																			hitalias = #"hash_29ca1afa9209bfc6";
																		}
																		else
																		{
																			if(inflictor == "MOD_MELEE_WEAPON_BUTT")
																			{
																			}
																			else
																			{
																				if(shitloc === "riotshield")
																				{
																					hitalias = #"prj_bullet_impact_shield";
																				}
																				else
																				{
																					hitalias = #"hash_205c83ac75849f80";
																				}
																			}
																		}
																	}
																}
															}
														}
													}
												}
											}
											break;
										}
										case "heatwave":
										{
											hitalias = #"mpl_hit_alert_heatwave";
											break;
										}
										case "heli":
										{
											hitalias = #"mpl_hit_alert_air";
											break;
										}
										case "hpm":
										{
											hitalias = #"mpl_hit_alert_hpm";
											break;
										}
										case "taser_spike":
										{
											hitalias = #"mpl_hit_alert_taser_spike";
											break;
										}
										case "straferun":
										case "dog":
										{
											break;
										}
										case "firefly":
										{
											hitalias = #"mpl_hit_alert_firefly";
											break;
										}
										case "drone_land":
										{
											hitalias = #"mpl_hit_alert_air";
											break;
										}
										case "mini_turret":
										{
											hitalias = #"mpl_hit_alert_quiet";
											break;
										}
										case "raps":
										{
											hitalias = #"mpl_hit_alert_air";
											break;
										}
										case "default_loud":
										{
											hitalias = #"mpl_hit_heli_gunner";
											break;
										}
										default:
										{
											hitalias = #"mpl_hit_alert";
											break;
										}
									}
								}
								else
								{
									if(inflictor == "MOD_BURNED" || inflictor == "MOD_DOT")
									{
										hitalias = #"mpl_hit_alert_burn";
									}
									else
									{
										hitalias = #"hash_205c83ac75849f80";
										if(is_true(fatal))
										{
											hitalias = #"hash_31e38d8520839566";
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
	else
	{
		if(inflictor === "MOD_MELEE_WEAPON_BUTT")
		{
			if(fatal === 1)
			{
				hitalias = #"hash_27781beb722b7488";
			}
		}
		else if(isdefined(perkfeedback) && isdefined(perkfeedback.owner) && isdefined(perkfeedback.owner.soundmod))
		{
			if(perkfeedback.owner.soundmod == #"player" && isdefined(idflags) && idflags & 2048 && isdefined(psoffsettime))
			{
				if(isdefined(psoffsettime.var_426947c4))
				{
					hitalias = #"hash_74a7b6ba3604ede9";
				}
			}
		}
	}
	return hitalias;
}

/*
	Name: hit_alert_sfx_zm
	Namespace: damagefeedback
	Checksum: 0x3CD9C7A3
	Offset: 0xE90
	Size: 0x48A
	Parameters: 9
	Flags: Linked
*/
function hit_alert_sfx_zm(mod, inflictor, perkfeedback, weapon, victim, psoffsettime, shitloc, fatal, idflags)
{
	hitalias = undefined;
	if(!isdefined(victim))
	{
		return;
	}
	if(isdefined(victim.hitsound) && victim.hitsound != "")
	{
		hitalias = victim.hitsound;
		return hitalias;
	}
	if(victim.var_965cc0b3)
	{
		hitalias = #"hash_644a18cd873e501d";
	}
	if(should_play_sound(perkfeedback))
	{
		if(isdefined(victim.hitsound) && victim.hitsound != "")
		{
			hitalias = victim.hitsound;
		}
		else
		{
			if(isvehicle(psoffsettime))
			{
				hitalias = #"hash_2ce81d103e923201";
			}
			else
			{
				if(isdefined(weapon) && isdefined(weapon.soundmod))
				{
					switch(weapon.soundmod)
					{
						case "player":
						{
							if(isdefined(idflags) && idflags & 2048 && isdefined(psoffsettime))
							{
								if(isdefined(psoffsettime.var_426947c4))
								{
									if(weapons::isheadshot(victim, shitloc, perkfeedback))
									{
										hitalias = #"hash_6b219a0cac330e0b";
									}
									else
									{
										hitalias = #"hash_74a7b6ba3604ede9";
									}
								}
								else
								{
									hitalias = #"hash_2248618b48085ce5";
								}
							}
							else
							{
								if(perkfeedback == "MOD_BURNED")
								{
									hitalias = #"mpl_hit_alert_burn";
								}
								else
								{
									if(is_true(fatal))
									{
										if(weapons::isheadshot(victim, shitloc, perkfeedback))
										{
											hitalias = #"hash_616dd8ea01d089ac";
										}
										else
										{
											hitalias = #"hash_31e38d8520839566";
										}
									}
									else
									{
										if(weapons::isheadshot(victim, shitloc, perkfeedback))
										{
											hitalias = #"hash_29ca1afa9209bfc6";
										}
										else
										{
											if(perkfeedback == "MOD_MELEE_WEAPON_BUTT")
											{
											}
											else
											{
												if(shitloc === "riotshield")
												{
													hitalias = #"prj_bullet_impact_shield";
												}
												else
												{
													hitalias = #"hash_205c83ac75849f80";
												}
											}
										}
									}
								}
							}
							break;
						}
						default:
						{
							hitalias = #"mpl_hit_alert";
							break;
						}
					}
				}
				else
				{
					if(perkfeedback == "MOD_BURNED" || perkfeedback == "MOD_DOT")
					{
						hitalias = #"mpl_hit_alert_burn";
					}
					else
					{
						hitalias = #"hash_205c83ac75849f80";
						if(is_true(fatal))
						{
							hitalias = #"hash_31e38d8520839566";
						}
					}
				}
			}
		}
	}
	else
	{
		if(perkfeedback === "MOD_MELEE_WEAPON_BUTT")
		{
			if(fatal === 1)
			{
				hitalias = #"hash_27781beb722b7488";
			}
		}
		else if(isdefined(weapon) && isdefined(weapon.owner) && isdefined(weapon.owner.soundmod))
		{
			if(weapon.owner.soundmod == #"player" && isdefined(idflags) && idflags & 2048 && isdefined(psoffsettime))
			{
				if(isdefined(psoffsettime.var_426947c4))
				{
					hitalias = #"hash_74a7b6ba3604ede9";
				}
			}
		}
	}
	return hitalias;
}

/*
	Name: function_34fbafdc
	Namespace: damagefeedback
	Checksum: 0x96493255
	Offset: 0x1328
	Size: 0x7A
	Parameters: 2
	Flags: Linked
*/
function function_34fbafdc(weapon, mod)
{
	if(isdefined(weapon) && isdefined(weapon.var_965cc0b3) && weapon.var_965cc0b3)
	{
		return true;
	}
	if(isdefined(weapon) && weapon === level.var_1b72f911 && mod === "MOD_DOT")
	{
		return true;
	}
	return false;
}

/*
	Name: update
	Namespace: damagefeedback
	Checksum: 0x595FA025
	Offset: 0x13B0
	Size: 0x88E
	Parameters: 10
	Flags: Linked
*/
function update(mod, inflictor, perkfeedback, weapon, victim, psoffsettime, shitloc, fatal, idflags, var_594a2d34)
{
	if(!isplayer(self))
	{
		return;
	}
	if(is_true(self.nohitmarkers))
	{
		return;
	}
	if(isdefined(weapon) && weapon.statname == #"recon_car" && isdefined(victim) && isdefined(victim.owner) && inflictor === victim.owner)
	{
		return;
	}
	if(isdefined(weapon) && is_true(weapon.nohitmarker))
	{
		return;
	}
	if(!isdefined(self.lasthitmarkertime))
	{
		self.lasthitmarkertimes = [];
		self.lasthitmarkertime = 0;
		self.lasthitmarkeroffsettime = 0;
		self.var_1ead243c = 0;
	}
	if(isdefined(psoffsettime) && isdefined(victim))
	{
		victim_id = victim getentitynumber();
		if(!isdefined(self.lasthitmarkertimes[victim_id]))
		{
			self.lasthitmarkertimes[victim_id] = 0;
		}
		if(self.lasthitmarkertime == gettime())
		{
			if(self.lasthitmarkertimes[victim_id] === psoffsettime && fatal !== 1 && perkfeedback === undefined)
			{
				return;
			}
		}
		self.lasthitmarkeroffsettime = psoffsettime;
		self.lasthitmarkertimes[victim_id] = psoffsettime;
	}
	else if(self.lasthitmarkertime == gettime())
	{
		return;
	}
	damagestage = 1;
	if(self.lasthitmarkertime >= (gettime() - 1000))
	{
		damagestage = self.var_1ead243c + 1;
		if(damagestage > 2)
		{
			damagestage = 1;
		}
	}
	self.var_1ead243c = damagestage;
	self.lasthitmarkertime = gettime();
	hitalias = play_hit_alert_sfx(mod, inflictor, perkfeedback, weapon, victim, psoffsettime, shitloc, fatal, idflags);
	if(isdefined(victim) && is_true(victim.isaiclone) || shitloc === "riotshield")
	{
		self playhitmarker(hitalias);
		return;
	}
	if(isdefined(victim) && (sessionmodeiszombiesgame() || sessionmodeiscampaigngame() || isplayer(victim)))
	{
		if(victim.health <= 0)
		{
			damagestage = 5;
		}
	}
	if(mod === "MOD_DOT" || mod === "MOD_DOT_SELF" && !isdefined(self.var_dbffaa32) && damagestage != 5)
	{
		return;
	}
	if(!isdefined(var_594a2d34))
	{
		var_594a2d34 = function_34fbafdc(weapon, mod);
		if(isdefined(self.viewlockedentity) && isvehicle(self.viewlockedentity) && self.usingvehicle)
		{
			var_594a2d34 = 0;
		}
	}
	if(isdefined(victim) && is_true(victim.var_8ac0d510) && var_594a2d34)
	{
		return;
	}
	var_32f65675 = 0;
	if(isdefined(victim) && damagestage == 5 && isdefined(level.var_97a55bea) && !is_true(level.var_97a55bea) && !is_true(victim.laststand) && isplayer(victim))
	{
		var_32f65675 = 1;
	}
	if(isvehicle(victim) && !is_true(victim.var_22b9bee1))
	{
		is_vehicle = 1;
	}
	is_dead = damagestage == 5;
	if(isdefined(victim) && victim.archetype === #"robot")
	{
		is_vehicle = 1;
	}
	is_vehicle = (isdefined(victim.var_48d842c3) ? victim.var_48d842c3 : is_vehicle);
	if(isdefined(victim) && self != victim)
	{
		is_friendly = !victim util::isenemyteam(self.team);
	}
	dorumble = isdefined(inflictor) && isplayer(inflictor);
	self playhitmarker(hitalias, damagestage, perkfeedback, is_dead, var_594a2d34, is_vehicle, var_32f65675, is_friendly, dorumble);
	/#
		if(isdefined(perkfeedback))
		{
			if(isdefined(self.hud_damagefeedback_additional))
			{
				switch(perkfeedback)
				{
					case "flakjacket":
					{
						self.hud_damagefeedback_additional setshader(#"damage_feedback_flak", 24, 48);
						break;
					}
					case "tacticalmask":
					{
						self.hud_damagefeedback_additional setshader(#"damage_feedback_tac", 24, 48);
						break;
					}
					case "armor":
					{
						self.hud_damagefeedback_additional setshader(#"damage_feedback_armor", 24, 48);
						break;
					}
				}
				self.hud_damagefeedback_additional.alpha = 1;
				self.hud_damagefeedback_additional fadeovertime(1);
				self.hud_damagefeedback_additional.alpha = 0;
			}
		}
		else if(isdefined(self.hud_damagefeedback))
		{
			self.hud_damagefeedback setshader(#"damage_feedback", 24, 48);
		}
		if(isdefined(self.hud_damagefeedback) && isdefined(level.growing_hitmarker) && isdefined(victim) && (sessionmodeiscampaigngame() || isplayer(victim)))
		{
			self thread damage_feedback_growth(victim, mod, weapon);
		}
		else if(isdefined(self.hud_damagefeedback))
		{
			self.hud_damagefeedback.x = -12;
			self.hud_damagefeedback.y = -12;
			self.hud_damagefeedback.alpha = 1;
			self.hud_damagefeedback fadeovertime(1);
			self.hud_damagefeedback.alpha = 0;
		}
	#/
}

/*
	Name: damage_feedback_get_stage
	Namespace: damagefeedback
	Checksum: 0xAE7C0CE
	Offset: 0x1C48
	Size: 0x10A
	Parameters: 2
	Flags: None
*/
function damage_feedback_get_stage(victim, fatal)
{
	if(!isdefined(victim) || !isdefined(victim.maxhealth) || victim.maxhealth <= 0)
	{
		return 1;
	}
	var_7d71342b = victim.health / victim.maxhealth;
	if(is_true(victim.laststand))
	{
		if(fatal === 1)
		{
			return 5;
		}
		return 1;
	}
	if(var_7d71342b > 0.74)
	{
		return 1;
	}
	if(var_7d71342b > 0.49)
	{
		return 2;
	}
	if(var_7d71342b > 0.24)
	{
		return 3;
	}
	if(victim.health > 0)
	{
		return 4;
	}
	return 5;
}

/*
	Name: damage_feedback_get_dead
	Namespace: damagefeedback
	Checksum: 0xC8714E56
	Offset: 0x1D60
	Size: 0xF6
	Parameters: 4
	Flags: None
*/
function damage_feedback_get_dead(victim, mod, weapon, stage)
{
	return stage == 5 && (mod == "MOD_BULLET" || mod == "MOD_RIFLE_BULLET" || mod == "MOD_PISTOL_BULLET" || mod == "MOD_IMPACT" || mod == "MOD_HEAD_SHOT" || mod == "MOD_BURNED" || mod == "MOD_DOT" || mod == "MOD_MELEE_WEAPON_BUTT") && !weapon.isheavyweapon && !killstreaks::is_killstreak_weapon(weapon);
}

/*
	Name: damage_feedback_growth
	Namespace: damagefeedback
	Checksum: 0x93E8F11
	Offset: 0x1E60
	Size: 0x1C6
	Parameters: 3
	Flags: None
*/
function damage_feedback_growth(victim, mod, weapon)
{
	/#
		if(isdefined(self.hud_damagefeedback))
		{
			stage = damage_feedback_get_stage(victim);
			self.hud_damagefeedback.x = -11 + -1 * stage;
			self.hud_damagefeedback.y = -11 + -1 * stage;
			size_x = 22 + (2 * stage);
			size_y = size_x * 2;
			self.hud_damagefeedback setshader(#"damage_feedback", size_x, size_y);
			if(damage_feedback_get_dead(victim, mod, weapon, stage))
			{
				self.hud_damagefeedback setshader(#"damage_feedback_glow_orange", size_x, size_y);
				self thread kill_hitmarker_fade();
			}
			else
			{
				self.hud_damagefeedback setshader(#"damage_feedback", size_x, size_y);
				self.hud_damagefeedback.alpha = 1;
				self.hud_damagefeedback fadeovertime(1);
				self.hud_damagefeedback.alpha = 0;
			}
		}
	#/
}

/*
	Name: kill_hitmarker_fade
	Namespace: damagefeedback
	Checksum: 0x5BC19322
	Offset: 0x2030
	Size: 0x96
	Parameters: 0
	Flags: None
*/
function kill_hitmarker_fade()
{
	/#
		if(!isdefined(self.hud_damagefeedback))
		{
			return;
		}
		self notify(#"kill_hitmarker_fade");
		self endon(#"kill_hitmarker_fade", #"disconnect");
		self.hud_damagefeedback.alpha = 1;
		wait(0.25);
		self.hud_damagefeedback fadeovertime(0.3);
		self.hud_damagefeedback.alpha = 0;
	#/
}

/*
	Name: update_override
	Namespace: damagefeedback
	Checksum: 0xB689C0D
	Offset: 0x20D0
	Size: 0x156
	Parameters: 3
	Flags: None
*/
function update_override(icon, sound, additional_icon)
{
	if(!isplayer(self))
	{
		return;
	}
	self playlocalsound(sound);
	/#
		if(isdefined(self.hud_damagefeedback))
		{
			self.hud_damagefeedback setshader(icon, 24, 48);
			self.hud_damagefeedback.alpha = 1;
			self.hud_damagefeedback fadeovertime(1);
			self.hud_damagefeedback.alpha = 0;
		}
		if(isdefined(self.hud_damagefeedback_additional))
		{
			if(!isdefined(additional_icon))
			{
				self.hud_damagefeedback_additional.alpha = 0;
			}
			else
			{
				self.hud_damagefeedback_additional setshader(additional_icon, 24, 48);
				self.hud_damagefeedback_additional.alpha = 1;
				self.hud_damagefeedback_additional fadeovertime(1);
				self.hud_damagefeedback_additional.alpha = 0;
			}
		}
	#/
}

/*
	Name: dodamagefeedback
	Namespace: damagefeedback
	Checksum: 0x168F058E
	Offset: 0x2230
	Size: 0xCE
	Parameters: 4
	Flags: Linked
*/
function dodamagefeedback(weapon, einflictor, idamage, smeansofdeath)
{
	if(!isdefined(einflictor))
	{
		return false;
	}
	if(is_true(einflictor.nohitmarker))
	{
		return false;
	}
	if(level.allowhitmarkers == 0)
	{
		return false;
	}
	if(isdefined(smeansofdeath) && smeansofdeath == "MOD_MELEE_ASSASSINATE")
	{
		return false;
	}
	if(level.allowhitmarkers == 1)
	{
		if(isdefined(smeansofdeath) && isdefined(idamage))
		{
			if(istacticalhitmarker(einflictor, smeansofdeath, idamage))
			{
				return false;
			}
		}
	}
	return true;
}

/*
	Name: istacticalhitmarker
	Namespace: damagefeedback
	Checksum: 0x8D60F635
	Offset: 0x2308
	Size: 0x7C
	Parameters: 3
	Flags: Linked
*/
function istacticalhitmarker(weapon, smeansofdeath, idamage)
{
	if(weapons::is_grenade(weapon))
	{
		if("Smoke Grenade" == weapon.offhandclass)
		{
			if(smeansofdeath == "MOD_GRENADE_SPLASH")
			{
				return true;
			}
		}
		else if(idamage == 1)
		{
			return true;
		}
	}
	return false;
}

