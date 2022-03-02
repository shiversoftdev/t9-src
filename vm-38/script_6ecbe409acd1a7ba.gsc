#using script_214d8d80fea7a6eb;
#using script_38867f943fb86135;
#using script_65fbfb5ecb1f899e;
#using script_84f5590d2ac48f8;
#using script_dfd475a961626c7;
#using scripts\core_common\animation_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\load_shared.csc;
#using scripts\core_common\lui_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\cp_common\util.csc;

#namespace cp_takedown;

/*
	Name: function_24174ea9
	Namespace: cp_takedown
	Checksum: 0x13D7F641
	Offset: 0x3B8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_24174ea9()
{
	level notify(1796755163);
}

/*
	Name: main
	Namespace: cp_takedown
	Checksum: 0xB649902
	Offset: 0x3D8
	Size: 0x134
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	full_screen_movie::register();
	setsaveddvar(#"enable_global_wind", 1);
	setsaveddvar(#"wind_global_vector", "88 0 0");
	setsaveddvar(#"wind_global_low_altitude", 0);
	setsaveddvar(#"wind_global_hi_altitude", 10000);
	setsaveddvar(#"wind_global_low_strength_percent", 100);
	init_clientfields();
	callback::on_spawned(&on_spawned);
	load::main();
	util::waitforclient(0);
}

/*
	Name: on_spawned
	Namespace: cp_takedown
	Checksum: 0x7873AE86
	Offset: 0x518
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function on_spawned(localclientnum)
{
	self endon(#"death", #"disconnect");
	waitframe(1);
	util::function_8eb5d4b0(3000, 0.23);
	self thread namespace_260f8380::function_d9475fc(0.6, undefined, undefined, undefined);
}

/*
	Name: init_clientfields
	Namespace: cp_takedown
	Checksum: 0x4D154C5A
	Offset: 0x598
	Size: 0x5EC
	Parameters: 0
	Flags: Linked
*/
function init_clientfields()
{
	clientfield::register("scriptmover", "burning_photo", 1, 3, "int", &function_513e85fe, 0, 0);
	clientfield::register("vehicle", "le_door_en2_death_fallout", 1, 1, "int", &function_371e91f5, 0, 0);
	clientfield::register("vehicle", "ri_door_en2_death_fallout", 1, 1, "int", &function_c4e8d2c6, 0, 0);
	clientfield::register("world", "fake_snipercam_slomo", 1, 1, "int", &function_d1d298b9, 0, 0);
	clientfield::register("vehicle", "4x4_getin_door", 1, 1, "int", &function_5359a453, 0, 0);
	clientfield::register("vehicle", "4x4_getin_door_woods", 1, 1, "int", &function_3cb79acb, 0, 0);
	clientfield::register("vehicle", "af_rc_deploy1", 1, 1, "int", &function_4cce7a86, 0, 0);
	clientfield::register("vehicle", "af_rc_deploy2", 1, 1, "int", &function_3e1ddd25, 0, 0);
	clientfield::register("vehicle", "af_rc_deploy3", 1, 1, "int", &function_da9d1625, 0, 0);
	clientfield::register("toplayer", "lerp_fov", 1, 3, "int", &lerp_fov, 0, 0);
	clientfield::register("vehicle", "hit1_helispotlight", 1, 1, "int", &function_2d4bf193, 0, 0);
	clientfield::register("vehicle", "hit1_track_vehicle", 1, 1, "int", &function_f7a0b31a, 0, 0);
	clientfield::register("scriptmover", "hit1_track_ent", 1, 1, "int", &function_e0deb842, 0, 0);
	clientfield::register("scriptmover", "hit1_tracking", 1, 1, "int", &function_1e71913d, 0, 0);
	clientfield::register("scriptmover", "hit1_light", 1, 1, "int", &function_b40e980, 0, 0);
	clientfield::register("world", "wreck_volume_decals", 1, 1, "int", &function_f48f6d3, 0, 1);
	clientfield::register("world", "crash_models", 1, 1, "int", &function_7f111718, 0, 1);
	clientfield::register("toplayer", "set_player_pbg_bank", 1, 1, "int", &function_b06125f0, 0, 0);
	clientfield::register("toplayer", "wreck_vision", 1, 1, "int", &function_a315cdc9, 1, 0);
	clientfield::register("world", "prop_wash", 1, 1, "int", &function_766abe10, 0, 0);
	clientfield::register("toplayer", "force_stream_weapons", 1, 2, "int", &function_d126379e, 1, 1);
}

