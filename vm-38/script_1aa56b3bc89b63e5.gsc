#using script_3819e7a1427df6d2;
#using script_27ef3076a14eb66a;
#using script_1478fbd17fe393cf;
#using script_35ae72be7b4fec10;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace snipercam;

/*
	Name: function_fc621c2e
	Namespace: snipercam
	Checksum: 0x13CB7FE5
	Offset: 0x180
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_fc621c2e()
{
	level notify(-684911245);
}

/*
	Name: __init__system__
	Namespace: snipercam
	Checksum: 0x5B76A1D4
	Offset: 0x1A0
	Size: 0x34
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register("snipercam", &function_f64316de, undefined, undefined, undefined);
}

/*
	Name: function_6e29b7f1
	Namespace: snipercam
	Checksum: 0xB43C2CEB
	Offset: 0x1E0
	Size: 0xD4
	Parameters: 3
	Flags: Linked
*/
function function_6e29b7f1(enabled, on_damage, var_895878e1)
{
	if(!isdefined(on_damage))
	{
		on_damage = 0;
	}
	if(!isdefined(var_895878e1))
	{
		var_895878e1 = 3;
	}
	/#
		assert(isactor(self));
	#/
	if(is_true(enabled))
	{
		self.var_ca3bd64e = var_895878e1;
		self.var_fa99a047 = on_damage;
		self thread function_b5597fc3();
	}
	else
	{
		aiutility::removeaioverridedamagecallback(self, &function_4ad903f4);
	}
}

/*
	Name: function_5d276f5b
	Namespace: snipercam
	Checksum: 0xFDB66E17
	Offset: 0x2C0
	Size: 0x64
	Parameters: 2
	Flags: None
*/
function function_5d276f5b(var_895878e1, victim)
{
	/#
		player = getplayers()[0];
		victim.var_ca3bd64e = var_895878e1;
		victim thread function_856a28c3(0, player);
	#/
}

/*
	Name: function_f64316de
	Namespace: snipercam
	Checksum: 0x9F089411
	Offset: 0x330
	Size: 0x64
	Parameters: 0
	Flags: Linked, Private
*/
function private function_f64316de()
{
	clientfield::register("actor", "start_snipercam", 1, 2, "int");
	clientfield::register("actor", "stop_snipercam", 1, 1, "int");
}

/*
	Name: function_b5597fc3
	Namespace: snipercam
	Checksum: 0xB77CA251
	Offset: 0x3A0
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_b5597fc3()
{
	waitframe(1);
	aiutility::addaioverridedamagecallback(self, &function_4ad903f4);
}

/*
	Name: function_4ad903f4
	Namespace: snipercam
	Checksum: 0xCCE5CE54
	Offset: 0x3D8
	Size: 0x21C
	Parameters: 13
	Flags: Linked, Private
*/
function private function_4ad903f4(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, modelindex)
{
	if(is_true(var_fd90b0bb.isbulletweapon) && (isplayer(idamage) || isplayer(eattacker)))
	{
		if(!isdefined(weapon) || weapon === "MOD_RIFLE_BULLET" || weapon === "MOD_PISTOL_BULLET")
		{
			mindist = 800;
			attacker = idamage;
			if(!isplayer(attacker))
			{
				attacker = eattacker;
			}
			if(isdefined(self.var_8a3fb9e2))
			{
				mindist = self.var_8a3fb9e2;
			}
			if(distancesquared(self.origin, attacker.origin) > sqr(mindist))
			{
				if(self.var_fa99a047 || (!self.var_fa99a047 && (self.health - idflags) <= 0))
				{
					var_afe2c3af = !is_true(self.var_fa99a047);
					self function_6e29b7f1(0);
					self thread function_856a28c3(var_afe2c3af, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, modelindex);
					return 0;
				}
			}
		}
	}
	return idflags;
}

/*
	Name: function_856a28c3
	Namespace: snipercam
	Checksum: 0xD528AA84
	Offset: 0x600
	Size: 0x53C
	Parameters: 13
	Flags: Linked, Private
*/
function private function_856a28c3(var_afe2c3af, einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, modelindex)
{
	/#
		assert(isplayer(boneindex) || isplayer(psoffsettime));
	#/
	self notify(#"hash_ae39942308147bf");
	if(shitloc)
	{
		self.var_4a438c2b = 1;
		util::magic_bullet_shield(self);
	}
	self setentitypaused(1);
	if(isplayer(boneindex))
	{
		player = boneindex;
	}
	else
	{
		player = psoffsettime;
	}
	player flag::set("snipercam");
	namespace_61e6d095::function_28027c42(#"hash_d7f94b2708cafa2");
	player val::set(#"snipercam", "freezecontrols", 1);
	player val::set(#"snipercam", "takedamage", 0);
	player val::set(#"snipercam", "show_weapon_hud", 0);
	player val::set(#"snipercam", "show_hit_marker", 0);
	player val::set(#"snipercam", "show_compass", 0);
	player val::set(#"snipercam", "show_crosshair", 0);
	hint_tutorial::function_57a24ab5(0);
	parms = get_parms(player, player geteye(), player getplayerangles(), self, self.var_ca3bd64e);
	player.holdingbreath = undefined;
	setslowmotion(1, 0.5, 0);
	self clientfield::set("start_snipercam", self.var_ca3bd64e);
	var_b487436a = 1.3 * 0.1;
	wait(parms.var_684cf08c);
	setslowmotion(0.5, 1, 0.5);
	self setentitypaused(0);
	player ghost();
	self notify(#"hash_3d799b8c342663fa");
	self clientfield::set("start_snipercam", 0);
	if(shitloc)
	{
		util::stop_magic_bullet_shield(self);
		self.var_4a438c2b = 0;
		self.diequietly = 1;
		self setnormalhealth(1);
		self kill(player.origin, player, player, modelindex);
	}
	wait(parms.var_6051349d);
	self clientfield::set("stop_snipercam", 1);
	wait(0.1);
	self notify(#"hash_377b8997737880e7");
	hint_tutorial::function_57a24ab5(1);
	player val::reset_all(#"snipercam");
	player show();
	self clientfield::set("stop_snipercam", 0);
	player flag::clear("snipercam");
	namespace_61e6d095::function_4279fd02(#"hash_d7f94b2708cafa2");
}

