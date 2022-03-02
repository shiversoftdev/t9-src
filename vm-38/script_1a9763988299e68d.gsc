#using script_164a456ce05c3483;
#using script_17dcb1172e441bf6;
#using script_1a9763988299e68d;
#using script_1b01e95a6b5270fd;
#using script_1b0b07ff57d1dde3;
#using script_1ee011cd0961afd7;
#using script_2a5bf5b4a00cee0d;
#using script_350cffecd05ef6cf;
#using script_40f967ad5d18ea74;
#using script_47851dbeea22fe66;
#using script_4d748e58ce25b60c;
#using script_5701633066d199f2;
#using script_5f20d3b434d24884;
#using script_6b6510e124bad778;
#using script_74a56359b7d02ab6;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

class class_9b9784aa 
{
	var var_f7688f8b;
	var var_3b56e950;
	var m_type;
	var var_ce5a8850;

	/*
		Name: constructor
		Namespace: namespace_9b9784aa
		Checksum: 0x6AC8F358
		Offset: 0x288
		Size: 0x2A
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
		self.var_f7688f8b = "";
		self.var_3b56e950 = undefined;
		self.var_ce5a8850 = [];
	}

	/*
		Name: destructor
		Namespace: namespace_9b9784aa
		Checksum: 0x80F724D1
		Offset: 0x2C0
		Size: 0x4
		Parameters: 0
		Flags: Linked, 128
	*/
	destructor()
	{
	}

	/*
		Name: getname
		Namespace: namespace_9b9784aa
		Checksum: 0xCCB0D59B
		Offset: 0x488
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function getname()
	{
		return var_f7688f8b;
	}

	/*
		Name: function_4db878e1
		Namespace: namespace_9b9784aa
		Checksum: 0x89FA9FCB
		Offset: 0x4A0
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_4db878e1()
	{
		return var_3b56e950;
	}

	/*
		Name: function_5ce4fb28
		Namespace: namespace_9b9784aa
		Checksum: 0x99C11C30
		Offset: 0x470
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_5ce4fb28()
	{
		return m_type;
	}

	/*
		Name: function_91c18b19
		Namespace: namespace_9b9784aa
		Checksum: 0x8E1ADA5
		Offset: 0x4B8
		Size: 0x50
		Parameters: 1
		Flags: Linked
	*/
	function function_91c18b19(weaponlevel)
	{
		/#
			assert(weaponlevel >= 0 && weaponlevel <= 2, "");
		#/
		return var_ce5a8850[weaponlevel];
	}

	/*
		Name: init
		Namespace: namespace_9b9784aa
		Checksum: 0x6E49C654
		Offset: 0x2D0
		Size: 0x198
		Parameters: 3
		Flags: Linked
	*/
	function init(gdtname, type, var_985105b)
	{
		self.var_f7688f8b = gdtname;
		self.m_type = type;
		self.var_3b56e950 = var_985105b;
		self.var_ce5a8850[var_ce5a8850.size] = getweapon(var_f7688f8b);
		/#
			assert(isdefined(var_ce5a8850[0]));
		#/
		self.var_ce5a8850[var_ce5a8850.size] = getweapon(var_f7688f8b + "_1");
		self.var_ce5a8850[var_ce5a8850.size] = getweapon(var_f7688f8b + "_2");
		self.var_ce5a8850[1] = (var_ce5a8850[1] != level.weaponnone ? var_ce5a8850[1] : var_ce5a8850[0]);
		self.var_ce5a8850[2] = (var_ce5a8850[2] != level.weaponnone ? var_ce5a8850[2] : var_ce5a8850[1]);
	}

}

#namespace namespace_41cb996;

