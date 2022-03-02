#using script_1254ac024174d9c0;
#using script_2de5679484626dc8;
#using script_2f560596a9a134ab;
#using script_3f9e0dc8454d98e1;
#using script_437ce686d29bb81b;
#using script_68d2ee1489345a1d;
#using script_7f6cd71c43c45c57;
#using script_7fc996fe8678852;
#using script_b9d273dc917ee1f;
#using script_bd2b8aaa388dcce;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\callbacks.gsc;
#using scripts\zm_common\gametypes\globallogic.gsc;
#using scripts\zm_common\scoreevents.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;

#namespace namespace_f0b43eb5;

/*
	Name: function_ef2a6645
	Namespace: namespace_f0b43eb5
	Checksum: 0x20D2805F
	Offset: 0x370
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ef2a6645()
{
	level notify(650109407);
}

/*
	Name: function_89f2df9
	Namespace: namespace_f0b43eb5
	Checksum: 0xDCA14D86
	Offset: 0x390
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_1c32fc6c324d3e66", &function_70a657d8, undefined, undefined, #"zm_unitrigger");
}

/*
	Name: function_70a657d8
	Namespace: namespace_f0b43eb5
	Checksum: 0x2972CB4D
	Offset: 0x3E0
	Size: 0x50C
	Parameters: 0
	Flags: Linked
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
	if(zm_utility::is_survival())
	{
		level.var_957b495e = 300;
		namespace_8b6a9d79::function_b3464a7c("dac_trial_computer", &function_1296cf27);
	}
	else
	{
		level.var_957b495e = 90;
	}
	clientfield::register("scriptmover", "" + #"hash_653b5827e6fbe5f9", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_21f5fab6a3d22093", 1, 3, "int");
	clientfield::register("scriptmover", "" + #"hash_3dbe7851af541017", 1, 1, "int");
	clientfield::register("toplayer", "" + #"hash_31bea9cf1e6f76a0", 1, getminbitcountfornum(level.var_957b495e), "int");
	clientfield::register("toplayer", "" + #"hash_216c75103f478671", 1, 4, "int");
	if(zm_utility::is_survival())
	{
		clientfield::register("scriptmover", "" + #"hash_33c54759cc1e7a71", 1, 1, "int");
	}
	level flag::init("fl_challenges_active");
	level thread function_ca842288();
	level thread function_d60e999d();
	callback::on_connect(&on_player_connect);
	callback::on_ai_killed(&on_ai_killed);
	callback::on_player_damage(&function_52588bfe);
	callback::on_bleedout(&function_2bf355c2);
	callback::on_disconnect(&function_2bf355c2);
	callback::add_callback(#"parachute", &function_7f35fb38);
	callback::function_10a4dd0a(&function_cc254d94);
	callback::on_spawned(&on_player_spawned);
	/#
		level thread function_37597f29();
	#/
	namespace_f999c142::init();
	level.var_8b7ab859 = 1000;
	zm_audio::musicstate_create("dac_challenge", 4, "challenge_1", "challenge_2");
	zm_audio::function_e441162b("dac_challenge");
}

/*
	Name: function_ca842288
	Namespace: namespace_f0b43eb5
	Checksum: 0xF4DF81FF
	Offset: 0x8F8
	Size: 0x7FC
	Parameters: 0
	Flags: Linked
*/
function function_ca842288()
{
	function_cd7f17dd(#"hash_25a76ab3d0a73b03", level.var_957b495e, undefined, undefined, #"hash_77b13ae8ed00abd4");
	function_cd7f17dd(#"hash_1db5106df3c3c0c4", level.var_957b495e, undefined, undefined, #"hash_690b442afa94cfc1");
	function_cd7f17dd(#"hash_11b4177e0f079bb6", level.var_957b495e, undefined, undefined, #"hash_28ce1cda153c0a06");
	function_cd7f17dd(#"hash_4b4ab7b6cf4d87c", level.var_957b495e, undefined, undefined, #"hash_70e7e390e97fd050");
	if(!zm_utility::is_survival())
	{
		function_cd7f17dd(#"hash_4cc252a7609d289", level.var_957b495e, undefined, undefined, #"hash_798ece4e5fb19658", undefined, &function_8576b59f);
		function_cd7f17dd(#"hash_6105e103a3189287", level.var_957b495e, undefined, undefined, #"hash_519ac5a8b2182c8a", undefined, &function_c8657c04);
	}
	function_cd7f17dd(#"hash_1bba6b368675561e", level.var_957b495e, undefined, undefined, #"hash_5c2c60f47f190bab");
	function_cd7f17dd(#"hash_62bc7c158375f1f2", level.var_957b495e, undefined, undefined, #"hash_726c7237d4e6659d");
	function_cd7f17dd(#"hash_63791b9ae55043b5", level.var_957b495e, undefined, undefined, #"hash_42edeeac988cb858", undefined, &function_8dbbbce8);
	function_cd7f17dd(#"hash_5ab9ff1ebbf2de17", level.var_957b495e, undefined, undefined, #"hash_361ed27b00fa1720");
	function_cd7f17dd(#"hash_4af69b7011fd4702", level.var_957b495e, undefined, undefined, #"hash_39a11eff01c71b70");
	if(zm_utility::is_survival())
	{
		function_cd7f17dd(#"hash_6c9f941878e99c63", level.var_957b495e, undefined, undefined, #"hash_55d3f65e1aec7cb8");
		function_cd7f17dd(#"hash_6541d5a40f6a8dcc", level.var_957b495e, undefined, undefined, #"hash_6f38f4aabdf7ce05");
		function_cd7f17dd(#"hash_41722fe0656b9a5f", level.var_957b495e, undefined, undefined, #"hash_5f1293299ad026b4");
		function_cd7f17dd(#"hash_749e36c2ffef5f86", level.var_957b495e, undefined, undefined, #"hash_58e5f20f443f45d9");
		function_cd7f17dd(#"hash_72b2e5815bcbcc12", level.var_957b495e, undefined, undefined, #"hash_850d5d8c8ce6ce1");
		function_cd7f17dd(#"hash_388a24efa2077ef6", level.var_957b495e, undefined, undefined, #"hash_3fad812b31318123");
		function_cd7f17dd(#"hash_710afd3a5e44458f", level.var_957b495e, undefined, undefined, #"hash_352d04c831a4f99a", undefined, &function_9c1479ad);
	}
	level.var_2dffd020 = 0;
	if(zm_utility::is_survival())
	{
		level flag::wait_till(#"hash_55a791d84b66b221");
		var_c6d25878 = &zm_utility::function_f5a222a8;
	}
	else
	{
		level.var_107cca82 = getent("trial_terminal", "targetname");
		level.var_107cca82 setmodel(#"p9_fxanim_zm_gp_dac_xmodel");
		zm_utility::function_ca960904(level.var_107cca82);
		callback::function_74872db6(&function_5c5d14f2);
		level.var_f654fb0f = getentarray("reward_terminal", "targetname");
		var_c6d25878 = &zm_utility::function_4a4cf79a;
	}
	if(!isdefined(level.var_107cca82) || !isarray(level.var_f654fb0f) || level.var_f654fb0f.size < 4)
	{
		return;
	}
	array::run_all(level.var_f654fb0f, &function_e1dd6a53, #"off");
	var_f255c928 = level.var_107cca82 zm_unitrigger::create(&function_5586b077, vectorscale((1, 1, 1), 80), &function_6d69e771);
	var_f255c928.origin = var_f255c928.origin + vectorscale((0, 0, 1), 40);
	zm_unitrigger::unitrigger_force_per_player_triggers(level.var_107cca82.s_unitrigger, 1);
	level.var_107cca82.n_obj_id = [[var_c6d25878]](#"hash_3632525bd692cfc8", level.var_107cca82);
	if(!isdefined(level.var_d2bdec66))
	{
		level.var_d2bdec66 = 0;
	}
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
	Name: function_2b436554
	Namespace: namespace_f0b43eb5
	Checksum: 0x346D044A
	Offset: 0x1100
	Size: 0x274
	Parameters: 1
	Flags: Linked
*/
function function_2b436554(destination)
{
	if(!zm_utility::function_36e7b4a2())
	{
		return;
	}
	level.var_5de83c5b = [];
	foreach(location in destination.locations)
	{
		instance = location.instances[#"hash_60593b31eb28a4f4"];
		if(isdefined(instance))
		{
			var_e7f5b3e0 = 1;
			if(isdefined(instance.var_501bc8c9))
			{
				var_2685dd6d = strtok(instance.var_501bc8c9, ", ");
				foreach(var_a2593226 in var_2685dd6d)
				{
					if(level.var_7d45d0d4.var_1fcbdf50 === var_a2593226)
					{
						var_e7f5b3e0 = 0;
						break;
					}
				}
			}
			if(var_e7f5b3e0)
			{
				if(!isdefined(level.var_5de83c5b))
				{
					level.var_5de83c5b = [];
				}
				else if(!isarray(level.var_5de83c5b))
				{
					level.var_5de83c5b = array(level.var_5de83c5b);
				}
				level.var_5de83c5b[level.var_5de83c5b.size] = instance;
			}
		}
	}
	instance = array::random(level.var_5de83c5b);
	if(isdefined(instance))
	{
		level.var_28daae89 = instance;
		namespace_8b6a9d79::function_20d7e9c7(instance);
	}
}

/*
	Name: function_1296cf27
	Namespace: namespace_f0b43eb5
	Checksum: 0x9540E2A3
	Offset: 0x1380
	Size: 0x304
	Parameters: 1
	Flags: Linked
*/
function function_1296cf27(instance)
{
	var_f1646bb = instance.var_fe2612fe[#"hash_60593b31eb28a4f4"][0];
	var_d690f2be = (isdefined(instance.var_fe2612fe[#"hash_3b68487ef7d135d7"]) ? instance.var_fe2612fe[#"hash_3b68487ef7d135d7"] : []);
	if(!isdefined(var_f1646bb))
	{
		/#
			assertmsg("" + instance.targetname);
		#/
		return;
	}
	if(!isarray(var_d690f2be) || var_d690f2be.size < 4)
	{
		/#
			assertmsg((("" + 4) + "") + instance.targetname);
		#/
		return;
	}
	level.var_107cca82 = namespace_8b6a9d79::spawn_script_model(var_f1646bb, var_f1646bb.model, 1, 1);
	level.var_107cca82 clientfield::set("" + #"hash_33c54759cc1e7a71", 1);
	level.var_107cca82.targetname = "trial_terminal";
	level.var_f654fb0f = [];
	foreach(var_d616c136 in var_d690f2be)
	{
		var_a9e49f25 = namespace_8b6a9d79::spawn_script_model(var_d616c136, var_d616c136.model, 1, 1);
		var_a9e49f25.target = var_d616c136.target2;
		var_a9e49f25.targetname = "reward_terminal";
		if(!isdefined(level.var_f654fb0f))
		{
			level.var_f654fb0f = [];
		}
		else if(!isarray(level.var_f654fb0f))
		{
			level.var_f654fb0f = array(level.var_f654fb0f);
		}
		level.var_f654fb0f[level.var_f654fb0f.size] = var_a9e49f25;
	}
	util::wait_network_frame();
	level flag::set(#"hash_55a791d84b66b221");
}

/*
	Name: function_5c5d14f2
	Namespace: namespace_f0b43eb5
	Checksum: 0xD09CE69A
	Offset: 0x1690
	Size: 0x2B2
	Parameters: 0
	Flags: Linked
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
	Checksum: 0x5B912F9C
	Offset: 0x1950
	Size: 0x8A
	Parameters: 0
	Flags: Linked
*/
function on_player_connect()
{
	if(!isbot(self) || getdvarint(#"hash_1ca7459bb8b222dd", 0))
	{
		self.var_642ed51a = undefined;
		self.var_94041ad9 = 0;
		self thread function_73143c19();
	}
	if(!isdefined(self.var_c8413949))
	{
		self.var_c8413949 = 0;
	}
}

/*
	Name: on_player_spawned
	Namespace: namespace_f0b43eb5
	Checksum: 0x2A10BC7C
	Offset: 0x19E8
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	if(is_true(self.var_fcd07f0a))
	{
		self.var_94041ad9 = 1;
		self thread function_73143c19();
	}
}

/*
	Name: function_73143c19
	Namespace: namespace_f0b43eb5
	Checksum: 0x9D18ED33
	Offset: 0x1A30
	Size: 0x652
	Parameters: 0
	Flags: Linked
*/
function function_73143c19()
{
	self notify("70d1ad0071bb07ad");
	self endon("70d1ad0071bb07ad");
	self endon(#"death");
	if(!isdefined(self.var_9e09931e))
	{
		self.var_9e09931e = 0;
	}
	var_5eee41ed = zm_utility::is_survival() && namespace_cf6efd05::function_85b812c9();
	level flag::wait_till("fl_challenges_active");
	n_index = self getentitynumber();
	if(isdefined(self.var_94041ad9) && !self.var_94041ad9)
	{
		if(!isdefined(level.var_edbe6a7f[n_index]) || level.var_edbe6a7f[n_index] != 0 && isdefined(self.n_tribute))
		{
			level.var_edbe6a7f[n_index] = 0;
			self thread function_2bf355c2();
		}
	}
	n_tribute = level.var_edbe6a7f[n_index];
	if(!var_5eee41ed && (is_true(self.var_94041ad9) || !isdefined(self.n_tribute)))
	{
		self namespace_f999c142::function_71c9ab64(0);
	}
	if(n_tribute > 0 || is_active())
	{
		util::wait_network_frame();
		if(n_tribute > 0)
		{
			self function_2bb8d916();
		}
		if(is_active())
		{
			self function_7a344bdf(level.var_51d3a718.s_msg, (isdefined(level.var_51d3a718.var_4e0096cd) ? level.var_51d3a718.var_4e0096cd : level.var_2c5f83d));
			self function_b4759cf8();
		}
	}
	if(is_true(self.var_94041ad9))
	{
		self.var_6b3806e8 = 0;
		self.var_207f01b0 = 0;
	}
	else
	{
		if(!isdefined(self.var_6b3806e8))
		{
			self.var_6b3806e8 = 0;
		}
		if(!isdefined(self.var_207f01b0))
		{
			self.var_207f01b0 = 0;
		}
	}
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
	if(var_5eee41ed)
	{
		level flag::wait_till(#"initial_fade_in_complete");
		if(isdefined(self.n_tribute))
		{
			self function_432b2abf();
			self namespace_f999c142::function_71c9ab64(self.n_tribute);
			self namespace_f999c142::function_53a333a8();
		}
		if(self.var_9e09931e != 0)
		{
			self function_d38641f1();
		}
	}
	self.var_fcd07f0a = 1;
}

/*
	Name: function_111530dd
	Namespace: namespace_f0b43eb5
	Checksum: 0x9FF97039
	Offset: 0x2090
	Size: 0x2B8
	Parameters: 0
	Flags: Linked
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
	Checksum: 0xDF620044
	Offset: 0x2350
	Size: 0x270
	Parameters: 0
	Flags: Linked
*/
function function_662458e()
{
	self endon(#"disconnect");
	if(!isdefined(self.var_edf90e4e) || self.var_edf90e4e <= 0 || self.var_edf90e4e > 4)
	{
		self waittill(#"hash_606be34c407533f6");
	}
	if(isdefined(self.var_edf90e4e))
	{
		n_index = self.var_edf90e4e - 1;
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
		if(!isdefined(var_3cbf62f9))
		{
			/#
				assertmsg(((((("" + n_index) + "") + level.script) + "") + 4) + "");
			#/
			return;
		}
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
	Checksum: 0xAC8A5E12
	Offset: 0x25C8
	Size: 0x36A
	Parameters: 1
	Flags: Linked
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
	Checksum: 0x261626E5
	Offset: 0x2940
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function function_2bb8d916()
{
	self namespace_f999c142::function_ae2c0ba5();
}

/*
	Name: function_2ed00fa6
	Namespace: namespace_f0b43eb5
	Checksum: 0xB0FC66D
	Offset: 0x2968
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
	Checksum: 0xBEBEE1FB
	Offset: 0x2A20
	Size: 0xB4
	Parameters: 1
	Flags: Linked
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
	Checksum: 0xF6BAACDB
	Offset: 0x2AE0
	Size: 0xA2C
	Parameters: 1
	Flags: Linked
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
					if(is_challenge_active(#"hash_7cb657a5f657cbbe") || is_challenge_active(#"hash_756817dc68da56e9") || is_challenge_active(#"hash_2272d4303498d425") || is_challenge_active(#"hash_795ccb5ead8f853e") || is_challenge_active(#"hash_7e17eba37f893fb4") || is_challenge_active(#"hash_7f0be97960376eb0") || is_challenge_active(#"hash_aee5cb4bd88c4ee") || is_challenge_active(#"hash_7e80a8ea892ec8c4") || is_challenge_active(#"hash_beba8c495ad1123") || is_challenge_active(#"hash_47d7bcdc94e2be1c") || is_challenge_active(#"hash_26e32893218f3cc2") || is_challenge_active(#"hash_363ccc9296a0bb43") || is_challenge_active(#"hash_97ec7cda4d126e"))
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
								if(!e_player playerads() && means_of_death !== "MOD_MELEE" && means_of_death !== "MOD_MELEE_WEAPON_BUTT" && means_of_death !== "MOD_CRUSH" && !isvehicle(s_params.einflictor))
								{
									if(weapon.name === #"hero_pineapplegun" || weapon.name === #"sig_bow_flame" || (weapon.inventorytype === #"dwlefthand" || weapon.inventorytype === #"primary" && !killstreaks::is_killstreak_weapon(weapon)))
									{
										e_player namespace_f999c142::function_53a333a8(#"hash_62bc7c158375f1f2", level.var_8b7ab859 * 0.01);
									}
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
								else
								{
									if(is_challenge_active(#"hash_4af69b7011fd4702"))
									{
										if(e_player === level.chopper_gunner.owner || (isdefined(e_player.origin) && isdefined(self.origin) && e_player.origin[2] > (self.origin[2] + 50)))
										{
											e_player namespace_f999c142::function_53a333a8(#"hash_4af69b7011fd4702", level.var_8b7ab859 * 0.02);
										}
									}
									else
									{
										if(is_challenge_active(#"hash_6c9f941878e99c63"))
										{
											n_distance = scoreevents::get_distance_for_weapon(weapon);
											if(isdefined(n_distance) && n_distance > 0 && distancesquared(e_player.origin, self.origin) >= n_distance)
											{
												e_player namespace_f999c142::function_53a333a8(#"hash_6c9f941878e99c63", level.var_8b7ab859 * 0.03);
											}
										}
										else
										{
											if(is_challenge_active(#"hash_6541d5a40f6a8dcc") && isvehicle(s_params.einflictor))
											{
												foreach(player in getplayers())
												{
													if(isalive(player) && player isinvehicle() && player getvehicleoccupied() === s_params.einflictor)
													{
														player namespace_f999c142::function_53a333a8(#"hash_6541d5a40f6a8dcc", level.var_8b7ab859 * 0.02);
													}
												}
											}
											else
											{
												if(is_challenge_active(#"hash_749e36c2ffef5f86") && (self.var_6f84b820 === #"special" || self.var_6f84b820 === #"elite"))
												{
													e_player namespace_f999c142::function_53a333a8(#"hash_749e36c2ffef5f86", level.var_8b7ab859 * 0.25);
												}
												else if(is_challenge_active(#"hash_72b2e5815bcbcc12") && self.current_state.name !== #"chase")
												{
													e_player namespace_f999c142::function_53a333a8(#"hash_72b2e5815bcbcc12", level.var_8b7ab859 * 0.1);
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
		}
	}
}

/*
	Name: function_7f35fb38
	Namespace: namespace_f0b43eb5
	Checksum: 0x3B5BBE8F
	Offset: 0x3518
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_7f35fb38(params)
{
	self thread function_284f537c();
}

/*
	Name: function_284f537c
	Namespace: namespace_f0b43eb5
	Checksum: 0xC9EBA7AB
	Offset: 0x3548
	Size: 0x10E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_284f537c()
{
	self notify("43b80695d18b872e");
	self endon("43b80695d18b872e");
	self endon(#"death");
	var_4944ff9 = 0;
	while(true)
	{
		if(is_challenge_active(#"hash_388a24efa2077ef6") && self isparachuting())
		{
			if(var_4944ff9 >= 2)
			{
				self namespace_f999c142::function_53a333a8(#"hash_388a24efa2077ef6", level.var_8b7ab859 * 0.015);
				var_4944ff9 = 0;
			}
		}
		else
		{
			return;
		}
		waitframe(1);
		var_4944ff9 = var_4944ff9 + (float(function_60d95f53()) / 1000);
	}
}

/*
	Name: function_cc254d94
	Namespace: namespace_f0b43eb5
	Checksum: 0x9D9295D0
	Offset: 0x3660
	Size: 0xE4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_cc254d94(params)
{
	if(is_challenge_active(#"hash_41722fe0656b9a5f") && (params.item.var_a6762160.itemtype === #"hash_910bf9605abbcea" || params.item.var_a6762160.itemtype === #"hash_3a094c949a87214d") && isplayer(params.player))
	{
		params.player namespace_f999c142::function_53a333a8(#"hash_41722fe0656b9a5f", level.var_8b7ab859 * 0.1);
	}
}

/*
	Name: function_cd7f17dd
	Namespace: namespace_f0b43eb5
	Checksum: 0xF999483A
	Offset: 0x3750
	Size: 0x2C0
	Parameters: 8
	Flags: Linked
*/
function function_cd7f17dd(var_38f795c7, var_6346e7b, zonenames, weaponname, var_e09af826, var_3df4e085, var_205fe3e6, func_end)
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
	/#
		var_7ab69ae2 = function_9e72a96(var_38f795c7);
		level thread util::function_345e5b9a(((("" + var_7ab69ae2) + "") + var_7ab69ae2) + "");
	#/
	return s_challenge;
}

/*
	Name: function_65390598
	Namespace: namespace_f0b43eb5
	Checksum: 0xB2F44748
	Offset: 0x3A18
	Size: 0x7C
	Parameters: 1
	Flags: Linked
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
	Checksum: 0x4C09CE3D
	Offset: 0x3AA0
	Size: 0x206
	Parameters: 1
	Flags: Linked
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
	Checksum: 0x14F4AD88
	Offset: 0x3CB0
	Size: 0x1BC
	Parameters: 0
	Flags: Linked
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
		if(namespace_497ab7da::is_active())
		{
			continue;
		}
		if(e_player function_34ebccf9())
		{
			e_player notify(#"hash_811de57ec6a72cd");
			e_player function_bc82f900(#"hash_410bd55524ae7d");
		}
		else if(level.var_2dffd020 == 1 || level.var_2dffd020 == 2)
		{
			if(e_player zm_score::can_player_purchase(level.var_d3a8f03b))
			{
				level.var_107cca82 playsound(#"hash_564affa7c572ff4c");
				e_player function_bc82f900(#"hash_410bd55524ae7d");
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
	Checksum: 0xD05E8194
	Offset: 0x3E78
	Size: 0x134
	Parameters: 1
	Flags: Linked
*/
function start_challenge(e_player)
{
	if(isdefined(level.var_51d3a718))
	{
		stop_challenge();
		waitframe(1);
	}
	if(isdefined(e_player))
	{
		s_challenge = function_be1cda91(e_player);
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
	Checksum: 0x74565B54
	Offset: 0x3FB8
	Size: 0x1BE
	Parameters: 1
	Flags: Linked
*/
function stop_challenge(var_d46ce3db)
{
	if(!isdefined(var_d46ce3db))
	{
		var_d46ce3db = 0;
	}
	level thread function_23853783();
	stop_timer();
	if(isdefined(level.var_51d3a718.var_3e17832))
	{
		level [[level.var_51d3a718.var_3e17832]]();
	}
	wait(0.1);
	level.var_51d3a718 = undefined;
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
	Checksum: 0x1391623F
	Offset: 0x4180
	Size: 0x40
	Parameters: 0
	Flags: Linked
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
	Checksum: 0xC1645BC5
	Offset: 0x41C8
	Size: 0x596
	Parameters: 1
	Flags: Linked
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
			case "hash_38c50405421ca2a5":
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
	Checksum: 0xD33321A5
	Offset: 0x4768
	Size: 0x274
	Parameters: 1
	Flags: Linked
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
	level.var_51d3a718 = s_challenge;
	level.var_62ecc169 = float(gettime()) / 1000;
	foreach(player in getplayers())
	{
		player playlocalsound(#"hash_747fc6d3b1a2412a");
		player.var_6b3806e8 = 0;
		player thread function_7a344bdf(level.var_51d3a718.s_msg);
	}
	if(isdefined(level.var_51d3a718.var_c376bcd5))
	{
		level thread [[level.var_51d3a718.var_c376bcd5]]();
	}
	n_timer = s_challenge.var_6346e7b + 1;
	start_timer(n_timer);
	var_a35366e7 = max(n_timer - 10, 0);
	wait(var_a35366e7);
	level thread function_23853783();
	level function_ea45ba4c();
	stop_challenge(1);
}

/*
	Name: function_ea45ba4c
	Namespace: namespace_f0b43eb5
	Checksum: 0xE43F1E0
	Offset: 0x49E8
	Size: 0xE2
	Parameters: 1
	Flags: Linked
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
	Checksum: 0xEA041F46
	Offset: 0x4AD8
	Size: 0x258
	Parameters: 0
	Flags: None
*/
function function_f51adffa()
{
	level.var_be2ff8ca = zm_utility::function_d7db256e(level.var_51d3a718.var_3df4e085, #"hash_17223bc71432a43e", 1, &function_de2e76c4);
	level.var_51d3a718.var_ad12d5bf = level.var_51d3a718.var_4427ebb1;
	if(!isdefined(level.var_51d3a718.var_ad12d5bf))
	{
		level.var_51d3a718.var_ad12d5bf = [];
	}
	else if(!isarray(level.var_51d3a718.var_ad12d5bf))
	{
		level.var_51d3a718.var_ad12d5bf = array(level.var_51d3a718.var_ad12d5bf);
	}
	level.var_4427ebb1 = level.var_51d3a718.var_ad12d5bf[0];
	/#
		assert(isdefined(level.var_aa3b88c5), "");
	#/
	level.var_2c5f83d = [[level.var_aa3b88c5]](level.var_4427ebb1);
	/#
		iprintlnbold("");
	#/
	foreach(player in getplayers())
	{
		player thread function_d7362784(level.var_51d3a718.str_name, level.var_51d3a718.var_ad12d5bf, undefined);
		player thread function_7a344bdf(level.var_51d3a718.s_msg, level.var_2c5f83d);
	}
}

/*
	Name: function_d7362784
	Namespace: namespace_f0b43eb5
	Checksum: 0x232FB3A
	Offset: 0x4D38
	Size: 0x26E
	Parameters: 3
	Flags: Linked
*/
function function_d7362784(var_38f795c7, var_5ef6045b, vol_override)
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
			if(!self.var_b05f25ad && self zm_zonemgr::is_player_in_zone(var_5ef6045b, 0))
			{
				self.var_b05f25ad = 1;
				self function_fcd5d27c(1);
			}
			else if(self.var_b05f25ad && !self zm_zonemgr::is_player_in_zone(var_5ef6045b, 0))
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
	Checksum: 0x6869DFD6
	Offset: 0x4FB0
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function function_9742c28f()
{
	zm_utility::function_b1f3be5c(level.var_be2ff8ca, level.var_51d3a718.var_3df4e085);
}

/*
	Name: function_8dbbbce8
	Namespace: namespace_f0b43eb5
	Checksum: 0xA31B964D
	Offset: 0x4FE8
	Size: 0x98
	Parameters: 0
	Flags: Linked
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
	Checksum: 0x3AA9CA29
	Offset: 0x5088
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_8576b59f()
{
	level thread function_9ffc76ea(#"hash_747f63d86cb99870");
}

/*
	Name: function_9c1479ad
	Namespace: namespace_f0b43eb5
	Checksum: 0xFDBCBF1E
	Offset: 0x50B8
	Size: 0x1DC
	Parameters: 0
	Flags: Linked
*/
function function_9c1479ad()
{
	level endon(#"hash_53f7c8af221e6090");
	foreach(player in getplayers())
	{
		player thread function_9ffc76ea([1:#"hash_34928429a0070510", 0:#"glass_smash"]);
	}
	while(true)
	{
		var_be17187b = undefined;
		var_be17187b = level waittill(#"glass_smash");
		closest_player = arraygetclosest(var_be17187b.position, function_a1ef346b(), 72);
		if(isplayer(closest_player) && (closest_player ismantling() || closest_player issprinting() || closest_player issliding() || closest_player zm_utility::is_jumping()))
		{
			closest_player notify(#"glass_smash");
		}
	}
}

/*
	Name: function_cbc84593
	Namespace: namespace_f0b43eb5
	Checksum: 0x3B57CE66
	Offset: 0x52A0
	Size: 0xAE
	Parameters: 0
	Flags: None
*/
function function_cbc84593()
{
	level endon(#"hash_53f7c8af221e6090", #"disconnect");
	while(true)
	{
		if(weapons::getbaseweapon(self.currentweapon) == getweapon(level.var_51d3a718.var_8edbca81))
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
	Checksum: 0x9FF0D4C6
	Offset: 0x5358
	Size: 0x3FC
	Parameters: 0
	Flags: None
*/
function function_1d60215()
{
	level endon(#"hash_53f7c8af221e6090");
	level.var_51d3a718.var_ad12d5bf = level.var_51d3a718.var_4427ebb1;
	if(!isdefined(level.var_51d3a718.var_ad12d5bf))
	{
		level.var_51d3a718.var_ad12d5bf = [];
	}
	else if(!isarray(level.var_51d3a718.var_ad12d5bf))
	{
		level.var_51d3a718.var_ad12d5bf = array(level.var_51d3a718.var_ad12d5bf);
	}
	level.var_4427ebb1 = level.var_51d3a718.var_ad12d5bf[0];
	/#
		assert(isdefined(level.var_aa3b88c5), "");
	#/
	level.var_2c5f83d = [[level.var_aa3b88c5]](level.var_51d3a718.var_4427ebb1);
	vol_override = getent("dac_trial_volume_" + level.var_4427ebb1, "targetname");
	foreach(player in getplayers())
	{
		player thread function_d7362784(level.var_51d3a718.str_name, level.var_51d3a718.var_ad12d5bf, vol_override);
		player thread function_7a344bdf(level.var_51d3a718.s_msg, (isdefined(level.var_51d3a718.var_4e0096cd) ? level.var_51d3a718.var_4e0096cd : level.var_2c5f83d));
	}
	level.var_acc31847 = zm_utility::function_d7db256e(level.var_51d3a718.var_3df4e085, #"hash_17223bc71432a43e", 1, &function_de2e76c4);
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
				player namespace_f999c142::function_53a333a8(level.var_51d3a718.str_name);
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
	Checksum: 0xD4BD5822
	Offset: 0x5760
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function function_6be352fc()
{
	zm_utility::function_b1f3be5c(level.var_acc31847, level.var_51d3a718.var_3df4e085);
}

/*
	Name: function_5e882c6f
	Namespace: namespace_f0b43eb5
	Checksum: 0xD3A59736
	Offset: 0x5798
	Size: 0xBC
	Parameters: 2
	Flags: Linked
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
			e_player namespace_f999c142::function_53a333a8(level.var_51d3a718.str_name);
		}
	}
}

/*
	Name: function_de2e76c4
	Namespace: namespace_f0b43eb5
	Checksum: 0x613BC974
	Offset: 0x5860
	Size: 0x36
	Parameters: 2
	Flags: Linked, Private
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
	Checksum: 0x5934F704
	Offset: 0x58A0
	Size: 0x17C
	Parameters: 2
	Flags: Linked
*/
function function_673cba18(var_38f795c7, n_damage)
{
	self notify("2c5fc51b607ed174");
	self endon("2c5fc51b607ed174");
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
			self namespace_f999c142::function_53a333a8(level.var_51d3a718.str_name, undefined, n_damage);
			break;
		}
		else
		{
			n_delta = self.health - n_start_health;
			if(n_delta >= 50)
			{
				self namespace_f999c142::function_53a333a8(level.var_51d3a718.str_name, undefined, n_damage);
				n_start_health = n_start_health + 50;
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_c8657c04
	Namespace: namespace_f0b43eb5
	Checksum: 0xCDE131E2
	Offset: 0x5A28
	Size: 0x15C
	Parameters: 0
	Flags: Linked
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
				player namespace_f999c142::function_53a333a8(level.var_51d3a718.str_name);
			}
		}
		var_53a794b0 = n_time;
	}
}

/*
	Name: function_9ffc76ea
	Namespace: namespace_f0b43eb5
	Checksum: 0x3266C7DC
	Offset: 0x5B90
	Size: 0x240
	Parameters: 1
	Flags: Linked
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
		else if(is_challenge_active(#"hash_710afd3a5e44458f"))
		{
			var_41f9c5ff = level.var_8b7ab859 * 0.03;
		}
		e_player namespace_f999c142::function_53a333a8(level.var_51d3a718.str_name, var_41f9c5ff, var_f6e9f6bf);
	}
}

/*
	Name: function_d60e999d
	Namespace: namespace_f0b43eb5
	Checksum: 0x829B2FF8
	Offset: 0x5DD8
	Size: 0x78
	Parameters: 0
	Flags: Linked
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
	Checksum: 0xBC7CE4BB
	Offset: 0x5E58
	Size: 0xA8
	Parameters: 0
	Flags: Linked
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
	Checksum: 0x7D5D7F
	Offset: 0x5F08
	Size: 0x42
	Parameters: 1
	Flags: Linked
*/
function is_challenge_active(var_38f795c7)
{
	if(isdefined(level.var_51d3a718) && level.var_51d3a718.str_name === var_38f795c7)
	{
		return true;
	}
	return false;
}

/*
	Name: function_be1cda91
	Namespace: namespace_f0b43eb5
	Checksum: 0x188D3264
	Offset: 0x5F58
	Size: 0x3B8
	Parameters: 1
	Flags: Linked
*/
function function_be1cda91(e_player)
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
	Checksum: 0x9D24E84B
	Offset: 0x6318
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function is_active()
{
	if(isdefined(level.var_51d3a718))
	{
		return true;
	}
	return false;
}

/*
	Name: game_over
	Namespace: namespace_f0b43eb5
	Checksum: 0x3C397F4
	Offset: 0x6340
	Size: 0x19C
	Parameters: 0
	Flags: Linked
*/
function game_over()
{
	level waittill(#"end_game", #"hash_4fbe4720f6f13107", #"hash_29edd9425510b40d");
	if(is_active())
	{
		stop_challenge();
	}
	foreach(player in getplayers())
	{
		player function_ac67ad85(0);
	}
	if(zm_utility::is_survival() && isdefined(level.var_107cca82))
	{
		if(isdefined(level.var_107cca82.n_obj_id))
		{
			zm_utility::function_bc5a54a8(level.var_107cca82.n_obj_id);
			level.var_107cca82.n_obj_id = undefined;
		}
		if(isdefined(level.var_107cca82))
		{
			level.var_107cca82 clientfield::set("" + #"hash_33c54759cc1e7a71", 0);
		}
	}
}

/*
	Name: function_2bf355c2
	Namespace: namespace_f0b43eb5
	Checksum: 0x8976AA77
	Offset: 0x64E8
	Size: 0x106
	Parameters: 0
	Flags: Linked
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
	self function_ac67ad85(0);
	self.var_43300e = undefined;
	self.var_4373c66b = undefined;
}

/*
	Name: function_432b2abf
	Namespace: namespace_f0b43eb5
	Checksum: 0x4733CA95
	Offset: 0x65F8
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_432b2abf()
{
	if(!level.var_996e8a57 zm_dac_challenges_hud::is_open(self))
	{
		level.var_996e8a57 zm_dac_challenges_hud::open(self);
	}
}

/*
	Name: function_7a344bdf
	Namespace: namespace_f0b43eb5
	Checksum: 0xBDC4D1BC
	Offset: 0x6648
	Size: 0x114
	Parameters: 2
	Flags: Linked
*/
function function_7a344bdf(challenge_text, location_name)
{
	if(!isdefined(location_name))
	{
		location_name = #"";
	}
	self endon(#"death");
	self function_432b2abf();
	if(isdefined(challenge_text))
	{
		level.var_996e8a57 zm_dac_challenges_hud::function_1c836e71(self, challenge_text);
	}
	if(isdefined(location_name))
	{
		level.var_996e8a57 zm_dac_challenges_hud::function_2dde4d6c(self, location_name);
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
	Checksum: 0xE369F21B
	Offset: 0x6768
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_b4759cf8()
{
	if(isdefined(self))
	{
		level.var_996e8a57 zm_dac_challenges_hud::function_1097decc(self, 1);
		level.var_996e8a57 zm_dac_challenges_hud::function_3fdd9da7(self, 0);
	}
}

/*
	Name: function_d38641f1
	Namespace: namespace_f0b43eb5
	Checksum: 0x3750D408
	Offset: 0x67C0
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_d38641f1()
{
	if(isdefined(self))
	{
		level.var_996e8a57 zm_dac_challenges_hud::function_3fdd9da7(self, 0);
	}
}

/*
	Name: function_7e30f24c
	Namespace: namespace_f0b43eb5
	Checksum: 0x3F24C62F
	Offset: 0x67F8
	Size: 0x7C
	Parameters: 0
	Flags: Linked
*/
function function_7e30f24c()
{
	if(isdefined(self))
	{
		level.var_996e8a57 zm_dac_challenges_hud::function_1097decc(self, 0);
	}
	if(isdefined(self.var_9e09931e) && is_true(self.var_9e09931e === 0))
	{
		level.var_996e8a57 zm_dac_challenges_hud::function_3fdd9da7(self, 1);
	}
}

/*
	Name: function_ada590f5
	Namespace: namespace_f0b43eb5
	Checksum: 0xEAFB3844
	Offset: 0x6880
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_ada590f5()
{
	if(isdefined(self))
	{
		level.var_996e8a57 zm_dac_challenges_hud::function_3fdd9da7(self, 1);
	}
}

/*
	Name: function_ac67ad85
	Namespace: namespace_f0b43eb5
	Checksum: 0xE255E377
	Offset: 0x68B8
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_ac67ad85(var_9d5acba)
{
	if(level.var_996e8a57 zm_dac_challenges_hud::is_open(self))
	{
		if(isdefined(var_9d5acba))
		{
			level.var_996e8a57 zm_dac_challenges_hud::function_ac67ad85(self, var_9d5acba);
		}
	}
}

/*
	Name: function_c21d733d
	Namespace: namespace_f0b43eb5
	Checksum: 0x62426D9F
	Offset: 0x6918
	Size: 0x5C
	Parameters: 1
	Flags: Linked
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
	Checksum: 0x86494F9A
	Offset: 0x6980
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function function_fcd5d27c(var_3f4d60e3)
{
	if(!isdefined(var_3f4d60e3))
	{
		var_3f4d60e3 = 1;
	}
	if(level.var_996e8a57 zm_dac_challenges_hud::is_open(self))
	{
		level.var_996e8a57 zm_dac_challenges_hud::function_ad9c4f0(self, var_3f4d60e3);
	}
}

/*
	Name: function_fd8a137e
	Namespace: namespace_f0b43eb5
	Checksum: 0x7F7544D3
	Offset: 0x69E8
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
	Checksum: 0xC9387218
	Offset: 0x6A38
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function function_34a533b1()
{
	self function_432b2abf();
	level.var_996e8a57 zm_dac_challenges_hud::function_96972b9c(self);
}

/*
	Name: start_timer
	Namespace: namespace_f0b43eb5
	Checksum: 0x1D6293DA
	Offset: 0x6A80
	Size: 0xB8
	Parameters: 1
	Flags: Linked
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
	Checksum: 0xD66A852E
	Offset: 0x6B40
	Size: 0xB0
	Parameters: 0
	Flags: Linked
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
	Checksum: 0xBB3FD1EC
	Offset: 0x6BF8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_445c5438()
{
	if(zm_utility::is_survival())
	{
		return;
	}
	level thread zm_audio::function_b36aeaf6("dac_challenge");
}

/*
	Name: function_23853783
	Namespace: namespace_f0b43eb5
	Checksum: 0x49AA645
	Offset: 0x6C38
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_23853783()
{
	if(zm_utility::is_survival())
	{
		return;
	}
	level thread zm_audio::function_2354b945("dac_challenge");
}

/*
	Name: function_37597f29
	Namespace: namespace_f0b43eb5
	Checksum: 0x6EEDC288
	Offset: 0x6C78
	Size: 0xF4
	Parameters: 0
	Flags: None
*/
function function_37597f29()
{
	/#
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		zm_devgui::add_custom_devgui_callback(&cmd);
		util::init_dvar(#"hash_5b92db1162c53bb5", "", &function_e6f97362);
	#/
}

/*
	Name: function_e6f97362
	Namespace: namespace_f0b43eb5
	Checksum: 0x4573E342
	Offset: 0x6D78
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
	Checksum: 0xE70D585D
	Offset: 0x6E10
	Size: 0x3A2
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
			case "hash_44c3c9e92dca8184":
			{
				if(getdvarint(#"hash_48742331833b658f", 0))
				{
					setdvar(#"hash_48742331833b658f", 0);
					level notify(#"hash_1b63b0a9d74c5852");
					if(isarray(level.var_b492b0ef))
					{
						foreach(var_fb9eb4de in level.var_b492b0ef)
						{
							if(isdefined(var_fb9eb4de))
							{
								var_fb9eb4de delete();
							}
						}
						arrayremovevalue(level.var_b492b0ef, undefined);
					}
				}
				else
				{
					setdvar(#"hash_48742331833b658f", 1);
					level thread function_5a327610();
				}
				break;
			}
			case "hash_352c0ab76fcca647":
			{
				if(getdvarint(#"hash_292f44858fd468da", 0))
				{
					setdvar(#"hash_292f44858fd468da", 0);
					level notify(#"hash_32f12c135823837");
				}
				else
				{
					setdvar(#"hash_292f44858fd468da", 1);
					level thread function_28239d1e();
				}
			}
			default:
			{
				break;
			}
		}
	#/
}

/*
	Name: function_5a327610
	Namespace: namespace_f0b43eb5
	Checksum: 0xE66EDA5B
	Offset: 0x71C0
	Size: 0x59E
	Parameters: 0
	Flags: None
*/
function function_5a327610()
{
	/#
		level notify(#"hash_1b63b0a9d74c5852");
		level endon(#"hash_1b63b0a9d74c5852", #"end_game", #"hash_345e9169ebba28fb");
		if(!isdefined(level.var_b492b0ef))
		{
			level.var_b492b0ef = [];
		}
		while(true)
		{
			if(isdefined(level.var_107cca82))
			{
				circle(level.var_107cca82.origin, 50, (0, 1, 0));
				print3d(level.var_107cca82.origin, "", (0, 1, 0));
			}
			if(isarray(level.var_f654fb0f))
			{
				foreach(var_3cbf62f9 in level.var_f654fb0f)
				{
					circle(var_3cbf62f9.origin, 50, (0, 1, 0));
					print3d(var_3cbf62f9.origin, "", (0, 1, 0));
				}
			}
			if(isarray(level.var_5de83c5b))
			{
				foreach(var_1b7cb15f in level.var_5de83c5b)
				{
					if(var_1b7cb15f === level.var_28daae89)
					{
						continue;
					}
					var_ad7704f = struct::get_array(var_1b7cb15f.targetname, "");
					foreach(var_543e34e3 in var_ad7704f)
					{
						if(var_543e34e3.content_key === #"hash_60593b31eb28a4f4")
						{
							circle(var_543e34e3.origin, 50, (1, 0, 0));
							print3d(var_543e34e3.origin, "", (1, 0, 0), undefined, 0.5);
							if(!isdefined(var_543e34e3.var_fb9eb4de))
							{
								var_543e34e3.var_fb9eb4de = util::spawn_model(var_543e34e3.model, var_543e34e3.origin, var_543e34e3.angles);
								if(!isdefined(level.var_b492b0ef))
								{
									level.var_b492b0ef = [];
								}
								else if(!isarray(level.var_b492b0ef))
								{
									level.var_b492b0ef = array(level.var_b492b0ef);
								}
								if(!isinarray(level.var_b492b0ef, var_543e34e3.var_fb9eb4de))
								{
									level.var_b492b0ef[level.var_b492b0ef.size] = var_543e34e3.var_fb9eb4de;
								}
							}
							continue;
						}
						if(var_543e34e3.content_key === #"hash_3b68487ef7d135d7")
						{
							circle(var_543e34e3.origin, 50, (1, 0, 0));
							print3d(var_543e34e3.origin, "", (1, 0, 0), undefined, 0.5);
							if(!isdefined(var_543e34e3.var_fb9eb4de))
							{
								var_543e34e3.var_fb9eb4de = util::spawn_model(var_543e34e3.model, var_543e34e3.origin, var_543e34e3.angles);
								if(!isdefined(level.var_b492b0ef))
								{
									level.var_b492b0ef = [];
								}
								else if(!isarray(level.var_b492b0ef))
								{
									level.var_b492b0ef = array(level.var_b492b0ef);
								}
								if(!isinarray(level.var_b492b0ef, var_543e34e3.var_fb9eb4de))
								{
									level.var_b492b0ef[level.var_b492b0ef.size] = var_543e34e3.var_fb9eb4de;
								}
							}
						}
					}
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_28239d1e
	Namespace: namespace_f0b43eb5
	Checksum: 0x4CF33409
	Offset: 0x7768
	Size: 0x172
	Parameters: 0
	Flags: None
*/
function function_28239d1e()
{
	/#
		level notify(#"hash_32f12c135823837");
		level endon(#"hash_32f12c135823837", #"end_game", #"hash_345e9169ebba28fb");
		while(true)
		{
			foreach(n_index, player in getplayers())
			{
				y_offset = n_index * 20;
				debug2dtext((400, 300 + y_offset, 0), ((player.name + "") + (isdefined(player.n_tribute) ? player.n_tribute : 0) + "") + level.var_8b7ab859, undefined, undefined, undefined, 1);
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_d938cbd8
	Namespace: namespace_f0b43eb5
	Checksum: 0x1C80C0F1
	Offset: 0x78E8
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
	Checksum: 0xBBEE2BBC
	Offset: 0x7928
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
	Checksum: 0x4341086C
	Offset: 0x79F0
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

