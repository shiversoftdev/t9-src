#using scripts\mp_common\util.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace shellshock;

/*
	Name: __init__system__
	Namespace: shellshock
	Checksum: 0x5B0456CD
	Offset: 0x108
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"shellshock", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: shellshock
	Checksum: 0xA7CFE511
	Offset: 0x150
	Size: 0x3C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_start_gametype(&init);
	level.shellshockonplayerdamage = &on_damage;
}

/*
	Name: init
	Namespace: shellshock
	Checksum: 0x80F724D1
	Offset: 0x198
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function init()
{
}

/*
	Name: on_damage
	Namespace: shellshock
	Checksum: 0x97E12B47
	Offset: 0x1A8
	Size: 0x184
	Parameters: 5
	Flags: Linked
*/
function on_damage(eattacker, einflictor, weapon, smeansofdeath, idamage)
{
	if(self util::isflashbanged())
	{
		return;
	}
	if(self.health <= 0)
	{
		self clientfield::set_to_player("sndMelee", 0);
	}
	if(smeansofdeath == "MOD_EXPLOSIVE" || smeansofdeath == "MOD_GRENADE" || smeansofdeath == "MOD_GRENADE_SPLASH" || smeansofdeath == "MOD_PROJECTILE" || smeansofdeath == "MOD_PROJECTILE_SPLASH")
	{
		if(weapon.explosionradius == 0)
		{
			return;
		}
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
	Name: end_on_death
	Namespace: shellshock
	Checksum: 0x2C2F4B75
	Offset: 0x338
	Size: 0x2E
	Parameters: 0
	Flags: None
*/
function end_on_death()
{
	self waittill(#"death");
	waittillframeend();
	self notify(#"end_explode");
}

/*
	Name: end_on_timer
	Namespace: shellshock
	Checksum: 0x8767D786
	Offset: 0x370
	Size: 0x36
	Parameters: 1
	Flags: None
*/
function end_on_timer(timer)
{
	self endon(#"disconnect");
	wait(timer);
	self notify(#"end_on_timer");
}

/*
	Name: rcbomb_earthquake
	Namespace: shellshock
	Checksum: 0x233566B9
	Offset: 0x3B0
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function rcbomb_earthquake(position)
{
	playrumbleonposition("grenade_rumble", position);
	earthquake(0.5, 0.5, self.origin, 512);
}

/*
	Name: reset_meleesnd
	Namespace: shellshock
	Checksum: 0x27DB07C7
	Offset: 0x410
	Size: 0x4E
	Parameters: 0
	Flags: None
*/
function reset_meleesnd()
{
	self endon(#"death");
	wait(6);
	self clientfield::set_to_player("sndMelee", 0);
	self notify(#"snd_melee_end");
}