/*
	Name: function_46dc4856
	Namespace: namespace_41cb996
	Checksum: 0x46F97C2B
	Offset: 0x268
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_46dc4856()
{
	level notify(1088855240);
}

/*
	Name: function_377d91b2
	Namespace: namespace_41cb996
	Checksum: 0x55CC4CEA
	Offset: 0x688
	Size: 0x84
	Parameters: 2
	Flags: Linked
*/
function function_377d91b2(name, type)
{
	var_6a86da57 = new class_9b9784aa();
	level.doa.var_e57e1d34[level.doa.var_e57e1d34.size] = var_6a86da57;
	[[ var_6a86da57 ]]->init(name, type, function_bacdbafd(name));
}

/*
	Name: function_dc699ae6
	Namespace: namespace_41cb996
	Checksum: 0x306BB276
	Offset: 0x718
	Size: 0xA2
	Parameters: 1
	Flags: Linked
*/
function function_dc699ae6(name)
{
	foreach(wp in level.doa.var_e57e1d34)
	{
		if(([[ wp ]]->getname()) == name)
		{
			return wp;
		}
	}
}

/*
	Name: init
	Namespace: namespace_41cb996
	Checksum: 0xE2256E5D
	Offset: 0x7C8
	Size: 0x10A
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level.doa.var_e57e1d34 = [];
	level.doa.var_d7e090f7 = [];
	level.doa.var_d7e090f7[#"hash_507c5922ba1a158f"] = &function_ed0da451;
	level.doa.var_d7e090f7[#"hash_7f5a36c91b249e73"] = &function_3d40d138;
	level.doa.var_d7e090f7[#"hash_7f5a37c91b24a026"] = &function_bcd45061;
	level.doa.var_5b088fde = getweapon("zombietron_launcher_secondary");
	level.doa.default_weapon = getweapon("zombietron_lmg");
}

/*
	Name: updateweapon
	Namespace: namespace_41cb996
	Checksum: 0x401667E9
	Offset: 0x8E0
	Size: 0x3FC
	Parameters: 0
	Flags: Linked
*/
function updateweapon()
{
	if(!isdefined(self.doa) || !isdefined(self.doa.var_fd5fcb75) || isdefined(self.doa.vehicle))
	{
		return;
	}
	if(gettime() < self.doa.var_909a4dd5 || !doa_pickups::function_f759a457() || is_true(self.doa.var_57eaec6e))
	{
		return;
	}
	if(self.doa.var_d8955419 > 0)
	{
		decay = 1 + (self.doa.weaponlevel * 0.5);
		if(self isfiring())
		{
			decay = int(decay * (3 - self.doa.var_d6b75dff));
		}
		self.doa.var_d8955419 = self.doa.var_d8955419 - decay;
		if(self.doa.var_d8955419 < 0)
		{
			self.doa.var_d8955419 = 0;
		}
	}
	else if(self.doa.weaponlevel > 0)
	{
		self.doa.weaponlevel--;
		self.doa.var_d8955419 = 1023;
		if(self.doa.var_fd5fcb75 === self.doa.var_ed8fde10 && self.doa.weaponlevel == 0)
		{
			self.doa.var_d8955419 = 0;
		}
		self function_a5a7bbb7([[ self.doa.var_6a86da57 ]]->function_91c18b19(self.doa.weaponlevel));
		weaponlevel = self.doa.weaponlevel;
		self.doa.var_9c7d56c1 = [[ self.doa.var_6a86da57 ]]->function_91c18b19(weaponlevel);
		if(self doa_fate::function_d5b51f1e())
		{
			weaponlevel = math::clamp(self.doa.weaponlevel + level.doa.var_6c58d51, self.doa.weaponlevel, 2);
			self.doa.var_4eda72ee = [[ self.doa.var_6a86da57 ]]->function_91c18b19(weaponlevel);
		}
		self namespace_e32bb68::function_3a59ec34("evt_doa_pickup_weapon_downgraded");
		/#
			namespace_1e25ad94::debugmsg((((("" + self.name) + "") + self.doa.weaponlevel) + "") + ([[ self.doa.var_6a86da57 ]]->getname()));
		#/
	}
	if(self.doa.var_fd5fcb75 != self.doa.var_ed8fde10)
	{
		if(self.doa.var_d8955419 == 0 && self.doa.weaponlevel == 0)
		{
			self function_6c4d9896(self.doa.var_ed8fde10);
		}
	}
}

