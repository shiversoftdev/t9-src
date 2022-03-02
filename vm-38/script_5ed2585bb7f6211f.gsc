#using script_1029986e2bc8ca8e;
#using script_14f4a3c583c77d4b;
#using script_1c65dbfc2f1c8d8f;
#using script_1caf36ff04a85ff6;
#using script_1cf46b33555422b7;
#using script_3411bb48d41bd3b;
#using script_34ab99a4ca1a43d;
#using script_35598499769dbb3d;
#using script_3751b21462a54a7d;
#using script_3cebb48c37fc271;
#using script_3e25b5e703601101;
#using script_3f9e0dc8454d98e1;
#using script_42b51e4a369b0f95;
#using script_43ce7284919bced2;
#using script_471b31bd963b388e;
#using script_4ccfb58a9443a60b;
#using script_4ce5d94e8c797350;
#using script_52c6c2d1a2ef1b46;
#using script_6727713c6a2b75e4;
#using script_6c5b51f98cd04fa3;
#using script_6d148b720e2af260;
#using script_7224d61ed502ea07;
#using script_72401f526ba71638;
#using script_7a5293d92c61c788;
#using script_7b1cd3908a825fdd;
#using script_7bacb32f8222fa3e;
#using script_7fc996fe8678852;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\load_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\zm_common\gametypes\globallogic.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_blockers.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_power.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;

#namespace namespace_edb23975;

