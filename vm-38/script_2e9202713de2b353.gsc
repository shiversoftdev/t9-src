#using script_dc59353021baee1;
#using script_746267f0669c40ae;
#using script_1a9763988299e68d;
#using script_2a5bf5b4a00cee0d;
#using script_40f967ad5d18ea74;
#using script_47851dbeea22fe66;
#using script_164a456ce05c3483;
#using script_4d748e58ce25b60c;
#using script_5f20d3b434d24884;
#using script_1b0b07ff57d1dde3;
#using script_1ee011cd0961afd7;
#using script_5701633066d199f2;
#using script_1b01e95a6b5270fd;
#using script_17dcb1172e441bf6;
#using script_74a56359b7d02ab6;
#using script_5549681e1669c11a;
#using script_1306aefca48fc8b6;
#using script_73ad7687b437e468;
#using script_48e04a393ec6d855;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace namespace_1dc364c0;

/*
	Name: function_393c7db7
	Namespace: namespace_1dc364c0
	Checksum: 0x46229526
	Offset: 0x248
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_393c7db7()
{
	level notify(488687101);
}

/*
	Name: init
	Namespace: namespace_1dc364c0
	Checksum: 0x528D29F5
	Offset: 0x268
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("scriptmover", "dungeon_set_roomID", 1, 8, "int");
	clientfield::register("scriptmover", "dungeon_set_explore_state", 1, 2, "int");
	namespace_c004634e::init();
	level.var_40450ea6 = &function_e71841a;
}

/*
	Name: function_cb06f399
	Namespace: namespace_1dc364c0
	Checksum: 0xFEEE4921
	Offset: 0x300
	Size: 0x3CA
	Parameters: 0
	Flags: Linked
*/
function function_cb06f399()
{
	if(isdefined(self.var_cd42b9c0))
	{
		self.var_cd42b9c0 delete();
	}
	if(isdefined(self.walldecor))
	{
		foreach(item in self.walldecor)
		{
			if(isdefined(item.fx))
			{
				item.fx delete();
			}
			item delete();
		}
		self.walldecor = [];
	}
	if(isdefined(self.floordecor))
	{
		foreach(item in self.floordecor)
		{
			if(isdefined(item.fx))
			{
				item.fx delete();
			}
			item delete();
		}
		self.floordecor = [];
	}
	if(isdefined(self.loot))
	{
		foreach(item in self.loot)
		{
			item.pickup = undefined;
		}
		self.loot = [];
	}
	if(isdefined(self.npcs))
	{
		foreach(npc in self.npcs)
		{
			if(isdefined(npc))
			{
				npc thread namespace_ec06fe4a::function_570729f0(0.1);
			}
		}
		self.loot = [];
	}
	if(isdefined(self.wallbuy))
	{
		foreach(item in self.wallbuy)
		{
			if(isdefined(item.trigger))
			{
				if(isdefined(item.trigger.var_ee2cd39c))
				{
					item.trigger.var_ee2cd39c delete();
				}
				item.trigger delete();
			}
		}
		self.wallbuy = [];
	}
}

