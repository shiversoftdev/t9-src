#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using script_437ce686d29bb81b;
#using scripts\zm_common\zm_fasttravel.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using script_35598499769dbb3d;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\damagefeedback_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_7589cf5c;

/*
	Name: function_e5fe0549
	Namespace: namespace_7589cf5c
	Checksum: 0x7CF957F4
	Offset: 0x1B0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e5fe0549()
{
	level notify(2020076544);
}

/*
	Name: function_df911075
	Namespace: namespace_7589cf5c
	Checksum: 0xC98F8455
	Offset: 0x1D0
	Size: 0x206
	Parameters: 0
	Flags: Linked
*/
function function_df911075()
{
	switch(level.var_b48509f9)
	{
		case 1:
		{
			var_5e36739b = undefined;
			break;
		}
		case 2:
		{
			var_5e36739b = [1:#"hash_4f87aa2a203d37d0", 0:#"spawner_bo5_mimic"];
			break;
		}
		case 3:
		case 4:
		{
			var_5e36739b = [2:#"hash_4f87aa2a203d37d0", 1:#"spawner_bo5_mimic", 0:#"hash_1aff4b71635bda08"];
			break;
		}
		case 5:
		{
			var_5e36739b = [3:#"spawner_zm_steiner", 2:#"hash_4f87aa2a203d37d0", 1:#"spawner_bo5_mimic", 0:#"hash_1aff4b71635bda08"];
			break;
		}
		default:
		{
			var_5e36739b = [4:#"spawner_zm_steiner", 3:#"hash_4f87aa2a203d37d0", 2:#"spawner_bo5_mimic", 1:#"hash_704a090ff9fcffd0", 0:#"hash_1aff4b71635bda08"];
			break;
		}
	}
	return var_5e36739b;
}

/*
	Name: function_82e262cf
	Namespace: namespace_7589cf5c
	Checksum: 0x2AE5880B
	Offset: 0x3E0
	Size: 0x8A
	Parameters: 1
	Flags: Linked
*/
function function_82e262cf(var_7ecdee63)
{
	if(var_7ecdee63 === #"hash_1aff4b71635bda08" || var_7ecdee63 === #"hash_704a090ff9fcffd0" || var_7ecdee63 === #"spawner_bo5_mimic" || var_7ecdee63 === #"hash_4f87aa2a203d37d0" || var_7ecdee63 === #"spawner_zm_steiner")
	{
		return true;
	}
	return false;
}

/*
	Name: function_b9e4c169
	Namespace: namespace_7589cf5c
	Checksum: 0x8A3A0DE4
	Offset: 0x478
	Size: 0xEE
	Parameters: 0
	Flags: Linked
*/
function function_b9e4c169()
{
	switch(level.var_b48509f9)
	{
		case 1:
		case 2:
		{
			if(math::cointoss())
			{
				var_7ecdee63 = #"hash_7cba8a05511ceedf";
			}
			else
			{
				var_7ecdee63 = #"hash_124b582ce08d78c0";
			}
			break;
		}
		case 3:
		case 4:
		{
			var_7ecdee63 = #"hash_338eb4103e0ed797";
			break;
		}
		default:
		{
			var_7ecdee63 = #"hash_46c917a1b5ed91e7";
			break;
		}
	}
	return var_7ecdee63;
}

/*
	Name: function_1b53cdc7
	Namespace: namespace_7589cf5c
	Checksum: 0x1951E1C2
	Offset: 0x570
	Size: 0x236
	Parameters: 0
	Flags: Linked
*/
function function_1b53cdc7()
{
	n_players = getplayers().size;
	switch(level.var_b48509f9)
	{
		case 1:
		{
			var_61c57c53 = 0;
			break;
		}
		case 2:
		{
			var_61c57c53 = 2;
			break;
		}
		case 3:
		{
			var_61c57c53 = max(n_players - 1, 3);
			break;
		}
		case 4:
		{
			var_61c57c53 = max(n_players, 3);
			break;
		}
		case 5:
		{
			var_61c57c53 = max(n_players + 2, 4);
			break;
		}
		case 6:
		{
			var_61c57c53 = max(n_players + 3, 5);
			break;
		}
		case 7:
		{
			var_61c57c53 = max(n_players + 4, 6);
			break;
		}
		case 8:
		{
			var_61c57c53 = max(n_players + 5, 7);
			break;
		}
		case 9:
		{
			var_61c57c53 = max(n_players + 6, 8);
			break;
		}
		default:
		{
			var_61c57c53 = min(level.var_b48509f9, n_players + 7);
			break;
		}
	}
	return var_61c57c53;
}

/*
	Name: function_56fa33d9
	Namespace: namespace_7589cf5c
	Checksum: 0xEBF58689
	Offset: 0x7B0
	Size: 0x1C6
	Parameters: 0
	Flags: Linked
*/
function function_56fa33d9()
{
	n_players = getplayers().size;
	switch(level.var_b48509f9)
	{
		case 1:
		{
			var_b803db9c = 0;
			break;
		}
		case 2:
		{
			var_b803db9c = 1;
			break;
		}
		case 3:
		case 4:
		{
			var_b803db9c = min(n_players, 2);
			break;
		}
		case 5:
		case 6:
		{
			var_b803db9c = min(n_players + 1, 3);
			break;
		}
		case 7:
		case 8:
		{
			var_b803db9c = max(n_players + 1, 3);
			break;
		}
		case 9:
		{
			var_b803db9c = max(n_players + 2, 4);
			break;
		}
		default:
		{
			var_b803db9c = min(level.var_b48509f9 - 3, n_players + 4);
			break;
		}
	}
	return var_b803db9c;
}

/*
	Name: function_190c51a9
	Namespace: namespace_7589cf5c
	Checksum: 0x6B5F72B4
	Offset: 0x980
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_190c51a9()
{
	n_cooldown = 120 / level.var_b48509f9;
	return n_cooldown;
}

/*
	Name: function_ac709d66
	Namespace: namespace_7589cf5c
	Checksum: 0x177AFD92
	Offset: 0x9B0
	Size: 0x84
	Parameters: 2
	Flags: Linked
*/
function function_ac709d66(instance, str_alias)
{
	instance endon(#"objective_ended");
	self endon(#"death");
	function_64719f04(instance);
	self thread zm_vo::function_d6f8bbd9(str_alias);
	function_64719f04(instance);
}

/*
	Name: function_64719f04
	Namespace: namespace_7589cf5c
	Checksum: 0x9EF4287A
	Offset: 0xA40
	Size: 0x124
	Parameters: 1
	Flags: Linked
*/
function function_64719f04(instance)
{
	instance endon(#"objective_ended");
	var_d951c76b = 0;
	while(true)
	{
		foreach(player in getplayers())
		{
			if(isalive(player))
			{
				if(zm_vo::is_player_speaking(player) || zm_vo::function_c10c4064(player))
				{
					var_d951c76b = 1;
				}
			}
		}
		if(!var_d951c76b)
		{
			break;
		}
		var_d951c76b = 0;
		wait(0.1);
	}
}

/*
	Name: vo_start
	Namespace: namespace_7589cf5c
	Checksum: 0xF4E4DA0
	Offset: 0xB70
	Size: 0xF4
	Parameters: 2
	Flags: Linked
*/
function vo_start(var_33e81c58, var_4469395e)
{
	level endon(#"end_game");
	self endon(#"objective_ended");
	level flag::wait_till(#"hash_7e250b62cf326bf9");
	if(namespace_cf6efd05::function_85b812c9())
	{
		level flag::wait_till(#"initial_fade_in_complete");
	}
	wait(0.5);
	level flag::clear(#"hash_7e250b62cf326bf9");
	level play_vo(var_33e81c58);
	wait(1);
	level play_vo(var_4469395e);
}

/*
	Name: play_vo
	Namespace: namespace_7589cf5c
	Checksum: 0xBA675D31
	Offset: 0xC70
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function play_vo(str_alias)
{
	if(self === level)
	{
		level zm_vo::function_7622cb70(str_alias);
	}
	else
	{
		self zm_vo::function_d6f8bbd9(str_alias);
	}
}

/*
	Name: function_98da2ed1
	Namespace: namespace_7589cf5c
	Checksum: 0xCEAADC0B
	Offset: 0xCC8
	Size: 0x11C
	Parameters: 1
	Flags: None
*/
function function_98da2ed1(str_alias)
{
	self notify("7d48bd744f5c784");
	self endon("7d48bd744f5c784");
	level flag::wait_till("all_players_spawned");
	while(true)
	{
		foreach(player in getplayers())
		{
			if(distancesquared(player.origin, self.origin) < sqr(1700))
			{
				level thread zm_vo::function_7622cb70(str_alias);
				return;
			}
		}
		wait(1);
	}
}

/*
	Name: function_df51a2e8
	Namespace: namespace_7589cf5c
	Checksum: 0xBB824E8A
	Offset: 0xDF0
	Size: 0x744
	Parameters: 11
	Flags: None
*/
function function_df51a2e8(var_5314bd63, nd_path_start, var_384528, str_notify, var_6c365dbf, var_12230d08, var_5817f611, var_8f1ba730, var_6e7468ee, var_c3cd6081, var_1605b07a)
{
	if(!isdefined(var_6e7468ee))
	{
		var_6e7468ee = 0;
	}
	if(!isdefined(var_c3cd6081))
	{
		var_c3cd6081 = 1;
	}
	if(!isdefined(var_1605b07a))
	{
		var_1605b07a = 1;
	}
	level endon(#"end_game");
	self endoncallback(&zm_fasttravel::function_79766c56, #"bled_out", #"death");
	self.var_16735873 = 1;
	self.var_99582f14 = 1;
	self zm_fasttravel::function_7a607f29(var_5817f611);
	self.var_f4e33249 = 1;
	self val::set(#"fasttravel", "freezecontrols", 1);
	self val::set(#"fasttravel", "show_hud", 0);
	if(self isinvehicle())
	{
		self unlink();
		util::wait_network_frame();
	}
	if(!var_6e7468ee)
	{
		while(level.var_d03afa3[var_8f1ba730] === 1)
		{
			util::wait_network_frame();
		}
		level thread zm_fasttravel::function_78e3c2ba(var_8f1ba730);
	}
	foreach(e_player in getplayers())
	{
		e_player clientfield::set_player_uimodel(("WorldSpaceIndicators.bleedOutModel" + self getentitynumber()) + ".hide", 1);
	}
	if(!self laststand::player_is_in_laststand() && isalive(self))
	{
		str_stance = self getstance();
		if(self isstanceallowed("stand"))
		{
			switch(str_stance)
			{
				case "crouch":
				{
					self setstance("stand");
					if(var_1605b07a)
					{
						wait(0.2);
					}
					break;
				}
				case "prone":
				{
					self setstance("stand");
					if(var_1605b07a)
					{
						wait(1);
					}
					break;
				}
			}
		}
	}
	self notify(#"hash_1c35eb15aa210d6", {#hash_9fa6220c:var_5817f611});
	self zm_stats::increment_challenge_stat(#"fast_travels");
	if(!is_true(self.var_472e3448))
	{
		self stopsounds();
	}
	if(!isdefined(var_5817f611) || (isdefined(var_5817f611) && !is_true(var_5817f611.var_694cbc6f)))
	{
		self ghost();
	}
	self thread zm_fasttravel::function_946fc2d6();
	self clientfield::increment("fasttravel_start_fx", 1);
	level.var_f3901984 = 20;
	if(is_true(level.var_16fecec8))
	{
		var_896486fb = struct::get(var_5817f611.script_string, "script_name");
		self thread zm_fasttravel::function_a78584c0(var_12230d08, var_896486fb);
	}
	self waittill(#"fasttravel_over");
	self.var_99582f14 = 0;
	if(isdefined(var_6c365dbf))
	{
		level notify(var_6c365dbf);
	}
	level flag::wait_till("streamed");
	self val::reset(#"fasttravel", "freezecontrols");
	self clientfield::increment("fasttravel_end_fx", 1);
	self show();
	self.var_5817f611 = undefined;
	self notify(#"fasttravel_finished", {#hash_9fa6220c:var_5817f611});
	foreach(e_player in getplayers())
	{
		e_player clientfield::set_player_uimodel(("WorldSpaceIndicators.bleedOutModel" + self getentitynumber()) + ".hide", 0);
	}
	if(is_true(var_c3cd6081) && isdefined(level.var_34eb792d))
	{
		thread [[level.var_34eb792d]](self, var_5817f611);
	}
	self util::delay(0.3, undefined, &zm_audio::create_and_play_dialog, #"fast_travel", #"end");
}

/*
	Name: function_8eafd734
	Namespace: namespace_7589cf5c
	Checksum: 0x4207A1D1
	Offset: 0x1540
	Size: 0xE8
	Parameters: 0
	Flags: None
*/
function function_8eafd734()
{
	self endon(#"death");
	while(true)
	{
		s_result = undefined;
		s_result = self waittill(#"damage");
		if(isplayer(s_result.attacker) && isalive(s_result.attacker))
		{
			s_result.attacker damagefeedback::update(s_result.mod, s_result.inflictor, undefined, s_result.weapon, self);
			self playsoundtoplayer(#"hash_2ce81d103e923201", s_result.attacker);
		}
	}
}

/*
	Name: function_83eb80af
	Namespace: namespace_7589cf5c
	Checksum: 0x605852AB
	Offset: 0x1630
	Size: 0xF2
	Parameters: 1
	Flags: None
*/
function function_83eb80af(v_org)
{
	a_ai_attackers = getaiarray();
	for(i = 0; i < a_ai_attackers.size; i++)
	{
		if(is_true(a_ai_attackers[i].allowdeath) && isalive(a_ai_attackers[i]) && distancesquared(v_org, a_ai_attackers[i].origin) <= sqr(5000))
		{
			a_ai_attackers[i] kill(undefined, undefined, undefined, undefined, undefined, 1);
		}
		waitframe(1);
	}
}

/*
	Name: function_3899cfea
	Namespace: namespace_7589cf5c
	Checksum: 0xFBE7320A
	Offset: 0x1730
	Size: 0xFA
	Parameters: 2
	Flags: Linked
*/
function function_3899cfea(v_org, n_radius)
{
	if(isdefined(n_radius))
	{
		a_zombies = function_a38db454(v_org, n_radius);
	}
	else
	{
		a_zombies = getaiarray();
	}
	for(i = 0; i < a_zombies.size; i++)
	{
		if(isalive(a_zombies[i]))
		{
			a_zombies[i].allowdeath = 1;
			a_zombies[i].var_98f1f37c = 1;
			gibserverutils::annihilate(a_zombies[i]);
			a_zombies[i] kill(undefined, undefined, undefined, undefined, undefined, 1);
			waitframe(1);
		}
	}
}

/*
	Name: function_8ab565fc
	Namespace: namespace_7589cf5c
	Checksum: 0x5552BDCE
	Offset: 0x1838
	Size: 0xBA
	Parameters: 0
	Flags: None
*/
function function_8ab565fc()
{
	switch(level.var_b48509f9)
	{
		case 1:
		{
			return 50;
			break;
		}
		case 2:
		{
			return 60;
			break;
		}
		case 3:
		{
			return 70;
			break;
		}
		case 4:
		{
			return 85;
			break;
		}
		case 5:
		{
			return 105;
			break;
		}
		default:
		{
			return 115;
			break;
		}
	}
}

/*
	Name: function_4bd02b61
	Namespace: namespace_7589cf5c
	Checksum: 0xB6329DAC
	Offset: 0x1900
	Size: 0xBA
	Parameters: 0
	Flags: None
*/
function function_4bd02b61()
{
	switch(level.var_b48509f9)
	{
		case 1:
		{
			return 30;
			break;
		}
		case 2:
		{
			return 40;
			break;
		}
		case 3:
		{
			return 45;
			break;
		}
		case 4:
		{
			return 55;
			break;
		}
		case 5:
		{
			return 80;
			break;
		}
		default:
		{
			return 95;
			break;
		}
	}
}

/*
	Name: function_69c0c9b6
	Namespace: namespace_7589cf5c
	Checksum: 0xC59844D5
	Offset: 0x19C8
	Size: 0x74
	Parameters: 0
	Flags: None
*/
function function_69c0c9b6()
{
	self endon(#"death");
	self.allowdeath = 1;
	if(self.archetype === #"zombie")
	{
		gibserverutils::annihilate(self);
	}
	self kill(undefined, undefined, undefined, undefined, undefined, 1);
}

/*
	Name: function_f10301b0
	Namespace: namespace_7589cf5c
	Checksum: 0x9553D34
	Offset: 0x1A48
	Size: 0x2E
	Parameters: 0
	Flags: Linked
*/
function function_f10301b0()
{
	level waittill(#"hash_8202877a3aadac8");
	self notify(#"hash_8202877a3aadac8");
}

/*
	Name: function_1e45b156
	Namespace: namespace_7589cf5c
	Checksum: 0x8A0C4A49
	Offset: 0x1A80
	Size: 0x368
	Parameters: 1
	Flags: Linked
*/
function function_1e45b156(s_instance)
{
	var_c18c5f = (isdefined(s_instance.var_fe2612fe[#"hash_5819d8571ea7c838"]) ? s_instance.var_fe2612fe[#"hash_5819d8571ea7c838"] : []);
	if(var_c18c5f.size > 0)
	{
		s_instance.var_44a675fe = level.var_b3e433ae;
		var_f3433c5b = [];
		var_2bcc2765 = [];
		foreach(var_cdce8e6f in var_c18c5f)
		{
			if(isdefined(var_cdce8e6f.script_int))
			{
				if(!isdefined(var_f3433c5b))
				{
					var_f3433c5b = [];
				}
				else if(!isarray(var_f3433c5b))
				{
					var_f3433c5b = array(var_f3433c5b);
				}
				var_f3433c5b[var_f3433c5b.size] = var_cdce8e6f;
				continue;
			}
			if(!isdefined(var_2bcc2765))
			{
				var_2bcc2765 = [];
			}
			else if(!isarray(var_2bcc2765))
			{
				var_2bcc2765 = array(var_2bcc2765);
			}
			var_2bcc2765[var_2bcc2765.size] = var_cdce8e6f;
		}
		var_f3433c5b = array::sort_by_script_int(var_f3433c5b, 0);
		foreach(var_d80c3f29 in var_f3433c5b)
		{
			if(!isdefined(var_2bcc2765))
			{
				var_2bcc2765 = [];
			}
			else if(!isarray(var_2bcc2765))
			{
				var_2bcc2765 = array(var_2bcc2765);
			}
			var_2bcc2765[var_2bcc2765.size] = var_d80c3f29;
		}
		foreach(s_path in var_2bcc2765)
		{
			if(isdefined(s_path.targetname))
			{
				var_4941074d = getent(s_path.targetname, "target");
				if(isdefined(var_4941074d.targetname))
				{
					if(!isdefined(level.var_b3e433ae))
					{
						level.var_b3e433ae = [];
					}
					array::push_front(level.var_b3e433ae, var_4941074d.targetname);
				}
			}
		}
	}
}

/*
	Name: function_ed193293
	Namespace: namespace_7589cf5c
	Checksum: 0x35C04CE4
	Offset: 0x1DF0
	Size: 0x2A
	Parameters: 1
	Flags: Linked
*/
function function_ed193293(s_instance)
{
	level.var_b3e433ae = s_instance.var_44a675fe;
	s_instance.var_44a675fe = undefined;
}

