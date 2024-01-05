#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using script_62caa307a394c18c;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\weapons\molotov.gsc;
#using scripts\core_common\ai\archetype_utility.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\hud_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace zm_weap_molotov;

/*
	Name: function_2a8a9952
	Namespace: zm_weap_molotov
	Checksum: 0xE826CFD2
	Offset: 0xF0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2a8a9952()
{
	level notify(697483168);
}

/*
	Name: __init__system__
	Namespace: zm_weap_molotov
	Checksum: 0x46B453AA
	Offset: 0x110
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"molotov_zm", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_weap_molotov
	Checksum: 0xF306998C
	Offset: 0x158
	Size: 0xDC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_31179876 = &function_16a57018;
	zm_weapons::function_90953640(getweapon(#"molotov_fire"));
	zm_weapons::function_90953640(getweapon(#"eq_molotov"));
	zm_weapons::function_be9d79c3(getweapon(#"molotov_fire"));
	clientfield::register("actor", "molotov_zm_fire_fx", 1, 1, "int");
}

/*
	Name: function_b107b600
	Namespace: zm_weap_molotov
	Checksum: 0x4E28E0C2
	Offset: 0x240
	Size: 0x13C
	Parameters: 4
	Flags: Linked
*/
function function_b107b600(position, var_efa24ea4, damageendtime, var_ac892ba9)
{
	level endon(#"game_ended");
	while(gettime() < damageendtime)
	{
		actor_array = self.var_8928bbff[!self.var_87dae7f1];
		var_b1de6a06 = getentitiesinradius(position, var_efa24ea4, 15);
		foreach(actor in var_b1de6a06)
		{
			if(isalive(actor) && !isinarray(actor_array, actor))
			{
				actor_array[actor_array.size] = actor;
			}
		}
		wait(var_ac892ba9);
	}
}

/*
	Name: function_16a57018
	Namespace: zm_weap_molotov
	Checksum: 0x83C7A7CE
	Offset: 0x388
	Size: 0x3FE
	Parameters: 8
	Flags: Linked
*/
function function_16a57018(damageendtime, owner, position, fireeffectarea, var_289a74bc, killcament, weapon, customsettings)
{
	if(isdefined(fireeffectarea))
	{
		maxs = fireeffectarea getmaxs();
		var_efa24ea4 = max(max(maxs[0], maxs[1]), maxs[2]);
	}
	if(isdefined(var_289a74bc))
	{
		maxs = var_289a74bc getmaxs();
		var_efa24ea4 = max(max(max((isdefined(var_efa24ea4) ? var_efa24ea4 : 0), maxs[0]), maxs[1]), maxs[2]);
	}
	self.var_8928bbff = array([], []);
	self.var_87dae7f1 = 1;
	self thread function_b107b600(position, var_efa24ea4, damageendtime, customsettings.var_4bf1fc1f);
	while(gettime() < damageendtime)
	{
		damageapplied = 0;
		self.var_8928bbff[self.var_87dae7f1] = [];
		self.var_87dae7f1 = !self.var_87dae7f1;
		potential_targets = self.var_8928bbff[self.var_87dae7f1];
		function_1eaaceab(potential_targets);
		start_time = gettime();
		var_ba904176 = customsettings.var_ba904176;
		if(zm_utility::is_survival())
		{
			var_39fef10c = zm_equipment::function_739fbb72(var_ba904176);
		}
		else
		{
			var_39fef10c = zm_equipment::function_379f6b5d(var_ba904176);
		}
		foreach(index, actor in potential_targets)
		{
			actor thread function_f0bbc1f4(owner, var_39fef10c, customsettings.var_4bf1fc1f, start_time + (int(((float(function_60d95f53()) / 1000) * index) * 1000)));
		}
		for(i = 0; i < potential_targets.size; i++)
		{
			target = potential_targets[i];
			if(isdefined(target))
			{
				self trytoapplyfiredamage(target, owner, position, fireeffectarea, var_289a74bc, killcament, weapon, customsettings, start_time);
			}
			waitframe(1);
		}
		wait_time = customsettings.var_4bf1fc1f - ((float(gettime() - start_time)) / 1000);
		if(wait_time > 0)
		{
			wait(wait_time);
		}
	}
}

/*
	Name: trytoapplyfiredamage
	Namespace: zm_weap_molotov
	Checksum: 0xEAE43947
	Offset: 0x790
	Size: 0x248
	Parameters: 9
	Flags: Linked
*/
function trytoapplyfiredamage(target, owner, position, fireeffectarea, var_289a74bc, killcament, weapon, customsettings, start_time)
{
	if(!(isdefined(fireeffectarea) || isdefined(var_289a74bc)) || (isdefined(target) && is_true(target.var_8ef7113a)))
	{
		return false;
	}
	var_4c3c1b32 = 0;
	var_75046efd = 0;
	sourcepos = position;
	if(isdefined(fireeffectarea))
	{
		var_4c3c1b32 = target istouching(fireeffectarea);
		sourcepos = fireeffectarea.origin;
	}
	if(isdefined(var_289a74bc))
	{
		var_75046efd = target istouching(var_289a74bc);
		sourcepos = var_289a74bc.origin;
	}
	var_be45d685 = !(var_4c3c1b32 || var_75046efd);
	targetentnum = target getentitynumber();
	if(var_be45d685)
	{
		target notify(#"hash_50bc036c8d6c0018");
	}
	else if(molotov::candofiredamage(killcament, target, customsettings.var_4bf1fc1f) && (!isdefined(target.sessionstate) || target.sessionstate == "playing"))
	{
		trace = bullettrace(position, target getshootatpos(), 0, target);
		if(trace[#"fraction"] == 1)
		{
			target thread function_8422dabd(sourcepos, killcament, trace, position, weapon, customsettings, owner, start_time);
		}
		else
		{
			var_be45d685 = 1;
		}
		return true;
	}
	return false;
}

/*
	Name: function_8422dabd
	Namespace: zm_weap_molotov
	Checksum: 0x38F26791
	Offset: 0x9E0
	Size: 0x15A
	Parameters: 8
	Flags: Linked
*/
function function_8422dabd(origin, killcament, trace, position, weapon, customsettings, owner, start_time)
{
	self endon(#"death");
	var_4dd4e6ee = owner;
	if(!isdefined(self.var_84e41b20))
	{
		self.var_84e41b20 = [];
	}
	if(isdefined(position))
	{
		self.var_84e41b20[position.starttime] = 1;
	}
	var_5c4f174b = max((float(gettime() - start_time)) / 1000, customsettings.var_4bf1fc1f);
	var_341dfe48 = int(customsettings.var_ba904176 * var_5c4f174b);
	self dodamage(var_341dfe48, self.origin, owner, weapon, "none", "MOD_BURNED", 0, weapon);
	self.var_ae639436 = var_4dd4e6ee;
}

/*
	Name: function_f0bbc1f4
	Namespace: zm_weap_molotov
	Checksum: 0xE23E9909
	Offset: 0xB48
	Size: 0x1FC
	Parameters: 4
	Flags: Linked
*/
function function_f0bbc1f4(attacker, var_b1b43d4c, var_fec8031e, var_900ddd04)
{
	self endoncallback(&function_177886db, #"death", #"hash_4d4b47a468584441");
	var_9b7f2db1 = int(max(1, ceil((var_900ddd04 - gettime()) / (int(var_fec8031e * 1000)))));
	damage_amount = int(var_b1b43d4c * var_fec8031e);
	self clientfield::set("molotov_zm_fire_fx", 1);
	for(i = 0; i < var_9b7f2db1; i++)
	{
		var_ebcff177 = 1;
		if(isdefined(self.var_306ee014) && is_true([[self.var_306ee014]](self)))
		{
			var_ebcff177 = 4;
		}
		point = self.origin;
		point = aiutility::function_cb552839(self);
		hud::function_c9800094(attacker, point, damage_amount, var_ebcff177, self namespace_42457a0::function_1b3815a7(#"fire"));
		wait(var_fec8031e);
	}
	self clientfield::set("molotov_zm_fire_fx", 0);
}

/*
	Name: function_177886db
	Namespace: zm_weap_molotov
	Checksum: 0x19A7
	Offset: 0xD50
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_177886db(notifyhash)
{
	if(isdefined(self))
	{
		self clientfield::set("molotov_zm_fire_fx", 0);
	}
}

