#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\string_shared.gsc;
#using scripts\core_common\player\player_shared.gsc;
#using script_32c8b5b0eb2854f3;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\animation_shared.gsc;

#namespace val;

/*
	Name: __init__system__
	Namespace: val
	Checksum: 0x4928D077
	Offset: 0x460
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"values", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: val
	Checksum: 0xAF5CABE5
	Offset: 0x4A8
	Size: 0x1104
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	register("takedamage", 1, "$self", &set_takedamage, "$value");
	default_func("takedamage", "$self", &default_takedamage);
	register("allowdeath", 1, "$self", &set_allowdeath, "$value");
	default_func("allowdeath", "$self", &default_allowdeath);
	register("magic_bullet_shield", 1, "$self", &function_87a1ac43, "$value");
	default_func("magic_bullet_shield", "$self", &function_aac507e5);
	link("magic_bullet_shield", "allowdeath", &function_49321c2b);
	link("magic_bullet_shield", "attackeraccuracy", &function_25ef3fee);
	register("attackeraccuracy", 1);
	default_value("attackeraccuracy", 1);
	register("ignoreme", 1, "$self", &set_ignoreme, "$value");
	default_value("ignoreme", 0);
	register("ignoreall", 1, "$self", &set_ignoreall, "$value");
	default_value("ignoreall", 0);
	register("take_weapons", 1, "$self", &set_takeweapons, "$value");
	default_value("take_weapons", 0);
	register("disable_weapons", 1, "$self", &set_disableweapons, "$value");
	default_value("disable_weapons", 0);
	register("disable_weapon_cycling", 1, "$self", &function_f609f22c, "$value");
	default_value("disable_weapon_cycling", 0);
	register("disable_weapon_reload", 1, "$self", &function_debe5863, "$value");
	default_value("disable_weapon_reload", 0);
	register("disable_weapon_pickup", 1, "$self", &function_15d061e0, "$value");
	default_value("disable_weapon_pickup", 0);
	register("disable_weapon_fire", 1, "$self", &function_16f5ac8e, "$value");
	default_value("disable_weapon_fire", 0);
	register("disable_offhand_weapons", 1, "$self", &set_disableoffhandweapons, "$value");
	default_value("disable_offhand_weapons", 0);
	register("disable_offhand_special", 1, "$self", &function_37c7ffcd, "$value");
	default_value("disable_offhand_special", 0);
	register("disable_aim_assist", 1, "$self", &function_ba94b5cd, "$value");
	default_value("disable_aim_assist", 0);
	register("disable_usability", 1, "$self", &function_737c794, "$value");
	default_value("disable_usability", 0);
	register("freezecontrols", 1, "$self", &freezecontrols, "$value");
	default_value("freezecontrols", 0);
	register("freezecontrols_allowlook", 1, "$self", &freezecontrolsallowlook, "$value");
	default_value("freezecontrols_allowlook", 0);
	register("disablegadgets", 1, "$self", &gadgetsdisabled, "$value");
	default_value("disablegadgets", 0);
	register("hide", 1, "$self", &set_hide, "$value");
	default_value("hide", 0);
	register("health_regen", 1, "$self", &set_health_regen, "$value");
	default_value("health_regen", 1);
	register("disable_health_regen_delay", 1, "$self", &set_disable_health_regen_delay, "$value");
	default_value("disable_health_regen_delay", 0);
	register("ignore_health_regen_delay", 1, "$self", &set_ignore_health_regen_delay, "$value");
	default_value("ignore_health_regen_delay", 0);
	register("show_hud", 1, "$self", &setclientuivisibilityflag, "hud_visible", "$value");
	default_value("show_hud", 1);
	register("show_weapon_hud", 1, "$self", &setclientuivisibilityflag, "weapon_hud_visible", "$value");
	default_value("show_weapon_hud", 1);
	register("show_crosshair", 1, "$self", &function_e0c7d69, "$value");
	default_value("show_crosshair", 1);
	register("show_compass", 1, "$self", &setclientuivisibilityflag, "radar_client", "$value");
	default_value("show_compass", 1);
	register("show_hit_marker", 1, "$self", &function_62318390, "$value");
	default_value("show_hit_marker", 1);
	register("disable_gestures", 1, "$self", &set_disablegestures, "$value");
	default_value("disable_gestures", 0);
	register("allow_jump", 1, "$self", &allowjump, "$value");
	default_value("allow_jump", 1);
	register("allow_double_jump", 1, "$self", &allowdoublejump, "$value");
	default_value("allow_double_jump", 1);
	register("allow_crouch", 1, "$self", &allowcrouch, "$value");
	default_value("allow_crouch", 1);
	register("allow_prone", 1, "$self", &allowprone, "$value");
	default_value("allow_prone", 1);
	register("allow_melee", 1, "$self", &allowmelee, "$value");
	default_value("allow_melee", 1);
	register("allow_melee_victim", 1, "$self", &allow_melee_victim, "$value");
	default_value("allow_melee_victim", 1);
	register("allow_climb", 1, "$self", &function_4f1b1444, "$value");
	default_value("allow_climb", 1);
	register("allow_mantle", 1, "$self", &allowmantle, "$value");
	default_value("allow_mantle", 1);
	register("allow_sprint", 1, "$self", &allowsprint, "$value");
	default_value("allow_sprint", 1);
	register("allow_ads", 1, "$self", &allowads, "$value");
	default_value("allow_ads", 1);
	register("allow_stand", 1, "$self", &allowstand, "$value");
	default_value("allow_stand", 1);
	register("allow_movement", 1, "$self", &allowmovement, "$value");
	default_value("allow_movement", 1);
	register("low_ready", 1, "$self", &setlowready, "$value");
	default_value("low_ready", 0);
	register("goalradius", 2048, "$self", &set_goal_radius, "$value");
	default_value("goalradius", 2048);
	register("push_player", 1, "$self", &pushplayer, "$value");
	default_value("push_player", 0);
	register("pre_load_ghost", 1, "$self", &function_2be6e08d, "$value");
	default_value("pre_load_ghost", 0);
	register("skip_death", 1, "$self", &function_2d53d03d, "$value");
	default_value("skip_death", 0);
	register("skip_scene_death", 1, "$self", &function_2014cd50, "$value");
	default_value("skip_scene_death", 0);
	/#
		level thread debug_values();
		validate("", "", &validate_takedamage);
		validate("", "", &arecontrolsfrozen);
		validate("", "", &function_5972c3cf);
		validate("", "", &gadgetsdisabled);
		validate("", "", &ishidden);
	#/
}

/*
	Name: register
	Namespace: val
	Checksum: 0x7AC357DE
	Offset: 0x15B8
	Size: 0x140
	Parameters: 5
	Flags: Linked, Variadic
*/
function register(str_name, var_3509ed3e, call_on, func, ...)
{
	if(!isdefined(call_on))
	{
		call_on = "$self";
	}
	if(!isdefined(level.values))
	{
		level.values = [];
	}
	a_registered = getarraykeys(level.values);
	if(isinarray(a_registered, hash(str_name)))
	{
		/#
			assertmsg(("" + str_name) + "");
		#/
		return;
	}
	s_value = spawnstruct();
	s_value.str_name = str_name;
	s_value.call_on = call_on;
	s_value.func = func;
	s_value.var_3509ed3e = var_3509ed3e;
	s_value.a_args = vararg;
	level.values[str_name] = s_value;
}

