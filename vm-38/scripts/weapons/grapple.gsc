#using scripts\weapons\weaponobjects.gsc;
#using scripts\abilities\ability_player.gsc;
#using scripts\core_common\globallogic\globallogic_score.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\battlechatter.gsc;

#namespace grapple;

/*
	Name: function_a1b1878d
	Namespace: grapple
	Checksum: 0x25813EAF
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a1b1878d()
{
	level notify(-1196828919);
}

/*
	Name: __init__system__
	Namespace: grapple
	Checksum: 0xB919E64
	Offset: 0xB8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"grapple", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: grapple
	Checksum: 0x4209C952
	Offset: 0x100
	Size: 0xA4
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	ability_player::register_gadget_activation_callbacks(20, undefined, &gadget_grapple_off);
	globallogic_score::function_5a241bd8(getweapon(#"eq_grapple"), &function_d79e9bb5);
	weaponobjects::function_e6400478(#"eq_grapple", &function_422f24cc, 1);
}

/*
	Name: function_422f24cc
	Namespace: grapple
	Checksum: 0x699ED066
	Offset: 0x1B0
	Size: 0x22
	Parameters: 1
	Flags: None
*/
function function_422f24cc(watcher)
{
	watcher.ondamage = &function_1987d583;
}

/*
	Name: function_d79e9bb5
	Namespace: grapple
	Checksum: 0xD85564C7
	Offset: 0x1E0
	Size: 0x8C
	Parameters: 5
	Flags: None
*/
function function_d79e9bb5(attacker, victim, weapon, attackerweapon, meansofdeath)
{
	if(!isdefined(weapon) || (isdefined(meansofdeath) && meansofdeath == attackerweapon))
	{
		return 0;
	}
	return weapon isgrappling() || (isdefined(weapon.var_700a5910) && (weapon.var_700a5910 + 2000) > gettime());
}

/*
	Name: gadget_grapple_off
	Namespace: grapple
	Checksum: 0x2B3B3493
	Offset: 0x278
	Size: 0x44
	Parameters: 2
	Flags: None
*/
function gadget_grapple_off(slot, weapon)
{
	if(!function_d79e9bb5(self))
	{
		self battlechatter::function_916b4c72(weapon);
	}
}

/*
	Name: function_cb368201
	Namespace: grapple
	Checksum: 0x5A991069
	Offset: 0x2C8
	Size: 0x16
	Parameters: 1
	Flags: Event
*/
event function_cb368201(eventstruct)
{
	self.var_700a5910 = gettime();
}

/*
	Name: function_1987d583
	Namespace: grapple
	Checksum: 0x5F013ABC
	Offset: 0x2E8
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function function_1987d583(watcher)
{
	self setcandamage(0);
}

