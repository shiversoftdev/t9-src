#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_c5ba6e2a;

/*
	Name: function_89f2df9
	Namespace: namespace_c5ba6e2a
	Checksum: 0x6DB5D223
	Offset: 0xD0
	Size: 0x54
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"cymbal_monkey", &function_70a657d8, &function_8ac3bea9, &finalize, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_c5ba6e2a
	Checksum: 0xE88D4BC6
	Offset: 0x130
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_7d95e1ed = [];
	level.var_15e68c97 = [];
	level.var_7c5c96dc = &function_4f90c4c2;
	level thread function_a23699fe();
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_c5ba6e2a
	Checksum: 0x8434138F
	Offset: 0x188
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
	level._effect[#"monkey_glow"] = #"hash_5d0dd3293cfdb3dd";
}

/*
	Name: finalize
	Namespace: namespace_c5ba6e2a
	Checksum: 0xA3E0E6FF
	Offset: 0x1C0
	Size: 0x50
	Parameters: 0
	Flags: Linked, Private
*/
function private finalize()
{
	if(isdefined(level.var_a5dacbea))
	{
		[[level.var_a5dacbea]](getweapon(#"cymbal_monkey"), &function_127fb8f3);
	}
}

/*
	Name: function_a23699fe
	Namespace: namespace_c5ba6e2a
	Checksum: 0xECDBB0F4
	Offset: 0x218
	Size: 0x12E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_a23699fe()
{
	level endon(#"game_ended");
	var_cf4e80a7 = 250;
	while(true)
	{
		for(i = 0; i < level.var_7d95e1ed.size; i++)
		{
			monkey = level.var_7d95e1ed[i];
			if(!isdefined(monkey) || is_true(monkey.var_68005ac5))
			{
				continue;
			}
			if(!isdefined(monkey.var_38af96b9))
			{
				monkey delete();
				continue;
			}
			monkey thread function_b9934c1d();
			waitframe(1);
		}
		arrayremovevalue(level.var_7d95e1ed, undefined);
		arrayremovevalue(level.var_15e68c97, undefined);
		waitframe(1);
	}
}

/*
	Name: function_7e60533f
	Namespace: namespace_c5ba6e2a
	Checksum: 0xB20DA902
	Offset: 0x350
	Size: 0x182
	Parameters: 2
	Flags: Private
*/
function private function_7e60533f(monkey, radius)
{
	nearby_players = getentitiesinradius(monkey.origin, radius, 1);
	foreach(player in nearby_players)
	{
		if(function_17c51c94(monkey, player))
		{
			return true;
		}
	}
	var_b1de6a06 = getentitiesinradius(monkey.origin, radius, 15);
	foreach(actor in var_b1de6a06)
	{
		if(function_17c51c94(monkey, actor))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_17c51c94
	Namespace: namespace_c5ba6e2a
	Checksum: 0xA0E2B1F3
	Offset: 0x4E0
	Size: 0xC8
	Parameters: 2
	Flags: Linked, Private
*/
function private function_17c51c94(monkey, ent)
{
	if(!isdefined(ent))
	{
		return false;
	}
	if(isplayer(ent) && util::function_fbce7263(ent.team, monkey.team))
	{
		return true;
	}
	if(isactor(ent) && ent.archetype == "zombie" && util::function_fbce7263(ent.team, monkey.team))
	{
		return true;
	}
	return false;
}

/*
	Name: function_4776caf4
	Namespace: namespace_c5ba6e2a
	Checksum: 0xB84A7995
	Offset: 0x5B0
	Size: 0x27C
	Parameters: 1
	Flags: Private, Event
*/
event private function_4776caf4(eventstruct)
{
	if(eventstruct.weapon.name == #"cymbal_monkey")
	{
		e_grenade = eventstruct.projectile;
		e_grenade ghost();
		e_grenade.angles = self.angles;
		var_bdd70f6a = util::spawn_model(e_grenade.model, e_grenade.origin, e_grenade.angles);
		e_grenade.var_bdd70f6a = var_bdd70f6a;
		e_grenade.var_bdd70f6a linkto(e_grenade);
		e_grenade.var_bdd70f6a.var_38af96b9 = e_grenade;
		e_grenade.var_bdd70f6a.team = e_grenade.team;
		e_grenade.var_bdd70f6a.var_dfa42180 = &function_948b1eea;
		e_grenade.var_bdd70f6a clientfield::set("enemyequip", 1);
		e_grenade.var_bdd70f6a callback::function_d8abfc3d(#"cant_move", &function_8690bb8);
		array::add(level.var_15e68c97, e_grenade.var_bdd70f6a);
		e_grenade waittill(#"stationary", #"death");
		if(!isdefined(e_grenade) && isdefined(var_bdd70f6a))
		{
			var_bdd70f6a delete();
		}
		if(isdefined(self) && isdefined(e_grenade) && isdefined(e_grenade.var_bdd70f6a))
		{
			e_grenade.var_bdd70f6a.var_acdc8d71 = getclosestpointonnavmesh(e_grenade.var_bdd70f6a.origin, 720, 15.1875);
			array::add(level.var_7d95e1ed, e_grenade.var_bdd70f6a);
			self callback::callback(#"hash_3c09ead7e9d8a968", e_grenade.var_bdd70f6a);
		}
	}
}

/*
	Name: function_b9934c1d
	Namespace: namespace_c5ba6e2a
	Checksum: 0x2C2E59CC
	Offset: 0x838
	Size: 0x20C
	Parameters: 0
	Flags: Linked
*/
function function_b9934c1d()
{
	self endon(#"death");
	if(isdefined(level.var_2746aef8))
	{
		[[level.var_2746aef8]](self);
	}
	self unlink();
	self.var_68005ac5 = 1;
	if(isdefined(level.var_1b5a1f0d) && ![[level.var_1b5a1f0d]](self.origin))
	{
		arrayremovevalue(level.var_15e68c97, self);
		level thread grenade_stolen_by_sam(self.var_38af96b9, self);
		return;
	}
	if(isdefined(self.var_acdc8d71) && isdefined(self.var_38af96b9))
	{
		self function_1beaca16();
	}
	self playsound(#"hash_4509539f9e7954e2");
	playfxontag(level._effect[#"monkey_glow"], self, "tag_weapon");
	self thread scene::play(#"hash_2b352ec1d391daaa", self);
	self thread util::delay(6.5, "death", &function_4e61e1d);
	var_de3026af = gettime() + (int(8 * 1000));
	while(gettime() < var_de3026af)
	{
		if(!isdefined(self.var_38af96b9))
		{
			break;
		}
		waitframe(1);
	}
	self function_4f90c4c2();
}

/*
	Name: function_1beaca16
	Namespace: namespace_c5ba6e2a
	Checksum: 0x87F44016
	Offset: 0xA50
	Size: 0x24C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_1beaca16()
{
	queryresult = positionquery_source_navigation(self.origin, 8, 150, 30, 8, 1, 8);
	var_7162cf15 = self.var_acdc8d71;
	var_4eed21d6 = min(queryresult.data.size, 32);
	self.var_1a14c72d = 0;
	self.var_4dbbbb75 = [];
	self.var_9473fdb8 = [];
	for(i = 0; i < var_4eed21d6; i++)
	{
		spot_pos = queryresult.data[i].origin;
		if(!tracepassedonnavmesh(var_7162cf15, spot_pos, 15))
		{
			/#
				recordstar(spot_pos, (1, 0, 0));
				record3dtext("", queryresult.data[i].origin + vectorscale((0, 0, 1), 8), (1, 0, 0));
			#/
			continue;
		}
		if(!isdefined(self.var_4dbbbb75))
		{
			self.var_4dbbbb75 = [];
		}
		else if(!isarray(self.var_4dbbbb75))
		{
			self.var_4dbbbb75 = array(self.var_4dbbbb75);
		}
		self.var_4dbbbb75[self.var_4dbbbb75.size] = undefined;
		if(!isdefined(self.var_9473fdb8))
		{
			self.var_9473fdb8 = [];
		}
		else if(!isarray(self.var_9473fdb8))
		{
			self.var_9473fdb8 = array(self.var_9473fdb8);
		}
		self.var_9473fdb8[self.var_9473fdb8.size] = spot_pos;
	}
	arraysortclosest(self.var_9473fdb8, var_7162cf15);
}

/*
	Name: function_4e61e1d
	Namespace: namespace_c5ba6e2a
	Checksum: 0x9ADC6C49
	Offset: 0xCA8
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_4e61e1d()
{
	self playsound(#"zmb_vox_monkey_explode");
}

/*
	Name: function_4f90c4c2
	Namespace: namespace_c5ba6e2a
	Checksum: 0x7303BBA3
	Offset: 0xCD8
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function function_4f90c4c2()
{
	if(isdefined(self.var_38af96b9))
	{
		self callback::callback(#"hash_6aa0232dd3c8376a");
		playsoundatposition(#"wpn_claymore_alert", self.origin);
		self.var_38af96b9 detonate();
	}
	self delete();
}

/*
	Name: function_4a5dff80
	Namespace: namespace_c5ba6e2a
	Checksum: 0x7C11B395
	Offset: 0xD70
	Size: 0xAA
	Parameters: 2
	Flags: Linked
*/
function function_4a5dff80(zombie, var_d2b7321d)
{
	if(!isdefined(var_d2b7321d))
	{
		var_d2b7321d = 1;
	}
	var_2d9e38fc = sqr((var_d2b7321d ? 720 : 3000));
	arrayremovevalue(level.var_15e68c97, undefined);
	best_monkey = arraygetclosest(zombie.origin, level.var_15e68c97, var_2d9e38fc);
	return best_monkey;
}

/*
	Name: function_948b1eea
	Namespace: namespace_c5ba6e2a
	Checksum: 0x17AFF41C
	Offset: 0xE28
	Size: 0x19E
	Parameters: 1
	Flags: Linked
*/
function function_948b1eea(zombie)
{
	if(isdefined(self.var_9473fdb8))
	{
		var_5800c2e0 = undefined;
		for(i = 0; i < self.var_9473fdb8.size; i++)
		{
			slot = {#pos:self.var_9473fdb8[i], #zombie:self.var_4dbbbb75[i]};
			if(!isdefined(slot.zombie))
			{
				if(!isdefined(var_5800c2e0))
				{
					var_5800c2e0 = i;
				}
			}
			if(slot.zombie === zombie)
			{
				return slot.pos;
			}
		}
		if(isdefined(var_5800c2e0))
		{
			self.var_4dbbbb75[var_5800c2e0] = zombie;
			return self.var_9473fdb8[var_5800c2e0];
		}
	}
	target_pos = undefined;
	if(!isdefined(self.var_acdc8d71))
	{
		target_pos = groundtrace(self.origin + vectorscale((0, 0, 1), 8), self.origin + (vectorscale((0, 0, -1), 100000)), 0, self)[#"position"];
	}
	else
	{
		target_pos = self.var_acdc8d71;
	}
	if(isdefined(level.var_1b5a1f0d) && ![[level.var_1b5a1f0d]](target_pos))
	{
		return undefined;
	}
	return target_pos;
}

/*
	Name: function_127fb8f3
	Namespace: namespace_c5ba6e2a
	Checksum: 0xD1A6426
	Offset: 0xFD0
	Size: 0x11C
	Parameters: 2
	Flags: Linked
*/
function function_127fb8f3(cymbal_monkey, var_dbd1a594)
{
	var_dbd1a594 endon(#"death");
	randangle = randomfloat(360);
	if(isdefined(level._equipment_emp_destroy_fx))
	{
		playfx(level._equipment_emp_destroy_fx, var_dbd1a594.origin + vectorscale((0, 0, 1), 5), (cos(randangle), sin(randangle), 0), anglestoup(var_dbd1a594.angles));
	}
	wait(1.1);
	playfx(#"hash_65c5042becfbaa7d", var_dbd1a594.origin);
	var_dbd1a594 function_4f90c4c2();
}

/*
	Name: function_8690bb8
	Namespace: namespace_c5ba6e2a
	Checksum: 0xA5F631C5
	Offset: 0x10F8
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function function_8690bb8(zombie)
{
	if(!isdefined(zombie) || !isdefined(self.var_9473fdb8))
	{
		return;
	}
	for(i = 0; i < self.var_9473fdb8.size; i++)
	{
		if(self.var_4dbbbb75[i] === zombie)
		{
			self.var_9473fdb8[i] = zombie.origin;
		}
	}
}

/*
	Name: grenade_stolen_by_sam
	Namespace: namespace_c5ba6e2a
	Checksum: 0x76CDAEAA
	Offset: 0x1180
	Size: 0x2A4
	Parameters: 2
	Flags: Linked
*/
function grenade_stolen_by_sam(e_grenade, e_actor)
{
	if(!isdefined(e_grenade.var_bdd70f6a))
	{
		return;
	}
	direction = e_grenade.var_bdd70f6a.origin;
	direction = (direction[1], direction[0], 0);
	if(direction[1] < 0 || (direction[0] > 0 && direction[1] > 0))
	{
		direction = (direction[0], direction[1] * -1, 0);
	}
	else if(direction[0] < 0)
	{
		direction = (direction[0] * -1, direction[1], 0);
	}
	if(isdefined(level.zmb_laugh_alias))
	{
		players = getplayers();
		for(i = 0; i < players.size; i++)
		{
			if(isalive(players[i]))
			{
				players[i] playlocalsound(level.zmb_laugh_alias);
			}
		}
	}
	if(isdefined(level.var_3da1a113))
	{
		playfxontag(level.var_3da1a113, e_grenade.var_bdd70f6a, "tag_origin");
	}
	e_grenade.var_bdd70f6a movez(60, 1, 0.25, 0.25);
	e_grenade.var_bdd70f6a vibrate(direction, 1.5, 2.5, 1);
	e_grenade.var_bdd70f6a waittill(#"movedone");
	e_grenade.var_bdd70f6a delete();
	if(isdefined(e_actor))
	{
		e_actor delete();
	}
	if(isdefined(e_grenade))
	{
		if(isdefined(e_grenade.damagearea))
		{
			e_grenade.damagearea delete();
		}
		e_grenade delete();
	}
}

