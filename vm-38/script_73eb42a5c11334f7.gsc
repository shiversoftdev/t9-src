#using script_680dddbda86931fa;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\struct.csc;
#using script_5eefb31e6afe008b;
#using script_618d6f5ff5d18933;
#using script_13da4e6b98ca81a1;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\battlechatter.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\ai_shared.csc;

#namespace ping;

/*
	Name: function_7b61deaf
	Namespace: ping
	Checksum: 0x1B448914
	Offset: 0x338
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7b61deaf()
{
	level notify(-592152311);
}

/*
	Name: __init__system__
	Namespace: ping
	Checksum: 0x76C4ABB0
	Offset: 0x358
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"ping", &function_70a657d8, &init, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: ping
	Checksum: 0x4807B87C
	Offset: 0x3B0
	Size: 0x5DA
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	setdvar(#"hash_1d7aa0dce875f0eb", 1);
	callback::function_94eab4fb(&function_94eab4fb);
	callback::function_78827e7f(&function_78827e7f);
	callback::function_56df655f(&function_2dd58893);
	callback::function_f8062bf(&function_2dd58893);
	callback::function_ed112c52(&function_2dd58893);
	callback::on_killcam_begin(&function_2dd58893);
	callback::on_killcam_end(&function_2dd58893);
	level.ping = spawnstruct();
	level.ping.types = [12:{#objective:#"teammate_waypoint", #sound:#"hash_1a0de47f7204a9d6"}, 11:{#objective:#"hash_4aacdcc1899f9c59", #sound:#"hash_3cd7abefb7adef5b"}, 10:{#objective:#"hash_6618dbd21e3a5068", #sound:#"hash_3cd7abefb7adef5b"}, 9:{#objective:#"hash_19b425c37cb9f718", #sound:#"hash_1a0de47f7204a9d6"}, 8:{#objective:#"hash_19b425c37cb9f718", #sound:#"hash_1a0de47f7204a9d6"}, 7:{#objective:#"hash_4aacdcc1899f9c59", #sound:#"hash_3cd7abefb7adef5b"}, 6:{#objective:#"hash_4aacdcc1899f9c59", #sound:#"hash_3cd7abefb7adef5b"}, 5:{#sound:#"hash_1a0de47f7204a9d6"}, 4:{#objective:#"hash_614502911ac7d29", #sound:#"hash_1a0de47f7204a9d6"}, 3:{#objective:#"hash_6ee59c4b375ac2ae", #sound:#"hash_3cd7abefb7adef5b"}, 2:{#objective:#"hash_35880e38e054d2b3", #sound:#"hash_3cd7abefb7adef5b"}, 1:{#objective:#"hash_35880e38e054d2b3", #sound:#"hash_1a0de47f7204a9d6"}, 0:{#objective:#"teammate_waypoint", #sound:#"hash_1a0de47f7204a9d6"}];
	/#
		assert(level.ping.types.size == 13);
	#/
	level.ping.var_19e1f40d = (isdefined(getgametypesetting(#"hash_196e997a082443a9")) ? getgametypesetting(#"hash_196e997a082443a9") : 0);
	level.ping.var_1220e585 = (isdefined(getgametypesetting(#"hash_3ccd8e1bf3864fa1")) ? getgametypesetting(#"hash_3ccd8e1bf3864fa1") : 0);
	level.ping.var_ea98b5ff = getgametypesetting(#"hash_5462586bdce0346e");
}

/*
	Name: init
	Namespace: ping
	Checksum: 0x2FA3857E
	Offset: 0x998
	Size: 0x154
	Parameters: 0
	Flags: Linked, Private
*/
function private init()
{
	level.var_907386c0 = [];
	level.ping.var_bef12f79 = [];
	for(i = 0; i < getmaxlocalclients(); i++)
	{
		level.ping.var_bef12f79[i] = spawnstruct();
		level.ping.var_bef12f79[i].var_75c86e0e = spawnstruct();
		level.ping.var_bef12f79[i].count = 0;
		level.var_907386c0[i] = [];
		for(j = 0; j < getdvarint(#"com_maxclients", 0); j++)
		{
			level.var_907386c0[i][j] = [];
		}
	}
	level.var_abaea458 = [];
	level thread function_c81ef836();
}

/*
	Name: function_2dd58893
	Namespace: ping
	Checksum: 0xD25CFA1D
	Offset: 0xAF8
	Size: 0x34
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2dd58893(params)
{
	if(isdefined(params.localclientnum))
	{
		clear_all_pings(params.localclientnum);
	}
}

/*
	Name: function_c81ef836
	Namespace: ping
	Checksum: 0xC3F27312
	Offset: 0xB38
	Size: 0x398
	Parameters: 0
	Flags: Linked, Private
*/
function private function_c81ef836()
{
	level endon(#"disconnect");
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"minimap_waypoint", #"clear_all_pings");
		local_client_num = waitresult.localclientnum;
		if(waitresult._notify == "minimap_waypoint")
		{
			if(is_true(waitresult.remove))
			{
				function_40c4bce(local_client_num, 0, 1);
			}
			else
			{
				x = waitresult.xcoord;
				y = waitresult.ycoord;
				var_bfd46ccc = 2147483647;
				var_cfa5f67b = -2147483647;
				trace = bullettrace((x, y, var_bfd46ccc), (x, y, var_cfa5f67b), 0, self, 1);
				position = trace[#"position"];
				if(trace[#"fraction"] == 1)
				{
					position = (position[0], position[1], 0);
				}
				if(1)
				{
					params = {#hash_dcc5aade:1, #localclientnum:local_client_num, #location:position, #pinger:getentbynum(local_client_num, waitresult.clientnum), #hash_a0bf56ac:waitresult.clientnum, #uniqueid:-1, #remove:0, #eventtype:0};
					function_78827e7f(params);
				}
				function_40c4bce(local_client_num, 0, 0, position);
			}
		}
		else if(waitresult._notify == "clear_all_pings")
		{
			if(1)
			{
				player_ent = function_5c10bd79(local_client_num);
				params = {#hash_dcc5aade:1, #localclientnum:local_client_num, #pinger:function_5c10bd79(local_client_num), #hash_a0bf56ac:waitresult.clientnum, #remove:1, #eventtype:15};
				function_78827e7f(params);
			}
			function_40c4bce(local_client_num, 15, 1);
		}
	}
}

/*
	Name: function_4d08e9ce
	Namespace: ping
	Checksum: 0x74CE3C1B
	Offset: 0xED8
	Size: 0xE6
	Parameters: 2
	Flags: Linked, Private
*/
function private function_4d08e9ce(doubletap, var_1f050749)
{
	if(!is_true(doubletap))
	{
		return 0;
	}
	if(!isdefined(var_1f050749.var_75c86e0e.count))
	{
		return 0;
	}
	if(var_1f050749.var_75c86e0e.count != (var_1f050749.count - 1))
	{
		return 0;
	}
	var_8ff6cd30 = 1;
	switch(var_1f050749.var_75c86e0e.eventtype)
	{
		case 0:
		case 5:
		{
			var_8ff6cd30 = 0;
			break;
		}
		default:
		{
			break;
		}
	}
	return var_8ff6cd30;
}

/*
	Name: function_94eab4fb
	Namespace: ping
	Checksum: 0x408A1CAC
	Offset: 0xFC8
	Size: 0xABC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_94eab4fb(params)
{
	local_client_num = params.localclientnum;
	level notify("newPing" + local_client_num);
	doubletap = params.doubletap;
	event_type = 0;
	param = undefined;
	remove = 0;
	danger = params.var_42ad7eb4 || params.doubletap;
	var_1f050749 = level.ping.var_bef12f79[local_client_num];
	/#
		assert(isdefined(var_1f050749));
	#/
	var_1f050749.count++;
	if(isdefined(level.var_38c7030b))
	{
		var_22eb977c = [[level.var_38c7030b]](local_client_num);
		if(var_22eb977c)
		{
			return;
		}
	}
	var_656750cb = params.var_44a5df === params.pinger;
	if(!var_656750cb && function_4d08e9ce(doubletap, var_1f050749))
	{
		return;
	}
	var_b5a47119 = 0;
	if(isdefined(params.var_44a5df))
	{
		if(isdefined(level.var_a0b1f787[params.var_44a5df.model]) && !isdefined(params.var_44a5df.var_fc558e74))
		{
			params.var_44a5df.var_fc558e74 = level.var_a0b1f787[params.var_44a5df.model];
		}
		else if(!isdefined(params.var_44a5df.var_fc558e74))
		{
			zbarrier = params.var_44a5df function_ead238b5();
			if(isdefined(zbarrier))
			{
				params.var_44a5df = zbarrier;
			}
			else
			{
				/#
					println("" + params.var_44a5df.model);
				#/
				if(!isdefined(params.var_44a5df.var_fc558e74) && sessionmodeiszombiesgame())
				{
				}
			}
		}
		if(isdefined(params.var_44a5df.var_fc558e74))
		{
			event_type = 8;
			handled = 1;
			var_b5a47119 = is_true(level.var_d459a1cf[params.var_44a5df.var_fc558e74]);
		}
		else
		{
			if(params.pinger.team != params.var_44a5df.team && (params.var_44a5df.team != #"none" && params.var_44a5df.team != #"neutral"))
			{
				if(params.var_44a5df isplayer())
				{
					event_type = 2;
				}
				else
				{
					if(params.var_44a5df isai() && sessionmodeiszombiesgame())
					{
						event_type = 10;
					}
					else
					{
						event_type = 3;
					}
				}
				handled = 1;
			}
			else
			{
				if(params.var_44a5df isai() && sessionmodeiszombiesgame())
				{
					event_type = 10;
					handled = 1;
				}
				else
				{
					if(params.pinger.team === params.var_44a5df.team && !params.var_44a5df isplayer())
					{
						event_type = 6;
						handled = 1;
					}
					else
					{
						if(params.pinger.team === params.var_44a5df.team && params.var_44a5df isplayer() && params.var_44a5df inlaststand())
						{
							event_type = 12;
							handled = 1;
						}
						else if(params.var_44a5df.team == #"none" || params.var_44a5df.team == #"neutral")
						{
							event_type = 7;
							handled = 1;
						}
					}
				}
			}
		}
		if(is_true(handled))
		{
			param = params.var_44a5df getentitynumber();
		}
	}
	if(!is_true(handled) && isdefined(params.var_4137e8c0))
	{
		dynent = function_8608b8fd(params.var_4137e8c0);
		if(isdefined(level.var_a0b1f787[dynent.var_15d44120]) && !isdefined(dynent.var_fc558e74))
		{
			dynent.var_fc558e74 = level.var_a0b1f787[dynent.var_15d44120];
		}
		if(isdefined(dynent.var_fc558e74))
		{
			param = params.var_4137e8c0;
			event_type = 9;
			handled = 1;
		}
		else if(isdefined(dynent.var_b91441dd))
		{
			param = params.var_4137e8c0;
			event_type = 11;
			handled = 1;
		}
	}
	if(!is_true(handled) && is_true(danger))
	{
		event_type = 1;
		handled = 1;
	}
	if(!is_true(handled) && params.objectiveid != -1)
	{
		param = params.objectiveid;
		var_d0b9da93 = undefined;
		var_b0833b5d = function_d8d7e32(local_client_num, param, &function_929e2988);
		if(isdefined(var_b0833b5d))
		{
			var_d0b9da93 = var_b0833b5d.ping;
			client_num = var_b0833b5d.client_num;
		}
		if(isdefined(var_d0b9da93))
		{
			if(client_num == params.clientnum)
			{
				event_type = var_d0b9da93.event_type;
				remove = 1;
			}
			else
			{
				event_type = 14;
				remove = array::contains(var_d0b9da93.acknowledgements, params.clientnum);
				param = var_d0b9da93.unique_id;
			}
			handled = 1;
		}
		else
		{
			if(param <= 63)
			{
				event_type = 5;
				handled = 1;
			}
			else
			{
				/#
					println("");
				#/
				return;
			}
		}
	}
	loc = params.location;
	if(!is_true(handled) || var_b5a47119)
	{
		var_e652e0bd = function_6ebaaf97(params.localclientnum);
		if(isdefined(var_e652e0bd))
		{
			param = (isdefined(var_e652e0bd.var_bd027dd9) ? var_e652e0bd.var_bd027dd9 : var_e652e0bd.id);
			loc = var_e652e0bd.origin;
			event_type = 4;
			handled = 1;
			item = function_b1702735(var_e652e0bd.id);
			if(isdefined(item.var_a6762160))
			{
				originoffset = ((isdefined(item.var_a6762160.var_5dc4470b) ? item.var_a6762160.var_5dc4470b : 0), (isdefined(item.var_a6762160.var_54a3b4ca) ? item.var_a6762160.var_54a3b4ca : 0), (isdefined(item.var_a6762160.var_3e688854) ? item.var_a6762160.var_3e688854 : 0));
				loc = loc - rotatepoint(originoffset, var_e652e0bd.angles);
			}
		}
	}
	if(event_type === 8 || event_type === 9)
	{
		var_d0b9da93 = function_d8d7e32(local_client_num, param, &function_220a4754);
		if(isdefined(var_d0b9da93.ping))
		{
			if(var_d0b9da93.client_num == params.clientnum)
			{
				remove = 1;
			}
		}
	}
	function_c7db1f99(var_1f050749, params, event_type, param, remove, loc, doubletap);
	if(function_113e718c(params.localclientnum) && event_type == 0)
	{
		level thread function_aa517465(params.localclientnum, params.pinger);
	}
	else
	{
		function_f20c0762(var_1f050749);
	}
}

/*
	Name: function_c7db1f99
	Namespace: ping
	Checksum: 0x38769685
	Offset: 0x1A90
	Size: 0x1A2
	Parameters: 7
	Flags: Linked, Private
*/
function private function_c7db1f99(var_1f050749, params, event_type, param, remove, loc, doubletap)
{
	var_1f050749.var_75c86e0e.var_237e3e32 = undefined;
	if(1)
	{
		if(event_type < 13)
		{
			var_237e3e32 = function_2e532eed(params);
			var_237e3e32.eventtype = event_type;
			var_237e3e32.param = param;
			var_237e3e32.remove = remove;
			var_237e3e32.uniqueid = -1;
			var_237e3e32.var_a0bf56ac = var_237e3e32.pinger getentitynumber();
			var_237e3e32.var_dcc5aade = 1;
			var_237e3e32.location = loc;
			var_1f050749.var_75c86e0e.var_237e3e32 = var_237e3e32;
		}
	}
	var_1f050749.var_75c86e0e.eventtype = event_type;
	var_1f050749.var_75c86e0e.remove = remove;
	var_1f050749.var_75c86e0e.loc = loc;
	var_1f050749.var_75c86e0e.param = param;
	var_1f050749.var_75c86e0e.doubletap = doubletap;
	var_1f050749.var_75c86e0e.localclientnum = params.localclientnum;
	var_1f050749.var_75c86e0e.count = var_1f050749.count;
	var_1f050749.localclientnum = params.localclientnum;
}

/*
	Name: function_aa517465
	Namespace: ping
	Checksum: 0x496CB326
	Offset: 0x1C40
	Size: 0x11C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_aa517465(localclientnum, pinger)
{
	level endon("newPing" + localclientnum);
	pinger endon(#"death");
	duration = getdvarint(#"hash_4be94e65d1d0b41e", 0);
	wait(float(duration) / 1000);
	if(isdefined(pinger) && pinger function_8e51b4f(47))
	{
		duration = getdvarint(#"hash_4fc2fbad5f4466bd", 0);
		wait(float(duration) / 1000);
	}
	function_f20c0762(level.ping.var_bef12f79[localclientnum]);
}

/*
	Name: function_f20c0762
	Namespace: ping
	Checksum: 0x58EF79B9
	Offset: 0x1D68
	Size: 0x84
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f20c0762(var_1f050749)
{
	var_75c86e0e = var_1f050749.var_75c86e0e;
	if(isdefined(var_75c86e0e.var_237e3e32))
	{
		function_78827e7f(var_75c86e0e.var_237e3e32);
	}
	function_40c4bce(var_75c86e0e.localclientnum, var_75c86e0e.eventtype, var_75c86e0e.remove, var_75c86e0e.loc, var_75c86e0e.param);
}

/*
	Name: function_da96be68
	Namespace: ping
	Checksum: 0x42CE476A
	Offset: 0x1DF8
	Size: 0x76
	Parameters: 1
	Flags: Private
*/
function private function_da96be68(params)
{
	if(isdefined(level.var_be4583aa.var_2e3efdda))
	{
		items = [[level.var_be4583aa.var_2e3efdda]](params.location, undefined, 1, 20);
		if(isdefined(items[0]))
		{
			return items[0].id;
		}
	}
	return undefined;
}

/*
	Name: function_6ebaaf97
	Namespace: ping
	Checksum: 0xA5E386EC
	Offset: 0x1E78
	Size: 0x42
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6ebaaf97(localclientnum)
{
	if(!isdefined(level.var_be4583aa.var_9b71de90))
	{
		return undefined;
	}
	return [[level.var_be4583aa.var_9b71de90]](localclientnum);
}

/*
	Name: function_78827e7f
	Namespace: ping
	Checksum: 0xA32D7026
	Offset: 0x1EC8
	Size: 0x5BA
	Parameters: 1
	Flags: Linked, Private
*/
function private function_78827e7f(params)
{
	var_56bcf423 = params.pinger;
	var_ec31db0f = params.var_a0bf56ac;
	location = params.location;
	event_type = params.eventtype;
	param = params.param;
	local_client_num = params.localclientnum;
	remove = params.remove;
	unique_id = params.uniqueid;
	var_43a0500c = params.var_43a0500c;
	var_dcc5aade = is_true(params.var_dcc5aade);
	currentplayer = function_5c10bd79(local_client_num);
	var_df55840 = currentplayer == var_56bcf423 && !var_dcc5aade;
	if(codcaster::function_b8fe9b52(local_client_num))
	{
		return;
	}
	if(gamemodeismode(5))
	{
		return;
	}
	var_d09a35d4 = (remove ? (var_dcc5aade ? 2 : 1) : 0);
	if(1 && var_df55840 && event_type < 13 && !remove)
	{
		var_638e268e = function_5947d757(event_type);
		var_20da58f9 = level.var_907386c0[local_client_num][var_ec31db0f][var_638e268e];
		if(isdefined(var_20da58f9))
		{
			foreach(ping in var_20da58f9)
			{
				if(ping.unique_id === -1)
				{
					ping.unique_id = unique_id;
				}
			}
		}
	}
	else
	{
		if(event_type < 13 && currentplayer == var_56bcf423 && !remove)
		{
			playsound(local_client_num, level.ping.types[event_type].sound);
		}
		switch(event_type)
		{
			case 0:
			case 1:
			case 2:
			{
				function_d5a244dc(local_client_num, unique_id, event_type, location, var_56bcf423, var_ec31db0f, param, var_d09a35d4);
				break;
			}
			case 3:
			case 6:
			case 7:
			{
				function_afdaea76(local_client_num, unique_id, event_type, location, var_56bcf423, var_ec31db0f, param, var_d09a35d4);
				break;
			}
			case 11:
			{
				function_effa0b37(local_client_num, unique_id, event_type, location, var_56bcf423, var_ec31db0f, param, var_d09a35d4);
				break;
			}
			case 4:
			{
				function_a5de4bd1(local_client_num, unique_id, event_type, location, var_56bcf423, var_ec31db0f, param, var_d09a35d4);
				break;
			}
			case 5:
			{
				function_35dba327(local_client_num, unique_id, event_type, location, var_56bcf423, var_ec31db0f, param, var_d09a35d4);
				break;
			}
			case 8:
			case 9:
			{
				function_83751d93(local_client_num, unique_id, event_type, location, var_56bcf423, var_ec31db0f, param, var_d09a35d4);
				break;
			}
			case 10:
			{
				function_b7306aa(local_client_num, unique_id, event_type, location, var_56bcf423, var_ec31db0f, param, var_d09a35d4);
				break;
			}
			case 14:
			{
				function_f2e6b227(local_client_num, unique_id, event_type, var_56bcf423, var_ec31db0f, param, var_d09a35d4);
				break;
			}
			case 12:
			{
				function_3e306e80(local_client_num, unique_id, event_type, location, var_56bcf423, var_ec31db0f, param, var_d09a35d4);
				break;
			}
			case 17:
			{
				function_4b08d302(local_client_num, var_56bcf423, var_43a0500c);
				break;
			}
			case 15:
			{
				if(0 || !var_df55840)
				{
					function_892476d5(local_client_num, var_ec31db0f);
				}
				break;
			}
		}
	}
}

/*
	Name: function_85bffd7c
	Namespace: ping
	Checksum: 0xCE6ACA77
	Offset: 0x2490
	Size: 0x2FC
	Parameters: 9
	Flags: Linked, Private
*/
function private function_85bffd7c(local_client_num, event_type, location, clientnum, objective_id, var_fc97ceec, offsetz, var_c039614d, var_d09a35d4)
{
	model = function_1df4c3b0(local_client_num, #"hash_43c8bc04801dc66b");
	setuimodelvalue(getuimodel(model, "type"), event_type);
	setuimodelvalue(getuimodel(model, "clientNum"), (isdefined(clientnum) ? clientnum : -1));
	setuimodelvalue(getuimodel(model, "objectiveId"), (isdefined(objective_id) ? objective_id : -1));
	setuimodelvalue(getuimodel(model, "remove"), (isdefined(var_d09a35d4) ? var_d09a35d4 : 0) != 0);
	setuimodelvalue(getuimodel(model, "locationX"), (isdefined(location[0]) ? location[0] : 0));
	setuimodelvalue(getuimodel(model, "locationY"), (isdefined(location[1]) ? location[1] : 0));
	setuimodelvalue(getuimodel(model, "customText"), (isdefined(var_fc97ceec) ? var_fc97ceec : #""));
	setuimodelvalue(getuimodel(model, "offsetZ"), (isdefined(offsetz) ? offsetz : 0));
	setuimodelvalue(getuimodel(model, "customImage"), (isdefined(var_c039614d) ? var_c039614d : #""));
	forcenotifyuimodel(getuimodel(model, "notify"));
}

/*
	Name: function_daee0412
	Namespace: ping
	Checksum: 0xBE5D498D
	Offset: 0x2798
	Size: 0xCE
	Parameters: 2
	Flags: Linked, Private
*/
function private function_daee0412(local_client_num, player)
{
	if(level.ping.var_ea98b5ff === 1)
	{
		switch(player function_b0c2768d())
		{
			case 1:
			{
				return 20;
			}
			case 2:
			{
				return 21;
			}
			case 3:
			{
				return 22;
			}
			case 4:
			{
				return 23;
			}
		}
	}
	if(player getlocalclientnumber() === local_client_num)
	{
		return 6;
	}
	return 3;
}

/*
	Name: function_5300c425
	Namespace: ping
	Checksum: 0x778E7BFD
	Offset: 0x2870
	Size: 0x8C
	Parameters: 5
	Flags: Linked, Private
*/
function private function_5300c425(local_client_num, var_56bcf423, var_ccdb199a, var_c232a3ca, var_c3fe48ea)
{
	color = function_daee0412(local_client_num, var_56bcf423);
	function_c79ecd60(local_client_num, var_56bcf423 getplayername(), color, undefined, var_ccdb199a, undefined, undefined, var_c232a3ca, var_c3fe48ea);
}

/*
	Name: function_9be72061
	Namespace: ping
	Checksum: 0x6B9D9F48
	Offset: 0x2908
	Size: 0x10C
	Parameters: 4
	Flags: Linked, Private
*/
function private function_9be72061(local_client_num, obj_id, ent, n_seconds)
{
	if(!isdefined(obj_id) || !isdefined(ent) || !isdefined(n_seconds))
	{
		return;
	}
	level endon(#"game_ended");
	level notify(obj_id + "_end_follow_ent");
	level endon(obj_id + "_end_follow_ent");
	level endon(obj_id + "_removed");
	objective_onentity(local_client_num, obj_id, ent, 0, 0, 0);
	if(n_seconds < 0)
	{
		return;
	}
	wait(n_seconds);
	objective_clearentity(local_client_num, obj_id);
	if(isdefined(ent))
	{
		objective_setposition(local_client_num, obj_id, ent.origin);
	}
}

/*
	Name: function_bcb7d0e7
	Namespace: ping
	Checksum: 0x80F6C366
	Offset: 0x2A20
	Size: 0xF4
	Parameters: 3
	Flags: Linked
*/
function function_bcb7d0e7(local_client_num, var_ec31db0f, ping)
{
	/#
		assert(isdefined(ping));
	#/
	if(ping.event_type != 5 && ping.obj_id >= 64)
	{
		clientobjid = ping.obj_id - 64;
		level notify(clientobjid + "_removed");
		objective_delete(local_client_num, clientobjid);
		util::releaseobjid(local_client_num, clientobjid);
	}
	function_85bffd7c(local_client_num, ping.event_type, undefined, var_ec31db0f, ping.obj_id, undefined, undefined, undefined, 1);
}

/*
	Name: function_ccc05112
	Namespace: ping
	Checksum: 0xA7EC17E2
	Offset: 0x2B20
	Size: 0xD0
	Parameters: 3
	Flags: Linked, Private
*/
function private function_ccc05112(local_client_num, var_ec31db0f, var_638e268e)
{
	foreach(ping in level.var_907386c0[local_client_num][var_ec31db0f][var_638e268e])
	{
		function_bcb7d0e7(local_client_num, var_ec31db0f, ping);
	}
	level.var_907386c0[local_client_num][var_ec31db0f][var_638e268e] = undefined;
}

/*
	Name: function_807b75f0
	Namespace: ping
	Checksum: 0x8FD46D89
	Offset: 0x2BF8
	Size: 0xC4
	Parameters: 3
	Flags: Linked, Private
*/
function private function_807b75f0(local_client_num, var_ec31db0f, event_type)
{
	var_869573d5 = function_5947d757(event_type);
	var_20da58f9 = level.var_907386c0[local_client_num][var_ec31db0f][var_869573d5];
	if(isdefined(var_20da58f9) && var_20da58f9.size >= function_44806bba(event_type))
	{
		ping = array::pop_front(var_20da58f9, 0);
		function_bcb7d0e7(local_client_num, var_ec31db0f, ping);
	}
}

/*
	Name: function_d8d7e32
	Namespace: ping
	Checksum: 0xAF6E4F65
	Offset: 0x2CC8
	Size: 0x1BE
	Parameters: 5
	Flags: Linked, Private
*/
function private function_d8d7e32(local_client_num, param, var_398c2dad, var_9d45fcf2, pool)
{
	foreach(client_num, pings in level.var_907386c0[local_client_num])
	{
		if(isdefined(var_9d45fcf2) && array::contains(var_9d45fcf2, client_num))
		{
			continue;
		}
		foreach(var_20da58f9 in pings)
		{
			if(isdefined(pool) && array::contains(pool, var_638e268e))
			{
				continue;
			}
			index = array::find(var_20da58f9, param, var_398c2dad);
			if(isdefined(index))
			{
				return {#client_num:client_num, #ping:var_20da58f9[index]};
			}
		}
	}
}

/*
	Name: function_935e5b46
	Namespace: ping
	Checksum: 0xDF646314
	Offset: 0x2E90
	Size: 0x24
	Parameters: 2
	Flags: Linked, Private
*/
function private function_935e5b46(ping, unique_id)
{
	return ping.unique_id === unique_id;
}

/*
	Name: function_929e2988
	Namespace: ping
	Checksum: 0xB6400CBF
	Offset: 0x2EC0
	Size: 0x24
	Parameters: 2
	Flags: Linked, Private
*/
function private function_929e2988(ping, obj_id)
{
	return ping.obj_id === obj_id;
}

/*
	Name: function_220a4754
	Namespace: ping
	Checksum: 0x7E4519D8
	Offset: 0x2EF0
	Size: 0x24
	Parameters: 2
	Flags: Linked, Private
*/
function private function_220a4754(ping, param)
{
	return ping.param === param;
}

/*
	Name: function_2084e2d9
	Namespace: ping
	Checksum: 0x7439BA56
	Offset: 0x2F20
	Size: 0x11C
	Parameters: 6
	Flags: Linked, Private
*/
function private function_2084e2d9(local_client_num, var_ec31db0f, event_type, var_398c2dad, var_1433567e, var_d4b54312)
{
	var_869573d5 = function_5947d757(var_398c2dad);
	var_20da58f9 = level.var_907386c0[var_ec31db0f][event_type][var_869573d5];
	if(isdefined(var_20da58f9))
	{
		index = array::find(var_20da58f9, var_d4b54312, var_1433567e);
		if(isdefined(index))
		{
			ping = var_20da58f9[index];
			if(var_20da58f9.size == 1)
			{
				level.var_907386c0[var_ec31db0f][event_type][var_869573d5] = undefined;
			}
			else
			{
				array::pop(var_20da58f9, index, 0);
			}
			function_bcb7d0e7(var_ec31db0f, event_type, ping);
		}
	}
}

/*
	Name: function_e0180998
	Namespace: ping
	Checksum: 0x91C041CD
	Offset: 0x3048
	Size: 0x54
	Parameters: 4
	Flags: Linked, Private
*/
function private function_e0180998(local_client_num, var_ec31db0f, event_type, obj_id)
{
	function_2084e2d9(local_client_num, var_ec31db0f, event_type, &function_929e2988, obj_id, 0);
}

/*
	Name: function_b15bbdd1
	Namespace: ping
	Checksum: 0xAAF62BA2
	Offset: 0x30A8
	Size: 0x54
	Parameters: 4
	Flags: Linked, Private
*/
function private function_b15bbdd1(local_client_num, var_ec31db0f, event_type, ent)
{
	function_2084e2d9(local_client_num, var_ec31db0f, event_type, &function_220a4754, ent, 0);
}

/*
	Name: function_1544c7f4
	Namespace: ping
	Checksum: 0xE2E7D409
	Offset: 0x3108
	Size: 0x84
	Parameters: 5
	Flags: Linked, Private
*/
function private function_1544c7f4(local_client_num, var_56bcf423, var_ec31db0f, event_type, unique_id)
{
	var_421f350 = function_5c10bd79(local_client_num) == var_56bcf423;
	function_2084e2d9(local_client_num, var_ec31db0f, event_type, &function_935e5b46, unique_id, var_421f350);
}

/*
	Name: function_1793cfaf
	Namespace: ping
	Checksum: 0x2A1A0FAF
	Offset: 0x3198
	Size: 0x336
	Parameters: 14
	Flags: Linked, Private
*/
function private function_1793cfaf(local_client_num, unique_id, var_56bcf423, var_ec31db0f, event_type, location, objective_type, var_ccdb199a, var_c232a3ca, var_c3fe48ea, var_52c78c2c, follow_ent, var_ea6fedda, var_bd94dfbb)
{
	if(!isdefined(follow_ent))
	{
		follow_ent = undefined;
	}
	if(!isdefined(var_ea6fedda))
	{
		var_ea6fedda = 4;
	}
	obj_id = util::getnextobjid(local_client_num);
	var_6d305537 = {#param:var_bd94dfbb, #hash_52c78c2c:var_52c78c2c, #hash_638e268e:function_5947d757(event_type), #event_type:event_type, #hash_c3fe48ea:var_c3fe48ea, #hash_c232a3ca:var_c232a3ca, #acknowledgements:[], #unique_id:unique_id, #obj_id:obj_id + 64};
	if(!isdefined(level.var_907386c0[local_client_num][var_ec31db0f][var_6d305537.var_638e268e]))
	{
		level.var_907386c0[local_client_num][var_ec31db0f][var_6d305537.var_638e268e] = [];
	}
	else if(!isarray(level.var_907386c0[local_client_num][var_ec31db0f][var_6d305537.var_638e268e]))
	{
		level.var_907386c0[local_client_num][var_ec31db0f][var_6d305537.var_638e268e] = array(level.var_907386c0[local_client_num][var_ec31db0f][var_6d305537.var_638e268e]);
	}
	level.var_907386c0[local_client_num][var_ec31db0f][var_6d305537.var_638e268e][level.var_907386c0[local_client_num][var_ec31db0f][var_6d305537.var_638e268e].size] = var_6d305537;
	objective_add(local_client_num, obj_id, "active", objective_type, location, #"none", var_ec31db0f);
	function_2e625a75(local_client_num, obj_id, 1);
	if(isdefined(follow_ent))
	{
		level thread function_9be72061(local_client_num, obj_id, follow_ent, var_ea6fedda);
	}
	if(isdefined(var_c232a3ca) && var_c232a3ca != #"")
	{
		function_5300c425(local_client_num, var_56bcf423, var_ccdb199a, var_c232a3ca, var_c3fe48ea);
	}
	battlechatter::function_f47a0e3b(local_client_num, var_56bcf423, var_52c78c2c);
	return obj_id + 64;
}

/*
	Name: function_d5a244dc
	Namespace: ping
	Checksum: 0x170AA68D
	Offset: 0x34D8
	Size: 0x2E4
	Parameters: 8
	Flags: Linked, Private
*/
function private function_d5a244dc(local_client_num, unique_id, event_type, location, var_56bcf423, var_ec31db0f, var_d4f0ac6e, var_d09a35d4)
{
	if(var_d09a35d4 == 2)
	{
		function_e0180998(local_client_num, var_ec31db0f, event_type, var_d4f0ac6e);
	}
	else
	{
		if(var_d09a35d4 == 1)
		{
			function_1544c7f4(local_client_num, var_56bcf423, var_ec31db0f, event_type, unique_id);
		}
		else
		{
			function_807b75f0(local_client_num, var_ec31db0f, event_type);
			follow_ent = undefined;
			var_ea6fedda = 4;
			if(event_type == 2 && isdefined(var_d4f0ac6e))
			{
				ent = getentbynum(local_client_num, var_d4f0ac6e);
				if(isdefined(ent))
				{
					location = ent.origin;
					if(!ent isplayer() || level.ping.var_19e1f40d)
					{
						follow_ent = ent;
					}
					if(ent isplayer())
					{
						var_ea6fedda = level.ping.var_1220e585;
					}
				}
				var_52c78c2c = function_9b79b59f(local_client_num, var_56bcf423);
			}
			else
			{
				var_52c78c2c = "pingLocation";
			}
			zonename = undefined;
			if(isdefined(level.var_d6c4af7f))
			{
				zonename = [[level.var_d6c4af7f]](location);
			}
			if(event_type == 2 || event_type == 1)
			{
				var_3695f891 = (isdefined(zonename) ? zonename : #"hash_1e32ad8efd3bd291");
			}
			else
			{
				var_3695f891 = (isdefined(zonename) ? zonename : #"hash_18b0d1618dc96364");
			}
			obj_id = function_1793cfaf(local_client_num, unique_id, var_56bcf423, var_ec31db0f, event_type, location, level.ping.types[event_type].objective, #"hash_5052920a34135f31", var_3695f891, undefined, var_52c78c2c, follow_ent, var_ea6fedda);
		}
	}
	function_85bffd7c(local_client_num, event_type, location, var_ec31db0f, obj_id, undefined, undefined, undefined, var_d09a35d4);
}

/*
	Name: function_3e306e80
	Namespace: ping
	Checksum: 0xFDA63A0E
	Offset: 0x37C8
	Size: 0x21C
	Parameters: 8
	Flags: Linked, Private
*/
function private function_3e306e80(local_client_num, unique_id, event_type, location, var_56bcf423, var_ec31db0f, var_d4f0ac6e, var_d09a35d4)
{
	if(var_d09a35d4 == 2)
	{
		function_e0180998(local_client_num, var_ec31db0f, event_type, var_d4f0ac6e);
	}
	else
	{
		if(var_d09a35d4 == 1)
		{
			function_1544c7f4(local_client_num, var_56bcf423, var_ec31db0f, event_type, unique_id);
		}
		else
		{
			function_807b75f0(local_client_num, var_ec31db0f, event_type);
			if(event_type == 12 && isdefined(var_d4f0ac6e))
			{
				ent = getentbynum(local_client_num, var_d4f0ac6e);
				if(isdefined(ent))
				{
					follow_ent = ent;
					location = ent.origin + vectorscale((0, 0, 1), 40);
				}
				if(var_56bcf423 !== ent)
				{
					var_52c78c2c = "pingLocation";
				}
			}
			else
			{
				var_52c78c2c = "pingLocation";
			}
			var_2f3ac892 = #"hash_5052920a34135f31";
			var_3695f891 = #"hash_64a468a93e8c8bd7";
			if(var_ec31db0f == var_d4f0ac6e)
			{
				var_2f3ac892 = undefined;
				var_3695f891 = #"hash_4e169e26d7efe148";
			}
			obj_id = function_1793cfaf(local_client_num, unique_id, var_56bcf423, var_ec31db0f, event_type, location, level.ping.types[event_type].objective, var_2f3ac892, var_3695f891, undefined, var_52c78c2c, follow_ent);
		}
	}
	function_85bffd7c(local_client_num, event_type, location, var_ec31db0f, obj_id, undefined, undefined, undefined, var_d09a35d4);
}

/*
	Name: function_afdaea76
	Namespace: ping
	Checksum: 0x3E63F060
	Offset: 0x39F0
	Size: 0x2B4
	Parameters: 8
	Flags: Linked, Private
*/
function private function_afdaea76(local_client_num, unique_id, event_type, location, var_56bcf423, var_ec31db0f, var_d4f0ac6e, var_d09a35d4)
{
	var_b2f64e7 = undefined;
	if(var_d09a35d4 == 2)
	{
		function_e0180998(local_client_num, var_ec31db0f, event_type, var_d4f0ac6e);
	}
	else
	{
		if(var_d09a35d4 == 1)
		{
			function_1544c7f4(local_client_num, var_56bcf423, var_ec31db0f, event_type, unique_id);
		}
		else
		{
			function_807b75f0(local_client_num, var_ec31db0f, event_type);
			ent = getentbynum(local_client_num, var_d4f0ac6e);
			if(isdefined(ent))
			{
				location = ent.origin;
				if(ent isvehicle() && isdefined(ent.displayname) && ent.displayname != #"")
				{
					name = ent.displayname;
					image = ent.var_c95558ce;
					var_52c78c2c = function_49109f3(local_client_num, ent, var_56bcf423);
				}
				else if(isdefined(ent.weapon))
				{
					name = ent.weapon.displayname;
					image = ent.weapon.var_c95558ce;
					var_52c78c2c = function_43569f3b(ent);
				}
				var_166a2084 = ent getpointinbounds(0, 0, 1);
				var_b2f64e7 = var_166a2084[2] - location[2];
			}
			obj_id = function_1793cfaf(local_client_num, unique_id, var_56bcf423, var_ec31db0f, event_type, location, level.ping.types[event_type].objective, #"hash_5052920a34135f31", name, undefined, var_52c78c2c, ent);
		}
	}
	function_85bffd7c(local_client_num, event_type, location, var_ec31db0f, obj_id, name, var_b2f64e7, image, var_d09a35d4);
}

/*
	Name: function_effa0b37
	Namespace: ping
	Checksum: 0x63B972D4
	Offset: 0x3CB0
	Size: 0x244
	Parameters: 8
	Flags: Linked, Private
*/
function private function_effa0b37(local_client_num, unique_id, event_type, location, var_56bcf423, var_ec31db0f, var_d4f0ac6e, var_d09a35d4)
{
	var_b2f64e7 = undefined;
	image = undefined;
	name = undefined;
	if(var_d09a35d4 == 2)
	{
		function_e0180998(local_client_num, var_ec31db0f, event_type, var_d4f0ac6e);
	}
	else
	{
		if(var_d09a35d4 == 1)
		{
			function_1544c7f4(local_client_num, var_56bcf423, var_ec31db0f, event_type, unique_id);
		}
		else
		{
			function_807b75f0(local_client_num, var_ec31db0f, event_type);
			dynent = function_8608b8fd(var_d4f0ac6e);
			/#
				assert(isdefined(dynent.var_b91441dd));
			#/
			name = dynent.displayname;
			location = dynent.origin;
			image = dynent.var_b91441dd.var_c95558ce;
			var_52c78c2c = dynent.var_b91441dd.var_e9898330;
			var_166a2084 = location;
			var_b2f64e7 = (isdefined(dynent.var_b91441dd.var_136dd314) ? dynent.var_b91441dd.var_136dd314 : 40);
			obj_id = function_1793cfaf(local_client_num, unique_id, var_56bcf423, var_ec31db0f, event_type, location, level.ping.types[event_type].objective, #"hash_7eae2f9838aa52cf", name, undefined, var_52c78c2c);
		}
	}
	function_85bffd7c(local_client_num, event_type, location, var_ec31db0f, obj_id, name, var_b2f64e7, image, var_d09a35d4);
}

/*
	Name: function_a5de4bd1
	Namespace: ping
	Checksum: 0xF2435566
	Offset: 0x3F00
	Size: 0x274
	Parameters: 8
	Flags: Linked, Private
*/
function private function_a5de4bd1(local_client_num, unique_id, event_type, location, var_56bcf423, var_ec31db0f, var_113c24cb, var_d09a35d4)
{
	if(var_d09a35d4 == 2)
	{
		function_e0180998(local_client_num, var_ec31db0f, event_type, var_113c24cb);
		level.var_abaea458[var_113c24cb] = undefined;
	}
	else
	{
		if(var_d09a35d4 == 1)
		{
			function_1544c7f4(local_client_num, var_56bcf423, var_ec31db0f, event_type, unique_id);
			level.var_abaea458[var_113c24cb] = undefined;
		}
		else
		{
			function_807b75f0(local_client_num, var_ec31db0f, event_type);
			if(item_world_util::function_da09de95(var_113c24cb))
			{
				ent_num = item_world_util::function_c094ccd3(var_113c24cb);
				if(isdefined(ent_num))
				{
					item = getentbynum(local_client_num, ent_num);
				}
			}
			else
			{
				item = function_b1702735(var_113c24cb);
			}
			if(isdefined(item) && isdefined(item.var_a6762160))
			{
				item_name = item_world::get_item_name(item.var_a6762160);
				var_13272bfd = item_world::function_6fe428b3(item.var_a6762160);
				var_52c78c2c = item_world::function_c59d8d2b(item.var_a6762160);
			}
			obj_id = function_1793cfaf(local_client_num, unique_id, var_56bcf423, var_ec31db0f, event_type, location, level.ping.types[event_type].objective, #"hash_7eae2f9838aa52cf", item_name, undefined, var_52c78c2c);
			level.var_abaea458[var_113c24cb] = 1;
		}
	}
	function_85bffd7c(local_client_num, event_type, location, var_ec31db0f, obj_id, item_name, undefined, var_13272bfd, var_d09a35d4);
}

/*
	Name: function_35dba327
	Namespace: ping
	Checksum: 0x7710F2B9
	Offset: 0x4180
	Size: 0x3AC
	Parameters: 8
	Flags: Linked, Private
*/
function private function_35dba327(local_client_num, unique_id, event_type, location, var_56bcf423, var_ec31db0f, obj_id, var_d09a35d4)
{
	if(var_d09a35d4 != 0)
	{
		function_e0180998(local_client_num, var_ec31db0f, event_type, obj_id);
	}
	else
	{
		function_807b75f0(local_client_num, var_ec31db0f, event_type);
		function_85bffd7c(local_client_num, event_type, location, var_ec31db0f, obj_id, undefined, undefined, undefined, var_d09a35d4);
		var_55b682f2 = function_288ec082(local_client_num, obj_id);
		var_ec131a0a = function_a00c5167(local_client_num, obj_id);
		var_c3fe48ea = undefined;
		if(var_ec131a0a == #"friendly")
		{
			var_c3fe48ea = 3;
			if(sessionmodeiszombiesgame())
			{
				var_52c78c2c = function_5a9279ba(local_client_num, obj_id);
				battlechatter::function_f47a0e3b(local_client_num, var_56bcf423, var_52c78c2c);
			}
		}
		else
		{
			if(var_ec131a0a == #"neutral")
			{
				var_c3fe48ea = 0;
			}
			else
			{
				var_c3fe48ea = 0;
			}
			var_52c78c2c = function_5a9279ba(local_client_num, obj_id);
			battlechatter::function_f47a0e3b(local_client_num, var_56bcf423, var_52c78c2c);
		}
		var_6d305537 = {#hash_52c78c2c:var_52c78c2c, #hash_638e268e:function_5947d757(event_type), #event_type:event_type, #hash_c3fe48ea:var_c3fe48ea, #hash_c232a3ca:var_55b682f2, #acknowledgements:[], #unique_id:unique_id, #obj_id:obj_id};
		if(!isdefined(level.var_907386c0[local_client_num][var_ec31db0f][var_6d305537.var_638e268e]))
		{
			level.var_907386c0[local_client_num][var_ec31db0f][var_6d305537.var_638e268e] = [];
		}
		else if(!isarray(level.var_907386c0[local_client_num][var_ec31db0f][var_6d305537.var_638e268e]))
		{
			level.var_907386c0[local_client_num][var_ec31db0f][var_6d305537.var_638e268e] = array(level.var_907386c0[local_client_num][var_ec31db0f][var_6d305537.var_638e268e]);
		}
		level.var_907386c0[local_client_num][var_ec31db0f][var_6d305537.var_638e268e][level.var_907386c0[local_client_num][var_ec31db0f][var_6d305537.var_638e268e].size] = var_6d305537;
		if(var_55b682f2 != #"")
		{
			function_5300c425(local_client_num, var_56bcf423, #"hash_425505c8da16de0a", var_55b682f2, undefined);
		}
	}
}

/*
	Name: function_83751d93
	Namespace: ping
	Checksum: 0x4E73F1CF
	Offset: 0x4538
	Size: 0x764
	Parameters: 8
	Flags: Linked, Private
*/
function private function_83751d93(local_client_num, unique_id, event_type, location, var_56bcf423, var_ec31db0f, var_d4f0ac6e, var_d09a35d4)
{
	var_b2f64e7 = undefined;
	name = undefined;
	image = undefined;
	if(var_d09a35d4 == 2)
	{
		function_e0180998(local_client_num, var_ec31db0f, event_type, var_d4f0ac6e);
	}
	else
	{
		if(var_d09a35d4 == 1)
		{
			function_1544c7f4(local_client_num, var_56bcf423, var_ec31db0f, event_type, unique_id);
		}
		else
		{
			function_807b75f0(local_client_num, var_ec31db0f, event_type);
			var_6e08853c = event_type === 9;
			if(var_6e08853c)
			{
				ent = function_8608b8fd(var_d4f0ac6e);
			}
			else
			{
				ent = getentbynum(local_client_num, var_d4f0ac6e);
			}
			if(isdefined(ent))
			{
				location = ent.origin;
				if(!isdefined(ent.var_10434c60))
				{
					ent.var_10434c60 = 1;
					ent callback::add_entity_callback(#"death", &function_f4f18dac);
				}
				if(!isdefined(ent.var_fc558e74))
				{
					ent.var_fc558e74 = level.var_a0b1f787[ent.model];
				}
				name = (isdefined(level.var_2d1b0ac[ent.var_fc558e74]) ? level.var_2d1b0ac[ent.var_fc558e74] : undefined);
				if(isfunctionptr(name))
				{
					name = [[name]](ent);
				}
				image = (isdefined(level.var_f8c1279b[ent.var_fc558e74]) ? level.var_f8c1279b[ent.var_fc558e74] : undefined);
				var_52c78c2c = (isdefined(level.var_3cbb97[ent.var_fc558e74]) ? level.var_3cbb97[ent.var_fc558e74] : undefined);
				if(ent.var_fc558e74 === "mimic_prop_spawn" && isdefined(ent.item) && isdefined(ent.item.var_a6762160))
				{
					name = item_world::get_item_name(ent.item.var_a6762160);
					image = item_world::function_6fe428b3(ent.item.var_a6762160);
					var_52c78c2c = item_world::function_c59d8d2b(ent.item.var_a6762160);
				}
				if(!var_6e08853c)
				{
					var_166a2084 = ent getpointinbounds(0, 0, 1);
					var_da008149 = ent getpointinbounds(0, 0, 0);
					var_b2f64e7 = var_166a2084[2] - var_da008149[2];
					var_b2f64e7 = var_b2f64e7 + (isdefined(level.var_3fc6a555[ent.var_fc558e74]) ? level.var_3fc6a555[ent.var_fc558e74] : 0);
				}
				if(ent.var_fc558e74 === "double_door" || ent.var_fc558e74 === "power_double_door")
				{
					var_c25008cf = struct::get_array("ping_objective_ent", "script_noteworthy");
					var_1cbbe873 = [];
					if(var_c25008cf.size > 0)
					{
						foreach(struct in var_c25008cf)
						{
							if(struct.origin[2] > ent.origin[2])
							{
								if(!isdefined(var_1cbbe873))
								{
									var_1cbbe873 = [];
								}
								else if(!isarray(var_1cbbe873))
								{
									var_1cbbe873 = array(var_1cbbe873);
								}
								var_1cbbe873[var_1cbbe873.size] = struct;
							}
						}
						var_9aedf60e = arraygetclosest(ent.origin, var_1cbbe873);
						location = var_9aedf60e.origin;
						var_b2f64e7 = undefined;
						ent = undefined;
					}
					if(var_1cbbe873.size == 0)
					{
						/#
							print("");
						#/
					}
				}
			}
			else
			{
				return;
			}
			if(var_6e08853c || ent.var_fc558e74 === "barricade")
			{
				obj_id = function_1793cfaf(local_client_num, unique_id, var_56bcf423, var_ec31db0f, event_type, location, level.ping.types[event_type].objective, #"hash_5052920a34135f31", name, undefined, var_52c78c2c, undefined, -1, var_d4f0ac6e);
			}
			else
			{
				obj_id = function_1793cfaf(local_client_num, unique_id, var_56bcf423, var_ec31db0f, event_type, location, level.ping.types[event_type].objective, #"hash_5052920a34135f31", name, undefined, var_52c78c2c, ent, -1, var_d4f0ac6e);
			}
		}
	}
	/#
		if(getdvar(#"hash_3bf43b4b79d1712a", 0))
		{
			debugstar(location, 20, (0, 0, 1));
			if(isdefined(var_b2f64e7))
			{
				debugstar(location + (0, 0, var_b2f64e7), 20, (0, 1, 0));
			}
		}
	#/
	function_85bffd7c(local_client_num, event_type, location, var_ec31db0f, obj_id, name, var_b2f64e7, image, var_d09a35d4);
}

/*
	Name: function_f4f18dac
	Namespace: ping
	Checksum: 0xD2403A57
	Offset: 0x4CA8
	Size: 0x54
	Parameters: 2
	Flags: Linked
*/
function function_f4f18dac(local_client_num, ent)
{
	event_types = [1:9, 0:8];
	function_577f2e87(local_client_num, ent, event_types);
}

/*
	Name: function_652f5160
	Namespace: ping
	Checksum: 0x7064BD6F
	Offset: 0x4D08
	Size: 0x4C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_652f5160(local_client_num, ent)
{
	event_types = [0:10];
	function_577f2e87(local_client_num, ent, event_types);
}

/*
	Name: function_577f2e87
	Namespace: ping
	Checksum: 0xADA50158
	Offset: 0x4D60
	Size: 0x168
	Parameters: 3
	Flags: Linked, Private
*/
function private function_577f2e87(local_client_num, ent, event_types)
{
	/#
		/#
			assert(isdefined(event_types), "");
		#/
	#/
	var_fe241f9b = level.var_907386c0.size;
	if(!isdefined(ent))
	{
		ent = self;
	}
	ent_num = ent getentitynumber();
	for(client_num = 0; client_num < var_fe241f9b; client_num++)
	{
		var_5cbd6e72 = level.var_907386c0[client_num].size;
		for(var_81ff68ad = 0; var_81ff68ad < var_5cbd6e72; var_81ff68ad++)
		{
			foreach(event_type in event_types)
			{
				function_b15bbdd1(client_num, var_81ff68ad, event_type, ent_num);
			}
		}
	}
}

/*
	Name: function_b7306aa
	Namespace: ping
	Checksum: 0x9C259063
	Offset: 0x4ED0
	Size: 0x34C
	Parameters: 8
	Flags: Linked, Private
*/
function private function_b7306aa(local_client_num, unique_id, event_type, location, var_56bcf423, var_ec31db0f, var_d4f0ac6e, var_d09a35d4)
{
	var_b2f64e7 = undefined;
	name = undefined;
	if(var_d09a35d4 == 2)
	{
		function_e0180998(local_client_num, var_ec31db0f, event_type, var_d4f0ac6e);
	}
	else
	{
		if(var_d09a35d4 == 1)
		{
			function_1544c7f4(local_client_num, var_56bcf423, var_ec31db0f, event_type, unique_id);
		}
		else
		{
			function_807b75f0(local_client_num, var_ec31db0f, event_type);
			ent = getentbynum(local_client_num, var_d4f0ac6e);
			if(!isdefined(ent))
			{
				/#
					println("");
				#/
				return;
			}
			location = ent.origin;
			var_ea6fedda = level.ping.var_1220e585;
			if(!isdefined(ent.var_10434c60))
			{
				ent.var_10434c60 = 1;
				ent callback::add_entity_callback(#"death", &function_652f5160);
			}
			ainame = ent function_7f0363e8(local_client_num, 1);
			if(ainame != "")
			{
				name = ainame;
			}
			image = undefined;
			var_52c78c2c = undefined;
			settingsbundle = ent ai::function_9139c839();
			if(isdefined(settingsbundle))
			{
				category = settingsbundle.category;
				if(isdefined(category))
				{
					switch(category)
					{
						case "boss":
						{
							var_52c78c2c = #"hash_2238f6ae2f9c8847";
							break;
						}
						case "elite":
						{
							var_52c78c2c = #"hash_75c2910f28185f25";
							break;
						}
						case "special":
						{
							var_52c78c2c = #"hash_34a0c6f7267b8ba5";
							break;
						}
					}
				}
			}
			obj_id = function_1793cfaf(local_client_num, unique_id, var_56bcf423, var_ec31db0f, event_type, location, level.ping.types[event_type].objective, #"hash_5052920a34135f31", name, undefined, var_52c78c2c, ent, var_ea6fedda, var_d4f0ac6e);
		}
	}
	function_85bffd7c(local_client_num, event_type, location, var_ec31db0f, obj_id, name, var_b2f64e7, image, var_d09a35d4);
}

/*
	Name: function_f2e6b227
	Namespace: ping
	Checksum: 0x1C8C7CEA
	Offset: 0x5228
	Size: 0x204
	Parameters: 7
	Flags: Linked, Private
*/
function private function_f2e6b227(local_client_num, unique_id, event_type, var_56bcf423, var_ec31db0f, var_5172fec0, var_d09a35d4)
{
	result = function_d8d7e32(unique_id, var_5172fec0, &function_935e5b46, var_ec31db0f);
	if(isdefined(result))
	{
		var_d0b9da93 = result.ping;
	}
	if(isdefined(var_d0b9da93))
	{
		index = array::find(var_d0b9da93.acknowledgements, var_ec31db0f);
		if(var_d09a35d4 != 0 && isdefined(index))
		{
			array::remove_index(var_d0b9da93.acknowledgements, index);
			var_834e72f6 = 1;
		}
		else if(var_d09a35d4 == 0 && !isdefined(index))
		{
			array::add(var_d0b9da93.acknowledgements, var_ec31db0f);
			var_834e72f6 = 1;
			if(isdefined(var_d0b9da93.var_c232a3ca) && var_d0b9da93.var_c232a3ca != #"")
			{
				function_5300c425(unique_id, var_56bcf423, #"hash_417da90934e51345", var_d0b9da93.var_c232a3ca, undefined);
			}
			battlechatter::function_f47a0e3b(unique_id, var_56bcf423, function_d87cb3c7(var_d0b9da93.var_52c78c2c));
		}
		if(is_true(var_834e72f6))
		{
			function_85bffd7c(unique_id, event_type, undefined, var_ec31db0f, var_d0b9da93.obj_id, undefined, undefined, undefined, var_d09a35d4);
		}
	}
}

/*
	Name: function_4b08d302
	Namespace: ping
	Checksum: 0xD07FBBAB
	Offset: 0x5438
	Size: 0x74
	Parameters: 3
	Flags: Linked, Private
*/
function private function_4b08d302(local_client_num, var_56bcf423, var_ee3c60e)
{
	color = function_daee0412(local_client_num, var_56bcf423);
	function_c79ecd60(local_client_num, var_56bcf423 getplayername(), color, undefined, undefined, undefined, undefined, var_ee3c60e, undefined);
}

/*
	Name: function_892476d5
	Namespace: ping
	Checksum: 0xE3729885
	Offset: 0x54B8
	Size: 0xB8
	Parameters: 2
	Flags: Linked, Private
*/
function private function_892476d5(local_client_num, var_ec31db0f)
{
	foreach(var_638e268e in getarraykeys(level.var_907386c0[local_client_num][var_ec31db0f]))
	{
		function_ccc05112(local_client_num, var_ec31db0f, var_638e268e);
	}
}

/*
	Name: clear_all_pings
	Namespace: ping
	Checksum: 0xB291417
	Offset: 0x5578
	Size: 0xA0
	Parameters: 1
	Flags: Linked, Private
*/
function private clear_all_pings(local_client_num)
{
	foreach(var_3866572e in level.var_907386c0[local_client_num])
	{
		function_892476d5(local_client_num, clientnum);
	}
}

/*
	Name: function_9b79b59f
	Namespace: ping
	Checksum: 0x6A5E7AB7
	Offset: 0x5620
	Size: 0x178
	Parameters: 2
	Flags: Linked, Private
*/
function private function_9b79b59f(local_client_num, var_56bcf423)
{
	var_57841975 = getuimodelvalue(getuimodel(function_1df4c3b0(local_client_num, #"hud_items"), "yaw"));
	var_7a6279d3 = getlocalclientangles(local_client_num)[1];
	if(isdefined(var_57841975) && (isdefined(var_7a6279d3) && isdefined(var_56bcf423.angles)))
	{
		var_5bc88636 = var_7a6279d3 - var_57841975;
		var_e0fab70 = var_56bcf423.angles[1] - var_5bc88636;
		if(var_e0fab70 < 0)
		{
			var_e0fab70 = abs(var_e0fab70);
		}
		else
		{
			var_e0fab70 = abs(var_e0fab70 - 360);
		}
		var_cf800efa = (floor((var_e0fab70 + 7.5) / 15)) * 15;
		if(var_cf800efa == 360)
		{
			var_cf800efa = 0;
		}
		return "pingDanger" + var_cf800efa;
	}
	return undefined;
}

/*
	Name: function_49109f3
	Namespace: ping
	Checksum: 0xC97DCE86
	Offset: 0x57A0
	Size: 0xA6
	Parameters: 3
	Flags: Linked, Private
*/
function private function_49109f3(local_client_num, ent, var_56bcf423)
{
	occupants = ent getvehoccupants(local_client_num);
	if(isdefined(occupants) && occupants.size > 0 && occupants[0].team != var_56bcf423.team)
	{
		return "pingVehicleEnemy";
	}
	if(isdefined(ent.settings))
	{
		return ent.settings.var_e9898330;
	}
	return undefined;
}

/*
	Name: function_43569f3b
	Namespace: ping
	Checksum: 0x905AF79
	Offset: 0x5850
	Size: 0xB8
	Parameters: 1
	Flags: Linked, Private
*/
function private function_43569f3b(ent)
{
	var_52c78c2c = ent.weapon.var_e9898330;
	if(isdefined(var_52c78c2c) && var_52c78c2c != "" && ent.flag[#"enemy"] === 1)
	{
		if(issubstr(var_52c78c2c, "Lethal"))
		{
			if(var_52c78c2c != "pingGearLethalLandmine")
			{
				var_52c78c2c = "pingGearLethalGeneric";
			}
		}
		var_52c78c2c = var_52c78c2c + "Enemy";
	}
	return var_52c78c2c;
}

/*
	Name: function_d87cb3c7
	Namespace: ping
	Checksum: 0xD2AEB732
	Offset: 0x5910
	Size: 0x16A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d87cb3c7(var_11a7485e)
{
	if(isdefined(var_11a7485e) && var_11a7485e != "" && !ishash(var_11a7485e))
	{
		var_212af42f = getsubstr(var_11a7485e, 4, var_11a7485e.size);
		if(var_212af42f == "Location")
		{
			return "pingLocationAcknowledge";
		}
		if(strstartswith(var_212af42f, "Danger"))
		{
			return "pingDangerAcknowledge";
		}
		if(issubstr(var_212af42f, "Enemy"))
		{
			return "pingGearEnemyAcknowledge";
		}
		if(strstartswith(var_212af42f, "Item") || strstartswith(var_212af42f, "Gear"))
		{
			return "pingItemAcknowledge";
		}
		if(strstartswith(var_212af42f, "Objective"))
		{
			return "pingObjectiveAcknowledge";
		}
	}
	return undefined;
}

