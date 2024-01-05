#using script_4ce7b4190a2fa70;
#using script_7d7ac1f663edcdc8;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_score.gsc;
#using script_18077945bb84ede7;
#using script_165beea08a63a243;
#using script_7bacb32f8222fa3e;
#using script_4108035fe400ce67;
#using scripts\core_common\item_inventory.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\fx_shared.gsc;
#using script_7fc996fe8678852;
#using scripts\core_common\clientfield_shared.gsc;

#namespace namespace_cda50904;

/*
	Name: function_805e28b2
	Namespace: namespace_cda50904
	Checksum: 0xDAD53178
	Offset: 0x330
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_805e28b2()
{
	level notify(605549797);
}

/*
	Name: __init__system__
	Namespace: namespace_cda50904
	Checksum: 0xD0008EC3
	Offset: 0x350
	Size: 0x54
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_57d1b71f57332413", &function_70a657d8, undefined, &finalize, #"hash_f81b9dea74f0ee");
}

/*
	Name: function_70a657d8
	Namespace: namespace_cda50904
	Checksum: 0x80F724D1
	Offset: 0x3B0
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
}

/*
	Name: finalize
	Namespace: namespace_cda50904
	Checksum: 0xF91A50BA
	Offset: 0x3C0
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function finalize()
{
	/#
		level thread init_devgui();
	#/
}

/*
	Name: function_a92a93e9
	Namespace: namespace_cda50904
	Checksum: 0xECE3F4E5
	Offset: 0x3E8
	Size: 0x44E
	Parameters: 4
	Flags: Linked
*/
function function_a92a93e9(v_location, v_angles, var_75b5cef0, n_delay)
{
	if(!isdefined(var_75b5cef0))
	{
		var_75b5cef0 = 0;
	}
	if(!isdefined(n_delay))
	{
		n_delay = 1;
	}
	foreach(player in getplayers())
	{
		switch(level.var_b48509f9)
		{
			default:
			{
				level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:"objective_complete_capsule_1", #attacker:player});
				break;
			}
			case 2:
			{
				level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:"objective_complete_capsule_2", #attacker:player});
				break;
			}
			case 3:
			{
				level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:"objective_complete_capsule_3", #attacker:player});
				break;
			}
			case 4:
			{
				level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:"objective_complete_capsule_4", #attacker:player});
				break;
			}
			case 5:
			{
				level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:"objective_complete_capsule_5", #attacker:player});
				break;
			}
			case 6:
			{
				level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:"objective_complete_capsule_6", #attacker:player});
				break;
			}
			case 7:
			{
				level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:"objective_complete_capsule_7", #attacker:player});
				break;
			}
			case 8:
			{
				level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:"objective_complete_capsule_8", #attacker:player});
				break;
			}
			case 9:
			{
				level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:"objective_complete_capsule_9", #attacker:player});
				break;
			}
			case 10:
			{
				level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:"objective_complete_capsule_10", #attacker:player});
				break;
			}
		}
	}
}

