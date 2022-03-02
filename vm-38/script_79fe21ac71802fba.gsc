#using script_1c65dbfc2f1c8d8f;
#using script_2c74a7b5eea1ec89;
#using script_383a3b1bb18ba876;
#using script_4108035fe400ce67;
#using script_4663ec59d864e437;
#using script_47fb62300ac0bd60;
#using script_6c8abe14025b47c4;
#using script_79a7e1c31a3e8cc;
#using script_7bacb32f8222fa3e;
#using script_7bafaa95bb1b427e;
#using script_8988fdbc78d6c53;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\battlechatter.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\damagefeedback_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;

#namespace namespace_3f19542;

/*
	Name: function_103f7565
	Namespace: namespace_3f19542
	Checksum: 0xC5D1D217
	Offset: 0x1E0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_103f7565()
{
	level notify(1621181454);
}

/*
	Name: function_89f2df9
	Namespace: namespace_3f19542
	Checksum: 0xB2D3B7EE
	Offset: 0x200
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_2565a71514aa2b10", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: namespace_3f19542
	Checksum: 0x3D0728AB
	Offset: 0x250
	Size: 0x174
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	killstreaks::function_e4ef8390("killstreak_spy_med_pack", &function_12db55ec);
	level.var_c9404b0a = spawnstruct();
	level.var_c9404b0a.var_8e10bc5d = [];
	level.var_c9404b0a.var_bbb51a2a = [];
	level.var_c9404b0a.var_d741a6a4 = [];
	level.var_c9404b0a.bundle = getscriptbundle("killstreak_spy_med_pack");
	level.var_c9404b0a.weapon = getweapon("spy_med_pack");
	level.var_c9404b0a.bundle.var_bdc8276 = 2;
	level.var_40346f16 = &function_e6d37a78;
	game.var_f39ffe9 = "med_pack_";
	weaponobjects::function_e6400478(#"hash_2565a71514aa2b10", &function_2ee8eb59, 1);
	deployable::function_2e088f73(level.var_c9404b0a.weapon, &function_4e22b9e6);
}

/*
	Name: function_12db55ec
	Namespace: namespace_3f19542
	Checksum: 0xC263B9CB
	Offset: 0x3D0
	Size: 0x188
	Parameters: 1
	Flags: None
*/
function function_12db55ec(killstreaktype)
{
	killstreak_id = self killstreakrules::killstreakstart("spy_med_pack", self.team);
	if(killstreak_id == -1)
	{
		return 0;
	}
	var_29cabbb2 = getweapon("spy_med_pack");
	var_86d3b295 = self deployable::function_b3d993e9(var_29cabbb2);
	if(var_86d3b295)
	{
		self gestures::function_e62f6dde("gestable_spy_med_pack", undefined, 0);
		var_f6b0d0cc = self magicgrenadeplayer(var_29cabbb2, self.var_b8878ba9, self.var_ddc03e10);
		var_f6b0d0cc thread function_cc39bcf1(undefined, self);
		waitframe(2);
		var_970221b1 = self weapons::function_fe1f5cc();
		self weapons::function_d571ac59(var_970221b1, 1, undefined, 1);
		self stats::function_e24eec31(var_29cabbb2, #"used", 1);
	}
	return var_86d3b295;
}

/*
	Name: function_2ee8eb59
	Namespace: namespace_3f19542
	Checksum: 0x78271D03
	Offset: 0x560
	Size: 0x9A
	Parameters: 1
	Flags: None
*/
function function_2ee8eb59(watcher)
{
	watcher.watchforfire = 1;
	watcher.onspawn = &function_cc39bcf1;
	watcher.timeout = float(level.var_c9404b0a.bundle.ksduration) / 1000;
	watcher.ontimeout = &function_42c401bb;
	watcher.var_994b472b = &function_5d668640;
}

/*
	Name: function_5d668640
	Namespace: namespace_3f19542
	Checksum: 0x5CEC265
	Offset: 0x608
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function function_5d668640(player)
{
	if(!isdefined(self.var_f6b0d0cc))
	{
		return;
	}
	self.var_f6b0d0cc.var_8d834202 = 1;
	self.var_f6b0d0cc thread function_e6d37a78(0);
}

/*
	Name: function_42c401bb
	Namespace: namespace_3f19542
	Checksum: 0xAA1335D0
	Offset: 0x660
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function function_42c401bb()
{
	if(!isdefined(self.var_f6b0d0cc))
	{
		return;
	}
	self.var_f6b0d0cc thread function_e6d37a78(0);
}

/*
	Name: function_cc39bcf1
	Namespace: namespace_3f19542
	Checksum: 0xF12D8458
	Offset: 0x698
	Size: 0x184
	Parameters: 2
	Flags: None
*/
function function_cc39bcf1(watcher, owner)
{
	self endon(#"death");
	self thread weaponobjects::onspawnuseweaponobject(watcher, owner);
	self hide();
	self.var_52a68abf = 1;
	self.var_24d0abd1 = 1;
	self.delete_on_death = 1;
	if(!is_true(self.previouslyhacked))
	{
		if(isdefined(owner))
		{
			owner stats::function_e24eec31(self.weapon, #"used", 1);
		}
		self waittilltimeout(10, #"stationary");
		if(!owner deployable::function_f8fe102f())
		{
			owner setriotshieldfailhint();
			self deletedelay();
			return;
		}
		self deployable::function_dd266e08(owner);
		self.var_2625f7cb = owner.var_2625f7cb;
		owner.var_2625f7cb = undefined;
		owner function_9346db70(self);
	}
}

/*
	Name: playdeathfx
	Namespace: namespace_3f19542
	Checksum: 0x75F078FB
	Offset: 0x828
	Size: 0x5C
	Parameters: 0
	Flags: None
*/
function playdeathfx()
{
	weaponobjects::function_b4793bda(self, level.var_c9404b0a.weapon);
	self playsound(level.var_c9404b0a.bundle.var_b3756378);
}

/*
	Name: function_263be969
	Namespace: namespace_3f19542
	Checksum: 0xF6FCB438
	Offset: 0x890
	Size: 0x5C
	Parameters: 0
	Flags: None
*/
function function_263be969()
{
	weaponobjects::function_f2a06099(self, level.var_c9404b0a.weapon);
	self playsound(level.var_c9404b0a.bundle.var_b3756378);
}

/*
	Name: function_4e22b9e6
	Namespace: namespace_3f19542
	Checksum: 0xDB72B137
	Offset: 0x8F8
	Size: 0x228
	Parameters: 3
	Flags: None
*/
function function_4e22b9e6(origin, angles, player)
{
	if(!isdefined(player.var_2625f7cb))
	{
		player.var_2625f7cb = spawnstruct();
	}
	var_7e37effb = (isdefined(level.var_c9404b0a.bundle.var_bdc8276) ? level.var_c9404b0a.bundle.var_bdc8276 : 0);
	testdistance = var_7e37effb * var_7e37effb;
	ids = getarraykeys(level.var_c9404b0a.var_8e10bc5d);
	foreach(id in ids)
	{
		if(id == player.clientid)
		{
			continue;
		}
		packs = level.var_c9404b0a.var_8e10bc5d[id];
		foreach(var_f6b0d0cc in packs)
		{
			if(!isdefined(var_f6b0d0cc))
			{
				continue;
			}
			distsqr = distancesquared(angles, var_f6b0d0cc.origin);
			if(distsqr <= testdistance)
			{
				return false;
			}
		}
	}
	return true;
}

/*
	Name: function_9346db70
	Namespace: namespace_3f19542
	Checksum: 0x67214702
	Offset: 0xB28
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function function_9346db70(var_f6b0d0cc)
{
	var_f6b0d0cc setvisibletoall();
	if(isdefined(var_f6b0d0cc.othermodel))
	{
		var_f6b0d0cc.othermodel setinvisibletoall();
	}
	if(isdefined(var_f6b0d0cc.var_2625f7cb))
	{
		self function_cb436f32(var_f6b0d0cc);
	}
}

/*
	Name: function_780f9aa
	Namespace: namespace_3f19542
	Checksum: 0x8AD7E0CD
	Offset: 0xBA8
	Size: 0x10A
	Parameters: 13
	Flags: None
*/
function function_780f9aa(einflictor, attacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, iboneindex, imodelindex)
{
	bundle = level.var_c9404b0a.bundle;
	chargelevel = 0;
	weapon_damage = killstreak_bundles::get_weapon_damage("killstreak_spy_med_pack", bundle.kshealth, vdir, imodelindex, iboneindex, shitloc, psoffsettime, chargelevel);
	if(!isdefined(weapon_damage))
	{
		weapon_damage = killstreaks::get_old_damage(vdir, imodelindex, iboneindex, shitloc, 1);
	}
	return int(weapon_damage);
}

/*
	Name: function_438ca4e0
	Namespace: namespace_3f19542
	Checksum: 0xE4FFE6CA
	Offset: 0xCC0
	Size: 0x92
	Parameters: 0
	Flags: None
*/
function function_438ca4e0()
{
	var_f6b0d0cc = self;
	var_f6b0d0cc endon(#"hash_5f25f60b7159ac0f", #"death");
	level waittill(#"game_ended");
	if(!isdefined(self))
	{
		return;
	}
	var_f6b0d0cc.var_8d834202 = 1;
	self thread function_e6d37a78(0, 0);
	var_f6b0d0cc.var_648955e6 = 1;
}

/*
	Name: function_530817e7
	Namespace: namespace_3f19542
	Checksum: 0x1236496B
	Offset: 0xD60
	Size: 0x38
	Parameters: 0
	Flags: None
*/
function function_530817e7()
{
	var_d5110c6d = game.var_f39ffe9;
	game.var_f39ffe9 = game.var_f39ffe9 + 1;
	return var_d5110c6d;
}

/*
	Name: function_cb436f32
	Namespace: namespace_3f19542
	Checksum: 0x9B3B53B3
	Offset: 0xDA0
	Size: 0x7C0
	Parameters: 1
	Flags: None
*/
function function_cb436f32(object)
{
	player = self;
	if(isdefined(level.var_c9404b0a.var_8e10bc5d[player.clientid]) && level.var_c9404b0a.var_8e10bc5d[player.clientid].size >= (isdefined(level.var_c9404b0a.bundle.var_cbe1e532) ? level.var_c9404b0a.bundle.var_cbe1e532 : 1))
	{
		obj = level.var_c9404b0a.var_8e10bc5d[player.clientid][0];
		if(isdefined(obj))
		{
			obj.var_8d834202 = 1;
			obj thread function_e6d37a78(0);
		}
		else
		{
			level.var_c9404b0a.var_8e10bc5d[self.clientid] = undefined;
		}
	}
	var_f6b0d0cc = spawn("script_model", object.origin);
	var_f6b0d0cc function_619a5c20();
	var_f6b0d0cc setmodel(level.var_c9404b0a.weapon.var_22082a57);
	object.var_f6b0d0cc = var_f6b0d0cc;
	var_f6b0d0cc.var_2d045452 = object;
	var_f6b0d0cc function_41b29ff0("wpn_t9_eqp_med_pack_destructible");
	var_f6b0d0cc useanimtree("generic");
	var_f6b0d0cc.owner = player;
	var_f6b0d0cc.clientid = var_f6b0d0cc.owner.clientid;
	var_f6b0d0cc.angles = player.angles;
	var_f6b0d0cc.var_86a21346 = &function_780f9aa;
	var_f6b0d0cc solid();
	var_f6b0d0cc show();
	var_f6b0d0cc.victimsoundmod = "vehicle";
	var_f6b0d0cc.weapon = level.var_c9404b0a.weapon;
	var_f6b0d0cc setweapon(var_f6b0d0cc.weapon);
	var_f6b0d0cc.var_57022ab8 = (isdefined(level.var_c9404b0a.bundle.var_5a0d87e0) ? level.var_c9404b0a.bundle.var_5a0d87e0 : 3);
	var_f6b0d0cc.usecount = 0;
	var_f6b0d0cc.objectiveid = gameobjects::get_next_obj_id();
	level.var_c9404b0a.var_bbb51a2a[var_f6b0d0cc.objectiveid] = var_f6b0d0cc;
	if(!isdefined(level.var_c9404b0a.var_8e10bc5d[player.clientid]))
	{
		level.var_c9404b0a.var_8e10bc5d[player.clientid] = [];
	}
	var_a7edcaed = level.var_c9404b0a.var_8e10bc5d.size + 1;
	array::push(level.var_c9404b0a.var_8e10bc5d[player.clientid], var_f6b0d0cc, var_a7edcaed);
	var_f6b0d0cc setcandamage(1);
	var_f6b0d0cc.var_99d2556b = gettime();
	var_f6b0d0cc.uniqueid = function_530817e7();
	function_d7cd849c(level.var_c9404b0a.bundle.var_69b1ff7);
	if(isdefined(level.var_c9404b0a.bundle.var_a0db3d4d))
	{
		var_f6b0d0cc playloopsound(level.var_c9404b0a.bundle.var_a0db3d4d);
	}
	triggerradius = level.var_c9404b0a.bundle.var_366f43e9;
	triggerheight = level.var_c9404b0a.bundle.var_2f1567fb;
	var_b1a6d849 = level.var_c9404b0a.bundle.var_2d890f85;
	usetrigger = spawn("trigger_radius_use", object.origin - vectorscale((0, 0, 1), 50), 0, triggerradius, triggerheight);
	usetrigger usetriggerrequirelookat();
	usetrigger sethintstring(#"hash_75acfdc16a0732df");
	usetrigger triggerignoreteam();
	usetrigger setvisibletoall();
	usetrigger triggerenable(1);
	var_f6b0d0cc.gameobject = gameobjects::create_use_object(player getteam(), usetrigger, [], undefined, level.var_c9404b0a.bundle.var_9333131b, 1);
	var_f6b0d0cc.gameobject gameobjects::set_objective_entity(var_f6b0d0cc);
	var_f6b0d0cc.gameobject gameobjects::set_visible(#"hash_5ccfd7bbbf07c770");
	var_f6b0d0cc.gameobject gameobjects::allow_use(#"hash_5ccfd7bbbf07c770");
	var_f6b0d0cc.gameobject gameobjects::set_use_time(var_b1a6d849);
	usetrigger function_9b047eda(1);
	var_f6b0d0cc.gameobject.onbeginuse = &function_8c8fb7b5;
	var_f6b0d0cc.gameobject.onenduse = &function_a1434496;
	var_f6b0d0cc.gameobject.var_5ecd70 = var_f6b0d0cc;
	var_f6b0d0cc.gameobject.var_33d50507 = 1;
	player deployable::function_6ec9ee30(var_f6b0d0cc, level.var_c9404b0a.weapon);
	var_f6b0d0cc animation::play(#"hash_7540bb5a61e603a");
	var_f6b0d0cc thread function_438ca4e0();
	var_f6b0d0cc thread watchfordamage();
	var_f6b0d0cc thread watchfordeath();
	player notify(#"hash_4d8de48e4e1f053c", {#hash_f6b0d0cc:var_f6b0d0cc});
}

/*
	Name: function_8c8fb7b5
	Namespace: namespace_3f19542
	Checksum: 0x403B60F0
	Offset: 0x1568
	Size: 0xC
	Parameters: 1
	Flags: Private
*/
function private function_8c8fb7b5(player)
{
}

/*
	Name: function_a1434496
	Namespace: namespace_3f19542
	Checksum: 0x4C8E3F9E
	Offset: 0x1580
	Size: 0x3AC
	Parameters: 3
	Flags: Private
*/
function private function_a1434496(team, player, result)
{
	if(!isdefined(player))
	{
		return;
	}
	playerhealth = player getnormalhealth();
	if(playerhealth >= 0.99)
	{
		return;
	}
	var_f6b0d0cc = self.var_5ecd70;
	var_f6b0d0cc.isdisabled = 0;
	if(is_true(result))
	{
		var_f6b0d0cc.usecount++;
		var_f6b0d0cc thread animation::play(#"hash_79647b3513fd2190");
		var_94d1a3ec = getweapon(#"hash_44678c77a1fa37b0");
		if(isdefined(var_94d1a3ec))
		{
			var_70aa8c50 = player hasweapon(var_94d1a3ec);
			var_e6f54cba = 0;
			if(var_70aa8c50)
			{
				var_e6f54cba = player getweaponammoclip(var_94d1a3ec);
				if(var_e6f54cba == 0)
				{
					player setweaponammoclip(var_94d1a3ec, 1);
				}
			}
			else
			{
				player giveweapon(var_94d1a3ec);
				player setweaponammoclip(var_94d1a3ec, 1);
			}
			player switchtoweapon(var_94d1a3ec, 1);
			player gestures::function_e62f6dde("gestable_t9_stimshot", undefined, 1);
			util::wait_network_frame(2);
			if(!isdefined(player))
			{
				return;
			}
			slot = player gadgetgetslot(var_94d1a3ec);
			player function_ac25fc1f(slot, var_94d1a3ec);
			player gadgetactivate(slot, var_94d1a3ec);
			player gadget_health_regen::function_34daf34a(slot, var_94d1a3ec);
			util::wait_network_frame(2);
			if(!isdefined(player))
			{
				return;
			}
			if(var_70aa8c50)
			{
				if(var_e6f54cba > 0)
				{
					if(!player hasweapon(var_94d1a3ec))
					{
						player giveweapon(var_94d1a3ec);
					}
					player setweaponammoclip(var_94d1a3ec, var_e6f54cba);
				}
				else
				{
					player takeweapon(var_94d1a3ec);
				}
			}
			else
			{
				player takeweapon(var_94d1a3ec);
			}
			util::wait_network_frame(2);
			if(isdefined(player))
			{
				prevweapon = player weapons::function_fe1f5cc();
				if(isdefined(prevweapon))
				{
					player switchtoweapon(prevweapon);
				}
			}
		}
		if(var_f6b0d0cc.usecount == var_f6b0d0cc.var_57022ab8)
		{
			var_f6b0d0cc thread function_e6d37a78(0);
		}
	}
}

/*
	Name: watchfordeath
	Namespace: namespace_3f19542
	Checksum: 0xB874059F
	Offset: 0x1938
	Size: 0x74
	Parameters: 0
	Flags: None
*/
function watchfordeath()
{
	level endon(#"game_ended");
	self endon(#"hash_523ddcbd662010e5");
	waitresult = undefined;
	waitresult = self waittill(#"death");
	if(!isdefined(self))
	{
		return;
	}
	self thread function_e6d37a78(0);
}

/*
	Name: watchfordamage
	Namespace: namespace_3f19542
	Checksum: 0xA0483D4C
	Offset: 0x19B8
	Size: 0x150
	Parameters: 0
	Flags: None
*/
function watchfordamage()
{
	self endon(#"death");
	level endon(#"game_ended");
	self endon(#"hash_523ddcbd662010e5");
	var_f6b0d0cc = self;
	var_f6b0d0cc endon(#"death");
	var_f6b0d0cc.health = level.var_c9404b0a.bundle.kshealth;
	startinghealth = var_f6b0d0cc.health;
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"damage");
		if(isdefined(waitresult.attacker) && waitresult.amount > 0 && damagefeedback::dodamagefeedback(waitresult.weapon, waitresult.attacker))
		{
			waitresult.attacker damagefeedback::update(waitresult.mod, waitresult.inflictor, undefined, waitresult.weapon, self);
		}
	}
}

/*
	Name: function_134ae768
	Namespace: namespace_3f19542
	Checksum: 0xDA0D1B6A
	Offset: 0x1B10
	Size: 0xEC
	Parameters: 0
	Flags: None
*/
function function_134ae768()
{
	if(!isdefined(level.var_35814054.var_8e10bc5d[self.clientid]))
	{
		return;
	}
	var_10432750 = undefined;
	for(index = 0; index < level.var_35814054.var_8e10bc5d[self.clientid].size; index++)
	{
		if(level.var_35814054.var_8e10bc5d[self.clientid][index] == self)
		{
			var_10432750 = index;
		}
	}
	if(isdefined(var_10432750))
	{
		level.var_35814054.var_8e10bc5d[self.clientid] = array::remove_index(level.var_35814054.var_8e10bc5d[self.clientid], var_10432750, 0);
	}
}

/*
	Name: function_e6d37a78
	Namespace: namespace_3f19542
	Checksum: 0x1B280605
	Offset: 0x1C08
	Size: 0x186
	Parameters: 2
	Flags: None
*/
function function_e6d37a78(var_d3213f00, var_7497ba51)
{
	if(!isdefined(var_7497ba51))
	{
		var_7497ba51 = 1;
	}
	self notify(#"hash_523ddcbd662010e5");
	self.var_ab0875aa = 1;
	if(isdefined(self.var_1ba7e28e) && self.var_1ba7e28e)
	{
		return;
	}
	if(isdefined(self.objectiveid))
	{
		objective_delete(self.objectiveid);
		gameobjects::release_obj_id(self.objectiveid);
	}
	if(isdefined(self.gameobject))
	{
		self.gameobject thread gameobjects::destroy_object(1, 1);
	}
	self.var_1ba7e28e = 1;
	level.var_c9404b0a.var_bbb51a2a[self.objectiveid] = undefined;
	self function_134ae768();
	if(var_7497ba51 && self.var_8d834202 === 1)
	{
		wait((isdefined(level.var_c9404b0a.bundle.var_fd663ee0) ? level.var_c9404b0a.bundle.var_fd663ee0 : 0) / 1000);
	}
	function_897b13a9();
}

/*
	Name: function_897b13a9
	Namespace: namespace_3f19542
	Checksum: 0x23560757
	Offset: 0x1D98
	Size: 0x26C
	Parameters: 0
	Flags: None
*/
function function_897b13a9()
{
	if(!isdefined(self))
	{
		return;
	}
	player = self.owner;
	if(isdefined(self.var_846acfcf) && isdefined(player) && self.var_846acfcf != player)
	{
		self battlechatter::function_d2600afc(self.var_846acfcf, player, level.var_c9404b0a.weapon, self.var_d02ddb8e);
	}
	if(game.state == #"playing")
	{
		if(self.health <= 0)
		{
			if(isdefined(level.var_c9404b0a.bundle.var_b3756378))
			{
				self playsound(level.var_c9404b0a.bundle.var_b3756378);
			}
		}
		function_d7cd849c(level.var_c9404b0a.bundle.var_10c9ba2d);
	}
	if(self.var_8d834202 === 1)
	{
		function_263be969();
	}
	else
	{
		playdeathfx();
	}
	if(isdefined(level.var_c9404b0a.bundle.var_bb6c29b4) && isdefined(self.var_d02ddb8e) && self.var_d02ddb8e == getweapon(#"shock_rifle"))
	{
		playfx(level.var_c9404b0a.bundle.var_bb6c29b4, self.origin);
	}
	deployable::function_81598103(self);
	if(isdefined(self.var_2d045452))
	{
		self.var_2d045452 delete();
	}
	self stoploopsound();
	self notify(#"hash_5f25f60b7159ac0f");
	self deletedelay();
}

/*
	Name: function_d7cd849c
	Namespace: namespace_3f19542
	Checksum: 0x730CF7C0
	Offset: 0x2010
	Size: 0xC4
	Parameters: 1
	Flags: None
*/
function function_d7cd849c(var_cb0f3959)
{
	if(!isdefined(var_cb0f3959))
	{
		return;
	}
	if(!isdefined(level.var_c9404b0a.var_d741a6a4[var_cb0f3959]))
	{
		level.var_c9404b0a.var_d741a6a4[var_cb0f3959] = 0;
	}
	var_ad7969ca = level.var_c9404b0a.var_d741a6a4[var_cb0f3959];
	if(var_ad7969ca != 0 && gettime() < ((int(5 * 1000)) + var_ad7969ca))
	{
		return;
	}
	level.var_c9404b0a.var_d741a6a4[var_cb0f3959] = gettime();
}

