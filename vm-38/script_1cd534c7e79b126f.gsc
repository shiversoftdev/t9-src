#using script_19367cd29a4485db;
#using script_27347f09888ad15;
#using script_340a2e805e35f7a2;
#using script_3411bb48d41bd3b;
#using script_34ab99a4ca1a43d;
#using script_35598499769dbb3d;
#using script_556e19065f09f8a2;
#using script_7fc996fe8678852;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\fx_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\zm_common\gametypes\globallogic.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_63c7213c;

/*
	Name: function_841dc29f
	Namespace: namespace_63c7213c
	Checksum: 0xF7B1D16A
	Offset: 0x638
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_841dc29f()
{
	level notify(1793958389);
}

/*
	Name: function_89f2df9
	Namespace: namespace_63c7213c
	Checksum: 0xBFD0E40
	Offset: 0x658
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_3c43448fdb77ea73", &function_70a657d8, undefined, undefined, #"hash_f81b9dea74f0ee");
}

/*
	Name: function_70a657d8
	Namespace: namespace_63c7213c
	Checksum: 0xD10F48DE
	Offset: 0x6A8
	Size: 0x16C
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	if(!zm_utility::is_survival())
	{
		return;
	}
	if(!is_true(getgametypesetting(#"hash_1e2b95e15661dad")) && !getdvarint(#"hash_730311c63805303a", 0))
	{
		return;
	}
	clientfield::register("actor", "soul_capture_zombie_fire", 1, 1, "int");
	clientfield::register("scriptmover", "soul_capture_leave", 1, 1, "int");
	clientfield::register("scriptmover", "soul_capture_timer", 1, 1, "int");
	namespace_8b6a9d79::function_b3464a7c(#"hash_767b79143e823d0b", &spawn_callback, 1);
	level.var_e31c7b0d = struct::get_array("soul_capture", "content_script_name");
}

/*
	Name: spawn_callback
	Namespace: namespace_63c7213c
	Checksum: 0xCE8C617B
	Offset: 0x820
	Size: 0x53C
	Parameters: 1
	Flags: Linked
*/
function spawn_callback(s_instance)
{
	if(!isdefined(level.var_8d314fbb))
	{
		level.var_8d314fbb = &actor_damage_override;
	}
	level callback::add_callback(#"hash_594217387367ebb4", &function_a221b3a, s_instance);
	s_instance flag::clear("eater_spawning");
	s_instance flag::clear("eater_leaving");
	s_instance flag::clear("complete");
	s_instance.var_3f0d6dc1 = 0;
	s_instance.a_ai_zombies = [];
	s_instance.var_be8ed486 = [];
	s_instance.var_c9df36f = "takeoff level 0";
	s_capture_point = s_instance.var_fe2612fe[#"capture_point"][0];
	s_instance.var_934133c0 = {#angles:s_capture_point.angles, #origin:s_capture_point.origin};
	s_instance.var_ed23159a = "front";
	s_instance.var_934133c0 scene::init("aib_t9_zm_dragonhead");
	s_instance.var_f9cc146 = s_instance.var_934133c0.scene_ents[#"hash_754e09baaf7ce789"];
	s_instance.var_f9cc146 hide();
	s_instance.var_f9cc146 notsolid();
	var_3bb47a83 = s_instance.var_fe2612fe[#"hash_4d27846c8a4b01a1"][0];
	s_instance.var_5ea363c = namespace_8b6a9d79::spawn_script_model(var_3bb47a83, #"hash_26730916f0bb7003", 1);
	s_instance.var_5ea363c disconnectpaths();
	s_instance.var_5ea363c clientfield::set("soul_capture_timer", 1);
	s_instance.var_5ea363c.var_bec42bc3 = util::spawn_model(#"hash_69c0563efeddad47", s_instance.var_5ea363c.origin, s_instance.var_5ea363c.angles);
	s_fx = s_instance.var_fe2612fe[#"eyes"][0];
	s_instance.var_ff3e0c53 = namespace_8b6a9d79::spawn_script_model(s_fx, "tag_origin");
	s_instance.var_ff3e0c53 linkto(s_instance.var_5ea363c);
	playfxontag(#"hash_56b5ae0fe9c0a0b3", s_instance.var_ff3e0c53, "tag_origin");
	s_instance.var_31309e7a = namespace_8b6a9d79::spawn_script_model(s_fx, "tag_origin");
	s_instance.var_31309e7a linkto(s_instance.var_5ea363c);
	playfxontag(#"hash_1e6eecfa05dea663", s_instance.var_31309e7a, "tag_origin");
	s_instance.var_5ea363c thread scene::play("p9_fxanim_sv_dragon_console_bundle", "fuel init", s_instance.var_5ea363c);
	v_origin = getclosestpointonnavmesh(s_instance.var_fe2612fe[#"boundary"][0].origin, 256);
	s_instance.spawn_points = namespace_85745671::function_e4791424(v_origin, 20, 64, 1000, 600);
	s_instance.n_obj_id = zm_utility::function_f5a222a8(#"hash_3e50c9d06850fdcb", var_3bb47a83.origin);
	s_instance.trigger = namespace_8b6a9d79::function_214737c7(s_instance.var_fe2612fe[#"hash_3966465c498df3a6"][0], &function_3f808d3d, #"hash_78f3d8add33d8cc7", 500);
	s_instance.trigger.instance = s_instance;
	level thread function_f6ed3b36(s_instance);
	s_instance.trigger thread zm_utility::function_2256923f(500);
}

/*
	Name: function_3f808d3d
	Namespace: namespace_63c7213c
	Checksum: 0xB17233A9
	Offset: 0xD68
	Size: 0x904
	Parameters: 1
	Flags: Linked
*/
function function_3f808d3d(eventstruct)
{
	if(is_true(self.b_started))
	{
		return;
	}
	self endon(#"death");
	player = eventstruct.activator;
	n_cost = 500;
	/#
		if(getdvarint(#"hash_730311c63805303a", 0))
		{
			n_cost = 0;
		}
	#/
	if(isalive(player) && !player laststand::player_is_in_laststand())
	{
		if(!player zm_score::can_player_purchase(n_cost))
		{
			player playsoundtoplayer(#"zmb_no_cha_ching", player);
			return;
		}
		self.b_started = 1;
		self setinvisibletoall();
		instance = self.instance;
		instance endon(#"complete", #"cleanup");
		instance flag::set("active");
		self callback::function_b74bf3e(&function_3f808d3d);
		player zm_score::minus_to_player_score(n_cost);
		instance thread function_3104e1a8();
		instance thread function_98382cc9();
		var_c309b891 = instance.var_fe2612fe[#"boundary"][0];
		var_9899bfae = var_c309b891.origin;
		if(isdefined(instance.var_5ea363c.var_bec42bc3))
		{
			instance.var_5ea363c.var_bec42bc3 delete();
		}
		instance.var_5ea363c.var_bec42bc3 = util::spawn_model(#"hash_4216483ed80d88bb", instance.var_5ea363c.origin, instance.var_5ea363c.angles);
		instance flag::wait_till(#"hash_1e3e4d1c77881b6c");
		instance.var_5ea363c clientfield::set("soul_capture_timer", 0);
		function_14674c4f();
		n_time_elapsed = 0;
		n_start_time = gettime();
		while(n_time_elapsed < int(50 * 1000))
		{
			wait(0.5);
			a_ai = getaiteamarray(level.zombie_team);
			a_ai = arraysortclosest(a_ai, var_9899bfae, undefined, 0, 1000);
			foreach(ai in a_ai)
			{
				if(!is_true(ai.var_2e85cbf2) && distancesquared(ai.origin, var_9899bfae) <= sqr(333))
				{
					instance function_bbc6c929(ai, 1);
					continue;
				}
				if(is_true(ai.var_2e85cbf2) && distancesquared(ai.origin, var_9899bfae) > sqr(333))
				{
					instance function_bbc6c929(ai, 0);
				}
			}
			n_time_elapsed = gettime() - n_start_time;
		}
		instance flag::set(#"times_up");
		instance.var_5ea363c playsound(#"hash_5a2c52f1f2b57bf2");
		foreach(ai in a_ai)
		{
			if(isalive(ai))
			{
				instance function_bbc6c929(ai, 0);
				if(!is_true(ai.var_a950813d))
				{
					gibserverutils::annihilate(ai);
					ai kill(undefined, undefined, undefined, undefined, undefined, 1);
				}
				waitframe(1);
			}
		}
		if(isdefined(instance.var_48ab101))
		{
			instance.var_48ab101 clientfield::set("soul_capture_timer", 0);
			instance.var_48ab101 thread util::deleteaftertimeandnetworkframe(1);
		}
		if(isdefined(instance.var_5ea363c.var_bec42bc3))
		{
			instance.var_5ea363c.var_bec42bc3 delete();
		}
		instance.var_5ea363c.var_bec42bc3 = util::spawn_model(#"hash_2fb1773fccdfb090", instance.var_5ea363c.origin, instance.var_5ea363c.angles);
		players = getplayers();
		if(isdefined(instance.var_3f0d6dc1) && isdefined(instance.var_53be7e08) && (instance.var_3f0d6dc1 * instance.var_53be7e08) >= 15)
		{
			level scoreevents::doscoreeventcallback("scoreEventSR", {#location:instance.origin, #hash_b0a57f8c:5000, #nearbyplayers:1, #scoreevent:"event_complete"});
			foreach(player in players)
			{
				player zm_stats::increment_challenge_stat(#"hash_30e4e9155368a6a9");
			}
		}
		foreach(player in players)
		{
			player zm_stats::function_945c7ce2(#"hash_165462f560a0538c", 1);
		}
		instance thread function_39280c7a();
		instance flag::set("complete");
	}
}

/*
	Name: function_98382cc9
	Namespace: namespace_63c7213c
	Checksum: 0xC262B220
	Offset: 0x1678
	Size: 0x40C
	Parameters: 0
	Flags: Linked
*/
function function_98382cc9()
{
	self endon(#"cleanup");
	self flag::set("eater_spawning");
	s_fx = self.var_fe2612fe[#"eyes"][0];
	playfx(#"hash_2a096914a9161bb8", s_fx.origin, anglestoforward(s_fx.angles), anglestoup(s_fx.angles));
	earthquake(0.2, 6, self.var_f9cc146.origin, 512);
	playsoundatposition(#"hash_39088d45201c4160", self.var_f9cc146.origin);
	self.var_f9cc146 playrumblelooponentity(#"hash_7d1934b3d40a60c2");
	wait(1);
	var_c309b891 = self.var_fe2612fe[#"boundary"][0];
	if(isdefined(var_c309b891))
	{
		self.var_48ab101 = namespace_8b6a9d79::spawn_script_model(var_c309b891, "tag_origin");
		self.var_48ab101 clientfield::set("soul_capture_timer", 1);
	}
	wait(1);
	self.var_f9cc146 show();
	self.var_f9cc146 solid();
	self util::delay(3, "cleanup", &flag::set, #"hash_1e3e4d1c77881b6c");
	self.var_934133c0 scene::play("aib_t9_zm_dragonhead", "dragonhead_intro", self.var_f9cc146);
	self flag::clear("eater_spawning");
	self.var_f9cc146 stoprumble(#"hash_7d1934b3d40a60c2");
	if(!self flag::get("looking_at_zombie"))
	{
		self thread function_21700f1d();
	}
	function_1eaaceab(self.a_ai_zombies);
	foreach(ai_zombie in self.a_ai_zombies)
	{
		ai_zombie thread namespace_85745671::function_9456addc(60);
	}
	/#
		if(getdvarint(#"hash_65645feb77b22343", 0))
		{
			line(self.var_934133c0.origin, self.var_934133c0.origin + (anglestoforward(self.var_934133c0.angles) * 150), undefined, undefined, undefined, 300);
		}
	#/
}

/*
	Name: function_b8691499
	Namespace: namespace_63c7213c
	Checksum: 0xB392090A
	Offset: 0x1A90
	Size: 0x162
	Parameters: 0
	Flags: Linked
*/
function function_b8691499()
{
	n_players = getplayers().size;
	/#
		var_4b08438 = getdvarint(#"hash_4b8ad6985e0ad109", 0);
		if(var_4b08438)
		{
			n_players = var_4b08438;
		}
	#/
	switch(n_players)
	{
		case 1:
		{
			self.var_a4b9e38b = int(5);
			self.var_53be7e08 = 1.25;
			break;
		}
		case 2:
		{
			self.var_a4b9e38b = int(7);
			self.var_53be7e08 = 1;
			break;
		}
		case 3:
		{
			self.var_a4b9e38b = int(9);
			self.var_53be7e08 = 0.9;
		}
		default:
		{
			self.var_a4b9e38b = 10;
			self.var_53be7e08 = 0.8;
			break;
		}
	}
}

/*
	Name: actor_damage_override
	Namespace: namespace_63c7213c
	Checksum: 0xB5E4E3B
	Offset: 0x1C00
	Size: 0x706
	Parameters: 13
	Flags: Linked
*/
function actor_damage_override(inflictor, attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype)
{
	if(is_false(self.takedamage))
	{
		return 0;
	}
	var_9bcc82c8 = [];
	foreach(s_instance in level.var_e31c7b0d)
	{
		if(s_instance flag::get("active"))
		{
			if(!isdefined(var_9bcc82c8))
			{
				var_9bcc82c8 = [];
			}
			else if(!isarray(var_9bcc82c8))
			{
				var_9bcc82c8 = array(var_9bcc82c8);
			}
			var_9bcc82c8[var_9bcc82c8.size] = s_instance;
		}
	}
	if(var_9bcc82c8.size <= 0 || self.archetype != #"zombie" || !is_true(self.var_2e85cbf2))
	{
		return surfacetype;
	}
	if((self.health - surfacetype) <= 0 && isplayer(boneindex) && !boneindex laststand::player_is_in_laststand())
	{
		var_ee56c5b = [];
		foreach(var_ab4a6bb5 in var_9bcc82c8)
		{
			if(!isdefined(var_ee56c5b))
			{
				var_ee56c5b = [];
			}
			else if(!isarray(var_ee56c5b))
			{
				var_ee56c5b = array(var_ee56c5b);
			}
			var_ee56c5b[var_ee56c5b.size] = var_ab4a6bb5.var_fe2612fe[#"capture_point"][0];
		}
		var_8580c8fc = arraysortclosest(var_ee56c5b, self.origin);
		s_capture_point = var_8580c8fc[0];
		s_instance = s_capture_point.parent;
		if(isdefined(s_instance) && !s_instance flag::get("complete") && !s_instance flag::get("eater_leaving"))
		{
			if(!is_true(self.var_2e85cbf2))
			{
				gibserverutils::annihilate(self);
				return surfacetype;
			}
			level function_544f03e3(s_instance);
			var_da0e5c76 = self;
			var_c4943182 = s_instance.var_f9cc146;
			b_in_front = s_instance.var_934133c0 math::get_dot_forward(self.origin) > 0;
			var_ca4c48f1 = s_instance.var_934133c0.origin + (anglestoforward(s_instance.var_934133c0.angles) * 150);
			b_trace_passed = bullettracepassed(self util::get_eye(), var_ca4c48f1, 0, var_da0e5c76, var_c4943182);
			/#
				if(getdvarint(#"hash_65645feb77b22343", 0))
				{
					red = (0.9, 0.2, 0.2);
					green = (0.2, 0.9, 0.2);
					color = red;
					if(b_trace_passed)
					{
						color = green;
					}
					line(self util::get_eye(), var_ca4c48f1, color, undefined, undefined, 300);
				}
			#/
			var_f3a93cf1 = 0;
			if(b_in_front && b_trace_passed && !s_instance flag::get("eater_eating") && !s_instance flag::get("eater_spawning"))
			{
				s_instance flag::set("eater_eating");
				var_f3a93cf1 = 1;
			}
			self.var_a950813d = 1;
			self.var_98f1f37c = 1;
			self.no_powerups = 1;
			self val::set("soul_capture_allowdeath", "allowdeath", 0);
			self val::set("soul_capture_takedamage", "takedamage", 0);
			self val::set("soul_capture_ignoreme", "ignoreme", 1);
			self val::set("soul_capture_ignoreall", "ignoreall", 1);
			self notsolid();
			s_instance thread function_29db9d5f(self, boneindex, var_f3a93cf1);
			return self.health - 1;
		}
	}
	return surfacetype;
}

/*
	Name: function_544f03e3
	Namespace: namespace_63c7213c
	Checksum: 0xA5CBC424
	Offset: 0x2310
	Size: 0x374
	Parameters: 1
	Flags: Linked
*/
function function_544f03e3(s_instance)
{
	s_instance.var_3f0d6dc1++;
	var_6e938f0b = int(s_instance.var_3f0d6dc1 * s_instance.var_53be7e08);
	switch(var_6e938f0b)
	{
		case 10:
		{
			s_instance.var_2348a8fb = #"small";
			s_instance.var_91c84189 = #"hash_5815cc7ba68d56e";
			s_instance.var_31919730 = #"hash_27f68725fa24b68";
			s_instance.var_dae71351 = 1;
			s_instance.var_c9df36f = "takeoff level 1";
			str_shot = "fuel level 1";
			s_instance.var_5ea363c playsound(#"hash_22ba30d426789fe");
			break;
		}
		case 15:
		{
			s_instance.var_2348a8fb = #"medium";
			s_instance.var_91c84189 = #"hash_7d3c5ac38ba069f0";
			s_instance.var_31919730 = #"hash_4392142b99d9d79a";
			s_instance.var_dae71351 = 2;
			s_instance.var_c9df36f = "takeoff level 2";
			str_shot = "fuel level 2";
			s_instance.var_5ea363c playsound(#"hash_d39ad0d4958aed2");
			break;
		}
		case 20:
		{
			s_instance.var_2348a8fb = #"large";
			s_instance.var_91c84189 = #"hash_473df02427c669ff";
			s_instance.var_31919730 = #"hash_39c86bb99fc237d";
			s_instance.var_dae71351 = 3;
			s_instance.var_c9df36f = "takeoff level 3";
			str_shot = "fuel level 3";
			s_instance.var_5ea363c playsound(#"hash_2fa3cbab386aafa0");
			break;
		}
		case 25:
		{
			s_instance.var_2348a8fb = #"gold";
			s_instance.var_91c84189 = #"hash_473df02427c669ff";
			s_instance.var_31919730 = #"hash_401a47741ffd646f";
			s_instance.var_dae71351 = 3;
			s_instance.var_c9df36f = "takeoff level 4";
			str_shot = "fuel level 4";
			s_instance.var_5ea363c playsound(#"hash_d2bc90d494ca10a");
			break;
		}
		default:
		{
			break;
		}
	}
	if(isdefined(str_shot))
	{
		s_instance.var_5ea363c scene::stop("p9_fxanim_sv_dragon_console_bundle");
		s_instance.var_5ea363c thread scene::play("p9_fxanim_sv_dragon_console_bundle", str_shot, s_instance.var_5ea363c);
	}
}

/*
	Name: function_3104e1a8
	Namespace: namespace_63c7213c
	Checksum: 0x404C8D05
	Offset: 0x2690
	Size: 0x2A4
	Parameters: 0
	Flags: Linked
*/
function function_3104e1a8()
{
	self endon(#"complete", #"cleanup", #"times_up");
	self function_b8691499();
	var_c309b891 = self.var_fe2612fe[#"boundary"][0];
	while(true)
	{
		self thread function_acf692e();
		var_d484054 = 0;
		while(true)
		{
			b_player_near = 0;
			a_e_players = function_a1ef346b(undefined, var_c309b891.origin, 3000);
			foreach(e_player in a_e_players)
			{
				if(!e_player laststand::player_is_in_laststand())
				{
					b_player_near = 1;
					break;
				}
			}
			if(b_player_near && var_d484054)
			{
				break;
			}
			if(!b_player_near)
			{
				self notify(#"hash_3c93c17d2bec4686");
				function_1eaaceab(self.a_ai_zombies);
				foreach(ai_zombie in self.a_ai_zombies)
				{
					if(!is_true(ai_zombie.var_a950813d))
					{
						gibserverutils::annihilate(ai_zombie);
						ai_zombie kill(undefined, undefined, undefined, undefined, undefined, 1);
						waitframe(1);
					}
				}
				if(!var_d484054)
				{
					var_d484054 = 1;
				}
			}
			wait(1);
		}
	}
}

/*
	Name: function_acf692e
	Namespace: namespace_63c7213c
	Checksum: 0xA74C82FD
	Offset: 0x2940
	Size: 0x360
	Parameters: 0
	Flags: Linked
*/
function function_acf692e()
{
	self notify("5b2ef70e23283d73");
	self endon("5b2ef70e23283d73");
	self endon(#"complete", #"hash_3c93c17d2bec4686", #"cleanup", #"times_up");
	var_2eb61c8a = arraycopy(self.spawn_points);
	str_list = "default_ambush_list_realm_" + level.var_15d17eb2;
	var_6443acc = namespace_679a22ba::function_77be8a83(str_list);
	while(true)
	{
		wait(randomfloatrange(0.25, 0.5));
		function_1eaaceab(self.a_ai_zombies);
		if(self.a_ai_zombies.size < self.var_a4b9e38b)
		{
			if(var_2eb61c8a.size <= 0)
			{
				var_2eb61c8a = arraycopy(self.spawn_points);
				var_2eb61c8a = array::randomize(var_2eb61c8a);
			}
			s_spawn = var_2eb61c8a[0];
			arrayremoveindex(var_2eb61c8a, 0);
			v_spawn = s_spawn.origin;
			var_4bf95f4c = namespace_679a22ba::function_ca209564(str_list, var_6443acc);
			if(!isdefined(var_4bf95f4c) || !isdefined(v_spawn))
			{
				var_6443acc = namespace_679a22ba::function_77be8a83(str_list);
				var_2eb61c8a = arraycopy(self.spawn_points);
				continue;
			}
			ai_rusher = namespace_85745671::function_9d3ad056(var_4bf95f4c.var_990b33df, v_spawn, (0, randomfloat(360), 0), "soul_capture_zombie");
			if(isdefined(ai_rusher))
			{
				if(!isdefined(self.a_ai_zombies))
				{
					self.a_ai_zombies = [];
				}
				else if(!isarray(self.a_ai_zombies))
				{
					self.a_ai_zombies = array(self.a_ai_zombies);
				}
				if(!isinarray(self.a_ai_zombies, ai_rusher))
				{
					self.a_ai_zombies[self.a_ai_zombies.size] = ai_rusher;
				}
				ai_rusher.var_4114a7c0 = 1;
				ai_rusher callback::function_d8abfc3d(#"hash_4afe635f36531659", &function_df7d32bc);
				ai_rusher.var_1564b717 = 1000;
				ai_rusher.var_8661adfc = 1;
				ai_rusher thread namespace_85745671::function_9456addc(60);
			}
		}
	}
}

/*
	Name: function_bbc6c929
	Namespace: namespace_63c7213c
	Checksum: 0x874AF84
	Offset: 0x2CA8
	Size: 0x364
	Parameters: 2
	Flags: Linked
*/
function function_bbc6c929(ai_zombie, var_6be8a3b9)
{
	if(!isdefined(var_6be8a3b9))
	{
		var_6be8a3b9 = 1;
	}
	function_1eaaceab(self.var_be8ed486);
	if(!is_true(ai_zombie.var_2e85cbf2) && var_6be8a3b9)
	{
		ai_zombie.var_2e85cbf2 = 1;
		ai_zombie.var_5d94c356 = self;
		ai_zombie thread util::delay(1, "death", &zombie_eye_glow::function_b43f92cd, 2);
		ai_zombie clientfield::set("soul_capture_zombie_fire", 1);
		if(!is_true(ai_zombie.var_4114a7c0))
		{
			ai_zombie.var_4114a7c0 = 1;
			ai_zombie callback::function_d8abfc3d(#"hash_4afe635f36531659", &function_df7d32bc);
		}
		if(!is_true(ai_zombie.var_8661adfc))
		{
			ai_zombie.var_8661adfc = 1;
			ai_zombie thread namespace_85745671::function_9456addc(60);
		}
		if(!isdefined(self.a_ai_zombies))
		{
			self.a_ai_zombies = [];
		}
		else if(!isarray(self.a_ai_zombies))
		{
			self.a_ai_zombies = array(self.a_ai_zombies);
		}
		if(!isinarray(self.a_ai_zombies, ai_zombie))
		{
			self.a_ai_zombies[self.a_ai_zombies.size] = ai_zombie;
		}
		if(!isdefined(self.var_be8ed486))
		{
			self.var_be8ed486 = [];
		}
		else if(!isarray(self.var_be8ed486))
		{
			self.var_be8ed486 = array(self.var_be8ed486);
		}
		if(!isinarray(self.var_be8ed486, ai_zombie))
		{
			self.var_be8ed486[self.var_be8ed486.size] = ai_zombie;
		}
	}
	else if(is_true(ai_zombie.var_2e85cbf2) && !var_6be8a3b9)
	{
		ai_zombie.var_2e85cbf2 = undefined;
		ai_zombie.var_5d94c356 = undefined;
		ai_zombie clientfield::set("soul_capture_zombie_fire", 0);
		ai_zombie.var_4114a7c0 = undefined;
		ai_zombie callback::function_52ac9652(#"hash_4afe635f36531659", &function_df7d32bc);
		ai_zombie.var_8661adfc = undefined;
		ai_zombie thread namespace_85745671::function_9456addc(60);
		arrayremovevalue(self.a_ai_zombies, ai_zombie);
		arrayremovevalue(self.var_be8ed486, ai_zombie);
	}
}

/*
	Name: function_df7d32bc
	Namespace: namespace_63c7213c
	Checksum: 0xA548AC5F
	Offset: 0x3018
	Size: 0xCC
	Parameters: 0
	Flags: Linked
*/
function function_df7d32bc()
{
	if(self.current_state.name == #"chase" && self.archetype == #"zombie")
	{
		var_8c6394e3 = "sprint";
		var_481bf1b8 = (isdefined(level.var_b48509f9) ? level.var_b48509f9 : 1);
		if(var_481bf1b8 > 1 && math::cointoss(25))
		{
			var_8c6394e3 = "super_sprint";
		}
		self namespace_85745671::function_9758722(var_8c6394e3);
	}
}

/*
	Name: function_21700f1d
	Namespace: namespace_63c7213c
	Checksum: 0x477400C
	Offset: 0x30F0
	Size: 0x110
	Parameters: 0
	Flags: Linked
*/
function function_21700f1d()
{
	self endon(#"hash_61e83b55d9a270d9", #"hash_7fcb6ebe84624215", #"cleanup");
	self thread function_c57d25ff();
	str_scene = "aib_t9_zm_dragonhead";
	var_b2a60109 = array("dragonhead_idle", "dragonhead_idle_b", "dragonhead_idle_twitch_roar");
	while(!self flag::get("eater_leaving") && !self flag::get("looking_at_zombie"))
	{
		str_shot = array::random(var_b2a60109);
		self.var_934133c0 scene::play(str_scene, str_shot);
	}
}

/*
	Name: function_c57d25ff
	Namespace: namespace_63c7213c
	Checksum: 0x99A12655
	Offset: 0x3208
	Size: 0x136
	Parameters: 0
	Flags: Linked
*/
function function_c57d25ff()
{
	self endon(#"hash_61e83b55d9a270d9", #"hash_7fcb6ebe84624215", #"cleanup");
	var_f9cc146 = self.var_f9cc146;
	var_f9cc146 endon(#"death");
	while(true)
	{
		var_be17187b = undefined;
		var_be17187b = var_f9cc146 waittill(#"hash_70c3e76d86ce9948", #"hash_2919b10e087b7780", #"hash_53ea1cfce477ae95");
		switch(var_be17187b._notify)
		{
			case "hash_70c3e76d86ce9948":
			{
				self.var_ed23159a = "front";
				break;
			}
			case "hash_2919b10e087b7780":
			{
				self.var_ed23159a = "left";
				break;
			}
			case "hash_53ea1cfce477ae95":
			{
				self.var_ed23159a = "right";
				break;
			}
		}
	}
}

/*
	Name: function_39280c7a
	Namespace: namespace_63c7213c
	Checksum: 0xB9F44826
	Offset: 0x3348
	Size: 0x1AC
	Parameters: 0
	Flags: Linked
*/
function function_39280c7a()
{
	self endon(#"cleanup");
	self flag::clear("active");
	self flag::set("eater_leaving");
	self flag::wait_till_clear_all(array("eater_spawning", "eater_eating"));
	self flag::clear("eater_leaving");
	zm_utility::function_bc5a54a8(self.n_obj_id);
	self.n_obj_id = undefined;
	if(isdefined(self.var_ff3e0c53))
	{
		self.var_ff3e0c53 delete();
	}
	s_chest = self.var_fe2612fe[#"hash_6b1e5d8f9e70a70e"][0];
	if(isdefined(s_chest) && isdefined(self.var_2348a8fb))
	{
		s_chest.var_31919730 = self.var_31919730;
		s_chest.var_422ae63e = self.var_91c84189;
		s_chest.var_dae71351 = self.var_dae71351;
		s_chest.var_cc1fb2d0 = namespace_58949729::function_fd5e77fa(self.var_2348a8fb);
		level thread namespace_58949729::function_25979f32(s_chest, 1, self);
	}
	self thread function_a221b3a();
}

/*
	Name: function_29db9d5f
	Namespace: namespace_63c7213c
	Checksum: 0x7887779B
	Offset: 0x3500
	Size: 0x7F4
	Parameters: 3
	Flags: Linked
*/
function function_29db9d5f(ai_zombie, e_killer, var_f3a93cf1)
{
	if(!isdefined(var_f3a93cf1))
	{
		var_f3a93cf1 = 0;
	}
	self endon(#"cleanup");
	ai_zombie endoncallback(&function_64107d05, #"death");
	ai_zombie.instance = self;
	var_6a991844 = ai_zombie.origin;
	ai_zombie disableaimassist();
	mdl_anchor = util::spawn_model("tag_origin", var_6a991844, ai_zombie.angles);
	ai_zombie.var_c1a29994 = mdl_anchor;
	ai_zombie linkto(mdl_anchor);
	ai_zombie.script_animname = "zombie_eaten";
	ai_zombie.targetname = "zombie_eaten";
	ai_zombie.var_23ab2a9d = var_f3a93cf1;
	self thread function_fd47174(ai_zombie, mdl_anchor, var_f3a93cf1, e_killer);
	if(!var_f3a93cf1)
	{
		return;
	}
	self flag::set("looking_at_zombie");
	s_capture_point = self.var_fe2612fe[#"capture_point"][0];
	var_7caa77 = vectordot(anglestoforward(self.var_934133c0.angles), vectornormalize(var_6a991844 - s_capture_point.origin));
	if(var_7caa77 > 0.85)
	{
		self.var_ed23159a = "right";
		var_a4fc6c63 = "dragonhead_pre_eat_f";
		var_51d51f4e = "dragonhead_consume_zombie_fwd";
	}
	else
	{
		n_dot_right = vectordot(anglestoright(self.var_934133c0.angles), var_6a991844 - s_capture_point.origin);
		if(n_dot_right > 0)
		{
			if(self.var_ed23159a == "left")
			{
				var_95663e8c = "dragonhead_pre_eat_l_2_r";
			}
			self.var_ed23159a = "right";
			var_a4fc6c63 = "dragonhead_pre_eat_r";
			var_51d51f4e = "dragonhead_consume_zombie_right";
		}
		else
		{
			if(self.var_ed23159a == "right")
			{
				var_95663e8c = "dragonhead_pre_eat_r_2_l";
			}
			self.var_ed23159a = "left";
			var_a4fc6c63 = "dragonhead_pre_eat_l";
			var_51d51f4e = "dragonhead_consume_zombie_left";
		}
	}
	var_d6a665db = "aib_t9_zm_dragonhead";
	if(isdefined(var_95663e8c))
	{
		self.var_934133c0 scene::play(var_d6a665db, var_95663e8c);
	}
	var_ec3d3167 = gettime();
	self.var_934133c0 thread scene::play(var_d6a665db, var_a4fc6c63);
	self flag::wait_till("zombie_ready");
	self thread function_b2c1743d(ai_zombie);
	var_f9cc146 = self.var_f9cc146;
	var_a4a440a3 = "tag_mouth_fx_anim";
	v_dest_origin = var_f9cc146 gettagorigin(var_a4a440a3);
	v_dest_angles = vectortoangles(s_capture_point.origin - var_6a991844);
	n_move_dist = distance(v_dest_origin, mdl_anchor.origin);
	n_move_time = n_move_dist / 500;
	var_f415f7b8 = (float(gettime() - var_ec3d3167)) / 1000;
	var_4dd8873d = scene::function_8582657c(var_d6a665db, var_a4fc6c63) - var_f415f7b8;
	n_move_time = min(var_4dd8873d, n_move_time);
	n_move_time = max(n_move_time, 0.1);
	mdl_anchor moveto(v_dest_origin, n_move_time, n_move_time);
	mdl_anchor rotateto(v_dest_angles, n_move_time, n_move_time);
	mdl_anchor waittilltimeout(n_move_time, #"movedone");
	ai_zombie notify(#"hash_4ecc58f239a5807a");
	self.var_5ea363c notify(#"hash_cfab9a5468a4911");
	mdl_anchor scene::stop();
	ai_zombie scene::stop();
	mdl_anchor delete();
	self.var_934133c0 scene::play(var_d6a665db, var_51d51f4e, ai_zombie);
	playfxontag(#"maps/zm_escape/fx8_wolf_soul_charge_impact", var_f9cc146, var_a4a440a3);
	self flag::clear("eater_eating");
	self flag::clear("looking_at_zombie");
	self flag::clear("zombie_ready");
	if(!self flag::get("complete") && !self flag::get("times_up"))
	{
		self thread function_21700f1d();
	}
	if(is_true(ai_zombie.var_2e85cbf2))
	{
		ai_zombie clientfield::set("soul_capture_zombie_fire", 0);
	}
	ai_zombie ghost();
	ai_zombie val::reset("soul_capture_allowdeath", "allowdeath");
	ai_zombie val::reset("soul_capture_takedamage", "takedamage");
	if(isplayer(e_killer))
	{
		ai_zombie kill(ai_zombie.origin, e_killer, e_killer, undefined, undefined, 1);
	}
	else
	{
		ai_zombie kill(ai_zombie.origin, undefined, undefined, undefined, undefined, 1);
	}
}

/*
	Name: function_64107d05
	Namespace: namespace_63c7213c
	Checksum: 0xA61F2C6A
	Offset: 0x3D00
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function function_64107d05(notifyhash)
{
	if(isdefined(self.var_c1a29994))
	{
		self.var_c1a29994 delete();
	}
	if(isdefined(self.instance))
	{
		self.instance flag::clear("eater_eating");
		self.instance flag::clear("looking_at_zombie");
		self.instance flag::clear("zombie_ready");
	}
}

/*
	Name: function_fd47174
	Namespace: namespace_63c7213c
	Checksum: 0x5DAFD3D9
	Offset: 0x3DB0
	Size: 0x29C
	Parameters: 4
	Flags: Linked
*/
function function_fd47174(ai_zombie, mdl_anchor, var_f3a93cf1, e_killer)
{
	if(!isdefined(var_f3a93cf1))
	{
		var_f3a93cf1 = 0;
	}
	self endon(#"cleanup");
	ai_zombie endon(#"death");
	mdl_anchor scene::play("ai_zm_esc_zombie_dreamcatch_rise_sr", "impact", ai_zombie);
	if(isdefined(self.var_f9cc146))
	{
		self thread function_c2cda275(ai_zombie, mdl_anchor);
		var_1ace4b9e = self.var_f9cc146 gettagorigin("tag_mouth_fx_anim") - mdl_anchor.origin;
		var_1ace4b9e = vectorscale(var_1ace4b9e, 0.8);
		n_move_time = scene::function_8582657c("ai_zm_esc_zombie_dreamcatch_rise_sr", "rise");
		mdl_anchor moveto(mdl_anchor.origin + var_1ace4b9e, n_move_time, n_move_time);
		mdl_anchor waittilltimeout(n_move_time, #"movedone");
	}
	if(var_f3a93cf1)
	{
		self flag::set("zombie_ready");
	}
	else
	{
		ai_zombie val::reset("soul_capture_allowdeath", "allowdeath");
		ai_zombie val::reset("soul_capture_takedamage", "takedamage");
		gibserverutils::annihilate(ai_zombie);
		if(isplayer(e_killer))
		{
			ai_zombie kill(ai_zombie.origin, e_killer, e_killer, undefined, undefined, 1);
		}
		else
		{
			ai_zombie kill(ai_zombie.origin, getplayers()[0], getplayers()[0], undefined, undefined, 1);
		}
	}
}

/*
	Name: function_c2cda275
	Namespace: namespace_63c7213c
	Checksum: 0xBB51C54C
	Offset: 0x4058
	Size: 0xAC
	Parameters: 2
	Flags: Linked
*/
function function_c2cda275(ai_zombie, mdl_anchor)
{
	self endon(#"cleanup");
	ai_zombie endon(#"death", #"hash_4ecc58f239a5807a");
	if(isdefined(mdl_anchor) && isdefined(ai_zombie))
	{
		mdl_anchor scene::play("ai_zm_esc_zombie_dreamcatch_rise_sr", "rise", ai_zombie);
	}
	mdl_anchor scene::play("ai_zm_esc_zombie_dreamcatch_rise_sr", "shrink", ai_zombie);
}

/*
	Name: function_b2c1743d
	Namespace: namespace_63c7213c
	Checksum: 0xECD4963F
	Offset: 0x4110
	Size: 0x166
	Parameters: 1
	Flags: Linked
*/
function function_b2c1743d(ai_zombie)
{
	self endon(#"cleanup");
	ai_zombie endon(#"death");
	while(true)
	{
		var_be17187b = undefined;
		var_be17187b = ai_zombie waittill(#"hash_5f6e4fdffb8be314", #"hash_521d75b3c574f9e4", #"hash_2ed79d84ceeefab1", #"hash_a843aa9565277c2");
		switch(var_be17187b._notify)
		{
			case "hash_5f6e4fdffb8be314":
			{
				ai_zombie gibserverutils::gibhead(ai_zombie, 0);
				break;
			}
			case "hash_521d75b3c574f9e4":
			{
				ai_zombie gibserverutils::gibleftarm(ai_zombie, 0);
				break;
			}
			case "hash_2ed79d84ceeefab1":
			{
				ai_zombie gibserverutils::gibrightarm(ai_zombie, 0);
				break;
			}
			case "hash_a843aa9565277c2":
			{
				ai_zombie gibserverutils::gibleftleg(ai_zombie, 0);
				break;
			}
		}
	}
}

/*
	Name: function_a221b3a
	Namespace: namespace_63c7213c
	Checksum: 0x473D446
	Offset: 0x4280
	Size: 0x454
	Parameters: 1
	Flags: Linked
*/
function function_a221b3a(var_273eefec)
{
	var_5ea363c = self.var_5ea363c;
	if(!isdefined(var_5ea363c) || self flag::get("active"))
	{
		return;
	}
	var_5ea363c endon(#"death");
	if(isdefined(self.trigger))
	{
		self.trigger delete();
	}
	if(isdefined(self.var_ff3e0c53))
	{
		self.var_ff3e0c53 delete();
	}
	self.var_ff3e0c53 = namespace_8b6a9d79::spawn_script_model(self.var_fe2612fe[#"eyes"][0], #"tag_origin");
	self.var_ff3e0c53 linkto(var_5ea363c);
	playfxontag(#"hash_7e801405f1644de5", self.var_ff3e0c53, "tag_origin");
	if(self flag::get("times_up"))
	{
		self.var_934133c0 scene::play("aib_t9_zm_dragonhead", "dragonhead_outro", self.var_f9cc146);
		self.var_934133c0 scene::stop("aib_t9_zm_dragonhead", 1);
	}
	if(isdefined(var_5ea363c.var_bec42bc3))
	{
		var_5ea363c.var_bec42bc3 linkto(var_5ea363c);
	}
	if(isdefined(self.var_31309e7a))
	{
		self.var_31309e7a delete();
	}
	self.var_31309e7a = namespace_8b6a9d79::spawn_script_model(self.var_fe2612fe[#"eyes"][0], #"tag_origin");
	self.var_31309e7a linkto(var_5ea363c);
	playfxontag(#"hash_75b8555ea6711aff", self.var_31309e7a, "tag_origin");
	var_5ea363c clientfield::set("soul_capture_leave", 1);
	earthquake(0.1, 5, var_5ea363c.origin, 512);
	playrumbleonposition(#"artillery_rumble", var_5ea363c.origin);
	wait(1);
	playfxontag(#"hash_6041f3e753cd772e", self.var_31309e7a, "tag_origin");
	var_5ea363c connectpaths();
	var_5ea363c scene::play("p9_fxanim_sv_dragon_console_bundle", self.var_c9df36f, var_5ea363c);
	var_5ea363c clientfield::set("soul_capture_leave", 0);
	var_5ea363c thread util::deleteaftertimeandnetworkframe();
	if(isdefined(self.var_31309e7a))
	{
		self.var_31309e7a delete();
	}
	if(isdefined(self.var_ff3e0c53))
	{
		self.var_ff3e0c53 delete();
	}
	if(isdefined(self.var_f9cc146))
	{
		self.var_f9cc146 delete();
	}
	if(isdefined(self.var_bec42bc3))
	{
		self.var_bec42bc3 delete();
	}
}

/*
	Name: function_149da5dd
	Namespace: namespace_63c7213c
	Checksum: 0x92803F8B
	Offset: 0x46E0
	Size: 0x27C
	Parameters: 0
	Flags: Linked
*/
function function_149da5dd()
{
	self callback::function_52ac9652(#"hash_345e9169ebba28fb", &function_149da5dd);
	self notify(#"cleanup");
	self flag::clear("active");
	if(isdefined(self.n_obj_id))
	{
		zm_utility::function_bc5a54a8(self.n_obj_id);
		self.n_obj_id = undefined;
	}
	namespace_58949729::function_ccf9be41(self);
	self.var_934133c0 scene::stop("aib_t9_zm_dragonhead", 1);
	var_c3d060a6 = arraycombine(self.a_ai_zombies, self.var_be8ed486);
	function_1eaaceab(var_c3d060a6);
	foreach(ai_cleanup in var_c3d060a6)
	{
		ai_cleanup val::reset("soul_capture_allowdeath", "allowdeath");
		ai_cleanup val::reset("soul_capture_takedamage", "takedamage");
		ai_cleanup clientfield::set("soul_capture_zombie_fire", 0);
		ai_cleanup kill(undefined, undefined, undefined, undefined, undefined, 1);
	}
	if(isdefined(self.var_5ea363c))
	{
		namespace_85745671::function_b70e2a37(self.var_5ea363c);
		self.var_5ea363c clientfield::set("soul_capture_leave", 0);
		self.var_5ea363c thread util::delayed_delete(1);
	}
}

/*
	Name: function_f6ed3b36
	Namespace: namespace_63c7213c
	Checksum: 0xD9950BE
	Offset: 0x4968
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function function_f6ed3b36(instance)
{
	var_c0a0c72d = instance.var_fe2612fe[#"hole"][0];
	level.var_2606686d = namespace_8b6a9d79::spawn_script_model(var_c0a0c72d, #"hash_6e1380f2de74e0e6", 0, 0);
	level.var_2606686d hide();
	callback::on_spawned(&on_player_spawned);
}

/*
	Name: on_player_spawned
	Namespace: namespace_63c7213c
	Checksum: 0x69E14C10
	Offset: 0x4A08
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	self callback::function_d8abfc3d(#"hash_5989c4f123e1fb1a", &function_6e33721e);
}

/*
	Name: function_6e33721e
	Namespace: namespace_63c7213c
	Checksum: 0xF231C63C
	Offset: 0x4A48
	Size: 0x154
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6e33721e(eventstruct)
{
	if(!isplayer(self))
	{
		return;
	}
	grenade = eventstruct.projectile;
	s_result = undefined;
	s_result = grenade waittill(#"death", #"grenade_bounce", #"grenade_stuck");
	if(s_result._notify == "death")
	{
	}
	else if(s_result.entity === level.var_2606686d || s_result.hitent === level.var_2606686d)
	{
		/#
			iprintlnbold("");
		#/
		level thread function_6bee2a79(grenade.origin, vectortoangles(s_result.normal));
		grenade hide();
		grenade deletedelay();
	}
}

/*
	Name: function_6bee2a79
	Namespace: namespace_63c7213c
	Checksum: 0x87F89DBA
	Offset: 0x4BA8
	Size: 0xB4
	Parameters: 2
	Flags: Linked, Private
*/
function private function_6bee2a79(v_loc, v_angles)
{
	dropstruct = {#angles:v_angles, #origin:v_loc};
	dropstruct namespace_65181344::function_fd87c780(#"hash_1e5412cedbb79af1", 5, 3);
	/#
		if(getdvarint(#"hash_730311c63805303a", 0))
		{
			return;
		}
	#/
	function_14674c4f();
}

/*
	Name: function_14674c4f
	Namespace: namespace_63c7213c
	Checksum: 0xF25C63BD
	Offset: 0x4C68
	Size: 0xF4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_14674c4f()
{
	callback::remove_on_spawned(&on_player_spawned);
	foreach(player in getplayers())
	{
		player callback::function_52ac9652(#"hash_5989c4f123e1fb1a", &function_6e33721e);
	}
	if(isdefined(level.var_2606686d))
	{
		level.var_2606686d delete();
	}
}

