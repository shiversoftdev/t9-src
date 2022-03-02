#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\cp_common\util.gsc;

#namespace shellshock;

/*
	Name: function_89f2df9
	Namespace: shellshock
	Checksum: 0x387C2991
	Offset: 0x100
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
	Checksum: 0x1AF5B8F8
	Offset: 0x148
	Size: 0x3C
	Parameters: 0
	Flags: Private
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
	Offset: 0x190
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function init()
{
}

/*
	Name: on_damage
	Namespace: shellshock
	Checksum: 0xA53B519E
	Offset: 0x1A0
	Size: 0xEC
	Parameters: 5
	Flags: None
*/
function on_damage(eattacker, einflictor, weapon, smeansofdeath, idamage)
{
	if(self util::isflashbanged())
	{
		return;
	}
	if(smeansofdeath == "MOD_EXPLOSIVE" || smeansofdeath == "MOD_GRENADE" || smeansofdeath == "MOD_GRENADE_SPLASH" || smeansofdeath == "MOD_PROJECTILE" || smeansofdeath == "MOD_PROJECTILE_SPLASH")
	{
		if(idamage > 10)
		{
			if(self util::mayapplyscreeneffect())
			{
				self shellshock(#"frag_grenade_mp", 0.5);
			}
		}
	}
}

/*
	Name: end_on_death
	Namespace: shellshock
	Checksum: 0x6092F5A0
	Offset: 0x298
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
	Checksum: 0x27CD80A8
	Offset: 0x2D0
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
	Checksum: 0xC0DFED96
	Offset: 0x310
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function rcbomb_earthquake(position)
{
	playrumbleonposition("grenade_rumble", position);
	earthquake(0.5, 0.5, self.origin, 512);
}

