#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using script_4ce5d94e8c797350;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_magicbox.gsc;
#using script_4ccfb58a9443a60b;
#using script_18077945bb84ede7;
#using script_471b31bd963b388e;
#using script_4108035fe400ce67;
#using script_340a2e805e35f7a2;
#using scripts\core_common\item_inventory.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using script_7bacb32f8222fa3e;
#using scripts\core_common\hud_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\aat_shared.gsc;

#namespace namespace_f999c142;

/*
	Name: function_2d799d38
	Namespace: namespace_f999c142
	Checksum: 0x424D644F
	Offset: 0x238
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2d799d38()
{
	level notify(-1857735153);
}

/*
	Name: init
	Namespace: namespace_f999c142
	Checksum: 0x991C614B
	Offset: 0x258
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	if(zm_utility::is_standard())
	{
		return;
	}
	function_a8243f37();
	level.var_6463d67c = 100;
}

/*
	Name: function_ab6fd86c
	Namespace: namespace_f999c142
	Checksum: 0x1F0A53B
	Offset: 0x2A0
	Size: 0xAE
	Parameters: 2
	Flags: Linked
*/
function function_ab6fd86c(e_player, reward_terminal)
{
	e_player.var_25a17236 = reward_terminal zm_unitrigger::create(&function_bfa2ba47, vectorscale((1, 1, 1), 80), &function_fc7d3519);
	zm_unitrigger::unitrigger_force_per_player_triggers(e_player.var_25a17236);
	e_player.var_25a17236.player = e_player;
	e_player.var_25a17236.origin = e_player.var_25a17236.origin + vectorscale((0, 0, 1), 30);
}

