#using script_47851dbeea22fe66;
#using script_774302f762d76254;
#using script_1ee011cd0961afd7;
#using script_634ae70c663d1cc9;
#using script_17dcb1172e441bf6;
#using script_2a5bf5b4a00cee0d;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_9529b92d;

/*
	Name: init
	Namespace: namespace_9529b92d
	Checksum: 0x80F724D1
	Offset: 0x268
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function init()
{
}

/*
	Name: main
	Namespace: namespace_9529b92d
	Checksum: 0x1271B704
	Offset: 0x278
	Size: 0x16
	Parameters: 0
	Flags: Linked
*/
function main()
{
	level.doa.var_6733605b = [];
}

/*
	Name: function_e073d92f
	Namespace: namespace_9529b92d
	Checksum: 0x2BF91BDC
	Offset: 0x298
	Size: 0x186
	Parameters: 0
	Flags: Linked
*/
function function_e073d92f()
{
	self notify("3b218896f68a5246");
	self endon("3b218896f68a5246");
	self thread namespace_268747c0::function_978c05b5();
	result = undefined;
	result = self waittill(#"hash_3e251384a5400dce");
	if(is_true(self.paged) && is_true(result.var_760a0807))
	{
		arrayremovevalue(level.doa.var_6733605b, self);
		namespace_1e25ad94::debugmsg("Deleting Pressure Plate trap permenently at:" + self.origin);
	}
	util::wait_network_frame();
	if(isdefined(self.trigger))
	{
		self.trigger namespace_268747c0::function_54f185a();
		self.trigger = undefined;
	}
	if(isdefined(self.script_model))
	{
		self.script_model delete();
		self.script_model = undefined;
	}
	if(isdefined(self.var_1de20e4f))
	{
		self.var_1de20e4f delete();
		self.var_1de20e4f = undefined;
	}
}

/*
	Name: function_a2e3342e
	Namespace: namespace_9529b92d
	Checksum: 0x7CFD5F7
	Offset: 0x428
	Size: 0x1B8
	Parameters: 2
	Flags: Linked
*/
function function_a2e3342e(trap, paged)
{
	if(!isdefined(paged))
	{
		paged = 0;
	}
	/#
		assert(isdefined(trap.target), "");
	#/
	trap.script_model = namespace_ec06fe4a::function_e22ae9b3(trap.origin, "zombietron_pressure_plate", trap.angles);
	if(isdefined(trap.script_model))
	{
		trap.script_model.targetname = "hazard";
		trap.script_model.var_fd5301f9 = "pressureplate";
	}
	trap.var_1de20e4f = namespace_ec06fe4a::function_e22ae9b3(trap.origin, "zombietron_pressure_plate_holder", trap.angles);
	trap.paged = paged;
	trap.var_84a0207b = getentarray(trap.target, "targetname");
	if(trap.var_84a0207b.size == 0)
	{
		trap.var_84a0207b = struct::get_array(trap.target, "targetname");
	}
	/#
		assert(trap.var_84a0207b.size > 0, "");
	#/
	array::notify_all(trap.var_84a0207b, "plate_assigned");
	trap thread function_3864f6a5();
	return trap;
}

/*
	Name: function_b3e13787
	Namespace: namespace_9529b92d
	Checksum: 0x266CE65E
	Offset: 0x5E8
	Size: 0x10C
	Parameters: 2
	Flags: Linked
*/
function function_b3e13787(trap, page)
{
	if(!isdefined(page))
	{
		page = 0;
	}
	if(!mayspawnentity())
	{
		return;
	}
	if(page)
	{
		if(!isdefined(level.doa.var_6733605b))
		{
			level.doa.var_6733605b = [];
		}
		else if(!isarray(level.doa.var_6733605b))
		{
			level.doa.var_6733605b = array(level.doa.var_6733605b);
		}
		level.doa.var_6733605b[level.doa.var_6733605b.size] = trap;
	}
	else
	{
		function_a2e3342e(trap);
	}
}

/*
	Name: function_865e002e
	Namespace: namespace_9529b92d
	Checksum: 0x930D3F09
	Offset: 0x700
	Size: 0x2F4
	Parameters: 0
	Flags: Linked
*/
function function_865e002e()
{
	self notify("31eac33016b51a53");
	self endon("31eac33016b51a53");
	level endon(#"game_over");
	while(true)
	{
		wait(0.5);
		state = namespace_4dae815d::function_59a9cf1d();
		if(state == 0)
		{
			continue;
		}
		foreach(trap in level.doa.var_6733605b)
		{
			time = gettime();
			if(isdefined(trap.var_eb9d64bb) && time < trap.var_eb9d64bb)
			{
				continue;
			}
			trap.var_eb9d64bb = (time + 2000) + randomint(600);
			if(!isdefined(trap.script_model))
			{
				activate = 0;
				if(isdefined(trap.var_f8660931))
				{
					distsq = distancesquared(trap.origin, trap.var_f8660931.origin);
					if(distsq < sqr(3200))
					{
						activate = 1;
					}
				}
				if(!activate)
				{
					trap.var_f8660931 = namespace_ec06fe4a::function_6eacecf5(trap.origin, 800);
					if(isdefined(trap.var_f8660931))
					{
						activate = 1;
					}
				}
				if(activate)
				{
					function_a2e3342e(trap, 1);
					trap.var_eb9d64bb = trap.var_eb9d64bb + 5000;
					namespace_1e25ad94::debugmsg("Paging IN pressure plate trap at:" + trap.origin);
				}
				continue;
			}
			trap.var_f8660931 = namespace_ec06fe4a::function_6eacecf5(trap.origin, 1200);
			if(!isdefined(trap.var_f8660931))
			{
				trap notify(#"hash_3e251384a5400dce", {#hash_760a0807:0});
				namespace_1e25ad94::debugmsg("Paging out pressure plate trap at:" + trap.origin);
			}
		}
	}
}

/*
	Name: function_b2a0e8d2
	Namespace: namespace_9529b92d
	Checksum: 0x943251C2
	Offset: 0xA00
	Size: 0x130
	Parameters: 0
	Flags: Linked
*/
function function_b2a0e8d2()
{
	level.doa.var_6733605b = [];
	level thread function_865e002e();
	if(isdefined(level.doa.var_a77e6349))
	{
		traps = [[ level.doa.var_a77e6349 ]]->function_87f950c1("pressureplate");
		page = 1;
	}
	else
	{
		traps = [[ level.doa.var_39e3fa99 ]]->function_242886d5("pressureplate");
	}
	foreach(trap in traps)
	{
		function_b3e13787(trap, page);
	}
}

/*
	Name: function_3864f6a5
	Namespace: namespace_9529b92d
	Checksum: 0xC8A408AB
	Offset: 0xB38
	Size: 0x2A8
	Parameters: 0
	Flags: Linked
*/
function function_3864f6a5()
{
	self notify("4ee3d8bc4b11e5dd");
	self endon("4ee3d8bc4b11e5dd");
	level endon(#"game_over");
	self endon(#"hash_3e251384a5400dce");
	self thread function_e073d92f();
	if(!isdefined(self.script_model))
	{
		self notify(#"hash_3e251384a5400dce");
	}
	var_d71f280f = self.origin;
	var_2aedafcb = var_d71f280f + vectorscale((0, 0, 1), 12);
	self.script_model moveto(var_2aedafcb, 0.5);
	while(isdefined(self))
	{
		waitframe(1);
		if(!isdefined(self.trigger))
		{
			self.trigger = namespace_268747c0::function_5bfa98c9("pressureplate", self.origin);
			if(isdefined(self.trigger))
			{
				self.trigger.origin = self.origin + vectorscale((0, 0, 1), 36);
				self.trigger.angles = self.angles;
			}
		}
		else
		{
			result = undefined;
			result = self.trigger waittill(#"trigger");
			self.script_model namespace_e32bb68::function_3a59ec34("zmb_press_pad_down");
			self.script_model moveto(var_d71f280f, 0.5);
			array::notify_all(self.var_84a0207b, "plate_activated");
			while(isdefined(result.activator) && result.activator istouching(self.trigger))
			{
				waitframe(1);
			}
			self.script_model namespace_e32bb68::function_3a59ec34("zmb_press_pad_up");
			self.script_model moveto(var_2aedafcb, 0.5);
			array::notify_all(self.var_84a0207b, "plate_deactivated");
		}
	}
}

