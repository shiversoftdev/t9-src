#using script_1c65dbfc2f1c8d8f;
#using script_3fbe90dd521a8e2d;
#using scripts\core_common\aat_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace ammomod_electriccherry;

/*
	Name: function_e1608bce
	Namespace: ammomod_electriccherry
	Checksum: 0xF5C263AF
	Offset: 0x110
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e1608bce()
{
	level notify(445092242);
}

/*
	Name: function_4b66248d
	Namespace: ammomod_electriccherry
	Checksum: 0xED25E85E
	Offset: 0x130
	Size: 0xEC
	Parameters: 0
	Flags: Linked
*/
function function_4b66248d()
{
	if(!is_true(level.aat_in_use))
	{
		return;
	}
	if(!is_true(getgametypesetting(#"hash_87dd6c14b668b1d")))
	{
		level.var_6563ffa = 1;
	}
	aat::register("ammomod_electriccherry", 0.1, 0, 5, 5, 1, &result, "t7_hud_zm_aat_deadwire", "wpn_aat_dead_wire_plr", undefined, #"electrical");
	clientfield::register("allplayers", "ammomod_electric_cherry_explode", 1, 1, "counter");
}

/*
	Name: result
	Namespace: ammomod_electriccherry
	Checksum: 0x6CB62F74
	Offset: 0x228
	Size: 0x60
	Parameters: 8
	Flags: Linked
*/
function result(death, attacker, mod, weapon, var_fd90b0bb, vpoint, shitloc, boneindex)
{
	if(is_true(level.var_6563ffa))
	{
		return;
	}
}

/*
	Name: function_b4174270
	Namespace: ammomod_electriccherry
	Checksum: 0x1C86DA15
	Offset: 0x290
	Size: 0x9C
	Parameters: 1
	Flags: Event
*/
event function_b4174270(eventstruct)
{
	if(!is_true(level.var_6563ffa))
	{
		return;
	}
	weapon = self getcurrentweapon();
	item = namespace_b376ff3f::function_230ceec4(weapon);
	if(item.var_a6762160.var_b079a6e6 === #"ammomod_electriccherry")
	{
		self function_aa4171b9();
	}
}

/*
	Name: function_aa4171b9
	Namespace: ammomod_electriccherry
	Checksum: 0x58B2531C
	Offset: 0x338
	Size: 0x14C
	Parameters: 0
	Flags: Linked
*/
function function_aa4171b9()
{
	self clientfield::increment("ammomod_electric_cherry_explode", 1);
	s_params = level.var_7659ca85;
	a_zombies = getentitiesinradius(self.origin, 256, 15);
	count = 0;
	foreach(e_zombie in a_zombies)
	{
		if(count >= 30)
		{
			return;
		}
		if(e_zombie == self)
		{
			continue;
		}
		if(e_zombie.var_6f84b820 === #"elite")
		{
			continue;
		}
		e_zombie ammomod_deadwire::function_de99f2ad(self, e_zombie, s_params, 5);
		count++;
	}
}

