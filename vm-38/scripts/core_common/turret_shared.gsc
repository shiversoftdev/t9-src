#using scripts\core_common\ai\archetype_utility.gsc;
#using script_4a3f9b8905878272;
#using script_3819e7a1427df6d2;
#using script_3aa0f32b70d4f7cb;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\vehicleriders_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace turret_shared;

/*
	Name: function_869932c8
	Namespace: turret_shared
	Checksum: 0x7B4852CC
	Offset: 0x398
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_869932c8()
{
	level notify(-1252574965);
}

#namespace turret;

/*
	Name: __init__system__
	Namespace: turret
	Checksum: 0x598E842
	Offset: 0x3B8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"turret", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: turret
	Checksum: 0x9836165A
	Offset: 0x400
	Size: 0x5C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("vehicle", "toggle_lensflare", 1, 1, "int");
	level._turrets = spawnstruct();
	registerbehaviorscriptfunctions();
}

/*
	Name: registerbehaviorscriptfunctions
	Namespace: turret
	Checksum: 0x65F3E2F
	Offset: 0x468
	Size: 0x1A4
	Parameters: 0
	Flags: Linked, Private
*/
function private registerbehaviorscriptfunctions()
{
	/#
		assert(isscriptfunctionptr(&function_2c6be6cd));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4da9c87ccb6a9163", &function_2c6be6cd);
	/#
		assert(isscriptfunctionptr(&function_90e78f70));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_38b92465454460ba", &function_90e78f70);
	/#
		assert(isscriptfunctionptr(&function_38388863));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_400342bceb3fa64e", &function_38388863);
	/#
		assert(isscriptfunctionptr(&function_3628f3da));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2eef1e8d94fa0609", &function_3628f3da);
}

/*
	Name: function_2c6be6cd
	Namespace: turret
	Checksum: 0xE805CFD5
	Offset: 0x618
	Size: 0x2A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2c6be6cd(entity)
{
	return entity flag::get(#"hash_1b89f498c2647e6");
}

/*
	Name: function_90e78f70
	Namespace: turret
	Checksum: 0xC1FCDA93
	Offset: 0x650
	Size: 0x2A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_90e78f70(entity)
{
	return entity flag::get(#"hash_79f73bc0bf703a5d");
}

/*
	Name: function_38388863
	Namespace: turret
	Checksum: 0x73C0D7A2
	Offset: 0x688
	Size: 0x18
	Parameters: 1
	Flags: Linked, Private
*/
function private function_38388863(entity)
{
	return isdefined(entity.var_2df45b5d);
}

/*
	Name: function_3628f3da
	Namespace: turret
	Checksum: 0xF5891498
	Offset: 0x6A8
	Size: 0x16
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3628f3da(entity)
{
	entity.var_2df45b5d = undefined;
}

/*
	Name: function_d72fcb0a
	Namespace: turret
	Checksum: 0x7D898655
	Offset: 0x6C8
	Size: 0xCE
	Parameters: 13
	Flags: Linked, Private
*/
function private function_d72fcb0a(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, modelindex)
{
	if(isdefined(self.var_72f4d1b7))
	{
		level.var_d7e2833c = self.var_72f4d1b7 > 1;
		modelindex = int(self.var_72f4d1b7 * modelindex);
		if(modelindex < 1)
		{
			modelindex = 1;
		}
	}
	return modelindex;
}

/*
	Name: get_weapon
	Namespace: turret
	Checksum: 0x641BD2FA
	Offset: 0x7A0
	Size: 0x5A
	Parameters: 1
	Flags: Linked
*/
function get_weapon(n_index)
{
	if(!isdefined(n_index))
	{
		n_index = 0;
	}
	if(!isalive(self))
	{
		return level.weaponnone;
	}
	w_weapon = self seatgetweapon(n_index);
	return w_weapon;
}

/*
	Name: get_parent
	Namespace: turret
	Checksum: 0x4F3D57B
	Offset: 0x808
	Size: 0x2A
	Parameters: 1
	Flags: None
*/
function get_parent(n_index)
{
	return _get_turret_data(n_index).e_parent;
}

