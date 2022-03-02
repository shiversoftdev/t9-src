#using script_4c50b35ef5f6d7ae;
#using script_8988fdbc78d6c53;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\util.gsc;
#using scripts\zm_common\zm_placeable_mine.gsc;

#namespace namespace_78b43a28;

/*
	Name: function_5f81213
	Namespace: namespace_78b43a28
	Checksum: 0xC3C66DE0
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5f81213()
{
	level notify(1356917053);
}

#namespace bouncingbetty;

/*
	Name: function_89f2df9
	Namespace: bouncingbetty
	Checksum: 0x309785B6
	Offset: 0xD8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"bouncingbetty", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: bouncingbetty
	Checksum: 0xCACDCAC7
	Offset: 0x120
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
	Checksum: 0x14B93DA9
	Offset: 0x240
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

