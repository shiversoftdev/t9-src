#using script_1cc417743d7c262d;
#using script_4721de209091b1a6;
#using script_47fb62300ac0bd60;
#using script_545a0bac37bda541;
#using script_79a7e1c31a3e8cc;
#using script_8988fdbc78d6c53;
#using scripts\core_common\battlechatter.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_cd56c326;

/*
	Name: function_2fe3205d
	Namespace: namespace_cd56c326
	Checksum: 0x36547D7C
	Offset: 0x260
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2fe3205d()
{
	level notify(1265163401);
}

#namespace jammer;

/*
	Name: function_89f2df9
	Namespace: jammer
	Checksum: 0xFB2C5250
	Offset: 0x280
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"gadget_jammer", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: jammer
	Checksum: 0x4CA42C4D
	Offset: 0x2C8
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
}

/*
	Name: init_shared
	Namespace: jammer
	Checksum: 0xD71331D8
	Offset: 0x2E8
	Size: 0x264
	Parameters: 0
	Flags: Linked
*/
function init_shared()
{
	if(!isdefined(level.var_578f7c6d))
	{
		level.var_578f7c6d = spawnstruct();
	}
	if(!isdefined(level.var_578f7c6d.var_1728e736))
	{
		level.var_578f7c6d.var_1728e736 = [];
	}
	if(!isdefined(level.var_578f7c6d.var_240161c3))
	{
		level.var_578f7c6d.var_240161c3 = [];
	}
	level.var_578f7c6d.weapon = getweapon(#"gadget_jammer");
	registerclientfields();
	if(!isdefined(level.var_578f7c6d.weapon) || level.var_578f7c6d.weapon == getweapon(#"none"))
	{
		return;
	}
	level.var_578f7c6d.var_4dd46f8a = getscriptbundle(level.var_578f7c6d.weapon.var_4dd46f8a);
	weaponobjects::function_e6400478(#"gadget_jammer", &function_1a50ce7b, 1);
	level.var_578f7c6d.radiussqr = sqr(level.var_578f7c6d.weapon.explosionradius);
	level.var_578f7c6d.var_18b294e4 = int(level.var_578f7c6d.var_4dd46f8a.var_647be42c * 1000);
	level.var_578f7c6d.var_b164e007 = [];
	level.var_578f7c6d.var_14cb9b30 = [];
	level.var_578f7c6d.hiddenplayers = [];
	setupcallbacks();
	deployable::function_2e088f73(level.var_578f7c6d.weapon);
}

/*
	Name: setupcallbacks
	Namespace: jammer
	Checksum: 0x3120102B
	Offset: 0x558
	Size: 0x14C
	Parameters: 0
	Flags: Linked
*/
function setupcallbacks()
{
	level.var_a5dacbea = &function_4e7e56a8;
	level.var_f9109dc6 = &function_32c879d;
	level.var_7b151daa = &function_7b151daa;
	level.var_86e3d17a = &function_86e3d17a;
	level.var_48c30195 = &function_48c30195;
	callback::on_spawned(&onplayerspawned);
	callback::on_finalize_initialization(&function_1c601b99);
	callback::add_callback(#"hash_7c6da2f2c9ef947a", &function_f87d8ea0);
	globallogic_score::function_5a241bd8(level.var_578f7c6d.weapon, &function_767ffeec);
	globallogic_score::function_c1e9b86b(level.var_578f7c6d.weapon, &function_3d6d7536);
}

/*
	Name: registerclientfields
	Namespace: jammer
	Checksum: 0x68264293
	Offset: 0x6B0
	Size: 0x184
	Parameters: 0
	Flags: Linked, Private
*/
function private registerclientfields()
{
	clientfield::register("scriptmover", "isJammed", 1, 1, "int");
	clientfield::register("missile", "isJammed", 1, 1, "int");
	clientfield::register("vehicle", "isJammed", 1, 1, "int");
	clientfield::register("toplayer", "isJammed", 1, 1, "int");
	clientfield::register("allplayers", "isHiddenByFriendlyJammer", 1, 1, "int");
	clientfield::register("missile", "jammer_active", 1, 1, "int");
	clientfield::register("missile", "jammer_hacked", 1, 1, "counter");
	clientfield::register("toplayer", "jammedvehpostfx", 1, 1, "int");
}

/*
	Name: function_1a50ce7b
	Namespace: jammer
	Checksum: 0x717E908C
	Offset: 0x840
	Size: 0xBA
	Parameters: 1
	Flags: Linked, Private
*/
function private function_1a50ce7b(watcher)
{
	watcher.ownergetsassist = 1;
	watcher.ignoredirection = 1;
	watcher.enemydestroy = 1;
	watcher.onspawn = &function_7d81a4ff;
	watcher.ondestroyed = &function_a4d07061;
	watcher.ontimeout = &function_b2e496fa;
	watcher.ondetonatecallback = &function_51a743f8;
	watcher.var_994b472b = &function_994b472b;
	watcher.var_10efd558 = "switched_field_upgrade";
}

/*
	Name: function_1c601b99
	Namespace: jammer
	Checksum: 0x77A9E68F
	Offset: 0x908
	Size: 0x50
	Parameters: 0
	Flags: Linked
*/
function function_1c601b99()
{
	if(isdefined(level.var_1b900c1d))
	{
		[[level.var_1b900c1d]](getweapon(#"gadget_jammer"), &function_bff5c062);
	}
}

/*
	Name: function_bff5c062
	Namespace: jammer
	Checksum: 0xF38CCBBD
	Offset: 0x960
	Size: 0x18C
	Parameters: 2
	Flags: Linked
*/
function function_bff5c062(var_d148081d, var_dbd1a594)
{
	var_f3ab6571 = var_d148081d.owner weaponobjects::function_8481fc06(var_d148081d.weapon) > 1;
	var_d148081d.owner thread globallogic_audio::function_a2cde53d(var_d148081d.weapon, var_f3ab6571);
	var_d148081d.team = var_dbd1a594.team;
	var_d148081d setteam(var_dbd1a594.team);
	var_d148081d.owner = var_dbd1a594;
	var_d148081d setowner(var_dbd1a594);
	if(isdefined(var_d148081d) && isdefined(level.var_f1edf93f))
	{
		_station_up_to_detention_center_triggers = [[level.var_f1edf93f]]();
		if((isdefined(_station_up_to_detention_center_triggers) ? _station_up_to_detention_center_triggers : 0))
		{
			var_d148081d notify(#"hash_602ae7ca650d6287");
			var_d148081d thread weaponobjects::weapon_object_timeout(var_d148081d.var_2d045452, _station_up_to_detention_center_triggers);
		}
	}
	var_d148081d thread weaponobjects::function_6d8aa6a0(var_dbd1a594, var_d148081d.var_2d045452);
	var_d148081d clientfield::increment("jammer_hacked");
}

/*
	Name: codecallback_entitydeleted
	Namespace: jammer
	Checksum: 0x7A978A00
	Offset: 0xAF8
	Size: 0xEC
	Parameters: 1
	Flags: Event
*/
event codecallback_entitydeleted(entity)
{
	entitynumber = self getentitynumber();
	if(isdefined(level.var_578f7c6d.var_14cb9b30[entitynumber]))
	{
		level.var_578f7c6d.var_14cb9b30[entitynumber] = undefined;
		arrayremovevalue(level.var_578f7c6d.var_14cb9b30, undefined, 1);
	}
	if(isdefined(level.var_578f7c6d.var_b164e007[entitynumber]))
	{
		level.var_578f7c6d.var_b164e007[entitynumber] = undefined;
		arrayremovevalue(level.var_578f7c6d.var_b164e007, undefined, 1);
	}
}

/*
	Name: function_48c30195
	Namespace: jammer
	Checksum: 0x144D7BAC
	Offset: 0xBF0
	Size: 0x2A
	Parameters: 2
	Flags: Linked
*/
function function_48c30195(entity, var_ec9c756e)
{
	if(isdefined(entity))
	{
		entity.var_24d0abd1 = var_ec9c756e;
	}
}

/*
	Name: function_86e3d17a
	Namespace: jammer
	Checksum: 0xA3D4E9B2
	Offset: 0xC28
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_86e3d17a()
{
	return true;
}

/*
	Name: register
	Namespace: jammer
	Checksum: 0xB8FA8A60
	Offset: 0xC68
	Size: 0x22
	Parameters: 2
	Flags: None
*/
function register(entity, var_448f97f2)
{
	entity.var_123aec6c = var_448f97f2;
}

/*
	Name: function_4e7e56a8
	Namespace: jammer
	Checksum: 0xEEE0A82B
	Offset: 0xC98
	Size: 0x30
	Parameters: 2
	Flags: Linked
*/
function function_4e7e56a8(weapon, callbackfunction)
{
	level.var_578f7c6d.var_1728e736[weapon.name] = callbackfunction;
}

/*
	Name: function_32c879d
	Namespace: jammer
	Checksum: 0xC1E7D98A
	Offset: 0xCD0
	Size: 0x30
	Parameters: 2
	Flags: Linked
*/
function function_32c879d(weapon, callbackfunction)
{
	level.var_578f7c6d.var_240161c3[weapon.name] = callbackfunction;
}

/*
	Name: onplayerspawned
	Namespace: jammer
	Checksum: 0x2F2DEA6E
	Offset: 0xD08
	Size: 0xE
	Parameters: 0
	Flags: Linked
*/
function onplayerspawned()
{
	self.isjammed = 0;
}

/*
	Name: function_7d81a4ff
	Namespace: jammer
	Checksum: 0xB0EE6593
	Offset: 0xD20
	Size: 0x19C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_7d81a4ff(watcher, player)
{
	if(!isdefined(self.var_88d76fba))
	{
		self.var_88d76fba = [];
	}
	self.owner = player;
	self.weapon = level.var_578f7c6d.weapon;
	self setweapon(level.var_578f7c6d.weapon);
	self setteam(player getteam());
	self.team = player getteam();
	self function_619a5c20();
	self.delete_on_death = 1;
	self.var_48d842c3 = 1;
	self clientfield::set("enemyequip", 1);
	self clientfield::set("jammer_active", 1);
	player battlechatter::function_fc82b10(self.weapon, self.origin, self);
	entnum = self getentitynumber();
	level.var_578f7c6d.var_b164e007[entnum] = self;
	function_a1924bff();
}

/*
	Name: function_a1924bff
	Namespace: jammer
	Checksum: 0xA7FED6A9
	Offset: 0xEC8
	Size: 0x3C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_a1924bff()
{
	if(is_true(level.var_578f7c6d.var_d355e20c))
	{
		return;
	}
	thread function_3500dad3();
}

/*
	Name: function_9da52774
	Namespace: jammer
	Checksum: 0x4D402E54
	Offset: 0xF10
	Size: 0x4E8
	Parameters: 0
	Flags: Linked
*/
function function_9da52774()
{
	var_c5f942f1 = getarraykeys(level.var_578f7c6d.var_14cb9b30);
	foreach(key in var_c5f942f1)
	{
		level.var_578f7c6d.var_14cb9b30[key] = 0;
	}
	var_5306fc83 = getarraykeys(level.var_578f7c6d.hiddenplayers);
	foreach(key in var_5306fc83)
	{
		level.var_578f7c6d.hiddenplayers[key] = 0;
	}
	foreach(jammer in level.var_578f7c6d.var_b164e007)
	{
		if(!isdefined(jammer))
		{
			continue;
		}
		entities = getentitiesinradius(jammer.origin, level.var_578f7c6d.weapon.explosionradius);
		foreach(entity in entities)
		{
			distsqr = distance2dsquared(entity.origin, jammer.origin);
			if(distsqr <= level.var_578f7c6d.radiussqr)
			{
				if(function_b16c8865(entity, jammer.owner))
				{
					entitynumber = entity getentitynumber();
					if(!isdefined(level.var_578f7c6d.var_14cb9b30[entitynumber]))
					{
						level.var_578f7c6d.var_14cb9b30[entitynumber] = 0;
					}
					level.var_578f7c6d.var_14cb9b30[entitynumber]++;
					if(is_true(entity.var_515d6dda))
					{
						if(!isdefined(entity.var_fe1ebada))
						{
							entity.var_fe1ebada = [];
						}
						arrayremovevalue(entity.var_fe1ebada, undefined, 1);
						var_7d1eed4a = jammer getentitynumber();
						if(!isdefined(entity.var_fe1ebada[var_7d1eed4a]))
						{
							entity.var_fe1ebada[var_7d1eed4a] = jammer;
							scoreevents::processscoreevent(#"hash_d3eebe3a5ddc62e", jammer.owner);
							jammer.owner contracts::function_a54e2068(#"hash_7fb6b958e3fcbbc1");
						}
					}
					continue;
				}
				if(function_2fdf3111(entity, jammer.owner))
				{
					entitynumber = entity getentitynumber();
					if(!isdefined(level.var_578f7c6d.hiddenplayers[entitynumber]))
					{
						level.var_578f7c6d.hiddenplayers[entitynumber] = 0;
					}
					level.var_578f7c6d.hiddenplayers[entitynumber]++;
				}
			}
		}
	}
}

/*
	Name: function_322a8fc6
	Namespace: jammer
	Checksum: 0xE08E0328
	Offset: 0x1400
	Size: 0x114
	Parameters: 1
	Flags: Linked
*/
function function_322a8fc6(entity)
{
	if(isplayer(entity))
	{
		return;
	}
	if(!isdefined(entity.var_77807b8a))
	{
		return;
	}
	if(is_true(entity.weapon.istimeddetonation) && !is_true(entity.var_cb19e5d4))
	{
		entity resetmissiledetonationtime(500);
	}
	var_8429cbbb = entity.var_77807b8a + level.var_578f7c6d.var_18b294e4;
	if(gettime() > var_8429cbbb)
	{
		entity dodamage(1000, entity.origin, undefined, undefined, undefined, "MOD_GRENADE_SPLASH", 0, level.var_578f7c6d.weapon);
	}
}

/*
	Name: function_af165064
	Namespace: jammer
	Checksum: 0x5A3D04BF
	Offset: 0x1520
	Size: 0x33C
	Parameters: 0
	Flags: Linked
*/
function function_af165064()
{
	var_c5f942f1 = getarraykeys(level.var_578f7c6d.var_14cb9b30);
	foreach(key in var_c5f942f1)
	{
		entity = getentbynum(key);
		if(!isdefined(entity))
		{
			continue;
		}
		if(level.var_578f7c6d.var_14cb9b30[key] > 0 && !is_true(entity.isjammed))
		{
			function_93491e83(entity);
			continue;
		}
		if(level.var_578f7c6d.var_14cb9b30[key] > 0 && is_true(entity.isjammed))
		{
			function_322a8fc6(entity);
			continue;
		}
		if(level.var_578f7c6d.var_14cb9b30[key] == 0 && is_true(entity.isjammed))
		{
			function_d88f3e48(entity);
			level.var_578f7c6d.var_14cb9b30[key] = undefined;
		}
	}
	arrayremovevalue(level.var_578f7c6d.var_14cb9b30, undefined, 1);
	var_5306fc83 = getarraykeys(level.var_578f7c6d.hiddenplayers);
	foreach(key in var_5306fc83)
	{
		entity = getentbynum(key);
		if(!isdefined(entity))
		{
			continue;
		}
		var_f7bd3349 = level.var_578f7c6d.hiddenplayers[key];
		entity clientfield::set("isHiddenByFriendlyJammer", (var_f7bd3349 > 0 ? 1 : 0));
	}
	arrayremovevalue(level.var_578f7c6d.hiddenplayers, undefined, 1);
}

/*
	Name: function_3500dad3
	Namespace: jammer
	Checksum: 0x719464DE
	Offset: 0x1868
	Size: 0x1B2
	Parameters: 0
	Flags: Linked, Private
*/
function private function_3500dad3()
{
	self notify("4f7290deb54b1cea");
	self endon("4f7290deb54b1cea");
	level.var_578f7c6d.var_d355e20c = 1;
	while(true)
	{
		function_9da52774();
		waitframe(1);
		function_af165064();
		if(level.var_578f7c6d.var_b164e007.size == 0)
		{
			break;
		}
		waitframe(1);
	}
	var_9a7622f = getarraykeys(level.var_578f7c6d.var_14cb9b30);
	foreach(n_key in var_9a7622f)
	{
		entity = getentbynum(n_key);
		function_d88f3e48(entity);
		level.var_578f7c6d.var_14cb9b30[n_key] = undefined;
	}
	function_af165064();
	level.var_578f7c6d.var_d355e20c = 0;
}

/*
	Name: function_93491e83
	Namespace: jammer
	Checksum: 0xAE60CD42
	Offset: 0x1A28
	Size: 0x228
	Parameters: 1
	Flags: Linked, Private
*/
function private function_93491e83(entity)
{
	if(!isdefined(entity))
	{
		return false;
	}
	if(entity.var_1527fe94 === 1)
	{
		return false;
	}
	if(isalive(entity) && isactor(entity))
	{
		entity callback::callback(#"hash_7140c3848cbefaa1");
	}
	if(isplayer(entity))
	{
		entity clientfield::set_to_player("isJammed", 1);
		entity setempjammed(1);
	}
	else
	{
		if(isvehicle(entity))
		{
			entity function_803e9bf3(2);
		}
		else if(isdefined(entity.weapon) && is_true(entity.weapon.istimeddetonation) && !is_true(entity.var_cb19e5d4))
		{
			entity resetmissiledetonationtime(500);
		}
	}
	weapon = (isdefined(entity.identifier_weapon) ? entity.identifier_weapon : entity.weapon);
	if(isdefined(weapon) && isdefined(level.var_578f7c6d.var_1728e736[weapon.name]))
	{
		thread [[level.var_578f7c6d.var_1728e736[weapon.name]]](entity);
	}
	function_1c430dad(entity, 1);
	return true;
}

/*
	Name: function_4a82368f
	Namespace: jammer
	Checksum: 0x2082C711
	Offset: 0x1C58
	Size: 0xDC
	Parameters: 2
	Flags: None
*/
function function_4a82368f(entity, owner)
{
	/#
		assert(isdefined(owner));
	#/
	if(isplayer(owner))
	{
		owner clientfield::set_to_player("jammedvehpostfx", 1);
	}
	entity waittill(#"death", #"remote_weapon_end", #"hash_2476803a0d5fa572");
	if(!isdefined(owner))
	{
		return;
	}
	if(isplayer(owner))
	{
		owner clientfield::set_to_player("jammedvehpostfx", 0);
	}
}

/*
	Name: function_1c430dad
	Namespace: jammer
	Checksum: 0xDFA0D83E
	Offset: 0x1D40
	Size: 0xC2
	Parameters: 2
	Flags: Linked
*/
function function_1c430dad(entity, isjammed)
{
	if(!isplayer(entity) && !isactor(entity) && entity clientfield::is_registered("isJammed"))
	{
		entity clientfield::set("isJammed", isjammed);
	}
	entity.isjammed = isjammed;
	entity.emped = isjammed;
	if(isjammed)
	{
		entity.var_77807b8a = gettime();
	}
	else
	{
		entity.var_77807b8a = undefined;
	}
}

/*
	Name: function_d88f3e48
	Namespace: jammer
	Checksum: 0xE0A95413
	Offset: 0x1E10
	Size: 0x224
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d88f3e48(entity)
{
	if(!isdefined(entity))
	{
		return;
	}
	if(!is_true(entity.isjammed))
	{
		return;
	}
	if(isplayer(entity))
	{
		entity clientfield::set_to_player("isJammed", 0);
		entity setempjammed(0);
	}
	else
	{
		if(isvehicle(entity))
		{
			entity function_803e9bf3(1);
		}
		else if(isdefined(entity.weapon) && is_true(entity.weapon.istimeddetonation) && !is_true(entity.var_cb19e5d4))
		{
			entity resetmissiledetonationtime();
		}
	}
	weapon = (isdefined(entity.identifier_weapon) ? entity.identifier_weapon : entity.weapon);
	if(isdefined(weapon) && isdefined(level.var_578f7c6d.var_240161c3[weapon.name]))
	{
		thread [[level.var_578f7c6d.var_240161c3[weapon.name]]](entity);
	}
	function_1c430dad(entity, 0);
	if(isdefined(entity.weapon) && !isplayer(entity) && isdefined(entity.owner))
	{
		function_2eb0a933(entity.weapon, entity.owner);
	}
}

/*
	Name: function_6a973411
	Namespace: jammer
	Checksum: 0xFEA2E37E
	Offset: 0x2040
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function function_6a973411()
{
	util::wait_network_frame();
	self clientfield::set("jammer_active", 0);
	util::wait_network_frame();
	self clientfield::set("jammer_active", 1);
}

/*
	Name: function_cc908239
	Namespace: jammer
	Checksum: 0x3AA11AB0
	Offset: 0x20B0
	Size: 0x2A
	Parameters: 1
	Flags: None
*/
function function_cc908239(entity)
{
	if(isdefined(entity.owner))
	{
		return entity.owner;
	}
	return undefined;
}

/*
	Name: function_994b472b
	Namespace: jammer
	Checksum: 0x1A377DFE
	Offset: 0x20E8
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_994b472b(player)
{
	self weaponobjects::weaponobjectfizzleout();
}

/*
	Name: function_51a743f8
	Namespace: jammer
	Checksum: 0x3C7A3B81
	Offset: 0x2118
	Size: 0xDC
	Parameters: 3
	Flags: Linked
*/
function function_51a743f8(attacker, weapon, target)
{
	if(isplayer(attacker) && isdefined(self) && attacker !== self.owner)
	{
		scoreevents::processscoreevent(#"hash_69a2a40ed6e84e00", attacker);
		var_f3ab6571 = self.owner weaponobjects::function_8481fc06(self.weapon) > 1;
		self.owner thread globallogic_audio::function_6daffa93(self.weapon, var_f3ab6571);
	}
	weaponobjects::proximitydetonate(attacker, weapon, target);
}

/*
	Name: function_a4d07061
	Namespace: jammer
	Checksum: 0xB2D88F2B
	Offset: 0x2200
	Size: 0x6C
	Parameters: 2
	Flags: Linked
*/
function function_a4d07061(attacker, var_61dedb9f)
{
	playfx(level._equipment_explode_fx_lg, self.origin);
	self playsound(#"dst_trophy_smash");
	self function_51a743f8(var_61dedb9f);
}

/*
	Name: function_b2e496fa
	Namespace: jammer
	Checksum: 0xA91A350
	Offset: 0x2278
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_b2e496fa(watcher)
{
	self delete();
}

/*
	Name: function_2fdf3111
	Namespace: jammer
	Checksum: 0xC75B1B87
	Offset: 0x22A8
	Size: 0x82
	Parameters: 2
	Flags: Linked, Private
*/
function private function_2fdf3111(entity, var_dbd1a594)
{
	if(self == entity)
	{
		return false;
	}
	if(isplayer(entity) && isdefined(entity.team) && !util::function_fbce7263(entity.team, var_dbd1a594.team))
	{
		return true;
	}
	return false;
}

/*
	Name: function_b16c8865
	Namespace: jammer
	Checksum: 0x4B9E08D3
	Offset: 0x2338
	Size: 0x226
	Parameters: 2
	Flags: Linked, Private
*/
function private function_b16c8865(entity, var_dbd1a594)
{
	if(self == entity)
	{
		return false;
	}
	if(!isplayer(entity) && (!isdefined(entity.model) || entity.model == #""))
	{
		return false;
	}
	if(entity.classname === "weapon_")
	{
		return false;
	}
	if(isactor(entity) && !is_true(entity.var_8f61d7f4))
	{
		return false;
	}
	if(isdefined(entity.team) && !util::function_fbce7263(entity.team, var_dbd1a594.team))
	{
		return false;
	}
	if(isplayer(entity))
	{
		if(entity hasperk(#"hash_f20e206dc87e35"))
		{
			return false;
		}
	}
	if((isdefined(entity.var_24d0abd1) ? entity.var_24d0abd1 : 0))
	{
		return false;
	}
	if(!isplayer(entity))
	{
		weapon = (isdefined(entity.identifier_weapon) ? entity.identifier_weapon : entity.weapon);
		if(!isdefined(weapon))
		{
			return false;
		}
		if(!is_true(weapon.var_8f61d7f4))
		{
			return false;
		}
		if(!entity clientfield::is_registered("isJammed"))
		{
			return false;
		}
	}
	if(is_true(entity.var_4f0c8e9d))
	{
		return false;
	}
	return true;
}

/*
	Name: function_7b151daa
	Namespace: jammer
	Checksum: 0x524583C1
	Offset: 0x2568
	Size: 0x28
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7b151daa(player)
{
	return isdefined(player.isjammed) && player.isjammed;
}

/*
	Name: function_2e6238c0
	Namespace: jammer
	Checksum: 0x7845F3C6
	Offset: 0x2598
	Size: 0x194
	Parameters: 2
	Flags: None
*/
function function_2e6238c0(weapon, owner)
{
	if(!isdefined(weapon) || !isdefined(owner))
	{
		return;
	}
	var_60d3002f = undefined;
	leaderdialog = undefined;
	switch(weapon.name)
	{
		case "tank_robot":
		case "inventory_tank_robot":
		case "ai_tank_marker":
		{
			var_60d3002f = "aiTankJammedStart";
			leaderdialog = "aiTankJammedStart";
			break;
		}
		case "ultimate_turret":
		case "inventory_ultimate_turret":
		{
			var_60d3002f = "ultTurretJammedStart";
			leaderdialog = "ultTurretJammedStart";
			break;
		}
		case "ability_smart_cover":
		case "hash_1fb0b26684caee0f":
		{
			var_60d3002f = "smartCoverJammedStart";
			break;
		}
	}
	if(isdefined(leaderdialog) && isdefined(owner))
	{
		if(isdefined(level.var_57e2bc08))
		{
			if(level.teambased)
			{
				thread [[level.var_57e2bc08]](leaderdialog, owner.team, owner);
			}
		}
	}
	if(isdefined(var_60d3002f) && isdefined(owner))
	{
		owner thread namespace_f9b02f80::play_taacom_dialog(var_60d3002f);
	}
}

/*
	Name: function_2eb0a933
	Namespace: jammer
	Checksum: 0xD57DFA62
	Offset: 0x2738
	Size: 0x194
	Parameters: 2
	Flags: Linked
*/
function function_2eb0a933(weapon, owner)
{
	if(!isdefined(weapon) || !isdefined(owner))
	{
		return;
	}
	var_60d3002f = undefined;
	leaderdialog = undefined;
	switch(weapon.name)
	{
		case "tank_robot":
		case "inventory_tank_robot":
		case "ai_tank_marker":
		{
			var_60d3002f = "aiTankJammedEnd";
			leaderdialog = "aiTankJammedEnd";
			break;
		}
		case "ultimate_turret":
		case "inventory_ultimate_turret":
		{
			var_60d3002f = "ultTurretJammedEnd";
			leaderdialog = "ultTurretJammedEnd";
			break;
		}
		case "ability_smart_cover":
		case "hash_1fb0b26684caee0f":
		{
			var_60d3002f = "smartCoverJammedEnd";
			break;
		}
	}
	if(isdefined(leaderdialog) && isdefined(owner))
	{
		if(isdefined(level.var_57e2bc08))
		{
			if(level.teambased)
			{
				thread [[level.var_57e2bc08]](leaderdialog, owner.team, owner);
			}
		}
	}
	if(isdefined(var_60d3002f) && isdefined(owner))
	{
		owner thread namespace_f9b02f80::play_taacom_dialog(var_60d3002f);
	}
}

/*
	Name: function_f87d8ea0
	Namespace: jammer
	Checksum: 0xE94FF686
	Offset: 0x28D8
	Size: 0x188
	Parameters: 1
	Flags: Linked
*/
function function_f87d8ea0(params)
{
	if(!is_true(self.isjammed))
	{
		return;
	}
	foreach(var_fde75ff9 in level.var_578f7c6d.var_b164e007)
	{
		if(!isdefined(var_fde75ff9))
		{
			continue;
		}
		owner = var_fde75ff9.owner;
		if(isdefined(owner) && isdefined(params.players[owner getentitynumber()]) && level.var_578f7c6d.radiussqr >= distancesquared(var_fde75ff9.origin, self.origin))
		{
			scoreevents::processscoreevent(#"hash_3f995db1490a1721", var_fde75ff9.owner);
			owner stats::function_622feb0d(var_fde75ff9.weapon.name, #"assists", 1);
		}
	}
}

/*
	Name: function_767ffeec
	Namespace: jammer
	Checksum: 0x1423A5B1
	Offset: 0x2A68
	Size: 0x160
	Parameters: 5
	Flags: Linked
*/
function function_767ffeec(attacker, victim, weapon, attackerweapon, meansofdeath)
{
	if(!is_true(meansofdeath.isjammed))
	{
		return false;
	}
	foreach(var_fde75ff9 in level.var_578f7c6d.var_b164e007)
	{
		if(!isdefined(var_fde75ff9))
		{
			continue;
		}
		if(var_fde75ff9.team == meansofdeath.team)
		{
			continue;
		}
		if(attackerweapon === var_fde75ff9.owner && level.var_578f7c6d.radiussqr >= distancesquared(var_fde75ff9.origin, meansofdeath.origin))
		{
			attackerweapon contracts::function_a54e2068(#"hash_4254b43579ee6983");
			return true;
		}
	}
	return false;
}

/*
	Name: function_3d6d7536
	Namespace: jammer
	Checksum: 0x6DE7F2BE
	Offset: 0x2BD0
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_3d6d7536(params)
{
	attacker = params.attacker;
	attacker stats::function_dad108fa(#"hash_1546fa6f8e98bd61", 1);
}