/*
	Name: function_17fdde0
	Namespace: namespace_edb23975
	Checksum: 0x974BC6D7
	Offset: 0xA70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_17fdde0()
{
	level notify(1383162107);
}

/*
	Name: init
	Namespace: namespace_edb23975
	Checksum: 0x316A77AB
	Offset: 0xA90
	Size: 0x65C
	Parameters: 0
	Flags: None
*/
function init()
{
	/#
		level thread function_cd7a3de4();
	#/
	clientfield::register("world", "" + #"hash_7017982268bd7369", 1, 1, "int");
	clientfield::register("toplayer", "" + #"hash_721d42a28d7461ea", 24000, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_4b1b4c1785fdd11d", 24000, 1, "counter");
	clientfield::register("toplayer", "" + #"hash_63da9d5355659678", 24000, 1, "int");
	clientfield::register("playercorpse", "" + #"hash_4a22451481253e54", 28000, 1, "int");
	callback::on_ai_killed(&function_1525bc35);
	callback::function_10a4dd0a(&function_10a4dd0a);
	level.var_afc50b14 = [15:"zone_arcade", 14:"zone_anytown_usa_backlot", 13:"zone_anytown_usa_rooftops", 12:"zone_video_store_roof", 11:"zone_video_store", 10:"zone_anytown_usa_west_2", 9:"zone_cinema", 8:"zone_concessions", 7:"zone_burger_town", 6:"zone_burger_town_roof", 5:"zone_drinks_bar_roof", 4:"zone_drinks_bar", 3:"zone_anytown_usa_east_2", 2:"zone_tv_repair", 1:"zone_anytown_usa_east", 0:"zone_anytown_usa_west"];
	level.var_d3bc5b54 = 0;
	level.var_8fa957ce = 0;
	level.var_4d2ce592 = 0;
	level.var_a1274b1e = 0;
	level.var_ebd5b2bc = getent("acd_tkn_dmg_trig", "targetname");
	level.var_ebd5b2bc thread function_98645ab3();
	level thread function_e922fa3c();
	level thread function_fad9663();
	namespace_96b7f11d::function_994637d8(#"hash_561302e48877300e");
	level function_d749d5ee();
	level.var_2ab5eeb7 = struct::get(#"hash_11f0b40f36d607d4", "targetname");
	level.var_b4f716df = &function_b370e26e;
	level.var_91f71aa[#"hash_5e770ca79b0e5aa4"] = &function_a9291db2;
	if(!isdefined(level.var_b082a9eb))
	{
		level.var_b082a9eb = [];
	}
	level.var_530e3da9 = struct::get_array("dragon_rocket_barrier", "targetname");
	if(!isdefined(level.var_ebc8f1b9))
	{
		level.var_ebc8f1b9 = [];
	}
	level thread function_9dced9c4(#"hash_6570ebf5a30c93d");
	level function_d1f847f9();
	level.var_bd7e65ee = 45;
	level.powerup_grab_get_players_override = &function_3d9adfea;
	if(!isdefined(level.var_fd23d5ca))
	{
		level.var_fd23d5ca = [];
	}
	if(!isdefined(level.var_edde4ca0))
	{
		level.var_edde4ca0 = [];
	}
	level thread function_9dced9c4(#"hash_299f96da2a2177b8");
	level function_d823ee31();
	if(!isdefined(level.var_dc85d079))
	{
		level.var_dc85d079 = [];
	}
	if(!isdefined(level.var_e1b6f12f))
	{
		level.var_e1b6f12f = [];
	}
	if(!isdefined(level.var_7ab74a80))
	{
		level.var_7ab74a80 = [];
	}
	level.var_743ac5c7 = getent("waw_huge_shutter", "targetname");
	level.var_743ac5c7.v_start_pos = level.var_743ac5c7.origin;
	level thread function_9dced9c4(#"hash_223e2905daf647d0");
	zm::register_actor_damage_callback(&function_e33d93c4);
	zm_player::register_player_damage_callback(&function_1c0720fc);
	level.check_player_is_ready_for_ammo = &check_player_is_ready_for_ammo;
	level.var_cbcc2ab7 = &function_cbcc2ab7;
}

/*
	Name: function_1525bc35
	Namespace: namespace_edb23975
	Checksum: 0x4FAC3D6
	Offset: 0x10F8
	Size: 0x2D4
	Parameters: 1
	Flags: None
*/
function function_1525bc35(params)
{
	if(isplayer(params.eattacker))
	{
		var_4dc5382f = zm_zonemgr::get_zone_from_position(self.origin);
		if(isinarray(level.var_afc50b14, var_4dc5382f))
		{
			if(!isdefined(params.eattacker.var_a3210d75))
			{
				params.eattacker.var_a3210d75 = 0;
			}
			if(math::cointoss(5) && level.var_d3bc5b54 < (function_a1ef346b().size * 1) && params.eattacker.var_a3210d75 <= 0)
			{
				var_b4392330 = getrandomnavpoint(self.origin, 50);
				if(!isdefined(var_b4392330))
				{
					return;
				}
				var_9917b0be = var_b4392330 + vectorscale((0, 0, 1), 14);
				var_bba58955 = function_4ba8fde(#"hash_5e770ca79b0e5aa4");
				item = item_drop::drop_item(0, undefined, 1, 0, var_bba58955.id, self.origin + vectorscale((0, 0, 1), 40), self.angles + vectorscale((0, 0, 1), 90), 0);
				item.var_dd21aec2 = 1 | 16;
				n_power = (length((self.origin + vectorscale((0, 0, 1), 40)) - var_9917b0be)) * 2;
				drop_time = item zm_utility::fake_physicslaunch(var_9917b0be, n_power);
				item.var_a6762160.var_4cd830a = 1;
				level.var_d3bc5b54++;
			}
		}
		if(level flag::get(#"hash_480a4ce872938116") && level.var_e67580 === params.eattacker)
		{
			params.eattacker namespace_1b527536::function_460882e2();
		}
		if(self.targetname === "world_at_war_zombie")
		{
			level.var_d88181e4++;
		}
	}
}

/*
	Name: function_10a4dd0a
	Namespace: namespace_edb23975
	Checksum: 0x17F04354
	Offset: 0x13D8
	Size: 0x13C
	Parameters: 1
	Flags: None
*/
function function_10a4dd0a(params)
{
	item = params.item;
	if(isplayer(self) && item.var_a6762160.name === #"hash_5e770ca79b0e5aa4")
	{
		self function_aff8caac(1, item);
	}
	if(isplayer(self) && item.var_a6762160.name === "tr_precisionsemi_t9_item_zm_tungsten_side_quest")
	{
		self setweaponammoclip(self.inventory.items[((17 + 1) + 8) + 1].var_627c698b, 20);
		self setweaponammostock(self.inventory.items[((17 + 1) + 8) + 1].var_627c698b, 0);
	}
}

/*
	Name: function_aff8caac
	Namespace: namespace_edb23975
	Checksum: 0x9B60F193
	Offset: 0x1520
	Size: 0x124
	Parameters: 2
	Flags: None
*/
function function_aff8caac(n_count, item)
{
	if(n_count < 0)
	{
		self zm_stats::increment_challenge_stat(#"hash_59ec774113410688");
		playsoundatposition(#"hash_15f62ef7540518b4", self.origin + vectorscale((0, 0, 1), 20));
	}
	if(n_count > 0)
	{
		n_value = 1;
	}
	else
	{
		n_value = 0;
	}
	level namespace_6747c550::function_7df6bb60(#"hash_41af1cdc14b54320", n_value, self);
	if(!isdefined(self.var_a3210d75))
	{
		self.var_a3210d75 = 0;
	}
	self.var_a3210d75 = self.var_a3210d75 + n_count;
	if(is_true(item.var_9f9d9b10))
	{
		level flag::clear(#"hash_50d40a20b859977f");
	}
}

/*
	Name: function_fac9c4ef
	Namespace: namespace_edb23975
	Checksum: 0x353F0AA5
	Offset: 0x1650
	Size: 0x1E
	Parameters: 0
	Flags: None
*/
function function_fac9c4ef()
{
	if(isdefined(self.var_a3210d75))
	{
		return self.var_a3210d75;
	}
	return 0;
}

/*
	Name: teleport_players
	Namespace: namespace_edb23975
	Checksum: 0x4D7DFE08
	Offset: 0x1678
	Size: 0x53C
	Parameters: 2
	Flags: None
*/
function teleport_players(var_e07fc3c5, var_cdf41f72)
{
	if(!isdefined(var_cdf41f72))
	{
		var_cdf41f72 = 1;
	}
	level endon(#"end_game");
	var_cd594462 = 0;
	var_ab9bca5f = 0;
	switch(var_e07fc3c5)
	{
		case "hash_667e89d9c5124e84":
		{
			var_198cd593 = struct::get("arcade_room_dest", "targetname");
			break;
		}
		case "waw":
		{
			var_198cd593 = struct::get("waw_player_start_pos", "targetname");
			var_cd594462 = 1;
			break;
		}
		case "hash_21c62ac93c4f6615":
		{
			var_198cd593 = struct::get("arcade_room_dest_rcxd", "targetname");
			var_ab9bca5f = 1;
			break;
		}
		case "hash_48e09f20b59868fb":
		{
			var_198cd593 = struct::get("soul_capture_dest", "targetname");
			break;
		}
		case "hash_6c9d0501ba0f8c97":
		{
			var_198cd593 = struct::get("arcade_room_dest_waw", "targetname");
			var_ab9bca5f = 1;
			break;
		}
		case "rcxd":
		{
			var_198cd593 = struct::get("rcxd_dest", "targetname");
			var_cd594462 = 1;
			break;
		}
	}
	level clientfield::set("" + #"hash_7017982268bd7369", 1);
	self val::set(#"hash_7ddef091eca1a62", "ignoreme", 1);
	self val::set("arcade_token", "freezecontrols", 1);
	level thread namespace_96b7f11d::function_4cc5fca6();
	self clientfield::increment_to_player("" + #"hash_56c7e620d1de163a", 1);
	self thread function_cac40287();
	var_935d4278 = 2.4;
	wait(var_935d4278);
	if(isdefined(self) && var_cdf41f72)
	{
		self thread animation::play(#"hash_4ae3555a13faa870", self.origin, self.angles);
	}
	wait(2.6 - var_935d4278);
	if(isdefined(self))
	{
		if(!isdefined(self.var_cad5a451))
		{
			self.var_cad5a451 = util::spawn_model("tag_origin", self.origin + vectorscale((0, 0, 1), 30), self.angles);
		}
		if(var_cdf41f72)
		{
			if(is_true(var_cd594462))
			{
				util::setclientsysstate("tritonCmd", "disable", self);
			}
			self thread function_cb0821d3();
			if(self laststand::player_is_in_laststand())
			{
				self notify(#"auto_revive");
			}
		}
		else
		{
			if(is_true(var_ab9bca5f))
			{
				util::setclientsysstate("tritonCmd", "enable", self);
			}
			self thread function_8dd4d280();
		}
		if(isalive(self))
		{
			var_4cfd3626 = {#angles:var_198cd593.angles, #origin:var_198cd593.origin};
			self thread zm_fasttravel::function_66d020b0(undefined, undefined, undefined, undefined, var_4cfd3626, undefined, undefined, 1, 0, 0);
			self val::reset("arcade_token", "freezecontrols");
			self val::reset(#"hash_7ddef091eca1a62", "ignoreme");
		}
	}
}

/*
	Name: function_cac40287
	Namespace: namespace_edb23975
	Checksum: 0xEC0CC9AC
	Offset: 0x1BC0
	Size: 0xB2
	Parameters: 0
	Flags: None
*/
function function_cac40287()
{
	level endon(#"end_game");
	self endon(#"death", #"disconnect");
	self.var_3487fff6 = "" + #"hash_63da9d5355659678";
	self.var_1bfa91a = "_arcade";
	self playsound(#"hash_1104d795d57196df");
	self waittill(#"hash_66790eb1100e11a2");
	self.var_3487fff6 = undefined;
	self.var_1bfa91a = undefined;
}

/*
	Name: function_cb0821d3
	Namespace: namespace_edb23975
	Checksum: 0xE544FD57
	Offset: 0x1C80
	Size: 0x17A
	Parameters: 0
	Flags: None
*/
function function_cb0821d3()
{
	level endon(#"end_game");
	self clientfield::set("in_enemy_mute_smoke", 1);
	self.var_cad5a451 clientfield::increment("" + #"hash_4b1b4c1785fdd11d");
	self.fake_player = self cloneplayer(300000, "none");
	self.fake_player clientfield::set("" + #"hash_4a22451481253e54", 1);
	self.fake_player setowner(self);
	self.fake_player.var_56e602f2 = 1;
	self.fake_player hidefromplayer(self);
	wait(0.1);
	if(isdefined(self.fake_player))
	{
		self.var_620a1710 = spawncollision(#"collision_player_cylinder_32x256", "arcade_fake_player", self.fake_player.origin, self.fake_player.angles);
	}
}

/*
	Name: function_8dd4d280
	Namespace: namespace_edb23975
	Checksum: 0xC254DEF3
	Offset: 0x1E08
	Size: 0x13C
	Parameters: 0
	Flags: None
*/
function function_8dd4d280()
{
	level endon(#"end_game");
	self.var_cad5a451 clientfield::increment("" + #"hash_4b1b4c1785fdd11d");
	if(isdefined(self.var_620a1710))
	{
		self.var_620a1710 delete();
	}
	self waittill(#"hash_66790eb1100e11a2", #"death");
	if(isdefined(self.fake_player))
	{
		self.fake_player delete();
	}
	if(isdefined(self.var_cad5a451))
	{
		self.var_cad5a451 delete();
	}
	self clientfield::set("in_enemy_mute_smoke", 0);
	level clientfield::set("" + #"hash_7017982268bd7369", 0);
}

/*
	Name: function_a9291db2
	Namespace: namespace_edb23975
	Checksum: 0xBEEE49F9
	Offset: 0x1F50
	Size: 0x36
	Parameters: 1
	Flags: None
*/
function function_a9291db2(item)
{
	if(self function_fac9c4ef() < 1)
	{
		return true;
	}
	return false;
}

/*
	Name: function_e922fa3c
	Namespace: namespace_edb23975
	Checksum: 0x763F6628
	Offset: 0x1F90
	Size: 0x54
	Parameters: 0
	Flags: None
*/
function function_e922fa3c()
{
	s_machine = struct::get("arc_tok_machine");
	s_machine zm_unitrigger::create(&function_f5d285bc, 64, &function_39cf3d5e);
}

/*
	Name: function_f5d285bc
	Namespace: namespace_edb23975
	Checksum: 0x9970C7C5
	Offset: 0x1FF0
	Size: 0xC8
	Parameters: 1
	Flags: None
*/
function function_f5d285bc(player)
{
	if(level flag::get(#"hash_50d40a20b859977f"))
	{
		self sethintstring("");
		return false;
	}
	if(!level flag::get(#"hash_3814c5c6793e2b2d"))
	{
		self sethintstring(#"hash_289d0eb4a904e033");
		return true;
	}
	self sethintstring(#"hash_7cdf716f7d50ebe5", 10000);
	return true;
}

/*
	Name: function_39cf3d5e
	Namespace: namespace_edb23975
	Checksum: 0xC4F10454
	Offset: 0x20C8
	Size: 0x130
	Parameters: 0
	Flags: None
*/
function function_39cf3d5e()
{
	level endon(#"end_game");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"trigger");
		activator = waitresult.activator;
		if(isplayer(activator) && activator zm_score::can_player_purchase(10000) && level flag::get(#"hash_3814c5c6793e2b2d"))
		{
			activator zm_score::minus_to_player_score(10000);
			zm_utility::play_sound_at_pos("purchase", activator.origin);
			activator playrumbleonentity(#"hash_410bd55524ae7d");
			self function_521d48eb();
		}
	}
}

/*
	Name: function_98645ab3
	Namespace: namespace_edb23975
	Checksum: 0x668DE284
	Offset: 0x2200
	Size: 0x13E
	Parameters: 0
	Flags: None
*/
function function_98645ab3()
{
	level endon(#"end_game");
	self endon(#"death");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"damage");
		attacker = waitresult.attacker;
		if(isplayer(attacker) && waitresult.mod === "MOD_MELEE" && !level flag::get(#"hash_50d40a20b859977f"))
		{
			zm_utility::play_sound_at_pos("purchase", attacker.origin);
			attacker playrumbleonentity(#"damage_light");
			self function_521d48eb();
			self deletedelay();
		}
		waitframe(1);
	}
}

/*
	Name: function_521d48eb
	Namespace: namespace_edb23975
	Checksum: 0x6E8C65CF
	Offset: 0x2348
	Size: 0x17C
	Parameters: 0
	Flags: None
*/
function function_521d48eb()
{
	var_a464a784 = struct::get("arc_tok_machine_drop");
	var_7d0b21c8 = struct::get(var_a464a784.target);
	var_bba58955 = function_4ba8fde(#"hash_5e770ca79b0e5aa4");
	item = item_drop::drop_item(0, undefined, 1, 0, var_bba58955.id, var_a464a784.origin, var_a464a784.angles, 0);
	item.var_dd21aec2 = 1 | 16;
	n_power = (length(var_a464a784.origin - var_7d0b21c8.origin)) * 2;
	drop_time = item zm_utility::fake_physicslaunch(var_7d0b21c8.origin, n_power);
	item playloopsound(#"hash_37ef61c0931d0e79");
	item.var_9f9d9b10 = 1;
	level flag::set(#"hash_50d40a20b859977f");
}

/*
	Name: function_586afc1e
	Namespace: namespace_edb23975
	Checksum: 0x121F08FE
	Offset: 0x24D0
	Size: 0x13C
	Parameters: 1
	Flags: None
*/
function function_586afc1e(player)
{
	/#
		assert(isplayer(player), "");
	#/
	if(self.stub.var_36d60c16 !== 1 && player getstance() === "prone" && distancesquared(self.origin, player.origin) < 9216)
	{
		self.stub.var_36d60c16 = 1;
		level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:"loose_change_zm", #attacker:player});
		zm_utility::play_sound_at_pos("purchase", player.origin);
		player function_bc82f900(#"hash_410bd55524ae7d");
	}
}

/*
	Name: function_3fd2fae6
	Namespace: namespace_edb23975
	Checksum: 0x2ED94C8C
	Offset: 0x2618
	Size: 0x124
	Parameters: 1
	Flags: None
*/
function function_3fd2fae6(str_endon_notify)
{
	level endon(#"end_game", str_endon_notify);
	level waittill(#"hash_3e765c26047c9f54");
	if(level flag::get(#"hash_549a957b8f4d551f"))
	{
		if(isdefined(level.var_d2510899))
		{
			level.var_d2510899 thread function_479655a0();
			function_cb9d983();
		}
	}
	if(level flag::get(#"hash_62300d1a6a6d537e"))
	{
		if(isdefined(level.var_7a1e7f5e))
		{
			level.var_7a1e7f5e thread function_d1e82c7e();
		}
	}
	if(level flag::get(#"hash_480a4ce872938116"))
	{
		if(isdefined(level.var_e67580))
		{
			level.var_e67580 thread function_c4d12d9e();
		}
	}
}

/*
	Name: function_9dced9c4
	Namespace: namespace_edb23975
	Checksum: 0xD3B1306B
	Offset: 0x2748
	Size: 0x1C0
	Parameters: 1
	Flags: None
*/
function function_9dced9c4(var_9148fa4e)
{
	level endon(#"end_game");
	while(true)
	{
		n_round_number = (isdefined(level.round_number) ? level.round_number : 1);
		if(n_round_number > 10)
		{
			a_players = function_a1ef346b();
			var_e4da00c4 = 0;
			foreach(player in a_players)
			{
				if(player flag::get(var_9148fa4e))
				{
					var_e4da00c4++;
				}
			}
			if(var_e4da00c4 == a_players.size)
			{
				switch(var_9148fa4e)
				{
					case "hash_6570ebf5a30c93d":
					{
						function_cb9d983();
						break;
					}
					case "hash_299f96da2a2177b8":
					{
						level thread function_7e83adbe();
						break;
					}
					case "hash_223e2905daf647d0":
					{
						level thread function_99cd0986();
						break;
					}
				}
				break;
			}
		}
		wait(10);
	}
}

/*
	Name: function_1c0720fc
	Namespace: namespace_edb23975
	Checksum: 0x73402052
	Offset: 0x2910
	Size: 0x138
	Parameters: 10
	Flags: None
*/
function function_1c0720fc(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime)
{
	if(level.var_e67580 === self && level flag::get(#"hash_480a4ce872938116"))
	{
		if(function_b8c888fe(psoffsettime))
		{
			self.health = 1;
			psoffsettime = 0;
			self thread function_c4d12d9e();
		}
	}
	if(level.var_d2510899 === self && level flag::get(#"hash_549a957b8f4d551f"))
	{
		if(function_b8c888fe(psoffsettime))
		{
			self.health = 1;
			psoffsettime = 0;
			self thread function_479655a0();
		}
	}
	return psoffsettime;
}

/*
	Name: function_b8c888fe
	Namespace: namespace_edb23975
	Checksum: 0x7EBB984B
	Offset: 0x2A50
	Size: 0x28
	Parameters: 1
	Flags: None
*/
function function_b8c888fe(n_dmg)
{
	if(self.health <= n_dmg)
	{
		return true;
	}
	return false;
}

/*
	Name: function_fad9663
	Namespace: namespace_edb23975
	Checksum: 0x918EE87B
	Offset: 0x2A88
	Size: 0x128
	Parameters: 0
	Flags: None
*/
function function_fad9663()
{
	level endon(#"end_game");
	while(true)
	{
		level flag::wait_till_any([2:#"hash_480a4ce872938116", 1:#"hash_62300d1a6a6d537e", 0:#"hash_549a957b8f4d551f"]);
		level flag::set(#"hash_561302e48877300e");
		level flag::wait_till_clear_all([2:#"hash_480a4ce872938116", 1:#"hash_62300d1a6a6d537e", 0:#"hash_549a957b8f4d551f"]);
		level flag::clear(#"hash_561302e48877300e");
	}
}

/*
	Name: function_16b5f843
	Namespace: namespace_edb23975
	Checksum: 0xCA6DE984
	Offset: 0x2BB8
	Size: 0x13E
	Parameters: 2
	Flags: None
*/
function function_16b5f843(var_89dc7169, var_77e2e323)
{
	while(getfreeactorcount() < var_89dc7169)
	{
		a_zombies = getaiarchetypearray(#"zombie", level.zombie_team);
		foreach(zombie in a_zombies)
		{
			if(isalive(zombie) && zombie.targetname === var_77e2e323)
			{
				arrayremovevalue(a_zombies, zombie);
			}
		}
		if(a_zombies.size > 0)
		{
			function_d59a3443(a_zombies);
		}
		waitframe(1);
	}
}

/*
	Name: function_d749d5ee
	Namespace: namespace_edb23975
	Checksum: 0x8ED86666
	Offset: 0x2D00
	Size: 0x8C
	Parameters: 0
	Flags: None
*/
function function_d749d5ee()
{
	var_e46d4140 = struct::get("trig_soul_capture", "targetname");
	s_unitrigger = var_e46d4140 zm_unitrigger::create(&function_70c1775c, (32, 32, 64), &function_77c58cc5);
	zm_unitrigger::unitrigger_force_per_player_triggers(s_unitrigger, 1);
}

/*
	Name: function_70c1775c
	Namespace: namespace_edb23975
	Checksum: 0xA023701
	Offset: 0x2D98
	Size: 0x194
	Parameters: 1
	Flags: None
*/
function function_70c1775c(e_player)
{
	if(isplayer(e_player))
	{
		self function_586afc1e(e_player);
		if(!level flag::get(#"hash_3814c5c6793e2b2d"))
		{
			self sethintstring(#"hash_289d0eb4a904e033");
			return true;
		}
		if(level flag::get(#"hash_549a957b8f4d551f"))
		{
			self sethintstring(#"hash_25f4721d7307ef13");
			return true;
		}
		if(e_player function_fac9c4ef() < 1)
		{
			self sethintstring(#"hash_1f1d995eeb05ad8a");
			return true;
		}
		if(!level flag::get(#"hash_549a957b8f4d551f") && !e_player flag::get(#"hash_6570ebf5a30c93d"))
		{
			self sethintstring(#"hash_2fe226a09d7fc8d4");
			return true;
		}
		return false;
	}
	return false;
}

/*
	Name: function_77c58cc5
	Namespace: namespace_edb23975
	Checksum: 0x32FF9FC5
	Offset: 0x2F38
	Size: 0x1B0
	Parameters: 0
	Flags: None
*/
function function_77c58cc5()
{
	level endon(#"end_game");
	while(true)
	{
		result = undefined;
		result = self waittill(#"trigger");
		if(level flag::get(#"hash_549a957b8f4d551f") || namespace_96b7f11d::function_1fd1da2b() || !level flag::get(#"hash_3814c5c6793e2b2d"))
		{
			continue;
		}
		if(isdefined(result.activator) && result.activator function_fac9c4ef() >= 1 && !result.activator flag::get(#"hash_6570ebf5a30c93d"))
		{
			level.var_d2510899 = result.activator;
			result.activator function_aff8caac(-1);
			level.var_d3bc5b54--;
			level.var_8fa957ce++;
			if(level.var_8fa957ce >= 1)
			{
				level.var_8fa957ce = 0;
				level.var_d2510899 thread function_a1abe9f5();
			}
		}
		else
		{
			/#
				iprintlnbold("");
			#/
		}
	}
}

/*
	Name: function_a1abe9f5
	Namespace: namespace_edb23975
	Checksum: 0xEFD42B2A
	Offset: 0x30F0
	Size: 0x444
	Parameters: 0
	Flags: None
*/
function function_a1abe9f5()
{
	level endon(#"end_game");
	self.var_d2859364 = 1;
	if(is_true(self.var_b57cb1c0) && is_true(self.var_c6462371) && is_true(self.var_d2859364))
	{
		self zm_stats::increment_challenge_stat(#"hash_2157c2e652a3a1e4");
	}
	foreach(loc in level.var_530e3da9)
	{
		if(!isdefined(level.var_ebc8f1b9))
		{
			level.var_ebc8f1b9 = [];
		}
		else if(!isarray(level.var_ebc8f1b9))
		{
			level.var_ebc8f1b9 = array(level.var_ebc8f1b9);
		}
		level.var_ebc8f1b9[level.var_ebc8f1b9.size] = util::spawn_model("tag_origin", loc.origin, loc.angles);
	}
	foreach(var_532c4db3 in level.var_ebc8f1b9)
	{
		var_532c4db3 clientfield::set("" + #"hash_7289d683073752c8", 1);
	}
	if(!zm_score::can_player_purchase(500))
	{
		self zm_score::add_to_player_score(500 - self zm_score::function_ffc2d0bc());
	}
	namespace_8b6a9d79::function_20d7e9c7(level.var_2ab5eeb7);
	self clientfield::set_to_player("" + #"hash_4f232c4c4c5f7816", 1);
	level flag::set(#"hash_549a957b8f4d551f");
	self flag::set(#"hash_5b86982b4c9c8c5");
	level.var_2ab5eeb7 thread function_420e9362();
	level thread function_3fd2fae6(#"hash_2da9a9ed61d2a6df");
	self thread teleport_players(#"hash_48e09f20b59868fb");
	self function_ec736a99();
	self function_38db9cb2();
	wait(2.6);
	if(isdefined(self))
	{
		self function_ec7fa3d9();
		self clientfield::set_to_player("" + #"hash_721d42a28d7461ea", 1);
	}
	wait(3);
	if(isdefined(level.var_2ab5eeb7.trigger) && isdefined(self))
	{
		level.var_2ab5eeb7.trigger useby(self);
	}
}

/*
	Name: function_479655a0
	Namespace: namespace_edb23975
	Checksum: 0x73B39B0D
	Offset: 0x3540
	Size: 0x350
	Parameters: 0
	Flags: None
*/
function function_479655a0()
{
	level endon(#"end_game");
	self endoncallback(&function_507151f, #"death");
	if(isplayer(self))
	{
		self flag::set(#"hash_6570ebf5a30c93d");
		self thread teleport_players(#"hash_667e89d9c5124e84", 0);
		self clientfield::set_to_player("" + #"hash_721d42a28d7461ea", 0);
		self function_b153ad4c();
		self flag::clear(#"hash_5b86982b4c9c8c5");
		wait(2.6);
		level flag::clear(#"hash_549a957b8f4d551f");
		if(isdefined(self))
		{
			self clientfield::set_to_player("" + #"hash_721d42a28d7461ea", 0);
			self clientfield::set_to_player("" + #"hash_4f232c4c4c5f7816", 0);
			self function_a56f7c6();
		}
		foreach(var_532c4db3 in level.var_ebc8f1b9)
		{
			var_532c4db3 clientfield::set("" + #"hash_7289d683073752c8", 0);
		}
		array::delete_all(level.var_ebc8f1b9);
		level.var_ebc8f1b9 = [];
		if(isdefined(level.var_2ab5eeb7.var_fe2612fe[#"hash_6b1e5d8f9e70a70e"][0].scriptmodel))
		{
			level.var_2ab5eeb7.var_fe2612fe[#"hash_6b1e5d8f9e70a70e"][0].scriptmodel delete();
		}
		if(isdefined(level.var_2ab5eeb7.var_fe2612fe[#"hash_6b1e5d8f9e70a70e"][0].scriptmodel.trigger))
		{
			level.var_2ab5eeb7.var_fe2612fe[#"hash_6b1e5d8f9e70a70e"][0].scriptmodel.trigger delete();
		}
		level notify(#"hash_2da9a9ed61d2a6df");
	}
}

/*
	Name: function_420e9362
	Namespace: namespace_edb23975
	Checksum: 0x63DC94AA
	Offset: 0x3898
	Size: 0x154
	Parameters: 0
	Flags: None
*/
function function_420e9362()
{
	level endon(#"end_game");
	while(true)
	{
		self waittill(#"active");
		level clientfield::set("" + #"hash_14197af7df70a497", 1);
		wait(4);
		level thread function_c5d54048();
		self flag::wait_till_clear("active");
		level notify(#"hash_1c96e6001dd1ccaf");
		level function_6a68d21e();
		wait(2);
		level clientfield::set("" + #"hash_14197af7df70a497", 0);
		wait(25);
		if(isplayer(level.var_d2510899))
		{
			level.var_d2510899 thread function_479655a0();
		}
		break;
	}
}

/*
	Name: function_507151f
	Namespace: namespace_edb23975
	Checksum: 0x2B900333
	Offset: 0x39F8
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function function_507151f(str_notify)
{
	if(level flag::get(#"hash_549a957b8f4d551f"))
	{
		level flag::clear(#"hash_549a957b8f4d551f");
	}
}

/*
	Name: function_b370e26e
	Namespace: namespace_edb23975
	Checksum: 0x2C656EB2
	Offset: 0x3A50
	Size: 0xCA
	Parameters: 0
	Flags: None
*/
function function_b370e26e()
{
	n_players = getplayers().size;
	self.var_a4b9e38b = 0;
	switch(n_players)
	{
		case 1:
		{
			self.var_53be7e08 = 1.25;
			break;
		}
		case 2:
		{
			self.var_53be7e08 = 1;
			break;
		}
		case 3:
		{
			self.var_53be7e08 = 0.9;
			break;
		}
		default:
		{
			self.var_53be7e08 = 0.8;
			break;
		}
	}
}

/*
	Name: function_c5d54048
	Namespace: namespace_edb23975
	Checksum: 0x6FE7475
	Offset: 0x3B28
	Size: 0x216
	Parameters: 0
	Flags: None
*/
function function_c5d54048()
{
	level endon(#"end_game", #"hash_1c96e6001dd1ccaf");
	a_spawners = struct::get_array("s_dragon_rocket_portals", "targetname");
	while(true)
	{
		if(level.var_b082a9eb.size < 8)
		{
			ai_type = get_ai_type();
			spawner = array::random(a_spawners);
			var_e98d14fc = (function_21a3a673(-15, 15), function_21a3a673(-15, 15), 0);
			if(isdefined(ai_type))
			{
				function_16b5f843(1, "soul_capture_zombie");
				ai = spawnactor(ai_type, spawner.origin + var_e98d14fc, spawner.angles, "soul_capture_zombie", 1);
				if(isdefined(ai))
				{
					function_c7921311(ai);
					if(!isdefined(level.var_b082a9eb))
					{
						level.var_b082a9eb = [];
					}
					else if(!isarray(level.var_b082a9eb))
					{
						level.var_b082a9eb = array(level.var_b082a9eb);
					}
					level.var_b082a9eb[level.var_b082a9eb.size] = ai;
				}
			}
		}
		function_1eaaceab(level.var_b082a9eb);
		wait(1);
	}
}

/*
	Name: function_c7921311
	Namespace: namespace_edb23975
	Checksum: 0x9E487D07
	Offset: 0x3D48
	Size: 0xB2
	Parameters: 1
	Flags: Private
*/
function private function_c7921311(e_zombie)
{
	if(isdefined(e_zombie))
	{
		e_zombie.var_126d7bef = 1;
		e_zombie.ignore_round_spawn_failsafe = 1;
		e_zombie.b_ignore_cleanup = 1;
		e_zombie.ignore_enemy_count = 1;
		e_zombie.no_powerups = 1;
		e_zombie pathmode("move allowed");
		e_zombie.completed_emerging_into_playable_area = 1;
		e_zombie.zombie_think_done = 1;
		e_zombie namespace_85745671::function_9758722("sprint");
		e_zombie.ignore_nuke = 1;
	}
}

/*
	Name: get_ai_type
	Namespace: namespace_edb23975
	Checksum: 0xEDF7FFFF
	Offset: 0x3E08
	Size: 0x96
	Parameters: 0
	Flags: None
*/
function get_ai_type()
{
	var_628d63d0 = randomintrange(0, 100);
	if(var_628d63d0 > 20)
	{
		ai_type = array::random(array("spawner_bo5_zombie_zm_tungsten", "spawner_bo5_zombie_zm_tungsten_omega_soldier"));
		return ai_type;
	}
	if(var_628d63d0 > 5)
	{
		return "spawner_bo5_zombie_zm_tungsten_armor_medium";
	}
	return "spawner_bo5_zombie_zm_tungsten_armor_heavy";
}

/*
	Name: function_6a68d21e
	Namespace: namespace_edb23975
	Checksum: 0xA1AC2083
	Offset: 0x3EA8
	Size: 0xC8
	Parameters: 0
	Flags: None
*/
function function_6a68d21e()
{
	foreach(zombie in level.var_b082a9eb)
	{
		arrayremovevalue(level.var_b082a9eb, zombie);
		if(isalive(zombie))
		{
			zombie.allowdeath = 1;
			zombie kill();
		}
	}
}

/*
	Name: function_cb9d983
	Namespace: namespace_edb23975
	Checksum: 0xD7FC04E3
	Offset: 0x3F78
	Size: 0x48
	Parameters: 0
	Flags: None
*/
function function_cb9d983()
{
	if(isarray(level.var_ebc8f1b9))
	{
		array::delete_all(level.var_ebc8f1b9);
		level.var_ebc8f1b9 = [];
	}
}

/*
	Name: function_38db9cb2
	Namespace: namespace_edb23975
	Checksum: 0x1B607D67
	Offset: 0x3FC8
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function function_38db9cb2()
{
	var_16f12c31 = function_2e532eed(self.inventory.items[17]);
	if(var_16f12c31.var_bd027dd9 != 32767)
	{
		self namespace_b376ff3f::function_5852cb7b(var_16f12c31.var_bd027dd9);
	}
}

/*
	Name: function_a56f7c6
	Namespace: namespace_edb23975
	Checksum: 0x1E377CA2
	Offset: 0x4038
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function function_a56f7c6()
{
	var_12a9e30a = self.var_7fac85b6;
	if(!isdefined(var_12a9e30a))
	{
		return;
	}
	scorestreak = var_12a9e30a.scorestreak;
	if(scorestreak.var_bd027dd9 != 32767)
	{
		var_87b53013 = namespace_ad5a0cd6::function_d73e17cb(scorestreak.var_a6762160);
		self namespace_1cc7b406::function_52df229a(var_87b53013);
	}
}

/*
	Name: function_d1f847f9
	Namespace: namespace_edb23975
	Checksum: 0x50D2C823
	Offset: 0x40C8
	Size: 0x8C
	Parameters: 0
	Flags: None
*/
function function_d1f847f9()
{
	var_e5fea6e4 = struct::get("trig_arcade_token_rcxd", "targetname");
	s_unitrigger = var_e5fea6e4 zm_unitrigger::create(&function_542f231, (32, 32, 64), &function_73943beb);
	zm_unitrigger::unitrigger_force_per_player_triggers(s_unitrigger, 1);
}

/*
	Name: function_542f231
	Namespace: namespace_edb23975
	Checksum: 0x712DA7EC
	Offset: 0x4160
	Size: 0x194
	Parameters: 1
	Flags: None
*/
function function_542f231(e_player)
{
	if(isplayer(e_player))
	{
		self function_586afc1e(e_player);
		if(!level flag::get(#"hash_3814c5c6793e2b2d"))
		{
			self sethintstring(#"hash_289d0eb4a904e033");
			return true;
		}
		if(level flag::get(#"hash_62300d1a6a6d537e"))
		{
			self sethintstring(#"hash_25f4721d7307ef13");
			return true;
		}
		if(e_player function_fac9c4ef() < 1)
		{
			self sethintstring(#"hash_4e06f1e56e51cd51");
			return true;
		}
		if(!level flag::get(#"hash_62300d1a6a6d537e") && !e_player flag::get(#"hash_299f96da2a2177b8"))
		{
			self sethintstring(#"hash_1bb1901f0bfdc925");
			return true;
		}
		return false;
	}
	return false;
}

/*
	Name: function_73943beb
	Namespace: namespace_edb23975
	Checksum: 0x20F0CAFC
	Offset: 0x4300
	Size: 0x1B0
	Parameters: 0
	Flags: None
*/
function function_73943beb()
{
	level endon(#"end_game");
	while(true)
	{
		result = undefined;
		result = self waittill(#"trigger");
		if(level flag::get(#"hash_62300d1a6a6d537e") || namespace_96b7f11d::function_1fd1da2b() || !level flag::get(#"hash_3814c5c6793e2b2d"))
		{
			continue;
		}
		if(isdefined(result.activator) && result.activator function_fac9c4ef() >= 1 && !result.activator flag::get(#"hash_299f96da2a2177b8"))
		{
			level.var_7a1e7f5e = result.activator;
			result.activator function_aff8caac(-1);
			level.var_d3bc5b54--;
			level.var_4d2ce592++;
			if(level.var_4d2ce592 >= 1)
			{
				level.var_4d2ce592 = 0;
				result.activator thread function_2e25017c();
			}
		}
		else
		{
			/#
				iprintlnbold("");
			#/
		}
	}
}

/*
	Name: function_2e25017c
	Namespace: namespace_edb23975
	Checksum: 0xFA1D3E52
	Offset: 0x44B8
	Size: 0x314
	Parameters: 0
	Flags: None
*/
function function_2e25017c()
{
	level endon(#"end_game");
	self endon(#"death", #"disconnect");
	self.var_b57cb1c0 = 1;
	if(is_true(self.var_b57cb1c0) && is_true(self.var_c6462371) && is_true(self.var_d2859364))
	{
		self zm_stats::increment_challenge_stat(#"hash_2157c2e652a3a1e4");
	}
	self thread teleport_players(#"rcxd");
	self function_ec736a99();
	self function_11e9b637();
	level clientfield::set("" + #"hash_5e34e1c50fd13b32", 1);
	level flag::set(#"hash_62300d1a6a6d537e");
	level thread function_3fd2fae6(#"hash_1c50128f55aceb5d");
	level thread function_518c1741();
	level thread function_e59b491c();
	level.no_powerups = 1;
	self clientfield::set("" + #"hash_1a529bb0de6717d5", 1);
	self waittill(#"hash_66790eb1100e11a2");
	function_65ff42b0();
	self clientfield::set("" + #"hash_1a529bb0de6717d5", 0);
	level.var_bd7e65ee = 60;
	level thread function_351b438f(level.var_bd7e65ee);
	level thread function_a1d59940();
	wait(1);
	if(isdefined(self))
	{
		self val::set("arcade_rcxd_invulnerable", "takedamage", 0);
		self hide();
		self val::set(#"hash_7ddef091eca1a62", "ignoreme", 1);
	}
}

/*
	Name: function_d1e82c7e
	Namespace: namespace_edb23975
	Checksum: 0x96E65123
	Offset: 0x47D8
	Size: 0x224
	Parameters: 0
	Flags: None
*/
function function_d1e82c7e()
{
	level endon(#"end_game");
	self endoncallback(&function_217289c3, #"death");
	level notify(#"hash_1c50128f55aceb5d");
	function_72c6bc73();
	level.var_7a1e7f5e thread objective_manager::function_a809e69a();
	self thread teleport_players(#"hash_21c62ac93c4f6615", 0);
	wait(2.6);
	level flag::clear(#"hash_62300d1a6a6d537e");
	if(isdefined(self))
	{
		self show();
		self val::reset("arcade_rcxd_invulnerable", "takedamage");
		self val::reset(#"hash_7ddef091eca1a62", "ignoreme");
		self function_8a892bd();
	}
	if(isdefined(level.rcxd))
	{
		level.rcxd clientfield::increment("" + #"hash_485fe8f642043f78");
		level.rcxd playrumbleonentity("sr_prototype_generator_explosion");
		if(isdefined(level.rcxd))
		{
			level.rcxd delete();
		}
	}
	wait(1);
	level.no_powerups = 0;
	level clientfield::set("" + #"hash_5e34e1c50fd13b32", 0);
}

/*
	Name: function_217289c3
	Namespace: namespace_edb23975
	Checksum: 0xE0C9BA15
	Offset: 0x4A08
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function function_217289c3(str_notify)
{
	if(level flag::get(#"hash_62300d1a6a6d537e"))
	{
		level flag::clear(#"hash_62300d1a6a6d537e");
	}
}

/*
	Name: function_65ff42b0
	Namespace: namespace_edb23975
	Checksum: 0x4FEF6317
	Offset: 0x4A60
	Size: 0x1A4
	Parameters: 0
	Flags: None
*/
function function_65ff42b0()
{
	if(!isdefined(level.rcxd))
	{
		var_6c8607dd = struct::get("rcxd_spawner", "targetname");
		level.rcxd = spawnvehicle(#"hash_1fac6cb792fef8ba", var_6c8607dd.origin, var_6c8607dd.angles);
		if(isdefined(level.rcxd) && isdefined(level.var_7a1e7f5e))
		{
			level.rcxd val::set("gp", "takedamage", 0);
			level.rcxd clientfield::increment("" + #"hash_4145b0d4262e2782");
			level.rcxd.targetname = "gp_car";
			level.rcxd setmodel(#"hash_382cae6d0e96aa9a");
			level.rcxd.owner = level.var_7a1e7f5e;
			level.rcxd usevehicle(level.var_7a1e7f5e, 0);
			level.rcxd makevehicleunusable();
			level.rcxd thread function_4b03ed5b();
		}
	}
}

/*
	Name: function_4b03ed5b
	Namespace: namespace_edb23975
	Checksum: 0xD2444DCA
	Offset: 0x4C10
	Size: 0xC4
	Parameters: 0
	Flags: None
*/
function function_4b03ed5b()
{
	level endon(#"end_game", #"hash_1c50128f55aceb5d", #"hash_32fbb01af328f0df");
	self endon(#"death");
	while(!(isdefined(self.owner) && (self.owner attackbuttonpressed() || self.owner vehicleattackbuttonpressed())))
	{
		waitframe(1);
	}
	if(isdefined(level.var_7a1e7f5e))
	{
		level.var_7a1e7f5e thread function_d1e82c7e();
	}
}

/*
	Name: function_351b438f
	Namespace: namespace_edb23975
	Checksum: 0xBF923AFF
	Offset: 0x4CE0
	Size: 0x11C
	Parameters: 1
	Flags: None
*/
function function_351b438f(n_time)
{
	self notify("edaef01dcdcb6d6");
	self endon("edaef01dcdcb6d6");
	level endon(#"end_game", #"hash_1c50128f55aceb5d", #"hash_5108d93797e14b36");
	level.var_7a1e7f5e thread objective_manager::function_a809e69a();
	util::wait_network_frame();
	if(isdefined(level.var_7a1e7f5e))
	{
		level.var_7a1e7f5e thread objective_manager::function_b8278876(n_time, "rcxd_timer");
	}
	level.var_9fc3d88 = gettime() + (n_time * 1000);
	wait(n_time);
	if(isdefined(level.var_7a1e7f5e))
	{
		level notify(#"hash_32fbb01af328f0df");
		level.var_7a1e7f5e thread function_d1e82c7e();
	}
}

/*
	Name: function_518c1741
	Namespace: namespace_edb23975
	Checksum: 0x2382954D
	Offset: 0x4E08
	Size: 0x30C
	Parameters: 0
	Flags: None
*/
function function_518c1741()
{
	var_a1b482ae = struct::get_array("money_spawn_loc", "targetname");
	foreach(loc in var_a1b482ae)
	{
		var_7d81025 = zm_powerups::specific_powerup_drop("bonus_points_player", loc.origin, undefined, 0.1, undefined, 1, 1, 1, 1, 0);
		var_7d81025 thread function_dd39bb8();
		if(!isdefined(level.var_fd23d5ca))
		{
			level.var_fd23d5ca = [];
		}
		else if(!isarray(level.var_fd23d5ca))
		{
			level.var_fd23d5ca = array(level.var_fd23d5ca);
		}
		level.var_fd23d5ca[level.var_fd23d5ca.size] = var_7d81025;
	}
	var_aff9ea6f = struct::get_array("small_money_spawn_loc", "targetname");
	foreach(loc in var_aff9ea6f)
	{
		var_3fdd0f6 = util::spawn_model(#"hash_62b204735601bbc9", loc.origin, loc.angles);
		var_3fdd0f6 thread function_e1323639();
		var_3fdd0f6 clientfield::set("" + #"hash_431b27e4b133e650", 1);
		if(!isdefined(level.var_edde4ca0))
		{
			level.var_edde4ca0 = [];
		}
		else if(!isarray(level.var_edde4ca0))
		{
			level.var_edde4ca0 = array(level.var_edde4ca0);
		}
		level.var_edde4ca0[level.var_edde4ca0.size] = var_3fdd0f6;
	}
}

/*
	Name: function_e1323639
	Namespace: namespace_edb23975
	Checksum: 0x9F33D74D
	Offset: 0x5120
	Size: 0x13E
	Parameters: 0
	Flags: None
*/
function function_e1323639()
{
	self endon(#"death");
	while(true)
	{
		if(isdefined(level.rcxd))
		{
			var_981620cb = distance(self.origin, level.rcxd.origin);
			if(var_981620cb < 24)
			{
				self clientfield::set("" + #"hash_431b27e4b133e650", 0);
				level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:"essence_pickup_small", #attacker:level.var_7a1e7f5e});
				arrayremovevalue(level.var_edde4ca0, self);
				util::wait_network_frame();
				if(isdefined(self))
				{
					self delete();
				}
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_a1d59940
	Namespace: namespace_edb23975
	Checksum: 0x1672DBAE
	Offset: 0x5268
	Size: 0xBA
	Parameters: 0
	Flags: None
*/
function function_a1d59940()
{
	level endon(#"end_game", #"hash_1c50128f55aceb5d", #"hash_32fbb01af328f0df");
	while(true)
	{
		if(level.var_fd23d5ca.size === 0)
		{
			level notify(#"hash_5108d93797e14b36");
			level.var_7a1e7f5e flag::set(#"hash_299f96da2a2177b8");
			level.var_7a1e7f5e thread function_d1e82c7e();
			break;
		}
		waitframe(1);
	}
}

/*
	Name: function_72c6bc73
	Namespace: namespace_edb23975
	Checksum: 0x4705D672
	Offset: 0x5330
	Size: 0x134
	Parameters: 0
	Flags: None
*/
function function_72c6bc73()
{
	if(isarray(level.var_fd23d5ca))
	{
		array::delete_all(level.var_fd23d5ca);
		level.var_fd23d5ca = [];
	}
	if(isarray(level.var_edde4ca0))
	{
		foreach(item in level.var_edde4ca0)
		{
			if(isdefined(item))
			{
				item clientfield::set("" + #"hash_431b27e4b133e650", 0);
				item thread util::delayed_delete(1);
			}
		}
		level.var_edde4ca0 = [];
	}
}

/*
	Name: function_3d9adfea
	Namespace: namespace_edb23975
	Checksum: 0x6DA3C88D
	Offset: 0x5470
	Size: 0x8A
	Parameters: 0
	Flags: None
*/
function function_3d9adfea()
{
	if(level flag::get(#"hash_62300d1a6a6d537e"))
	{
		if(isdefined(level.rcxd))
		{
			var_6ed875d5 = [0:level.rcxd];
			return var_6ed875d5;
		}
		return getplayers();
	}
	return getplayers();
}

/*
	Name: function_dd39bb8
	Namespace: namespace_edb23975
	Checksum: 0x42379005
	Offset: 0x5508
	Size: 0x94
	Parameters: 0
	Flags: None
*/
function function_dd39bb8()
{
	level endon(#"end_game", #"hash_1c50128f55aceb5d");
	self endon(#"death");
	self waittill(#"powerup_grabbed");
	if(isdefined(self) && (isdefined(level.rcxd) && isdefined(level.var_7a1e7f5e)))
	{
		arrayremovevalue(level.var_fd23d5ca, self);
	}
}

/*
	Name: function_e59b491c
	Namespace: namespace_edb23975
	Checksum: 0xAE6B1FA5
	Offset: 0x55A8
	Size: 0x344
	Parameters: 0
	Flags: None
*/
function function_e59b491c()
{
	level.var_b0e98854 = getent("move_platform_01", "targetname");
	level.var_1e9363ae = getent("move_platform_02", "targetname");
	level.var_1055c733 = getent("move_platform_03", "targetname");
	level.var_a17bab7 = getent("move_platform_04", "targetname");
	level.var_b0e98854 val::set(#"hash_3e8d5ff226b374f8", "allowdeath", 0);
	level.var_1e9363ae val::set(#"hash_3e8d5ff226b374f8", "allowdeath", 0);
	level.var_1055c733 val::set(#"hash_3e8d5ff226b374f8", "allowdeath", 0);
	level.var_a17bab7 val::set(#"hash_3e8d5ff226b374f8", "allowdeath", 0);
	level.var_b0e98854 thread function_984d18(level.var_b0e98854.origin, level.var_b0e98854.origin + (vectorscale((0, 0, -1), 60)), 2.5);
	level.var_1e9363ae thread function_984d18(level.var_1e9363ae.origin, level.var_1e9363ae.origin + vectorscale((0, 0, 1), 53), 4);
	level.var_1055c733 thread function_984d18(level.var_1055c733.origin, level.var_1055c733.origin + (vectorscale((0, -1, 0), 110)), 6);
	level.var_a17bab7 thread function_984d18(level.var_a17bab7.origin, level.var_a17bab7.origin + vectorscale((0, 1, 0), 110), 6);
	level.var_b0e98854 thread function_27745ace(level.var_b0e98854.origin);
	level.var_1e9363ae thread function_27745ace(level.var_1e9363ae.origin);
	level.var_1055c733 thread function_27745ace(level.var_1055c733.origin);
	level.var_a17bab7 thread function_27745ace(level.var_a17bab7.origin);
}

/*
	Name: function_984d18
	Namespace: namespace_edb23975
	Checksum: 0x5B878ED2
	Offset: 0x58F8
	Size: 0xC2
	Parameters: 3
	Flags: None
*/
function function_984d18(v_start_position, v_destination, n_speed)
{
	self endon(#"death");
	level endon(#"end_game", #"hash_1c50128f55aceb5d");
	while(true)
	{
		self moveto(v_destination, n_speed);
		self waittill(#"movedone");
		self moveto(v_start_position, n_speed);
		self waittill(#"movedone");
		continue;
	}
}

/*
	Name: function_27745ace
	Namespace: namespace_edb23975
	Checksum: 0xB6423126
	Offset: 0x59C8
	Size: 0x62
	Parameters: 1
	Flags: None
*/
function function_27745ace(var_797baafe)
{
	self endon(#"death");
	level endon(#"end_game");
	level waittill(#"hash_1c50128f55aceb5d");
	if(isdefined(self))
	{
		self.origin = var_797baafe;
	}
}

/*
	Name: function_7e83adbe
	Namespace: namespace_edb23975
	Checksum: 0x4161B0CB
	Offset: 0x5A38
	Size: 0xC4
	Parameters: 0
	Flags: None
*/
function function_7e83adbe()
{
	level endon(#"end_game");
	wait(30);
	if(isdefined(level.var_b0e98854))
	{
		level.var_b0e98854 delete();
	}
	if(isdefined(level.var_1e9363ae))
	{
		level.var_1e9363ae delete();
	}
	if(isdefined(level.var_1055c733))
	{
		level.var_1055c733 delete();
	}
	if(isdefined(level.var_a17bab7))
	{
		level.var_a17bab7 delete();
	}
}

/*
	Name: function_11e9b637
	Namespace: namespace_edb23975
	Checksum: 0x604822D6
	Offset: 0x5B08
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function function_11e9b637()
{
	var_16f12c31 = function_2e532eed(self.inventory.items[17]);
	if(var_16f12c31.var_bd027dd9 != 32767)
	{
		self namespace_b376ff3f::function_5852cb7b(var_16f12c31.var_bd027dd9);
	}
}

/*
	Name: function_8a892bd
	Namespace: namespace_edb23975
	Checksum: 0x7AE40818
	Offset: 0x5B78
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function function_8a892bd()
{
	var_12a9e30a = self.var_7fac85b6;
	if(!isdefined(var_12a9e30a))
	{
		return;
	}
	scorestreak = var_12a9e30a.scorestreak;
	if(scorestreak.var_bd027dd9 != 32767)
	{
		var_87b53013 = namespace_ad5a0cd6::function_d73e17cb(scorestreak.var_a6762160);
		self namespace_1cc7b406::function_52df229a(var_87b53013);
	}
}

/*
	Name: function_d823ee31
	Namespace: namespace_edb23975
	Checksum: 0x5B2F1AD6
	Offset: 0x5C08
	Size: 0x8C
	Parameters: 0
	Flags: None
*/
function function_d823ee31()
{
	var_872b56c2 = struct::get("trig_arcade_token_waw", "targetname");
	s_unitrigger = var_872b56c2 zm_unitrigger::create(&function_7991969e, (32, 32, 64), &function_cf9c86a2);
	zm_unitrigger::unitrigger_force_per_player_triggers(s_unitrigger, 1);
}

/*
	Name: function_7991969e
	Namespace: namespace_edb23975
	Checksum: 0xADC14088
	Offset: 0x5CA0
	Size: 0x164
	Parameters: 1
	Flags: None
*/
function function_7991969e(e_player)
{
	if(isplayer(e_player))
	{
		self function_586afc1e(e_player);
		if(!level flag::get(#"hash_3814c5c6793e2b2d"))
		{
			self sethintstring(#"hash_289d0eb4a904e033");
			return true;
		}
		if(level flag::get(#"hash_480a4ce872938116"))
		{
			self sethintstring(#"hash_25f4721d7307ef13");
			return true;
		}
		if(e_player function_fac9c4ef() < 1)
		{
			self sethintstring(#"hash_1a4500d39c86604d");
			return true;
		}
		if(!e_player flag::get(#"hash_223e2905daf647d0"))
		{
			self sethintstring(#"hash_1b885c52daa352c9");
			return true;
		}
		return false;
	}
	return false;
}

/*
	Name: function_cf9c86a2
	Namespace: namespace_edb23975
	Checksum: 0x1B45C87D
	Offset: 0x5E10
	Size: 0x1B0
	Parameters: 0
	Flags: None
*/
function function_cf9c86a2()
{
	level endon(#"end_game");
	while(true)
	{
		result = undefined;
		result = self waittill(#"trigger");
		if(level flag::get(#"hash_480a4ce872938116") || namespace_96b7f11d::function_1fd1da2b() || !level flag::get(#"hash_3814c5c6793e2b2d"))
		{
			continue;
		}
		if(isdefined(result.activator) && result.activator function_fac9c4ef() >= 1 && !result.activator flag::get(#"hash_223e2905daf647d0"))
		{
			level.var_e67580 = result.activator;
			result.activator function_aff8caac(-1);
			level.var_d3bc5b54--;
			level.var_a1274b1e++;
			if(level.var_a1274b1e >= 1)
			{
				level.var_a1274b1e = 0;
				result.activator thread function_f4b38561();
			}
		}
		else
		{
			/#
				iprintlnbold("");
			#/
		}
	}
}

/*
	Name: function_f4b38561
	Namespace: namespace_edb23975
	Checksum: 0x805D59A
	Offset: 0x5FC8
	Size: 0x2DC
	Parameters: 0
	Flags: None
*/
function function_f4b38561()
{
	level endon(#"end_game");
	level flag::set(#"hash_480a4ce872938116");
	self.var_c6462371 = 1;
	if(is_true(self.var_b57cb1c0) && is_true(self.var_c6462371) && is_true(self.var_d2859364))
	{
		self zm_stats::increment_challenge_stat(#"hash_2157c2e652a3a1e4");
	}
	level thread function_3fd2fae6(#"hash_6c8e9e5de4dcbca");
	self thread teleport_players(#"waw");
	level.no_powerups = 1;
	wait(2.35);
	if(isdefined(self))
	{
		self flag::set(#"hash_1d5bd82de65c5fe0");
		self clientfield::set_to_player("" + #"hash_721d42a28d7461ea", 1);
		self function_ec736a99();
		self function_1438349c();
		var_60ed0b9a = getweapon("pistol_semiauto_t9");
		self zm_weapons::weapon_give(var_60ed0b9a);
		self setweaponammoclip(var_60ed0b9a, 8);
		self setweaponammostock(var_60ed0b9a, 24);
		self function_927be4ad();
		self function_ec7fa3d9();
		self namespace_1b527536::function_460882e2();
	}
	wait(4);
	if(isdefined(self))
	{
		self thread function_626741e8(156, "waw_timer");
	}
	level thread function_bf19d77a();
	level thread function_71c9b39e();
	level thread function_303a9602();
}

/*
	Name: function_c4d12d9e
	Namespace: namespace_edb23975
	Checksum: 0x5FE4D63E
	Offset: 0x62B0
	Size: 0x3FE
	Parameters: 0
	Flags: None
*/
function function_c4d12d9e()
{
	level endon(#"end_game");
	self endoncallback(&function_a383e269, #"death");
	level flag::clear(#"hash_3a392f9e78ad040b");
	level flag::clear(#"hash_5d0e7c9928f5f89f");
	level flag::clear(#"hash_6910c382c5e193b2");
	self flag::clear(#"hash_1d5bd82de65c5fe0");
	level notify(#"hash_6c8e9e5de4dcbca");
	self thread teleport_players(#"hash_6c9d0501ba0f8c97", 0);
	level.no_powerups = 0;
	wait(2.6);
	level flag::clear(#"hash_480a4ce872938116");
	level function_f1ff5e00();
	if(isdefined(level.var_743ac5c7))
	{
		level.var_743ac5c7.origin = level.var_743ac5c7.v_start_pos;
	}
	foreach(zombie in level.var_dc85d079)
	{
		if(isalive(zombie))
		{
			zombie.allowdeath = 1;
			zombie kill();
		}
	}
	level.var_dc85d079 = [];
	foreach(zombie in level.var_e1b6f12f)
	{
		if(isalive(zombie))
		{
			zombie.allowdeath = 1;
			zombie kill();
		}
	}
	level.var_e1b6f12f = [];
	foreach(zombie in level.var_7ab74a80)
	{
		if(isalive(zombie))
		{
			zombie.allowdeath = 1;
			zombie kill();
		}
	}
	level.var_7ab74a80 = [];
	if(isdefined(self))
	{
		self function_ceb0a340();
		self function_f965c4c7();
		self function_b153ad4c();
		self clientfield::set_to_player("" + #"hash_721d42a28d7461ea", 0);
		level.var_e67580 = undefined;
	}
}

/*
	Name: function_bf19d77a
	Namespace: namespace_edb23975
	Checksum: 0xAC3CDB28
	Offset: 0x66B8
	Size: 0x336
	Parameters: 0
	Flags: None
*/
function function_bf19d77a()
{
	level endon(#"end_game", #"hash_6c8e9e5de4dcbca");
	level flag::set(#"hash_3a392f9e78ad040b");
	level.var_d88181e4 = 0;
	level.var_2d41c998 = 0;
	while(true)
	{
		if(level flag::get(#"hash_3a392f9e78ad040b"))
		{
			if(level.var_d88181e4 >= 8)
			{
				level flag::clear(#"hash_3a392f9e78ad040b");
				level thread function_f9a67ba4(0);
				wait(8);
				level.var_d88181e4 = 0;
				level.var_2d41c998 = 0;
				level flag::set(#"hash_5d0e7c9928f5f89f");
			}
		}
		if(level flag::get(#"hash_5d0e7c9928f5f89f"))
		{
			if(level.var_d88181e4 >= 11)
			{
				level flag::clear(#"hash_5d0e7c9928f5f89f");
				level thread function_f9a67ba4(1);
				wait(8);
				level.var_d88181e4 = 0;
				level.var_2d41c998 = 0;
				level flag::set(#"hash_6910c382c5e193b2");
			}
		}
		if(level flag::get(#"hash_6910c382c5e193b2"))
		{
			if(level.var_d88181e4 >= 15)
			{
				level flag::clear(#"hash_6910c382c5e193b2");
				level thread function_f9a67ba4(2);
				level notify(#"hash_67be133ca877da79");
				if(isdefined(level.var_743ac5c7))
				{
					level.var_743ac5c7 moveto(level.var_743ac5c7.origin + vectorscale((0, 0, 1), 300), 35);
				}
				if(isdefined(level.var_e67580))
				{
					level.var_e67580 flag::set(#"hash_223e2905daf647d0");
				}
				wait(30);
				if(isdefined(level.var_31919730))
				{
					level.var_31919730 delete();
				}
				if(isdefined(level.var_e67580))
				{
					level.var_e67580 thread function_c4d12d9e();
				}
			}
		}
		wait(2);
	}
}

/*
	Name: function_303a9602
	Namespace: namespace_edb23975
	Checksum: 0xDC6B28E5
	Offset: 0x69F8
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function function_303a9602()
{
	level endon(#"end_game", #"hash_6c8e9e5de4dcbca", #"hash_67be133ca877da79");
	wait(156);
	level notify(#"hash_50f09a6b531a3d86");
	if(isdefined(level.var_e67580))
	{
		level.var_e67580 thread function_c4d12d9e();
	}
}

/*
	Name: function_71c9b39e
	Namespace: namespace_edb23975
	Checksum: 0x40B9C456
	Offset: 0x6A88
	Size: 0x26E
	Parameters: 0
	Flags: None
*/
function function_71c9b39e()
{
	level endon(#"end_game", #"hash_6c8e9e5de4dcbca", #"hash_67be133ca877da79");
	a_spawners = struct::get_array("waw_zombie_spawner", "targetname");
	var_4ba410cb = gettime() + 3000;
	while(true)
	{
		if(level flag::get(#"hash_3a392f9e78ad040b"))
		{
			if(gettime() > var_4ba410cb && level.var_2d41c998 < 8)
			{
				function_f2e99a78(1, a_spawners);
				var_4ba410cb = gettime() + 3000;
			}
		}
		if(level flag::get(#"hash_5d0e7c9928f5f89f"))
		{
			if(gettime() > var_4ba410cb && level.var_2d41c998 < 11)
			{
				function_f2e99a78(2, a_spawners);
				var_4ba410cb = gettime() + 2000;
			}
		}
		if(level flag::get(#"hash_6910c382c5e193b2"))
		{
			if(gettime() > var_4ba410cb && level.var_2d41c998 < 15)
			{
				function_f2e99a78(3, a_spawners);
				var_4ba410cb = gettime() + 1000;
			}
		}
		if(isarray(level.var_dc85d079))
		{
			function_1eaaceab(level.var_dc85d079);
		}
		if(isarray(level.var_e1b6f12f))
		{
			function_1eaaceab(level.var_e1b6f12f);
		}
		if(isarray(level.var_7ab74a80))
		{
			function_1eaaceab(level.var_7ab74a80);
		}
		waitframe(1);
	}
}

/*
	Name: function_f2e99a78
	Namespace: namespace_edb23975
	Checksum: 0x6FD8725D
	Offset: 0x6D00
	Size: 0xE8
	Parameters: 2
	Flags: None
*/
function function_f2e99a78(n_wave, a_spawners)
{
	ai_type = function_a21ee2db();
	spawner = array::random(a_spawners);
	if(isdefined(ai_type))
	{
		function_16b5f843(1, "world_at_war_zombie");
		ai = spawnactor(ai_type, spawner.origin, spawner.angles, "world_at_war_zombie", 1, 1);
		if(isdefined(ai))
		{
			ai function_a71b2318(n_wave, spawner.script_noteworthy);
			level.var_2d41c998++;
		}
	}
}

/*
	Name: function_a71b2318
	Namespace: namespace_edb23975
	Checksum: 0x838B5B5A
	Offset: 0x6DF0
	Size: 0x41A
	Parameters: 2
	Flags: None
*/
function function_a71b2318(n_wave, var_ddd156dd)
{
	self.var_126d7bef = 1;
	self.ignore_round_spawn_failsafe = 1;
	self.b_ignore_cleanup = 1;
	self.ignore_enemy_count = 1;
	self.no_powerups = 1;
	self pathmode("move allowed");
	self.zombie_think_done = 1;
	self.find_flesh_struct_string = var_ddd156dd;
	self thread function_53051fbb();
	self clientfield::set("" + #"hash_3e4641a9ea00d061", 1);
	self.var_36d6f09a = 1;
	self.var_c3083789 = 0;
	self.ignore_nuke = 1;
	switch(n_wave)
	{
		case 1:
		{
			self.health = 200;
			if(math::cointoss(80))
			{
				self namespace_85745671::function_9758722("walk");
			}
			else
			{
				self namespace_85745671::function_9758722("run");
			}
			if(!isdefined(level.var_dc85d079))
			{
				level.var_dc85d079 = [];
			}
			else if(!isarray(level.var_dc85d079))
			{
				level.var_dc85d079 = array(level.var_dc85d079);
			}
			level.var_dc85d079[level.var_dc85d079.size] = self;
			break;
		}
		case 2:
		{
			self.health = 225;
			if(math::cointoss(50))
			{
				self namespace_85745671::function_9758722("walk");
			}
			else
			{
				self namespace_85745671::function_9758722("run");
			}
			if(!isdefined(level.var_e1b6f12f))
			{
				level.var_e1b6f12f = [];
			}
			else if(!isarray(level.var_e1b6f12f))
			{
				level.var_e1b6f12f = array(level.var_e1b6f12f);
			}
			level.var_e1b6f12f[level.var_e1b6f12f.size] = self;
			break;
		}
		case 3:
		{
			self.health = 250;
			if(math::cointoss(80))
			{
				self namespace_85745671::function_9758722("run");
			}
			else
			{
				self namespace_85745671::function_9758722("sprint");
			}
			if(!isdefined(level.var_7ab74a80))
			{
				level.var_7ab74a80 = [];
			}
			else if(!isarray(level.var_7ab74a80))
			{
				level.var_7ab74a80 = array(level.var_7ab74a80);
			}
			level.var_7ab74a80[level.var_7ab74a80.size] = self;
			break;
		}
		default:
		{
			self.health = 100;
			self namespace_85745671::function_9758722("walk");
			break;
		}
	}
}

/*
	Name: function_53051fbb
	Namespace: namespace_edb23975
	Checksum: 0x9CD408F0
	Offset: 0x7218
	Size: 0x42
	Parameters: 0
	Flags: None
*/
function function_53051fbb()
{
	self endon(#"death");
	self waittill(#"completed_emerging_into_playable_area");
	wait(0.5);
	self.var_98f1f37c = 1;
}

/*
	Name: function_a21ee2db
	Namespace: namespace_edb23975
	Checksum: 0x96DCFFD6
	Offset: 0x7268
	Size: 0x4A
	Parameters: 0
	Flags: None
*/
function function_a21ee2db()
{
	ai_type = array::random(array("spawner_bo5_zombie_zm_tungsten_german_soldier", "spawner_bo5_zombie_zm_tungsten_german_soldier_pap_02", "spawner_bo5_zombie_zm_tungsten_german_soldier_pap_03"));
	return ai_type;
}

/*
	Name: function_f9a67ba4
	Namespace: namespace_edb23975
	Checksum: 0x49800DA6
	Offset: 0x72C0
	Size: 0x1BA
	Parameters: 1
	Flags: None
*/
function function_f9a67ba4(var_bb671993)
{
	level endon(#"end_game");
	switch(var_bb671993)
	{
		case 0:
		{
			s_chest = struct::get("waw_chest_loc_01", "targetname");
			function_c99bf6b8(0, s_chest, "zm_tungsten_world_at_war_chest_small", #"hash_27f68725fa24b68", #"hash_5815cc7ba68d56e", 1);
			break;
		}
		case 1:
		{
			s_chest = struct::get("waw_chest_loc_02", "targetname");
			function_c99bf6b8(1, s_chest, "zm_tungsten_world_at_war_chest_medium", #"hash_4392142b99d9d79a", #"hash_7d3c5ac38ba069f0", 1);
			break;
		}
		case 2:
		{
			s_chest = struct::get("waw_chest_loc_03", "targetname");
			function_c99bf6b8(2, s_chest, "zm_tungsten_world_at_war_chest", #"hash_39c86bb99fc237d", #"hash_473df02427c669ff", 2);
			break;
		}
	}
}

/*
	Name: function_c99bf6b8
	Namespace: namespace_edb23975
	Checksum: 0xBE3C23D4
	Offset: 0x7488
	Size: 0x22C
	Parameters: 6
	Flags: None
*/
function function_c99bf6b8(var_e503dc79, s_chest, var_cc1fb2d0, var_31919730, var_91c84189, n_fx)
{
	level.var_31919730 = util::spawn_model("tag_origin", s_chest.origin, s_chest.angles);
	level.var_31919730 clientfield::set("" + #"hash_3d5c2390c0768ed2", 1);
	namespace_58949729::function_4ec9fc99(s_chest, var_cc1fb2d0, var_31919730, var_91c84189, n_fx);
	s_chest.trigger thread function_37c935e1();
	s_chest.scriptmodel thread function_37c935e1();
	if(isdefined(level.var_e67580))
	{
		level namespace_ee206246::objective_set(#"hash_624aaed17c0e408e", s_chest, undefined, undefined, undefined, 96);
		a_players = getplayers();
		foreach(player in a_players)
		{
			if(player == level.var_e67580)
			{
				player namespace_ee206246::function_aee0b4b4(#"hash_624aaed17c0e408e", s_chest);
				continue;
			}
			player namespace_ee206246::function_3029d343(#"hash_624aaed17c0e408e", s_chest);
		}
	}
	s_chest.trigger thread function_c0f95bf4(var_e503dc79);
}

/*
	Name: function_37c935e1
	Namespace: namespace_edb23975
	Checksum: 0x7EDAB95F
	Offset: 0x76C0
	Size: 0x6C
	Parameters: 0
	Flags: None
*/
function function_37c935e1()
{
	level endon(#"end_game");
	self endon(#"death");
	level waittill(#"hash_6c8e9e5de4dcbca");
	self notify(#"chest_opened");
	self delete();
}

/*
	Name: function_c0f95bf4
	Namespace: namespace_edb23975
	Checksum: 0x76B69FE5
	Offset: 0x7738
	Size: 0x3B2
	Parameters: 1
	Flags: None
*/
function function_c0f95bf4(var_e503dc79)
{
	level endon(#"end_game");
	self endon(#"death");
	self waittill(#"chest_opened");
	level namespace_ee206246::objective_complete(#"hash_624aaed17c0e408e");
	switch(var_e503dc79)
	{
		case 0:
		{
			break;
		}
		case 1:
		{
			wait(1);
			drop_pos = self.origin + (vectorscale((0, 0, -1), 10));
			weapon = function_4ba8fde("tr_precisionsemi_t9_item_zm_tungsten_side_quest");
			item = item_drop::drop_item(0, undefined, 1, 0, weapon.id, self.origin, self.angles + (0, 0, 0), 0);
			item.var_dd21aec2 = 1 | 16;
			n_power = (length(self.origin - drop_pos)) * 2;
			drop_time = item zm_utility::fake_physicslaunch(drop_pos, n_power);
			item.var_a6762160.var_4cd830a = 1;
			break;
		}
		case 2:
		{
			wait(1);
			var_8c54d57c = struct::get(#"hash_31e21c3eabb66c4", "targetname");
			var_47314b36 = struct::get(#"hash_31e24c3eabb6bdd", "targetname");
			var_77b72c41 = struct::get(#"hash_31e23c3eabb6a2a", "targetname");
			var_e16a25a6 = level thread zm_powerups::specific_powerup_drop("hero_weapon_power", var_8c54d57c.origin, undefined, 2, undefined, 1, 1, 1, 1, 0);
			var_cfac822b = level thread zm_powerups::specific_powerup_drop("bonus_points_player", var_47314b36.origin, undefined, 2, undefined, 1, 1, 1, 1, 0);
			var_df6febf = level thread zm_powerups::specific_powerup_drop("bonus_points_player", var_77b72c41.origin, undefined, 2, undefined, 1, 1, 1, 1, 0);
			level waittill(#"hash_6c8e9e5de4dcbca");
			if(isdefined(var_e16a25a6))
			{
				var_e16a25a6 delete();
			}
			if(isdefined(var_cfac822b))
			{
				var_cfac822b delete();
			}
			if(isdefined(var_df6febf))
			{
				var_df6febf delete();
			}
			break;
		}
	}
}

/*
	Name: function_ec736a99
	Namespace: namespace_edb23975
	Checksum: 0xEABF412A
	Offset: 0x7AF8
	Size: 0x4BE
	Parameters: 0
	Flags: None
*/
function function_ec736a99()
{
	self.var_7fac85b6 = undefined;
	var_16f12c31 = function_2e532eed(self.inventory.items[17]);
	var_fe58c446 = function_2e532eed(self.inventory.items[13]);
	var_312d49ec = function_2e532eed(self.inventory.items[7]);
	var_4ffaff67 = function_2e532eed(self.inventory.items[12]);
	var_61bf1830 = function_2e532eed(self.inventory.items[17 + 1]);
	var_61bf1830.var_8e092725 = 0;
	weapon1 = var_61bf1830.var_627c698b;
	if(isdefined(weapon1))
	{
		var_61bf1830.clipammo = self getweaponammoclip(weapon1);
		var_61bf1830.stockammo = self getweaponammostock(weapon1);
		if(is_true(weapon1.isdualwield) && isdefined(weapon1.dualwieldweapon) && weapon1.dualwieldweapon != level.weaponnone)
		{
			var_61bf1830.var_7fa2b50b = self getweaponammoclip(weapon1.dualwieldweapon);
		}
	}
	var_c6dd36cf = function_2e532eed(self.inventory.items[((17 + 1) + 8) + 1]);
	var_c6dd36cf.var_8e092725 = 0;
	weapon2 = var_c6dd36cf.var_627c698b;
	if(isdefined(weapon2))
	{
		var_c6dd36cf.clipammo = self getweaponammoclip(weapon2);
		var_c6dd36cf.stockammo = self getweaponammostock(weapon2);
		if(is_true(weapon2.isdualwield) && isdefined(weapon2.dualwieldweapon) && weapon2.dualwieldweapon != level.weaponnone)
		{
			var_c6dd36cf.var_7fa2b50b = self getweaponammoclip(weapon2.dualwieldweapon);
		}
	}
	var_6a59c435 = function_2e532eed(self.inventory.items[((((17 + 1) + 8) + 1) + 8) + 1]);
	var_6a59c435.var_8e092725 = 0;
	weapon3 = var_6a59c435.var_627c698b;
	if(isdefined(weapon3))
	{
		var_6a59c435.clipammo = self getweaponammoclip(weapon3);
		var_6a59c435.stockammo = self getweaponammostock(weapon3);
		if(is_true(weapon3.isdualwield) && isdefined(weapon3.dualwieldweapon) && weapon3.dualwieldweapon != level.weaponnone)
		{
			var_6a59c435.var_7fa2b50b = self getweaponammoclip(weapon3.dualwieldweapon);
		}
	}
	var_37e14db3 = {#fieldupgrade:var_4ffaff67, #weapon3:var_6a59c435, #weapon2:var_c6dd36cf, #weapon1:var_61bf1830, #lethal:var_312d49ec, #tactical:var_fe58c446, #scorestreak:var_16f12c31, #hash_6032cf15:self.armortier, #armor:self.armor};
	self.var_7fac85b6 = var_37e14db3;
}

/*
	Name: function_1438349c
	Namespace: namespace_edb23975
	Checksum: 0x5547776C
	Offset: 0x7FC0
	Size: 0x324
	Parameters: 0
	Flags: None
*/
function function_1438349c()
{
	var_61bf1830 = function_2e532eed(self.inventory.items[17 + 1]);
	var_61bf1830.var_8e092725 = 0;
	weapon1 = var_61bf1830.var_627c698b;
	if(isdefined(weapon1))
	{
		self zm_weapons::weapon_take(weapon1);
	}
	var_c6dd36cf = function_2e532eed(self.inventory.items[((17 + 1) + 8) + 1]);
	var_c6dd36cf.var_8e092725 = 0;
	weapon2 = var_c6dd36cf.var_627c698b;
	if(isdefined(weapon2))
	{
		self zm_weapons::weapon_take(weapon2);
	}
	var_6a59c435 = function_2e532eed(self.inventory.items[((((17 + 1) + 8) + 1) + 8) + 1]);
	var_6a59c435.var_8e092725 = 0;
	weapon3 = var_6a59c435.var_627c698b;
	if(isdefined(weapon3))
	{
		self zm_weapons::weapon_take(weapon3);
	}
	self namespace_dd7e54e3::function_b2f69241();
	var_16f12c31 = function_2e532eed(self.inventory.items[17]);
	if(var_16f12c31.var_bd027dd9 != 32767)
	{
		self namespace_b376ff3f::function_5852cb7b(var_16f12c31.var_bd027dd9);
	}
	var_fe58c446 = function_2e532eed(self.inventory.items[13]);
	if(var_fe58c446.var_bd027dd9 != 32767)
	{
		self namespace_b376ff3f::function_5852cb7b(var_fe58c446.var_bd027dd9);
	}
	var_312d49ec = function_2e532eed(self.inventory.items[7]);
	if(var_312d49ec.var_bd027dd9 != 32767)
	{
		self namespace_b376ff3f::function_5852cb7b(var_312d49ec.var_bd027dd9);
	}
	var_4ffaff67 = function_2e532eed(self.inventory.items[12]);
	if(var_4ffaff67.var_bd027dd9 != 32767)
	{
		self namespace_b376ff3f::function_5852cb7b(var_4ffaff67.var_bd027dd9);
	}
}

/*
	Name: function_ceb0a340
	Namespace: namespace_edb23975
	Checksum: 0x3148F739
	Offset: 0x82F0
	Size: 0x724
	Parameters: 0
	Flags: None
*/
function function_ceb0a340()
{
	var_12a9e30a = self.var_7fac85b6;
	if(!isdefined(var_12a9e30a))
	{
		return;
	}
	if(isdefined(var_12a9e30a.var_6032cf15) && var_12a9e30a.var_6032cf15 > 0)
	{
		if(var_12a9e30a.var_6032cf15 <= self.armortier)
		{
			if(self.armor < var_12a9e30a.armor)
			{
				self.armor = var_12a9e30a.armor;
			}
		}
		else
		{
			switch(var_12a9e30a.var_6032cf15)
			{
				case 1:
				default:
				{
					var_65b6e624 = #"hash_35675bbd363f934a";
					break;
				}
				case 2:
				{
					var_65b6e624 = #"hash_7777b2b5970da847";
					break;
				}
				case 3:
				{
					var_65b6e624 = #"hash_7bc70addda19ca00";
					break;
				}
			}
			self namespace_dd7e54e3::give_armor(var_65b6e624);
			if(self.armor < var_12a9e30a.armor)
			{
				self.armor = var_12a9e30a.armor;
			}
		}
	}
	scorestreak = var_12a9e30a.scorestreak;
	if(scorestreak.var_bd027dd9 != 32767)
	{
		var_87b53013 = namespace_ad5a0cd6::function_d73e17cb(scorestreak.var_a6762160);
		self namespace_1cc7b406::function_52df229a(var_87b53013);
	}
	lethal = var_12a9e30a.lethal;
	if(lethal.var_bd027dd9 != 32767)
	{
		var_16f23139 = namespace_ad5a0cd6::function_d73e17cb(lethal.var_a6762160);
		self namespace_1cc7b406::function_52df229a(var_16f23139, lethal.count, 1);
	}
	tactical = var_12a9e30a.tactical;
	if(tactical.var_bd027dd9 != 32767)
	{
		var_20131ecc = namespace_ad5a0cd6::function_d73e17cb(tactical.var_a6762160);
		self namespace_1cc7b406::function_52df229a(var_20131ecc, tactical.count, 1);
	}
	fieldupgrade = var_12a9e30a.fieldupgrade;
	if(fieldupgrade.var_bd027dd9 != 32767)
	{
		var_8886adf6 = namespace_ad5a0cd6::function_d73e17cb(fieldupgrade.var_a6762160);
		self namespace_1b527536::function_6457e4cd(var_8886adf6, fieldupgrade.count);
	}
	weapon1 = var_12a9e30a.weapon1;
	var_a85dc309 = self.inventory.items[17 + 1];
	var_7accd6f7 = namespace_b376ff3f::function_a33744de(var_a85dc309.var_627c698b);
	dropweapon = self namespace_b376ff3f::function_b76f46a0(weapon1, var_7accd6f7, 1);
	self setweaponammoclip(weapon1.var_627c698b, weapon1.clipammo);
	self setweaponammostock(weapon1.var_627c698b, weapon1.stockammo);
	if(isdefined(weapon1.var_7fa2b50b))
	{
		self setweaponammoclip(weapon1.var_627c698b.dualwieldweapon, int(weapon1.var_7fa2b50b));
	}
	weapon2 = var_12a9e30a.weapon2;
	var_bacb67e4 = self.inventory.items[((17 + 1) + 8) + 1];
	if(isdefined(weapon2.var_627c698b))
	{
		if(!isdefined(var_bacb67e4.var_627c698b))
		{
			self zm_weapons::function_98776900(weapon2, 1, 0);
		}
		else
		{
			var_1f321fb7 = namespace_b376ff3f::function_a33744de(var_bacb67e4.var_627c698b);
			dropweapon = self namespace_b376ff3f::function_b76f46a0(weapon2, var_1f321fb7, 1);
		}
		self setweaponammoclip(weapon2.var_627c698b, weapon2.clipammo);
		self setweaponammostock(weapon2.var_627c698b, weapon2.stockammo);
		if(isdefined(weapon2.var_7fa2b50b))
		{
			self setweaponammoclip(weapon2.var_627c698b.dualwieldweapon, int(weapon2.var_7fa2b50b));
		}
	}
	weapon3 = var_12a9e30a.weapon3;
	var_d0dc1405 = self.inventory.items[((((17 + 1) + 8) + 1) + 8) + 1];
	if(isdefined(weapon3.var_627c698b))
	{
		if(!isdefined(var_d0dc1405.var_627c698b))
		{
			self zm_weapons::function_98776900(weapon3, 1, 0);
		}
		else
		{
			var_2b72b838 = namespace_b376ff3f::function_a33744de(var_d0dc1405.var_627c698b);
			dropweapon = self namespace_b376ff3f::function_b76f46a0(weapon3, var_2b72b838, 1);
		}
		self setweaponammoclip(weapon3.var_627c698b, weapon3.clipammo);
		self setweaponammostock(weapon3.var_627c698b, weapon3.stockammo);
		if(isdefined(weapon3.var_7fa2b50b))
		{
			self setweaponammoclip(weapon3.var_627c698b.dualwieldweapon, int(weapon3.var_7fa2b50b));
		}
	}
}

/*
	Name: function_f1ff5e00
	Namespace: namespace_edb23975
	Checksum: 0x64F0EDB8
	Offset: 0x8A20
	Size: 0x37C
	Parameters: 0
	Flags: None
*/
function function_f1ff5e00()
{
	level endon(#"end_game");
	var_b09e0925 = [];
	var_1e62f913 = struct::get("waw_player_start_pos", "targetname");
	var_2ed67d31 = struct::get_array("exterior_goal", "targetname");
	foreach(barricade in var_2ed67d31)
	{
		if(distance(barricade.origin, var_1e62f913.origin) <= 1500)
		{
			if(!isdefined(var_b09e0925))
			{
				var_b09e0925 = [];
			}
			else if(!isarray(var_b09e0925))
			{
				var_b09e0925 = array(var_b09e0925);
			}
			var_b09e0925[var_b09e0925.size] = barricade;
		}
	}
	for(i = 0; i < var_b09e0925.size; i++)
	{
		barrier = var_b09e0925[i];
		if(zm_utility::all_chunks_intact(barrier, barrier.barrier_chunks))
		{
			continue;
		}
		if(isdefined(barrier.zbarrier))
		{
			a_pieces = barrier.zbarrier getzbarrierpieceindicesinstate("open");
			if(isdefined(a_pieces))
			{
				for(xx = 0; xx < a_pieces.size; xx++)
				{
					chunk = a_pieces[xx];
					barrier.zbarrier zbarrierpieceusedefaultmodel(chunk);
					barrier.zbarrier.chunk_health[chunk] = 0;
				}
			}
			for(x = 0; x < barrier.zbarrier getnumzbarrierpieces(); x++)
			{
				barrier.zbarrier setzbarrierpiecestate(x, "closed");
				barrier.zbarrier showzbarrierpiece(x);
			}
		}
		if(isdefined(barrier.clip))
		{
			barrier.clip triggerenable(1);
			barrier.clip disconnectpaths();
		}
		else
		{
			zm_blockers::blocker_disconnect_paths(barrier.neg_start, barrier.neg_end);
		}
		if((i % 4) == 0)
		{
			util::wait_network_frame();
		}
	}
}

/*
	Name: function_927be4ad
	Namespace: namespace_edb23975
	Checksum: 0xF3D32635
	Offset: 0x8DA8
	Size: 0xF8
	Parameters: 0
	Flags: None
*/
function function_927be4ad()
{
	foreach(perk in self.var_7341f980)
	{
		if(!isdefined(self.var_8e07b6fd))
		{
			self.var_8e07b6fd = [];
		}
		else if(!isarray(self.var_8e07b6fd))
		{
			self.var_8e07b6fd = array(self.var_8e07b6fd);
		}
		self.var_8e07b6fd[self.var_8e07b6fd.size] = perk;
		self namespace_791d0451::function_4c1d0e25(perk);
	}
}

/*
	Name: function_f965c4c7
	Namespace: namespace_edb23975
	Checksum: 0x8107179C
	Offset: 0x8EA8
	Size: 0xB2
	Parameters: 0
	Flags: None
*/
function function_f965c4c7()
{
	if(isarray(self.var_8e07b6fd))
	{
		foreach(perk in self.var_8e07b6fd)
		{
			self namespace_791d0451::function_3fecad82(perk);
		}
		self.var_8e07b6fd = [];
	}
}

/*
	Name: function_ec7fa3d9
	Namespace: namespace_edb23975
	Checksum: 0x1B38C157
	Offset: 0x8F68
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_ec7fa3d9()
{
	self.var_7f2e1d50 = zm_laststand::function_618fd37e();
	self zm_laststand::function_3d685b5f(0);
}

/*
	Name: function_b153ad4c
	Namespace: namespace_edb23975
	Checksum: 0x2A9AC9BE
	Offset: 0x8FA8
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_b153ad4c()
{
	self zm_laststand::function_3d685b5f(self.var_7f2e1d50);
}

/*
	Name: function_99cd0986
	Namespace: namespace_edb23975
	Checksum: 0x97A0DEFC
	Offset: 0x8FD8
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function function_99cd0986()
{
	level endon(#"end_game");
	wait(40);
	if(isdefined(level.var_743ac5c7))
	{
		level.var_743ac5c7 delete();
	}
}

/*
	Name: function_e33d93c4
	Namespace: namespace_edb23975
	Checksum: 0x4453632C
	Offset: 0x9030
	Size: 0x9E
	Parameters: 13
	Flags: None
*/
function function_e33d93c4(inflictor, attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype)
{
	if(self.targetname === "world_at_war_zombie" && surfacetype === "MOD_MELEE")
	{
		boneindex = 50;
	}
	return boneindex;
}

/*
	Name: function_626741e8
	Namespace: namespace_edb23975
	Checksum: 0xEA469E1C
	Offset: 0x90D8
	Size: 0x1D4
	Parameters: 2
	Flags: None
*/
function function_626741e8(n_time, var_6325d314)
{
	level endon(#"end_game");
	self endon(#"death");
	level.var_55fd9380 luielemtext::open(self, 1);
	level.var_55fd9380 luielemtext::function_d5ea17f0(self, #"hash_1747569f8564a727");
	level.var_55fd9380 luielemtext::function_f97e9049(self, 50, 550);
	level.var_55fd9380 luielemtext::set_color(self, 1, 1, 1);
	level.var_55fd9380 luielemtext::function_aa5c711d(self, 1);
	level.var_55fd9380 luielemtext::function_1bd2bb26(self, 1);
	self thread objective_manager::function_b8278876(n_time, var_6325d314);
	level waittill(#"hash_6c8e9e5de4dcbca", #"hash_67be133ca877da79");
	if(isdefined(self))
	{
		if(level.var_55fd9380 luielemtext::is_open(self))
		{
			level.var_55fd9380 luielemtext::close(self);
		}
		self thread objective_manager::function_a809e69a();
	}
}

/*
	Name: check_player_is_ready_for_ammo
	Namespace: namespace_edb23975
	Checksum: 0xC09EAC5B
	Offset: 0x92B8
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function check_player_is_ready_for_ammo(player)
{
	if(level.var_e67580 === player && level flag::get(#"hash_480a4ce872938116"))
	{
		return false;
	}
	return true;
}

/*
	Name: function_cbcc2ab7
	Namespace: namespace_edb23975
	Checksum: 0x483C84EC
	Offset: 0x9318
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function function_cbcc2ab7(player)
{
	if(level.var_e67580 === player && level flag::get(#"hash_480a4ce872938116"))
	{
		return false;
	}
	return true;
}

/*
	Name: function_a383e269
	Namespace: namespace_edb23975
	Checksum: 0x26B59B62
	Offset: 0x9378
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function function_a383e269(str_notify)
{
	if(level flag::get(#"hash_480a4ce872938116"))
	{
		level flag::clear(#"hash_480a4ce872938116");
	}
}

/*
	Name: function_cd7a3de4
	Namespace: namespace_edb23975
	Checksum: 0x306F39E0
	Offset: 0x93D0
	Size: 0x74
	Parameters: 0
	Flags: None
*/
function function_cd7a3de4()
{
	/#
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		zm_devgui::add_custom_devgui_callback(&cmd);
	#/
}

/*
	Name: cmd
	Namespace: namespace_edb23975
	Checksum: 0x9E214731
	Offset: 0x9450
	Size: 0x282
	Parameters: 1
	Flags: None
*/
function cmd(cmd)
{
	/#
		switch(cmd)
		{
			case "hash_455d7fe244b8d836":
			{
				a_players = function_a1ef346b();
				foreach(player in a_players)
				{
					if(player function_fac9c4ef() < 1)
					{
						player function_aff8caac(1);
					}
				}
				break;
			}
			case "hash_6e7195a08bee9603":
			{
				a_players = function_a1ef346b();
				foreach(player in a_players)
				{
					if(player flag::get(#"hash_6570ebf5a30c93d"))
					{
						player flag::clear(#"hash_6570ebf5a30c93d");
					}
				}
				break;
			}
			case "hash_31d56fb057b35676":
			{
				a_players = function_a1ef346b();
				foreach(player in a_players)
				{
					if(player flag::get(#"hash_299f96da2a2177b8"))
					{
						player flag::clear(#"hash_299f96da2a2177b8");
					}
				}
				break;
			}
		}
	#/
}

