#using script_2cb831533cab2794;
#using script_113dd7f0ea2a1d4f;
#using scripts\zm_common\ai\zm_ai_utility.gsc;
#using script_72401f526ba71638;
#using script_5f261a5d57de5f7c;
#using script_4163291d6e693552;
#using script_12538a87a80a2978;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using script_3411bb48d41bd3b;
#using script_3357acf79ce92f4b;
#using script_1029986e2bc8ca8e;
#using script_27347f09888ad15;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using script_7bacb32f8222fa3e;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using script_7fc996fe8678852;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace objective_retrieval;

/*
	Name: function_795c9ee2
	Namespace: objective_retrieval
	Checksum: 0x3A2806A0
	Offset: 0x768
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_795c9ee2()
{
	level notify(-186190317);
}

/*
	Name: main
	Namespace: objective_retrieval
	Checksum: 0xBD4DAFD2
	Offset: 0x788
	Size: 0x1EC
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	clientfield::register("toplayer", "" + #"hash_502dbbefce1f656c", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_25f023cad32eccf0", 1, 1, "counter");
	clientfield::register("scriptmover", "" + #"hash_29bff1aafecc8591", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_7e6957dfc36e2214", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_5bc7fe725b36bd67", 1, 1, "int");
	objective_manager::function_b3464a7c(#"retrieval", &init, &function_44ae8976, #"retrieval", #"hash_449cd1c65196f3a8", #"hash_70343e0c02c9f7b9", 7, #"hash_ed63c368c1fca8f");
	callback::on_laststand(&function_f1ae312a);
}

/*
	Name: init
	Namespace: objective_retrieval
	Checksum: 0x3E45B85C
	Offset: 0x980
	Size: 0x504
	Parameters: 1
	Flags: Linked
*/
function init(instance)
{
	instance.var_53ba65b = [];
	instance.a_models = [];
	foreach(s_instance in instance.var_fe2612fe[#"retrieval"])
	{
		s_instance.s_start = s_instance.var_fe2612fe[#"hash_55beda67733e86c0"][0];
		s_instance.var_5ea363c = namespace_8b6a9d79::spawn_script_model(s_instance, #"hash_572ef2c74e1d80ef");
		s_instance.var_5ea363c.var_809a5ab9[0] = s_instance.var_fe2612fe[#"component_a"];
		s_instance.var_5ea363c.var_809a5ab9[1] = s_instance.var_fe2612fe[#"hash_43131190cc1b7b5d"];
		if(isdefined(s_instance.var_fe2612fe[#"hash_7e2234980528a279"]))
		{
			s_instance.mdl_truck = namespace_8b6a9d79::spawn_script_model(s_instance.var_fe2612fe[#"hash_7e2234980528a279"][0], #"hash_2dc80625b5b6627a", 1);
		}
		if(isdefined(s_instance.var_fe2612fe[#"pump"]))
		{
			s_instance.var_5ea363c.var_7be19157 = namespace_8b6a9d79::spawn_script_model(s_instance.var_fe2612fe[#"pump"][0], #"tag_origin", 1);
		}
		for(i = 0; i < 2; i++)
		{
			var_9ed85498 = array::random(s_instance.var_5ea363c.var_809a5ab9[i]);
			var_57e77903 = util::spawn_model(#"hash_18fe97c27ac7bf5b", var_9ed85498.origin + vectorscale((0, 0, 1), 32.1), var_9ed85498.angles + (vectorscale((0, -1, 0), 90)));
			var_57e77903.targetname = "retrieval_component";
			var_57e77903.n_id = i;
			var_57e77903.n_index = var_9ed85498.script_int;
			instance.var_53ba65b[i] = var_57e77903;
			instance.a_models[instance.a_models.size] = var_57e77903;
			var_57e77903.var_e16d0db5 = namespace_8b6a9d79::spawn_script_model(var_9ed85498, #"hash_35f0729ec291b85b", 1);
			var_57e77903.var_e16d0db5.targetname = "retrieval_case";
			var_57e77903 thread function_6acbc957(instance);
		}
	}
	instance.mdl_truck = s_instance.mdl_truck;
	instance.var_4d0b3b87 = s_instance.var_fe2612fe[#"hash_41ae283ea203de66"][0];
	instance.var_5ea363c = s_instance.var_5ea363c;
	instance.var_734a26a4 = s_instance.var_fe2612fe[#"hash_28b58e644a932211"][0];
	instance.var_9a67455 = s_instance.var_fe2612fe[#"hash_99db954262ad107"];
	instance.var_b69e83ca = s_instance.var_fe2612fe[#"hash_3a45264baef61335"];
	instance.var_ba44fadd = s_instance.var_fe2612fe[#"hash_78b9734c21337ad9"];
	instance thread function_eae9567f();
	instance thread function_f5087df2();
	instance thread namespace_7589cf5c::vo_start("objectiveRetrievalAnnounce", "objectiveRetrievalAnnounceResponse");
	instance thread function_5b1da81a();
	instance.mdl_truck.targetname = "retrieval_truck";
	instance.var_5ea363c.var_5542906 = 0;
	instance.n_zombies = 0;
	level.var_acd0f67e = 5;
	showmiscmodels("retrieval_corpses");
}

/*
	Name: function_5b1da81a
	Namespace: objective_retrieval
	Checksum: 0xD86EBA75
	Offset: 0xE90
	Size: 0x1D4
	Parameters: 0
	Flags: Linked
*/
function function_5b1da81a()
{
	self endon(#"objective_ended");
	var_35dfb407 = 0;
	while(!var_35dfb407)
	{
		a_players = getplayers();
		foreach(player in a_players)
		{
			if(distance2dsquared(player.origin, self.mdl_truck.origin) <= 1000000)
			{
				if(player util::is_looking_at(self.mdl_truck, 0.7, 0) || player util::is_looking_at(self.origin, 0.7, 1) || distance2dsquared(player.origin, self.mdl_truck.origin) <= 250000)
				{
					var_35dfb407 = 1;
					break;
				}
			}
		}
		wait(0.5);
	}
	level namespace_7589cf5c::play_vo("objectiveRetrievalApproach");
	wait(0.5);
	level namespace_7589cf5c::play_vo("objectiveRetrievalApproachResponse");
}

/*
	Name: function_17f1d0f3
	Namespace: objective_retrieval
	Checksum: 0xB10C2B28
	Offset: 0x1070
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
	Name: function_1e069d90
	Namespace: objective_retrieval
	Checksum: 0xE8CD67F6
	Offset: 0x10E8
	Size: 0xE4
	Parameters: 1
	Flags: None
*/
function function_1e069d90(params)
{
	if(isplayer(self))
	{
		item = params.item;
		if(item.var_a6762160.name === #"hash_7c46132094b01ee")
		{
			self thread function_bb395b8f(level.var_7d45d0d4.var_3385b421, 0);
		}
		else if(item.var_a6762160.name === #"hash_7c46032094b003b")
		{
			self thread function_bb395b8f(level.var_7d45d0d4.var_3385b421, 1);
		}
	}
}

/*
	Name: function_bb395b8f
	Namespace: objective_retrieval
	Checksum: 0xEE76E5F8
	Offset: 0x11D8
	Size: 0x2E8
	Parameters: 2
	Flags: Linked
*/
function function_bb395b8f(instance, n_id)
{
	self endon(#"death");
	instance endon(#"objective_ended");
	s_pt = array::random(instance.var_ba44fadd);
	if(!is_true(self.var_28107825))
	{
		instance notify(#"hash_33e194cec969b040");
		if(isalive(self))
		{
			self playrumbleonentity("damage_heavy");
		}
		tagname = "tag_stowed_back";
		if(!self haspart(tagname))
		{
			tagname = undefined;
		}
		switch(n_id)
		{
			case 0:
			{
				break;
			}
			case 1:
			{
				break;
			}
		}
		self.var_28107825 = 1;
		self.var_57e77903 = util::spawn_model(#"hash_18fe97c27ac7bf5b", self gettagorigin("tag_stowed_back"), self gettagangles("tag_stowed_back"));
		waitframe(1);
		if(isdefined(self.var_57e77903))
		{
			self.var_57e77903 linkto(self, "tag_stowed_back", (40, 5, -4), vectorscale((1, 0, 0), 270));
			self.var_57e77903 clientfield::set("" + #"hash_7e6957dfc36e2214", 1);
		}
		else
		{
			self attach(#"hash_18fe97c27ac7bf5b", "tag_stowed_back");
		}
		self clientfield::set_to_player("" + #"hash_502dbbefce1f656c", 1);
		if(!is_true(self.var_7cd1b025))
		{
			self.var_7cd1b025 = 1;
			self thread function_ac6bb77d(instance);
			instance thread function_d153c0f0();
			instance notify(#"defend");
		}
	}
}

/*
	Name: function_8d7bef8f
	Namespace: objective_retrieval
	Checksum: 0xCA6EA09B
	Offset: 0x14C8
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function function_8d7bef8f()
{
	self endon(#"objective_ended");
	wait(1);
	level namespace_7589cf5c::play_vo("objectiveRetrievalStart");
	wait(1);
	level namespace_7589cf5c::play_vo("objectiveRetrievalStartResponse");
	self waittill(#"done");
	self thread vo_end();
}

/*
	Name: vo_end
	Namespace: objective_retrieval
	Checksum: 0xC385031C
	Offset: 0x1560
	Size: 0x17C
	Parameters: 0
	Flags: Linked
*/
function vo_end()
{
	level namespace_7589cf5c::play_vo("objectiveRetrievalEndSequence1");
	wait(0.5);
	level namespace_7589cf5c::play_vo("objectiveRetrievalEndSequence2");
	wait(0.5);
	self notify(#"takeoff");
	level namespace_7589cf5c::play_vo("objectiveRetrievalEndSequence3");
	wait(0.5);
	self notify(#"lift_off");
	level namespace_7589cf5c::play_vo("objectiveRetrievalEndSequence4");
	wait(0.25);
	level namespace_7589cf5c::play_vo("objectiveRetrievalEndSequence5");
	wait(0.25);
	level namespace_7589cf5c::play_vo("objectiveRetrievalEndSequence6");
	wait(4.5);
	level namespace_7589cf5c::play_vo("objectiveRetrievalEndSequence7");
	wait(1);
	level thread namespace_7589cf5c::play_vo("objectiveRetrievalEndSequence8");
	level flag::set(#"hash_1460b3afd614fb6c");
}

/*
	Name: function_6cbbd741
	Namespace: objective_retrieval
	Checksum: 0xCACF7E9
	Offset: 0x16E8
	Size: 0x174
	Parameters: 1
	Flags: Linked
*/
function function_6cbbd741(instance)
{
	instance endon(#"objective_ended");
	self endon(#"ready", #"death");
	while(true)
	{
		foreach(player in getplayers())
		{
			if(isalive(player))
			{
				if(distance2dsquared(self.origin, player.origin) <= sqr(1000) && !isdefined(player.var_b1f1cfee))
				{
					player.var_b1f1cfee = 1;
					player thread zm_vo::function_7622cb70("objectiveRetrievalCanisterApproach", 0, 1);
				}
			}
		}
		wait(1);
	}
}

/*
	Name: function_ac6bb77d
	Namespace: objective_retrieval
	Checksum: 0xB99D22DA
	Offset: 0x1868
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function function_ac6bb77d(instance)
{
	self endon(#"death");
	instance endon(#"objective_ended");
	self zm_vo::function_7622cb70("objectiveRetrievalCanisterCollected", 0, 1);
	wait(1);
	self zm_vo::function_7622cb70("objectiveRetrievalCanisterCollectedResponse", 0, 1);
}

/*
	Name: function_94e78240
	Namespace: objective_retrieval
	Checksum: 0xCAA48A22
	Offset: 0x18F0
	Size: 0xC4
	Parameters: 1
	Flags: Linked
*/
function function_94e78240(params)
{
	if(isdefined(self) && level.zm_hint_text zm_hint_text::is_open(self))
	{
		level.zm_hint_text zm_hint_text::close(self);
	}
	self namespace_1b527536::function_460882e2(0);
	self.var_67aa3392.var_5b5d9768 = 0;
	self.var_67aa3392 clientfield::increment("" + #"hash_25f023cad32eccf0");
	self function_62801b2f();
}

/*
	Name: function_1a58f438
	Namespace: objective_retrieval
	Checksum: 0xD08E762A
	Offset: 0x19C0
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function function_1a58f438(instance)
{
	instance endon(#"objective_ended");
	self endon(#"disconnect");
	self waittill(#"hash_6d2d12b8afe43c8e");
	if(isdefined(self) && level.zm_hint_text zm_hint_text::is_open(self))
	{
		level.zm_hint_text zm_hint_text::close(self);
	}
	self thread namespace_1b527536::function_69303ed3();
}

/*
	Name: function_4be8796
	Namespace: objective_retrieval
	Checksum: 0x8F909190
	Offset: 0x1A70
	Size: 0x234
	Parameters: 1
	Flags: Linked
*/
function function_4be8796(instance)
{
	instance endon(#"objective_ended");
	self endon(#"disconnect", #"player_downed", #"hash_6d2d12b8afe43c8e");
	if(!is_true(self.var_67aa3392.var_a325551c))
	{
		self.var_67aa3392.var_a325551c = 1;
		namespace_1b527536::function_7281de4d(#"hash_42722c5a5596cde2", &function_94e78240, #"hash_60cb3fd3716d711e", #"hash_1a2e7166e36c7ed1", 1, 6, 1);
	}
	else
	{
		var_5b5d9768 = (isdefined(self.var_67aa3392.var_5b5d9768) ? self.var_67aa3392.var_5b5d9768 : 0);
		if(var_5b5d9768 >= 6)
		{
			namespace_1b527536::function_7281de4d(#"hash_42722c5a5596cde2", &function_94e78240, #"hash_60cb3fd3716d711e", #"hash_1a2e7166e36c7ed1", 1, 6, 1);
		}
		else
		{
			namespace_1b527536::function_7281de4d(#"hash_42722c5a5596cde2", &function_94e78240, #"hash_60cb3fd3716d711e", #"hash_1a2e7166e36c7ed1", 1, 6, 0);
			self.var_8da24ed0 = var_5b5d9768;
			progress = self.var_8da24ed0 / self.var_fc8023b4;
			self clientfield::set_player_uimodel("hud_items.ammoCooldowns.fieldUpgrade", progress);
		}
	}
}

/*
	Name: function_d52adbbc
	Namespace: objective_retrieval
	Checksum: 0xA470F953
	Offset: 0x1CB0
	Size: 0x1B8
	Parameters: 1
	Flags: None
*/
function function_d52adbbc(instance)
{
	instance endon(#"objective_ended");
	self endon(#"disconnect", #"player_downed", #"hash_6d2d12b8afe43c8e", #"sudden_death");
	var_4beb87c8 = self gamepadusedlast();
	while(true)
	{
		if(is_true(self.inventory.items[12].count))
		{
			var_c648969d = level.zm_hint_text zm_hint_text::is_open(self);
			if(var_4beb87c8 != self gamepadusedlast() || !var_c648969d)
			{
				hint = #"hash_41f8f4fb911cb409";
				if(!self gamepadusedlast())
				{
					hint = #"hash_17dc67453fe5d632";
				}
				if(var_c648969d)
				{
					level.zm_hint_text zm_hint_text::close(self);
				}
				self thread zm_equipment::show_hint_text(hint, 6);
			}
			var_4beb87c8 = self gamepadusedlast();
		}
		waitframe(1);
	}
}

/*
	Name: function_62801b2f
	Namespace: objective_retrieval
	Checksum: 0x57100B20
	Offset: 0x1E70
	Size: 0x162
	Parameters: 0
	Flags: Linked
*/
function function_62801b2f()
{
	self endon(#"death");
	var_e766369f = function_a38db454(self.origin, 800);
	a_zombies = array::get_all_closest(self.origin, var_e766369f);
	for(i = 0; i < a_zombies.size; i++)
	{
		if(isalive(a_zombies[i]))
		{
			if(namespace_7589cf5c::function_82e262cf(a_zombies[i].aitype))
			{
				a_zombies[i] function_b61cfe16(self);
			}
			if(distance2dsquared(self.origin, a_zombies[i].origin) <= 250000)
			{
				self thread function_912eedf3(a_zombies[i]);
			}
			else
			{
				self thread knockdown_zombie(a_zombies[i]);
			}
			waitframe(1);
		}
	}
}

/*
	Name: knockdown_zombie
	Namespace: objective_retrieval
	Checksum: 0xD0F655D6
	Offset: 0x1FE0
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function knockdown_zombie(ai_zombie)
{
	if(isdefined(ai_zombie))
	{
		if(ai_zombie.var_6f84b820 == #"normal")
		{
			ai_zombie zombie_utility::setup_zombie_knockdown(self.origin);
		}
		else if(ai_zombie.var_6f84b820 == #"special" || ai_zombie.var_6f84b820 == #"elite")
		{
			ai_zombie ai::stun(2);
		}
	}
}

/*
	Name: function_912eedf3
	Namespace: objective_retrieval
	Checksum: 0x578DE192
	Offset: 0x2098
	Size: 0x1F4
	Parameters: 1
	Flags: Linked
*/
function function_912eedf3(zombie)
{
	self endon(#"death");
	zombie endon(#"death");
	if(isalive(zombie))
	{
		v_dir = vectornormalize(zombie.origin - self.origin);
		v_launch = (v_dir * randomintrange(80, 100)) + vectorscale((0, 0, 1), 150);
		zombie.allowdeath = 1;
		if(namespace_7589cf5c::function_82e262cf(zombie.aitype))
		{
			if(isdefined(zombie.var_320199e9))
			{
				zombie thread [[zombie.var_320199e9]]();
			}
		}
		else
		{
			if(zm_utility::is_player_valid(self, 0, 0))
			{
				self zm_stats::increment_challenge_stat(#"hash_6dcdf2fb5a6cf4a0");
			}
			level scoreevents::doscoreeventcallback("scoreEventSR", {#enemy:zombie, #attacker:self, #scoreevent:"retrieve_cannister_kill_zm"});
			if(!zombie isragdoll())
			{
				zombie startragdoll();
				waitframe(2);
				zombie launchragdoll(v_launch);
			}
			zombie kill();
		}
	}
}

/*
	Name: function_b61cfe16
	Namespace: objective_retrieval
	Checksum: 0x8C03937E
	Offset: 0x2298
	Size: 0x18A
	Parameters: 1
	Flags: Linked
*/
function function_b61cfe16(player)
{
	if(isdefined(self) && isdefined(self.aitype))
	{
		switch(self.aitype)
		{
			case "hash_704a090ff9fcffd0":
			{
				self function_98139c38(player, 0.25);
				break;
			}
			case "hash_1aff4b71635bda08":
			{
				self function_98139c38(player, 0.6);
				break;
			}
			case "spawner_bo5_mimic":
			{
				self function_98139c38(player, 0.6);
				break;
			}
			case "hash_4f87aa2a203d37d0":
			{
				self function_98139c38(player, 0.5);
				break;
			}
			case "spawner_zm_steiner":
			{
				self function_98139c38(player, 0.4);
				break;
			}
			default:
			{
				self function_98139c38(player, 0.5);
				break;
			}
		}
	}
}

/*
	Name: function_98139c38
	Namespace: objective_retrieval
	Checksum: 0xBFFB81A9
	Offset: 0x2430
	Size: 0x42
	Parameters: 2
	Flags: Linked
*/
function function_98139c38(player, var_8de6cf73)
{
	self.var_320199e9 = &function_320199e9;
	self.var_15bd646a = var_8de6cf73;
	self.e_attacker = player;
}

/*
	Name: function_320199e9
	Namespace: objective_retrieval
	Checksum: 0x65A84FEC
	Offset: 0x2480
	Size: 0xAC
	Parameters: 0
	Flags: Linked
*/
function function_320199e9()
{
	self endon(#"death");
	n_dmg = self.maxhealth * self.var_15bd646a;
	if(n_dmg < self.health)
	{
		self thread ai::stun();
		self dodamage(n_dmg, self.origin);
	}
	else if(isdefined(self.e_attacker))
	{
		self dodamage(n_dmg, self.origin, self.e_attacker);
	}
}

/*
	Name: function_7fb7c83c
	Namespace: objective_retrieval
	Checksum: 0x88B0B32E
	Offset: 0x2538
	Size: 0x3A
	Parameters: 1
	Flags: Private
*/
function private function_7fb7c83c(weaponname)
{
	inarray = isinarray(level.var_1b527536, weaponname);
	return inarray;
}

/*
	Name: function_eae9567f
	Namespace: objective_retrieval
	Checksum: 0x7B2ABAAA
	Offset: 0x2580
	Size: 0x364
	Parameters: 0
	Flags: Linked
*/
function function_eae9567f()
{
	self.var_5ea363c ghost();
	self.mdl_truck scene::play(#"hash_3c1f6bee53f6bcc", "Shot 1", self.mdl_truck);
	self waittill(#"hash_3630518d6dc9aeda");
	wait(0.25);
	self.mdl_truck playrumblelooponentity(#"hash_1903f70fddbadc53");
	self.mdl_truck scene::play(#"hash_3c1f6bee53f6bcc", "Shot 2", self.mdl_truck);
	self.mdl_truck stoprumble(#"hash_1903f70fddbadc53");
	self thread function_2ea1510(self.var_5ea363c.var_7be19157);
	self waittill(#"objective_ended");
	level thread namespace_7589cf5c::function_3899cfea();
	if(self.success)
	{
		wait(3);
		self.mdl_truck clientfield::set("" + #"hash_5bc7fe725b36bd67", 1);
		self.var_5ea363c playloopsound(#"hash_2eaf64217fead998");
		self.mdl_truck playloopsound(#"hash_4a9a912c07ee63e");
		self.var_5ea363c linkto(self.mdl_truck, "tag_fx_rocket_exhaust_0");
		wait(4);
		self.var_5ea363c playrumbleonentity("sr_retrieval_rocket_takeoff");
		self waittill(#"lift_off");
		wait(1);
		self.mdl_truck clientfield::set("" + #"hash_5bc7fe725b36bd67", 0);
		self.mdl_truck thread scene::play(#"hash_3c1f6bee53f6bcc", "Shot 4", self.mdl_truck);
		wait(4.5);
		self thread function_1ed83293();
		self.var_5ea363c stoploopsound(5);
		wait(5);
		self notify(#"cleared");
		self.mdl_truck stoploopsound();
		wait(24);
		self.mdl_truck hidepart("tag_rocket_attach", "", 1);
	}
}

/*
	Name: function_1ed83293
	Namespace: objective_retrieval
	Checksum: 0xE003F439
	Offset: 0x28F0
	Size: 0x1F4
	Parameters: 0
	Flags: Linked
*/
function function_1ed83293()
{
	self endon(#"cleared");
	while(true)
	{
		a_players = getplayers();
		foreach(player in a_players)
		{
			if(zm_utility::is_player_valid(player))
			{
				n_distsq = distancesquared(self.var_5ea363c.origin, player.origin);
				if(n_distsq <= sqr(150))
				{
					player dodamage(5, self.var_5ea363c.origin, undefined, undefined, undefined, "MOD_BURNED");
					player playrumbleonentity("damage_heavy");
					continue;
				}
				if(n_distsq <= sqr(400))
				{
					player dodamage(2, self.var_5ea363c.origin, undefined, undefined, undefined, "MOD_BURNED");
					player playrumbleonentity("damage_light");
				}
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_2ea1510
	Namespace: objective_retrieval
	Checksum: 0xE16C3BB5
	Offset: 0x2AF0
	Size: 0x184
	Parameters: 1
	Flags: Linked
*/
function function_2ea1510(var_7be19157)
{
	self endon(#"objective_ended");
	b_open_door = 0;
	while(true)
	{
		foreach(player in getplayers())
		{
			if(isalive(player) && is_true(player.var_28107825))
			{
				if(distance2dsquared(var_7be19157.origin, player.origin) <= sqr(300))
				{
					b_open_door = 1;
				}
			}
		}
		if(b_open_door)
		{
			break;
		}
		wait(0.1);
	}
	self.mdl_truck scene::play(#"hash_3c1f6bee53f6bcc", "Shot 3", self.mdl_truck);
}

/*
	Name: function_f5087df2
	Namespace: objective_retrieval
	Checksum: 0x4F163E84
	Offset: 0x2C80
	Size: 0x328
	Parameters: 0
	Flags: Linked
*/
function function_f5087df2()
{
	self waittill(#"objective_ended", #"hash_8202877a3aadac8");
	objective_manager::stop_timer();
	foreach(player in getplayers())
	{
		level.var_31028c5d thread prototype_hud::set_active_obj_visibility(player, 0);
	}
	namespace_7589cf5c::function_ed193293(self);
	if(!is_true(self.success))
	{
		foreach(var_57e77903 in getentarray("retrieval_canister", "targetname"))
		{
			if(isdefined(var_57e77903))
			{
				var_57e77903 delete();
			}
		}
	}
	else
	{
		namespace_cda50904::function_a92a93e9(self.var_4d0b3b87.origin, self.var_4d0b3b87.angles);
		foreach(var_e16d0db5 in getentarray("harvester", "targetname"))
		{
			if(isdefined(var_e16d0db5))
			{
				var_e16d0db5 delete();
			}
		}
		wait(1);
		foreach(player in getplayers())
		{
			player clientfield::set_to_player("" + #"hash_502dbbefce1f656c", 0);
		}
	}
}

/*
	Name: machine_trigger
	Namespace: objective_retrieval
	Checksum: 0xA82191C
	Offset: 0x2FB0
	Size: 0x21C
	Parameters: 1
	Flags: Linked
*/
function machine_trigger(instance)
{
	instance endon(#"objective_ended");
	instance thread objective_manager::start_timer(300, "retrieval");
	self thread monitor_timer(instance);
	self.var_c1c0db3c = 0;
	self thread function_9c54feb0(instance);
	self thread function_63544551(instance);
	wait(0.1);
	self thread function_9d2e5887(instance);
	instance waittill(#"hash_33e194cec969b040");
	instance.var_734a26a4.var_5ea363c = self;
	instance.var_734a26a4 gameobjects::init_game_objects(#"hash_123a33773ed71b2b");
	instance.var_734a26a4 gameobjects::set_onbeginuse_event(&function_1fc51f74);
	instance.var_734a26a4 gameobjects::set_onenduse_event(&function_c8bfd10b);
	instance.var_734a26a4.mdl_gameobject.script_int = instance.var_734a26a4.script_int;
	objective_add(self.n_objective_id, "active", self, self.str_obj);
	self zm_utility::function_747180ea(self.n_objective_id, undefined, self.trigger);
	instance.var_734a26a4.mdl_gameobject thread function_223e16e6(instance);
	instance.var_734a26a4.mdl_gameobject thread function_b11e170c(instance);
}

/*
	Name: function_1fc51f74
	Namespace: objective_retrieval
	Checksum: 0x1DF369C6
	Offset: 0x31D8
	Size: 0x124
	Parameters: 1
	Flags: Linked
*/
function function_1fc51f74(player)
{
	if(isplayer(player))
	{
		if(isdefined(player))
		{
			player playrumblelooponentity("damage_light");
			player clientfield::set_to_player("" + #"hash_502dbbefce1f656c", 0);
		}
		if(!is_true(self.var_dbee315d) && player namespace_e86ffa8::function_efb6dedf(4))
		{
			self.var_dbee315d = 1;
			self.var_16d3705c = self.usetime;
			time = (float(self.usetime * 0.5)) / 1000;
			self gameobjects::set_use_time(time);
		}
	}
}

/*
	Name: function_c8bfd10b
	Namespace: objective_retrieval
	Checksum: 0x9640CB92
	Offset: 0x3308
	Size: 0x604
	Parameters: 3
	Flags: Linked
*/
function function_c8bfd10b(str_team, e_player, b_result)
{
	e_player stoprumble("damage_light");
	if(b_result)
	{
		if(!is_true(e_player.var_67aa3392.var_470d03b1))
		{
			level scoreevents::doscoreeventcallback("scoreEventSR", {#attacker:e_player, #scoreevent:"retrieve_perfect_delivery_zm"});
		}
		var_67aa3392 = e_player.var_67aa3392;
		v_org = self.e_object.origin;
		v_ang = self.e_object.angles;
		var_67aa3392 notify(#"installed");
		var_67aa3392 unlink();
		var_67aa3392 clientfield::set("" + #"hash_7e6957dfc36e2214", 0);
		var_67aa3392 zm_utility::function_48d9a9c9();
		gameobjects::release_obj_id(var_67aa3392.n_objective_id);
		objective_delete(var_67aa3392.n_objective_id);
		var_67aa3392.n_objective_id = undefined;
		e_player clientfield::set_to_player("" + #"hash_502dbbefce1f656c", 0);
		e_player.var_28107825 = 0;
		e_player.var_4cd303ca = 1;
		e_player notify(#"hash_6d2d12b8afe43c8e");
		if(isdefined(e_player.var_57e77903))
		{
			e_player.var_57e77903 delete();
		}
		else
		{
			e_player detach(#"hash_18fe97c27ac7bf5b", "tag_stowed_back");
		}
		e_player.var_67aa3392 = undefined;
		e_player thread function_bd0bc40b(0);
		waitframe(1);
		var_67aa3392 rotateto(self.e_object.angles, 0.05);
		var_67aa3392 moveto(self.e_object.origin, 0.05);
		var_67aa3392 waittill(#"movedone");
		var_67aa3392 show();
		var_67aa3392.var_2e5efdc7 = 1;
		var_67aa3392.t_pickup delete();
		var_67aa3392 playsound(#"hash_59680d123025c6f0");
		e_player.var_4cd303ca = 0;
		self.e_object.var_5ea363c notify(#"installed", {#player:e_player});
		var_53ba65b = getentarray("retrieval_canister", "targetname");
		foreach(var_57e77903 in var_53ba65b)
		{
			if(var_57e77903 != var_67aa3392 && isdefined(var_57e77903.n_objective_id) && !is_true(var_57e77903.var_2e5efdc7))
			{
				objective_setvisibletoplayer(var_57e77903.n_objective_id, e_player);
			}
		}
		var_67aa3392 thread function_457be561(v_org, v_ang);
		if(self.e_object.var_5ea363c.var_c1c0db3c > 1)
		{
			self zm_utility::function_48d9a9c9();
			self gameobjects::destroy_object(1, 1);
			wait(5);
		}
		else
		{
			self.e_object.var_5ea363c.var_5542906 = 1;
			wait(5);
			self.e_object.var_5ea363c.var_5542906 = 0;
		}
		s_pt = array::random(level.var_7d45d0d4.var_3385b421.var_9a67455);
	}
	else
	{
		if(isdefined(self.var_16d3705c))
		{
			self.var_dbee315d = 0;
			self gameobjects::set_use_time(self.var_16d3705c);
			self.var_16d3705c = undefined;
		}
		if(is_true(e_player.var_28107825))
		{
			e_player clientfield::set_to_player("" + #"hash_502dbbefce1f656c", 1);
		}
	}
}

/*
	Name: function_457be561
	Namespace: objective_retrieval
	Checksum: 0xC803B241
	Offset: 0x3918
	Size: 0x10C
	Parameters: 2
	Flags: Linked
*/
function function_457be561(v_org, v_ang)
{
	if(is_true(self.var_2e5efdc7))
	{
		self scene::play(#"hash_4d978b2a49cbf4e9", self);
		self scene::stop();
		self setmodel(#"hash_6a3359ce6cad3369");
		self rotateyaw(-90, 0.05);
	}
	wait(1);
	if(self.n_id)
	{
		str_scene = #"hash_662aeccce7bf6605";
	}
	else
	{
		str_scene = #"hash_52764fb3a2b546c2";
	}
	self thread scene::play(str_scene, self);
}

/*
	Name: function_b11e170c
	Namespace: objective_retrieval
	Checksum: 0x661F3B4B
	Offset: 0x3A30
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function function_b11e170c(instance)
{
	self endon(#"death");
	instance waittill(#"objective_ended");
	if(isdefined(self))
	{
		self gameobjects::destroy_object(1, 1);
	}
}

/*
	Name: function_63544551
	Namespace: objective_retrieval
	Checksum: 0xE7C5EC62
	Offset: 0x3A98
	Size: 0x2C8
	Parameters: 1
	Flags: Linked
*/
function function_63544551(instance)
{
	instance endon(#"objective_ended");
	while(true)
	{
		s_waitresult = undefined;
		s_waitresult = self waittill(#"installed");
		level scoreevents::doscoreeventcallback("scoreEventSR", {#attacker:s_waitresult.player, #scoreevent:"retrieve_battery_installed_zm"});
		self.var_c1c0db3c++;
		if(self.var_c1c0db3c === 1)
		{
			self thread function_f4562137(instance);
			instance.var_734a26a4.mdl_gameobject thread namespace_7589cf5c::function_ac709d66(instance, "vox_obj_rtl_aeth_can_depst_orkt_0");
		}
		else if(self.var_c1c0db3c === 2)
		{
			foreach(player in getplayers())
			{
				level.var_31028c5d prototype_hud::set_active_obj_visibility(player, 0);
			}
			instance notify(#"done");
			foreach(player in getplayers())
			{
				player luinotifyevent(#"hash_5159e35a62fb7083", 2, 3, 1);
				if(isdefined(player) && level.zm_hint_text zm_hint_text::is_open(player))
				{
					level.zm_hint_text zm_hint_text::close(player);
				}
			}
			waitframe(1);
			objective_manager::objective_ended(instance);
		}
	}
}

/*
	Name: function_c91906c5
	Namespace: objective_retrieval
	Checksum: 0x5E8B86B7
	Offset: 0x3D68
	Size: 0xA2
	Parameters: 0
	Flags: Linked
*/
function function_c91906c5()
{
	foreach(player in getplayers())
	{
		if(is_true(player.var_28107825))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_223e16e6
	Namespace: objective_retrieval
	Checksum: 0x943B6D39
	Offset: 0x3E18
	Size: 0x1A4
	Parameters: 1
	Flags: Linked
*/
function function_223e16e6(instance)
{
	instance endon(#"objective_ended");
	objective_setprogress(instance.var_5ea363c.n_objective_id, 1);
	while(true)
	{
		foreach(player in getplayers())
		{
			if(is_true(player.var_28107825) && !instance.var_5ea363c.var_5542906)
			{
				self gameobjects::function_664b40(player);
				objective_setinvisibletoplayer(instance.var_5ea363c.n_objective_id, player);
				continue;
			}
			self gameobjects::function_7a00d78c(player);
			if(instance function_c91906c5())
			{
				objective_setvisibletoplayer(instance.var_5ea363c.n_objective_id, player);
			}
		}
		wait(0.25);
	}
}

/*
	Name: function_f4562137
	Namespace: objective_retrieval
	Checksum: 0xC06DDFF8
	Offset: 0x3FC8
	Size: 0x1F4
	Parameters: 1
	Flags: Linked
*/
function function_f4562137(instance)
{
	instance endon(#"objective_ended");
	self.var_7be19157.n_objective_id = gameobjects::get_next_obj_id();
	self.var_7be19157.var_db7449cf = #"hash_336d05892f9a780e";
	objective_add(self.var_7be19157.n_objective_id, "active", self.var_7be19157, self.var_7be19157.var_db7449cf);
	while(true)
	{
		foreach(player in getplayers())
		{
			if(is_true(player.var_28107825) && !self.var_5542906)
			{
				objective_setinvisibletoplayer(self.var_7be19157.n_objective_id, player);
				continue;
			}
			if(is_true(player.var_28107825))
			{
				objective_setvisibletoplayer(self.var_7be19157.n_objective_id, player);
				continue;
			}
			objective_setinvisibletoplayer(self.var_7be19157.n_objective_id, player);
		}
		wait(0.25);
	}
}

/*
	Name: monitor_timer
	Namespace: objective_retrieval
	Checksum: 0x395C2A89
	Offset: 0x41C8
	Size: 0x3AC
	Parameters: 1
	Flags: Linked
*/
function monitor_timer(instance)
{
	instance endon(#"objective_ended");
	level waittill(#"hash_4aac43df22b1d42d");
	foreach(player in getplayers())
	{
		player notify(#"sudden_death");
	}
	self thread function_54ad8bd3(instance);
	var_42f3b393 = 0;
	while(true)
	{
		var_dc9a9acc = 0;
		foreach(var_57e77903 in instance.var_53ba65b)
		{
			if(is_true(var_57e77903.b_pickedup) || is_true(var_57e77903.var_2e5efdc7))
			{
				var_dc9a9acc++;
			}
		}
		if(var_dc9a9acc < 2)
		{
			break;
		}
		if(!var_42f3b393)
		{
			var_42f3b393 = 1;
			instance.var_5ff65676 = 1;
			foreach(zombie in getaiarray())
			{
				if(isalive(zombie))
				{
					zombie zm_score::function_acaab828();
				}
			}
			foreach(player in getplayers())
			{
				if(is_true(player.var_28107825))
				{
					player thread function_69438b00(instance);
				}
			}
		}
		waitframe(1);
	}
	wait(0.2);
	players = function_a1ef346b();
	if(isdefined(players) && players.size > 0)
	{
		instance.var_7a9e6505 = 1;
	}
	instance.var_5ff65676 = 0;
	objective_manager::objective_ended(instance, 0);
}

/*
	Name: function_69438b00
	Namespace: objective_retrieval
	Checksum: 0xCCA2B230
	Offset: 0x4580
	Size: 0x100
	Parameters: 1
	Flags: Linked
*/
function function_69438b00(instance)
{
	self endon(#"disconnect", #"laststand");
	instance endon(#"objective_ended");
	if(isdefined(self) && level.zm_hint_text zm_hint_text::is_open(self))
	{
		level.zm_hint_text zm_hint_text::close(self);
	}
	waitframe(1);
	self thread zm_equipment::show_hint_text(#"hash_6a89bb99e54d4e8f", 60);
	while(true)
	{
		self dodamage(5, self.origin);
		self function_bc82f900("damage_light");
		wait(1);
	}
}

/*
	Name: function_54ad8bd3
	Namespace: objective_retrieval
	Checksum: 0x6CD9AE2E
	Offset: 0x4688
	Size: 0x1D0
	Parameters: 1
	Flags: Linked
*/
function function_54ad8bd3(instance)
{
	instance endon(#"objective_ended");
	wait(0.3);
	foreach(var_57e77903 in instance.var_53ba65b)
	{
		if(!var_57e77903.b_pickedup && !var_57e77903.var_2e5efdc7)
		{
			foreach(player in getplayers())
			{
				player thread function_f1ae312a(instance);
				level.var_31028c5d prototype_hud::set_active_obj_visibility(player, 0);
				if(isdefined(player) && level.zm_hint_text zm_hint_text::is_open(player))
				{
					level.zm_hint_text zm_hint_text::close(player);
				}
			}
			objective_manager::objective_ended(instance, 0);
		}
	}
}

/*
	Name: function_6acbc957
	Namespace: objective_retrieval
	Checksum: 0x6F843710
	Offset: 0x4860
	Size: 0x3F4
	Parameters: 1
	Flags: Linked
*/
function function_6acbc957(instance)
{
	instance endon(#"objective_ended");
	self endon(#"death");
	instance.var_53ba65b[instance.var_53ba65b.size] = self;
	self hide();
	self notsolid();
	self.b_pickedup = 0;
	self.var_2e5efdc7 = 0;
	self.var_a325551c = 0;
	self rotateyaw(90, 0.05);
	self.var_e16d0db5 hide();
	self.var_e16d0db5 notsolid();
	instance waittill(#"hash_3630518d6dc9aeda");
	self.var_e16d0db5 show();
	self.var_e16d0db5 solid();
	self.var_e16d0db5 playrumblelooponentity("sr_machinery_rumble");
	self.var_e16d0db5 clientfield::set("" + #"hash_29bff1aafecc8591", 1);
	self.t_pickup = spawn("trigger_radius_use", self.origin + vectorscale((0, 0, 1), 8), 0, 96, 96, 1);
	self.t_pickup triggerignoreteam();
	self.t_pickup setcursorhint("HINT_NOICON");
	self.t_pickup sethintstring(#"hash_c90fb1f338973f7");
	self.t_pickup usetriggerrequirelookat(1);
	self.t_pickup enablelinkto();
	self.t_pickup linkto(self);
	self.t_pickup triggerenable(0);
	self.t_open = spawn("trigger_radius_use", self.origin, 0, 96, 96, 1);
	self.t_open triggerignoreteam();
	self.t_open setcursorhint("HINT_NOICON");
	self.t_open sethintstring(#"hash_110f0b36c2354f6b");
	self.t_open usetriggerrequirelookat(1);
	self thread function_9c54feb0(instance);
	self thread function_20ab9060(instance);
	self thread function_95aeefa7(instance);
	self waittill(#"ready");
	self.var_e16d0db5 stoprumble("sr_machinery_rumble");
	self.t_pickup triggerenable(1);
}

/*
	Name: function_5238fe78
	Namespace: objective_retrieval
	Checksum: 0x334F64BB
	Offset: 0x4C60
	Size: 0x4A0
	Parameters: 1
	Flags: Linked
*/
function function_5238fe78(instance)
{
	instance endon(#"objective_ended", #"done");
	self endon(#"death", #"hash_3e146dbb1f7248f8");
	n_spawns = function_e97e2683(1);
	n_spawned = 0;
	foreach(var_2064decc in instance.var_9a67455)
	{
		if(var_2064decc.script_int === self.n_index)
		{
			s_pt = var_2064decc;
		}
	}
	if(!isdefined(s_pt))
	{
		return;
	}
	a_s_pts = namespace_85745671::function_e4791424(s_pt.origin, 32, 80, s_pt.radius);
	while(true)
	{
		level flag::wait_till("spawn_zombies");
		while(instance.n_zombies >= instance.n_max_zombies)
		{
			wait(0.1);
		}
		if(isdefined(s_pt))
		{
			var_7ecdee63 = function_aece4588(level.var_b48509f9);
			if(namespace_7589cf5c::function_82e262cf(var_7ecdee63))
			{
				if(isdefined(instance.var_38c710c3))
				{
					n_cooldown = namespace_7589cf5c::function_190c51a9();
					var_be32c966 = (float(gettime()) / 1000) - instance.var_38c710c3;
					if(var_be32c966 < n_cooldown)
					{
						var_7ecdee63 = namespace_7589cf5c::function_b9e4c169();
					}
					else
					{
						instance.var_38c710c3 = undefined;
					}
				}
				if(instance.var_2133c784 >= instance.var_61c57c53 || instance.var_b803db9c >= instance.var_5de17ec9)
				{
					var_7ecdee63 = namespace_7589cf5c::function_b9e4c169();
				}
			}
			s_spawnpt = array::random(a_s_pts);
			wait(randomfloatrange(0.1, 0.3));
			if(isdefined(s_spawnpt))
			{
				ai_spawned = namespace_85745671::function_9d3ad056(var_7ecdee63, s_spawnpt.origin, s_spawnpt.angles, "retrieval_zombie");
				wait(0.1);
				if(isalive(ai_spawned))
				{
					instance.n_zombies++;
					n_spawned++;
					if(n_spawned >= n_spawns)
					{
						self notify(#"hash_3e146dbb1f7248f8");
					}
					if(namespace_7589cf5c::function_82e262cf(ai_spawned.aitype))
					{
						instance.var_38c710c3 = float(gettime()) / 1000;
						instance.var_2133c784++;
						instance.var_b803db9c++;
						ai_spawned callback::function_d8abfc3d(#"on_ai_killed", &function_c36cb7b1);
					}
					else
					{
						ai_spawned callback::function_d8abfc3d(#"on_ai_killed", &on_zombie_killed);
					}
					if(is_true(instance.var_5ff65676))
					{
						ai_spawned zm_score::function_acaab828();
					}
					ai_spawned thread zombie_attack();
				}
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_c36cb7b1
	Namespace: objective_retrieval
	Checksum: 0xFA563424
	Offset: 0x5108
	Size: 0x174
	Parameters: 1
	Flags: Linked
*/
function function_c36cb7b1(params)
{
	if(isdefined(level.var_7d45d0d4.var_3385b421) && level.var_7d45d0d4.var_3385b421.var_b803db9c)
	{
		level.var_7d45d0d4.var_3385b421.var_b803db9c--;
	}
	if(is_true(params.eattacker.var_28107825))
	{
		if(self.var_6f84b820 === #"elite")
		{
			level scoreevents::doscoreeventcallback("scoreEventSR", {#enemy:self, #attacker:params.eattacker, #scoreevent:"retrieve_cannister_elite_kill_zm"});
		}
		else if(self.var_6f84b820 === #"special")
		{
			level scoreevents::doscoreeventcallback("scoreEventSR", {#enemy:self, #attacker:params.eattacker, #scoreevent:"retrieve_cannister_special_kill_zm"});
		}
	}
}

/*
	Name: on_zombie_killed
	Namespace: objective_retrieval
	Checksum: 0xC5840D86
	Offset: 0x5288
	Size: 0x60
	Parameters: 1
	Flags: Linked
*/
function on_zombie_killed(instance)
{
	if(isdefined(level.var_7d45d0d4.var_3385b421) && level.var_7d45d0d4.var_3385b421.n_zombies)
	{
		level.var_7d45d0d4.var_3385b421.n_zombies--;
	}
}

/*
	Name: function_9d2e5887
	Namespace: objective_retrieval
	Checksum: 0x1D1EFCDD
	Offset: 0x52F0
	Size: 0x3B8
	Parameters: 1
	Flags: Linked
*/
function function_9d2e5887(instance)
{
	instance endon(#"objective_ended", #"defend", #"done");
	n_spawns = function_e97e2683(1);
	n_spawned = 0;
	a_s_pts = instance.var_b69e83ca;
	while(true)
	{
		level flag::wait_till("spawn_zombies");
		while(instance.n_zombies >= instance.n_max_zombies)
		{
			wait(0.1);
		}
		s_pt = array::random(a_s_pts);
		if(isdefined(s_pt))
		{
			var_7ecdee63 = function_aece4588(level.var_b48509f9);
			if(namespace_7589cf5c::function_82e262cf(var_7ecdee63))
			{
				if(isdefined(instance.var_38c710c3))
				{
					n_cooldown = namespace_7589cf5c::function_190c51a9();
					var_be32c966 = (float(gettime()) / 1000) - instance.var_38c710c3;
					if(var_be32c966 < n_cooldown)
					{
						var_7ecdee63 = namespace_7589cf5c::function_b9e4c169();
					}
					else
					{
						instance.var_38c710c3 = undefined;
					}
				}
				if(instance.var_2133c784 >= instance.var_61c57c53 || instance.var_b803db9c >= instance.var_5de17ec9)
				{
					var_7ecdee63 = namespace_7589cf5c::function_b9e4c169();
				}
			}
			wait(randomfloatrange(0.1, 0.3));
			ai_spawned = namespace_85745671::function_9d3ad056(var_7ecdee63, s_pt.origin, s_pt.angles, "retrieval_zombie");
			wait(0.1);
			if(isdefined(ai_spawned))
			{
				instance.n_zombies++;
				n_spawned++;
				if(isalive(ai_spawned))
				{
					if(namespace_7589cf5c::function_82e262cf(ai_spawned.aitype))
					{
						instance.var_38c710c3 = float(gettime()) / 1000;
						instance.var_2133c784++;
						instance.var_b803db9c++;
						ai_spawned callback::function_d8abfc3d(#"on_ai_killed", &function_c36cb7b1);
					}
					else
					{
						ai_spawned callback::function_d8abfc3d(#"on_ai_killed", &on_zombie_killed);
					}
					if(is_true(instance.var_5ff65676))
					{
						ai_spawned zm_score::function_acaab828();
					}
					ai_spawned.var_b4e37a30 = 1;
					ai_spawned thread zombie_attack();
				}
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_6d863da0
	Namespace: objective_retrieval
	Checksum: 0xCCAB9A5B
	Offset: 0x56B0
	Size: 0x480
	Parameters: 1
	Flags: Linked
*/
function function_6d863da0(instance)
{
	self endon(#"death", #"hash_2376553f8598c3f8");
	instance endon(#"objective_ended", #"done");
	self.var_c948271a = 0;
	self.var_d7272180 = 0;
	n_spawns = function_e97e2683();
	a_s_pts = namespace_85745671::function_e4791424(self.origin, 32, 80, 400);
	if(isdefined(a_s_pts))
	{
		a_s_spawnpts = array::randomize(a_s_pts);
	}
	while(!self.var_c948271a)
	{
		foreach(player in function_a1ef346b())
		{
			if(distance2dsquared(self.origin, player.origin) <= sqr(3000))
			{
				self.var_c948271a = 1;
			}
		}
		wait(0.5);
	}
	while(true)
	{
		for(i = 0; i < n_spawns; i++)
		{
			level flag::wait_till("spawn_zombies");
			if(isdefined(a_s_spawnpts[i]))
			{
				var_7ecdee63 = function_aece4588(level.var_b48509f9);
				if(namespace_7589cf5c::function_82e262cf(var_7ecdee63))
				{
					if(isdefined(instance.var_38c710c3))
					{
						n_cooldown = namespace_7589cf5c::function_190c51a9();
						var_be32c966 = (float(gettime()) / 1000) - instance.var_38c710c3;
						if(var_be32c966 < n_cooldown)
						{
							var_7ecdee63 = namespace_7589cf5c::function_b9e4c169();
						}
						else
						{
							instance.var_38c710c3 = undefined;
						}
					}
					if(instance.var_2133c784 >= instance.var_61c57c53 || instance.var_b803db9c >= instance.var_5de17ec9)
					{
						var_7ecdee63 = namespace_7589cf5c::function_b9e4c169();
					}
				}
				ai_spawned = namespace_85745671::function_9d3ad056(var_7ecdee63, a_s_spawnpts[i].origin, a_s_spawnpts[i].angles, "retrieval_zombie");
				wait(0.1);
				if(isdefined(ai_spawned))
				{
					ai_spawned.var_40e7d5fb = &function_ec4c64fd;
					if(namespace_7589cf5c::function_82e262cf(ai_spawned.aitype))
					{
						instance.var_38c710c3 = float(gettime()) / 1000;
						instance.var_2133c784++;
						instance.var_b803db9c++;
						ai_spawned callback::function_d8abfc3d(#"on_ai_killed", &function_c36cb7b1);
					}
					self.var_d7272180++;
					if(self.var_d7272180 >= n_spawns)
					{
						self notify(#"hash_2376553f8598c3f8");
					}
					if(is_true(instance.var_5ff65676))
					{
						ai_spawned zm_score::function_acaab828();
					}
				}
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_d153c0f0
	Namespace: objective_retrieval
	Checksum: 0x13C24268
	Offset: 0x5B38
	Size: 0xA0
	Parameters: 0
	Flags: Linked
*/
function function_d153c0f0()
{
	self endon(#"objective_ended");
	while(true)
	{
		level flag::wait_till("spawn_zombies");
		if(self.n_zombies < self.n_max_zombies)
		{
			s_pt = array::random(self.var_ba44fadd);
			if(isdefined(s_pt))
			{
				self thread function_dd9b1007(s_pt.origin);
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_dd9b1007
	Namespace: objective_retrieval
	Checksum: 0x927CEB2
	Offset: 0x5BE0
	Size: 0x2B4
	Parameters: 1
	Flags: Linked
*/
function function_dd9b1007(var_3955def4)
{
	self endon(#"objective_ended", #"done");
	wait(randomfloatrange(0.1, 0.3));
	var_7ecdee63 = function_aece4588(level.var_b48509f9);
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
		if(self.var_2133c784 >= self.var_61c57c53 || self.var_b803db9c >= self.var_5de17ec9)
		{
			var_7ecdee63 = namespace_7589cf5c::function_b9e4c169();
		}
	}
	ai_spawned = namespace_85745671::function_9d3ad056(var_7ecdee63, var_3955def4, self.angles, "retrieval_zombie");
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
		self.n_zombies++;
		if(is_true(self.var_5ff65676))
		{
			ai_spawned zm_score::function_acaab828();
		}
		ai_spawned thread zombie_attack();
	}
}

/*
	Name: function_95aeefa7
	Namespace: objective_retrieval
	Checksum: 0x8C18C8CC
	Offset: 0x5EA0
	Size: 0x20E
	Parameters: 1
	Flags: Linked
*/
function function_95aeefa7(instance)
{
	instance endon(#"objective_ended");
	s_result = undefined;
	s_result = self.t_open waittill(#"trigger");
	self.t_open delete();
	if(isdefined(s_result.activator))
	{
		s_result.activator playrumbleonentity("damage_heavy");
	}
	self notify(#"open");
	self.var_e16d0db5 clientfield::set("" + #"hash_29bff1aafecc8591", 0);
	self.var_e16d0db5 clientfield::set("" + #"hash_7e6957dfc36e2214", 1);
	self.var_e16d0db5 scene::play(#"hash_7a23bf92791701e2", "Shot 1", self.var_e16d0db5);
	self show();
	self.var_e16d0db5 hidepart("p9_sur_console_control_01_canister_jnt", "", 1);
	self.v_start = self.origin;
	self clientfield::set("" + #"hash_7e6957dfc36e2214", 1);
	self.var_e16d0db5 clientfield::set("" + #"hash_7e6957dfc36e2214", 0);
	self notify(#"ready");
}

/*
	Name: function_20ab9060
	Namespace: objective_retrieval
	Checksum: 0xCE666332
	Offset: 0x60B8
	Size: 0x688
	Parameters: 1
	Flags: Linked
*/
function function_20ab9060(instance)
{
	self endon(#"installed", #"death");
	instance endon(#"objective_ended");
	while(true)
	{
		s_result = undefined;
		s_result = self.t_pickup waittill(#"trigger");
		self clientfield::set("" + #"hash_7e6957dfc36e2214", 0);
		s_pt = array::random(instance.var_ba44fadd);
		e_activator = s_result.activator;
		self zm_utility::function_48d9a9c9();
		if(isdefined(e_activator) && isplayer(e_activator) && !is_true(e_activator.var_28107825) && !is_true(self.b_pickedup))
		{
			instance notify(#"hash_33e194cec969b040");
			player = e_activator;
			playsoundatposition(#"hash_1105191492bc5a15", self.origin + vectorscale((0, 0, 1), 25));
			if(isdefined(s_result.activator))
			{
				player playrumbleonentity("damage_heavy");
			}
			foreach(e_player in getplayers())
			{
				if(e_player != player)
				{
					self.t_pickup setinvisibletoplayer(e_player);
				}
			}
			var_53ba65b = getentarray("retrieval_canister", "targetname");
			foreach(var_57e77903 in var_53ba65b)
			{
				if(var_57e77903 != self && isdefined(var_57e77903.n_objective_id))
				{
					objective_setinvisibletoplayer(var_57e77903.n_objective_id, player);
				}
			}
			self.b_pickedup = 1;
			self.e_owner = player;
			tagname = "tag_stowed_back";
			if(!player haspart(tagname))
			{
				tagname = undefined;
			}
			self.t_pickup usetriggerrequirelookat(0);
			self.t_pickup sethintstring(#"hash_1bdc30d1c55f4de");
			switch(self.n_id)
			{
				case 0:
				{
					self.str_obj = #"hash_61f64747e0c7fd48";
					break;
				}
				case 1:
				{
					self.str_obj = #"hash_61f64a47e0c80261";
					break;
				}
			}
			objective_add(self.n_objective_id, "active", self, self.str_obj);
			objective_setinvisibletoplayer(self.n_objective_id, player);
			player.var_28107825 = 1;
			player.var_67aa3392 = self;
			waitframe(1);
			self linkto(player, "tag_stowed_back", (8, 5, -4), vectorscale((1, 0, 0), 270));
			self clientfield::set("" + #"hash_7e6957dfc36e2214", 1);
			player clientfield::set_to_player("" + #"hash_502dbbefce1f656c", 1);
			if(!is_true(player.var_7cd1b025))
			{
				player.var_7cd1b025 = 1;
				player thread function_ac6bb77d(instance);
				instance thread function_d153c0f0();
				instance notify(#"defend");
			}
			player thread function_bd0bc40b(1);
			player thread function_61ee3ab0(instance, self);
			player thread function_40285fbe(instance);
			player thread function_4be8796(instance);
			player thread function_1a58f438(instance);
			player thread function_9181f7b3(instance);
			self thread function_2d670ab2(instance);
			waitframe(1);
			player thread function_50a7d571(self, instance);
		}
	}
}

/*
	Name: function_40285fbe
	Namespace: objective_retrieval
	Checksum: 0x465857FF
	Offset: 0x6748
	Size: 0x156
	Parameters: 1
	Flags: Linked
*/
function function_40285fbe(instance)
{
	instance endon(#"objective_ended");
	self endon(#"disconnect", #"player_downed", #"hash_6d2d12b8afe43c8e");
	while(true)
	{
		if(distance2dsquared(instance.var_fe2612fe[#"retrieval"][0].var_5ea363c.origin, self.origin) < sqr(100) && is_true(self.var_28107825))
		{
			if(isdefined(self.var_67aa3392.t_pickup))
			{
				self.var_67aa3392.t_pickup setinvisibletoplayer(self);
			}
		}
		else if(isdefined(self.var_67aa3392.t_pickup))
		{
			self.var_67aa3392.t_pickup setvisibletoplayer(self);
		}
		waitframe(1);
	}
}

/*
	Name: function_50a7d571
	Namespace: objective_retrieval
	Checksum: 0x975D9EA8
	Offset: 0x68A8
	Size: 0xEE
	Parameters: 2
	Flags: Linked
*/
function function_50a7d571(var_67aa3392, instance)
{
	self endon(#"disconnect", #"player_downed", #"hash_6d2d12b8afe43c8e");
	instance endon(#"objective_ended");
	while(true)
	{
		var_53044e8e = self gamepadusedlast();
		if(!var_53044e8e && self buttonbitstate("BUTTON_BIT_ANY_DOWN") || (var_53044e8e && self actionslottwobuttonpressed()))
		{
			self thread function_f1ae312a(instance);
		}
		waitframe(1);
	}
}

/*
	Name: function_bd0bc40b
	Namespace: objective_retrieval
	Checksum: 0x5A7ED35D
	Offset: 0x69A0
	Size: 0x1E4
	Parameters: 1
	Flags: Linked
*/
function function_bd0bc40b(b_enabled)
{
	if(b_enabled)
	{
		self allowjump(0);
		self allowsprint(0);
		self allowcrouch(0);
		self allowprone(0);
		self setstance("stand");
		if(getplayers().size < 2)
		{
			if(self namespace_e86ffa8::function_3623f9d1(0))
			{
				self setmovespeedscale(0.9);
			}
			else
			{
				self setmovespeedscale(0.8);
			}
		}
		else
		{
			if(self namespace_e86ffa8::function_3623f9d1(0))
			{
				self setmovespeedscale(0.85);
			}
			else
			{
				self setmovespeedscale(0.7);
			}
		}
	}
	else
	{
		self allowjump(1);
		self allowsprint(1);
		self allowcrouch(1);
		self allowprone(1);
		self setmovespeedscale(1);
	}
}

/*
	Name: zombie_death_watcher
	Namespace: objective_retrieval
	Checksum: 0xE64C6DD0
	Offset: 0x6B90
	Size: 0x68
	Parameters: 1
	Flags: None
*/
function zombie_death_watcher(instance)
{
	instance endon(#"objective_ended");
	self waittill(#"death");
	if(isdefined(instance.n_zombies) && instance.n_zombies > 0)
	{
		instance.n_zombies--;
	}
}

/*
	Name: function_d583b222
	Namespace: objective_retrieval
	Checksum: 0xA37A769D
	Offset: 0x6C00
	Size: 0x9E
	Parameters: 0
	Flags: Linked
*/
function function_d583b222()
{
	switch(getplayers().size)
	{
		case 1:
		{
			n_spawns = 8;
			break;
		}
		case 2:
		{
			n_spawns = 12;
			break;
		}
		case 3:
		{
			n_spawns = 15;
			break;
		}
		case 4:
		{
			n_spawns = 22;
			break;
		}
	}
	return n_spawns;
}

/*
	Name: function_e97e2683
	Namespace: objective_retrieval
	Checksum: 0xFC66D37
	Offset: 0x6CA8
	Size: 0xF6
	Parameters: 1
	Flags: Linked
*/
function function_e97e2683(b_initial)
{
	switch(getplayers().size)
	{
		case 1:
		{
			if(!isdefined(b_initial))
			{
				n_spawns = 8;
			}
			else
			{
				n_spawns = 10;
			}
			break;
		}
		case 2:
		{
			if(!isdefined(b_initial))
			{
				n_spawns = 14;
			}
			else
			{
				n_spawns = 16;
			}
			break;
		}
		case 3:
		{
			if(!isdefined(b_initial))
			{
				n_spawns = 16;
			}
			else
			{
				n_spawns = 18;
			}
			break;
		}
		case 4:
		{
			if(!isdefined(b_initial))
			{
				n_spawns = 18;
			}
			else
			{
				n_spawns = 20;
			}
			break;
		}
	}
	return n_spawns;
}

/*
	Name: function_ec4c64fd
	Namespace: objective_retrieval
	Checksum: 0x2C73ECF4
	Offset: 0x6DA8
	Size: 0x17A
	Parameters: 1
	Flags: Linked
*/
function function_ec4c64fd(goalpos)
{
	self.var_cfb82e92 = 4;
	self.var_62561fdc = 750;
	self.var_9b6bfdb7 = undefined;
	enemy = zm_ai_utility::function_825317c(self);
	if(isdefined(enemy))
	{
		dist_sq = distancesquared(self.origin, enemy.origin);
		if(dist_sq > sqr(500))
		{
			self.var_9b6bfdb7 = int(4 * 1000);
		}
		if(dist_sq > sqr(1000))
		{
			self.var_7a6bf645 = 0;
			z_delta = abs(self.origin[2] - enemy.origin[2]);
			if(z_delta > 100)
			{
				self.var_a44ca810 = 400 + randomint(100);
				self.var_cfb82e92 = 1;
			}
		}
		else
		{
			self.var_7a6bf645 = 1;
		}
	}
}

/*
	Name: zombie_attack
	Namespace: objective_retrieval
	Checksum: 0x5430B2C9
	Offset: 0x6F30
	Size: 0x2A8
	Parameters: 0
	Flags: Linked
*/
function zombie_attack()
{
	self endon(#"death");
	self callback::function_d8abfc3d(#"hash_4afe635f36531659", &function_fd68cae4);
	self flag::set(#"hash_52d6a75cdbf101f3");
	self.var_40e7d5fb = &function_ec4c64fd;
	while(true)
	{
		a_players = array::get_all_closest(self.origin, function_a1ef346b(), undefined, 4, 1500);
		self.is_attacking = undefined;
		if(isdefined(a_players))
		{
			for(i = 0; i < a_players.size; i++)
			{
				if(is_true(a_players[i].var_28107825))
				{
					if(!isdefined(self.is_attacking) && isalive(self) && isalive(a_players[i]))
					{
						waitframe(1);
						if(isalive(a_players[i]))
						{
							awareness::function_c241ef9a(self, a_players[i], 11);
							self.is_attacking = 1;
							wait(10);
						}
					}
				}
			}
		}
		if(!isdefined(self.is_attacking) && isalive(self))
		{
			player = awareness::function_d7fedde2(self);
			if(isalive(player))
			{
				awareness::function_e732359c(1, self.origin, 512, self, {#position:player.origin});
			}
			waitframe(1);
			if(isalive(player))
			{
				self.is_attacking = 1;
				awareness::function_c241ef9a(self, player, 11);
				wait(10);
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_fd68cae4
	Namespace: objective_retrieval
	Checksum: 0x989A8B4E
	Offset: 0x71E0
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function function_fd68cae4()
{
	if(self.archetype == #"zombie")
	{
		if(isdefined(self.var_b4e37a30) && level.var_b48509f9 > 4)
		{
			self namespace_85745671::function_9758722("super_sprint");
		}
		if(level.var_b48509f9 < 5)
		{
			self namespace_85745671::function_9758722("sprint");
		}
	}
}

/*
	Name: function_2d670ab2
	Namespace: objective_retrieval
	Checksum: 0x792A7FEC
	Offset: 0x7278
	Size: 0x124
	Parameters: 1
	Flags: Linked
*/
function function_2d670ab2(instance)
{
	instance endon(#"objective_ended");
	self endon(#"installed", #"failsafe");
	while(true)
	{
		if(self.origin[2] < instance.origin[2] - 2000)
		{
			if(is_true(self.b_pickedup))
			{
				if(isdefined(self.e_owner))
				{
					self.e_owner thread function_f1ae312a(instance);
				}
			}
			else
			{
				self moveto(self.v_start, 0.05);
				self waittill(#"movedone");
				self thread function_6fd7f323();
			}
			self notify(#"failsafe");
		}
		wait(0.5);
	}
}

/*
	Name: function_9181f7b3
	Namespace: objective_retrieval
	Checksum: 0x3D6EE766
	Offset: 0x73A8
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function function_9181f7b3(instance)
{
	self notify("4a30a67e6ec59ea2");
	self endon("4a30a67e6ec59ea2");
	self endon(#"disconnect", #"hash_6d2d12b8afe43c8e");
	instance endon(#"objective_ended");
	s_result = undefined;
	s_result = self waittill(#"enter_vehicle");
	if(isdefined(s_result.vehicle))
	{
		s_result.vehicle thread function_eb9a0f67();
	}
}

/*
	Name: function_eb9a0f67
	Namespace: objective_retrieval
	Checksum: 0x200B250D
	Offset: 0x7458
	Size: 0x122
	Parameters: 0
	Flags: Linked
*/
function function_eb9a0f67()
{
	self notify("12870a8589a550eb");
	self endon("12870a8589a550eb");
	self endon(#"death");
	wait(2);
	while(true)
	{
		players = self getvehoccupants();
		if(isdefined(players))
		{
			foreach(player in players)
			{
				if(is_true(player.var_28107825))
				{
					self vehicle_damage(50, player);
				}
			}
		}
		else
		{
			break;
		}
		wait(1);
	}
}

/*
	Name: vehicle_damage
	Namespace: objective_retrieval
	Checksum: 0xDED7667F
	Offset: 0x7588
	Size: 0x64
	Parameters: 2
	Flags: Linked
*/
function vehicle_damage(damage_amount, player)
{
	if(isdefined(self))
	{
		if(isdefined(player))
		{
			self dodamage(player, self.origin);
		}
		playrumbleonposition("sr_canister_damage_vehicle_rumble", self.origin);
	}
}

/*
	Name: function_61ee3ab0
	Namespace: objective_retrieval
	Checksum: 0x21D8B482
	Offset: 0x75F8
	Size: 0xF4
	Parameters: 2
	Flags: Linked
*/
function function_61ee3ab0(instance, var_57e77903)
{
	instance endon(#"objective_ended");
	self endon(#"disconnect");
	var_57e77903 endon(#"installed");
	self waittill(#"hash_6d2d12b8afe43c8e");
	if(!is_true(self.var_4cd303ca))
	{
		if(!is_true(instance.var_8240d3e4))
		{
			instance thread function_9f6ab3c7();
			level thread namespace_7589cf5c::play_vo("objectiveRetrievalCanisterDropped");
		}
	}
	var_57e77903 thread function_6fd7f323();
}

/*
	Name: function_9f6ab3c7
	Namespace: objective_retrieval
	Checksum: 0x9F9938D5
	Offset: 0x76F8
	Size: 0x36
	Parameters: 0
	Flags: Linked
*/
function function_9f6ab3c7()
{
	self endon(#"objective_ended");
	self.var_8240d3e4 = 1;
	wait(15);
	self.var_8240d3e4 = undefined;
}

/*
	Name: function_6fd7f323
	Namespace: objective_retrieval
	Checksum: 0x5D2BC0E7
	Offset: 0x7738
	Size: 0x330
	Parameters: 0
	Flags: Linked
*/
function function_6fd7f323()
{
	v_point = getclosestpointonnavmesh(self.e_owner.origin, 120, 16);
	if(isdefined(v_point))
	{
		v_ground = groundtrace(v_point + vectorscale((0, 0, 1), 50), v_point + (vectorscale((0, 0, -1), 1000)), 1, self.e_owner)[#"position"];
	}
	if(!isdefined(v_ground))
	{
		v_ground = self.e_owner.origin;
	}
	self.e_owner = undefined;
	self clientfield::set("" + #"hash_7e6957dfc36e2214", 0);
	self.b_pickedup = 0;
	self.var_470d03b1 = 1;
	self unlink();
	wait(0.1);
	self moveto(v_ground, 0.05);
	self waittill(#"movedone");
	self.angles = (0, 0, 0);
	self.t_pickup usetriggerrequirelookat(1);
	self.t_pickup sethintstring(#"hash_c90fb1f338973f7");
	playsoundatposition(#"hash_3047775b10faeffc", self.origin + vectorscale((0, 0, 1), 25));
	self clientfield::set("" + #"hash_7e6957dfc36e2214", 1);
	objective_add(self.n_objective_id, "active", self, self.var_7017d40);
	self.t_pickup setvisibletoall();
	var_53ba65b = getentarray("retrieval_canister", "targetname");
	foreach(var_57e77903 in var_53ba65b)
	{
		if(var_57e77903 != self && isdefined(var_57e77903.n_objective_id) && !is_true(var_57e77903.var_2e5efdc7))
		{
			objective_setvisibletoall(var_57e77903.n_objective_id);
		}
	}
}

/*
	Name: function_f1ae312a
	Namespace: objective_retrieval
	Checksum: 0xF1CE0EFE
	Offset: 0x7A70
	Size: 0x13C
	Parameters: 1
	Flags: Linked
*/
function function_f1ae312a(instance)
{
	if(is_true(self.var_28107825))
	{
		self.var_67aa3392 zm_utility::function_747180ea(self.var_67aa3392.n_objective_id, undefined, self.var_67aa3392.t_pickup);
		self clientfield::set_to_player("" + #"hash_502dbbefce1f656c", 0);
		self.var_28107825 = 0;
		self.var_67aa3392 = undefined;
		if(isdefined(self.var_57e77903))
		{
			self.var_57e77903 delete();
		}
		else
		{
			self detach(#"hash_18fe97c27ac7bf5b", "tag_stowed_back");
		}
		self notify(#"hash_6d2d12b8afe43c8e");
		self thread function_bd0bc40b(0);
		if(isdefined(self))
		{
			self playrumbleonentity("zm_interact_rumble");
		}
	}
}

/*
	Name: function_44ae8976
	Namespace: objective_retrieval
	Checksum: 0xC5F69E79
	Offset: 0x7BB8
	Size: 0x380
	Parameters: 2
	Flags: Linked
*/
function function_44ae8976(instance, activator)
{
	if(isplayer(activator))
	{
		instance notify(#"hash_3630518d6dc9aeda");
		instance thread namespace_7589cf5c::function_f10301b0();
		instance thread function_17f1d0f3();
		instance thread function_8d7bef8f();
		instance.var_5ea363c thread machine_trigger(instance);
		foreach(var_57e77903 in instance.var_53ba65b)
		{
			var_57e77903 thread function_5238fe78(instance);
			var_57e77903 thread function_6d863da0(instance);
			var_57e77903 thread function_6cbbd741(instance);
		}
		if(instance.targetname === #"hash_17f3ee07ca053ac8")
		{
			var_cdce8e6f = instance.var_fe2612fe[#"hash_5819d8571ea7c838"][0];
			if(isdefined(var_cdce8e6f.script_noteworthy))
			{
				instance flag::set(#"hash_12988a5a3e6a65d6");
				level.var_97e461d4 = var_cdce8e6f.script_noteworthy;
			}
		}
		else
		{
			namespace_7589cf5c::function_1e45b156(instance);
		}
		foreach(player in getplayers())
		{
			level.var_31028c5d prototype_hud::set_main_objective_string(player, #"hash_69606c9e75f74ab0");
		}
		instance.n_max_zombies = function_d583b222();
		wait(6);
		foreach(player in getplayers())
		{
			level.var_31028c5d prototype_hud::set_active_objective_string(player, #"hash_69606c9e75f74ab0");
			level.var_31028c5d prototype_hud::set_active_obj_visibility(player, 2);
		}
	}
}

/*
	Name: function_9c54feb0
	Namespace: objective_retrieval
	Checksum: 0x2C350141
	Offset: 0x7F40
	Size: 0x28C
	Parameters: 1
	Flags: Linked
*/
function function_9c54feb0(instance)
{
	instance endon(#"objective_ended");
	self.n_objective_id = gameobjects::get_next_obj_id();
	if(!isdefined(self.n_id))
	{
		self.str_obj = #"hash_449cd1c65196f3a8";
	}
	else
	{
		switch(self.n_id)
		{
			case 0:
			{
				self.str_obj = #"hash_3084c6ecc7696cb4";
				self.var_7017d40 = #"hash_2fc69f49d36f4c3c";
				break;
			}
			case 1:
			{
				self.str_obj = #"hash_3084c9ecc76971cd";
				self.var_7017d40 = #"hash_2fc6a249d36f5155";
				break;
			}
		}
	}
	self thread objective_marker(instance);
	if(isdefined(self.n_id))
	{
		objective_add(self.n_objective_id, "active", self, self.str_obj);
		objective_setprogress(self.n_objective_id, 1);
		self zm_utility::function_747180ea(self.n_objective_id, undefined, self.t_pickup);
		self waittill(#"open");
		self zm_utility::function_48d9a9c9();
		gameobjects::release_obj_id(self.n_objective_id);
		objective_delete(self.n_objective_id);
		self waittill(#"ready");
		wait(0.5);
		self.n_objective_id = gameobjects::get_next_obj_id();
		self zm_utility::function_747180ea(self.n_objective_id, undefined, self.t_pickup);
		objective_add(self.n_objective_id, "active", self, self.var_7017d40);
		objective_setprogress(self.n_objective_id, 1);
	}
}

/*
	Name: objective_marker
	Namespace: objective_retrieval
	Checksum: 0x75C1AF35
	Offset: 0x81D8
	Size: 0x14C
	Parameters: 1
	Flags: Linked
*/
function objective_marker(instance)
{
	self endon(#"death");
	instance waittill(#"objective_ended");
	if(instance flag::get(#"hash_12988a5a3e6a65d6"))
	{
		level.var_97e461d4 = undefined;
		instance flag::clear(#"hash_12988a5a3e6a65d6");
	}
	wait(0.1);
	if(isdefined(self.n_objective_id))
	{
		self zm_utility::function_48d9a9c9();
		gameobjects::release_obj_id(self.n_objective_id);
		objective_delete(self.n_objective_id);
	}
	if(isdefined(self.t_pickup))
	{
		self.t_pickup delete();
	}
	if(isdefined(self) && !is_true(self.var_2e5efdc7) && isdefined(self.n_id))
	{
		self delete();
	}
}

/*
	Name: function_aece4588
	Namespace: objective_retrieval
	Checksum: 0xC2AAC9A5
	Offset: 0x8330
	Size: 0x186
	Parameters: 1
	Flags: Linked
*/
function function_aece4588(var_3afe334f)
{
	switch(var_3afe334f)
	{
		case 1:
		{
			var_e7a1cbae = #"hash_7c4049835462526e";
			break;
		}
		case 2:
		{
			var_e7a1cbae = #"hash_7c404883546250bb";
			break;
		}
		case 3:
		{
			var_e7a1cbae = #"hash_7c40478354624f08";
			break;
		}
		case 4:
		{
			var_e7a1cbae = #"hash_7c404e8354625aed";
			break;
		}
		case 5:
		{
			var_e7a1cbae = #"hash_7c404d835462593a";
			break;
		}
		case 6:
		{
			var_e7a1cbae = #"hash_7c404c8354625787";
			break;
		}
		case 7:
		{
			var_e7a1cbae = #"hash_7c404b83546255d4";
			break;
		}
		default:
		{
			var_e7a1cbae = #"hash_7c40428354624689";
			break;
		}
	}
	var_6017f33e = namespace_679a22ba::function_ca209564(var_e7a1cbae);
	return var_6017f33e.var_990b33df;
}

/*
	Name: function_9732fce6
	Namespace: objective_retrieval
	Checksum: 0x7D4075B4
	Offset: 0x84C0
	Size: 0xCE
	Parameters: 3
	Flags: None
*/
function function_9732fce6(v_position, v_angles, n_index)
{
	if(n_index == 0)
	{
		point = function_4ba8fde(#"hash_7c46132094b01ee");
	}
	else
	{
		point = function_4ba8fde(#"hash_7c46032094b003b");
	}
	e_canister = item_drop::drop_item(n_index, undefined, 1, 0, point.id, v_position, v_angles, 0);
	e_canister.var_dd21aec2 = 1 | 16;
	return e_canister;
}