/*
	Name: function_e71841a
	Namespace: namespace_1dc364c0
	Checksum: 0x158A2588
	Offset: 0x6D8
	Size: 0xF30
	Parameters: 0
	Flags: Linked
*/
function function_e71841a()
{
	level.doa.var_4cdaff39[self.template.rg_room]++;
	self.var_d8d445c4 = &function_cb06f399;
	self.walldecor = [];
	self.floordecor = [];
	self.loot = [];
	self.npcs = [];
	self.wallbuy = [];
	args = strtok(self.targetname, "rg_room_");
	self clientfield::set("dungeon_set_roomID", int(args[0]) + 1);
	var_f445d580 = self namespace_f27a9d0d::function_5165998("type", "room_center");
	if(isdefined(var_f445d580.script_parameters))
	{
		if(issubstr(var_f445d580.script_parameters, "tweakcam"))
		{
			self.tweakcam = 1;
			args = strtok(var_f445d580.script_parameters, ";");
			if(args.size > 1)
			{
				self.var_95773ba5 = int(float(args[1]) * (32 - 1));
			}
			else
			{
				self.var_95773ba5 = 32 - 1;
			}
		}
	}
	var_eebf1bb0 = self namespace_f27a9d0d::function_cee62dac("type", "room_connector");
	foreach(tag in var_eebf1bb0)
	{
		level.doa.var_d1501142[level.doa.var_d1501142.size] = tag.origin;
	}
	var_c9bdb63f = self namespace_f27a9d0d::function_cee62dac("type", "spawner");
	foreach(var_f6198c5b in var_c9bdb63f)
	{
		if(var_f6198c5b.script_noteworthy === "generator")
		{
			a_toks = strtok(var_f6198c5b.script_string, ",");
			var_44eec847 = a_toks[0];
			if(a_toks.size >= 2)
			{
				radius = int(a_toks[1]);
			}
			else
			{
				radius = 800;
			}
			if(a_toks.size >= 3)
			{
				height = int(a_toks[2]);
			}
			if(a_toks.size >= 4)
			{
				var_8a14a619 = int(a_toks[3]);
			}
			generator = namespace_c85a46fe::function_4c16ce2c(var_44eec847, var_f6198c5b.origin, var_f6198c5b.angles, radius, height, var_8a14a619, 2);
			if(isdefined(generator))
			{
				[[ generator ]]->function_75df0623(self);
			}
			continue;
		}
		if(var_f6198c5b.script_noteworthy === "npc")
		{
			if(!isdefined(var_f6198c5b.script_string))
			{
				continue;
			}
			spawndef = doa_enemy::function_d7c5adee(var_f6198c5b.script_string);
			if(isdefined(spawndef))
			{
				goalradius = 40;
				if(isdefined(var_f6198c5b.script_int))
				{
					goalradius = int(var_f6198c5b.script_int);
				}
				ai = doa_enemy::function_db55a448(spawndef, var_f6198c5b.origin);
				if(isdefined(ai))
				{
					ai.var_f906062a = 1;
					ai.var_76cb41b3 = 1;
					ai.goalradius = goalradius;
					self.npcs[self.npcs.size] = ai;
					ai.room = self;
					ai.engagementdistance = 1200;
					ai.var_a84a3d40 = sqr(ai.engagementdistance);
				}
			}
		}
	}
	var_c9bdb63f = self namespace_f27a9d0d::function_cee62dac("type", "lootspawn");
	foreach(var_f6198c5b in var_c9bdb63f)
	{
		level.doa.var_51400a66[level.doa.var_51400a66.size] = var_f6198c5b;
	}
	var_c9bdb63f = self namespace_f27a9d0d::function_cee62dac("type", "trap");
	foreach(var_f6198c5b in var_c9bdb63f)
	{
		level.doa.var_f5a14209[level.doa.var_f5a14209.size] = var_f6198c5b;
	}
	var_c9bdb63f = self namespace_f27a9d0d::function_cee62dac("type", "floordecor");
	foreach(var_f6198c5b in var_c9bdb63f)
	{
		if(var_f6198c5b.script_noteworthy === "dungeon_door")
		{
			add = 1;
			foreach(door in level.doa.var_a8a563fc)
			{
				distsq = distancesquared(var_f6198c5b.origin, door.origin);
				if(distsq < sqr(512))
				{
					add = 0;
					break;
				}
			}
			if(add)
			{
				level.doa.var_a8a563fc[level.doa.var_a8a563fc.size] = var_f6198c5b;
			}
			continue;
		}
		if(var_f6198c5b.script_noteworthy === "teleporter")
		{
			level.doa.var_c2648383[level.doa.var_c2648383.size] = var_f6198c5b;
			continue;
		}
		self.floordecor[self.floordecor.size] = namespace_c004634e::function_6a09928b(var_f6198c5b, #"floor");
	}
	var_c9bdb63f = self namespace_f27a9d0d::function_cee62dac("type", "walldecor");
	foreach(var_f6198c5b in var_c9bdb63f)
	{
		self.walldecor[self.walldecor.size] = namespace_c004634e::function_6a09928b(var_f6198c5b, #"wall");
	}
	var_c9bdb63f = self namespace_f27a9d0d::function_cee62dac("type", "wallbuy");
	foreach(var_f6198c5b in var_c9bdb63f)
	{
		if(!isdefined(var_f6198c5b.script_parameters))
		{
			continue;
		}
		var_5e62902b = spawnstruct();
		args = strtok(var_f6198c5b.script_parameters, ";");
		var_5e62902b.origin = var_f6198c5b.origin;
		var_5e62902b.type = args[0];
		if(var_5e62902b.type == #"room_warp")
		{
			/#
				assert(args.size >= 4, "");
			#/
			width = int(args[1]);
			length = int(args[2]);
			height = int(args[3]);
			var_5e62902b.trigger = namespace_ec06fe4a::spawntrigger("trigger_box", var_5e62902b.origin, 2, length, height, width);
			/#
				assert(isdefined(var_f6198c5b.script_noteworthy), "");
			#/
			var_5e62902b.room = namespace_5a917022::function_c8892b0f(var_f6198c5b.script_noteworthy);
			/#
				assert(isdefined(var_5e62902b.room), "");
			#/
			if(isdefined(args[4]))
			{
				var_5e62902b.trigger.var_ee2cd39c = namespace_ec06fe4a::function_e22ae9b3(var_5e62902b.origin, args[4], var_f6198c5b.angles, "room_warp" + var_5e62902b.origin);
				if(isdefined(var_5e62902b.trigger.var_ee2cd39c))
				{
					var_5e62902b.trigger.var_ee2cd39c notsolid();
					var_5e62902b.trigger.var_ee2cd39c hide();
					if(isdefined(args[5]))
					{
						scale = float(args[5]);
						var_5e62902b.trigger.var_ee2cd39c setscale(scale);
					}
				}
			}
			var_5e62902b.trigger.visited = 0;
			var_5e62902b.trigger.var_4200bfbf = [];
			foreach(var_6d929c4c in var_c9bdb63f)
			{
				if(isdefined(var_6d929c4c.script_parameters))
				{
					continue;
				}
				if(var_6d929c4c.targetname === var_f6198c5b.target)
				{
					if(!isdefined(var_5e62902b.trigger.var_4200bfbf))
					{
						var_5e62902b.trigger.var_4200bfbf = [];
					}
					else if(!isarray(var_5e62902b.trigger.var_4200bfbf))
					{
						var_5e62902b.trigger.var_4200bfbf = array(var_5e62902b.trigger.var_4200bfbf);
					}
					var_5e62902b.trigger.var_4200bfbf[var_5e62902b.trigger.var_4200bfbf.size] = var_6d929c4c;
				}
			}
			var_5e62902b.trigger thread namespace_5a917022::function_23ea6695(var_5e62902b.trigger, var_5e62902b.room);
		}
		self.wallbuy[self.wallbuy.size] = var_5e62902b;
	}
}

