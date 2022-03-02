#using script_13da4e6b98ca81a1;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_d150537f;

/*
	Name: function_7d1a3c7a
	Namespace: namespace_d150537f
	Checksum: 0xD962A210
	Offset: 0x118
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7d1a3c7a()
{
	level notify(315232629);
}

/*
	Name: init
	Namespace: namespace_d150537f
	Checksum: 0x9331EDB7
	Offset: 0x138
	Size: 0x260
	Parameters: 0
	Flags: None
*/
function init()
{
	level.othervisuals = [];
	clientfield::register("scriptmover", "zone_id", 1, 5, "int", &function_b25b095f, 0, 0);
	clientfield::register("scriptmover", "zone_state", 1, 3, "int", &function_cb737c49, 0, 0);
	fields = getmapfields();
	level.var_117b4a3a = [];
	level.var_117b4a3a[0] = (isdefined(fields.var_306136ca) ? fields.var_306136ca : #"hash_280d5153e1276d");
	level.var_117b4a3a[1] = (isdefined(fields.var_e1ef0bf1) ? fields.var_e1ef0bf1 : #"hash_4b1a3a0285bea14d");
	level.var_117b4a3a[2] = (isdefined(fields.var_97278b57) ? fields.var_97278b57 : #"hash_36a94457406aea0e");
	level.var_117b4a3a[3] = (isdefined(fields.var_29209af9) ? fields.var_29209af9 : #"hash_5a60154937b01557");
	callback::on_spawned(&function_df78674f);
	callback::function_e9e16e2f(&function_330a13a6);
	callback::function_4f6cafea(&function_330a13a6);
	callback::add_callback(#"hash_34e39ee0c9fa0092", &function_3022f6ba);
	setup_zones(0);
	level.var_5ff510b = [];
}

/*
	Name: setup_zones
	Namespace: namespace_d150537f
	Checksum: 0x914C13E2
	Offset: 0x3A0
	Size: 0x1A8
	Parameters: 1
	Flags: None
*/
function setup_zones(local_client_num)
{
	level.zones = [];
	triggers = getentarray(local_client_num, "koth_zone_trigger", "targetname");
	triggers = arraycombine(triggers, getentarray(local_client_num, "koth_zone_trigger", "script_noteworthy"));
	zones = struct::get_array("koth_zone_center", "targetname");
	foreach(zone in zones)
	{
		zone.state = 0;
		zone.trig = undefined;
		for(j = 0; j < triggers.size; j++)
		{
			if(triggers[j] istouching(zone.origin))
			{
				zone.trig = triggers[j];
				zone.var_b76aa8 = j;
				break;
			}
		}
		level.zones[zone.script_index] = zone;
	}
}

/*
	Name: function_40990bae
	Namespace: namespace_d150537f
	Checksum: 0x7F3ABC96
	Offset: 0x550
	Size: 0x44
	Parameters: 3
	Flags: None
*/
function function_40990bae(local_client_num, obj_id, zone_index)
{
	level.var_5ff510b[zone_index] = obj_id;
	function_dd2493cc(local_client_num, obj_id, zone_index);
}

/*
	Name: function_3022f6ba
	Namespace: namespace_d150537f
	Checksum: 0x6F46E2A3
	Offset: 0x5A0
	Size: 0x138
	Parameters: 1
	Flags: None
*/
function function_3022f6ba(eventstruct)
{
	local_client_num = eventstruct.localclientnum;
	obj_id = eventstruct.id;
	ent = eventstruct.entity_num;
	if(isdefined(ent))
	{
		ent.objectiveid = obj_id;
	}
	if(isdefined(ent.script_index))
	{
		function_40990bae(local_client_num, obj_id, ent.script_index);
	}
	else if(isdefined(level.var_5ff510b))
	{
		foreach(objid in level.var_5ff510b)
		{
			if(objid == obj_id)
			{
				function_dd2493cc(local_client_num, obj_id, script_index);
			}
		}
	}
}

/*
	Name: function_dd2493cc
	Namespace: namespace_d150537f
	Checksum: 0x182A18E7
	Offset: 0x6E0
	Size: 0x300
	Parameters: 3
	Flags: None
*/
function function_dd2493cc(local_client_num, objid, zone_index)
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
		var_4bb78aa3 = function_8147db19(local_client_num, objid, friendlyteam);
		var_c7fc4f01 = function_6f7ac7fe(local_client_num, objid, friendlyteam);
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
	if(isdefined(level.othervisuals[zone_index]))
	{
		foreach(entid in level.othervisuals[zone_index])
		{
			entity = getentbynum(local_client_num, entid);
			if(!isdefined(entity))
			{
				continue;
			}
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

/*
	Name: function_330a13a6
	Namespace: namespace_d150537f
	Checksum: 0x550A8CDF
	Offset: 0x9E8
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function function_330a13a6(params)
{
	function_df78674f(params.localclientnum);
}

/*
	Name: function_df78674f
	Namespace: namespace_d150537f
	Checksum: 0x4D56C394
	Offset: 0xA18
	Size: 0xF8
	Parameters: 1
	Flags: None
*/
function function_df78674f(localclientnum)
{
	if(isdefined(localclientnum))
	{
		foreach(zone in level.zones)
		{
			obj_id = level.var_5ff510b[zone.script_index];
			if(!isdefined(obj_id))
			{
				obj_id = serverobjective_getobjective(localclientnum, #"hardpoint");
			}
			if(isdefined(obj_id))
			{
				function_dd2493cc(localclientnum, obj_id, zone.script_index);
			}
		}
	}
}

/*
	Name: function_cb737c49
	Namespace: namespace_d150537f
	Checksum: 0x18D4E052
	Offset: 0xB18
	Size: 0x94
	Parameters: 7
	Flags: None
*/
function function_cb737c49(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump != fieldname)
	{
		zone = level.zones[self.script_index];
		if(isdefined(zone))
		{
			zone.state = bwastimejump;
			zone function_9b650f0d(binitialsnap);
		}
	}
}

/*
	Name: function_b25b095f
	Namespace: namespace_d150537f
	Checksum: 0x1A04D96A
	Offset: 0xBB8
	Size: 0x374
	Parameters: 7
	Flags: None
*/
function function_b25b095f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump != fieldname || !isdefined(self.script_index))
	{
		script_index = bwastimejump;
		self.script_index = script_index;
		if(!isdefined(level.othervisuals[script_index]))
		{
			level.othervisuals[script_index] = [];
		}
		entnum = self getentitynumber();
		if(!isdefined(self.objectiveid))
		{
			if(!isinarray(level.othervisuals[script_index], entnum))
			{
				if(!isdefined(level.othervisuals[script_index]))
				{
					level.othervisuals[script_index] = [];
				}
				else if(!isarray(level.othervisuals[script_index]))
				{
					level.othervisuals[script_index] = array(level.othervisuals[script_index]);
				}
				if(!isinarray(level.othervisuals[script_index], entnum))
				{
					level.othervisuals[script_index][level.othervisuals[script_index].size] = entnum;
				}
				iscodcaster = codcaster::function_b8fe9b52(binitialsnap);
				suffix = (iscodcaster ? "_codcaster" : "");
				rob = level.var_117b4a3a[0] + suffix;
				if(!self function_d2503806(rob))
				{
					self function_bf9d3071(rob);
				}
				if(iscodcaster)
				{
					codcaster::function_773f6e31(binitialsnap, self, rob, 0);
				}
				else
				{
					util::function_f5b24d2d(binitialsnap, self, rob, 0);
				}
			}
		}
		else
		{
			if(!isdefined(level.othervisuals[script_index]))
			{
				level.othervisuals[script_index] = [];
			}
			else if(!isarray(level.othervisuals[script_index]))
			{
				level.othervisuals[script_index] = array(level.othervisuals[script_index]);
			}
			if(!isinarray(level.othervisuals[script_index], entnum))
			{
				level.othervisuals[script_index][level.othervisuals[script_index].size] = entnum;
			}
			function_40990bae(binitialsnap, self.objectiveid, script_index);
		}
	}
}

/*
	Name: function_9b650f0d
	Namespace: namespace_d150537f
	Checksum: 0xFC7FEAB4
	Offset: 0xF38
	Size: 0x9C
	Parameters: 1
	Flags: None
*/
function function_9b650f0d(local_client_num)
{
	if(!isdefined(self.trig) || is_false(getgametypesetting(#"hash_4091f2d0019b1f4a")))
	{
		return;
	}
	if(self.state == 1)
	{
		self.trig function_c06a8682(local_client_num);
	}
	else
	{
		self.trig function_c6c4ce9f(local_client_num);
	}
}

