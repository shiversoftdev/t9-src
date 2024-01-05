#using scripts\core_common\fx_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using script_6a27f4a76e9218f0;
#using script_31e9b35aaacbbd93;
#using script_7cf3e180e994d17f;
#using script_3dc93ca9902a9cda;
#using scripts\cp_common\gametypes\globallogic_ui.gsc;
#using scripts\cp_common\skipto.gsc;
#using script_3626f1b2cf51a99c;
#using script_4ab78e327b76395f;
#using script_474bf596f5ecdb01;
#using scripts\core_common\ai\archetype_utility.gsc;
#using scripts\cp_common\gametypes\battlechatter.gsc;
#using scripts\cp_common\objectives.gsc;
#using script_4ccd0c3512b52a10;
#using scripts\cp_common\util.gsc;
#using script_31786c2dc684e9b;
#using script_263b7f2982258785;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using script_61cfc2ab8e60625;
#using script_2d443451ce681a;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\perks.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace namespace_7747d072;

/*
	Name: function_228213c8
	Namespace: namespace_7747d072
	Checksum: 0x4BCE7E45
	Offset: 0x828
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_228213c8()
{
	level notify(1095615449);
}

#namespace tkdn_raid_slide;

/*
	Name: starting
	Namespace: tkdn_raid_slide
	Checksum: 0x4674856E
	Offset: 0x848
	Size: 0x344
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
	var_3eba13ec = getspawnerarray("qasim_final_rooftop", "targetname");
	var_3eba13ec[0] spawner::add_spawn_function(&namespace_b100dd86::function_a66feb27);
	level.adler = var_8a3bb97c[0] spawner::spawn(1);
	level.woods = var_6534f716[0] spawner::spawn(1);
	level.qasim = var_3eba13ec[0] spawner::spawn(1);
	level.qasim val::set(#"magic_bullet_shield", "allowdeath", 0);
	level.qasim.magic_bullet_shield = 1;
	var_fcbd93e0 = struct::get("raid_slide_adler", "targetname");
	var_1100faeb = struct::get("raid_slide_woods", "targetname");
	level.adler forceteleport(var_fcbd93e0.origin, var_fcbd93e0.angles);
	level.woods forceteleport(var_1100faeb.origin, var_1100faeb.angles);
	exploder::exploder("lgt_vista_lights");
	level thread objectives::scripted("obj_takedown_capture", undefined, #"hash_49c1d860c97e3792");
	level thread objectives::follow("follow_adler", level.adler, undefined, 0, 0);
	level thread namespace_b100dd86::function_53531f27("trig_qasim_roof_run3");
	level thread scene::play("scene_tkd_hit2_apt_blindfire_bathroom", "death");
}

/*
	Name: main
	Namespace: tkdn_raid_slide
	Checksum: 0x8C978B93
	Offset: 0xB98
	Size: 0xD94
	Parameters: 2
	Flags: Linked
*/
function main(str_skipto, b_starting)
{
	if(b_starting)
	{
		tkdn_raid_apt::function_aeaba0c9("glass_door_start_left", "glass_door_dest_left", 0);
		tkdn_raid_apt::function_aeaba0c9("glass_door_start_right", "glass_door_dest_right", 0);
		tkdn_raid_apt::function_aeaba0c9("glass_door_start_left", "glass_door_dest_left", 0);
		tkdn_raid_apt::function_aeaba0c9("glass_door_start_right", "glass_door_dest_right", 0);
		tkdn_raid_apt::function_aeaba0c9("glass_door_start_left", "glass_door_dest_left", 0);
		tkdn_raid_apt::function_aeaba0c9("glass_door_start_right", "glass_door_dest_right", 0);
		level thread namespace_a052577e::function_1dc92e4f();
		level thread scene::init("scene_tkd_hit2_adler_alley");
		level thread scene::play("scene_tkd_hit2_adler_alley", "gate_closed");
		var_efac709f = getent("player_breach_clip", "targetname");
		var_efac709f connectpaths();
		var_efac709f delete();
		getactorarray("apt_blindfire_bathroom", "targetname")[0] delete();
	}
	level thread tkdn_raid_capture::function_daaa52d5();
	level thread tkdn_raid_capture::function_b47183fb();
	player = getplayers()[0];
	var_1fbc6848 = getspawnerarray("ledge_lmg_guy", "script_noteworthy");
	var_1fbc6848[0] spawner::add_spawn_function(&function_b8018dce);
	level endon(#"hash_7d9928c92b67b6b2");
	level battlechatter::function_2ab9360b(0);
	player util::blend_movespeedscale(0.87, 1);
	level.adler ai::set_behavior_attribute("demeanor", "combat");
	level.woods ai::set_behavior_attribute("demeanor", "combat");
	w_smg = getweapon(#"ar_accurate_t9");
	w_pistol = getweapon(#"pistol_semiauto_t9", "steadyaim", "fastreload", "reflex_pistol");
	thread function_1f6d0353();
	level flag::wait_till("flag_qasim_roof_run3");
	player thread function_e99afe47();
	level flag::wait_till("flag_start_roof_slide");
	var_2b876e6f = getspawnerarray("slide_enemy1", "targetname");
	level.slide_enemy1 = var_2b876e6f[0] spawner::spawn(1);
	level.slide_enemy1.targetname = "slide_enemy1";
	level.slide_enemy1.health = 999;
	level.slide_enemy1 disableaimassist();
	var_b5c582ed = getspawnerarray("slide_enemy2", "targetname");
	level.var_2db471ed = var_b5c582ed[0] spawner::spawn(1);
	level.var_2db471ed.targetname = "slide_enemy2";
	level.var_2db471ed.health = 999;
	level.var_2db471ed.var_c681e4c1 = 1;
	level.var_2db471ed disableaimassist();
	var_ecae70ca = getspawnerarray("slide_enemy3", "targetname");
	level.var_2006d692 = var_ecae70ca[0] spawner::spawn(1);
	level.var_2006d692.targetname = "slide_enemy3";
	level.var_2006d692.health = 999;
	level.var_2006d692.var_c681e4c1 = 1;
	level.var_2006d692 disableaimassist();
	setsaveddvar(#"hash_54e4287f98a644f4", 1);
	level notify(#"hash_530a04ce72c2c9");
	objectives::show("obj_takedown_qasim");
	player val::set("slide", "allow_crouch", 0);
	player val::set("slide", "allow_prone", 0);
	level function_bc2abab3();
	player thread function_624525f();
	thread namespace_a052577e::function_fd7139f4();
	weapon = getweapon(#"pistol_semiauto_t9");
	level.adler aiutility::setprimaryweapon(weapon);
	level.adler ai::gun_switchto(weapon, "right");
	fake_player = util::spawn_player_clone(player);
	fake_player.targetname = "FakePlayer";
	fake_player hide();
	fake_player setinvisibletoall();
	player thread function_79b1e578();
	level thread function_4b1afed9();
	level scene::add_scene_func("scene_tkd_hit2_rooftop_slide", &function_c5d4fec8);
	level thread scene::play("scene_tkd_hit2_rooftop_slide", "Shot 1", [0:fake_player]);
	level.slide_enemy1 thread scene::play("scene_tkd_hit2_rooftop_slide_enemy1", "Shot 1", [0:level.slide_enemy1]);
	level.var_2db471ed thread scene::play("scene_tkd_hit2_rooftop_slide_enemy2", "Shot 1", [0:level.var_2db471ed]);
	level.var_2006d692 thread scene::play("scene_tkd_hit2_rooftop_slide_enemy3", "Shot 1", [0:level.var_2006d692]);
	level.slide_enemy1 thread function_83cb8fb7();
	level.var_2006d692 thread function_83cb8fb7();
	level.var_2006d692 thread function_d6825a2e();
	level thread function_41a8d47e();
	level.qasim thread namespace_b100dd86::function_76bbdeec(undefined, "c_t9_cp_ira_militant_vip_qasim_head_nohat");
	level.qasim thread namespace_b100dd86::function_76bbdeec("qasim_punched", "c_t9_cp_ira_militant_vip_qasim_head_nohat_injured");
	level.qasim thread namespace_b100dd86::function_f82142f8(undefined, "c_t9_cp_ira_militant_vip_qasim_tkd_body");
	level.adler thread util::delay(1, undefined, &namespace_b100dd86::function_f82142f8, undefined, "c_t9_usa_hero_adler_civ_amsterdam_body_no_coat");
	player playerlinktoblend(fake_player, "tag_player", 0.3);
	player playgestureviewmodel(#"hash_629a852e56700e02", undefined, 1, 0.2, 0, 1, 1);
	wait(0.3);
	fake_player show();
	util::nvidiaansel_scriptdisable(1);
	player playerlinktoabsolute(fake_player, "tag_player");
	level waittill(#"slowmo_start");
	level notify(#"hash_707e3fbcbfc9b954");
	player thread give_player_max_ammo();
	player thread function_85757fc8();
	player playerlinktodelta(fake_player, "tag_player", 0.2, 35, 30, 45, 6, 1, 0, 1);
	setslowmotion(1, 0.2, 0.25, 1, 1);
	player perks::perk_setperk("specialty_fastads");
	wait(0.1);
	player enableweapons();
	level waittill(#"hash_78624492cc89d4dd");
	player disableweapons();
	player playerlinktoblend(fake_player, "tag_player", 0.2, 0, 0, 0.2, 0, 0, 1);
	setslowmotion(0.1, 1, 0.5, 1, 1);
	level waittill(#"hash_35a786f9d88a2e60");
	level thread function_58b2cc80();
	player perks::perk_unsetperk("specialty_fastads");
	player val::reset("slide", "allow_crouch");
	player val::reset("slide", "allow_prone");
	player unlink();
	fake_player delete();
	util::nvidiaansel_scriptdisable(0);
	player util::set_low_ready(1);
	player enableweapons();
	player util::blend_movespeedscale(0.5, 1);
	if(isdefined(str_skipto))
	{
		skipto::objective_completed(str_skipto);
	}
}

/*
	Name: function_b8018dce
	Namespace: tkdn_raid_slide
	Checksum: 0x332A111A
	Offset: 0x1938
	Size: 0x12
	Parameters: 0
	Flags: Linked
*/
function function_b8018dce()
{
	self.var_c681e4c1 = 1;
}

/*
	Name: function_c5d4fec8
	Namespace: tkdn_raid_slide
	Checksum: 0xACCC123A
	Offset: 0x1958
	Size: 0x28
	Parameters: 1
	Flags: Linked
*/
function function_c5d4fec8(a_ents)
{
	level.var_30fc6630 = a_ents[#"hash_5cf99ae98f8146be"];
}

/*
	Name: function_58b2cc80
	Namespace: tkdn_raid_slide
	Checksum: 0x570BC812
	Offset: 0x1988
	Size: 0x90
	Parameters: 0
	Flags: Linked
*/
function function_58b2cc80()
{
	level endon(#"hash_5737131f700cbdb");
	level waittill(#"hash_11a7d299dcf3358");
	while(true)
	{
		wait(5);
		level.adler dialogue::queue("vox_cp_tdwn_05100_adlr_masonqasimwants_ff");
		wait(5);
		level.woods dialogue::queue("vox_cp_tdwn_05100_wood_comeonmasondoit_15");
	}
}

/*
	Name: function_85757fc8
	Namespace: tkdn_raid_slide
	Checksum: 0x78CF7A62
	Offset: 0x1A20
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function function_85757fc8()
{
	level waittill(#"hash_3dd2c779be3b07c8");
	self playrumbleonentity("damage_heavy");
	objectives::complete("obj_takedown_qasim", level.qasim, 0);
}

/*
	Name: give_player_max_ammo
	Namespace: tkdn_raid_slide
	Checksum: 0xDD9BC427
	Offset: 0x1A90
	Size: 0xE8
	Parameters: 0
	Flags: Linked
*/
function give_player_max_ammo()
{
	var_fd5bc72c = self getweaponslistprimaries();
	foreach(weap in var_fd5bc72c)
	{
		self givemaxammo(weap);
		self setweaponammoclip(weap, weap.maxammo);
		self setweaponammostock(weap, weap.maxammo);
	}
}

/*
	Name: function_624525f
	Namespace: tkdn_raid_slide
	Checksum: 0xBD3D76FF
	Offset: 0x1B80
	Size: 0xEC
	Parameters: 0
	Flags: Linked
*/
function function_624525f()
{
	level endon(#"shot_slide_enemy1");
	dmg_pos = getent("mb_slide_enemy1", "targetname");
	level waittill(#"hash_3dd2c779be3b07c8");
	if(isalive(level.slide_enemy1) && !isdefined(level.slide_enemy1.var_b481f04a))
	{
		magicbullet(getweapon(#"ar_standard_t9"), dmg_pos.origin, level.slide_enemy1.origin + vectorscale((0, 0, 1), 50));
	}
}

/*
	Name: function_41a8d47e
	Namespace: tkdn_raid_slide
	Checksum: 0x51D3F4FA
	Offset: 0x1C78
	Size: 0x40
	Parameters: 0
	Flags: Linked
*/
function function_41a8d47e()
{
	level util::waittill_multiple("shot_slide_enemy1", "shot_slide_enemy3");
	level notify(#"hash_78624492cc89d4dd");
}

/*
	Name: function_e99afe47
	Namespace: tkdn_raid_slide
	Checksum: 0x26B83C0
	Offset: 0x1CC0
	Size: 0x1A2
	Parameters: 0
	Flags: Linked
*/
function function_e99afe47()
{
	level endon(#"hash_707e3fbcbfc9b954");
	while(true)
	{
		if(level flag::get("flag_listen_for_slide") && level.var_962e7d10 == 0)
		{
			setsaveddvar(#"hash_54e4287f98a644f4", 0);
			self val::set(#"hash_521245c0cfb3048", "allow_jump", 0);
			self val::set(#"hash_304cd84bed4b8707", "allow_mantle", 0);
			level thread function_f9dfbac1();
		}
		else if(level flag::get("flag_clear_listen_for_slide"))
		{
			setsaveddvar(#"hash_54e4287f98a644f4", 1);
			self val::reset(#"hash_521245c0cfb3048", "allow_jump");
			self val::reset(#"hash_304cd84bed4b8707", "allow_mantle");
			level.var_962e7d10 = 0;
			level notify(#"hash_1480b995232f9d53");
		}
		waitframe(1);
	}
}

/*
	Name: function_f9dfbac1
	Namespace: tkdn_raid_slide
	Checksum: 0x4AF0FD1A
	Offset: 0x1E70
	Size: 0xEE
	Parameters: 0
	Flags: Linked
*/
function function_f9dfbac1()
{
	player = getplayers()[0];
	level.var_962e7d10 = 1;
	level endon(#"hash_1480b995232f9d53");
	namespace_a052577e::function_c2eee241();
	player notifyonplayercommand("pressed_jump", "+gostand");
	while(true)
	{
		player waittill(#"pressed_jump");
		if(!player flag::get("body_shield_active"))
		{
			level flag::set("flag_start_roof_slide");
		}
		waitframe(1);
	}
}

/*
	Name: function_6178ec8f
	Namespace: tkdn_raid_slide
	Checksum: 0x9675C97
	Offset: 0x1F68
	Size: 0xBC
	Parameters: 0
	Flags: None
*/
function function_6178ec8f()
{
	level flag::wait_till("flag_ak74_hack");
	var_2397b823 = getweapon(#"smg_heavy_t9", "steadyaim", "reflex");
	self giveweapon(var_2397b823);
	self switchtoweapon(var_2397b823);
	self val::set(#"trailer", "disable_weapon_cycling", 1);
}

/*
	Name: function_79b1e578
	Namespace: tkdn_raid_slide
	Checksum: 0xF08BD812
	Offset: 0x2030
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_79b1e578()
{
	level waittill(#"hash_90ed1bf15c38e72");
	self namespace_db2381c4::function_febff01e();
}

/*
	Name: function_1f6d0353
	Namespace: tkdn_raid_slide
	Checksum: 0xD8B6C2CB
	Offset: 0x2070
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function function_1f6d0353()
{
	level notify(#"hash_5f84172c70d1eb4c");
	wait(4);
	level.adler dialogue::queue("vox_cp_tdwn_04100_adlr_hesboltingkeepo_86");
	wait(0.5);
	level.woods dialogue::queue("vox_cp_tdwn_04100_wood_jesusthisguyisf_42");
	wait(3.5);
	level.adler dialogue::queue("vox_cp_tdwn_03800_adlr_gogo_f9");
	wait(3);
	level.adler dialogue::queue("vox_cp_tdwn_03800_adlr_hurryup_40");
}

/*
	Name: function_4b1afed9
	Namespace: tkdn_raid_slide
	Checksum: 0x15E3D0B2
	Offset: 0x2130
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function function_4b1afed9()
{
	level waittill(#"hash_65107acbc9314636");
	level flag::set("flag_qasim_ready_for_interrogation");
}

/*
	Name: function_d6825a2e
	Namespace: tkdn_raid_slide
	Checksum: 0x752D6458
	Offset: 0x2178
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function function_d6825a2e()
{
	self endon(#"death");
	self thread function_edf70272();
	level waittill(#"hash_34053632d960caf2");
	self thread scene::play("scene_tkd_hit2_rooftop_slide_enemy3", "interact");
	level waittill(#"hash_6fec65520df29efc");
	self thread scene::stop("scene_tkd_hit2_rooftop_slide_enemy3");
	self.allowdeath = 1;
	self kill();
}

/*
	Name: function_edf70272
	Namespace: tkdn_raid_slide
	Checksum: 0xF9FC1B68
	Offset: 0x2248
	Size: 0x36
	Parameters: 0
	Flags: Linked
*/
function function_edf70272()
{
	level waittill(#"hash_3e5010fedda2bc6c");
	if(isdefined(self))
	{
		self notify(#"fake_damage");
	}
}

/*
	Name: function_83cb8fb7
	Namespace: tkdn_raid_slide
	Checksum: 0xCB2DD608
	Offset: 0x2288
	Size: 0x130
	Parameters: 0
	Flags: Linked
*/
function function_83cb8fb7()
{
	player = getplayers()[0];
	self waittill(#"damage", #"fake_damage");
	if(self == level.slide_enemy1)
	{
		self thread scene::play("scene_tkd_hit2_rooftop_slide_enemy1", "death");
		player playhitmarker(undefined, 5, undefined, 1);
		level notify(#"shot_slide_enemy1");
		self.var_b481f04a = 1;
	}
	if(self == level.var_2006d692)
	{
		self thread scene::play("scene_tkd_hit2_rooftop_slide_enemy3", "death");
		player playhitmarker(undefined, 5, undefined, 1);
		level notify(#"shot_slide_enemy3");
	}
}

/*
	Name: function_bc2abab3
	Namespace: tkdn_raid_slide
	Checksum: 0xCE97C7B4
	Offset: 0x23C0
	Size: 0xFC
	Parameters: 0
	Flags: Linked
*/
function function_bc2abab3()
{
	var_3eba13ec = getspawnerarray("raid_qasim", "targetname");
	level.qasim = var_3eba13ec[0] spawner::spawn(1);
	level.qasim.radius = 32;
	level.qasim.ignoreall = 1;
	level.qasim.ignoreme = 1;
	level.qasim.script_forcegoal = 1;
	level.qasim disableaimassist();
	objectives::follow("obj_takedown_qasim", level.qasim, undefined, undefined, 0, #"hash_29f1e9a2d045faaf");
}

/*
	Name: cleanup
	Namespace: tkdn_raid_slide
	Checksum: 0xD989AAD7
	Offset: 0x24C8
	Size: 0x24
	Parameters: 4
	Flags: Linked
*/
function cleanup(name, starting, direct, player)
{
}

/*
	Name: init_flags
	Namespace: tkdn_raid_slide
	Checksum: 0xA06BE26C
	Offset: 0x24F8
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function init_flags()
{
	level flag::init("raid_approach_complete");
}

/*
	Name: init_clientfields
	Namespace: tkdn_raid_slide
	Checksum: 0x80F724D1
	Offset: 0x2528
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function init_clientfields()
{
}

/*
	Name: init_scenes
	Namespace: tkdn_raid_slide
	Checksum: 0x80F724D1
	Offset: 0x2538
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function init_scenes()
{
}

