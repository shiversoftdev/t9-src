#using script_14f4a3c583c77d4b;
#using script_3cebb48c37fc271;
#using script_3f9e0dc8454d98e1;
#using script_42b51e4a369b0f95;
#using script_43ce7284919bced2;
#using script_4ce5d94e8c797350;
#using script_52c6c2d1a2ef1b46;
#using script_5bb072c3abf4652c;
#using script_6d148b720e2af260;
#using script_7224d61ed502ea07;
#using script_7b1cd3908a825fdd;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\load_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\gametypes\globallogic.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_power.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;

#namespace namespace_471b2690;

/*
	Name: function_fd0a4d89
	Namespace: namespace_471b2690
	Checksum: 0x6E94D9DE
	Offset: 0x498
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_fd0a4d89()
{
	level notify(438151287);
}

/*
	Name: init
	Namespace: namespace_471b2690
	Checksum: 0xA28E93D0
	Offset: 0x4B8
	Size: 0x8F8
	Parameters: 0
	Flags: Linked
*/
function init()
{
	/#
		level thread function_cd7a3de4();
	#/
	level.var_e0c7b4b2 = getent("hind_trap_base_01", "targetname");
	level.var_e0c7b4b2.var_df4d758d = getent("hind_trap_base_02", "targetname");
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2 = getent("hind_trap_base_03", "targetname");
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper = getent("hind_trap_chopper", "targetname");
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.rotor = getent("hind_trap_rotor", "targetname");
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.tail_rotor = getent("hind_trap_tail_rotor", "targetname");
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.var_15ba53f8 = getent("hind_trap_chopper_turret_base", "targetname");
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.var_15ba53f8.turret_barrel = getent("hind_trap_chopper_turret_barrel", "targetname");
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper linkto(level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2);
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.rotor linkto(level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper);
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.tail_rotor linkto(level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper);
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.var_15ba53f8 linkto(level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper);
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.var_15ba53f8.turret_barrel linkto(level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.var_15ba53f8);
	level.var_e0c7b4b2.move_speed = 100;
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.var_e0159e34 = 10;
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.var_e0159e34 = 10;
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.var_15ba53f8.var_e0159e34 = 60;
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.var_15ba53f8.turret_barrel.var_e0159e34 = 60;
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.rotor.rotate_speed = 0;
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.rotor.var_e558e669 = 0.03;
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.rotor.var_2b247bb5 = 0.07;
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.rotor.var_c7395e63 = 20;
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.tail_rotor.rotate_speed = 0;
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.tail_rotor.var_e558e669 = 0.03;
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.tail_rotor.var_2b247bb5 = 0.07;
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.tail_rotor.var_c7395e63 = 60;
	level flag::wait_till(#"start_zombie_round_logic");
	level.var_94185ac9 = [14:"zone_anytown_usa_backlot", 13:"zone_anytown_usa_rooftops", 12:"zone_video_store_roof", 11:"zone_video_store", 10:"zone_anytown_usa_west_2", 9:"zone_cinema", 8:"zone_concessions", 7:"zone_burger_town", 6:"zone_burger_town_roof", 5:"zone_drinks_bar_roof", 4:"zone_drinks_bar", 3:"zone_anytown_usa_east_2", 2:"zone_tv_repair", 1:"zone_anytown_usa_east", 0:"zone_anytown_usa_west"];
	level.var_6bfd8427 = struct::get_array("ht_trigger", "targetname");
	level.var_6bfd8427 array::thread_all(level.var_6bfd8427, &function_3c3b85e6);
	level.var_81aa2a00 = getentarray("hind_trap_switch", "targetname");
	level.var_842b7e4b = getentarray("hind_trap_switch_light", "targetname");
	for(i = 0; i < level.var_81aa2a00.size; i++)
	{
		level.var_81aa2a00[i] clientfield::set("set_compass_icon", 1);
		level.var_81aa2a00[i].var_d6b3b6e0 = level.var_842b7e4b[i];
	}
	level.var_81aa2a00 array::thread_all(level.var_81aa2a00, &function_f13155cb);
	zm::register_actor_damage_callback(&function_2db7dc3);
	level.var_217aad9f = 0;
}

/*
	Name: function_f13155cb
	Namespace: namespace_471b2690
	Checksum: 0x37C4932B
	Offset: 0xDB8
	Size: 0xDC
	Parameters: 0
	Flags: Linked
*/
function function_f13155cb()
{
	self.var_fdec2822 = util::spawn_model(#"p8_zm_off_trap_switch_handle", self gettagorigin("tag_up"), self.angles);
	self function_7265ebeb(undefined);
	level flag::wait_till("power_on");
	self function_7265ebeb(1);
	self.var_d6b3b6e0 clientfield::set("" + #"hash_16e5e4d2ea0716b7", 2);
}

/*
	Name: function_3c3b85e6
	Namespace: namespace_471b2690
	Checksum: 0x2CBA88AC
	Offset: 0xEA0
	Size: 0x4A
	Parameters: 0
	Flags: Linked
*/
function function_3c3b85e6()
{
	switch_trigger = self zm_unitrigger::create(&function_5db5b22e, 32, &function_477e5e68);
	switch_trigger.var_4326facc = self;
}

/*
	Name: function_7265ebeb
	Namespace: namespace_471b2690
	Checksum: 0x3F6067E1
	Offset: 0xEF8
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function function_7265ebeb(b_on)
{
	if(isdefined(b_on))
	{
		if(b_on)
		{
			self.var_d6b3b6e0 setmodel(#"p8_zm_off_trap_switch_light_green_on");
		}
		else
		{
			self.var_d6b3b6e0 setmodel(#"p8_zm_off_trap_switch_light_red_on");
		}
	}
	else
	{
		self.var_d6b3b6e0 setmodel(#"p8_zm_off_trap_switch_light");
	}
}

/*
	Name: function_5db5b22e
	Namespace: namespace_471b2690
	Checksum: 0xB91260D5
	Offset: 0xFA8
	Size: 0x1B8
	Parameters: 1
	Flags: Linked
*/
function function_5db5b22e(e_player)
{
	if(isplayer(e_player) && e_player istouching(self))
	{
		if(!level flag::get("power_on"))
		{
			self sethintstring(#"hash_71158766520dc432");
			return true;
		}
		if(level flag::get(#"hash_6ca7775f1a984c68"))
		{
			self sethintstring(#"hash_3f04de589d21e4fa");
			return true;
		}
		if(level flag::get(#"hash_3b32dd943e760a34"))
		{
			self sethintstring(#"hash_35fd3b64405b6eca");
			return true;
		}
		self sethintstring(#"hash_2629a4ab98a94d73", 2000);
		if(!e_player zm_score::can_player_purchase(2000))
		{
			e_player globallogic::function_d1924f29(#"hash_6e3ae7967dc5d414");
			e_player.var_e62ad24a = self;
		}
		return true;
	}
	if(e_player.var_e62ad24a === self)
	{
		e_player globallogic::function_d96c031e();
		e_player.var_e62ad24a = undefined;
	}
	return false;
}

/*
	Name: function_477e5e68
	Namespace: namespace_471b2690
	Checksum: 0x5A5103EE
	Offset: 0x1168
	Size: 0x150
	Parameters: 0
	Flags: Linked
*/
function function_477e5e68()
{
	level endon(#"end_game");
	while(true)
	{
		result = undefined;
		result = self waittill(#"trigger");
		if(!level flag::get("power_on") || level flag::get(#"hash_3b32dd943e760a34") || level flag::get(#"hash_6ca7775f1a984c68"))
		{
			continue;
		}
		if(result.activator zm_score::can_player_purchase(2000))
		{
			result.activator thread zm_score::minus_to_player_score(2000);
			level.var_81aa2a00 array::thread_all(level.var_81aa2a00, &function_4eaecff9);
			level function_795e2881(result.activator);
		}
	}
}

/*
	Name: function_4eaecff9
	Namespace: namespace_471b2690
	Checksum: 0xD49DCEAF
	Offset: 0x12C0
	Size: 0x11C
	Parameters: 0
	Flags: Linked
*/
function function_4eaecff9()
{
	self playsound(#"hash_7ef6b2ee20c71968");
	self.var_fdec2822 rotateto(self.angles + vectorscale((1, 0, 0), 179), 0.3);
	self playsound(#"hash_137dbe10929df4eb");
	self.var_fdec2822 waittill(#"rotatedone");
	self function_7265ebeb(0);
	self.var_fdec2822 clientfield::increment("" + #"hash_575d68a64ff032b2", 1);
	self.var_d6b3b6e0 clientfield::set("" + #"hash_16e5e4d2ea0716b7", 1);
}

/*
	Name: function_b53f905a
	Namespace: namespace_471b2690
	Checksum: 0xF89D48F1
	Offset: 0x13E8
	Size: 0xD4
	Parameters: 0
	Flags: Linked
*/
function function_b53f905a()
{
	self.var_fdec2822 rotateto(self.angles + vectorscale((1, 0, 0), 90), 0.3);
	self playsound(#"hash_5c08d7c4ad20f4b8");
	wait(0.3);
	self playsound(#"hash_7744ef898bf5b90e");
	self function_7265ebeb(0);
	self.var_d6b3b6e0 clientfield::set("" + #"hash_16e5e4d2ea0716b7", 1);
}

/*
	Name: function_795e2881
	Namespace: namespace_471b2690
	Checksum: 0x1D1D4384
	Offset: 0x14C8
	Size: 0x2A4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_795e2881(e_owner)
{
	level.var_6f8aa603 = e_owner;
	level.var_dc7ff908 = function_c7e1db4();
	level thread function_e0beead2();
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper playsound(#"hash_5364b119bbfae35e");
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper playloopsound(#"hash_40631d599798f4d4");
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper thread zm_vo::function_d6f8bbd9(#"hash_1a2c45fc8a9c904f");
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.var_15ba53f8 playsound(#"hash_4f6cc741c5b656bd");
	level.var_e0c7b4b2 thread function_a688a771();
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.rotor thread function_44456e3f("top_rotor");
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.tail_rotor thread function_44456e3f("tail_rotor");
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.var_15ba53f8.turret_barrel thread function_d4782b16();
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.var_15ba53f8.turret_barrel laseron();
	callback::on_ai_killed(&function_8004c21d);
	level thread function_8ff4b970();
}

/*
	Name: function_55484248
	Namespace: namespace_471b2690
	Checksum: 0x5F5CF323
	Offset: 0x1778
	Size: 0x2FC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_55484248()
{
	level.var_6f8aa603 = undefined;
	level.var_dc7ff908 = undefined;
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.var_15ba53f8.turret_barrel.my_target = undefined;
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper thread zm_vo::function_d6f8bbd9(#"hash_787bffbad79a5c18");
	if(level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.var_15ba53f8.turret_barrel flag::get(#"hash_6783a838342e2900"))
	{
		level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.var_15ba53f8.turret_barrel flag::clear(#"hash_6783a838342e2900");
	}
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.rotor thread function_c60c6664("top_rotor");
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.tail_rotor thread function_c60c6664("tail_rotor");
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.var_15ba53f8.turret_barrel laseroff();
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper playsound(#"hash_190dcd3c162ebde6");
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper stoploopsound();
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2 stoploopsound();
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.var_4d30df70 = 0;
	level notify(#"hash_d85bf2288b3c1c3");
	callback::remove_on_ai_killed(&function_8004c21d);
	level thread function_d7e75506();
}

/*
	Name: function_9f433625
	Namespace: namespace_471b2690
	Checksum: 0x4FBB64A2
	Offset: 0x1A80
	Size: 0xA4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_9f433625()
{
	self.var_fdec2822 rotateto(self.angles, 0.3);
	self playsound(#"hash_59680d123025c6f0");
	wait(0.3);
	self function_7265ebeb(1);
	self.var_d6b3b6e0 clientfield::set("" + #"hash_16e5e4d2ea0716b7", 2);
}

/*
	Name: function_8ff4b970
	Namespace: namespace_471b2690
	Checksum: 0xBEFA52C6
	Offset: 0x1B30
	Size: 0xAC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ff4b970()
{
	level endon(#"end_game");
	level flag::set(#"hash_6ca7775f1a984c68");
	wait(50);
	level flag::clear(#"hash_6ca7775f1a984c68");
	level.var_81aa2a00 array::thread_all(level.var_81aa2a00, &function_b53f905a);
	level function_55484248();
}

/*
	Name: function_d7e75506
	Namespace: namespace_471b2690
	Checksum: 0x4E63A35E
	Offset: 0x1BE8
	Size: 0xA4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d7e75506()
{
	level endon(#"end_game", #"hash_579f5585446dafb2");
	level flag::set(#"hash_3b32dd943e760a34");
	wait(60);
	level flag::clear(#"hash_3b32dd943e760a34");
	level.var_81aa2a00 array::thread_all(level.var_81aa2a00, &function_9f433625);
}

/*
	Name: function_a688a771
	Namespace: namespace_471b2690
	Checksum: 0xB22E2AB6
	Offset: 0x1C98
	Size: 0x330
	Parameters: 0
	Flags: Linked, Private
*/
function private function_a688a771()
{
	level endon(#"end_game", #"hash_3b32dd943e760a34");
	if(!isdefined(level.var_e0c7b4b2.var_4d30df70))
	{
		level.var_e0c7b4b2.var_4d30df70 = 0;
	}
	self thread function_46d03b27();
	while(true)
	{
		if(level.var_e0c7b4b2 function_fa889b40())
		{
			if(level.var_e0c7b4b2.origin[0] > level.var_dc7ff908.origin[0])
			{
				var_b3b98b6b = level.var_dc7ff908.origin[0] + 800;
			}
			else
			{
				var_b3b98b6b = level.var_dc7ff908.origin[0] - 800;
			}
			if(level.var_e0c7b4b2.var_df4d758d.origin[1] > level.var_dc7ff908.origin[1])
			{
				var_c5ef2fd6 = level.var_dc7ff908.origin[1] + 400;
			}
			else
			{
				var_c5ef2fd6 = level.var_dc7ff908.origin[1] - 400;
			}
			var_b3b98b6b = math::clamp(var_b3b98b6b, 2400, 5600);
			var_c5ef2fd6 = math::clamp(var_c5ef2fd6, 1850, 3000);
			var_e613ab2e = (var_b3b98b6b, self.origin[1], self.origin[2]);
			var_2aa484b2 = (var_b3b98b6b, var_c5ef2fd6, self.var_df4d758d.origin[2]);
			var_7ac59e29 = (var_b3b98b6b, var_c5ef2fd6, self.var_df4d758d.var_3b09f1e2.origin[2]);
			move_time = distance2d(self.origin, var_e613ab2e) / self.move_speed;
			if(move_time > 0)
			{
				if(!level.var_e0c7b4b2.var_4d30df70)
				{
					level.var_e0c7b4b2.var_4d30df70 = 1;
					level.var_e0c7b4b2 thread function_8ada6fcd();
				}
				self moveto(var_e613ab2e, move_time);
				self.var_df4d758d moveto(var_2aa484b2, move_time);
				self.var_df4d758d.var_3b09f1e2 moveto(var_7ac59e29, move_time);
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_46d03b27
	Namespace: namespace_471b2690
	Checksum: 0x7A3E5ED6
	Offset: 0x1FD0
	Size: 0x4C8
	Parameters: 0
	Flags: Linked
*/
function function_46d03b27()
{
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.var_15ba53f8.turret_barrel rotateto(level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.var_15ba53f8.turret_barrel.angles, 0.1);
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.var_15ba53f8 rotateto(level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.var_15ba53f8.angles, 0.1);
	while(true)
	{
		if(level function_375ded2c())
		{
			var_43ed722a = vectortoangles(level.var_dc7ff908.origin - level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.origin);
			if(absangleclamp180(var_43ed722a[1] - level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.angles[1]) > 5)
			{
				if(!isalive(level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.var_15ba53f8.turret_barrel.my_target))
				{
					var_649dd690 = level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.var_e0159e34;
					level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.var_15ba53f8.turret_barrel thread function_96e00567(var_43ed722a, var_649dd690);
					level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.var_15ba53f8 thread function_96e00567(var_43ed722a, var_649dd690);
				}
				level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2 thread function_96e00567(var_43ed722a);
			}
			if(isalive(level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.var_15ba53f8.turret_barrel.my_target))
			{
				var_43ed722a = vectortoangles(level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.var_15ba53f8.turret_barrel.my_target.origin - level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.var_15ba53f8.turret_barrel.origin);
				level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.var_15ba53f8.turret_barrel thread function_96e00567(var_43ed722a, level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.var_15ba53f8.var_e0159e34);
				level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.var_15ba53f8 function_96e00567(var_43ed722a);
				level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.var_15ba53f8.turret_barrel function_883dd655(var_43ed722a);
			}
		}
		wait(0.5);
	}
}

/*
	Name: function_96e00567
	Namespace: namespace_471b2690
	Checksum: 0x7E2150CC
	Offset: 0x24A0
	Size: 0x244
	Parameters: 2
	Flags: Linked
*/
function function_96e00567(target_angles, speed)
{
	if(!isdefined(speed))
	{
		speed = self.var_e0159e34;
	}
	self notify("10642f543d04676d");
	self endon("10642f543d04676d");
	if(!isdefined(level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.var_4d30df70))
	{
		level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.var_4d30df70 = 0;
	}
	target_angles = (self.angles[0], target_angles[1], self.angles[2]);
	rotate_time = function_78344094(self.angles[1], target_angles[1], speed);
	if(rotate_time > 0.1)
	{
		self rotateto(target_angles, rotate_time);
		if(!level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.var_4d30df70)
		{
			level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.var_4d30df70 = 1;
			level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2 function_d2fe0c64(#"hash_8a4faf034e8b780");
		}
		wait(rotate_time);
	}
	else
	{
		self rotateto(target_angles, 0.1);
		if(level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.var_4d30df70)
		{
			level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.var_4d30df70 = 0;
			level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2 function_d1c78d29(#"hash_8a4faf034e8b780");
		}
		wait(0.1);
	}
}

/*
	Name: function_883dd655
	Namespace: namespace_471b2690
	Checksum: 0x4B7349FD
	Offset: 0x26F0
	Size: 0x8A
	Parameters: 1
	Flags: Linked
*/
function function_883dd655(var_43ed722a)
{
	rotate_time = function_78344094(self.angles[0], var_43ed722a[0], self.var_e0159e34);
	rotate_time = max(rotate_time, 0.1);
	self rotateto(var_43ed722a, rotate_time);
	wait(rotate_time);
}

/*
	Name: function_78344094
	Namespace: namespace_471b2690
	Checksum: 0x221DDFF4
	Offset: 0x2788
	Size: 0xAA
	Parameters: 3
	Flags: Linked
*/
function function_78344094(var_7b783ebb, var_43ed722a, speed)
{
	var_7b783ebb = (var_7b783ebb > 0 ? var_7b783ebb : var_7b783ebb + 360);
	var_43ed722a = (var_43ed722a > 0 ? var_43ed722a : var_43ed722a + 360);
	base_time = abs(var_7b783ebb - var_43ed722a);
	base_time = (base_time > 180 ? 360 - base_time : base_time) / speed;
	return base_time;
}

/*
	Name: function_fa889b40
	Namespace: namespace_471b2690
	Checksum: 0x4D823B1D
	Offset: 0x2840
	Size: 0x8C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_fa889b40()
{
	if(!isdefined(level.var_dc7ff908))
	{
		return false;
	}
	var_f8b761ad = self.origin[0] - level.var_dc7ff908.origin[0];
	if(var_f8b761ad < 1000 && var_f8b761ad > 500 || (var_f8b761ad > -1000 && var_f8b761ad < -500))
	{
		return false;
	}
	return true;
}

/*
	Name: function_375ded2c
	Namespace: namespace_471b2690
	Checksum: 0xFDD1CB2C
	Offset: 0x28D8
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_375ded2c()
{
	if(!isdefined(level.var_dc7ff908))
	{
		return false;
	}
	return true;
}

/*
	Name: function_8ada6fcd
	Namespace: namespace_471b2690
	Checksum: 0x699EEC3E
	Offset: 0x2900
	Size: 0xDE
	Parameters: 0
	Flags: Linked
*/
function function_8ada6fcd()
{
	self notify("4a6abb721ca765be");
	self endon("4a6abb721ca765be");
	level.var_e0c7b4b2 playsound(#"hash_23689876c990a770");
	level.var_e0c7b4b2 playloopsound(#"hash_2cf241f5f4aba942");
	self waittill(#"movedone");
	level.var_e0c7b4b2 playsound(#"hash_9f5dcea7f83f634");
	level.var_e0c7b4b2 stoploopsound();
	level.var_e0c7b4b2.var_4d30df70 = 0;
}

/*
	Name: function_d2fe0c64
	Namespace: namespace_471b2690
	Checksum: 0xFAAA78EA
	Offset: 0x29E8
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function function_d2fe0c64(var_69836136)
{
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2 playsound(var_69836136 + "start");
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2 playloopsound(var_69836136 + "loop");
}

/*
	Name: function_d1c78d29
	Namespace: namespace_471b2690
	Checksum: 0xD7394968
	Offset: 0x2A70
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function function_d1c78d29(var_69836136)
{
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2 stoploopsound();
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2 playsound(var_69836136 + "stop");
}

/*
	Name: function_44456e3f
	Namespace: namespace_471b2690
	Checksum: 0xDE3D57F9
	Offset: 0x2AE8
	Size: 0x278
	Parameters: 1
	Flags: Linked, Private
*/
function private function_44456e3f(var_e83c664a)
{
	self endon(#"death", #"hash_579c21eb32e90d46");
	level endon(#"end_game");
	self notify(#"hash_29596ce82824e4e8");
	while(true)
	{
		switch(var_e83c664a)
		{
			case "top_rotor":
			{
				self rotateyaw(self.rotate_speed, float(function_60d95f53()) / 1000);
				break;
			}
			case "tail_rotor":
			{
				target_yaw = level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.angles[1];
				if(absangleclamp180(self.angles[1] - target_yaw) < 3)
				{
					target_yaw = self.angles[1];
				}
				self rotateto((self.angles[0] + self.rotate_speed, target_yaw, 0), float(function_60d95f53()) / 1000);
				break;
			}
			default:
			{
				self rotateyaw(self.rotate_speed, float(function_60d95f53()) / 1000);
				break;
			}
		}
		if(self.rotate_speed < self.var_c7395e63)
		{
			self.rotate_speed = self.rotate_speed + self.var_e558e669;
			if(self.rotate_speed > self.var_c7395e63)
			{
				self.rotate_speed = self.var_c7395e63;
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_c60c6664
	Namespace: namespace_471b2690
	Checksum: 0x4D851102
	Offset: 0x2D68
	Size: 0x23A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c60c6664(var_e83c664a)
{
	self endon(#"death");
	level endon(#"end_game");
	self notify(#"hash_579c21eb32e90d46");
	while(self.rotate_speed > 0)
	{
		switch(var_e83c664a)
		{
			case "top_rotor":
			{
				self rotateyaw(self.rotate_speed, float(function_60d95f53()) / 1000);
				break;
			}
			case "tail_rotor":
			{
				target_yaw = level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.angles[1];
				if(absangleclamp180(self.angles[1] - target_yaw) < 3)
				{
					target_yaw = self.angles[1];
				}
				self rotateto((self.angles[0] + self.rotate_speed, target_yaw, 0), float(function_60d95f53()) / 1000);
				break;
			}
			default:
			{
				self rotateyaw(self.rotate_speed, float(function_60d95f53()) / 1000);
				break;
			}
		}
		self.rotate_speed = self.rotate_speed - self.var_2b247bb5;
		waitframe(1);
	}
	self.rotate_speed = 0;
}

/*
	Name: function_d4782b16
	Namespace: namespace_471b2690
	Checksum: 0xB7A09688
	Offset: 0x2FB0
	Size: 0x194
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d4782b16()
{
	if(!isdefined(self.var_b74bb962))
	{
		self.var_b74bb962 = util::spawn_model("tag_origin", self gettagorigin("tag_gunner_flash1"), self gettagangles("tag_gunner_flash1"));
		self.var_b74bb962 linkto(self, "tag_gunner_flash1");
	}
	switch(level.var_217aad9f)
	{
		case 0:
		{
			level.var_9e7b0d9 = getweapon(#"hash_2eaef6ae3b6fee65");
			break;
		}
		default:
		{
			level.var_9e7b0d9 = getweapon(#"hash_2eaef6ae3b6fee65");
			break;
		}
	}
	level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.var_15ba53f8.turret_barrel setweapon(level.var_9e7b0d9);
	self thread function_2678d78c();
	self thread function_24ce3a7();
}

/*
	Name: function_2678d78c
	Namespace: namespace_471b2690
	Checksum: 0xFCCFBF97
	Offset: 0x3150
	Size: 0x14C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_2678d78c()
{
	self endon(#"death");
	level endon(#"end_game", #"hash_3b32dd943e760a34");
	while(true)
	{
		if(isalive(self.my_target) && function_c8c79a28(self.var_b74bb962.origin, self.my_target.origin + vectorscale((0, 0, 1), 30)))
		{
			wait(0.5);
			continue;
		}
		self notify(#"hash_1783c8058bf83257");
		a_zombies = getaiteamarray(level.zombie_team);
		self.my_target = undefined;
		self flag::clear(#"hash_6783a838342e2900");
		if(isdefined(level.var_dc7ff908))
		{
			self.my_target = function_3da631cc(level.var_dc7ff908, self, a_zombies);
		}
		wait(1);
	}
}

/*
	Name: function_3da631cc
	Namespace: namespace_471b2690
	Checksum: 0xDC92FCA9
	Offset: 0x32A8
	Size: 0x136
	Parameters: 3
	Flags: Linked, Private
*/
function private function_3da631cc(entity, turret, a_zombies)
{
	var_8a0a0ad0 = 99999;
	foreach(zombie in a_zombies)
	{
		var_3300333c = distance(turret.origin, zombie.origin);
		if(var_3300333c < var_8a0a0ad0)
		{
			if(function_c8c79a28(self.var_b74bb962.origin, zombie.origin + vectorscale((0, 0, 1), 30)))
			{
				target = zombie;
				var_8a0a0ad0 = var_3300333c;
				continue;
			}
			continue;
		}
	}
	return target;
}

/*
	Name: function_24ce3a7
	Namespace: namespace_471b2690
	Checksum: 0xE3A45059
	Offset: 0x33E8
	Size: 0xF0
	Parameters: 0
	Flags: Linked, Private
*/
function private function_24ce3a7()
{
	level endon(#"hash_3b32dd943e760a34");
	while(true)
	{
		var_e117104d = function_c46f0aa(self.var_b74bb962.origin, self.my_target, anglestoforward(self.var_b74bb962.angles), 0.95);
		if(isalive(self.my_target) && !self flag::get(#"hash_6783a838342e2900") && var_e117104d)
		{
			self thread function_f35a7c49(self.my_target);
		}
		wait(0.5);
	}
}

/*
	Name: function_f35a7c49
	Namespace: namespace_471b2690
	Checksum: 0xBA01365C
	Offset: 0x34E0
	Size: 0x4E4
	Parameters: 1
	Flags: Linked
*/
function function_f35a7c49(target)
{
	level endon(#"end_game", #"hash_3b32dd943e760a34");
	self endon(#"hash_1783c8058bf83257");
	self flag::set(#"hash_6783a838342e2900");
	var_72f571c9 = 0;
	var_9920b31d = 0;
	var_4a5383d9 = 0;
	var_8d2dfb7b = 1;
	while(isalive(target))
	{
		playsoundatposition(#"hash_28fd24537d849f13", self.var_b74bb962.origin);
		if(target.var_6f84b820 === #"normal")
		{
			if(var_8d2dfb7b)
			{
				v_offset = (randomfloatrange(-50, 50), randomfloatrange(-50, 50), 0);
				var_4a5383d9++;
			}
			else
			{
				v_offset = (0, 0, randomfloatrange(0, 40));
				if(var_72f571c9 > 2)
				{
					if(math::cointoss(60))
					{
						target zombie_utility::setup_zombie_knockdown(target.origin);
					}
					var_72f571c9 = 0;
				}
				if(var_9920b31d > 25)
				{
					if(isplayer(level.var_6f8aa603))
					{
						level.var_6f8aa603 zm_stats::function_7ec42fbf(#"hash_1b510c3803746a43");
					}
					target dodamage(target.health + 999, target.origin, self);
					var_9920b31d = 0;
				}
				var_8d2dfb7b = 1;
			}
			self clientfield::increment("" + #"hash_27556b053ce9a6a2", 1);
			var_72f571c9++;
			var_9920b31d++;
		}
		else
		{
			if(var_8d2dfb7b)
			{
				v_offset = (randomfloatrange(-50, 50), randomfloatrange(-50, 50), 0);
				var_4a5383d9++;
			}
			else
			{
				v_offset = (0, 0, randomfloatrange(0, 40));
			}
			self clientfield::increment("" + #"hash_27556b053ce9a6a2", 1);
		}
		bullet_target = self.var_b74bb962.origin + (anglestoforward(self.var_b74bb962.angles) * 2000);
		magicbullet(level.var_9e7b0d9, self.var_b74bb962.origin, bullet_target + v_offset, self);
		a_zombies = self function_bdda420f(target.origin, 70);
		foreach(zombie in a_zombies)
		{
			if(isalive(zombie) && zombie.var_6f84b820 === #"normal")
			{
				if(math::cointoss(50))
				{
					zombie zombie_utility::setup_zombie_knockdown(zombie.origin);
				}
			}
		}
		if(var_4a5383d9 > 3)
		{
			var_8d2dfb7b = 0;
			var_4a5383d9 = 0;
		}
		wait(0.08);
	}
	self.my_target = undefined;
	self flag::clear(#"hash_6783a838342e2900");
}

/*
	Name: function_2db7dc3
	Namespace: namespace_471b2690
	Checksum: 0x6421355F
	Offset: 0x39D0
	Size: 0xCA
	Parameters: 13
	Flags: Linked
*/
function function_2db7dc3(inflictor, attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype)
{
	if(surfacetype === level.var_9e7b0d9)
	{
		boneindex = zm_equipment::function_379f6b5d(boneindex, surfacetype, self.var_6f84b820, self.maxhealth);
		boneindex = min(boneindex, 999999);
	}
	return boneindex;
}

/*
	Name: function_c46f0aa
	Namespace: namespace_471b2690
	Checksum: 0x474BCA2E
	Offset: 0x3AA8
	Size: 0x9A
	Parameters: 5
	Flags: Linked
*/
function function_c46f0aa(var_edfffb43, target_entity, var_3e383915, var_456379df, var_a11fa31c)
{
	if(!isdefined(var_3e383915))
	{
		return false;
	}
	target_forward = vectornormalize((var_3e383915.origin + vectorscale((0, 0, 1), 2)) - target_entity);
	if(vectordot(target_forward, var_456379df) > var_a11fa31c)
	{
		return true;
	}
	return false;
}

/*
	Name: function_8004c21d
	Namespace: namespace_471b2690
	Checksum: 0x18D9CD4
	Offset: 0x3B50
	Size: 0xD4
	Parameters: 1
	Flags: Linked
*/
function function_8004c21d(s_params)
{
	attacker = s_params.eattacker;
	if(attacker === level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.var_15ba53f8.turret_barrel && isdefined(level.var_6f8aa603))
	{
		level scoreevents::doscoreeventcallback("scoreEventZM", {#enemy:self, #scoreevent:#"hash_748d4479ffd0521e", #attacker:level.var_6f8aa603});
	}
}

/*
	Name: function_c8c79a28
	Namespace: namespace_471b2690
	Checksum: 0x80C0D195
	Offset: 0x3C30
	Size: 0x2A
	Parameters: 2
	Flags: Linked, Private
*/
function private function_c8c79a28(v_start_point, v_end_point)
{
	return bullettracepassed(v_start_point, v_end_point, 0, undefined);
}

/*
	Name: function_c7e1db4
	Namespace: namespace_471b2690
	Checksum: 0xBBD3611D
	Offset: 0x3C68
	Size: 0x11C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_c7e1db4()
{
	if(isdefined(level.var_6f8aa603.cached_zone_name) && isinarray(level.var_94185ac9, level.var_6f8aa603.cached_zone_name))
	{
		return level.var_6f8aa603;
	}
	a_players = function_a1ef346b();
	foreach(player in a_players)
	{
		if(isdefined(player.cached_zone_name) && isinarray(level.var_94185ac9, player.cached_zone_name))
		{
			return player;
		}
	}
	return undefined;
}

/*
	Name: function_e0beead2
	Namespace: namespace_471b2690
	Checksum: 0x802CA768
	Offset: 0x3D90
	Size: 0xFE
	Parameters: 0
	Flags: Linked, Private
*/
function private function_e0beead2()
{
	level endon(#"end_game", #"hash_d85bf2288b3c1c3");
	while(true)
	{
		if(!isdefined(level.var_dc7ff908.cached_zone_name) || !isinarray(level.var_94185ac9, level.var_dc7ff908.cached_zone_name))
		{
			level.var_dc7ff908 = function_c7e1db4();
		}
		if(isdefined(level.var_6f8aa603.cached_zone_name) && isinarray(level.var_94185ac9, level.var_6f8aa603.cached_zone_name))
		{
			level.var_dc7ff908 = function_c7e1db4();
		}
		waitframe(1);
	}
}

/*
	Name: function_cd7a3de4
	Namespace: namespace_471b2690
	Checksum: 0xE590684D
	Offset: 0x3E98
	Size: 0x5C
	Parameters: 0
	Flags: None
*/
function function_cd7a3de4()
{
	/#
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		zm_devgui::add_custom_devgui_callback(&cmd);
	#/
}

/*
	Name: cmd
	Namespace: namespace_471b2690
	Checksum: 0xB099CC5C
	Offset: 0x3F00
	Size: 0x15A
	Parameters: 1
	Flags: None
*/
function cmd(cmd)
{
	/#
		switch(cmd)
		{
			case "hash_1f54a283b6613f19":
			{
				if(!level flag::get(#"hash_3b32dd943e760a34"))
				{
					level.var_81aa2a00 array::thread_all(level.var_81aa2a00, &function_4eaecff9);
					level function_795e2881(function_a1ef346b()[0]);
				}
				break;
			}
			case "hash_2ca5e689627176a0":
			{
				if(level flag::get(#"hash_3b32dd943e760a34"))
				{
					level notify(#"hash_579f5585446dafb2");
					level flag::clear(#"hash_3b32dd943e760a34");
					level.var_81aa2a00 array::thread_all(level.var_81aa2a00, &function_9f433625);
				}
				break;
			}
		}
	#/
}

/*
	Name: function_9cdc9afa
	Namespace: namespace_471b2690
	Checksum: 0xAC59D63B
	Offset: 0x4068
	Size: 0x1E6
	Parameters: 0
	Flags: None
*/
function function_9cdc9afa()
{
	/#
		level endon(#"end_game", #"hash_3b32dd943e760a34");
		while(true)
		{
			if(isdefined(level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.var_15ba53f8))
			{
				circle(level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.var_15ba53f8.origin, 50, (1, 1, 0));
				print3d(level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.var_15ba53f8.origin, "", (1, 1, 0));
			}
			if(isdefined(level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.var_15ba53f8.turret_barrel))
			{
				circle(level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.var_15ba53f8.turret_barrel.origin, 50, (0, 1, 0));
				print3d(level.var_e0c7b4b2.var_df4d758d.var_3b09f1e2.chopper.var_15ba53f8.turret_barrel.origin, "", (0, 1, 0));
			}
			waitframe(1);
		}
	#/
}

