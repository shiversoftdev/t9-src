#using scripts\core_common\system_shared.gsc;

#namespace gestures;

/*
	Name: function_ebb6850a
	Namespace: gestures
	Checksum: 0x389D25C7
	Offset: 0xA0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ebb6850a()
{
	level notify(1427017835);
}

/*
	Name: function_89f2df9
	Namespace: gestures
	Checksum: 0x1F36C28F
	Offset: 0xC0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"gestures", undefined, &main, undefined, undefined);
}

/*
	Name: main
	Namespace: gestures
	Checksum: 0x655DF593
	Offset: 0x108
	Size: 0x324
	Parameters: 0
	Flags: Linked
*/
function main()
{
	function_a5202150(#"hash_23c6eb5541cbc62f", "sig_buckler_dw");
	function_a5202150(#"hash_419f11534af12a76", "sig_buckler_dw");
	function_a5202150(#"hash_7a39b364d97900f7", "sig_buckler_dw");
	function_a5202150(#"hash_4f15a5e59317b738", "sig_buckler_dw");
	function_a5202150(#"hash_6dbb203d420a583", "sig_buckler_dw");
	function_a5202150(#"hash_26e7f22deb4c8e29", "sig_buckler_dw");
	function_a5202150(#"hash_681eef1744584fb2", "sig_buckler_dw");
	function_a5202150(#"hash_577f00f59de390db", "sig_buckler_dw");
	function_a5202150(#"hash_685cf93764bc532a", "sig_buckler_dw");
	function_a5202150(#"hash_5723248289b2a00b", "sig_buckler_dw");
	function_a5202150(#"hash_23c6eb5541cbc62f", "sig_buckler_turret");
	function_a5202150(#"hash_419f11534af12a76", "sig_buckler_turret");
	function_a5202150(#"hash_7a39b364d97900f7", "sig_buckler_turret");
	function_a5202150(#"hash_4f15a5e59317b738", "sig_buckler_turret");
	function_a5202150(#"hash_6dbb203d420a583", "sig_buckler_turret");
	function_a5202150(#"hash_26e7f22deb4c8e29", "sig_buckler_turret");
	function_a5202150(#"hash_681eef1744584fb2", "sig_buckler_turret");
	function_a5202150(#"hash_577f00f59de390db", "sig_buckler_turret");
	function_a5202150(#"hash_685cf93764bc532a", "sig_buckler_turret");
	function_a5202150(#"hash_5723248289b2a00b", "sig_buckler_turret");
}

/*
	Name: function_f8ae6f87
	Namespace: gestures
	Checksum: 0xAEF28B
	Offset: 0x438
	Size: 0xC2
	Parameters: 1
	Flags: None
*/
function function_f8ae6f87(gestureweapon)
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
	Name: function_ae63f496
	Namespace: gestures
	Checksum: 0x9E09705C
	Offset: 0x508
	Size: 0x8E
	Parameters: 0
	Flags: None
*/
function function_ae63f496()
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
	Checksum: 0x5D0E05CF
	Offset: 0x5A0
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
	if(!function_7a600918(var_45e6768d))
	{
		var_45e6768d = hash(var_45e6768d);
	}
	return var_45e6768d;
}

/*
	Name: function_a5202150
	Namespace: gestures
	Checksum: 0xB658DB97
	Offset: 0x620
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
	if(!function_7a600918(var_45e6768d))
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
	Checksum: 0x9A791289
	Offset: 0x7B0
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
	if(!function_7a600918(var_45e6768d))
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
	Checksum: 0x792DFE5D
	Offset: 0x870
	Size: 0x22E
	Parameters: 1
	Flags: Linked
*/
function function_8cc27b6d(var_ee58f129)
{
	var_45e6768d = function_e198bde3(var_ee58f129);
	if(!function_7a600918(var_45e6768d))
	{
		return false;
	}
	weapon = self getcurrentweapon();
	if(is_true(self.var_89b32012))
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
	Checksum: 0x816BD4F5
	Offset: 0xAA8
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
	Name: function_b204f6e3
	Namespace: gestures
	Checksum: 0x3E760902
	Offset: 0xB28
	Size: 0x7E
	Parameters: 7
	Flags: Linked
*/
function function_b204f6e3(var_ee58f129, target, var_a085312c, blendtime, starttime, var_15fc620c, var_e67d2436)
{
	if(self function_8cc27b6d(var_ee58f129))
	{
		return self function_b6cc48ed(var_ee58f129, target, var_a085312c, blendtime, starttime, var_15fc620c, var_e67d2436);
	}
	return 0;
}

/*
	Name: function_b6cc48ed
	Namespace: gestures
	Checksum: 0x607FC772
	Offset: 0xBB0
	Size: 0x5A
	Parameters: 7
	Flags: Linked
*/
function function_b6cc48ed(var_ee58f129, target, var_a085312c, blendtime, starttime, var_15fc620c, var_e67d2436)
{
	return self playgestureviewmodel(var_ee58f129, target, var_a085312c, blendtime, starttime, var_15fc620c, var_e67d2436);
}

/*
	Name: function_56e00fbf
	Namespace: gestures
	Checksum: 0x517D8A8C
	Offset: 0xC18
	Size: 0x7A
	Parameters: 7
	Flags: Linked
*/
function function_56e00fbf(var_851342cf, target, var_a085312c, blendtime, starttime, var_15fc620c, var_e67d2436)
{
	var_ee58f129 = self function_c77349d4(var_851342cf);
	return function_b204f6e3(var_ee58f129, target, var_a085312c, blendtime, starttime, var_15fc620c, var_e67d2436);
}

/*
	Name: function_e62f6dde
	Namespace: gestures
	Checksum: 0xA41481C6
	Offset: 0xCA0
	Size: 0x7A
	Parameters: 7
	Flags: None
*/
function function_e62f6dde(var_851342cf, target, var_a085312c, blendtime, starttime, var_15fc620c, var_e67d2436)
{
	var_ee58f129 = self function_c77349d4(var_851342cf);
	return function_b6cc48ed(var_ee58f129, target, var_a085312c, blendtime, starttime, var_15fc620c, var_e67d2436);
}

/*
	Name: function_f3e2696f
	Namespace: gestures
	Checksum: 0x18B14B98
	Offset: 0xD28
	Size: 0x262
	Parameters: 7
	Flags: Linked
*/
function function_f3e2696f(ent, weapon, weapon_options, timeout, var_1e89628f, var_1d78d31, var_289bde21)
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
		if(isdefined(var_289bde21))
		{
			self [[var_289bde21]](ent, var_f3b15ce0);
		}
		return;
	}
	while(true)
	{
		result = undefined;
		result = self waittilltimeout(timeout, #"grenade_pullback", #"hash_7b6a55a9b65e3194", #"offhand_end");
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
				else if(result._notify == #"hash_7b6a55a9b65e3194")
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
	if(isdefined(var_289bde21))
	{
		self [[var_289bde21]](ent, var_f3b15ce0);
	}
}

