#using script_47851dbeea22fe66;
#using script_774302f762d76254;
#using script_1ee011cd0961afd7;
#using script_1b0b07ff57d1dde3;
#using script_634ae70c663d1cc9;
#using script_17dcb1172e441bf6;
#using script_2a5bf5b4a00cee0d;
#using scripts\core_common\scene_shared.gsc;
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

#namespace namespace_a7c12078;

/*
	Name: function_c0237faf
	Namespace: namespace_a7c12078
	Checksum: 0x1AB6958C
	Offset: 0x218
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c0237faf()
{
	level notify(-1951156068);
}

/*
	Name: init
	Namespace: namespace_a7c12078
	Checksum: 0x80F724D1
	Offset: 0x238
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function init()
{
}

/*
	Name: main
	Namespace: namespace_a7c12078
	Checksum: 0x24DA7304
	Offset: 0x248
	Size: 0x16
	Parameters: 0
	Flags: Linked
*/
function main()
{
	level.doa.var_ea40471b = [];
}

/*
	Name: function_c6453062
	Namespace: namespace_a7c12078
	Checksum: 0x4C975714
	Offset: 0x268
	Size: 0x14C
	Parameters: 0
	Flags: Linked
*/
function function_c6453062()
{
	self notify("2f25b26e22f30a5c");
	self endon("2f25b26e22f30a5c");
	self thread namespace_268747c0::function_978c05b5();
	result = undefined;
	result = self waittill(#"hash_3e251384a5400dce");
	if(is_true(self.paged) && is_true(result.var_760a0807))
	{
		arrayremovevalue(level.doa.var_ea40471b, self);
		namespace_1e25ad94::debugmsg("Deleting LogDrop trap permenently at:" + self.origin);
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
	}
}

/*
	Name: function_cb1b5203
	Namespace: namespace_a7c12078
	Checksum: 0xB99C1384
	Offset: 0x3C0
	Size: 0x100
	Parameters: 2
	Flags: Linked
*/
function function_cb1b5203(trap, paged)
{
	if(!isdefined(paged))
	{
		paged = 0;
	}
	hazard = namespace_ec06fe4a::function_e22ae9b3(trap.origin, "p8_fxanim_zm_towers_trap_blade_01_mod");
	if(isdefined(hazard))
	{
		hazard.targetname = "hazard";
		hazard.var_fd5301f9 = "logdrop";
		hazard.angles = trap.angles;
		hazard enablelinkto();
	}
	trap.script_model = hazard;
	trap.paged = paged;
	if(isdefined(trap.trigger))
	{
		trap.trigger namespace_268747c0::function_54f185a();
		trap.trigger = undefined;
	}
	trap thread function_62ba9be4();
	return trap;
}

/*
	Name: function_7f3d5e5d
	Namespace: namespace_a7c12078
	Checksum: 0x966394C5
	Offset: 0x4C8
	Size: 0x10C
	Parameters: 2
	Flags: Linked
*/
function function_7f3d5e5d(trap, page)
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
		if(!isdefined(level.doa.var_ea40471b))
		{
			level.doa.var_ea40471b = [];
		}
		else if(!isarray(level.doa.var_ea40471b))
		{
			level.doa.var_ea40471b = array(level.doa.var_ea40471b);
		}
		level.doa.var_ea40471b[level.doa.var_ea40471b.size] = trap;
	}
	else
	{
		function_cb1b5203(trap);
	}
}

/*
	Name: function_d4a86caf
	Namespace: namespace_a7c12078
	Checksum: 0x9A223733
	Offset: 0x5E0
	Size: 0x334
	Parameters: 0
	Flags: Linked
*/
function function_d4a86caf()
{
	self notify("599e6beca01ea7e4");
	self endon("599e6beca01ea7e4");
	level endon(#"game_over");
	while(true)
	{
		wait(0.5);
		state = namespace_4dae815d::function_59a9cf1d();
		if(state == 0)
		{
			continue;
		}
		foreach(trap in level.doa.var_ea40471b)
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
					trap.var_f8660931 = namespace_ec06fe4a::function_6eacecf5(trap.origin, 3200);
					if(isdefined(trap.var_f8660931))
					{
						activate = 1;
					}
					else
					{
						trap.var_f8660931 = namespace_ec06fe4a::function_bd3709ce(trap.origin, 1200);
						if(isdefined(trap.var_f8660931))
						{
							activate = 1;
						}
					}
				}
				if(activate)
				{
					function_cb1b5203(trap, 1);
					trap.var_eb9d64bb = trap.var_eb9d64bb + 5000;
					namespace_1e25ad94::debugmsg("Paging IN logdrop trap at:" + trap.origin);
				}
				continue;
			}
			trap.var_f8660931 = namespace_ec06fe4a::function_f3eab80e(trap.origin, 3600);
			if(!isdefined(trap.var_f8660931))
			{
				trap notify(#"hash_3e251384a5400dce", {#hash_760a0807:0});
				namespace_1e25ad94::debugmsg("Paging out logdrop trap at:" + trap.origin);
			}
		}
	}
}

