#using scripts\zm_common\zm_player.gsc;
#using script_7bdcff4f92f3d220;
#using script_61828ad9e71c6616;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\killstreaks\zm\airsupport.gsc;
#using script_7475f917e6d3bed9;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\killstreaks\killstreakrules_shared.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;

#namespace napalm_strike;

/*
	Name: function_cc2436f1
	Namespace: napalm_strike
	Checksum: 0x4E76E3F8
	Offset: 0x1C8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_cc2436f1()
{
	level notify(1189485174);
}

/*
	Name: __init__system__
	Namespace: napalm_strike
	Checksum: 0x4A53564D
	Offset: 0x1E8
	Size: 0x54
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"napalm_strike", &function_70a657d8, undefined, &function_3675de8b, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: napalm_strike
	Checksum: 0x1F0FB56B
	Offset: 0x248
	Size: 0x94
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared("killstreak_napalm_strike" + "_zm", &function_a865cea6);
	clientfield::register("scriptmover", "napalm_strike_marker_on", 1, 2, "int");
	zm_player::register_player_damage_callback(&function_f6ea413);
	level.var_3bd3b14a = 1;
}

/*
	Name: function_3675de8b
	Namespace: napalm_strike
	Checksum: 0x73759B97
	Offset: 0x2E8
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_3675de8b()
{
	killstreaks::function_7b6102ed("napalm_strike_zm");
	killstreaks::function_7b6102ed("inventory_napalm_strike_zm");
}

/*
	Name: function_a865cea6
	Namespace: napalm_strike
	Checksum: 0x60493F
	Offset: 0x328
	Size: 0xEA
	Parameters: 1
	Flags: Linked
*/
function function_a865cea6(killstreaktype)
{
	if(!self killstreakrules::iskillstreakallowed("napalm_strike_zm", self.team))
	{
		return 0;
	}
	if(!self killstreakrules::function_71e94a3b())
	{
		self.var_baf4657c = 1;
		self killstreakrules::function_65739e7b("napalm_strike_zm");
		return;
	}
	if(isint(level.var_7d0d2eae))
	{
		level.var_7d0d2eae = (level.var_7d0d2eae + 1) % 100;
	}
	else
	{
		level.var_7d0d2eae = 0;
	}
	result = function_53a0e7ce(level.var_7d0d2eae);
	return result;
}

