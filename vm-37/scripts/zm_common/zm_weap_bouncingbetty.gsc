#using scripts\zm_common\zm_placeable_mine.gsc;
#using scripts\zm_common\util.gsc;
#using scripts\weapons\weaponobjects.gsc;
#using scripts\weapons\bouncingbetty.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace bouncingbetty;

/*
	Name: __init__system__
	Namespace: bouncingbetty
	Checksum: 0x4F8F9EA8
	Offset: 0xB8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"bouncingbetty", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: bouncingbetty
	Checksum: 0x4BE67A93
	Offset: 0x100
	Size: 0x114
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	level._proximityweaponobjectdetonation_override = &proximityweaponobjectdetonation_override;
	init_shared();
	zm_placeable_mine::add_mine_type("bouncingbetty", #"hash_613df6d5f8eddffd");
	level.bettyjumpheight = 55;
	level.bettydamagemax = 1000;
	level.bettydamagemin = 800;
	level.bettydamageheight = level.bettyjumpheight;
	/#
		setdvar(#"betty_damage_max", level.bettydamagemax);
		setdvar(#"betty_damage_min", level.bettydamagemin);
		setdvar(#"betty_jump_height_onground", level.bettyjumpheight);
	#/
}

/*
	Name: proximityweaponobjectdetonation_override
	Namespace: bouncingbetty
	Checksum: 0x5D57E616
	Offset: 0x220
	Size: 0x170
	Parameters: 1
	Flags: None
*/
function proximityweaponobjectdetonation_override(watcher)
{
	self endon(#"death", #"hacked", #"kill_target_detection");
	weaponobjects::proximityweaponobject_activationdelay(watcher);
	damagearea = weaponobjects::proximityweaponobject_createdamagearea(watcher);
	up = anglestoup(self.angles);
	traceorigin = self.origin + up;
	while(true)
	{
		waitresult = undefined;
		waitresult = damagearea waittill(#"trigger");
		ent = waitresult.activator;
		if(!weaponobjects::proximityweaponobject_validtriggerentity(watcher, ent))
		{
			continue;
		}
		if(weaponobjects::proximityweaponobject_isspawnprotected(watcher, ent))
		{
			continue;
		}
		if(ent damageconetrace(traceorigin, self) > 0)
		{
			thread weaponobjects::proximityweaponobject_dodetonation(watcher, ent, traceorigin);
		}
	}
}

