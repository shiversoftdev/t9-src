#using scripts\cp_common\gametypes\battlechatter.gsc;
#using script_54412fb3a6fab34c;
#using script_85cd2e9a28ea8a1;
#using script_5552bd756afee443;
#using script_3dc93ca9902a9cda;
#using script_1292451e284848cc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\audio_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_a052577e;

/*
	Name: function_b489bb7b
	Namespace: namespace_a052577e
	Checksum: 0x1672A190
	Offset: 0x690
	Size: 0x3C
	Parameters: 1
	Flags: Private, Event
*/
event private function_b489bb7b(eventstruct)
{
	snd::skipto_init(&_objective);
	snd::function_294cb4fa();
}

/*
	Name: function_686b88aa
	Namespace: namespace_a052577e
	Checksum: 0x2E4DF473
	Offset: 0x6D8
	Size: 0xA4
	Parameters: 1
	Flags: Private, Event
*/
event private function_686b88aa(eventstruct)
{
	snd::function_294cb4fa();
	snd::waitforplayers();
	/#
		snd::dvar("", "" + 3, &function_5e7cc862);
		snd::dvar("", "" + 15, &function_5e7cc862);
	#/
}

/*
	Name: _objective
	Namespace: namespace_a052577e
	Checksum: 0x8C530D86
	Offset: 0x788
	Size: 0x392
	Parameters: 1
	Flags: Linked, Private
*/
function private _objective(objective)
{
	switch(objective)
	{
		case "tkdn_raid_bar":
		{
			snd::function_7db65a93("triton_on");
			level thread function_a20133bd();
			break;
		}
		case "tkdn_raid_gearup":
		{
			snd::function_7db65a93("triton_on");
			break;
		}
		case "tkdn_raid_apt":
		{
			snd::function_7db65a93("triton_on");
			level notify(#"hash_7ad75056b30c451a");
			level notify(#"hash_63850bb43dbc38de");
			break;
		}
		case "tkdn_raid_rooftops":
		{
			snd::function_7db65a93("triton_on");
			break;
		}
		case "tkdn_raid_slide":
		{
			snd::function_7db65a93("triton_on");
			break;
		}
		case "tkdn_raid_capture":
		{
			snd::function_7db65a93("triton_on");
			break;
		}
		case "hash_7db5c2bb92c102ae":
		{
			snd::function_7db65a93("triton_on");
			break;
		}
		case "tkdn_af_intro":
		{
			snd::function_7db65a93("triton_off");
			break;
		}
		case "tkdn_af_hill":
		{
			snd::function_7db65a93("triton_off");
			break;
		}
		case "tkdn_af_tarmac":
		{
			snd::function_7db65a93("triton_off");
			break;
		}
		case "tkdn_af_chase":
		{
			snd::function_7db65a93("triton_off");
			snd::function_7db65a93(#"hash_55e0585ab6221a00");
			break;
		}
		case "tkdn_af_rc_chase":
		{
			snd::function_7db65a93("triton_off");
			break;
		}
		case "tkdn_af_skid":
		{
			snd::function_7db65a93("triton_off");
			break;
		}
		case "tkdn_af_wreck":
		{
			snd::function_7db65a93("triton_off");
			break;
		}
		case "no_game":
		case "hash_6e531fb9475df744":
		{
			break;
		}
		default:
		{
			/#
				snd::function_81fac19d(snd::function_d78e3644(), ("" + objective) + "");
			#/
			break;
		}
	}
}

/*
	Name: function_77da0ec2
	Namespace: namespace_a052577e
	Checksum: 0x4B883752
	Offset: 0xB28
	Size: 0x96
	Parameters: 0
	Flags: None
*/
function function_77da0ec2()
{
	/#
		self endon(#"death");
		self endon(#"hash_2caeecd393c68946");
		while(isdefined(self) && isdefined(self.origin) && isdefined(self.angles))
		{
			snd::function_81183b3(self.origin, 24, self.angles, (1, 1, 1), 1, 0, 1);
			waitframe(1);
		}
	#/
}

/*
	Name: function_5e7cc862
	Namespace: namespace_a052577e
	Checksum: 0x8C2FF1E2
	Offset: 0xBC8
	Size: 0x1B0
	Parameters: 2
	Flags: None
*/
function function_5e7cc862(key, value)
{
	/#
		level notify(#"hash_63850bb43dbc38de");
		players = snd::function_da785aa8();
		player = players[0];
		/#
			assert(isplayer(player));
		#/
		view_origin = player snd::function_efda2d6d();
		var_839b8d61 = getentitiesinradius(view_origin, 16384, 15);
		var_97d10723 = function_b6dd763(view_origin, 16384);
		ents = arraycombine(var_839b8d61, var_97d10723, 0);
		foreach(ent in ents)
		{
			ent.var_2de4672c = undefined;
		}
		level thread function_a20133bd();
		return value;
	#/
}

/*
	Name: function_c26120ff
	Namespace: namespace_a052577e
	Checksum: 0x58DD20B5
	Offset: 0xD88
	Size: 0x2BA
	Parameters: 1
	Flags: Linked
*/
function function_c26120ff(ent)
{
	type = array::random([2:"throat", 1:"sniff", 0:"cough"]);
	prefix = "male";
	head = ent.head;
	var_6c1ff08a = [2:#"c_t9_cp_net_civ_police_chief_head", 1:#"c_t9_cp_usa_hero_woods_head1", 0:#"c_t9_cp_usa_hero_adler_head1"];
	var_8243bb50 = isinarray(var_6c1ff08a, head);
	if(var_8243bb50)
	{
		self notify(#"hash_63850bb43dbc38de");
		return undefined;
	}
	var_9805f0e = [10:#"hash_10907c2b90e2ab7e", 9:#"hash_6cfe111eb7699655", 8:#"hash_6cfa941eb7668c17", 7:#"hash_6cfa931eb7668a64", 6:#"hash_6cfa8a1eb7667b19", 5:#"c_t9_ger_civ_female_head06", 4:#"c_t9_ger_civ_female_head05", 3:#"c_t9_ger_civ_female_head04", 2:#"c_t9_ger_civ_female_head03", 1:#"c_t9_ger_civ_female_head02", 0:#"c_t9_ger_civ_female_head01"];
	isfemale = isinarray(var_9805f0e, head);
	if(isfemale)
	{
		prefix = "female";
	}
	alias = (("vox_" + prefix) + "_") + type;
	if(!soundexists(alias))
	{
		return "vox_male_" + type;
	}
	return alias;
}

/*
	Name: function_a20133bd
	Namespace: namespace_a052577e
	Checksum: 0x52091768
	Offset: 0x1050
	Size: 0x31A
	Parameters: 0
	Flags: Linked
*/
function function_a20133bd()
{
	player = self;
	if(!snd::function_e3a36342(player))
	{
		players = snd::function_da785aa8();
		player = players[0];
		/#
			assert(isplayer(player));
		#/
	}
	player notify(#"hash_7ad75056b30c451a");
	player endon(#"hash_7ad75056b30c451a", #"death", #"disconnect");
	level endon(#"hash_7ad75056b30c451a");
	min_time = getdvarfloat(#"hash_5a9d5543cb5829b3", 3);
	max_time = getdvarfloat(#"hash_5ab96b43cb70c9cd", 15);
	var_88701456 = 0;
	while(true)
	{
		view_origin = player snd::function_efda2d6d();
		var_839b8d61 = getentitiesinradius(view_origin, 900, 15);
		var_97d10723 = function_b6dd763(view_origin, 900);
		ents = arraycombine(var_839b8d61, var_97d10723, 0);
		var_dcf355d7 = 0;
		var_bff726ab = min(32, ents.size);
		while(ents.size > 0 && var_dcf355d7 < var_bff726ab)
		{
			var_88701456 = var_88701456 % ents.size;
			ent = ents[var_88701456];
			if(isentity(ent) && !ent ishidden())
			{
				head = ent.head;
				if(isdefined(head) && head != "" && !isdefined(ent.var_2de4672c))
				{
					ent thread snd::function_9299618(&function_c26120ff, [1:max_time, 0:min_time]);
				}
			}
			var_dcf355d7++;
			var_88701456++;
		}
		waitframe(20);
	}
}

/*
	Name: function_e04b45ab
	Namespace: namespace_a052577e
	Checksum: 0x80F724D1
	Offset: 0x1378
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_e04b45ab()
{
}

/*
	Name: function_ec4a61d9
	Namespace: namespace_a052577e
	Checksum: 0x80F724D1
	Offset: 0x1388
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_ec4a61d9()
{
}

/*
	Name: function_6b5c2a3
	Namespace: namespace_a052577e
	Checksum: 0xF313D07E
	Offset: 0x1398
	Size: 0x14
	Parameters: 2
	Flags: Linked
*/
function function_6b5c2a3(var_b76ced44, veh)
{
}

/*
	Name: function_b9b9189c
	Namespace: namespace_a052577e
	Checksum: 0x9B84BE7C
	Offset: 0x13B8
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_b9b9189c()
{
	snd::function_7db65a93(#"hash_443db59c2d746e0f");
}

/*
	Name: function_82bfce7c
	Namespace: namespace_a052577e
	Checksum: 0x912BDE1D
	Offset: 0x13E8
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function function_82bfce7c()
{
	snd::play("evt_tkdn_lighter_open");
}

/*
	Name: function_60f59158
	Namespace: namespace_a052577e
	Checksum: 0x80F724D1
	Offset: 0x1410
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function function_60f59158()
{
}

/*
	Name: function_6591463
	Namespace: namespace_a052577e
	Checksum: 0xC35092D4
	Offset: 0x1420
	Size: 0x1D4
	Parameters: 0
	Flags: Linked
*/
function function_6591463()
{
	wait(1);
	var_b22ada74 = snd::play("emt_tkd_police_radio_squelch_in", (19695, 18941, 69));
	var_e7139ba1 = snd::play("emt_tkd_police_radio_static_bg_lp", (19695, 18941, 69));
	wait(0.25);
	var_334e9d8b = snd::play("vox_cp_tdwn_09100_dplb_attentionallams_59", (19695, 18941, 69));
	wait(3);
	var_7e253337 = snd::play("vox_cp_tdwn_09100_dplb_allofficersinth_43", (19695, 18941, 69));
	wait(8);
	var_8fcbd684 = snd::play("vox_cp_tdwn_09100_dplb_allofficersaret_60", (19695, 18941, 69));
	level thread flag::wait_till("flag_move_on_to_alley");
	snd::play("emt_tkd_police_radio_squelch_out", (19695, 18941, 69));
	snd::stop(var_b22ada74);
	snd::stop(var_e7139ba1);
	snd::stop(var_334e9d8b);
	snd::stop(var_7e253337);
	snd::stop(var_8fcbd684);
}

/*
	Name: function_ddd8adc3
	Namespace: namespace_a052577e
	Checksum: 0x80F724D1
	Offset: 0x1600
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function function_ddd8adc3()
{
}

/*
	Name: function_2032c91c
	Namespace: namespace_a052577e
	Checksum: 0x9C84A82B
	Offset: 0x1610
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_2032c91c()
{
	music::setmusicstate("1.0_approach");
	snd::function_7db65a93("unlock_all_takedownmus");
}

/*
	Name: function_11062617
	Namespace: namespace_a052577e
	Checksum: 0x12BB8E3E
	Offset: 0x1650
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function function_11062617()
{
	music::setmusicstate("none");
}

/*
	Name: function_1dc92e4f
	Namespace: namespace_a052577e
	Checksum: 0x6DAFF989
	Offset: 0x1678
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function function_1dc92e4f()
{
	music::setmusicstate("2.0_assault");
}

/*
	Name: function_b26ed576
	Namespace: namespace_a052577e
	Checksum: 0x987A237E
	Offset: 0x16A0
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_b26ed576()
{
	snd::play("tmp_tkdn_drunk_singing_lp", (20334, 18307, 97));
}

/*
	Name: function_f8f5f970
	Namespace: namespace_a052577e
	Checksum: 0x9E140CB6
	Offset: 0x16D8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_f8f5f970()
{
	wait(0.7);
	snd::play("tmp_tkdn_apartment_door_breach", (20753, 17182, 66));
}

/*
	Name: function_bc76873
	Namespace: namespace_a052577e
	Checksum: 0x80F724D1
	Offset: 0x1718
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function function_bc76873()
{
}

/*
	Name: function_38a8c5b0
	Namespace: namespace_a052577e
	Checksum: 0xD77412A8
	Offset: 0x1728
	Size: 0x3AC
	Parameters: 0
	Flags: Linked
*/
function function_38a8c5b0()
{
	var_8a410fc2 = snd::emitter("vox_walla_dutch_panic_male_01", (20908, 15773, 384), [1:18, 0:9]);
	var_4f6c19d9 = snd::emitter("vox_walla_dutch_panic_male_01", (21149, 15036, 431), [1:18, 0:9]);
	var_d846afb3 = snd::emitter("vox_walla_dutch_panic_male_02", (21149, 15036, 431), [1:16, 0:8]);
	var_58582fd4 = snd::emitter("vox_walla_dutch_panic_male_02", (20374, 13316, 562), [1:16, 0:8]);
	var_ad0660af = snd::emitter("vox_walla_dutch_panic_fem_01", (21090, 15610, 389), [1:12, 0:4]);
	var_44428f29 = snd::emitter("vox_walla_dutch_panic_fem_01", (20287, 15342, 293), [1:12, 0:4]);
	var_f6ad3b43 = snd::emitter("vox_walla_dutch_panic_fem_02", (20684, 13376, 562), [1:20, 0:8]);
	var_7651ba9a = snd::emitter("vox_walla_dutch_panic_fem_02", (20888, 12627, 819), [1:20, 0:8]);
	var_5774b41c = snd::emitter("emt_border_collie_barking_dist", (20799, 15776, 369), [1:30, 0:15]);
	level flag::wait_till("raid_roof_complete");
	snd::stop(var_8a410fc2);
	snd::stop(var_4f6c19d9);
	snd::stop(var_d846afb3);
	snd::stop(var_ad0660af);
	snd::stop(var_44428f29);
	snd::stop(var_f6ad3b43);
	snd::stop(var_7651ba9a);
	snd::stop(var_5774b41c);
}

/*
	Name: function_fd7139f4
	Namespace: namespace_a052577e
	Checksum: 0x93324E19
	Offset: 0x1AE0
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function function_fd7139f4()
{
	music::setmusicstate("none");
	snd::play("evt_takedown_roofjump_slowmo");
	level waittill(#"hash_35a786f9d88a2e60");
	music::setmusicstate("3.0_interrogation");
}

/*
	Name: function_724cb241
	Namespace: namespace_a052577e
	Checksum: 0xD351922D
	Offset: 0x1B50
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function function_724cb241()
{
	music::setmusicstate("3.0_interrogation");
}

/*
	Name: function_a5d5a125
	Namespace: namespace_a052577e
	Checksum: 0x58A060EC
	Offset: 0x1B78
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function function_a5d5a125()
{
	music::setmusicstate("none");
}

/*
	Name: function_9ac81c6b
	Namespace: namespace_a052577e
	Checksum: 0x80F724D1
	Offset: 0x1BA0
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function function_9ac81c6b()
{
}

/*
	Name: function_c2eee241
	Namespace: namespace_a052577e
	Checksum: 0x6DD9288C
	Offset: 0x1BB0
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function function_c2eee241()
{
	snd::play("evt_tkdn_roof_slide");
}

/*
	Name: function_a7024b3c
	Namespace: namespace_a052577e
	Checksum: 0x80F724D1
	Offset: 0x1BD8
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function function_a7024b3c()
{
}

/*
	Name: function_e88f8edb
	Namespace: namespace_a052577e
	Checksum: 0x4AEA38D2
	Offset: 0x1BE8
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_e88f8edb()
{
	wait(5);
	music::playstinger("3.1_throw_stinger");
}

/*
	Name: function_60c0a46b
	Namespace: namespace_a052577e
	Checksum: 0x756B6BA
	Offset: 0x1C18
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_60c0a46b()
{
	snd::play("evt_transition_roof_to_airfield_camera_pt1");
	snd::function_7db65a93("cp_takedown_raid_af_transition");
}

/*
	Name: function_7c1cb9f9
	Namespace: namespace_a052577e
	Checksum: 0x9A0FFAC8
	Offset: 0x1C58
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_7c1cb9f9()
{
	snd::play("evt_transition_roof_to_airfield_camera_pt2");
	snd::function_7db65a93("cp_takedown_raid_af_transition_complete");
}

/*
	Name: function_dd4c9710
	Namespace: namespace_a052577e
	Checksum: 0x763C77AB
	Offset: 0x1C98
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function function_dd4c9710()
{
	snd::waitforplayers();
	snd::function_7db65a93("hit3_fadein");
	flag::wait_till("af_fade_in_complete");
	snd::function_7db65a93("af_intro_done");
}

/*
	Name: function_92a6fd6a
	Namespace: namespace_a052577e
	Checksum: 0xF2005869
	Offset: 0x1D00
	Size: 0xA8
	Parameters: 1
	Flags: Linked
*/
function function_92a6fd6a(planes)
{
	foreach(plane in snd::function_f218bff5(planes))
	{
		snd::function_b23661d5(plane, "af_flyover");
	}
}

/*
	Name: function_a42cfb58
	Namespace: namespace_a052577e
	Checksum: 0x8F40620
	Offset: 0x1DB0
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_a42cfb58()
{
	snd::waitforplayers();
	music::playstinger("b1.5_airfield_reveal");
	snd::function_7db65a93("plane_idle");
}

/*
	Name: function_4074e9b1
	Namespace: namespace_a052577e
	Checksum: 0xAB4F625
	Offset: 0x1E00
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_4074e9b1()
{
	music::setmusicstate("b5.0_battle");
	snd::function_7db65a93("plane_chase_music");
}

/*
	Name: function_79270d32
	Namespace: namespace_a052577e
	Checksum: 0x15BC9658
	Offset: 0x1E40
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function function_79270d32()
{
	music::setmusicstate("b5.0_battle");
}

/*
	Name: function_bbedb5ab
	Namespace: namespace_a052577e
	Checksum: 0x94E260F6
	Offset: 0x1E68
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_bbedb5ab()
{
	wait(2.5);
	level.var_79f25ee7 = snd::play("quad_tkd_chase_ricochets_front_lp");
}

/*
	Name: function_7bd72cc0
	Namespace: namespace_a052577e
	Checksum: 0xB1B5940
	Offset: 0x1EA0
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function function_7bd72cc0()
{
	music::setmusicstate("mus_b6.0_rc_loop_0");
}

/*
	Name: function_b3b2671a
	Namespace: namespace_a052577e
	Checksum: 0xB5EBAAD4
	Offset: 0x1EC8
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function function_b3b2671a(player)
{
	snd::stop(level.var_79f25ee7);
	level waittill(#"hash_2b34ed034183965");
	snd::play("wpn_tkd_rcxd_start_trans");
	player waittill(#"blow_rc_car");
	snd::play("wpn_tkd_rcxd_detonate_trigger", [1:"tag_fx_light_rear", 0:level.var_e561515d]);
	level music::setmusicstate("none");
}

/*
	Name: function_1e281573
	Namespace: namespace_a052577e
	Checksum: 0x1AE24DAD
	Offset: 0x1FA0
	Size: 0x168
	Parameters: 0
	Flags: Linked
*/
function function_1e281573()
{
	while(!scene::is_ready("scene_tkd_hit3_chase_plane"))
	{
		waitframe(2);
	}
	flag::wait_till("af_plane_raise_gate");
	var_bfefe09c = snd::function_33ccce67("scene_tkd_hit3_chase_plane", 1);
	foreach(ent in var_bfefe09c)
	{
		if(isdefined(ent) && isdefined(ent.model))
		{
			if(ent.model == #"p9_container_armory_crate_01_dust_dustable_fx" || ent.model == #"p9_crate_wood_01_short_fx" || ent.model == #"p9_slu_pallet_wood_01_gray_fx")
			{
				snd::function_b23661d5(ent, "cargo_debris");
			}
		}
	}
}

/*
	Name: function_3dbad6f5
	Namespace: namespace_a052577e
	Checksum: 0xE0977E3C
	Offset: 0x2110
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function function_3dbad6f5()
{
	snd::function_7db65a93("af_skid_starting");
}

/*
	Name: function_32f20d13
	Namespace: namespace_a052577e
	Checksum: 0x4E246ECA
	Offset: 0x2138
	Size: 0x14
	Parameters: 1
	Flags: Linked
*/
function function_32f20d13(veh)
{
	wait(0.15);
}

/*
	Name: function_fc52119f
	Namespace: namespace_a052577e
	Checksum: 0x86455C78
	Offset: 0x2158
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function function_fc52119f()
{
	snd::function_7db65a93("af_wreck");
}

/*
	Name: function_bee54a20
	Namespace: namespace_a052577e
	Checksum: 0x2827B712
	Offset: 0x2180
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_bee54a20()
{
	wait(0.4);
	snd::play("evt_tkd_wreck_unconscious_whoosh", level.player);
}

/*
	Name: function_cbae87a2
	Namespace: namespace_a052577e
	Checksum: 0x352266D4
	Offset: 0x21B8
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function function_cbae87a2()
{
	snd::function_7db65a93("af_wreck_amb");
	level flag::wait_till("tkdn_af_wreck_completed");
	snd::function_7db65a93("af_wreck_amb_end");
}

/*
	Name: function_4788a209
	Namespace: namespace_a052577e
	Checksum: 0x9764111F
	Offset: 0x2218
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function function_4788a209()
{
	snd::function_7db65a93("end_fadeout");
}

