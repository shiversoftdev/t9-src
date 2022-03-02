#using script_1883fa4e60abbf9f;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace namespace_1c7657c;

/*
	Name: init
	Namespace: namespace_1c7657c
	Checksum: 0x45E027D9
	Offset: 0x158
	Size: 0xBC
	Parameters: 0
	Flags: None
*/
function init()
{
	level.var_9a798a88 = spawnstruct();
	level.var_9a798a88.alarms = struct::get_array("stealth_alarm", "script_noteworthy");
	level.g_effect[#"hash_43519b3856d70cf6"] = "vfx/iw7/levels/europa/vfx_eu_bfg_light_redblink.vfx";
	level.g_effect[#"hash_53121b07fda44a8d"] = "vfx/core/vehicles/aircraft_light_white_blink.vfx";
	array::thread_all(level.var_9a798a88.alarms, &function_a8f7fa5b);
}

/*
	Name: function_ea8a5678
	Namespace: namespace_1c7657c
	Checksum: 0x863B7E20
	Offset: 0x220
	Size: 0xBE
	Parameters: 2
	Flags: None
*/
function function_ea8a5678(targetname, func)
{
	foreach(alarm in level.var_9a798a88.alarms)
	{
		if(isdefined(alarm.targetname) && alarm.targetname == targetname)
		{
			alarm.on_func = func;
		}
	}
}

/*
	Name: function_a8f7fa5b
	Namespace: namespace_1c7657c
	Checksum: 0x6E48BE41
	Offset: 0x2E8
	Size: 0x26C
	Parameters: 0
	Flags: None
*/
function function_a8f7fa5b()
{
	ents = struct::get_array(self.script_linkto, "script_linkname");
	self.lights = [];
	self.trigs = [];
	self.active = 1;
	self.state = "idle";
	foreach(ent in ents)
	{
		if(!isdefined(ent.script_noteworthy))
		{
			continue;
		}
		switch(ent.script_noteworthy)
		{
			case "hash_4512f0aa849ffe50":
			{
				self.trigs[#"hack"] = ent;
				self thread function_2dc6261d();
				break;
			}
			case "trigger_damage":
			{
				self.trigs[#"dmg"] = ent;
				self thread monitor_damage();
				break;
			}
			case "light":
			{
				self.lights[self.lights.size] = ent;
				self.var_bb4a3b9 = ent.model;
				ent.idle_fx = spawnfx(level.g_effect[#"hash_53121b07fda44a8d"], ent.origin);
				triggerfx(ent.idle_fx);
				if(isdefined(ent.script_wtf))
				{
					self.var_c0effb5a = ent.script_wtf;
				}
				break;
			}
			default:
			{
				break;
			}
		}
	}
	self thread function_7e4779a4();
}

/*
	Name: function_2dc6261d
	Namespace: namespace_1c7657c
	Checksum: 0x7DE06102
	Offset: 0x560
	Size: 0x11C
	Parameters: 0
	Flags: None
*/
function function_2dc6261d()
{
	self endon(#"death");
	self.trigs[#"hack"] endon(#"death");
	waitresult = undefined;
	waitresult = self.trigs[#"hack"] waittill(#"trigger");
	whom = waitresult.activator;
	self notify(#"state_change", {#state:"disabled"});
	if(soundexists(#"hash_2185069045279c89"))
	{
		playsoundatposition(#"hash_2185069045279c89", getplayers()[0].origin);
	}
}

/*
	Name: monitor_damage
	Namespace: namespace_1c7657c
	Checksum: 0x98C44AED
	Offset: 0x688
	Size: 0xBE
	Parameters: 0
	Flags: None
*/
function monitor_damage()
{
	self endon(#"death");
	self.trigs[#"dmg"] endon(#"death");
	waitresult = undefined;
	waitresult = self.trigs[#"dmg"] waittill(#"trigger");
	whom = waitresult.activator;
	self notify(#"state_change", {#state:"destroyed"});
}

/*
	Name: function_7e4779a4
	Namespace: namespace_1c7657c
	Checksum: 0x377A3904
	Offset: 0x750
	Size: 0x276
	Parameters: 0
	Flags: None
*/
function function_7e4779a4()
{
	self endon(#"death");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"state_change");
		state = waitresult.state;
		self notify(state);
		switch(state)
		{
			case "disabled":
			{
				if(self.state == "alarm_on")
				{
					self thread alarm_off();
				}
				function_bb67aeb1();
				self.state = state;
				self.active = 0;
				self.trigs[#"hack"] delete();
				break;
			}
			case "destroyed":
			{
				if(self.state == "alarm_on")
				{
					self thread alarm_off();
				}
				function_bb67aeb1();
				self.state = state;
				self.active = 0;
				self.trigs[#"hack"] delete();
				break;
			}
			case "alarm_on":
			{
				if(self.state == "alarm_on")
				{
					break;
				}
				self.state = state;
				self thread alarm_on();
				break;
			}
			case "idle":
			{
				if(self.state == "idle")
				{
					break;
				}
				self.state = state;
				self thread alarm_off();
				break;
			}
			default:
			{
				/#
					iprintln("" + state);
				#/
				break;
			}
		}
	}
}

/*
	Name: function_bb67aeb1
	Namespace: namespace_1c7657c
	Checksum: 0x84F770B2
	Offset: 0x9D0
	Size: 0x98
	Parameters: 0
	Flags: None
*/
function function_bb67aeb1()
{
	foreach(light in self.lights)
	{
		if(isdefined(light.idle_fx))
		{
			light.idle_fx delete();
		}
	}
}

/*
	Name: alarm_on
	Namespace: namespace_1c7657c
	Checksum: 0xDBE3A481
	Offset: 0xA70
	Size: 0x12C
	Parameters: 0
	Flags: None
*/
function alarm_on()
{
	if(!self.active)
	{
		return;
	}
	foreach(light in self.lights)
	{
		light.idle_fx delete();
		if(isdefined(self.var_c0effb5a))
		{
			light setmodel(self.var_c0effb5a);
		}
		light.var_5131ddae = spawnfx(level.g_effect[#"hash_43519b3856d70cf6"], light.origin);
		triggerfx(light.var_5131ddae);
	}
	if(isdefined(self.on_func))
	{
		self thread [[self.on_func]]();
	}
}

/*
	Name: alarm_off
	Namespace: namespace_1c7657c
	Checksum: 0x1D30B45D
	Offset: 0xBA8
	Size: 0xC8
	Parameters: 0
	Flags: None
*/
function alarm_off()
{
	foreach(light in self.lights)
	{
		if(isdefined(self.var_bb4a3b9))
		{
			light setmodel(self.var_bb4a3b9);
		}
		if(isdefined(light.var_5131ddae))
		{
			light.var_5131ddae delete();
		}
	}
}

/*
	Name: function_f8788a08
	Namespace: namespace_1c7657c
	Checksum: 0x8580C56B
	Offset: 0xC78
	Size: 0xFC
	Parameters: 1
	Flags: None
*/
function function_f8788a08(alarm)
{
	if(!alarm.active)
	{
		return;
	}
	self endon(#"death");
	self.og_goalradius = self.goalradius;
	self namespace_979752dc::set_goal_radius(32);
	self namespace_979752dc::set_goal(alarm);
	self waittill(#"goal");
	self orientmode("face angle", alarm.angles[1]);
	wait(1.5);
	alarm notify(#"state_change", {#state:"alarm_on"});
	self namespace_979752dc::set_goal_radius(self.og_goalradius);
}