/*
	Name: function_51e99bc7
	Namespace: namespace_41cb996
	Checksum: 0x240BCE36
	Offset: 0xCE8
	Size: 0x3EA
	Parameters: 1
	Flags: Linked
*/
function function_51e99bc7(amount)
{
	if(!isdefined(amount))
	{
		amount = 1;
	}
	if(!isdefined(self.doa.var_6a86da57))
	{
		return;
	}
	if(is_true(self.doa.respawning))
	{
		return;
	}
	self.doa.var_d8955419 = self.doa.var_d8955419 + (int(64 * amount));
	if(self.doa.var_d8955419 >= 1024)
	{
		if(self.doa.weaponlevel < 2)
		{
			var_fe38469a = self.doa.weaponlevel;
			self.doa.weaponlevel = self.doa.weaponlevel + (int(self.doa.var_d8955419 / 1024));
			if(self.doa.weaponlevel > 2)
			{
				self.doa.weaponlevel = 2;
			}
			if(var_fe38469a == 1 && self.doa.weaponlevel == 2)
			{
				self thread namespace_6e90e490::function_47e11416(5);
			}
			self.doa.var_d8955419 = self.doa.var_d8955419 - ((self.doa.weaponlevel - var_fe38469a) * 1024);
			time = gettime() + 2000;
			if(self.doa.var_909a4dd5 < time)
			{
				self.doa.var_909a4dd5 = time;
			}
			self function_a5a7bbb7([[ self.doa.var_6a86da57 ]]->function_91c18b19(self.doa.weaponlevel));
			self namespace_e32bb68::function_3a59ec34("evt_doa_pickup_weapon_upgraded");
			/#
				namespace_1e25ad94::debugmsg((((("" + self.name) + "") + self.doa.weaponlevel) + "") + ([[ self.doa.var_6a86da57 ]]->getname()));
			#/
		}
		else
		{
			self.doa.var_d8955419 = 1023;
		}
	}
	self.doa.var_d8955419 = math::clamp(self.doa.var_d8955419, 0, 1023);
	weaponlevel = self.doa.weaponlevel;
	self.doa.var_9c7d56c1 = [[ self.doa.var_6a86da57 ]]->function_91c18b19(weaponlevel);
	if(self doa_fate::function_d5b51f1e())
	{
		weaponlevel = math::clamp(self.doa.weaponlevel + level.doa.var_6c58d51, self.doa.weaponlevel, 2);
		self.doa.var_4eda72ee = [[ self.doa.var_6a86da57 ]]->function_91c18b19(weaponlevel);
	}
}

