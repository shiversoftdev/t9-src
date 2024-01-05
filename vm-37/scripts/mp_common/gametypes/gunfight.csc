#using scripts\core_common\util_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using script_13da4e6b98ca81a1;

#namespace gunfight;

/*
	Name: main
	Namespace: gunfight
	Checksum: 0x55D59350
	Offset: 0xF8
	Size: 0x300
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	clientfield::register("world", "activeTrigger", 1, 1, "int", &function_f789a70b, 0, 0);
	clientfield::register("scriptmover", "scriptid", 1, 1, "int", &function_e116df6c, 0, 0);
	callback::on_spawned(&on_player_spawned);
	callback::add_callback(#"on_game_playing", &on_game_playing);
	callback::add_callback(#"hash_34e39ee0c9fa0092", &function_3022f6ba);
	level.var_9c5e7d9 = #"hash_5b34830d9a8a7f52";
	level._effect[#"zoneedgemarker"] = [];
	level._effect[#"zoneedgemarker"][0] = #"hash_1f447aeb1973f7b6";
	level._effect[#"zoneedgemarker"][1] = #"hash_5c2ae9f4f331d4b9";
	level._effect[#"zoneedgemarker"][2] = #"hash_7d1b0f001ea88b82";
	level._effect[#"zoneedgemarker"][3] = #"hash_7981eb245ea536fc";
	fields = getmapfields();
	level.var_117b4a3a = [];
	level.var_117b4a3a[0] = (isdefined(fields.var_306136ca) ? fields.var_306136ca : #"hash_280d5153e1276d");
	level.var_117b4a3a[1] = (isdefined(fields.var_e1ef0bf1) ? fields.var_e1ef0bf1 : #"hash_4b1a3a0285bea14d");
	level.var_117b4a3a[2] = (isdefined(fields.var_97278b57) ? fields.var_97278b57 : #"hash_36a94457406aea0e");
	level.var_117b4a3a[3] = (isdefined(fields.var_29209af9) ? fields.var_29209af9 : #"hash_5a60154937b01557");
}

/*
	Name: on_player_spawned
	Namespace: gunfight
	Checksum: 0x65A67D54
	Offset: 0x400
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function on_player_spawned(localclientnum)
{
	self util::waittill_dobj(localclientnum);
	players = getplayers(localclientnum);
	if(isdefined(self))
	{
		self function_b72cd4c9(localclientnum);
	}
}

/*
	Name: on_game_playing
	Namespace: gunfight
	Checksum: 0x7A91CFEC
	Offset: 0x470
	Size: 0xB0
	Parameters: 1
	Flags: None
*/
function on_game_playing(struct)
{
	waittillframeend();
	localclientnum = struct.localclientnum;
	foreach(player in getplayers(localclientnum))
	{
		player function_f4497937(localclientnum);
	}
}

