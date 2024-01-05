#using script_47851dbeea22fe66;
#using script_774302f762d76254;
#using script_1ee011cd0961afd7;
#using script_634ae70c663d1cc9;
#using script_17dcb1172e441bf6;
#using script_2a5bf5b4a00cee0d;
#using scripts\core_common\status_effects\status_effect_util.gsc;
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

#namespace namespace_85f9e33a;

/*
	Name: init
	Namespace: namespace_85f9e33a
	Checksum: 0x80F724D1
	Offset: 0x330
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function init()
{
}

/*
	Name: main
	Namespace: namespace_85f9e33a
	Checksum: 0xF7005A18
	Offset: 0x340
	Size: 0x16
	Parameters: 0
	Flags: Linked
*/
function main()
{
	level.doa.var_18f8e489 = [];
}

/*
	Name: function_81853592
	Namespace: namespace_85f9e33a
	Checksum: 0xE3A679D5
	Offset: 0x360
	Size: 0x174
	Parameters: 0
	Flags: Linked
*/
function function_81853592()
{
	self notify("58b1be112128f168");
	self endon("58b1be112128f168");
	self thread namespace_268747c0::function_978c05b5();
	result = undefined;
	result = self waittill(#"hash_3e251384a5400dce");
	if(is_true(self.paged) && is_true(result.var_760a0807))
	{
		arrayremovevalue(level.doa.var_18f8e489, self);
		namespace_1e25ad94::debugmsg("Deleting Flogger trap permenently at:" + self.origin);
	}
	util::wait_network_frame();
	if(isdefined(self.trigger))
	{
		for(i = 0; i < self.trigger.size; i++)
		{
			self.trigger[i] namespace_268747c0::function_54f185a();
		}
		self.trigger = [];
	}
	if(isdefined(self.script_model))
	{
		self.script_model delete();
	}
}

/*
	Name: function_ecfc6c75
	Namespace: namespace_85f9e33a
	Checksum: 0xF880C1F4
	Offset: 0x4E0
	Size: 0x200
	Parameters: 2
	Flags: Linked
*/
function function_ecfc6c75(trap, paged)
{
	if(!isdefined(paged))
	{
		paged = 0;
	}
	hazard = namespace_ec06fe4a::function_e22ae9b3(trap.origin, "p8_fxanim_mp_zmuseum_flogger_trap_mod");
	if(isdefined(hazard))
	{
		hazard.targetname = "hazard";
		hazard.var_fd5301f9 = "flogger";
		hazard.angles = trap.angles;
		hazard enablelinkto();
	}
	trap.script_model = hazard;
	trap.paged = paged;
	trap.trigger = [];
	trap.var_e8e7a559 = 1;
	trap.minwait = 3;
	trap.maxwait = 5;
	trap.var_c27181d9 = 3;
	if(isdefined(trap.script_parameters))
	{
		args = strtok(trap.script_parameters, ";");
		if(args.size > 0)
		{
			trap.var_e8e7a559 = float(args[0]);
		}
		if(args.size > 1)
		{
			trap.minwait = float(args[1]);
		}
		if(args.size > 2)
		{
			trap.maxwait = float(args[2]);
		}
		if(args.size > 3)
		{
			trap.var_c27181d9 = float(args[3]);
		}
	}
	trap thread function_80eed528();
	return trap;
}

/*
	Name: function_7fb58446
	Namespace: namespace_85f9e33a
	Checksum: 0xD2DE7892
	Offset: 0x6E8
	Size: 0xF4
	Parameters: 2
	Flags: Linked
*/
function function_7fb58446(trap, page)
{
	if(!isdefined(page))
	{
		page = 0;
	}
	if(page)
	{
		if(!isdefined(level.doa.var_18f8e489))
		{
			level.doa.var_18f8e489 = [];
		}
		else if(!isarray(level.doa.var_18f8e489))
		{
			level.doa.var_18f8e489 = array(level.doa.var_18f8e489);
		}
		level.doa.var_18f8e489[level.doa.var_18f8e489.size] = trap;
	}
	else
	{
		function_ecfc6c75(trap);
	}
}

/*
	Name: function_9d10940b
	Namespace: namespace_85f9e33a
	Checksum: 0x5E66B789
	Offset: 0x7E8
	Size: 0x334
	Parameters: 0
	Flags: Linked
*/
function function_9d10940b()
{
	self notify("14d328be4af87861");
	self endon("14d328be4af87861");
	level endon(#"game_over");
	while(true)
	{
		wait(0.5);
		state = namespace_4dae815d::function_59a9cf1d();
		if(state == 0)
		{
			continue;
		}
		foreach(trap in level.doa.var_18f8e489)
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
					function_ecfc6c75(trap, 1);
					trap.var_eb9d64bb = trap.var_eb9d64bb + 5000;
					namespace_1e25ad94::debugmsg("Paging IN flogger trap at:" + trap.origin);
				}
				continue;
			}
			trap.var_f8660931 = namespace_ec06fe4a::function_f3eab80e(trap.origin, 3600);
			if(!isdefined(trap.var_f8660931))
			{
				trap notify(#"hash_3e251384a5400dce", {#hash_760a0807:0});
				namespace_1e25ad94::debugmsg("Paging out flogger trap at:" + trap.origin);
			}
		}
	}
}