/*
	Name: function_58189f7d
	Namespace: napalm_strike
	Checksum: 0x4F4669C0
	Offset: 0x420
	Size: 0xB4
	Parameters: 1
	Flags: None
*/
function function_58189f7d(killstreaktype)
{
	self endon(#"death");
	waitresult = undefined;
	waitresult = self waittill(#"weapon_fired", #"weapon_change");
	if(!self killstreakrules::function_71e94a3b() && waitresult._notify === "weapon_fired")
	{
		return false;
	}
	if(waitresult._notify === "weapon_fired")
	{
		return true;
	}
	return false;
}

/*
	Name: function_53a0e7ce
	Namespace: napalm_strike
	Checksum: 0xD4B1D375
	Offset: 0x4E0
	Size: 0x27C
	Parameters: 1
	Flags: Linked
*/
function function_53a0e7ce(var_b004174a)
{
	if(!is_true(level.var_3bd3b14a))
	{
		return;
	}
	self endon(#"disconnect");
	s_params = killstreaks::get_script_bundle("napalm_strike_zm");
	var_2558cb51 = array("napalm_strike_complete" + var_b004174a, "napalm_strike_failed" + var_b004174a);
	self namespace_bf7415ae::function_890b3889("napalm_strike", s_params.ksweapon, 2500, &function_ce23d48a, &function_ffa80fa4, var_2558cb51, 1);
	s_location = self namespace_bf7415ae::function_be6de952("napalm_strike", &function_fc2f1ec6);
	if(isdefined(s_location))
	{
		forward = anglestoforward((0, s_location.angles[1], 0));
		forward = vectornormalize(forward);
		forward = vectorscale(forward, 190);
		forward = (forward[0], forward[1], forward[2]);
		s_location.origin = s_location.origin + forward;
		s_location.yaw = s_location.angles[1] + 90;
		s_location.height = (1500 + 3000) + (randomfloatrange(-200, 200));
		killstreak_id = self killstreakrules::killstreakstart("napalm_strike_zm", self.team, 0, 1);
		if(killstreak_id == -1)
		{
			self notify("napalm_strike_failed" + var_b004174a);
			return false;
		}
		self thread function_9aa2535(var_b004174a, s_location, killstreak_id);
		return true;
	}
	return false;
}

/*
	Name: function_4776caf4
	Namespace: napalm_strike
	Checksum: 0x1A7D7D69
	Offset: 0x768
	Size: 0x2F4
	Parameters: 1
	Flags: Private, Event
*/
event private function_4776caf4(eventstruct)
{
	if(!is_true(level.var_3bd3b14a))
	{
		return;
	}
	if(!isplayer(self))
	{
		return;
	}
	weapon = eventstruct.weapon;
	if(!isdefined(weapon))
	{
		return;
	}
	if(weapon == killstreaks::get_killstreak_weapon("napalm_strike_zm") || weapon == (killstreaks::get_killstreak_weapon("inventory_" + "napalm_strike_zm")))
	{
		if(!self killstreakrules::function_71e94a3b())
		{
			self.var_baf4657c = 1;
			self killstreakrules::function_65739e7b("napalm_strike_zm");
			projectile = eventstruct.projectile;
			if(isdefined(projectile))
			{
				projectile delete();
			}
			return;
		}
		projectile = eventstruct.projectile;
		if(isdefined(projectile))
		{
			projectile endon(#"death");
			projectile waittill(#"rolling");
			if(isdefined(projectile))
			{
				playfxontag("weapon/fx8_equip_swat_smk_signal", projectile, "tag_flash");
			}
			projectile waittill(#"stationary");
			if(isdefined(projectile))
			{
				projectile.angles = vectorscale((-1, 0, 1), 90);
			}
			wait(1);
			if(isdefined(projectile) && isplayer(self))
			{
				projectile thread function_5673c107();
				s_location = spawnstruct();
				s_location.origin = projectile.origin;
				s_location.yaw = self.angles[1] + 90;
				s_location.height = (1500 + 3000) + (randomfloatrange(-200, 200));
				killstreak_id = self killstreakrules::killstreakstart("napalm_strike_zm", self.team, 0, 1);
				if(killstreak_id == -1)
				{
					self notify(#"napalm_strike_failed");
					return false;
				}
				self thread function_9aa2535(s_location, killstreak_id);
			}
		}
	}
}

/*
	Name: function_5673c107
	Namespace: napalm_strike
	Checksum: 0x318F00C3
	Offset: 0xA68
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_5673c107()
{
	self endon(#"death");
	wait(7);
	self delete();
}

/*
	Name: function_ce23d48a
	Namespace: napalm_strike
	Checksum: 0x6607E92C
	Offset: 0xAA8
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_ce23d48a()
{
	self clientfield::set("napalm_strike_marker_on", 1);
}

/*
	Name: function_fc2f1ec6
	Namespace: napalm_strike
	Checksum: 0xBF9E5543
	Offset: 0xAD8
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_fc2f1ec6()
{
	self clientfield::set("napalm_strike_marker_on", 2);
}

/*
	Name: function_ffa80fa4
	Namespace: napalm_strike
	Checksum: 0xA5CB078B
	Offset: 0xB08
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_ffa80fa4()
{
	self clientfield::set("napalm_strike_marker_on", 0);
}

/*
	Name: function_9aa2535
	Namespace: napalm_strike
	Checksum: 0x4B5E8211
	Offset: 0xB38
	Size: 0x58
	Parameters: 3
	Flags: Linked, Private
*/
function private function_9aa2535(var_b004174a, location, killstreakid)
{
	self function_88e2e18a("napalm_strike_zm", location, self.team, killstreakid);
	self notify("napalm_strike_complete" + var_b004174a);
}

/*
	Name: function_f6ea413
	Namespace: napalm_strike
	Checksum: 0xCE0AE811
	Offset: 0xB98
	Size: 0x8C
	Parameters: 10
	Flags: Linked, Private
*/
function private function_f6ea413(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime)
{
	if(shitloc === self && psoffsettime == getweapon("napalm_strike"))
	{
		return 20;
	}
	return -1;
}

