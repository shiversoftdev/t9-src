#using script_14f4a3c583c77d4b;
#using script_1c65dbfc2f1c8d8f;
#using script_1caf36ff04a85ff6;
#using script_36f4be19da8eb6d0;
#using script_68d2ee1489345a1d;
#using script_7fc996fe8678852;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\fx_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\zm_common\gametypes\globallogic.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_weapons.gsc;

#namespace namespace_5b3a52eb;

/*
	Name: function_ab987e77
	Namespace: namespace_5b3a52eb
	Checksum: 0x76DD34BC
	Offset: 0x2C0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ab987e77()
{
	level notify(1710393176);
}

/*
	Name: function_89f2df9
	Namespace: namespace_5b3a52eb
	Checksum: 0x407EC1BA
	Offset: 0x2E0
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_244949c60a0b2941", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_5b3a52eb
	Checksum: 0xF24AA0FB
	Offset: 0x338
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	namespace_8b6a9d79::function_b3464a7c("die_container", &function_3b0cb5a4);
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_5b3a52eb
	Checksum: 0x80F724D1
	Offset: 0x370
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_8ac3bea9()
{
}

/*
	Name: function_858d9401
	Namespace: namespace_5b3a52eb
	Checksum: 0xE3C65F6
	Offset: 0x380
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function function_858d9401(destination)
{
	level flag::wait_till("start_zombie_round_logic");
	waittillframeend();
	function_f5ccdd88(destination);
}

/*
	Name: function_f5ccdd88
	Namespace: namespace_5b3a52eb
	Checksum: 0x7B65F2FE
	Offset: 0x3D0
	Size: 0x2A4
	Parameters: 1
	Flags: Linked
*/
function function_f5ccdd88(destination)
{
	foreach(location in destination.locations)
	{
		var_602cb577 = location.instances[#"hash_5f54da4c86489779"];
		if(isdefined(var_602cb577))
		{
			namespace_8b6a9d79::function_20d7e9c7(var_602cb577);
			var_99d1b219 = 1;
		}
	}
	if(is_true(var_99d1b219))
	{
		scene::add_scene_func(#"hash_687f8b39643bcd0d", &function_217a625a, "open");
		scene::add_scene_func(#"hash_1ad915d17cdbbfd4", &function_217a625a, "open");
		scene::add_scene_func(#"hash_291cb9c9bbca6a36", &function_217a625a, "open");
		scene::add_scene_func(#"hash_52fd2682092127fc", &function_217a625a, "open");
	}
	/#
		if(isarray(level.var_f015cfb9))
		{
			foreach(i, var_64c371d1 in level.var_f015cfb9)
			{
				util::function_345e5b9a(("" + i) + "");
			}
			zm_devgui::add_custom_devgui_callback(&function_21aca219);
		}
	#/
}

/*
	Name: function_21aca219
	Namespace: namespace_5b3a52eb
	Checksum: 0x1247CEC4
	Offset: 0x680
	Size: 0xC2
	Parameters: 1
	Flags: None
*/
function function_21aca219(cmd)
{
	/#
		switch(cmd)
		{
			case "hash_d1b4f368cc37b7b":
			{
				function_546a7089(0);
				break;
			}
			case "hash_d1b4e368cc379c8":
			{
				function_546a7089(1);
				break;
			}
			case "hash_d1b51368cc37ee1":
			{
				function_546a7089(2);
				break;
			}
			case "hash_d1b50368cc37d2e":
			{
				function_546a7089(3);
				break;
			}
		}
	#/
}

/*
	Name: function_546a7089
	Namespace: namespace_5b3a52eb
	Checksum: 0x44E5D532
	Offset: 0x750
	Size: 0xC8
	Parameters: 1
	Flags: None
*/
function function_546a7089(index)
{
	/#
		if(isdefined(level.var_f015cfb9[index]))
		{
			foreach(player in getplayers())
			{
				player setorigin(level.var_f015cfb9[index].origin);
			}
		}
	#/
}

/*
	Name: function_3b0cb5a4
	Namespace: namespace_5b3a52eb
	Checksum: 0x5D2E1300
	Offset: 0x820
	Size: 0x5F8
	Parameters: 1
	Flags: Linked
*/
function function_3b0cb5a4(struct)
{
	/#
		assert(isstruct(struct), "");
	#/
	spawn_points = struct.var_fe2612fe[#"hash_2535c42129449bb9"];
	foreach(point in spawn_points)
	{
		var_e57cfd4a = point.script_noteworthy;
		if(isdefined(var_e57cfd4a))
		{
			switch(var_e57cfd4a)
			{
				case "cryo":
				{
					str_hint = #"hash_23ffe27517c6140c";
					var_f8fadaec = #"p9_fxanim_zm_contain_crate_cryo_mod";
					break;
				}
				case "electric":
				{
					str_hint = #"hash_448d0fa028c30675";
					var_f8fadaec = #"p9_fxanim_zm_contain_crate_electric_mod";
					break;
				}
				case "gas":
				{
					str_hint = #"hash_1f88bf6da4e314";
					var_f8fadaec = #"p9_fxanim_zm_contain_crate_gas_mod";
					break;
				}
				case "plasma":
				{
					str_hint = #"hash_3122d671887ef5a5";
					var_f8fadaec = #"p9_fxanim_zm_contain_crate_rust_mod";
					break;
				}
			}
		}
		else
		{
			/#
				assert(0, "");
			#/
		}
		if(getdvarint(#"hash_7dae47192308f053", 1))
		{
			var_f8fadaec = #"p9_fxanim_zm_contain_crate_rust_mod";
		}
		spawn_struct = point;
		scriptmodel = namespace_8b6a9d79::spawn_script_model(spawn_struct, var_f8fadaec, 1);
		scriptmodel.var_e57cfd4a = var_e57cfd4a;
		if(!isdefined(level.var_f015cfb9))
		{
			level.var_f015cfb9 = [];
		}
		else if(!isarray(level.var_f015cfb9))
		{
			level.var_f015cfb9 = array(level.var_f015cfb9);
		}
		if(!isinarray(level.var_f015cfb9, scriptmodel))
		{
			level.var_f015cfb9[level.var_f015cfb9.size] = scriptmodel;
		}
		if(getdvarint(#"hash_7dae47192308f053", 1))
		{
			scriptmodel scene::init(#"hash_687f8b39643bcd0d", scriptmodel);
		}
		else
		{
			switch(var_e57cfd4a)
			{
				case "cryo":
				{
					scriptmodel thread scene::play(#"hash_1ad915d17cdbbfd4", "chain", scriptmodel);
					break;
				}
				case "electric":
				{
					scriptmodel scene::init(#"hash_291cb9c9bbca6a36", scriptmodel);
					break;
				}
				case "gas":
				{
					scriptmodel scene::init(#"hash_52fd2682092127fc", scriptmodel);
					break;
				}
				case "plasma":
				{
					scriptmodel scene::init(#"hash_687f8b39643bcd0d", scriptmodel);
					break;
				}
			}
		}
		forward = anglestoforward(scriptmodel.angles);
		forward = vectornormalize(forward);
		forward = (forward[0] * 8, forward[1] * 8, forward[2] * 8);
		forward = (forward[0], forward[1], forward[2] + 32);
		trigger = namespace_8b6a9d79::function_214737c7(spawn_struct, &function_fb2bc4ac, str_hint, undefined, (isdefined(spawn_struct.radius) ? spawn_struct.radius : 64), (isdefined(spawn_struct.height) ? spawn_struct.height : 64), undefined, forward);
		trigger.scriptmodel = scriptmodel;
		trigger.var_e57cfd4a = var_e57cfd4a;
		trigger thread function_35eeef70(var_e57cfd4a);
		scriptmodel.trigger = trigger;
		struct.trigger = trigger;
		struct.scriptmodel = scriptmodel;
		playsoundatposition(#"hash_20c4f0485930af2a", struct.origin);
	}
}

/*
	Name: function_fb2bc4ac
	Namespace: namespace_5b3a52eb
	Checksum: 0xB875E476
	Offset: 0xE20
	Size: 0x31C
	Parameters: 1
	Flags: Linked
*/
function function_fb2bc4ac(eventstruct)
{
	player = eventstruct.activator;
	model = self.scriptmodel;
	var_e57cfd4a = self.var_e57cfd4a;
	/#
		assert(isdefined(model), "");
	#/
	/#
		assert(isdefined(var_e57cfd4a), "");
	#/
	if(is_true(model.opening))
	{
		return;
	}
	if(isplayer(player))
	{
		currentweapon = player getcurrentweapon();
		var_e109db75 = player namespace_b376ff3f::function_230ceec4(currentweapon);
		if(isdefined(var_e109db75) && function_165e54c9(var_e109db75))
		{
			model.opening = 1;
			switch(var_e57cfd4a)
			{
				case "cryo":
				{
					model thread function_8d9ddc22(player, "NITROGEN");
					break;
				}
				case "electric":
				{
					if(!getdvarint(#"hash_7dae47192308f053", 1))
					{
						playfxontag(#"hash_7e300a1fb308ae67", model, "tag_electric_01_fx");
						playfxontag(#"hash_7e300a1fb308ae67", model, "tag_electric_02_fx");
						playfxontag(#"hash_7e300a1fb308ae67", model, "tag_electric_03_fx");
					}
					model thread function_8d9ddc22(player, "BEAM");
					break;
				}
				case "gas":
				{
					model thread function_8d9ddc22(player, "GAS");
					break;
				}
				case "plasma":
				{
					model thread function_8d9ddc22(player, "PLASMA");
					break;
				}
				default:
				{
					player playsoundtoplayer(#"zmb_no_cha_ching", player);
					break;
				}
			}
		}
		else
		{
			player playsoundtoplayer(#"zmb_no_cha_ching", player);
		}
	}
}

/*
	Name: function_35eeef70
	Namespace: namespace_5b3a52eb
	Checksum: 0x1D76E940
	Offset: 0x1148
	Size: 0x40C
	Parameters: 1
	Flags: Linked
*/
function function_35eeef70(var_e57cfd4a)
{
	self endon(#"death");
	/#
		assert(isdefined(var_e57cfd4a), "");
	#/
	while(true)
	{
		foreach(player in getplayers())
		{
			currentweapon = player getcurrentweapon();
			var_e109db75 = player namespace_b376ff3f::function_230ceec4(currentweapon);
			if(isdefined(var_e109db75) && function_165e54c9(var_e109db75))
			{
				switch(var_e57cfd4a)
				{
					case "cryo":
					{
						if(var_e109db75.var_a6762160.name == #"hash_4c696ce5b8b4e675")
						{
							self sethintstringforplayer(player, #"hash_4425ec8a1a0dcd32");
						}
						else
						{
							self sethintstringforplayer(player, #"hash_23ffe27517c6140c");
						}
						break;
					}
					case "electric":
					{
						if(var_e109db75.var_a6762160.name == #"hash_3d6c85e60e7f64bf")
						{
							self sethintstringforplayer(player, #"hash_4425ec8a1a0dcd32");
						}
						else
						{
							self sethintstringforplayer(player, #"hash_448d0fa028c30675");
						}
						break;
					}
					case "gas":
					{
						if(var_e109db75.var_a6762160.name == #"hash_c20bf6cb2f436fd")
						{
							self sethintstringforplayer(player, #"hash_4425ec8a1a0dcd32");
						}
						else
						{
							self sethintstringforplayer(player, #"hash_1f88bf6da4e314");
						}
						break;
					}
					case "plasma":
					{
						if(var_e109db75.var_a6762160.name == #"hash_f5896e310254300")
						{
							self sethintstringforplayer(player, #"hash_4425ec8a1a0dcd32");
						}
						else
						{
							self sethintstringforplayer(player, #"hash_3122d671887ef5a5");
						}
						break;
					}
					default:
					{
						self sethintstringforplayer(player, #"hash_5ddfb899ebe1fd3f");
						break;
					}
				}
				continue;
			}
			self sethintstringforplayer(player, #"hash_5ddfb899ebe1fd3f");
		}
		wait(1);
	}
}

/*
	Name: function_165e54c9
	Namespace: namespace_5b3a52eb
	Checksum: 0xEB33A6E7
	Offset: 0x1560
	Size: 0x104
	Parameters: 1
	Flags: Linked
*/
function function_165e54c9(item)
{
	if(isdefined(item.var_a6762160.name))
	{
		switch(item.var_a6762160.name)
		{
			case "hash_ad7366e99bb5190":
			case "hash_c20bf6cb2f436fd":
			case "hash_f5896e310254300":
			case "hash_165e9ace72992332":
			case "hash_27815c5c48d7960a":
			case "hash_315d03848e9c8533":
			case "hash_3d6c85e60e7f64bf":
			case "hash_3dff7d94b9ae5c97":
			case "hash_4c696ce5b8b4e675":
			case "hash_6deee6c9f8742324":
			case "hash_7b3b2febd34985f5":
			{
				return true;
				break;
			}
		}
	}
	return false;
}

/*
	Name: function_217a625a
	Namespace: namespace_5b3a52eb
	Checksum: 0x13290D96
	Offset: 0x1670
	Size: 0x67C
	Parameters: 1
	Flags: Linked
*/
function function_217a625a(a_ents)
{
	if(self flag::get("FirstFrame"))
	{
		return;
	}
	var_bf71a40b = a_ents[#"weapon_crate"];
	var_e57cfd4a = a_ents[#"weapon_crate"].var_e57cfd4a;
	if(!isdefined(var_e57cfd4a))
	{
		return;
	}
	switch(var_e57cfd4a)
	{
		case "cryo":
		{
			if(level flag::get("exchange_base_back"))
			{
				var_2faa8624 = util::spawn_model(#"attach_t9_zm_silver_ww_mag_04_world", var_bf71a40b gettagorigin("tag_tank"), var_bf71a40b gettagangles("tag_tank"));
				level flag::clear("exchange_base_back");
			}
			else
			{
				var_2faa8624 = util::spawn_model(#"attach_t9_zm_silver_ww_mag_03_world", var_bf71a40b gettagorigin("tag_tank"), var_bf71a40b gettagangles("tag_tank"));
				var_a100665d = var_bf71a40b fx::play(#"hash_d208acedd2518ae", undefined, undefined, 4, 1, "tag_tank");
			}
			break;
		}
		case "gas":
		{
			if(level flag::get("exchange_base_back"))
			{
				var_2faa8624 = util::spawn_model(#"attach_t9_zm_silver_ww_mag_04_world", var_bf71a40b gettagorigin("tag_tank"), var_bf71a40b gettagangles("tag_tank"));
				level flag::clear("exchange_base_back");
			}
			else
			{
				var_2faa8624 = util::spawn_model(#"attach_t9_zm_silver_ww_mag_05_world", var_bf71a40b gettagorigin("tag_tank"), var_bf71a40b gettagangles("tag_tank"));
				var_a100665d = var_bf71a40b fx::play(#"hash_7a6a8f045e6c6b7e", undefined, undefined, 4, 1, "tag_tank");
			}
			break;
		}
		case "plasma":
		{
			if(level flag::get("exchange_base_back"))
			{
				var_2faa8624 = util::spawn_model(#"attach_t9_zm_silver_ww_mag_04_world", var_bf71a40b gettagorigin("tag_tank"), var_bf71a40b gettagangles("tag_tank"));
				level flag::clear("exchange_base_back");
			}
			else
			{
				var_2faa8624 = util::spawn_model(#"attach_t9_zm_silver_ww_mag_04_world", var_bf71a40b gettagorigin("tag_tank"), var_bf71a40b gettagangles("tag_tank"));
				var_a100665d = var_bf71a40b fx::play(#"hash_1119b81f77cb3c61", undefined, undefined, 4, 1, "tag_tank");
			}
			break;
		}
		case "electric":
		{
			if(level flag::get("exchange_base_back"))
			{
				var_2faa8624 = util::spawn_model(#"attach_t9_zm_silver_ww_mag_04_world", var_bf71a40b gettagorigin("tag_tank"), var_bf71a40b gettagangles("tag_tank"));
				level flag::clear("exchange_base_back");
			}
			else
			{
				var_2faa8624 = util::spawn_model(#"attach_t9_zm_silver_ww_mag_02_world", var_bf71a40b gettagorigin("tag_tank"), var_bf71a40b gettagangles("tag_tank"));
				var_a100665d = var_bf71a40b fx::play(#"hash_6154a93403194405", undefined, undefined, 4, 1, "tag_tank");
			}
			break;
		}
	}
	var_2faa8624 linkto(var_bf71a40b, "tag_tank", (0, 0, 0), vectorscale((-1, 0, 0), 28));
	waitresult = undefined;
	waitresult = level waittill(#"hash_77e3468feebf997e", #"hash_685e9797cabb8ed", #"hash_142e9131e668557d");
	var_2faa8624 unlink();
	if(isdefined(var_2faa8624))
	{
		var_2faa8624 delete();
	}
	if(waitresult._notify !== "silver_weapon_crate_closed")
	{
		level waittill(#"hash_77e3468feebf997e");
	}
	if(isdefined(var_a100665d))
	{
		var_a100665d delete();
	}
}

/*
	Name: function_8d9ddc22
	Namespace: namespace_5b3a52eb
	Checksum: 0x903DF6B0
	Offset: 0x1CF8
	Size: 0xA38
	Parameters: 2
	Flags: Linked
*/
function function_8d9ddc22(player, var_e7772c37)
{
	level endon(#"end_game");
	switch(var_e7772c37)
	{
		case "nitrogen":
		{
			var_6bdde8a3 = getweapon(#"hash_655d944e437c3d5b");
			var_39023436 = getweapon(#"hash_189ef2dafffe1f4c");
			self.var_37023f0e = "cryo";
			break;
		}
		case "gas":
		{
			var_6bdde8a3 = getweapon(#"hash_6e0b27b854e591a3");
			var_39023436 = getweapon(#"hash_941005e056449b4");
			self.var_37023f0e = "gas";
			break;
		}
		case "plasma":
		{
			var_6bdde8a3 = getweapon(#"hash_72796957033e2e4a");
			var_39023436 = getweapon(#"hash_11363c24185fecdb");
			self.var_37023f0e = "rust";
			break;
		}
		case "beam":
		{
			var_6bdde8a3 = getweapon(#"hash_5dd5741f21fd680d");
			var_39023436 = getweapon(#"hash_4ee16eb0581e4646");
			self.var_37023f0e = "electric";
			break;
		}
	}
	player val::set(#"hash_504a7a98d585ba99", "disable_weapon_cycling", 1);
	player val::set(#"hash_504a7a98d585ba99", "disable_weapon_fire", 1);
	player val::set(#"hash_504a7a98d585ba99", "disable_offhand_weapons", 1);
	player val::set(#"hash_504a7a98d585ba99", "disable_offhand_special", 1);
	player thread function_172b3f96(10);
	if(player hasweapon(var_6bdde8a3, 1) || player hasweapon(var_39023436, 1))
	{
		level flag::set("exchange_base_back");
	}
	self open_crate();
	if(isalive(player) && !player inlaststand())
	{
		var_4e4f65c9 = player namespace_b376ff3f::function_2e711614(17 + 1);
		primary_weapon = player namespace_a0d533d1::function_2b83d3ff(var_4e4f65c9);
		var_ec323ef9 = player namespace_b376ff3f::function_2e711614(((17 + 1) + 8) + 1);
		secondary_weapon = player namespace_a0d533d1::function_2b83d3ff(var_ec323ef9);
		var_b8061637 = player namespace_b376ff3f::function_2e711614(((((17 + 1) + 8) + 1) + 8) + 1);
		var_5b871ec1 = player namespace_a0d533d1::function_2b83d3ff(var_b8061637);
		if(namespace_b376a999::function_5fef4201(primary_weapon))
		{
			var_981d2438 = var_4e4f65c9;
			var_d5c2e187 = primary_weapon;
		}
		else
		{
			if(namespace_b376a999::function_5fef4201(secondary_weapon))
			{
				var_981d2438 = var_ec323ef9;
				var_d5c2e187 = secondary_weapon;
			}
			else
			{
				if(namespace_b376a999::function_5fef4201(var_5b871ec1))
				{
					var_981d2438 = var_b8061637;
					var_d5c2e187 = var_5b871ec1;
				}
				else
				{
					player notify(#"hash_6a9e5d5a03df7e27");
					self function_72ffec4f();
					level notify(#"hash_142e9131e668557d");
					return;
				}
			}
		}
		var_1edbaf3 = player namespace_b376a999::function_7d5e7c71(var_d5c2e187);
		if(var_1edbaf3)
		{
			target_weapon = var_39023436;
		}
		else
		{
			target_weapon = var_6bdde8a3;
		}
		var_b0e35c50 = 0;
		if(zm_weapons::function_386dacbc(var_d5c2e187) != target_weapon)
		{
			var_963f7bc9 = target_weapon;
		}
		else
		{
			var_b0e35c50 = 1;
			var_963f7bc9 = (var_1edbaf3 ? getweapon(#"hash_294926d598e011fa") : getweapon(#"hash_3fa91d1674123e09"));
		}
		var_963f7bc9 = function_eeddea9a(var_963f7bc9, function_9f1cc9a9(var_d5c2e187));
		if(player getcurrentweapon() != var_d5c2e187)
		{
			player switchtoweapon(var_d5c2e187);
			if(player getstance() === "prone")
			{
				player notify(#"hash_6a9e5d5a03df7e27");
				self function_72ffec4f();
				level notify(#"hash_142e9131e668557d");
				return;
			}
			result = undefined;
			result = player waittilltimeout(5, #"death", #"weapon_change_complete", #"entering_last_stand");
			if(result._notify == #"timeout" || player getcurrentweapon() != var_d5c2e187)
			{
				player notify(#"hash_6a9e5d5a03df7e27");
				self function_72ffec4f();
				level notify(#"hash_142e9131e668557d");
				return;
			}
		}
		if(isalive(player) && !player inlaststand())
		{
			if(!isdefined(player.var_1ad4cede))
			{
				player.var_1ad4cede = [];
			}
			var_e533256d = player.var_1ad4cede[var_963f7bc9.name];
			player giveweapon(var_963f7bc9);
			var_eba43593 = player function_b7f1fd2c(var_963f7bc9);
			player setweaponammoclip(var_963f7bc9, (isdefined(var_e533256d) ? var_e533256d : var_eba43593));
			player function_bee29f7b(1);
			player switchtoweapon(var_963f7bc9);
			player function_6edc650b(var_963f7bc9);
			weaponoptions = player function_ade49959(var_d5c2e187);
			camoindex = getcamoindex(weaponoptions);
			player function_bd3cce02(var_963f7bc9, camoindex);
			player.var_1ad4cede[var_d5c2e187.name] = player getammocount(var_d5c2e187);
			player thread function_6d4e1f71(var_d5c2e187, var_e7772c37, var_b0e35c50);
			player thread function_469b0e5();
			var_981d2438.var_627c698b = var_963f7bc9;
			var_3383cd4e = function_4ba8fde(var_963f7bc9.name + "_item_sr");
			if(isdefined(var_3383cd4e))
			{
				var_981d2438.var_a6762160 = var_3383cd4e.var_a6762160;
				var_981d2438.id = var_3383cd4e.id;
			}
			else
			{
				/#
					assertmsg("" + var_963f7bc9.name);
				#/
				/#
				#/
			}
		}
		level notify(#"hash_685e9797cabb8ed");
		self function_72ffec4f();
		level notify(#"hash_77e3468feebf997e");
	}
}

/*
	Name: open_crate
	Namespace: namespace_5b3a52eb
	Checksum: 0x78E55E4D
	Offset: 0x2738
	Size: 0x9C
	Parameters: 0
	Flags: Linked, Private
*/
function private open_crate()
{
	if(getdvarint(#"hash_7dae47192308f053", 1))
	{
		self scene::play(#"hash_687f8b39643bcd0d", "open", self);
	}
	else
	{
		self scene::play((#"hash_340eb7e983e34e72" + self.var_37023f0e) + "_bundle", "open", self);
	}
}

/*
	Name: function_72ffec4f
	Namespace: namespace_5b3a52eb
	Checksum: 0xC3AC72CD
	Offset: 0x27E0
	Size: 0xA6
	Parameters: 0
	Flags: Linked, Private
*/
function private function_72ffec4f()
{
	if(getdvarint(#"hash_7dae47192308f053", 1))
	{
		self scene::play(#"hash_687f8b39643bcd0d", "close", self);
	}
	else
	{
		self scene::play((#"hash_340eb7e983e34e72" + self.var_37023f0e) + "_bundle", "close", self);
	}
	self.opening = undefined;
}

/*
	Name: function_172b3f96
	Namespace: namespace_5b3a52eb
	Checksum: 0xBDD36873
	Offset: 0x2890
	Size: 0x104
	Parameters: 1
	Flags: Linked
*/
function function_172b3f96(timeout)
{
	level endon(#"end_game");
	self waittilltimeout(timeout, #"hash_6a9e5d5a03df7e27", #"death", #"entering_last_stand");
	if(isdefined(self))
	{
		self val::reset(#"hash_504a7a98d585ba99", "disable_weapon_cycling");
		self val::reset(#"hash_504a7a98d585ba99", "disable_weapon_fire");
		self val::reset(#"hash_504a7a98d585ba99", "disable_offhand_weapons");
		self val::reset(#"hash_504a7a98d585ba99", "disable_offhand_special");
	}
}

/*
	Name: function_469b0e5
	Namespace: namespace_5b3a52eb
	Checksum: 0x6E0BE1C
	Offset: 0x29A0
	Size: 0x6E
	Parameters: 0
	Flags: Linked
*/
function function_469b0e5()
{
	level endon(#"end_game");
	self endon(#"death");
	wait(1);
	while(!self function_a39f313c())
	{
		waitframe(1);
	}
	self notify(#"hash_6a9e5d5a03df7e27");
}

/*
	Name: function_6d4e1f71
	Namespace: namespace_5b3a52eb
	Checksum: 0x589AD39D
	Offset: 0x2A18
	Size: 0x12A
	Parameters: 3
	Flags: Linked
*/
function function_6d4e1f71(var_d5c2e187, var_e7772c37, var_b0e35c50)
{
	level endon(#"end_game");
	if(isdefined(self))
	{
		wait(1);
		while(isdefined(self) && self isdroppingweapon())
		{
			waitframe(1);
		}
		if(!isdefined(self))
		{
			return;
		}
		self takeweapon(var_d5c2e187);
		if(var_b0e35c50)
		{
			switch(var_e7772c37)
			{
				case "nitrogen":
				{
					level.var_c3accf46 = undefined;
					break;
				}
				case "gas":
				{
					level.var_ae002b60 = undefined;
					break;
				}
				case "plasma":
				{
					level.var_42000fd0 = undefined;
					break;
				}
				case "beam":
				{
					level.var_c8a2dc28 = undefined;
					break;
				}
			}
		}
	}
}

