#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_player.gsc;
#using script_24c32478acf44108;
#using script_72401f526ba71638;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\perks.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace namespace_2ab93693;

/*
	Name: __init__system__
	Namespace: namespace_2ab93693
	Checksum: 0xC41D9928
	Offset: 0x278
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_662c938bd03bd1ad", &function_70a657d8, undefined, undefined, #"hash_13a43d760497b54d");
}

/*
	Name: function_70a657d8
	Namespace: namespace_2ab93693
	Checksum: 0x2F3EDD99
	Offset: 0x2C8
	Size: 0x5B4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("scriptmover", "" + #"hash_142ed640bf2e09b9", 1, 1, "int");
	clientfield::register("actor", "" + #"hash_717ed5a81b281ebd", 1, 1, "counter");
	clientfield::register("toplayer", "" + #"hash_717ed5a81b281ebd", 1, 1, "int");
	clientfield::register("actor", "" + #"hash_177f6b02e0b5436b", 1, 1, "int");
	clientfield::register("actor", "" + #"hash_40a7e84c380b9b1a", 1, 1, "int");
	callback::on_connect(&on_connect);
	namespace_1b527536::function_36e0540e(#"ring_of_fire", 1, 35, "field_upgrade_ring_of_fire_item_sr");
	namespace_1b527536::function_36e0540e(#"hash_631a223758cd92a", 1, 35, "field_upgrade_ring_of_fire_1_item_sr");
	namespace_1b527536::function_36e0540e(#"hash_631a123758cd777", 1, 35, "field_upgrade_ring_of_fire_2_item_sr");
	namespace_1b527536::function_36e0540e(#"hash_631a023758cd5c4", 1, 35, "field_upgrade_ring_of_fire_3_item_sr");
	namespace_1b527536::function_36e0540e(#"hash_6319f23758cd411", 1, 35, "field_upgrade_ring_of_fire_4_item_sr");
	namespace_1b527536::function_36e0540e(#"hash_6319e23758cd25e", 1, 35, "field_upgrade_ring_of_fire_5_item_sr");
	namespace_1b527536::function_dbd391bf(#"ring_of_fire", &function_309daad7);
	namespace_1b527536::function_dbd391bf(#"hash_631a223758cd92a", &function_309daad7);
	namespace_1b527536::function_dbd391bf(#"hash_631a123758cd777", &function_309daad7);
	namespace_1b527536::function_dbd391bf(#"hash_631a023758cd5c4", &function_309daad7);
	namespace_1b527536::function_dbd391bf(#"hash_6319f23758cd411", &function_309daad7);
	namespace_1b527536::function_dbd391bf(#"hash_6319e23758cd25e", &function_309daad7);
	namespace_9ff9f642::register_burn(#"ring_of_fire", 25, 5, "" + #"hash_177f6b02e0b5436b", "" + #"hash_40a7e84c380b9b1a");
	namespace_9ff9f642::register_burn(#"hash_631a223758cd92a", 25, 10, "" + #"hash_177f6b02e0b5436b", "" + #"hash_40a7e84c380b9b1a");
	namespace_9ff9f642::register_burn(#"hash_631a123758cd777", 25, 10, "" + #"hash_177f6b02e0b5436b", "" + #"hash_40a7e84c380b9b1a");
	namespace_9ff9f642::register_burn(#"hash_631a023758cd5c4", 25, 10, "" + #"hash_177f6b02e0b5436b", "" + #"hash_40a7e84c380b9b1a");
	namespace_9ff9f642::register_burn(#"hash_6319f23758cd411", 25, 10, "" + #"hash_177f6b02e0b5436b", "" + #"hash_40a7e84c380b9b1a");
	namespace_9ff9f642::register_burn(#"hash_6319e23758cd25e", 25, 10, "" + #"hash_177f6b02e0b5436b", "" + #"hash_40a7e84c380b9b1a");
}

/*
	Name: on_connect
	Namespace: namespace_2ab93693
	Checksum: 0xD580E5C6
	Offset: 0x888
	Size: 0xE
	Parameters: 0
	Flags: Linked
*/
function on_connect()
{
	self.var_d93ab65 = [];
}

