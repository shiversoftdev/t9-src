#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\util.gsc;

#namespace shellshock;

/*
	Name: function_f8474a29
	Namespace: shellshock
	Checksum: 0x97AF068B
	Offset: 0x100
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f8474a29()
{
	level notify(1870898756);
}

/*
	Name: function_89f2df9
	Namespace: shellshock
	Checksum: 0xB6C78ECA
	Offset: 0x120
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"shellshock", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: shellshock
	Checksum: 0x92286180
	Offset: 0x168
	Size: 0x3C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_start_gametype(&main);
	level.shellshockonplayerdamage = &on_damage;
}

/*
	Name: main
	Namespace: shellshock
	Checksum: 0x80F724D1
	Offset: 0x1B0
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function main()
{
}

/*
	Name: on_damage
	Namespace: shellshock
	Checksum: 0xDBA3E5F0
	Offset: 0x1C0
	Size: 0x12C
	Parameters: 5
	Flags: Linked
*/
function on_damage(eattacker, einflictor, weapon, smeansofdeath, idamage)
{
	if(smeansofdeath == "MOD_EXPLOSIVE" || smeansofdeath == "MOD_GRENADE" || smeansofdeath == "MOD_GRENADE_SPLASH" || smeansofdeath == "MOD_PROJECTILE" || smeansofdeath == "MOD_PROJECTILE_SPLASH")
	{
		if(idamage > 10)
		{
			if(self util::mayapplyscreeneffect() && self hasperk(#"specialty_flakjacket") == 0)
			{
				if(isdefined(einflictor.var_63be5750))
				{
					self [[einflictor.var_63be5750]](eattacker, einflictor, weapon, smeansofdeath, idamage);
				}
				else
				{
					self shellshock(#"frag_grenade_mp", 0.5);
				}
			}
		}
	}
}

/*
	Name: endondeath
	Namespace: shellshock
	Checksum: 0x38579584
	Offset: 0x2F8
	Size: 0x2E
	Parameters: 0
	Flags: None
*/
function endondeath()
{
	self waittill(#"death");
	waittillframeend();
	self notify(#"end_explode");
}

/*
	Name: endontimer
	Namespace: shellshock
	Checksum: 0xC9136355
	Offset: 0x330
	Size: 0x36
	Parameters: 1
	Flags: None
*/
function endontimer(timer)
{
	self endon(#"disconnect");
	wait(timer);
	self notify(#"end_on_timer");
}

/*
	Name: rcbomb_earthquake
	Namespace: shellshock
	Checksum: 0x46154F86
	Offset: 0x370
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function rcbomb_earthquake(position)
{
	playrumbleonposition("grenade_rumble", position);
	earthquake(0.5, 0.5, self.origin, 512);
}