/*
	Name: function_237de89e
	Namespace: namespace_a7c12078
	Checksum: 0x171035D0
	Offset: 0x920
	Size: 0x130
	Parameters: 0
	Flags: Linked
*/
function function_237de89e()
{
	level.doa.var_ea40471b = [];
	level thread function_d4a86caf();
	if(isdefined(level.doa.var_a77e6349))
	{
		traps = [[ level.doa.var_a77e6349 ]]->function_87f950c1("logdrop");
		page = 1;
	}
	else
	{
		traps = [[ level.doa.var_39e3fa99 ]]->function_242886d5("logdrop");
	}
	foreach(trap in traps)
	{
		function_7f3d5e5d(trap, page);
	}
}

/*
	Name: function_b31750de
	Namespace: namespace_a7c12078
	Checksum: 0x362B73A9
	Offset: 0xA58
	Size: 0x38E
	Parameters: 1
	Flags: Linked
*/
function function_b31750de(lifetime)
{
	self endon(#"hash_3e251384a5400dce");
	self notify("31632961de933827");
	self endon("31632961de933827");
	while(isdefined(self) && self.state === 1)
	{
		if(!isdefined(self.trigger))
		{
			self.trigger = namespace_268747c0::function_5bfa98c9("logdrop", self.origin);
			if(isdefined(self.trigger))
			{
				up = anglestoup(self.angles);
				offset = up * 80;
				self.trigger.origin = self.origin + offset;
				self.trigger.angles = self.angles;
				/#
					level thread namespace_1e25ad94::debugbox(self.trigger.origin, self.trigger.angles[1], self.trigger.length, self.trigger.width, self.trigger.height, lifetime);
				#/
			}
		}
		if(isdefined(self.trigger))
		{
			result = undefined;
			result = self.trigger waittilltimeout(0.25, #"trigger");
			guy = result.activator;
			if(isdefined(guy) && isalive(guy))
			{
				if(is_true(guy.var_47267079) || is_true(guy.boss))
				{
					continue;
				}
				if(isvehicle(guy))
				{
					continue;
				}
				if(isplayer(guy) && isdefined(guy.doa.vehicle))
				{
					continue;
				}
				if(!isdefined(guy.var_ef6bca09))
				{
					guy.var_ef6bca09 = 0;
				}
				if(guy.var_ef6bca09 < gettime())
				{
					guy namespace_83eb6304::function_3ecfde67("pungi_damage");
					guy.var_ef6bca09 = gettime() + 1000;
				}
				if(isplayer(guy))
				{
					guy dodamage(guy.health + 100, guy.origin);
				}
				else
				{
					guy thread namespace_ec06fe4a::function_570729f0(0.1);
					guy thread namespace_ed80aead::function_586ef822();
				}
			}
			continue;
		}
		else
		{
			wait(0.25);
		}
	}
	if(isdefined(self.trigger))
	{
		self.trigger namespace_268747c0::function_54f185a();
		self.trigger = undefined;
	}
}

/*
	Name: function_62ba9be4
	Namespace: namespace_a7c12078
	Checksum: 0x2E57AAC1
	Offset: 0xDF0
	Size: 0x380
	Parameters: 0
	Flags: Linked
*/
function function_62ba9be4()
{
	self notify("23be4dc1c439716c");
	self endon("23be4dc1c439716c");
	level endon(#"game_over");
	self endon(#"hash_3e251384a5400dce");
	self thread function_c6453062();
	if(!isdefined(self.script_model))
	{
		self notify(#"hash_3e251384a5400dce");
	}
	self.state = 0;
	self.script_model useanimtree("generic");
	self.script_model solid();
	var_ba28dc68 = getanimlength(#"hash_d4f8097df6100c6");
	var_fb7d52cb = getanimlength(#"hash_39e41b146c471188");
	var_3493b9e = getanimlength(#"hash_63e9d1d6e68a4115");
	while(true)
	{
		self.script_model stopanimscripted();
		self.state = 0;
		wait(8 + randomint(5));
		self.script_model namespace_268747c0::play_anim(#"hash_d4f8097df6100c6", 1);
		self.script_model waittilltimeout(var_ba28dc68, #"end", #"scriptedanim", #"new_scripted_anim");
		self.state = 1;
		loops = randomintrange(5, 15);
		self thread function_b31750de(loops * var_fb7d52cb);
		while(loops)
		{
			self.script_model namespace_268747c0::play_anim(#"hash_39e41b146c471188", 1);
			self.script_model namespace_e32bb68::function_3a59ec34("zmb_traps_blade_lp");
			self.script_model waittilltimeout(var_fb7d52cb, #"end", #"scriptedanim", #"new_scripted_anim");
			loops--;
		}
		self.state = 0;
		self.script_model namespace_e32bb68::function_ae271c0b("zmb_traps_blade_lp");
		self.script_model namespace_268747c0::play_anim(#"hash_63e9d1d6e68a4115", 1);
		self.script_model waittilltimeout(var_3493b9e, #"end", #"scriptedanim", #"new_scripted_anim");
	}
}