/*
	Name: function_309daad7
	Namespace: namespace_2ab93693
	Checksum: 0x71072BDC
	Offset: 0x8A0
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function function_309daad7(params)
{
	self namespace_1b527536::function_460882e2(1);
	weapon = params.weapon;
	if(isdefined(params.projectile) && !isdefined(params.projectile.owner))
	{
		params.projectile.owner = self;
	}
	self thread function_1cbc22b0(weapon, 175);
}

/*
	Name: function_baaff75b
	Namespace: namespace_2ab93693
	Checksum: 0x86251800
	Offset: 0x940
	Size: 0xA2
	Parameters: 2
	Flags: Linked, Private
*/
function private function_baaff75b(var_cb73750, entity)
{
	n_radius_sq = var_cb73750.n_radius * var_cb73750.n_radius;
	if(distance2dsquared(var_cb73750.origin, entity.origin) <= n_radius_sq && (abs(entity.origin[2] - var_cb73750.origin[2])) <= var_cb73750.n_height)
	{
		return true;
	}
	return false;
}

/*
	Name: function_ca26e871
	Namespace: namespace_2ab93693
	Checksum: 0xD1D2156F
	Offset: 0x9F0
	Size: 0xDC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ca26e871(entity)
{
	if(isarray(level.var_686c81d7) && isalive(entity))
	{
		foreach(var_cb73750 in level.var_686c81d7)
		{
			if(isdefined(var_cb73750) && function_baaff75b(var_cb73750, entity))
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: function_1cbc22b0
	Namespace: namespace_2ab93693
	Checksum: 0x514FDB63
	Offset: 0xAD8
	Size: 0x6EC
	Parameters: 2
	Flags: Linked, Private
*/
function private function_1cbc22b0(weapon, n_radius)
{
	var_d71041e1 = groundtrace((self.origin + vectorscale((0, 0, 1), 16)) + vectorscale((0, 0, 1), 8), (self.origin + vectorscale((0, 0, 1), 16)) + (vectorscale((0, 0, -1), 100000)), 0, self)[#"position"];
	var_3889eb68 = util::spawn_model("tag_origin", var_d71041e1);
	var_3889eb68.owner = self;
	var_3889eb68.n_radius = n_radius;
	var_3889eb68.n_height = 72;
	var_3889eb68.weapon = weapon;
	var_3889eb68.var_5e3cceb9 = 1;
	var_3889eb68.var_bb41cf71 = 0;
	var_3889eb68.var_8ad82414 = 0;
	var_3889eb68.var_c91dca7e = 4;
	var_3889eb68.var_5b61dff6 = 0.01;
	var_3889eb68.var_fc827c27 = 10;
	var_3889eb68.n_duration = 15;
	if(!isdefined(level.var_686c81d7))
	{
		level.var_686c81d7 = [];
	}
	if(!isdefined(level.var_686c81d7))
	{
		level.var_686c81d7 = [];
	}
	else if(!isarray(level.var_686c81d7))
	{
		level.var_686c81d7 = array(level.var_686c81d7);
	}
	if(!isinarray(level.var_686c81d7, var_3889eb68))
	{
		level.var_686c81d7[level.var_686c81d7.size] = var_3889eb68;
	}
	self flag::increment("zm_field_upgrade_in_use");
	switch(weapon.name)
	{
		case "ring_of_fire":
		{
			var_3889eb68 thread function_64a3f9c6();
			break;
		}
		case "hash_631a223758cd92a":
		{
			var_3889eb68.var_5b61dff6 = 0.02;
			var_3889eb68 thread function_64a3f9c6();
			break;
		}
		case "hash_631a123758cd777":
		{
			var_3889eb68.var_5b61dff6 = 0.02;
			var_3889eb68 thread function_64a3f9c6(1);
			break;
		}
		case "hash_631a023758cd5c4":
		{
			var_3889eb68.var_5b61dff6 = 0.02;
			var_3889eb68 thread function_64a3f9c6(1, 1);
			break;
		}
		case "hash_6319f23758cd411":
		{
			var_3889eb68.var_5b61dff6 = 0.02;
			var_3889eb68 thread function_64a3f9c6(1, 1);
			var_3889eb68.var_bb41cf71 = 1;
			break;
		}
		case "hash_6319e23758cd25e":
		{
			var_3889eb68.var_5b61dff6 = 0.02;
			var_3889eb68 thread function_64a3f9c6(1, 1, 1);
			var_3889eb68.var_bb41cf71 = 1;
			break;
		}
	}
	var_3889eb68 clientfield::set("" + #"hash_142ed640bf2e09b9", 1);
	/#
		level thread function_da2298bc();
	#/
	n_timer = 0;
	while(n_timer <= var_3889eb68.n_duration)
	{
		if(var_3889eb68.var_5e3cceb9)
		{
			if(isdefined(self))
			{
				a_ai = self getenemiesinradius(var_3889eb68.origin, n_radius);
				a_ai = arraysortclosest(a_ai, var_3889eb68.origin);
			}
			else
			{
				a_ai = getaiteamarray(level.zombie_team);
				a_ai = arraysortclosest(a_ai, var_3889eb68.origin, undefined, 0, n_radius);
			}
			foreach(ai in a_ai)
			{
				if(isalive(ai) && ai.var_6f84b820 === #"normal")
				{
					var_16e6b8ea = ai.maxhealth * var_3889eb68.var_5b61dff6;
					ai namespace_9ff9f642::burn(weapon.name, self, weapon, var_16e6b8ea);
					if(var_3889eb68.var_bb41cf71 && ai.var_6f84b820 === #"normal" && math::cointoss(var_3889eb68.var_fc827c27))
					{
						ai.allowdeath = 1;
						ai kill(var_3889eb68.origin, self, var_3889eb68, weapon);
					}
				}
			}
		}
		wait(1);
		n_timer = n_timer + 1;
	}
	if(isplayer(self))
	{
		self flag::decrement("zm_field_upgrade_in_use");
	}
	arrayremovevalue(level.var_686c81d7, var_3889eb68);
	var_3889eb68 clientfield::set("" + #"hash_142ed640bf2e09b9", 0);
	var_3889eb68 thread util::delayed_delete(0.5);
}

/*
	Name: function_64a3f9c6
	Namespace: namespace_2ab93693
	Checksum: 0x94E80A8C
	Offset: 0x11D0
	Size: 0xC76
	Parameters: 3
	Flags: Linked, Private
*/
function private function_64a3f9c6(var_dfbbc9a0, var_feefd408, var_cf53ab1f)
{
	if(!isdefined(var_dfbbc9a0))
	{
		var_dfbbc9a0 = 0;
	}
	if(!isdefined(var_feefd408))
	{
		var_feefd408 = 0;
	}
	if(!isdefined(var_cf53ab1f))
	{
		var_cf53ab1f = 0;
	}
	while(isdefined(self))
	{
		foreach(player in getplayers())
		{
			if(isalive(player) && !isinarray(player.var_d93ab65, self) && function_baaff75b(self, player))
			{
				if(!player.var_d93ab65.size)
				{
					player clientfield::set_to_player("" + #"hash_717ed5a81b281ebd", 1);
				}
				if(!isdefined(player.var_d93ab65))
				{
					player.var_d93ab65 = [];
				}
				else if(!isarray(player.var_d93ab65))
				{
					player.var_d93ab65 = array(player.var_d93ab65);
				}
				player.var_d93ab65[player.var_d93ab65.size] = self;
				if(self.owner === player)
				{
					player.var_a25e160d = 0;
				}
				continue;
			}
			if(isinarray(player.var_d93ab65, self) && !function_baaff75b(self, player))
			{
				arrayremovevalue(player.var_d93ab65, self);
				if(self.owner === player)
				{
					player.var_a25e160d = undefined;
				}
				if(!player.var_d93ab65.size)
				{
					player clientfield::set_to_player("" + #"hash_717ed5a81b281ebd", 0);
				}
			}
		}
		a_actors = getactorarray();
		foreach(ai in a_actors)
		{
			if(!isalive(ai))
			{
				continue;
			}
			if(!is_true(ai.var_25e2200c) && function_ca26e871(ai))
			{
				ai clientfield::increment("" + #"hash_717ed5a81b281ebd", 1);
				ai.var_25e2200c = 1;
				continue;
			}
			if(is_true(ai.var_25e2200c) && !function_ca26e871(ai))
			{
				ai.var_25e2200c = undefined;
			}
		}
		if(var_dfbbc9a0)
		{
			var_315c9351 = getentarraybytype(4);
			if(isarray(level.var_9ded2ca6))
			{
				arrayremovevalue(level.var_9ded2ca6, undefined);
				var_315c9351 = arraycombine(var_315c9351, level.var_9ded2ca6);
			}
			foreach(missile in var_315c9351)
			{
				if(!isdefined(missile) || isplayer(missile.originalowner) || isplayer(missile.owner) || missile.team === self.owner.team)
				{
					continue;
				}
				if(function_baaff75b(self, missile))
				{
					v_dir = missile.origin - self.origin;
					v_dir = vectornormalize(v_dir);
					if(v_dir[0] == 0)
					{
						var_c51499f8 = 1;
					}
					else
					{
						var_c51499f8 = v_dir[0];
					}
					level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:#"hash_56aa82cbbc11009b", #attacker:self.owner});
					self.owner stats::function_622feb0d(#"ring_of_fire", #"hash_5c5c962a0971316a", 1);
					if(missile.weapon.name === #"hash_2b47921791da6f0" || missile.weapon.name === #"hash_67307aa00ad6f686")
					{
						self.owner zm_stats::increment_challenge_stat(#"hash_370c230dce9e1be6");
					}
					playfx(#"hash_2d3cd6bf4ac44fc0", missile.origin, (var_c51499f8, 0, 0), (0, 0, 1), 0, self.owner.team);
					missile notify(#"hash_38b24dfa52842786");
					missile delete();
				}
			}
		}
		if(var_feefd408)
		{
			a_players = function_a1ef346b();
			foreach(player in a_players)
			{
				arrayremovevalue(player.var_d93ab65, undefined);
				if(player.var_d93ab65.size)
				{
					if(!player perks::perk_hasperk(#"specialty_ammodrainsfromstockfirst"))
					{
						player perks::perk_setperk(#"specialty_ammodrainsfromstockfirst");
					}
					continue;
				}
				if(player perks::perk_hasperk(#"specialty_ammodrainsfromstockfirst"))
				{
					player perks::perk_unsetperk(#"specialty_ammodrainsfromstockfirst");
				}
			}
		}
		if(var_cf53ab1f)
		{
			var_47528896 = 0;
			foreach(player in function_a1ef346b())
			{
				if(isinarray(player.var_d93ab65, self))
				{
					var_47528896 = 1;
					break;
				}
			}
			if(var_47528896)
			{
				var_473d58cc = math::clamp(self.var_8ad82414 / 5, 0, 1);
				self.var_5b61dff6 = lerpfloat(0.02, 0.05, var_473d58cc);
				self.var_c91dca7e = lerpfloat(4, 5, var_473d58cc);
				self.var_fc827c27 = lerpfloat(10, 20, var_473d58cc);
				self.n_duration = lerpfloat(15, 20, var_473d58cc);
				self.var_8ad82414 = self.var_8ad82414 + (float(function_60d95f53()) / 1000);
			}
			else
			{
				self.var_8ad82414 = 0;
				self.var_5b61dff6 = 0.02;
				self.var_c91dca7e = 4;
				self.var_fc827c27 = 10;
				self.n_duration = 15;
			}
		}
		waitframe(1);
	}
	a_players = getplayers();
	foreach(player in a_players)
	{
		arrayremovevalue(player.var_d93ab65, undefined);
		if(!player.var_d93ab65.size)
		{
			if(player perks::perk_hasperk("specialty_ammodrainsfromstockfirst"))
			{
				player perks::perk_unsetperk("specialty_ammodrainsfromstockfirst");
			}
			player clientfield::set_to_player("" + #"hash_717ed5a81b281ebd", 0);
		}
	}
	a_actors = getactorarray();
	foreach(ai in a_actors)
	{
		if(!isdefined(ai))
		{
			continue;
		}
		if(is_true(ai.var_25e2200c))
		{
			ai.var_25e2200c = undefined;
		}
	}
}

/*
	Name: function_da2298bc
	Namespace: namespace_2ab93693
	Checksum: 0x9B9A89E3
	Offset: 0x1E50
	Size: 0x486
	Parameters: 0
	Flags: None
*/
function function_da2298bc()
{
	/#
		self notify("");
		self endon("");
		while(getdvarint(#"hash_3ce5890428b398f1", 0) && isarray(level.var_686c81d7) && level.var_686c81d7.size)
		{
			foreach(var_3889eb68 in level.var_686c81d7)
			{
				if(!isdefined(var_3889eb68))
				{
					continue;
				}
				var_1bc24030 = int(1 / (float(function_60d95f53()) / 1000));
				if(getdvarint(#"hash_3ce5890428b398f1", 0))
				{
					foreach(n_index, var_3889eb68 in level.var_686c81d7)
					{
						v_color = (1, 1, 1);
						if(function_baaff75b(var_3889eb68, var_3889eb68.owner))
						{
							v_color = (1, 0.5, 0);
						}
						var_b68b8d0 = 200 + (n_index * 120);
						cylinder(var_3889eb68.origin, var_3889eb68.origin + (0, 0, var_3889eb68.n_height), var_3889eb68.n_radius, v_color, 0, var_1bc24030);
						debug2dtext((500, var_b68b8d0, 0), "" + var_3889eb68.var_c91dca7e, v_color, undefined, (0, 0, 0), 1, 0.8, var_1bc24030);
						if(var_3889eb68.var_bb41cf71)
						{
							debug2dtext((500, var_b68b8d0 + 20, 0), "" + var_3889eb68.var_fc827c27, v_color, undefined, (0, 0, 0), 1, 0.8, var_1bc24030);
						}
						debug2dtext((500, var_b68b8d0 + 40, 0), "" + var_3889eb68.var_5b61dff6, v_color, undefined, (0, 0, 0), 1, 0.8, var_1bc24030);
						debug2dtext((500, var_b68b8d0 + 60, 0), "" + var_3889eb68.n_duration, v_color, undefined, (0, 0, 0), 1, 0.8, var_1bc24030);
						if(var_3889eb68.weapon.name === #"hash_6319e23758cd25e" && isdefined(var_3889eb68.var_8ad82414))
						{
							debug2dtext((500, var_b68b8d0 + 80, 0), "" + floor(var_3889eb68.var_8ad82414), v_color, undefined, (0, 0, 0), 1, 0.8, var_1bc24030);
						}
						debug2dtext((500, var_b68b8d0 + 100, 0), "", v_color, undefined, (0, 0, 0), 1, 0.8, var_1bc24030);
					}
				}
			}
			wait(1);
		}
	#/
}