/*
	Name: laser_death_watcher
	Namespace: turret
	Checksum: 0x34E7C6FA
	Offset: 0x840
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function laser_death_watcher()
{
	self notify(#"laser_death_thread_stop");
	self endon(#"laser_death_thread_stop");
	self waittill(#"death");
	if(isdefined(self))
	{
		self laseroff();
	}
}

/*
	Name: enable_laser
	Namespace: turret
	Checksum: 0xCAC77A29
	Offset: 0x8A0
	Size: 0xA6
	Parameters: 2
	Flags: None
*/
function enable_laser(b_enable, n_index)
{
	if(b_enable)
	{
		_get_turret_data(n_index).has_laser = 1;
		self laseron();
		self thread laser_death_watcher();
	}
	else
	{
		_get_turret_data(n_index).has_laser = undefined;
		self laseroff();
		self notify(#"laser_death_thread_stop");
	}
}

/*
	Name: emp_watcher
	Namespace: turret
	Checksum: 0xEADE8A12
	Offset: 0x950
	Size: 0x158
	Parameters: 1
	Flags: Linked
*/
function emp_watcher(n_index)
{
	self notify(#"emp_thread_stop");
	self endon(#"emp_thread_stop", #"death");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"damage");
		if(waitresult.weapon.isemp)
		{
			if(is_true(self.emped))
			{
				continue;
			}
			self.emped = 1;
			if(isdefined(_get_turret_data(n_index).has_laser))
			{
				self laseroff();
			}
			stop(n_index, 1);
			wait(randomfloatrange(5, 7));
			self.emped = undefined;
			if(isdefined(_get_turret_data(n_index).has_laser))
			{
				self laseron();
			}
		}
	}
}

/*
	Name: enable_emp
	Namespace: turret
	Checksum: 0x7F48EEC3
	Offset: 0xAB0
	Size: 0x86
	Parameters: 2
	Flags: None
*/
function enable_emp(b_enable, n_index)
{
	if(b_enable)
	{
		_get_turret_data(n_index).can_emp = 1;
		self thread emp_watcher(n_index);
	}
	else
	{
		_get_turret_data(n_index).can_emp = undefined;
		self notify(#"emp_thread_stop");
	}
}

/*
	Name: set_team
	Namespace: turret
	Checksum: 0x7224F10F
	Offset: 0xB40
	Size: 0x3E
	Parameters: 2
	Flags: Linked
*/
function set_team(str_team, n_index)
{
	_get_turret_data(n_index).str_team = str_team;
	self.team = str_team;
}

/*
	Name: get_team
	Namespace: turret
	Checksum: 0x761B301B
	Offset: 0xB88
	Size: 0x62
	Parameters: 1
	Flags: None
*/
function get_team(n_index)
{
	str_team = undefined;
	s_turret = _get_turret_data(n_index);
	str_team = self.team;
	if(!isdefined(s_turret.str_team))
	{
		s_turret.str_team = str_team;
	}
	return str_team;
}

/*
	Name: is_turret_enabled
	Namespace: turret
	Checksum: 0xEFF8EE7E
	Offset: 0xBF8
	Size: 0x2A
	Parameters: 1
	Flags: Linked
*/
function is_turret_enabled(n_index)
{
	return _get_turret_data(n_index).is_enabled;
}

/*
	Name: does_need_user
	Namespace: turret
	Checksum: 0x4631E8FC
	Offset: 0xC30
	Size: 0x3A
	Parameters: 1
	Flags: Linked
*/
function does_need_user(n_index)
{
	return is_true(_get_turret_data(n_index).b_needs_user);
}

/*
	Name: does_have_user
	Namespace: turret
	Checksum: 0x7E8FE450
	Offset: 0xC78
	Size: 0x32
	Parameters: 1
	Flags: Linked
*/
function does_have_user(n_index)
{
	return isalive(get_user(n_index));
}

/*
	Name: get_user
	Namespace: turret
	Checksum: 0x57D7E5B8
	Offset: 0xCB8
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function get_user(n_index)
{
	return self getseatoccupant(n_index);
}

/*
	Name: _set_turret_needs_user
	Namespace: turret
	Checksum: 0x415E7920
	Offset: 0xCE8
	Size: 0x42
	Parameters: 2
	Flags: Linked
*/
function _set_turret_needs_user(n_index, b_needs_user)
{
	s_turret = _get_turret_data(n_index);
	s_turret.b_needs_user = b_needs_user;
}

/*
	Name: is_current_user
	Namespace: turret
	Checksum: 0x2D777C28
	Offset: 0xD38
	Size: 0x56
	Parameters: 2
	Flags: None
*/
function is_current_user(ai_user, n_index)
{
	ai_current_user = get_user(n_index);
	return isalive(ai_current_user) && ai_user == ai_current_user;
}

/*
	Name: set_burst_parameters
	Namespace: turret
	Checksum: 0x3D9C3130
	Offset: 0xD98
	Size: 0x7E
	Parameters: 5
	Flags: None
*/
function set_burst_parameters(n_fire_min, n_fire_max, n_wait_min, n_wait_max, n_index)
{
	s_turret = _get_turret_data(n_index);
	s_turret.n_burst_fire_min = n_fire_min;
	s_turret.n_burst_fire_max = n_fire_max;
	s_turret.n_burst_wait_min = n_wait_min;
	s_turret.n_burst_wait_max = n_wait_max;
}

/*
	Name: set_torso_targetting
	Namespace: turret
	Checksum: 0x75D84496
	Offset: 0xE20
	Size: 0x52
	Parameters: 2
	Flags: Linked
*/
function set_torso_targetting(n_index, n_torso_targetting_offset)
{
	if(!isdefined(n_torso_targetting_offset))
	{
		n_torso_targetting_offset = -12;
	}
	s_turret = _get_turret_data(n_index);
	s_turret.n_torso_targetting_offset = n_torso_targetting_offset;
}

/*
	Name: set_target_leading
	Namespace: turret
	Checksum: 0x40F1A413
	Offset: 0xE80
	Size: 0x52
	Parameters: 2
	Flags: Linked
*/
function set_target_leading(n_index, n_target_leading_factor)
{
	if(!isdefined(n_target_leading_factor))
	{
		n_target_leading_factor = 0.1;
	}
	s_turret = _get_turret_data(n_index);
	s_turret.n_target_leading_factor = n_target_leading_factor;
}

/*
	Name: set_on_target_angle
	Namespace: turret
	Checksum: 0xC1BFB609
	Offset: 0xEE0
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function set_on_target_angle(n_angle, n_index)
{
	if(!isdefined(n_index))
	{
		n_index = 0;
	}
	self turretsetontargettolerance(n_index, n_angle);
}

/*
	Name: set_target
	Namespace: turret
	Checksum: 0x9AE7134E
	Offset: 0xF28
	Size: 0x19A
	Parameters: 5
	Flags: Linked
*/
function set_target(target, v_offset, n_index, var_6bfa76e, var_d55528ca)
{
	if(!isdefined(n_index))
	{
		n_index = 0;
	}
	if(!isdefined(var_6bfa76e))
	{
		var_6bfa76e = 0;
	}
	if(!isdefined(var_d55528ca))
	{
		var_d55528ca = 0;
	}
	self endon(#"death");
	if(!isdefined(target))
	{
		clear_target(n_index);
		return 0;
	}
	if(!isentity(target) && !isvec(target) || is_true(target.ignoreme))
	{
		return 0;
	}
	s_turret = _get_turret_data(n_index);
	if(!isdefined(v_offset))
	{
		v_offset = _get_default_target_offset(target, n_index);
	}
	s_turret.last_target = s_turret.target;
	s_turret.e_next_target = target;
	s_turret.target = target;
	s_turret.v_offset = v_offset;
	s_turret.var_f351ad56 = var_6bfa76e;
	s_turret.var_d55528ca = var_d55528ca;
	self turretsettarget(n_index, target, v_offset);
	return function_12269140(target, n_index);
}

/*
	Name: _get_default_target_offset
	Namespace: turret
	Checksum: 0x47053BA
	Offset: 0x10D0
	Size: 0x266
	Parameters: 2
	Flags: Linked, Private
*/
function private _get_default_target_offset(e_target, n_index)
{
	s_turret = _get_turret_data(n_index);
	if(s_turret.str_weapon_type == "bullet")
	{
		if(isdefined(e_target))
		{
			if(isplayer(e_target))
			{
				z_offset = 0;
			}
			else
			{
				if(e_target.type === "human")
				{
					z_offset = randomintrange(20, 60);
				}
				else
				{
					if(e_target.type === "robot")
					{
						z_offset = randomintrange(40, 60);
					}
					else if(issentient(self) && issentient(e_target))
					{
						z_offset = (isvehicle(e_target) ? 0 : (isdefined(s_turret.n_torso_targetting_offset) ? s_turret.n_torso_targetting_offset : 0));
					}
				}
			}
			if(isdefined(e_target.z_target_offset_override))
			{
				if(!isdefined(z_offset))
				{
					z_offset = 0;
				}
				z_offset = z_offset + e_target.z_target_offset_override;
			}
		}
	}
	if(!isdefined(z_offset))
	{
		z_offset = 0;
	}
	v_offset = (0, 0, z_offset);
	if((isdefined(s_turret.n_target_leading_factor) ? s_turret.n_target_leading_factor : 0) != 0 && isdefined(e_target) && issentient(self) && issentient(e_target) && !isvehicle(e_target))
	{
		velocity = e_target getvelocity();
		v_offset = v_offset + (velocity * s_turret.n_target_leading_factor);
	}
	return v_offset;
}

/*
	Name: get_target
	Namespace: turret
	Checksum: 0x4A64A9F
	Offset: 0x1340
	Size: 0x36
	Parameters: 1
	Flags: Linked
*/
function get_target(n_index)
{
	s_turret = _get_turret_data(n_index);
	return s_turret.target;
}

/*
	Name: is_target
	Namespace: turret
	Checksum: 0xC3B75F1D
	Offset: 0x1380
	Size: 0xAE
	Parameters: 2
	Flags: Linked
*/
function is_target(target, n_index)
{
	current_target = get_target(n_index);
	if(isdefined(current_target) && (isentity(target) && isentity(current_target) || (isvec(target) && isvec(current_target))))
	{
		return current_target == target;
	}
	return 0;
}

/*
	Name: clear_target
	Namespace: turret
	Checksum: 0x21F7A53E
	Offset: 0x1438
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function clear_target(n_index)
{
	if(!isdefined(n_index))
	{
		n_index = 0;
	}
	s_turret = _get_turret_data(n_index);
	s_turret.e_next_target = undefined;
	s_turret.target = undefined;
	s_turret.var_50fbd548 = undefined;
	s_turret.var_d55528ca = 0;
	s_turret.var_f351ad56 = 0;
	self turretcleartarget(n_index);
}

/*
	Name: function_49c3b892
	Namespace: turret
	Checksum: 0xA3D50597
	Offset: 0x14D0
	Size: 0x4A
	Parameters: 2
	Flags: None
*/
function function_49c3b892(e_target, n_index)
{
	if(!isdefined(n_index))
	{
		n_index = 0;
	}
	s_turret = _get_turret_data(n_index);
	s_turret.favoriteenemy = e_target;
}

/*
	Name: get_favorite_enemy
	Namespace: turret
	Checksum: 0xE06161D3
	Offset: 0x1528
	Size: 0x3E
	Parameters: 1
	Flags: None
*/
function get_favorite_enemy(n_index)
{
	if(!isdefined(n_index))
	{
		n_index = 0;
	}
	s_turret = _get_turret_data(n_index);
	return s_turret.favoriteenemy;
}

/*
	Name: function_41c79ce4
	Namespace: turret
	Checksum: 0xAF68D358
	Offset: 0x1570
	Size: 0x4A
	Parameters: 2
	Flags: None
*/
function function_41c79ce4(b_enable, n_index)
{
	if(!isdefined(n_index))
	{
		n_index = 0;
	}
	s_turret = _get_turret_data(n_index);
	s_turret.perfectaim = b_enable;
}

/*
	Name: set_min_target_distance_squared
	Namespace: turret
	Checksum: 0xDE593B83
	Offset: 0x15C8
	Size: 0x42
	Parameters: 2
	Flags: None
*/
function set_min_target_distance_squared(n_distance_squared, n_index)
{
	s_turret = _get_turret_data(n_index);
	s_turret.n_min_target_distance_squared = n_distance_squared;
}

/*
	Name: function_9c04d437
	Namespace: turret
	Checksum: 0x8E328540
	Offset: 0x1618
	Size: 0x98
	Parameters: 2
	Flags: Linked
*/
function function_9c04d437(var_6a56e517, n_index)
{
	if(!isdefined(n_index))
	{
		n_index = 0;
	}
	s_turret = _get_turret_data(n_index);
	s_turret flag::set("turret manual");
	if(is_true(var_6a56e517))
	{
		self notify("turret manual" + _index(n_index));
	}
}

/*
	Name: function_21827343
	Namespace: turret
	Checksum: 0xDD37D303
	Offset: 0x16B8
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_21827343(n_index)
{
	if(!isdefined(n_index))
	{
		n_index = 0;
	}
	s_turret = _get_turret_data(n_index);
	s_turret flag::clear("turret manual");
}

/*
	Name: function_3e5395
	Namespace: turret
	Checksum: 0x1E2C0862
	Offset: 0x1718
	Size: 0x4A
	Parameters: 2
	Flags: None
*/
function function_3e5395(n_seconds, n_index)
{
	if(!isdefined(n_index))
	{
		n_index = 0;
	}
	s_turret = _get_turret_data(n_index);
	s_turret.var_b52bbdba = n_seconds;
}

/*
	Name: function_30a9811a
	Namespace: turret
	Checksum: 0x626A8104
	Offset: 0x1770
	Size: 0x82
	Parameters: 2
	Flags: None
*/
function function_30a9811a(n_scale, n_index)
{
	if(!isdefined(n_index))
	{
		n_index = 0;
	}
	/#
		assert(isdefined(n_scale) && n_scale > 0, "");
	#/
	s_turret = _get_turret_data(n_index);
	s_turret.var_72f4d1b7 = n_scale;
}

/*
	Name: fire
	Namespace: turret
	Checksum: 0xAC9D1ED8
	Offset: 0x1800
	Size: 0x19E
	Parameters: 1
	Flags: Linked
*/
function fire(n_index)
{
	s_turret = _get_turret_data(n_index);
	/#
		assert(isdefined(n_index) && n_index >= 0, "");
	#/
	e_target = (isentity(s_turret.target) ? s_turret.target : undefined);
	self.forcefire = is_true(s_turret.var_d55528ca);
	self.var_742d1a8f = is_true(s_turret.var_2890139c);
	if(n_index == 0)
	{
		self fireweapon(0, e_target);
	}
	else
	{
		ai_current_user = get_user(n_index);
		if(isdefined(ai_current_user) && is_true(ai_current_user.is_disabled))
		{
			return;
		}
		if(isdefined(e_target))
		{
			self turretsettarget(n_index, e_target, s_turret.v_offset);
		}
		self fireweapon(n_index, e_target, s_turret.v_offset, s_turret.e_parent);
	}
	s_turret.n_last_fire_time = gettime();
}

/*
	Name: fire_for_time
	Namespace: turret
	Checksum: 0x3D087175
	Offset: 0x19A8
	Size: 0x1B6
	Parameters: 3
	Flags: Linked
*/
function fire_for_time(n_time, n_index, var_7cd5e5c)
{
	if(!isdefined(n_index))
	{
		n_index = 0;
	}
	if(!isdefined(var_7cd5e5c))
	{
		var_7cd5e5c = "unused";
	}
	self endon(var_7cd5e5c, #"terminate_all_turrets_firing", #"death", "_stop_turret" + _index(n_index), "turret_disabled" + _index(n_index), "turret manual" + _index(n_index));
	var_17b7891d = "6de34da8e1cbdba" + _index(n_index);
	self notify(var_17b7891d);
	self endon(var_17b7891d);
	s_turret = _get_turret_data(n_index);
	w_weapon = get_weapon(n_index);
	n_fire_time = w_weapon.firetime;
	n_shots = 0;
	var_23ec945b = floor(abs(n_time / n_fire_time));
	while(n_shots < var_23ec945b)
	{
		if(n_time > 0)
		{
			n_shots++;
		}
		self fire(n_index);
		wait(n_fire_time);
	}
}

/*
	Name: stop
	Namespace: turret
	Checksum: 0x4E255B57
	Offset: 0x1B68
	Size: 0xC4
	Parameters: 2
	Flags: Linked
*/
function stop(n_index, b_clear_target)
{
	if(!isdefined(b_clear_target))
	{
		b_clear_target = 0;
	}
	s_turret = _get_turret_data(n_index);
	s_turret.e_next_target = undefined;
	s_turret.target = undefined;
	function_21827343(n_index);
	if(b_clear_target)
	{
		clear_target(n_index);
	}
	self notify("_stop_turret" + _index(n_index));
	function_14223170(n_index);
}

/*
	Name: get_in
	Namespace: turret
	Checksum: 0xB062BE53
	Offset: 0x1C38
	Size: 0x224
	Parameters: 2
	Flags: Linked
*/
function get_in(ai_actor, n_index)
{
	if(!isdefined(n_index))
	{
		n_index = 0;
	}
	if(isalive(ai_actor) && !is_true(ai_actor islinkedto(self)))
	{
		s_turret = _get_turret_data(n_index);
		self usevehicle(ai_actor, n_index);
		ai_actor flag::set(#"hash_1b89f498c2647e6");
		if(is_true(s_turret.var_7394b9dc))
		{
			ai_actor.allowpain = 0;
			ai_actor.blockingpain = 1;
		}
		/#
			if(!is_true(ai_actor islinkedto(self)))
			{
				ai_actor linkto(self);
				println(((("" + n_index) + "") + self.model) + "");
			}
		#/
		self enable(n_index, 1);
		ai_actor.s_turret = s_turret;
		ai_actor.var_72f4d1b7 = s_turret.var_72f4d1b7;
		ai_actor.var_41adb97 = undefined;
		aiutility::addaioverridedamagecallback(ai_actor, &function_d72fcb0a);
		self thread handle_rider_death(ai_actor, n_index);
		self thread function_2c718f9e(ai_actor, n_index);
		self thread function_738effc8(ai_actor, n_index);
	}
}

/*
	Name: function_2c718f9e
	Namespace: turret
	Checksum: 0x9DEA9218
	Offset: 0x1E68
	Size: 0x298
	Parameters: 2
	Flags: Linked, Private
*/
function private function_2c718f9e(ai_actor, n_index)
{
	self endon(#"death", "turret_disabled" + _index(n_index));
	ai_actor endon(#"death");
	s_turret = _get_turret_data(n_index);
	while(true)
	{
		ai_actor waittill(#"pain");
		if(is_true(s_turret.var_7394b9dc) || is_true(s_turret.var_aa100948))
		{
			continue;
		}
		s_turret.e_last_target = s_turret.target;
		s_turret.var_aa100948 = 1;
		var_d8c89de3 = 1.5;
		stop(n_index, 1);
		pause(-1, n_index);
		self turretsettargetangles(n_index, (0, 0, 0));
		waitframe(2);
		if(isdefined(s_turret.var_bf6d793d) && isdefined(s_turret.var_bf6d793d.var_81610bb0))
		{
			for(i = 0; i < 10; i++)
			{
				if(isdefined(s_turret.var_bf6d793d.var_81610bb0[i]))
				{
					var_1e713ee7 = s_turret.var_bf6d793d.var_81610bb0[i].xanim;
					if(isdefined(var_1e713ee7))
					{
						anim_time = ai_actor getanimtime(var_1e713ee7);
						if(anim_time > 0)
						{
							var_73a9738e = getanimlength(var_1e713ee7);
							var_d8c89de3 = (1 - anim_time) * var_73a9738e;
							break;
						}
					}
				}
			}
		}
		wait(var_d8c89de3);
		s_turret.var_aa100948 = 0;
		unpause(n_index);
		set_target(s_turret.e_last_target);
	}
}

/*
	Name: function_738effc8
	Namespace: turret
	Checksum: 0xBCC215A8
	Offset: 0x2108
	Size: 0x94
	Parameters: 2
	Flags: Linked, Private
*/
function private function_738effc8(ai_actor, n_index)
{
	self endon(#"death");
	ai_actor endon(#"death");
	ai_actor waittill(#"goal_changed");
	/#
		if(getdvarint(#"hash_47a40f04e7c48117", 0))
		{
			return;
		}
	#/
	self _drop_turret(n_index);
}

/*
	Name: get_out
	Namespace: turret
	Checksum: 0xB1B5002E
	Offset: 0x21A8
	Size: 0x220
	Parameters: 2
	Flags: Linked
*/
function get_out(ai_actor, n_index)
{
	if(!isdefined(n_index))
	{
		n_index = 0;
	}
	if(ai_actor islinkedto(self))
	{
		self usevehicle(ai_actor, n_index);
		if(isalive(ai_actor))
		{
			ai_actor flag::clear(#"hash_1b89f498c2647e6");
			ai_actor.s_turret = undefined;
			ai_actor.var_72f4d1b7 = undefined;
			ai_actor.blockingpain = 0;
			ai_actor.allowpain = 1;
			ai_actor.ignoreme = 0;
			aiutility::releaseclaimnode(ai_actor);
			aiutility::choosebestcovernodeasap(ai_actor);
			if(isdefined(ai_actor.aioverridedamage))
			{
				aiutility::removeaioverridedamagecallback(ai_actor, &function_d72fcb0a);
			}
			var_3b228fdf = isdefined(ai_actor.node) && ai_actor.node.type == "Turret";
			var_3b228fdf = var_3b228fdf | (isdefined(ai_actor.covernode) && ai_actor.covernode.type == "Turret");
			if(var_3b228fdf)
			{
				ai_actor.var_41adb97 = gettime() + 4000;
				ai_actor setgoal(ai_actor.origin, 0, ai_actor.goalradius);
			}
		}
		self disable(n_index);
		self notify(#"hash_65f91ce3e40736e8");
		ai_actor notify(#"hash_65f91ce3e40736e8");
	}
}

/*
	Name: handle_rider_death
	Namespace: turret
	Checksum: 0xCB2AABBB
	Offset: 0x23D0
	Size: 0xF4
	Parameters: 2
	Flags: Linked
*/
function handle_rider_death(ai_rider, n_index)
{
	if(!isdefined(n_index))
	{
		n_index = 0;
	}
	self endon(#"death", "turret_disabled" + _index(n_index));
	ai_rider waittill(#"death");
	if(ai_rider flag::get(#"hash_1b89f498c2647e6"))
	{
		ai_rider flag::clear(#"hash_1b89f498c2647e6");
		ai_rider flag::set(#"hash_79f73bc0bf703a5d");
	}
	self get_out(ai_rider, n_index);
	self disable(n_index);
}

/*
	Name: function_1bc8c31c
	Namespace: turret
	Checksum: 0xE539AC86
	Offset: 0x24D0
	Size: 0x154
	Parameters: 4
	Flags: None
*/
function function_1bc8c31c(target, v_offset, n_index, b_just_once)
{
	if(!isdefined(n_index))
	{
		n_index = 0;
	}
	if(!isdefined(b_just_once))
	{
		b_just_once = 0;
	}
	/#
		assert(isdefined(target), "");
	#/
	function_9c04d437(1, n_index);
	self endon(#"drone_death", #"death", "_stop_turret" + _index(n_index), "turret_disabled" + _index(n_index), #"terminate_all_turrets_firing", #"exit_vehicle", "turret manual" + _index(n_index));
	function_14223170(n_index);
	_shoot_turret_at_target(target, v_offset, n_index, b_just_once);
	function_21827343(n_index);
}

/*
	Name: function_aecc6bed
	Namespace: turret
	Checksum: 0x27B0995C
	Offset: 0x2630
	Size: 0x30C
	Parameters: 5
	Flags: None
*/
function function_aecc6bed(var_502298b8, n_shots, n_index, n_fire_delay, var_702f0a7e)
{
	if(!isdefined(n_index))
	{
		n_index = 0;
	}
	if(!isdefined(n_fire_delay))
	{
		n_fire_delay = undefined;
	}
	if(!isdefined(var_702f0a7e))
	{
		var_702f0a7e = undefined;
	}
	/#
		assert(isarray(var_502298b8), "");
	#/
	/#
		assert(n_shots > 0, "");
	#/
	var_17b7891d = "1a325e0f6397cbea" + _index(n_index);
	self notify(var_17b7891d);
	self endon(var_17b7891d);
	function_9c04d437(1, n_index);
	self endon(#"drone_death", #"death", "_stop_turret" + _index(n_index), "turret_disabled" + _index(n_index), #"terminate_all_turrets_firing", #"exit_vehicle", "turret manual" + _index(n_index));
	w_weapon = get_weapon(n_index);
	n_fire_time = (isdefined(n_fire_delay) ? n_fire_delay : w_weapon.firetime);
	function_14223170(n_index);
	foreach(point in var_502298b8)
	{
		v_origin = (isvec(point) ? point : point.origin);
		if(!set_target(v_origin, undefined, n_index))
		{
			continue;
		}
		function_259e1449(n_index);
		for(shots = 0; shots < n_shots; shots++)
		{
			fire(n_index);
			wait(n_fire_time);
		}
		if(isdefined(var_702f0a7e))
		{
			wait(var_702f0a7e);
		}
	}
	function_21827343(n_index);
}

/*
	Name: function_d1ba6eb6
	Namespace: turret
	Checksum: 0xDA4B5EC6
	Offset: 0x2948
	Size: 0x204
	Parameters: 3
	Flags: None
*/
function function_d1ba6eb6(v_start, v_end, n_index)
{
	if(!isdefined(n_index))
	{
		n_index = 0;
	}
	/#
		assert(isdefined(v_start) && isdefined(v_end), "");
	#/
	var_17b7891d = "286c7a50de00885f" + _index(n_index);
	self notify(var_17b7891d);
	self endon(var_17b7891d);
	function_9c04d437(1, n_index);
	self endon(#"drone_death", #"death", "_stop_turret" + _index(n_index), "turret_disabled" + _index(n_index), #"terminate_all_turrets_firing", #"exit_vehicle", "turret manual" + _index(n_index));
	w_weapon = get_weapon(n_index);
	n_fire_time = w_weapon.firetime;
	function_14223170(n_index);
	if(set_target(v_start, undefined, n_index))
	{
		function_259e1449(n_index);
		set_target(v_end, undefined, n_index);
		fire_for_time(-1, n_index, function_a8d258ca(n_index));
	}
	function_21827343(n_index);
}

/*
	Name: _shoot_turret_at_target
	Namespace: turret
	Checksum: 0xB8662E4F
	Offset: 0x2B58
	Size: 0x3DC
	Parameters: 4
	Flags: Linked, Private
*/
function private _shoot_turret_at_target(target, v_offset, n_index, b_just_once)
{
	if(isentity(target))
	{
		target endon(#"death");
	}
	self endon(#"drone_death", #"death", "_stop_turret" + _index(n_index), "turret_disabled" + _index(n_index), #"terminate_all_turrets_firing", #"exit_vehicle", "turret manual" + _index(n_index));
	if(!isdefined(b_just_once))
	{
		b_just_once = 0;
	}
	s_turret = _get_turret_data(n_index);
	if(s_turret.n_burst_time < s_turret.n_burst_fire_time)
	{
		return;
	}
	n_time_since_last_shot = (float(gettime() - s_turret.n_last_fire_time)) / 1000;
	if(n_time_since_last_shot < s_turret.n_burst_wait)
	{
		wait(s_turret.n_burst_wait - n_time_since_last_shot);
	}
	var_17b7891d = "19fef14e1a613d08" + _index(n_index);
	self notify(var_17b7891d);
	self endon(var_17b7891d);
	if(is_true(s_turret.var_cd8600bd) && !can_hit_target(target, n_index))
	{
		return;
	}
	set_target(target, v_offset, n_index, s_turret.var_f351ad56, 0);
	if(!isdefined(self.aim_only_no_shooting))
	{
		function_259e1449(n_index);
		if(b_just_once)
		{
			fire(n_index);
			return;
		}
		var_e7a43ab0 = !is_true(s_turret.var_cd8600bd) || can_hit_target(target, n_index);
		if(var_e7a43ab0)
		{
			self thread _burst_fire(n_index);
		}
		while(s_turret.n_burst_time < s_turret.n_burst_fire_time)
		{
			while(can_hit_target(target, n_index))
			{
				set_target(target, v_offset, n_index, s_turret.var_f351ad56, 0);
				s_turret.var_50fbd548 = target.origin;
				wait(s_turret.var_b52bbdba);
			}
			if(isdefined(s_turret.var_50fbd548))
			{
				set_target(s_turret.var_50fbd548, v_offset, n_index, 0, 1);
			}
			else
			{
				clear_target(n_index);
				angles = self function_bc2f1cb8(n_index);
				self turretsettargetangles(n_index, angles);
			}
			wait(s_turret.var_b52bbdba);
		}
	}
}

/*
	Name: function_a8d258ca
	Namespace: turret
	Checksum: 0xB9BE1C5F
	Offset: 0x2F40
	Size: 0x32
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a8d258ca(n_index)
{
	if(!isdefined(n_index) || n_index == 0)
	{
		return "turret_on_target";
	}
	return "gunner_turret_on_target";
}

/*
	Name: function_259e1449
	Namespace: turret
	Checksum: 0xD1D9B198
	Offset: 0x2F80
	Size: 0x6A
	Parameters: 1
	Flags: Linked
*/
function function_259e1449(n_index)
{
	wait((isdefined(self.waittill_turret_on_target_delay) ? self.waittill_turret_on_target_delay : float(function_60d95f53()) / 1000));
	self waittill(function_a8d258ca(n_index));
}

/*
	Name: function_38841344
	Namespace: turret
	Checksum: 0x7305690
	Offset: 0x2FF8
	Size: 0x52
	Parameters: 2
	Flags: Linked
*/
function function_38841344(e_target, n_index)
{
	do
	{
		function_259e1449(n_index);
	}
	while(isdefined(e_target) && !can_hit_target(e_target, n_index));
}

/*
	Name: enable
	Namespace: turret
	Checksum: 0x3F3C045F
	Offset: 0x3058
	Size: 0xD8
	Parameters: 3
	Flags: Linked
*/
function enable(n_index, b_user_required, v_offset)
{
	if(isalive(self) && !is_turret_enabled(n_index))
	{
		_get_turret_data(n_index).is_enabled = 1;
		_set_turret_needs_user(n_index, is_true(b_user_required));
		self thread _turret_think(n_index, v_offset);
		self notify("turret_enabled" + _index(n_index));
	}
}

/*
	Name: enable_auto_use
	Namespace: turret
	Checksum: 0xA64D917B
	Offset: 0x3138
	Size: 0x2A
	Parameters: 1
	Flags: None
*/
function enable_auto_use(b_enable)
{
	if(!isdefined(b_enable))
	{
		b_enable = 1;
	}
	self.script_auto_use = b_enable;
}

/*
	Name: disable_ai_getoff
	Namespace: turret
	Checksum: 0x13341ED
	Offset: 0x3170
	Size: 0x42
	Parameters: 2
	Flags: None
*/
function disable_ai_getoff(n_index, b_disable)
{
	if(!isdefined(b_disable))
	{
		b_disable = 1;
	}
	_get_turret_data(n_index).disable_ai_getoff = b_disable;
}

/*
	Name: disable
	Namespace: turret
	Checksum: 0x2D540280
	Offset: 0x31C0
	Size: 0xE8
	Parameters: 1
	Flags: Linked
*/
function disable(n_index)
{
	if(is_turret_enabled(n_index))
	{
		s_turret = _get_turret_data(n_index);
		s_turret.is_enabled = 0;
		s_turret.var_aa100948 = 0;
		function_14223170(n_index);
		clear_target(n_index);
		unpause(n_index);
		self turretsettargetangles(n_index, (0, 0, 0));
		self notify("turret_disabled" + _index(n_index));
	}
}

/*
	Name: pause
	Namespace: turret
	Checksum: 0xF5436B83
	Offset: 0x32B0
	Size: 0xB4
	Parameters: 2
	Flags: Linked
*/
function pause(time, n_index)
{
	s_turret = _get_turret_data(n_index);
	if(time > 0)
	{
		time = int(time * 1000);
	}
	if(isdefined(s_turret.pause))
	{
		s_turret.pause_time = s_turret.pause_time + time;
	}
	else
	{
		s_turret.pause = 1;
		s_turret.pause_time = time;
		stop(n_index);
	}
}

/*
	Name: unpause
	Namespace: turret
	Checksum: 0x10D9487B
	Offset: 0x3370
	Size: 0x58
	Parameters: 1
	Flags: Linked
*/
function unpause(n_index)
{
	s_turret = _get_turret_data(n_index);
	s_turret.pause = undefined;
	self notify("_turret_unpaused" + _index(n_index));
}

/*
	Name: function_12269140
	Namespace: turret
	Checksum: 0x460F373C
	Offset: 0x33D0
	Size: 0x144
	Parameters: 2
	Flags: Linked
*/
function function_12269140(target, n_index)
{
	if(!isdefined(n_index))
	{
		n_index = 0;
	}
	s_turret = _get_turret_data(n_index);
	v_pos = (isdefined(target.origin) ? target.origin : target);
	if(!isdefined(s_turret.var_bf6d793d))
	{
		return 1;
	}
	var_8ee48240 = cos(s_turret.var_bf6d793d.aimyawanglel);
	v_angles = (isdefined(s_turret.node) ? s_turret.node.angles : self.angles);
	v_to_enemy = vectornormalize(v_pos - self.origin);
	dot = vectordot(v_to_enemy, anglestoforward(v_angles));
	return dot >= var_8ee48240;
}

/*
	Name: _turret_think
	Namespace: turret
	Checksum: 0x181134D8
	Offset: 0x3520
	Size: 0x50E
	Parameters: 2
	Flags: Linked
*/
function _turret_think(n_index, v_offset)
{
	turret_think_time = max(1.5, get_weapon(n_index).firetime);
	no_target_start_time = 0;
	self endon(#"death", "turret_disabled" + _index(n_index));
	var_17b7891d = "39918986e1a7d45f" + _index(n_index);
	self notify(var_17b7891d);
	self endon(var_17b7891d);
	/#
		self thread _debug_turret_think(n_index);
	#/
	self thread _turret_health_monitor(n_index);
	s_turret = _get_turret_data(n_index);
	if(isdefined(s_turret.has_laser))
	{
		self laseron();
	}
	while(true)
	{
		s_turret flag::wait_till_clear("turret manual");
		n_time_now = gettime();
		if(self _check_for_paused(n_index) || is_true(self.emped) || is_true(self.stunned))
		{
			self waittilltimeout(turret_think_time, "_turret_unpaused" + _index(n_index));
			continue;
		}
		target = s_turret.target;
		if(!isdefined(target) || (isentity(target) && !isalive(target)))
		{
			stop(n_index);
		}
		if(is_true(s_turret.var_73446dab))
		{
			self thread function_1358b930(n_index);
		}
		e_original_next_target = s_turret.e_next_target;
		if(!is_true(s_turret.var_f351ad56) || (isactor(s_turret.target) && !isalive(s_turret.target)))
		{
			s_turret.e_next_target = _get_best_target(n_index);
		}
		if(isdefined(s_turret.e_next_target))
		{
			no_target_start_time = 0;
			if(_user_check(n_index))
			{
				self thread _shoot_turret_at_target(s_turret.e_next_target, v_offset, n_index);
				if(s_turret.e_next_target !== e_original_next_target)
				{
					self notify(#"has_new_target", {#target:s_turret.e_next_target});
				}
			}
		}
		else
		{
			if(!isdefined(self.do_not_clear_targets_during_think) || !self.do_not_clear_targets_during_think)
			{
				clear_target(n_index);
			}
			if(no_target_start_time == 0)
			{
				no_target_start_time = n_time_now;
			}
			target_wait_time = n_time_now - no_target_start_time;
			if(isdefined(s_turret.occupy_no_target_time))
			{
				occupy_time = s_turret.occupy_no_target_time;
			}
			else
			{
				occupy_time = 3600;
			}
			if(!is_true(s_turret.disable_ai_getoff))
			{
				bwasplayertarget = isdefined(s_turret.e_last_target) && isplayer(s_turret.e_last_target) && isalive(s_turret.e_last_target);
				if(bwasplayertarget)
				{
					occupy_time = occupy_time / 4;
				}
			}
			else
			{
				bwasplayertarget = 0;
			}
			if(target_wait_time >= occupy_time)
			{
				_drop_turret(n_index, !bwasplayertarget);
			}
		}
		wait(turret_think_time);
	}
}

/*
	Name: _turret_health_monitor
	Namespace: turret
	Checksum: 0xDD513FDE
	Offset: 0x3A38
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function _turret_health_monitor(n_index)
{
	self endon(#"death");
	waitframe(1);
	_turret_health_monitor_loop(n_index);
	self disable(n_index);
}

/*
	Name: _turret_health_monitor_loop
	Namespace: turret
	Checksum: 0xB38AEB6D
	Offset: 0x3A98
	Size: 0x88
	Parameters: 1
	Flags: Linked
*/
function _turret_health_monitor_loop(n_index)
{
	self endon(#"death", "turret_disabled" + _index(n_index));
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"broken");
		if(waitresult.type === ("turret_destroyed_" + n_index))
		{
			return;
		}
	}
}

/*
	Name: function_1358b930
	Namespace: turret
	Checksum: 0x8D1FFE35
	Offset: 0x3B28
	Size: 0x3CC
	Parameters: 1
	Flags: Linked
*/
function function_1358b930(n_index)
{
	self endon(#"death", "turret_disabled" + _index(n_index), "_turret_think" + _index(n_index), #"exit_vehicle");
	var_17b7891d = "7c695ce9fd51af1d" + _index(n_index);
	self notify(var_17b7891d);
	self endon(var_17b7891d);
	ai_user = self get_user(n_index);
	if(!isdefined(ai_user))
	{
		return;
	}
	/#
		if(getdvarint(#"hash_47a40f04e7c48117", 0))
		{
			return;
		}
	#/
	s_turret = _get_turret_data(n_index);
	var_8bcad4e7 = 0;
	var_f72902ad = undefined;
	var_324bed9c = 0.1736482;
	if(isdefined(s_turret.var_bf6d793d))
	{
		var_324bed9c = cos(s_turret.var_bf6d793d.aimyawanglel);
	}
	while(!isdefined(var_f72902ad))
	{
		time = gettime();
		if(time - var_8bcad4e7 > 500)
		{
			var_8bcad4e7 = time;
			players = getplayers();
			foreach(player in players)
			{
				if(!util::function_fbce7263(self.team, player.team))
				{
					continue;
				}
				if((abs(ai_user.origin[2] - player.origin[2])) <= 60 && distance2dsquared(ai_user.origin, player.origin) <= sqr(300))
				{
					var_f72902ad = player;
					break;
				}
				if(ai_user cansee(player) || is_target(player, n_index))
				{
					toenemy = vectornormalize(player.origin - ai_user.origin);
					dot = vectordot(toenemy, anglestoforward(s_turret.node.angles));
					if(dot < var_324bed9c)
					{
						var_f72902ad = player;
						break;
					}
				}
			}
		}
		waitframe(1);
	}
	ai_user = get_user(n_index);
	ai_user.var_2df45b5d = var_f72902ad;
	self thread _drop_turret(n_index, 0);
}

/*
	Name: _listen_for_damage_on_actor
	Namespace: turret
	Checksum: 0xCCD565F8
	Offset: 0x3F00
	Size: 0x10E
	Parameters: 2
	Flags: None
*/
function _listen_for_damage_on_actor(ai_user, n_index)
{
	self endon(#"death");
	ai_user endon(#"death");
	self endon("turret_disabled" + _index(n_index), "_turret_think" + _index(n_index), #"exit_vehicle");
	while(true)
	{
		waitresult = undefined;
		waitresult = ai_user waittill(#"damage");
		s_turret = _get_turret_data(n_index);
		if(isdefined(s_turret))
		{
			if(!isdefined(s_turret.e_next_target) && !isdefined(s_turret.target))
			{
				s_turret.e_last_target = waitresult.attacker;
			}
		}
	}
}

/*
	Name: _waittill_user_change
	Namespace: turret
	Checksum: 0x4A6A8AB5
	Offset: 0x4018
	Size: 0xD2
	Parameters: 1
	Flags: None
*/
function _waittill_user_change(n_index)
{
	ai_user = self getseatoccupant(n_index);
	if(isalive(ai_user))
	{
		if(isactor(ai_user))
		{
			ai_user endon(#"death");
		}
		else if(util::function_8e89351(ai_user))
		{
			self notify("turret_disabled" + _index(n_index));
		}
	}
	self waittill(#"exit_vehicle", #"enter_vehicle");
}

/*
	Name: _check_for_paused
	Namespace: turret
	Checksum: 0x5882EC10
	Offset: 0x40F8
	Size: 0xB6
	Parameters: 1
	Flags: Linked
*/
function _check_for_paused(n_index)
{
	s_turret = _get_turret_data(n_index);
	s_turret.pause_start_time = gettime();
	while(isdefined(s_turret.pause))
	{
		if(s_turret.pause_time > 0)
		{
			time = gettime();
			paused_time = time - s_turret.pause_start_time;
			if(paused_time > s_turret.pause_time)
			{
				s_turret.pause = undefined;
				return true;
			}
		}
		else
		{
			return true;
		}
		waitframe(1);
	}
	return false;
}

/*
	Name: _drop_turret
	Namespace: turret
	Checksum: 0x529FD3FF
	Offset: 0x41B8
	Size: 0x12C
	Parameters: 2
	Flags: Linked
*/
function _drop_turret(n_index, bexitifautomatedonly)
{
	ai_user = get_user(n_index);
	if(isalive(ai_user) && !isbot(ai_user) && !isplayer(ai_user) && (is_true(ai_user.turret_auto_use) || !is_true(bexitifautomatedonly)))
	{
		if(!isdefined(ai_user.vehicle) && ai_user islinkedto(self))
		{
			self get_out(ai_user, n_index);
		}
		else
		{
			vehicle::get_out(self, ai_user, "gunner1");
		}
	}
}

/*
	Name: does_have_target
	Namespace: turret
	Checksum: 0xAC981151
	Offset: 0x42F0
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function does_have_target(n_index)
{
	return isdefined(_get_turret_data(n_index).e_next_target);
}

/*
	Name: _user_check
	Namespace: turret
	Checksum: 0x16D35920
	Offset: 0x4328
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function _user_check(n_index)
{
	s_turret = _get_turret_data(n_index);
	if(does_need_user(n_index))
	{
		b_has_user = does_have_user(n_index);
		return b_has_user;
	}
	return 1;
}

/*
	Name: function_2a4a311
	Namespace: turret
	Checksum: 0x41E866EB
	Offset: 0x43A8
	Size: 0x1F8
	Parameters: 1
	Flags: Linked
*/
function function_2a4a311(n_index)
{
	var_17b7891d = "907c70077bef476" + _index(n_index);
	self notify(var_17b7891d);
	self endon(var_17b7891d);
	self endon(#"death");
	s_turret = _get_turret_data(n_index);
	if(!isdefined(s_turret.node))
	{
		return;
	}
	var_f449d788 = sqr(s_turret.var_43ce86ed);
	while(true)
	{
		s_notify = undefined;
		s_notify = self waittill(#"hash_4ecf2bd2fb1d75d9");
		ai_actor = s_notify.entity;
		if(isalive(ai_actor) && !ai_actor flag::get(#"hash_1b89f498c2647e6"))
		{
			if(ai_actor.isarriving)
			{
				while(isalive(ai_actor) && ai_actor.isarriving)
				{
					waitframe(1);
				}
				get_in(ai_actor, n_index);
			}
			else if(distance2dsquared(ai_actor.origin, s_turret.node.origin) <= var_f449d788)
			{
				if(isdefined(ai_actor.var_41adb97) && gettime() < ai_actor.var_41adb97)
				{
					continue;
				}
				get_in(ai_actor, n_index);
			}
		}
	}
}

/*
	Name: _debug_turret_think
	Namespace: turret
	Checksum: 0xABFAF438
	Offset: 0x45A8
	Size: 0x6DE
	Parameters: 1
	Flags: None
*/
function _debug_turret_think(n_index)
{
	/#
		self endon(#"death", "" + _index(n_index), "" + _index(n_index));
		s_turret = _get_turret_data(n_index);
		var_34c31abc = (1, 1, 0);
		n_spacing = vectorscale((0, 0, -1), 7);
		while(true)
		{
			if(!getdvarint(#"g_debugturrets", 0))
			{
				wait(0.2);
				continue;
			}
			var_83570f5f = [];
			var_83570f5f[var_83570f5f.size] = "" + self getentnum();
			str_target = "";
			target = s_turret.target;
			if(isdefined(target))
			{
				if(isvec(target))
				{
					str_target = str_target + ("" + target);
				}
				else
				{
					if(isactor(target))
					{
						str_target = str_target + ("" + target getentnum());
					}
					else
					{
						if(isplayer(target))
						{
							str_target = str_target + ("" + target getentnum());
						}
						else
						{
							if(isvehicle(target))
							{
								str_target = str_target + ("" + target getentnum());
							}
							else
							{
								if(isdefined(target.targetname) && target.targetname == "")
								{
									str_target = str_target + "";
								}
								else if(isdefined(target.classname))
								{
									str_target = str_target + target.classname;
								}
							}
						}
					}
				}
			}
			else
			{
				str_target = str_target + "";
			}
			var_83570f5f[var_83570f5f.size] = str_target;
			var_3be47a2d = "";
			if(isdefined(s_turret.pause))
			{
				var_3be47a2d = var_3be47a2d + "";
			}
			else
			{
				if(s_turret.n_burst_time < s_turret.n_burst_fire_time)
				{
					var_3be47a2d = var_3be47a2d + ("" + (s_turret.n_burst_fire_time - s_turret.n_burst_time));
				}
				else
				{
					var_3be47a2d = var_3be47a2d + "";
				}
			}
			var_83570f5f[var_83570f5f.size] = var_3be47a2d;
			str_behavior = "";
			if(isdefined(s_turret.var_50fbd548) && isvec(s_turret.target) && s_turret.target == s_turret.var_50fbd548)
			{
				str_behavior = str_behavior + "";
			}
			else
			{
				if(s_turret flag::get(#"turret manual"))
				{
					str_behavior = str_behavior + "";
				}
				else
				{
					str_behavior = str_behavior + "";
				}
			}
			var_83570f5f[var_83570f5f.size] = str_behavior;
			var_83570f5f[var_83570f5f.size] = "" + (isdefined(s_turret.favoriteenemy) ? "" + s_turret.favoriteenemy getentnum() : "");
			var_83570f5f[var_83570f5f.size] = "" + is_true(s_turret.var_cd8600bd);
			var_83570f5f[var_83570f5f.size] = "" + is_true(s_turret.b_ignore_line_of_sight);
			var_83570f5f[var_83570f5f.size] = "" + is_true(s_turret.var_f351ad56);
			var_83570f5f[var_83570f5f.size] = "" + is_true(s_turret.perfectaim);
			var_83570f5f[var_83570f5f.size] = "" + is_true(s_turret.var_d55528ca);
			var_83570f5f[var_83570f5f.size] = "" + is_true(s_turret.var_2890139c);
			if(s_turret.n_last_fire_time == gettime())
			{
				var_83570f5f[var_83570f5f.size] = "";
			}
			for(i = 0; i < var_83570f5f.size; i++)
			{
				record3dtext(var_83570f5f[i], self.origin + (n_spacing * i), var_34c31abc, "", self);
			}
			if(isdefined(s_turret.target))
			{
				v_end = (isvec(s_turret.target) ? s_turret.target : s_turret.target.origin);
				v_start = (isdefined(self gettagorigin(s_turret.str_tag_flash)) ? self gettagorigin(s_turret.str_tag_flash) : self.origin);
				v_color = (function_12269140(v_end, n_index) ? (0, 1, 0) : (1, 0, 0));
				line(v_start, v_end, v_color);
			}
			waitframe(1);
		}
	#/
}

/*
	Name: _get_turret_data
	Namespace: turret
	Checksum: 0x6BCB0800
	Offset: 0x4C90
	Size: 0xA2
	Parameters: 1
	Flags: Linked
*/
function _get_turret_data(n_index)
{
	if(!isdefined(n_index))
	{
		n_index = 0;
	}
	s_turret = undefined;
	if(isvehicle(self))
	{
		if(isdefined(self.a_turrets) && isdefined(self.a_turrets[n_index]))
		{
			s_turret = self.a_turrets[n_index];
		}
	}
	else
	{
		s_turret = self._turret;
	}
	if(!isdefined(s_turret))
	{
		s_turret = _init_turret(n_index);
	}
	return s_turret;
}

/*
	Name: has_turret
	Namespace: turret
	Checksum: 0x6194FE69
	Offset: 0x4D40
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function has_turret(n_index)
{
	if(isdefined(self.a_turrets) && isdefined(self.a_turrets[n_index]))
	{
		return true;
	}
	return false;
}

/*
	Name: _update_turret_arcs
	Namespace: turret
	Checksum: 0x3E5DCEA7
	Offset: 0x4D80
	Size: 0x8E
	Parameters: 1
	Flags: Linked
*/
function _update_turret_arcs(n_index)
{
	s_turret = _get_turret_data(n_index);
	s_turret.rightarc = s_turret.w_weapon.rightarc;
	s_turret.leftarc = s_turret.w_weapon.leftarc;
	s_turret.toparc = s_turret.w_weapon.toparc;
	s_turret.bottomarc = s_turret.w_weapon.bottomarc;
}

/*
	Name: _init_turret
	Namespace: turret
	Checksum: 0xE614D8E3
	Offset: 0x4E18
	Size: 0x2D0
	Parameters: 1
	Flags: Linked
*/
function _init_turret(n_index)
{
	if(!isdefined(n_index))
	{
		n_index = 0;
	}
	self endon(#"death");
	w_weapon = get_weapon(n_index);
	if(w_weapon.name == #"none")
	{
		/#
			assertmsg("");
		#/
		return;
	}
	util::waittill_asset_loaded("xmodel", self.model);
	s_turret = _init_vehicle_turret(n_index);
	s_turret.w_weapon = w_weapon;
	_update_turret_arcs(n_index);
	s_turret.is_enabled = 0;
	s_turret.target = undefined;
	s_turret.e_parent = self;
	s_turret.var_73446dab = 1;
	s_turret.var_cd8600bd = 0;
	s_turret.var_30e97b22 = 0;
	s_turret.var_d55528ca = 0;
	s_turret.var_7394b9dc = 0;
	s_turret.b_ignore_line_of_sight = 0;
	s_turret.var_2890139c = 0;
	s_turret.var_aa100948 = 0;
	s_turret.var_f351ad56 = 0;
	s_turret.v_offset = (0, 0, 0);
	s_turret.var_50fbd548 = undefined;
	s_turret.n_burst_fire_time = 0;
	s_turret.n_burst_time = 0;
	s_turret.n_burst_wait = 0;
	s_turret.n_index = n_index;
	s_turret.n_last_fire_time = 0;
	s_turret.var_43ce86ed = 36;
	s_turret.var_b52bbdba = 1;
	s_turret.var_72f4d1b7 = 0.5;
	s_turret.str_weapon_type = w_weapon.type;
	s_turret.str_guidance_type = w_weapon.guidedmissiletype;
	if(isdefined(self.target))
	{
		s_turret.node = getnode(self.target, "targetname");
	}
	if(isdefined(w_weapon.var_41999ad2))
	{
		s_turret.var_bf6d793d = getscriptbundle(w_weapon.var_41999ad2);
	}
	set_on_target_angle(1, n_index);
	s_turret flag::init("turret manual");
	self thread function_2a4a311(n_index);
	return s_turret;
}

/*
	Name: _init_vehicle_turret
	Namespace: turret
	Checksum: 0xE5A5C691
	Offset: 0x50F0
	Size: 0x220
	Parameters: 1
	Flags: Linked
*/
function _init_vehicle_turret(n_index)
{
	/#
		assert(isdefined(n_index) && n_index >= 0, "");
	#/
	s_turret = spawnstruct();
	switch(n_index)
	{
		case 0:
		{
			s_turret.str_tag_flash = "tag_flash";
			s_turret.str_tag_pivot = "tag_barrel";
			break;
		}
		case 1:
		{
			s_turret.str_tag_flash = "tag_gunner_flash1";
			s_turret.str_tag_pivot = "tag_gunner_barrel1";
			break;
		}
		case 2:
		{
			s_turret.str_tag_flash = "tag_gunner_flash2";
			s_turret.str_tag_pivot = "tag_gunner_barrel2";
			break;
		}
		case 3:
		{
			s_turret.str_tag_flash = "tag_gunner_flash3";
			s_turret.str_tag_pivot = "tag_gunner_barrel3";
			break;
		}
		case 4:
		{
			s_turret.str_tag_flash = "tag_gunner_flash4";
			s_turret.str_tag_pivot = "tag_gunner_barrel4";
			break;
		}
	}
	if(self.vehicleclass === "helicopter")
	{
		s_turret.e_trace_ignore = self;
	}
	if(!isdefined(self.a_turrets))
	{
		self.a_turrets = [];
	}
	self.a_turrets[n_index] = s_turret;
	if(n_index > 0)
	{
		tag_origin = self gettagorigin(_get_gunner_tag_for_turret_index(n_index));
		if(isdefined(tag_origin))
		{
			_set_turret_needs_user(n_index, 1);
		}
	}
	return s_turret;
}

/*
	Name: function_14223170
	Namespace: turret
	Checksum: 0x27A5ABCE
	Offset: 0x5318
	Size: 0x5A
	Parameters: 1
	Flags: Linked
*/
function function_14223170(n_index)
{
	if(!isdefined(n_index))
	{
		n_index = 0;
	}
	s_turret = _get_turret_data(n_index);
	s_turret.n_burst_time = 0;
	s_turret.n_burst_fire_time = 0;
	s_turret.n_burst_wait = 0;
}

/*
	Name: _burst_fire
	Namespace: turret
	Checksum: 0x9D77A933
	Offset: 0x5380
	Size: 0x1FC
	Parameters: 1
	Flags: Linked
*/
function _burst_fire(n_index)
{
	self endon(#"drone_death", #"death", "_stop_turret" + _index(n_index), "turret_disabled" + _index(n_index), #"terminate_all_turrets_firing", #"exit_vehicle", "turret manual" + _index(n_index));
	s_turret = _get_turret_data(n_index);
	s_turret.n_burst_time = 0;
	s_turret.n_burst_fire_time = _get_burst_fire_time(n_index);
	s_turret.n_burst_wait = _get_burst_wait_time(n_index);
	w_weapon = get_weapon(n_index);
	var_a2524721 = 0;
	n_fire_time = (w_weapon.firetime > 0 ? w_weapon.firetime : 0.016);
	n_shots = ceil(s_turret.n_burst_fire_time / n_fire_time);
	for(i = 0; i < n_shots; i++)
	{
		s_turret.n_burst_time = s_turret.n_burst_time + n_fire_time;
		var_a2524721 = s_turret.n_burst_time >= s_turret.n_burst_fire_time;
		fire(n_index);
		wait(n_fire_time);
	}
	if(var_a2524721)
	{
		wait(s_turret.n_burst_wait);
	}
}

/*
	Name: _get_burst_fire_time
	Namespace: turret
	Checksum: 0xB13A5ACC
	Offset: 0x5588
	Size: 0xE2
	Parameters: 1
	Flags: Linked
*/
function _get_burst_fire_time(n_index)
{
	s_turret = _get_turret_data(n_index);
	n_time = undefined;
	if(isdefined(s_turret.n_burst_fire_min) && isdefined(s_turret.n_burst_fire_max))
	{
		if(s_turret.n_burst_fire_min == s_turret.n_burst_fire_max)
		{
			n_time = s_turret.n_burst_fire_min;
		}
		else
		{
			n_time = randomfloatrange(s_turret.n_burst_fire_min, s_turret.n_burst_fire_max);
		}
	}
	else if(isdefined(s_turret.n_burst_fire_max))
	{
		n_time = randomfloatrange(0, s_turret.n_burst_fire_max);
	}
	return n_time;
}

/*
	Name: _get_burst_wait_time
	Namespace: turret
	Checksum: 0x8051EB24
	Offset: 0x5678
	Size: 0xE2
	Parameters: 1
	Flags: Linked
*/
function _get_burst_wait_time(n_index)
{
	s_turret = _get_turret_data(n_index);
	n_time = 0;
	if(isdefined(s_turret.n_burst_wait_min) && isdefined(s_turret.n_burst_wait_max))
	{
		if(s_turret.n_burst_wait_min == s_turret.n_burst_wait_max)
		{
			n_time = s_turret.n_burst_wait_min;
		}
		else
		{
			n_time = randomfloatrange(s_turret.n_burst_wait_min, s_turret.n_burst_wait_max);
		}
	}
	else if(isdefined(s_turret.n_burst_wait_max))
	{
		n_time = randomfloatrange(0, s_turret.n_burst_wait_max);
	}
	return n_time;
}

/*
	Name: _index
	Namespace: turret
	Checksum: 0x3563E7F7
	Offset: 0x5768
	Size: 0x2A
	Parameters: 1
	Flags: Linked
*/
function _index(n_index)
{
	return (isdefined(n_index) ? "" + n_index : "");
}

/*
	Name: _get_best_target
	Namespace: turret
	Checksum: 0xF11D33B0
	Offset: 0x57A0
	Size: 0x1CA
	Parameters: 1
	Flags: Linked
*/
function _get_best_target(n_index)
{
	e_best_target = undefined;
	self util::make_sentient();
	switch(n_index)
	{
		case 0:
		{
			e_best_target = self.enemy;
			break;
		}
		case 1:
		{
			e_best_target = self.gunner1enemy;
			break;
		}
		case 2:
		{
			e_best_target = self.gunner2enemy;
			break;
		}
		case 3:
		{
			e_best_target = self.gunner3enemy;
			break;
		}
		case 4:
		{
			e_best_target = self.gunner4enemy;
			break;
		}
	}
	s_turret = _get_turret_data(n_index);
	if(is_true(s_turret.var_30e97b22) && isdefined(self.enemy))
	{
		e_best_target = self.enemy;
	}
	if(issentient(self))
	{
		self.favoriteenemy = undefined;
		self.perfectaim = is_true(s_turret.perfectaim);
		if(isdefined(s_turret.favoriteenemy) && issentient(s_turret.favoriteenemy))
		{
			self.favoriteenemy = s_turret.favoriteenemy;
			e_best_target = s_turret.favoriteenemy;
		}
	}
	return e_best_target;
}

/*
	Name: can_hit_target
	Namespace: turret
	Checksum: 0x438A58E3
	Offset: 0x5978
	Size: 0x1AA
	Parameters: 2
	Flags: Linked
*/
function can_hit_target(e_target, n_index)
{
	s_turret = _get_turret_data(n_index);
	v_offset = _get_default_target_offset(e_target, n_index);
	b_current_target = is_target(e_target, n_index);
	if(isdefined(e_target) && is_true(e_target.ignoreme))
	{
		return 0;
	}
	b_trace_passed = 1;
	if(!s_turret.b_ignore_line_of_sight)
	{
		if(issentient(e_target) && (!isdefined(v_offset) || v_offset === (0, 0, 0)))
		{
			v_offset = e_target geteyeapprox() - e_target.origin;
		}
		b_trace_passed = trace_test(e_target, v_offset - (0, 0, (isvehicle(e_target) ? 0 : (isdefined(s_turret.n_torso_targetting_offset) ? s_turret.n_torso_targetting_offset : 0))), n_index);
	}
	if(b_current_target && !b_trace_passed && !isdefined(s_turret.n_time_lose_sight))
	{
		s_turret.n_time_lose_sight = gettime();
	}
	return b_trace_passed;
}

/*
	Name: trace_test
	Namespace: turret
	Checksum: 0xB4C6F8E6
	Offset: 0x5B30
	Size: 0x27E
	Parameters: 3
	Flags: Linked
*/
function trace_test(e_target, v_offset, n_index)
{
	if(!isdefined(v_offset))
	{
		v_offset = (0, 0, 0);
	}
	if(isdefined(self.good_old_style_turret_tracing))
	{
		s_turret = _get_turret_data(n_index);
		v_start_org = self gettagorigin(s_turret.str_tag_pivot);
		if(e_target sightconetrace(v_start_org, self) > 0.2)
		{
			v_target = e_target.origin + v_offset;
			v_start_org = v_start_org + ((vectornormalize(v_target - v_start_org)) * 50);
			a_trace = bullettrace(v_start_org, v_target, 1, s_turret.e_trace_ignore, 0, 1);
			if(a_trace[#"fraction"] > 0.6)
			{
				return true;
			}
		}
		return false;
	}
	s_turret = _get_turret_data(n_index);
	v_start_org = self gettagorigin(s_turret.str_tag_pivot);
	v_target = (isvec(e_target) ? e_target : e_target.origin) + v_offset;
	if(sessionmodeismultiplayergame() || sessionmodeiswarzonegame() && isplayer(e_target))
	{
		v_target = e_target getshootatpos();
	}
	if(distancesquared(v_start_org, v_target) < 10000)
	{
		return true;
	}
	v_dir_to_target = vectornormalize(v_target - v_start_org);
	v_start_org = v_start_org + (v_dir_to_target * 50);
	if(sighttracepassed(v_start_org, v_target, 0, self, e_target))
	{
		return true;
	}
	return false;
}

/*
	Name: function_3a7e640f
	Namespace: turret
	Checksum: 0x84E284D8
	Offset: 0x5DB8
	Size: 0x42
	Parameters: 2
	Flags: None
*/
function function_3a7e640f(b_ignore, n_index)
{
	s_turret = _get_turret_data(n_index);
	s_turret.var_7394b9dc = b_ignore;
}

/*
	Name: set_ignore_line_of_sight
	Namespace: turret
	Checksum: 0xD78CC31E
	Offset: 0x5E08
	Size: 0x42
	Parameters: 2
	Flags: None
*/
function set_ignore_line_of_sight(b_ignore, n_index)
{
	s_turret = _get_turret_data(n_index);
	s_turret.b_ignore_line_of_sight = b_ignore;
}

/*
	Name: function_8bbe7822
	Namespace: turret
	Checksum: 0x90201C44
	Offset: 0x5E58
	Size: 0x42
	Parameters: 2
	Flags: None
*/
function function_8bbe7822(b_ignore, n_index)
{
	s_turret = _get_turret_data(n_index);
	s_turret.var_2890139c = b_ignore;
}

/*
	Name: function_bb42e3e2
	Namespace: turret
	Checksum: 0x96367D2C
	Offset: 0x5EA8
	Size: 0x42
	Parameters: 2
	Flags: None
*/
function function_bb42e3e2(var_7994b8bf, n_index)
{
	s_turret = _get_turret_data(n_index);
	s_turret.var_30e97b22 = var_7994b8bf;
}

/*
	Name: function_f5e3e1de
	Namespace: turret
	Checksum: 0xE9A472C0
	Offset: 0x5EF8
	Size: 0x42
	Parameters: 2
	Flags: None
*/
function function_f5e3e1de(b_enabled, n_index)
{
	s_turret = _get_turret_data(n_index);
	s_turret.var_cd8600bd = b_enabled;
}

/*
	Name: function_69546b4e
	Namespace: turret
	Checksum: 0x59198334
	Offset: 0x5F48
	Size: 0x42
	Parameters: 2
	Flags: None
*/
function function_69546b4e(b_allow, n_index)
{
	s_turret = _get_turret_data(n_index);
	s_turret.var_73446dab = b_allow;
}

/*
	Name: set_occupy_no_target_time
	Namespace: turret
	Checksum: 0x24B50F0D
	Offset: 0x5F98
	Size: 0x42
	Parameters: 2
	Flags: None
*/
function set_occupy_no_target_time(time, n_index)
{
	s_turret = _get_turret_data(n_index);
	s_turret.occupy_no_target_time = time;
}

/*
	Name: toggle_lensflare
	Namespace: turret
	Checksum: 0x9DEF886D
	Offset: 0x5FE8
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function toggle_lensflare(bool)
{
	self clientfield::set("toggle_lensflare", bool);
}

/*
	Name: track_lens_flare
	Namespace: turret
	Checksum: 0xE3C0EDBA
	Offset: 0x6020
	Size: 0x15C
	Parameters: 0
	Flags: None
*/
function track_lens_flare()
{
	self endon(#"death");
	self notify(#"disable_lens_flare");
	self endon(#"disable_lens_flare");
	while(true)
	{
		e_target = self turretgettarget(0);
		if(self.turretontarget && (isdefined(e_target) && isplayer(e_target)))
		{
			if(isdefined(self gettagorigin("TAG_LASER")))
			{
				e_target util::waittill_player_looking_at(self gettagorigin("TAG_LASER"), 90);
				if(isdefined(e_target))
				{
					self toggle_lensflare(1);
					e_target util::waittill_player_not_looking_at(self gettagorigin("TAG_LASER"));
				}
				self toggle_lensflare(0);
			}
		}
		wait(0.5);
	}
}

/*
	Name: _get_gunner_tag_for_turret_index
	Namespace: turret
	Checksum: 0xA3BC5784
	Offset: 0x6188
	Size: 0xC2
	Parameters: 1
	Flags: Linked
*/
function _get_gunner_tag_for_turret_index(n_index)
{
	switch(n_index)
	{
		case 0:
		{
			return "tag_driver";
		}
		case 1:
		{
			return "tag_gunner1";
		}
		case 2:
		{
			return "tag_gunner2";
		}
		case 3:
		{
			return "tag_gunner3";
		}
		case 4:
		{
			return "tag_gunner4";
		}
		default:
		{
			/#
				assertmsg("");
			#/
		}
	}
}