/*
	Name: function_bfa2ba47
	Namespace: namespace_f999c142
	Checksum: 0x25455B2E
	Offset: 0x358
	Size: 0x1C0
	Parameters: 1
	Flags: Linked
*/
function function_bfa2ba47(e_player)
{
	if(e_player != self.stub.player)
	{
		self sethintstringforplayer(e_player, #"");
		return false;
	}
	if(level.var_2dffd020 == 0)
	{
		self sethintstringforplayer(e_player, #"");
		return false;
	}
	if(e_player.var_9e09931e != 0)
	{
		str_prompt = e_player zm_utility::function_d6046228(#"hash_603d187dac2f57c", #"hash_7cc2cf9d21806bf0");
		self sethintstringforplayer(e_player, str_prompt);
		return true;
	}
	if(is_true(e_player.var_43300e))
	{
		self sethintstringforplayer(e_player, #"hash_603d187dac2f57c");
		return true;
	}
	if(e_player.var_9e09931e == 0)
	{
		self sethintstringforplayer(e_player, #"hash_194fb852eef34414");
		return true;
	}
	self sethintstringforplayer(e_player, #"hash_194fb852eef34414");
	return true;
}

/*
	Name: function_fc7d3519
	Namespace: namespace_f999c142
	Checksum: 0x63C04B7F
	Offset: 0x528
	Size: 0x19C
	Parameters: 0
	Flags: Linked
*/
function function_fc7d3519()
{
	self endon(#"end_game");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"trigger");
		e_player = waitresult.activator;
		if(!zm_utility::can_use(e_player))
		{
			continue;
		}
		/#
			iprintlnbold("");
		#/
		if(e_player.var_9e09931e != 0)
		{
			e_player function_bc82f900(#"zm_interact_rumble");
			playsoundatposition(#"hash_25abbe787394e73e", self.origin);
			e_player function_123bcbcf();
			e_player function_53a333a8();
		}
		else if(is_true(e_player.var_4373c66b))
		{
			e_player function_bc82f900(#"zm_interact_rumble");
			playsoundatposition(#"hash_5e201856c21548ae", self.origin);
			e_player.var_4373c66b = undefined;
			e_player notify(#"hash_3cd13a6cb08bba96");
		}
	}
}

/*
	Name: function_123bcbcf
	Namespace: namespace_f999c142
	Checksum: 0x97535469
	Offset: 0x6D0
	Size: 0xCC4
	Parameters: 0
	Flags: Linked
*/
function function_123bcbcf()
{
	b_reward = 1;
	switch(self.var_9e09931e)
	{
		case 0:
		{
			b_reward = 0;
			break;
		}
		case 1:
		{
			if(!isdefined(self.var_3703202a))
			{
				self.var_3703202a = 0;
			}
			a_str_rewards = array(#"carpenter", #"double_points", #"extra_life", #"weapon", #"equipment", #"scrap", #"essence");
			a_players = getplayers();
			if(a_players.size > 1 || is_true(self.var_82464dfe) || self.var_3703202a >= 1 || self zm_laststand::function_618fd37e() >= 1)
			{
				arrayremovevalue(a_str_rewards, #"extra_life");
			}
			var_7fddb744 = getweapon(#"knife_loadout");
			if(self hasweapon(var_7fddb744))
			{
				arrayremovevalue(a_str_rewards, #"knife_loadout");
			}
			str_reward = function_56c888ce(a_str_rewards);
			switch(str_reward)
			{
				case "double_points":
				{
					self thread function_d36fb590("double_points", 3, 1);
					break;
				}
				case "carpenter":
				{
					self thread function_d36fb590("carpenter", 3, 1);
					break;
				}
				case "extra_life":
				{
					self thread function_d36fb590("self_revive", 3, 1);
					self.var_82464dfe = 1;
					self.var_3703202a++;
					break;
				}
				case "weapon":
				{
					self thread function_11be5095(1, 3);
					break;
				}
				case "equipment":
				{
					self thread function_d7d8834f(1, 3);
					break;
				}
				case "knife_loadout":
				{
					self thread function_11be5095(1, 3, 0, #"knife_loadout");
					break;
				}
				case "scrap":
				{
					self thread function_c2e444e6(str_reward, 500, undefined, 0);
					break;
				}
				case "essence":
				{
					self thread function_c2e444e6(str_reward, 1000, undefined, 2);
					break;
				}
			}
			self thread function_5b933926(1);
			break;
		}
		case 2:
		{
			a_str_rewards = array(#"weapon", #"full_ammo", #"fire_sale", #"scrap", #"essence", #"equipment");
			if(zm_utility::is_survival())
			{
				self zm_stats::increment_challenge_stat(#"hash_3e8fc17206dbe863");
				arrayremovevalue(a_str_rewards, #"fire_sale");
			}
			str_reward = function_56c888ce(a_str_rewards);
			switch(str_reward)
			{
				case "full_ammo":
				{
					self thread function_d36fb590("full_ammo", 5, 1);
					break;
				}
				case "fire_sale":
				{
					self thread function_d36fb590("fire_sale", 5, 1);
					break;
				}
				case "weapon":
				{
					self thread function_11be5095(2, 5, 0, undefined);
					break;
				}
				case "equipment":
				{
					self thread function_d7d8834f(2, 5);
					break;
				}
				case "scrap":
				{
					self thread function_c2e444e6(str_reward, 500, 50, 0);
					break;
				}
				case "essence":
				{
					self thread function_c2e444e6(str_reward, 2000, undefined, 4);
					break;
				}
			}
			self thread function_5b933926(2);
			break;
		}
		case 3:
		{
			a_str_rewards = array(#"weapon", #"equipment", #"aat");
			if(zm_utility::is_survival())
			{
				self zm_stats::increment_challenge_stat(#"hash_3e8fc17206dbe863");
			}
			wpn_current = self getcurrentweapon();
			if(!zm_weapons::is_weapon_upgraded(wpn_current))
			{
				arrayremovevalue(a_str_rewards, #"aat");
			}
			str_reward = function_56c888ce(a_str_rewards);
			switch(str_reward)
			{
				case "aat":
				{
					self thread function_7dc3dfdb(7);
					break;
				}
				case "weapon":
				{
					self thread function_11be5095(3, 7, 0, undefined);
					break;
				}
				case "equipment":
				{
					self thread function_d7d8834f(3, 7);
					break;
				}
			}
			self thread function_5b933926(2);
			break;
		}
		case 4:
		{
			if(!isdefined(self.var_123836f9))
			{
				self.var_123836f9 = 0;
			}
			if(!isdefined(self.var_3703202a))
			{
				self.var_3703202a = 0;
			}
			a_str_rewards = array(#"weapon", #"free_perk", #"extra_life", #"shockwave");
			self zm_stats::increment_challenge_stat(#"hash_3d6a930809a732e6");
			if(zm_utility::is_survival())
			{
				self zm_stats::increment_challenge_stat(#"hash_3e8fc17206dbe863");
			}
			if(self.var_123836f9 >= 2 || self.var_7341f980.size === level.var_b8be892e.size || self.var_67ba1237.size === level.var_b8be892e.size)
			{
				arrayremovevalue(a_str_rewards, #"free_perk");
			}
			a_players = getplayers();
			if(a_players.size > 1 || is_true(self.var_17d719b9) || self.var_3703202a >= 2 || self zm_laststand::function_618fd37e() >= 1)
			{
				arrayremovevalue(a_str_rewards, #"extra_life");
			}
			if(isdefined(level.var_fc439a95))
			{
				var_4e8c90d2 = getweapon(level.var_fc439a95);
			}
			else
			{
				var_4e8c90d2 = getweapon(#"hash_3fa91d1674123e09");
			}
			var_8e1fc3ea = isarray(level.zombie_weapons) && isinarray(getarraykeys(level.zombie_weapons), var_4e8c90d2);
			if(!isdefined(var_4e8c90d2) || var_4e8c90d2 == level.weaponnone || self hasweapon(var_4e8c90d2) || !var_8e1fc3ea)
			{
				arrayremovevalue(a_str_rewards, #"shockwave");
			}
			str_reward = function_56c888ce(a_str_rewards);
			switch(str_reward)
			{
				case "weapon":
				{
					self thread function_11be5095(4, 10, 1, undefined);
					break;
				}
				case "extra_life":
				{
					self thread function_d36fb590("self_revive", 10, 1);
					self.var_17d719b9 = 1;
					self.var_3703202a++;
					break;
				}
				case "shockwave":
				{
					self thread function_11be5095(5, 10, 0, var_4e8c90d2.name);
					break;
				}
				case "free_perk":
				{
					self thread function_8665509b(10);
					self.var_123836f9++;
				}
			}
			self thread function_5b933926(1, 1);
			break;
		}
	}
	if(b_reward)
	{
		self thread function_6c62f074(self.var_9e09931e);
	}
	self set_tribute(0);
	self namespace_f0b43eb5::set_tributeavailable(0);
}

/*
	Name: set_tribute
	Namespace: namespace_f999c142
	Checksum: 0xE2D44442
	Offset: 0x13A0
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function set_tribute(n_amount)
{
	self.n_tribute = n_amount;
	n_index = self getentitynumber();
	level.var_edbe6a7f[n_index] = self.n_tribute;
}

/*
	Name: function_ae2c0ba5
	Namespace: namespace_f999c142
	Checksum: 0xE49EBD4F
	Offset: 0x13F8
	Size: 0x214
	Parameters: 0
	Flags: Linked
*/
function function_ae2c0ba5()
{
	var_1f5eb74c = self.var_9e09931e;
	n_step = level.var_8b7ab859 / 4;
	if(self.n_tribute >= (n_step * 4))
	{
		set_tribute(level.var_8b7ab859);
		self.var_9e09931e = 4;
		self thread namespace_f0b43eb5::set_tributeavailable(4);
	}
	else
	{
		if(self.n_tribute >= (n_step * 3))
		{
			self.var_9e09931e = 3;
			self thread namespace_f0b43eb5::set_tributeavailable(3);
		}
		else
		{
			if(self.n_tribute >= (n_step * 2))
			{
				self.var_9e09931e = 2;
				self thread namespace_f0b43eb5::set_tributeavailable(2);
			}
			else
			{
				if(self.n_tribute >= (n_step * 1))
				{
					self.var_9e09931e = 1;
					self thread namespace_f0b43eb5::set_tributeavailable(1);
				}
				else
				{
					self.var_9e09931e = 0;
					self thread namespace_f0b43eb5::set_tributeavailable(0);
				}
			}
		}
	}
	var_f3ffdc3e = 0;
	if(self.n_tribute > 0)
	{
		var_f3ffdc3e = math::clamp(self.var_9e09931e + 1, 0, 4);
	}
	if(var_1f5eb74c < 4)
	{
		namespace_f0b43eb5::function_34a533b1();
	}
	if(self.var_9e09931e == 4)
	{
		return 1;
	}
	return (self.n_tribute - (n_step * self.var_9e09931e)) / n_step;
}

/*
	Name: function_d36fb590
	Namespace: namespace_f999c142
	Checksum: 0xB15F1AE4
	Offset: 0x1618
	Size: 0x26C
	Parameters: 3
	Flags: Linked
*/
function function_d36fb590(var_aa4f9213, var_6c9485fc, n_fx_type)
{
	if(!isdefined(n_fx_type))
	{
		n_fx_type = 3;
	}
	self endon(#"death");
	if(n_fx_type)
	{
		self thread function_29e6dc49(0, n_fx_type);
	}
	var_8b84b3ce = self.var_642ed51a.var_f693bf0b.origin;
	v_spawn_angles = self.var_642ed51a.var_f693bf0b.angles;
	var_24a867e4 = function_ed4a5d52(var_6c9485fc);
	if(!isdefined(var_24a867e4))
	{
		return;
	}
	if(var_24a867e4 === #"p9_lat_equipment_bag_first_aid_lrg")
	{
		var_8b84b3ce = var_8b84b3ce + (vectorscale((0, 0, -1), 8));
	}
	var_4d0b3b87 = util::spawn_model(var_24a867e4, var_8b84b3ce, v_spawn_angles);
	self.var_642ed51a.var_f693bf0b clientfield::set("" + #"hash_653b5827e6fbe5f9", 1);
	self.var_642ed51a.var_f92a5f81 = var_4d0b3b87;
	var_4d0b3b87 playsound(#"hash_52de50e5184d1c7");
	var_4d0b3b87 playloopsound(#"hash_601ae32339098104");
	b_give_reward = self function_dcda5d87(var_4d0b3b87, 1, 1);
	if(is_true(b_give_reward))
	{
		if(var_6c9485fc == "self_revive")
		{
			if(self zm_laststand::function_618fd37e() < 1)
			{
				self zm_laststand::function_3a00302e();
			}
		}
		else
		{
			level [[level._custom_powerups[var_6c9485fc].grab_powerup]](self);
		}
	}
	self stoploopsound();
}

/*
	Name: function_29e6dc49
	Namespace: namespace_f999c142
	Checksum: 0x8C8C59A5
	Offset: 0x1890
	Size: 0x124
	Parameters: 2
	Flags: Linked
*/
function function_29e6dc49(var_be164210, var_6c9485fc)
{
	if(!isdefined(var_6c9485fc))
	{
		var_6c9485fc = 3;
	}
	self endon(#"death");
	var_b3556b34 = self.var_642ed51a.var_e3345cac.origin;
	for(i = 0; i < var_6c9485fc; i++)
	{
		point = function_4ba8fde(#"hash_2d7d38ce6d3e09db");
		if(isdefined(point))
		{
			var_88f24b00 = item_drop::drop_item(0, undefined, 1, 0, point.id, var_b3556b34, (0, function_21a3a673(0, 359), 0), 2);
			if(isdefined(var_88f24b00))
			{
				var_88f24b00 thread function_ff6232b7();
			}
			wait(0.15);
		}
	}
}

/*
	Name: function_5b933926
	Namespace: namespace_f999c142
	Checksum: 0xB1DC1494
	Offset: 0x19C0
	Size: 0x164
	Parameters: 2
	Flags: Linked
*/
function function_5b933926(var_7b9202e5, var_8196956c)
{
	if(!isdefined(var_7b9202e5))
	{
		var_7b9202e5 = 1;
	}
	if(!isdefined(var_8196956c))
	{
		var_8196956c = 0;
	}
	self endon(#"death");
	var_b3556b34 = self.var_642ed51a.var_e3345cac.origin;
	for(i = 0; i < var_7b9202e5; i++)
	{
		if(var_8196956c)
		{
			point = function_4ba8fde(#"hash_5a5d63f61e6770f9");
		}
		else
		{
			point = function_4ba8fde(#"hash_58951f692bf35608");
		}
		if(isdefined(point))
		{
			var_222106a6 = item_drop::drop_item(0, undefined, 1, 0, point.id, var_b3556b34, (0, function_21a3a673(0, 359), 0), 2);
			if(isdefined(var_222106a6))
			{
				var_222106a6 thread function_ff6232b7();
			}
			wait(0.25);
		}
	}
}

/*
	Name: function_ff6232b7
	Namespace: namespace_f999c142
	Checksum: 0x9F0FC87D
	Offset: 0x1B30
	Size: 0x54
	Parameters: 0
	Flags: Linked, Private
*/
function private function_ff6232b7()
{
	self endon(#"death");
	self.var_864ea466 = 1;
	wait(2);
	self.var_864ea466 = undefined;
	wait(13);
	item_world::consume_item(self, 1);
}

/*
	Name: function_a8243f37
	Namespace: namespace_f999c142
	Checksum: 0x3747FE8
	Offset: 0x1B90
	Size: 0x6C4
	Parameters: 0
	Flags: Linked
*/
function function_a8243f37()
{
	level.var_433de94b = [];
	level.var_433de94b[level.var_433de94b.size] = #"shotgun_pump_t9";
	level.var_433de94b[level.var_433de94b.size] = #"pistol_burst_t9";
	level.var_2e1a7563 = 0;
	level.var_30641602 = [];
	level.var_30641602[level.var_30641602.size] = #"shotgun_semiauto_t9";
	level.var_30641602[level.var_30641602.size] = #"smg_standard_t9";
	level.var_8e5c4768 = 0;
	level.var_fc2d4a2 = [];
	level.var_fc2d4a2[level.var_fc2d4a2.size] = #"tr_longburst_t9";
	level.var_fc2d4a2[level.var_fc2d4a2.size] = #"tr_damagesemi_t9";
	level.var_fc2d4a2[level.var_fc2d4a2.size] = #"smg_heavy_t9";
	level.var_e3d39f70 = 0;
	level.var_24b50714 = [];
	level.var_24b50714[level.var_24b50714.size] = #"ar_accurate_t9";
	level.var_24b50714[level.var_24b50714.size] = #"sniper_quickscope_t9";
	level.var_24b50714[level.var_24b50714.size] = #"launcher_standard_t9";
	level.var_24b50714[level.var_24b50714.size] = #"ar_standard_t9";
	level.var_24b50714[level.var_24b50714.size] = #"sniper_standard_t9";
	level.var_de18c954 = 0;
	level.var_592fbce6 = [];
	level.var_592fbce6[#"knife_loadout"] = {#x:3};
	level.var_592fbce6[#"shotgun_semiauto_t9"] = {#x:-9};
	level.var_592fbce6[#"smg_standard_t9"] = {#x:0};
	level.var_592fbce6[#"tr_longburst_t9"] = {#x:-6};
	level.var_592fbce6[#"tr_damagesemi_t9"] = {#x:-7};
	level.var_592fbce6[#"smg_heavy_t9"] = {#x:-2};
	level.var_592fbce6[#"ar_accurate_t9"] = {#x:-5};
	level.var_592fbce6[#"sniper_quickscope_t9"] = {#x:-9};
	level.var_592fbce6[#"launcher_standard_t9"] = {#x:5};
	level.var_592fbce6[#"ar_standard_t9"] = {#x:-9};
	level.var_592fbce6[#"sniper_standard_t9"] = {#x:-6};
	level.var_592fbce6[#"hash_3fa91d1674123e09"] = {#x:0};
	level.var_592fbce6[#"hash_61247be669e9b732"] = {#angles:vectorscale((-1, 0, 0), 90), #z:-1};
	level.var_592fbce6[#"hash_1223df8e913d431b"] = {#z:-6};
	level.var_592fbce6[#"hash_7f37566c7dd7ecb"] = {#z:-9};
	level.var_592fbce6[#"hash_7ab18956a0660839"] = {#z:-6};
	level.var_592fbce6[#"hash_49b7001ce02a0797"] = {#z:-6};
	level.var_592fbce6[#"hash_49c0448e11cb523c"] = {#z:-8};
	level.var_592fbce6[#"hash_6ab225c69027e657"] = {#z:-6};
	level.var_592fbce6[#"hash_6174ad2674c82ec3"] = {#z:-6};
	level.var_592fbce6[#"hash_689c84ba4e75b1c8"] = {#z:-6};
	level.var_592fbce6[#"hash_18ed63a25d0c43d1"] = {#n_scale:0.5, #x:-5};
	level.var_592fbce6[#"hash_cefb3af28fb800b"] = {#n_scale:0.8, #z:-12};
	level.var_592fbce6[#"hash_541f29266c6b7df8"] = {#b_rotate:0};
	level.var_592fbce6[#"hash_3e1160ae9d1b5446"] = {#b_rotate:0, #x:13};
}

/*
	Name: function_6725ddf1
	Namespace: namespace_f999c142
	Checksum: 0x6F55F58D
	Offset: 0x2260
	Size: 0x4E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6725ddf1(str_item_name)
{
	if(isdefined(str_item_name))
	{
		if(isdefined(level.itemreplacement[str_item_name]))
		{
			str_item_name = level.itemreplacement[str_item_name];
		}
	}
	else
	{
		str_item_name = "";
	}
	return str_item_name;
}

/*
	Name: function_ff28876a
	Namespace: namespace_f999c142
	Checksum: 0xC02DD282
	Offset: 0x22B8
	Size: 0x466
	Parameters: 1
	Flags: Linked
*/
function function_ff28876a(var_7ed75e97)
{
	switch(var_7ed75e97)
	{
		case 1:
		{
			s_bundle = getscriptbundle(#"hash_6f2ecbacf4031dc7");
			var_20316d8f = [];
			foreach(s_item in s_bundle.itemlist)
			{
				str_item_name = function_6725ddf1(s_item.var_a6762160);
				if(str_item_name != "")
				{
					if(!isdefined(var_20316d8f))
					{
						var_20316d8f = [];
					}
					else if(!isarray(var_20316d8f))
					{
						var_20316d8f = array(var_20316d8f);
					}
					if(!isinarray(var_20316d8f, str_item_name))
					{
						var_20316d8f[var_20316d8f.size] = str_item_name;
					}
				}
			}
			str_equipment = array::random(var_20316d8f);
			break;
		}
		case 2:
		{
			s_bundle = getscriptbundle(#"hash_37b2cda396a715c1");
			var_20316d8f = [];
			foreach(s_item in s_bundle.itemlist)
			{
				str_item_name = function_6725ddf1(s_item.var_a6762160);
				if(str_item_name != "")
				{
					if(!isdefined(var_20316d8f))
					{
						var_20316d8f = [];
					}
					else if(!isarray(var_20316d8f))
					{
						var_20316d8f = array(var_20316d8f);
					}
					if(!isinarray(var_20316d8f, str_item_name))
					{
						var_20316d8f[var_20316d8f.size] = str_item_name;
					}
				}
			}
			str_equipment = array::random(var_20316d8f);
			break;
		}
		case 3:
		{
			s_bundle = getscriptbundle(#"hash_797e1c1bf06f1140");
			var_20316d8f = [];
			foreach(s_item in s_bundle.itemlist)
			{
				str_item_name = function_6725ddf1(s_item.var_a6762160);
				if(str_item_name != "")
				{
					if(!isdefined(var_20316d8f))
					{
						var_20316d8f = [];
					}
					else if(!isarray(var_20316d8f))
					{
						var_20316d8f = array(var_20316d8f);
					}
					if(!isinarray(var_20316d8f, str_item_name))
					{
						var_20316d8f[var_20316d8f.size] = str_item_name;
					}
				}
			}
			str_equipment = array::random(var_20316d8f);
			break;
		}
		case 4:
		{
			/#
				assertmsg("");
			#/
			break;
		}
	}
	return str_equipment;
}

/*
	Name: get_weapon
	Namespace: namespace_f999c142
	Checksum: 0x15592285
	Offset: 0x2728
	Size: 0x836
	Parameters: 1
	Flags: Linked
*/
function get_weapon(var_7ed75e97)
{
	if(isdefined(level.var_29d88fe5) && isdefined(level.zombie_weapons))
	{
		if(!isdefined(level.var_605e404c))
		{
			level.var_605e404c = getarraykeys(level.var_29d88fe5);
			var_f82fa74e = getarraykeys(level.zombie_weapons);
			var_22064197 = [];
			foreach(weapon in var_f82fa74e)
			{
				if(!isdefined(var_22064197))
				{
					var_22064197 = [];
				}
				else if(!isarray(var_22064197))
				{
					var_22064197 = array(var_22064197);
				}
				if(!isinarray(var_22064197, weapon.name))
				{
					var_22064197[var_22064197.size] = weapon.name;
				}
			}
			foreach(var_e90f1071 in arraycopy(level.var_605e404c))
			{
				if(!isinarray(var_22064197, var_e90f1071))
				{
					arrayremovevalue(level.var_605e404c, var_e90f1071);
				}
			}
			var_ed6d67fe = [];
			foreach(weapon in level.var_cb55e72e)
			{
				if(!isdefined(var_ed6d67fe))
				{
					var_ed6d67fe = [];
				}
				else if(!isarray(var_ed6d67fe))
				{
					var_ed6d67fe = array(var_ed6d67fe);
				}
				if(!isinarray(var_ed6d67fe, weapon.name))
				{
					var_ed6d67fe[var_ed6d67fe.size] = weapon.name;
				}
			}
			lootweapons = self function_cf9658ca();
			foreach(var_2d4b1e93 in lootweapons)
			{
				arrayremovevalue(var_ed6d67fe, var_2d4b1e93);
			}
			foreach(var_e90f1071 in arraycopy(level.var_605e404c))
			{
				if(isinarray(var_ed6d67fe, var_e90f1071))
				{
					arrayremovevalue(level.var_605e404c, var_e90f1071);
				}
			}
		}
		str_weapon_name = array::random(level.var_605e404c);
		str_weapon_name = function_6725ddf1(str_weapon_name);
		switch(var_7ed75e97)
		{
			case 1:
			{
				str_weapon = level.var_29d88fe5[str_weapon_name][#"green"];
				break;
			}
			case 2:
			{
				str_weapon = level.var_29d88fe5[str_weapon_name][#"blue"];
				break;
			}
			case 3:
			{
				str_weapon = level.var_29d88fe5[str_weapon_name][#"purple"];
				break;
			}
			case 4:
			{
				str_weapon = level.var_29d88fe5[str_weapon_name][#"purple"];
				break;
			}
		}
	}
	else
	{
		switch(var_7ed75e97)
		{
			case 1:
			{
				if(level.var_433de94b.size > 0)
				{
					level.var_2e1a7563 = function_566c19d5(level.var_433de94b, level.var_2e1a7563);
					str_weapon = level.var_433de94b[level.var_2e1a7563];
					level.var_2e1a7563++;
					if(level.var_2e1a7563 >= level.var_433de94b.size)
					{
						level.var_2e1a7563 = 0;
					}
				}
				break;
			}
			case 2:
			{
				if(level.var_30641602.size > 0)
				{
					level.var_8e5c4768 = function_566c19d5(level.var_30641602, level.var_8e5c4768);
					str_weapon = level.var_30641602[level.var_8e5c4768];
					level.var_8e5c4768++;
					if(level.var_8e5c4768 >= level.var_30641602.size)
					{
						level.var_8e5c4768 = 0;
					}
				}
				break;
			}
			case 3:
			{
				if(level.var_fc2d4a2.size > 0)
				{
					level.var_e3d39f70 = function_566c19d5(level.var_fc2d4a2, level.var_e3d39f70);
					str_weapon = level.var_fc2d4a2[level.var_e3d39f70];
					level.var_e3d39f70++;
					if(level.var_e3d39f70 >= level.var_fc2d4a2.size)
					{
						level.var_e3d39f70 = 0;
					}
				}
				break;
			}
			case 4:
			{
				if(level.var_24b50714.size > 0)
				{
					level.var_f2a057b1 = function_566c19d5(level.var_24b50714, level.var_de18c954);
					str_weapon = level.var_24b50714[level.var_de18c954];
					level.var_de18c954++;
					if(level.var_de18c954 >= level.var_24b50714.size)
					{
						level.var_de18c954 = 0;
					}
				}
				break;
			}
		}
	}
	return str_weapon;
}

/*
	Name: function_566c19d5
	Namespace: namespace_f999c142
	Checksum: 0x2659110D
	Offset: 0x2F68
	Size: 0x19E
	Parameters: 2
	Flags: Linked
*/
function function_566c19d5(var_3d01acc1, n_index)
{
	n_start_index = n_index;
	b_found = 0;
	a_player_weapons = self getweaponslist();
	foreach(str_weapon in var_3d01acc1)
	{
		var_b2425ef = str_weapon + "_upgraded";
		foreach(wpn in a_player_weapons)
		{
			if(wpn.name == str_weapon || wpn.name == var_b2425ef)
			{
				b_found = 1;
				break;
			}
		}
		if(!b_found)
		{
			return n_index;
		}
		n_index++;
		if(n_index >= var_3d01acc1.size)
		{
			n_index = 0;
		}
	}
	return n_start_index;
}

/*
	Name: function_d7d8834f
	Namespace: namespace_f999c142
	Checksum: 0xA1EFCC9E
	Offset: 0x3110
	Size: 0x3AC
	Parameters: 2
	Flags: Linked
*/
function function_d7d8834f(var_7ed75e97, var_6c9485fc)
{
	str_item_name = function_ff28876a(var_6c9485fc);
	v_loc = self.var_642ed51a.var_f693bf0b.origin;
	v_angles = self.var_642ed51a.var_f693bf0b.angles;
	if(isdefined(level.var_592fbce6[str_item_name].z))
	{
		v_loc = v_loc + (0, 0, level.var_592fbce6[str_item_name].z);
	}
	if(isdefined(level.var_592fbce6[str_item_name].x))
	{
		n_amount = level.var_592fbce6[str_item_name].x;
		v_forward = anglestoforward(v_angles);
		v_loc = v_loc + (v_forward * n_amount);
	}
	if(isdefined(level.var_592fbce6[str_item_name].angles))
	{
		v_angles = v_angles + level.var_592fbce6[str_item_name].angles;
	}
	var_814059b6 = function_83132977(str_item_name);
	var_3e5ffe79 = function_61ae9102(var_6c9485fc);
	if(isdefined(var_814059b6.weapon) && !isdefined(var_814059b6.str_model))
	{
		var_4d0b3b87 = zm_utility::spawn_buildkit_weapon_model(self, var_814059b6.weapon, undefined, v_loc, v_angles);
	}
	else
	{
		var_4d0b3b87 = util::spawn_model(var_814059b6.str_model, v_loc, v_angles);
		var_4d0b3b87 notsolid();
	}
	if(isdefined(level.var_592fbce6[str_item_name].n_scale))
	{
		var_4d0b3b87 setscale(level.var_592fbce6[str_item_name].n_scale);
	}
	self.var_642ed51a.var_f92a5f81 = var_4d0b3b87;
	if(isdefined(var_3e5ffe79.var_74ca2ca1))
	{
		var_4d0b3b87 zm_utility::function_36eb0acc(var_3e5ffe79.var_74ca2ca1);
	}
	b_rotate = (isdefined(level.var_592fbce6[str_item_name].b_rotate) ? level.var_592fbce6[str_item_name].b_rotate : 1);
	var_b9b24 = (isdefined(level.var_592fbce6[str_item_name].var_b9b24) ? level.var_592fbce6[str_item_name].var_b9b24 : 0);
	b_give_reward = self function_dcda5d87(var_4d0b3b87, b_rotate, var_b9b24);
	if(isplayer(self) && is_true(b_give_reward))
	{
		self function_923efc48(str_item_name, var_6c9485fc);
	}
}

/*
	Name: function_923efc48
	Namespace: namespace_f999c142
	Checksum: 0xD69FCC48
	Offset: 0x34C8
	Size: 0xA2
	Parameters: 2
	Flags: Linked
*/
function function_923efc48(str_item_name, var_7ed75e97)
{
	switch(var_7ed75e97)
	{
		case 1:
		{
			self namespace_1cc7b406::function_52df229a(str_item_name);
			break;
		}
		case 2:
		{
			self namespace_1cc7b406::function_52df229a(str_item_name);
			break;
		}
		case 3:
		{
			self namespace_1cc7b406::function_52df229a(str_item_name);
			break;
		}
	}
}

/*
	Name: function_11be5095
	Namespace: namespace_f999c142
	Checksum: 0x9BDDEB7C
	Offset: 0x3578
	Size: 0x39C
	Parameters: 4
	Flags: Linked
*/
function function_11be5095(var_7ed75e97, var_6c9485fc, b_upgraded, var_5876e0e2)
{
	if(!isdefined(var_6c9485fc))
	{
		var_6c9485fc = 3;
	}
	if(!isdefined(b_upgraded))
	{
		b_upgraded = 0;
	}
	if(var_6c9485fc)
	{
		self thread function_29e6dc49(0, var_6c9485fc);
	}
	if(isdefined(var_5876e0e2))
	{
		str_weapon_name = var_5876e0e2;
		if(str_weapon_name === #"hash_3fa91d1674123e09")
		{
			str_item_name = #"hash_315d03848e9c8533";
		}
		else if(str_weapon_name === #"hash_5bd48d860ebd5a41")
		{
			str_item_name = #"hash_55c0a68941dcc80b";
		}
	}
	else
	{
		str_weapon_name = get_weapon(var_7ed75e97);
		s_bundle = getscriptbundle(str_weapon_name);
		if(isdefined(s_bundle.weapon))
		{
			str_item_name = str_weapon_name;
			str_weapon_name = s_bundle.weapon.name;
		}
	}
	v_loc = self.var_642ed51a.var_f693bf0b.origin;
	v_angles = self.var_642ed51a.var_f693bf0b.angles;
	if(isdefined(level.var_592fbce6[str_weapon_name].x))
	{
		n_amount = level.var_592fbce6[str_weapon_name].x;
		v_forward = anglestoforward(v_angles);
		v_loc = v_loc + (v_forward * n_amount);
	}
	var_4d0b3b87 = zm_utility::spawn_buildkit_weapon_model(self, getweapon(str_weapon_name), undefined, v_loc, v_angles);
	self.var_642ed51a.var_f92a5f81 = var_4d0b3b87;
	var_3e5ffe79 = function_61ae9102(var_7ed75e97);
	if(isdefined(var_3e5ffe79.var_74ca2ca1))
	{
		var_4d0b3b87 zm_utility::function_36eb0acc(var_3e5ffe79.var_74ca2ca1);
		if(!isdefined(str_item_name))
		{
			str_item_name = level.var_29d88fe5[str_weapon_name][var_3e5ffe79.var_74ca2ca1];
		}
	}
	b_rotate = (isdefined(level.var_592fbce6[str_item_name].b_rotate) ? level.var_592fbce6[str_item_name].b_rotate : 1);
	var_b9b24 = (isdefined(level.var_592fbce6[str_item_name].var_b9b24) ? level.var_592fbce6[str_item_name].var_b9b24 : 0);
	b_give_reward = self function_dcda5d87(var_4d0b3b87, b_rotate, var_b9b24);
	if(isplayer(self) && is_true(b_give_reward))
	{
		self function_e2a25377(str_weapon_name, b_upgraded, str_item_name);
	}
}

/*
	Name: function_61ae9102
	Namespace: namespace_f999c142
	Checksum: 0xA36888FA
	Offset: 0x3920
	Size: 0x164
	Parameters: 1
	Flags: Linked
*/
function function_61ae9102(var_7ed75e97)
{
	if(!isdefined(var_7ed75e97))
	{
		var_7ed75e97 = 0;
	}
	var_74ca2ca1 = undefined;
	var_fafb77dd = undefined;
	if(isdefined(var_7ed75e97))
	{
		switch(var_7ed75e97)
		{
			case 1:
			{
				var_74ca2ca1 = #"green";
				break;
			}
			case 2:
			{
				var_74ca2ca1 = #"blue";
				break;
			}
			case 3:
			{
				var_74ca2ca1 = #"purple";
				break;
			}
			case 4:
			{
				var_74ca2ca1 = #"purple";
				break;
			}
			case 5:
			{
				var_74ca2ca1 = #"yellow";
				break;
			}
			default:
			{
				var_74ca2ca1 = #"white";
			}
		}
	}
	return {#hash_fafb77dd:var_fafb77dd, #hash_74ca2ca1:var_74ca2ca1};
}

/*
	Name: function_e2a25377
	Namespace: namespace_f999c142
	Checksum: 0x87A86320
	Offset: 0x3A90
	Size: 0x3C2
	Parameters: 3
	Flags: Linked
*/
function function_e2a25377(str_weapon_name, b_upgraded, str_item_name)
{
	self endon(#"disconnect");
	if(isdefined(str_item_name))
	{
		point = function_4ba8fde(str_item_name);
		if(isdefined(point) && is_true(b_upgraded) && isdefined(level.var_fee1eaaf))
		{
			new_item = [[level.var_fee1eaaf]](point);
			if(isdefined(new_item))
			{
				point = new_item;
				point.var_a8bccf69 = 1;
			}
		}
		if(isdefined(point.var_a6762160.var_a53e9db0))
		{
			weapon = namespace_65181344::function_67456242(point.var_a6762160);
			dropitem = item_drop::drop_item(0, weapon, 1, weapon.maxammo, point.id, self.origin, self.angles, 1);
			dropitem.var_519e776c = 1;
			dropitem.hidetime = 1;
			dropitem hide();
			self zm_weapons::function_98776900(dropitem, 0, 0, 1);
		}
		else
		{
			self zm_weapons::function_98776900(point, 0, 0, 1);
		}
		if(is_true(b_upgraded))
		{
			self item_inventory::function_d92c6b5b(self.currentweapon, 0);
			maxammo = self.currentweapon.maxammo;
			var_53b14ebf = self function_b7f1fd2c(self.currentweapon);
			self setweaponammoclip(self.currentweapon, var_53b14ebf);
			self setweaponammostock(self.currentweapon, maxammo);
			self notify(#"hash_75ec9942d2d5fd0f");
		}
	}
	else
	{
		var_498a708 = getweapon(str_weapon_name);
		if(self hasweapon(zm_weapons::get_base_weapon(var_498a708), 1, 1))
		{
			self zm_weapons::weapon_take(zm_weapons::get_base_weapon(var_498a708));
		}
		if(b_upgraded)
		{
			weapon_given = self zm_weapons::weapon_give(var_498a708, 1);
			self waittill(#"weapon_change_complete");
			weapon_given = self getcurrentweapon();
			item = self item_inventory::function_230ceec4(weapon_given);
			if(isdefined(item))
			{
				item.var_a8bccf69 = 1;
			}
			self notify(#"hash_75ec9942d2d5fd0f");
		}
		else
		{
			weapon_given = self zm_weapons::weapon_give(var_498a708, 1);
		}
	}
	return weapon_given;
}

/*
	Name: function_7dc3dfdb
	Namespace: namespace_f999c142
	Checksum: 0x57D44930
	Offset: 0x3E60
	Size: 0x184
	Parameters: 1
	Flags: Linked
*/
function function_7dc3dfdb(var_6c9485fc)
{
	if(!isdefined(var_6c9485fc))
	{
		var_6c9485fc = 0;
	}
	self endon(#"death");
	if(var_6c9485fc)
	{
		self thread function_29e6dc49(0, var_6c9485fc);
	}
	var_8b84b3ce = self.var_642ed51a.var_f693bf0b.origin;
	v_spawn_angles = self.var_642ed51a.var_f693bf0b.angles;
	v_forward = anglestoforward(v_spawn_angles);
	var_4d0b3b87 = util::spawn_model("p8_zm_powerup_aat", var_8b84b3ce, v_spawn_angles);
	self.var_642ed51a.var_f693bf0b clientfield::set("" + #"hash_653b5827e6fbe5f9", 1);
	self.var_642ed51a.var_f92a5f81 = var_4d0b3b87;
	b_taken = self function_dcda5d87(var_4d0b3b87, 1, 1);
	if(is_true(b_taken))
	{
		self thread function_fc6ae19f();
	}
}

/*
	Name: function_fc6ae19f
	Namespace: namespace_f999c142
	Checksum: 0xC4AD2895
	Offset: 0x3FF0
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function function_fc6ae19f()
{
	if(self validation())
	{
		current_weapon = self getcurrentweapon();
		current_weapon = self zm_weapons::switch_from_alt_weapon(current_weapon);
		var_9a9544b8 = self aat::getaatonweapon(current_weapon, 1);
		self aat::acquire(current_weapon, undefined, var_9a9544b8);
		self thread zm_vo::function_8abe0568(#"hash_4f352102512cc494", 0.5);
	}
}

/*
	Name: function_8665509b
	Namespace: namespace_f999c142
	Checksum: 0x9577137F
	Offset: 0x40C0
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function function_8665509b(var_6c9485fc)
{
	if(!isdefined(var_6c9485fc))
	{
		var_6c9485fc = 10;
	}
	var_62fef0f1 = self zm_perks::function_5ea0c6cf(array(#"hash_7f98b3dd3cce95aa"));
	if(!isdefined(var_62fef0f1))
	{
		return;
	}
	self thread give_perk_reward(var_62fef0f1, var_6c9485fc);
}

/*
	Name: give_perk_reward
	Namespace: namespace_f999c142
	Checksum: 0xEFF5EB1B
	Offset: 0x4148
	Size: 0x1AC
	Parameters: 2
	Flags: Linked
*/
function give_perk_reward(var_16c042b8, var_6c9485fc)
{
	if(!isdefined(var_6c9485fc))
	{
		var_6c9485fc = 10;
	}
	self endon(#"death");
	if(var_6c9485fc)
	{
		self thread function_29e6dc49(0, var_6c9485fc);
	}
	var_8b84b3ce = self.var_642ed51a.var_f693bf0b.origin + (vectorscale((0, 0, -1), 4));
	v_spawn_angles = self.var_642ed51a.var_f693bf0b.angles;
	var_242c6a7b = zm_perks::get_perk_weapon_model(var_16c042b8);
	var_4d0b3b87 = util::spawn_model(var_242c6a7b, var_8b84b3ce, v_spawn_angles);
	self.var_642ed51a.var_f693bf0b clientfield::set("" + #"hash_653b5827e6fbe5f9", 1);
	self.var_642ed51a.var_f92a5f81 = var_4d0b3b87;
	self thread function_545834dc(var_16c042b8);
	b_taken = self function_dcda5d87(var_4d0b3b87, 1, 1);
	if(is_true(b_taken))
	{
		self zm_perks::function_29387491(var_16c042b8);
	}
}

/*
	Name: function_c2e444e6
	Namespace: namespace_f999c142
	Checksum: 0x4DDEF1D1
	Offset: 0x4300
	Size: 0x5E4
	Parameters: 5
	Flags: Linked
*/
function function_c2e444e6(str_type, n_amount, var_b492d948, var_6c9485fc, var_10ad9538)
{
	if(!isdefined(str_type))
	{
		str_type = #"essence";
	}
	if(!isdefined(var_6c9485fc))
	{
		var_6c9485fc = 3;
	}
	if(!isdefined(var_10ad9538))
	{
		var_10ad9538 = 1;
	}
	self endon(#"death");
	if(var_6c9485fc)
	{
		self thread function_29e6dc49(0, var_6c9485fc);
	}
	var_8b84b3ce = self.var_642ed51a.var_f693bf0b.origin;
	v_spawn_angles = self.var_642ed51a.var_f693bf0b.angles;
	if(str_type === #"essence")
	{
		str_model = #"p9_sur_essence_container";
		if(var_10ad9538)
		{
			str_item_name = #"hash_6ac270ce2416deb3";
			if(n_amount === 1000)
			{
				var_13f9dee7 = #"uncommon";
			}
			else if(n_amount === 2000)
			{
				var_13f9dee7 = #"rare";
			}
		}
		else
		{
			n_scale = 0.65;
		}
		var_8b84b3ce = var_8b84b3ce + (vectorscale((0, 0, -1), 10));
	}
	else
	{
		if(isdefined(var_b492d948))
		{
			str_model = #"p9_sur_junk_parts_rare";
			if(var_10ad9538)
			{
				str_item_name = #"hash_5a5d63f61e6770f9";
				if(isdefined(var_b492d948))
				{
					var_13f9dee7 = #"rare";
				}
				else if(n_amount === 500)
				{
					var_13f9dee7 = #"uncommon";
				}
			}
			else
			{
				n_scale = 0.85;
			}
		}
		else
		{
			str_model = #"p9_sur_junk_parts_rare";
			if(var_10ad9538)
			{
				str_item_name = #"hash_5a5d63f61e6770f9";
				if(n_amount === 500)
				{
					var_13f9dee7 = #"uncommon";
				}
				else if(n_amount === 500)
				{
					var_13f9dee7 = #"rare";
				}
			}
			else
			{
				var_8b84b3ce = var_8b84b3ce + (vectorscale((0, 0, -1), 10));
				n_scale = 0.85;
			}
		}
		var_8b84b3ce = var_8b84b3ce + (vectorscale((0, 0, -1), 10));
	}
	if(var_10ad9538)
	{
		var_814059b6 = function_83132977(str_item_name);
		var_4d0b3b87 = util::spawn_model(var_814059b6.str_model, var_8b84b3ce, v_spawn_angles);
		n_scale = var_814059b6.n_scale;
		if(isdefined(var_814059b6.str_fx))
		{
			playfxontag(var_814059b6.str_fx, var_4d0b3b87, "tag_origin");
		}
		if(isdefined(var_13f9dee7) || isdefined(var_814059b6.rarity))
		{
			var_4d0b3b87 zm_utility::function_36eb0acc((isdefined(var_13f9dee7) ? var_13f9dee7 : var_814059b6.rarity));
		}
	}
	else
	{
		var_4d0b3b87 = util::spawn_model(str_model, var_8b84b3ce, v_spawn_angles);
		self.var_642ed51a.var_f693bf0b clientfield::set("" + #"hash_653b5827e6fbe5f9", 1);
	}
	if(isdefined(n_scale))
	{
		var_4d0b3b87 setscale(n_scale);
	}
	self.var_642ed51a.var_f92a5f81 = var_4d0b3b87;
	b_taken = self function_dcda5d87(var_4d0b3b87, 1, 0);
	if(is_true(b_taken))
	{
		if(str_type === #"essence")
		{
			if(n_amount === 1000)
			{
				for(i = 0; i < 4; i++)
				{
					level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:"essence_pickup_medium", #attacker:self});
				}
			}
			else if(n_amount === 2000)
			{
				for(i = 0; i < 4; i++)
				{
					level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:"essence_pickup_large", #attacker:self});
				}
			}
		}
		else
		{
			if(isdefined(var_b492d948))
			{
				self hud::function_32de5fc7();
				self thread sr_scrap::function_a6d4221f(var_b492d948);
			}
			else
			{
				self hud::function_8577b83e();
			}
			self thread sr_scrap::function_afab250a(n_amount);
		}
	}
}

/*
	Name: function_83132977
	Namespace: namespace_f999c142
	Checksum: 0x98E24762
	Offset: 0x48F0
	Size: 0xA6
	Parameters: 1
	Flags: Linked, Private
*/
function private function_83132977(str_item_name)
{
	var_814059b6 = spawnstruct();
	var_89230090 = getscriptbundle(str_item_name);
	var_814059b6.weapon = var_89230090.weapon;
	var_814059b6.str_model = var_89230090.model;
	var_814059b6.n_scale = var_89230090.modelscale;
	var_814059b6.str_fx = var_89230090.worldfx[0].worldfx;
	var_814059b6.rarity = var_89230090.rarity;
	return var_814059b6;
}

/*
	Name: function_53a333a8
	Namespace: namespace_f999c142
	Checksum: 0xA1F58FAF
	Offset: 0x49A0
	Size: 0x484
	Parameters: 3
	Flags: Linked
*/
function function_53a333a8(var_38f795c7, var_41f9c5ff, var_893baaf)
{
	if(!isdefined(var_41f9c5ff))
	{
		var_41f9c5ff = undefined;
	}
	if(!isdefined(var_893baaf))
	{
		var_893baaf = undefined;
	}
	if(isbot(self))
	{
		return;
	}
	if(self laststand::player_is_in_laststand())
	{
		return;
	}
	if(isdefined(var_41f9c5ff))
	{
		if(!is_true(self.var_4373c66b))
		{
			var_41f9c5ff = self function_73fda38e(var_41f9c5ff);
			self set_tribute(self.n_tribute + var_41f9c5ff);
			self.var_6b3806e8 = self.var_6b3806e8 + (var_41f9c5ff / level.var_8b7ab859);
			self.var_207f01b0 = self.var_207f01b0 + (var_41f9c5ff / level.var_8b7ab859);
			self playsoundtoplayer(#"hash_361faf1904fcc578", self);
		}
	}
	else if(isdefined(var_38f795c7))
	{
		n_amount = self function_955b59b2(var_38f795c7, var_893baaf);
		if(is_true(self.var_4373c66b))
		{
			n_amount = 0;
		}
		else
		{
			set_tribute(self.n_tribute + n_amount);
			self.var_6b3806e8 = self.var_6b3806e8 + (n_amount / level.var_8b7ab859);
			self.var_207f01b0 = self.var_207f01b0 + (n_amount / level.var_8b7ab859);
			self playsoundtoplayer(#"hash_361faf1904fcc578", self);
		}
	}
	if(level.var_2dffd020 === 4 && self.var_207f01b0 >= 0.2)
	{
		self thread namespace_f0b43eb5::function_34b03961();
	}
	var_1f5eb74c = self.var_9e09931e;
	self function_ae2c0ba5();
	if(var_1f5eb74c != self.var_9e09931e)
	{
		switch(self.var_9e09931e)
		{
			case 1:
			{
				self playsoundtoplayer(#"hash_5a8c1c6110251059", self);
				/#
					iprintlnbold("");
				#/
				break;
			}
			case 2:
			{
				self playsoundtoplayer(#"hash_5a8c1c6110251059", self);
				/#
					iprintlnbold("");
				#/
				break;
			}
			case 3:
			{
				self playsoundtoplayer(#"hash_5a8c1c6110251059", self);
				/#
					iprintlnbold("");
				#/
				break;
			}
			case 4:
			{
				self playsoundtoplayer(#"hash_5a8c1c6110251059", self);
				/#
					iprintlnbold("");
				#/
				break;
			}
		}
	}
	if(isplayer(self) && isdefined(self.var_642ed51a))
	{
		self.var_642ed51a.var_f693bf0b clientfield::set("" + #"hash_21f5fab6a3d22093", self.var_9e09931e);
		if(self.var_9e09931e != 0)
		{
			self function_2ae77bb7(self.var_642ed51a.var_f693bf0b, 1);
		}
	}
}

/*
	Name: function_56c888ce
	Namespace: namespace_f999c142
	Checksum: 0x72F82504
	Offset: 0x4E30
	Size: 0x15C
	Parameters: 1
	Flags: Linked
*/
function function_56c888ce(a_str_rewards)
{
	if(!a_str_rewards.size)
	{
		return #"empty";
	}
	a_str_rewards = array::randomize(a_str_rewards);
	n_max = a_str_rewards.size;
	if(n_max > 4)
	{
		n_max = 4;
	}
	var_c481f7e6 = randomint(n_max * 1000);
	if(var_c481f7e6 <= 1000)
	{
		str_reward = a_str_rewards[0];
	}
	else
	{
		if(var_c481f7e6 <= (1000 * 2))
		{
			str_reward = a_str_rewards[1];
		}
		else
		{
			if(var_c481f7e6 <= (1000 * 3))
			{
				str_reward = a_str_rewards[2];
			}
			else
			{
				str_reward = a_str_rewards[3];
			}
		}
	}
	/#
		var_fda84fc2 = getdvarstring(#"hash_41027d60a1cf70b4", "");
		if(var_fda84fc2 != "")
		{
			str_reward = var_fda84fc2;
		}
	#/
	return str_reward;
}

/*
	Name: function_73fda38e
	Namespace: namespace_f999c142
	Checksum: 0x76162695
	Offset: 0x4F98
	Size: 0xEA
	Parameters: 1
	Flags: Linked
*/
function function_73fda38e(n_amount)
{
	if(!n_amount)
	{
		return 0;
	}
	switch(self.var_9e09931e)
	{
		case 0:
		{
			n_amount = n_amount * 1.5;
			break;
		}
		case 1:
		{
			n_amount = n_amount * 0.7;
			break;
		}
		case 2:
		{
			n_amount = n_amount * 0.5;
			break;
		}
		case 3:
		case 4:
		{
			n_amount = n_amount * 0.35;
			break;
		}
	}
	if(n_amount == 0)
	{
		n_amount = 1;
	}
	return n_amount;
}

/*
	Name: function_955b59b2
	Namespace: namespace_f999c142
	Checksum: 0x6690F860
	Offset: 0x5090
	Size: 0x41A
	Parameters: 2
	Flags: Linked
*/
function function_955b59b2(var_38f795c7, var_893baaf)
{
	n_amount = 0;
	switch(var_38f795c7)
	{
		case "hash_6105e103a3189287":
		{
			n_amount = level.var_8b7ab859 * 0.01;
			break;
		}
		case "hash_97ec7cda4d126e":
		case "hash_aee5cb4bd88c4ee":
		case "hash_beba8c495ad1123":
		case "hash_2272d4303498d425":
		case "hash_26e32893218f3cc2":
		case "hash_363ccc9296a0bb43":
		case "hash_47d7bcdc94e2be1c":
		case "hash_756817dc68da56e9":
		case "hash_795ccb5ead8f853e":
		case "hash_7cb657a5f657cbbe":
		case "hash_7e17eba37f893fb4":
		case "hash_7e80a8ea892ec8c4":
		case "hash_7f0be97960376eb0":
		{
			n_amount = level.var_8b7ab859 * 0.03;
			break;
		}
		case "hash_25a76ab3d0a73b03":
		{
			n_amount = level.var_8b7ab859 * 0.03;
			break;
		}
		case "hash_11b4177e0f079bb6":
		{
			n_frac = var_893baaf / self.maxhealth;
			n_amount = (level.var_8b7ab859 * 0.25) * n_frac;
			break;
		}
		case "hash_1db5106df3c3c0c4":
		{
			n_amount = level.var_8b7ab859 * 0.05;
			break;
		}
		case "hash_4b4ab7b6cf4d87c":
		{
			n_amount = level.var_8b7ab859 * 0.02;
			break;
		}
		case "hash_864f03f723d7dc3":
		case "hash_864f13f723d7f76":
		case "hash_b5ed710fa19696b":
		case "hash_1417cb50f78e17e3":
		case "hash_1cc52d72244f1eda":
		case "hash_1f16e513ff381c18":
		case "hash_2274efc6b68c164b":
		case "hash_257a005f64e8c41e":
		case "hash_2f4a7e5da228eead":
		case "hash_346b7588b58a9ac5":
		case "hash_3b5a9c328640c84f":
		case "hash_3e868812f1167436":
		case "hash_3f88531b59d4cc0b":
		case "hash_403956d6660b774e":
		case "hash_52a6d61d1d8e570c":
		case "hash_57c709d0608e925f":
		case "hash_60b2f29696c25fc4":
		case "hash_64cc9ec22d551ae5":
		case "hash_6e9cc81a9a529f18":
		case "hash_749eb9a0557be48d":
		case "hash_77344bcb8a308c09":
		case "hash_78b5818aca0414eb":
		case "hash_79ec66f63fc093c6":
		case "hash_7bfe0d876e389ddc":
		{
			n_amount = level.var_8b7ab859 * 0.015;
			break;
		}
		case "hash_4cc252a7609d289":
		{
			n_amount = level.var_8b7ab859 * 0.02;
			break;
		}
		default:
		{
			n_amount = 0;
			break;
		}
	}
	n_amount = self function_73fda38e(n_amount);
	return n_amount;
}

/*
	Name: function_6c62f074
	Namespace: namespace_f999c142
	Checksum: 0xE0D314A6
	Offset: 0x54B8
	Size: 0x37A
	Parameters: 1
	Flags: Linked
*/
function function_6c62f074(var_9e09931e)
{
	switch(var_9e09931e)
	{
		case 2:
		{
			if(math::cointoss())
			{
				level thread function_445c5623("double_points", self.var_642ed51a.var_f693bf0b.origin, self.var_642ed51a);
			}
			else
			{
				level thread function_445c5623("carpenter", self.var_642ed51a.var_f693bf0b.origin, self.var_642ed51a);
			}
			break;
		}
		case 3:
		{
			if(math::cointoss())
			{
				level thread function_445c5623("double_points", self.var_642ed51a.var_f693bf0b.origin, self.var_642ed51a);
			}
			else
			{
				level thread function_445c5623("carpenter", self.var_642ed51a.var_f693bf0b.origin, self.var_642ed51a);
			}
			if(math::cointoss() || zm_utility::is_survival())
			{
				level thread function_445c5623("full_ammo", self.var_642ed51a.var_f693bf0b.origin, self.var_642ed51a);
			}
			else
			{
				level thread function_445c5623("fire_sale", self.var_642ed51a.var_f693bf0b.origin, self.var_642ed51a);
			}
			break;
		}
		case 4:
		{
			if(math::cointoss() || zm_utility::is_survival())
			{
				level thread function_445c5623("full_ammo", self.var_642ed51a.var_f693bf0b.origin, self.var_642ed51a);
			}
			else
			{
				level thread function_445c5623("fire_sale", self.var_642ed51a.var_f693bf0b.origin, self.var_642ed51a);
			}
			if(math::cointoss())
			{
				level thread function_445c5623("double_points", self.var_642ed51a.var_f693bf0b.origin, self.var_642ed51a);
			}
			else
			{
				level thread function_445c5623("carpenter", self.var_642ed51a.var_f693bf0b.origin, self.var_642ed51a);
			}
			break;
		}
		default:
		{
			break;
		}
	}
}

/*
	Name: function_ae58bd73
	Namespace: namespace_f999c142
	Checksum: 0x53CEC0A5
	Offset: 0x5840
	Size: 0x2A4
	Parameters: 1
	Flags: None
*/
function function_ae58bd73(var_8b84b3ce)
{
	self endon(#"death");
	v_angles = self.var_642ed51a.var_f693bf0b.angles;
	var_4d0b3b87 = util::spawn_model("p8_zm_powerup_aat", var_8b84b3ce, v_angles);
	var_4d0b3b87 playsound(#"hash_e3e5f7c83015171");
	var_4d0b3b87 playloopsound(#"hash_2adfa98b79668366");
	v_forward = anglestoforward(v_angles);
	while(true)
	{
		s_result = positionquery_source_navigation(self.var_642ed51a.var_e3345cac.origin, 1, 60, 4, 15, 1);
		var_cb7582a6 = s_result.data;
		random_index = randomint(var_cb7582a6.size);
		var_bbefa45e = var_cb7582a6[random_index];
		v_loc = var_bbefa45e.origin;
		n_power = length(var_8b84b3ce - v_loc);
		if(n_power != 0)
		{
			break;
		}
		waitframe(1);
	}
	var_4d0b3b87 clientfield::set("" + #"hash_3dbe7851af541017", 1);
	var_cef149e8 = var_4d0b3b87 zm_utility::fake_physicslaunch(v_loc + vectorscale((0, 0, 1), 25), n_power);
	wait(var_cef149e8);
	e_player = level function_c45635c7(var_4d0b3b87, 1, 1);
	if(isplayer(e_player))
	{
		weapon = e_player getcurrentweapon();
		e_player thread function_fc6ae19f();
	}
}

/*
	Name: function_445c5623
	Namespace: namespace_f999c142
	Checksum: 0x9EA04963
	Offset: 0x5AF0
	Size: 0x2DC
	Parameters: 3
	Flags: Linked
*/
function function_445c5623(var_aa4f9213, var_8b84b3ce, reward_terminal)
{
	v_angles = reward_terminal.var_f693bf0b.angles;
	var_80f6fcee = reward_terminal.var_e3345cac.origin;
	var_24a867e4 = function_ed4a5d52(var_aa4f9213);
	if(!isdefined(var_24a867e4))
	{
		return;
	}
	var_4d0b3b87 = util::spawn_model(var_24a867e4, var_8b84b3ce, v_angles);
	var_4d0b3b87.var_f0de9b92 = var_aa4f9213;
	var_4d0b3b87 playsound(#"hash_e3e5f7c83015171");
	var_4d0b3b87 playloopsound(#"hash_2adfa98b79668366");
	while(true)
	{
		s_result = positionquery_source_navigation(var_80f6fcee, 1, 60, 4, 15, 1);
		var_ae04771e = s_result.data;
		if(isarray(var_ae04771e))
		{
			var_bbefa45e = array::random(var_ae04771e);
		}
		v_loc = var_bbefa45e.origin;
		if(isdefined(v_loc))
		{
			n_power = length(reward_terminal.var_f693bf0b.origin - v_loc);
			if(n_power != 0)
			{
				break;
			}
		}
		waitframe(1);
	}
	var_4d0b3b87 clientfield::set("" + #"hash_3dbe7851af541017", 1);
	var_cef149e8 = var_4d0b3b87 zm_utility::fake_physicslaunch(v_loc + vectorscale((0, 0, 1), 25), n_power);
	wait(var_cef149e8);
	e_player = level function_c45635c7(var_4d0b3b87, 1, 1);
	if(isplayer(e_player))
	{
		if(var_aa4f9213 == "self_revive")
		{
			e_player zm_laststand::function_3a00302e();
		}
		else
		{
			level [[level._custom_powerups[var_aa4f9213].grab_powerup]](e_player);
		}
	}
}

/*
	Name: function_c45635c7
	Namespace: namespace_f999c142
	Checksum: 0x39307C2
	Offset: 0x5DD8
	Size: 0x290
	Parameters: 3
	Flags: Linked
*/
function function_c45635c7(var_4d0b3b87, b_rotate, var_b9b24)
{
	var_f0de9b92 = (isdefined(var_4d0b3b87.var_f0de9b92) ? var_4d0b3b87.var_f0de9b92 : "");
	var_4d0b3b87 thread pickup_timeout(undefined, "spew_reward_packed_up");
	if(b_rotate)
	{
		var_4d0b3b87 thread function_51fd2597(var_b9b24);
	}
	wait(2);
	while(!is_true(var_4d0b3b87.b_timeout))
	{
		a_players = getplayers();
		foreach(player in a_players)
		{
			n_dist_sq = distance2dsquared(player.origin, var_4d0b3b87.origin);
			if(n_dist_sq < 4096)
			{
				player_pickup = player;
				break;
			}
		}
		if(isdefined(player_pickup))
		{
			break;
		}
		waitframe(1);
	}
	b_timeout = var_4d0b3b87.b_timeout;
	var_4d0b3b87 delete();
	if(is_true(b_timeout))
	{
		return undefined;
	}
	if(isplayer(player_pickup))
	{
		s_powerup = level.zombie_powerups[var_f0de9b92];
		if(isdefined(s_powerup.var_6029fea3.var_721ec012))
		{
			player playsound(s_powerup.var_6029fea3.var_721ec012);
		}
		else
		{
			player_pickup playsound(#"hash_9dbd105c3060c91");
		}
	}
	return player_pickup;
}

/*
	Name: function_ed4a5d52
	Namespace: namespace_f999c142
	Checksum: 0x5A164A77
	Offset: 0x6070
	Size: 0xEE
	Parameters: 1
	Flags: Linked
*/
function function_ed4a5d52(var_f0de9b92)
{
	switch(var_f0de9b92)
	{
		case "double_points":
		{
			var_9c0bf2db = #"p7_zm_power_up_double_points";
			break;
		}
		case "carpenter":
		{
			var_9c0bf2db = #"p7_zm_power_up_carpenter";
			break;
		}
		case "full_ammo":
		{
			var_9c0bf2db = #"p7_zm_power_up_max_ammo";
			break;
		}
		case "fire_sale":
		{
			var_9c0bf2db = #"p7_zm_power_up_firesale";
			break;
		}
		case "self_revive":
		{
			var_9c0bf2db = #"p9_lat_equipment_bag_first_aid_lrg";
			break;
		}
	}
	return var_9c0bf2db;
}

/*
	Name: function_dcda5d87
	Namespace: namespace_f999c142
	Checksum: 0xED4FA1FB
	Offset: 0x6168
	Size: 0x21E
	Parameters: 3
	Flags: Linked
*/
function function_dcda5d87(var_4d0b3b87, b_rotate, var_b9b24)
{
	if(!isdefined(b_rotate))
	{
		b_rotate = 1;
	}
	if(!isdefined(var_b9b24))
	{
		var_b9b24 = 1;
	}
	self endon(#"death", #"disconnect");
	self.var_7a281a7e = var_4d0b3b87;
	var_4d0b3b87 thread pickup_timeout(self, #"challenge_reward_timeout");
	if(b_rotate)
	{
		var_4d0b3b87 thread function_51fd2597(var_b9b24);
	}
	self.var_4373c66b = 1;
	self.var_43300e = 1;
	self.var_ccc18354 = (gettime() / 1000) + 0.1;
	self waittill(#"hash_3cd13a6cb08bba96", #"challenge_reward_timeout");
	/#
		assert(isplayer(self), "");
	#/
	self.var_ccc18354 = (gettime() / 1000) + 0.1;
	self function_2ae77bb7(undefined, 0);
	self.var_43300e = undefined;
	self.var_4373c66b = undefined;
	b_timeout = var_4d0b3b87.b_timeout;
	if(isdefined(var_4d0b3b87))
	{
		var_4d0b3b87 delete();
	}
	self.var_642ed51a.var_f693bf0b clientfield::set("" + #"hash_653b5827e6fbe5f9", 0);
	self notify(#"hash_358f065cca50b2a7");
	if(is_true(b_timeout))
	{
		return false;
	}
	return true;
}

/*
	Name: function_2ae77bb7
	Namespace: namespace_f999c142
	Checksum: 0x2D064C5E
	Offset: 0x6390
	Size: 0x234
	Parameters: 2
	Flags: Linked
*/
function function_2ae77bb7(var_ff48959, b_enable)
{
	if(!isdefined(b_enable))
	{
		b_enable = 1;
	}
	if(b_enable)
	{
		if(!isdefined(self.var_914576ba))
		{
			self.var_914576ba = zm_utility::function_f5a222a8(#"hash_27844f79a4ed6495", self.var_642ed51a);
			function_56ad6a7a(self.var_914576ba);
			objective_setvisibletoplayer(self.var_914576ba, self);
			foreach(player in getplayers())
			{
				if(player != self)
				{
					zm_utility::function_e8f4d47b(player, self.var_914576ba, 1);
				}
			}
			self.var_25a17236 zm_utility::function_747180ea(self.var_914576ba, undefined, self.var_25a17236, 0);
			self.var_642ed51a namespace_f0b43eb5::function_e1dd6a53(#"reward");
			self.var_642ed51a function_619a5c20();
		}
	}
	else if(isdefined(self.var_914576ba))
	{
		self.var_25a17236 zm_utility::function_48d9a9c9();
		zm_utility::function_bc5a54a8(self.var_914576ba);
		self.var_914576ba = undefined;
		self.var_642ed51a namespace_f0b43eb5::function_e1dd6a53(#"hash_60d06afd31a5f9f8");
		self.var_642ed51a function_23a29590();
	}
}

/*
	Name: pickup_timeout
	Namespace: namespace_f999c142
	Checksum: 0xE860B6A
	Offset: 0x65D0
	Size: 0x114
	Parameters: 3
	Flags: Linked
*/
function pickup_timeout(e_player, var_cbfbd48a, var_22b0e42b)
{
	if(!isdefined(var_22b0e42b))
	{
		var_22b0e42b = 15;
	}
	self endon(#"death");
	wait(var_22b0e42b);
	for(i = 0; i < 40; i++)
	{
		if(i % 2)
		{
			self ghost();
		}
		else
		{
			self show();
		}
		if(i < 15)
		{
			wait(0.5);
			continue;
		}
		if(i < 25)
		{
			wait(0.25);
			continue;
		}
		wait(0.1);
	}
	self ghost();
	self.b_timeout = 1;
	if(isdefined(e_player))
	{
		e_player notify(var_cbfbd48a);
	}
}

/*
	Name: function_51fd2597
	Namespace: namespace_f999c142
	Checksum: 0x13F6C680
	Offset: 0x66F0
	Size: 0x266
	Parameters: 1
	Flags: Linked
*/
function function_51fd2597(var_b9b24)
{
	if(!isdefined(var_b9b24))
	{
		var_b9b24 = 1;
	}
	self endon(#"death");
	v_center = self getcentroid();
	var_4e7cc086 = util::spawn_model(#"tag_origin", v_center, self.angles);
	self linkto(var_4e7cc086);
	var_4e7cc086 thread function_57b8a4e9(self);
	while(isdefined(self))
	{
		if(var_b9b24)
		{
			waittime = randomfloatrange(2.5, 5);
			yaw = randomint(360);
			if(yaw > 300)
			{
				yaw = 300;
			}
			else if(yaw < 60)
			{
				yaw = 60;
			}
			yaw = self.angles[1] + yaw;
			new_angles = (-60 + randomint(120), yaw, -45 + randomint(90));
			var_4e7cc086 rotateto(new_angles, waittime, waittime * 0.5, waittime * 0.5);
			wait(randomfloat(waittime - 0.1));
		}
		else
		{
			new_angles = (self.angles[0], self.angles[1] + 45, self.angles[2]);
			var_4e7cc086 rotateto(new_angles, 2, 2 * 0.05, 2 * 0.05);
			wait(2);
		}
	}
}

/*
	Name: function_57b8a4e9
	Namespace: namespace_f999c142
	Checksum: 0xE32DECBD
	Offset: 0x6960
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_57b8a4e9(e_pickup)
{
	e_pickup waittill(#"death");
	self delete();
}

/*
	Name: function_545834dc
	Namespace: namespace_f999c142
	Checksum: 0x90946AF4
	Offset: 0x69A8
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function function_545834dc(var_16c042b8)
{
	self endon(#"death", #"hash_358f065cca50b2a7");
	while(true)
	{
		if(self function_e5039011(var_16c042b8))
		{
			if(isdefined(self.var_7a281a7e))
			{
				self.var_7a281a7e.b_timeout = 1;
			}
			self notify(#"challenge_reward_timeout");
			break;
		}
		waitframe(1);
	}
}

/*
	Name: function_e5039011
	Namespace: namespace_f999c142
	Checksum: 0x266374DE
	Offset: 0x6A40
	Size: 0xF2
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e5039011(var_7da1f8d5)
{
	a_str_perks = array(var_7da1f8d5, var_7da1f8d5 + "_1", var_7da1f8d5 + "_2", var_7da1f8d5 + "_3", var_7da1f8d5 + "_4", var_7da1f8d5 + "_5");
	foreach(str_perk in a_str_perks)
	{
		if(self function_6c32d092(str_perk))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: validation
	Namespace: namespace_f999c142
	Checksum: 0x52EBB6B
	Offset: 0x6B40
	Size: 0xE2
	Parameters: 0
	Flags: Linked
*/
function validation()
{
	current_weapon = self getcurrentweapon();
	if(!zm_weapons::is_weapon_or_base_included(current_weapon) || !self zm_magicbox::can_buy_weapon() || self laststand::player_is_in_laststand() || is_true(self.intermission) || self isthrowinggrenade() || self isswitchingweapons() || !zm_weapons::weapon_supports_aat(current_weapon))
	{
		return false;
	}
	return true;
}

