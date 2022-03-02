#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace burnplayer;

/*
	Name: function_b10c2094
	Namespace: burnplayer
	Checksum: 0xCD8085FB
	Offset: 0xC0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b10c2094()
{
	level notify(667363604);
}

/*
	Name: function_89f2df9
	Namespace: burnplayer
	Checksum: 0x5584DEC7
	Offset: 0xE0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"burnplayer", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: burnplayer
	Checksum: 0x19C74833
	Offset: 0x128
	Size: 0x64
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("allplayers", "burn", 1, 1, "int");
	clientfield::register("playercorpse", "burned_effect", 1, 1, "int");
}

/*
	Name: setplayerburning
	Namespace: burnplayer
	Checksum: 0xEA5D2B69
	Offset: 0x198
	Size: 0xB4
	Parameters: 5
	Flags: Linked
*/
function setplayerburning(duration, interval, damageperinterval, attacker, weapon)
{
	self clientfield::set("burn", 1);
	self thread watchburntimer(duration);
	self thread watchburndamage(interval, damageperinterval, attacker, weapon);
	self thread watchforwater();
	self thread watchburnfinished();
}

/*
	Name: takingburndamage
	Namespace: burnplayer
	Checksum: 0x6C84AABC
	Offset: 0x258
	Size: 0xBC
	Parameters: 3
	Flags: None
*/
function takingburndamage(eattacker, weapon, smeansofdeath)
{
	if(isdefined(self.doing_scripted_burn_damage))
	{
		self.doing_scripted_burn_damage = undefined;
		return;
	}
	if(smeansofdeath == level.weaponnone)
	{
		return;
	}
	if(smeansofdeath.burnduration == 0)
	{
		return;
	}
	self setplayerburning(float(smeansofdeath.burnduration) / 1000, float(smeansofdeath.burndamageinterval) / 1000, smeansofdeath.burndamage, weapon, smeansofdeath);
}

/*
	Name: watchburnfinished
	Namespace: burnplayer
	Checksum: 0xA0F0B0B4
	Offset: 0x320
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function watchburnfinished()
{
	self endon(#"disconnect");
	self waittill(#"death", #"burn_finished");
	self clientfield::set("burn", 0);
}

/*
	Name: watchburntimer
	Namespace: burnplayer
	Checksum: 0x34514EA2
	Offset: 0x388
	Size: 0x66
	Parameters: 1
	Flags: Linked
*/
function watchburntimer(duration)
{
	self notify(#"burnplayer_watchburntimer");
	self endon(#"burnplayer_watchburntimer", #"disconnect", #"death");
	wait(duration);
	self notify(#"burn_finished");
}

/*
	Name: watchburndamage
	Namespace: burnplayer
	Checksum: 0x80230F2F
	Offset: 0x3F8
	Size: 0xD2
	Parameters: 4
	Flags: Linked
*/
function watchburndamage(interval, damage, attacker, weapon)
{
	if(damage == 0)
	{
		return;
	}
	self endon(#"disconnect", #"death", #"burnplayer_watchburntimer", #"burn_finished");
	while(true)
	{
		wait(interval);
		self.doing_scripted_burn_damage = 1;
		self dodamage(damage, self.origin, attacker, undefined, undefined, "MOD_BURNED", 0, weapon);
		self.doing_scripted_burn_damage = undefined;
	}
}

/*
	Name: watchforwater
	Namespace: burnplayer
	Checksum: 0x37A20766
	Offset: 0x4D8
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function watchforwater()
{
	self endon(#"disconnect", #"death", #"burn_finished");
	while(true)
	{
		if(self isplayerunderwater())
		{
			self notify(#"burn_finished");
		}
		wait(0.05);
	}
}

