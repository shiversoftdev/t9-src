#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\core_common\weapons_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\table_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_attackables;

/*
	Name: __init__system__
	Namespace: zm_attackables
	Checksum: 0x34D10C7B
	Offset: 0x168
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_attackables", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_attackables
	Checksum: 0xC09C2381
	Offset: 0x1C0
	Size: 0x176
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.attackablecallback = &attackable_callback;
	level.attackables = struct::get_array("scriptbundle_attackables", "classname");
	foreach(attackable in level.attackables)
	{
		attackable.bundle = getscriptbundle(attackable.scriptbundlename);
		if(isdefined(attackable.target))
		{
			attackable.slot = struct::get_array(attackable.target, "targetname");
		}
		attackable.is_active = 0;
		attackable.health = attackable.bundle.max_health;
		if(getdvarint(#"zm_attackables", 0) > 0)
		{
			attackable.is_active = 1;
			attackable.health = 1000;
		}
	}
}

/*
	Name: function_8ac3bea9
	Namespace: zm_attackables
	Checksum: 0x80F724D1
	Offset: 0x340
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
}

/*
	Name: get_attackable
	Namespace: zm_attackables
	Checksum: 0x61B90A3B
	Offset: 0x350
	Size: 0x14A
	Parameters: 0
	Flags: None
*/
function get_attackable()
{
	foreach(attackable in level.attackables)
	{
		if(!is_true(attackable.is_active))
		{
			continue;
		}
		dist = distance(self.origin, attackable.origin);
		if(dist < attackable.bundle.aggro_distance)
		{
			if(attackable get_attackable_slot(self))
			{
				return attackable;
			}
		}
		/#
			if(getdvarint(#"zm_attackables", 0) > 1)
			{
				if(attackable get_attackable_slot(self))
				{
					return attackable;
				}
			}
		#/
	}
	return undefined;
}

/*
	Name: get_attackable_slot
	Namespace: zm_attackables
	Checksum: 0x8FEC642B
	Offset: 0x4A8
	Size: 0xC2
	Parameters: 1
	Flags: Linked
*/
function get_attackable_slot(entity)
{
	self clear_slots();
	foreach(slot in self.slot)
	{
		if(!isdefined(slot.entity))
		{
			slot.entity = entity;
			entity.attackable_slot = slot;
			return true;
		}
	}
	return false;
}

/*
	Name: clear_slots
	Namespace: zm_attackables
	Checksum: 0xA6E41BCF
	Offset: 0x578
	Size: 0xD6
	Parameters: 0
	Flags: Linked, Private
*/
function private clear_slots()
{
	foreach(slot in self.slot)
	{
		if(!isalive(slot.entity))
		{
			slot.entity = undefined;
			continue;
		}
		if(is_true(slot.entity.missinglegs))
		{
			slot.entity = undefined;
		}
	}
}

/*
	Name: activate
	Namespace: zm_attackables
	Checksum: 0x98C247AB
	Offset: 0x658
	Size: 0x3A
	Parameters: 0
	Flags: None
*/
function activate()
{
	self.is_active = 1;
	if(self.health <= 0)
	{
		self.health = self.bundle.max_health;
	}
}

/*
	Name: deactivate
	Namespace: zm_attackables
	Checksum: 0x20D4C06D
	Offset: 0x6A0
	Size: 0xE
	Parameters: 0
	Flags: Linked
*/
function deactivate()
{
	self.is_active = 0;
}

/*
	Name: do_damage
	Namespace: zm_attackables
	Checksum: 0xE541889
	Offset: 0x6B8
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function do_damage(damage)
{
	self.health = self.health - damage;
	self notify(#"attackable_damaged");
	if(self.health <= 0)
	{
		self notify(#"attackable_deactivated");
		if(!is_true(self.b_deferred_deactivation))
		{
			self deactivate();
		}
	}
}

/*
	Name: attackable_callback
	Namespace: zm_attackables
	Checksum: 0xAFB855F
	Offset: 0x748
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function attackable_callback(entity)
{
	if(entity.archetype === "thrasher" && (self.scriptbundlename === "zm_island_trap_plant_attackable" || self.scriptbundlename === "zm_island_trap_plant_upgraded_attackable"))
	{
		self do_damage(self.health);
	}
	else
	{
		self do_damage(entity.meleeweapon.meleedamage);
	}
}

