#using script_340a2e805e35f7a2;
#using script_3a704cbcf4081bfb;
#using script_408211ac7ff6ef56;
#using script_4108035fe400ce67;
#using script_47fb62300ac0bd60;
#using script_68d2ee1489345a1d;
#using script_7fc996fe8678852;
#using script_f11fc6f7a3ad5b9;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_64b2e5a2;

/*
	Name: function_e025a1e5
	Namespace: namespace_64b2e5a2
	Checksum: 0xF39BF30F
	Offset: 0x1D0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e025a1e5()
{
	level notify(1279962477);
}

/*
	Name: function_89f2df9
	Namespace: namespace_64b2e5a2
	Checksum: 0xFB790715
	Offset: 0x1F0
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_6cff6e60e2fa224d", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_64b2e5a2
	Checksum: 0x4BF21164
	Offset: 0x248
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	namespace_8b6a9d79::function_b3464a7c("fishing", &function_29307fae);
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_64b2e5a2
	Checksum: 0x89F9C8CD
	Offset: 0x280
	Size: 0xD4
	Parameters: 0
	Flags: Linked
*/
function function_8ac3bea9()
{
	var_f5ae494f = struct::get_array(#"hash_313be7fccc870cdd", "variantname");
	if(!zm_utility::is_survival() && isdefined(var_f5ae494f) && var_f5ae494f.size > 0)
	{
		level thread function_a225198d(var_f5ae494f[0]);
	}
	callback::add_callback(#"hash_3065435e3005a796", &function_ff1fe53a);
	callback::function_10a4dd0a(&function_10a4dd0a);
}

/*
	Name: function_a225198d
	Namespace: namespace_64b2e5a2
	Checksum: 0x9D168928
	Offset: 0x360
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_a225198d(destination)
{
	level flag::wait_till("start_zombie_round_logic");
	waittillframeend();
	function_43eaec20(destination);
}

/*
	Name: function_43eaec20
	Namespace: namespace_64b2e5a2
	Checksum: 0x55EC7968
	Offset: 0x3B0
	Size: 0xC0
	Parameters: 1
	Flags: Linked
*/
function function_43eaec20(destination)
{
	foreach(location in destination.locations)
	{
		var_2a4db591 = location.instances[#"fishing"];
		if(isdefined(var_2a4db591))
		{
			namespace_8b6a9d79::function_20d7e9c7(var_2a4db591);
		}
	}
}

/*
	Name: function_29307fae
	Namespace: namespace_64b2e5a2
	Checksum: 0x7291B284
	Offset: 0x478
	Size: 0x408
	Parameters: 1
	Flags: Linked
*/
function function_29307fae(struct)
{
	/#
		assert(isstruct(struct), "");
	#/
	spawn_points = struct.var_fe2612fe[#"hash_4f55f52a18ce23d"];
	foreach(point in spawn_points)
	{
		spawn_struct = point;
		var_16129dba = namespace_8b6a9d79::spawn_script_model(spawn_struct, #"p8_wz_ep_fishing_pole", 0);
		var_16129dba clientfield::set("set_compass_icon", 1);
		var_1dfa9e6 = namespace_8b6a9d79::spawn_script_model(spawn_struct, undefined);
		var_1dfa9e6 playloopsound(#"hash_30a2fa81c37f5aff");
		/#
			assert(isdefined(spawn_struct.var_fe2612fe[#"hash_a8d2c2c21149a79"]), "");
		#/
		var_c4b6fa2d = spawn_struct.var_fe2612fe[#"hash_a8d2c2c21149a79"];
		var_cf8192ca = namespace_8b6a9d79::spawn_script_model(var_c4b6fa2d[0], #"hash_dbe95bf7266e66b", 0);
		/#
			assert(isdefined(spawn_struct.var_fe2612fe[#"hash_61b2fec1f617bb75"]), "");
		#/
		var_df283c09 = spawn_struct.var_fe2612fe[#"hash_61b2fec1f617bb75"];
		var_9fadc93c = var_df283c09[0];
		forward = anglestoforward(var_16129dba.angles);
		forward = vectornormalize(forward);
		forward = (forward[0] * 8, forward[1] * 8, forward[2] * 8);
		forward = (forward[0], forward[1], forward[2] + 16);
		trigger = namespace_8b6a9d79::function_214737c7(spawn_struct, &function_e126c567, #"hash_6ca9ecf6df3b77ed", 0, (isdefined(spawn_struct.radius) ? spawn_struct.radius : 94), (isdefined(spawn_struct.height) ? spawn_struct.height : 94), undefined, forward);
		trigger.var_16129dba = var_16129dba;
		trigger.var_cf8192ca = var_cf8192ca;
		trigger.var_9fadc93c = var_9fadc93c;
		trigger.var_1dfa9e6 = var_1dfa9e6;
		var_cf8192ca.var_ccd7223 = var_cf8192ca.origin;
		var_cf8192ca hide();
		playsoundatposition(#"hash_20c4f0485930af2a", struct.origin);
		var_16129dba function_619a5c20();
	}
}

/*
	Name: function_1cbcfab5
	Namespace: namespace_64b2e5a2
	Checksum: 0x8D5D573A
	Offset: 0x888
	Size: 0x1D4
	Parameters: 1
	Flags: Linked
*/
function function_1cbcfab5(player)
{
	if(!isalive(player))
	{
		return false;
	}
	if(player laststand::player_is_in_laststand())
	{
		return false;
	}
	if(is_true(player.is_reviving_any))
	{
		return false;
	}
	if(is_true(player.var_b895a3ff))
	{
		return false;
	}
	if(player function_104d7b4d())
	{
		return false;
	}
	if(player isplayerunderwater())
	{
		return false;
	}
	if(!player isonground())
	{
		return false;
	}
	if(player getstance() == "prone")
	{
		self sethintstring(#"hash_10249865c7d6aeb8");
		return false;
	}
	if(player isswitchingweapons())
	{
		return false;
	}
	currentweapon = player getcurrentweapon();
	if(isdefined(currentweapon) && currentweapon != level.weaponnone)
	{
		if(currentweapon.isdualwield)
		{
			self sethintstring(#"hash_7837638f250e6186");
			return false;
		}
		if(killstreaks::is_killstreak_weapon(currentweapon))
		{
			self sethintstring(#"hash_189973fb11ef10ea");
			return false;
		}
	}
	else
	{
		return false;
	}
	return true;
}

/*
	Name: function_2bf9274
	Namespace: namespace_64b2e5a2
	Checksum: 0xE50D29A0
	Offset: 0xA68
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function function_2bf9274()
{
	self notify("6903aa98af509547");
	self endon("6903aa98af509547");
	self endon(#"death");
	wait(1);
	self sethintstring(#"hash_6ca9ecf6df3b77ed");
}

/*
	Name: function_e126c567
	Namespace: namespace_64b2e5a2
	Checksum: 0xE803B29
	Offset: 0xAD0
	Size: 0x30C
	Parameters: 1
	Flags: Linked
*/
function function_e126c567(eventstruct)
{
	if(!isdefined(self.var_e6e3eca4))
	{
		self.var_e6e3eca4 = 0;
	}
	else if(self.var_e6e3eca4)
	{
		return;
	}
	if(game.state != #"playing")
	{
		return;
	}
	player = eventstruct.activator;
	if(isdefined(self) && (isdefined(self.var_16129dba) && (isdefined(self.var_cf8192ca) && isdefined(self.var_9fadc93c))) && isplayer(player))
	{
		var_a8ad3bed = self function_1cbcfab5(player);
		if(!var_a8ad3bed)
		{
			self thread function_2bf9274();
			self playsoundtoplayer(#"uin_default_action_denied", player);
			return;
		}
		player val::set(#"fishing", "freezecontrols_allowlook", 1);
		self sethintstring("");
		self.var_e6e3eca4 = 1;
		var_16129dba = self.var_16129dba;
		var_cf8192ca = self.var_cf8192ca;
		var_9fadc93c = self.var_9fadc93c;
		var_cf8192ca show();
		var_16129dba hide();
		var_cdef1b0e = var_cf8192ca.origin;
		var_da4747b7 = var_9fadc93c.origin;
		var_9f816ad8 = var_cdef1b0e - var_16129dba.origin;
		var_82bf9f7b = vectortoangles(var_9f816ad8);
		player setplayerangles(var_82bf9f7b);
		var_cf8192ca.origin = var_9fadc93c.origin;
		player namespace_3e3637fc::function_bf51f3cc();
		if(player util::is_female())
		{
			player function_c6775cf9("boast_gone_fishing_fem");
		}
		else
		{
			player function_c6775cf9("boast_gone_fishing");
		}
		var_cf8192ca.var_575ef853 = 0;
		var_cf8192ca thread function_b828bd39(player, var_cdef1b0e);
		player thread function_16e4e507(var_16129dba, var_cf8192ca, self, var_da4747b7);
	}
}

/*
	Name: fake_physicslaunch
	Namespace: namespace_64b2e5a2
	Checksum: 0xDD0EDB34
	Offset: 0xDE8
	Size: 0xA8
	Parameters: 3
	Flags: Linked
*/
function fake_physicslaunch(start_pos, target_pos, power)
{
	dist = distance(start_pos, target_pos);
	time = dist / power;
	delta = target_pos - start_pos;
	up = (0, 0, dist);
	velocity = delta + up;
	self movegravity(velocity, time);
	return time;
}

/*
	Name: function_86edc85c
	Namespace: namespace_64b2e5a2
	Checksum: 0xB985EA11
	Offset: 0xE98
	Size: 0xA6
	Parameters: 2
	Flags: Linked
*/
function function_86edc85c(target_pos, maxwait)
{
	if(!isdefined(maxwait))
	{
		maxwait = 2;
	}
	self endon(#"death");
	var_1dd010d6 = gettime();
	while(true)
	{
		if(self.origin[2] < target_pos[2] || ((float(gettime() - var_1dd010d6)) / 1000) > maxwait)
		{
			break;
		}
		waitframe(1);
	}
}

/*
	Name: function_b828bd39
	Namespace: namespace_64b2e5a2
	Checksum: 0xD1D23168
	Offset: 0xF48
	Size: 0x2A8
	Parameters: 2
	Flags: Linked
*/
function function_b828bd39(player, var_cdef1b0e)
{
	if(!isplayer(player))
	{
		return;
	}
	self endon(#"death", #"hash_6bdfdee9ee47f086");
	player endon(#"death", #"disconnect");
	wait(2.1);
	var_95981760 = self fake_physicslaunch(self.origin, var_cdef1b0e, 120);
	self function_86edc85c(var_cdef1b0e, var_95981760);
	self thread fishing_buoy_splash(var_cdef1b0e);
	self moveto(var_cdef1b0e, 2);
	self waittill(#"movedone");
	self.origin = var_cdef1b0e;
	self.var_3fa8a746 = 0;
	while(player function_15049d95() && !self.var_575ef853)
	{
		time = randomintrange(5, 7);
		wait(time);
		self.var_3fa8a746 = 1;
		player function_bc82f900("fishing_rumble");
		playsoundatposition(#"hash_5784befa5a563866", player.origin);
		self thread fishing_buoy_splash();
		new_pos = self.origin + (vectorscale((0, 0, -1), 5));
		self moveto(new_pos, 0.5);
		self waittill(#"movedone");
		new_pos = self.origin + vectorscale((0, 0, 1), 5);
		self moveto(new_pos, 0.5);
		self waittill(#"movedone");
		self.var_3fa8a746 = 0;
		waitframe(1);
	}
}

/*
	Name: fishing_buoy_splash
	Namespace: namespace_64b2e5a2
	Checksum: 0x66F3F206
	Offset: 0x11F8
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function fishing_buoy_splash(var_e222eb46)
{
	if(isdefined(var_e222eb46))
	{
		var_3cd73ec2 = (var_e222eb46[0], var_e222eb46[1], var_e222eb46[2] + 4);
	}
	else
	{
		var_3cd73ec2 = (self.origin[0], self.origin[1], self.origin[2] + 4);
	}
	playfx(#"hash_3ad34e873c6a533", var_3cd73ec2);
}

/*
	Name: function_16e4e507
	Namespace: namespace_64b2e5a2
	Checksum: 0x3BCE6C1C
	Offset: 0x12A8
	Size: 0x5C4
	Parameters: 4
	Flags: Linked
*/
function function_16e4e507(var_558f00ed, var_886a6495, trigger, var_da4747b7)
{
	self endoncallback(&function_73532e4f, #"death", #"disconnect", #"entering_last_stand");
	self.var_558f00ed = var_558f00ed;
	self.var_886a6495 = var_886a6495;
	self.var_995e72b4 = trigger;
	if(isdefined(trigger.var_1dfa9e6))
	{
		var_1dfa9e6 = trigger.var_1dfa9e6;
	}
	time = gettime();
	var_b4faf38e = 0;
	self zm_equipment::show_hint_text(#"hash_6035867d520cafed");
	while(self function_15049d95())
	{
		if(is_true(self.var_16735873) || self isplayerunderwater() || self stancebuttonpressed() || self jumpbuttonpressed())
		{
			var_bca1290f = 1;
			if(isdefined(var_886a6495))
			{
				var_886a6495 hide();
			}
			self function_7c685040(1);
			break;
		}
		if(self attackbuttonpressed())
		{
			if(isdefined(var_886a6495))
			{
				var_b4faf38e = gettime();
				time_diff = var_b4faf38e - time;
				if(is_true(var_886a6495.var_3fa8a746) && (float(time_diff) / 1000) > 1)
				{
					if(var_886a6495.var_575ef853 === 0)
					{
						var_886a6495.var_575ef853 = 1;
						var_886a6495 function_e8c63c15(self, var_da4747b7, trigger.numuses);
						var_886a6495 hide();
						self function_7c685040();
						break;
					}
				}
				else
				{
					var_886a6495 hide();
					self function_7c685040();
					break;
				}
			}
			waitframe(1);
		}
		if(isdefined(trigger))
		{
			if(distance2d(trigger.origin, self.origin) > 94)
			{
				self function_7c685040();
				break;
			}
		}
		waitframe(1);
	}
	self thread function_a543f4d1();
	self val::reset(#"fishing", "freezecontrols_allowlook");
	if(isdefined(trigger))
	{
		if(!isdefined(trigger.numuses))
		{
			trigger.numuses = 0;
		}
		var_3f9d3194 = getdvarint(#"hash_2501edebf4b8b5d9", 0);
		if(!is_true(var_bca1290f) && !var_3f9d3194)
		{
			trigger.numuses++;
		}
		if(trigger.numuses >= 3)
		{
			if(isdefined(trigger) && (isdefined(var_558f00ed) && isdefined(var_886a6495)))
			{
				var_886a6495 notify(#"hash_6bdfdee9ee47f086");
				trigger deletedelay();
				var_558f00ed clientfield::set("set_compass_icon", 0);
			}
			wait(2);
			if(isdefined(var_558f00ed) && isdefined(var_886a6495))
			{
				var_558f00ed hide();
				playfx(#"hash_6afe37492bc21f7f", var_558f00ed.origin);
				var_558f00ed deletedelay();
				var_886a6495 deletedelay();
			}
			if(isdefined(var_1dfa9e6))
			{
				var_1dfa9e6 deletedelay();
			}
		}
		else if(isdefined(var_886a6495) && isdefined(var_558f00ed))
		{
			wait(1.7);
			if(isdefined(trigger) && (isdefined(var_886a6495) && isdefined(var_558f00ed)))
			{
				trigger.var_e6e3eca4 = 0;
				var_886a6495.var_e6e3eca4 = 0;
				var_886a6495 notify(#"hash_6bdfdee9ee47f086");
				var_886a6495.origin = var_886a6495.var_ccd7223;
				var_886a6495 hide();
				var_558f00ed show();
				trigger sethintstring(#"hash_6ca9ecf6df3b77ed");
			}
		}
	}
}

/*
	Name: function_a543f4d1
	Namespace: namespace_64b2e5a2
	Checksum: 0x800D090B
	Offset: 0x1878
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_a543f4d1()
{
	self endon(#"death");
	wait(1.7);
	self namespace_3e3637fc::function_ec7953fa();
}

/*
	Name: function_73532e4f
	Namespace: namespace_64b2e5a2
	Checksum: 0x62120B5D
	Offset: 0x18B8
	Size: 0x12C
	Parameters: 1
	Flags: Linked
*/
function function_73532e4f(str_notify)
{
	self function_7c685040(1);
	self val::reset(#"fishing", "freezecontrols_allowlook");
	if(isdefined(self.var_558f00ed))
	{
		self.var_558f00ed show();
	}
	if(isdefined(self.var_886a6495))
	{
		self.var_886a6495 notify(#"hash_6bdfdee9ee47f086");
		self.var_886a6495.origin = self.var_886a6495.var_ccd7223;
		self.var_886a6495 hide();
		self.var_886a6495.var_e6e3eca4 = 0;
	}
	if(isdefined(self.var_995e72b4))
	{
		self.var_995e72b4.var_e6e3eca4 = 0;
		self.var_995e72b4 sethintstring(#"hash_6ca9ecf6df3b77ed");
	}
}

/*
	Name: function_e8c63c15
	Namespace: namespace_64b2e5a2
	Checksum: 0xA3D0D028
	Offset: 0x19F0
	Size: 0x350
	Parameters: 3
	Flags: Linked
*/
function function_e8c63c15(player, var_da4747b7, index)
{
	if(!isdefined(index))
	{
		index = 0;
	}
	if(isplayer(player))
	{
		player zm_stats::increment_challenge_stat(#"hash_3a35f1174ff0dfe1");
		var_3cd73ec2 = (self.origin[0], self.origin[1], self.origin[2] + 4);
		playfx(#"hash_3fc2ee8740a6f52", var_3cd73ec2);
		dropstruct = {#angles:self.angles, #origin:self.origin};
		switch(index)
		{
			case 1:
			{
				var_da4747b7 = (var_da4747b7[0], var_da4747b7[1] + 64, var_da4747b7[2]);
				break;
			}
			case 2:
			{
				var_da4747b7 = (var_da4747b7[0], var_da4747b7[1] - 64, var_da4747b7[2]);
				break;
			}
		}
		var_8e313b1c = getdvarint(#"hash_1317b91cdefa1238", 0);
		if(!var_8e313b1c)
		{
			var_8c5bf11f = dropstruct namespace_65181344::function_fd87c780(#"hash_421dc8edd3d4d053", 1, 0);
		}
		if(!isdefined(var_8c5bf11f) || var_8c5bf11f.size === 0 || var_8e313b1c)
		{
			model = util::spawn_model(#"hash_6290596be2341e21", dropstruct.origin, dropstruct.angles);
			playfxontag(#"hash_20b3d352fb23155c", model, "tag_origin");
			model thread function_c5c1b1fe(self.origin, var_da4747b7, player, 1);
		}
		else
		{
			foreach(dropitem in var_8c5bf11f)
			{
				dropitem.var_864ea466 = 1;
				dropitem.var_a5626281 = 1;
				dropitem thread function_c5c1b1fe(self.origin, var_da4747b7, player);
			}
		}
	}
}

/*
	Name: function_10a4dd0a
	Namespace: namespace_64b2e5a2
	Checksum: 0xCED9BE3B
	Offset: 0x1D48
	Size: 0xAC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_10a4dd0a(params)
{
	if(isplayer(self))
	{
		e_player = self;
	}
	else
	{
		e_player = params.player;
	}
	if(isplayer(e_player) && is_true(params.item.var_a5626281))
	{
		e_player zm_stats::function_7ec42fbf(#"hash_3c5a993c0208d6a6");
	}
}

/*
	Name: function_c5c1b1fe
	Namespace: namespace_64b2e5a2
	Checksum: 0x6B638E26
	Offset: 0x1E00
	Size: 0x162
	Parameters: 4
	Flags: Linked
*/
function function_c5c1b1fe(start_pos, end_pos, player, var_ecf3bd81)
{
	if(!isdefined(var_ecf3bd81))
	{
		var_ecf3bd81 = 0;
	}
	self endon(#"death");
	player = (player[0], player[1], player[2] + 4);
	var_22fb8377 = self fake_physicslaunch(end_pos, player, 200);
	wait(1);
	timepassed = gettime();
	while(self.origin[2] > player[2] && ((float(gettime() - timepassed)) / 1000) < var_22fb8377)
	{
		waitframe(1);
	}
	time = self namespace_b637a3ed::drop_item(0, player, (0, 0, 0), 2);
	wait(time);
	if(var_ecf3bd81)
	{
		self thread function_eaa298d9();
	}
	else
	{
		self.var_864ea466 = undefined;
	}
}

/*
	Name: function_eaa298d9
	Namespace: namespace_64b2e5a2
	Checksum: 0x508B417D
	Offset: 0x1F70
	Size: 0x16C
	Parameters: 0
	Flags: Linked
*/
function function_eaa298d9()
{
	self endon(#"death");
	wait(1);
	var_3a1904d3 = function_9cc082d2(self.origin, 32);
	if(isdefined(var_3a1904d3) && isdefined(var_3a1904d3[#"point"]))
	{
		navmeshposition = var_3a1904d3[#"point"];
		var_9905e63e = spawnstruct();
		var_9905e63e.origin = navmeshposition;
		boot = namespace_be0f9d50::spawn_prop(var_9905e63e, undefined, #"hash_6290596be2341e21", 1);
		var_a6fe91fd = [];
		if(!isdefined(var_a6fe91fd))
		{
			var_a6fe91fd = [];
		}
		else if(!isarray(var_a6fe91fd))
		{
			var_a6fe91fd = array(var_a6fe91fd);
		}
		var_a6fe91fd[var_a6fe91fd.size] = boot;
		namespace_be0f9d50::function_55657fb4(undefined, boot, var_a6fe91fd);
	}
	self deletedelay();
}

/*
	Name: function_ff1fe53a
	Namespace: namespace_64b2e5a2
	Checksum: 0x2B580456
	Offset: 0x20E8
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_ff1fe53a(params)
{
	if(!isplayer(params.player) || !params.player function_15049d95())
	{
		return;
	}
	params.player function_7c685040();
}