/*
	Name: assert_registered
	Namespace: val
	Checksum: 0xCCAA5CE0
	Offset: 0x1700
	Size: 0x94
	Parameters: 1
	Flags: Linked, Private
*/
function private assert_registered(str_name)
{
	/#
		a_registered = getarraykeys(level.values);
		if(!isinarray(a_registered, hash(str_name)))
		{
			/#
				assertmsg(("" + str_name) + "");
			#/
			return false;
		}
	#/
	return true;
}

/*
	Name: default_func
	Namespace: val
	Checksum: 0xF1115A83
	Offset: 0x17A0
	Size: 0x7E
	Parameters: 4
	Flags: Linked, Variadic
*/
function default_func(str_name, call_on, value, ...)
{
	if(assert_registered(str_name))
	{
		s_value = level.values[str_name];
		s_value.default_call_on = call_on;
		s_value.default_value = value;
		s_value.default_args = vararg;
	}
}

/*
	Name: default_value
	Namespace: val
	Checksum: 0x88053C4F
	Offset: 0x1828
	Size: 0x56
	Parameters: 2
	Flags: Linked
*/
function default_value(str_name, value)
{
	if(assert_registered(str_name))
	{
		s_value = level.values[str_name];
		s_value.default_value = value;
	}
}

/*
	Name: link
	Namespace: val
	Checksum: 0x2BEC4417
	Offset: 0x1888
	Size: 0x84
	Parameters: 3
	Flags: Linked
*/
function link(str_name, var_8e7e7e96, func)
{
	if(assert_registered(str_name))
	{
		s_value = level.values[str_name];
		s_value.links[var_8e7e7e96] = {#func:func, #name:var_8e7e7e96};
	}
}

/*
	Name: set
	Namespace: val
	Checksum: 0xE934FEDD
	Offset: 0x1918
	Size: 0x158
	Parameters: 3
	Flags: Linked
*/
function set(str_id, str_name, value)
{
	if(assert_registered(str_name))
	{
		if(!isdefined(value))
		{
			value = level.values[str_name].var_3509ed3e;
		}
		_push_value(str_id, str_name, value);
		_set_value(str_name, value);
	}
	if(isarray(level.values[str_name].links))
	{
		foreach(var_3c691af1 in level.values[str_name].links)
		{
			set(str_id, var_3c691af1.name, [[var_3c691af1.func]](value));
		}
	}
}

/*
	Name: function_3e65ae71
	Namespace: val
	Checksum: 0xD7F8C26F
	Offset: 0x1A78
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_3e65ae71(str_name, value)
{
	set(#"radiant", str_name, value);
}

/*
	Name: set_for_time
	Namespace: val
	Checksum: 0xE3A0249E
	Offset: 0x1AC0
	Size: 0x74
	Parameters: 4
	Flags: Linked
*/
function set_for_time(n_time, str_id, str_name, value)
{
	self endon(#"death");
	set(str_id, str_name, value);
	wait(n_time);
	reset(str_id, str_name);
}

/*
	Name: reset
	Namespace: val
	Checksum: 0xBF675B5D
	Offset: 0x1B40
	Size: 0x178
	Parameters: 2
	Flags: Linked
*/
function reset(str_id, str_name)
{
	n_index = _remove_value(str_id, str_name);
	if(!n_index)
	{
		if(isdefined(self.values[str_name]) && self.values[str_name].size > 0)
		{
			_set_value(str_name, self.values[str_name][0].value);
		}
		else
		{
			_set_default(str_name);
		}
	}
	if(isarray(level.values[str_name].links))
	{
		foreach(var_3c691af1 in level.values[str_name].links)
		{
			reset(str_id, var_3c691af1.name);
		}
	}
}

/*
	Name: reset_all
	Namespace: val
	Checksum: 0xCE7DB45C
	Offset: 0x1CC0
	Size: 0x144
	Parameters: 1
	Flags: Linked
*/
function reset_all(str_id)
{
	if(!isdefined(self.values))
	{
		return;
	}
	var_bb7c988d = arraycopy(self.values);
	foreach(var_ae0593af in var_bb7c988d)
	{
		foreach(state in var_ae0593af)
		{
			if(state.str_id === str_id)
			{
				self reset(str_id, var_629dd807);
			}
		}
	}
}

/*
	Name: function_ade0d537
	Namespace: val
	Checksum: 0xD8F0D96F
	Offset: 0x1E10
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_ade0d537(str_name)
{
	reset(#"radiant", str_name);
}

/*
	Name: nuke
	Namespace: val
	Checksum: 0x1B6BF19B
	Offset: 0x1E48
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function nuke(str_name)
{
	self.values[str_name] = [];
	_set_default(str_name);
}

/*
	Name: _push_value
	Namespace: val
	Checksum: 0x1E37B7A
	Offset: 0x1E88
	Size: 0xBC
	Parameters: 3
	Flags: Linked, Private
*/
function private _push_value(str_id, str_name, value)
{
	_remove_value(str_id, str_name);
	if(!isdefined(self.values))
	{
		self.values = [];
	}
	if(!isdefined(self.values[str_name]))
	{
		self.values[str_name] = [];
	}
	arrayinsert(self.values[str_name], {#value:value, #str_id:str_id}, 0);
}

/*
	Name: _remove_value
	Namespace: val
	Checksum: 0x52A003F6
	Offset: 0x1F50
	Size: 0x10A
	Parameters: 2
	Flags: Linked, Private
*/
function private _remove_value(str_id, str_name)
{
	if(!isdefined(self))
	{
		return -1;
	}
	if(isdefined(self.values) && isdefined(self.values[str_name]))
	{
		for(n_index = self.values[str_name].size - 1; n_index >= 0; n_index--)
		{
			if(self.values[str_name][n_index].str_id == str_id)
			{
				arrayremoveindex(self.values[str_name], n_index);
				break;
			}
		}
		if(!self.values[str_name].size)
		{
			self.values[str_name] = undefined;
			if(!self.values.size)
			{
				self.values = undefined;
			}
		}
	}
	return (isdefined(n_index) ? n_index : -1);
}

/*
	Name: _set_value
	Namespace: val
	Checksum: 0x1211CA4A
	Offset: 0x2068
	Size: 0xC8
	Parameters: 2
	Flags: Linked, Private
*/
function private _set_value(str_name, value)
{
	s_value = level.values[str_name];
	if(isdefined(s_value) && isdefined(s_value.func))
	{
		call_on = (s_value.call_on === "$self" ? self : s_value.call_on);
		util::single_func_argarray(call_on, s_value.func, _replace_values(s_value.a_args, value));
	}
	else
	{
		self.(str_name) = value;
	}
}

/*
	Name: _set_default
	Namespace: val
	Checksum: 0x5BA85D79
	Offset: 0x2138
	Size: 0xEC
	Parameters: 1
	Flags: Linked, Private
*/
function private _set_default(str_name)
{
	s_value = level.values[str_name];
	if(isdefined(s_value.default_value))
	{
		if(isfunctionptr(s_value.default_value))
		{
			call_on = (s_value.default_call_on === "$self" ? self : s_value.default_call_on);
			default_value = util::single_func_argarray(call_on, s_value.default_value, _replace_values(s_value.default_args));
		}
		else
		{
			default_value = s_value.default_value;
		}
		_set_value(str_name, default_value);
	}
}

/*
	Name: _replace_values
	Namespace: val
	Checksum: 0x798BF849
	Offset: 0x2230
	Size: 0x5A
	Parameters: 2
	Flags: Linked, Private
*/
function private _replace_values(a_args, value)
{
	a_args = array::replace(a_args, "$self", self);
	a_args = array::replace(a_args, "$value", value);
	return a_args;
}

/*
	Name: set_takedamage
	Namespace: val
	Checksum: 0xA6CE75D0
	Offset: 0x2298
	Size: 0x7E
	Parameters: 1
	Flags: Linked, Private
*/
function private set_takedamage(b_value)
{
	if(!isdefined(b_value))
	{
		b_value = 1;
	}
	if(isplayer(self))
	{
		if(b_value)
		{
			self disableinvulnerability();
		}
		else
		{
			self enableinvulnerability();
		}
	}
	else
	{
		self.takedamage = b_value;
	}
}

/*
	Name: default_takedamage
	Namespace: val
	Checksum: 0x62CF3A8
	Offset: 0x2320
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private default_takedamage()
{
	return issentient(self) || isvehicle(self);
}

/*
	Name: set_allowdeath
	Namespace: val
	Checksum: 0x385FE11D
	Offset: 0x2360
	Size: 0x2A
	Parameters: 1
	Flags: Linked, Private
*/
function private set_allowdeath(b_value)
{
	if(!isdefined(b_value))
	{
		b_value = 1;
	}
	self.allowdeath = b_value;
}

/*
	Name: default_allowdeath
	Namespace: val
	Checksum: 0xF68BD9B4
	Offset: 0x2398
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private default_allowdeath()
{
	return issentient(self) || isvehicle(self);
}

/*
	Name: function_87a1ac43
	Namespace: val
	Checksum: 0xA5DB14A7
	Offset: 0x23D8
	Size: 0x5C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_87a1ac43(b_value)
{
	if(!isdefined(b_value))
	{
		b_value = 1;
	}
	self.magic_bullet_shield = b_value;
	if(isactor(self))
	{
		self bloodimpact("hero");
	}
}

/*
	Name: function_aac507e5
	Namespace: val
	Checksum: 0xE5277355
	Offset: 0x2440
	Size: 0x44
	Parameters: 0
	Flags: Linked, Private
*/
function private function_aac507e5()
{
	self.magic_bullet_shield = undefined;
	if(isactor(self))
	{
		self bloodimpact("normal");
	}
}

/*
	Name: function_49321c2b
	Namespace: val
	Checksum: 0x4273B282
	Offset: 0x2490
	Size: 0x12
	Parameters: 1
	Flags: Linked, Private
*/
function private function_49321c2b(var_110b9b81)
{
	return !var_110b9b81;
}

/*
	Name: function_25ef3fee
	Namespace: val
	Checksum: 0x4679BD3E
	Offset: 0x24B0
	Size: 0x22
	Parameters: 1
	Flags: Linked, Private
*/
function private function_25ef3fee(var_110b9b81)
{
	return true;
}

/*
	Name: validate_takedamage
	Namespace: val
	Checksum: 0x3DA267C0
	Offset: 0x24E0
	Size: 0x42
	Parameters: 0
	Flags: Private
*/
function private validate_takedamage()
{
	if(isplayer(self))
	{
		return !self getinvulnerability();
	}
	return self.takedamage;
}

/*
	Name: set_takeweapons
	Namespace: val
	Checksum: 0x6C2F73CC
	Offset: 0x2530
	Size: 0xCC
	Parameters: 1
	Flags: Linked, Private
*/
function private set_takeweapons(b_value)
{
	if(!isdefined(b_value))
	{
		b_value = 1;
	}
	if(b_value)
	{
		if(!is_true(self.gun_removed))
		{
			if(isplayer(self))
			{
				self player::take_weapons();
			}
			else
			{
				self animation::detach_weapon();
			}
		}
	}
	else
	{
		if(isplayer(self))
		{
			self player::give_back_weapons();
		}
		else
		{
			self animation::attach_weapon();
		}
	}
}

/*
	Name: set_disableweapons
	Namespace: val
	Checksum: 0xB94291F5
	Offset: 0x2608
	Size: 0x6C
	Parameters: 1
	Flags: Linked, Private
*/
function private set_disableweapons(value)
{
	if(!isdefined(value))
	{
		value = 1;
	}
	if(value != 0)
	{
		self disableweapons((value === 2 ? 1 : 0));
	}
	else
	{
		self enableweapons();
	}
}

/*
	Name: function_f609f22c
	Namespace: val
	Checksum: 0xC17AA06F
	Offset: 0x2680
	Size: 0x54
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f609f22c(b_value)
{
	if(!isdefined(b_value))
	{
		b_value = 1;
	}
	if(b_value)
	{
		self disableweaponcycling();
	}
	else
	{
		self enableweaponcycling();
	}
}

/*
	Name: function_16f5ac8e
	Namespace: val
	Checksum: 0x234342C4
	Offset: 0x26E0
	Size: 0x54
	Parameters: 1
	Flags: Linked, Private
*/
function private function_16f5ac8e(b_value)
{
	if(!isdefined(b_value))
	{
		b_value = 1;
	}
	if(b_value)
	{
		self disableweaponfire();
	}
	else
	{
		self enableweaponfire();
	}
}

/*
	Name: function_debe5863
	Namespace: val
	Checksum: 0xF8184CAA
	Offset: 0x2740
	Size: 0x54
	Parameters: 1
	Flags: Linked, Private
*/
function private function_debe5863(b_value)
{
	if(!isdefined(b_value))
	{
		b_value = 1;
	}
	if(b_value)
	{
		self disableweaponreload();
	}
	else
	{
		self enableweaponreload();
	}
}

/*
	Name: function_15d061e0
	Namespace: val
	Checksum: 0x7C9415CA
	Offset: 0x27A0
	Size: 0x54
	Parameters: 1
	Flags: Linked, Private
*/
function private function_15d061e0(b_value)
{
	if(!isdefined(b_value))
	{
		b_value = 1;
	}
	if(b_value)
	{
		self disableweaponpickup();
	}
	else
	{
		self enableweaponpickup();
	}
}

/*
	Name: set_disableoffhandweapons
	Namespace: val
	Checksum: 0x9C0F4456
	Offset: 0x2800
	Size: 0x54
	Parameters: 1
	Flags: Linked, Private
*/
function private set_disableoffhandweapons(b_value)
{
	if(!isdefined(b_value))
	{
		b_value = 1;
	}
	if(b_value)
	{
		self disableoffhandweapons();
	}
	else
	{
		self enableoffhandweapons();
	}
}

/*
	Name: function_37c7ffcd
	Namespace: val
	Checksum: 0x9CBCC4A2
	Offset: 0x2860
	Size: 0x54
	Parameters: 1
	Flags: Linked, Private
*/
function private function_37c7ffcd(b_value)
{
	if(!isdefined(b_value))
	{
		b_value = 1;
	}
	if(b_value)
	{
		self disableoffhandspecial();
	}
	else
	{
		self enableoffhandspecial();
	}
}

/*
	Name: function_ba94b5cd
	Namespace: val
	Checksum: 0x232DA9B6
	Offset: 0x28C0
	Size: 0x64
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ba94b5cd(b_value)
{
	if(!isdefined(b_value))
	{
		b_value = 1;
	}
	/#
		assert(sessionmodeiscampaigngame());
	#/
	setsaveddvar(#"aim_assist_script_disable", b_value);
}

/*
	Name: function_737c794
	Namespace: val
	Checksum: 0x62943F76
	Offset: 0x2930
	Size: 0x54
	Parameters: 1
	Flags: Linked, Private
*/
function private function_737c794(b_value)
{
	if(!isdefined(b_value))
	{
		b_value = 1;
	}
	if(b_value)
	{
		self disableusability();
	}
	else
	{
		self enableusability();
	}
}

/*
	Name: set_ignoreme
	Namespace: val
	Checksum: 0x22C5F0CE
	Offset: 0x2990
	Size: 0x52
	Parameters: 1
	Flags: Linked, Private
*/
function private set_ignoreme(b_value)
{
	if(!isdefined(b_value))
	{
		b_value = 1;
	}
	if(function_ffa5b184(self))
	{
		self.var_becd4d91 = b_value;
	}
	else
	{
		self.ignoreme = b_value;
	}
}

/*
	Name: set_ignoreall
	Namespace: val
	Checksum: 0x575F2064
	Offset: 0x29F0
	Size: 0x2A
	Parameters: 1
	Flags: Linked, Private
*/
function private set_ignoreall(b_value)
{
	if(!isdefined(b_value))
	{
		b_value = 1;
	}
	self.ignoreall = b_value;
}

/*
	Name: function_62318390
	Namespace: val
	Checksum: 0xB19593EF
	Offset: 0x2A28
	Size: 0x66
	Parameters: 1
	Flags: Linked, Private
*/
function private function_62318390(b_value)
{
	if(!isdefined(b_value))
	{
		b_value = 1;
	}
	/#
		assert(isplayer(self));
	#/
	if(b_value)
	{
		self.nohitmarkers = undefined;
	}
	else
	{
		self.nohitmarkers = 1;
	}
}

/*
	Name: set_disablegestures
	Namespace: val
	Checksum: 0x2C992E53
	Offset: 0x2A98
	Size: 0x42
	Parameters: 1
	Flags: Linked, Private
*/
function private set_disablegestures(b_value)
{
	if(!isdefined(b_value))
	{
		b_value = 1;
	}
	if(isplayer(self))
	{
		self.disablegestures = b_value;
	}
}

/*
	Name: set_hide
	Namespace: val
	Checksum: 0x9E82B1C8
	Offset: 0x2AE8
	Size: 0x74
	Parameters: 1
	Flags: Linked, Private
*/
function private set_hide(b_value)
{
	if(!isdefined(b_value))
	{
		b_value = 1;
	}
	if(b_value)
	{
		if(b_value == 1)
		{
			self hide();
		}
		else
		{
			self ghost();
		}
	}
	else
	{
		self show();
	}
}

/*
	Name: set_health_regen
	Namespace: val
	Checksum: 0x77F0B384
	Offset: 0x2B68
	Size: 0x4A
	Parameters: 1
	Flags: Linked, Private
*/
function private set_health_regen(b_value)
{
	if(!isdefined(b_value))
	{
		b_value = 1;
	}
	if(b_value)
	{
		self.heal.enabled = 1;
	}
	else
	{
		self.heal.enabled = 0;
	}
}

/*
	Name: set_disable_health_regen_delay
	Namespace: val
	Checksum: 0x6B0EA213
	Offset: 0x2BC0
	Size: 0x42
	Parameters: 1
	Flags: Linked, Private
*/
function private set_disable_health_regen_delay(b_value)
{
	if(!isdefined(b_value))
	{
		b_value = 1;
	}
	if(b_value)
	{
		self.disable_health_regen_delay = 1;
	}
	else
	{
		self.disable_health_regen_delay = 0;
	}
}

/*
	Name: set_ignore_health_regen_delay
	Namespace: val
	Checksum: 0x53E96EF1
	Offset: 0x2C10
	Size: 0x42
	Parameters: 1
	Flags: Linked, Private
*/
function private set_ignore_health_regen_delay(b_value)
{
	if(!isdefined(b_value))
	{
		b_value = 1;
	}
	if(b_value)
	{
		self.ignore_health_regen_delay = 1;
	}
	else
	{
		self.ignore_health_regen_delay = 0;
	}
}

/*
	Name: set_goal_radius
	Namespace: val
	Checksum: 0x1AD31E21
	Offset: 0x2C60
	Size: 0xA2
	Parameters: 1
	Flags: Linked, Private
*/
function private set_goal_radius(val)
{
	if(isdefined(val))
	{
		self.goalradius = val;
	}
	else
	{
		if(isdefined(self.radius))
		{
			self.goalradius = float(self.radius);
		}
		else
		{
			if(isdefined(self.spawner.radius))
			{
				self.goalradius = float(self.spawner.radius);
			}
			else
			{
				self.goalradius = 2048;
			}
		}
	}
}

/*
	Name: function_2d53d03d
	Namespace: val
	Checksum: 0xDFB0D7A3
	Offset: 0x2D10
	Size: 0x36
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2d53d03d(b_value)
{
	if(!isdefined(b_value))
	{
		b_value = 1;
	}
	self.skipdeath = (b_value ? 1 : 0);
}

/*
	Name: function_2014cd50
	Namespace: val
	Checksum: 0xE453EFE1
	Offset: 0x2D50
	Size: 0x36
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2014cd50(b_value)
{
	if(!isdefined(b_value))
	{
		b_value = 1;
	}
	self.skipscenedeath = (b_value ? 1 : undefined);
}

/*
	Name: allow_melee_victim
	Namespace: val
	Checksum: 0x4B226912
	Offset: 0x2D90
	Size: 0x36
	Parameters: 1
	Flags: Linked, Private
*/
function private allow_melee_victim(b_value)
{
	if(!isdefined(b_value))
	{
		b_value = 1;
	}
	self.canbemeleed = (b_value ? 1 : 0);
}

/*
	Name: function_4671dfff
	Namespace: val
	Checksum: 0x4401B7C7
	Offset: 0x2DD0
	Size: 0x21C
	Parameters: 2
	Flags: None
*/
function function_4671dfff(str_id, value)
{
	if(value)
	{
		set(str_id, "disable_weapon_fire", value);
		set(str_id, "disable_offhand_weapons", value);
		set(str_id, "disablegadgets", value);
		set(str_id, "allow_movement", !value);
		set(str_id, "allow_jump", !value);
		set(str_id, "allow_melee", !value);
		set(str_id, "allow_sprint", !value);
		set(str_id, "allow_prone", !value);
	}
	else
	{
		reset(str_id, "disable_weapon_fire");
		reset(str_id, "disable_offhand_weapons");
		reset(str_id, "disablegadgets");
		reset(str_id, "allow_movement");
		reset(str_id, "allow_jump");
		reset(str_id, "allow_melee");
		reset(str_id, "allow_sprint");
		reset(str_id, "allow_prone");
	}
}

/*
	Name: function_5276aede
	Namespace: val
	Checksum: 0xF986EEA2
	Offset: 0x2FF8
	Size: 0x19C
	Parameters: 2
	Flags: None
*/
function function_5276aede(str_id, value)
{
	if(value)
	{
		set(str_id, "disable_offhand_weapons", value);
		set(str_id, "disablegadgets", value);
		set(str_id, "allow_movement", !value);
		set(str_id, "allow_jump", !value);
		set(str_id, "allow_melee", !value);
		set(str_id, "allow_sprint", !value);
	}
	else
	{
		reset(str_id, "disable_offhand_weapons");
		reset(str_id, "disablegadgets");
		reset(str_id, "allow_movement");
		reset(str_id, "allow_jump");
		reset(str_id, "allow_melee");
		reset(str_id, "allow_sprint");
	}
}

/*
	Name: validate
	Namespace: val
	Checksum: 0x48F4384C
	Offset: 0x31A0
	Size: 0xF2
	Parameters: 4
	Flags: Private, Variadic
*/
function private validate(str_name, call_on, func, ...)
{
	/#
		a_registered = getarraykeys(level.values);
		if(!isinarray(a_registered, hash(str_name)))
		{
			/#
				assertmsg(("" + str_name) + "");
			#/
			return;
		}
		s_value = level.values[str_name];
		s_value.b_validate = 1;
		s_value.func_validate = func;
		s_value.validate_call_on = call_on;
		s_value.validate_args = vararg;
	#/
}

/*
	Name: _validate_value
	Namespace: val
	Checksum: 0x4A55BD54
	Offset: 0x32A0
	Size: 0x158
	Parameters: 3
	Flags: Private
*/
function private _validate_value(str_name, value, b_assert)
{
	/#
		if(!isdefined(b_assert))
		{
			b_assert = 0;
		}
		s_value = level.values[str_name];
		if(isdefined(s_value.func_validate))
		{
			call_on = (s_value.validate_call_on === "" ? self : s_value.validate_call_on);
			current_value = util::single_func_argarray(call_on, s_value.func_validate, _replace_values(s_value.validate_args));
		}
		else
		{
			current_value = self.(str_name);
		}
		b_match = current_value === value;
		if(b_assert)
		{
			/#
				assert(b_match, ((((("" + function_9e72a96(str_name)) + "") + current_value) + "") + value) + "");
			#/
		}
		return b_match;
	#/
}

/*
	Name: debug_values
	Namespace: val
	Checksum: 0x8ECBE6E4
	Offset: 0x3408
	Size: 0x44A
	Parameters: 0
	Flags: Private
*/
function private debug_values()
{
	/#
		level flag::init_dvar("");
		level flag::wait_till("");
		while(true)
		{
			level flag::wait_till("");
			str_debug_values_entity = getdvarstring(#"scr_debug_values_entity", "");
			if(str_debug_values_entity == "" || str_debug_values_entity == "" || str_debug_values_entity == "")
			{
				hud_ent = level.host;
				str_label = "";
			}
			else
			{
				if(strisnumber(str_debug_values_entity))
				{
					hud_ent = getentbynum(int(str_debug_values_entity));
					str_label = "" + str_debug_values_entity;
				}
				else
				{
					str_value = str_debug_values_entity;
					str_key = "";
					if(issubstr(str_value, ""))
					{
						a_toks = strtok(str_value, "");
						str_value = a_toks[0];
						str_key = a_toks[1];
					}
					hud_ent = getent(str_value, str_key, 1);
					str_label = (str_value + "") + str_key;
				}
			}
			debug2dtext((200, 100, 0), str_label, (1, 1, 1), 1, (0, 0, 0), 0.5, 0.8, 1);
			a_all_ents = getentarray();
			foreach(ent in a_all_ents)
			{
				if(isdefined(ent.values))
				{
					i = 1;
					foreach(a_value in ent.values)
					{
						top_value = a_value[0];
						if(isdefined(top_value))
						{
							b_valid = 1;
							if(is_true(level.values[str_name].b_validate))
							{
								b_assert = getdvarint(#"scr_debug_values", 0) > 1;
								b_valid = ent _validate_value(str_name, top_value.value, b_assert);
							}
							ent display_value(i, str_name, top_value.str_id, top_value.value, b_valid, ent === hud_ent);
							i++;
						}
					}
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: display_value
	Namespace: val
	Checksum: 0x61DC4C41
	Offset: 0x3860
	Size: 0x21C
	Parameters: 6
	Flags: Private
*/
function private display_value(index, str_name, str_id, value, b_valid, on_hud)
{
	/#
		if(!isdefined(on_hud))
		{
			on_hud = 0;
		}
		if(ishash(str_name))
		{
			str_name = function_9e72a96(str_name);
		}
		if(ishash(str_id))
		{
			str_id = function_9e72a96(str_id);
		}
		str_value = "";
		if((isdefined(str_name) ? "" + str_name : "") != "")
		{
			str_value = string::rjust(str_name, 20);
			if(isdefined(value))
			{
				str_value = str_value + ("" + value);
			}
			str_value = str_value + ("" + (string::ljust((isdefined(str_id) ? "" + str_id : ""), 30)));
		}
		color = (b_valid ? (1, 1, 1) : (1, 0, 0));
		if(on_hud)
		{
			debug2dtext((200, 100 + (index * 20), 0), str_value, color, 1, (0, 0, 0), 0.5, 0.8, 1);
		}
		print3d(self.origin - (0, 0, index * 8), str_value, color, 1, 0.3, 1);
	#/
}