/*
	Name: function_bdd95292
	Namespace: namespace_cda50904
	Checksum: 0x2E01C121
	Offset: 0xA80
	Size: 0x38C
	Parameters: 1
	Flags: Linked
*/
function function_bdd95292(struct)
{
	struct.scriptmodel = namespace_8b6a9d79::spawn_script_model(struct, "p8_fxanim_wz_supply_stash_01_glow_mod", 1);
	struct.var_422ae63e = #"hash_5657ee89257b06fe";
	struct.scriptmodel fx::play("sr/fx9_chest_objective_amb", struct.origin, struct.angles, "death");
	struct.state = 0;
	struct.usetriggers = [];
	struct.players = [];
	players = getplayers();
	/#
		assert(players.size > 0, "");
	#/
	foreach(player in players)
	{
		if(!isdefined(player.var_524f43cb))
		{
			player.var_524f43cb = [];
		}
		trigger = namespace_8b6a9d79::function_214737c7(struct, &function_b4f2a34e, #"hash_4703982104472957", undefined, 200);
		trigger.struct = struct;
		trigger.origin = trigger.origin + vectorscale((0, 0, 1), 16);
		objid = zm_utility::function_f5a222a8(#"hash_52547cde15854dbf", struct.scriptmodel);
		trigger.var_7fadf788 = objid;
		player.var_524f43cb[objid] = objid;
		function_56ad6a7a(player.var_524f43cb[objid]);
		objective_setvisibletoplayer(player.var_524f43cb[objid], player);
		player clientclaimtrigger(trigger);
		if(!isdefined(struct.usetriggers))
		{
			struct.usetriggers = [];
		}
		else if(!isarray(struct.usetriggers))
		{
			struct.usetriggers = array(struct.usetriggers);
		}
		struct.usetriggers[struct.usetriggers.size] = trigger;
		if(!isdefined(struct.players))
		{
			struct.players = [];
		}
		else if(!isarray(struct.players))
		{
			struct.players = array(struct.players);
		}
		struct.players[struct.players.size] = player;
	}
	struct thread function_9086861a();
}

/*
	Name: function_9086861a
	Namespace: namespace_cda50904
	Checksum: 0x1E0D047F
	Offset: 0xE18
	Size: 0x180
	Parameters: 0
	Flags: Linked
*/
function function_9086861a()
{
	level endon(#"game_ended");
	self endon(#"death");
	while(true)
	{
		var_79e2063c = 0;
		foreach(trigger in self.usetriggers)
		{
			if(isdefined(trigger))
			{
				var_79e2063c = 1;
			}
		}
		if(!var_79e2063c)
		{
			mdl_origin = self.scriptmodel.origin;
			self.scriptmodel clientfield::set("reward_chest_fx", 0);
			wait(5);
			self fx::play("sr/fx9_safehouse_mchn_wonderfizz_spawn", self.origin, self.angles);
			self.scriptmodel delete();
			level thread item_drop::function_4da960f6(mdl_origin, 64, 3);
			return;
		}
		waitframe(1);
	}
}

/*
	Name: function_b4f2a34e
	Namespace: namespace_cda50904
	Checksum: 0x2EAFB3A3
	Offset: 0xFA0
	Size: 0xB4
	Parameters: 1
	Flags: Linked
*/
function function_b4f2a34e(eventstruct)
{
	var_9a42a872 = eventstruct.activator;
	if(self.struct.state == 0)
	{
		self.struct.scriptmodel thread scene::play(self.struct.var_422ae63e, self.struct.scriptmodel);
		self.struct.state = 1;
		wait(0.25);
	}
	var_9a42a872 thread function_39340834(self.struct, self);
}

/*
	Name: function_39340834
	Namespace: namespace_cda50904
	Checksum: 0x20DAA86A
	Offset: 0x1060
	Size: 0x34C
	Parameters: 2
	Flags: Linked
*/
function function_39340834(struct, trigger)
{
	rewards = #"hash_1ef73db4d92eeea8";
	var_9c9943cf = 0;
	if(level.var_cf558bf < 1)
	{
		rewards = #"hash_1ef73db4d92eeea8";
	}
	if(level.var_cf558bf == 1)
	{
		rewards = #"hash_1ef740b4d92ef3c1";
		var_9c9943cf = 1;
	}
	if(level.var_cf558bf >= 2)
	{
		rewards = #"hash_1ef73fb4d92ef20e";
		var_9c9943cf = 2;
	}
	if(struct.state == 1)
	{
		struct.state = 2;
		list = getscriptbundle(rewards);
		function_621d45bc(list, struct);
	}
	if(!level.var_30197c60 sr_objective_reward_menu::is_open(self))
	{
		level.var_30197c60 sr_objective_reward_menu::open(self, 0);
		if(isdefined(struct.var_f0f92268))
		{
			playerindex = function_76d51213(struct, self);
			if(playerindex < 0)
			{
				playerindex = 0;
			}
			index1 = 0;
			index2 = 1;
			var_d6a6fb08 = 2;
			if(isdefined(struct.var_f0f92268[playerindex][0]) && (isdefined(struct.var_f0f92268[playerindex][1]) && isdefined(struct.var_f0f92268[playerindex][2])))
			{
				index1 = struct.var_f0f92268[playerindex][0];
				index2 = struct.var_f0f92268[playerindex][1];
				var_d6a6fb08 = struct.var_f0f92268[playerindex][2];
			}
			gunindex1 = function_219cb8bb(index1);
			gunindex2 = function_219cb8bb(index2);
			gunindex3 = function_219cb8bb(var_d6a6fb08);
			level.var_30197c60 sr_objective_reward_menu::set_gunindex1(self, gunindex1);
			level.var_30197c60 sr_objective_reward_menu::set_gunindex2(self, gunindex2);
			level.var_30197c60 sr_objective_reward_menu::set_gunindex3(self, gunindex3);
			level.var_30197c60 sr_objective_reward_menu::set_color(self, var_9c9943cf);
		}
		self thread function_80bbb50b(struct, trigger);
		self namespace_553954de::function_14bada94();
	}
}

/*
	Name: function_621d45bc
	Namespace: namespace_cda50904
	Checksum: 0x6AF2EE81
	Offset: 0x13B8
	Size: 0x1C0
	Parameters: 2
	Flags: Linked
*/
function function_621d45bc(list, struct)
{
	players = getplayers();
	struct.var_f0f92268 = [];
	foreach(player in players)
	{
		var_2ab78386 = function_410c380(list.itemlist);
		var_ff082c28 = function_410c380(list.itemlist, var_2ab78386);
		var_d3ac88d = function_410c380(list.itemlist, var_2ab78386, var_ff082c28);
		var_c4aee6b4 = [2:var_d3ac88d, 1:var_ff082c28, 0:var_2ab78386];
		if(!isdefined(struct.var_f0f92268))
		{
			struct.var_f0f92268 = [];
		}
		else if(!isarray(struct.var_f0f92268))
		{
			struct.var_f0f92268 = array(struct.var_f0f92268);
		}
		struct.var_f0f92268[struct.var_f0f92268.size] = var_c4aee6b4;
	}
}

/*
	Name: function_410c380
	Namespace: namespace_cda50904
	Checksum: 0x776FB59E
	Offset: 0x1580
	Size: 0x6DA
	Parameters: 3
	Flags: Linked, Private
*/
function private function_410c380(list, var_523adf97, var_5fe37ae8)
{
	var_c4b75358 = [];
	i = 0;
	foreach(item in list)
	{
		if(item.maxweight == item.minweight)
		{
			weight = item.maxweight;
		}
		else
		{
			weight = randomintrange(item.minweight, item.maxweight);
		}
		var_c4b75358[i] = weight;
	}
	i = 0;
	total_weight = 0;
	foreach(weight in var_c4b75358)
	{
		total_weight = total_weight + weight;
	}
	var_f00ca053 = [];
	var_abe6284f = [];
	var_34e28de6 = randomintrange(0, total_weight);
	var_abe6284f[0] = var_c4b75358[0];
	for(count = 1; count < var_c4b75358.size; count++)
	{
		var_abe6284f[count] = (var_abe6284f[count - 1]) + var_c4b75358[count];
	}
	foreach(weight in var_abe6284f)
	{
		if(var_34e28de6 < weight)
		{
			if(isdefined(var_523adf97) && isdefined(var_5fe37ae8))
			{
				if(list[i].var_a6762160 != var_523adf97 && list[i].var_a6762160 != var_5fe37ae8)
				{
					if(!isdefined(var_f00ca053))
					{
						var_f00ca053 = [];
					}
					else if(!isarray(var_f00ca053))
					{
						var_f00ca053 = array(var_f00ca053);
					}
					if(!isinarray(var_f00ca053, i))
					{
						var_f00ca053[var_f00ca053.size] = i;
					}
				}
				continue;
			}
			if(isdefined(var_523adf97))
			{
				if(list[i].var_a6762160 != var_523adf97)
				{
					if(!isdefined(var_f00ca053))
					{
						var_f00ca053 = [];
					}
					else if(!isarray(var_f00ca053))
					{
						var_f00ca053 = array(var_f00ca053);
					}
					if(!isinarray(var_f00ca053, i))
					{
						var_f00ca053[var_f00ca053.size] = i;
					}
				}
				continue;
			}
			if(!isdefined(var_f00ca053))
			{
				var_f00ca053 = [];
			}
			else if(!isarray(var_f00ca053))
			{
				var_f00ca053 = array(var_f00ca053);
			}
			if(!isinarray(var_f00ca053, i))
			{
				var_f00ca053[var_f00ca053.size] = i;
			}
		}
	}
	if(var_f00ca053.size >= 1)
	{
		random_index = randomint(var_f00ca053.size);
		item_index = var_f00ca053[random_index];
		return list[item_index].var_a6762160;
	}
	if(isdefined(var_523adf97) && isdefined(var_5fe37ae8))
	{
		new_list = [];
		foreach(item in list)
		{
			if(item.var_a6762160 != var_523adf97 && item.var_a6762160 != var_5fe37ae8)
			{
				if(!isdefined(new_list))
				{
					new_list = [];
				}
				else if(!isarray(new_list))
				{
					new_list = array(new_list);
				}
				if(!isinarray(new_list, item.var_a6762160))
				{
					new_list[new_list.size] = item.var_a6762160;
				}
			}
		}
		random_index = randomint(new_list.size);
		return new_list[random_index];
	}
	if(isdefined(var_523adf97))
	{
		new_list = [];
		foreach(item in list)
		{
			if(item.var_a6762160 != var_523adf97)
			{
				if(!isdefined(new_list))
				{
					new_list = [];
				}
				else if(!isarray(new_list))
				{
					new_list = array(new_list);
				}
				if(!isinarray(new_list, item.var_a6762160))
				{
					new_list[new_list.size] = item.var_a6762160;
				}
			}
		}
		random_index = randomint(new_list.size);
		return new_list[random_index];
	}
	random_index = randomint(list.size);
	return list[random_index].var_a6762160;
}

/*
	Name: function_219cb8bb
	Namespace: namespace_cda50904
	Checksum: 0xB014B1F0
	Offset: 0x1C68
	Size: 0x27A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_219cb8bb(var_a6762160)
{
	switch(var_a6762160)
	{
		case "hash_1ca36ca26c214cd6":
		case "hash_4777f28d1a2ad7bf":
		case "hash_5b2d331d596e0292":
		{
			return 0;
			break;
		}
		case "hash_5b1db5e03f5e110":
		case "hash_33547d35295bb55d":
		case "hash_3b690bafadb73c0c":
		{
			return 1;
			break;
		}
		case "hash_57ecfa2e8316c14d":
		{
			return 2;
			break;
		}
		case "hash_500af850e37ee916":
		case "hash_591cbfbc064e6c05":
		case "hash_6f3b58530040f23d":
		{
			return 3;
			break;
		}
		case "hash_315f46ebc2faa42":
		case "hash_19e050fa878481ae":
		case "hash_4753c3b0bc43322b":
		{
			return 4;
			break;
		}
		case "hash_2f25727fed26d18":
		case "hash_7a3b47d15aca53f":
		case "hash_2116e38be200ebf7":
		{
			return 5;
			break;
		}
		case "hash_1ceed3c7dc5f09ad":
		case "hash_27a1d3b77a36f326":
		case "hash_551ca3818f740355":
		{
			return 6;
			break;
		}
		case "hash_1d907bc74dbe9c13":
		case "hash_2230087fda13a58c":
		case "hash_7b49122756d14edb":
		{
			return 7;
			break;
		}
		case "hash_304d190e0d3d0fcb":
		case "hash_48970e40447be9fc":
		case "hash_71b652be0285b523":
		{
			return 8;
			break;
		}
		case "hash_39cfa9ec04309821":
		case "hash_69dbddfbde9661a9":
		case "hash_78f079dd7a6e2e22":
		{
			return 9;
			break;
		}
		case "hash_168aa53c035ea545":
		case "hash_200bb87bd1c3049e":
		case "hash_4cf361d49f792fed":
		{
			return 10;
			break;
		}
	}
}

/*
	Name: function_76d51213
	Namespace: namespace_cda50904
	Checksum: 0x34AA3592
	Offset: 0x1EF0
	Size: 0x9A
	Parameters: 2
	Flags: Linked, Private
*/
function private function_76d51213(struct, var_6ca170e7)
{
	foreach(i, player in struct.players)
	{
		if(player == var_6ca170e7)
		{
			return i;
		}
	}
	return -1;
}

/*
	Name: function_6c71e778
	Namespace: namespace_cda50904
	Checksum: 0x6ED85FAF
	Offset: 0x1F98
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function function_6c71e778()
{
	self val::reset(#"hash_5ff56dba9074b0b4", "allow_crouch");
	self val::reset(#"hash_5ff56dba9074b0b4", "allow_prone");
	level.var_30197c60 sr_objective_reward_menu::close(self);
	self namespace_553954de::function_548f282();
}

/*
	Name: function_39d87af7
	Namespace: namespace_cda50904
	Checksum: 0x2A2E9939
	Offset: 0x2030
	Size: 0x92
	Parameters: 1
	Flags: Linked
*/
function function_39d87af7(currentselection)
{
	switch(currentselection)
	{
		case 0:
		{
			return "Gun1Selected";
			break;
		}
		case 1:
		{
			return "Gun2Selected";
			break;
		}
		case 2:
		{
			return "Gun3Selected";
			break;
		}
		default:
		{
			return "Gun1Selected";
			break;
		}
	}
}

/*
	Name: function_80bbb50b
	Namespace: namespace_cda50904
	Checksum: 0x8AAB0679
	Offset: 0x20D0
	Size: 0x680
	Parameters: 2
	Flags: Linked
*/
function function_80bbb50b(chest, trigger)
{
	trigger sethintstring("");
	if(isdefined(self.var_524f43cb[trigger.var_7fadf788]))
	{
		objid = self.var_524f43cb[trigger.var_7fadf788];
		objective_setinvisibletoplayer(objid, self);
	}
	self endoncallback(&function_6c71e778, #"death");
	chest endoncallback(&function_6c71e778, #"death");
	wait(0.25);
	self val::set(#"hash_5ff56dba9074b0b4", "allow_crouch", 0);
	self val::set(#"hash_5ff56dba9074b0b4", "allow_prone", 0);
	self.var_ba0ccdab = 0;
	state = function_39d87af7(self.var_ba0ccdab);
	level.var_30197c60 sr_objective_reward_menu::set_state(self, state);
	var_38c5c771 = 0;
	var_8cd7eab = 0;
	var_febc0c66 = 0;
	lasttime = gettime();
	time = gettime();
	delta = time - lasttime;
	while(true)
	{
		lasttime = time;
		time = gettime();
		delta = time - lasttime;
		if(self actionslotthreebuttonpressed())
		{
			if(!var_8cd7eab)
			{
				self.var_ba0ccdab = self.var_ba0ccdab - 1;
				if(self.var_ba0ccdab < 0)
				{
					self.var_ba0ccdab = 0;
				}
				state = function_39d87af7(self.var_ba0ccdab);
				level.var_30197c60 sr_objective_reward_menu::set_state(self, state);
			}
			var_8cd7eab = 1;
		}
		else
		{
			var_8cd7eab = 0;
		}
		if(self actionslotfourbuttonpressed())
		{
			if(!var_febc0c66)
			{
				self.var_ba0ccdab = self.var_ba0ccdab + 1;
				if(self.var_ba0ccdab > 2)
				{
					self.var_ba0ccdab = 2;
				}
				state = function_39d87af7(self.var_ba0ccdab);
				level.var_30197c60 sr_objective_reward_menu::set_state(self, state);
			}
			var_febc0c66 = 1;
		}
		else
		{
			var_febc0c66 = 0;
		}
		if(self reloadbuttonpressed() && isalive(self) && !self laststand::player_is_in_laststand() && !self isinvehicle())
		{
			var_38c5c771 = var_38c5c771 + (1 * delta);
			if(var_38c5c771 > 750)
			{
				playerindex = function_76d51213(chest, self);
				if(playerindex < 0)
				{
					playerindex = 0;
				}
				var_25b6fcfc = #"hash_4777f28d1a2ad7bf";
				if(isdefined(chest.var_f0f92268[playerindex][self.var_ba0ccdab]))
				{
					var_25b6fcfc = chest.var_f0f92268[playerindex][self.var_ba0ccdab];
				}
				gun = function_4ba8fde(var_25b6fcfc);
				var_fa3df96 = self item_inventory::function_e66dcff5(gun);
				self item_world::function_de2018e3(gun, self, var_fa3df96);
				if(isdefined(self.var_524f43cb) && (isdefined(trigger.var_7fadf788) && isdefined(self.var_524f43cb[trigger.var_7fadf788])))
				{
					objective_delete(self.var_524f43cb[trigger.var_7fadf788]);
				}
				if(isdefined(trigger))
				{
					trigger delete();
				}
				self function_6c71e778();
				return;
			}
			level.var_30197c60 sr_objective_reward_menu::set_promptprogress(self, var_38c5c771 / 750);
		}
		else
		{
			var_38c5c771 = 0;
			level.var_30197c60 sr_objective_reward_menu::set_promptprogress(self, var_38c5c771 / 750);
		}
		if(self stancebuttonpressed() || distance2d(self.origin, chest.origin) > 128 || self laststand::player_is_in_laststand() || self isinvehicle())
		{
			trigger sethintstring(#"hash_4703982104472957");
			if(isdefined(self.var_524f43cb[trigger.var_7fadf788]))
			{
				objid = self.var_524f43cb[trigger.var_7fadf788];
				objective_setvisibletoplayer(objid, self);
			}
			self function_6c71e778();
			return;
		}
		waitframe(1);
	}
}

/*
	Name: init_devgui
	Namespace: namespace_cda50904
	Checksum: 0x866C200B
	Offset: 0x2758
	Size: 0x54
	Parameters: 0
	Flags: None
*/
function init_devgui()
{
	/#
		util::waittill_can_add_debug_command();
		util::add_devgui("", "");
		level thread function_578918d1();
	#/
}

/*
	Name: function_578918d1
	Namespace: namespace_cda50904
	Checksum: 0xD9685569
	Offset: 0x27B8
	Size: 0x13E
	Parameters: 0
	Flags: None
*/
function function_578918d1()
{
	/#
		while(true)
		{
			if(getdvarint(#"hash_316815357b0bca3a", 0))
			{
				setdvar(#"hash_316815357b0bca3a", 0);
				player = getplayers()[0];
				if(isplayer(player))
				{
					forwardvec = anglestoforward(player.angles);
					forwardvec = vectornormalize(forwardvec);
					forwardvec = forwardvec * 128;
					loc = player.origin + forwardvec;
					function_a92a93e9(loc, player.angles + vectorscale((0, 1, 0), 180), 0);
				}
			}
			wait(1);
		}
	#/
}

