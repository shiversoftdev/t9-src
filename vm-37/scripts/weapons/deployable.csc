#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace deployable;

/*
	Name: __init__system__
	Namespace: deployable
	Checksum: 0xECAD344A
	Offset: 0xF0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"deployable", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: deployable
	Checksum: 0x7D09FAC6
	Offset: 0x138
	Size: 0x6C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!isdefined(level._deployable_weapons))
	{
		level._deployable_weapons = [];
	}
	level.var_c442de72 = &function_c1ee2dce;
	level thread group_mega_round_end_abcd_talking();
	if(!isdefined(level.var_1765ad79))
	{
		level.var_1765ad79 = 1;
	}
}

/*
	Name: register_deployable
	Namespace: deployable
	Checksum: 0x5F53E440
	Offset: 0x1B0
	Size: 0xA2
	Parameters: 2
	Flags: None
*/
function register_deployable(weapon, var_7ec218c6)
{
	if(weapon.name == #"none")
	{
		return;
	}
	/#
		assert(weapon.name != #"none");
	#/
	level._deployable_weapons[weapon.statindex] = spawnstruct();
	level._deployable_weapons[weapon.statindex].var_7ec218c6 = var_7ec218c6;
}

/*
	Name: function_3e8d9b27
	Namespace: deployable
	Checksum: 0xFA4D76AB
	Offset: 0x260
	Size: 0x84
	Parameters: 1
	Flags: None
*/
function function_3e8d9b27(previs_weapon)
{
	previs_model = self;
	if(isdefined(previs_weapon.var_4bcd08b0))
	{
		previs_model setmodel(previs_weapon.var_4bcd08b0);
	}
	else
	{
		previs_model setmodel(#"hash_7a80bed4a96537e6");
	}
	previs_model notsolid();
}

/*
	Name: function_c1ee2dce
	Namespace: deployable
	Checksum: 0x5F57AFBE
	Offset: 0x2F0
	Size: 0x6C
	Parameters: 3
	Flags: Linked
*/
function function_c1ee2dce(player, localclientnum, weapon)
{
	var_314a434f = function_35d1c69f(localclientnum, player, weapon);
	player function_bf191832(var_314a434f.isvalid, var_314a434f.origin, var_314a434f.angles);
}

/*
	Name: function_35d1c69f
	Namespace: deployable
	Checksum: 0x5C0E3F31
	Offset: 0x368
	Size: 0x1AA
	Parameters: 3
	Flags: Linked
*/
function function_35d1c69f(localclientnum, player, weapon)
{
	if(!weapon.var_dbbd4cec)
	{
		var_10c45189 = player function_242060b9(weapon);
		var_7ed1816f = var_10c45189.isvalid || ((isdefined(level._deployable_weapons[weapon.statindex].var_7ec218c6) ? level._deployable_weapons[weapon.statindex].var_7ec218c6 : 0));
	}
	else
	{
		var_7ed1816f = 1;
		var_10c45189 = {#angles:player.angles, #origin:player.origin, #isvalid:1};
	}
	var_c3743e82 = !level.var_1765ad79 || function_e0d90bc8(localclientnum) || is_true(weapon.var_33d50507);
	gameplay_allows_deploy = player clientfield::get_to_player("gameplay_allows_deploy");
	var_10c45189.isvalid = var_7ed1816f && gameplay_allows_deploy && var_c3743e82;
	return var_10c45189;
}

/*
	Name: group_mega_round_end_abcd_talking
	Namespace: deployable
	Checksum: 0x91DB6404
	Offset: 0x520
	Size: 0x2D0
	Parameters: 1
	Flags: Linked
*/
function group_mega_round_end_abcd_talking(localclientnum)
{
	if(!isdefined(localclientnum))
	{
		localclientnum = 0;
	}
	level notify("previs_deployable_" + localclientnum);
	level endon("previs_deployable_" + localclientnum);
	wait(10);
	previs_model = spawn(localclientnum, (0, 0, 0), "script_model");
	previs_weapon = getweapon(#"eq_alarm");
	var_5929417d = 0;
	var_2e40ce22 = 0;
	var_d4d81eb4 = 0;
	while(true)
	{
		var_fdadca2a = previs_weapon;
		if(!var_5929417d)
		{
			if(var_2e40ce22 == 1)
			{
				previs_model stoprenderoverridebundle("rob_deployable_can_deploy");
			}
			if(var_d4d81eb4 == 1)
			{
				previs_model stoprenderoverridebundle("rob_deployable_cannot_deploy");
			}
			var_2e40ce22 = 0;
			var_d4d81eb4 = 0;
			if(isdefined(previs_model))
			{
				previs_model hide();
			}
			wait(0.2);
		}
		else
		{
			waitframe(1);
		}
		var_5929417d = 0;
		if(getdvarint(#"hash_4df6a4cc1cfae912", 1) == 0)
		{
			continue;
		}
		player = function_5c10bd79(localclientnum);
		if(!isdefined(player))
		{
			continue;
		}
		if(!isalive(player))
		{
			continue;
		}
		previs_weapon = undefined;
		if(function_96d4f30e(localclientnum))
		{
			previs_weapon = function_e9fe14ee(localclientnum);
		}
		else
		{
			previs_weapon = player.weapon;
		}
		if(!previs_weapon.deployable || previs_weapon.var_e0d42861)
		{
			continue;
		}
		if(function_c7b681af(localclientnum))
		{
			var_5929417d = 1;
			continue;
		}
		var_314a434f = function_35d1c69f(localclientnum, player, previs_weapon);
		player function_bf191832(var_314a434f.isvalid, var_314a434f.origin, var_314a434f.angles);
	}
}

