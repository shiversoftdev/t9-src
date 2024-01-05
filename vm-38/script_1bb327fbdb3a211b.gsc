#using script_772d4fbcb229f593;
#using script_b9d273dc917ee1f;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using script_77b61a4178efdbc4;
#using scripts\zm\ai\zm_ai_avogadro.gsc;
#using script_ab862743b3070a;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_cleanup_mgr.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using script_3411bb48d41bd3b;
#using scripts\zm_common\zm_sq.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\ai\zm_ai_utility.gsc;
#using scripts\zm_common\aats\zm_aat.gsc;
#using scripts\zm_common\zm_ui_inventory.gsc;
#using script_35598499769dbb3d;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\aat_shared.gsc;
#using script_7bacb32f8222fa3e;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\zombie_death.gsc;
#using scripts\core_common\ai\archetype_avogadro.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace namespace_cc6c4729;

/*
	Name: function_791b5e1a
	Namespace: namespace_cc6c4729
	Checksum: 0x45B1CAC
	Offset: 0x328
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_791b5e1a()
{
	level notify(1564043024);
}

#namespace namespace_8a08914c;

/*
	Name: init
	Namespace: namespace_8a08914c
	Checksum: 0x98E34A7
	Offset: 0x348
	Size: 0x22C
	Parameters: 0
	Flags: None
*/
function init()
{
	clientfield::register("scriptmover", "" + #"hash_76ffee0aa9eae3ce", 28000, 1, "int");
	clientfield::register("world", "" + #"hash_45b04d88564a1cd", 28000, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_4fcb640ca703e121", 28000, 1, "int");
	clientfield::register("world", "" + #"hash_22d24ba0bcf94c3f", 28000, getminbitcountfornum(2), "int");
	clientfield::register("world", "" + #"hash_2d4fdf69e826bcc4", 28000, getminbitcountfornum(2), "int");
	clientfield::register("actor", "" + #"zombie_soul", 28000, 1, "int");
	clientfield::register("world", "" + #"ww_crystalaxe_glow", 28000, 1, "int");
	hidemiscmodels("dn_rf_coverage_dmg");
	level thread function_1b65b01d();
	/#
		level thread function_cd7a3de4();
	#/
}

/*
	Name: function_1b65b01d
	Namespace: namespace_8a08914c
	Checksum: 0x4DF1CC83
	Offset: 0x580
	Size: 0x1CC
	Parameters: 0
	Flags: None
*/
function function_1b65b01d()
{
	level zm_sq::register(#"ww_quest", #"hash_79fb0b9d5540e0ac", #"hash_3cfd69dc67bdcf69", &function_c6de5d3d, &function_863fc0f1);
	level zm_sq::register(#"ww_quest", #"hash_38a2a9adaab1cc19", #"hash_3cfd66dc67bdca50", &function_1168e497, &function_4320379c);
	level zm_sq::register(#"ww_quest", #"hash_41bf4422496d516a", #"hash_3cfd66dc67bdca50", &function_38b4568d, &function_2f221d1c);
	level zm_sq::register(#"ww_quest", #"hash_7a62c3c8a237162c", #"hash_3cfd66dc67bdca50", &function_af92e3a4, &function_40fcf197);
	level flag::wait_till(#"start_zombie_round_logic");
	level thread zm_sq::start(#"ww_quest", 1);
}

/*
	Name: function_c6de5d3d
	Namespace: namespace_8a08914c
	Checksum: 0x5FF1DB88
	Offset: 0x758
	Size: 0xE4
	Parameters: 1
	Flags: None
*/
function function_c6de5d3d(b_skipped)
{
	level endon(#"end_game");
	callback::on_item_pickup(&on_item_pickup);
	if(b_skipped)
	{
		return;
	}
	callback::on_ai_killed(&function_c24ab28e);
	level thread function_defedffe();
	level flag::wait_till_all([2:#"hash_6eaa2d1db393bd70", 1:#"hash_377409bcba0102a7", 0:#"hash_3b34b6b1b8c07116"]);
}

/*
	Name: function_863fc0f1
	Namespace: namespace_8a08914c
	Checksum: 0xCEE2D725
	Offset: 0x848
	Size: 0x27C
	Parameters: 2
	Flags: None
*/
function function_863fc0f1(b_skipped, var_19e802fa)
{
	if(b_skipped || var_19e802fa)
	{
		level flag::set(#"hash_3b34b6b1b8c07116");
		level flag::set(#"hash_377409bcba0102a7");
		level flag::set(#"hash_6eaa2d1db393bd70");
		level flag::set(#"hash_6e04e3a3a814cc4b");
		level zm_ui_inventory::function_7df6bb60(#"hash_2d5a3bb1a97e6bcc", 1);
		level zm_ui_inventory::function_7df6bb60(#"hash_2d5a3eb1a97e70e5", 1);
		level zm_ui_inventory::function_7df6bb60(#"hash_2d5a3db1a97e6f32", 1);
		var_3bc263c7 = struct::get("wwq_part_a_start");
		var_1f3c6d19 = struct::get(var_3bc263c7.target);
		if(isdefined(var_3bc263c7.var_f0d7b908))
		{
			var_3bc263c7.var_f0d7b908 delete();
		}
		if(isdefined(var_1f3c6d19.var_f863218))
		{
			var_1f3c6d19.var_f863218 delete();
		}
		if(isdefined(var_1f3c6d19.var_cc27998f))
		{
			var_1f3c6d19.var_cc27998f delete();
		}
		level thread function_53454d1f();
		level clientfield::set("" + #"hash_2d4fdf69e826bcc4", 1);
		level clientfield::set("" + #"hash_45b04d88564a1cd", 0);
	}
	callback::remove_on_ai_killed(&function_c24ab28e);
}

/*
	Name: function_defedffe
	Namespace: namespace_8a08914c
	Checksum: 0xA51E4D61
	Offset: 0xAD0
	Size: 0x53C
	Parameters: 0
	Flags: None
*/
function function_defedffe()
{
	level endon(#"hash_3b34b6b1b8c07116");
	var_3bc263c7 = struct::get("wwq_part_a_start");
	var_1f3c6d19 = struct::get(var_3bc263c7.target);
	level flag::wait_till(#"hash_264e763f3fa44810");
	level clientfield::set("" + #"hash_2d4fdf69e826bcc4", 1);
	var_5bef7e74 = level.round_number + 2;
	while(level.round_number < var_5bef7e74)
	{
		level waittill(#"start_of_round");
	}
	v_ang = vectortoangles(var_1f3c6d19.origin - var_3bc263c7.origin);
	var_3bc263c7.var_f0d7b908 = util::spawn_model("tag_origin", var_3bc263c7.origin, v_ang);
	var_3bc263c7.var_f0d7b908 clientfield::set("" + #"hash_76ffee0aa9eae3ce", 1);
	var_3bc263c7.var_f0d7b908 moveto(var_1f3c6d19.origin, 6, 0.5, 0.5);
	level thread namespace_9771a88f::function_752b5c36(#"hash_4c1e29c044712f9a", undefined);
	level thread function_b6a4293d();
	var_3bc263c7.var_f0d7b908 waittill(#"movedone");
	level flag::set(#"hash_6e04e3a3a814cc4b");
	playrumbleonposition(#"hash_44a2d15c073da877", var_1f3c6d19.origin);
	earthquake(0.5, 2, var_1f3c6d19.origin, 10000);
	level thread function_cdea4abe(var_1f3c6d19.origin, 500);
	var_1f3c6d19.var_f863218 = util::spawn_model(#"hash_403bde95dde45534", var_1f3c6d19.origin + vectorscale((0, 0, 1), 10), var_1f3c6d19.angles);
	var_1f3c6d19.var_f863218 clientfield::set("" + #"hash_4fcb640ca703e121", 1);
	var_1f3c6d19.var_f863218 thread function_a64f8c66();
	var_3bc263c7.var_f0d7b908 clientfield::set("" + #"hash_76ffee0aa9eae3ce", 0);
	level thread zm_vo::function_7622cb70(#"hash_36079fc8ccf8a4d9", 1);
	var_1f3c6d19.var_cc27998f = spawn("trigger_radius", var_1f3c6d19.origin, 0, var_1f3c6d19.radius, var_1f3c6d19.height);
	var_1f3c6d19.var_cc27998f function_42b23f00();
	wait(1);
	level clientfield::set("" + #"hash_22d24ba0bcf94c3f", 1);
	playrumbleonposition(#"hash_6ecdc679dac14937", var_1f3c6d19.origin);
	earthquake(0.3, 0.8, var_1f3c6d19.origin, 1000);
	level thread function_3db48fdd(#"hash_42432ddc5b3eecfb", var_1f3c6d19.origin + vectorscale((0, 0, 1), 10), var_1f3c6d19.angles);
	if(isdefined(var_3bc263c7.var_f0d7b908))
	{
		var_3bc263c7.var_f0d7b908 delete();
	}
	if(isdefined(var_1f3c6d19.var_f863218))
	{
		var_1f3c6d19.var_f863218 delete();
	}
	if(isdefined(var_1f3c6d19.var_cc27998f))
	{
		var_1f3c6d19.var_cc27998f delete();
	}
}

/*
	Name: function_a64f8c66
	Namespace: namespace_8a08914c
	Checksum: 0xCEE3819
	Offset: 0x1018
	Size: 0x10C
	Parameters: 0
	Flags: None
*/
function function_a64f8c66()
{
	level endon(#"hash_3b34b6b1b8c07116");
	self endon(#"death");
	while(true)
	{
		a_players = array::get_all_closest(self.origin, function_a1ef346b(), undefined, undefined, 150);
		foreach(player in a_players)
		{
			player function_bc82f900(#"damage_light");
		}
		wait(0.25);
	}
}

/*
	Name: function_b6a4293d
	Namespace: namespace_8a08914c
	Checksum: 0xF4B02FCC
	Offset: 0x1130
	Size: 0x8C
	Parameters: 0
	Flags: None
*/
function function_b6a4293d()
{
	level endon(#"hash_3b34b6b1b8c07116");
	wait(5.8);
	level clientfield::set("" + #"hash_45b04d88564a1cd", 1);
	hidemiscmodels("dn_rf_coverage");
	showmiscmodels("dn_rf_coverage_dmg");
}

/*
	Name: function_cdea4abe
	Namespace: namespace_8a08914c
	Checksum: 0xC9AA4B06
	Offset: 0x11C8
	Size: 0x2FC
	Parameters: 2
	Flags: None
*/
function function_cdea4abe(v_origin, n_radius)
{
	a_zombies = array::get_all_closest(v_origin, getaiteamarray(level.zombie_team), undefined, undefined, n_radius);
	a_players = array::get_all_closest(v_origin, function_a1ef346b(), undefined, undefined, n_radius);
	foreach(player in a_players)
	{
		if(isalive(player))
		{
			if(distance2dsquared(v_origin, player.origin) <= sqr(200))
			{
				player dodamage(player.health + 666, v_origin);
			}
		}
	}
	foreach(ai_zombie in a_zombies)
	{
		if(isalive(ai_zombie))
		{
			if(ai_zombie.var_6f84b820 === #"normal")
			{
				v_dir = vectornormalize(ai_zombie.origin - v_origin);
				v_launch = (v_dir * randomintrange(80, 100)) + vectorscale((0, 0, 1), 150);
				ai_zombie zm_utility::function_ffc279(v_launch, undefined, ai_zombie.health, undefined);
				continue;
			}
			ai_zombie thread ai::stun();
		}
	}
	glassradiusdamage(v_origin, n_radius, 250, 100);
	radiusdamage(v_origin, n_radius, 250, 100);
}

/*
	Name: function_42b23f00
	Namespace: namespace_8a08914c
	Checksum: 0x8294BAF9
	Offset: 0x14D0
	Size: 0x14E
	Parameters: 0
	Flags: None
*/
function function_42b23f00()
{
	level endon(#"hash_3b34b6b1b8c07116");
	self endon(#"death");
	n_wave_count = 0;
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"trigger");
		if(zm_utility::is_player_valid(waitresult.activator))
		{
			n_wave_count++;
			switch(n_wave_count)
			{
				case 1:
				{
					level thread function_45c2bb18(waitresult.activator);
					self function_4d67771c(1);
					break;
				}
				case 2:
				{
					self function_4d67771c(2);
					break;
				}
				case 3:
				{
					self function_4d67771c(3);
					return;
				}
			}
		}
	}
}

/*
	Name: function_45c2bb18
	Namespace: namespace_8a08914c
	Checksum: 0x69241345
	Offset: 0x1628
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function function_45c2bb18(e_player)
{
	e_player namespace_9771a88f::function_d137d6a0(#"hash_3b3761bba99968b1", #"hash_3b3771bba99983e1", #"hash_3b3775bba9998aad");
}

/*
	Name: function_4d67771c
	Namespace: namespace_8a08914c
	Checksum: 0x8EF4C8A4
	Offset: 0x1680
	Size: 0x4A4
	Parameters: 1
	Flags: None
*/
function function_4d67771c(n_wave)
{
	level endon(#"hash_3b34b6b1b8c07116");
	var_95421a26 = 0;
	a_s_spawn_locs = struct::get_array("s_ww_part_a_tempest_spawn");
	if(getplayers().size < 2)
	{
		var_4e06036b = 2;
		var_d18f896 = 4;
	}
	else
	{
		var_4e06036b = 0.5;
		var_d18f896 = 1.5;
	}
	switch(n_wave)
	{
		case 1:
		default:
		{
			n_ai_count = 4 + (getplayers().size * 2);
			break;
		}
		case 2:
		{
			n_ai_count = 2 + getplayers().size;
			break;
		}
		case 3:
		{
			n_ai_count = getplayers().size * 2;
			break;
		}
	}
	while(var_95421a26 < n_ai_count)
	{
		while(getaiteamarray(level.zombie_team).size >= level.zombie_ai_limit)
		{
			function_904d21fd();
			util::wait_network_frame();
		}
		ai = undefined;
		while(!isdefined(ai))
		{
			switch(n_wave)
			{
				case 1:
				default:
				{
					s_spawn_loc = array::random(a_s_spawn_locs);
					ai = zombie_dog_util::function_62db7b1c(1, s_spawn_loc);
					break;
				}
				case 2:
				{
					s_spawn_loc = array::random(a_s_spawn_locs);
					ai = zm_ai_avogadro::spawn_single(1, s_spawn_loc);
					break;
				}
				case 3:
				{
					s_spawn_loc = array::random(a_s_spawn_locs);
					ai = namespace_14c07d4f::spawn_single(s_spawn_loc);
					break;
				}
			}
			wait(0.5);
		}
		var_95421a26++;
		ai.targetname = "ww_quest_ai";
		ai.var_126d7bef = 1;
		ai.ignore_round_spawn_failsafe = 1;
		ai.b_ignore_cleanup = 1;
		ai.ignore_enemy_count = 1;
		ai.no_powerups = 1;
		if(ai.aitype === #"hash_1aff4b71635bda08")
		{
			archetype_avogadro::function_33237109(ai, self.origin, 600);
		}
		else
		{
			if(ai.aitype === #"hash_12a17ab3df5889eb")
			{
				ai clientfield::increment("sr_dog_spawn_fx");
			}
			else if(ai.aitype === #"spawner_bo5_mimic")
			{
				ai clientfield::increment("" + #"hash_54e2a4e02a26cc62", 1);
			}
		}
		wait(randomfloatrange(var_4e06036b, var_d18f896));
	}
	timer = gettime() + (int(90 * 1000));
	while(getaiarray("ww_quest_ai", "targetname").size > 0 && gettime() < timer)
	{
		waitframe(1);
	}
}

/*
	Name: function_b49b76d4
	Namespace: namespace_8a08914c
	Checksum: 0x55DA72F7
	Offset: 0x1B30
	Size: 0xDC
	Parameters: 1
	Flags: None
*/
function function_b49b76d4(eventstruct)
{
	if(level flag::get(#"hash_7239f34e436d2b72") || level flag::get(#"hash_377409bcba0102a7"))
	{
		return;
	}
	dynent = eventstruct.ent;
	attacker = eventstruct.attacker;
	if(isdefined(dynent) && dynent.health > 0)
	{
		return;
	}
	if(isdefined(attacker) && attacker.archetype === #"hash_7c09b683edfb0e96")
	{
		level thread function_844cd1f6(dynent.origin);
	}
}

/*
	Name: function_844cd1f6
	Namespace: namespace_8a08914c
	Checksum: 0xE3A6FA4F
	Offset: 0x1C18
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function function_844cd1f6(v_drop_origin)
{
	level flag::set(#"hash_7239f34e436d2b72");
	level function_3db48fdd(#"hash_42432edc5b3eeeae", v_drop_origin + vectorscale((0, 0, 1), 20));
}

/*
	Name: function_c24ab28e
	Namespace: namespace_8a08914c
	Checksum: 0x74A37540
	Offset: 0x1C80
	Size: 0x17C
	Parameters: 1
	Flags: None
*/
function function_c24ab28e(s_params)
{
	if(level flag::get(#"hash_1d1c8f35328c066d") || level flag::get(#"hash_6eaa2d1db393bd70"))
	{
		return;
	}
	attacker = s_params.eattacker;
	weapon = s_params.weapon;
	means_of_death = s_params.smeansofdeath;
	if(isplayer(attacker) && self.archetype === #"tormentor" && isdefined(weapon))
	{
		if(means_of_death === "MOD_BURNED" && weapon.name === #"hero_flamethrower" || (means_of_death === "MOD_EXPLOSIVE" && weapon.name === #"napalm_strike") || function_313be247(attacker, weapon, means_of_death) || function_1c058bc5(weapon, means_of_death))
		{
			self thread function_4f49262c();
		}
	}
}

/*
	Name: function_4f49262c
	Namespace: namespace_8a08914c
	Checksum: 0xEAC6319E
	Offset: 0x1E08
	Size: 0xA4
	Parameters: 0
	Flags: None
*/
function function_4f49262c()
{
	self notify("78f595f4bdf501c1");
	self endon("78f595f4bdf501c1");
	if(level flag::get(#"hash_1d1c8f35328c066d") || level flag::get(#"hash_6eaa2d1db393bd70"))
	{
		return;
	}
	wait(1);
	if(isdefined(self) && isdefined(self.origin))
	{
		level thread function_99f5fd48(self.origin);
	}
}

/*
	Name: function_1c058bc5
	Namespace: namespace_8a08914c
	Checksum: 0x3C3AFC9C
	Offset: 0x1EB8
	Size: 0xEA
	Parameters: 2
	Flags: None
*/
function function_1c058bc5(weapon, means_of_death)
{
	if(!isdefined(weapon) || !isdefined(weapon.name) || !isdefined(means_of_death))
	{
		return false;
	}
	if(means_of_death != "MOD_BURNED")
	{
		return false;
	}
	switch(weapon.name)
	{
		case "hash_6319e23758cd25e":
		case "hash_6319f23758cd411":
		case "hash_631a023758cd5c4":
		case "hash_631a123758cd777":
		case "hash_631a223758cd92a":
		case "ring_of_fire":
		{
			return true;
		}
		default:
		{
			return false;
		}
	}
}

/*
	Name: function_313be247
	Namespace: namespace_8a08914c
	Checksum: 0x862D7414
	Offset: 0x1FB0
	Size: 0xC0
	Parameters: 3
	Flags: None
*/
function function_313be247(attacker, weapon, means_of_death)
{
	if(!isdefined(attacker) || !isdefined(weapon) || !isdefined(means_of_death))
	{
		return false;
	}
	if(means_of_death != "MOD_AAT")
	{
		return false;
	}
	aat_name = attacker aat::getaatonweapon(weapon, 1);
	if(!isdefined(aat_name))
	{
		return false;
	}
	var_4f0c684c = zm_aat::function_296cde87(aat_name);
	if(var_4f0c684c !== "ammomod_napalmburst")
	{
		return false;
	}
	return true;
}

/*
	Name: function_99f5fd48
	Namespace: namespace_8a08914c
	Checksum: 0xA54DB69A
	Offset: 0x2078
	Size: 0xA4
	Parameters: 1
	Flags: None
*/
function function_99f5fd48(v_drop_origin)
{
	if(!zm_utility::check_point_in_playable_area(v_drop_origin) || level flag::get(#"hash_1d1c8f35328c066d"))
	{
		return;
	}
	level flag::set(#"hash_1d1c8f35328c066d");
	level function_3db48fdd(#"hash_42432fdc5b3ef061", v_drop_origin + vectorscale((0, 0, 1), 10));
}

/*
	Name: on_item_pickup
	Namespace: namespace_8a08914c
	Checksum: 0xCFA8955A
	Offset: 0x2128
	Size: 0x362
	Parameters: 1
	Flags: None
*/
function on_item_pickup(params)
{
	if(isdefined(params.item) && isdefined(params.item.var_a6762160))
	{
		name = params.item.var_a6762160.name;
	}
	if(!isdefined(name) || !isplayer(self))
	{
		return;
	}
	switch(name)
	{
		case "hash_42432ddc5b3eecfb":
		{
			level flag::set(#"hash_3b34b6b1b8c07116");
			level zm_ui_inventory::function_7df6bb60(#"hash_2d5a3bb1a97e6bcc", 1);
			level thread function_f9447d48(self);
			level clientfield::set("" + #"hash_45b04d88564a1cd", 0);
			array::thread_all(function_a1ef346b(), &namespace_4abf1500::collect_intel, #"hash_27e4fc2beb53e5e2");
			break;
		}
		case "hash_42432edc5b3eeeae":
		{
			level flag::set(#"hash_377409bcba0102a7");
			level zm_ui_inventory::function_7df6bb60(#"hash_2d5a3eb1a97e70e5", 1);
			level thread function_75bec488(self);
			array::thread_all(function_a1ef346b(), &namespace_4abf1500::collect_intel, #"hash_27e4fb2beb53e42f");
			break;
		}
		case "hash_42432fdc5b3ef061":
		{
			level flag::set(#"hash_6eaa2d1db393bd70");
			level zm_ui_inventory::function_7df6bb60(#"hash_2d5a3db1a97e6f32", 1);
			level thread function_da57dd7c(self);
			array::thread_all(function_a1ef346b(), &namespace_4abf1500::collect_intel, #"hash_27e4fa2beb53e27c");
			break;
		}
		case "hash_59dcec9189027842":
		{
			level thread ww_pickup_vo(params.item, self);
			array::thread_all(function_a1ef346b(), &namespace_4abf1500::collect_intel, #"hash_48b4fb2df2953fd");
			break;
		}
	}
}

/*
	Name: function_f9447d48
	Namespace: namespace_8a08914c
	Checksum: 0x2D4451C2
	Offset: 0x2498
	Size: 0xFC
	Parameters: 1
	Flags: None
*/
function function_f9447d48(e_player)
{
	var_821062d8 = array::random([2:#"hash_47178f11bb9d7cef", 1:#"hash_47178e11bb9d7b3c", 0:#"hash_47179111bb9d8055"]);
	var_6eb9bbff = array::random([2:#"hash_47250711bba8d333", 1:#"hash_47250611bba8d180", 0:#"hash_47250911bba8d699"]);
	e_player namespace_9771a88f::function_d137d6a0(#"hash_787c36ae3d0c3d16", var_821062d8, var_6eb9bbff);
}

/*
	Name: function_75bec488
	Namespace: namespace_8a08914c
	Checksum: 0x6BD7000A
	Offset: 0x25A0
	Size: 0x15C
	Parameters: 1
	Flags: None
*/
function function_75bec488(e_player)
{
	var_2e53b027 = array::random([2:#"hash_482d95184a860afa", 1:#"hash_482d96184a860cad", 0:#"hash_482d93184a860794"]);
	var_35703e80 = array::random([2:#"hash_47f715184a57a20a", 1:#"hash_47f716184a57a3bd", 0:#"hash_47f713184a579ea4"]);
	var_daf58964 = array::random([2:#"hash_47e97d184a4c1566", 1:#"hash_47e97e184a4c1719", 0:#"hash_47e97b184a4c1200"]);
	e_player namespace_9771a88f::function_d137d6a0(var_2e53b027, var_35703e80, var_daf58964);
}

/*
	Name: function_da57dd7c
	Namespace: namespace_8a08914c
	Checksum: 0x95A7959F
	Offset: 0x2708
	Size: 0xFC
	Parameters: 1
	Flags: None
*/
function function_da57dd7c(e_player)
{
	var_991f2885 = array::random([2:#"hash_57a2822b7e534707", 1:#"hash_57a2812b7e534554", 0:#"hash_57a2842b7e534a6d"]);
	var_fe5272ea = array::random([2:#"hash_5779fa2b7e310ddb", 1:#"hash_5779f92b7e310c28", 0:#"hash_5779fc2b7e311141"]);
	e_player namespace_9771a88f::function_d137d6a0(var_991f2885, #"hash_369770613414183e", var_fe5272ea);
}

/*
	Name: function_3db48fdd
	Namespace: namespace_8a08914c
	Checksum: 0xAF97103A
	Offset: 0x2810
	Size: 0x138
	Parameters: 3
	Flags: Private
*/
function private function_3db48fdd(str_item_name, v_drop_origin, var_55ab02db)
{
	if(!isdefined(var_55ab02db))
	{
		var_55ab02db = (0, 0, 0);
	}
	point = function_4ba8fde(str_item_name);
	var_60687c46 = item_drop::drop_item(0, undefined, 1, 0, point.id, v_drop_origin, var_55ab02db, 0);
	var_60687c46.var_dd21aec2 = 1 | 16;
	var_60687c46 playloopsound(#"hash_21d80fb4d9a84575");
	if(!isdefined(level.var_ddc67fdb))
	{
		level.var_ddc67fdb = [];
	}
	else if(!isarray(level.var_ddc67fdb))
	{
		level.var_ddc67fdb = array(level.var_ddc67fdb);
	}
	level.var_ddc67fdb[level.var_ddc67fdb.size] = var_60687c46;
}

/*
	Name: function_53454d1f
	Namespace: namespace_8a08914c
	Checksum: 0x4FEF1114
	Offset: 0x2950
	Size: 0xB8
	Parameters: 0
	Flags: Private
*/
function private function_53454d1f()
{
	if(isarray(level.var_ddc67fdb) && level.var_ddc67fdb.size)
	{
		foreach(var_60687c46 in level.var_ddc67fdb)
		{
			if(isdefined(var_60687c46))
			{
				var_60687c46 delete();
			}
		}
	}
}

/*
	Name: function_1168e497
	Namespace: namespace_8a08914c
	Checksum: 0x3E40726C
	Offset: 0x2A10
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function function_1168e497(b_skipped)
{
	if(b_skipped)
	{
		return;
	}
	level thread function_4a34b4ed();
	level thread function_499de9e();
	level flag::wait_till(#"hash_799c465b8328df15");
}

/*
	Name: function_4320379c
	Namespace: namespace_8a08914c
	Checksum: 0x6218B137
	Offset: 0x2A80
	Size: 0x6C
	Parameters: 2
	Flags: None
*/
function function_4320379c(b_skipped, var_19e802fa)
{
	if(b_skipped || var_19e802fa)
	{
		level flag::set(#"hash_799c465b8328df15");
	}
	function_69f39621();
	level thread function_1512480e();
}

/*
	Name: function_4a34b4ed
	Namespace: namespace_8a08914c
	Checksum: 0xBB7DE408
	Offset: 0x2AF8
	Size: 0x7C
	Parameters: 0
	Flags: None
*/
function function_4a34b4ed()
{
	level endon(#"hash_799c465b8328df15");
	s_interact = struct::get("ww_pool_interact");
	s_interact zm_unitrigger::function_fac87205("", 96);
	level flag::set(#"hash_799c465b8328df15");
}

/*
	Name: function_499de9e
	Namespace: namespace_8a08914c
	Checksum: 0x6119D561
	Offset: 0x2B80
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function function_499de9e()
{
	level endon(#"hash_799c465b8328df15");
	wait(15);
	level namespace_9771a88f::function_d137d6a0(#"hash_31ea5809a935154e", #"hash_31ea4809a934fa1e", #"hash_31ea4c09a93500ea");
}

/*
	Name: function_69f39621
	Namespace: namespace_8a08914c
	Checksum: 0x134AEF1B
	Offset: 0x2BF0
	Size: 0x1DC
	Parameters: 0
	Flags: None
*/
function function_69f39621()
{
	level.var_d52e24c5 = [];
	s_interact = struct::get("ww_pool_interact");
	var_d56fdb6 = struct::get_array(s_interact.target);
	foreach(s_crystal in var_d56fdb6)
	{
		var_3128fb28 = util::spawn_model(s_crystal.model, s_crystal.origin, s_crystal.angles);
		if(!isdefined(level.var_d52e24c5))
		{
			level.var_d52e24c5 = [];
		}
		else if(!isarray(level.var_d52e24c5))
		{
			level.var_d52e24c5 = array(level.var_d52e24c5);
		}
		level.var_d52e24c5[level.var_d52e24c5.size] = var_3128fb28;
	}
	level.var_d52e24c5[1] playsound(#"hash_16ed1f8ba3be3b37");
	level.var_d52e24c5[1] playloopsound(#"hash_7b219cc350a3dd43");
}

/*
	Name: function_38b4568d
	Namespace: namespace_8a08914c
	Checksum: 0xB245BB3D
	Offset: 0x2DD8
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function function_38b4568d(b_skipped)
{
	if(b_skipped)
	{
		return;
	}
	if(!isdefined(level.var_c390e613))
	{
		level.var_c390e613 = 0;
	}
	callback::on_ai_killed(&function_cf6cdaa5);
	level flag::wait_till(#"hash_65cb00631d191193");
}

/*
	Name: function_2f221d1c
	Namespace: namespace_8a08914c
	Checksum: 0xA88AC63B
	Offset: 0x2E58
	Size: 0x18C
	Parameters: 2
	Flags: None
*/
function function_2f221d1c(b_skipped, var_19e802fa)
{
	if(b_skipped || var_19e802fa)
	{
		level flag::set(#"hash_65cb00631d191193");
	}
	level thread function_fa6cc1f2();
	if(isdefined(level.var_d52e24c5))
	{
		foreach(var_8ac08196 in level.var_d52e24c5)
		{
			if(isdefined(var_8ac08196))
			{
				var_8ac08196 delete();
			}
		}
	}
	callback::remove_on_ai_killed(&function_cf6cdaa5);
	level.var_c390e613 = undefined;
	level clientfield::set("" + #"hash_2d4fdf69e826bcc4", 0);
	level clientfield::set("" + #"ww_crystalaxe_glow", 0);
}

/*
	Name: function_cf6cdaa5
	Namespace: namespace_8a08914c
	Checksum: 0x2F633D9E
	Offset: 0x2FF0
	Size: 0x27C
	Parameters: 1
	Flags: None
*/
function function_cf6cdaa5(s_params)
{
	attacker = s_params.eattacker;
	weapon = s_params.weapon;
	means_of_death = s_params.smeansofdeath;
	if(!isplayer(attacker) || level flag::get(#"hash_65cb00631d191193"))
	{
		return;
	}
	if(weapon.name === #"hatchet" && means_of_death === "MOD_IMPACT" || means_of_death === "MOD_MELEE")
	{
		var_29eb5284 = struct::get("ww_soul_charge");
		if(distance2dsquared(self.origin, var_29eb5284.origin) <= sqr(500))
		{
			self clientfield::set("" + #"zombie_soul", 1);
			level.var_c390e613++;
			if(level.var_c390e613 == 1)
			{
				level clientfield::set("" + #"ww_crystalaxe_glow", 1);
			}
			if(level.var_c390e613 == 5)
			{
				level clientfield::set("" + #"hash_2d4fdf69e826bcc4", 2);
			}
			if(level.var_c390e613 >= 10)
			{
				n_time = distance(self.origin, var_29eb5284.origin) / 400;
				wait(n_time + 1);
				level flag::set(#"hash_65cb00631d191193");
			}
		}
	}
}

/*
	Name: function_1512480e
	Namespace: namespace_8a08914c
	Checksum: 0xBE361D97
	Offset: 0x3278
	Size: 0x9C
	Parameters: 0
	Flags: None
*/
function function_1512480e()
{
	var_5aa94770 = array::random([2:#"hash_26446eb367ced296", 1:#"hash_26446db367ced0e3", 0:#"hash_26446cb367cecf30"]);
	level zm_vo::function_d6f8bbd9(var_5aa94770, 1.5, getplayers());
}

/*
	Name: function_fa6cc1f2
	Namespace: namespace_8a08914c
	Checksum: 0xCB0B68A1
	Offset: 0x3320
	Size: 0x264
	Parameters: 0
	Flags: None
*/
function function_fa6cc1f2()
{
	s_loc = struct::get("ww_soul_charge");
	level.no_powerups = 1;
	level flag::clear("spawn_zombies");
	level flag::clear("zombie_drop_powerups");
	level flag::clear(#"hash_21921ed511559aa3");
	level flag::set(#"pause_round_timeout");
	level flag::set("hold_round_end");
	level clientfield::set("" + #"hash_22d24ba0bcf94c3f", 2);
	playrumbleonposition(#"hash_6c2e11718d838a2b", s_loc.origin);
	earthquake(0.4, 2, s_loc.origin, 1500);
	level function_3d1e19ec(s_loc.origin, 1500);
	timer = gettime() + (int(5 * 1000));
	while(gettime() < timer)
	{
		waitframe(1);
	}
	level.no_powerups = undefined;
	level flag::set("spawn_zombies");
	level flag::set("zombie_drop_powerups");
	level flag::set(#"hash_21921ed511559aa3");
	level flag::clear(#"pause_round_timeout");
	level flag::clear("hold_round_end");
}

/*
	Name: function_3d1e19ec
	Namespace: namespace_8a08914c
	Checksum: 0xA9B9F45
	Offset: 0x3590
	Size: 0x416
	Parameters: 6
	Flags: None
*/
function function_3d1e19ec(v_origin, n_radius, var_a8d0b313, var_82ea43f2, b_hide_body, var_b0e62e21)
{
	if(!isdefined(var_a8d0b313))
	{
		var_a8d0b313 = 1;
	}
	if(!isdefined(var_82ea43f2))
	{
		var_82ea43f2 = 1;
	}
	if(!isdefined(b_hide_body))
	{
		b_hide_body = 0;
	}
	if(!isdefined(var_b0e62e21))
	{
		var_b0e62e21 = 0;
	}
	var_4b9821e4 = 0;
	if(var_b0e62e21)
	{
		a_players = function_72d3bca6(function_a1ef346b(), v_origin, undefined, undefined, n_radius);
		foreach(player in a_players)
		{
			player thread lui::screen_flash(1, 1, 0.5, 1, (1, 1, 1));
		}
	}
	a_enemies = function_72d3bca6(getaiteamarray(level.zombie_team), v_origin, undefined, undefined, n_radius);
	foreach(ai in a_enemies)
	{
		if(isalive(ai) && !is_true(ai.var_d45ca662) && !is_true(ai.marked_for_death))
		{
			if(var_a8d0b313)
			{
				ai zm_cleanup::function_23621259(0);
			}
			if(var_82ea43f2 || ai.var_6f84b820 !== #"normal")
			{
				if(zm_utility::is_magic_bullet_shield_enabled(ai))
				{
					ai util::stop_magic_bullet_shield();
				}
				ai.allowdeath = 1;
				ai.no_powerups = 1;
				ai.deathpoints_already_given = 1;
				ai.marked_for_death = 1;
				if(!b_hide_body && ai.var_6f84b820 === #"normal" && var_4b9821e4 < 6)
				{
					var_4b9821e4++;
					ai thread zombie_death::flame_death_fx();
					if(!is_true(ai.no_gib))
					{
						ai zombie_utility::zombie_head_gib();
					}
				}
				ai dodamage(ai.health + 666, ai.origin);
				if(b_hide_body)
				{
					ai hide();
					ai notsolid();
				}
			}
			else
			{
				ai delete();
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_af92e3a4
	Namespace: namespace_8a08914c
	Checksum: 0xF45C9682
	Offset: 0x39B0
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function function_af92e3a4(b_skipped)
{
	wait(1.5);
	level thread function_ea86330e();
}

/*
	Name: function_40fcf197
	Namespace: namespace_8a08914c
	Checksum: 0xE630C7E3
	Offset: 0x39F0
	Size: 0x26
	Parameters: 2
	Flags: None
*/
function function_40fcf197(b_skipped, var_19e802fa)
{
}

/*
	Name: function_ea86330e
	Namespace: namespace_8a08914c
	Checksum: 0x207487D1
	Offset: 0x3A20
	Size: 0x15C
	Parameters: 0
	Flags: None
*/
function function_ea86330e()
{
	var_222825ae = struct::get("ww_crystalaxe_spawn");
	point = function_4ba8fde(#"hash_59dcec9189027842");
	var_4d1c70f5 = item_drop::drop_item(0, getweapon(#"hash_69461751fa492ea4"), 1, 0, point.id, var_222825ae.origin, var_222825ae.angles, 0);
	var_4d1c70f5.var_dd21aec2 = 1 | 16;
	var_4d1c70f5.var_19920dbe = 1;
	var_4d1c70f5.var_a6762160.droptimeout = undefined;
	var_4d1c70f5 playsound(#"hash_250f39946d7f6289");
	var_4d1c70f5 playloopsound(#"hash_3297d5eea6cd1217");
	var_4d1c70f5 moveto(var_4d1c70f5.origin + vectorscale((0, 0, 1), 32), 5, 0.05, 0.05);
}

/*
	Name: ww_pickup_vo
	Namespace: namespace_8a08914c
	Checksum: 0x747C6E82
	Offset: 0x3B88
	Size: 0x174
	Parameters: 2
	Flags: None
*/
function ww_pickup_vo(item, e_player)
{
	if(!is_true(item.var_19920dbe))
	{
		return;
	}
	wait(2);
	if(isalive(e_player))
	{
		var_5e0eaa1f = array::random([2:#"hash_7ad1fced76652150", 1:#"hash_7ad1fded76652303", 0:#"hash_7ad1feed766524b6"]);
		var_b3f1d5e4 = array::random([2:#"hash_7adf94ed7670adf4", 1:#"hash_7adf95ed7670afa7", 0:#"hash_7adf96ed7670b15a"]);
		e_player thread namespace_9771a88f::function_d137d6a0(#"hash_56e0e52471da7613", var_5e0eaa1f, var_b3f1d5e4);
	}
	callback::remove_callback(#"on_item_pickup", &on_item_pickup);
}

/*
	Name: function_904d21fd
	Namespace: namespace_8a08914c
	Checksum: 0xB3391968
	Offset: 0x3D08
	Size: 0x37C
	Parameters: 0
	Flags: None
*/
function function_904d21fd()
{
	actor_array = getaiarchetypearray(#"zombie");
	max_dist = 0;
	var_202d087b = undefined;
	foreach(i, actor in actor_array)
	{
		if(is_true(actor.var_921627ad) || is_true(actor.var_a950813d) || is_true(actor.var_4df707f6))
		{
			actor_array[i] = -1;
		}
	}
	arrayremovevalue(actor_array, -1);
	players = getplayers();
	foreach(player in players)
	{
		if(player.sessionstate === "spectator")
		{
			continue;
		}
		while(true)
		{
			if(!isdefined(player))
			{
				break;
			}
			var_3817a6b3 = arraygetfarthest(player.origin, actor_array);
			if(!isdefined(var_3817a6b3))
			{
				return;
			}
			if(isalive(var_3817a6b3))
			{
				break;
			}
			arrayremovevalue(actor_array, var_3817a6b3);
			if(!actor_array.size)
			{
				return;
			}
			waitframe(1);
		}
		if(isdefined(var_3817a6b3))
		{
			closest_player = arraygetclosest(var_3817a6b3.origin, getplayers());
		}
		if(isdefined(closest_player) && isdefined(var_3817a6b3))
		{
			dist = distancesquared(closest_player.origin, var_3817a6b3.origin);
			if(max_dist < dist)
			{
				max_dist = dist;
				var_202d087b = var_3817a6b3;
			}
		}
	}
	if(!isdefined(var_202d087b))
	{
		var_202d087b = array::random(actor_array);
	}
	if(isdefined(var_202d087b) && var_202d087b.targetname !== "ww_quest_ai")
	{
		var_202d087b zm_cleanup::cleanup_zombie(1);
		if(isdefined(var_202d087b))
		{
			gibserverutils::annihilate(var_202d087b);
		}
	}
}

/*
	Name: function_cd7a3de4
	Namespace: namespace_8a08914c
	Checksum: 0x63E9A0DB
	Offset: 0x4090
	Size: 0x74
	Parameters: 0
	Flags: None
*/
function function_cd7a3de4()
{
	/#
		util::add_debug_command("");
		util::add_debug_command("");
		util::add_debug_command("");
		zm_devgui::add_custom_devgui_callback(&cmd);
	#/
}

/*
	Name: cmd
	Namespace: namespace_8a08914c
	Checksum: 0xDDCF0F2A
	Offset: 0x4110
	Size: 0x22A
	Parameters: 1
	Flags: None
*/
function cmd(cmd)
{
	/#
		switch(cmd)
		{
			case "hash_649635ef22bf36d8":
			{
				level flag::set(#"hash_3b34b6b1b8c07116");
				level zm_ui_inventory::function_7df6bb60(#"hash_2d5a3bb1a97e6bcc", 1);
				level thread function_f9447d48(self);
				level clientfield::set("" + #"hash_45b04d88564a1cd", 0);
				var_3bc263c7 = struct::get("");
				var_1f3c6d19 = struct::get(var_3bc263c7.target);
				if(isdefined(var_1f3c6d19.var_f863218))
				{
					var_1f3c6d19.var_f863218 delete();
				}
				break;
			}
			case "hash_649638ef22bf3bf1":
			{
				level flag::set(#"hash_377409bcba0102a7");
				level zm_ui_inventory::function_7df6bb60(#"hash_2d5a3eb1a97e70e5", 1);
				level thread function_75bec488(self);
				break;
			}
			case "hash_649637ef22bf3a3e":
			{
				level flag::set(#"hash_6eaa2d1db393bd70");
				level zm_ui_inventory::function_7df6bb60(#"hash_2d5a3db1a97e6f32", 1);
				level thread function_da57dd7c(self);
				break;
			}
		}
	#/
}

