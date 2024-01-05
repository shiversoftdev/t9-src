#using scripts\zm_common\zm_utility.gsc;
#using script_72401f526ba71638;
#using script_62caa307a394c18c;
#using scripts\zm_common\zm_equipment.gsc;
#using script_24c32478acf44108;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_9111e6ab;

/*
	Name: function_1c86fe80
	Namespace: namespace_9111e6ab
	Checksum: 0x3EE96DF6
	Offset: 0x190
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_1c86fe80()
{
	level notify(1068059420);
}

/*
	Name: __init__system__
	Namespace: namespace_9111e6ab
	Checksum: 0x6AE7243C
	Offset: 0x1B0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_6c156e681484d01a", &function_70a657d8, undefined, undefined, #"hash_13a43d760497b54d");
}

/*
	Name: function_70a657d8
	Namespace: namespace_9111e6ab
	Checksum: 0x5A23AD78
	Offset: 0x200
	Size: 0x3E4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("allplayers", "" + #"hash_1668fcf85f7c231", 1, 2, "int");
	clientfield::register("actor", "" + #"hash_70a85ea8b0e1b09c", 1, 2, "int");
	namespace_1b527536::function_36e0540e(#"hash_148e5880a4f4d46f", 1, 50, #"hash_7bf08605b9c71df5");
	namespace_1b527536::function_36e0540e(#"hash_3d62b9c92bbca893", 1, 50, #"hash_4164e3a7de7df719");
	namespace_1b527536::function_36e0540e(#"hash_3d62bac92bbcaa46", 1, 50, #"hash_3cc62f6f8109f930");
	namespace_1b527536::function_36e0540e(#"hash_3d62bbc92bbcabf9", 1, 50, #"hash_5321b5f240c2937f");
	namespace_1b527536::function_36e0540e(#"hash_3d62bcc92bbcadac", 1, 50, #"hash_23f397bb4a5a35ee");
	namespace_1b527536::function_36e0540e(#"hash_3d62bdc92bbcaf5f", 1, 50, #"hash_1598b77b28777bb5");
	namespace_1b527536::function_dbd391bf(#"hash_148e5880a4f4d46f", &function_913fe266);
	namespace_1b527536::function_dbd391bf(#"hash_3d62b9c92bbca893", &function_913fe266);
	namespace_1b527536::function_dbd391bf(#"hash_3d62bac92bbcaa46", &function_913fe266);
	namespace_1b527536::function_dbd391bf(#"hash_3d62bbc92bbcabf9", &function_913fe266);
	namespace_1b527536::function_dbd391bf(#"hash_3d62bcc92bbcadac", &function_913fe266);
	namespace_1b527536::function_dbd391bf(#"hash_3d62bdc92bbcaf5f", &function_913fe266);
	zm_equipment::function_76beede2(#"hash_148e5880a4f4d46f", "MOD_ELECTROCUTED");
	zm_equipment::function_76beede2(#"hash_3d62b9c92bbca893", "MOD_ELECTROCUTED");
	zm_equipment::function_76beede2(#"hash_3d62bac92bbcaa46", "MOD_ELECTROCUTED");
	zm_equipment::function_76beede2(#"hash_3d62bbc92bbcabf9", "MOD_ELECTROCUTED");
	zm_equipment::function_76beede2(#"hash_3d62bcc92bbcadac", "MOD_ELECTROCUTED");
	zm_equipment::function_76beede2(#"hash_3d62bdc92bbcaf5f", "MOD_ELECTROCUTED");
}

/*
	Name: function_913fe266
	Namespace: namespace_9111e6ab
	Checksum: 0x1CE89C83
	Offset: 0x5F0
	Size: 0x10C
	Parameters: 1
	Flags: Linked
*/
function function_913fe266(params)
{
	self namespace_1b527536::function_460882e2(1);
	var_9cec4bff = 100;
	var_53a5b34d = 400;
	switch(params.weapon.name)
	{
		case "hash_148e5880a4f4d46f":
		case "hash_3d62b9c92bbca893":
		{
			var_91a257a3 = 10;
			break;
		}
		case "hash_3d62bac92bbcaa46":
		case "hash_3d62bbc92bbcabf9":
		case "hash_3d62bcc92bbcadac":
		case "hash_3d62bdc92bbcaf5f":
		{
			var_91a257a3 = 15;
			break;
		}
	}
	self thread function_1e0fa475(params.weapon, var_9cec4bff, var_53a5b34d, var_91a257a3);
}