/*
	Name: function_b72cd4c9
	Namespace: gunfight
	Checksum: 0x25D06770
	Offset: 0x528
	Size: 0x11C
	Parameters: 1
	Flags: Private
*/
function private function_b72cd4c9(localclientnum)
{
	if(!isalive(self) || function_1cbf351b(localclientnum))
	{
		return;
	}
	var_fd9bf390 = function_9b3f0ed1(localclientnum);
	if(self.team !== var_fd9bf390 && game.state === #"pregame")
	{
		if(!self function_d2503806(#"hash_1dced6114b72a678"))
		{
			self playrenderoverridebundle(#"hash_1dced6114b72a678");
		}
	}
	else if(self function_d2503806(#"hash_1dced6114b72a678"))
	{
		self stoprenderoverridebundle(#"hash_1dced6114b72a678");
	}
}

/*
	Name: function_f4497937
	Namespace: gunfight
	Checksum: 0xB2E57CF8
	Offset: 0x650
	Size: 0x54
	Parameters: 1
	Flags: Private
*/
function private function_f4497937(localclientnum)
{
	if(!isdefined(self))
	{
		return;
	}
	if(self function_d2503806(#"hash_1dced6114b72a678"))
	{
		self stoprenderoverridebundle(#"hash_1dced6114b72a678");
	}
}

/*
	Name: function_3022f6ba
	Namespace: gunfight
	Checksum: 0x5A840A2C
	Offset: 0x6B0
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function function_3022f6ba(eventstruct)
{
	local_client_num = eventstruct.localclientnum;
	obj_id = eventstruct.id;
	function_dd2493cc(local_client_num, obj_id);
}

/*
	Name: function_dd2493cc
	Namespace: gunfight
	Checksum: 0xB6CC9C8C
	Offset: 0x708
	Size: 0x310
	Parameters: 2
	Flags: None
*/
function function_dd2493cc(local_client_num, objid)
{
	iscodcaster = codcaster::function_b8fe9b52(local_client_num);
	if(iscodcaster)
	{
		var_4bb78aa3 = function_8147db19(local_client_num, objid, #"allies");
		var_c7fc4f01 = function_8147db19(local_client_num, objid, #"axis");
	}
	else
	{
		friendlyteam = function_9b3f0ed1(local_client_num);
		enemyteam = util::get_enemy_team(friendlyteam);
		var_4bb78aa3 = function_8147db19(local_client_num, objid, friendlyteam);
		var_c7fc4f01 = function_8147db19(local_client_num, objid, enemyteam);
	}
	suffix = (iscodcaster ? "_codcaster" : "");
	state = 0;
	if(var_4bb78aa3)
	{
		state = 1;
	}
	if(var_c7fc4f01)
	{
		state = 2;
	}
	if(var_4bb78aa3 && var_c7fc4f01)
	{
		state = 3;
	}
	if(isdefined(level.othervisuals))
	{
		foreach(entid in level.othervisuals)
		{
			entity = getentbynum(local_client_num, entid);
			if(isdefined(entity))
			{
				for(si = 0; si < 4; si++)
				{
					rob = level.var_117b4a3a[si] + suffix;
					if(entity function_d2503806(rob))
					{
						if(state != si)
						{
							entity stoprenderoverridebundle(rob);
						}
						continue;
					}
					if(state == si)
					{
						entity playrenderoverridebundle(rob);
						if(iscodcaster)
						{
							codcaster::function_773f6e31(local_client_num, entity, rob, state);
							continue;
						}
						util::function_f5b24d2d(local_client_num, entity, rob, state);
					}
				}
			}
		}
	}
}

/*
	Name: function_e116df6c
	Namespace: gunfight
	Checksum: 0x1B3B3C1D
	Offset: 0xA20
	Size: 0x15C
	Parameters: 7
	Flags: None
*/
function function_e116df6c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(level.othervisuals))
	{
		level.othervisuals = [];
	}
	if(!isdefined(level.othervisuals))
	{
		level.othervisuals = [];
	}
	else if(!isarray(level.othervisuals))
	{
		level.othervisuals = array(level.othervisuals);
	}
	if(!isinarray(level.othervisuals, self getentitynumber()))
	{
		level.othervisuals[level.othervisuals.size] = self getentitynumber();
	}
	if(!self function_d2503806(level.var_117b4a3a[0]))
	{
		self playrenderoverridebundle(level.var_117b4a3a[0]);
	}
}

/*
	Name: function_f789a70b
	Namespace: gunfight
	Checksum: 0xBFE1C83D
	Offset: 0xB88
	Size: 0x114
	Parameters: 7
	Flags: None
*/
function function_f789a70b(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(is_false(getgametypesetting(#"hash_4091f2d0019b1f4a")))
	{
		return;
	}
	if(!isdefined(level.var_36230b7e))
	{
		level.var_36230b7e = getentarray(fieldname, "gunfight_zone_trigger", "targetname");
	}
	if(level.var_36230b7e.size > 0)
	{
		if(bwastimejump == 1)
		{
			level.var_36230b7e[0] function_c06a8682(fieldname);
		}
		else
		{
			level.var_36230b7e[0] function_c6c4ce9f(fieldname);
		}
	}
}