/*
	Name: function_a76494d5
	Namespace: namespace_85f9e33a
	Checksum: 0xCBD7828B
	Offset: 0xB28
	Size: 0x130
	Parameters: 0
	Flags: Linked
*/
function function_a76494d5()
{
	level.doa.var_18f8e489 = [];
	level thread function_9d10940b();
	if(isdefined(level.doa.var_a77e6349))
	{
		traps = [[ level.doa.var_a77e6349 ]]->function_87f950c1("flogger");
		page = 1;
	}
	else
	{
		traps = [[ level.doa.var_39e3fa99 ]]->function_242886d5("flogger");
	}
	foreach(trap in traps)
	{
		function_7fb58446(trap, page);
	}
}

/*
	Name: function_80eed528
	Namespace: namespace_85f9e33a
	Checksum: 0x1E352B8E
	Offset: 0xC60
	Size: 0x5B4
	Parameters: 0
	Flags: Linked
*/
function function_80eed528()
{
	self notify("4323071969682684");
	self endon("4323071969682684");
	level endon(#"game_over");
	self endon(#"hash_3e251384a5400dce");
	self thread function_81853592();
	if(!isdefined(self.script_model))
	{
		self notify(#"hash_3e251384a5400dce");
	}
	self.script_model useanimtree("generic");
	self.script_model solid();
	length = getanimlength(#"hash_32b5327a0dd4ac63") - 0.2;
	while(self.trigger.size < 2)
	{
		self.trigger[self.trigger.size] = self namespace_268747c0::function_678eaf60("flogger", self.origin, 512, 1, 256);
	}
	self.trigger[0] linkto(self.script_model, "link_p7_zm_shi_flogger_trap_end_log__02", vectorscale((-1, 0, 0), 100));
	self.trigger[1] linkto(self.script_model, "link_p7_zm_shi_flogger_trap_end_log__01", vectorscale((-1, 0, 0), 100));
	self.trigger[0] thread function_ab141bd8(self.script_model, self);
	self.trigger[1] thread function_ab141bd8(self.script_model, self);
	initial = 1;
	animationrate = self.var_e8e7a559;
	length = length / animationrate;
	while(self.trigger.size == 2)
	{
		self.script_model stopanimscripted();
		arrayremovevalue(self.trigger, undefined);
		if(self.trigger.size != 2)
		{
			break;
		}
		self.trigger[0] triggerenable(0);
		self.trigger[1] triggerenable(0);
		if(!is_true(initial))
		{
			wait(randomfloatrange(self.minwait, self.maxwait));
		}
		self.script_model namespace_e32bb68::function_3a59ec34("evt_doa_hazard_flogger_eng_start");
		wait(1);
		initial = 0;
		arrayremovevalue(self.trigger, undefined);
		if(self.trigger.size != 2)
		{
			break;
		}
		self.trigger[0] triggerenable(1);
		self.trigger[1] triggerenable(1);
		self.script_model namespace_e32bb68::function_3a59ec34("evt_doa_hazard_flogger_eng_start");
		self.script_model namespace_e32bb68::function_3a59ec34("evt_doa_hazard_flogger_eng_loop");
		self.script_model thread function_b98fe7eb();
		self.script_model namespace_268747c0::play_anim(#"hash_32b5327a0dd4ac63", animationrate);
		/#
			level thread namespace_1e25ad94::function_67127ba2(self.trigger[0], self.trigger[0].angles[1], self.trigger[0].length, self.trigger[0].width, self.trigger[0].height, length);
			level thread namespace_1e25ad94::function_67127ba2(self.trigger[1], self.trigger[1].angles[1], self.trigger[1].length, self.trigger[1].width, self.trigger[1].height, length);
		#/
		self.script_model waittilltimeout(length, #"end", #"scriptedanim", #"new_scripted_anim");
		self.script_model namespace_e32bb68::function_ae271c0b("evt_doa_hazard_flogger_eng_loop");
		self.script_model namespace_e32bb68::function_3a59ec34("evt_doa_hazard_flogger_eng_stop");
	}
	self thread function_80eed528();
}

/*
	Name: function_b98fe7eb
	Namespace: namespace_85f9e33a
	Checksum: 0xBC5928E8
	Offset: 0x1220
	Size: 0x8A
	Parameters: 0
	Flags: Linked
*/
function function_b98fe7eb()
{
	self notify("5b16f293eb751e6f");
	self endon("5b16f293eb751e6f");
	self endon(#"death");
	log = 0;
	while(true)
	{
		self waittill(#"hash_4460cb197033d052");
		self namespace_e32bb68::function_3a59ec34("evt_doa_hazard_flogger_whoosh_" + log);
		log = !log;
	}
}

/*
	Name: function_ab141bd8
	Namespace: namespace_85f9e33a
	Checksum: 0xBCC686E0
	Offset: 0x12B8
	Size: 0x360
	Parameters: 2
	Flags: Linked
*/
function function_ab141bd8(model, trap)
{
	self notify("6cf6fafac2ebb40e");
	self endon("6cf6fafac2ebb40e");
	self endon(#"death", #"hash_5dc5b7f198cd1bec");
	fling_force = 190;
	while(isdefined(self))
	{
		result = undefined;
		result = self waittill(#"trigger");
		guy = result.activator;
		if(isdefined(guy))
		{
			if(is_true(guy.var_47267079) || is_true(guy.boss))
			{
				continue;
			}
			if(!isdefined(guy.var_62abb118))
			{
				guy.var_62abb118 = 0;
			}
			if(guy.var_62abb118 < gettime())
			{
				guy.var_62abb118 = gettime() + 1000;
				guy namespace_83eb6304::function_3ecfde67("pungi_damage");
				model namespace_e32bb68::function_3a59ec34("evt_doa_hazard_flogger_impact");
			}
			if(isplayer(guy))
			{
				guy dodamage((isdefined(trap.damage) ? trap.damage : guy.health + 100), guy.origin);
				guy playrumbleonentity("damage_heavy");
				if(isdefined(trap.var_2e485cc) && guy.birthtime != gettime())
				{
					guy thread status_effect::status_effect_apply(trap.var_2e485cc, guy.currentweapon, self, 1);
				}
			}
			else
			{
				if(!is_true(guy.no_ragdoll))
				{
					v_centroid = guy getcentroid();
					v_away_from_source = vectornormalize(self.origin - v_centroid);
					v_away_from_source = v_away_from_source * 128;
					v_away_from_source = (v_away_from_source[0], v_away_from_source[1], randomintrange(128, 200));
					guy startragdoll();
					guy launchragdoll((fling_force * anglestoup(guy.angles)) + (v_away_from_source[0], v_away_from_source[1], 0));
				}
				guy thread namespace_ec06fe4a::function_570729f0(0.2);
			}
		}
	}
}

