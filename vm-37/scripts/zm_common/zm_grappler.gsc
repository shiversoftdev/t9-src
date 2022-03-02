#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\hud_util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace zm_grappler;

/*
	Name: function_89f2df9
	Namespace: zm_grappler
	Checksum: 0x6C47E769
	Offset: 0x120
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_grappler", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_grappler
	Checksum: 0x2B909134
	Offset: 0x178
	Size: 0xC4
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	clientfield::register("scriptmover", "grappler_beam_source", 1, getminbitcountfornum(5), "int");
	clientfield::register("scriptmover", "grappler_beam_target", 1, getminbitcountfornum(5), "int");
	level.var_ddd7276e = [];
	for(id = 1; id < 5; id++)
	{
		level.var_ddd7276e[id] = 0;
	}
}

/*
	Name: function_8ac3bea9
	Namespace: zm_grappler
	Checksum: 0x80F724D1
	Offset: 0x248
	Size: 0x4
	Parameters: 0
	Flags: Private
*/
function private function_8ac3bea9()
{
}

/*
	Name: function_5f5a3405
	Namespace: zm_grappler
	Checksum: 0x375A2492
	Offset: 0x258
	Size: 0x9C
	Parameters: 0
	Flags: Private
*/
function private function_5f5a3405()
{
	foreach(key, value in level.var_ddd7276e)
	{
		if(value === 0)
		{
			level.var_ddd7276e[key] = 1;
			return key;
		}
	}
	return undefined;
}

/*
	Name: function_56813755
	Namespace: zm_grappler
	Checksum: 0x45C71376
	Offset: 0x300
	Size: 0x8A
	Parameters: 0
	Flags: None
*/
function function_56813755()
{
	foreach(value in level.var_ddd7276e)
	{
		if(value === 0)
		{
			return false;
		}
	}
	return true;
}

/*
	Name: function_2772f623
	Namespace: zm_grappler
	Checksum: 0xE27A51A
	Offset: 0x398
	Size: 0x5C
	Parameters: 1
	Flags: Private
*/
function private function_2772f623(id)
{
	/#
		assert(isdefined(level.var_ddd7276e[id]) && level.var_ddd7276e[id] === 1);
	#/
	level.var_ddd7276e[id] = 0;
}

