#using scripts\weapons\weaponobjects.gsc;
#using scripts\weapons\molotov.gsc;

#namespace trapd;

/*
	Name: function_ae7e49da
	Namespace: trapd
	Checksum: 0xDC0ECF9A
	Offset: 0x90
	Size: 0x15E
	Parameters: 1
	Flags: None
*/
function function_ae7e49da(watcher)
{
	watcher.watchforfire = 1;
	watcher.activatesound = #"wpn_claymore_alert";
	watcher.hackable = 0;
	watcher.hackertoolradius = level.equipmenthackertoolradius;
	watcher.hackertooltimems = level.equipmenthackertooltimems;
	watcher.activatefx = 1;
	watcher.ownergetsassist = 1;
	watcher.ignoredirection = undefined;
	watcher.immediatedetonation = 1;
	watcher.immunespecialty = "specialty_immunetriggerbetty";
	watcher.detectiondot = cos(70);
	watcher.detectionmindist = 20;
	watcher.detectiongraceperiod = 0.6;
	watcher.stuntime = 3;
	watcher.notequipment = 1;
	watcher.activationdelay = 0.5;
	watcher.ondetonatecallback = &weaponobjects::proximitydetonate;
	watcher.onfizzleout = &weaponobjects::weaponobjectfizzleout;
	watcher.onspawn = &weaponobjects::onspawnproximitygrenadeweaponobject;
	watcher.stun = &weaponobjects::weaponstun;
	return watcher;
}

/*
	Name: function_1daa29fc
	Namespace: trapd
	Checksum: 0x5E92E79C
	Offset: 0x1F8
	Size: 0x146
	Parameters: 1
	Flags: None
*/
function function_1daa29fc(watcher)
{
	watcher.watchforfire = 1;
	watcher.activatesound = #"wpn_claymore_alert";
	watcher.hackable = 0;
	watcher.hackertoolradius = level.equipmenthackertoolradius;
	watcher.hackertooltimems = level.equipmenthackertooltimems;
	watcher.activatefx = 1;
	watcher.ownergetsassist = 1;
	watcher.ignoredirection = 1;
	watcher.immediatedetonation = 1;
	watcher.immunespecialty = "specialty_immunetriggerbetty";
	watcher.detectionmindist = 64;
	watcher.detectiongraceperiod = 0.6;
	watcher.stuntime = 3;
	watcher.notequipment = 1;
	watcher.activationdelay = 0.5;
	watcher.ondetonatecallback = &weaponobjects::proximitydetonate;
	watcher.onfizzleout = &weaponobjects::weaponobjectfizzleout;
	watcher.onspawn = &weaponobjects::onspawnproximitygrenadeweaponobject;
	watcher.stun = &weaponobjects::weaponstun;
	return watcher;
}

/*
	Name: function_d8d3b49b
	Namespace: trapd
	Checksum: 0x45BF566D
	Offset: 0x348
	Size: 0x146
	Parameters: 1
	Flags: None
*/
function function_d8d3b49b(watcher)
{
	watcher.watchforfire = 1;
	watcher.activatesound = #"wpn_claymore_alert";
	watcher.hackable = 0;
	watcher.hackertoolradius = level.equipmenthackertoolradius;
	watcher.hackertooltimems = level.equipmenthackertooltimems;
	watcher.activatefx = 1;
	watcher.ownergetsassist = 1;
	watcher.ignoredirection = 1;
	watcher.immediatedetonation = 1;
	watcher.immunespecialty = "specialty_immunetriggerbetty";
	watcher.detectionmindist = 64;
	watcher.detectiongraceperiod = 0.6;
	watcher.stuntime = 3;
	watcher.notequipment = 1;
	watcher.activationdelay = 0.5;
	watcher.ondetonatecallback = &weaponobjects::proximitydetonate;
	watcher.onfizzleout = &weaponobjects::weaponobjectfizzleout;
	watcher.onspawn = &weaponobjects::onspawnproximitygrenadeweaponobject;
	watcher.stun = &weaponobjects::weaponstun;
	return watcher;
}

/*
	Name: function_518130e
	Namespace: trapd
	Checksum: 0x88B761BC
	Offset: 0x498
	Size: 0x146
	Parameters: 1
	Flags: None
*/
function function_518130e(watcher)
{
	watcher.watchforfire = 1;
	watcher.activatesound = #"wpn_claymore_alert";
	watcher.hackable = 0;
	watcher.hackertoolradius = level.equipmenthackertoolradius;
	watcher.hackertooltimems = level.equipmenthackertooltimems;
	watcher.activatefx = 1;
	watcher.ownergetsassist = 1;
	watcher.ignoredirection = 1;
	watcher.immediatedetonation = 1;
	watcher.immunespecialty = "specialty_immunetriggerbetty";
	watcher.detectionmindist = 64;
	watcher.detectiongraceperiod = 0.6;
	watcher.stuntime = 3;
	watcher.notequipment = 1;
	watcher.activationdelay = 0.5;
	watcher.ondetonatecallback = &function_367f94ba;
	watcher.onfizzleout = &weaponobjects::weaponobjectfizzleout;
	watcher.onspawn = &weaponobjects::onspawnproximitygrenadeweaponobject;
	watcher.stun = &weaponobjects::weaponstun;
	return watcher;
}

/*
	Name: function_367f94ba
	Namespace: trapd
	Checksum: 0x69512C01
	Offset: 0x5E8
	Size: 0xC4
	Parameters: 3
	Flags: None
*/
function function_367f94ba(attacker, weapon, target)
{
	self.killcament.starttime = gettime();
	self molotov::function_462c8632(self.owner, self.origin, (0, 0, 1), vectorscale((0, 0, -1), 400), self.killcament, self.team, getscriptbundle(self.weapon.customsettings));
	self hide();
	wait(10);
	self delete();
}

