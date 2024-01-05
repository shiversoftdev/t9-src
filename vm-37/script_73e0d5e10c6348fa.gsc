#using script_3706d21c449d0d14;
#using scripts\cp_common\util.gsc;
#using script_263b7f2982258785;
#using script_3dc93ca9902a9cda;
#using script_1292451e284848cc;
#using script_3819e7a1427df6d2;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\turret_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\player\player_loadout.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai\archetype_utility.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace namespace_c25eb016;

/*
	Name: function_2e7c81f6
	Namespace: namespace_c25eb016
	Checksum: 0x15AE8BBB
	Offset: 0x5D0
	Size: 0xFC
	Parameters: 4
	Flags: Linked
*/
function function_2e7c81f6(var_6ec87b1c, var_1bf8e54c, var_67e93cde, var_16081583)
{
	self takeallweapons();
	var_6cc14b7b = getweapon(#"null_offhand_primary");
	self giveweapon(var_6cc14b7b);
	self function_82c1c712(var_6ec87b1c, 1, 1);
	if(isdefined(var_1bf8e54c))
	{
		self function_82c1c712(var_1bf8e54c);
	}
	if(isdefined(var_67e93cde))
	{
		self give_player_equipment(var_67e93cde);
	}
	if(isdefined(var_16081583))
	{
		self give_player_equipment(var_16081583);
	}
}

/*
	Name: function_82c1c712
	Namespace: namespace_c25eb016
	Checksum: 0x771AFE88
	Offset: 0x6D8
	Size: 0xFC
	Parameters: 3
	Flags: Linked
*/
function function_82c1c712(var_7e50d895, var_3f0c288b, var_908ce45b)
{
	if(!isdefined(var_3f0c288b))
	{
		var_3f0c288b = 1;
	}
	if(!isdefined(var_908ce45b))
	{
		var_908ce45b = 0;
	}
	/#
		assert(ishash(var_7e50d895) || isweapon(var_7e50d895), "");
	#/
	w_weapon = get_weapon(var_7e50d895);
	self giveweapon(w_weapon);
	if(var_3f0c288b)
	{
		self givemaxammo(w_weapon);
	}
	if(var_908ce45b)
	{
		self switchtoweapon(w_weapon);
	}
}

/*
	Name: give_player_equipment
	Namespace: namespace_c25eb016
	Checksum: 0x4C965809
	Offset: 0x7E0
	Size: 0xDC
	Parameters: 2
	Flags: Linked
*/
function give_player_equipment(var_7e50d895, var_3f0c288b)
{
	if(!isdefined(var_3f0c288b))
	{
		var_3f0c288b = 1;
	}
	/#
		assert(isstring(var_7e50d895) || ishash(var_7e50d895) || isweapon(var_7e50d895), "");
	#/
	w_weapon = get_weapon(var_7e50d895);
	self giveweapon(w_weapon);
	if(var_3f0c288b)
	{
		self givemaxammo(w_weapon);
	}
}

/*
	Name: get_weapon
	Namespace: namespace_c25eb016
	Checksum: 0xD285868
	Offset: 0x8C8
	Size: 0x8C
	Parameters: 1
	Flags: Linked, Private
*/
function private get_weapon(var_7e50d895)
{
	w_weapon = var_7e50d895;
	if(ishash(w_weapon))
	{
		w_weapon = getweapon(w_weapon);
	}
	if(isweapon(w_weapon))
	{
		return w_weapon;
	}
	/#
		errormsg("");
	#/
}

/*
	Name: function_d2913eb6
	Namespace: namespace_c25eb016
	Checksum: 0xF6E0217A
	Offset: 0x960
	Size: 0x124
	Parameters: 2
	Flags: None
*/
function function_d2913eb6(str_value, str_key)
{
	if(!isdefined(str_key))
	{
		str_key = "targetname";
	}
	/#
		assert(isstring(str_value), "");
	#/
	/#
		assert(isstring(str_key), "");
	#/
	s_warp = struct::get(str_value, str_key);
	/#
		assert(isdefined(s_warp), ((("" + str_key) + "") + str_value) + "");
	#/
	self setorigin(s_warp.origin);
	self setplayerangles(s_warp.angles);
}

/*
	Name: print
	Namespace: namespace_c25eb016
	Checksum: 0x9CD5FC71
	Offset: 0xA90
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function print(string)
{
	/#
		if(getdvarint(#"hash_392e1be829a88ce7", 0) != 0)
		{
			iprintlnbold(string);
		}
	#/
}

/*
	Name: function_32397759
	Namespace: namespace_c25eb016
	Checksum: 0x4BE21794
	Offset: 0xAE8
	Size: 0x446
	Parameters: 0
	Flags: None
*/
function function_32397759()
{
	/#
		level notify(#"hash_2053a8138b73b25");
		level endon(#"hash_2053a8138b73b25");
		level endon(#"nextmission");
		var_6a432250 = [];
		if(getdvarint(#"hash_392e1be829a88ce7", 0) == 0)
		{
			return;
		}
		while(true)
		{
			if(getdvarint(#"developer_script", 1) == 0)
			{
				wait(1);
				continue;
			}
			var_6a432250[0] = getaiteamarray("").size;
			var_6a432250[1] = getaiteamarray("").size;
			var_6a432250[2] = getaiteamarray("").size;
			var_6a432250[1]--;
			n_total_count = 0;
			foreach(n_count in var_6a432250)
			{
				n_total_count = n_total_count + n_count;
			}
			var_d2a95eab = (1, 1, 1);
			if(n_total_count < 10)
			{
				var_d2a95eab = (0, 1, 0);
			}
			else
			{
				if(n_total_count < 20)
				{
					var_d2a95eab = (1, 1, 0);
				}
				else
				{
					var_d2a95eab = (1, 0, 0);
				}
			}
			n_xpos = 900;
			n_ypos = 10;
			foreach(n, n_count in var_6a432250)
			{
				var_9bed9f5d = "";
				switch(n)
				{
					case 0:
					{
						var_9bed9f5d = "";
						break;
					}
					case 1:
					{
						var_9bed9f5d = "";
						break;
					}
					case 2:
					{
						var_9bed9f5d = "";
						break;
					}
				}
				var_6a84dd2f = getdvarint(#"hash_799d70a49cc79c0f", 1920);
				var_b246b91d = getdvarint(#"hash_526c340ae912bbd0", 1080);
				var_b818a262 = int((var_6a84dd2f * n_xpos) / 1920);
				var_68bff93e = int((var_b246b91d * n_ypos) / 1080);
				debug2dtext((var_b818a262, var_68bff93e, 0), (("" + n_count) + var_9bed9f5d) + "", var_d2a95eab, 1, (0, 0, 0), 0.2, 1);
				n_increment = int((var_b246b91d * 22) / 1080);
				n_ypos = n_ypos + n_increment;
			}
			waitframe(1);
		}
	#/
}

/*
	Name: display_player_health
	Namespace: namespace_c25eb016
	Checksum: 0xA06C120A
	Offset: 0xF38
	Size: 0x146
	Parameters: 0
	Flags: None
*/
function display_player_health()
{
	/#
		if(getdvarint(#"hash_392e1be829a88ce7", 0) == 0)
		{
			return;
		}
		while(true)
		{
			if(isdefined(level.player.maxhealth) && level.player.maxhealth > 0)
			{
				break;
			}
			wait(1);
		}
		var_747bfbeb = gamedifficulty::get_player_difficulty_health() / level.player.maxhealth;
		while(isdefined(level.player))
		{
			var_3d30d8a4 = int(level.player.health * var_747bfbeb);
			debug2dtext(vectorscale((0, 1, 0), 1008), "" + var_3d30d8a4, (1, 1, 0), undefined, undefined, 0.5, 1.5, 1);
			waitframe(1);
		}
	#/
}

/*
	Name: dialogue
	Namespace: namespace_c25eb016
	Checksum: 0x20000221
	Offset: 0x1088
	Size: 0x18C
	Parameters: 4
	Flags: Linked
*/
function dialogue(var_8a9a3456, var_e7ee33b4, str_team_override, str_name_override)
{
	if(!isdefined(self))
	{
		/#
			print("");
		#/
		return;
	}
	if(isdefined(str_team_override))
	{
		self.var_e18a578d = str_team_override;
	}
	else
	{
		self.var_e18a578d = self.team;
	}
	if(isdefined(str_name_override))
	{
		self.var_2a7c06e0 = str_name_override;
	}
	else
	{
		self.var_2a7c06e0 = self.name;
	}
	if(soundexists(var_8a9a3456))
	{
		if(!isdefined(var_e7ee33b4) || var_e7ee33b4 == 0)
		{
			speaker = undefined;
			if(isai(self) || self.classname == "script_model")
			{
				speaker = self;
			}
			else
			{
				speaker = spawn("script_model", self.origin);
			}
			speaker dialogue::queue(var_8a9a3456);
		}
		else
		{
			self dialogue::radio(var_8a9a3456);
		}
	}
	else
	{
		/#
			self function_4fbbdb3a(var_8a9a3456);
		#/
	}
}

/*
	Name: function_4fbbdb3a
	Namespace: namespace_c25eb016
	Checksum: 0xA4D569C3
	Offset: 0x1220
	Size: 0x33C
	Parameters: 1
	Flags: None
*/
function function_4fbbdb3a(var_8a9a3456)
{
	/#
		/#
			assert(isdefined(self.var_e18a578d));
		#/
		level notify(#"hash_c994d2af0329db3");
		var_1a057205 = newdebughudelem();
		var_1a057205 thread function_3b240a04();
		var_b246b91d = getdvarint(#"hash_526c340ae912bbd0", 1080);
		var_7dcf554 = int((var_b246b91d * 145) / 1080);
		var_1a057205.elemtype = "";
		var_1a057205.font = "";
		var_1a057205.fontscale = 1.5;
		var_1a057205.horzalign = "";
		var_1a057205.vertalign = "";
		var_1a057205.alignx = "";
		var_1a057205.aligny = "";
		var_1a057205.y = var_7dcf554;
		var_1a057205.sort = 2;
		var_1a057205.alpha = 1;
		var_1a057205.hidewheninmenu = 1;
		str_name = undefined;
		if(isdefined(self.var_2a7c06e0))
		{
			str_name = self.var_2a7c06e0;
		}
		else
		{
			if(self.var_e18a578d == "")
			{
				str_name = "";
			}
			else
			{
				if(self.var_e18a578d == "")
				{
					str_name = "";
				}
				else
				{
					if(self.var_e18a578d == "")
					{
						str_name = "";
					}
					else
					{
						/#
							assertmsg("");
						#/
					}
				}
			}
		}
		if(self.var_e18a578d == "")
		{
			var_ac6f8704 = "";
		}
		else
		{
			if(self.var_e18a578d == "")
			{
				var_ac6f8704 = "";
			}
			else
			{
				if(self.var_e18a578d == "")
				{
					var_ac6f8704 = "";
				}
				else
				{
					/#
						assertmsg("");
					#/
				}
			}
		}
		var_1a057205 settext((((var_ac6f8704 + str_name) + "") + "") + var_8a9a3456);
		var_69ddbb87 = 2 + (var_8a9a3456.size * 0.05);
		var_1a057205 thread function_b9afa497(var_69ddbb87);
		var_1a057205 waittill(#"hash_6387ba69ddfd9cab");
	#/
}

/*
	Name: function_b9afa497
	Namespace: namespace_c25eb016
	Checksum: 0xACA0800F
	Offset: 0x1568
	Size: 0xAC
	Parameters: 1
	Flags: None
*/
function function_b9afa497(var_69ddbb87)
{
	/#
		var_6eb2464 = gettime() + (var_69ddbb87 * 1000);
		while(gettime() < var_6eb2464)
		{
			waitframe(1);
		}
		alpha = 1;
		while(alpha >= 0)
		{
			self.alpha = alpha;
			waitframe(1);
			alpha = alpha - 0.1;
		}
		self notify(#"hash_6387ba69ddfd9cab");
		self destroy();
	#/
}

/*
	Name: function_3b240a04
	Namespace: namespace_c25eb016
	Checksum: 0xBF19531
	Offset: 0x1620
	Size: 0x50
	Parameters: 0
	Flags: None
*/
function function_3b240a04()
{
	/#
		self endon(#"hash_6387ba69ddfd9cab");
		while(true)
		{
			level waittill(#"hash_c994d2af0329db3");
			self thread function_52f38f72();
		}
	#/
}

/*
	Name: function_52f38f72
	Namespace: namespace_c25eb016
	Checksum: 0x8FC00121
	Offset: 0x1678
	Size: 0xF4
	Parameters: 0
	Flags: None
*/
function function_52f38f72()
{
	/#
		var_b246b91d = getdvarint(#"hash_526c340ae912bbd0", 1080);
		var_ed2be267 = int((var_b246b91d * 30) / 1080);
		n_lerp_frames = int(10);
		var_71241e23 = int(var_ed2be267 / n_lerp_frames);
		for(n = 1; n <= n_lerp_frames; n++)
		{
			if(isdefined(self))
			{
				self.y = self.y + var_71241e23;
				waitframe(1);
				continue;
			}
			break;
		}
	#/
}

/*
	Name: function_ee1d1df6
	Namespace: namespace_c25eb016
	Checksum: 0x5B2DA7EC
	Offset: 0x1778
	Size: 0x24A
	Parameters: 7
	Flags: None
*/
function function_ee1d1df6(str_animname, var_4aac0a03, str_teleport_struct_targetname, var_715f6e03, str_spawner_name, var_3383cd4e, var_5207b7a8)
{
	/#
		assert(isdefined(str_animname), "");
	#/
	str_targetname = (isdefined(str_spawner_name) ? str_spawner_name : str_animname);
	ai = spawn_targetname(str_targetname);
	ai.animname = str_animname;
	ai.name = var_4aac0a03;
	ai.script_friendname = var_4aac0a03;
	ai.attackeraccuracy = 0.1;
	ai.pushable = 1;
	ai bloodimpact("hero");
	ai pushplayer(0);
	ai val::set(#"hash_13ccb82fb7f72765", "magic_bullet_shield", 1);
	if(isdefined(var_3383cd4e))
	{
		ai function_65d14a19(var_3383cd4e);
	}
	if(isdefined(var_715f6e03))
	{
		level function_53531f27(var_715f6e03);
	}
	if(isdefined(var_5207b7a8))
	{
		ai set_demeanor(var_5207b7a8);
	}
	s_teleport = struct::get(str_teleport_struct_targetname, "targetname");
	if(isdefined(s_teleport))
	{
		ai forceteleport(s_teleport.origin);
		ai setgoal(s_teleport.origin);
	}
	else
	{
		ai setgoal(ai.origin);
	}
	level.(str_animname) = ai;
	return ai;
}

/*
	Name: spawn_targetname
	Namespace: namespace_c25eb016
	Checksum: 0x781B6CA2
	Offset: 0x19D0
	Size: 0x102
	Parameters: 1
	Flags: Linked
*/
function spawn_targetname(str_targetname)
{
	var_43d072e0 = getentarray(str_targetname, "targetname");
	sp = undefined;
	ai = undefined;
	foreach(spawner in var_43d072e0)
	{
		if(isspawner(spawner))
		{
			sp = spawner;
			break;
		}
	}
	if(isdefined(sp))
	{
		ai = spawner::simple_spawn_single(sp);
	}
	return ai;
}

/*
	Name: set_demeanor
	Namespace: namespace_c25eb016
	Checksum: 0x761C4260
	Offset: 0x1AE0
	Size: 0xBA
	Parameters: 1
	Flags: Linked
*/
function set_demeanor(var_5207b7a8)
{
	switch(var_5207b7a8)
	{
		case "alert":
		case "patrol":
		case "combat":
		case "cqb":
		{
			self ai::set_behavior_attribute("_human_demeanor", var_5207b7a8);
			break;
		}
		default:
		{
			/#
				assertmsg(("" + var_5207b7a8) + "");
			#/
		}
	}
}

/*
	Name: function_53531f27
	Namespace: namespace_c25eb016
	Checksum: 0x2FC6A1F9
	Offset: 0x1BA8
	Size: 0x7C
	Parameters: 2
	Flags: Linked
*/
function function_53531f27(str_trigger_name, str_val)
{
	if(!isdefined(str_val))
	{
		str_val = "targetname";
	}
	trig = getent(str_trigger_name, str_val);
	if(isdefined(trig) && trig istriggerenabled())
	{
		trig trigger::use();
	}
}

/*
	Name: function_cdc39aec
	Namespace: namespace_c25eb016
	Checksum: 0x2437917D
	Offset: 0x1C30
	Size: 0x5C
	Parameters: 0
	Flags: None
*/
function function_cdc39aec()
{
	if(isalive(self))
	{
		self val::reset(#"hash_13ccb82fb7f72765", "magic_bullet_shield");
		self deletedelay();
	}
}

/*
	Name: function_d291d5c2
	Namespace: namespace_c25eb016
	Checksum: 0xF9A28A9E
	Offset: 0x1C98
	Size: 0xD4
	Parameters: 1
	Flags: None
*/
function function_d291d5c2(var_ebc9fa6c)
{
	if(!isdefined(var_ebc9fa6c))
	{
		var_ebc9fa6c = 0;
	}
	var_ffbbfc35 = [];
	var_ffbbfc35[0] = function_e1449992(level.woods, "Woods's test dialogue.", "Woods's test radio dialogue.");
	var_ffbbfc35[1] = function_e1449992(level.player, "Player's test dialogue.");
	var_ffbbfc35[2] = function_e1449992(level.redshirt, undefined, "Bob's test dialogue.");
	vo_knockout_manager("test_knockout_dialogue", var_ffbbfc35, var_ebc9fa6c);
}

/*
	Name: function_e1449992
	Namespace: namespace_c25eb016
	Checksum: 0xEC49DA8D
	Offset: 0x1D78
	Size: 0xAE
	Parameters: 3
	Flags: Linked
*/
function function_e1449992(e_speaker, var_8a9a3456, var_cb47fc62)
{
	/#
		assert(isdefined(e_speaker));
	#/
	/#
		assert(isdefined(var_8a9a3456) || isdefined(var_cb47fc62));
	#/
	s = spawnstruct();
	s.e_speaker = e_speaker;
	if(isdefined(var_8a9a3456))
	{
		s.var_8a9a3456 = var_8a9a3456;
	}
	if(isdefined(var_cb47fc62))
	{
		s.var_cb47fc62 = var_cb47fc62;
	}
	return s;
}

/*
	Name: vo_knockout_manager
	Namespace: namespace_c25eb016
	Checksum: 0xC6EB4C07
	Offset: 0x1E30
	Size: 0x124
	Parameters: 7
	Flags: Linked
*/
function vo_knockout_manager(str_id, var_ffbbfc35, var_ebc9fa6c, var_d9930d91, var_d9e780d7, var_13cb5e17, var_8ad68e5f)
{
	if(!isdefined(var_d9930d91))
	{
		var_d9930d91 = 1;
	}
	if(!isdefined(level.var_2f6b8bdb))
	{
		level.var_2f6b8bdb = [];
	}
	if(!isdefined(level.var_2f6b8bdb[str_id]))
	{
		level.var_2f6b8bdb[str_id] = [];
		for(i = 0; i < var_ffbbfc35.size; i++)
		{
			var_ffbbfc35[i].var_d9e780d7 = var_d9e780d7;
			var_ffbbfc35[i].var_13cb5e17 = var_13cb5e17;
			var_ffbbfc35[i].var_8ad68e5f = var_8ad68e5f;
			var_ffbbfc35[i].b_used = 0;
			level.var_2f6b8bdb[str_id][i] = var_ffbbfc35[i];
		}
	}
	vo_knockout_manager_dialogue(str_id, var_ebc9fa6c, var_d9930d91);
}

/*
	Name: vo_knockout_manager_dialogue
	Namespace: namespace_c25eb016
	Checksum: 0xA045A008
	Offset: 0x1F60
	Size: 0x28C
	Parameters: 3
	Flags: Linked
*/
function vo_knockout_manager_dialogue(str_id, var_ebc9fa6c, var_d9930d91)
{
	if(var_d9930d91 == 0)
	{
		do_abort = 1;
		foreach(s in level.var_2f6b8bdb[str_id])
		{
			if(s.b_used == 0)
			{
				do_abort = 0;
				break;
			}
		}
		if(do_abort == 1)
		{
			return;
		}
	}
	level.var_2f6b8bdb[str_id] = vo_knockout_manager_reset_check(level.var_2f6b8bdb[str_id]);
	i = vo_knockout_manager_get_random(level.var_2f6b8bdb[str_id]);
	level.var_2f6b8bdb[str_id][i].b_used = 1;
	if(isdefined(level.var_2f6b8bdb[str_id][i].e_speaker))
	{
		e_speaker = undefined;
		if(isentity(level.var_2f6b8bdb[str_id][i].e_speaker))
		{
			e_speaker = level.var_2f6b8bdb[str_id][i].e_speaker;
		}
		else
		{
			/#
				iprintlnbold("");
			#/
		}
		if(!isdefined(e_speaker.animname))
		{
			e_speaker.animname = "generic";
		}
		if(!isdefined(var_ebc9fa6c) || var_ebc9fa6c == 0)
		{
			e_speaker thread dialogue(level.var_2f6b8bdb[str_id][i].var_8a9a3456);
		}
		else
		{
			e_speaker thread dialogue(level.var_2f6b8bdb[str_id][i].var_cb47fc62, 1);
		}
	}
}

/*
	Name: vo_knockout_manager_reset_check
	Namespace: namespace_c25eb016
	Checksum: 0x64B1D124
	Offset: 0x21F8
	Size: 0xC6
	Parameters: 1
	Flags: Linked
*/
function vo_knockout_manager_reset_check(a_s)
{
	foreach(s in a_s)
	{
		if(s.b_used == 0)
		{
			return a_s;
		}
	}
	for(i = 0; i < a_s.size; i++)
	{
		a_s[i].b_used = 0;
	}
	return a_s;
}

/*
	Name: vo_knockout_manager_get_random
	Namespace: namespace_c25eb016
	Checksum: 0xAAB576EB
	Offset: 0x22C8
	Size: 0xE4
	Parameters: 1
	Flags: Linked
*/
function vo_knockout_manager_get_random(a_s)
{
	i = randomintrange(0, a_s.size);
	var_9e522061 = 0;
	var_fe0d73e0 = int(a_s.size * a_s.size);
	while(a_s[i].b_used == 1)
	{
		i = randomintrange(0, a_s.size);
		var_9e522061++;
		if(var_9e522061 > var_fe0d73e0)
		{
			for(j = 0; j < a_s.size; j++)
			{
				if(a_s[j].b_used == 0)
				{
					return j;
				}
			}
		}
	}
	return i;
}

/*
	Name: function_3ab6b4b0
	Namespace: namespace_c25eb016
	Checksum: 0x4A6DE4A2
	Offset: 0x23B8
	Size: 0xC2
	Parameters: 4
	Flags: None
*/
function function_3ab6b4b0(var_fa4801bb, n_min, n_max, str_endon)
{
	/#
		assert(n_min > 0, "");
	#/
	self endon(str_endon);
	b_randomize = n_min != n_max;
	n_wait = 0;
	if(!b_randomize)
	{
		n_wait = n_min;
	}
	while(true)
	{
		if(b_randomize)
		{
			n_wait = randomfloatrange(n_min, n_max);
		}
		wait(n_wait);
		[[var_fa4801bb]]();
	}
}

/*
	Name: init_containment
	Namespace: namespace_c25eb016
	Checksum: 0xB1F10D36
	Offset: 0x2488
	Size: 0xB0
	Parameters: 0
	Flags: None
*/
function init_containment()
{
	a_t = getentarray("trigger_out_of_bounds", "classname");
	foreach(t in a_t)
	{
		t triggerenable(0);
	}
}

/*
	Name: function_eaa0342e
	Namespace: namespace_c25eb016
	Checksum: 0xE470350B
	Offset: 0x2540
	Size: 0x190
	Parameters: 2
	Flags: None
*/
function function_eaa0342e(var_8764771, var_64fdcdec)
{
	level notify(#"hash_1cbb37dbc19ef261");
	if(isdefined(var_8764771))
	{
		if(!isarray(var_8764771))
		{
			var_8764771 = [0:var_8764771];
		}
		foreach(str in var_8764771)
		{
			level thread function_3b72c20(str);
		}
	}
	if(isdefined(var_64fdcdec))
	{
		if(!isarray(var_64fdcdec))
		{
			var_64fdcdec = [0:var_64fdcdec];
		}
		foreach(str in var_64fdcdec)
		{
			level thread function_35fdfa10(str);
		}
	}
}

/*
	Name: function_3b72c20
	Namespace: namespace_c25eb016
	Checksum: 0xA8875F91
	Offset: 0x26D8
	Size: 0xD0
	Parameters: 1
	Flags: Linked
*/
function function_3b72c20(str_targetname)
{
	a_t = getentarray(str_targetname, "targetname");
	foreach(t in a_t)
	{
		t thread function_4f1192f6();
		/#
			t thread function_bc0a80c();
		#/
	}
}

/*
	Name: function_4f1192f6
	Namespace: namespace_c25eb016
	Checksum: 0x23684572
	Offset: 0x27B0
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_4f1192f6()
{
	self triggerenable(1);
	level waittill(#"hash_1cbb37dbc19ef261");
	self triggerenable(0);
}

/*
	Name: function_bc0a80c
	Namespace: namespace_c25eb016
	Checksum: 0x20310BCD
	Offset: 0x2808
	Size: 0xBE
	Parameters: 0
	Flags: None
*/
function function_bc0a80c()
{
	/#
		level endon(#"hash_1cbb37dbc19ef261");
		while(true)
		{
			if(isdefined(getdvar(#"hash_5783d5fbedee8801")) && !getdvar(#"hash_5783d5fbedee8801"))
			{
				self triggerenable(0);
				waitframe(1);
				continue;
			}
			else
			{
				self triggerenable(1);
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_35fdfa10
	Namespace: namespace_c25eb016
	Checksum: 0x7CE9C5B8
	Offset: 0x28D0
	Size: 0xB8
	Parameters: 1
	Flags: Linked
*/
function function_35fdfa10(str_targetname)
{
	var_fa32edcf = getentarray(str_targetname, "targetname");
	foreach(vol in var_fa32edcf)
	{
		level thread function_d0f58bc6(vol);
	}
}

/*
	Name: function_d0f58bc6
	Namespace: namespace_c25eb016
	Checksum: 0x72872FD1
	Offset: 0x2990
	Size: 0x106
	Parameters: 1
	Flags: Linked
*/
function function_d0f58bc6(vol)
{
	level endon(#"hash_1cbb37dbc19ef261");
	level.player endon(#"death");
	while(true)
	{
		/#
			if(isdefined(getdvar(#"hash_5783d5fbedee8801")) && !getdvar(#"hash_5783d5fbedee8801"))
			{
				waitframe(1);
				continue;
			}
		#/
		if(level.player istouching(vol))
		{
			util::missionfailedwrapper_nodeath(#"hash_4ee2d7dccb9b2b02");
			level notify(#"hash_1cbb37dbc19ef261");
			break;
		}
		waitframe(1);
	}
}

/*
	Name: function_b72c5f95
	Namespace: namespace_c25eb016
	Checksum: 0xFA8CAC3D
	Offset: 0x2AA0
	Size: 0x2BA
	Parameters: 5
	Flags: None
*/
function function_b72c5f95(var_7b23aa51, var_4e0e5493, var_e58f924c, var_b8c7d3b1, var_e4ea7483)
{
	if(!isdefined(var_7b23aa51))
	{
		var_7b23aa51 = 400;
	}
	if(!isdefined(var_4e0e5493))
	{
		var_4e0e5493 = 250;
	}
	if(!isdefined(var_e58f924c))
	{
		var_e58f924c = 250;
	}
	if(!isdefined(var_b8c7d3b1))
	{
		var_b8c7d3b1 = 10;
	}
	if(!isdefined(var_e4ea7483))
	{
		var_e4ea7483 = 0;
	}
	self endon(#"death", #"hash_5b54b2be0ce0cc0c");
	while(true)
	{
		wait(randomfloatrange(0.25, 1.25));
		if(!isalive(level.player))
		{
			break;
		}
		var_91d1913b = distance2d(self.origin, level.player.origin);
		if(var_91d1913b < var_7b23aa51)
		{
			/#
				if(var_e4ea7483)
				{
					iprintlnbold(var_91d1913b);
				}
			#/
			continue;
		}
		else
		{
			var_dd1c8802 = anglestoforward(level.player.angles);
			if(level.player issprinting())
			{
				var_9489a1b6 = var_4e0e5493 * 3;
			}
			else
			{
				var_9489a1b6 = var_4e0e5493;
			}
			var_efe6e9a0 = level.player.origin + (var_dd1c8802 * var_9489a1b6);
			/#
				if(var_e4ea7483)
				{
					sphere(var_efe6e9a0, 10, (1, 0, 0), 0.5, 0, 20, 60);
					circle(var_efe6e9a0, var_e58f924c, (1, 0, 0), 0, 1, 60);
				}
			#/
			v_goal_pos = getrandomnavpoint(var_efe6e9a0, var_e58f924c, self getpathfindingradius());
			if(isdefined(v_goal_pos))
			{
				self setgoal(v_goal_pos, 1);
				self waittilltimeout(var_b8c7d3b1, #"goal");
			}
		}
	}
}

/*
	Name: function_d370236e
	Namespace: namespace_c25eb016
	Checksum: 0xFF57519F
	Offset: 0x2D68
	Size: 0x796
	Parameters: 4
	Flags: None
*/
function function_d370236e(target, var_7b23aa51, var_e544dc47, var_b1f9c3ce)
{
	if(!isdefined(var_7b23aa51))
	{
		var_7b23aa51 = 500;
	}
	if(!isdefined(var_e544dc47))
	{
		var_e544dc47 = 400;
	}
	if(!isdefined(var_b1f9c3ce))
	{
		var_b1f9c3ce = "ally_follow_player_tacquery";
	}
	self endon(#"death", #"hash_5b54b2be0ce0cc0c");
	coverdirection = undefined;
	var_5134ce37 = 0;
	self childthread function_c68d3621(target, var_7b23aa51);
	while(true)
	{
		if(!isalive(target))
		{
			self function_a4a30cfd();
			return;
		}
		var_9a396209 = isdefined(self.combatstate) && self.combatstate == "combat_state_in_combat";
		if(var_9a396209 && isdefined(self.enemy) && isalive(self.enemy))
		{
			coverdirection = vectornormalize(self.enemy.origin - self.origin);
			var_5134ce37 = 1;
		}
		else if(!var_5134ce37)
		{
			coverdirection = vectornormalize(target.origin - self.origin);
		}
		if(var_9a396209)
		{
			self.avoid_cover = undefined;
			self setgoal(target.origin, 0, var_e544dc47);
			self notify(#"hash_3ff11304576a123a");
			result = undefined;
			result = self waittill(#"hash_4f2aaaef2327c2a9", #"hash_1c5b621b87bcbdc6");
			/#
				if(getdvarint(#"hash_7f1fd7271ba70c67", 0) == 1)
				{
					if(result._notify == #"hash_4f2aaaef2327c2a9")
					{
						record3dtext("", self.origin + vectorscale((0, 0, 1), 32), (1, 1, 1));
					}
					else if(result._notify == #"hash_1c5b621b87bcbdc6")
					{
						record3dtext("", self.origin + vectorscale((0, 0, 1), 32), (1, 1, 1));
					}
				}
			#/
			continue;
		}
		var_15efcda0 = target.origin + (coverdirection * 1000);
		var_5f67409 = target.origin + (anglestoforward(target.angles) * 1000);
		tacpoints = tacticalquery(var_b1f9c3ce, target, self, var_15efcda0, var_5f67409);
		/#
			if(getdvarint(#"hash_7f1fd7271ba70c67", 0) == 1)
			{
				recordcircle(target.origin, 500, (1, 1, 1), "", self);
				recordcircle(target.origin, 100, (1, 0, 0), "", self);
				recordcircle(target.origin, 25, (1, 0, 1), "", self);
				recordline(target.origin, var_15efcda0, (1, 0, 0), "", self);
				recordline(target.origin, var_5f67409, (1, 0, 1), "", self);
			}
		#/
		pickedpoint = undefined;
		var_be34b5c6 = undefined;
		if(isdefined(tacpoints))
		{
			if(tacpoints.size == 0)
			{
				pickedpoint = getrandomnavpoint(target.origin, var_7b23aa51, self getpathfindingradius());
				if(!isdefined(pickedpoint))
				{
					pickedpoint = target.origin;
				}
			}
			else
			{
				foreach(tacpoint in tacpoints)
				{
					if(!self isposinclaimedlocation(tacpoint.origin))
					{
						pickedpoint = tacpoint.origin;
						var_be34b5c6 = tacpoint.node;
						break;
					}
				}
			}
		}
		if(isdefined(pickedpoint))
		{
			pickedpoint = getclosestpointonnavmesh(pickedpoint, 64, 16);
			if(isdefined(pickedpoint))
			{
				self notify(#"hash_3ff11304576a123a");
				if(isdefined(var_be34b5c6))
				{
					self.avoid_cover = undefined;
					self setgoal(var_be34b5c6, 1);
				}
				else
				{
					self.avoid_cover = 1;
					self setgoal(pickedpoint, 1);
					self childthread function_8b562a1(target, pickedpoint);
				}
				result = undefined;
				result = self waittill(#"hash_4f2aaaef2327c2a9", #"hash_1c5b621b87bcbdc6");
				/#
					if(getdvarint(#"hash_7f1fd7271ba70c67", 0) == 1)
					{
						if(result._notify == #"hash_4f2aaaef2327c2a9")
						{
							record3dtext("", self.origin + vectorscale((0, 0, 1), 32), (1, 1, 1));
						}
						else if(result._notify == #"hash_1c5b621b87bcbdc6")
						{
							record3dtext("", self.origin + vectorscale((0, 0, 1), 32), (1, 1, 1));
						}
					}
				#/
				continue;
			}
		}
		self setgoal(self.origin, 0, var_e544dc47);
		wait(2);
	}
}

/*
	Name: function_a4a30cfd
	Namespace: namespace_c25eb016
	Checksum: 0x1EFCC55
	Offset: 0x3508
	Size: 0x1E
	Parameters: 0
	Flags: Linked
*/
function function_a4a30cfd()
{
	self.avoid_cover = undefined;
	self notify(#"hash_5b54b2be0ce0cc0c");
}

/*
	Name: function_8b562a1
	Namespace: namespace_c25eb016
	Checksum: 0xC94FFB14
	Offset: 0x3530
	Size: 0x164
	Parameters: 2
	Flags: Linked
*/
function function_8b562a1(target, pickedpoint)
{
	self endon(#"death", #"hash_3ff11304576a123a", #"hash_5b54b2be0ce0cc0c");
	while(distance2dsquared(pickedpoint, self.origin) > 16384)
	{
		waitframe(1);
	}
	var_713b0ea4 = generatenavmeshpath(pickedpoint, target.origin, self);
	if(isdefined(var_713b0ea4.pathpoints) && isdefined(var_713b0ea4.pathpoints[1]))
	{
		facedirection = var_713b0ea4.pathpoints[1] - pickedpoint;
	}
	else
	{
		facedirection = target.origin - pickedpoint;
	}
	facedirection = vectornormalize((facedirection[0], facedirection[1], 0));
	faceangles = vectortoangles(facedirection);
	self setgoal(pickedpoint, 1, undefined, undefined, faceangles);
}

/*
	Name: function_c68d3621
	Namespace: namespace_c25eb016
	Checksum: 0x16988DBB
	Offset: 0x36A0
	Size: 0x204
	Parameters: 2
	Flags: Linked
*/
function function_c68d3621(target, var_7b23aa51)
{
	self endon(#"death", #"hash_5b54b2be0ce0cc0c");
	incombat = 0;
	startposition = target.origin;
	var_b7c3473e = gettime();
	while(isalive(target))
	{
		waitframe(1);
		if(!isalive(target))
		{
			break;
		}
		var_9bbf2d1a = distance2dsquared(startposition, target.origin);
		if(util::time_has_passed(var_b7c3473e, 1.5))
		{
			var_713b0ea4 = generatenavmeshpath(startposition, target.origin, self);
			if(isdefined(var_713b0ea4) && isdefined(var_713b0ea4.pathdistance))
			{
				var_9bbf2d1a = var_713b0ea4.pathdistance * var_713b0ea4.pathdistance;
			}
			var_b7c3473e = gettime();
		}
		if(var_9bbf2d1a > var_7b23aa51 * var_7b23aa51)
		{
			self notify(#"hash_4f2aaaef2327c2a9");
			startposition = target.origin;
			continue;
		}
		var_9a396209 = isdefined(self.combatstate) && self.combatstate == "combat_state_in_combat";
		var_8d755a9a = !incombat && var_9a396209;
		incombat = var_9a396209;
		if(var_8d755a9a)
		{
			self notify(#"hash_1c5b621b87bcbdc6");
			continue;
		}
	}
	self function_a4a30cfd();
}

/*
	Name: function_150e9e66
	Namespace: namespace_c25eb016
	Checksum: 0xD84BF8D9
	Offset: 0x38B0
	Size: 0xD4
	Parameters: 1
	Flags: None
*/
function function_150e9e66(b_on)
{
	if(!isdefined(b_on))
	{
		b_on = 1;
	}
	self vehicle::toggle_tread_fx(b_on);
	self vehicle::toggle_exhaust_fx(b_on);
	self vehicle::toggle_sounds(b_on);
	if(b_on)
	{
		self vehicle::lights_on();
		self setrotorspeed(1);
	}
	else
	{
		self vehicle::lights_off();
		self setrotorspeed(0);
	}
}

/*
	Name: function_e1015abd
	Namespace: namespace_c25eb016
	Checksum: 0xB724E66D
	Offset: 0x3990
	Size: 0x52
	Parameters: 0
	Flags: None
*/
function function_e1015abd()
{
	v_angles = (randomfloatrange(0, 360), randomfloatrange(0, 360), 0);
	return anglestoforward(v_angles);
}

/*
	Name: function_b649cf93
	Namespace: namespace_c25eb016
	Checksum: 0xAD038523
	Offset: 0x39F0
	Size: 0x3A
	Parameters: 0
	Flags: None
*/
function function_b649cf93()
{
	v_angles = (0, randomfloatrange(0, 360), 0);
	return anglestoforward(v_angles);
}

/*
	Name: function_23271c2f
	Namespace: namespace_c25eb016
	Checksum: 0x4761A433
	Offset: 0x3A38
	Size: 0x4A
	Parameters: 1
	Flags: None
*/
function function_23271c2f(str_team)
{
	/#
		assert(isai(self), "");
	#/
	self.team = str_team;
}

/*
	Name: function_477de16b
	Namespace: namespace_c25eb016
	Checksum: 0x993AC043
	Offset: 0x3A90
	Size: 0x222
	Parameters: 4
	Flags: Variadic
*/
function function_477de16b(var_b5311063, name_or_spawners, spawn_func, ...)
{
	if(var_b5311063 <= 0)
	{
		return;
	}
	spawners = [];
	if(isstring(name_or_spawners))
	{
		spawners = getspawnerarray(name_or_spawners, "targetname");
		/#
			assert(spawners.size, ("" + name_or_spawners) + "");
		#/
	}
	else
	{
		if(!isdefined(name_or_spawners))
		{
			name_or_spawners = [];
		}
		else if(!isarray(name_or_spawners))
		{
			name_or_spawners = array(name_or_spawners);
		}
		spawners = name_or_spawners;
	}
	a_spawned = [];
	bforcespawn = vararg[5];
	foreach(sp in spawners)
	{
		if(index >= var_b5311063)
		{
			break;
		}
		e_spawned = sp spawner::spawn(bforcespawn);
		if(isdefined(e_spawned))
		{
			if(isdefined(spawn_func))
			{
				util::single_thread_argarray(e_spawned, spawn_func, vararg);
			}
			if(!isdefined(a_spawned))
			{
				a_spawned = [];
			}
			else if(!isarray(a_spawned))
			{
				a_spawned = array(a_spawned);
			}
			a_spawned[a_spawned.size] = e_spawned;
		}
	}
	return a_spawned;
}

/*
	Name: function_65ec34cf
	Namespace: namespace_c25eb016
	Checksum: 0xF1B49C7A
	Offset: 0x3CC0
	Size: 0x7A
	Parameters: 4
	Flags: None
*/
function function_65ec34cf(n_value, n_step, n_min, n_max)
{
	n_new_value = n_value + n_step;
	n_size = (n_max - n_min) + 1;
	if(n_new_value < n_min)
	{
		n_new_value = n_new_value + n_size;
	}
	else if(n_new_value > n_max)
	{
		n_new_value = n_new_value - n_size;
	}
	return n_new_value;
}

/*
	Name: function_7051ec77
	Namespace: namespace_c25eb016
	Checksum: 0xAEF3ED70
	Offset: 0x3D48
	Size: 0x4C
	Parameters: 2
	Flags: None
*/
function function_7051ec77(var_adbdb929, value)
{
	self endon(#"death");
	while(self [[var_adbdb929]]() !== value)
	{
		wait(0.1);
	}
}

/*
	Name: function_a7607f
	Namespace: namespace_c25eb016
	Checksum: 0xB05C88D6
	Offset: 0x3DA0
	Size: 0xD8
	Parameters: 2
	Flags: None
*/
function function_a7607f(a_things, str_key)
{
	a_new = [];
	foreach(thing in a_things)
	{
		/#
			assert(isdefined(thing.(str_key)), "" + str_key);
		#/
		a_new[thing.(str_key)] = thing;
	}
	return a_new;
}

/*
	Name: function_ad6fd59c
	Namespace: namespace_c25eb016
	Checksum: 0x36D9A691
	Offset: 0x3E80
	Size: 0x15C
	Parameters: 1
	Flags: None
*/
function function_ad6fd59c(var_a81df2cc)
{
	if(!isdefined(var_a81df2cc))
	{
		var_a81df2cc = 1;
	}
	a_weapons = self getweaponslist();
	if(var_a81df2cc)
	{
		foreach(weapon in a_weapons)
		{
			if(weapon.islethalgrenade)
			{
				return weapon;
			}
		}
	}
	else
	{
		foreach(weapon in a_weapons)
		{
			if(weapon.istacticalgrenade || weapon.name === #"eq_stimshot")
			{
				return weapon;
			}
		}
	}
}

/*
	Name: function_f9279027
	Namespace: namespace_c25eb016
	Checksum: 0x343408FB
	Offset: 0x3FE8
	Size: 0x98
	Parameters: 1
	Flags: None
*/
function function_f9279027(var_8500c3b7)
{
	foreach(var_9fbd6e74 in var_8500c3b7)
	{
		if(self hasweapon(var_9fbd6e74))
		{
			return var_9fbd6e74;
		}
	}
}

/*
	Name: function_9af8437c
	Namespace: namespace_c25eb016
	Checksum: 0x1BD20C46
	Offset: 0x4090
	Size: 0xC8
	Parameters: 4
	Flags: None
*/
function function_9af8437c(var_ce6e52bd, v_goal_pos, var_b7925ab5, var_9be70610)
{
	if(!isdefined(var_b7925ab5))
	{
		var_b7925ab5 = "shutoff_ally_follow_state";
	}
	if(!isdefined(var_9be70610))
	{
		var_9be70610 = 0;
	}
	foreach(ai_ally in self)
	{
		ai_ally function_2f50100e(var_ce6e52bd, v_goal_pos, var_b7925ab5, var_9be70610);
	}
}

/*
	Name: function_2f50100e
	Namespace: namespace_c25eb016
	Checksum: 0x37A48F19
	Offset: 0x4160
	Size: 0x478
	Parameters: 4
	Flags: Linked
*/
function function_2f50100e(var_ce6e52bd, v_goal_pos, var_b7925ab5, var_9be70610)
{
	if(!isdefined(var_b7925ab5))
	{
		var_b7925ab5 = "shutoff_ally_follow_state";
	}
	if(!isdefined(var_9be70610))
	{
		var_9be70610 = 0;
	}
	self endoncallback(&function_3f51d85c, #"death", var_b7925ab5);
	self notify("1298b0818e0c5635");
	self endon("1298b0818e0c5635");
	if(!isdefined(self.var_dfd2d506))
	{
		self.var_dfd2d506 = 1;
	}
	self function_9ae1c50();
	switch(var_ce6e52bd)
	{
		case "hash_4ad8a881d34f1061":
		{
			var_9bf924b8 = -250;
			var_889e45c = -650;
			var_e5ba320e = -1050;
			break;
		}
		case "hash_35ece8f44b3ec269":
		{
			var_9bf924b8 = 500;
			var_889e45c = 0;
			var_e5ba320e = -500;
			break;
		}
		case "hash_a78417145803116":
		{
			var_9bf924b8 = 1050;
			var_889e45c = 650;
			var_e5ba320e = 250;
			break;
		}
		default:
		{
			/#
				assert(1, "");
			#/
		}
	}
	var_2431c996 = 0;
	var_f8a9678c = undefined;
	str_current = undefined;
	while(true)
	{
		if(is_true(self.var_dfd2d506))
		{
			if(var_9be70610)
			{
				var_8000281 = distance(self.origin, v_goal_pos);
				var_96e16c65 = distance(level.player.origin, v_goal_pos);
			}
			else
			{
				var_8000281 = distance2d(self.origin, v_goal_pos);
				var_96e16c65 = distance2d(level.player.origin, v_goal_pos);
			}
			n_distance = var_96e16c65 - var_8000281;
			if(n_distance > var_9bf924b8)
			{
				if(var_f8a9678c === "walk")
				{
					var_2431c996 = var_2431c996 + 0.1;
				}
				else
				{
					var_f8a9678c = "walk";
					var_2431c996 = 0;
				}
			}
			else
			{
				if(n_distance > var_889e45c)
				{
					if(var_f8a9678c === "jog")
					{
						var_2431c996 = var_2431c996 + 0.1;
					}
					else
					{
						var_f8a9678c = "jog";
						var_2431c996 = 0;
					}
				}
				else
				{
					if(n_distance > var_e5ba320e)
					{
						if(var_f8a9678c === "run")
						{
							var_2431c996 = var_2431c996 + 0.1;
						}
						else
						{
							var_f8a9678c = "run";
							var_2431c996 = 0;
						}
					}
					else
					{
						if(var_f8a9678c === "sprint")
						{
							var_2431c996 = var_2431c996 + 0.1;
						}
						else
						{
							var_f8a9678c = "sprint";
							var_2431c996 = 0;
						}
					}
				}
			}
			if(var_2431c996 >= 1 && (!isdefined(str_current) || str_current != var_f8a9678c))
			{
				/#
					if(getdvarint(#"hash_4b1b931855fe49c3", 0))
					{
						iprintlnbold("" + var_f8a9678c);
					}
				#/
				str_current = var_f8a9678c;
				if(var_f8a9678c == "sprint")
				{
					self function_2ce879d2(265);
				}
				else
				{
					self function_2ce879d2(var_f8a9678c);
				}
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_3f51d85c
	Namespace: namespace_c25eb016
	Checksum: 0xFD0D82DA
	Offset: 0x45E0
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3f51d85c(notifyhash)
{
	self function_9ae1c50();
}

/*
	Name: function_65d14a19
	Namespace: namespace_c25eb016
	Checksum: 0x73C2A73C
	Offset: 0x4610
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function function_65d14a19(weapon)
{
	/#
		assert(weapon != level.weaponnone, "");
	#/
	self aiutility::setprimaryweapon(weapon);
	self ai::gun_remove();
	self ai::gun_switchto(weapon, "right");
}

/*
	Name: throw_grenade
	Namespace: namespace_c25eb016
	Checksum: 0x127C8894
	Offset: 0x46A8
	Size: 0x1DC
	Parameters: 2
	Flags: None
*/
function throw_grenade(v_target, var_9ff6ef8f)
{
	if(!isdefined(var_9ff6ef8f))
	{
		var_9ff6ef8f = 0;
	}
	/#
		assert(isai(self), "");
	#/
	/#
		assert(isvec(v_target), "");
	#/
	self endon(#"death");
	if(self flag::get(#"scripted_grenade_throw"))
	{
		/#
			print("");
		#/
		return;
	}
	self flag::set(#"scripted_grenade_throw");
	if(!isdefined(self.grenadeammo))
	{
		self.grenadeammo = 0;
	}
	if(self.grenadeammo == 0 && var_9ff6ef8f)
	{
		self.grenadeammo = 1;
	}
	if(self.grenadeammo != 0)
	{
		self.var_38754eac = v_target;
		while(true)
		{
			var_29b8f3d0 = undefined;
			var_29b8f3d0 = self waittill(#"bhtn_action_terminate");
			if(var_29b8f3d0.action === #"grenade")
			{
				break;
			}
		}
		self.var_38754eac = undefined;
	}
	self flag::clear(#"scripted_grenade_throw");
}

/*
	Name: function_b064d2a4
	Namespace: namespace_c25eb016
	Checksum: 0x71DBBAA6
	Offset: 0x4890
	Size: 0x590
	Parameters: 5
	Flags: None
*/
function function_b064d2a4(var_6bb4ec43, v_goal_pos, var_b7925ab5, var_2b536bb3, var_9be70610)
{
	if(!isdefined(var_b7925ab5))
	{
		var_b7925ab5 = "shutoff_player_dynamic_speedscaling";
	}
	if(!isdefined(var_2b536bb3))
	{
		var_2b536bb3 = 1;
	}
	if(!isdefined(var_9be70610))
	{
		var_9be70610 = 0;
	}
	level endoncallback(&function_10e1aa28, var_b7925ab5);
	level.player endoncallback(&function_10e1aa28, var_b7925ab5, #"death");
	self notify("4f7b6d405030a1a6");
	self endon("4f7b6d405030a1a6");
	e_player = level.player;
	if(var_2b536bb3 < 0)
	{
		var_2b536bb3 = 0;
	}
	else if(var_2b536bb3 > 1)
	{
		var_2b536bb3 = 1;
	}
	e_player.var_7cb8999 = var_2b536bb3;
	switch(var_6bb4ec43)
	{
		case "walk":
		{
			var_133f0647 = 0.5;
			var_b89dea0e = 0.55;
			var_e7783b69 = 0.6;
			var_c7d0242c = 0.65;
			var_270ea048 = 0.7;
			var_9658ea43 = 50;
			var_f7abe58 = 75;
			var_3ebb2225 = 100;
			var_d67a7d0a = 125;
			break;
		}
		case "jog":
		{
			var_133f0647 = 0.6;
			var_b89dea0e = 0.65;
			var_e7783b69 = 0.7;
			var_c7d0242c = 0.75;
			var_270ea048 = 0.8;
			var_9658ea43 = 100;
			var_f7abe58 = 135;
			var_3ebb2225 = 170;
			var_d67a7d0a = 205;
			break;
		}
		case "run":
		{
			var_133f0647 = 0.7;
			var_b89dea0e = 0.75;
			var_e7783b69 = 0.8;
			var_c7d0242c = 0.85;
			var_270ea048 = 0.9;
			var_9658ea43 = 150;
			var_f7abe58 = 195;
			var_3ebb2225 = 240;
			var_d67a7d0a = 285;
			break;
		}
		case "sprint":
		{
			var_133f0647 = 0.8;
			var_b89dea0e = 0.85;
			var_e7783b69 = 0.9;
			var_c7d0242c = 0.95;
			var_270ea048 = 1;
			var_9658ea43 = 200;
			var_f7abe58 = 255;
			var_3ebb2225 = 310;
			var_d67a7d0a = 365;
			break;
		}
		default:
		{
			/#
				assert(1, "");
			#/
		}
	}
	var_ab3e25a2 = e_player getmovespeedscale();
	var_7d7ccfc0 = 0;
	while(true)
	{
		if(var_9be70610 == 1)
		{
			var_d85a63f6 = distance(e_player.origin, v_goal_pos);
			var_d1764ea = distance(self.origin, v_goal_pos);
		}
		else
		{
			var_d85a63f6 = distance2d(e_player.origin, v_goal_pos);
			var_d1764ea = distance2d(self.origin, v_goal_pos);
		}
		var_2b5e41bc = var_d85a63f6 - var_d1764ea;
		if(var_2b5e41bc < 0)
		{
			e_player flag::set("player_is_ahead_of_ally");
		}
		else
		{
			e_player flag::clear("player_is_ahead_of_ally");
		}
		if(var_2b5e41bc > var_d67a7d0a)
		{
			var_7d7ccfc0 = var_270ea048;
		}
		else
		{
			if(var_2b5e41bc < var_9658ea43)
			{
				var_7d7ccfc0 = var_133f0647;
			}
			else
			{
				if(var_2b5e41bc < var_f7abe58)
				{
					var_7d7ccfc0 = var_b89dea0e;
				}
				else
				{
					if(var_2b5e41bc < var_3ebb2225)
					{
						var_7d7ccfc0 = var_e7783b69;
					}
					else if(var_2b5e41bc < var_d67a7d0a)
					{
						var_7d7ccfc0 = var_c7d0242c;
					}
				}
			}
		}
		if(var_7d7ccfc0 != var_ab3e25a2)
		{
			n_diff = var_7d7ccfc0 - var_ab3e25a2;
			if(n_diff < 0)
			{
				n_diff = n_diff * -1;
			}
			var_90533e10 = n_diff / (0.2 / 4);
			var_56345404 = 0.5 * var_90533e10;
			var_ab3e25a2 = var_7d7ccfc0;
			e_player util::blend_movespeedscale(var_7d7ccfc0, var_56345404);
		}
		wait(0.1);
	}
}

/*
	Name: function_10e1aa28
	Namespace: namespace_c25eb016
	Checksum: 0x80446D59
	Offset: 0x4E28
	Size: 0x126
	Parameters: 1
	Flags: Linked
*/
function function_10e1aa28(str_notify)
{
	if(isdefined(str_notify) && str_notify != "death")
	{
		n_diff = level.player getmovespeedscale() - level.player.var_7cb8999;
		if(n_diff < 0)
		{
			n_diff = n_diff * -1;
		}
		var_90533e10 = n_diff / (0.2 / 4);
		var_56345404 = 0.5 * var_90533e10;
		if(var_56345404 < 0.1)
		{
			var_56345404 = 0.1;
		}
		else if(var_56345404 > 2)
		{
			var_56345404 = 2;
		}
		level.player util::blend_movespeedscale(level.player.var_7cb8999, var_56345404);
		level.player.var_7cb8999 = undefined;
	}
}

/*
	Name: function_40e4ae8e
	Namespace: namespace_c25eb016
	Checksum: 0x3C3DF079
	Offset: 0x4F58
	Size: 0x9C
	Parameters: 2
	Flags: None
*/
function function_40e4ae8e(str_hint, var_3d455c82)
{
	self endon(#"death");
	self util::create_cursor_hint(undefined, undefined, str_hint, undefined, 0.25, undefined, undefined, undefined, undefined, 1, 1, 1);
	self waittill(#"interact");
	self [[var_3d455c82]]();
	self delete();
}

/*
	Name: function_17fe30b7
	Namespace: namespace_c25eb016
	Checksum: 0x178646D1
	Offset: 0x5000
	Size: 0x122
	Parameters: 0
	Flags: None
*/
function function_17fe30b7()
{
	/#
		assert(isweapon(self), "");
	#/
	var_3f2655c9 = array(getweapon(#"hash_165cf52ce418f5a1"), getweapon(#"hash_40a11ca4961bb778"), getweapon(#"hash_40a11da4961bb92b"), getweapon(#"hash_40a122a4961bc1aa"), getweapon(#"hash_40a123a4961bc35d"), getweapon(#"hash_40a120a4961bbe44"));
	return array::contains(var_3f2655c9, self);
}

/*
	Name: is_explosive
	Namespace: namespace_c25eb016
	Checksum: 0xB41C87E9
	Offset: 0x5130
	Size: 0x10A
	Parameters: 0
	Flags: None
*/
function is_explosive()
{
	if(isdefined(self.mod))
	{
		str_mod = self.mod;
	}
	else if(isdefined(self.smeansofdeath))
	{
		str_mod = self.smeansofdeath;
	}
	if(isdefined(str_mod) && (str_mod == "MOD_GRENADE_SPLASH" || str_mod == "MOD_GRENADE" || str_mod == "MOD_EXPLOSIVE" || str_mod == "MOD_PROJECTILE_SPLASH"))
	{
		if(isdefined(self.weapon) && self.weapon is_tactical_grenade())
		{
			return false;
		}
		return true;
	}
	if(isdefined(self.weapon) && self.weapon.weapclass === "rocketlauncher")
	{
		return true;
	}
	return false;
}

/*
	Name: is_tactical_grenade
	Namespace: namespace_c25eb016
	Checksum: 0x50905DB
	Offset: 0x5248
	Size: 0x46
	Parameters: 0
	Flags: Linked
*/
function is_tactical_grenade()
{
	if(self.weapclass === "grenade" && !is_true(self.islethalgrenade))
	{
		return true;
	}
	return false;
}

/*
	Name: function_ca8302de
	Namespace: namespace_c25eb016
	Checksum: 0x7284C2EA
	Offset: 0x5298
	Size: 0xD2
	Parameters: 0
	Flags: None
*/
function function_ca8302de()
{
	var_7f025395 = "tag_fx_turret_spotlight";
	light_origin = self gettagorigin(var_7f025395);
	var_4ae95b10 = self gettagangles(var_7f025395);
	self.loudspeaker = spawn("script_model", light_origin);
	self.loudspeaker linkto(self, var_7f025395);
	self.loudspeaker.team = "axis";
	self.loudspeaker.name = "APC loudspeaker";
	self.loudspeaker.speaking = 0;
}

/*
	Name: function_a3bb1e9c
	Namespace: namespace_c25eb016
	Checksum: 0x8A423E1F
	Offset: 0x5378
	Size: 0x120
	Parameters: 3
	Flags: None
*/
function function_a3bb1e9c(var_300847ca, var_a5a6c25b, var_94e307c)
{
	if(!isdefined(var_a5a6c25b))
	{
		var_a5a6c25b = "at_player";
	}
	if(!isdefined(var_94e307c))
	{
		var_94e307c = undefined;
	}
	vh_apc = vehicle::simple_spawn_single(var_300847ca);
	vh_apc util::magic_bullet_shield();
	vh_apc.script_team = "axis";
	vh_apc val::set(#"hash_785b0f56c5de70e2", "ignoreme", 1);
	if(isdefined(var_94e307c))
	{
		vh_apc turret::_init_turret(var_94e307c);
		vh_apc thread function_c21ef1d8(var_a5a6c25b);
	}
	else if(!level flag::get("cp_hms_ai_test_chamber"))
	{
		vh_apc thread function_52791e07(var_a5a6c25b);
	}
	return vh_apc;
}

/*
	Name: function_7b8ccc06
	Namespace: namespace_c25eb016
	Checksum: 0xBE6C1599
	Offset: 0x54A0
	Size: 0x1A4
	Parameters: 0
	Flags: None
*/
function function_7b8ccc06()
{
	level flag::wait_till("flg_amk_player_spawned");
	v_target_offset = vectorscale((0, 0, 1), 5);
	self turret::enable(0, 0, v_target_offset);
	self turret::set_burst_parameters(5, 10, 0.2, 0.4, 0);
	self turret::set_target(level.player, vectorscale((0, 0, 1), 5), 0);
	self turret::function_49c3b892(level.player, 0);
	self turret::function_41c79ce4(0, 0);
	self turret::set_ignore_line_of_sight(1, 0);
	self turret::function_8bbe7822(1, 0);
	self turret::set_on_target_angle(1, 0);
	self turret::function_3e5395(0.5, 0);
	self turret::function_f5e3e1de(0, 0);
	self turret::function_9c04d437(0);
	self turret::function_14223170(0);
}

/*
	Name: function_c21ef1d8
	Namespace: namespace_c25eb016
	Checksum: 0xAB3650D
	Offset: 0x5650
	Size: 0x96C
	Parameters: 2
	Flags: Linked
*/
function function_c21ef1d8(var_a5a6c25b, target)
{
	if(!isdefined(var_a5a6c25b))
	{
		var_a5a6c25b = "shoot_player";
	}
	if(!isdefined(target))
	{
		target = undefined;
	}
	level flag::wait_till("flg_amk_player_spawned");
	s_turret = self.a_turrets[0];
	self.fire_mode = var_a5a6c25b;
	self turret::clear_target(0);
	switch(var_a5a6c25b)
	{
		case "scripted":
		{
			if(isdefined(target))
			{
				self turret::set_target(target, (0, 0, 0), 0, 1, 1);
			}
			self turret::function_49c3b892(undefined, 0);
			self turret::function_41c79ce4(1, 0);
			self turret::set_on_target_angle(0.1, 0);
			self turret::set_ignore_line_of_sight(1, 0);
			self turret::function_8bbe7822(1, 0);
			self turret::function_f5e3e1de(0, 0);
			self turret::function_9c04d437(1, 0);
			self turret::function_14223170(0);
			break;
		}
		case "suspend":
		{
			self turret::set_target(level.player, vectorscale((0, 0, 1), 5), 0, 1);
			self turret::function_49c3b892(level.player, 0);
			self turret::set_on_target_angle(0.5, 0);
			self turret::set_ignore_line_of_sight(1, 0);
			self turret::function_8bbe7822(1, 0);
			self turret::function_f5e3e1de(1, 0);
			self turret::function_9c04d437(1, 0);
			self turret::function_14223170(0);
			break;
		}
		case "hash_263828d1b73f1c88":
		{
			self turret::set_target(level.var_9ee055a8, vectorscale((0, 0, 1), 96), 0, 1);
			self turret::function_49c3b892(level.player, 0);
			self turret::function_41c79ce4(0, 0);
			self turret::set_on_target_angle(3, 0);
			self turret::set_ignore_line_of_sight(0, 0);
			self turret::function_8bbe7822(0, 0);
			self turret::function_f5e3e1de(1, 0);
			self turret::function_21827343(0);
			self turret::function_14223170(0);
			break;
		}
		case "hash_5dd6ef287ce43edd":
		{
			self turret::set_target(level.var_9ee055a8, vectorscale((0, 0, 1), 96), 0, 1);
			self turret::function_49c3b892(level.player, 0);
			self turret::function_41c79ce4(0, 0);
			self turret::set_on_target_angle(2, 0);
			self turret::set_ignore_line_of_sight(1, 0);
			self turret::function_8bbe7822(1, 0);
			self turret::function_f5e3e1de(0, 0);
			self turret::function_21827343(0);
			self turret::function_14223170(0);
			break;
		}
		case "miss_player":
		{
			self turret::set_target(level.player, vectorscale((0, 0, 1), 5), 0, 1);
			self turret::function_49c3b892(level.player, 0);
			self turret::function_41c79ce4(0, 0);
			self turret::set_on_target_angle(2.5, 0);
			self turret::set_ignore_line_of_sight(1, 0);
			self turret::function_8bbe7822(1, 0);
			self turret::function_f5e3e1de(1, 0);
			self turret::function_21827343(0);
			self turret::function_14223170(0);
			break;
		}
		case "kill_player":
		{
			self turret::set_target(level.player, vectorscale((0, 0, 1), 5), 0, 1);
			self turret::function_49c3b892(level.player, 0);
			self turret::function_41c79ce4(1, 0);
			self turret::set_on_target_angle(0.5, 0);
			self turret::set_ignore_line_of_sight(1, 0);
			self turret::function_8bbe7822(1, 0);
			self turret::function_f5e3e1de(0, 0);
			self turret::function_21827343(0);
			self turret::function_14223170(0);
			break;
		}
		case "hash_481e638762e002ff":
		{
			self turret::set_target(level.player, vectorscale((0, 0, 1), 5), 0, 1);
			self turret::function_49c3b892(level.player, 0);
			self turret::function_41c79ce4(0, 0);
			self turret::set_on_target_angle(1.5, 0);
			self turret::set_ignore_line_of_sight(0, 0);
			self turret::function_8bbe7822(1, 0);
			self turret::function_f5e3e1de(1, 0);
			self turret::function_21827343(0);
			self turret::function_14223170(0);
			break;
		}
		case "shoot_player":
		default:
		{
			self turret::set_target(level.player, vectorscale((0, 0, 1), 5), 0, 1);
			self turret::function_49c3b892(level.player, 0);
			self turret::function_41c79ce4(0, 0);
			self turret::set_on_target_angle(1, 0);
			self turret::set_ignore_line_of_sight(1, 0);
			self turret::function_8bbe7822(1, 0);
			self turret::function_f5e3e1de(0, 0);
			self turret::function_21827343(0);
			self turret::function_14223170(0);
		}
	}
	/#
		println("" + var_a5a6c25b);
	#/
}

/*
	Name: function_52791e07
	Namespace: namespace_c25eb016
	Checksum: 0x6067435C
	Offset: 0x5FC8
	Size: 0x35C
	Parameters: 1
	Flags: Linked
*/
function function_52791e07(var_a5a6c25b)
{
	if(!isdefined(var_a5a6c25b))
	{
		var_a5a6c25b = "default";
	}
	self endon(#"death");
	level flag::wait_till("flg_amk_player_spawned");
	level.player endon(#"death");
	var_c197f9aa = "tag_flash";
	var_e3dd3903 = getweapon(#"hash_161ca1bfb05ce95c");
	var_4bc3c7b8 = 0.2;
	var_23058d7f = 20;
	var_12588ac8 = 3;
	var_651ba909 = 100;
	var_539ee6be = 0;
	var_7c968886 = 50;
	var_41e56412 = 0;
	var_34175fc3 = 10;
	var_ee8c7f3 = 0;
	var_a0d9a106 = 100;
	v_offset = (0, 0, 0);
	self.fire_mode = var_a5a6c25b;
	b_seeplayer = 0;
	while(true)
	{
		if(self.fire_mode == "suspend" || self.fire_mode == "scripted")
		{
			wait(0.5);
			continue;
		}
		for(i = 0; i < var_23058d7f; i++)
		{
			var_1c8839e = self gettagorigin(var_c197f9aa) + vectorscale((0, 0, 1), 32);
			var_a6be6a4f = undefined;
			b_seeplayer = sighttracepassed(var_1c8839e, level.player getplayercamerapos(), 0, undefined);
			var_41e56412 = math::clamp(var_41e56412 + function_a1bfd89d(b_seeplayer), var_34175fc3 * -1, var_34175fc3);
			var_7c968886 = math::clamp(var_7c968886 + var_41e56412, var_539ee6be, var_651ba909);
			var_ee8c7f3 = var_a0d9a106 - var_7c968886;
			v_offset = (var_ee8c7f3 == 0 ? (0, 0, 0) : math::random_vector(var_ee8c7f3));
			var_a6be6a4f = level.player getplayercamerapos() + v_offset;
			if(b_seeplayer == 0)
			{
				wait(0.5);
				continue;
			}
			/#
				assert(isdefined(var_a6be6a4f), "");
			#/
			self function_b5da96ca(var_a6be6a4f, 0);
			wait(var_4bc3c7b8);
		}
		wait(var_12588ac8);
	}
}

/*
	Name: function_a1bfd89d
	Namespace: namespace_c25eb016
	Checksum: 0x2FA2784A
	Offset: 0x6330
	Size: 0xC4
	Parameters: 1
	Flags: Linked
*/
function function_a1bfd89d(b_seeplayer)
{
	var_8f99bdb4 = 0;
	if(b_seeplayer == 1)
	{
		if(level.player issprinting())
		{
			var_8f99bdb4 = -1;
		}
		stance = level.player getstance();
		if(stance == "crouch")
		{
			var_8f99bdb4 = 3;
		}
		else if(stance == "prone")
		{
			var_8f99bdb4 = 1;
		}
		var_8f99bdb4 = 5;
	}
	else
	{
		var_8f99bdb4 = -6;
	}
	return var_8f99bdb4;
}

/*
	Name: function_b5da96ca
	Namespace: namespace_c25eb016
	Checksum: 0x5C655B07
	Offset: 0x6400
	Size: 0x1FC
	Parameters: 4
	Flags: Linked
*/
function function_b5da96ca(var_a6be6a4f, var_94e307c, bdodamage, var_53edfe53)
{
	if(!isdefined(var_94e307c))
	{
		var_94e307c = undefined;
	}
	if(!isdefined(bdodamage))
	{
		bdodamage = 1;
	}
	var_e3dd3903 = getweapon(#"hash_161ca1bfb05ce95c");
	if(isdefined(var_94e307c))
	{
		self turret::function_aecc6bed([0:var_a6be6a4f], 1, var_94e307c);
	}
	else
	{
		var_c197f9aa = "tag_flash";
		var_8035574f = self gettagorigin(var_c197f9aa);
		var_230ef93a = self gettagangles(var_c197f9aa);
		var_f8fbe014 = anglestoforward(var_230ef93a);
		var_1c8839e = var_8035574f + (var_f8fbe014 * 200);
		playfxontag(level._effect[#"hash_7fa91cf654f23aa0"], self, var_c197f9aa);
		magicbullet(var_e3dd3903, var_1c8839e, var_a6be6a4f, self);
	}
	if(bdodamage == 1)
	{
		waitframe(1);
		self thread function_cef95010(var_a6be6a4f, var_53edfe53);
		radiusdamage(var_a6be6a4f, 32, 100, 1, level.player, "MOD_PROJECTILE_SPLASH", var_e3dd3903);
		physicsexplosionsphere(var_a6be6a4f, 32, 1, 1);
	}
}

/*
	Name: function_cef95010
	Namespace: namespace_c25eb016
	Checksum: 0xC7AE01A4
	Offset: 0x6608
	Size: 0x1F4
	Parameters: 2
	Flags: Linked
*/
function function_cef95010(v_pos, var_53edfe53)
{
	if(isdefined(var_53edfe53))
	{
		switch(var_53edfe53)
		{
			case "wood":
			{
				var_2b13e443 = "fx9_bul_impact_wood_50cal_xlrg";
				var_2f4dfc87 = "exp_facade_debris_wood";
				break;
			}
			case "concrete":
			{
				var_2b13e443 = "fx9_bul_impact_concrete_strafe_lg";
				var_2f4dfc87 = "exp_facade_debris_concrete";
				break;
			}
			case "metal":
			{
				var_2b13e443 = "fx9_bul_impact_metal_strafe_lg";
				var_2f4dfc87 = "exp_facade_debris_metal";
				break;
			}
			case "glass":
			{
				var_2b13e443 = "fx9_bul_impact_glass_lg";
				var_2f4dfc87 = "exp_facade_debris_glass";
				break;
			}
			case "mannequin":
			{
				var_2b13e443 = "fx9_bul_impact_default_50cal_xlrg";
				var_2f4dfc87 = "exp_facade_debris_mannequin";
				break;
			}
			default:
			{
				var_2b13e443 = "fx9_bul_impact_default_50cal_xlrg";
				var_2f4dfc87 = "exp_facade_debris_concrete";
			}
		}
	}
	else
	{
		var_2b13e443 = "fx9_bul_impact_default_50cal_xlrg";
		var_2f4dfc87 = "exp_facade_debris_concrete";
	}
	var_8035574f = self gettagorigin("tag_flash");
	if(var_53edfe53 === "glass")
	{
		v_fwd = v_pos - var_8035574f;
	}
	else
	{
		v_fwd = var_8035574f - v_pos;
	}
	playfx(level._effect[var_2b13e443], v_pos, v_fwd);
	snd::play(var_2f4dfc87, v_pos);
}

/*
	Name: function_e385b740
	Namespace: namespace_c25eb016
	Checksum: 0xD9D23EB
	Offset: 0x6808
	Size: 0xA4
	Parameters: 0
	Flags: Linked
*/
function function_e385b740()
{
	level.player val::set(#"player_scene", "show_weapon_hud", 0);
	level.player val::set(#"player_scene", "show_crosshair", 0);
	level.player val::set(#"player_scene", "disable_weapons", 1);
	wait(0.5);
}

/*
	Name: function_6214e16e
	Namespace: namespace_c25eb016
	Checksum: 0xFD7B0284
	Offset: 0x68B8
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_6214e16e()
{
	level.player val::reset_all(#"player_scene");
}

/*
	Name: function_78c3826c
	Namespace: namespace_c25eb016
	Checksum: 0xDC599A07
	Offset: 0x68F0
	Size: 0x84
	Parameters: 1
	Flags: None
*/
function function_78c3826c(str_scene)
{
	level.player endon(#"death");
	function_e385b740();
	if(isdefined(str_scene))
	{
		level scene::play(str_scene);
	}
	else
	{
		self scene::play();
	}
	function_6214e16e();
}

/*
	Name: function_22099452
	Namespace: namespace_c25eb016
	Checksum: 0x62751D76
	Offset: 0x6980
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function function_22099452(enable)
{
	if(enable)
	{
		aiutility::addaioverridedamagecallback(self, &function_bb142fcc);
	}
	else
	{
		aiutility::removeaioverridedamagecallback(self, &function_bb142fcc);
	}
}

/*
	Name: function_bb142fcc
	Namespace: namespace_c25eb016
	Checksum: 0xDA6D6EDC
	Offset: 0x69E8
	Size: 0xB4
	Parameters: 13
	Flags: Linked
*/
function function_bb142fcc(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, modelindex)
{
	if(is_true(self.var_c48f9f7d) || is_true(self.var_29133295))
	{
		modelindex = self.health + 1;
	}
	return modelindex;
}

/*
	Name: function_e93aa7b3
	Namespace: namespace_c25eb016
	Checksum: 0xE680507C
	Offset: 0x6AA8
	Size: 0xC4
	Parameters: 1
	Flags: None
*/
function function_e93aa7b3(var_608ada91)
{
	if(!isdefined(var_608ada91))
	{
		var_608ada91 = 0.1;
	}
	var_7df86393 = self getnormalizedcameramovement();
	var_1341634d = var_7df86393[0];
	if(abs(var_1341634d) < var_608ada91)
	{
		var_1341634d = 0;
	}
	var_f17d1fc5 = var_7df86393[1];
	if(abs(var_f17d1fc5) < var_608ada91)
	{
		var_f17d1fc5 = 0;
	}
	var_7df86393 = (var_1341634d, var_f17d1fc5, var_7df86393[2]);
	return var_7df86393;
}

/*
	Name: function_e9f3f20
	Namespace: namespace_c25eb016
	Checksum: 0x44DF0DCE
	Offset: 0x6B78
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function function_e9f3f20(str_flag_name)
{
	self flag::set(str_flag_name);
}

/*
	Name: function_cafa23ec
	Namespace: namespace_c25eb016
	Checksum: 0x8E5D12C2
	Offset: 0x6BA8
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function function_cafa23ec(str_flag_name)
{
	self flag::clear(str_flag_name);
}

/*
	Name: function_8b7cb19c
	Namespace: namespace_c25eb016
	Checksum: 0x2E2A5C52
	Offset: 0x6BD8
	Size: 0xD6
	Parameters: 1
	Flags: None
*/
function function_8b7cb19c(eventstruct)
{
	result = 1;
	if(isdefined(eventstruct) && isdefined(eventstruct.action) && isai(self) && self.team == #"allies" && (eventstruct.action == "enemycontact" || eventstruct.action == "exposed"))
	{
		enemies = self getenemies();
		if(enemies.size == 0)
		{
			result = 0;
		}
	}
	return result;
}

