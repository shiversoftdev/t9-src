#using script_13da4e6b98ca81a1;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace gunfight;

/*
	Name: function_aca880f2
	Namespace: gunfight
	Checksum: 0x34EB8BB
	Offset: 0x120
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_aca880f2()
{
	level notify(719345189);
}

/*
	Name: main
	Namespace: gunfight
	Checksum: 0x68FA105C
	Offset: 0x140
	Size: 0x2F8
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	clientfield::register("world", "activeTrigger", 1, 1, "int", &function_f789a70b, 0, 0);
	clientfield::register("scriptmover", "scriptid", 1, 1, "int", &function_e116df6c, 0, 0);
	clientfield::register("allplayers", "gunfight_pregame_rob", 9000, 1, "int", &function_f923f745, 0, 0);
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
	Name: function_f923f745
	Namespace: gunfight
	Checksum: 0x14571C2D
	Offset: 0x440
	Size: 0x8C
	Parameters: 7
	Flags: None
*/
function function_f923f745(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(codcaster::function_b8fe9b52(fieldname))
	{
		return;
	}
	if(bwastimejump)
	{
		self function_b72cd4c9(fieldname);
	}
	else
	{
		self function_f4497937(fieldname);
	}
}

/*
	Name: function_b72cd4c9
	Namespace: gunfight
	Checksum: 0x7B4BF6E1
	Offset: 0x4D8
	Size: 0xFC
	Parameters: 1
	Flags: Private
*/
function private function_b72cd4c9(localclientnum)
{
	self endon(#"death");
	self util::waittill_dobj(localclientnum);
	if(!isalive(self) || function_1cbf351b(localclientnum))
	{
		return;
	}
	var_fd9bf390 = function_9b3f0ed1(localclientnum);
	if(self.team !== var_fd9bf390 && game.state === #"pregame")
	{
		if(!self function_d2503806(#"hash_1dced6114b72a678"))
		{
			self function_bf9d3071(#"hash_1dced6114b72a678");
		}
	}
}

/*
	Name: function_f4497937
	Namespace: gunfight
	Checksum: 0x5C6AF5CA
	Offset: 0x5E0
	Size: 0x7C
	Parameters: 1
	Flags: Private
*/
function private function_f4497937(localclientnum)
{
	self endon(#"death");
	self util::waittill_dobj(localclientnum);
	if(!isdefined(self))
	{
		return;
	}
	if(self function_d2503806(#"hash_1dced6114b72a678"))
	{
		self function_5d482e78(#"hash_1dced6114b72a678");
	}
}

/*
	Name: function_3022f6ba
	Namespace: gunfight
	Checksum: 0xFDB510EB
	Offset: 0x668
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
	Checksum: 0x90053E12
	Offset: 0x6C0
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
				for(var_e8c72d8f = 0; var_e8c72d8f < 4; var_e8c72d8f++)
				{
					rob = level.var_117b4a3a[var_e8c72d8f] + suffix;
					if(entity function_d2503806(rob))
					{
						if(state != var_e8c72d8f)
						{
							entity function_5d482e78(rob);
						}
						continue;
					}
					if(state == var_e8c72d8f)
					{
						entity function_bf9d3071(rob);
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
	Checksum: 0xA60E9187
	Offset: 0x9D8
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
		self function_bf9d3071(level.var_117b4a3a[0]);
	}
}

/*
	Name: function_f789a70b
	Namespace: gunfight
	Checksum: 0xDFCAD4A1
	Offset: 0xB40
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

