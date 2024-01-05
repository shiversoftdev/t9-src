#using scripts\weapons\weaponobjects.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace claymore;

/*
	Name: function_444a692e
	Namespace: claymore
	Checksum: 0x891E2F56
	Offset: 0xA0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_444a692e()
{
	level notify(-756692028);
}

/*
	Name: __init__system__
	Namespace: claymore
	Checksum: 0x4A15F55A
	Offset: 0xC0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"claymore", &init_shared, undefined, undefined, undefined);
}

/*
	Name: init_shared
	Namespace: claymore
	Checksum: 0x36A5C816
	Offset: 0x108
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function init_shared()
{
	weaponobjects::function_e6400478("claymore", &createclaymorewatcher, 0);
}

/*
	Name: createclaymorewatcher
	Namespace: claymore
	Checksum: 0xDFC9846F
	Offset: 0x140
	Size: 0x252
	Parameters: 1
	Flags: None
*/
function createclaymorewatcher(watcher)
{
	watcher.watchforfire = 1;
	watcher.activatesound = #"wpn_claymore_alert";
	watcher.hackable = 1;
	watcher.hackertoolradius = level.equipmenthackertoolradius;
	watcher.hackertooltimems = level.equipmenthackertooltimems;
	watcher.ownergetsassist = 1;
	watcher.ignoredirection = undefined;
	watcher.immediatedetonation = 1;
	watcher.immunespecialty = "specialty_immunetriggerbetty";
	watcher.var_8eda8949 = (0, 0, 0);
	var_e2fa0bc6 = getweapon(#"claymore");
	if(isdefined(var_e2fa0bc6.customsettings))
	{
		var_e6fbac16 = getscriptbundle(var_e2fa0bc6.customsettings);
		/#
			assert(isdefined(var_e6fbac16));
		#/
		watcher.detectiondot = cos((isdefined(var_e6fbac16.var_bec17b8b) ? var_e6fbac16.var_bec17b8b : 0));
		watcher.detectionmindist = (isdefined(var_e6fbac16.var_5303bdc6) ? var_e6fbac16.var_5303bdc6 : 0);
		watcher.detectiongraceperiod = (isdefined(var_e6fbac16.var_88b0248b) ? var_e6fbac16.var_88b0248b : 0);
		if(isdefined(var_e6fbac16.var_29467698) && var_e6fbac16.var_29467698 != 0)
		{
			watcher.detonateradius = var_e6fbac16.var_29467698;
		}
	}
	watcher.stuntime = 1;
	watcher.ondetonatecallback = &weaponobjects::proximitydetonate;
	watcher.onfizzleout = &weaponobjects::weaponobjectfizzleout;
	watcher.onspawn = &function_c9893179;
	watcher.stun = &weaponobjects::weaponstun;
	watcher.var_994b472b = &function_aeb91d3;
}

/*
	Name: function_aeb91d3
	Namespace: claymore
	Checksum: 0xDFC810C9
	Offset: 0x3A0
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function function_aeb91d3(player)
{
	self weaponobjects::weaponobjectfizzleout();
}

/*
	Name: function_c9893179
	Namespace: claymore
	Checksum: 0x7CE7DDF1
	Offset: 0x3D0
	Size: 0x52
	Parameters: 2
	Flags: None
*/
function function_c9893179(watcher, player)
{
	weaponobjects::onspawnproximitygrenadeweaponobject(watcher, player);
	self.weapon = getweapon(#"claymore");
}

