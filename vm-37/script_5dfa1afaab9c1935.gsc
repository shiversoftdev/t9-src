#using script_4c5c4a64a59247a2;
#using script_6809bf766eba194a;

#namespace init;

/*
	Name: initweapon
	Namespace: init
	Checksum: 0xB6F90BB3
	Offset: 0xB8
	Size: 0xC2
	Parameters: 1
	Flags: Linked
*/
function initweapon(weapon)
{
	self.weaponinfo[weapon.name] = spawnstruct();
	self.weaponinfo[weapon.name].position = "none";
	self.weaponinfo[weapon.name].hasclip = 1;
	if(isdefined(weapon.clipmodel))
	{
		self.weaponinfo[weapon.name].useclip = 1;
	}
	else
	{
		self.weaponinfo[weapon.name].useclip = 0;
	}
}

/*
	Name: main
	Namespace: init
	Checksum: 0x2E3217F9
	Offset: 0x188
	Size: 0x45A
	Parameters: 0
	Flags: Linked
*/
function main()
{
	self.a = spawnstruct();
	self.a.weaponpos = [];
	if(self.weapon == level.weaponnone)
	{
		self aiutility::setcurrentweapon(level.weaponnone);
	}
	self aiutility::setprimaryweapon(self.weapon);
	if(self.secondaryweapon == level.weaponnone)
	{
		self aiutility::setsecondaryweapon(level.weaponnone);
	}
	self aiutility::setsecondaryweapon(self.secondaryweapon);
	self aiutility::setcurrentweapon(self.primaryweapon);
	self.initial_primaryweapon = self.primaryweapon;
	self.initial_secondaryweapon = self.secondaryweapon;
	self initweapon(self.primaryweapon);
	self initweapon(self.secondaryweapon);
	self initweapon(self.sidearm);
	self.weapon_positions = array("left", "right", "chest", "back");
	for(i = 0; i < self.weapon_positions.size; i++)
	{
		self.a.weaponpos[self.weapon_positions[i]] = level.weaponnone;
	}
	self.lastweapon = self.weapon;
	self.a.rockets = 3;
	self.a.rocketvisible = 1;
	self.a.pose = "stand";
	self.a.prevpose = self.a.pose;
	self.a.movement = "stop";
	self.a.special = "none";
	self.a.gunhand = "none";
	shared::placeweaponon(self.primaryweapon, "right");
	if(isdefined(self.secondaryweaponclass) && self.secondaryweaponclass != "none" && self.secondaryweaponclass != "pistol")
	{
		shared::placeweaponon(self.secondaryweapon, "back");
	}
	self.a.combatendtime = gettime();
	self.a.nextgrenadetrytime = 0;
	self.a.isaiming = 0;
	self.rightaimlimit = 45;
	self.leftaimlimit = -45;
	self.upaimlimit = 45;
	self.downaimlimit = -45;
	self.walk = 0;
	self.sprint = 0;
	self.a.postscriptfunc = undefined;
	if(!isdefined(self.script_accuracy))
	{
		self.script_accuracy = 1;
	}
	self.a.misstime = 0;
	if(isactor(self))
	{
		self.bulletsinclip = self.weapon.clipsize;
	}
	else
	{
		self.ai.bulletsinclip = self.weapon.clipsize;
	}
	self.lastenemysighttime = 0;
	self.combattime = 0;
	self.var_4a68f84b = 0.75;
	self.randomgrenaderange = 128;
	self.reacquire_state = 0;
}

/*
	Name: addtomissiles
	Namespace: init
	Checksum: 0x7B675B4D
	Offset: 0x5F0
	Size: 0xE4
	Parameters: 1
	Flags: Linked
*/
function addtomissiles(grenade)
{
	if(!isdefined(level.missileentities))
	{
		level.missileentities = [];
	}
	if(!isdefined(level.missileentities))
	{
		level.missileentities = [];
	}
	else if(!isarray(level.missileentities))
	{
		level.missileentities = array(level.missileentities);
	}
	level.missileentities[level.missileentities.size] = grenade;
	if(isdefined(grenade))
	{
		grenade waittill(#"death");
	}
	arrayremovevalue(level.missileentities, grenade);
}

/*
	Name: function_960adbea
	Namespace: init
	Checksum: 0x1ADA6DA5
	Offset: 0x6E0
	Size: 0x6C
	Parameters: 1
	Flags: Event
*/
event function_960adbea(eventstruct)
{
	grenade = eventstruct.projectile;
	weapon = eventstruct.weapon;
	if(isdefined(grenade))
	{
		grenade.owner = self;
		grenade.weapon = weapon;
		level thread addtomissiles(grenade);
	}
}

/*
	Name: function_c6ddaa47
	Namespace: init
	Checksum: 0x61CB127C
	Offset: 0x758
	Size: 0x54
	Parameters: 1
	Flags: Event
*/
event function_c6ddaa47(eventstruct)
{
	eventstruct.projectile.owner = self;
	eventstruct.projectile.weapon = eventstruct.weapon;
	level thread addtomissiles(eventstruct.projectile);
}

/*
	Name: function_596d3a28
	Namespace: init
	Checksum: 0x62FC4F29
	Offset: 0x7B8
	Size: 0x54
	Parameters: 1
	Flags: Event
*/
event function_596d3a28(eventstruct)
{
	eventstruct.projectile.owner = self;
	eventstruct.projectile.weapon = eventstruct.weapon;
	level thread addtomissiles(eventstruct.projectile);
}

/*
	Name: end_script
	Namespace: init
	Checksum: 0x80F724D1
	Offset: 0x818
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function end_script()
{
}