/*
	Name: start_grapple
	Namespace: zm_grappler
	Checksum: 0x7C5107D4
	Offset: 0x400
	Size: 0x384
	Parameters: 4
	Flags: None
*/
function start_grapple(prone_2_run_roll, var_beb2295, n_type, n_speed)
{
	if(!isdefined(n_speed))
	{
		n_speed = 1800;
	}
	/#
		assert(n_type == 2);
	#/
	e_source = function_6be863a(prone_2_run_roll function_f21c3519(), prone_2_run_roll.angles);
	var_28ac1348 = function_6be863a(prone_2_run_roll function_f21c3519(), prone_2_run_roll.angles * -1);
	thread function_30a5f5c1(e_source, var_28ac1348);
	if(isdefined(var_28ac1348))
	{
		var_beb2295 function_a60cb756(1, 1);
		util::wait_network_frame();
		n_time = function_b9937e84(prone_2_run_roll, var_beb2295, n_speed);
		var_28ac1348.origin = prone_2_run_roll function_f21c3519();
		var_5f04bf66 = var_beb2295 function_f21c3519();
		var_28ac1348 playsound(#"zmb_grapple_start");
		var_28ac1348 moveto(var_5f04bf66, n_time);
		var_28ac1348 waittill(#"movedone");
		var_7fdf7771 = var_5f04bf66 - var_beb2295.origin;
		var_28ac1348.origin = var_beb2295.origin;
		if(isplayer(var_beb2295))
		{
			var_beb2295 playerlinkto(var_28ac1348, "tag_origin");
		}
		else
		{
			var_beb2295 linkto(var_28ac1348);
		}
		var_beb2295 playsound(#"zmb_grapple_grab");
		var_b7f19309 = prone_2_run_roll function_f21c3519() - var_7fdf7771;
		var_28ac1348 moveto(var_b7f19309, n_time);
		var_28ac1348 playsound(#"zmb_grapple_pull");
		var_28ac1348 waittill(#"movedone");
		function_c43e7cab();
		var_28ac1348 clientfield::set("grappler_beam_target", 0);
		var_beb2295 unlink();
		var_beb2295 function_a60cb756(0, 1);
		util::wait_network_frame();
		function_a8e7b940(var_28ac1348);
		function_a8e7b940(e_source);
	}
}

/*
	Name: function_c43e7cab
	Namespace: zm_grappler
	Checksum: 0x292315F7
	Offset: 0x790
	Size: 0x28
	Parameters: 0
	Flags: None
*/
function function_c43e7cab()
{
	while(is_true(level.var_acec7a44))
	{
		waitframe(1);
	}
}

/*
	Name: function_1b905efa
	Namespace: zm_grappler
	Checksum: 0x1062F158
	Offset: 0x7C0
	Size: 0xBC
	Parameters: 3
	Flags: Private
*/
function private function_1b905efa(e_source, e_target, id)
{
	if(isdefined(e_source) && isdefined(e_target))
	{
		util::waittill_any_ents_two(e_source, "death", e_target, "death");
	}
	else
	{
		if(isdefined(e_source))
		{
			e_source waittill(#"death");
		}
		else if(isdefined(e_target))
		{
			e_target waittill(#"death");
		}
	}
	util::wait_network_frame();
	function_2772f623(id);
}

/*
	Name: function_30a5f5c1
	Namespace: zm_grappler
	Checksum: 0xAE84CDFD
	Offset: 0x888
	Size: 0xE0
	Parameters: 2
	Flags: None
*/
function function_30a5f5c1(e_source, e_target)
{
	function_c43e7cab();
	level.var_acec7a44 = 1;
	var_352f8ca9 = function_5f5a3405();
	if(isdefined(e_source))
	{
		e_source clientfield::set("grappler_beam_source", var_352f8ca9);
	}
	util::wait_network_frame();
	if(isdefined(e_target))
	{
		e_target clientfield::set("grappler_beam_target", var_352f8ca9);
	}
	thread function_1b905efa(e_source, e_target, var_352f8ca9);
	util::wait_network_frame();
	level.var_acec7a44 = 0;
}

/*
	Name: function_b9937e84
	Namespace: zm_grappler
	Checksum: 0x2412FD2E
	Offset: 0x970
	Size: 0x64
	Parameters: 3
	Flags: Private
*/
function private function_b9937e84(var_ad3953a4, var_c53e9947, n_speed)
{
	n_distance = distance(var_ad3953a4 function_f21c3519(), var_c53e9947 function_f21c3519());
	return n_distance / n_speed;
}

/*
	Name: function_a60cb756
	Namespace: zm_grappler
	Checksum: 0xAEE7FE30
	Offset: 0x9E0
	Size: 0x1A4
	Parameters: 2
	Flags: None
*/
function function_a60cb756(var_b4666218, var_e9f8c8f3)
{
	if(!isdefined(self))
	{
		return;
	}
	if(var_b4666218 != is_true(self.var_564dec14))
	{
		if(is_true(var_b4666218))
		{
			self notify(#"hash_3219c34bb024ffb7");
		}
		else
		{
			self notify(#"hash_5d85f16cb4fd5a32");
		}
		self.var_564dec14 = var_b4666218;
		if(isplayer(self))
		{
			self freezecontrols(var_b4666218);
			self setplayercollision(!var_b4666218);
			if(var_b4666218)
			{
				self val::set(#"zm_grappler", "ignoreme");
				if(is_true(var_e9f8c8f3))
				{
					self.var_d6723cbc = self enableinvulnerability();
				}
			}
			else
			{
				self val::reset(#"zm_grappler", "ignoreme");
				if(!is_true(self.var_d6723cbc) && is_true(var_e9f8c8f3))
				{
					self disableinvulnerability();
				}
			}
		}
	}
}

/*
	Name: function_f21c3519
	Namespace: zm_grappler
	Checksum: 0x48DEE862
	Offset: 0xB90
	Size: 0x42
	Parameters: 0
	Flags: None
*/
function function_f21c3519()
{
	if(isdefined(self.var_9319fd9))
	{
		v_origin = self gettagorigin(self.var_9319fd9);
		return v_origin;
	}
	return self.origin;
}

/*
	Name: function_6be863a
	Namespace: zm_grappler
	Checksum: 0x7603D99D
	Offset: 0xBE0
	Size: 0x4A
	Parameters: 2
	Flags: None
*/
function function_6be863a(v_origin, v_angles)
{
	model = "tag_origin";
	e_ent = util::spawn_model(model, v_origin, v_angles);
	return e_ent;
}

/*
	Name: function_a8e7b940
	Namespace: zm_grappler
	Checksum: 0x1E2EBABE
	Offset: 0xC38
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_a8e7b940(var_28ac1348)
{
	if(isdefined(var_28ac1348))
	{
		var_28ac1348 delete();
	}
}

