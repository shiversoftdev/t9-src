#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\cp_common\util.gsc;

#namespace shellshock;

/*
	Name: function_16dad364
	Namespace: shellshock
	Checksum: 0xAFEC9FF2
	Offset: 0x100
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_16dad364()
{
	level notify(1120949302);
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
	Checksum: 0x902D744C
	Offset: 0x168
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
	Offset: 0x1B0
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
	Checksum: 0x9AADF72
	Offset: 0x1C0
	Size: 0xEC
	Parameters: 5
	Flags: Linked
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
	Checksum: 0x4642CBBF
	Offset: 0x2B8
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
	Checksum: 0x7227D39E
	Offset: 0x2F0
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
	Checksum: 0x79E4F1B7
	Offset: 0x330
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function rcbomb_earthquake(position)
{
	playrumbleonposition("grenade_rumble", position);
	earthquake(0.5, 0.5, self.origin, 512);
}

