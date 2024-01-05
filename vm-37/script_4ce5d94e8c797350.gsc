#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\gametypes\globallogic.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using script_2f560596a9a134ab;
#using scripts\zm_common\trials\zm_trial_disable_buys.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_score.gsc;
#using script_b9d273dc917ee1f;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\callbacks.gsc;
#using script_2de5679484626dc8;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\zombie.gsc;
#using script_7f6cd71c43c45c57;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace namespace_f0b43eb5;

/*
	Name: __init__system__
	Namespace: namespace_f0b43eb5
	Checksum: 0x7210ABB6
	Offset: 0x300
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_1c32fc6c324d3e66", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_f0b43eb5
	Checksum: 0x58E7FA19
	Offset: 0x348
	Size: 0x3B4
	Parameters: 0
	Flags: None
*/
function function_70a657d8()
{
	var_f41005d2 = getentarray("dac_trial_borders", "script_noteworthy");
	foreach(var_ad145a6e in var_f41005d2)
	{
		var_ad145a6e hide();
		var_ad145a6e notsolid();
	}
	if(!zm_utility::function_36e7b4a2())
	{
		return;
	}
	level.var_996e8a57 = zm_dac_challenges_hud::register();
	level.var_94b8d201 = [];
	level.var_572d28a8 = 0;
	level.var_d3a8f03b = 500;
	clientfield::register("scriptmover", "" + #"hash_653b5827e6fbe5f9", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_21f5fab6a3d22093", 1, 3, "int");
	clientfield::register("scriptmover", "" + #"hash_3dbe7851af541017", 1, 1, "int");
	clientfield::register("toplayer", "" + #"hash_31bea9cf1e6f76a0", 1, getminbitcountfornum(90), "int");
	clientfield::register("toplayer", "" + #"hash_216c75103f478671", 1, 4, "int");
	level flag::init("fl_challenges_active");
	level thread function_ca842288();
	level thread function_d60e999d();
	callback::on_connecting(&on_player_connect);
	callback::on_ai_killed(&on_ai_killed);
	callback::on_player_damage(&function_52588bfe);
	callback::on_bleedout(&function_2bf355c2);
	callback::on_disconnect(&function_2bf355c2);
	/#
		level thread function_37597f29();
	#/
	namespace_f999c142::init();
	level.var_857878e6 = &function_857878e6;
	level.var_8b7ab859 = 1000;
}

/*
	Name: function_ca842288
	Namespace: namespace_f0b43eb5
	Checksum: 0xB48B78B4
	Offset: 0x708
	Size: 0x58C
	Parameters: 0
	Flags: None
*/
function function_ca842288()
{
	create_challenge(#"hash_25a76ab3d0a73b03", 90, undefined, undefined, #"hash_77b13ae8ed00abd4");
	create_challenge(#"hash_1db5106df3c3c0c4", 90, undefined, undefined, #"hash_690b442afa94cfc1");
	create_challenge(#"hash_11b4177e0f079bb6", 90, undefined, undefined, #"hash_28ce1cda153c0a06");
	create_challenge(#"hash_684be81b5f03279e", 90, undefined, undefined, #"hash_519ac5a8b2182c8a", undefined, &function_c8657c04);
	create_challenge(#"hash_4b4ab7b6cf4d87c", 90, undefined, undefined, #"hash_70e7e390e97fd050");
	create_challenge(#"hash_4cc252a7609d289", 90, undefined, undefined, #"hash_798ece4e5fb19658", undefined, &function_8576b59f);
	create_challenge(#"hash_1bba6b368675561e", 90, undefined, undefined, #"hash_5c2c60f47f190bab");
	create_challenge(#"hash_62bc7c158375f1f2", 90, undefined, undefined, #"hash_726c7237d4e6659d");
	create_challenge(#"hash_63791b9ae55043b5", 90, undefined, undefined, #"hash_42edeeac988cb858", undefined, &function_8dbbbce8);
	create_challenge(#"hash_5ab9ff1ebbf2de17", 90, undefined, undefined, #"hash_361ed27b00fa1720");
	create_challenge(#"hash_4af69b7011fd4702", 90, undefined, undefined, #"hash_39a11eff01c71b70");
	level.var_2dffd020 = 0;
	level.var_107cca82 = getent("trial_terminal", "targetname");
	level.var_107cca82 setmodel(#"p9_fxanim_zm_gp_dac_xmodel");
	zm_utility::function_ca960904(level.var_107cca82);
	callback::function_74872db6(&function_5c5d14f2);
	level.var_f654fb0f = getentarray("reward_terminal", "targetname");
	array::run_all(level.var_f654fb0f, &function_e1dd6a53, #"off");
	var_f255c928 = level.var_107cca82 zm_unitrigger::create(&function_5586b077, 100, &function_6d69e771);
	var_f255c928.origin = var_f255c928.origin + vectorscale((0, 0, 1), 40);
	zm_unitrigger::unitrigger_force_per_player_triggers(level.var_107cca82.s_unitrigger, 1);
	level.var_107cca82.n_obj_id = zm_utility::function_4a4cf79a(#"hash_3632525bd692cfc8", level.var_107cca82);
	level.var_d2bdec66 = 0;
	level.var_edbe6a7f = [];
	level.var_edbe6a7f[0] = 0;
	level.var_edbe6a7f[1] = 0;
	level.var_edbe6a7f[2] = 0;
	level.var_edbe6a7f[3] = 0;
	level thread game_over();
	level flag::wait_till("start_zombie_round_logic");
	array::thread_all(getplayers(), &clientfield::set_to_player, "" + #"hash_216c75103f478671", 0);
	level flag::set("fl_challenges_active");
	level.var_107cca82 thread scene::play(#"p9_fxanim_zm_gp_dac_bundle", level.var_107cca82);
	function_111530dd();
}

/*
	Name: function_5c5d14f2
	Namespace: namespace_f0b43eb5
	Checksum: 0x4225AC98
	Offset: 0xCA0
	Size: 0x2B2
	Parameters: 0
	Flags: None
*/
function function_5c5d14f2()
{
	if(!isdefined(level.var_107cca82) || !isdefined(level.round_number))
	{
		return;
	}
	switch(level.round_number)
	{
		case 11:
		case 17:
		case 28:
		case 33:
		case 41:
		case 49:
		case 58:
		case 69:
		case 75:
		{
			level.var_107cca82 playloopsound(#"hash_6a9177839f11ac2c");
			if(level.var_107cca82 isattached(#"hash_1a9f65484a9fb8de", "tag_origin"))
			{
				level.var_107cca82 detach(#"hash_1a9f65484a9fb8de", "tag_origin");
			}
			if(!level.var_107cca82 isattached(#"hash_1a9f64484a9fb72b", "tag_origin"))
			{
				level.var_107cca82 attach(#"hash_1a9f64484a9fb72b", "tag_origin");
			}
			break;
		}
		default:
		{
			if(level.var_107cca82 isattached(#"hash_1a9f64484a9fb72b", "tag_origin"))
			{
				level.var_107cca82 detach(#"hash_1a9f64484a9fb72b", "tag_origin");
			}
			if(!level.var_107cca82 isattached(#"hash_1a9f65484a9fb8de", "tag_origin"))
			{
				level.var_107cca82 attach(#"hash_1a9f65484a9fb8de", "tag_origin");
			}
			level.var_107cca82 stoploopsound();
			break;
		}
	}
}

/*
	Name: on_player_connect
	Namespace: namespace_f0b43eb5
	Checksum: 0x1F8CDA8
	Offset: 0xF60
	Size: 0x7E
	Parameters: 0
	Flags: None
*/
function on_player_connect()
{
	if(!isbot(self) || getdvarint(#"hash_1ca7459bb8b222dd", 0))
	{
		self.var_642ed51a = undefined;
		self.var_94041ad9 = 0;
		self thread function_73143c19();
	}
	self.var_c8413949 = 0;
}

/*
	Name: function_857878e6
	Namespace: namespace_f0b43eb5
	Checksum: 0xD8AE0797
	Offset: 0xFE8
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_857878e6()
{
	self.var_94041ad9 = 1;
	self thread function_73143c19();
}

/*
	Name: function_73143c19
	Namespace: namespace_f0b43eb5
	Checksum: 0x348B5C67
	Offset: 0x1018
	Size: 0x4A2
	Parameters: 0
	Flags: None
*/
function function_73143c19()
{
	self endon(#"death");
	self.var_9e09931e = 0;
	level flag::wait_till("fl_challenges_active");
	n_index = self getentitynumber();
	if(isdefined(self.var_94041ad9) && !self.var_94041ad9)
	{
		if(!isdefined(level.var_edbe6a7f[n_index]) || level.var_edbe6a7f[n_index] != 0)
		{
			level.var_edbe6a7f[n_index] = 0;
			self thread function_2bf355c2();
		}
	}
	n_tribute = level.var_edbe6a7f[n_index];
	self namespace_f999c142::set_tribute(0);
	if(n_tribute > 0 || is_active())
	{
		util::wait_network_frame();
		if(n_tribute > 0)
		{
			self function_2bb8d916();
		}
		if(is_active())
		{
			self set_challenge_text(level.s_active_challenge.s_msg, (isdefined(level.s_active_challenge.var_4e0096cd) ? level.s_active_challenge.var_4e0096cd : level.var_2c5f83d));
			self function_b4759cf8();
		}
	}
	self.var_6b3806e8 = 0;
	self.var_207f01b0 = 0;
	if(!isdefined(self.var_642ed51a))
	{
		self.var_642ed51a = self function_662458e();
		var_2d7950ce = struct::get_array(self.var_642ed51a.target, "targetname");
		foreach(target in var_2d7950ce)
		{
			if(target.script_noteworthy === "loot_origin")
			{
				self.var_642ed51a.var_e3345cac = target;
				continue;
			}
			if(target.script_noteworthy === "reward_origin" && !isdefined(self.var_642ed51a.var_f693bf0b))
			{
				self.var_642ed51a.var_f693bf0b = util::spawn_model("tag_origin", target.origin, target.angles);
			}
		}
		namespace_f999c142::function_ab6fd86c(self, self.var_642ed51a);
	}
	switch(level.var_2dffd020)
	{
		case 0:
		{
			self clientfield::set_to_player("" + #"hash_216c75103f478671", 0);
			break;
		}
		case 3:
		case 4:
		{
			self clientfield::set_to_player("" + #"hash_216c75103f478671", 1);
			break;
		}
		case 1:
		{
			self clientfield::set_to_player("" + #"hash_216c75103f478671", 2);
			break;
		}
		case 2:
		{
			self clientfield::set_to_player("" + #"hash_216c75103f478671", 3);
			break;
		}
	}
}

/*
	Name: function_111530dd
	Namespace: namespace_f0b43eb5
	Checksum: 0x725DEDB3
	Offset: 0x14C8
	Size: 0x2B8
	Parameters: 0
	Flags: None
*/
function function_111530dd()
{
	switch(level.var_d2bdec66)
	{
		case 0:
		{
			var_7b667696 = 60;
			break;
		}
		case 1:
		{
			var_7b667696 = 40;
			break;
		}
		case 2:
		{
			var_7b667696 = 20;
			break;
		}
		default:
		{
			var_7b667696 = 0;
			break;
		}
	}
	n_round_number = zm_utility::get_round_number();
	if(getdvarint(#"hash_1ca7459bb8b222dd", 0) || (level.var_d2bdec66 < 3 && n_round_number >= 5 && math::cointoss(var_7b667696)))
	{
		level.var_2dffd020 = 2;
		foreach(player in getplayers())
		{
			if(player function_34ebccf9())
			{
				continue;
			}
			player clientfield::set_to_player("" + #"hash_216c75103f478671", 3);
		}
	}
	else
	{
		level.var_2dffd020 = 1;
		foreach(player in getplayers())
		{
			if(player function_34ebccf9())
			{
				continue;
			}
			player clientfield::set_to_player("" + #"hash_216c75103f478671", 2);
		}
	}
}

/*
	Name: function_662458e
	Namespace: namespace_f0b43eb5
	Checksum: 0xD8D0208
	Offset: 0x1788
	Size: 0x210
	Parameters: 0
	Flags: None
*/
function function_662458e()
{
	self endon(#"disconnect");
	if(!isdefined(self.teammateindex) || self.teammateindex <= 0 || self.teammateindex > 4)
	{
		self waittill(#"hash_606be34c407533f6");
	}
	if(isdefined(self.teammateindex))
	{
		n_index = self.teammateindex - 1;
	}
	else
	{
		n_index = self getentitynumber();
	}
	var_3cbf62f9 = level.var_f654fb0f[n_index];
	if(!isdefined(var_3cbf62f9))
	{
		/#
			println(("" + n_index) + "");
		#/
		var_3cbf62f9 = level.var_f654fb0f[3];
	}
	switch(n_index)
	{
		case 0:
		default:
		{
			var_3cbf62f9.str_color = #"purple";
			break;
		}
		case 1:
		{
			var_3cbf62f9.str_color = #"orange";
			break;
		}
		case 2:
		{
			var_3cbf62f9.str_color = #"green";
			break;
		}
		case 3:
		{
			var_3cbf62f9.str_color = #"blue";
			break;
		}
	}
	var_3cbf62f9 function_e1dd6a53(#"hash_60d06afd31a5f9f8");
	var_3cbf62f9 zm_utility::function_ca960904(var_3cbf62f9);
	return var_3cbf62f9;
}

/*
	Name: function_e1dd6a53
	Namespace: namespace_f0b43eb5
	Checksum: 0x3B96AFB7
	Offset: 0x19A0
	Size: 0x36A
	Parameters: 1
	Flags: None
*/
function function_e1dd6a53(state)
{
	if(!isdefined(state))
	{
		state = #"off";
	}
	self detachall();
	self stoploopsound();
	if(state == "off")
	{
		self attach(#"p9_zm_ndu_trial_terminal_01_screen", "tag_origin");
		self stoploopsound();
	}
	else
	{
		if(state == #"hash_60d06afd31a5f9f8")
		{
			switch(self.str_color)
			{
				case "purple":
				{
					self attach(#"hash_43292371d31fedb3", "tag_origin");
					break;
				}
				case "orange":
				{
					self attach(#"hash_50312a908be08ab7", "tag_origin");
					break;
				}
				case "green":
				{
					self attach(#"hash_2a42c45bfee6fa40", "tag_origin");
					break;
				}
				case "blue":
				{
					self attach(#"hash_7200223e9e420ef1", "tag_origin");
					break;
				}
			}
		}
		else
		{
			switch(self.str_color)
			{
				case "purple":
				{
					self attach(#"hash_2650753cfce243b4", "tag_origin");
					self playloopsound("amb_dac_happy_happy");
					break;
				}
				case "orange":
				{
					self attach(#"hash_365ca0e0327ab1e0", "tag_origin");
					self playloopsound("amb_dac_happy_happy");
					break;
				}
				case "green":
				{
					self attach(#"hash_1759c27356868ed1", "tag_origin");
					self playloopsound("amb_dac_happy_happy");
					break;
				}
				case "blue":
				{
					self attach(#"hash_63e150d3e5e0d45e", "tag_origin");
					self playloopsound("amb_dac_happy_happy");
					break;
				}
			}
		}
	}
}

/*
	Name: function_2bb8d916
	Namespace: namespace_f0b43eb5
	Checksum: 0xBA0893C4
	Offset: 0x1D18
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function function_2bb8d916()
{
	self namespace_f999c142::function_ae2c0ba5();
}

/*
	Name: function_2ed00fa6
	Namespace: namespace_f0b43eb5
	Checksum: 0x5AA31FFE
	Offset: 0x1D40
	Size: 0xAC
	Parameters: 1
	Flags: None
*/
function function_2ed00fa6(reward_terminal)
{
	a_players = getplayers();
	foreach(player in a_players)
	{
		if(player.var_642ed51a === reward_terminal)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_52588bfe
	Namespace: namespace_f0b43eb5
	Checksum: 0xF019EBE4
	Offset: 0x1DF8
	Size: 0xB4
	Parameters: 1
	Flags: None
*/
function function_52588bfe(params)
{
	self endon(#"end_game");
	self.var_d5e64932 = gettime() / 1000;
	amount = params.idamage;
	if(isdefined(amount))
	{
		if(is_challenge_active(#"hash_11b4177e0f079bb6") && params.eattacker.team === level.zombie_team)
		{
			self thread function_673cba18(#"hash_11b4177e0f079bb6", amount);
		}
	}
}

/*
	Name: on_ai_killed
	Namespace: namespace_f0b43eb5
	Checksum: 0x6BFDA378
	Offset: 0x1EB8
	Size: 0x55C
	Parameters: 1
	Flags: None
*/
function on_ai_killed(s_params)
{
	e_player = s_params.eattacker;
	str_hit_loc = s_params.shitloc;
	weapon = s_params.weapon;
	means_of_death = s_params.smeansofdeath;
	if(isplayer(e_player))
	{
		if(is_challenge_active(#"hash_25a76ab3d0a73b03"))
		{
			if(means_of_death == "MOD_MELEE" || means_of_death == "MOD_MELEE_WEAPON_BUTT" || means_of_death == "MOD_MELEE_ASSASSINATE")
			{
				e_player namespace_f999c142::function_53a333a8(#"hash_25a76ab3d0a73b03");
			}
		}
		else
		{
			if(is_challenge_active(#"hash_1db5106df3c3c0c4"))
			{
				if(weapon.inventorytype === #"offhand")
				{
					e_player namespace_f999c142::function_53a333a8(#"hash_1db5106df3c3c0c4");
				}
			}
			else
			{
				if(is_challenge_active(#"hash_4b4ab7b6cf4d87c") && zm_utility::is_headshot(weapon, str_hit_loc, means_of_death))
				{
					e_player namespace_f999c142::function_53a333a8(#"hash_4b4ab7b6cf4d87c");
				}
				else
				{
					if(is_challenge_active(#"hash_7cb657a5f657cbbe") || is_challenge_active(#"hash_756817dc68da56e9") || is_challenge_active(#"hash_2272d4303498d425") || is_challenge_active(#"hash_795ccb5ead8f853e") || is_challenge_active(#"hash_7e17eba37f893fb4") || is_challenge_active(#"hash_7f0be97960376eb0") || is_challenge_active(#"hash_aee5cb4bd88c4ee"))
					{
						level thread function_5e882c6f(e_player, self.origin);
					}
					else
					{
						if(is_challenge_active(#"hash_1bba6b368675561e"))
						{
							if(e_player getstance() == "crouch")
							{
								e_player namespace_f999c142::function_53a333a8(#"hash_1bba6b368675561e", level.var_8b7ab859 * 0.01);
							}
						}
						else
						{
							if(is_challenge_active(#"hash_62bc7c158375f1f2"))
							{
								if(!e_player playerads() && means_of_death !== "MOD_MELEE" && means_of_death !== "MOD_MELEE_WEAPON_BUTT")
								{
									e_player namespace_f999c142::function_53a333a8(#"hash_62bc7c158375f1f2", level.var_8b7ab859 * 0.01);
								}
							}
							else
							{
								if(is_challenge_active(#"hash_5ab9ff1ebbf2de17"))
								{
									if(distance2dsquared(e_player.origin, self.origin) <= 122500)
									{
										e_player namespace_f999c142::function_53a333a8(#"hash_5ab9ff1ebbf2de17", level.var_8b7ab859 * 0.02);
									}
								}
								else if(is_challenge_active(#"hash_4af69b7011fd4702"))
								{
									if(e_player === level.chopper_gunner.owner || (isdefined(e_player.origin) && isdefined(self.origin) && e_player.origin[2] > (self.origin[2] + 50)))
									{
										e_player namespace_f999c142::function_53a333a8(#"hash_4af69b7011fd4702", level.var_8b7ab859 * 0.02);
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

/*
	Name: create_challenge
	Namespace: namespace_f0b43eb5
	Checksum: 0x5C9801E
	Offset: 0x2420
	Size: 0x260
	Parameters: 8
	Flags: None
*/
function create_challenge(var_38f795c7, var_6346e7b, zonenames, weaponname, var_e09af826, var_3df4e085, var_205fe3e6, func_end)
{
	s_challenge = {#hash_3e17832:func_end, #hash_c376bcd5:var_205fe3e6, #hash_3df4e085:var_3df4e085, #hash_8edbca81:weaponname, #s_msg:var_e09af826, #n_count:0, #hash_6346e7b:var_6346e7b, #hash_4427ebb1:zonenames, #str_name:var_38f795c7};
	if(!isdefined(level.var_94b8d201))
	{
		level.var_94b8d201 = [];
	}
	else if(!isarray(level.var_94b8d201))
	{
		level.var_94b8d201 = array(level.var_94b8d201);
	}
	if(!isinarray(level.var_94b8d201, s_challenge))
	{
		level.var_94b8d201[level.var_94b8d201.size] = s_challenge;
	}
	level.var_94b8d201 = array::randomize(level.var_94b8d201);
	var_f8f0b389 = struct::get(var_3df4e085);
	if(isdefined(var_f8f0b389.target))
	{
		hidemiscmodels(var_f8f0b389.target);
		var_77cd2496 = getentarray(var_f8f0b389.target, "targetname");
		array::run_all(var_77cd2496, &hide);
		array::run_all(var_77cd2496, &notsolid);
	}
	return s_challenge;
}

/*
	Name: function_65390598
	Namespace: namespace_f0b43eb5
	Checksum: 0x6C366432
	Offset: 0x2688
	Size: 0x7C
	Parameters: 1
	Flags: None
*/
function function_65390598(player)
{
	if(player zm_score::can_player_purchase(level.var_d3a8f03b))
	{
		player globallogic::function_d96c031e();
	}
	else if(self zm_utility::function_4f593819(player))
	{
		player globallogic::function_d1924f29(#"hash_6e3ae7967dc5d414");
	}
}

/*
	Name: function_5586b077
	Namespace: namespace_f0b43eb5
	Checksum: 0xB6566E9B
	Offset: 0x2710
	Size: 0x206
	Parameters: 1
	Flags: None
*/
function function_5586b077(e_player)
{
	if(is_true(e_player.var_a77f845b))
	{
		e_player globallogic::function_d96c031e();
		return false;
	}
	if(is_true(e_player.var_11507a67))
	{
		var_9137c22c = e_player zm_utility::function_d6046228(#"hash_62ce0492bff3907b", #"hash_4be3e681b9e66331");
		self sethintstringforplayer(e_player, var_9137c22c);
		self function_65390598(e_player);
		return true;
	}
	if(level.var_2dffd020 == 0)
	{
		self sethintstringforplayer(e_player, #"hash_b81e285f17abe6");
		e_player globallogic::function_d96c031e();
		return true;
	}
	if(level.var_2dffd020 == 1 || level.var_2dffd020 == 2)
	{
		if(level.var_2dffd020 == 2)
		{
			self sethintstringforplayer(e_player, #"hash_1fbfa2022387011d", level.var_d3a8f03b);
		}
		else
		{
			self sethintstringforplayer(e_player, #"hash_1d71f5286d92646", level.var_d3a8f03b);
		}
		self function_65390598(e_player);
		return true;
	}
	e_player globallogic::function_d96c031e();
	return false;
}

/*
	Name: function_6d69e771
	Namespace: namespace_f0b43eb5
	Checksum: 0xBB3C2172
	Offset: 0x2920
	Size: 0x1BC
	Parameters: 0
	Flags: None
*/
function function_6d69e771()
{
	self endon(#"death");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"trigger");
		e_player = waitresult.activator;
		if(!zm_utility::can_use(e_player, 0))
		{
			continue;
		}
		if(zm_trial_disable_buys::is_active())
		{
			continue;
		}
		if(e_player function_34ebccf9())
		{
			e_player notify(#"hash_811de57ec6a72cd");
			e_player function_bc82f900(#"zm_interact_rumble");
		}
		else if(level.var_2dffd020 == 1 || level.var_2dffd020 == 2)
		{
			if(e_player zm_score::can_player_purchase(level.var_d3a8f03b))
			{
				level.var_107cca82 playsound(#"hash_564affa7c572ff4c");
				e_player function_bc82f900(#"zm_interact_rumble");
				e_player thread zm_score::minus_to_player_score(level.var_d3a8f03b);
				level thread start_challenge(e_player);
				level.var_c6ab748f = 0;
			}
		}
	}
}

/*
	Name: start_challenge
	Namespace: namespace_f0b43eb5
	Checksum: 0x7990EDBF
	Offset: 0x2AE8
	Size: 0x134
	Parameters: 1
	Flags: None
*/
function start_challenge(e_player)
{
	if(isdefined(level.s_active_challenge))
	{
		stop_challenge();
		waitframe(1);
	}
	if(isdefined(e_player))
	{
		s_challenge = get_challenge(e_player);
	}
	if(!isdefined(s_challenge))
	{
		return;
	}
	waitframe(1);
	foreach(player in getplayers())
	{
		player thread function_34b03961(1);
	}
	level thread function_8f0594cb(s_challenge);
	level thread function_445c5438();
}

/*
	Name: stop_challenge
	Namespace: namespace_f0b43eb5
	Checksum: 0x31C2CFF5
	Offset: 0x2C28
	Size: 0x1BE
	Parameters: 1
	Flags: None
*/
function stop_challenge(var_d46ce3db)
{
	if(!isdefined(var_d46ce3db))
	{
		var_d46ce3db = 0;
	}
	level thread function_23853783();
	stop_timer();
	if(isdefined(level.s_active_challenge.var_3e17832))
	{
		level [[level.s_active_challenge.var_3e17832]]();
	}
	wait(0.1);
	level.s_active_challenge = undefined;
	foreach(player in getplayers())
	{
		player thread function_7e30f24c();
		player playlocalsound(#"hash_7645f386d2902a9c");
		if(var_d46ce3db)
		{
			player thread function_34b03961();
			continue;
		}
		player clientfield::set_to_player("" + #"hash_216c75103f478671", 2);
	}
	function_111530dd();
	level notify(#"hash_53f7c8af221e6090");
	waitframe(1);
}

/*
	Name: function_34ebccf9
	Namespace: namespace_f0b43eb5
	Checksum: 0x18B60952
	Offset: 0x2DF0
	Size: 0x40
	Parameters: 0
	Flags: None
*/
function function_34ebccf9()
{
	if(is_true(self.var_11507a67) || is_true(self.var_a77f845b))
	{
		return true;
	}
	return false;
}

/*
	Name: function_34b03961
	Namespace: namespace_f0b43eb5
	Checksum: 0xB7DBF509
	Offset: 0x2E38
	Size: 0x596
	Parameters: 1
	Flags: None
*/
function function_34b03961(var_851cec80)
{
	if(!isdefined(var_851cec80))
	{
		var_851cec80 = 0;
	}
	self endon(#"disconnect");
	if(self function_34ebccf9())
	{
		return;
	}
	if(var_851cec80)
	{
		self clientfield::set_to_player("" + #"hash_216c75103f478671", 1);
		return;
	}
	if(level.var_2dffd020 === 4 && isdefined(self.var_207f01b0) && self.var_207f01b0 >= 0.2 && self.var_c8413949 < 3)
	{
		var_d5fa8477 = namespace_4abf1500::function_2bcfd899(#"hash_71c51f24f7f3037d", self);
		if(isdefined(var_d5fa8477))
		{
			var_19a3087c = getscriptbundle(var_d5fa8477);
		}
		if(!isdefined(var_19a3087c))
		{
			if(level.var_2dffd020 === 3 || level.var_2dffd020 === 4)
			{
				self clientfield::set_to_player("" + #"hash_216c75103f478671", 1);
			}
			else
			{
				if(level.var_2dffd020 == 2)
				{
					self clientfield::set_to_player("" + #"hash_216c75103f478671", 3);
				}
				else
				{
					self clientfield::set_to_player("" + #"hash_216c75103f478671", 2);
				}
			}
			return;
		}
		self.var_11507a67 = 1;
		self.var_207f01b0 = 0;
		switch(var_19a3087c.var_9be0526e)
		{
			case "document":
			{
				var_3e22312c = 4;
				var_2a2ba09f = 5;
				break;
			}
			case "audiolog":
			{
				var_3e22312c = 6;
				var_2a2ba09f = 7;
				break;
			}
			case "hash_20ea75a25d912949":
			{
				var_3e22312c = 8;
				var_2a2ba09f = 9;
				break;
			}
		}
		self clientfield::set_to_player("" + #"hash_216c75103f478671", var_3e22312c);
		self function_c21d733d(1);
		self waittill(#"hash_811de57ec6a72cd");
		self function_c21d733d(0);
		self.var_11507a67 = undefined;
		self.var_a77f845b = 1;
		self clientfield::set_to_player("" + #"hash_216c75103f478671", var_2a2ba09f);
		wait(0.5);
		var_49b86cc = gettime();
		self.var_c8413949++;
		self namespace_4abf1500::collect_intel(var_d5fa8477, undefined, level.var_107cca82);
		var_ca10d547 = gettime() - var_49b86cc;
		if(var_ca10d547 < 8000)
		{
			wait((float(8000 - var_ca10d547)) / 1000);
		}
		self.var_a77f845b = undefined;
		if(level.var_2dffd020 === 3 || level.var_2dffd020 === 4)
		{
			self clientfield::set_to_player("" + #"hash_216c75103f478671", 1);
		}
		else
		{
			if(level.var_2dffd020 == 2)
			{
				self clientfield::set_to_player("" + #"hash_216c75103f478671", 3);
			}
			else
			{
				self clientfield::set_to_player("" + #"hash_216c75103f478671", 2);
			}
		}
	}
	else
	{
		if(level.var_2dffd020 === 3 || level.var_2dffd020 === 4)
		{
			self clientfield::set_to_player("" + #"hash_216c75103f478671", 1);
		}
		else
		{
			if(level.var_2dffd020 === 2)
			{
				self clientfield::set_to_player("" + #"hash_216c75103f478671", 3);
			}
			else
			{
				self clientfield::set_to_player("" + #"hash_216c75103f478671", 2);
			}
		}
	}
	self.var_207f01b0 = 0;
}

/*
	Name: function_8f0594cb
	Namespace: namespace_f0b43eb5
	Checksum: 0xA64048CE
	Offset: 0x33D8
	Size: 0x274
	Parameters: 1
	Flags: None
*/
function function_8f0594cb(s_challenge)
{
	level endon(#"hash_53f7c8af221e6090");
	if(level.var_2dffd020 == 2)
	{
		level.var_2dffd020 = 4;
		level.var_d2bdec66++;
		/#
			iprintlnbold(("" + level.var_d2bdec66) + "");
		#/
	}
	else
	{
		level.var_2dffd020 = 3;
	}
	level.s_active_challenge = s_challenge;
	level.var_62ecc169 = float(gettime()) / 1000;
	foreach(player in getplayers())
	{
		player playlocalsound(#"hash_747fc6d3b1a2412a");
		player.var_6b3806e8 = 0;
		player thread set_challenge_text(level.s_active_challenge.s_msg);
	}
	if(isdefined(level.s_active_challenge.var_c376bcd5))
	{
		level thread [[level.s_active_challenge.var_c376bcd5]]();
	}
	n_timer = s_challenge.var_6346e7b + 1;
	start_timer(n_timer);
	var_a35366e7 = max(n_timer - 10, 0);
	wait(var_a35366e7);
	level thread function_23853783(1);
	level function_ea45ba4c();
	stop_challenge(1);
}

/*
	Name: function_ea45ba4c
	Namespace: namespace_f0b43eb5
	Checksum: 0x32730B01
	Offset: 0x3658
	Size: 0xE2
	Parameters: 1
	Flags: None
*/
function function_ea45ba4c(n_time_remaining)
{
	if(!isdefined(n_time_remaining))
	{
		n_time_remaining = 10;
	}
	level endon(#"hash_53f7c8af221e6090");
	while(n_time_remaining > 0)
	{
		if(n_time_remaining == 1)
		{
			array::run_all(getplayers(), &playlocalsound, #"hash_5952b2eecab41e38");
		}
		else
		{
			array::run_all(getplayers(), &playlocalsound, #"hash_4474c2da74d7cdb9");
		}
		n_time_remaining--;
		wait(1);
	}
}

/*
	Name: function_f51adffa
	Namespace: namespace_f0b43eb5
	Checksum: 0x25754BB9
	Offset: 0x3748
	Size: 0x258
	Parameters: 0
	Flags: None
*/
function function_f51adffa()
{
	level.var_be2ff8ca = zm_utility::function_d7db256e(level.s_active_challenge.var_3df4e085, #"hash_17223bc71432a43e", 1, &function_de2e76c4);
	level.s_active_challenge.var_ad12d5bf = level.s_active_challenge.var_4427ebb1;
	if(!isdefined(level.s_active_challenge.var_ad12d5bf))
	{
		level.s_active_challenge.var_ad12d5bf = [];
	}
	else if(!isarray(level.s_active_challenge.var_ad12d5bf))
	{
		level.s_active_challenge.var_ad12d5bf = array(level.s_active_challenge.var_ad12d5bf);
	}
	level.var_4427ebb1 = level.s_active_challenge.var_ad12d5bf[0];
	/#
		assert(isdefined(level.var_aa3b88c5), "");
	#/
	level.var_2c5f83d = [[level.var_aa3b88c5]](level.var_4427ebb1);
	/#
		iprintlnbold("");
	#/
	foreach(player in getplayers())
	{
		player thread function_d7362784(level.s_active_challenge.str_name, level.s_active_challenge.var_ad12d5bf, undefined);
		player thread set_challenge_text(level.s_active_challenge.s_msg, level.var_2c5f83d);
	}
}

/*
	Name: function_d7362784
	Namespace: namespace_f0b43eb5
	Checksum: 0x557E3F50
	Offset: 0x39A8
	Size: 0x26E
	Parameters: 3
	Flags: None
*/
function function_d7362784(var_38f795c7, a_str_zone_names, vol_override)
{
	if(!isdefined(vol_override))
	{
		vol_override = undefined;
	}
	self notify(#"hash_26da5491f8ef4fd8");
	self endon(#"hash_26da5491f8ef4fd8", #"death");
	self.var_95cfa01d = 1;
	self.var_b05f25ad = 0;
	self function_fcd5d27c(0);
	while(is_challenge_active(var_38f795c7))
	{
		if(isdefined(vol_override))
		{
			if(!self.var_b05f25ad && self istouching(vol_override))
			{
				self.var_b05f25ad = 1;
				self function_fcd5d27c(1);
			}
			else if(self.var_b05f25ad && !self istouching(vol_override))
			{
				self.var_b05f25ad = 0;
				self function_fcd5d27c(0);
			}
		}
		else
		{
			if(!self.var_b05f25ad && self zm_zonemgr::is_player_in_zone(a_str_zone_names, 0))
			{
				self.var_b05f25ad = 1;
				self function_fcd5d27c(1);
			}
			else if(self.var_b05f25ad && !self zm_zonemgr::is_player_in_zone(a_str_zone_names, 0))
			{
				self.var_b05f25ad = 0;
				self function_fcd5d27c(0);
			}
		}
		if(is_true(self.var_95cfa01d) && is_true(self.var_b05f25ad))
		{
			self.var_f94035ca = float(gettime()) / 1000;
		}
		waitframe(1);
	}
	self.var_95cfa01d = 0;
	self.var_b05f25ad = 0;
}

/*
	Name: function_9742c28f
	Namespace: namespace_f0b43eb5
	Checksum: 0x67CD636F
	Offset: 0x3C20
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function function_9742c28f()
{
	zm_utility::function_b1f3be5c(level.var_be2ff8ca, level.s_active_challenge.var_3df4e085);
}

/*
	Name: function_8dbbbce8
	Namespace: namespace_f0b43eb5
	Checksum: 0x82EB4027
	Offset: 0x3C58
	Size: 0x98
	Parameters: 0
	Flags: None
*/
function function_8dbbbce8()
{
	foreach(player in getplayers())
	{
		player thread function_9ffc76ea(#"hash_2f07cdc4c8fbe9d5");
	}
}

/*
	Name: function_8576b59f
	Namespace: namespace_f0b43eb5
	Checksum: 0x72297766
	Offset: 0x3CF8
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_8576b59f()
{
	level thread function_9ffc76ea(#"board_repaired");
}

/*
	Name: function_cbc84593
	Namespace: namespace_f0b43eb5
	Checksum: 0x8F5A4B47
	Offset: 0x3D28
	Size: 0xAE
	Parameters: 0
	Flags: None
*/
function function_cbc84593()
{
	level endon(#"hash_53f7c8af221e6090", #"disconnect");
	while(true)
	{
		if(weapons::getbaseweapon(self.currentweapon) == getweapon(level.s_active_challenge.var_8edbca81))
		{
			self function_fcd5d27c(1);
		}
		else
		{
			self function_fcd5d27c(0);
		}
		waitframe(1);
	}
}

/*
	Name: function_1d60215
	Namespace: namespace_f0b43eb5
	Checksum: 0xD59AC143
	Offset: 0x3DE0
	Size: 0x3FC
	Parameters: 0
	Flags: None
*/
function function_1d60215()
{
	level endon(#"hash_53f7c8af221e6090");
	level.s_active_challenge.var_ad12d5bf = level.s_active_challenge.var_4427ebb1;
	if(!isdefined(level.s_active_challenge.var_ad12d5bf))
	{
		level.s_active_challenge.var_ad12d5bf = [];
	}
	else if(!isarray(level.s_active_challenge.var_ad12d5bf))
	{
		level.s_active_challenge.var_ad12d5bf = array(level.s_active_challenge.var_ad12d5bf);
	}
	level.var_4427ebb1 = level.s_active_challenge.var_ad12d5bf[0];
	/#
		assert(isdefined(level.var_aa3b88c5), "");
	#/
	level.var_2c5f83d = [[level.var_aa3b88c5]](level.s_active_challenge.var_4427ebb1);
	vol_override = getent("dac_trial_volume_" + level.var_4427ebb1, "targetname");
	foreach(player in getplayers())
	{
		player thread function_d7362784(level.s_active_challenge.str_name, level.s_active_challenge.var_ad12d5bf, vol_override);
		player thread set_challenge_text(level.s_active_challenge.s_msg, (isdefined(level.s_active_challenge.var_4e0096cd) ? level.s_active_challenge.var_4e0096cd : level.var_2c5f83d));
	}
	level.var_acc31847 = zm_utility::function_d7db256e(level.s_active_challenge.var_3df4e085, #"hash_17223bc71432a43e", 1, &function_de2e76c4);
	while(true)
	{
		n_time = gettime() / 1000;
		foreach(player in getplayers())
		{
			if(!isdefined(player.var_f94035ca))
			{
				player.var_f94035ca = 0;
			}
			dt = n_time - player.var_f94035ca;
			if(is_true(player.var_b05f25ad) && dt <= 2)
			{
				player namespace_f999c142::function_53a333a8(level.s_active_challenge.str_name);
				continue;
			}
			player.var_f94035ca = n_time;
		}
		wait(2);
	}
}

/*
	Name: function_6be352fc
	Namespace: namespace_f0b43eb5
	Checksum: 0x9E8F0DF8
	Offset: 0x41E8
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function function_6be352fc()
{
	zm_utility::function_b1f3be5c(level.var_acc31847, level.s_active_challenge.var_3df4e085);
}

/*
	Name: function_5e882c6f
	Namespace: namespace_f0b43eb5
	Checksum: 0x8E0AD4C6
	Offset: 0x4220
	Size: 0xBC
	Parameters: 2
	Flags: None
*/
function function_5e882c6f(e_player, var_2b625b6e)
{
	str_zone = zm_zonemgr::get_zone_from_position(var_2b625b6e);
	if(isdefined(str_zone))
	{
		/#
			assert(isdefined(level.var_aa3b88c5), "");
		#/
		var_c8470518 = [[level.var_aa3b88c5]](str_zone);
		if(level.var_2c5f83d === var_c8470518)
		{
			e_player namespace_f999c142::function_53a333a8(level.s_active_challenge.str_name);
		}
	}
}

/*
	Name: function_de2e76c4
	Namespace: namespace_f0b43eb5
	Checksum: 0x4C81FE7B
	Offset: 0x42E8
	Size: 0x36
	Parameters: 2
	Flags: Private
*/
function private function_de2e76c4(v_origin_or_ent, params)
{
	if(is_true(self.var_b05f25ad))
	{
		return false;
	}
	return true;
}

/*
	Name: function_673cba18
	Namespace: namespace_f0b43eb5
	Checksum: 0x1FE174EA
	Offset: 0x4328
	Size: 0x17C
	Parameters: 2
	Flags: None
*/
function function_673cba18(var_38f795c7, n_damage)
{
	self notify("3e9eb6c6008da8e4");
	self endon("3e9eb6c6008da8e4");
	self endon(#"death");
	level endon(#"hash_53f7c8af221e6090");
	waitframe(1);
	n_start_health = self.health;
	while(is_challenge_active(var_38f795c7))
	{
		if(self laststand::player_is_in_laststand())
		{
			break;
		}
		if(self.sessionstate === "spectator")
		{
			break;
		}
		if(self.health == max(self.maxhealth, self.var_66cb03ad))
		{
			self namespace_f999c142::function_53a333a8(level.s_active_challenge.str_name, undefined, n_damage);
			break;
		}
		else
		{
			n_delta = self.health - n_start_health;
			if(n_delta >= 50)
			{
				self namespace_f999c142::function_53a333a8(level.s_active_challenge.str_name, undefined, n_damage);
				n_start_health = n_start_health + 50;
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_c8657c04
	Namespace: namespace_f0b43eb5
	Checksum: 0xFA26B2BB
	Offset: 0x44B0
	Size: 0x15C
	Parameters: 0
	Flags: None
*/
function function_c8657c04()
{
	level endon(#"hash_53f7c8af221e6090");
	var_53a794b0 = gettime() / 1000;
	while(true)
	{
		wait(2);
		n_time = gettime() / 1000;
		foreach(player in getplayers())
		{
			b_reward = 0;
			if(!isdefined(player.var_d5e64932))
			{
				b_reward = 1;
			}
			else
			{
				n_time_since_last_damage = n_time - player.var_d5e64932;
				if(n_time_since_last_damage > 15)
				{
					b_reward = 1;
				}
			}
			if(b_reward)
			{
				player namespace_f999c142::function_53a333a8(level.s_active_challenge.str_name);
			}
		}
		var_53a794b0 = n_time;
	}
}

/*
	Name: function_9ffc76ea
	Namespace: namespace_f0b43eb5
	Checksum: 0xBEF600FF
	Offset: 0x4618
	Size: 0x200
	Parameters: 1
	Flags: None
*/
function function_9ffc76ea(str_notify)
{
	level endon(#"hash_53f7c8af221e6090");
	if(isplayer(self))
	{
		self endon(#"disconnect");
	}
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(str_notify);
		if(isplayer(self))
		{
			e_player = self;
		}
		else
		{
			if(isdefined(waitresult.e_player))
			{
				e_player = waitresult.e_player;
			}
			else
			{
				e_player = waitresult.player;
			}
		}
		var_f6e9f6bf = 1;
		if(is_challenge_active(#"hash_63791b9ae55043b5"))
		{
			switch(waitresult.scoreevent)
			{
				case "multikillstreak_5_zm":
				{
					var_41f9c5ff = 100;
					break;
				}
				case "multikillstreak_10_zm":
				{
					var_41f9c5ff = 125;
					break;
				}
				case "multikillstreak_15_zm":
				{
					var_41f9c5ff = 150;
					break;
				}
				case "multikillstreak_20_zm":
				{
					var_41f9c5ff = 200;
					break;
				}
				case "multikillstreak_25_zm":
				{
					var_41f9c5ff = 300;
					break;
				}
				default:
				{
					break;
				}
			}
			if(!isdefined(var_41f9c5ff))
			{
				continue;
			}
		}
		e_player namespace_f999c142::function_53a333a8(level.s_active_challenge.str_name, var_41f9c5ff, var_f6e9f6bf);
	}
}

/*
	Name: function_d60e999d
	Namespace: namespace_f0b43eb5
	Checksum: 0xF4FF8F4F
	Offset: 0x4820
	Size: 0x78
	Parameters: 0
	Flags: None
*/
function function_d60e999d()
{
	level endon(#"end_game");
	level flag::wait_till("start_zombie_round_logic");
	function_9e7dc4fb();
	while(true)
	{
		level waittill(#"end_of_round");
		function_9e7dc4fb();
	}
}

/*
	Name: function_9e7dc4fb
	Namespace: namespace_f0b43eb5
	Checksum: 0x45841337
	Offset: 0x48A0
	Size: 0xA8
	Parameters: 0
	Flags: None
*/
function function_9e7dc4fb()
{
	n_round_number = zm_utility::get_round_number();
	if(n_round_number >= 10)
	{
		level.var_572d28a8--;
		if(level.var_572d28a8 <= 0)
		{
			level.var_d3a8f03b = int(level.var_d3a8f03b + 500);
			level.var_572d28a8 = 5;
		}
	}
	else
	{
		level.var_d3a8f03b = 500;
	}
	level.var_48442709 = 500;
}

/*
	Name: is_challenge_active
	Namespace: namespace_f0b43eb5
	Checksum: 0xA38AAE90
	Offset: 0x4950
	Size: 0x42
	Parameters: 1
	Flags: None
*/
function is_challenge_active(var_38f795c7)
{
	if(isdefined(level.s_active_challenge) && level.s_active_challenge.str_name === var_38f795c7)
	{
		return true;
	}
	return false;
}

/*
	Name: get_challenge
	Namespace: namespace_f0b43eb5
	Checksum: 0xC0E5F6E4
	Offset: 0x49A0
	Size: 0x3B8
	Parameters: 1
	Flags: None
*/
function get_challenge(e_player)
{
	var_99d6574b = undefined;
	var_52da6798 = level.var_94b8d201.size;
	var_881d9045 = 1000;
	var_1211943c = arraycopy(level.var_94b8d201);
	/#
		if(isdefined(level.var_acf50b77))
		{
			var_acf50b77 = level.var_acf50b77;
			level.var_acf50b77 = undefined;
			foreach(s_challenge in var_1211943c)
			{
				if(s_challenge.str_name === var_acf50b77)
				{
					return s_challenge;
				}
			}
		}
	#/
	foreach(s_challenge in var_1211943c)
	{
		if(isdefined(s_challenge.var_4427ebb1))
		{
			if(!isarray(s_challenge.var_4427ebb1))
			{
				if(zm_zonemgr::zone_is_enabled(s_challenge.var_4427ebb1))
				{
					if(s_challenge.n_count < var_881d9045)
					{
						var_881d9045 = s_challenge.n_count;
						var_99d6574b = s_challenge;
					}
				}
			}
			else
			{
				foreach(zone in s_challenge.var_4427ebb1)
				{
					if(zm_zonemgr::zone_is_enabled(zone))
					{
						if(s_challenge.n_count < var_881d9045)
						{
							var_881d9045 = s_challenge.n_count;
							var_99d6574b = s_challenge;
							break;
						}
					}
				}
			}
			continue;
		}
		if(s_challenge.n_count < var_881d9045)
		{
			var_881d9045 = s_challenge.n_count;
			var_99d6574b = s_challenge;
		}
	}
	if(var_99d6574b.n_count === 0)
	{
		foreach(player in function_a1ef346b())
		{
			if(!isdefined(player.var_bcaabb7d))
			{
				player.var_bcaabb7d = 0;
			}
			player.var_bcaabb7d++;
			if(player.var_bcaabb7d >= var_52da6798)
			{
				player zm_stats::increment_challenge_stat(#"hash_5c4576daa133ceb8");
			}
		}
	}
	var_99d6574b.n_count++;
	return var_99d6574b;
}

/*
	Name: is_active
	Namespace: namespace_f0b43eb5
	Checksum: 0xA0CD769D
	Offset: 0x4D60
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function is_active()
{
	if(isdefined(level.s_active_challenge))
	{
		return true;
	}
	return false;
}

/*
	Name: game_over
	Namespace: namespace_f0b43eb5
	Checksum: 0x3C7B164F
	Offset: 0x4D88
	Size: 0xD0
	Parameters: 0
	Flags: None
*/
function game_over()
{
	level waittill(#"end_game");
	if(is_active())
	{
		stop_challenge();
	}
	foreach(player in getplayers())
	{
		player set_tributeavailable(0);
	}
}

/*
	Name: function_2bf355c2
	Namespace: namespace_f0b43eb5
	Checksum: 0x819358D
	Offset: 0x4E60
	Size: 0x106
	Parameters: 0
	Flags: None
*/
function function_2bf355c2()
{
	if(isdefined(self.var_642ed51a.var_f693bf0b))
	{
		self.var_642ed51a.var_f693bf0b clientfield::set("" + #"hash_21f5fab6a3d22093", 0);
		self.var_642ed51a.var_f693bf0b clientfield::set("" + #"hash_653b5827e6fbe5f9", 0);
		self namespace_f999c142::function_2ae77bb7(undefined, 0);
	}
	if(isdefined(self.var_642ed51a.var_f92a5f81))
	{
		self.var_642ed51a.var_f92a5f81 delete();
	}
	self set_tributeavailable(0);
	self.var_43300e = undefined;
	self.var_4373c66b = undefined;
}

/*
	Name: function_432b2abf
	Namespace: namespace_f0b43eb5
	Checksum: 0x99E01EF7
	Offset: 0x4F70
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function function_432b2abf()
{
	if(!level.var_996e8a57 zm_dac_challenges_hud::is_open(self))
	{
		level.var_996e8a57 zm_dac_challenges_hud::open(self);
	}
}

/*
	Name: set_challenge_text
	Namespace: namespace_f0b43eb5
	Checksum: 0xA237DB8D
	Offset: 0x4FC0
	Size: 0x114
	Parameters: 2
	Flags: None
*/
function set_challenge_text(challenge_text, location_name)
{
	if(!isdefined(location_name))
	{
		location_name = #"";
	}
	self endon(#"death");
	self function_432b2abf();
	if(isdefined(challenge_text))
	{
		level.var_996e8a57 zm_dac_challenges_hud::set_challengetext(self, challenge_text);
	}
	if(isdefined(location_name))
	{
		level.var_996e8a57 zm_dac_challenges_hud::set_bottomtext(self, location_name);
	}
	if(level.var_2dffd020 === 4)
	{
		level.var_996e8a57 zm_dac_challenges_hud::function_c079b98b(self, 1);
	}
	else
	{
		level.var_996e8a57 zm_dac_challenges_hud::function_c079b98b(self, 0);
	}
	self function_b4759cf8();
}

/*
	Name: function_b4759cf8
	Namespace: namespace_f0b43eb5
	Checksum: 0xED030769
	Offset: 0x50E0
	Size: 0x54
	Parameters: 0
	Flags: None
*/
function function_b4759cf8()
{
	if(isdefined(self))
	{
		level.var_996e8a57 zm_dac_challenges_hud::set_state(self, #"hash_6038b42ab4ce959d");
		level.var_996e8a57 zm_dac_challenges_hud::set_rewardhidden(self, 0);
	}
}

/*
	Name: function_d38641f1
	Namespace: namespace_f0b43eb5
	Checksum: 0x841F8F99
	Offset: 0x5140
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function function_d38641f1()
{
	if(isdefined(self))
	{
		level.var_996e8a57 zm_dac_challenges_hud::set_rewardhidden(self, 0);
	}
}

/*
	Name: function_7e30f24c
	Namespace: namespace_f0b43eb5
	Checksum: 0x19BA6FBD
	Offset: 0x5178
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function function_7e30f24c()
{
	if(isdefined(self))
	{
		level.var_996e8a57 zm_dac_challenges_hud::set_state(self, #"hash_3045a78750b13a96");
	}
	if(isdefined(self.var_9e09931e) && is_true(self.var_9e09931e === 0))
	{
		level.var_996e8a57 zm_dac_challenges_hud::set_rewardhidden(self, 1);
	}
}

/*
	Name: function_ada590f5
	Namespace: namespace_f0b43eb5
	Checksum: 0x57C1B2CB
	Offset: 0x5208
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function function_ada590f5()
{
	if(isdefined(self))
	{
		level.var_996e8a57 zm_dac_challenges_hud::set_rewardhidden(self, 1);
	}
}

/*
	Name: set_tributeavailable
	Namespace: namespace_f0b43eb5
	Checksum: 0xA2EC202F
	Offset: 0x5240
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function set_tributeavailable(var_9d5acba)
{
	if(level.var_996e8a57 zm_dac_challenges_hud::is_open(self))
	{
		if(isdefined(var_9d5acba))
		{
			level.var_996e8a57 zm_dac_challenges_hud::set_tributeavailable(self, var_9d5acba);
		}
	}
}

/*
	Name: function_c21d733d
	Namespace: namespace_f0b43eb5
	Checksum: 0xC453C5A8
	Offset: 0x52A0
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function function_c21d733d(b_enable)
{
	if(!isdefined(b_enable))
	{
		b_enable = 1;
	}
	if(level.var_996e8a57 zm_dac_challenges_hud::is_open(self))
	{
		level.var_996e8a57 zm_dac_challenges_hud::function_c21d733d(self, b_enable);
	}
}

/*
	Name: function_fcd5d27c
	Namespace: namespace_f0b43eb5
	Checksum: 0x526CE424
	Offset: 0x5308
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function function_fcd5d27c(var_3f4d60e3)
{
	if(!isdefined(var_3f4d60e3))
	{
		var_3f4d60e3 = 1;
	}
	if(level.var_996e8a57 zm_dac_challenges_hud::is_open(self))
	{
		level.var_996e8a57 zm_dac_challenges_hud::set_binlocation(self, var_3f4d60e3);
	}
}

/*
	Name: function_fd8a137e
	Namespace: namespace_f0b43eb5
	Checksum: 0x57571412
	Offset: 0x5370
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function function_fd8a137e()
{
	if(level.var_996e8a57 zm_dac_challenges_hud::is_open(self))
	{
		level.var_996e8a57 zm_dac_challenges_hud::close(self);
	}
}

/*
	Name: function_34a533b1
	Namespace: namespace_f0b43eb5
	Checksum: 0xC3E41FCA
	Offset: 0x53C0
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function function_34a533b1()
{
	self function_432b2abf();
	level.var_996e8a57 zm_dac_challenges_hud::increment_progress(self);
}

/*
	Name: start_timer
	Namespace: namespace_f0b43eb5
	Checksum: 0x212E1374
	Offset: 0x5408
	Size: 0xB8
	Parameters: 1
	Flags: None
*/
function start_timer(n_time_seconds)
{
	foreach(player in getplayers())
	{
		player clientfield::set_to_player("" + #"hash_31bea9cf1e6f76a0", n_time_seconds);
	}
}

/*
	Name: stop_timer
	Namespace: namespace_f0b43eb5
	Checksum: 0xE0BE56F9
	Offset: 0x54C8
	Size: 0xB0
	Parameters: 0
	Flags: None
*/
function stop_timer()
{
	foreach(player in getplayers())
	{
		player clientfield::set_to_player("" + #"hash_31bea9cf1e6f76a0", 0);
	}
}

/*
	Name: function_445c5438
	Namespace: namespace_f0b43eb5
	Checksum: 0xEE112A22
	Offset: 0x5580
	Size: 0x124
	Parameters: 0
	Flags: None
*/
function function_445c5438()
{
	if(!isdefined(level.musicsystem))
	{
		return;
	}
	if(is_true(level.musicsystemoverride))
	{
		return;
	}
	if(level.musicsystem.currentplaytype === 4)
	{
		return;
	}
	if(level.musicsystem.currentstate === "challenge")
	{
		return;
	}
	level zm_audio::sndmusicsystem_stopandflush();
	if(isdefined(level.var_cd3d6a27))
	{
		level thread [[level.var_cd3d6a27]](1);
	}
	level.musicsystem.currentplaytype = 4;
	level.musicsystem.currentstate = "challenge";
	var_9c1ed9ea = "challenge_" + function_21a3a673(1, 2);
	music::setmusicstate(var_9c1ed9ea);
}

/*
	Name: function_23853783
	Namespace: namespace_f0b43eb5
	Checksum: 0xA8768D15
	Offset: 0x56B0
	Size: 0xEC
	Parameters: 1
	Flags: None
*/
function function_23853783(n_delay)
{
	if(!isdefined(n_delay))
	{
		n_delay = 0;
	}
	self notify("1f8a35b745a3b10e");
	self endon("1f8a35b745a3b10e");
	if(!isdefined(level.musicsystem))
	{
		return;
	}
	if(is_true(level.musicsystemoverride))
	{
		return;
	}
	wait(n_delay);
	if(level.musicsystem.currentstate === "challenge")
	{
		if(isdefined(level.var_cd3d6a27))
		{
			level thread [[level.var_cd3d6a27]]();
		}
		level.musicsystem.currentplaytype = 0;
		level.musicsystem.currentstate = undefined;
		music::setmusicstate("");
	}
}

/*
	Name: function_37597f29
	Namespace: namespace_f0b43eb5
	Checksum: 0x1A78CDB7
	Offset: 0x57A8
	Size: 0x1B0
	Parameters: 0
	Flags: None
*/
function function_37597f29()
{
	/#
		util::add_debug_command("");
		util::add_debug_command("");
		util::add_debug_command("");
		util::add_debug_command("");
		zm_devgui::add_custom_devgui_callback(&cmd);
		util::init_dvar(#"hash_5b92db1162c53bb5", "", &function_e6f97362);
		level flag::wait_till("");
		foreach(s_challenge in level.var_94b8d201)
		{
			str_name = function_9e72a96(s_challenge.str_name);
			util::add_debug_command(((("" + str_name) + "") + str_name) + "");
		}
	#/
}

/*
	Name: function_e6f97362
	Namespace: namespace_f0b43eb5
	Checksum: 0x994F37FF
	Offset: 0x5960
	Size: 0x8C
	Parameters: 1
	Flags: Private
*/
function private function_e6f97362(params)
{
	/#
		if(params.value === "")
		{
			return;
		}
		level.var_acf50b77 = params.value;
		start_challenge(getplayers()[0]);
		setdvar(#"hash_5b92db1162c53bb5", "");
	#/
}

/*
	Name: cmd
	Namespace: namespace_f0b43eb5
	Checksum: 0x3C4004F6
	Offset: 0x59F8
	Size: 0x172
	Parameters: 1
	Flags: None
*/
function cmd(cmd)
{
	/#
		switch(cmd)
		{
			case "hash_c56ce3c06931cbb":
			{
				function_d938cbd8();
				break;
			}
			case "hash_1f6dfb788a3261dc":
			{
				function_df5afb5e();
				break;
			}
			case "hash_7cdc8834ffee5ac":
			{
				function_5e613eb7();
				break;
			}
			case "hash_625423e17a0da5e2":
			{
				if(getdvarint(#"hash_1ca7459bb8b222dd", 0))
				{
					setdvar(#"hash_1ca7459bb8b222dd", 0);
					/#
						iprintlnbold("");
					#/
				}
				else
				{
					setdvar(#"hash_1ca7459bb8b222dd", 1);
					/#
						iprintlnbold("");
					#/
				}
				break;
			}
			default:
			{
				break;
			}
		}
	#/
}

/*
	Name: function_d938cbd8
	Namespace: namespace_f0b43eb5
	Checksum: 0xA8D78931
	Offset: 0x5B78
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_d938cbd8()
{
	/#
		if(is_active())
		{
			stop_challenge(1);
		}
	#/
}

/*
	Name: function_df5afb5e
	Namespace: namespace_f0b43eb5
	Checksum: 0xB93A63EA
	Offset: 0x5BB8
	Size: 0xC0
	Parameters: 0
	Flags: None
*/
function function_df5afb5e()
{
	/#
		var_ed9ebb4a = getaiarchetypearray(#"zombie");
		foreach(zombie in var_ed9ebb4a)
		{
			zombie zombie_utility::function_df5afb5e(1);
		}
	#/
}

/*
	Name: function_5e613eb7
	Namespace: namespace_f0b43eb5
	Checksum: 0x353F080F
	Offset: 0x5C80
	Size: 0xA0
	Parameters: 0
	Flags: None
*/
function function_5e613eb7()
{
	/#
		foreach(player in getplayers())
		{
			player namespace_f999c142::function_53a333a8("", 200);
		}
	#/
}

