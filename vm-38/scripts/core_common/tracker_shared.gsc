#using scripts\weapons\weaponobjects.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\globallogic\globallogic_player.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_495a69cb;

/*
	Name: function_ffc9441b
	Namespace: namespace_495a69cb
	Checksum: 0x7E98FCA3
	Offset: 0xC0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ffc9441b()
{
	level notify(1580531089);
}

#namespace tracker;

/*
	Name: init_shared
	Namespace: tracker
	Checksum: 0xA19F779C
	Offset: 0xE0
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function init_shared()
{
	register_clientfields();
	level.trackerperk = spawnstruct();
	level.var_c8241070 = &function_c8241070;
	thread function_a7e7bda0();
	level.trackerperk.var_ec00f4ac = [];
	callback::on_spawned(&onplayerspawned);
}

/*
	Name: register_clientfields
	Namespace: tracker
	Checksum: 0xBC355378
	Offset: 0x170
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function register_clientfields()
{
	clientfield::register_clientuimodel("huditems.isExposedOnMinimap", 1, 1, "int");
}

/*
	Name: onplayerspawned
	Namespace: tracker
	Checksum: 0x17D4E1B1
	Offset: 0x1A8
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function onplayerspawned()
{
	self clientfield::set_player_uimodel("huditems.isExposedOnMinimap", 0);
}

/*
	Name: function_c8241070
	Namespace: tracker
	Checksum: 0x99286D37
	Offset: 0x1D8
	Size: 0x70
	Parameters: 2
	Flags: None
*/
function function_c8241070(player, weapon)
{
	level.trackerperk.var_ec00f4ac[weapon.clientid] = gettime() + (float(getdvarint(#"hash_6f3f10e68d2fedba", 0)) / 1000);
}

/*
	Name: function_43084f6c
	Namespace: tracker
	Checksum: 0x898526B6
	Offset: 0x250
	Size: 0x1A2
	Parameters: 1
	Flags: None
*/
function function_43084f6c(player)
{
	if(level.teambased)
	{
		otherteam = util::getotherteam(player.team);
		foreach(var_f53fe24c in getplayers(otherteam))
		{
			if(var_f53fe24c function_d210981e(player.origin))
			{
				return true;
			}
		}
	}
	else
	{
		enemies = getplayers();
		foreach(enemy in enemies)
		{
			if(enemy == player)
			{
				continue;
			}
			if(enemy function_d210981e(player.origin))
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: function_2c77961d
	Namespace: tracker
	Checksum: 0x3E205D79
	Offset: 0x400
	Size: 0x52
	Parameters: 1
	Flags: None
*/
function function_2c77961d(player)
{
	expiretime = level.trackerperk.var_ec00f4ac[player.clientid];
	if(!isdefined(expiretime))
	{
		return false;
	}
	if(gettime() > expiretime)
	{
		return false;
	}
	return true;
}

/*
	Name: function_796e0334
	Namespace: tracker
	Checksum: 0x268FB38D
	Offset: 0x460
	Size: 0xB0
	Parameters: 1
	Flags: None
*/
function function_796e0334(player)
{
	if(1 && globallogic_player::function_eddea888(player))
	{
		return true;
	}
	if(1 && globallogic_player::function_43084f6c(player))
	{
		return true;
	}
	if(1 && function_2c77961d(player))
	{
		return true;
	}
	if(1 && globallogic_player::function_ce33e204(player))
	{
		return true;
	}
	return false;
}

/*
	Name: function_a7e7bda0
	Namespace: tracker
	Checksum: 0x3480309F
	Offset: 0x518
	Size: 0x1C0
	Parameters: 0
	Flags: None
*/
function function_a7e7bda0()
{
	if(getgametypesetting(#"hardcoremode"))
	{
		return;
	}
	while(true)
	{
		foreach(player in level.players)
		{
			if(!isdefined(player))
			{
				continue;
			}
			if(!player hasperk(#"specialty_detectedicon"))
			{
				continue;
			}
			if(function_796e0334(player))
			{
				if(!isdefined(player.var_7241f6e3))
				{
					player.var_7241f6e3 = gettime() + 100;
				}
				if(player.var_7241f6e3 <= gettime())
				{
					player clientfield::set_player_uimodel("huditems.isExposedOnMinimap", 1);
					player.var_99811216 = gettime() + 100;
				}
				continue;
			}
			if(isdefined(player.var_99811216) && gettime() > player.var_99811216 && player clientfield::get_player_uimodel("huditems.isExposedOnMinimap"))
			{
				player clientfield::set_player_uimodel("huditems.isExposedOnMinimap", 0);
				player.var_7241f6e3 = undefined;
			}
		}
		wait(0.1);
	}
}

