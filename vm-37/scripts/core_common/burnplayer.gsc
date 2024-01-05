#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace burnplayer;

/*
	Name: __init__system__
	Namespace: burnplayer
	Checksum: 0xFDEA03BC
	Offset: 0xC0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"burnplayer", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: burnplayer
	Checksum: 0x2931A9D9
	Offset: 0x108
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
	Checksum: 0x66EE5A8D
	Offset: 0x178
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
	Checksum: 0x1C40C2C7
	Offset: 0x238
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
	Checksum: 0x5B7A69AF
	Offset: 0x300
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
	Checksum: 0x5F982F31
	Offset: 0x368
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
	Checksum: 0x8F6CDF66
	Offset: 0x3D8
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
	Checksum: 0xF31E6636
	Offset: 0x4B8
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