/*
	Name: function_d5bd34b4
	Namespace: namespace_41cb996
	Checksum: 0xD7AB81C5
	Offset: 0x10E0
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function function_d5bd34b4()
{
	if(self.doa.var_fd5fcb75 === self.doa.var_ed8fde10 && self.doa.var_d8955419 == 0)
	{
		self function_51e99bc7(16 - 1);
	}
	self function_51e99bc7(16);
}

/*
	Name: function_6c4d9896
	Namespace: namespace_41cb996
	Checksum: 0xC8F5E2FC
	Offset: 0x1170
	Size: 0x536
	Parameters: 2
	Flags: Linked
*/
function function_6c4d9896(var_9de8aead, weaponpickup)
{
	if(!isdefined(weaponpickup))
	{
		weaponpickup = 0;
	}
	if(!isdefined(self.doa))
	{
		return;
	}
	if(!isplayer(self))
	{
		return;
	}
	if(is_true(weaponpickup))
	{
		fill = 1;
		if(self.doa.var_fd5fcb75 === var_9de8aead)
		{
			if(var_9de8aead === self.doa.var_ed8fde10 && self.doa.var_d8955419 == 0)
			{
				self function_51e99bc7(16 - 1);
			}
			self function_51e99bc7(16);
			if(self.doa.weaponlevel == 2)
			{
				if(isdefined(self.doa.var_7d46d3b9))
				{
					self [[self.doa.var_7d46d3b9]]([[ self.doa.var_6a86da57 ]]->function_5ce4fb28());
				}
			}
			return;
		}
	}
	if(self.doa.var_fd5fcb75 !== var_9de8aead)
	{
		self notify(#"hash_6edec00b6bae610a");
		self.doa.var_6a86da57 = function_dc699ae6(var_9de8aead);
		self.doa.var_fd5fcb75 = var_9de8aead;
		self.doa.weapontype = [[ self.doa.var_6a86da57 ]]->function_5ce4fb28();
		self.doa.var_909a4dd5 = 0;
		self.doa.var_3327c78f = 0;
		if(self.doa.weaponlevel == 0)
		{
			if(is_true(fill) && var_9de8aead === self.doa.var_ed8fde10 || self doa_fate::function_9e59136f())
			{
				self.doa.weaponlevel = 1;
			}
		}
		else
		{
			fill = 0;
		}
		weaponlevel = self.doa.weaponlevel;
		self.doa.var_9c7d56c1 = [[ self.doa.var_6a86da57 ]]->function_91c18b19(weaponlevel);
		if(self doa_fate::function_d5b51f1e())
		{
			weaponlevel = math::clamp(self.doa.weaponlevel + level.doa.var_6c58d51, self.doa.weaponlevel, 2);
			self.doa.var_4eda72ee = [[ self.doa.var_6a86da57 ]]->function_91c18b19(weaponlevel);
		}
		self function_a5a7bbb7([[ self.doa.var_6a86da57 ]]->function_91c18b19(self.doa.weaponlevel));
		var_fa033f5 = [[ self.doa.var_6a86da57 ]]->function_4db878e1();
		if(isdefined(var_fa033f5))
		{
			self thread [[var_fa033f5]]();
		}
	}
	else
	{
		self function_a5a7bbb7([[ self.doa.var_6a86da57 ]]->function_91c18b19(self.doa.weaponlevel));
	}
	if(is_true(fill))
	{
		self.doa.var_d8955419 = 1023;
	}
	if(self.doa.weaponlevel == 2)
	{
		if(isdefined(self.doa.var_7d46d3b9))
		{
			self [[self.doa.var_7d46d3b9]]([[ self.doa.var_6a86da57 ]]->function_5ce4fb28());
		}
	}
	/#
		namespace_1e25ad94::debugmsg((((("" + self.name) + "") + self.doa.var_fd5fcb75) + "") + (is_true(fill) ? "" : ""));
		self thread function_a91422ce();
	#/
}

/*
	Name: function_8b7acf56
	Namespace: namespace_41cb996
	Checksum: 0x523F515E
	Offset: 0x16B0
	Size: 0x92
	Parameters: 1
	Flags: Linked
*/
function function_8b7acf56(var_c16ab4b2)
{
	if(!isdefined(var_c16ab4b2))
	{
		var_c16ab4b2 = 1;
	}
	if(var_c16ab4b2)
	{
		self.doa.var_d8955419 = 0;
		self.doa.weaponlevel = 0;
		self function_6c4d9896(self.doa.var_ed8fde10);
	}
	else
	{
		self takeallweapons();
		self.doa.var_fd5fcb75 = undefined;
	}
}

/*
	Name: function_a5a7bbb7
	Namespace: namespace_41cb996
	Checksum: 0x7F89FF57
	Offset: 0x1750
	Size: 0x13A
	Parameters: 2
	Flags: Linked
*/
function function_a5a7bbb7(weapon, data)
{
	if(!isplayer(self))
	{
		return;
	}
	self notify(#"hash_5939a17bc20f2010");
	if(is_true(level.var_b08350e5))
	{
		if(isdefined(self.doa.oldweapon))
		{
			self takeweapon(self.doa.oldweapon);
		}
		self.doa.oldweapon = self.doa.currentweapon;
	}
	else
	{
		self takeallweapons();
	}
	self giveweapon(data);
	self switchtoweaponimmediate(data);
	self.doa.currentweaponname = data.name;
	self.doa.currentweapon = data;
}

/*
	Name: function_a91422ce
	Namespace: namespace_41cb996
	Checksum: 0x9C48E126
	Offset: 0x1898
	Size: 0x60
	Parameters: 0
	Flags: None
*/
function function_a91422ce()
{
	self notify(#"hash_36ad2ac26d17068a");
	self endon(#"hash_36ad2ac26d17068a");
	self endon(#"disconnect");
	results = undefined;
	results = self waittill(#"weapon_fired");
	/#
	#/
}

/*
	Name: function_6b6cc0a8
	Namespace: namespace_41cb996
	Checksum: 0x5DD85381
	Offset: 0x1900
	Size: 0xB8
	Parameters: 0
	Flags: Linked
*/
function function_6b6cc0a8()
{
	self notify("69ae57047fb51389");
	self endon("69ae57047fb51389");
	self endon(#"disconnect");
	self endon(#"hash_6edec00b6bae610a");
	while(true)
	{
		result = undefined;
		result = self waittill(#"missile_fire");
		if(isdefined(result.weapon) && result.weapon.name === #"zombietron_launcher_2")
		{
			self thread function_64adaae3();
		}
	}
}

/*
	Name: function_bacdbafd
	Namespace: namespace_41cb996
	Checksum: 0x18F0AE03
	Offset: 0x19C0
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_bacdbafd(var_6a86da57)
{
	if(var_6a86da57 == "zombietron_launcher")
	{
		return &function_6b6cc0a8;
	}
}

/*
	Name: function_ed0da451
	Namespace: namespace_41cb996
	Checksum: 0x21B0E6F4
	Offset: 0x19F8
	Size: 0x6C
	Parameters: 6
	Flags: Linked
*/
function function_ed0da451(ai, idamage, eattacker, vdir, smeansofdeath, weapon)
{
	vdir namespace_e32bb68::function_3a59ec34("wpn_doa_buzzsaw_impact_zombie");
	vdir namespace_ed80aead::function_1f275794(weapon, smeansofdeath);
}

/*
	Name: function_3d40d138
	Namespace: namespace_41cb996
	Checksum: 0xC0E3D90F
	Offset: 0x1A70
	Size: 0xB4
	Parameters: 6
	Flags: Linked
*/
function function_3d40d138(ai, idamage, eattacker, vdir, smeansofdeath, weapon)
{
	eattacker namespace_e32bb68::function_3a59ec34("wpn_doa_buzzsaw_impact_zombie");
	namespace_ed80aead::trygibbinglimb(eattacker, vdir, undefined, undefined, (math::cointoss() ? "right_arm_upper" : "left_arm_upper"));
	eattacker namespace_ed80aead::function_1f275794(weapon, smeansofdeath);
}

/*
	Name: function_bcd45061
	Namespace: namespace_41cb996
	Checksum: 0x788F876A
	Offset: 0x1B30
	Size: 0x14C
	Parameters: 6
	Flags: Linked
*/
function function_bcd45061(ai, idamage, eattacker, vdir, smeansofdeath, weapon)
{
	eattacker namespace_e32bb68::function_3a59ec34("wpn_doa_buzzsaw_impact_zombie");
	if(!is_true(eattacker.boss) && randomint(100) < 20)
	{
		eattacker thread namespace_ec06fe4a::function_570729f0(0.5, smeansofdeath);
		eattacker namespace_ed80aead::function_586ef822();
	}
	else
	{
		namespace_ed80aead::trygibbinghead(eattacker, vdir, undefined, undefined, "head", 0, 1);
		namespace_ed80aead::trygibbinglimb(eattacker, vdir, undefined, undefined, (math::cointoss() ? "right_arm_upper" : "left_arm_upper"));
		eattacker namespace_ed80aead::function_1f275794(weapon, smeansofdeath);
	}
}

/*
	Name: function_64adaae3
	Namespace: namespace_41cb996
	Checksum: 0xBF29D890
	Offset: 0x1C88
	Size: 0x25C
	Parameters: 0
	Flags: Linked
*/
function function_64adaae3()
{
	enemies = namespace_ec06fe4a::function_8ff7f92c(self.team);
	if(enemies.size == 0)
	{
		return;
	}
	closetargets = arraysortclosest(enemies, self.origin, enemies.size, 0, 4096);
	fovtargets = [];
	foreach(guy in closetargets)
	{
		if(is_true(guy.boss))
		{
			continue;
		}
		if(util::within_fov(self.origin, self.angles, guy.origin, 0.8))
		{
			fovtargets[fovtargets.size] = guy;
		}
		if(fovtargets.size >= 2)
		{
			break;
		}
	}
	if(fovtargets.size == 0)
	{
		return;
	}
	target1 = fovtargets[0];
	target2 = (fovtargets.size > 1 ? fovtargets[1] : fovtargets[0]);
	v_spawn = self gettagorigin("tag_flash");
	v_dir = anglestoforward(self.angles) * 50;
	if(!isdefined(v_spawn))
	{
		v_spawn = self.origin;
	}
	aimspot = (v_spawn + v_dir) + vectorscale((0, 0, 1), 50);
	self thread function_eae80c2(v_spawn, aimspot, target1);
	waitframe(1);
	self thread function_eae80c2(v_spawn, aimspot, target2);
}

/*
	Name: function_eae80c2
	Namespace: namespace_41cb996
	Checksum: 0x67665D74
	Offset: 0x1EF0
	Size: 0xE4
	Parameters: 4
	Flags: Linked
*/
function function_eae80c2(origin, aimspot, target, var_7aea2f21)
{
	if(!isdefined(var_7aea2f21))
	{
		var_7aea2f21 = 0.1;
	}
	self endon(#"disconnect");
	self endon(#"death");
	magicbullet(level.doa.var_5b088fde, origin, aimspot, self);
	result = undefined;
	result = self waittill(#"missile_fire");
	wait(var_7aea2f21);
	if(isdefined(target) && isdefined(result.projectile))
	{
		result.projectile missile_settarget(target);
	}
}

/*
	Name: function_41a10718
	Namespace: namespace_41cb996
	Checksum: 0xCCDE22AA
	Offset: 0x1FE0
	Size: 0xC2
	Parameters: 2
	Flags: Linked
*/
function function_41a10718(timesec, var_effbd38b)
{
	if(!isdefined(var_effbd38b))
	{
		var_effbd38b = 1;
	}
	time = gettime();
	if(self.doa.var_909a4dd5 < time && is_true(var_effbd38b))
	{
		self thread function_a0a68431();
	}
	self.doa.var_909a4dd5 = time + (int(self doa_fate::function_4808b985(8) * 1000));
}

/*
	Name: function_a0a68431
	Namespace: namespace_41cb996
	Checksum: 0xA58FD897
	Offset: 0x20B0
	Size: 0x134
	Parameters: 0
	Flags: Linked
*/
function function_a0a68431()
{
	self notify("6343e2e8820ce509");
	self endon("6343e2e8820ce509");
	self endon(#"disconnect");
	self thread namespace_83eb6304::turnofffx("ammo_unlimited");
	util::wait_network_frame();
	self namespace_83eb6304::function_3ecfde67("ammo_unlimited");
	while(isdefined(self) && self.doa.var_909a4dd5 > gettime())
	{
		result = undefined;
		result = self waittilltimeout(0.25, #"hash_6edec00b6bae610a", #"player_died");
		if(result._notify === "timeout")
		{
			continue;
		}
	}
	self.doa.var_909a4dd5 = 0;
	if(isdefined(self))
	{
		self thread namespace_83eb6304::turnofffx("ammo_unlimited");
	}
}

