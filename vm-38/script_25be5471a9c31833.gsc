#using scripts\zm_common\zm_utility.gsc;
#using script_3ddf84b7bb3bf47d;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using script_55b68e9c3e3a915b;
#using script_7d7ac1f663edcdc8;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using script_3751b21462a54a7d;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\fx_shared.gsc;
#using script_7fc996fe8678852;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\flag_shared.gsc;

#namespace namespace_82b4c2d1;

/*
	Name: function_e93d1773
	Namespace: namespace_82b4c2d1
	Checksum: 0xDE613A2B
	Offset: 0x1F0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e93d1773()
{
	level notify(2095168383);
}

/*
	Name: __init__system__
	Namespace: namespace_82b4c2d1
	Checksum: 0x336CAB68
	Offset: 0x210
	Size: 0x64
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_79fe34c9f8a0e44c", &function_70a657d8, &function_8ac3bea9, &finalize, #"hash_f81b9dea74f0ee");
}

/*
	Name: function_70a657d8
	Namespace: namespace_82b4c2d1
	Checksum: 0x6D2B5FD4
	Offset: 0x280
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	level.var_5df76d0 = sr_perk_machine_choice::register();
	level clientfield::register("scriptmover", "perk_machine_rob", 1, 1, "int");
	namespace_52c8f34d::function_70a657d8();
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_82b4c2d1
	Checksum: 0xE62983FB
	Offset: 0x2F0
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function function_8ac3bea9()
{
	var_f5ae494f = struct::get_array(#"hash_313be7fccc870cdd", "variantname");
	if(zm_utility::is_classic() || zm_utility::function_c4b020f8() && isdefined(var_f5ae494f) && var_f5ae494f.size > 0)
	{
		level thread function_8605eb86(var_f5ae494f[0]);
	}
}

/*
	Name: finalize
	Namespace: namespace_82b4c2d1
	Checksum: 0x80F724D1
	Offset: 0x398
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function finalize()
{
}

/*
	Name: function_1532e0b6
	Namespace: namespace_82b4c2d1
	Checksum: 0x3A793549
	Offset: 0x3A8
	Size: 0x2F0
	Parameters: 0
	Flags: None
*/
function function_1532e0b6()
{
	foreach(location in level.var_7d45d0d4.locations)
	{
		function_999594fe(location.var_fe2612fe[#"hash_158cc8ce18ad2dbc"], #"hash_5c11dcd882aa848a", #"p7_zm_vending_jugg", #"hash_47d7a8105237c88", function_cce40d6d(#"hash_47d7a8105237c88"));
		function_999594fe(location.var_fe2612fe[#"hash_7ee78beca217d7fe"], #"hash_249eb4d334db41f4", #"p7_zm_vending_revive", #"hash_7f98b3dd3cce95aa", function_cce40d6d(#"hash_7f98b3dd3cce95aa"));
		function_999594fe(location.var_fe2612fe[#"hash_560082c9da5ef68e"], #"hash_5a2711fd4875c104", #"p7_zm_vending_sleight", #"hash_5930cf0eb070e35a", function_cce40d6d(#"hash_5930cf0eb070e35a"));
		function_999594fe(location.var_fe2612fe[#"hash_6e55d13f9423215a"], #"hash_56e1ed93d9ce235c", #"p7_zm_vending_doubletap2", #"hash_4110e6372aa77f7e", function_cce40d6d(#"hash_4110e6372aa77f7e"));
		if(zm_utility::is_survival())
		{
			model = #"hash_6e47d6576612543c";
		}
		else
		{
			model = #"p9_fxanim_zm_gp_wunderfizz_on_xmodel";
		}
		function_999594fe(location.var_fe2612fe[#"hash_6217ef2a3d7d895b"], #"hash_4af85251966549b8", model, #"hash_3eac5ec7a888ddfb", 0);
	}
}

/*
	Name: function_999594fe
	Namespace: namespace_82b4c2d1
	Checksum: 0xC8F5D4EB
	Offset: 0x6A0
	Size: 0xE0
	Parameters: 5
	Flags: Linked
*/
function function_999594fe(var_beee4994, hint_string, model, var_c024c2e0, cost)
{
	if(!isdefined(var_beee4994))
	{
		return;
	}
	foreach(var_7d0e37f8 in var_beee4994)
	{
		if(isdefined(var_7d0e37f8.content_key))
		{
			spawn_perk_machine(var_7d0e37f8, var_7d0e37f8.content_key, model, hint_string, var_c024c2e0, cost, &function_472f16d8);
		}
	}
}

/*
	Name: spawn_perk_machine
	Namespace: namespace_82b4c2d1
	Checksum: 0x752C4D1
	Offset: 0x788
	Size: 0x39C
	Parameters: 7
	Flags: Linked
*/
function spawn_perk_machine(struct, var_a0f07ebc, modelname, hint_string, var_c024c2e0, cost, callbackfunction)
{
	/#
		assert(isstruct(struct), "");
	#/
	/#
		assert(isfunctionptr(callbackfunction), "");
	#/
	/#
		assert(isdefined(modelname), "");
	#/
	/#
		assert(isdefined(hint_string), "");
	#/
	/#
		assert(isdefined(var_c024c2e0), "");
	#/
	/#
		assert(isdefined(cost), "");
	#/
	if(zm_utility::is_survival())
	{
		var_c6d25878 = &zm_utility::function_f5a222a8;
	}
	else
	{
		var_c6d25878 = &zm_utility::function_4a4cf79a;
	}
	scriptmodel = namespace_8b6a9d79::spawn_script_model(struct, modelname, 1);
	if(struct.parent.content_script_name !== #"safehouse")
	{
		objid = [[var_c6d25878]](#"hash_7d2b8cd6f37639c9", scriptmodel);
		struct.objectiveid = objid;
		scriptmodel.objectiveid = objid;
	}
	forward = anglestoforward(scriptmodel.angles);
	forward = vectornormalize(forward);
	offset = forward * 24;
	offset = (offset[0], offset[1], offset[2] + 50);
	trigger = namespace_8b6a9d79::function_214737c7(struct, callbackfunction, hint_string, undefined, 64, 128, undefined, offset);
	trigger.scriptmodel = scriptmodel;
	trigger.var_a0f07ebc = var_a0f07ebc;
	trigger.var_c024c2e0 = var_c024c2e0;
	trigger.var_87abc3a0 = cost;
	scriptmodel.trigger = trigger;
	if(zm_utility::is_survival())
	{
		level thread zm_utility::clear_vehicles(scriptmodel);
	}
	zm_utility::function_ca960904(scriptmodel);
	level thread function_96a51643(scriptmodel);
	if(modelname == #"p9_fxanim_zm_gp_wunderfizz_on_xmodel" || modelname == #"hash_6e47d6576612543c")
	{
		struct thread function_dc1b3863(scriptmodel);
		scriptmodel thread namespace_791d0451::function_c5fb4741(1);
	}
	else
	{
		struct function_8d0d8a65();
	}
}

/*
	Name: function_96a51643
	Namespace: namespace_82b4c2d1
	Checksum: 0xA399C99C
	Offset: 0xB30
	Size: 0xC4
	Parameters: 1
	Flags: Linked
*/
function function_96a51643(mdl_machine)
{
	v_loc = (mdl_machine.origin + vectorscale((0, 0, 1), 16)) + (anglestoforward(mdl_machine.angles) * 32);
	trigger = spawn("trigger_radius", v_loc, 0, 32, 64, 1);
	trigger zm_perks::check_for_change();
	if(isdefined(trigger))
	{
		trigger deletedelay();
	}
}

/*
	Name: function_8d0d8a65
	Namespace: namespace_82b4c2d1
	Checksum: 0xFB4165FE
	Offset: 0xC00
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function function_8d0d8a65()
{
	playfx("sr/fx9_safehouse_mchn_wonderfizz_spawn", self.origin);
	playsoundatposition(#"hash_20c4f0485930af2a", self.origin);
	wait(1);
}

/*
	Name: function_dc1b3863
	Namespace: namespace_82b4c2d1
	Checksum: 0x186717AF
	Offset: 0xC60
	Size: 0xBC
	Parameters: 1
	Flags: Linked
*/
function function_dc1b3863(scriptmodel)
{
	scriptmodel clientfield::set("perk_machine_rob", 1);
	scriptmodel clientfield::set("item_machine_spawn_rob", 1);
	playfx("sr/fx9_safehouse_mchn_wonderfizz_spawn", self.origin);
	wait(1);
	playfxontag("zombie/fx9_wonder_fizz_idle", scriptmodel, "body_jnt");
	scriptmodel playloopsound(#"zmb_rand_perk_sparks");
}

/*
	Name: perk_random_loop_anim
	Namespace: namespace_82b4c2d1
	Checksum: 0x1A180AA4
	Offset: 0xD28
	Size: 0x1C
	Parameters: 3
	Flags: None
*/
function perk_random_loop_anim(n_piece, s_anim_1, s_anim_2)
{
}

/*
	Name: function_472f16d8
	Namespace: namespace_82b4c2d1
	Checksum: 0x3DEE4DEC
	Offset: 0xD50
	Size: 0x2BC
	Parameters: 1
	Flags: Linked
*/
function function_472f16d8(eventstruct)
{
	player = eventstruct.activator;
	machine = self.scriptmodel;
	var_da8463d0 = self.var_a0f07ebc;
	var_c024c2e0 = self.var_c024c2e0;
	var_87abc3a0 = self.var_87abc3a0;
	/#
		assert(isdefined(machine), "");
	#/
	/#
		assert(isdefined(var_da8463d0), "");
	#/
	/#
		assert(isdefined(var_c024c2e0), "");
	#/
	/#
		assert(isdefined(var_87abc3a0), "");
	#/
	if(isplayer(player))
	{
		if(var_c024c2e0 == #"hash_3eac5ec7a888ddfb")
		{
			if(!level.var_5df76d0 sr_perk_machine_choice::is_open(player) && !player clientfield::get_player_uimodel("hudItems.srOverlayOpen"))
			{
				player notify(#"hash_5f178db4550eeae9");
				level.var_5df76d0 sr_perk_machine_choice::open(player, 0);
				player thread function_4513f006(machine, self);
				player namespace_553954de::function_14bada94();
			}
		}
		else
		{
			var_11868f5d = player namespace_791d0451::function_b852953c(var_c024c2e0);
			has_enough = player zm_score::can_player_purchase(var_87abc3a0);
			if(has_enough && !player namespace_791d0451::function_56cedda7(var_11868f5d))
			{
				player playsoundtoplayer(#"hash_70f9bc3fce59c959", player);
				player zm_score::minus_to_player_score(var_87abc3a0);
				player namespace_791d0451::function_3fecad82(var_11868f5d);
			}
			else
			{
				machine playsoundtoplayer(#"uin_default_action_denied", player);
			}
		}
	}
}

/*
	Name: function_6c71e778
	Namespace: namespace_82b4c2d1
	Checksum: 0x343EA25E
	Offset: 0x1018
	Size: 0x156
	Parameters: 2
	Flags: Linked
*/
function function_6c71e778(machine, trigger)
{
	if(!isplayer(self) || !isdefined(level.var_5df76d0))
	{
		return;
	}
	if(isdefined(machine) && isdefined(trigger))
	{
		trigger sethintstringforplayer(self, #"hash_4af85251966549b8");
		if(isdefined(machine.objectiveid))
		{
			objective_setvisibletoplayer(machine.objectiveid, self);
			zm_utility::function_e8f4d47b(self, machine.objectiveid, 0);
		}
	}
	if(level.var_5df76d0 sr_perk_machine_choice::is_open(self) && self clientfield::get_player_uimodel("hudItems.srOverlayOpen"))
	{
		level.var_5df76d0 sr_perk_machine_choice::close(self);
		self namespace_553954de::function_548f282();
	}
	self notify(#"hash_2a909cd1a72f625b");
}

/*
	Name: function_cce40d6d
	Namespace: namespace_82b4c2d1
	Checksum: 0x2C71F51E
	Offset: 0x1178
	Size: 0x6A
	Parameters: 1
	Flags: Linked
*/
function function_cce40d6d(var_ecde8ba)
{
	item_index = getitemindexfromref(var_ecde8ba);
	var_438da649 = function_b143666d(item_index, 5);
	return function_2c5b6acc(var_438da649);
}

/*
	Name: function_2c5b6acc
	Namespace: namespace_82b4c2d1
	Checksum: 0x7CA7149
	Offset: 0x11F0
	Size: 0x16
	Parameters: 1
	Flags: Linked
*/
function function_2c5b6acc(var_438da649)
{
	return var_438da649.var_b5ec8024;
}

/*
	Name: function_5d21ed88
	Namespace: namespace_82b4c2d1
	Checksum: 0x6434E31E
	Offset: 0x1210
	Size: 0x1AE
	Parameters: 1
	Flags: Linked
*/
function function_5d21ed88(var_82e23366)
{
	if(!isdefined(var_82e23366.namehash))
	{
		return;
	}
	var_8c590502 = (isdefined(getgametypesetting(#"hash_3c2c78e639bfd3c6")) ? getgametypesetting(#"hash_3c2c78e639bfd3c6") : 0);
	if(var_8c590502 > 0)
	{
		var_8aa9ab80 = var_82e23366.namehash;
		var_75da77d3 = 0;
		foreach(var_24303d72 in level.var_c723ac75)
		{
			foreach(var_afe18f6f in var_24303d72)
			{
				if(var_afe18f6f == var_8aa9ab80)
				{
					return namespace_791d0451::function_1b16bd84(var_24303d72[0], var_8c590502);
				}
			}
		}
	}
	return var_82e23366.namehash;
}

/*
	Name: function_3fec008f
	Namespace: namespace_82b4c2d1
	Checksum: 0xC2400BDB
	Offset: 0x13C8
	Size: 0x17C
	Parameters: 2
	Flags: Linked
*/
function function_3fec008f(machine, trigger)
{
	self endon(#"disconnect", #"death", #"hash_2a909cd1a72f625b");
	var_f9c2bece = distance2d(machine.origin, self.origin);
	start_origin = self.origin;
	while(distance2d(machine.origin, self.origin) <= var_f9c2bece || distance2d(self.origin, start_origin) < 32 && !self laststand::player_is_in_laststand() && !self isinvehicle())
	{
		waitframe(1);
		if(!isdefined(machine))
		{
			break;
		}
	}
	if(level.var_5df76d0 sr_perk_machine_choice::is_open(self) && self clientfield::get_player_uimodel("hudItems.srOverlayOpen"))
	{
		self function_6c71e778(machine, trigger);
	}
}

/*
	Name: function_4513f006
	Namespace: namespace_82b4c2d1
	Checksum: 0xE444413E
	Offset: 0x1550
	Size: 0x3E6
	Parameters: 2
	Flags: Linked
*/
function function_4513f006(machine, trigger)
{
	self endon(#"hash_5f178db4550eeae9");
	trigger sethintstringforplayer(self, "");
	if(isdefined(machine.objectiveid))
	{
		zm_utility::function_e8f4d47b(self, machine.objectiveid, 1);
		objective_setinvisibletoplayer(machine.objectiveid, self);
	}
	self endoncallback(&function_6c71e778, #"death");
	self thread function_3fec008f(machine, trigger);
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"menuresponse");
		menu = waitresult.menu;
		response = waitresult.response;
		intpayload = waitresult.intpayload;
		if(menu == #"sr_perk_machine_choice")
		{
			switch(waitresult.response)
			{
				case "hash_5c8984efe0e105db":
				{
					var_82e23366 = getunlockableiteminfofromindex(intpayload, 5);
					var_438da649 = function_b143666d(intpayload, 5);
					talent = function_5d21ed88(var_82e23366);
					if(!isdefined(talent))
					{
						self notify(#"hash_2a909cd1a72f625b");
						self function_6c71e778(machine, trigger);
						return;
					}
					var_87abc3a0 = self namespace_791d0451::function_4c5d2b62();
					if(!isdefined(var_87abc3a0))
					{
						var_87abc3a0 = 0;
					}
					has_enough = self zm_score::can_player_purchase(var_87abc3a0);
					if(isdefined(talent) && has_enough && !self namespace_791d0451::function_56cedda7(talent))
					{
						if(namespace_791d0451::function_cc0055e9(talent))
						{
							self playrumbleonentity(#"zm_interact_rumble");
							self zm_score::minus_to_player_score(var_87abc3a0);
							self namespace_791d0451::function_3fecad82(talent);
							machine thread namespace_791d0451::function_3e9d8a8e(talent);
							machine thread scene::play(#"hash_4f912670058aa620", machine);
						}
						else
						{
							machine playsoundtoplayer(#"hash_5334aa3b6d25f949", self);
						}
					}
					else
					{
						machine playsoundtoplayer(#"hash_5334aa3b6d25f949", self);
					}
					break;
				}
				case "hash_383c519d3bdac984":
				{
					self notify(#"hash_2a909cd1a72f625b");
					self function_6c71e778(machine, trigger);
					return;
				}
			}
		}
	}
}

/*
	Name: function_8605eb86
	Namespace: namespace_82b4c2d1
	Checksum: 0xE8A3B97D
	Offset: 0x1940
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_8605eb86(destination)
{
	level flag::wait_till("start_zombie_round_logic");
	waittillframeend();
	function_d9cdb025(destination);
}

/*
	Name: function_d9cdb025
	Namespace: namespace_82b4c2d1
	Checksum: 0xA0AC01E6
	Offset: 0x1990
	Size: 0x1CC
	Parameters: 1
	Flags: Linked
*/
function function_d9cdb025(destination)
{
	foreach(location in destination.locations)
	{
		var_4064e964 = location.instances[#"hash_6217ef2a3d7d895b"];
		if(isdefined(var_4064e964))
		{
			if(zm_utility::is_survival())
			{
				model = #"hash_6e47d6576612543c";
			}
			else
			{
				model = #"p9_fxanim_zm_gp_wunderfizz_on_xmodel";
			}
			children = namespace_8b6a9d79::function_f703a5a(var_4064e964);
			foreach(child in children)
			{
				spawn_perk_machine(child, #"hash_6217ef2a3d7d895b", model, #"hash_4af85251966549b8", #"hash_3eac5ec7a888ddfb", 0, &function_472f16d8);
			}
		}
	}
}