/*
	Name: function_d1d298b9
	Namespace: cp_takedown
	Checksum: 0xF42D9062
	Offset: 0xB90
	Size: 0xB4
	Parameters: 7
	Flags: Linked
*/
function function_d1d298b9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		level easing::function_86ac55c5(fieldname, "runtime_time_scale", 0, 0.5, 0.1, #"linear");
	}
	else
	{
		setdvar(#"hash_5f4ab31dca8bb404", 1);
	}
}

/*
	Name: function_513e85fe
	Namespace: cp_takedown
	Checksum: 0x7BACCAFF
	Offset: 0xC50
	Size: 0xEC
	Parameters: 7
	Flags: Linked
*/
function function_513e85fe(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self function_bf9d3071(#"hash_12e9e7962353adb0");
	}
	else
	{
		if(bwastimejump == 2)
		{
			self function_5d482e78(#"hash_12e9e7962353adb0");
			waitframe(1);
			self function_bf9d3071(#"hash_51e0b8d384aeac65");
		}
		else
		{
			self function_f6e99a8d(#"hash_51e0b8d384aeac65");
		}
	}
}

/*
	Name: function_766abe10
	Namespace: cp_takedown
	Checksum: 0xE0DC135E
	Offset: 0xD48
	Size: 0x11C
	Parameters: 7
	Flags: Linked
*/
function function_766abe10(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	ents = getdynentarray("prop_blast_me");
	for(i = 0; i < 20; i++)
	{
		foreach(ent in ents)
		{
			launchdynent(ent, vectorscale((-1, 0, 0), 0.15));
		}
		waitframe(1);
		waitframe(1);
	}
}

/*
	Name: function_e0deb842
	Namespace: cp_takedown
	Checksum: 0x49787F49
	Offset: 0xE70
	Size: 0xB8
	Parameters: 7
	Flags: Linked
*/
function function_e0deb842(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(isdefined(level.var_9a3944f4))
	{
		level.var_9a3944f4.track_ent = self;
		level.var_cc43fb24 = undefined;
		if(isdefined(level.var_bda6b1e1))
		{
			level.var_9a3944f4.track_ent.tracking = level.var_bda6b1e1;
			level.var_bda6b1e1 = undefined;
		}
	}
	else
	{
		level.var_cc43fb24 = self;
	}
}

/*
	Name: function_1e71913d
	Namespace: cp_takedown
	Checksum: 0xF36E0F7C
	Offset: 0xF30
	Size: 0x8C
	Parameters: 7
	Flags: Linked
*/
function function_1e71913d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(isdefined(level.var_9a3944f4.track_ent))
	{
		level.var_9a3944f4.track_ent.tracking = self;
		level.var_bda6b1e1 = undefined;
	}
	else
	{
		level.var_bda6b1e1 = self;
	}
}

/*
	Name: function_f7a0b31a
	Namespace: cp_takedown
	Checksum: 0x58948EB1
	Offset: 0xFC8
	Size: 0x8C
	Parameters: 7
	Flags: Linked
*/
function function_f7a0b31a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(isdefined(level.var_9a3944f4.track_ent))
	{
		level.var_9a3944f4.track_ent.tracking = self;
		level.var_bda6b1e1 = undefined;
	}
	else
	{
		level.var_bda6b1e1 = self;
	}
}

/*
	Name: function_b40e980
	Namespace: cp_takedown
	Checksum: 0x85A61F66
	Offset: 0x1060
	Size: 0x70
	Parameters: 7
	Flags: Linked
*/
function function_b40e980(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(isdefined(level.var_9a3944f4))
	{
		level.var_9a3944f4.light = self;
	}
	else
	{
		level.var_c3ea2341 = self;
	}
}

/*
	Name: function_2d4bf193
	Namespace: cp_takedown
	Checksum: 0x6B4ABAC9
	Offset: 0x10D8
	Size: 0x436
	Parameters: 7
	Flags: Linked
*/
function function_2d4bf193(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self endon(#"hash_55fc2759ea7b7c72");
	getplayers(fieldname)[0] endon(#"death", #"disconnect");
	if(isdefined(level.var_cc43fb24))
	{
		level.var_9a3944f4.track_ent = level.var_cc43fb24;
		level.var_cc43fb24 = undefined;
		if(isdefined(level.var_bda6b1e1))
		{
			level.var_9a3944f4.track_ent.tracking = level.var_bda6b1e1;
			level.var_bda6b1e1 = undefined;
		}
	}
	var_61bc4e7 = 0;
	var_7dfc67b2 = "tag_searchlight_bracket";
	var_5d9bcd31 = "tag_searchlight_attach";
	tag_body = "tag_searchlight";
	tag_fx = "tag_searchlight_fx";
	if(bwastimejump)
	{
		self endon(#"hash_55fc2759ea7b7c72");
		level.var_9a3944f4 = self;
		while(true)
		{
			if(isdefined(self.track_ent.tracking))
			{
				/#
					if(is_true(var_61bc4e7))
					{
						sphere(self.track_ent.origin, 8, (1, 0, 0), 1, 0, 10, 1);
						sphere(self.track_ent.tracking.origin, 4, (0, 0, 1), 1, 0, 10, 1);
					}
				#/
				org = self gettagorigin(tag_body);
				ang = self gettagangles(var_7dfc67b2);
				var_ba943ae1 = self gettagangles(var_5d9bcd31);
				var_bca870f9 = angleclamp180(ang - var_ba943ae1);
				var_54c9ea3b = (0, var_bca870f9[1], 0);
				var_26ea01fb = vectortoangles(self.track_ent.origin - org);
				var_bca870f9 = angleclamp180(var_26ea01fb - var_ba943ae1);
				var_54c9ea3b = (0, var_bca870f9[1], 0);
				self function_2e566abb(var_7dfc67b2, (0, 0, 0), var_54c9ea3b);
				var_bca870f9 = angleclamp180(var_26ea01fb - ang);
				var_76d79dc0 = (var_bca870f9[0], 0, 0);
				self function_2e566abb(tag_body, (0, 0, 0), var_76d79dc0);
				/#
					fwd = anglestoforward(self gettagangles(tag_fx));
					fwd = vectornormalize(fwd);
					fwd = fwd * 2512;
				#/
			}
			waitframe(1);
		}
	}
	else
	{
		self notify(#"hash_55fc2759ea7b7c72");
	}
}

/*
	Name: function_371e91f5
	Namespace: cp_takedown
	Checksum: 0xAF046560
	Offset: 0x1518
	Size: 0x5C
	Parameters: 7
	Flags: Linked
*/
function function_371e91f5(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self setanimrestart(#"hash_55c97e9bf41cf070");
}

/*
	Name: function_c4e8d2c6
	Namespace: cp_takedown
	Checksum: 0xAC3BB212
	Offset: 0x1580
	Size: 0x5C
	Parameters: 7
	Flags: Linked
*/
function function_c4e8d2c6(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self setanimrestart(#"hash_7ed3204394a2ff5e");
}

/*
	Name: function_4cce7a86
	Namespace: cp_takedown
	Checksum: 0x7DFBF6E6
	Offset: 0x15E8
	Size: 0x5C
	Parameters: 7
	Flags: Linked
*/
function function_4cce7a86(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self setanimrestart(#"hash_65fb765a66b27ef1");
}

/*
	Name: function_3e1ddd25
	Namespace: cp_takedown
	Checksum: 0x27C2A9F3
	Offset: 0x1650
	Size: 0x5C
	Parameters: 7
	Flags: Linked
*/
function function_3e1ddd25(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self setanimrestart(#"hash_77cbdb56c22e71f");
}

/*
	Name: function_da9d1625
	Namespace: cp_takedown
	Checksum: 0x6D65DA63
	Offset: 0x16B8
	Size: 0x5C
	Parameters: 7
	Flags: Linked
*/
function function_da9d1625(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self setanimrestart(#"hash_3be8472c6114d6b6");
}

/*
	Name: function_5359a453
	Namespace: cp_takedown
	Checksum: 0xD785ED23
	Offset: 0x1720
	Size: 0x5C
	Parameters: 7
	Flags: Linked
*/
function function_5359a453(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self setanimrestart(#"hash_7e2b806a227352d0");
}

/*
	Name: function_3cb79acb
	Namespace: cp_takedown
	Checksum: 0x227E389C
	Offset: 0x1788
	Size: 0x5C
	Parameters: 7
	Flags: Linked
*/
function function_3cb79acb(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self setanimrestart(#"hash_7310b4167a3dbe5f");
}

/*
	Name: function_d93be6d9
	Namespace: cp_takedown
	Checksum: 0xADD36C23
	Offset: 0x17F0
	Size: 0x5C
	Parameters: 7
	Flags: None
*/
function function_d93be6d9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self setanimrestart(#"hash_7e27abd232bfd236");
}

/*
	Name: lerp_fov
	Namespace: cp_takedown
	Checksum: 0x37929310
	Offset: 0x1858
	Size: 0x342
	Parameters: 7
	Flags: Linked
*/
function lerp_fov(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	switch(bwasdemojump)
	{
		case 1:
		{
			self easing::function_f95cb457(undefined, 15.5, 0.5, #"linear");
			break;
		}
		case 2:
		{
			self easing::function_f95cb457(undefined, 20.2, 1.8, #"linear");
			self function_9e574055(0);
			self function_3c54e2b8(1);
			break;
		}
		case 3:
		{
			self function_9e574055(2);
			self easing::function_136edb11(undefined, 3, 0.1, #"linear", 1, 1);
			self function_d7be9a9f(15, 0.1);
			break;
		}
		case 5:
		{
			self easing::function_136edb11(undefined, 5.6, 2, #"linear", 1, 1);
			break;
		}
		case 0:
		{
			self function_9e574055(0);
			self function_3c54e2b8(2);
			self function_9ea7b4eb(2);
			self function_9298adaf(2);
			break;
		}
		case 6:
		{
			self easing::function_f95cb457(undefined, 17.2, 2, #"linear");
			self function_9e574055(0);
			self function_3c54e2b8(1);
			break;
		}
		case 7:
		{
			self easing::function_f95cb457(undefined, 20.2, 1.8, #"linear");
			self function_9e574055(0);
			self function_3c54e2b8(1);
			break;
		}
	}
}

/*
	Name: dof_enable_autofocus
	Namespace: cp_takedown
	Checksum: 0x671CEF28
	Offset: 0x1BA8
	Size: 0x1EE
	Parameters: 0
	Flags: None
*/
function dof_enable_autofocus()
{
	self endoncallback(&function_26826144, #"death", #"hash_b2522f6440eb5d5");
	self function_9e574055(1);
	self easing::function_136edb11(undefined, 5.6, 1, #"linear");
	while(true)
	{
		v_eye = self geteye();
		v_fwd = anglestoforward(self getcamangles());
		a_trace = physicstrace(v_eye, v_eye + (v_fwd * 1000), (1 * -1, 1 * -1, 1 * -1), (1, 1, 1), self, 1);
		var_a84275e3 = distance(v_eye, a_trace[#"position"] + (v_fwd * 1));
		if(var_a84275e3 < 100)
		{
			self function_9e574055(2);
		}
		else
		{
			self function_9e574055(1);
		}
		self function_d7be9a9f(var_a84275e3, 0);
		waitframe(1);
	}
}

/*
	Name: dof_disable_autofocus
	Namespace: cp_takedown
	Checksum: 0x440BC574
	Offset: 0x1DA0
	Size: 0x16
	Parameters: 0
	Flags: None
*/
function dof_disable_autofocus()
{
	self notify(#"hash_b2522f6440eb5d5");
}

/*
	Name: function_26826144
	Namespace: cp_takedown
	Checksum: 0x5A02150C
	Offset: 0x1DC0
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_26826144(str_notify)
{
	self function_9e574055(0);
	self function_3c54e2b8(1);
	self function_9ea7b4eb(1);
}

/*
	Name: function_f48f6d3
	Namespace: cp_takedown
	Checksum: 0xD5331188
	Offset: 0x1E20
	Size: 0x2C2
	Parameters: 7
	Flags: Linked
*/
function function_f48f6d3(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	var_eb22c4da = findvolumedecalindexarray("wreck_volume_decals");
	var_648616bf = findstaticmodelindexarray("plane_body");
	switch(bwastimejump)
	{
		case 0:
		{
			foreach(n_decal in var_eb22c4da)
			{
				hidevolumedecal(n_decal);
			}
			foreach(model in var_648616bf)
			{
				hidestaticmodel(model);
			}
			break;
		}
		case 1:
		{
			foreach(n_decal in var_eb22c4da)
			{
				unhidevolumedecal(n_decal);
			}
			foreach(model in var_648616bf)
			{
				unhidestaticmodel(model);
			}
			break;
		}
		default:
		{
			break;
		}
	}
}

/*
	Name: function_7f111718
	Namespace: cp_takedown
	Checksum: 0x58195BFA
	Offset: 0x20F0
	Size: 0x1AA
	Parameters: 7
	Flags: Linked
*/
function function_7f111718(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	var_648616bf = findstaticmodelindexarray("prewing_smash_debris ");
	switch(bwastimejump)
	{
		case 0:
		{
			foreach(model in var_648616bf)
			{
				hidestaticmodel(model);
			}
			break;
		}
		case 1:
		{
			foreach(model in var_648616bf)
			{
				unhidestaticmodel(model);
			}
			break;
		}
		default:
		{
			break;
		}
	}
}

/*
	Name: function_b06125f0
	Namespace: cp_takedown
	Checksum: 0x8AF1F99F
	Offset: 0x22A8
	Size: 0xEC
	Parameters: 7
	Flags: Linked
*/
function function_b06125f0(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump)
	{
		setpbgactivebank(fieldname, 2);
		function_be93487f(fieldname, 2, 0, 1, 0, 0);
	}
	else
	{
		setpbgactivebank(fieldname, 1);
		function_be93487f(fieldname, 1, 1, 0, 0, 0);
	}
}

/*
	Name: function_a315cdc9
	Namespace: cp_takedown
	Checksum: 0x99288F78
	Offset: 0x23A0
	Size: 0xC4
	Parameters: 7
	Flags: Linked
*/
function function_a315cdc9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		if(!self postfx::function_556665f2("pstfx_takedown_wreck_vision"))
		{
			self postfx::playpostfxbundle("pstfx_takedown_wreck_vision");
		}
	}
	else if(self postfx::function_556665f2("pstfx_takedown_wreck_vision"))
	{
		self postfx::exitpostfxbundle("pstfx_takedown_wreck_vision");
	}
}

/*
	Name: function_d126379e
	Namespace: cp_takedown
	Checksum: 0xD7F80820
	Offset: 0x2470
	Size: 0x284
	Parameters: 7
	Flags: Linked
*/
function function_d126379e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	weapons = [];
	switch(bwasdemojump)
	{
		case 1:
		{
			weapons[weapons.size] = getweapon(#"smg_standard_t9", "steadyaim", "elo2");
			weapons[weapons.size] = getweapon(#"smg_handling_t9", "steadyaim", "reflex", "grip");
			weapons[weapons.size] = getweapon(#"smg_heavy_t9", "acog");
			break;
		}
		case 2:
		{
			weapons[weapons.size] = getweapon(#"ar_standard_t9", array("holo", "steadyaim", "grip", "extclip"));
			weapons[weapons.size] = getweapon(#"sniper_quickscope_t9");
		}
		default:
		{
			weapons[weapons.size] = getweapon(#"smg_standard_t9", "steadyaim", "elo2");
			weapons[weapons.size] = getweapon(#"smg_handling_t9", "steadyaim", "reflex", "grip");
			weapons[weapons.size] = getweapon(#"smg_heavy_t9", "acog");
			break;
		}
	}
	self thread util::function_d126379e(fieldname, weapons);
}

