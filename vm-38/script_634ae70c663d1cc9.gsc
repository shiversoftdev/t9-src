#using script_6ee927dd468f79b0;
#using script_17662ff15f00e748;
#using script_49f7fe670ba9398e;
#using script_226eec8e867ca977;
#using script_40c25226e6cb60f6;
#using script_2887762528c25a29;
#using script_2050c3ca1efa3116;
#using script_5cf0799d52c77e61;
#using script_4a247ed69e84b56f;
#using script_16910aff9d97c520;
#using script_60c9f7551ce6c823;
#using script_79315a6ccf4fce3d;
#using script_47851dbeea22fe66;
#using script_774302f762d76254;
#using script_1ee011cd0961afd7;
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
#using scripts\core_common\animation_shared.gsc;

#namespace namespace_268747c0;

/*
	Name: function_6aed1ffe
	Namespace: namespace_268747c0
	Checksum: 0x7D0C84E3
	Offset: 0x268
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_6aed1ffe()
{
	level notify(117070242);
}

/*
	Name: init
	Namespace: namespace_268747c0
	Checksum: 0x7AE6277A
	Offset: 0x288
	Size: 0x58C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level.doa.var_90dc2431 = [];
	level.doa.var_90dc2431[#"hash_1febea34ca0f1f7b"] = [];
	level.doa.var_90dc2431[#"hash_1366ad68e44a61e6"] = [];
	level.doa.var_90dc2431[#"hash_3219530007dfba14"] = [];
	level.doa.var_90dc2431[#"hash_521b73633b084f93"] = [];
	level.doa.var_90dc2431[#"hash_2dbc8a7e6dcda43a"] = [];
	level.doa.var_90dc2431[#"hash_4beb1c2307658a11"] = [];
	level.doa.var_90dc2431[#"hash_4b482415d7c17889"] = [];
	level.doa.var_90dc2431[#"hash_e5ec53ae5bb293c"] = [];
	level.doa.var_90dc2431[#"hash_6ce506892f031410"] = [];
	level.doa.var_90dc2431[#"hash_3392f8c24dcea4ef"] = [];
	level.doa.var_90dc2431[#"hash_1761c31f44e7b8d0"] = [];
	level.doa.var_90dc2431[#"hash_4f7fa3734b952caf"] = [];
	level.doa.var_90dc2431[#"hash_becfd114c1ec38e"] = [];
	level.doa.var_90dc2431[#"hash_2442260ffeb5bf65"] = [];
	level.doa.var_90dc2431[#"hash_72917f3d48e23fdb"] = [];
	level.doa.var_90dc2431[#"hash_57d182822c6b17c6"] = [];
	level.doa.var_90dc2431[#"hash_4191d615ef0d015f"] = [];
	level.doa.var_90dc2431[#"hash_21763febab4e12ca"] = [];
	for(i = 0; i < 12; i++)
	{
		function_3111b4b2("pole", "trigger_radius", 35, 64);
	}
	for(i = 0; i < 12; i++)
	{
		function_3111b4b2("pungi", "trigger_box", 64, 64, 64);
	}
	for(i = 0; i < 16; i++)
	{
		function_3111b4b2("flogger", "trigger_box", 28, 28, 136);
	}
	for(i = 0; i < 4; i++)
	{
		function_3111b4b2("logdrop", "trigger_box", 140, 64, 64);
	}
	for(i = 0; i < 8; i++)
	{
		function_3111b4b2("dragonhead", "trigger_radius", 60, 150);
	}
	for(i = 0; i < 4; i++)
	{
		function_3111b4b2("killbox", "trigger_box", 128, 128, 128);
	}
	for(i = 0; i < 4; i++)
	{
		function_3111b4b2("killzone", "trigger_radius", 128, 128);
	}
	for(i = 0; i < 4; i++)
	{
		function_3111b4b2("pressureplate", "trigger_box", 36, 72, 36, 16);
	}
	for(i = 0; i < 8; i++)
	{
		function_3111b4b2("physicsbox", "trigger_box", 24, 20, 24);
	}
	namespace_fb2125f::init();
	namespace_6624770a::init();
	namespace_538252ab::init();
	namespace_53f73cda::init();
	namespace_d20e7d3b::init();
	namespace_9529b92d::init();
	namespace_61052b71::init();
	namespace_85f9e33a::init();
	namespace_a7c12078::init();
	namespace_3c9cfcff::init();
	namespace_2a2a39d4::init();
	namespace_98036e8c::init();
}

/*
	Name: main
	Namespace: namespace_268747c0
	Checksum: 0x520113FB
	Offset: 0x820
	Size: 0x504
	Parameters: 0
	Flags: Linked
*/
function main()
{
	for(i = 0; i < 12; i++)
	{
		if(isdefined(level.doa.var_90dc2431[#"hash_1366ad68e44a61e6"][i]))
		{
			level.doa.var_90dc2431[#"hash_1366ad68e44a61e6"][i] function_54f185a();
		}
	}
	for(i = 0; i < 12; i++)
	{
		if(isdefined(level.doa.var_90dc2431[#"hash_521b73633b084f93"][i]))
		{
			level.doa.var_90dc2431[#"hash_521b73633b084f93"][i] function_54f185a();
		}
	}
	for(i = 0; i < 16; i++)
	{
		if(isdefined(level.doa.var_90dc2431[#"hash_e5ec53ae5bb293c"][i]))
		{
			level.doa.var_90dc2431[#"hash_e5ec53ae5bb293c"][i] function_54f185a();
		}
	}
	for(i = 0; i < 4; i++)
	{
		if(isdefined(level.doa.var_90dc2431[#"hash_3392f8c24dcea4ef"][i]))
		{
			level.doa.var_90dc2431[#"hash_3392f8c24dcea4ef"][i] function_54f185a();
		}
	}
	for(i = 0; i < 8; i++)
	{
		if(isdefined(level.doa.var_90dc2431[#"hash_4f7fa3734b952caf"][i]))
		{
			level.doa.var_90dc2431[#"hash_4f7fa3734b952caf"][i] function_54f185a();
		}
	}
	for(i = 0; i < 4; i++)
	{
		if(isdefined(level.doa.var_90dc2431[#"hash_2442260ffeb5bf65"][i]))
		{
			level.doa.var_90dc2431[#"hash_2442260ffeb5bf65"][i] function_54f185a();
		}
	}
	for(i = 0; i < 4; i++)
	{
		if(isdefined(level.doa.var_90dc2431[#"hash_57d182822c6b17c6"][i]))
		{
			level.doa.var_90dc2431[#"hash_57d182822c6b17c6"][i] function_54f185a();
		}
	}
	for(i = 0; i < 4; i++)
	{
		if(isdefined(level.doa.var_90dc2431[#"hash_4beb1c2307658a11"][i]))
		{
			level.doa.var_90dc2431[#"hash_4beb1c2307658a11"][i] function_54f185a();
		}
	}
	for(i = 0; i < 8; i++)
	{
		if(isdefined(level.doa.var_90dc2431[#"hash_21763febab4e12ca"][i]))
		{
			level.doa.var_90dc2431[#"hash_21763febab4e12ca"][i] function_54f185a();
		}
	}
	namespace_fb2125f::main();
	namespace_6624770a::main();
	namespace_538252ab::main();
	namespace_53f73cda::main();
	namespace_d20e7d3b::main();
	namespace_9529b92d::main();
	namespace_61052b71::init();
	namespace_85f9e33a::main();
	namespace_a7c12078::main();
	namespace_3c9cfcff::main();
	namespace_2a2a39d4::main();
	namespace_98036e8c::main();
}

/*
	Name: function_3111b4b2
	Namespace: namespace_268747c0
	Checksum: 0x64601FCE
	Offset: 0xD30
	Size: 0x1F0
	Parameters: 6
	Flags: Linked
*/
function function_3111b4b2(var_d748f8af, triggertype, var_bacb72c4, height, width, var_7946c1f6)
{
	if(!isdefined(triggertype))
	{
		triggertype = "trigger_box";
	}
	if(!isdefined(var_7946c1f6))
	{
		var_7946c1f6 = 0;
	}
	trigger = namespace_ec06fe4a::spawntrigger(triggertype, (0, 0, 0), ((((1 | 2) | 4) | 4096) | 512) | var_7946c1f6, var_bacb72c4, height, width);
	if(isdefined(trigger))
	{
		trigger enablelinkto();
		trigger.type = var_d748f8af;
		trigger.width = width;
		trigger.height = height;
		trigger.length = var_bacb72c4;
		trigger.radius = var_bacb72c4;
		var_8bc05e55 = var_d748f8af + "_avail";
		if(!isdefined(level.doa.var_90dc2431[var_8bc05e55]))
		{
			level.doa.var_90dc2431[var_8bc05e55] = [];
		}
		else if(!isarray(level.doa.var_90dc2431[var_8bc05e55]))
		{
			level.doa.var_90dc2431[var_8bc05e55] = array(level.doa.var_90dc2431[var_8bc05e55]);
		}
		level.doa.var_90dc2431[var_8bc05e55][level.doa.var_90dc2431[var_8bc05e55].size] = trigger;
		return trigger;
	}
}

/*
	Name: function_e8bbd3ad
	Namespace: namespace_268747c0
	Checksum: 0x100507F8
	Offset: 0xF28
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function function_e8bbd3ad(var_d748f8af)
{
	var_8bc05e55 = var_d748f8af + "_avail";
	var_e831ee92 = var_d748f8af + "_active";
	arrayremovevalue(level.doa.var_90dc2431[var_8bc05e55], undefined);
	arrayremovevalue(level.doa.var_90dc2431[var_e831ee92], undefined);
}

/*
	Name: function_5bfa98c9
	Namespace: namespace_268747c0
	Checksum: 0xD9DE5B01
	Offset: 0xFD0
	Size: 0x3A8
	Parameters: 5
	Flags: Linked
*/
function function_5bfa98c9(type, myorigin, var_a3ea8b6f, flush, var_6c21387b)
{
	if(!isdefined(var_a3ea8b6f))
	{
		var_a3ea8b6f = 1024;
	}
	if(!isdefined(flush))
	{
		flush = 0;
	}
	if(!isdefined(var_6c21387b))
	{
		var_6c21387b = 1024;
	}
	if(!isdefined(namespace_ec06fe4a::function_f3eab80e(myorigin, var_a3ea8b6f)))
	{
		return;
	}
	var_8bc05e55 = type + "_avail";
	var_e831ee92 = type + "_active";
	if(level.doa.var_90dc2431[var_8bc05e55].size == 0)
	{
		if(flush)
		{
			var_46e82fd9 = [];
			foreach(trigger in level.doa.var_90dc2431[var_e831ee92])
			{
				if(!isdefined(namespace_ec06fe4a::function_f3eab80e(trigger.origin, var_6c21387b)))
				{
					var_46e82fd9[var_46e82fd9.size] = trigger;
				}
			}
			time = gettime();
			foreach(trigger in var_46e82fd9)
			{
				if(trigger.var_a09cdd4f + 3000 < time)
				{
					trigger function_54f185a();
				}
			}
			if(level.doa.var_90dc2431[var_8bc05e55].size == 0)
			{
				return;
			}
		}
		else
		{
			return;
		}
	}
	trigger = level.doa.var_90dc2431[var_8bc05e55][0];
	arrayremoveindex(level.doa.var_90dc2431[var_8bc05e55], 0);
	if(!isdefined(level.doa.var_90dc2431[var_e831ee92]))
	{
		level.doa.var_90dc2431[var_e831ee92] = [];
	}
	else if(!isarray(level.doa.var_90dc2431[var_e831ee92]))
	{
		level.doa.var_90dc2431[var_e831ee92] = array(level.doa.var_90dc2431[var_e831ee92]);
	}
	level.doa.var_90dc2431[var_e831ee92][level.doa.var_90dc2431[var_e831ee92].size] = trigger;
	trigger.var_a09cdd4f = gettime();
	trigger triggerenable(1);
	return trigger;
}

/*
	Name: function_54f185a
	Namespace: namespace_268747c0
	Checksum: 0xAFF44528
	Offset: 0x1380
	Size: 0x1D6
	Parameters: 0
	Flags: Linked
*/
function function_54f185a()
{
	self notify(#"hash_5dc5b7f198cd1bec");
	self unlink();
	self triggerenable(0);
	self.origin = vectorscale((0, 0, -1), 20000);
	type = self.type;
	self.var_a09cdd4f = 0;
	arrayremovevalue(level.doa.var_90dc2431[type + "_active"], self);
	if(!isdefined(level.doa.var_90dc2431[type + "_avail"]))
	{
		level.doa.var_90dc2431[type + "_avail"] = [];
	}
	else if(!isarray(level.doa.var_90dc2431[type + "_avail"]))
	{
		level.doa.var_90dc2431[type + "_avail"] = array(level.doa.var_90dc2431[type + "_avail"]);
	}
	level.doa.var_90dc2431[type + "_avail"][level.doa.var_90dc2431[type + "_avail"].size] = self;
}

/*
	Name: function_3874b272
	Namespace: namespace_268747c0
	Checksum: 0x5C67F898
	Offset: 0x1560
	Size: 0x232
	Parameters: 2
	Flags: Linked
*/
function function_3874b272(type, var_2c5f6748)
{
	switch(type)
	{
		case "explo_barrel":
		{
			self thread namespace_fb2125f::function_6e3c8a46();
			return;
		}
		case "killbox":
		{
			self thread namespace_6624770a::function_813ad4cb();
			return;
		}
		case "killzone":
		{
			self thread namespace_538252ab::function_90e65586();
			return;
		}
		case "elec_pole":
		{
			self thread namespace_53f73cda::function_97d551b(var_2c5f6748);
			return;
		}
		case "pungi":
		{
			self thread namespace_d20e7d3b::function_433b5718();
			return;
		}
		case "pressureplate":
		{
			self thread namespace_9529b92d::function_b2a0e8d2();
			return;
		}
		case "flogger":
		{
			self thread namespace_85f9e33a::function_a76494d5();
			return;
		}
		case "logdrop":
		{
			self thread namespace_a7c12078::function_237de89e();
			return;
		}
		case "dragonhead":
		{
			self thread namespace_3c9cfcff::function_19903280();
			return;
		}
		case "fireball":
		{
			self thread namespace_2a2a39d4::function_3a25f62f();
			return;
		}
		case "physicsbox":
		{
			self thread namespace_61052b71::function_8bd713b2();
			return;
		}
		case "platform":
		{
			self thread namespace_98036e8c::function_1ba8281d();
			return;
		}
		default:
		{
			/#
				assert(0, "");
			#/
		}
	}
}

/*
	Name: function_978c05b5
	Namespace: namespace_268747c0
	Checksum: 0x7B7E8AE5
	Offset: 0x17A0
	Size: 0x76
	Parameters: 0
	Flags: Linked
*/
function function_978c05b5()
{
	self notify("5116bdc45eb9a302");
	self endon("5116bdc45eb9a302");
	self endon(#"death", #"hash_3e251384a5400dce");
	level waittill(#"game_reset", #"hash_25b8523c402831e5");
	self notify(#"hash_3e251384a5400dce");
}

/*
	Name: function_5418a00f
	Namespace: namespace_268747c0
	Checksum: 0xC6B908E1
	Offset: 0x1820
	Size: 0x66
	Parameters: 0
	Flags: Linked
*/
function function_5418a00f()
{
	self notify("316843a8bcd92f08");
	self endon("316843a8bcd92f08");
	self endon(#"death", #"hash_3e251384a5400dce");
	level waittill(#"hash_2282d796a1f7533a");
	self notify(#"hash_3e251384a5400dce");
}

/*
	Name: play_anim
	Namespace: namespace_268747c0
	Checksum: 0x76D7BF29
	Offset: 0x1890
	Size: 0xE4
	Parameters: 3
	Flags: Linked
*/
function play_anim(animation, rate, mode)
{
	self endon(#"death");
	self notify(#"stop_idle");
	self stopanimscripted();
	if(!isdefined(rate))
	{
		rate = 1;
	}
	if(!isdefined(mode))
	{
		mode = "server script";
	}
	var_4e1ed731 = self.origin;
	var_451a755d = self.angles;
	self thread animation::play(animation, var_4e1ed731, var_451a755d, rate, 0.2, 0.2, 0, 0, 0, 0, undefined, 0, mode);
}

/*
	Name: function_7f6a807c
	Namespace: namespace_268747c0
	Checksum: 0xF8927240
	Offset: 0x1980
	Size: 0x1F4
	Parameters: 0
	Flags: Linked
*/
function function_7f6a807c()
{
	self notify("5b7b11fa5f747959");
	self endon("5b7b11fa5f747959");
	self endon(#"death");
	self waittill(#"hash_5dc5b7f198cd1bec");
	if(isdefined(self.owner) && isdefined(self.owner.trigger))
	{
		if(isarray(self.owner.trigger))
		{
			if(isinarray(self.owner.trigger, self))
			{
				arrayremovevalue(self.owner.trigger, self);
			}
		}
		else if(self.owner.trigger == self)
		{
			self.owner.trigger = undefined;
		}
		entnum = self getentitynumber();
		origin = self.origin;
		if(isdefined(self.owner.script_model))
		{
			entnum = self.owner.script_model getentitynumber();
			origin = self.owner.script_model.origin;
		}
		namespace_1e25ad94::debugmsg((((("Trap (" + entnum) + ") at origin:") + origin) + " lost its trigger.  Type:") + self.owner.script_noteworthy);
	}
	self.owner = undefined;
	self triggerenable(0);
}

/*
	Name: function_b3c196a
	Namespace: namespace_268747c0
	Checksum: 0x1730FCA7
	Offset: 0x1B80
	Size: 0x7C
	Parameters: 3
	Flags: Linked
*/
function function_b3c196a(owner, origin, angles)
{
	self triggerenable(0);
	self.owner = owner;
	self.origin = origin;
	self.angles = angles;
	self.var_a09cdd4f = gettime();
	self thread function_7f6a807c();
}

/*
	Name: function_678eaf60
	Namespace: namespace_268747c0
	Checksum: 0xA5EF4B9E
	Offset: 0x1C08
	Size: 0x110
	Parameters: 5
	Flags: Linked
*/
function function_678eaf60(type, origin, var_a3ea8b6f, flush, var_6c21387b)
{
	if(!isdefined(origin))
	{
		origin = self.origin;
	}
	if(!isdefined(flush))
	{
		flush = 0;
	}
	if(!isdefined(var_6c21387b))
	{
		var_6c21387b = 256;
	}
	if(isdefined(self.trigger) && !isarray(self.trigger))
	{
		return self.trigger;
	}
	trigger = undefined;
	while(!isdefined(trigger))
	{
		trigger = function_5bfa98c9(type, origin, var_a3ea8b6f, flush, var_6c21387b);
		if(isdefined(trigger))
		{
			break;
		}
		wait(0.25);
	}
	trigger function_b3c196a(self, self.origin, self.angles);
	return trigger;
}

/*
	Name: function_b04a33c5
	Namespace: namespace_268747c0
	Checksum: 0x3037AF31
	Offset: 0x1D20
	Size: 0x90
	Parameters: 1
	Flags: Linked
*/
function function_b04a33c5(platforms)
{
	foreach(platform in platforms)
	{
		namespace_98036e8c::function_2c3d65c4(platform);
	}
}

/*
	Name: function_96e2f261
	Namespace: namespace_268747c0
	Checksum: 0x83CD2B13
	Offset: 0x1DB8
	Size: 0x338
	Parameters: 2
	Flags: Linked
*/
function function_96e2f261(traps, page)
{
	foreach(trap in traps)
	{
		if(trap.script_noteworthy === #"pungi")
		{
			namespace_d20e7d3b::function_f42615a9(trap, page);
			continue;
		}
		if(trap.script_noteworthy === #"pressureplate")
		{
			namespace_9529b92d::function_b3e13787(trap, page);
			continue;
		}
		if(trap.script_noteworthy === #"pole")
		{
			namespace_53f73cda::function_28826539(trap, page);
			continue;
		}
		if(trap.script_noteworthy === #"barrel")
		{
			namespace_fb2125f::function_3dd2c543(trap, page);
			continue;
		}
		if(trap.script_noteworthy === #"dragonhead")
		{
			namespace_3c9cfcff::function_c808b1bb(trap, page);
			continue;
		}
		if(trap.script_noteworthy === #"killbox")
		{
			namespace_6624770a::function_bbdbcaa5(trap, page);
			continue;
		}
		if(trap.script_noteworthy === #"killzone")
		{
			namespace_538252ab::function_7ae8d74a(trap, page);
			continue;
		}
		if(trap.script_noteworthy === #"flogger")
		{
			namespace_85f9e33a::function_7fb58446(trap, page);
			continue;
		}
		if(trap.script_noteworthy === #"logdrop")
		{
			namespace_a7c12078::function_7f3d5e5d(trap, page);
			continue;
		}
		if(trap.script_noteworthy === #"fireball")
		{
			namespace_2a2a39d4::function_7a2f725d(trap, page);
			continue;
		}
		if(trap.script_noteworthy === #"physicsbox")
		{
			namespace_61052b71::function_bb1d1cf9(trap, page);
		}
	}
}

