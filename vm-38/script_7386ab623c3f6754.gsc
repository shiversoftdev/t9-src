#using script_176597095ddfaa17;
#using script_24c32478acf44108;
#using script_3f9e0dc8454d98e1;
#using script_62caa307a394c18c;
#using script_72401f526ba71638;
#using script_79a7e1c31a3e8cc;
#using script_8988fdbc78d6c53;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\battlechatter.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_bf2d4e77;

/*
	Name: function_eeddde75
	Namespace: namespace_bf2d4e77
	Checksum: 0x9B07BB83
	Offset: 0x178
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_eeddde75()
{
	level notify(793161701);
}

/*
	Name: function_89f2df9
	Namespace: namespace_bf2d4e77
	Checksum: 0x2829A3D7
	Offset: 0x198
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_6be63b3e08b5ceb9", &function_70a657d8, undefined, undefined, #"hash_13a43d760497b54d");
}

/*
	Name: function_70a657d8
	Namespace: namespace_bf2d4e77
	Checksum: 0x49BB3486
	Offset: 0x1E8
	Size: 0xC2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("actor", "" + #"hash_6a9eb737488c81c7", 11000, 1, "counter");
	clientfield::register("actor", "" + #"hash_13a6ddf6358f814", 11000, 1, "int");
	level.var_1765ad79 = 0;
	level.var_c23218c7 = [];
	namespace_1b527536::function_36e0540e(#"hash_5d6f444e983b62ca", 1, 30, #"hash_624a4e2962f2f71c");
	namespace_1b527536::function_36e0540e(#"hash_7a071f09cf16cbfa", 1, 30, #"hash_49368251a6665ba4");
	namespace_1b527536::function_36e0540e(#"hash_7a071e09cf16ca47", 2, 30, #"hash_6594698409ce0c8d");
	namespace_1b527536::function_36e0540e(#"hash_7a071d09cf16c894", 2, 30, #"hash_3a47f4190c28fec6");
	namespace_1b527536::function_36e0540e(#"hash_7a071c09cf16c6e1", 3, 30, #"hash_6fd62be296b8fb57");
	namespace_1b527536::function_36e0540e(#"hash_7a071b09cf16c52e", 3, 30, #"hash_243ded3e58e01788");
	namespace_1b527536::function_dbd391bf(#"hash_5d6f444e983b62ca", &function_d763fd41);
	namespace_1b527536::function_dbd391bf(#"hash_7a071f09cf16cbfa", &function_d763fd41);
	namespace_1b527536::function_dbd391bf(#"hash_7a071e09cf16ca47", &function_d763fd41);
	namespace_1b527536::function_dbd391bf(#"hash_7a071d09cf16c894", &function_d763fd41);
	namespace_1b527536::function_dbd391bf(#"hash_7a071c09cf16c6e1", &function_d763fd41);
	namespace_1b527536::function_dbd391bf(#"hash_7a071b09cf16c52e", &function_d763fd41);
	weaponobjects::function_e6400478(#"hash_5d6f444e983b62ca", &function_464ccb73, 1);
	weaponobjects::function_e6400478(#"hash_7a071f09cf16cbfa", &function_464ccb73, 1);
	weaponobjects::function_e6400478(#"hash_7a071e09cf16ca47", &function_464ccb73, 1);
	weaponobjects::function_e6400478(#"hash_7a071d09cf16c894", &function_464ccb73, 1);
	weaponobjects::function_e6400478(#"hash_7a071c09cf16c6e1", &function_464ccb73, 1);
	weaponobjects::function_e6400478(#"hash_7a071b09cf16c52e", &function_464ccb73, 1);
	deployable::function_2e088f73(getweapon(#"hash_5d6f444e983b62ca"), &function_c355b189, &function_c66c2af4, undefined, #"hash_37605398dce96965", 1);
	deployable::function_2e088f73(getweapon(#"hash_7a071f09cf16cbfa"), &function_c355b189, &function_c66c2af4, undefined, #"hash_37605398dce96965", 1);
	deployable::function_2e088f73(getweapon(#"hash_7a071e09cf16ca47"), &function_c355b189, &function_c66c2af4, undefined, #"hash_37605398dce96965", 1);
	deployable::function_2e088f73(getweapon(#"hash_7a071d09cf16c894"), &function_c355b189, &function_c66c2af4, undefined, #"hash_37605398dce96965", 1);
	deployable::function_2e088f73(getweapon(#"hash_7a071c09cf16c6e1"), &function_c355b189, &function_c66c2af4, undefined, #"hash_37605398dce96965", 1);
	deployable::function_2e088f73(getweapon(#"hash_7a071b09cf16c52e"), &function_c355b189, &function_c66c2af4, undefined, #"hash_37605398dce96965", 1);
	callback::add_callback(#"hash_6dc96d04d1ba7f5a", &function_2ca4337c);
	namespace_9ff9f642::register_slowdown(#"hash_5d6f444e983b62ca", 0.6, 3);
	namespace_9ff9f642::register_slowdown(#"hash_7a071f09cf16cbfa", 0.6, 3);
	namespace_9ff9f642::register_slowdown(#"hash_7a071e09cf16ca47", 0.6, 3);
	namespace_9ff9f642::register_slowdown(#"hash_7a071d09cf16c894", 0.6, 3);
	namespace_9ff9f642::register_slowdown(#"hash_7a071c09cf16c6e1", 0.6, 3);
	namespace_9ff9f642::register_slowdown(#"hash_7a071b09cf16c52e", 0.6, 3);
	namespace_9ff9f642::register_slowdown(#"hash_66bb6c828f73af96", 0.7, 3);
	namespace_9ff9f642::register_slowdown(#"hash_40f93ca047c821e6", 0.7, 3);
	namespace_9ff9f642::register_slowdown(#"hash_6be54a2bd9499617", 0.7, 3);
	namespace_9ff9f642::register_slowdown(#"hash_71a984b8f68b3538", 0.7, 3);
	namespace_9ff9f642::register_slowdown(#"hash_5aed6cd80a86a8e1", 0.7, 3);
	namespace_9ff9f642::register_slowdown(#"hash_132a3fe93930738a", 0.7, 3);
	namespace_9ff9f642::register_slowdown(#"hash_775ba6ec890d5dd6", 0.5, 3);
	zm_equipment::function_76beede2(#"hash_5d6f444e983b62ca", "MOD_GAS");
	zm_equipment::function_76beede2(#"hash_7a071f09cf16cbfa", "MOD_GAS");
	zm_equipment::function_76beede2(#"hash_7a071e09cf16ca47", "MOD_GAS");
	zm_equipment::function_76beede2(#"hash_7a071d09cf16c894", "MOD_GAS");
	zm_equipment::function_76beede2(#"hash_7a071c09cf16c6e1", "MOD_GAS");
	zm_equipment::function_76beede2(#"hash_7a071b09cf16c52e", "MOD_GAS");
	zombie_utility::add_zombie_gib_weapon_callback(#"hash_5d6f444e983b62ca", &function_b70cf4bf, &function_b70cf4bf);
	zombie_utility::add_zombie_gib_weapon_callback(#"hash_7a071f09cf16cbfa", &function_b70cf4bf, &function_b70cf4bf);
	zombie_utility::add_zombie_gib_weapon_callback(#"hash_7a071e09cf16ca47", &function_b70cf4bf, &function_b70cf4bf);
	zombie_utility::add_zombie_gib_weapon_callback(#"hash_7a071d09cf16c894", &function_b70cf4bf, &function_b70cf4bf);
	zombie_utility::add_zombie_gib_weapon_callback(#"hash_7a071c09cf16c6e1", &function_b70cf4bf, &function_b70cf4bf);
	zombie_utility::add_zombie_gib_weapon_callback(#"hash_7a071b09cf16c52e", &function_b70cf4bf, &function_b70cf4bf);
	callback::on_ai_killed(&on_ai_killed);
	callback::add_callback(#"hash_137b937fd26992be", &function_6fa41b21);
}

/*
	Name: function_6fa41b21
	Namespace: namespace_bf2d4e77
	Checksum: 0xA6EDCEF2
	Offset: 0xE20
	Size: 0xC0
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6fa41b21(params)
{
	if(isarray(level.var_c23218c7))
	{
		foreach(var_f968837d in level.var_c23218c7)
		{
			if(isdefined(var_f968837d.var_deb3e8b1))
			{
				var_f968837d.var_deb3e8b1 thread function_814f2bcd();
			}
		}
	}
}

/*
	Name: function_b70cf4bf
	Namespace: namespace_bf2d4e77
	Checksum: 0x39290825
	Offset: 0xEE8
	Size: 0xE
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b70cf4bf(var_1ca047d8)
{
	return false;
}

/*
	Name: function_ef5cde9f
	Namespace: namespace_bf2d4e77
	Checksum: 0xF5B882CB
	Offset: 0xF00
	Size: 0x94
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ef5cde9f(str_weapon_name)
{
	if(!isdefined(str_weapon_name))
	{
		return false;
	}
	switch(str_weapon_name)
	{
		case "hash_5d6f444e983b62ca":
		case "hash_7a071b09cf16c52e":
		case "hash_7a071c09cf16c6e1":
		case "hash_7a071d09cf16c894":
		case "hash_7a071e09cf16ca47":
		case "hash_7a071f09cf16cbfa":
		{
			return true;
		}
	}
	return false;
}

/*
	Name: on_ai_killed
	Namespace: namespace_bf2d4e77
	Checksum: 0x28570864
	Offset: 0xFA0
	Size: 0x208
	Parameters: 1
	Flags: Linked
*/
function on_ai_killed(params)
{
	if(params.weapon.name === #"hash_7a071b09cf16c52e" && is_true(self.var_d0de7f41) && params.einflictor.weapon === params.weapon)
	{
		self clientfield::increment("" + #"hash_6a9eb737488c81c7", 1);
		a_enemies_nearby = getaiteamarray(level.zombie_team);
		a_enemies_nearby = arraysortclosest(a_enemies_nearby, self.origin, undefined, 0, 64);
		foreach(ai in a_enemies_nearby)
		{
			if(ai != self && ai function_3fc6f786())
			{
				ai.var_7fb7de87 = 1;
				ai.var_10552fac = 1;
				ai callback::callback(#"hash_69106b41ba3763f7");
				var_6254bcaf = self.maxhealth * 0.2;
				ai thread function_5276a443(#"hash_7a071b09cf16c52e", params.einflictor, var_6254bcaf, #"hash_775ba6ec890d5dd6");
			}
		}
	}
}

/*
	Name: function_464ccb73
	Namespace: namespace_bf2d4e77
	Checksum: 0xE73AEAA4
	Offset: 0x11B0
	Size: 0x56
	Parameters: 1
	Flags: Linked
*/
function function_464ccb73(watcher)
{
	watcher.watchforfire = 1;
	watcher.onspawn = &function_27f93038;
	watcher.onfizzleout = &function_c3726ef3;
	watcher.timeout = 0;
}

/*
	Name: function_2ca4337c
	Namespace: namespace_bf2d4e77
	Checksum: 0x32A1E8E9
	Offset: 0x1210
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_2ca4337c(params)
{
	if(function_ef5cde9f(params.weapon.name))
	{
		self thread zm_equipment::show_hint_text(#"hash_37605398dce96965", 1);
	}
}

/*
	Name: function_c355b189
	Namespace: namespace_bf2d4e77
	Checksum: 0xD9762120
	Offset: 0x1270
	Size: 0x322
	Parameters: 3
	Flags: Linked
*/
function function_c355b189(origin, angles, player)
{
	var_874a73c4 = (isdefined(player.inventory.items[12].count) ? player.inventory.items[12].count : 0);
	if(var_874a73c4 <= 0)
	{
		return false;
	}
	if(isarray(level.var_c23218c7))
	{
		arrayremovevalue(level.var_c23218c7, undefined);
		foreach(var_f968837d in level.var_c23218c7)
		{
			if(!isdefined(var_f968837d.trigger))
			{
				continue;
			}
			if(istouching(angles, var_f968837d.trigger) || distance(angles, var_f968837d.trigger.origin) <= 92)
			{
				return false;
			}
		}
	}
	if(zm_utility::is_survival())
	{
		if(level.var_7d45d0d4.var_3385b421.content_script_name === "holdout" && isdefined(level.var_e6689780) || is_true(player.var_41c16555))
		{
			if(!ispointonnavmesh(angles, 8))
			{
				return false;
			}
		}
		else if(!ispointonnavmesh(angles, 8) || (is_true(getgametypesetting(#"hash_59854c1f30538261")) && !namespace_d0ab5955::function_3824d2dc(angles)))
		{
			return false;
		}
	}
	else if(!zm_utility::function_c200446c())
	{
		if(!zm_utility::check_point_in_playable_area(angles) || !zm_utility::check_point_in_enabled_zone(angles, 1) || !ispointonnavmesh(angles, 15))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: function_c66c2af4
	Namespace: namespace_bf2d4e77
	Checksum: 0xAF4AA675
	Offset: 0x15A0
	Size: 0x10E
	Parameters: 1
	Flags: Linked
*/
function function_c66c2af4(player)
{
	var_bc4bc76d = getweapon(#"hash_5d6f444e983b62ca");
	var_40da166f = player function_287dcf4b(75, int(115), 0, 0, var_bc4bc76d);
	if(!var_40da166f.isvalid)
	{
		var_40da166f = player function_242060b9(var_bc4bc76d);
		if(!var_40da166f.isvalid)
		{
			player function_bf191832(0, (0, 0, 0), (0, 0, 0));
			return var_40da166f;
		}
	}
	var_40da166f.origin = (isdefined(var_40da166f.var_83050ca1) ? var_40da166f.var_83050ca1 : var_40da166f.origin);
	player.var_8b10aad1 = var_40da166f;
	return var_40da166f;
}

/*
	Name: function_27f93038
	Namespace: namespace_bf2d4e77
	Checksum: 0x7D00C200
	Offset: 0x16B8
	Size: 0x3AC
	Parameters: 2
	Flags: Linked
*/
function function_27f93038(watcher, owner)
{
	self endon(#"death");
	player = owner;
	v_origin = (isdefined(player.var_8b10aad1.origin) ? player.var_8b10aad1.origin : player.var_b8878ba9);
	v_angles = (isdefined(player.var_8b10aad1.angles) ? player.var_8b10aad1.angles : player.var_ddc03e10);
	if(!(isdefined(v_origin) && isdefined(v_angles)))
	{
		return;
	}
	self.var_deb3e8b1 = util::spawn_anim_model(watcher.weapon.var_22082a57, v_origin, v_angles);
	self.origin = v_origin;
	self.angles = v_angles;
	if(!isdefined(player.var_c23218c7))
	{
		player.var_c23218c7 = [];
	}
	else if(!isarray(player.var_c23218c7))
	{
		player.var_c23218c7 = array(player.var_c23218c7);
	}
	if(!isinarray(player.var_c23218c7, self))
	{
		player.var_c23218c7[player.var_c23218c7.size] = self;
	}
	if(!isdefined(level.var_c23218c7))
	{
		level.var_c23218c7 = [];
	}
	else if(!isarray(level.var_c23218c7))
	{
		level.var_c23218c7 = array(level.var_c23218c7);
	}
	if(!isinarray(level.var_c23218c7, self))
	{
		level.var_c23218c7[level.var_c23218c7.size] = self;
	}
	arrayremovevalue(player.var_c23218c7, undefined);
	arrayremovevalue(level.var_c23218c7, undefined);
	if(player.var_c23218c7.size > 3)
	{
		player.var_c23218c7[0] thread function_c3726ef3();
	}
	self.var_deb3e8b1 thread function_814f2bcd();
	self.trigger = spawn("trigger_box", v_origin + vectorscale((0, 0, 1), 20), (512 | 16) | 8192, 40, 115, 30);
	self.trigger.angles = v_angles;
	self.trigger.var_f968837d = self;
	self.trigger.var_deb3e8b1 = self.var_deb3e8b1;
	self.health = 1000;
	self.trigger callback::function_35a12f19(&function_ae618f2b);
	/#
		self thread function_56133646();
	#/
}

/*
	Name: function_56133646
	Namespace: namespace_bf2d4e77
	Checksum: 0xAAF527BE
	Offset: 0x1A70
	Size: 0x146
	Parameters: 0
	Flags: None
*/
function function_56133646()
{
	/#
		self endon(#"death");
		self.var_deb3e8b1 endon(#"death");
		while(true)
		{
			if(getdvarint(#"hash_3ce5890428b398f1", 0))
			{
				if(isdefined(self.trigger))
				{
					v_min = self.trigger getmins();
					v_max = self.trigger getmaxs();
					box(self.trigger.origin, v_min, v_max, self.trigger.angles, (0, 1, 0), undefined, undefined, 1);
					print3d(self.trigger.origin + vectorscale((0, 0, 1), 40), "" + self.health, (0, 1, 0), undefined, 0.4, 1);
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_814f2bcd
	Namespace: namespace_bf2d4e77
	Checksum: 0xEEDF019C
	Offset: 0x1BC0
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function function_814f2bcd()
{
	self endon(#"death");
	self scene::play(#"hash_1615dbaedd481e87", "expand", self);
	self thread scene::play(#"hash_1615dbaedd481e87", "idle_wide", self);
}

/*
	Name: function_ae618f2b
	Namespace: namespace_bf2d4e77
	Checksum: 0x12111F71
	Offset: 0x1C38
	Size: 0x194
	Parameters: 1
	Flags: Linked
*/
function function_ae618f2b(params)
{
	ai = params.activator;
	if(isdefined(self.var_f968837d) && ai function_3fc6f786())
	{
		ai.var_d0de7f41 = 1;
		ai.var_10552fac = 1;
		ai callback::callback(#"hash_69106b41ba3763f7");
		if(ai.var_6f84b820 === #"special" || ai.var_6f84b820 === #"elite")
		{
			var_86890135 = self.var_f968837d.weapon.name + "_special_elite";
		}
		else
		{
			var_86890135 = self.var_f968837d.weapon.name;
		}
		ai thread function_5276a443(self.var_f968837d.weapon.name, self.var_f968837d, undefined, var_86890135);
	}
	else if(!isdefined(self.var_f968837d))
	{
		if(isdefined(self.var_deb3e8b1))
		{
			self.var_deb3e8b1 delete();
		}
		self deletedelay();
	}
}

/*
	Name: function_3fc6f786
	Namespace: namespace_bf2d4e77
	Checksum: 0x3103EAE4
	Offset: 0x1DD8
	Size: 0x150
	Parameters: 0
	Flags: Linked
*/
function function_3fc6f786()
{
	if(isactor(self) && isalive(self) && self.team === level.zombie_team && (self.var_6f84b820 === #"normal" || self.var_6f84b820 === #"special" || self.var_6f84b820 === #"elite" || self.archetype === #"zombie_dog") && !is_true(self.var_d0de7f41) && !is_true(self.var_7fb7de87) && !is_true(self.var_8576e0be))
	{
		if(!isdefined(self.var_207045e5) || gettime() >= (self.var_207045e5 + 1000))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_9ed9a337
	Namespace: namespace_bf2d4e77
	Checksum: 0xEC23655C
	Offset: 0x1F30
	Size: 0x96
	Parameters: 0
	Flags: Linked
*/
function function_9ed9a337()
{
	if(is_true(self.var_d0de7f41))
	{
		self.var_d0de7f41 = undefined;
	}
	if(is_true(self.var_7fb7de87))
	{
		self.var_7fb7de87 = undefined;
	}
	self.var_9258f88f = undefined;
	self.var_19ec2cc3 = undefined;
	self.var_10552fac = undefined;
	self clientfield::set("" + #"hash_13a6ddf6358f814", 0);
	self.var_207045e5 = gettime();
}

/*
	Name: function_5276a443
	Namespace: namespace_bf2d4e77
	Checksum: 0x30C301E
	Offset: 0x1FD0
	Size: 0x5CC
	Parameters: 4
	Flags: Linked
*/
function function_5276a443(var_9055f9a9, var_f968837d, var_6254bcaf, var_86890135)
{
	self notify("22eefdd2ca353d24");
	self endon("22eefdd2ca353d24");
	if(!isdefined(var_9055f9a9) || !isalive(self))
	{
		return;
	}
	switch(var_9055f9a9)
	{
		case "hash_5d6f444e983b62ca":
		{
			var_da4a3267 = self.maxhealth * 0.2;
			var_34e3b3f7 = self.maxhealth * 0.025;
			var_4471a107 = 50;
			break;
		}
		case "hash_7a071f09cf16cbfa":
		{
			var_da4a3267 = self.maxhealth * 0.2;
			var_34e3b3f7 = self.maxhealth * 0.025;
			var_4471a107 = 25;
			break;
		}
		case "hash_7a071e09cf16ca47":
		{
			var_da4a3267 = self.maxhealth * 0.2;
			var_34e3b3f7 = self.maxhealth * 0.025;
			var_4471a107 = 25;
			break;
		}
		case "hash_7a071b09cf16c52e":
		case "hash_7a071c09cf16c6e1":
		case "hash_7a071d09cf16c894":
		{
			var_da4a3267 = self.maxhealth * 0.4;
			var_34e3b3f7 = self.maxhealth * 0.05;
			var_4471a107 = 25;
			break;
		}
		default:
		{
			return;
		}
	}
	var_6b140fb2 = 1;
	self.var_9258f88f = var_f968837d.owner;
	weapon = var_f968837d.weapon;
	self clientfield::set("" + #"hash_13a6ddf6358f814", 1);
	if(isdefined(var_86890135))
	{
		self thread namespace_9ff9f642::slowdown(var_86890135, undefined, &function_9ed9a337);
		if(self.var_6f84b820 === #"special" || self.var_6f84b820 === #"elite")
		{
			self.var_19ec2cc3 = 0.7;
		}
		else
		{
			self.var_19ec2cc3 = 0.6;
		}
	}
	if(!isdefined(level.var_cef2e607[#"hash_3e529c287efbdbff"]))
	{
		level.var_cef2e607[#"hash_3e529c287efbdbff"] = -1;
	}
	level.var_cef2e607[#"hash_3e529c287efbdbff"]++;
	wait((float(function_60d95f53()) / 1000) * ((level.var_cef2e607[#"hash_3e529c287efbdbff"] % (int((float(function_60d95f53()) / 1000) / (float(function_60d95f53()) / 1000)))) + 1));
	while(isalive(self) && (is_true(self.var_d0de7f41) || is_true(self.var_7fb7de87)) && !is_true(self.var_8576e0be))
	{
		if(isdefined(var_6254bcaf))
		{
			var_70ab6bc = var_6254bcaf;
			var_6254bcaf = undefined;
		}
		else
		{
			if(self.var_6f84b820 === #"elite" || self.var_6f84b820 === #"special")
			{
				var_70ab6bc = var_34e3b3f7;
			}
			else
			{
				var_70ab6bc = var_da4a3267;
			}
		}
		var_36635dd8 = (isdefined(var_f968837d.origin) ? var_f968837d.origin : self.origin + vectorscale((0, 0, 1), 48));
		self namespace_42457a0::function_601fabe9(#"hash_16b5c37d8feae38c", var_70ab6bc, var_36635dd8, self.var_9258f88f, var_f968837d, "none", "MOD_GAS", 0, weapon);
		self playsound(#"hash_25822a2d894aaa12");
		if(isdefined(var_f968837d))
		{
			var_f968837d.health = var_f968837d.health - var_4471a107;
			if(var_f968837d.health <= 0)
			{
				var_f968837d thread function_c3726ef3();
			}
		}
		wait(var_6b140fb2);
	}
	if(is_true(self.var_8576e0be))
	{
		self namespace_9ff9f642::function_520f4da5(var_86890135);
	}
}

/*
	Name: function_c3726ef3
	Namespace: namespace_bf2d4e77
	Checksum: 0xFD04C252
	Offset: 0x25A8
	Size: 0x11C
	Parameters: 0
	Flags: Linked
*/
function function_c3726ef3()
{
	if(!isdefined(self))
	{
		return;
	}
	if(isdefined(self.trigger))
	{
		self.trigger deletedelay();
	}
	if(isdefined(self.var_deb3e8b1) && !is_true(self.var_deb3e8b1.var_b5573fde))
	{
		self.var_deb3e8b1.var_b5573fde = 1;
		self.var_deb3e8b1 scene::play(#"hash_1615dbaedd481e87", "collapse", self.var_deb3e8b1);
	}
	if(isdefined(self))
	{
		deployable::function_81598103(self);
		if(isdefined(self.var_deb3e8b1))
		{
			self.var_deb3e8b1 delete();
		}
		if(isdefined(self))
		{
			self delete();
		}
	}
}

/*
	Name: function_d763fd41
	Namespace: namespace_bf2d4e77
	Checksum: 0xEDCDB4F5
	Offset: 0x26D0
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_d763fd41(params)
{
	self namespace_1b527536::function_460882e2(1);
}

