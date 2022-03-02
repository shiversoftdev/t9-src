#using script_24c32478acf44108;
#using script_3f9e0dc8454d98e1;
#using script_47fb62300ac0bd60;
#using script_72401f526ba71638;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_stats.gsc;

#namespace namespace_32e85820;

/*
	Name: function_89f2df9
	Namespace: namespace_32e85820
	Checksum: 0xA664AE6F
	Offset: 0x218
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_36a2cb0be45d9374", &function_70a657d8, undefined, undefined, #"hash_13a43d760497b54d");
}

/*
	Name: function_70a657d8
	Namespace: namespace_32e85820
	Checksum: 0xE3B9E5E6
	Offset: 0x268
	Size: 0x334
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("toplayer", "fx_heal_aoe_player_clientfield", 1, 1, "counter");
	clientfield::register("scriptmover", "fx_heal_aoe_pillar_clientfield", 1, 1, "counter");
	clientfield::register("scriptmover", "fx_heal_aoe_bubble_clientfield", 1, 1, "int");
	clientfield::register("scriptmover", "fx_heal_aoe_bubble_beam_clientfield", 1, 1, "int");
	namespace_1b527536::function_36e0540e(#"heal_aoe", 1, 50, #"hash_37b9ba3f40fc1ba5");
	namespace_1b527536::function_36e0540e(#"hash_379869d5b6da974b", 1, 50, #"hash_4feb54f5041d1609");
	namespace_1b527536::function_36e0540e(#"hash_37986ad5b6da98fe", 1, 50, #"hash_76ed099fde5ea820");
	namespace_1b527536::function_36e0540e(#"hash_37986bd5b6da9ab1", 1, 50, #"hash_4554f3c03465642f");
	namespace_1b527536::function_36e0540e(#"hash_37986cd5b6da9c64", 1, 50, #"hash_35d8042aa3ab475e");
	namespace_1b527536::function_36e0540e(#"hash_37986dd5b6da9e17", 1, 50, #"hash_1fc30bedac3b39a5");
	namespace_1b527536::function_dbd391bf(#"heal_aoe", &function_e190864a);
	namespace_1b527536::function_dbd391bf(#"hash_379869d5b6da974b", &function_1447ebb8);
	namespace_1b527536::function_dbd391bf(#"hash_37986ad5b6da98fe", &function_6ff0a318);
	namespace_1b527536::function_dbd391bf(#"hash_37986bd5b6da9ab1", &function_62280787);
	namespace_1b527536::function_dbd391bf(#"hash_37986cd5b6da9c64", &function_594c75d0);
	namespace_1b527536::function_dbd391bf(#"hash_37986dd5b6da9e17", &function_4a8d5852);
}

/*
	Name: function_910d332f
	Namespace: namespace_32e85820
	Checksum: 0x305C5095
	Offset: 0x5A8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_910d332f()
{
	self.health = self.var_66cb03ad;
	self clientfield::increment_to_player("fx_heal_aoe_player_clientfield", 1);
}

/*
	Name: function_f823ab5e
	Namespace: namespace_32e85820
	Checksum: 0x45D9442C
	Offset: 0x5E8
	Size: 0x1C8
	Parameters: 0
	Flags: Linked
*/
function function_f823ab5e()
{
	foreach(player in getplayers())
	{
		if(player laststand::player_is_in_laststand() || !isalive(player))
		{
			continue;
		}
		if(player.var_66cb03ad - player.health > 100)
		{
			self zm_stats::increment_challenge_stat(#"hash_3b5e5bb023a2f505");
		}
		if(player.health < player.var_66cb03ad)
		{
			level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:"healing_aura_heal_zm", #attacker:self});
			self stats::function_622feb0d(#"heal_aoe", #"hash_6104ccb8b9cd1659", 1);
			self stats::function_6fb0b113(#"heal_aoe", #"hash_6b473078d990e6b2");
		}
		player function_910d332f();
	}
}

/*
	Name: function_e1dad5f7
	Namespace: namespace_32e85820
	Checksum: 0x45BBE27B
	Offset: 0x7B8
	Size: 0x3D8
	Parameters: 0
	Flags: Linked
*/
function function_e1dad5f7()
{
	self.var_9cd2c51d.var_232f5c31 = gettime();
	foreach(player in getplayers())
	{
		if(player == self)
		{
			if(player.var_66cb03ad - player.health > 100)
			{
				self zm_stats::increment_challenge_stat(#"hash_3b5e5bb023a2f505");
			}
			if(player.health < player.var_66cb03ad)
			{
				level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:"healing_aura_heal_zm", #attacker:self});
				self stats::function_622feb0d(#"heal_aoe", #"hash_6104ccb8b9cd1659", 1);
				self stats::function_6fb0b113(#"heal_aoe", #"hash_6b473078d990e6b2");
			}
			player.health = player.var_66cb03ad;
			player clientfield::increment_to_player("fx_heal_aoe_player_clientfield", 1);
			continue;
		}
		if(player laststand::player_is_in_laststand())
		{
			player thread function_5427514f();
			player notify(#"hash_4d93608c4b0fd45a");
			player thread zm_laststand::auto_revive(self);
			level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:"healing_aura_revive_zm", #attacker:self});
			self stats::function_622feb0d(#"heal_aoe", #"hash_359bbe76d1d24148", 1);
			self zm_stats::increment_challenge_stat(#"hash_5f6b0b87e8f76ae1");
			continue;
		}
		if(player.var_66cb03ad - player.health > 100)
		{
			self zm_stats::increment_challenge_stat(#"hash_3b5e5bb023a2f505");
		}
		if(player.health < player.var_66cb03ad)
		{
			level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:"healing_aura_heal_zm", #attacker:self});
			self stats::function_622feb0d(#"heal_aoe", #"hash_6104ccb8b9cd1659", 1);
			self stats::function_6fb0b113(#"heal_aoe", #"hash_6b473078d990e6b2");
		}
		player function_910d332f();
	}
}

/*
	Name: function_5427514f
	Namespace: namespace_32e85820
	Checksum: 0xE92D99C9
	Offset: 0xB98
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function function_5427514f()
{
	self endon(#"death");
	self waittill(#"player_revived");
	self function_910d332f();
}

/*
	Name: function_87d44a60
	Namespace: namespace_32e85820
	Checksum: 0x77651D60
	Offset: 0xBE0
	Size: 0x130
	Parameters: 0
	Flags: Linked
*/
function function_87d44a60()
{
	var_6c77565b = getentitiesinradius(self.origin, 64, 15);
	foreach(zombie in var_6c77565b)
	{
		if(zombie.var_6f84b820 == #"normal")
		{
			zombie zombie_utility::setup_zombie_knockdown(self.origin);
			continue;
		}
		if(zombie.var_6f84b820 == #"special" || zombie.var_6f84b820 == #"elite")
		{
			zombie ai::stun(2);
		}
	}
}

/*
	Name: function_451de831
	Namespace: namespace_32e85820
	Checksum: 0x3E7C9D4A
	Offset: 0xD18
	Size: 0x1DC
	Parameters: 0
	Flags: Linked
*/
function function_451de831()
{
	foreach(player in getplayers())
	{
		var_6c77565b = getentitiesinradius(player.origin, 128, 15);
		foreach(zombie in var_6c77565b)
		{
			if(zombie.var_6f84b820 == #"normal")
			{
				zombie zombie_utility::setup_zombie_knockdown(self);
				continue;
			}
			if(zombie.var_6f84b820 == #"special" || zombie.var_6f84b820 == #"elite")
			{
				zombie.var_3f87fe17 = {#player:self, #stun_time:gettime()};
				zombie ai::stun(2);
			}
		}
	}
}

/*
	Name: function_27b2aab7
	Namespace: namespace_32e85820
	Checksum: 0x23EA8E52
	Offset: 0xF00
	Size: 0x130
	Parameters: 0
	Flags: Linked
*/
function function_27b2aab7()
{
	foreach(player in getplayers())
	{
		if(isalive(player))
		{
			var_bf135e90 = spawn("script_model", player.origin);
			var_bf135e90 setmodel("tag_origin");
			var_bf135e90 linkto(player);
			var_bf135e90 clientfield::increment("fx_heal_aoe_pillar_clientfield");
			var_bf135e90 thread function_4c7c38cb();
		}
	}
}

/*
	Name: function_4c7c38cb
	Namespace: namespace_32e85820
	Checksum: 0x7FFE6898
	Offset: 0x1038
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_4c7c38cb()
{
	level endon(#"game_ended");
	self endon(#"death");
	wait(1);
	self delete();
}

/*
	Name: function_e190864a
	Namespace: namespace_32e85820
	Checksum: 0xF04C4A99
	Offset: 0x1090
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function function_e190864a(params)
{
	self namespace_1b527536::function_460882e2(1);
	function_27b2aab7();
	self function_f823ab5e();
}

/*
	Name: function_1447ebb8
	Namespace: namespace_32e85820
	Checksum: 0x9C4924
	Offset: 0x10E8
	Size: 0xF0
	Parameters: 1
	Flags: Linked
*/
function function_1447ebb8(params)
{
	self namespace_1b527536::function_460882e2(1);
	function_27b2aab7();
	self function_f823ab5e();
	foreach(player in getplayers())
	{
		player thread function_b923a327();
		player thread function_381f09f3();
	}
}

/*
	Name: function_6ff0a318
	Namespace: namespace_32e85820
	Checksum: 0xE68882BC
	Offset: 0x11E0
	Size: 0x104
	Parameters: 1
	Flags: Linked
*/
function function_6ff0a318(params)
{
	self namespace_1b527536::function_460882e2(1);
	function_27b2aab7();
	self function_f823ab5e();
	foreach(player in getplayers())
	{
		player thread function_b923a327();
		player thread function_381f09f3();
	}
	self function_451de831();
}

/*
	Name: function_62280787
	Namespace: namespace_32e85820
	Checksum: 0xAB7EA79B
	Offset: 0x12F0
	Size: 0x104
	Parameters: 1
	Flags: Linked
*/
function function_62280787(params)
{
	self namespace_1b527536::function_460882e2(1);
	function_27b2aab7();
	self thread function_e1dad5f7();
	foreach(player in getplayers())
	{
		player thread function_b923a327();
		player thread function_381f09f3();
	}
	self function_451de831();
}

/*
	Name: function_594c75d0
	Namespace: namespace_32e85820
	Checksum: 0xE21B5180
	Offset: 0x1400
	Size: 0x16C
	Parameters: 1
	Flags: Linked
*/
function function_594c75d0(params)
{
	self namespace_1b527536::function_460882e2(1);
	function_27b2aab7();
	self thread function_e1dad5f7();
	foreach(player in getplayers())
	{
		player thread function_b923a327();
		player thread function_381f09f3();
		if(isdefined(player.armor) && isdefined(player.maxarmor))
		{
			self stats::function_622feb0d(#"heal_aoe", #"hash_541781a552ffd970", 1);
			player.armor = player.maxarmor;
		}
	}
	self function_451de831();
}

/*
	Name: function_4a8d5852
	Namespace: namespace_32e85820
	Checksum: 0x23FE263C
	Offset: 0x1578
	Size: 0x248
	Parameters: 1
	Flags: Linked
*/
function function_4a8d5852(params)
{
	self namespace_1b527536::function_460882e2(1);
	self endon(#"death");
	function_27b2aab7();
	self function_594c75d0(params);
	foreach(player in getplayers())
	{
		var_bf135e90 = spawn("script_model", player.origin);
		var_6af41078 = spawn("script_model", (player.origin[0], player.origin[1], player.origin[2] + 10));
		var_6af41078.angles = vectorscale((1, 0, 0), 270);
		var_bf135e90 setmodel("tag_origin");
		var_6af41078 setmodel("tag_origin");
		var_bf135e90 clientfield::set("fx_heal_aoe_bubble_clientfield", 1);
		var_bf135e90.player = player;
		var_bf135e90 thread function_6f2ddf8e();
		var_bf135e90 thread function_93b178ae();
		var_6af41078 clientfield::set("fx_heal_aoe_bubble_beam_clientfield", 1);
		var_6af41078 thread function_93b178ae();
	}
}

/*
	Name: function_b923a327
	Namespace: namespace_32e85820
	Checksum: 0x902C3B73
	Offset: 0x17C8
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function function_b923a327()
{
	self endon(#"death");
	self flag::increment("zm_field_upgrade_in_use");
	wait(10);
	self flag::decrement("zm_field_upgrade_in_use");
}

/*
	Name: function_381f09f3
	Namespace: namespace_32e85820
	Checksum: 0x18916983
	Offset: 0x1828
	Size: 0xF2
	Parameters: 0
	Flags: Linked
*/
function function_381f09f3()
{
	self endon(#"death");
	self notify("4249748c7a4d4f09");
	self endon("4249748c7a4d4f09");
	count = 0;
	while(count <= 10)
	{
		if(!self laststand::player_is_in_laststand())
		{
			currenthealth = self.health;
			regen_amount = 25;
			if(currenthealth + regen_amount > self.var_66cb03ad)
			{
				regen_amount = self.var_66cb03ad - currenthealth;
			}
			self.health = self.health + regen_amount;
			self clientfield::increment_to_player("fx_heal_aoe_player_clientfield", 1);
		}
		count++;
		wait(1);
	}
}

/*
	Name: function_92297dd0
	Namespace: namespace_32e85820
	Checksum: 0xF77F686B
	Offset: 0x1928
	Size: 0xC8
	Parameters: 2
	Flags: Linked
*/
function function_92297dd0(var_c27b1726, var_c360c10f)
{
	foreach(player in getplayers())
	{
		if(distance2d(var_c360c10f, player.origin) <= 64)
		{
			player function_594c75d0();
		}
	}
}

/*
	Name: function_93b178ae
	Namespace: namespace_32e85820
	Checksum: 0xCD317642
	Offset: 0x19F8
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_93b178ae()
{
	level endon(#"game_ended");
	self endon(#"death");
	wait(10);
	self delete();
}

/*
	Name: function_6f2ddf8e
	Namespace: namespace_32e85820
	Checksum: 0xFDC1A7C3
	Offset: 0x1A50
	Size: 0x6E
	Parameters: 0
	Flags: Linked
*/
function function_6f2ddf8e()
{
	self endon(#"death");
	var_b9403c9 = self.origin;
	while(true)
	{
		function_92297dd0(var_b9403c9, self.player);
		self function_87d44a60();
		wait(1);
	}
}

