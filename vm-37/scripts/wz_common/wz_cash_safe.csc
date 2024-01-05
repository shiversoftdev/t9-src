#using script_618d6f5ff5d18933;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace wz_cash_safe;

/*
	Name: __init__system__
	Namespace: wz_cash_safe
	Checksum: 0x16647C78
	Offset: 0xE0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"wz_cash_safe", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: wz_cash_safe
	Checksum: 0x67A59B4B
	Offset: 0x128
	Size: 0xB4
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(getdvarint(#"hash_7074ed0f04816b75", 0))
	{
		clientfield::register("allplayers", "wz_cash_carrying", 13000, 1, "int", &function_3d113bfb, 0, 1);
		level.var_f042433 = [];
		level.var_e245bbc5 = [];
		level.var_7cce82bd = [];
		callback::on_localclient_connect(&on_localclient_connect);
	}
}

/*
	Name: on_localclient_connect
	Namespace: wz_cash_safe
	Checksum: 0xE11468EF
	Offset: 0x1E8
	Size: 0x154
	Parameters: 1
	Flags: Private
*/
function private on_localclient_connect(localclientnum)
{
	if(getdvarint(#"hash_7074ed0f04816b75", 0))
	{
		level.var_f042433[localclientnum] = [];
		for(i = 0; i < 1; i++)
		{
			objid = util::getnextobjid(localclientnum);
			level.var_f042433[localclientnum][i] = objid;
			objective_add(localclientnum, objid, "invisible", #"wz_cash_safe");
		}
		level.var_7cce82bd[localclientnum] = [];
		for(i = 0; i < 12; i++)
		{
			objid = util::getnextobjid(localclientnum);
			level.var_7cce82bd[localclientnum][i] = objid;
			objective_add(localclientnum, objid, "invisible", #"wz_cash_held");
		}
		level thread function_93b89303(localclientnum);
	}
}

/*
	Name: function_ed66923
	Namespace: wz_cash_safe
	Checksum: 0xEDD3D11B
	Offset: 0x348
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function function_ed66923(targetname)
{
	if(!isarray(level.var_e245bbc5))
	{
		return;
	}
	level.var_e245bbc5[level.var_e245bbc5.size] = targetname;
}

/*
	Name: function_93b89303
	Namespace: wz_cash_safe
	Checksum: 0x1E220E3A
	Offset: 0x398
	Size: 0x8B6
	Parameters: 1
	Flags: Private
*/
function private function_93b89303(localclientnum)
{
	player = function_27673a7(localclientnum);
	player endon(#"disconnect");
	while(true)
	{
		if(!isdefined(player))
		{
			player = function_27673a7(localclientnum);
		}
		for(i = 0; i < 1; i++)
		{
			if(isdefined(level.var_f042433[localclientnum][i]))
			{
				objective_setstate(localclientnum, level.var_f042433[localclientnum][i], "invisible");
			}
		}
		carryingcash = 0;
		var_59a2b21b = [];
		if(isdefined(player) && isalive(player))
		{
			clientdata = item_world::function_a7e98a1a(localclientnum);
			foreach(item in clientdata.inventory.items)
			{
				if(item.id != 32767)
				{
					point = function_b1702735(item.id);
					if(isdefined(point) && isdefined(point.var_a6762160) && point.var_a6762160.itemtype == #"cash")
					{
						carryingcash = 1;
						break;
					}
				}
			}
		}
		if(carryingcash)
		{
			dynents = [];
			foreach(targetname in level.var_e245bbc5)
			{
				var_1ec402d4 = getdynentarray(targetname);
				foreach(safe in var_1ec402d4)
				{
					if(function_ffdbe8c2(safe) == 0)
					{
						dynents[dynents.size] = safe;
					}
				}
			}
			if(dynents.size > 0)
			{
				dynents = arraysortclosest(dynents, player.origin, 10, 0, 5000);
				if(dynents.size > 0)
				{
					for(i = 0; i < 1; i++)
					{
						var_59a2b21b[i] = dynents[i];
					}
				}
			}
		}
		if(var_59a2b21b.size)
		{
			for(i = 0; i < 1; i++)
			{
				if(isdefined(level.var_f042433[localclientnum][i]))
				{
					if(isdefined(var_59a2b21b[i]))
					{
						objective_setposition(localclientnum, level.var_f042433[localclientnum][i], var_59a2b21b[i].origin);
						objective_setstate(localclientnum, level.var_f042433[localclientnum][i], "active");
						continue;
					}
					objective_setstate(localclientnum, level.var_f042433[localclientnum][i], "invisible");
				}
			}
		}
		else
		{
			for(i = 0; i < 1; i++)
			{
				if(isdefined(level.var_f042433[localclientnum][i]))
				{
					objective_setstate(localclientnum, level.var_f042433[localclientnum][i], "invisible");
				}
			}
		}
		vehicle = getplayervehicle(player);
		if(isdefined(vehicle) && isdefined(vehicle.scriptbundlesettings))
		{
			var_165435de = getscriptbundle(vehicle.scriptbundlesettings);
			if(isdefined(var_165435de) && is_true(var_165435de.var_2627e80a))
			{
				var_ea44983e = [];
				var_81279b22 = [];
				all_players = getplayers(localclientnum);
				foreach(enemy_player in all_players)
				{
					if(enemy_player.team === player.team)
					{
						continue;
					}
					if(!is_true(enemy_player.wz_carrying_cash))
					{
						continue;
					}
					if(distancesquared(enemy_player.origin, player.origin) < 25000000)
					{
						if(isdefined(enemy_player.var_7c34933) && (enemy_player.var_7c34933 + 1500) > gettime())
						{
							var_81279b22[enemy_player.var_cbe9b5b4] = enemy_player.var_cbe9b5b4;
							continue;
						}
						if(!isdefined(var_ea44983e))
						{
							var_ea44983e = [];
						}
						else if(!isarray(var_ea44983e))
						{
							var_ea44983e = array(var_ea44983e);
						}
						if(!isinarray(var_ea44983e, enemy_player))
						{
							var_ea44983e[var_ea44983e.size] = enemy_player;
						}
					}
				}
				for(i = 0; i < 12; i++)
				{
					if(var_81279b22[i] === i)
					{
						continue;
					}
					if(isdefined(level.var_7cce82bd[localclientnum][i]))
					{
						if(!isdefined(var_ea44983e[i]))
						{
							objective_setstate(localclientnum, level.var_7cce82bd[localclientnum][i], "invisible");
							continue;
						}
						objective_setposition(localclientnum, level.var_7cce82bd[localclientnum][i], var_ea44983e[i].origin);
						objective_setstate(localclientnum, level.var_7cce82bd[localclientnum][i], "active");
						var_ea44983e[i].var_7c34933 = gettime();
						var_ea44983e[i].var_cbe9b5b4 = i;
					}
				}
			}
		}
		else
		{
			for(i = 0; i < 12; i++)
			{
				if(isdefined(level.var_7cce82bd[localclientnum][i]))
				{
					objective_setstate(localclientnum, level.var_7cce82bd[localclientnum][i], "invisible");
				}
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_4fec33b5
	Namespace: wz_cash_safe
	Checksum: 0x696C865F
	Offset: 0xC58
	Size: 0x9C
	Parameters: 2
	Flags: None
*/
function function_4fec33b5(clientnum, value)
{
	var_45d5c75f = getuimodel(getuimodel(function_5f72e972(#"hash_4bc18fe053c569ef"), (isdefined(clientnum) ? "" + clientnum : "")), "hasCash");
	setuimodelvalue(var_45d5c75f, value);
}

/*
	Name: function_3d113bfb
	Namespace: wz_cash_safe
	Checksum: 0x1FB856B
	Offset: 0xD00
	Size: 0xB4
	Parameters: 7
	Flags: None
*/
function function_3d113bfb(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self.wz_carrying_cash = bwastimejump;
	localplayer = function_5c10bd79(fieldname);
	if(self != localplayer && self.team == localplayer.team)
	{
		function_4fec33b5(self getentitynumber(), bwastimejump);
	}
}