/*
	Name: function_1e0fa475
	Namespace: namespace_9111e6ab
	Checksum: 0x961A69AE
	Offset: 0x708
	Size: 0x59E
	Parameters: 4
	Flags: Linked
*/
function function_1e0fa475(weapon, var_2b003a39, var_5baceff5, n_duration)
{
	self.var_60b31640 = 1;
	var_e041507a = self getentitynumber();
	if(is_true(self.var_23fa23a9))
	{
		self.var_23fa23a9 = undefined;
		self clientfield::set("" + #"hash_1668fcf85f7c231", 0);
		self function_7b69ae3f();
		util::wait_network_frame();
		if(!isdefined(self))
		{
			return;
		}
	}
	self flag::increment("zm_field_upgrade_in_use");
	self function_65e5989c(weapon);
	self clientfield::set("" + #"hash_1668fcf85f7c231", 1);
	util::wait_network_frame();
	while(isalive(self) && !self laststand::player_is_in_laststand() && !self scene::is_igc_active() && n_duration > 0)
	{
		var_281b41ca = function_a1ef346b(self.team, self.origin, var_5baceff5);
		foreach(player in var_281b41ca)
		{
			if(player === self)
			{
				continue;
			}
			if(self function_6c7755f9(player))
			{
				player thread function_5bcee875(self, weapon, var_5baceff5, var_2b003a39);
				continue;
			}
			if(self function_6c7755f9(player, 1))
			{
				player.var_23fa23a9 = 1;
				player clientfield::set("" + #"hash_1668fcf85f7c231", 3);
				continue;
			}
			if(is_true(player.var_60b31640))
			{
				player clientfield::set("" + #"hash_1668fcf85f7c231", 1);
				player.var_23fa23a9 = undefined;
			}
		}
		/#
			if(getdvarint(#"hash_3ce5890428b398f1", 0))
			{
				circle(self.origin, var_2b003a39, (1, 0, 0), undefined, 1);
				circle(self.origin, var_5baceff5, (0, 1, 0), undefined, 1);
			}
		#/
		a_enemies = self getenemiesinradius(self.origin, var_5baceff5);
		foreach(ai in a_enemies)
		{
			if(ai function_165a06f0(self, var_2b003a39, var_5baceff5, weapon))
			{
				ai thread function_c79f4bd7(weapon, self, self);
			}
		}
		waitframe(1);
		n_duration = n_duration - (float(function_60d95f53()) / 1000);
	}
	if(isdefined(self))
	{
		self flag::decrement("zm_field_upgrade_in_use");
		self.var_60b31640 = undefined;
		self clientfield::set("" + #"hash_1668fcf85f7c231", 0);
		self util::delay(2, [1:#"hash_2873117ec68db93c", 0:"disconnect"], &function_7b69ae3f);
		util::wait_network_frame();
		if(isdefined(self))
		{
			self.var_23fa23a9 = undefined;
		}
	}
}

/*
	Name: function_5bcee875
	Namespace: namespace_9111e6ab
	Checksum: 0x63ADB39E
	Offset: 0xCB0
	Size: 0x3F4
	Parameters: 4
	Flags: Linked
*/
function function_5bcee875(player_source, weapon, var_5baceff5, var_2b003a39)
{
	self.var_23fa23a9 = 1;
	self clientfield::set("" + #"hash_1668fcf85f7c231", 2);
	self function_65e5989c(weapon);
	var_e041507a = player_source getentitynumber();
	var_e42a877c = 0;
	var_a01d6a1b = randomintrange(10, 15);
	util::wait_network_frame();
	while(isalive(self) && isalive(player_source) && is_true(self.var_23fa23a9) && !self laststand::player_is_in_laststand() && !player_source laststand::player_is_in_laststand() && is_true(player_source.var_60b31640) && !self scene::is_igc_active() && !player_source scene::is_igc_active() && distance(self.origin, player_source.origin) <= var_5baceff5)
	{
		/#
			if(getdvarint(#"hash_3ce5890428b398f1", 0))
			{
				circle(self.origin, var_2b003a39, (1, 0, 0), undefined, 1);
			}
		#/
		a_enemies = self getenemiesinradius(self.origin, var_5baceff5);
		foreach(ai in a_enemies)
		{
			if(ai function_165a06f0(self, var_2b003a39, var_5baceff5, weapon))
			{
				ai thread function_c79f4bd7(weapon, self, player_source);
			}
		}
		var_e42a877c++;
		if((var_e42a877c % var_a01d6a1b) == 0)
		{
			if(!player_source function_6c7755f9(self, undefined, 0))
			{
				break;
			}
			var_79b05a2b = 0;
			var_a01d6a1b = randomintrange(10, 15);
		}
		waitframe(1);
	}
	if(isdefined(self))
	{
		self.var_23fa23a9 = undefined;
		self clientfield::set("" + #"hash_1668fcf85f7c231", 0);
		self util::delay(2, [1:#"hash_2873117ec68db93c", 0:"disconnect"], &function_7b69ae3f);
	}
}

/*
	Name: function_65e5989c
	Namespace: namespace_9111e6ab
	Checksum: 0x7FD343A4
	Offset: 0x10B0
	Size: 0xEA
	Parameters: 1
	Flags: Linked
*/
function function_65e5989c(weapon)
{
	if(weapon.name === #"hash_3d62bcc92bbcadac" || weapon.name === #"hash_3d62bdc92bbcaf5f")
	{
		self function_7b69ae3f();
		var_e3ad032b = self getmovespeedscale() + (self getmovespeedscale() * 0.25);
		self notify(#"hash_2873117ec68db93c");
		self val::set(#"hash_148e5880a4f4d46f", "move_speed_scale", var_e3ad032b);
		self.var_11994308 = 1;
	}
}

/*
	Name: function_7b69ae3f
	Namespace: namespace_9111e6ab
	Checksum: 0x24E7A98
	Offset: 0x11A8
	Size: 0x36
	Parameters: 0
	Flags: Linked
*/
function function_7b69ae3f()
{
	self val::reset(#"hash_148e5880a4f4d46f", "move_speed_scale");
	self.var_11994308 = undefined;
}

/*
	Name: function_165a06f0
	Namespace: namespace_9111e6ab
	Checksum: 0xDD479A84
	Offset: 0x11E8
	Size: 0x470
	Parameters: 4
	Flags: Linked
*/
function function_165a06f0(player_source, var_2b003a39, var_5baceff5, weapon)
{
	if(isactor(self) && isalive(self) && !self flag::get(#"hash_6ab8e3db32b20d33") && isalive(player_source) && !player_source laststand::player_is_in_laststand() && self.team === level.zombie_team && !is_true(self.var_c8065bf4) && !is_true(self.var_8576e0be))
	{
		if(self.var_6f84b820 === #"boss")
		{
			return false;
		}
		if(self.var_6f84b820 === #"elite")
		{
			switch(weapon.name)
			{
				case "hash_148e5880a4f4d46f":
				case "hash_3d62b9c92bbca893":
				case "hash_3d62bac92bbcaa46":
				case "hash_3d62bbc92bbcabf9":
				case "hash_3d62bcc92bbcadac":
				{
					return false;
				}
			}
		}
		else if(self.var_6f84b820 === #"special")
		{
			switch(weapon.name)
			{
				case "hash_148e5880a4f4d46f":
				case "hash_3d62b9c92bbca893":
				case "hash_3d62bac92bbcaa46":
				{
					return false;
				}
			}
		}
		if(distance(self.origin, player_source.origin) < var_2b003a39)
		{
			return true;
		}
		if(is_true(player_source.var_60b31640))
		{
			var_281b41ca = function_a1ef346b(player_source.team, player_source.origin, var_5baceff5);
			foreach(player in var_281b41ca)
			{
				if(player == player_source || !is_true(player.var_23fa23a9))
				{
					continue;
				}
				v_start_pos = player_source gettagorigin("j_spineupper");
				v_end_pos = player gettagorigin("j_spineupper");
				if(!(isdefined(v_start_pos) && isdefined(v_end_pos)))
				{
					continue;
				}
				var_5e6f4f75 = math::closest_point_on_line(self.origin, v_start_pos, v_end_pos);
				var_ac1f5773 = self getcentroid();
				var_790ce634 = distance(var_ac1f5773, var_5e6f4f75) <= 25;
				if(var_790ce634)
				{
					/#
						if(getdvarint(#"hash_3ce5890428b398f1", 0))
						{
							line(v_start_pos, v_end_pos, (0, 0, 1), undefined, 20);
						}
					#/
					return true;
				}
			}
		}
	}
	return false;
}

/*
	Name: function_6c7755f9
	Namespace: namespace_9111e6ab
	Checksum: 0x9CC79301
	Offset: 0x1660
	Size: 0x1CE
	Parameters: 3
	Flags: Linked
*/
function function_6c7755f9(player, var_347c484e, var_6f40c449)
{
	if(!isdefined(var_347c484e))
	{
		var_347c484e = 0;
	}
	if(!isdefined(var_6f40c449))
	{
		var_6f40c449 = 1;
	}
	var_38e2a777 = self gettagorigin("j_spineupper");
	var_4985c8bd = player gettagorigin("j_spineupper");
	if(!self isinvehicle() && !player isinvehicle() && (!var_6f40c449 || !is_true(player.var_23fa23a9)) && !self scene::is_igc_active() && !player scene::is_igc_active() && !self laststand::player_is_in_laststand() && !player laststand::player_is_in_laststand() && (isdefined(var_38e2a777) && isdefined(var_4985c8bd)) && beamtrace(var_38e2a777, var_4985c8bd, 0, self, 1, 1, player)[#"fraction"] === 1)
	{
		if(var_347c484e)
		{
			return true;
		}
		if(!is_true(player.var_60b31640))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_c79f4bd7
	Namespace: namespace_9111e6ab
	Checksum: 0x23AC3B47
	Offset: 0x1838
	Size: 0x50C
	Parameters: 3
	Flags: Linked
*/
function function_c79f4bd7(weapon, player_source, var_15625d6b)
{
	self endon(#"death");
	if(!isdefined(var_15625d6b))
	{
		var_15625d6b = player_source;
	}
	if(!self flag::get(#"hash_6ab8e3db32b20d33"))
	{
		switch(weapon.name)
		{
			case "hash_148e5880a4f4d46f":
			{
				var_da4a3267 = self.maxhealth * 0.1;
				break;
			}
			case "hash_3d62b9c92bbca893":
			{
				var_da4a3267 = self.maxhealth * 0.2;
				break;
			}
			case "hash_3d62bac92bbcaa46":
			{
				var_da4a3267 = self.maxhealth * 0.2;
				break;
			}
			case "hash_3d62bbc92bbcabf9":
			{
				var_da4a3267 = self.maxhealth * 0.2;
				var_34e3b3f7 = self.maxhealth * 0.1;
				break;
			}
			case "hash_3d62bcc92bbcadac":
			{
				var_da4a3267 = self.maxhealth * 0.2;
				var_34e3b3f7 = self.maxhealth * 0.1;
				break;
			}
			case "hash_3d62bdc92bbcaf5f":
			{
				var_da4a3267 = self.maxhealth * 0.2;
				var_34e3b3f7 = self.maxhealth * 0.1;
				var_19ba813e = self.maxhealth * 0.05;
				break;
			}
		}
		if(self.var_6f84b820 === #"elite")
		{
			var_70ab6bc = var_19ba813e;
			n_clientfield = 3;
		}
		else
		{
			if(self.var_6f84b820 === #"special")
			{
				var_70ab6bc = var_34e3b3f7;
				n_clientfield = 2;
			}
			else if(self.var_6f84b820 === #"normal")
			{
				var_70ab6bc = var_da4a3267;
				n_clientfield = 1;
			}
		}
		if(!isdefined(var_70ab6bc))
		{
			return;
		}
		self flag::set(#"hash_6ab8e3db32b20d33");
		if(!isdefined(level.var_cef2e607[#"hash_13c4587dc27db042"]))
		{
			level.var_cef2e607[#"hash_13c4587dc27db042"] = -1;
		}
		level.var_cef2e607[#"hash_13c4587dc27db042"]++;
		wait((float(function_60d95f53()) / 1000) * ((level.var_cef2e607[#"hash_13c4587dc27db042"] % (int((float(function_60d95f53()) / 1000) / (float(function_60d95f53()) / 1000)))) + 1));
		if(isdefined(var_70ab6bc) && isdefined(n_clientfield) && isalive(player_source) && isalive(var_15625d6b))
		{
			self.var_5f6261a5 = var_15625d6b;
			self clientfield::set("" + #"hash_70a85ea8b0e1b09c", n_clientfield);
			scoreevents::processscoreevent("tesla_storm_stun_zm", var_15625d6b, self, weapon);
			self ai::stun(1);
			self namespace_42457a0::function_601fabe9(#"electrical", var_70ab6bc, player_source.origin, var_15625d6b, var_15625d6b, "none", "MOD_ELECTROCUTED", 0, weapon);
			wait(1);
		}
		self.var_5f6261a5 = undefined;
		self flag::clear(#"hash_6ab8e3db32b20d33");
		self clientfield::set("" + #"hash_70a85ea8b0e1b09c", 0);
	}
}

