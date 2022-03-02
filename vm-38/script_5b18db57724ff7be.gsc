#using script_47fb62300ac0bd60;
#using script_7133a4d461308099;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm_pack_a_punch_util.gsc;
#using scripts\zm_common\zm_weapons.gsc;

#namespace zm_camos;

/*
	Name: function_ae40e6eb
	Namespace: zm_camos
	Checksum: 0x2FFC7352
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ae40e6eb()
{
	level notify(162890767);
}

/*
	Name: function_89f2df9
	Namespace: zm_camos
	Checksum: 0xD246A47D
	Offset: 0xB0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_camos", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_camos
	Checksum: 0x416F9AEA
	Offset: 0xF8
	Size: 0x44
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_f06de157 = &function_264bcab7;
	level.var_3993dc8e = &function_4092decc;
	level.var_b219667f = 1;
}

/*
	Name: function_79be4786
	Namespace: zm_camos
	Checksum: 0xF648403C
	Offset: 0x148
	Size: 0xB0
	Parameters: 1
	Flags: Linked
*/
function function_79be4786(weapon)
{
	weapon = function_264bcab7(weapon);
	weaponoptions = self getbuildkitweaponoptions(weapon);
	var_3ded6a21 = getcamoindex(weaponoptions);
	var_a99ac61d = function_11c873a(var_3ded6a21);
	if(!isdefined(var_a99ac61d) || var_a99ac61d == #"")
	{
		return;
	}
	return var_3ded6a21;
}

/*
	Name: function_7c982eb6
	Namespace: zm_camos
	Checksum: 0xC2125618
	Offset: 0x200
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function function_7c982eb6(weapon)
{
	weapon = function_264bcab7(weapon);
	s_active_camo = function_e5ed6edb(weapon);
	if(isdefined(s_active_camo))
	{
		weaponstate = s_active_camo.var_dd54a13b[weapon];
		if(isdefined(weaponstate) && isdefined(weaponstate.var_d1a848d9))
		{
			return weaponstate.var_d1a848d9;
		}
	}
}

/*
	Name: function_6f75f3d3
	Namespace: zm_camos
	Checksum: 0x6B050A06
	Offset: 0x298
	Size: 0xD4
	Parameters: 2
	Flags: Linked
*/
function function_6f75f3d3(weapon, var_eaad2188)
{
	var_515e20e6 = zm_weapons::is_weapon_upgraded(weapon);
	weapon = function_264bcab7(weapon);
	if(self function_6b9dce34(weapon))
	{
		return getcamoindex(var_eaad2188);
	}
	if(var_515e20e6 && isdefined(self.var_3f021416) && isdefined(self.var_3f021416[weapon]))
	{
		return self.var_3f021416[weapon];
	}
	if(isdefined(var_eaad2188))
	{
		return getcamoindex(var_eaad2188);
	}
}

/*
	Name: function_4f727cf5
	Namespace: zm_camos
	Checksum: 0xB7355683
	Offset: 0x378
	Size: 0x202
	Parameters: 3
	Flags: Linked
*/
function function_4f727cf5(weapon, weaponoptions, var_b07a5171)
{
	if(!isdefined(var_b07a5171))
	{
		var_b07a5171 = 0;
	}
	weapon = function_264bcab7(weapon);
	if(!isdefined(weaponoptions))
	{
		weaponoptions = self getbuildkitweaponoptions(weapon);
	}
	if(isdefined(weaponoptions) && self function_6b9dce34(weapon))
	{
		return getcamoindex(weaponoptions);
	}
	if(!isdefined(level.pack_a_punch_camo_index))
	{
		if(isdefined(weaponoptions))
		{
			return getcamoindex(weaponoptions);
		}
		return;
	}
	if(isdefined(level.pack_a_punch_camo_index_number_variants))
	{
		if(!isdefined(self.var_3f021416))
		{
			self.var_3f021416 = [];
		}
		else if(!isarray(self.var_3f021416))
		{
			self.var_3f021416 = array(self.var_3f021416);
		}
		var_e5c037f4 = self.var_3f021416[weapon];
		if(var_b07a5171 && isdefined(var_e5c037f4) && var_e5c037f4 >= level.pack_a_punch_camo_index)
		{
			var_c44040bf = var_e5c037f4 + 1;
			if(var_c44040bf >= (level.pack_a_punch_camo_index + level.pack_a_punch_camo_index_number_variants))
			{
				var_c44040bf = level.pack_a_punch_camo_index;
			}
		}
		else
		{
			n_offset = randomintrange(0, level.pack_a_punch_camo_index_number_variants);
			var_c44040bf = level.pack_a_punch_camo_index + n_offset;
		}
		self.var_3f021416[weapon] = var_c44040bf;
		return var_c44040bf;
	}
	return level.pack_a_punch_camo_index;
}

/*
	Name: function_a24c564f
	Namespace: zm_camos
	Checksum: 0xAE4CED0
	Offset: 0x588
	Size: 0x4C
	Parameters: 2
	Flags: Linked
*/
function function_a24c564f(var_c34665fc, weapon)
{
	weapon = function_264bcab7(weapon);
	self notify(var_c34665fc, {#weapon:weapon});
}

/*
	Name: function_264bcab7
	Namespace: zm_camos
	Checksum: 0x307A3FF2
	Offset: 0x5E0
	Size: 0x4A
	Parameters: 1
	Flags: Linked
*/
function function_264bcab7(weapon)
{
	if(isdefined(weapon) && weapon != level.weaponnone)
	{
		weapon = zm_weapons::function_93cd8e76(weapon, 1);
	}
	return weapon;
}

/*
	Name: function_e5ed6edb
	Namespace: zm_camos
	Checksum: 0x70717572
	Offset: 0x638
	Size: 0xEE
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e5ed6edb(weapon)
{
	weaponoptions = self getbuildkitweaponoptions(weapon);
	if(!isdefined(self.pers) || !isdefined(self.pers[#"activecamo"]))
	{
		return;
	}
	var_3ded6a21 = getcamoindex(weaponoptions);
	var_a99ac61d = function_11c873a(var_3ded6a21);
	if(!isdefined(var_a99ac61d) || !isdefined(self.pers[#"activecamo"][var_a99ac61d]))
	{
		return;
	}
	return self.pers[#"activecamo"][var_a99ac61d];
}

/*
	Name: function_6b9dce34
	Namespace: zm_camos
	Checksum: 0x5BBC5937
	Offset: 0x730
	Size: 0x52
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6b9dce34(weapon)
{
	if(isdefined(self function_79be4786(weapon)))
	{
		return true;
	}
	if(self function_1744e243(weapon) != 0)
	{
		return true;
	}
	return false;
}

/*
	Name: function_7b29c2d2
	Namespace: zm_camos
	Checksum: 0xA1487669
	Offset: 0x790
	Size: 0x144
	Parameters: 1
	Flags: Linked
*/
function function_7b29c2d2(weapon)
{
	if(!isdefined(self.var_88ebd633))
	{
		self.var_88ebd633 = {};
	}
	var_fcad15af = function_264bcab7(weapon);
	if(!isdefined(self.var_88ebd633.var_92177fec) || self.var_88ebd633.var_92177fec != var_fcad15af)
	{
		self.var_88ebd633.var_92177fec = var_fcad15af;
		self.var_88ebd633.var_d9449a3 = 0;
	}
	self.var_88ebd633.var_d9449a3++;
	if(self.var_88ebd633.var_d9449a3 >= 5)
	{
		self thread activecamo::function_896ac347(weapon, #"hash_31b99e3970f80a7f", 1);
		self.var_88ebd633.var_d9449a3 = 0;
		self notify(#"hash_7e9b17b054c01cb3");
	}
	else if(self.var_88ebd633.var_d9449a3 == 1)
	{
		self thread function_160898c();
	}
}

/*
	Name: function_160898c
	Namespace: zm_camos
	Checksum: 0x7719FA52
	Offset: 0x8E0
	Size: 0x4E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_160898c()
{
	self notify(#"hash_7e9b17b054c01cb3");
	self endon(#"death", #"hash_7e9b17b054c01cb3");
	wait(5);
	self.var_88ebd633.var_d9449a3 = 0;
}

/*
	Name: function_432cf6d
	Namespace: zm_camos
	Checksum: 0x7C9E9E64
	Offset: 0x938
	Size: 0x144
	Parameters: 1
	Flags: Linked
*/
function function_432cf6d(weapon)
{
	if(!isdefined(self.var_88ebd633))
	{
		self.var_88ebd633 = {};
	}
	var_fcad15af = function_264bcab7(weapon);
	if(!isdefined(self.var_88ebd633.var_d45de2ae) || self.var_88ebd633.var_d45de2ae != var_fcad15af)
	{
		self.var_88ebd633.var_d45de2ae = var_fcad15af;
		self.var_88ebd633.var_bcacb3a3 = 0;
	}
	self.var_88ebd633.var_bcacb3a3++;
	if(self.var_88ebd633.var_bcacb3a3 >= 5)
	{
		self thread activecamo::function_896ac347(weapon, #"hash_25e0a2c8e52ead0d", 1);
		self.var_88ebd633.var_bcacb3a3 = 0;
		self notify(#"hash_3dbf3a8521ba1621");
	}
	else if(self.var_88ebd633.var_bcacb3a3 == 1)
	{
		self thread function_d01affa9();
	}
}

/*
	Name: function_d01affa9
	Namespace: zm_camos
	Checksum: 0xD0E9EF8A
	Offset: 0xA88
	Size: 0x4E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d01affa9()
{
	self notify(#"hash_3dbf3a8521ba1621");
	self endon(#"death", #"hash_3dbf3a8521ba1621");
	wait(7);
	self.var_88ebd633.var_bcacb3a3 = 0;
}

/*
	Name: function_4092decc
	Namespace: zm_camos
	Checksum: 0x5A57BDCF
	Offset: 0xAE0
	Size: 0xFC
	Parameters: 1
	Flags: Linked
*/
function function_4092decc(weapon)
{
	if(zm_weapons::is_weapon_upgraded(weapon))
	{
		self activecamo::function_896ac347(weapon, #"hash_203688d7883cf38c", 1);
		if(zm_pap_util::function_7352d8cc(weapon))
		{
			self activecamo::function_896ac347(weapon, #"hash_300fdf15a515feda", 1);
		}
	}
	else
	{
		self function_a24c564f(#"hash_3610149e675eb4d8", weapon);
	}
	self callback::callback(#"hash_478f81e3bb0950dd", {#weapon:weapon});
}

