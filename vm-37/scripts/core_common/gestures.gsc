#using scripts\core_common\system_shared.gsc;

#namespace gestures;

/*
	Name: __init__system__
	Namespace: gestures
	Checksum: 0x6D2138C3
	Offset: 0xA0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"gestures", undefined, &main, undefined, undefined);
}

/*
	Name: main
	Namespace: gestures
	Checksum: 0xEAA5D67D
	Offset: 0xE8
	Size: 0x324
	Parameters: 0
	Flags: Linked
*/
function main()
{
	function_a5202150(#"hash_23c6eb5541cbc62f", "sig_buckler_dw");
	function_a5202150(#"hash_419f11534af12a76", "sig_buckler_dw");
	function_a5202150(#"ges_blinded", "sig_buckler_dw");
	function_a5202150(#"hash_4f15a5e59317b738", "sig_buckler_dw");
	function_a5202150(#"hash_6dbb203d420a583", "sig_buckler_dw");
	function_a5202150(#"ges_grab", "sig_buckler_dw");
	function_a5202150(#"hash_681eef1744584fb2", "sig_buckler_dw");
	function_a5202150(#"hash_577f00f59de390db", "sig_buckler_dw");
	function_a5202150(#"ges_shocked", "sig_buckler_dw");
	function_a5202150(#"hash_5723248289b2a00b", "sig_buckler_dw");
	function_a5202150(#"hash_23c6eb5541cbc62f", "sig_buckler_turret");
	function_a5202150(#"hash_419f11534af12a76", "sig_buckler_turret");
	function_a5202150(#"ges_blinded", "sig_buckler_turret");
	function_a5202150(#"hash_4f15a5e59317b738", "sig_buckler_turret");
	function_a5202150(#"hash_6dbb203d420a583", "sig_buckler_turret");
	function_a5202150(#"ges_grab", "sig_buckler_turret");
	function_a5202150(#"hash_681eef1744584fb2", "sig_buckler_turret");
	function_a5202150(#"hash_577f00f59de390db", "sig_buckler_turret");
	function_a5202150(#"ges_shocked", "sig_buckler_turret");
	function_a5202150(#"hash_5723248289b2a00b", "sig_buckler_turret");
}

/*
	Name: give_gesture
	Namespace: gestures
	Checksum: 0x2938C37E
	Offset: 0x418
	Size: 0xC2
	Parameters: 1
	Flags: None
*/
function give_gesture(gestureweapon)
{
	/#
		assert(gestureweapon != level.weaponnone, "");
	#/
	/#
		assert(!isdefined(self.gestureweapon) || self.gestureweapon == level.weaponnone, "");
	#/
	self setactionslot(3, "taunt");
	self giveweapon(gestureweapon);
	self.gestureweapon = gestureweapon;
}

/*
	Name: clear_gesture
	Namespace: gestures
	Checksum: 0x9D9E409A
	Offset: 0x4E8
	Size: 0x8E
	Parameters: 0
	Flags: None
*/
function clear_gesture()
{
	self notify(#"cleargesture");
	if(isdefined(self.gestureweapon) && self.gestureweapon != level.weaponnone)
	{
		self setactionslot(3, "");
		self takeweapon(self.gestureweapon);
		self.gestureweapon = level.weaponnone;
	}
}

/*
	Name: function_e198bde3
	Namespace: gestures
	Checksum: 0xFEB2339E
	Offset: 0x580
	Size: 0x72
	Parameters: 1
	Flags: Linked
*/
function function_e198bde3(var_ee58f129)
{
	if(!isdefined(var_ee58f129))
	{
		return 0;
	}
	if(var_ee58f129 == "")
	{
		return 0;
	}
	var_45e6768d = var_ee58f129;
	if(!ishash(var_45e6768d))
	{
		var_45e6768d = hash(var_45e6768d);
	}
	return var_45e6768d;
}

/*
	Name: function_a5202150
	Namespace: gestures
	Checksum: 0x447D5685
	Offset: 0x600
	Size: 0x182
	Parameters: 2
	Flags: Linked
*/
function function_a5202150(var_ee58f129, weaponname)
{
	if(!isdefined(level.var_5ccfbb37))
	{
		level.var_5ccfbb37 = [];
	}
	var_45e6768d = function_e198bde3(var_ee58f129);
	if(!ishash(var_45e6768d))
	{
		return;
	}
	weapon = getweapon(weaponname);
	if(!isdefined(weapon) || weapon == level.weaponnone)
	{
		return;
	}
	if(!isdefined(level.var_5ccfbb37[var_45e6768d]))
	{
		level.var_5ccfbb37[var_45e6768d] = spawnstruct();
	}
	if(!isdefined(level.var_5ccfbb37[var_45e6768d].weapons))
	{
		level.var_5ccfbb37[var_45e6768d].weapons = [];
	}
	if(!isdefined(level.var_5ccfbb37[var_45e6768d].weapons[weapon]))
	{
		level.var_5ccfbb37[var_45e6768d].weapons[weapon] = spawnstruct();
	}
	level.var_5ccfbb37[var_45e6768d].weapons[weapon].var_fa9d3758 = 1;
}

/*
	Name: function_ba4529d4
	Namespace: gestures
	Checksum: 0x45E3486D
	Offset: 0x790
	Size: 0xB6
	Parameters: 1
	Flags: None
*/
function function_ba4529d4(var_ee58f129)
{
	if(!isdefined(level.var_5ccfbb37))
	{
		level.var_5ccfbb37 = [];
	}
	var_45e6768d = function_e198bde3(var_ee58f129);
	if(!ishash(var_45e6768d))
	{
		return;
	}
	if(!isdefined(level.var_5ccfbb37[var_45e6768d]))
	{
		level.var_5ccfbb37[var_45e6768d] = spawnstruct();
	}
	level.var_5ccfbb37[var_45e6768d].var_93380a93 = 1;
}

/*
	Name: function_8cc27b6d
	Namespace: gestures
	Checksum: 0x6D35B592
	Offset: 0x850
	Size: 0x22E
	Parameters: 1
	Flags: Linked
*/
function function_8cc27b6d(var_ee58f129)
{
	var_45e6768d = function_e198bde3(var_ee58f129);
	if(!ishash(var_45e6768d))
	{
		return false;
	}
	weapon = self getcurrentweapon();
	if(is_true(self.disablegestures))
	{
		return false;
	}
	if(!isdefined(weapon) || level.weaponnone == weapon)
	{
		return false;
	}
	if(is_true(weapon.var_d2751f9d))
	{
		return false;
	}
	if(is_true(weapon.var_554be9f7) && self isfiring())
	{
		return false;
	}
	if(isdefined(level.var_5ccfbb37) && isdefined(level.var_5ccfbb37[var_45e6768d]) && isdefined(level.var_5ccfbb37[var_45e6768d].weapons) && isdefined(level.var_5ccfbb37[var_45e6768d].weapons[weapon.rootweapon]) && is_true(level.var_5ccfbb37[var_45e6768d].weapons[weapon.rootweapon].var_fa9d3758))
	{
		return false;
	}
	if(weapon.isdualwield && isdefined(level.var_5ccfbb37) && isdefined(level.var_5ccfbb37[var_45e6768d]) && is_true(level.var_5ccfbb37[var_45e6768d].var_93380a93))
	{
		return false;
	}
	if(self function_55acff10(1))
	{
		return false;
	}
	return true;
}

/*
	Name: function_c77349d4
	Namespace: gestures
	Checksum: 0x9A911A63
	Offset: 0xA88
	Size: 0x72
	Parameters: 1
	Flags: Linked
*/
function function_c77349d4(var_851342cf)
{
	var_ee58f129 = undefined;
	if(isdefined(var_851342cf))
	{
		weapon = self getcurrentweapon();
		var_53050505 = weapon.var_6566504b;
		var_ee58f129 = function_d12fe2ad(var_851342cf, var_53050505);
	}
	return var_ee58f129;
}

/*
	Name: play_gesture
	Namespace: gestures
	Checksum: 0x102781B6
	Offset: 0xB08
	Size: 0x7E
	Parameters: 7
	Flags: Linked
*/
function play_gesture(var_ee58f129, target, var_a085312c, blendtime, starttime, var_15fc620c, stopall)
{
	if(self function_8cc27b6d(var_ee58f129))
	{
		return self function_b6cc48ed(var_ee58f129, target, var_a085312c, blendtime, starttime, var_15fc620c, stopall);
	}
	return 0;
}

/*
	Name: function_b6cc48ed
	Namespace: gestures
	Checksum: 0x9B34D79B
	Offset: 0xB90
	Size: 0x5A
	Parameters: 7
	Flags: Linked
*/
function function_b6cc48ed(var_ee58f129, target, var_a085312c, blendtime, starttime, var_15fc620c, stopall)
{
	return self playgestureviewmodel(var_ee58f129, target, var_a085312c, blendtime, starttime, var_15fc620c, stopall);
}

/*
	Name: function_56e00fbf
	Namespace: gestures
	Checksum: 0xA357E32D
	Offset: 0xBF8
	Size: 0x7A
	Parameters: 7
	Flags: Linked
*/
function function_56e00fbf(var_851342cf, target, var_a085312c, blendtime, starttime, var_15fc620c, stopall)
{
	var_ee58f129 = self function_c77349d4(var_851342cf);
	return play_gesture(var_ee58f129, target, var_a085312c, blendtime, starttime, var_15fc620c, stopall);
}

/*
	Name: function_e62f6dde
	Namespace: gestures
	Checksum: 0x12B9ED8D
	Offset: 0xC80
	Size: 0x7A
	Parameters: 7
	Flags: None
*/
function function_e62f6dde(var_851342cf, target, var_a085312c, blendtime, starttime, var_15fc620c, stopall)
{
	var_ee58f129 = self function_c77349d4(var_851342cf);
	return function_b6cc48ed(var_ee58f129, target, var_a085312c, blendtime, starttime, var_15fc620c, stopall);
}

/*
	Name: function_f3e2696f
	Namespace: gestures
	Checksum: 0x47BE680
	Offset: 0xD08
	Size: 0x262
	Parameters: 7
	Flags: Linked
*/
function function_f3e2696f(ent, weapon, weapon_options, timeout, var_1e89628f, var_1d78d31, callbackfail)
{
	self endon(#"death");
	var_f69ae03d = self weaponcyclingenabled();
	self disableweaponcycling();
	while(self isswitchingweapons())
	{
		waitframe(1);
	}
	if(var_f69ae03d)
	{
		self enableweaponcycling();
	}
	var_f3b15ce0 = 0;
	if(!self giveandfireoffhand(weapon, weapon_options))
	{
		if(isdefined(callbackfail))
		{
			self [[callbackfail]](ent, var_f3b15ce0);
		}
		return;
	}
	while(true)
	{
		result = undefined;
		result = self waittilltimeout(timeout, #"grenade_pullback", #"offhand_fire", #"offhand_end");
		if(result._notify == #"timeout")
		{
			break;
		}
		if(result.weapon == weapon)
		{
			if(result._notify == #"offhand_end")
			{
				break;
			}
			else
			{
				if(result._notify == #"grenade_pullback")
				{
					var_f3b15ce0 = 1;
					if(isdefined(var_1e89628f))
					{
						self [[var_1e89628f]](ent);
					}
					continue;
				}
				else if(result._notify == #"offhand_fire")
				{
					if(isdefined(var_1d78d31))
					{
						self [[var_1d78d31]](ent);
					}
					return;
				}
			}
		}
	}
	if(isdefined(callbackfail))
	{
		self [[callbackfail]](ent, var_f3b15ce0);
	}
}

