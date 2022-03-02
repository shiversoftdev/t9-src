#using script_263b7f2982258785;
#using script_26850092de25d970;
#using script_2b1257dca3b9fd1e;
#using script_2d443451ce681a;
#using script_31786c2dc684e9b;
#using script_31e9b35aaacbbd93;
#using script_32399001bdb550da;
#using script_3626f1b2cf51a99c;
#using script_3b82b8c68189025e;
#using script_3dc93ca9902a9cda;
#using script_4ab78e327b76395f;
#using script_5552bd756afee443;
#using script_61cfc2ab8e60625;
#using script_73e0d5e10c6348fa;
#using script_7cf3e180e994d17f;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\cp_common\gametypes\battlechatter.gsc;
#using scripts\cp_common\gametypes\globallogic_ui.gsc;
#using scripts\cp_common\objectives.gsc;
#using scripts\cp_common\skipto.gsc;
#using scripts\cp_common\util.gsc;

#namespace namespace_b331012d;

/*
	Name: starting
	Namespace: namespace_b331012d
	Checksum: 0x9F2FC942
	Offset: 0x9A8
	Size: 0x51C
	Parameters: 1
	Flags: Linked
*/
function starting(str_skipto)
{
	player = getplayers()[0];
	var_8a3bb97c = getspawnerarray("raid_adler", "targetname");
	var_8a3bb97c[0] spawner::add_spawn_function(&namespace_b100dd86::function_9109a1fe);
	var_6534f716 = getspawnerarray("raid_woods", "targetname");
	var_6534f716[0] spawner::add_spawn_function(&namespace_b100dd86::function_87d56d50);
	var_d7e0979c = getspawnerarray("kitchen_guys", "script_aigroup");
	foreach(spawner in var_d7e0979c)
	{
		spawner spawner::add_spawn_function(&function_306807e5);
	}
	level.adler = var_8a3bb97c[0] spawner::spawn(1);
	level.woods = var_6534f716[0] spawner::spawn(1);
	var_fcbd93e0 = struct::get("raid_roof_adler", "targetname");
	var_1100faeb = struct::get("raid_roof_woods", "targetname");
	level.adler forceteleport(var_fcbd93e0.origin, var_fcbd93e0.angles);
	level.woods forceteleport(var_1100faeb.origin, var_1100faeb.angles);
	level.var_efac709f = getent("player_breach_clip", "targetname");
	level.var_efac709f disconnectpaths();
	var_d582d701 = getent("alley_clip", "targetname");
	var_d582d701 delete();
	self util::blend_movespeedscale(0.5, 0.25);
	level util::function_3e65fe0b(1);
	level.var_2f3bf638 = getent("raid_car", "targetname");
	level thread scene::play("scene_tkd_hit2_bar_alley", "Trunk_close", [0:level.var_2f3bf638]);
	level thread scene::play("scene_tkd_hit2_alley_civilians", "window_civilian");
	level thread scene::play("scene_tkd_hit2_alley_civilians", "drug_deal");
	level thread scene::init("scene_tkd_hit2_bar_alley");
	level thread scene::init("scene_tkd_hit2_adler_alley");
	level thread scene::play_from_time("scene_tkd_hit2_bar_alley", "alley", undefined, 25.5, 0, 1);
	level thread scene::play("scene_tkd_hit2_adler_alley", "Yard");
	level thread scene::play("scene_tkd_hit2_bar_alley", "Enemy_Waiting");
	level thread function_a6a40606();
	level thread objectives::scripted("obj_takedown_capture", undefined, #"hash_49c1d860c97e3792");
	level thread objectives::follow("follow_adler", level.adler, undefined, 0, 0);
}

/*
	Name: main
	Namespace: namespace_b331012d
	Checksum: 0x586B1003
	Offset: 0xED0
	Size: 0x424
	Parameters: 2
	Flags: Linked
*/
function main(str_skipto, b_starting)
{
	player = getplayers()[0];
	if(b_starting)
	{
		player util::set_low_ready(1);
	}
	level.player = getplayers()[0];
	level battlechatter::function_2ab9360b(0);
	var_d1a2cc43 = getspawnerarray("qasim_runner", "script_noteworthy");
	foreach(spawner in var_d1a2cc43)
	{
		spawner spawner::add_spawn_function(&namespace_b100dd86::function_6578b894);
	}
	var_a68fc54f = getspawnerarray("runner_guys", "script_noteworthy");
	foreach(spawner in var_a68fc54f)
	{
		spawner spawner::add_spawn_function(&function_719a1d22);
	}
	var_d7e0979c = getspawnerarray("kitchen_guys", "script_aigroup");
	foreach(spawner in var_d7e0979c)
	{
		spawner spawner::add_spawn_function(&function_306807e5);
	}
	var_f10203a3 = getspawnerarray("set_no_context_melee", "script_noteworthy");
	foreach(spawner in var_f10203a3)
	{
		spawner spawner::add_spawn_function(&function_6ac3fee4);
	}
	level thread function_a6a40606();
	level.player thread function_a8e1bcc4();
	wait(1);
	level thread function_7eba1826();
	videostart("cp_shared_1981_dutch_soccer_game", 1);
	level flag::wait_till("raid_apt_complete");
	videostop("cp_shared_1981_dutch_soccer_game");
	if(isdefined(str_skipto))
	{
		skipto::objective_completed(str_skipto);
	}
}

/*
	Name: function_6ac3fee4
	Namespace: namespace_b331012d
	Checksum: 0x82F32832
	Offset: 0x1300
	Size: 0x12
	Parameters: 0
	Flags: Linked
*/
function function_6ac3fee4()
{
	self.var_c681e4c1 = 1;
}

/*
	Name: function_7eba1826
	Namespace: namespace_b331012d
	Checksum: 0x8E8639F4
	Offset: 0x1320
	Size: 0x114
	Parameters: 0
	Flags: Linked
*/
function function_7eba1826()
{
	destructibles = getentarray("destructible", "targetname");
	for(i = 0; i < destructibles.size; i++)
	{
		if(destructibles[i].destructibledef == "p9_ams_light_hanging_billiard_01_ddef")
		{
			var_bee3fe47 = destructibles[i];
			var_bee3fe47 namespace_db2381c4::function_d1dc8e50();
			var_bee3fe47 namespace_db2381c4::function_7eba1826();
		}
	}
	var_4560a8a1 = getentarray("tkd_ams_pool_bake_light", "targetname");
	for(i = 0; i < var_4560a8a1.size; i++)
	{
		var_4d574e31 = var_4560a8a1[i];
		var_4d574e31 setlightintensity(0);
	}
}

/*
	Name: function_a8e1bcc4
	Namespace: namespace_b331012d
	Checksum: 0x80AE1395
	Offset: 0x1440
	Size: 0x4CC
	Parameters: 0
	Flags: Linked
*/
function function_a8e1bcc4()
{
	level flag::wait_till("flag_setup_apartment_combat");
	level thread function_486a4628();
	self thread function_c71b0701();
	scene::add_scene_func("scene_tkd_hit2_apt_door_kick", &function_f7ceb1f2, "start");
	level scene::init("scene_tkd_hit2_apt_door_kick");
	level thread function_ced2a7df();
	level thread function_20215540();
	self thread function_c3919cdc();
	level thread function_8c4bd0ee();
	self thread function_85249ea7();
	level waittill(#"hash_218ae3aa673068a9");
	level notify(#"hash_2d7f82360e399f87");
	level.var_efac709f connectpaths();
	level.var_efac709f delete();
	if(level flag::get("flag_player_told_shoot"))
	{
		level notify(#"hash_3117f5e88beab534");
		level thread scene::play("scene_tkd_hit2_bar_alley", "enemy_react");
		level scene::stop("scene_tkd_hit2_adler_alley");
		level thread scene::play("scene_tkd_hit2_bar_alley", "Apt_Breach");
		level.adler thread util::delay(2, undefined, &util::break_glass, 80);
		wait(0.1);
		namespace_b100dd86::function_53531f27("trig_adler_advance_inside_apt");
		namespace_b100dd86::function_53531f27("trig_woods_advance_inside_apt");
	}
	else
	{
		level notify(#"hash_413da1fbc645aa20");
		level thread scene::play("scene_tkd_hit2_bar_alley", "enemy_react_failsafe");
		level scene::stop("scene_tkd_hit2_adler_alley");
		namespace_b100dd86::function_53531f27("trig_adler_advance_inside_apt");
		namespace_b100dd86::function_53531f27("trig_woods_advance_inside_apt");
		level.woods thread function_9800206d(2, 2);
	}
	self util::blend_movespeedscale(0.7, 0.25);
	exploder::exploder("hit2_kitchen_papers");
	thread function_aeaba0c9("pool_table_mb_pos", "pool_table_mb_dest", 1);
	namespace_a052577e::function_1dc92e4f();
	level.woods.script_accuracy = 0.1;
	level.adler.script_accuracy = 0.1;
	wait(1);
	var_a79e4694 = snd::play("vox_cp_tdwn_03750_adlr_gogogo_c5", [1:"j_head", 0:level.adler]);
	level thread scene::play("scene_tkd_hit2_apt_door_kick", "start");
	level battlechatter::function_2ab9360b(1);
	wait(1);
	util::delay(3.5, undefined, &exploder::exploder, "hit2_pool_table_papers");
	level thread function_596afdef();
	thread namespace_a052577e::function_f8f5f970();
}

/*
	Name: function_da18e538
	Namespace: namespace_b331012d
	Checksum: 0xE0B1D7D0
	Offset: 0x1918
	Size: 0x74
	Parameters: 0
	Flags: None
*/
function function_da18e538()
{
	function_aeaba0c9("glass_door_start_left", "glass_door_dest_left", 0);
	wait(0.2);
	function_aeaba0c9("glass_door_start_left", "glass_door_dest_left", 0);
	wait(0.2);
	function_aeaba0c9("glass_door_start_left", "glass_door_dest_left", 0);
}

/*
	Name: function_f7ceb1f2
	Namespace: namespace_b331012d
	Checksum: 0x1F5528DF
	Offset: 0x1998
	Size: 0x136
	Parameters: 1
	Flags: Linked
*/
function function_f7ceb1f2(a_ents)
{
	foreach(guy in a_ents)
	{
		self.var_c681e4c1 = 1;
		guy.ignoreme = 1;
	}
	level waittill(#"hash_4db5b5cd4b779f7e");
	foreach(guy in a_ents)
	{
		if(isalive(guy))
		{
			guy.ignoreme = 0;
		}
	}
}

/*
	Name: function_c71b0701
	Namespace: namespace_b331012d
	Checksum: 0x647016CD
	Offset: 0x1AD8
	Size: 0xAC
	Parameters: 0
	Flags: Linked
*/
function function_c71b0701()
{
	player = getplayers()[0];
	level flag::wait_till("flag_player_lowready_apt");
	player util::set_low_ready(0);
	level util::function_3e65fe0b(0);
	self enableoffhandweapons();
	self clientfield::set_to_player("lerp_fov", 0);
}

/*
	Name: function_20215540
	Namespace: namespace_b331012d
	Checksum: 0xFAB60377
	Offset: 0x1B90
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function function_20215540()
{
	level thread function_430ab215();
	level waittill(#"hash_1e6ac021d18be979");
	level flag::set("flag_adler_through_gate");
}

/*
	Name: function_486a4628
	Namespace: namespace_b331012d
	Checksum: 0x9560D3EC
	Offset: 0x1BF0
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function function_486a4628()
{
	level flag::wait_till_all(array("flag_player_lowready_apt", "flag_woods_through_gate"));
	level scene::play("scene_tkd_hit2_adler_alley", "gate_closed");
}

/*
	Name: function_430ab215
	Namespace: namespace_b331012d
	Checksum: 0xBD5F810E
	Offset: 0x1C58
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function function_430ab215()
{
	level waittill(#"hash_7aabb84ad343d843");
	level flag::set("flag_woods_through_gate");
}

/*
	Name: function_c3919cdc
	Namespace: namespace_b331012d
	Checksum: 0x32697DC9
	Offset: 0x1CA0
	Size: 0x30
	Parameters: 0
	Flags: Linked
*/
function function_c3919cdc()
{
	self waittill(#"weapon_fired");
	level notify(#"hash_218ae3aa673068a9");
}

/*
	Name: function_8c4bd0ee
	Namespace: namespace_b331012d
	Checksum: 0xCA33B957
	Offset: 0x1CD8
	Size: 0x30
	Parameters: 0
	Flags: Linked
*/
function function_8c4bd0ee()
{
	level waittill(#"glass_smash");
	level notify(#"hash_218ae3aa673068a9");
}

/*
	Name: function_85249ea7
	Namespace: namespace_b331012d
	Checksum: 0xD61A8116
	Offset: 0x1D10
	Size: 0x70
	Parameters: 0
	Flags: Linked
*/
function function_85249ea7()
{
	waitresult = undefined;
	waitresult = self waittill(#"grenade_fire");
	grenade = waitresult.projectile;
	grenade waittill(#"explode");
	level notify(#"hash_218ae3aa673068a9");
}

/*
	Name: function_aeaba0c9
	Namespace: namespace_b331012d
	Checksum: 0xC268B9BB
	Offset: 0x1D88
	Size: 0xBC
	Parameters: 3
	Flags: Linked
*/
function function_aeaba0c9(pos, dest, delay)
{
	if(isdefined(delay))
	{
		wait(delay);
	}
	dmg_pos = struct::get(pos, "targetname");
	var_c19f5c0 = struct::get(dest, "targetname");
	magicbullet(getweapon(#"ar_standard_t9"), dmg_pos.origin, var_c19f5c0.origin);
}

/*
	Name: function_9800206d
	Namespace: namespace_b331012d
	Checksum: 0xE84D83B2
	Offset: 0x1E50
	Size: 0xF8
	Parameters: 2
	Flags: Linked
*/
function function_9800206d(timer, delay)
{
	if(isdefined(delay))
	{
		wait(delay);
	}
	timer = gettime() + (timer * 1000);
	while(gettime() < timer)
	{
		startpos = self gettagorigin("tag_flash");
		angles = self gettagangles("tag_flash");
		forward = anglestoforward(angles);
		endpos = startpos + vectorscale(forward, 1000);
		magicbullet(self.weapon, startpos, endpos, self);
		wait(0.09);
	}
}

/*
	Name: function_1a76e609
	Namespace: namespace_b331012d
	Checksum: 0x18509D53
	Offset: 0x1F50
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_1a76e609()
{
	self waittill(#"hash_28b7423e81461973");
	namespace_b100dd86::function_53531f27("trig_adler_advance_inside_apt");
}

/*
	Name: function_25e67322
	Namespace: namespace_b331012d
	Checksum: 0x243672D
	Offset: 0x1F90
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_25e67322()
{
	self waittill(#"hash_65b683531e7136d1");
	namespace_b100dd86::function_53531f27("trig_woods_advance_inside_apt");
}

/*
	Name: function_306807e5
	Namespace: namespace_b331012d
	Checksum: 0x7A4976B
	Offset: 0x1FD0
	Size: 0x1AC
	Parameters: 0
	Flags: Linked
*/
function function_306807e5()
{
	self endon(#"death");
	self endon(#"hash_10622d7e7f80ce71");
	self.var_c681e4c1 = 1;
	if(self.script_noteworthy == "kitchen_enemy4")
	{
		level.var_e985d6b4 = self;
	}
	self thread function_5ba83448();
	level waittill(#"hash_2d7f82360e399f87");
	wait(2);
	self notify(#"hash_72d5a2c9e1d7ed8a");
	self val::set(#"kitchen_guy", "takedamage", 1);
	self val::set(#"kitchen_guy", "allowdeath", 1);
	self.health = 1;
	if(level flag::get("flag_player_told_shoot"))
	{
		self util::delay(randomfloatrange(1.3, 2), undefined, &function_629b5919);
	}
	else
	{
		self util::delay(randomfloatrange(5, 6.5), undefined, &function_629b5919);
	}
}

/*
	Name: function_629b5919
	Namespace: namespace_b331012d
	Checksum: 0xB53F47B3
	Offset: 0x2188
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_629b5919()
{
	if(!is_true(self.in_melee_death))
	{
		self ai::bloody_death();
	}
}

/*
	Name: function_5ba83448
	Namespace: namespace_b331012d
	Checksum: 0xA44FF801
	Offset: 0x21C8
	Size: 0x1B4
	Parameters: 0
	Flags: Linked
*/
function function_5ba83448()
{
	self endon(#"hash_72d5a2c9e1d7ed8a");
	self.health = 999;
	result = undefined;
	result = self waittill(#"damage", #"takedown_begin");
	if(result._notify === "damage")
	{
		self val::set(#"kitchen_guy", "takedamage", 0);
		self val::set(#"kitchen_guy", "allowdeath", 0);
		scene = "scene_tkd_hit2_bar_alley";
		if(self.script_noteworthy == "kitchen_enemy1")
		{
			self thread function_8dac85e(scene, "Enemy_Death_1");
		}
		if(self.script_noteworthy == "kitchen_enemy2")
		{
			self thread function_8dac85e(scene, "Enemy_Death_2");
		}
		if(self.script_noteworthy == "kitchen_enemy3")
		{
			self thread function_8dac85e(scene, "Enemy_Death_3");
		}
		if(self.script_noteworthy == "kitchen_enemy4")
		{
			self thread function_8dac85e(scene, "Enemy_Death_4");
		}
	}
}

/*
	Name: function_69b8767f
	Namespace: namespace_b331012d
	Checksum: 0xB7EE1CB2
	Offset: 0x2388
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function function_69b8767f()
{
	self scene::play("scene_ai_sdr_com_intro_run_slide01_to_cover_right_crouch_short_4", "Shot 1");
}

/*
	Name: function_8dac85e
	Namespace: namespace_b331012d
	Checksum: 0x124A05A6
	Offset: 0x23C0
	Size: 0xDC
	Parameters: 4
	Flags: Linked
*/
function function_8dac85e(scene, death_shot, var_5505b07f, loop)
{
	self notify(#"hash_10622d7e7f80ce71");
	level.player playhitmarker(undefined, 5, undefined, 1);
	level thread scene::play(var_5505b07f, loop, self);
	self val::set(#"kitchen_guy", "ignoreme", 1);
	self disableaimassist();
	self notsolid();
}

/*
	Name: function_719a1d22
	Namespace: namespace_b331012d
	Checksum: 0x417858F0
	Offset: 0x24A8
	Size: 0x76
	Parameters: 0
	Flags: Linked
*/
function function_719a1d22()
{
	self endon(#"death");
	self.pacifist = 1;
	self.health = 1;
	self ai::set_behavior_attribute("sprint", 1);
	self waittill(#"reached_path_end");
	self.pacifist = 0;
}

/*
	Name: function_ced2a7df
	Namespace: namespace_b331012d
	Checksum: 0x33F571BA
	Offset: 0x2528
	Size: 0xFE
	Parameters: 0
	Flags: Linked
*/
function function_ced2a7df()
{
	player = getplayers()[0];
	level endon(#"hash_413da1fbc645aa20");
	level endon(#"hash_2d7f82360e399f87");
	level flag::wait_till("flag_player_told_shoot");
	level waittill(#"hash_67f0f350991bdaf4");
	while(true)
	{
		wait(8);
		var_23811abd = snd::play("vox_cp_tdwn_03750_adlr_onyoumason_b2", [1:"j_head", 0:level.adler]);
		snd::function_2fdc4fb(var_23811abd);
		wait(4);
	}
}

/*
	Name: function_a6a40606
	Namespace: namespace_b331012d
	Checksum: 0xFDFEE06C
	Offset: 0x2630
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function function_a6a40606()
{
	level waittill(#"hash_4788d2e1009b4514");
	level flag::set("flag_player_told_shoot");
}

/*
	Name: function_596afdef
	Namespace: namespace_b331012d
	Checksum: 0xB2F5788F
	Offset: 0x2678
	Size: 0x164
	Parameters: 0
	Flags: Linked
*/
function function_596afdef()
{
	savegame::checkpoint_save(1);
	level.adler ai::set_behavior_attribute("demeanor", "combat");
	level.woods ai::set_behavior_attribute("demeanor", "combat");
	var_f3ebe39 = ai::array_spawn("floor1_guys");
	foreach(guy in var_f3ebe39)
	{
		guy.var_c681e4c1 = 1;
	}
	level thread function_801d630c();
	level thread function_5547ef8b();
	level thread left_flank();
	level thread function_917872db();
}

/*
	Name: left_flank
	Namespace: namespace_b331012d
	Checksum: 0xA6747BB1
	Offset: 0x27E8
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function left_flank()
{
	level flag::wait_till("flag_left_flank");
	level thread namespace_e133827d::function_29f2624a("floor1_enemies_flank", "trig_apt_wave2", undefined, undefined, 0.1);
}

/*
	Name: function_917872db
	Namespace: namespace_b331012d
	Checksum: 0xE7F71EDC
	Offset: 0x2848
	Size: 0x144
	Parameters: 0
	Flags: Linked
*/
function function_917872db()
{
	level flag::wait_till_timeout(1.5, "flag_spawn_qasim_failsafe");
	var_a2ec2530 = getspawnerarray("qasim_stairs", "targetname");
	qasim = var_a2ec2530[0] spawner::spawn(1);
	level notify(#"hash_750f5969110dee88");
	qasim namespace_b100dd86::function_6578b894();
	var_c5225a2a = struct::get("rooftop_goto", "targetname");
	objectives::remove("obj_takedown_qasim");
	level objectives::complete("follow_adler", level.adler);
	objectives::goto("obj_rooftops", var_c5225a2a.origin);
	level thread function_effaa7aa();
}

/*
	Name: function_effaa7aa
	Namespace: namespace_b331012d
	Checksum: 0x42548ADD
	Offset: 0x2998
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function function_effaa7aa()
{
	level flag::wait_till("flag_qasim_on_roof");
	objectives::hide("obj_rooftops");
}

/*
	Name: function_801d630c
	Namespace: namespace_b331012d
	Checksum: 0x2075A7FD
	Offset: 0x29E0
	Size: 0x1D4
	Parameters: 0
	Flags: Linked
*/
function function_801d630c()
{
	level scene::init("scene_tkd_hit2_apt_blindfire_bathroom");
	guy = getactorarray("apt_blindfire_bathroom", "targetname")[0];
	guy.health = 999;
	guy.var_c681e4c1 = 1;
	guy.a.nodeath = 1;
	guy.skipdeath = 1;
	guy.skipdeathanim = 1;
	guy.noragdoll = 1;
	guy endon(#"death");
	level flag::wait_till("flag_blindfire_bathroom");
	level thread function_5001b9be();
	guy thread function_d068d0f8();
	level thread scene::play("scene_tkd_hit2_apt_blindfire_bathroom", "start");
	guy waittill(#"damage");
	level.player playhitmarker(undefined, 5, undefined, 1);
	guy notsolid();
	level scene::play("scene_tkd_hit2_apt_blindfire_bathroom", "death");
	guy notify(#"hash_f95672ab54c7df6");
	guy kill();
}

/*
	Name: function_d068d0f8
	Namespace: namespace_b331012d
	Checksum: 0xB10D9BE8
	Offset: 0x2BC0
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function function_d068d0f8()
{
	self endon(#"hash_f95672ab54c7df6");
	level flag::wait_till("raid_apt_complete");
	level scene::play("scene_tkd_hit2_apt_blindfire_bathroom", "death");
	self kill();
}

/*
	Name: function_5001b9be
	Namespace: namespace_b331012d
	Checksum: 0x2E63AD15
	Offset: 0x2C40
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_5001b9be()
{
	level flag::wait_till("flag_close_to_blindfire_guy");
	thread function_aeaba0c9("blindfire_mb_pos", "blindfire_mb_dest");
}

/*
	Name: function_5547ef8b
	Namespace: namespace_b331012d
	Checksum: 0x3C26B612
	Offset: 0x2C90
	Size: 0x124
	Parameters: 0
	Flags: Linked
*/
function function_5547ef8b()
{
	level waittill(#"hash_750f5969110dee88");
	wait(1);
	level.adler dialogue::queue("vox_cp_tdwn_03800_adlr_theresqasim_a2");
	wait(1);
	level.adler dialogue::queue("vox_cp_tdwn_03750_wood_comeonmason_ec");
	wait(2);
	level.adler dialogue::queue("vox_cp_tdwn_03800_adlr_qasimsheadedupt_21");
	wait(2.5);
	level.adler dialogue::queue("vox_cp_tdwn_03800_adlr_weneedqasimaliv_e5");
	level flag::wait_till("flag_near_apt_stairs");
	level.adler dialogue::queue("vox_cp_tdwn_04100_adlr_qasimcantescape_7b");
	wait(0.75);
	level.adler dialogue::queue("vox_cp_tdwn_03800_adlr_findhim_00");
}

/*
	Name: cleanup
	Namespace: namespace_b331012d
	Checksum: 0xFD16B478
	Offset: 0x2DC0
	Size: 0x24
	Parameters: 4
	Flags: Linked
*/
function cleanup(name, starting, direct, player)
{
}

/*
	Name: init_flags
	Namespace: namespace_b331012d
	Checksum: 0x2F28559D
	Offset: 0x2DF0
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function init_flags()
{
	level flag::init("raid_apt_complete");
}

/*
	Name: init_clientfields
	Namespace: namespace_b331012d
	Checksum: 0x80F724D1
	Offset: 0x2E20
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function init_clientfields()
{
}

/*
	Name: init_scenes
	Namespace: namespace_b331012d
	Checksum: 0x80F724D1
	Offset: 0x2E30
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function init_scenes()
{
}

