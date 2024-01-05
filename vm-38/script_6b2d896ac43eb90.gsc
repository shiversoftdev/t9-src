#using script_6155d71e1c9a57eb;
#using script_215d7818c548cb51;
#using script_cf3d8fde2407bb1;
#using script_1287f54612f9bfce;
#using script_5fb26eef020f9958;
#using script_55b68e9c3e3a915b;
#using script_5a8a1aa32dea1a04;
#using script_613bf3e46dacdcfc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_player.gsc;
#using script_669400ff5aadcc83;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_fasttravel.gsc;
#using scripts\zm_common\zm_blockers.gsc;
#using script_3ddf84b7bb3bf47d;
#using script_7d7ac1f663edcdc8;
#using script_799de24f8ad427f7;
#using script_1029986e2bc8ca8e;
#using scripts\core_common\player\player_free_fall.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\popups_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using script_7fc996fe8678852;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace namespace_dbb31ff3;

/*
	Name: function_a0caff93
	Namespace: namespace_dbb31ff3
	Checksum: 0x1A37A5B
	Offset: 0x288
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a0caff93()
{
	level notify(-422243524);
}

/*
	Name: main
	Namespace: namespace_dbb31ff3
	Checksum: 0x654E0681
	Offset: 0x2A8
	Size: 0xB4
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	level.var_8bef1f53 = sr_beacon_menu::register();
	clientfield::register("toplayer", "" + #"hash_5616eb8cc6b9c498", 1, 1, "counter");
	clientfield::register("toplayer", "" + #"hash_5752601fd90562e1", 1, 1, "counter");
	namespace_52c8f34d::function_70a657d8();
}

/*
	Name: function_67dce9cd
	Namespace: namespace_dbb31ff3
	Checksum: 0xF74A65F1
	Offset: 0x368
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_67dce9cd(var_beee4994)
{
	s_beacon = var_beee4994[0];
	if(isdefined(s_beacon))
	{
		level thread function_e28ce6d9(s_beacon);
	}
}

/*
	Name: function_e28ce6d9
	Namespace: namespace_dbb31ff3
	Checksum: 0xC7770174
	Offset: 0x3B0
	Size: 0x2AC
	Parameters: 1
	Flags: Linked
*/
function function_e28ce6d9(struct)
{
	var_6afa034c = namespace_8b6a9d79::spawn_script_model(struct, #"hash_31be7c895b8fbf9b", 1);
	var_6afa034c thread scene::play(#"hash_6882ad84073eaa8d", var_6afa034c);
	var_6afa034c hidepart("screen_portal_jnt");
	var_6afa034c hidepart("screen_exfil_jnt");
	struct.objid = zm_utility::function_f5a222a8(#"hash_788f637c735eb34d", var_6afa034c);
	var_6afa034c clientfield::set("item_machine_spawn_rob", 1);
	var_6afa034c.objectiveid = struct.objid;
	v_trigger_offset = vectorscale((0, 0, 1), 32);
	trigger = namespace_8b6a9d79::function_214737c7(struct, &function_1fab9ee0, #"hash_48951800c1051da7", undefined, 100, undefined, undefined, v_trigger_offset);
	trigger.var_9d7362a4 = #"hash_48951800c1051da7";
	trigger usetriggerrequirelookat(0);
	struct zm_utility::function_747180ea(struct.objid, undefined, trigger);
	trigger.scriptmodel = var_6afa034c;
	var_6afa034c.trigger = trigger;
	if(zm_utility::is_survival())
	{
		level thread zm_utility::clear_vehicles(var_6afa034c);
	}
	level.var_1ea1d494 = trigger;
	s_result = undefined;
	s_result = level waittill(#"hash_3e765c26047c9f54", #"hash_345e9169ebba28fb");
	var_6afa034c thread function_22aada64();
	struct zm_utility::function_48d9a9c9();
	zm_utility::function_bc5a54a8(struct.objid);
	var_6afa034c.objectiveid = undefined;
	trigger delete();
}

/*
	Name: function_1fab9ee0
	Namespace: namespace_dbb31ff3
	Checksum: 0x2167F7EB
	Offset: 0x668
	Size: 0x13C
	Parameters: 1
	Flags: Linked
*/
function function_1fab9ee0(eventstruct)
{
	player = eventstruct.activator;
	machine = self.scriptmodel;
	/#
		assert(isdefined(machine), "");
	#/
	if(isplayer(player) && !level flag::get(#"hash_23350b678001fece"))
	{
		if(!level.var_8bef1f53 sr_beacon_menu::is_open(player) && !player clientfield::get_player_uimodel("hudItems.srOverlayOpen"))
		{
			player notify(#"hash_5f178db4550eeae9");
			level.var_8bef1f53 sr_beacon_menu::open(player, 0);
			player thread function_21ba74a1(machine, self);
			player namespace_553954de::function_14bada94();
		}
	}
}

/*
	Name: function_6c71e778
	Namespace: namespace_dbb31ff3
	Checksum: 0xF4063E9D
	Offset: 0x7B0
	Size: 0x18E
	Parameters: 3
	Flags: Linked
*/
function function_6c71e778(machine, trigger, var_4bbc024b)
{
	if(!isdefined(var_4bbc024b))
	{
		var_4bbc024b = 0;
	}
	if(!isplayer(self) || !isdefined(level.var_8bef1f53))
	{
		return;
	}
	if(!is_true(var_4bbc024b))
	{
		if(isdefined(machine) && isdefined(trigger))
		{
			str_hint = #"hash_48951800c1051da7";
			trigger sethintstringforplayer(self, str_hint);
			if(isdefined(machine.objectiveid))
			{
				objective_setvisibletoplayer(machine.objectiveid, self);
				zm_utility::function_e8f4d47b(self, machine.objectiveid, 0);
			}
		}
	}
	if(level.var_8bef1f53 sr_beacon_menu::is_open(self) && self clientfield::get_player_uimodel("hudItems.srOverlayOpen"))
	{
		level.var_8bef1f53 sr_beacon_menu::close(self);
		self namespace_553954de::function_548f282();
	}
	self notify(#"hash_11ed79645f6768e1");
}

/*
	Name: function_755edc7e
	Namespace: namespace_dbb31ff3
	Checksum: 0xEA20883A
	Offset: 0x948
	Size: 0x124
	Parameters: 2
	Flags: Linked
*/
function function_755edc7e(machine, trigger)
{
	self endon(#"disconnect", #"death", #"hash_11ed79645f6768e1");
	start_origin = self.origin;
	while(distance2d(self.origin, start_origin) < 32 && !self laststand::player_is_in_laststand() && !self isinvehicle())
	{
		waitframe(1);
		if(!isdefined(machine))
		{
			break;
		}
	}
	if(level.var_8bef1f53 sr_beacon_menu::is_open(self) && self clientfield::get_player_uimodel("hudItems.srOverlayOpen"))
	{
		self function_6c71e778(machine, trigger);
	}
}

/*
	Name: function_8319d39
	Namespace: namespace_dbb31ff3
	Checksum: 0x568E0F26
	Offset: 0xA78
	Size: 0xAC
	Parameters: 0
	Flags: Linked
*/
function function_8319d39()
{
	self notify(#"hash_5f178db4550eeae9");
	level.var_2457162c sr_weapon_upgrade_menu::close(self);
	level.var_5df76d0 sr_perk_machine_choice::close(self);
	level.var_2a994cc0 sr_armor_menu::close(self);
	level.var_3ed9fd33 sr_crafting_table_menu::close(self);
	self namespace_553954de::function_548f282();
}

/*
	Name: function_7b3dca17
	Namespace: namespace_dbb31ff3
	Checksum: 0x71E77CAA
	Offset: 0xB30
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function function_7b3dca17(s_spawn)
{
	self function_8319d39();
	level.var_f3901984 = 5;
	self zm_fasttravel::function_66d020b0(undefined, undefined, undefined, "survival_next_dest", s_spawn, undefined, undefined, 1, 1, undefined, undefined, 1);
}

/*
	Name: function_2f7447a7
	Namespace: namespace_dbb31ff3
	Checksum: 0xA06DD683
	Offset: 0xBA8
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_2f7447a7(var_6afa034c)
{
	var_6afa034c scene::stop(#"hash_6882ad84073eaa8d");
	var_6afa034c scene::play(#"hash_6882ad84073eaa8d", "Shot 2", var_6afa034c);
}

/*
	Name: warp
	Namespace: namespace_dbb31ff3
	Checksum: 0x398245BC
	Offset: 0xC08
	Size: 0x6E8
	Parameters: 1
	Flags: Linked
*/
function warp(var_6afa034c)
{
	if(level flag::get(#"hash_23350b678001fece"))
	{
		return;
	}
	level flag::set(#"hash_23350b678001fece");
	if(getgametypesetting(#"hash_704e4a94667cfe72"))
	{
		var_8e862768 = namespace_af5c1c0c::function_c65468ef(self, #"hash_2ab4a12f6a32c41a", #"hash_4ef08498325828d6");
		if(!var_8e862768)
		{
			level flag::clear(#"hash_23350b678001fece");
			self function_6c71e778(var_6afa034c, var_6afa034c.trigger);
			return;
		}
	}
	if(isdefined(level.var_fdcaf3a6))
	{
		level flag::clear(#"hash_23350b678001fece");
		return;
	}
	var_6afa034c showpart("screen_portal_jnt");
	foreach(player in getplayers())
	{
		player zm_stats::function_945c7ce2(#"hash_1a5bd2708defa02b", 1);
		player chopper_gunner::function_24fbd61e();
		player clientfield::increment_to_player("" + #"hash_5616eb8cc6b9c498", 1);
	}
	destination = level.var_7d45d0d4.var_d60029a6[level.var_7d45d0d4.destinationindex];
	level thread zm_destination_manager::function_ab94c270(destination);
	function_526a0df4(destination.targetname);
	level.var_fe6ca5e8 = 1;
	level notify(#"hash_29edd9425510b40d");
	level thread function_2f7447a7(var_6afa034c);
	if(zm_utility::is_survival())
	{
		changeadvertisedstatus(0);
	}
	objective_manager::start_timer(10);
	objective_manager::function_a8ad6895(destination);
	var_b2e24cfc = zm_destination_manager::function_f3be07d7(destination);
	/#
		assert(var_b2e24cfc.size >= 4, "" + destination.targetname);
	#/
	level flag::clear(#"hash_23350b678001fece");
	level notify(#"hash_345e9169ebba28fb");
	level.var_fe6ca5e8 = undefined;
	namespace_9b972177::function_5a47adab("capsule_teleport");
	if(!isdefined(level.var_16fecec8))
	{
		level.var_16fecec8 = 1;
	}
	foreach(player in getplayers())
	{
		if(isalive(player))
		{
			player player_free_fall::allow_player_basejumping(0);
			if(zm_utility::is_survival() && player laststand::player_is_in_laststand())
			{
				player thread zm_laststand::auto_revive(self);
			}
			player thread function_7b3dca17(var_b2e24cfc[0]);
			if(var_b2e24cfc.size > 1)
			{
				arrayremoveindex(var_b2e24cfc, 0, 0);
			}
			player.var_5d80a93b = player getcurrentweapon();
		}
	}
	var_e8f53400 = 1;
	while(var_e8f53400)
	{
		var_e8f53400 = 0;
		foreach(player in getplayers())
		{
			if(is_true(player.var_16735873))
			{
				var_e8f53400 = 1;
				break;
			}
		}
		if(!var_e8f53400)
		{
			break;
		}
		wait(1);
	}
	wait(1);
	foreach(player in getplayers())
	{
		player player_free_fall::allow_player_basejumping(1);
		player clientfield::increment_to_player("" + #"hash_5752601fd90562e1", 1);
	}
}

/*
	Name: call_exfil
	Namespace: namespace_dbb31ff3
	Checksum: 0xB7E212BE
	Offset: 0x12F8
	Size: 0x1DC
	Parameters: 1
	Flags: Linked
*/
function call_exfil(var_6afa034c)
{
	if(level flag::get(#"hash_23350b678001fece"))
	{
		return;
	}
	level flag::set(#"hash_23350b678001fece");
	streamermodelhint(#"p9_fxanim_zm_ndu_essence_bomb_body_mod", 45);
	streamermodelhint(#"hash_56de86439bdb98e2", 45);
	if(getgametypesetting(#"hash_704e4a94667cfe72"))
	{
		var_8e862768 = namespace_af5c1c0c::function_c65468ef(self, #"hash_575d68cca86c8df4", #"hash_37a354c147ec32f0");
		if(!var_8e862768)
		{
			level flag::clear(#"hash_23350b678001fece");
			self function_6c71e778(var_6afa034c, var_6afa034c.trigger);
			return;
		}
	}
	if(isplayer(self))
	{
		self thread zm_vo::function_d342796e(#"hash_7e50fb36129dc24b", 1.5);
	}
	var_6afa034c showpart("screen_exfil_jnt");
	self destroy_beacon(var_6afa034c);
	level flag::set(#"hash_3e765c26047c9f54");
}

/*
	Name: function_21ba74a1
	Namespace: namespace_dbb31ff3
	Checksum: 0xA16D877A
	Offset: 0x14E0
	Size: 0x266
	Parameters: 2
	Flags: Linked
*/
function function_21ba74a1(machine, trigger)
{
	self endon(#"hash_5f178db4550eeae9");
	trigger sethintstringforplayer(self, "");
	if(isdefined(machine.objectiveid))
	{
		zm_utility::function_e8f4d47b(self, machine.objectiveid, 1);
		objective_setinvisibletoplayer(machine.objectiveid, self);
	}
	self endoncallback(&function_6c71e778, #"death");
	self thread function_755edc7e(machine, trigger);
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"menuresponse");
		menu = waitresult.menu;
		response = waitresult.response;
		if(menu == #"sr_beacon_menu")
		{
			switch(waitresult.response)
			{
				case "hash_4d6bf94bcefe50c0":
				{
					self notify(#"hash_11ed79645f6768e1");
					self function_6c71e778(machine, trigger, 1);
					self thread warp(machine);
					return;
				}
				case "hash_a1f795a11ddf7be":
				{
					self notify(#"hash_11ed79645f6768e1");
					self function_6c71e778(machine, trigger, 1);
					self thread call_exfil(machine);
					return;
				}
				case "hash_383c519d3bdac984":
				{
					self notify(#"hash_11ed79645f6768e1");
					self function_6c71e778(machine, trigger);
					return;
				}
			}
		}
	}
}

/*
	Name: destroy_beacon
	Namespace: namespace_dbb31ff3
	Checksum: 0x85DC49B3
	Offset: 0x1750
	Size: 0x3BC
	Parameters: 1
	Flags: Linked
*/
function destroy_beacon(var_6afa034c)
{
	var_62157006 = "screen_exfil_jnt";
	var_f6aedcc6 = var_6afa034c gettagorigin(var_62157006);
	v_tag_angles = var_6afa034c gettagangles(var_62157006);
	var_668819de = axistoangles(anglestoright(v_tag_angles), anglestoforward(v_tag_angles));
	bomb = util::spawn_model(#"p9_fxanim_zm_ndu_essence_bomb_body_mod", var_f6aedcc6, var_668819de);
	bomb playsound(#"hash_443ef0b39a1f5414");
	bomb linkto(var_6afa034c, var_62157006);
	level thread scene::init_streamer(#"hash_7e592c9a3df1e17e", getplayers(), 0, 0);
	timer = int(10);
	while(timer)
	{
		var_19719503 = 0;
		var_67c95546 = int(timer / 60);
		var_16782a41 = int((timer % 60) / 10);
		var_b30bc24e = (timer % 60) % 10;
		bomb thread zm_blockers::function_e02a26f6();
		bomb showpart("tag_slot1_digi_" + var_19719503);
		bomb showpart("tag_slot2_digi_" + var_67c95546);
		bomb showpart("tag_slot3_digi_" + var_16782a41);
		bomb showpart("tag_slot4_digi_" + var_b30bc24e);
		bomb showpart("tag_sign");
		wait(0.5);
		bomb hidepart("tag_sign");
		wait(0.5);
		timer = timer - 1;
		/#
			iprintlnbold(timer);
		#/
	}
	bomb playsound(#"hash_6842dcc160b4c6de");
	bomb delete();
	self zm_blockers::function_c1342dc1();
	var_6afa034c setmodel(#"hash_56de86439bdb98e2");
	var_6afa034c scene::stop(#"hash_6882ad84073eaa8d");
	var_6afa034c scene::play(#"hash_7e592c9a3df1e17e", var_6afa034c);
}

/*
	Name: function_22aada64
	Namespace: namespace_dbb31ff3
	Checksum: 0xE30CE322
	Offset: 0x1B18
	Size: 0x164
	Parameters: 0
	Flags: Linked
*/
function function_22aada64()
{
	if(level.var_b48509f9 > 4 || isdefined(level.var_fdcaf3a6))
	{
		return;
	}
	self endon(#"death");
	self val::set(#"beacon", "takedamage", 1);
	self val::set(#"beacon", "allowdeath", 0);
	n_damage = 0;
	n_threshold = (1000 * getplayers().size) * level.var_b48509f9;
	while(true)
	{
		s_result = undefined;
		s_result = self waittill(#"damage");
		n_damage = n_damage + s_result.amount;
		if(n_damage > n_threshold)
		{
			namespace_553954de::function_7c97e961(level.var_b48509f9 + 2);
			self val::reset_all(#"beacon");
			break;
		}
	}
}

