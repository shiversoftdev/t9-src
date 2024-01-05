#using scripts\zm\perk\zm_perk_tombstone.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using script_7bacb32f8222fa3e;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\weapons\weaponobjects.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_e0966e1e;

/*
	Name: function_1df06a19
	Namespace: namespace_e0966e1e
	Checksum: 0xD96B3953
	Offset: 0x130
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_1df06a19()
{
	level notify(-2107623525);
}

/*
	Name: __init__system__
	Namespace: namespace_e0966e1e
	Checksum: 0x68603EB6
	Offset: 0x150
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_6f7d2657f403b90d", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_e0966e1e
	Checksum: 0x4C200122
	Offset: 0x198
	Size: 0x284
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	entry = spawnstruct();
	entry.weapon_name = #"hash_f223cacb02788e3";
	entry.item_name = #"hash_703910d4007ce2b7";
	if(!isdefined(level.var_d385a742))
	{
		level.var_d385a742 = [];
	}
	else if(!isarray(level.var_d385a742))
	{
		level.var_d385a742 = array(level.var_d385a742);
	}
	level.var_d385a742[level.var_d385a742.size] = entry;
	zm_perk_tombstone::function_7c589e7("tactical", #"hash_703910d4007ce2b7");
	weaponobjects::function_e6400478(#"hash_f223cacb02788e3", &function_36bda67f, 1);
	clientfield::register("scriptmover", "" + #"hash_452045cf5cb8bc4c", 16000, 2, "int");
	clientfield::register("scriptmover", "" + #"hash_7833487f87cacad1", 16000, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_1e3fecb02ce56163", 16000, 1, "int");
	callback::on_item_pickup(&on_item_pickup);
	callback::on_item_drop(&on_item_drop);
	callback::on_bleedout(&function_b31c7f6);
	callback::on_disconnect(&function_b31c7f6);
	level.var_cdd63615 = &function_32e79e8;
}

/*
	Name: on_item_pickup
	Namespace: namespace_e0966e1e
	Checksum: 0xCFDCF127
	Offset: 0x428
	Size: 0x294
	Parameters: 1
	Flags: None
*/
function on_item_pickup(params)
{
	if(!isdefined(params.item) || params.item.var_a6762160.name !== #"hash_703910d4007ce2b7")
	{
		return;
	}
	/#
		/#
			assert(isdefined(params.item.var_7961a37e), "");
		#/
	#/
	item = params.item;
	level flag::set(#"hash_1dc3d47b1604d916");
	item notify(#"hash_46b95c46bf0a5522");
	if(self.var_348162a4 !== item.var_7961a37e)
	{
		if(isdefined(self.var_2a68975a))
		{
			self.var_2a68975a.owner = undefined;
			self.var_2a68975a = undefined;
		}
	}
	if(isdefined(item.owner))
	{
		item.owner.var_2a68975a = undefined;
	}
	if(isdefined(item.var_646dca28))
	{
		self.var_646dca28 = item.var_646dca28;
		level notify(#"hash_c1bf755b6bc771e" + item.var_7961a37e, {#entity:self});
	}
	if(isdefined(item.var_9f865186))
	{
		level util::delay(0.1, undefined, &function_5c927d7, item.var_9f865186);
	}
	self.var_348162a4 = item.var_7961a37e;
	/#
		if(isdefined(self.var_646dca28))
		{
			var_646dca28 = item.var_646dca28.aitype;
			if(isdefined(self.var_646dca28.var_d9558be1))
			{
				var_d9558be1 = "";
			}
			else
			{
				var_d9558be1 = "";
			}
		}
		else
		{
			var_646dca28 = "";
			var_d9558be1 = "";
		}
		function_2586c596((((("" + item.var_7961a37e) + "") + var_646dca28) + "") + var_d9558be1);
	#/
}

/*
	Name: function_5c927d7
	Namespace: namespace_e0966e1e
	Checksum: 0x5524A224
	Offset: 0x6C8
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function function_5c927d7(zombie)
{
	if(!isdefined(zombie))
	{
		return;
	}
	level function_1c8713ac(zombie, undefined);
}

/*
	Name: on_item_drop
	Namespace: namespace_e0966e1e
	Checksum: 0x54664F28
	Offset: 0x708
	Size: 0x15C
	Parameters: 1
	Flags: None
*/
function on_item_drop(params)
{
	if(!isdefined(params.item) || params.item.var_a6762160.name !== #"hash_703910d4007ce2b7" || !isdefined(self.var_348162a4))
	{
		return;
	}
	/#
		/#
			assert(isdefined(self.var_348162a4), "");
		#/
		function_2586c596("" + self.var_348162a4);
	#/
	params.item.var_7961a37e = self.var_348162a4;
	if(isdefined(self.var_646dca28))
	{
		params.item.var_646dca28 = self.var_646dca28;
		level notify(#"hash_c1bf755b6bc771e" + self.var_348162a4, {#entity:params.item});
	}
	self.var_348162a4 = undefined;
	self.var_646dca28 = undefined;
	params.item thread function_646c719c(180, 0);
}

/*
	Name: function_b31c7f6
	Namespace: namespace_e0966e1e
	Checksum: 0x90D207DF
	Offset: 0x870
	Size: 0xCC
	Parameters: 1
	Flags: None
*/
function function_b31c7f6(params)
{
	/#
		/#
			assert(isplayer(self));
		#/
	#/
	if(isdefined(self.var_348162a4))
	{
		point = function_4ba8fde(#"hash_703910d4007ce2b7");
		self item_drop::drop_item(0, getweapon(#"hash_f223cacb02788e3"), 1, 0, point.id, self.origin, self.angles, 0);
	}
}

/*
	Name: function_36bda67f
	Namespace: namespace_e0966e1e
	Checksum: 0xF4777EF6
	Offset: 0x948
	Size: 0x82
	Parameters: 1
	Flags: None
*/
function function_36bda67f(watcher)
{
	watcher.onspawn = &function_c50ebe3c;
	watcher.onspawnretrievetriggers = &empty_function;
	watcher.ondamage = &empty_function;
	watcher.deleteonplayerspawn = 0;
	watcher.altdetonate = 1;
	watcher.var_e7ebbd38 = &function_2ba36cfa;
}

/*
	Name: function_fee6bda
	Namespace: namespace_e0966e1e
	Checksum: 0xB9D33E3F
	Offset: 0x9D8
	Size: 0x15C
	Parameters: 0
	Flags: None
*/
function function_fee6bda()
{
	self endon(#"death");
	self waittill(#"stationary");
	self ghost();
	self.trap_model = util::spawn_model(#"hash_f93e1bf903e219b", self.origin, self.angles);
	self.trap_model thread function_889999bf(self);
	self.trap_model playsound(#"hash_842c1f262fe471d");
	self.trap_model notsolid();
	self thread function_e7592c16();
	if(isdefined(self.var_646dca28))
	{
		self.trap_model function_652b9314(1);
		self.trap_model thread scene::play(#"hash_784b53e0aaf6208d", "shake", self.trap_model);
	}
	else
	{
		self thread function_41956b36();
	}
}

/*
	Name: function_41956b36
	Namespace: namespace_e0966e1e
	Checksum: 0x77C14B59
	Offset: 0xB40
	Size: 0x74
	Parameters: 0
	Flags: None
*/
function function_41956b36()
{
	self endon(#"death");
	self zm_vo::function_d6f8bbd9(#"hash_11a0021e8a0de4cf");
	self waittill(#"hash_7c721ba2998c698b");
	self zm_vo::function_d6f8bbd9(#"hash_52b3ab09bea15ef1");
}

/*
	Name: function_889999bf
	Namespace: namespace_e0966e1e
	Checksum: 0x68769BC0
	Offset: 0xBC0
	Size: 0x6C
	Parameters: 1
	Flags: None
*/
function function_889999bf(var_bea4648f)
{
	level endon(#"end_game");
	self endon(#"death");
	var_bea4648f waittill(#"death");
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: function_c50ebe3c
	Namespace: namespace_e0966e1e
	Checksum: 0x1CE2713
	Offset: 0xC38
	Size: 0x17C
	Parameters: 2
	Flags: None
*/
function function_c50ebe3c(watcher, owner)
{
	self endon(#"death");
	self.target_zombie = undefined;
	self thread function_646c719c(180, 1);
	self thread function_fee6bda();
	self function_619a5c20();
	self.var_7961a37e = owner.var_348162a4;
	/#
		self callback::on_death(&function_71d12dd9);
	#/
	if(isdefined(owner))
	{
		if(isdefined(owner.var_646dca28))
		{
			self.var_646dca28 = owner.var_646dca28;
			owner.var_646dca28 = undefined;
			level notify(#"hash_c1bf755b6bc771e" + self.var_7961a37e, {#entity:self});
		}
		owner.var_2a68975a = self;
		self.owner = owner;
		if(isdefined(level.var_cdd63615))
		{
			owner thread [[level.var_cdd63615]]();
		}
	}
	/#
		function_2586c596("" + self.var_7961a37e);
	#/
}

/*
	Name: function_e7592c16
	Namespace: namespace_e0966e1e
	Checksum: 0xF91303F8
	Offset: 0xDC0
	Size: 0x20C
	Parameters: 0
	Flags: None
*/
function function_e7592c16()
{
	self endon(#"death");
	self.trap_model function_6018b54a(1);
	while(true)
	{
		var_245d737a = undefined;
		zombies = getaiteamarray(level.zombie_team);
		var_4f6af2f4 = arraysortclosest(zombies, self.origin, 5, undefined, 64);
		if(isdefined(var_4f6af2f4))
		{
			foreach(zombie in var_4f6af2f4)
			{
				if(!is_true(zombie.var_943dace9) && !is_true(zombie.is_locked) && !is_true(zombie.var_9d11c76e))
				{
					self notify(#"hash_7c721ba2998c698b");
					var_245d737a = zombie;
					break;
				}
			}
		}
		if(isdefined(var_245d737a))
		{
			if(!isdefined(self.target_zombie))
			{
				self.trap_model function_6018b54a(0);
			}
		}
		else if(isdefined(self.target_zombie))
		{
			self.trap_model function_6018b54a(1);
		}
		self.target_zombie = var_245d737a;
		waitframe(1);
	}
}

/*
	Name: function_2ba36cfa
	Namespace: namespace_e0966e1e
	Checksum: 0xA574071A
	Offset: 0xFD8
	Size: 0x184
	Parameters: 1
	Flags: None
*/
function function_2ba36cfa(watcher)
{
	if(!isdefined(self.var_2a68975a) || !isdefined(self.var_2a68975a.target_zombie) || is_true(self.var_2a68975a.target_zombie.is_locked) || is_true(self.var_2a68975a.var_98d25e8e) || is_true(self.var_2a68975a.broken) || isdefined(self.var_646dca28) || isdefined(self.var_2a68975a.var_646dca28) || !isdefined(self.var_2a68975a.trap_model))
	{
		/#
			function_2586c596("");
		#/
		return;
	}
	self.var_2a68975a.var_98d25e8e = 1;
	self.var_2a68975a thread function_b6bf3f94(5);
	self.var_2a68975a thread function_62d26159(self.var_2a68975a.target_zombie, self);
	self function_bc82f900(#"zm_interact_rumble");
}

/*
	Name: function_62d26159
	Namespace: namespace_e0966e1e
	Checksum: 0x2D56FACD
	Offset: 0x1168
	Size: 0x5E6
	Parameters: 2
	Flags: None
*/
function function_62d26159(target_zombie, player)
{
	self endon(#"death", #"hash_46b95c46bf0a5522");
	self.var_9f865186 = target_zombie;
	self.trap_model linkto(self.var_9f865186);
	target_zombie ai::stun(10);
	target_zombie.b_ignore_cleanup = 1;
	target_zombie.is_inert = 1;
	target_zombie.is_locked = 1;
	self.trap_model thread scene::play(#"hash_784b53e0aaf6208d", "open", self.trap_model);
	wait(0.5);
	self.trap_model thread function_6fff9b43();
	self.trap_model function_e512e77b(1);
	self.trap_model notify(#"hash_53ccfec5da1e6068");
	wait(3);
	self.trap_model notify(#"hash_6eff933a50ad6ea");
	if(isalive(target_zombie))
	{
		target_zombie hide();
		target_zombie notsolid();
		target_zombie val::set(#"hash_3859bdb609b02b2f", "allowdeath", 0);
		target_zombie val::set(#"hash_3859bdb609b02b2f", "takedamage", 0);
	}
	self.trap_model thread scene::play(#"hash_784b53e0aaf6208d", "close", self.trap_model);
	self.trap_model function_e512e77b(0);
	wait(0.1);
	if(isalive(target_zombie))
	{
		self.trap_model function_e512e77b(2);
		self.trap_model thread scene::play(#"hash_784b53e0aaf6208d", "shake", self.trap_model);
		wait(2);
		self.trap_model function_e512e77b(0);
	}
	if(isalive(target_zombie))
	{
		if(target_zombie.health <= (target_zombie.maxhealth * (isdefined(target_zombie.var_d9558be1) ? 0.15 : 0.25)))
		{
			/#
				function_2586c596("" + target_zombie.aitype);
			#/
			target_zombie callback::callback(#"hash_3beb0aebbde81394");
			self.var_646dca28 = target_zombie;
			target_zombie.is_locked = 0;
			target_zombie.var_943dace9 = 1;
			self.trap_model function_652b9314(1);
			self notify(#"hash_5600121a4b0794ab");
			target_zombie ai::stun(600);
			if(isdefined(self.var_7961a37e))
			{
				level thread function_3b028b4a(180, target_zombie, self.var_7961a37e, self);
				level thread function_56c2c289(self.var_7961a37e);
			}
			if(isalive(player))
			{
				player function_bc82f900(#"damage_heavy");
			}
		}
		else
		{
			item_drop::function_ba4c90d9(self);
			if(isalive(player))
			{
				player function_bc82f900(#"damage_heavy");
			}
			self.trap_model thread scene::play(#"hash_784b53e0aaf6208d", "open", self.trap_model);
			self.broken = 1;
			self.trap_model playsound(#"hash_3543cdcc15d2b0db");
			wait(0.2);
			self.trap_model function_e512e77b(3);
			if(isalive(target_zombie))
			{
				level function_1c8713ac(target_zombie);
			}
			self thread zm_vo::function_d6f8bbd9(#"hash_54110dbfbcdb085f");
			self thread function_b3ba3bb3(2);
			/#
				function_2586c596("");
			#/
		}
	}
	self.var_98d25e8e = 0;
	self.var_9f865186 = undefined;
}

/*
	Name: function_b3ba3bb3
	Namespace: namespace_e0966e1e
	Checksum: 0xA1A841EB
	Offset: 0x1758
	Size: 0x84
	Parameters: 1
	Flags: None
*/
function function_b3ba3bb3(delay_time)
{
	self endon(#"death");
	wait(delay_time);
	level notify(#"hash_6382150c7bec4fd9", {#id:self.var_7961a37e});
	weaponobjects::function_f2a06099(self, undefined);
	self deletedelay();
}

/*
	Name: function_b6bf3f94
	Namespace: namespace_e0966e1e
	Checksum: 0x54EB124F
	Offset: 0x17E8
	Size: 0x2E
	Parameters: 1
	Flags: None
*/
function function_b6bf3f94(time)
{
	self endon(#"death");
	wait(time);
	self.var_98d25e8e = undefined;
}

/*
	Name: function_43cd5eff
	Namespace: namespace_e0966e1e
	Checksum: 0xD56BC684
	Offset: 0x1820
	Size: 0xF6
	Parameters: 0
	Flags: None
*/
function function_43cd5eff()
{
	/#
		function_2586c596("");
		/#
			assert(isdefined(self.var_348162a4));
		#/
	#/
	level notify(#"hash_52b46513284ae413", {#id:self.var_348162a4});
	level notify(#"hash_56f7aed0dabf82ca" + self.var_348162a4);
	if(isdefined(self.var_646dca28))
	{
		self.var_646dca28 delete();
	}
	self thread zm_weapons::weapon_take(getweapon(#"hash_f223cacb02788e3"));
	self.var_348162a4 = undefined;
}

/*
	Name: function_646c719c
	Namespace: namespace_e0966e1e
	Checksum: 0xCA689BEE
	Offset: 0x1920
	Size: 0x184
	Parameters: 2
	Flags: None
*/
function function_646c719c(time, is_deployed)
{
	if(!isdefined(is_deployed))
	{
		is_deployed = 0;
	}
	self endon(#"death", #"hash_5600121a4b0794ab");
	wait(time);
	/#
		/#
			assert(isdefined(self.var_7961a37e));
		#/
	#/
	level notify(#"hash_6382150c7bec4fd9", {#id:self.var_7961a37e});
	if(is_true(is_deployed) && isdefined(self.owner))
	{
		self.owner.var_2a68975a = undefined;
	}
	if(isdefined(self.var_646dca28))
	{
		level function_1c8713ac(self.var_646dca28, self.origin);
		level notify(#"hash_56f7aed0dabf82ca" + self.var_7961a37e);
	}
	if(isdefined(self.var_9f865186))
	{
		level function_1c8713ac(self.var_9f865186);
	}
	weaponobjects::function_f2a06099(self, undefined);
	self deletedelay();
}

/*
	Name: function_3b028b4a
	Namespace: namespace_e0966e1e
	Checksum: 0x8394A3AE
	Offset: 0x1AB0
	Size: 0x50E
	Parameters: 4
	Flags: None
*/
function function_3b028b4a(time_left, var_646dca28, var_7961a37e, var_b512a2d)
{
	level endon(#"end_game", #"hash_56f7aed0dabf82ca" + var_7961a37e);
	start_time = gettime();
	var_28dbb034 = 0;
	if(!isdefined(level.var_acb5d4ce))
	{
		level.var_acb5d4ce = [];
	}
	else if(!isarray(level.var_acb5d4ce))
	{
		level.var_acb5d4ce = array(level.var_acb5d4ce);
	}
	level.var_acb5d4ce[var_7961a37e] = spawnstruct();
	level.var_acb5d4ce[var_7961a37e].var_b512a2d = var_b512a2d;
	level.var_acb5d4ce[var_7961a37e].var_b722fee6 = var_b512a2d;
	while(true)
	{
		result = undefined;
		result = level waittilltimeout(time_left, #"hash_c1bf755b6bc771e" + var_7961a37e);
		if(result._notify == #"timeout")
		{
			if(!isdefined(var_646dca28))
			{
				/#
					println("");
				#/
			}
			else
			{
				if(isdefined(level.var_acb5d4ce[var_7961a37e].var_b512a2d))
				{
					level function_1c8713ac(var_646dca28, level.var_acb5d4ce[var_7961a37e].var_b512a2d.origin, var_28dbb034);
				}
				else
				{
					if(isdefined(level.var_acb5d4ce[var_7961a37e].var_b722fee6))
					{
						level function_1c8713ac(var_646dca28, level.var_acb5d4ce[var_7961a37e].var_b722fee6.origin, var_28dbb034);
					}
					else
					{
						/#
							assert(0, "");
						#/
						/#
						#/
					}
				}
			}
			if(var_28dbb034)
			{
				if(isplayer(level.var_acb5d4ce[var_7961a37e].var_b512a2d))
				{
					level.var_acb5d4ce[var_7961a37e].var_b512a2d thread zm_weapons::weapon_take(getweapon(#"hash_f223cacb02788e3"));
					level.var_acb5d4ce[var_7961a37e].var_b512a2d function_bc82f900(#"damage_heavy");
				}
			}
			else if(isdefined(level.var_acb5d4ce[var_7961a37e].var_b512a2d))
			{
				var_b512a2d = level.var_acb5d4ce[var_7961a37e].var_b512a2d;
				item_drop::function_ba4c90d9(var_b512a2d);
				trap_model = var_b512a2d.trap_model;
				if(isdefined(trap_model))
				{
					trap_model thread scene::play(#"hash_784b53e0aaf6208d", "open", trap_model);
					var_b512a2d.broken = 1;
					wait(0.2);
					if(isdefined(trap_model))
					{
						trap_model function_e512e77b(3);
					}
					if(isdefined(var_b512a2d))
					{
						var_b512a2d thread function_b3ba3bb3(2);
					}
				}
				else
				{
					var_b512a2d delete();
				}
			}
			level notify(#"hash_6382150c7bec4fd9", {#id:var_7961a37e});
			break;
		}
		else
		{
			if(isplayer(result.entity))
			{
				var_28dbb034 = 1;
			}
			else
			{
				var_28dbb034 = 0;
			}
			level.var_acb5d4ce[var_7961a37e].var_b722fee6 = level.var_acb5d4ce[var_7961a37e].var_b512a2d;
			level.var_acb5d4ce[var_7961a37e].var_b512a2d = result.entity;
		}
		time_now = gettime();
		time_left = time_left - ((float(time_now - start_time)) / 1000);
		start_time = time_now;
	}
}

/*
	Name: function_56c2c289
	Namespace: namespace_e0966e1e
	Checksum: 0xD13DAD2F
	Offset: 0x1FC8
	Size: 0x42C
	Parameters: 1
	Flags: None
*/
function function_56c2c289(var_7961a37e)
{
	level endon(#"end_game", #"hash_56f7aed0dabf82ca" + var_7961a37e);
	level thread function_8fc5d602(var_7961a37e, #"hash_203ea2f2b45c85ca");
	wait(float(max((isdefined(soundgetplaybacktime(#"hash_203ea2f2b45c85ca")) ? soundgetplaybacktime(#"hash_203ea2f2b45c85ca") : 500), 500)) / 1000);
	level thread function_8fc5d602(var_7961a37e, #"hash_169d351a60759115");
	wait(60 - (float(max((isdefined(soundgetplaybacktime(#"hash_203ea2f2b45c85ca")) ? soundgetplaybacktime(#"hash_203ea2f2b45c85ca") : 500), 500)) / 1000));
	level thread function_8fc5d602(var_7961a37e, #"hash_59d0393887a59de");
	wait(60);
	level thread function_8fc5d602(var_7961a37e, #"hash_5dbc46214b51bc37");
	wait(30);
	level thread function_8fc5d602(var_7961a37e, #"hash_3b9f80e58542df7e");
	wait(20);
	level thread function_8fc5d602(var_7961a37e, #"hash_1ff54b5aac84119c");
	wait(1);
	level thread function_8fc5d602(var_7961a37e, #"hash_1ff54c5aac84134f");
	wait(1);
	level thread function_8fc5d602(var_7961a37e, #"hash_1ff54d5aac841502");
	wait(1);
	level thread function_8fc5d602(var_7961a37e, #"hash_1ff54e5aac8416b5");
	wait(1);
	level thread function_8fc5d602(var_7961a37e, #"hash_1ff5475aac840ad0");
	wait(1);
	level thread function_8fc5d602(var_7961a37e, #"hash_1ff5485aac840c83");
	wait(1);
	level thread function_8fc5d602(var_7961a37e, #"hash_1ff5495aac840e36");
	wait(1);
	level thread function_8fc5d602(var_7961a37e, #"hash_1ff54a5aac840fe9");
	wait(1);
	level thread function_8fc5d602(var_7961a37e, #"hash_1ff5535aac841f34");
	wait(1);
	level thread function_8fc5d602(var_7961a37e, #"hash_1ff5545aac8420e7");
	wait(1);
	level thread function_8fc5d602(var_7961a37e, #"hash_41512e441a2e4ce1");
}

/*
	Name: function_8fc5d602
	Namespace: namespace_e0966e1e
	Checksum: 0x4DC8373D
	Offset: 0x2400
	Size: 0x124
	Parameters: 2
	Flags: None
*/
function function_8fc5d602(var_7961a37e, vo_string)
{
	entity = (isdefined(level.var_acb5d4ce[var_7961a37e].var_b512a2d) ? level.var_acb5d4ce[var_7961a37e].var_b512a2d : level.var_acb5d4ce[var_7961a37e].var_b512a2d);
	if(!isdefined(entity))
	{
		return;
	}
	if(isplayer(entity))
	{
		level zm_vo::function_d6f8bbd9(vo_string, undefined, entity);
	}
	else
	{
		var_a5a8e724 = util::spawn_model(#"tag_origin", entity.origin, entity.angles);
		var_a5a8e724 zm_vo::function_d6f8bbd9(vo_string);
		if(isdefined(var_a5a8e724))
		{
			var_a5a8e724 delete();
		}
	}
}

/*
	Name: function_1c8713ac
	Namespace: namespace_e0966e1e
	Checksum: 0x2DF1741C
	Offset: 0x2530
	Size: 0xCC
	Parameters: 3
	Flags: None
*/
function function_1c8713ac(var_646dca28, var_19d9c3aa, var_82529e94)
{
	if(!isdefined(var_82529e94))
	{
		var_82529e94 = 0;
	}
	/#
		function_2586c596("");
	#/
	if(isdefined(var_19d9c3aa))
	{
		if(var_82529e94)
		{
			var_19d9c3aa = var_19d9c3aa + vectorscale((1, 1, 0), 100);
		}
		var_b45574e6 = getclosestpointonnavmesh(var_19d9c3aa, 500);
		if(!isdefined(var_b45574e6))
		{
			var_b45574e6 = var_19d9c3aa;
		}
		var_646dca28 forceteleport(var_b45574e6);
	}
	var_646dca28 thread function_f8ca0196();
}

/*
	Name: function_f8ca0196
	Namespace: namespace_e0966e1e
	Checksum: 0x53044375
	Offset: 0x2608
	Size: 0xE2
	Parameters: 0
	Flags: None
*/
function function_f8ca0196()
{
	self endon(#"death");
	wait(0.1);
	self ai::clear_stun();
	self show();
	self solid();
	self val::reset(#"hash_3859bdb609b02b2f", "allowdeath");
	self val::reset(#"hash_3859bdb609b02b2f", "takedamage");
	self.b_ignore_cleanup = 0;
	self.is_inert = 0;
	self.var_943dace9 = 0;
	self.is_locked = 0;
}

/*
	Name: function_32e79e8
	Namespace: namespace_e0966e1e
	Checksum: 0x2E57B0CE
	Offset: 0x26F8
	Size: 0xEA
	Parameters: 0
	Flags: None
*/
function function_32e79e8()
{
	if(!isplayer(self))
	{
		return;
	}
	if(isdefined(self.var_40f24532))
	{
		if(gettime() - self.var_40f24532 > int(10 * 1000))
		{
			self zm_equipment::show_hint_text(#"hash_7d040d8a217dc904");
			if(isplayer(self))
			{
				self.var_40f24532 = gettime();
			}
		}
	}
	else
	{
		self zm_equipment::show_hint_text(#"hash_7d040d8a217dc904");
		if(isplayer(self))
		{
			self.var_40f24532 = gettime();
		}
	}
}

/*
	Name: function_6fff9b43
	Namespace: namespace_e0966e1e
	Checksum: 0x84B3ECE5
	Offset: 0x27F0
	Size: 0x11C
	Parameters: 0
	Flags: None
*/
function function_6fff9b43()
{
	self endon(#"hash_6eff933a50ad6ea", #"death");
	self waittill(#"hash_53ccfec5da1e6068");
	while(true)
	{
		a_players = function_a1ef346b();
		foreach(player in a_players)
		{
			if(distancesquared(player.origin, self.origin) < 62500)
			{
				player function_bc82f900(#"hash_3937704286348bfa");
			}
		}
		wait(0.3);
	}
}

/*
	Name: function_e512e77b
	Namespace: namespace_e0966e1e
	Checksum: 0xD9E0C600
	Offset: 0x2918
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function function_e512e77b(state)
{
	self clientfield::set("" + #"hash_452045cf5cb8bc4c", state);
}

/*
	Name: function_6018b54a
	Namespace: namespace_e0966e1e
	Checksum: 0xECE99FAE
	Offset: 0x2958
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function function_6018b54a(state)
{
	self clientfield::set("" + #"hash_7833487f87cacad1", state);
}

/*
	Name: function_652b9314
	Namespace: namespace_e0966e1e
	Checksum: 0x55428DE5
	Offset: 0x2998
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function function_652b9314(state)
{
	self clientfield::set("" + #"hash_1e3fecb02ce56163", state);
}

/*
	Name: empty_function
	Namespace: namespace_e0966e1e
	Checksum: 0x440F3150
	Offset: 0x29D8
	Size: 0x14
	Parameters: 2
	Flags: None
*/
function empty_function(watcher, player)
{
}

/*
	Name: function_71d12dd9
	Namespace: namespace_e0966e1e
	Checksum: 0x8A8516F2
	Offset: 0x29F8
	Size: 0x52
	Parameters: 1
	Flags: None
*/
function function_71d12dd9(params)
{
	/#
		if(isdefined(self.var_fd1ae96a))
		{
			return;
		}
		function_2586c596("" + self.var_7961a37e);
		self.var_fd1ae96a = 1;
	#/
}

/*
	Name: function_2586c596
	Namespace: namespace_e0966e1e
	Checksum: 0xB700DBE5
	Offset: 0x2A58
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function function_2586c596(string)
{
	/#
		if(!getdvarint(#"hash_6c6f56f6f67992a4", 0))
		{
			return;
		}
		iprintlnbold(string);
	#/
}

