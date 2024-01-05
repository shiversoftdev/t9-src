#using script_113dd7f0ea2a1d4f;
#using script_5f261a5d57de5f7c;
#using script_4163291d6e693552;
#using script_34ab99a4ca1a43d;
#using script_12538a87a80a2978;
#using script_176597095ddfaa17;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_fasttravel.gsc;
#using script_5a525a75a8f1f7e4;
#using script_2618e0f3e5e11649;
#using script_1940fc077a028a81;
#using script_3411bb48d41bd3b;
#using script_3357acf79ce92f4b;
#using script_1029986e2bc8ca8e;
#using scripts\zm_common\zm_laststand.gsc;
#using script_27347f09888ad15;
#using script_70e9937eb8d47c8;
#using scripts\core_common\player\player_free_fall.gsc;
#using script_40fc784c60f9fa7b;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\fx_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using script_7fc996fe8678852;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_4db53432;

/*
	Name: function_c31d7491
	Namespace: namespace_4db53432
	Checksum: 0x649A7AAD
	Offset: 0x9F0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c31d7491()
{
	level notify(-1245815228);
}

/*
	Name: main
	Namespace: namespace_4db53432
	Checksum: 0x28ECF393
	Offset: 0xA10
	Size: 0x37C
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	clientfield::register("allplayers", "" + #"hash_63af42145e260fb5", 1, 2, "int");
	clientfield::register("toplayer", "" + #"hash_bd79b6ca5ca6bc0", 1, 2, "int");
	clientfield::register("toplayer", "" + #"dark_aether", 1, 1, "int");
	clientfield::register("toplayer", "" + #"hash_69409daf95eb8ffe", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_37895eb34ae6a3b0", 1, 1, "counter");
	clientfield::register("scriptmover", "" + #"hash_2a3141c1214d6eaa", 1, 1, "counter");
	clientfield::register("scriptmover", "" + #"hash_6e591596c3da1af6", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_bd6060c10031f98", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_32fff3d828ff2e0b", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_442f708f2ae92ef6", 1, 1, "counter");
	clientfield::register("world", "" + #"hash_77ba2c603a746873", 1, 1, "int");
	var_a409140d = #"hash_ccc16cf6360464b";
	objective_manager::function_b3464a7c(#"holdout", &init, &kickoff, #"holdout", #"hash_12475c4fdd2e51cb", #"hash_183fac0f1cab9dc6", 10, var_a409140d);
	callback::on_spawned(&on_player_spawned);
}

/*
	Name: init
	Namespace: namespace_4db53432
	Checksum: 0xA2C5D2E2
	Offset: 0xD98
	Size: 0x76A
	Parameters: 1
	Flags: Linked
*/
function init(instance)
{
	instance.s_start = instance.var_fe2612fe[#"hash_3966465c498df3a6"][0];
	instance.var_2fc49a65 = instance.var_fe2612fe[#"hash_75f147395e7d7368"];
	instance.a_s_barriers = instance.var_fe2612fe[#"barrier"];
	instance.a_s_teleports = instance.var_fe2612fe[#"hash_4bf4d3ae0a837717"];
	instance.var_d0682dc2 = instance.var_fe2612fe[#"hash_54ca9cfca796e0f1"];
	instance.var_4d0b3b87 = instance.var_fe2612fe[#"hash_41ae283ea203de66"][0];
	instance.var_7b2422b6 = instance.var_fe2612fe[#"hash_5d93de0c1cf69a98"][0];
	instance.var_1c417c7e = instance.var_fe2612fe[#"hash_51bc33e4360f4d65"][0];
	instance.var_fc1420f = instance.var_fe2612fe[#"charge"];
	instance.var_48e204a7 = instance.var_fe2612fe[#"jellyfish_small"];
	instance.var_53409bd8 = instance.var_fe2612fe[#"monkey"];
	instance.var_cf24b789 = namespace_8b6a9d79::spawn_script_model(instance.var_1c417c7e, instance.var_1c417c7e.model, 1);
	instance.var_e3532743 = namespace_8b6a9d79::spawn_script_model(instance.var_7b2422b6, instance.var_7b2422b6.model, 1);
	instance.var_e3532743 ghost();
	instance.var_8999a4bf = namespace_8b6a9d79::spawn_script_model(instance.var_1c417c7e, "tag_origin", 0);
	if(isdefined(instance.var_fe2612fe[#"hash_6873efb1dfa0ebea"]))
	{
		instance.var_3a745f8c = instance.var_fe2612fe[#"hash_6873efb1dfa0ebea"][0];
		namespace_c09ae6c3::function_9ed7339b(instance);
	}
	instance.var_220bb810 = instance.var_fe2612fe[#"hash_2bb7342aab04b85c"];
	instance.var_10cc9592 = arraycombine(instance.var_fe2612fe[#"front_2"], instance.var_220bb810);
	instance.var_2250b89e = arraycombine(instance.var_fe2612fe[#"front_3"], instance.var_10cc9592);
	instance.var_10019400 = arraycombine(instance.var_fe2612fe[#"hash_2bb7312aab04b343"], instance.var_2250b89e);
	instance.var_37fa3d92 = array(instance.var_220bb810, instance.var_10cc9592, instance.var_2250b89e, instance.var_10019400);
	foreach(var_68ee787c in instance.var_37fa3d92)
	{
		foreach(spawnpt in var_68ee787c)
		{
			spawnpt.n_spawned = 0;
		}
	}
	instance.var_543569ce = &function_4f7c9f11;
	instance.var_99ddab53 = 230;
	instance.var_8d583324 = int(sqr(1500));
	instance.var_258795c3 = int(sqr(1200));
	instance.var_7cf5f106 = int(sqr(900.0001));
	instance.var_a392bd1d = int(sqr(750));
	instance.var_96b168bc = int(sqr(600));
	instance.var_f4bfc837 = int(sqr(300));
	instance.var_f2094dc3 = int(sqr(225));
	instance.n_min_speed = 0.45;
	instance.a_models = [];
	instance thread function_90725ab1();
	instance thread function_f5087df2();
	instance thread function_208f2fc1();
	instance thread function_a3d0a278();
	instance thread function_a55eccfe();
	instance thread function_f04763d9();
	instance thread function_4e262e4();
	instance thread namespace_7589cf5c::vo_start("objectiveHoldoutAnnounce", "objectiveHoldoutAnnounceResponse");
	instance thread function_49115855();
	instance thread function_2d087a35();
	instance thread function_58a22a63();
	level.var_acd0f67e = 1;
	/#
		if(getdvarint(#"hash_4fb676ab0b8e52d7", 0))
		{
			instance.var_99ddab53 = getdvarint(#"hash_4fb676ab0b8e52d7", 0);
		}
	#/
}

/*
	Name: function_58a22a63
	Namespace: namespace_4db53432
	Checksum: 0xFB1E67DD
	Offset: 0x1510
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function function_58a22a63()
{
	namespace_ce1f29cc::function_c981b20b(self.origin, 2000);
	self waittill(#"objective_ended");
	wait(10);
	namespace_ce1f29cc::function_1724f4ac(self.origin, 2000);
}

/*
	Name: on_player_spawned
	Namespace: namespace_4db53432
	Checksum: 0xAA82C3DF
	Offset: 0x1578
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	if(level.var_7d45d0d4.var_3385b421.content_script_name === "holdout")
	{
		self.var_99582f14 = 1;
		self.var_1a4a768c = 1;
		self clientfield::set("" + #"hash_63af42145e260fb5", 0);
	}
}

/*
	Name: function_c36cb7b1
	Namespace: namespace_4db53432
	Checksum: 0x1A53C8F4
	Offset: 0x15F8
	Size: 0x60
	Parameters: 1
	Flags: Linked
*/
function function_c36cb7b1(params)
{
	if(isdefined(level.var_7d45d0d4.var_3385b421) && level.var_7d45d0d4.var_3385b421.var_b803db9c)
	{
		level.var_7d45d0d4.var_3385b421.var_b803db9c--;
	}
}

/*
	Name: on_zombie_killed
	Namespace: namespace_4db53432
	Checksum: 0xBBAD41C
	Offset: 0x1660
	Size: 0x60
	Parameters: 1
	Flags: Linked
*/
function on_zombie_killed(instance)
{
	if(isdefined(level.var_7d45d0d4.var_3385b421) && isdefined(level.var_7d45d0d4.var_3385b421.n_active))
	{
		level.var_7d45d0d4.var_3385b421.n_active--;
	}
}

/*
	Name: monkey_spawn
	Namespace: namespace_4db53432
	Checksum: 0x54DDEECB
	Offset: 0x16C8
	Size: 0xD8
	Parameters: 0
	Flags: Linked
*/
function monkey_spawn()
{
	foreach(var_2ccbc1ea in self.var_53409bd8)
	{
		monkey = namespace_8b6a9d79::spawn_script_model(var_2ccbc1ea, var_2ccbc1ea.model, 0);
		waitframe(1);
		if(isdefined(monkey))
		{
			monkey thread function_98da33e1();
			monkey thread function_7f20d6c2(self);
		}
	}
}

/*
	Name: function_98da33e1
	Namespace: namespace_4db53432
	Checksum: 0xF4546C03
	Offset: 0x17A8
	Size: 0x170
	Parameters: 0
	Flags: Linked
*/
function function_98da33e1()
{
	self endon(#"death");
	while(true)
	{
		n_index = randomint(3);
		switch(n_index)
		{
			case 0:
			{
				self thread scene::play(#"hash_2dc577a7afb42228", "idle_01", self);
				break;
			}
			case 1:
			{
				self thread scene::play(#"hash_2dc577a7afb42228", "idle_02", self);
				break;
			}
			case 2:
			{
				self thread scene::play(#"hash_2dc577a7afb42228", "idle_03", self);
				break;
			}
			default:
			{
				self thread scene::play(#"hash_2dc577a7afb42228", "idle_01", self);
				break;
			}
		}
		wait(function_21a3a673(15, 30));
	}
}

/*
	Name: function_7f20d6c2
	Namespace: namespace_4db53432
	Checksum: 0x20826ABB
	Offset: 0x1920
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_7f20d6c2(instance)
{
	instance waittill(#"objective_ended");
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: function_2d087a35
	Namespace: namespace_4db53432
	Checksum: 0xA3BFE0C4
	Offset: 0x1970
	Size: 0x1AC
	Parameters: 0
	Flags: Linked
*/
function function_2d087a35()
{
	self endon(#"objective_ended");
	var_35dfb407 = 0;
	while(!var_35dfb407)
	{
		a_players = getplayers();
		foreach(player in a_players)
		{
			if(distance2dsquared(player.origin, self.var_cf24b789.origin) <= 2250000)
			{
				if(player util::is_looking_at(self.var_cf24b789, 0.7, 0) || player util::is_looking_at(self.origin, 0.7, 1) || distance2dsquared(player.origin, self.var_cf24b789.origin) <= 250000)
				{
					var_35dfb407 = 1;
					break;
				}
			}
		}
		wait(0.5);
	}
	level namespace_7589cf5c::play_vo("objectiveHoldoutApproach");
}

/*
	Name: function_a3d0a278
	Namespace: namespace_4db53432
	Checksum: 0x60F12DC5
	Offset: 0x1B28
	Size: 0x16C
	Parameters: 0
	Flags: Linked
*/
function function_a3d0a278()
{
	self endon(#"objective_ended");
	level flag::wait_till_all(array(#"hash_10679ff0bf4d6c8d", #"intro_scene_done"));
	self.var_8999a4bf clientfield::set("" + #"hash_6e591596c3da1af6", 1);
	self.var_cf24b789 clientfield::set("" + #"hash_bd6060c10031f98", 1);
	self waittill(#"hash_4a46a299d2376baf");
	wait(2);
	self.var_8999a4bf clientfield::set("" + #"hash_6e591596c3da1af6", 0);
	self.var_cf24b789 clientfield::set("" + #"hash_bd6060c10031f98", 0);
	wait(1);
	self.var_cf24b789 delete();
}

/*
	Name: function_208f2fc1
	Namespace: namespace_4db53432
	Checksum: 0x405C3D6A
	Offset: 0x1CA0
	Size: 0x20C
	Parameters: 0
	Flags: Linked
*/
function function_208f2fc1()
{
	self endon(#"objective_ended", #"hash_4c2edcae0ab4fea9");
	while(true)
	{
		foreach(player in getplayers())
		{
			if(distance2dsquared(player.origin, self.origin) < self.var_8d583324)
			{
				if(!is_true(player.var_cbf09f9f))
				{
					player.var_cbf09f9f = 1;
					player thread function_55904a22(self, 1);
					if(player isinvehicle())
					{
						var_80730518 = player getvehicleoccupied();
						if(isdefined(var_80730518) && !is_true(var_80730518.var_273ccdff))
						{
							var_80730518.var_273ccdff = 1;
							var_80730518 thread function_251c4fac(self);
							var_80730518 thread function_10925841(self);
						}
					}
				}
				continue;
			}
			if(is_true(player.var_cbf09f9f))
			{
				player.var_cbf09f9f = 0;
				player thread function_55904a22(self, 0);
			}
		}
		wait(0.5);
	}
}

/*
	Name: function_10925841
	Namespace: namespace_4db53432
	Checksum: 0x273E7333
	Offset: 0x1EB8
	Size: 0x82
	Parameters: 1
	Flags: Linked
*/
function function_10925841(instance)
{
	self endon(#"death");
	instance flag::wait_till(#"hash_493cee968e218cc2");
	while(is_true(self.emped))
	{
		wait(1);
	}
	if(isdefined(self))
	{
		self.var_273ccdff = undefined;
		self.emped = undefined;
	}
}

/*
	Name: function_251c4fac
	Namespace: namespace_4db53432
	Checksum: 0x9AB1BC89
	Offset: 0x1F48
	Size: 0xA0
	Parameters: 1
	Flags: Linked
*/
function function_251c4fac(instance)
{
	self endon(#"death");
	instance endon(#"objective_ended", #"hash_493cee968e218cc2");
	self.emped = 1;
	while(true)
	{
		self thread player_vehicle::is_staircase_up();
		wait(0.1);
		while(self.abnormal_status.emped)
		{
			wait(0.1);
		}
		wait(0.1);
	}
}

/*
	Name: function_a55eccfe
	Namespace: namespace_4db53432
	Checksum: 0xDF6B96A8
	Offset: 0x1FF0
	Size: 0x188
	Parameters: 0
	Flags: Linked
*/
function function_a55eccfe()
{
	self endon(#"objective_ended", #"hash_4c2edcae0ab4fea9");
	n_delay = 5;
	while(true)
	{
		player = zm_utility::get_closest_player(self.var_cf24b789.origin);
		if(isdefined(player))
		{
			n_dist = int(distance2dsquared(self.var_cf24b789.origin, player.origin));
			if(n_dist <= self.var_f4bfc837)
			{
				n_delay = 1.1;
			}
			else
			{
				if(n_dist <= self.var_96b168bc)
				{
					n_delay = 2;
				}
				else
				{
					if(n_dist <= self.var_7cf5f106)
					{
						n_delay = 3;
					}
					else
					{
						if(n_dist <= self.var_258795c3)
						{
							n_delay = 4;
						}
						else
						{
							n_delay = 5;
						}
					}
				}
			}
		}
		wait(n_delay);
		self.var_cf24b789 clientfield::increment("" + #"hash_2a3141c1214d6eaa");
	}
}

/*
	Name: function_55904a22
	Namespace: namespace_4db53432
	Checksum: 0xAF4786A
	Offset: 0x2180
	Size: 0xE4
	Parameters: 2
	Flags: Linked
*/
function function_55904a22(instance, var_617b7cef)
{
	if(isdefined(self) && var_617b7cef)
	{
		self clientfield::set_to_player("" + #"hash_bd79b6ca5ca6bc0", 1);
		self thread function_8deb12b0(instance);
	}
	else if(isdefined(self))
	{
		self notify(#"outside");
		self clientfield::set_to_player("" + #"hash_bd79b6ca5ca6bc0", 0);
		wait(0.8);
		self setmovespeedscale(1);
	}
}

/*
	Name: function_8deb12b0
	Namespace: namespace_4db53432
	Checksum: 0x8AB0A94C
	Offset: 0x2270
	Size: 0x210
	Parameters: 1
	Flags: Linked
*/
function function_8deb12b0(instance)
{
	self notify("eaf0c2be7fe825d");
	self endon("eaf0c2be7fe825d");
	self endon(#"outside", #"disconnect", #"death");
	instance endon(#"objective_ended");
	while(true)
	{
		if(isalive(self) && isdefined(instance))
		{
			n_dist = self function_3dc3dd2d(instance);
		}
		if(isdefined(n_dist))
		{
			if(n_dist <= instance.var_f2094dc3)
			{
				n_speed = instance.n_min_speed;
			}
			else
			{
				if(n_dist <= instance.var_f4bfc837)
				{
					n_speed = 0.5;
				}
				else
				{
					if(n_dist <= instance.var_96b168bc)
					{
						n_speed = 0.6;
					}
					else
					{
						if(n_dist <= instance.var_a392bd1d)
						{
							n_speed = 0.7;
						}
						else
						{
							if(n_dist <= instance.var_7cf5f106)
							{
								n_speed = 0.8;
							}
							else
							{
								if(n_dist <= instance.var_258795c3)
								{
									n_speed = 0.9;
								}
								else
								{
									n_speed = 1;
								}
							}
						}
					}
				}
			}
		}
		if(self namespace_e86ffa8::function_3623f9d1(0))
		{
			n_speed = n_speed + (n_speed * 0.2);
			if(n_speed > 1)
			{
				n_speed = 1;
			}
			self setmovespeedscale(n_speed);
		}
		else
		{
			self setmovespeedscale(n_speed);
		}
		wait(0.5);
	}
}

/*
	Name: function_3dc3dd2d
	Namespace: namespace_4db53432
	Checksum: 0x8E392194
	Offset: 0x2488
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_3dc3dd2d(instance)
{
	if(isdefined(instance) && isalive(self))
	{
		return distance2dsquared(self.origin, instance.origin);
	}
}

/*
	Name: player_damage
	Namespace: namespace_4db53432
	Checksum: 0x5DE9B11F
	Offset: 0x24E8
	Size: 0xC8
	Parameters: 0
	Flags: None
*/
function player_damage()
{
	self notify("395efd7dec94ace");
	self endon("395efd7dec94ace");
	self endon(#"outside", #"disconnect");
	while(true)
	{
		if(zm_utility::is_player_valid(self))
		{
			self dodamage(2, self.origin, undefined, undefined, "none", "MOD_DEATH_CIRCLE", 0, level.weaponnone);
			self function_bc82f900("damage_light");
		}
		wait(1);
	}
}

/*
	Name: function_1f3a6644
	Namespace: namespace_4db53432
	Checksum: 0x35479301
	Offset: 0x25B8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_1f3a6644()
{
	self thread function_7683d028();
	self thread function_570d286d();
}

/*
	Name: function_49115855
	Namespace: namespace_4db53432
	Checksum: 0x97F2A129
	Offset: 0x25F8
	Size: 0x100
	Parameters: 0
	Flags: Linked
*/
function function_49115855()
{
	self endon(#"objective_ended", #"bomb");
	while(true)
	{
		a_players = function_a1ef346b(undefined, self.origin, 800);
		if(is_true(a_players.size) && isdefined(self.var_cf24b789) && !level flag::get(#"in_dark_side"))
		{
			self.var_cf24b789 namespace_7589cf5c::function_ac709d66(self, #"hash_64697db39a227a4a");
			wait(randomfloatrange(10, 15));
		}
		wait(0.1);
	}
}

/*
	Name: function_7683d028
	Namespace: namespace_4db53432
	Checksum: 0xE516DE26
	Offset: 0x2700
	Size: 0x12C
	Parameters: 0
	Flags: Linked
*/
function function_7683d028()
{
	self endon(#"objective_ended");
	self waittill(#"bomb");
	self flag::wait_till(#"hash_22d7493735317dd2");
	self.var_cf24b789 namespace_7589cf5c::function_ac709d66(self, #"hash_bc13063e9aa86fa");
	wait(4);
	level thread namespace_7589cf5c::play_vo("objectiveHoldoutStart");
	self flag::wait_till(#"teleport_start");
	wait(5.5);
	self flag::wait_till(#"hash_493cee968e218cc2");
	wait(0.5);
	level namespace_7589cf5c::play_vo("objectiveHoldoutArrival");
	wait(0.5);
	self thread function_b2bc128b();
}

/*
	Name: function_831de44a
	Namespace: namespace_4db53432
	Checksum: 0xD44DB189
	Offset: 0x2838
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function function_831de44a()
{
	wait(0.5);
	s_pt = array::random(self.a_s_teleports);
	if(isdefined(s_pt))
	{
		playrumbleonposition("sr_dark_aether_rumble", s_pt.origin);
	}
}

/*
	Name: function_570d286d
	Namespace: namespace_4db53432
	Checksum: 0xC1321398
	Offset: 0x28A0
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function function_570d286d()
{
	self waittill(#"objective_ended");
	if(isdefined(self.success) && self.success)
	{
		level namespace_7589cf5c::play_vo("objectiveHoldoutEnd");
		wait(0.5);
		level thread namespace_7589cf5c::play_vo("objectiveHoldoutEndResponse");
		level flag::set(#"hash_1460b3afd614fb6c");
	}
}

/*
	Name: function_521d95ab
	Namespace: namespace_4db53432
	Checksum: 0xBC757325
	Offset: 0x2948
	Size: 0x958
	Parameters: 0
	Flags: Linked
*/
function function_521d95ab()
{
	var_44d9d6da = namespace_8b6a9d79::function_31e8da78(self.location.destination, "explore_chests_large");
	var_635b6832 = namespace_8b6a9d79::function_31e8da78(self.location.destination, "explore_chests");
	var_145e2d3c = namespace_8b6a9d79::function_31e8da78(self.location.destination, "explore_chests_small");
	var_5854a1b2 = namespace_8b6a9d79::function_31e8da78(self.location.destination, "harvest_essence");
	var_f3c03df4 = namespace_8b6a9d79::function_31e8da78(self.location.destination, "harvest_essence_small");
	var_3357c159 = namespace_8b6a9d79::function_31e8da78(self.location.destination, "harvest_scrap");
	var_6201c191 = namespace_8b6a9d79::function_31e8da78(self.location.destination, "loot_pods");
	self thread function_b8df700f(var_6201c191);
	var_6fd87ba6 = getentarray("chalk_model", "targetname");
	var_ba9ff008 = getentarray("trigger_wallbuy", "targetname");
	foreach(var_edaaa42b in var_ba9ff008)
	{
		var_edaaa42b triggerenable(0);
	}
	foreach(chalk_model in var_6fd87ba6)
	{
		chalk_model hide();
	}
	if(isdefined(var_6201c191.a_models))
	{
		foreach(model in var_6201c191.a_models)
		{
			if(isdefined(model))
			{
				model thread loot_pod(self);
			}
		}
	}
	if(isdefined(var_44d9d6da.a_models))
	{
		foreach(model in var_44d9d6da.a_models)
		{
			if(isdefined(model))
			{
				model thread function_1b3fe142(self);
			}
		}
	}
	if(isdefined(var_635b6832.a_models))
	{
		foreach(model in var_635b6832.a_models)
		{
			if(isdefined(model))
			{
				model thread function_1b3fe142(self);
			}
		}
	}
	if(isdefined(var_145e2d3c.a_models))
	{
		foreach(model in var_145e2d3c.a_models)
		{
			if(isdefined(model))
			{
				model thread function_1b3fe142(self);
			}
		}
	}
	if(isdefined(var_5854a1b2.a_items))
	{
		foreach(item in var_5854a1b2.a_items)
		{
			if(isdefined(item))
			{
				item thread function_2d31704b(self);
			}
		}
	}
	if(isdefined(var_f3c03df4.a_items))
	{
		foreach(item in var_f3c03df4.a_items)
		{
			if(isdefined(item))
			{
				item thread function_2d31704b(self);
			}
		}
	}
	if(isdefined(var_3357c159.a_items))
	{
		foreach(item in var_3357c159.a_items)
		{
			if(isdefined(item))
			{
				item thread function_2d31704b(self);
			}
		}
	}
	a_triggers = getentarray("explore_chest_trigger", "targetname");
	foreach(trigger in a_triggers)
	{
		trigger triggerenable(0);
	}
	self waittill(#"return");
	a_triggers = getentarray("explore_chest_trigger", "targetname");
	foreach(trigger in a_triggers)
	{
		trigger triggerenable(1);
	}
	foreach(var_edaaa42b in var_ba9ff008)
	{
		var_edaaa42b triggerenable(1);
	}
	foreach(chalk_model in var_6fd87ba6)
	{
		chalk_model show();
	}
}

/*
	Name: function_b8df700f
	Namespace: namespace_4db53432
	Checksum: 0x5A67227B
	Offset: 0x32A8
	Size: 0x400
	Parameters: 1
	Flags: Linked
*/
function function_b8df700f(var_6201c191)
{
	if(isdefined(var_6201c191))
	{
		self.var_55b8433b = [];
		var_5504b0b = var_6201c191.var_fe2612fe[#"hash_702f75ad56e88d1c"];
		if(!isdefined(var_5504b0b))
		{
			return;
		}
		foreach(var_f721c918 in var_5504b0b)
		{
			a_spawn_points = var_f721c918.var_fe2612fe[#"hash_49340510783e32e4"];
			foreach(spawn in a_spawn_points)
			{
				if(math::cointoss(50))
				{
					model = #"p9_gold_surcrystal_medium_01";
					str_scene = "p9_zm_gold_sur_crystal_medium_01_bundle";
				}
				else
				{
					model = #"p9_gold_surcrystal_medium_02";
					str_scene = "p9_zm_gold_sur_crystal_medium_02_bundle";
				}
				e_pod = util::spawn_model(model, spawn.origin, spawn.angles, undefined, 1);
				if(isdefined(e_pod))
				{
					if(!isdefined(self.var_55b8433b))
					{
						self.var_55b8433b = [];
					}
					else if(!isarray(self.var_55b8433b))
					{
						self.var_55b8433b = array(self.var_55b8433b);
					}
					self.var_55b8433b[self.var_55b8433b.size] = e_pod;
					e_pod setscale(randomfloatrange(0.85, 1.2));
					e_pod function_619a5c20();
					e_pod val::set("loot_pod", "takedamage", 1);
					e_pod.health = 5;
					e_pod thread scene::play(str_scene, e_pod);
					e_pod fx::play(#"hash_6583defa5c93e609", e_pod.origin, e_pod.angles, #"hash_285fd9bc53c292d8", 1);
					level thread function_8265e656(e_pod);
					util::wait_network_frame();
				}
			}
		}
	}
	self waittill(#"objective_ended");
	if(isdefined(self.var_55b8433b))
	{
		foreach(pod in self.var_55b8433b)
		{
			pod delete();
		}
	}
}

/*
	Name: function_8265e656
	Namespace: namespace_4db53432
	Checksum: 0x29242524
	Offset: 0x36B0
	Size: 0x12C
	Parameters: 1
	Flags: Linked
*/
function function_8265e656(e_pod)
{
	e_pod endon(#"death");
	e_pod callback::function_d8abfc3d(#"hash_5f0caa4b2d44fedf", &function_1cabf2e9);
	while(isdefined(e_pod) && e_pod.health > 0)
	{
		s_result = undefined;
		s_result = e_pod waittill(#"damage", #"death");
		if(isplayer(s_result.attacker) && isalive(s_result.attacker))
		{
			s_result.attacker util::show_hit_marker();
		}
	}
	e_pod callback::callback(#"hash_5f0caa4b2d44fedf", s_result);
}

/*
	Name: function_1cabf2e9
	Namespace: namespace_4db53432
	Checksum: 0x750E057D
	Offset: 0x37E8
	Size: 0x124
	Parameters: 1
	Flags: Linked, Private
*/
function private function_1cabf2e9(s_result)
{
	if(isplayer(s_result.attacker) || isai(s_result.attacker) || isvehicle(s_result.attacker))
	{
		self namespace_58949729::function_8ef626e3();
		playsoundatposition(#"hash_54c5c342b84cf845", self.origin);
		if(isplayer(s_result.attacker) && s_result.attacker isinvehicle())
		{
			var_80730518 = s_result.attacker getvehicleoccupied();
			if(isdefined(var_80730518))
			{
				var_80730518 thread namespace_58949729::function_df0dbb31();
			}
		}
	}
}

/*
	Name: function_2d31704b
	Namespace: namespace_4db53432
	Checksum: 0x545B439A
	Offset: 0x3918
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function function_2d31704b(instance)
{
	self endon(#"death");
	self movez(-1000, 0.05);
	instance waittill(#"return");
	self movez(1000, 0.05);
}

/*
	Name: function_1b3fe142
	Namespace: namespace_4db53432
	Checksum: 0x85E075A7
	Offset: 0x39A0
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_1b3fe142(instance)
{
	self endon(#"death");
	self hide();
	instance waittill(#"return");
	self show();
}

/*
	Name: loot_pod
	Namespace: namespace_4db53432
	Checksum: 0xE399DEB4
	Offset: 0x3A10
	Size: 0x11C
	Parameters: 1
	Flags: Linked
*/
function loot_pod(instance)
{
	self endon(#"death");
	self notify(#"hash_285fd9bc53c292d8");
	self hide();
	self val::set("item_damage", "takedamage", 0);
	instance waittill(#"return");
	self show();
	self val::reset("item_damage", "takedamage");
	if(self.health > 0)
	{
		self fx::play(#"hash_6583defa5c93e609", self.origin, self.angles, #"hash_285fd9bc53c292d8", 1);
	}
}

/*
	Name: function_f5087df2
	Namespace: namespace_4db53432
	Checksum: 0x89A766FE
	Offset: 0x3B38
	Size: 0x234
	Parameters: 0
	Flags: Linked
*/
function function_f5087df2()
{
	s_result = undefined;
	s_result = self waittill(#"objective_ended", #"hash_8202877a3aadac8");
	objective_manager::stop_timer();
	level flag::clear(#"in_dark_side");
	if(s_result._notify === #"hash_8202877a3aadac8")
	{
		if(self.targetname !== "objective_sanatorium_holdout")
		{
			level util::set_lighting_state(1);
		}
		if(isdefined(self.var_cf24b789))
		{
			self.var_cf24b789 delete();
		}
		if(isdefined(self.var_a0e46e99))
		{
			self.var_a0e46e99 delete();
		}
		if(isdefined(self.var_e3532743))
		{
			self.var_e3532743 delete();
		}
	}
	foreach(player in getplayers())
	{
		if(isdefined(player))
		{
			player thread function_55904a22(self, 0);
			level.var_31028c5d thread prototype_hud::set_active_obj_visibility(player, 0);
		}
	}
	if(isdefined(self.success) && self.success)
	{
		namespace_cda50904::function_a92a93e9(self.var_4d0b3b87.origin, self.var_4d0b3b87.angles);
	}
}

/*
	Name: bomb_timer
	Namespace: namespace_4db53432
	Checksum: 0xD0829B6
	Offset: 0x3D78
	Size: 0x1CE
	Parameters: 0
	Flags: Linked
*/
function bomb_timer()
{
	self endon(#"death");
	playsoundatposition(#"hash_56452f5fcd5ed800", self.origin);
	n_timer = 240;
	while(n_timer)
	{
		var_67c95546 = int(n_timer / 60);
		var_16782a41 = int((n_timer % 60) / 10);
		var_b30bc24e = (n_timer % 60) % 10;
		if(isdefined(self))
		{
			self thread function_e02a26f6();
			self showpart("tag_slot1_digi_" + 0);
			self showpart("tag_slot2_digi_" + var_67c95546);
			self showpart("tag_slot3_digi_" + var_16782a41);
			self showpart("tag_slot4_digi_" + var_b30bc24e);
			self showpart("tag_sign");
		}
		wait(0.5);
		if(isdefined(self))
		{
			self hidepart("tag_sign");
		}
		wait(0.5);
		n_timer = n_timer - 1;
	}
}

/*
	Name: function_e02a26f6
	Namespace: namespace_4db53432
	Checksum: 0xFFC1AD09
	Offset: 0x3F50
	Size: 0x38C
	Parameters: 0
	Flags: Linked
*/
function function_e02a26f6()
{
	if(isdefined(self))
	{
		self hidepart("tag_slot1_digi_0");
		self hidepart("tag_slot1_digi_1");
		self hidepart("tag_slot2_digi_0");
		self hidepart("tag_slot2_digi_1");
		self hidepart("tag_slot2_digi_2");
		self hidepart("tag_slot2_digi_3");
		self hidepart("tag_slot2_digi_4");
		self hidepart("tag_slot2_digi_5");
		self hidepart("tag_slot2_digi_6");
		self hidepart("tag_slot2_digi_7");
		self hidepart("tag_slot2_digi_8");
		self hidepart("tag_slot2_digi_9");
		self hidepart("tag_slot3_digi_0");
		self hidepart("tag_slot3_digi_1");
		self hidepart("tag_slot3_digi_2");
		self hidepart("tag_slot3_digi_3");
		self hidepart("tag_slot3_digi_4");
		self hidepart("tag_slot3_digi_5");
		self hidepart("tag_slot4_digi_0");
		self hidepart("tag_slot4_digi_1");
		self hidepart("tag_slot4_digi_2");
		self hidepart("tag_slot4_digi_3");
		self hidepart("tag_slot4_digi_4");
		self hidepart("tag_slot4_digi_5");
		self hidepart("tag_slot4_digi_6");
		self hidepart("tag_slot4_digi_7");
		self hidepart("tag_slot4_digi_8");
		self hidepart("tag_slot4_digi_9");
	}
}

/*
	Name: function_90725ab1
	Namespace: namespace_4db53432
	Checksum: 0xD48D1302
	Offset: 0x42E8
	Size: 0x6BC
	Parameters: 0
	Flags: Linked
*/
function function_90725ab1()
{
	self.starttrigger triggerenable(0);
	self.var_5c6a2bf5 = namespace_8b6a9d79::function_cfa4f1a0(self.var_fc1420f, #"p9_fxanim_zm_ndu_essence_bomb_body_mod", 0);
	foreach(var_e35c2428 in self.var_5c6a2bf5)
	{
		var_e35c2428 ghost();
	}
	objective_setinvisibletoall(self.var_e55c8b4e);
	n_objective_id = zm_utility::function_f5a222a8(#"hash_12475c4fdd2e51cb", self.var_cf24b789.origin + vectorscale((0, 0, 1), 32));
	var_23e96cb3 = spawn("trigger_radius_use", self.origin, 0, 240, 96, 1);
	var_23e96cb3 triggerignoreteam();
	var_23e96cb3 setcursorhint("HINT_NOICON");
	var_23e96cb3 sethintstring(#"hash_b044f24a01e8b24");
	var_23e96cb3 usetriggerrequirelookat(1);
	self.var_cf24b789 zm_utility::function_747180ea(n_objective_id, undefined, var_23e96cb3);
	s_result = undefined;
	s_result = var_23e96cb3 waittill(#"trigger");
	self.starttrigger triggerenable(1);
	self.starttrigger useby(s_result.activator);
	self.var_cf24b789 zm_utility::function_48d9a9c9();
	zm_utility::function_bc5a54a8(n_objective_id);
	level flag::set(#"in_dark_side");
	level flag::clear(#"hash_44074059e3987765");
	self notify(#"bomb");
	wait(0.5);
	foreach(var_e35c2428 in self.var_5c6a2bf5)
	{
		var_e35c2428 show();
		var_e35c2428 thread bomb_timer();
	}
	var_23e96cb3 delete();
	wait(1);
	self.var_cf24b789 clientfield::increment("" + #"hash_37895eb34ae6a3b0");
	waitframe(1);
	self.var_cf24b789 thread function_a9232706(self);
	self thread function_8118e3a5();
	self thread function_26a50e5e();
	self thread function_44fe71e3();
	self thread function_582f2cb();
	self thread function_ca5f0c9();
	self thread function_1c798ee9();
	self thread function_40c4c7ae();
	playsoundatposition(#"hash_4a2101ba821730fb", (0, 0, 0));
	foreach(player in getplayers())
	{
		player clientfield::set_to_player("" + #"hash_69409daf95eb8ffe", 1);
	}
	wait(2);
	foreach(player in getplayers())
	{
		player clientfield::set_to_player("" + #"hash_bd79b6ca5ca6bc0", 2);
	}
	wait(0.1);
	level thread namespace_7589cf5c::function_3899cfea(self.var_cf24b789.origin, 2000);
	wait(4.4);
	self flag::set(#"teleport_start");
	revive_players();
	wait(0.1);
	self thread teleport_players();
	self thread function_70cfe9f9();
}

/*
	Name: revive_players
	Namespace: namespace_4db53432
	Checksum: 0x265BEE7B
	Offset: 0x49B0
	Size: 0xB8
	Parameters: 0
	Flags: Linked
*/
function revive_players()
{
	foreach(player in getplayers())
	{
		if(isdefined(player) && player laststand::player_is_in_laststand())
		{
			player zm_laststand::auto_revive(player, 0, 0);
		}
	}
}

/*
	Name: function_a9232706
	Namespace: namespace_4db53432
	Checksum: 0x7E57DEF5
	Offset: 0x4A70
	Size: 0x1AC
	Parameters: 1
	Flags: Linked
*/
function function_a9232706(instance)
{
	players = function_a1ef346b(undefined, self.origin, 300);
	foreach(player in players)
	{
		targetorigin = (player.origin[0], player.origin[1], self.origin[2]);
		var_a6470558 = vectornormalize(targetorigin - self.origin);
		player thread function_3a8bd5a3(self);
		player function_bc82f900("damage_heavy");
		player playerknockback(1);
		player applyknockback(100, var_a6470558);
		player playerknockback(0);
	}
	instance flag::set(#"hash_22d7493735317dd2");
}

/*
	Name: function_3a8bd5a3
	Namespace: namespace_4db53432
	Checksum: 0xE25258E
	Offset: 0x4C28
	Size: 0xE6
	Parameters: 1
	Flags: Linked
*/
function function_3a8bd5a3(var_3128fb28)
{
	self endon(#"disconnect");
	if(self util::is_player_looking_at(var_3128fb28.origin, 0.6, 1, var_3128fb28))
	{
		if(!is_true(self.var_e758cbce))
		{
			self.var_e758cbce = 1;
			self gestures::function_56e00fbf(#"hash_271cf84de195bb95", undefined, 1);
		}
	}
	wait(1);
	if(isdefined(self) && is_true(self.var_e758cbce))
	{
		self stopgestureviewmodel();
		self.var_e758cbce = undefined;
	}
}

/*
	Name: function_40c4c7ae
	Namespace: namespace_4db53432
	Checksum: 0xAACE37A9
	Offset: 0x4D18
	Size: 0x288
	Parameters: 0
	Flags: Linked
*/
function function_40c4c7ae()
{
	var_d3b70fb0 = getvehiclearray();
	var_453e0a89 = [];
	s_pt = array::random(self.a_s_teleports);
	foreach(var_f5304f7 in var_d3b70fb0)
	{
		if(distance2dsquared(s_pt.origin, var_f5304f7.origin) <= sqr(3000))
		{
			var_f5304f7.e_linkto = util::spawn_model("tag_origin", var_f5304f7.origin);
			waitframe(1);
			var_f5304f7 linkto(var_f5304f7.e_linkto);
			var_f5304f7 ghost();
			var_f5304f7.e_linkto movez(1000, 2);
			var_453e0a89[var_453e0a89.size] = var_f5304f7;
		}
	}
	self waittill(#"objective_ended");
	foreach(var_f5304f7 in var_453e0a89)
	{
		var_f5304f7 show();
		var_f5304f7.e_linkto movez(-1000, 2);
		var_f5304f7.e_linkto waittill(#"movedone");
		wait(1);
		var_f5304f7.e_linkto delete();
	}
}

/*
	Name: kickoff
	Namespace: namespace_4db53432
	Checksum: 0x21052783
	Offset: 0x4FA8
	Size: 0x244
	Parameters: 2
	Flags: Linked
*/
function kickoff(instance, activator)
{
	if(isplayer(activator))
	{
		instance notify(#"hash_4c2edcae0ab4fea9");
		instance thread function_521d95ab();
		instance thread function_fa324f46();
		instance thread function_17f1d0f3();
		instance thread function_1f3a6644();
		instance thread monkey_spawn();
		foreach(player in getplayers())
		{
			level.var_31028c5d prototype_hud::set_main_objective_string(player, #"hash_65641bd73530220a");
		}
		wait(5);
		foreach(player in getplayers())
		{
			level.var_31028c5d prototype_hud::set_active_objective_string(player, #"hash_65641bd73530220a");
			level.var_31028c5d prototype_hud::set_active_obj_visibility(player, 2);
		}
		wait(5);
		instance notify(#"hash_4a46a299d2376baf");
		instance thread function_2d1c1fb2();
	}
}

/*
	Name: function_17f1d0f3
	Namespace: namespace_4db53432
	Checksum: 0x7A304E58
	Offset: 0x51F8
	Size: 0x6A
	Parameters: 0
	Flags: Linked
*/
function function_17f1d0f3()
{
	self.var_5e36739b = self namespace_7589cf5c::function_df911075();
	self.var_61c57c53 = self namespace_7589cf5c::function_1b53cdc7();
	self.var_5de17ec9 = self namespace_7589cf5c::function_56fa33d9();
	self.var_2133c784 = 0;
	self.var_b803db9c = 0;
}

/*
	Name: function_fa324f46
	Namespace: namespace_4db53432
	Checksum: 0x525B74DE
	Offset: 0x5270
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function function_fa324f46()
{
	wait(2);
	showmiscmodels("sv_holdout_aetherfungus");
	self waittill(#"objective_ended");
	hidemiscmodels("sv_holdout_aetherfungus");
}

/*
	Name: function_2d1c1fb2
	Namespace: namespace_4db53432
	Checksum: 0x60BC2BF0
	Offset: 0x52D0
	Size: 0x16C
	Parameters: 0
	Flags: Linked
*/
function function_2d1c1fb2()
{
	self endon(#"hash_8202877a3aadac8");
	level thread function_354e27f9();
	self thread function_cd1515dc();
	self thread function_bc87dbab();
	self thread spawn_zombies();
	self thread namespace_7589cf5c::function_f10301b0();
	level waittill(#"survival_holdout_dest");
	self flag::set(#"hash_493cee968e218cc2");
	self thread function_9a090a4f();
	self thread function_5f3c406e();
	objective_manager::start_timer(self.var_99ddab53, #"hash_65641bd73530220a");
	self notify(#"stop_spawn");
	self notify(#"hash_36719991d2a7edc6");
	wait(10);
	level flag::set(#"hash_44074059e3987765");
}

/*
	Name: function_9a090a4f
	Namespace: namespace_4db53432
	Checksum: 0x48BD2A7
	Offset: 0x5448
	Size: 0x10C
	Parameters: 0
	Flags: Linked
*/
function function_9a090a4f()
{
	self endon(#"objective_ended", #"hash_8202877a3aadac8");
	s_pt = array::random(self.a_s_teleports);
	self.var_15dd1523 = util::spawn_model("tag_origin", s_pt.origin + vectorscale((0, 0, 1), 2000));
	self waittill(#"hash_36719991d2a7edc6");
	self.var_15dd1523 playsound(#"hash_237c57212810b7ec");
	wait(0.25);
	if(isdefined(self.var_15dd1523))
	{
		self.var_15dd1523 playrumbleonentity(#"sr_payload_portal_final_rumble");
	}
}

/*
	Name: function_8118e3a5
	Namespace: namespace_4db53432
	Checksum: 0xFF942C86
	Offset: 0x5560
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function function_8118e3a5()
{
	self.var_cf24b789 playrumblelooponentity(#"sr_holdout_aether_mass_rumble");
	wait(5);
	self.var_cf24b789 stoprumble(#"sr_holdout_aether_mass_rumble");
}

/*
	Name: function_bc87dbab
	Namespace: namespace_4db53432
	Checksum: 0xFA5B2BBB
	Offset: 0x55C8
	Size: 0x21C
	Parameters: 0
	Flags: Linked
*/
function function_bc87dbab()
{
	self endon(#"objective_ended");
	if(isdefined(self.var_cf24b789))
	{
		self.var_a0e46e99 = util::spawn_model("p9_fxanim_sv_holdout_crystal_mod", self.var_cf24b789.origin);
		if(isdefined(self.var_a0e46e99))
		{
			self.var_a0e46e99 scene::init(#"hash_4669768be98af1be", self.var_a0e46e99);
		}
	}
	if(isdefined(self.var_5c6a2bf5))
	{
		foreach(var_e35c2428 in self.var_5c6a2bf5)
		{
			var_e35c2428 delete();
		}
	}
	self waittill(#"return");
	level waittill(#"survival_holdout_dest");
	if(isdefined(self.var_e3532743))
	{
		self.var_e3532743 delete();
	}
	if(isdefined(self.var_a0e46e99))
	{
		playrumbleonposition("sr_holdout_aether_mass_rumble", self.origin);
		self.var_a0e46e99 scene::play(#"hash_4669768be98af1be", self.var_a0e46e99);
		self.var_a0e46e99 delete();
	}
	wait(1);
	namespace_7589cf5c::function_3899cfea();
	objective_manager::objective_ended(self, 1);
}

/*
	Name: function_cd1515dc
	Namespace: namespace_4db53432
	Checksum: 0x47589B90
	Offset: 0x57F0
	Size: 0x228
	Parameters: 0
	Flags: Linked
*/
function function_cd1515dc()
{
	a_doors = [];
	foreach(barrier in self.a_s_barriers)
	{
		if(barrier.model === "barrier_door_single" || barrier.model === "barrier_door_double")
		{
			doors = function_c3d68575(barrier.origin, vectorscale((1, 1, 1), 20));
			foreach(door in doors)
			{
				if(door.script_noteworthy === #"hash_4d1fb8524fdfd254")
				{
					a_doors[a_doors.size] = door;
					setdynentenabled(door, 0);
				}
			}
		}
	}
	self waittill(#"objective_ended");
	foreach(door in a_doors)
	{
		if(isdefined(door))
		{
			setdynentenabled(door, 1);
		}
	}
}

/*
	Name: function_70cfe9f9
	Namespace: namespace_4db53432
	Checksum: 0x2292903F
	Offset: 0x5A20
	Size: 0x170
	Parameters: 0
	Flags: Linked
*/
function function_70cfe9f9()
{
	a_vehicles = getvehiclearray();
	foreach(vehicle in a_vehicles)
	{
		if(isdefined(vehicle))
		{
			vehicle val::set("protect", "takedamage", 0);
		}
	}
	self waittill(#"objective_ended");
	a_vehicles = getvehiclearray();
	foreach(vehicle in a_vehicles)
	{
		if(isdefined(vehicle))
		{
			vehicle val::reset("protect", "takedamage");
		}
	}
}

/*
	Name: function_354e27f9
	Namespace: namespace_4db53432
	Checksum: 0x325BF742
	Offset: 0x5B98
	Size: 0xA4
	Parameters: 0
	Flags: Linked
*/
function function_354e27f9()
{
	setdvar(#"hash_60c10d05ac70cd3a", 0);
	self waittilltimeout(180, #"end_game", #"hash_8202877a3aadac8", #"objective_ended", #"hash_36719991d2a7edc6", #"hash_80008492ea92df4");
	setdvar(#"hash_60c10d05ac70cd3a", 1);
}

/*
	Name: function_582f2cb
	Namespace: namespace_4db53432
	Checksum: 0x3CA05148
	Offset: 0x5C48
	Size: 0x2C8
	Parameters: 0
	Flags: Linked
*/
function function_582f2cb()
{
	if(isdefined(self.var_fe2612fe[#"hash_441da645c3f27eea"]))
	{
		self.a_mdl_blockers = [];
		foreach(s_blocker in self.var_fe2612fe[#"hash_441da645c3f27eea"])
		{
			if(self.targetname === "objective_golova_holdout" && s_blocker.origin == (-9937, 8419, 176))
			{
				s_blocker.origin = s_blocker.origin + (9, 31, 0);
				self.a_mdl_blockers[self.a_mdl_blockers.size] = namespace_8b6a9d79::spawn_script_model(s_blocker, s_blocker.model, 1);
				continue;
			}
			self.a_mdl_blockers[self.a_mdl_blockers.size] = namespace_8b6a9d79::spawn_script_model(s_blocker, s_blocker.model, 1);
		}
		foreach(mdl_blocker in self.a_mdl_blockers)
		{
			mdl_blocker disconnectpaths();
			mdl_blocker ghost();
		}
	}
	self waittill(#"objective_ended");
	if(isdefined(self.a_mdl_blockers))
	{
		foreach(mdl_blocker in self.a_mdl_blockers)
		{
			mdl_blocker connectpaths();
			wait(0.1);
			mdl_blocker delete();
		}
	}
}

/*
	Name: function_44fe71e3
	Namespace: namespace_4db53432
	Checksum: 0xE6FD7645
	Offset: 0x5F18
	Size: 0x43C
	Parameters: 0
	Flags: Linked
*/
function function_44fe71e3()
{
	self.var_f9bfb787 = [];
	foreach(s_barrier in self.a_s_barriers)
	{
		var_936c52b5 = namespace_8b6a9d79::spawn_script_model(s_barrier, s_barrier.model, 1);
		if(isdefined(s_barrier.script_int))
		{
			var_936c52b5.n_id = s_barrier.script_int;
		}
		self.var_f9bfb787[self.var_f9bfb787.size] = var_936c52b5;
	}
	foreach(var_936c52b5 in self.var_f9bfb787)
	{
		var_936c52b5 disconnectpaths();
		if(isdefined(var_936c52b5.n_id))
		{
			var_936c52b5.var_3b6eef70 = 1;
		}
		if(var_936c52b5.model === #"barrier_door_double")
		{
			var_936c52b5.a_nodes = getnodesinradius(var_936c52b5.origin, 80, 20, 50);
		}
		else
		{
			var_936c52b5.a_nodes = getnodesinradius(var_936c52b5.origin, 60, 20, 50);
		}
		foreach(node in var_936c52b5.a_nodes)
		{
			setenablenode(node, 0);
		}
	}
	self flag::wait_till(#"hash_13ea21cff2eb28ff");
	foreach(var_936c52b5 in self.var_f9bfb787)
	{
		foreach(node in var_936c52b5.a_nodes)
		{
			setenablenode(node, 1);
		}
		var_936c52b5 connectpaths();
	}
	wait(0.1);
	foreach(var_936c52b5 in self.var_f9bfb787)
	{
		var_936c52b5 delete();
	}
	if(isdefined(self.mdl_blocker))
	{
		self.mdl_blocker delete();
	}
}

/*
	Name: teleport_players
	Namespace: namespace_4db53432
	Checksum: 0xA5BAD694
	Offset: 0x6360
	Size: 0x4DC
	Parameters: 0
	Flags: Linked
*/
function teleport_players()
{
	self endon(#"objective_ended", #"hash_8202877a3aadac8");
	level.var_f3901984 = 5;
	a_players = getplayers();
	for(i = 0; i < a_players.size; i++)
	{
		a_players[i].var_1a4a768c = 1;
		a_players[i] thread player_teleport(self.a_s_teleports[i], 1);
		a_players[i] thread function_55904a22(self, 0);
	}
	wait(1.5);
	level clientfield::set("" + #"hash_77ba2c603a746873", 1);
	exploder::exploder("lgtexp_dark_aether");
	exploder::exploder("fxexp_aether_state");
	namespace_d0ab5955::function_f1ad7968(self.location.destination);
	if(self.targetname !== "objective_sanatorium_holdout")
	{
		level util::set_lighting_state(1);
	}
	self waittill(#"hash_36719991d2a7edc6");
	foreach(player in getplayers())
	{
		player clientfield::set("" + #"hash_63af42145e260fb5", 0);
	}
	wait(0.5);
	level thread namespace_7589cf5c::function_3899cfea();
	wait(0.5);
	level thread namespace_7589cf5c::play_vo("objectiveHoldoutEndTaunt");
	wait(1);
	foreach(player in getplayers())
	{
		player clientfield::set_to_player("" + #"hash_69409daf95eb8ffe", 1);
	}
	player playsoundtoplayer(#"hash_3ad475ec3b0fc78f", player);
	wait(6);
	revive_players();
	wait(0.5);
	self notify(#"return");
	a_players = function_a1ef346b();
	for(i = 0; i < a_players.size; i++)
	{
		a_players[i] thread player_teleport(self.var_d0682dc2[i], 0);
		a_players[i].var_1a4a768c = undefined;
	}
	wait(1);
	namespace_d0ab5955::function_d4dec4e8(self.location.destination);
	self flag::set(#"hash_13ea21cff2eb28ff");
	level clientfield::set("" + #"hash_77ba2c603a746873", 0);
	exploder::exploder_stop("lgtexp_dark_aether");
	exploder::exploder_stop("fxexp_aether_state");
	if(self.targetname !== "objective_sanatorium_holdout")
	{
		level util::set_lighting_state(0);
	}
}

/*
	Name: player_teleport
	Namespace: namespace_4db53432
	Checksum: 0x5A761FE4
	Offset: 0x6848
	Size: 0x234
	Parameters: 2
	Flags: Linked
*/
function player_teleport(s_pos, b_state)
{
	self endon(#"disconnect");
	self player_free_fall::allow_player_basejumping(0);
	self thread zm_fasttravel::function_66d020b0(undefined, undefined, undefined, "survival_holdout_dest", s_pos, undefined, undefined, 1, 1, undefined, undefined, 1);
	wait(1);
	if(self isinvehicle())
	{
		self unlink();
	}
	self clientfield::set_to_player("" + #"hash_69409daf95eb8ffe", 0);
	self flag::wait_till(#"hash_66d02a378fc362d4");
	if(self isinvehicle())
	{
		self unlink();
		util::wait_network_frame();
	}
	self setorigin(s_pos.origin);
	self setplayerangles(s_pos.angles);
	self player_free_fall::allow_player_basejumping(1);
	self clientfield::set_to_player("" + #"dark_aether", b_state);
	waitframe(1);
	if(b_state)
	{
		self.var_99582f14 = 1;
		wait(2);
		self clientfield::set("" + #"hash_63af42145e260fb5", b_state);
	}
	else
	{
		self.var_99582f14 = undefined;
	}
	self flag::clear(#"hash_66d02a378fc362d4");
}

/*
	Name: function_ca5f0c9
	Namespace: namespace_4db53432
	Checksum: 0x2CB578AD
	Offset: 0x6A88
	Size: 0x192
	Parameters: 0
	Flags: Linked
*/
function function_ca5f0c9()
{
	zm_barricade::function_fdc4ca3c();
	self.var_13ba88d2 = self.var_fe2612fe[#"barricade_window"];
	if(!isarray(self.var_13ba88d2))
	{
		return;
	}
	foreach(var_c67ba39f in self.var_13ba88d2)
	{
		var_c67ba39f thread zm_barricade::function_14354831();
	}
	self flag::wait_till(#"hash_13ea21cff2eb28ff");
	foreach(var_c67ba39f in self.var_13ba88d2)
	{
		if(isdefined(var_c67ba39f.e_barricade))
		{
			var_c67ba39f.e_barricade delete();
		}
	}
	wait(1);
	self.var_13ba88d2 = undefined;
}

/*
	Name: function_1c798ee9
	Namespace: namespace_4db53432
	Checksum: 0x1BB82F2F
	Offset: 0x6C28
	Size: 0x21A
	Parameters: 0
	Flags: Linked
*/
function function_1c798ee9()
{
	self endon(#"objective_ended");
	switch(self.targetname)
	{
		case "hash_5104e1cc429fe8fa":
		{
			str_trigger = "trigger_holdout_duga";
			break;
		}
		case "hash_667dbf380c0e0a74":
		{
			self thread function_be1b951c();
			str_trigger = "trigger_holdout_forest";
			break;
		}
		case "objective_golova_holdout":
		{
			self thread function_be1b951c();
			str_trigger = "trigger_holdout_golova";
			break;
		}
		case "objective_sanatorium_holdout":
		{
			str_trigger = "trigger_holdout_sanatorium";
			break;
		}
		case "hash_738b01c2d977fd2e":
		{
			str_trigger = "trigger_holdout_ski";
			break;
		}
		case "hash_29783b5c80e9b4c":
		{
			str_trigger = "trigger_holdout_weather_station";
			break;
		}
		case "hash_1acc7d36ec4f0a1b":
		{
			str_trigger = "trigger_holdout_zoo";
			break;
		}
	}
	if(isdefined(str_trigger))
	{
		var_520491cd = getent(str_trigger, "targetname");
		while(true)
		{
			s_result = undefined;
			s_result = var_520491cd waittill(#"trigger");
			if(is_true(s_result.activator.var_98f1f37c))
			{
				s_result.activator.var_98f1f37c = undefined;
				s_result.activator.var_1d8cde9 = undefined;
			}
			if(is_true(s_result.activator.no_powerups))
			{
				s_result.activator.no_powerups = undefined;
			}
		}
	}
}

/*
	Name: function_be1b951c
	Namespace: namespace_4db53432
	Checksum: 0xD58B81E8
	Offset: 0x6E50
	Size: 0xC0
	Parameters: 0
	Flags: Linked
*/
function function_be1b951c()
{
	models = getentarraybytype(6);
	foreach(model in models)
	{
		if(model.model === #"hash_6e47d6576612543c")
		{
			self thread function_ed93e125(model);
		}
	}
}

/*
	Name: function_ed93e125
	Namespace: namespace_4db53432
	Checksum: 0xD037E521
	Offset: 0x6F18
	Size: 0x124
	Parameters: 1
	Flags: Linked
*/
function function_ed93e125(model)
{
	self flag::wait_till(#"teleport_start");
	model hide();
	if(isdefined(model.trigger))
	{
		model.trigger triggerenable(0);
	}
	if(isdefined(model.objectiveid))
	{
		objective_setinvisibletoall(model.objectiveid);
	}
	self waittill(#"objective_ended");
	model show();
	if(isdefined(model.trigger))
	{
		model.trigger triggerenable(1);
	}
	wait(0.5);
	if(isdefined(model.objectiveid))
	{
		objective_setvisibletoall(model.objectiveid);
	}
}

/*
	Name: function_26a50e5e
	Namespace: namespace_4db53432
	Checksum: 0x7CCC5AD4
	Offset: 0x7048
	Size: 0x2E0
	Parameters: 0
	Flags: Linked
*/
function function_26a50e5e()
{
	self.var_603d86e5 = namespace_8b6a9d79::function_cfa4f1a0(self.var_2fc49a65, #"hash_2e91c0a44dae13d4", 1);
	foreach(var_936c52b5 in self.var_603d86e5)
	{
		if(isdefined(var_936c52b5))
		{
			var_936c52b5 util::break_glass(40);
		}
		var_936c52b5.e_fx = util::spawn_model("tag_origin", var_936c52b5.origin, var_936c52b5.angles);
		if(isdefined(var_936c52b5.e_fx))
		{
			var_936c52b5.e_fx clientfield::set("" + #"hash_32fff3d828ff2e0b", 1);
			var_936c52b5.var_3b6eef70 = 1;
		}
		var_936c52b5 ghost();
	}
	self flag::wait_till(#"hash_13ea21cff2eb28ff");
	foreach(var_936c52b5 in self.var_603d86e5)
	{
		if(isdefined(var_936c52b5.e_fx))
		{
			var_936c52b5.e_fx clientfield::set("" + #"hash_32fff3d828ff2e0b", 0);
		}
	}
	wait(3);
	foreach(var_936c52b5 in self.var_603d86e5)
	{
		if(isdefined(var_936c52b5.e_fx))
		{
			var_936c52b5.e_fx delete();
		}
		if(isdefined(var_936c52b5))
		{
			var_936c52b5 delete();
		}
	}
}

/*
	Name: spawn_zombies
	Namespace: namespace_4db53432
	Checksum: 0xE654A37A
	Offset: 0x7330
	Size: 0x23C
	Parameters: 0
	Flags: Linked
*/
function spawn_zombies()
{
	self endon(#"objective_ended", #"hash_36719991d2a7edc6");
	n_players = getplayers().size;
	level.var_ff87f555 = &function_b94de89a;
	switch(n_players)
	{
		case 1:
		{
			var_fd6a4001 = 3;
			var_102fe58c = 4;
			var_3b743c0c = 5;
			break;
		}
		case 2:
		{
			var_fd6a4001 = 6;
			var_102fe58c = 8;
			var_3b743c0c = 10;
			break;
		}
		case 3:
		{
			var_fd6a4001 = 9;
			var_102fe58c = 12;
			var_3b743c0c = 15;
			break;
		}
		case 4:
		{
			var_fd6a4001 = 12;
			var_102fe58c = 15;
			var_3b743c0c = 18;
			break;
		}
		default:
		{
			var_fd6a4001 = 15;
			var_102fe58c = 17;
			var_3b743c0c = 22;
			break;
		}
	}
	self flag::wait_till(#"wave_start");
	self thread function_34ac205(var_fd6a4001 + level.var_b48509f9, 0);
	self flag::wait_till(#"wave_start");
	self thread function_34ac205(var_102fe58c + level.var_b48509f9, 1);
	self flag::wait_till(#"wave_start");
	self thread function_34ac205(var_3b743c0c + level.var_b48509f9, 2);
}

/*
	Name: function_b2bc128b
	Namespace: namespace_4db53432
	Checksum: 0xEC45DA71
	Offset: 0x7578
	Size: 0x134
	Parameters: 0
	Flags: Linked
*/
function function_b2bc128b()
{
	self endon(#"objective_ended", #"hash_36719991d2a7edc6");
	self thread function_831de44a();
	level thread namespace_7589cf5c::play_vo("objectiveHoldoutArrivalTaunt");
	wait(2);
	self flag::set(#"wave_start");
	wait(45);
	self notify(#"stop_spawn");
	self thread function_953aa05e();
	self thread function_e14d27d9();
	self flag::wait_till(#"wave_start");
	wait(60);
	self notify(#"stop_spawn");
	self thread function_953aa05e();
	self thread function_e14d27d9();
}

/*
	Name: function_953aa05e
	Namespace: namespace_4db53432
	Checksum: 0x337AEE84
	Offset: 0x76B8
	Size: 0xFC
	Parameters: 0
	Flags: Linked
*/
function function_953aa05e()
{
	self endon(#"objective_ended", #"hash_36719991d2a7edc6");
	s_result = undefined;
	s_result = self waittilltimeout(15, #"wave_done");
	wait(2);
	playsoundatposition(#"hash_c05e2aae1de0567", (0, 0, 0));
	wait(3);
	self thread function_831de44a();
	level thread namespace_7589cf5c::play_vo("objectiveHoldoutArrivalTaunt");
	self flag::set(#"wave_start");
	self flag::clear(#"wave_done");
}

/*
	Name: function_e14d27d9
	Namespace: namespace_4db53432
	Checksum: 0x1F3A21EB
	Offset: 0x77C0
	Size: 0xC8
	Parameters: 0
	Flags: Linked
*/
function function_e14d27d9()
{
	self endon(#"objective_ended", #"hash_36719991d2a7edc6", #"wave_done");
	wait(2);
	while(true)
	{
		a_zombies = getentarray("holdout_zombie", "targetname");
		if(isdefined(a_zombies) && a_zombies.size > 0)
		{
			wait(1);
		}
		else
		{
			self flag::set(#"wave_done");
		}
		wait(0.5);
	}
}

/*
	Name: function_34ac205
	Namespace: namespace_4db53432
	Checksum: 0x172BBE04
	Offset: 0x7890
	Size: 0x536
	Parameters: 2
	Flags: Linked
*/
function function_34ac205(n_active, n_wave)
{
	self endon(#"objective_ended", #"hash_36719991d2a7edc6", #"stop_spawn");
	self flag::clear(#"wave_start");
	self.n_active = 0;
	n_players = getplayers().size;
	switch(n_players)
	{
		case 1:
		{
			n_delay = 3;
			break;
		}
		case 2:
		{
			n_delay = 2;
			break;
		}
		case 3:
		{
			n_delay = 1.5;
			break;
		}
		case 4:
		{
			n_delay = 1;
			break;
		}
	}
	n_wait = n_delay - n_wave;
	if(n_wait <= 0)
	{
		n_wait = 0.25;
	}
	a_s_spawnpts = self function_94e50668(n_wave);
	a_s_locs = arraycopy(a_s_spawnpts);
	while(true)
	{
		level flag::wait_till("spawn_zombies");
		if(self.n_active < n_active)
		{
			var_7ecdee63 = function_2631fff1(self, level.var_b48509f9);
			if(namespace_7589cf5c::function_82e262cf(var_7ecdee63))
			{
				if(isdefined(self.var_38c710c3))
				{
					n_cooldown = namespace_7589cf5c::function_190c51a9();
					var_be32c966 = (float(gettime()) / 1000) - self.var_38c710c3;
					if(var_be32c966 < n_cooldown)
					{
						var_7ecdee63 = namespace_7589cf5c::function_b9e4c169();
					}
					else
					{
						self.var_38c710c3 = undefined;
					}
				}
				if(self.var_2133c784 >= self.var_61c57c53 || self.var_b803db9c >= self.var_5de17ec9 || n_wave < 1)
				{
					var_7ecdee63 = namespace_7589cf5c::function_b9e4c169();
				}
			}
			if(!a_s_locs.size)
			{
				a_s_locs = arraycopy(a_s_spawnpts);
			}
			s_loc = a_s_locs[0];
			arrayremovevalue(a_s_locs, a_s_locs[0]);
			ai_spawned = namespace_85745671::function_9d3ad056(var_7ecdee63, s_loc.origin, s_loc.angles, "holdout_zombie");
			wait(0.1);
			if(isdefined(ai_spawned))
			{
				if(namespace_7589cf5c::function_82e262cf(ai_spawned.aitype))
				{
					self.var_38c710c3 = float(gettime()) / 1000;
					self.var_2133c784++;
					self.var_b803db9c++;
					ai_spawned callback::function_d8abfc3d(#"on_ai_killed", &function_c36cb7b1);
				}
				else
				{
					ai_spawned callback::function_d8abfc3d(#"on_ai_killed", &on_zombie_killed);
				}
				ai_spawned.var_1d8cde9 = 1;
				ai_spawned.var_98f1f37c = 1;
				ai_spawned.no_powerups = 1;
				ai_spawned thread zombie_attack();
				ai_spawned callback::function_d8abfc3d(#"hash_34b65342cbfdadac", &function_1968f31a);
				ai_spawned callback::function_d8abfc3d(#"hash_1518febf00439d5", &function_c9a4ec83);
				ai_spawned callback::function_d8abfc3d(#"bad_path", &function_426da116);
				self.n_active++;
				s_loc.n_spawned++;
			}
		}
		wait(n_wait);
	}
}

/*
	Name: function_1968f31a
	Namespace: namespace_4db53432
	Checksum: 0x344DD2DD
	Offset: 0x7DD0
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_1968f31a()
{
	self.var_4fe4e626 = 1;
	if(isdefined(self.favoriteenemy.last_valid_position))
	{
		self setgoal(self.favoriteenemy.last_valid_position);
	}
}

/*
	Name: function_b94de89a
	Namespace: namespace_4db53432
	Checksum: 0xB268506E
	Offset: 0x7E28
	Size: 0x156
	Parameters: 0
	Flags: Linked
*/
function function_b94de89a()
{
	if(!isdefined(level.var_7d45d0d4.var_3385b421.a_s_teleports[0].origin))
	{
		level.var_ff87f555 = undefined;
		return undefined;
	}
	if(!self flag::get(#"hash_4594c073edde106f") || self flag::get(#"hash_77a09d6234b7284f"))
	{
		return undefined;
	}
	foreach(struct in level.var_7d45d0d4.var_3385b421.a_s_teleports)
	{
		if(ispointonnavmesh(struct.origin, self))
		{
			self flag::set(#"hash_33fc8800693f354e");
			return struct.origin;
		}
	}
	return undefined;
}

/*
	Name: function_426da116
	Namespace: namespace_4db53432
	Checksum: 0xF4EE4B02
	Offset: 0x7F88
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function function_426da116()
{
	if(flag::get(#"hash_33fc8800693f354e"))
	{
		self flag::clear(#"hash_4594c073edde106f");
		return;
	}
	self flag::set(#"hash_4594c073edde106f");
}

/*
	Name: function_c9a4ec83
	Namespace: namespace_4db53432
	Checksum: 0x42ED3EEC
	Offset: 0x7FF8
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function function_c9a4ec83()
{
	if(!isdefined(self.var_a5add0c0.traversal_blocker))
	{
		return;
	}
	blocker = self.var_a5add0c0.traversal_blocker;
	if(blocker.targetname === "barricade_window")
	{
		self flag::set(#"hash_77a09d6234b7284f");
	}
}

/*
	Name: function_2631fff1
	Namespace: namespace_4db53432
	Checksum: 0x45910F1
	Offset: 0x8070
	Size: 0x202
	Parameters: 2
	Flags: Linked
*/
function function_2631fff1(instance, var_661691aa)
{
	var_908ce45b = 0;
	switch(var_661691aa)
	{
		case 1:
		{
			var_6017f33e = namespace_679a22ba::function_ca209564(#"hash_104bda7b1aa01214");
			break;
		}
		case 2:
		{
			var_6017f33e = namespace_679a22ba::function_ca209564(#"hash_104bdd7b1aa0172d");
			break;
		}
		case 3:
		{
			var_6017f33e = namespace_679a22ba::function_ca209564(#"hash_104bdc7b1aa0157a");
			break;
		}
		case 4:
		{
			var_6017f33e = namespace_679a22ba::function_ca209564(#"hash_104bd77b1aa00cfb");
			break;
		}
		case 5:
		{
			var_6017f33e = namespace_679a22ba::function_ca209564(#"hash_104bd67b1aa00b48");
			break;
		}
		case 6:
		{
			var_6017f33e = namespace_679a22ba::function_ca209564(#"hash_104bd97b1aa01061");
			break;
		}
		case 7:
		{
			var_6017f33e = namespace_679a22ba::function_ca209564(#"hash_104bd87b1aa00eae");
			break;
		}
		default:
		{
			var_6017f33e = namespace_679a22ba::function_ca209564(#"hash_104bd37b1aa0062f");
			break;
		}
	}
	return var_6017f33e.var_990b33df;
}

/*
	Name: function_6b130ce9
	Namespace: namespace_4db53432
	Checksum: 0x59BDB9FF
	Offset: 0x8280
	Size: 0xC4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_6b130ce9()
{
	if(!isdefined(level.var_7d45d0d4.var_3385b421.a_s_teleports[0].origin))
	{
		return false;
	}
	spot = level.var_7d45d0d4.var_3385b421.a_s_teleports[0].origin;
	if(distancesquared(self.origin, spot) > sqr(200))
	{
		self.var_6ca50f69 = 0;
		self namespace_e292b080::zombieupdategoal(spot);
		return true;
	}
	return false;
}

/*
	Name: zombie_attack
	Namespace: namespace_4db53432
	Checksum: 0x9A796D60
	Offset: 0x8350
	Size: 0xF8
	Parameters: 0
	Flags: Linked
*/
function zombie_attack()
{
	self endon(#"death");
	self callback::function_d8abfc3d(#"hash_4afe635f36531659", &function_fd68cae4);
	self flag::set(#"hash_52d6a75cdbf101f3");
	self.var_6bc9818 = &function_6b130ce9;
	while(true)
	{
		if(isalive(self))
		{
			player = awareness::function_d7fedde2(self);
			if(isdefined(player))
			{
				awareness::function_c241ef9a(self, player, 11);
				wait(10);
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_fd68cae4
	Namespace: namespace_4db53432
	Checksum: 0x55F8A14B
	Offset: 0x8450
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_fd68cae4()
{
	if(self.archetype === #"zombie")
	{
		if(level.var_b48509f9 < 5)
		{
			self namespace_85745671::function_9758722("sprint");
		}
	}
}

/*
	Name: function_94e50668
	Namespace: namespace_4db53432
	Checksum: 0x49AC1AA2
	Offset: 0x84A8
	Size: 0x102
	Parameters: 1
	Flags: Linked
*/
function function_94e50668(n_wave)
{
	a_s_spawnpts = [];
	n_players = getplayers().size;
	switch(n_players)
	{
		case 1:
		{
			a_s_spawnpts = self.var_37fa3d92[n_wave];
			break;
		}
		case 2:
		{
			a_s_spawnpts = self.var_37fa3d92[n_wave + 1];
			break;
		}
		case 3:
		case 4:
		{
			a_s_spawnpts = self.var_37fa3d92[3];
			break;
		}
	}
	if(!isdefined(a_s_spawnpts))
	{
		a_s_spawnpts = self.var_2250b89e;
	}
	a_s_spawnpts = array::randomize(a_s_spawnpts);
	return a_s_spawnpts;
}

/*
	Name: function_4f7c9f11
	Namespace: namespace_4db53432
	Checksum: 0x7110571E
	Offset: 0x85B8
	Size: 0xD4
	Parameters: 1
	Flags: Linked
*/
function function_4f7c9f11(player_index)
{
	if(!isdefined(player_index))
	{
		player_index = 0;
	}
	struct = self.a_s_teleports[0];
	if(isdefined(self.a_s_teleports[player_index]))
	{
		struct = self.a_s_teleports[player_index];
	}
	while(positionwouldtelefrag(struct.origin))
	{
		player_index = (player_index + 1) % self.a_s_teleports.size;
		struct = self.a_s_teleports[player_index];
		waitframe(1);
	}
	return {#angles:struct.angles, #origin:struct.origin};
}

/*
	Name: function_f04763d9
	Namespace: namespace_4db53432
	Checksum: 0x96EEB9E2
	Offset: 0x8698
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function function_f04763d9()
{
	self waittill(#"objective_ended");
	if(self.success && !is_true(self.player_downed))
	{
		level scoreevents::doscoreeventcallback("scoreEventSR", {#allplayers:1, #scoreevent:"holdout_perfect_defense_zm"});
	}
}

/*
	Name: function_4e262e4
	Namespace: namespace_4db53432
	Checksum: 0x1C8988AE
	Offset: 0x8730
	Size: 0x3A
	Parameters: 0
	Flags: Linked
*/
function function_4e262e4()
{
	self endon(#"objective_ended");
	level waittill(#"hash_18a0e5282b038637");
	self.player_downed = 1;
}

/*
	Name: function_5f3c406e
	Namespace: namespace_4db53432
	Checksum: 0x504C152C
	Offset: 0x8778
	Size: 0x290
	Parameters: 0
	Flags: Linked
*/
function function_5f3c406e()
{
	var_f2afb269 = namespace_8b6a9d79::function_cfa4f1a0(self.var_48e204a7, #"p9_fxanim_zm_silver_jellyfish_small_01_mod", 0);
	var_ca7b2d46 = getvehiclenodearray("jellyfish_start", "targetname");
	foreach(var_1cde429c in var_f2afb269)
	{
		var_1cde429c.nd_start = array::get_all_closest(var_1cde429c.origin, var_ca7b2d46)[0];
		var_1cde429c.var_b30a9f82 = vehicle::spawn(undefined, "jellyfish_small", "fake_vehicle", var_1cde429c.origin, var_1cde429c.angles);
		waitframe(1);
		if(isdefined(var_1cde429c.var_b30a9f82))
		{
			var_1cde429c linkto(var_1cde429c.var_b30a9f82, "tag_origin", (0, 0, 0), vectorscale((0, 1, 0), 180));
			var_1cde429c clientfield::increment("" + #"hash_442f708f2ae92ef6");
			var_1cde429c thread function_35559739(self);
		}
	}
	self waittill(#"objective_ended", #"hash_8202877a3aadac8");
	foreach(var_1cde429c in var_f2afb269)
	{
		if(isdefined(var_1cde429c.var_b30a9f82))
		{
			var_1cde429c.var_b30a9f82 delete();
		}
		if(isdefined(var_1cde429c))
		{
			var_1cde429c delete();
		}
	}
}

/*
	Name: function_35559739
	Namespace: namespace_4db53432
	Checksum: 0x72970896
	Offset: 0x8A10
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function function_35559739(instance)
{
	instance endon(#"objective_ended");
	self endon(#"death");
	while(true)
	{
		self.var_b30a9f82 thread vehicle::get_on_and_go_path(self.nd_start);
		self.var_b30a9f82 waittill(#"reached_end_node");
	}
}

