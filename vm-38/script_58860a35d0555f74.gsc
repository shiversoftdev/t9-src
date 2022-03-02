#using script_176597095ddfaa17;
#using script_256b8879317373de;
#using script_5bb072c3abf4652c;
#using script_72401f526ba71638;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\battlechatter.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_weapons.gsc;

#namespace namespace_1fd59e39;

/*
	Name: function_380c63f7
	Namespace: namespace_1fd59e39
	Checksum: 0xCC35CD8
	Offset: 0x238
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_380c63f7()
{
	level notify(1698423352);
}

/*
	Name: function_89f2df9
	Namespace: namespace_1fd59e39
	Checksum: 0xC0704401
	Offset: 0x258
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_7fd3c8de50685459", &function_70a657d8, undefined, undefined, #"hash_13a43d760497b54d");
}

/*
	Name: function_70a657d8
	Namespace: namespace_1fd59e39
	Checksum: 0x42611EB3
	Offset: 0x2A8
	Size: 0x2EC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_ff7ae671 = [];
	clientfield::register("allplayers", "" + #"hash_59400ab6cbfaec5d", 1, 1, "int");
	callback::on_spawned(&on_spawned);
	namespace_1b527536::function_36e0540e(#"aether_shroud", 1, 45, "field_upgrade_aether_shroud_item_sr");
	namespace_1b527536::function_36e0540e(#"hash_164c43cbd0ee958", 1, 45, "field_upgrade_aether_shroud_1_item_sr");
	namespace_1b527536::function_36e0540e(#"hash_164c73cbd0eee71", 1, 45, "field_upgrade_aether_shroud_2_item_sr");
	namespace_1b527536::function_36e0540e(#"hash_164c63cbd0eecbe", 1, 45, "field_upgrade_aether_shroud_3_item_sr");
	namespace_1b527536::function_36e0540e(#"hash_164c93cbd0ef1d7", 1, 45, "field_upgrade_aether_shroud_4_item_sr");
	namespace_1b527536::function_36e0540e(#"hash_164c83cbd0ef024", 2, 45, "field_upgrade_aether_shroud_5_item_sr");
	namespace_1b527536::function_dbd391bf(#"aether_shroud", &function_84c43da8);
	namespace_1b527536::function_dbd391bf(#"hash_164c43cbd0ee958", &function_84c43da8);
	namespace_1b527536::function_dbd391bf(#"hash_164c73cbd0eee71", &function_84c43da8);
	namespace_1b527536::function_dbd391bf(#"hash_164c63cbd0eecbe", &function_84c43da8);
	namespace_1b527536::function_dbd391bf(#"hash_164c93cbd0ef1d7", &function_84c43da8);
	namespace_1b527536::function_dbd391bf(#"hash_164c83cbd0ef024", &function_84c43da8);
	level.var_e163165b = [0:#"hash_5dd5741f21fd680d"];
	/#
		level thread function_e41cc86b();
	#/
}

/*
	Name: function_1376ec37
	Namespace: namespace_1fd59e39
	Checksum: 0x5080CA5E
	Offset: 0x5A0
	Size: 0xE8
	Parameters: 2
	Flags: None
*/
function function_1376ec37(v_position, n_radius)
{
	var_f740b763 = {#n_radius:n_radius, #v_position:v_position};
	if(!isdefined(level.var_ff7ae671))
	{
		level.var_ff7ae671 = [];
	}
	else if(!isarray(level.var_ff7ae671))
	{
		level.var_ff7ae671 = array(level.var_ff7ae671);
	}
	if(!isinarray(level.var_ff7ae671, var_f740b763))
	{
		level.var_ff7ae671[level.var_ff7ae671.size] = var_f740b763;
	}
}

/*
	Name: function_83407b23
	Namespace: namespace_1fd59e39
	Checksum: 0x47CB6133
	Offset: 0x690
	Size: 0xC4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_83407b23(v_destination)
{
	foreach(var_f740b763 in level.var_ff7ae671)
	{
		if(distancesquared(v_destination, var_f740b763.v_position) <= sqr(var_f740b763.n_radius))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_e41cc86b
	Namespace: namespace_1fd59e39
	Checksum: 0x36269599
	Offset: 0x760
	Size: 0x13A
	Parameters: 0
	Flags: Private
*/
function private function_e41cc86b()
{
	/#
		self notify("");
		self endon("");
		while(true)
		{
			if(getdvarint(#"hash_3ce5890428b398f1", 0))
			{
				foreach(var_ee6a1fe8 in level.var_ff7ae671)
				{
					sphere(var_ee6a1fe8.v_position, var_ee6a1fe8.n_radius, (1, 0, 0));
					print3d(var_ee6a1fe8.v_position, (("" + var_ee6a1fe8.v_position) + "") + var_ee6a1fe8.n_radius, (0, 1, 0));
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: on_spawned
	Namespace: namespace_1fd59e39
	Checksum: 0xFB7738A2
	Offset: 0x8A8
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function on_spawned()
{
	self.var_b1164fd0 = undefined;
	self clientfield::set("" + #"hash_59400ab6cbfaec5d", 0);
	self val::reset(#"aether_shroud", "ignoreme");
}

/*
	Name: function_4473f9bb
	Namespace: namespace_1fd59e39
	Checksum: 0x2FD8806B
	Offset: 0x918
	Size: 0xAC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4473f9bb(currentweapon)
{
	foreach(weaponname in level.var_e163165b)
	{
		weapon = getweapon(weaponname);
		if(weapon === currentweapon)
		{
			return false;
		}
	}
	return true;
}

/*
	Name: function_84c43da8
	Namespace: namespace_1fd59e39
	Checksum: 0x246804B2
	Offset: 0x9D0
	Size: 0x2AA
	Parameters: 1
	Flags: Linked
*/
function function_84c43da8(params)
{
	self namespace_1b527536::function_460882e2(1);
	self flag::increment("zm_field_upgrade_in_use");
	weapon = params.weapon;
	currentweapon = self getcurrentweapon();
	currentweapon = currentweapon.rootweapon;
	switch(weapon.name)
	{
		case "aether_shroud":
		{
			self thread function_ff022837(5, weapon);
			break;
		}
		case "hash_164c43cbd0ee958":
		{
			self thread function_ff022837(5, weapon);
			if(function_4473f9bb(currentweapon))
			{
				self player::fill_current_clip(1);
			}
			break;
		}
		case "hash_164c73cbd0eee71":
		{
			self thread function_ff022837(8, weapon);
			if(function_4473f9bb(currentweapon))
			{
				self player::fill_current_clip(1);
			}
			break;
		}
		case "hash_164c63cbd0eecbe":
		{
			self thread function_ff022837(8, weapon);
			if(function_4473f9bb(currentweapon))
			{
				self player::fill_current_clip(1);
			}
			self thread function_c5e5e928(500);
			break;
		}
		case "hash_164c83cbd0ef024":
		case "hash_164c93cbd0ef1d7":
		{
			self thread function_ff022837(8, weapon);
			if(function_4473f9bb(currentweapon))
			{
				self player::fill_current_clip(1);
			}
			self thread function_c5e5e928(500);
			self thread function_df6782a4(1.5, 8);
			break;
		}
	}
}

/*
	Name: function_ff022837
	Namespace: namespace_1fd59e39
	Checksum: 0x843BD57B
	Offset: 0xC88
	Size: 0x194
	Parameters: 2
	Flags: Linked
*/
function function_ff022837(n_duration, weapon)
{
	self notify("21c8e38bb4318ab4");
	self endon("21c8e38bb4318ab4");
	self endon(#"disconnect");
	self.var_b1164fd0 = 1;
	self clientfield::set("" + #"hash_59400ab6cbfaec5d", 1);
	self val::set(#"aether_shroud", "ignoreme", 1);
	var_be17187b = undefined;
	var_be17187b = self waittilltimeout(n_duration, #"hash_57d4f53c12705eac", #"death");
	if(var_be17187b._notify != "death")
	{
		self thread battlechatter::play_gadget_success(weapon);
	}
	self.var_b1164fd0 = undefined;
	self clientfield::set("" + #"hash_59400ab6cbfaec5d", 0);
	self val::reset(#"aether_shroud", "ignoreme");
	self flag::decrement("zm_field_upgrade_in_use");
}

/*
	Name: function_c5e5e928
	Namespace: namespace_1fd59e39
	Checksum: 0xE74C80DE
	Offset: 0xE28
	Size: 0x4C4
	Parameters: 1
	Flags: Linked
*/
function function_c5e5e928(var_e14b4254)
{
	if(is_true(self.var_1a4a768c))
	{
		return;
	}
	v_angles = self.angles;
	a_v_points = [];
	for(i = 1; i <= 10; i++)
	{
		var_92848b84 = (i / 10) * var_e14b4254;
		v_point = self getplayercamerapos() + (anglestoforward(v_angles) * var_92848b84);
		v_point = groundtrace(v_point + vectorscale((0, 0, 1), 8), v_point + (vectorscale((0, 0, -1), 100000)), 0, self)[#"position"];
		if(!isdefined(a_v_points))
		{
			a_v_points = [];
		}
		else if(!isarray(a_v_points))
		{
			a_v_points = array(a_v_points);
		}
		a_v_points[a_v_points.size] = v_point;
	}
	if(zm_utility::is_survival())
	{
		for(i = a_v_points.size - 1; i >= 0; i--)
		{
			v_dest = a_v_points[i];
			if(ispointonnavmesh(v_dest, 15) && self util::is_player_looking_at(v_dest, 0.8, 0, self) && !function_83407b23(v_dest))
			{
				v_dest = function_9cc082d2(v_dest, 128);
				if(isdefined(v_dest) && namespace_d0ab5955::function_3824d2dc(v_dest[#"point"]) && function_2e44fb9a(v_dest[#"point"]))
				{
					v_teleport = v_dest[#"point"];
					break;
				}
			}
		}
	}
	else
	{
		for(i = a_v_points.size - 1; i >= 0; i--)
		{
			v_dest = a_v_points[i];
			if(zm_utility::check_point_in_playable_area(v_dest) && zm_utility::check_point_in_enabled_zone(v_dest, 1) && ispointonnavmesh(v_dest, 15) && self util::is_player_looking_at(v_dest, 0.8, 0, self) && !function_83407b23(v_dest))
			{
				v_dest = function_9cc082d2(v_dest, 128);
				if(isdefined(v_dest) && function_2e44fb9a(v_dest[#"point"]))
				{
					v_teleport = v_dest[#"point"];
					break;
				}
			}
		}
	}
	if(isdefined(v_teleport))
	{
		v_dir = v_teleport - self.origin;
		v_dir = (v_dir[0], v_dir[1], 1);
		v_dir = vectornormalize(v_dir);
		self playsound(#"hash_3d03d5d52c39fe35");
		var_dcbe57af = self getvelocity();
		n_length = length(var_dcbe57af);
		var_7bfb3e25 = var_dcbe57af + (v_dir * n_length);
		self dontinterpolate();
		self setorigin(v_teleport);
		self setvelocity(var_7bfb3e25);
	}
}

/*
	Name: function_2e44fb9a
	Namespace: namespace_1fd59e39
	Checksum: 0xC1704FC0
	Offset: 0x12F8
	Size: 0x72
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2e44fb9a(var_ab528fee)
{
	v_trace_start = var_ab528fee + vectorscale((0, 0, 1), 70);
	trace = physicstraceex(v_trace_start, var_ab528fee);
	if(trace[#"fraction"] < 0.99)
	{
		return false;
	}
	return true;
}

/*
	Name: function_df6782a4
	Namespace: namespace_1fd59e39
	Checksum: 0x7378E808
	Offset: 0x1378
	Size: 0xD6
	Parameters: 2
	Flags: Linked
*/
function function_df6782a4(var_77d307ea, n_duration)
{
	self notify("4117bdbb3a12bac1");
	self endon("4117bdbb3a12bac1");
	self endon(#"disconnect");
	var_af6c0f7c = self getmovespeedscale();
	if(!isdefined(self.var_98346cd3))
	{
		self.var_98346cd3 = var_af6c0f7c;
	}
	self setmovespeedscale(var_77d307ea);
	self waittilltimeout(n_duration, #"hash_57d4f53c12705eac");
	self setmovespeedscale(self.var_98346cd3);
	self.var_98346cd3 = undefined;
}

