#using script_13da4e6b98ca81a1;
#using script_50cd53b603b30ef5;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\renderoverridebundle.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace killstreak_detect;

/*
	Name: function_81a1f33f
	Namespace: killstreak_detect
	Checksum: 0x405312CA
	Offset: 0x188
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_81a1f33f()
{
	level notify(1305467303);
}

/*
	Name: function_89f2df9
	Namespace: killstreak_detect
	Checksum: 0x5575F5A5
	Offset: 0x1A8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"killstreak_detect", &init_shared, undefined, undefined, #"killstreaks");
}

/*
	Name: init_shared
	Namespace: killstreak_detect
	Checksum: 0x43F8F517
	Offset: 0x1F8
	Size: 0x29C
	Parameters: 0
	Flags: Linked
*/
function init_shared()
{
	if(!isdefined(level.var_c662dc2d))
	{
		level.var_c662dc2d = {};
		callback::on_localplayer_spawned(&watch_killstreak_detect_perks_changed);
		clientfield::register("scriptmover", "enemyvehicle", 1, 2, "int", &enemyscriptmovervehicle_changed, 0, 0);
		clientfield::register("vehicle", "enemyvehicle", 1, 2, "int", &enemyvehicle_changed, 0, 1);
		clientfield::register("missile", "enemyvehicle", 1, 2, "int", &enemymissilevehicle_changed, 0, 1);
		clientfield::register("actor", "enemyvehicle", 1, 2, "int", &function_430c370a, 0, 1);
		clientfield::register("vehicle", "vehicletransition", 1, 1, "int", &vehicle_transition, 0, 1);
		if(!isdefined(level.enemyvehicles))
		{
			level.enemyvehicles = [];
		}
		if(!isdefined(level.enemymissiles))
		{
			level.enemymissiles = [];
		}
		if(!isdefined(level.var_51afeae4))
		{
			level.var_51afeae4 = [];
		}
		level.emp_killstreaks = [];
		if(0)
		{
			renderoverridebundle::function_f72f089c(#"hash_7d4b6b0d84ddafa3", #"friendly", (sessionmodeiscampaigngame() ? #"hash_461520942fd1154d" : #"rob_sonar_set_friendlyequip_mp"), &function_95f96f3e);
		}
		function_8ac48939(level.killstreakcorebundle);
	}
}

/*
	Name: function_95f96f3e
	Namespace: killstreak_detect
	Checksum: 0xA69067BA
	Offset: 0x4A0
	Size: 0xF2
	Parameters: 3
	Flags: Linked
*/
function function_95f96f3e(local_client_num, bundle, param)
{
	if(!self function_e9fc6a64())
	{
		return false;
	}
	if(codcaster::function_b8fe9b52(param))
	{
		return false;
	}
	if(self.type === "vehicle" && self function_979020fe())
	{
		return false;
	}
	if(isdefined(level.vision_pulse) && is_true(level.vision_pulse[param]))
	{
		return false;
	}
	player = function_5c10bd79(param);
	if(self == player)
	{
		return false;
	}
	return true;
}

/*
	Name: function_7181329a
	Namespace: killstreak_detect
	Checksum: 0x42E64EF7
	Offset: 0x5A0
	Size: 0x114
	Parameters: 1
	Flags: Linked
*/
function function_7181329a(entity)
{
	if(isplayer(entity))
	{
		return false;
	}
	if(entity.type != "missile" && entity.type != "vehicle" && entity.type != "scriptmover" && entity.type != "actor")
	{
		return false;
	}
	if(self clientfield::get("enemyvehicle") != 0)
	{
		return true;
	}
	if(entity.type != "actor" && self.type !== "vehicle" && self clientfield::get("enemyequip") != 0)
	{
		return true;
	}
	return false;
}

/*
	Name: function_d63aa49b
	Namespace: killstreak_detect
	Checksum: 0x92F5C381
	Offset: 0x6C0
	Size: 0x116
	Parameters: 2
	Flags: Linked
*/
function function_d63aa49b(local_client_num, bundle)
{
	if(self function_e9fc6a64())
	{
		return false;
	}
	if(codcaster::function_b8fe9b52(bundle))
	{
		return false;
	}
	if(self.type === "vehicle")
	{
		if(self function_4add50a7())
		{
			return false;
		}
		if(!function_97980fde(bundle, self))
		{
			return false;
		}
	}
	if(self.isbreachingfirewall === 1)
	{
		return false;
	}
	player = function_5c10bd79(bundle);
	if(player.var_33b61b6f === 1 && self flag::get(#"enemy") !== 1)
	{
		return true;
	}
	return false;
}

/*
	Name: function_903bbed3
	Namespace: killstreak_detect
	Checksum: 0xA60AFF0D
	Offset: 0x7E0
	Size: 0xF8
	Parameters: 2
	Flags: Linked
*/
function function_903bbed3(local_client_num, bundle)
{
	if(self function_e9fc6a64())
	{
		return false;
	}
	if(codcaster::function_b8fe9b52(bundle))
	{
		return false;
	}
	if(self.type === "vehicle" && self function_4add50a7())
	{
		return false;
	}
	if(isdefined(self.isbreachingfirewall) && self.isbreachingfirewall == 1)
	{
		return false;
	}
	if(function_5778f82(bundle, #"specialty_showenemyvehicles") && !isplayer(self) && function_7181329a(self))
	{
		return true;
	}
	return false;
}

/*
	Name: function_d859c344
	Namespace: killstreak_detect
	Checksum: 0x9139CBE5
	Offset: 0x8E0
	Size: 0x224
	Parameters: 2
	Flags: Linked
*/
function function_d859c344(local_client_num, newval)
{
	if(self.weapon.name === #"uav" || self.weapon.name === #"counteruav")
	{
		var_fd9de919 = function_9b3f0ed1(newval);
		if(self.team === var_fd9de919)
		{
			return;
		}
	}
	bundle = self killstreak_bundles::function_48e9536e();
	if(!isdefined(bundle))
	{
		bundle = level.killstreakcorebundle;
	}
	if(isdefined(bundle))
	{
		var_872807f = bundle.("ksROBShowFriendly");
		if(is_true(var_872807f) && 0)
		{
			self renderoverridebundle::function_c8d97b8e(newval, #"friendly", bundle.var_d3413870 + "friendly");
		}
		show_enemy = bundle.("ksROBShowEnemy");
		if(is_true(show_enemy))
		{
			self renderoverridebundle::function_c8d97b8e(newval, #"enemy", bundle.var_d3413870 + "enemy");
		}
	}
	else if(0)
	{
		self renderoverridebundle::function_c8d97b8e(newval, #"friendly", #"hash_7d4b6b0d84ddafa3");
	}
	self renderoverridebundle::function_c8d97b8e(newval, #"rob_sonar_set_enemy", #"hash_6a966793a191bc8c");
}

/*
	Name: vehicle_transition
	Namespace: killstreak_detect
	Checksum: 0xD3349CCE
	Offset: 0xB10
	Size: 0x84
	Parameters: 7
	Flags: Linked
*/
function vehicle_transition(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	function_d859c344(local_client_num, newval);
	if(isdefined(level.var_7cc76271))
	{
		[[level.var_7cc76271]](local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump);
	}
}

/*
	Name: should_set_compass_icon
	Namespace: killstreak_detect
	Checksum: 0xB7A4B712
	Offset: 0xBA0
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function should_set_compass_icon(local_client_num)
{
	return self function_ca024039() || function_5778f82(local_client_num, #"specialty_showenemyvehicles");
}

/*
	Name: enemyscriptmovervehicle_changed
	Namespace: killstreak_detect
	Checksum: 0xA971F51
	Offset: 0xBF0
	Size: 0xD4
	Parameters: 7
	Flags: Linked
*/
function enemyscriptmovervehicle_changed(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(isdefined(level.scriptmovercompassicons) && isdefined(self.model))
	{
		if(isdefined(level.scriptmovercompassicons[self.model]))
		{
			if(self should_set_compass_icon(local_client_num))
			{
				self setcompassicon(level.scriptmovercompassicons[self.model]);
			}
		}
	}
	enemyvehicle_changed(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump);
}

/*
	Name: enemymissilevehicle_changed
	Namespace: killstreak_detect
	Checksum: 0xF7151CB7
	Offset: 0xCD0
	Size: 0xD4
	Parameters: 7
	Flags: Linked
*/
function enemymissilevehicle_changed(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(isdefined(level.missilecompassicons) && isdefined(self.weapon))
	{
		if(isdefined(level.missilecompassicons[self.weapon]))
		{
			if(self should_set_compass_icon(local_client_num))
			{
				self setcompassicon(level.missilecompassicons[self.weapon]);
			}
		}
	}
	enemymissile_changed(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump);
}

/*
	Name: enemymissile_changed
	Namespace: killstreak_detect
	Checksum: 0x30C9A078
	Offset: 0xDB0
	Size: 0x74
	Parameters: 7
	Flags: Linked
*/
function enemymissile_changed(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self updateteammissiles(fieldname, bwastimejump);
	self util::add_remove_list(level.enemymissiles, bwastimejump);
}

/*
	Name: enemyvehicle_changed
	Namespace: killstreak_detect
	Checksum: 0x6122C093
	Offset: 0xE30
	Size: 0x1A4
	Parameters: 7
	Flags: Linked
*/
function enemyvehicle_changed(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(isdefined(level.draftstage) && (level.draftstage > 0 || is_true(level.var_8c099032)))
	{
		self function_d05902d9(fieldname, bwastimejump);
		return;
	}
	self updateteamvehicles(fieldname, bwastimejump);
	self util::add_remove_list(level.enemyvehicles, bwastimejump);
	self updateenemyvehicles(fieldname, bwastimejump);
	if(isdefined(self.model) && self.model == "wpn_t7_turret_emp_core" && self.type === "vehicle")
	{
		if(!isdefined(level.emp_killstreaks))
		{
			level.emp_killstreaks = [];
		}
		else if(!isarray(level.emp_killstreaks))
		{
			level.emp_killstreaks = array(level.emp_killstreaks);
		}
		level.emp_killstreaks[level.emp_killstreaks.size] = self;
	}
}

/*
	Name: function_430c370a
	Namespace: killstreak_detect
	Checksum: 0x69DA88B9
	Offset: 0xFE0
	Size: 0xD4
	Parameters: 7
	Flags: Linked
*/
function function_430c370a(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(isdefined(level.draftstage) && (level.draftstage > 0 || is_true(level.var_8c099032)))
	{
		self function_f27ffe49(fieldname, bwastimejump);
		return;
	}
	self util::add_remove_list(level.var_51afeae4, bwastimejump);
	self function_f884010a(fieldname, bwastimejump);
}

/*
	Name: updateteamvehicles
	Namespace: killstreak_detect
	Checksum: 0x4A16A5A0
	Offset: 0x10C0
	Size: 0x2C
	Parameters: 2
	Flags: Linked
*/
function updateteamvehicles(local_client_num, newval)
{
	self checkteamvehicles(newval);
}

/*
	Name: updateteammissiles
	Namespace: killstreak_detect
	Checksum: 0xB62EA5D0
	Offset: 0x10F8
	Size: 0x2C
	Parameters: 2
	Flags: Linked
*/
function updateteammissiles(local_client_num, newval)
{
	self checkteammissiles(newval);
}

/*
	Name: function_f884010a
	Namespace: killstreak_detect
	Checksum: 0x76C7D632
	Offset: 0x1130
	Size: 0x34
	Parameters: 2
	Flags: Linked
*/
function function_f884010a(local_client_num, newval)
{
	if(!isdefined(self))
	{
		return;
	}
	function_d859c344(local_client_num, newval);
}

/*
	Name: updateenemyvehicles
	Namespace: killstreak_detect
	Checksum: 0xF3711E50
	Offset: 0x1170
	Size: 0x34
	Parameters: 2
	Flags: Linked
*/
function updateenemyvehicles(local_client_num, newval)
{
	if(!isdefined(self))
	{
		return;
	}
	function_d859c344(local_client_num, newval);
}

/*
	Name: updateenemymissiles
	Namespace: killstreak_detect
	Checksum: 0x2A7475E6
	Offset: 0x11B0
	Size: 0x34
	Parameters: 2
	Flags: Linked
*/
function updateenemymissiles(local_client_num, newval)
{
	if(!isdefined(self))
	{
		return;
	}
	function_d859c344(local_client_num, newval);
}

/*
	Name: watch_killstreak_detect_perks_changed
	Namespace: killstreak_detect
	Checksum: 0x8C3302F5
	Offset: 0x11F0
	Size: 0x176
	Parameters: 1
	Flags: Linked
*/
function watch_killstreak_detect_perks_changed(local_client_num)
{
	if(!self function_21c0fa55())
	{
		return;
	}
	self notify(#"watch_killstreak_detect_perks_changed");
	self endon(#"watch_killstreak_detect_perks_changed");
	self endon(#"death");
	self endon(#"disconnect");
	while(isdefined(self))
	{
		waitframe(1);
		util::clean_deleted(level.var_51afeae4);
		util::clean_deleted(level.enemyvehicles);
		util::clean_deleted(level.enemymissiles);
		array::thread_all(level.var_51afeae4, &function_f884010a, local_client_num, 1);
		array::thread_all(level.enemyvehicles, &updateenemyvehicles, local_client_num, 1);
		array::thread_all(level.enemymissiles, &updateenemymissiles, local_client_num, 1);
		self waittill(#"perks_changed");
	}
}

/*
	Name: checkteamvehicles
	Namespace: killstreak_detect
	Checksum: 0x5621B82A
	Offset: 0x1370
	Size: 0x13E
	Parameters: 1
	Flags: Linked
*/
function checkteamvehicles(localclientnum)
{
	if(!isdefined(self.owner) || !isdefined(self.owner.team))
	{
		return;
	}
	if(!isdefined(self.vehicleoldteam))
	{
		self.vehicleoldteam = self.team;
	}
	if(!isdefined(self.vehicleoldownerteam))
	{
		self.vehicleoldownerteam = self.owner.team;
	}
	var_fd9de919 = function_9b3f0ed1(localclientnum);
	if(!isdefined(self.vehicleoldwatcherteam))
	{
		self.vehicleoldwatcherteam = var_fd9de919;
	}
	if(self.vehicleoldteam != self.team || self.vehicleoldownerteam != self.owner.team || self.vehicleoldwatcherteam != var_fd9de919)
	{
		self.vehicleoldteam = self.team;
		self.vehicleoldownerteam = self.owner.team;
		self.vehicleoldwatcherteam = var_fd9de919;
		self notify(#"team_changed");
	}
}

/*
	Name: checkteammissiles
	Namespace: killstreak_detect
	Checksum: 0x6507C99A
	Offset: 0x14B8
	Size: 0x13E
	Parameters: 1
	Flags: Linked
*/
function checkteammissiles(localclientnum)
{
	if(!isdefined(self.owner) || !isdefined(self.owner.team))
	{
		return;
	}
	if(!isdefined(self.missileoldteam))
	{
		self.missileoldteam = self.team;
	}
	if(!isdefined(self.missileoldownerteam))
	{
		self.missileoldownerteam = self.owner.team;
	}
	var_fd9de919 = function_9b3f0ed1(localclientnum);
	if(!isdefined(self.missileoldwatcherteam))
	{
		self.missileoldwatcherteam = var_fd9de919;
	}
	if(self.missileoldteam != self.team || self.missileoldownerteam != self.owner.team || self.missileoldwatcherteam != var_fd9de919)
	{
		self.missileoldteam = self.team;
		self.missileoldownerteam = self.owner.team;
		self.missileoldwatcherteam = var_fd9de919;
		self notify(#"team_changed");
	}
}

/*
	Name: function_8ac48939
	Namespace: killstreak_detect
	Checksum: 0x84E0738D
	Offset: 0x1600
	Size: 0x12C
	Parameters: 1
	Flags: Linked
*/
function function_8ac48939(bundle)
{
	var_872807f = bundle.("ksROBShowFriendly");
	if(is_true(var_872807f))
	{
		renderoverridebundle::function_f72f089c(bundle.var_d3413870 + "friendly", bundle.("ksROBFriendly"), &function_95f96f3e);
	}
	show_enemy = bundle.("ksROBShowEnemy");
	if(is_true(show_enemy))
	{
		renderoverridebundle::function_f72f089c(bundle.var_d3413870 + "enemy", bundle.("ksROBEnemy"), &function_903bbed3);
	}
	renderoverridebundle::function_f72f089c(#"hash_6a966793a191bc8c", #"rob_sonar_set_enemy", &function_d63aa49b);
}

/*
	Name: function_d05902d9
	Namespace: killstreak_detect
	Checksum: 0x982C6085
	Offset: 0x1738
	Size: 0x12A
	Parameters: 2
	Flags: Linked, Private
*/
function private function_d05902d9(local_client_num, newval)
{
	if(!isdefined(level.var_b1dca2fb))
	{
		level.var_b1dca2fb = [];
	}
	if(!isdefined(level.var_b1dca2fb[local_client_num]))
	{
		level.var_b1dca2fb[local_client_num] = [];
	}
	var_55251088 = spawnstruct();
	var_55251088.vehicle = self;
	var_55251088.newval = newval;
	if(!isdefined(level.var_b1dca2fb[local_client_num]))
	{
		level.var_b1dca2fb[local_client_num] = [];
	}
	else if(!isarray(level.var_b1dca2fb[local_client_num]))
	{
		level.var_b1dca2fb[local_client_num] = array(level.var_b1dca2fb[local_client_num]);
	}
	level.var_b1dca2fb[local_client_num][level.var_b1dca2fb[local_client_num].size] = var_55251088;
}

/*
	Name: function_32c8b999
	Namespace: killstreak_detect
	Checksum: 0x7DCFAC9F
	Offset: 0x1870
	Size: 0x142
	Parameters: 1
	Flags: None
*/
function function_32c8b999(local_client_num)
{
	if(!isdefined(level.var_b1dca2fb) || !isdefined(level.var_b1dca2fb[local_client_num]))
	{
		return;
	}
	for(i = level.var_b1dca2fb[local_client_num].size - 1; i >= 0; i--)
	{
		vehicle = level.var_b1dca2fb[local_client_num][i].vehicle;
		newval = level.var_b1dca2fb[local_client_num][i].newval;
		if(isdefined(vehicle) && isalive(vehicle))
		{
			vehicle enemyvehicle_changed(local_client_num, undefined, newval);
		}
		level.var_b1dca2fb[local_client_num][i] = undefined;
	}
	arrayremoveindex(level.var_b1dca2fb, local_client_num);
	if(level.var_b1dca2fb.size == 0)
	{
		level.var_b1dca2fb = undefined;
	}
}

/*
	Name: function_f27ffe49
	Namespace: killstreak_detect
	Checksum: 0x95A68646
	Offset: 0x19C0
	Size: 0x12A
	Parameters: 2
	Flags: Linked, Private
*/
function private function_f27ffe49(local_client_num, newval)
{
	if(!isdefined(level.inserted_pop_))
	{
		level.inserted_pop_ = [];
	}
	if(!isdefined(level.inserted_pop_[local_client_num]))
	{
		level.inserted_pop_[local_client_num] = [];
	}
	var_a87a8991 = spawnstruct();
	var_a87a8991.actor = self;
	var_a87a8991.newval = newval;
	if(!isdefined(level.inserted_pop_[local_client_num]))
	{
		level.inserted_pop_[local_client_num] = [];
	}
	else if(!isarray(level.inserted_pop_[local_client_num]))
	{
		level.inserted_pop_[local_client_num] = array(level.inserted_pop_[local_client_num]);
	}
	level.inserted_pop_[local_client_num][level.inserted_pop_[local_client_num].size] = var_a87a8991;
}

/*
	Name: function_3eff7815
	Namespace: killstreak_detect
	Checksum: 0x7BCDDC7B
	Offset: 0x1AF8
	Size: 0x142
	Parameters: 1
	Flags: None
*/
function function_3eff7815(local_client_num)
{
	if(!isdefined(level.inserted_pop_) || !isdefined(level.inserted_pop_[local_client_num]))
	{
		return;
	}
	for(i = level.inserted_pop_[local_client_num].size - 1; i >= 0; i--)
	{
		actor = level.inserted_pop_[local_client_num][i].actor;
		newval = level.inserted_pop_[local_client_num][i].newval;
		if(isdefined(actor) && isalive(actor))
		{
			actor function_430c370a(local_client_num, undefined, newval);
		}
		level.inserted_pop_[local_client_num][i] = undefined;
	}
	arrayremoveindex(level.inserted_pop_, local_client_num);
	if(level.inserted_pop_.size == 0)
	{
		level.inserted_pop_ = undefined;
	}
}

