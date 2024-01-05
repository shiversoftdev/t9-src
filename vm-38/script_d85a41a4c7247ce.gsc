#using scripts\core_common\util_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace namespace_fa1c4f0a;

/*
	Name: function_314c23d6
	Namespace: namespace_fa1c4f0a
	Checksum: 0xF55291A4
	Offset: 0x440
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_314c23d6()
{
	level notify(1542919097);
}

/*
	Name: main
	Namespace: namespace_fa1c4f0a
	Checksum: 0xA51C9971
	Offset: 0x460
	Size: 0x40C
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	clientfield::register("scriptmover", "" + #"portal", 1, 1, "int", &portal_fx, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_2a7da9a87ecef87b", 1, 1, "int", &function_36ab0d37, 0, 0);
	clientfield::register("scriptmover", "" + #"payload_teleport", 1, 2, "int", &function_5884461e, 0, 0);
	clientfield::register("toplayer", "" + #"hash_19f93b2cb70ea2c5", 1, 1, "int", &function_fa7a206b, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_75190371f51baf5f", 1, 1, "counter", &function_96636479, 0, 0);
	clientfield::register("vehicle", "" + #"hash_85dd1e407a282d9", 1, 1, "int", &function_691412b4, 0, 0);
	clientfield::register("vehicle", "" + #"hash_738f0a13dc61e2ec", 1, 1, "counter", &function_612a9925, 0, 0);
	clientfield::register("vehicle", "" + #"hash_711d7caaed939f5f", 1, 1, "int", &function_979e0ba7, 0, 0);
	clientfield::register("vehicle", "" + #"hash_34f922424fc18bfb", 1, 1, "counter", &function_c9a7fbd9, 0, 0);
	clientfield::register("vehicle", "" + #"hash_db052f565349c0d", 1, 1, "int", &function_89fa474d, 0, 0);
	clientfield::register("vehicle", "" + #"hash_357ba456a97117b8", 1, 1, "int", &function_41bc60b6, 0, 0);
	callback::on_vehicle_spawned(&on_vehicle_spawned);
	util::waitforclient(0);
}

/*
	Name: on_vehicle_spawned
	Namespace: namespace_fa1c4f0a
	Checksum: 0xDC743D43
	Offset: 0x878
	Size: 0x94
	Parameters: 1
	Flags: Linked, Private
*/
function private on_vehicle_spawned(localclientnum)
{
	if(self.vehicletype === #"hash_d069dee6a0076c8")
	{
		self function_3f24c5a(1);
		self.stunnedcallback = &stunnedcallback;
		self function_1f0c7136(0);
		self setanim("p9_fxanim_sv_payload_atv_static_anim");
	}
}

/*
	Name: function_41bc60b6
	Namespace: namespace_fa1c4f0a
	Checksum: 0x2ED33915
	Offset: 0x918
	Size: 0xCE
	Parameters: 7
	Flags: Linked
*/
function function_41bc60b6(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		if(isdefined(self gettagorigin("tag_body_animate")))
		{
			self.var_ced8ba73 = function_239993de(fieldname, "sr/fx9_obj_payload_aether_portal_veh_interact_lg", self, "tag_body_animate");
		}
	}
	else if(isdefined(self.var_ced8ba73))
	{
		stopfx(fieldname, self.var_ced8ba73);
		self.var_ced8ba73 = undefined;
	}
}

/*
	Name: function_89fa474d
	Namespace: namespace_fa1c4f0a
	Checksum: 0xAEC9C1FC
	Offset: 0x9F0
	Size: 0x2C2
	Parameters: 7
	Flags: Linked
*/
function function_89fa474d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		if(isdefined(self.stop_id))
		{
			killfx(fieldname, self.stop_id);
			self.stop_id = undefined;
		}
		if(isdefined(self gettagorigin("tag_body_animate")))
		{
			self.var_bd74ce24 = function_239993de(fieldname, "sr/fx9_veh_payload_light_side", self, "tag_body_animate");
		}
		if(isdefined(self.var_cba3a992))
		{
			killfx(fieldname, self.var_cba3a992);
			self.var_cba3a992 = undefined;
		}
		if(isdefined(self gettagorigin("tag_fx_headlight_left")))
		{
			self.var_d811dda6 = function_239993de(fieldname, "sr/fx9_veh_payload_light_top_green", self, "tag_fx_headlight_left");
		}
		if(isdefined(self.var_e818b36c))
		{
			stopfx(fieldname, self.var_e818b36c);
			self.var_e818b36c = undefined;
		}
		wait(0.25);
		if(isdefined(self.var_e818b36c))
		{
			stopfx(fieldname, self.var_e818b36c);
			self.var_e818b36c = undefined;
		}
	}
	else
	{
		if(isdefined(self.var_bd74ce24))
		{
			killfx(fieldname, self.var_bd74ce24);
			self.var_bd74ce24 = undefined;
		}
		if(isdefined(self gettagorigin("tag_body_animate")))
		{
			self.stop_id = function_239993de(fieldname, "sr/fx9_veh_payload_light_brake_side", self, "tag_body_animate");
		}
		if(isdefined(self.var_d811dda6))
		{
			killfx(fieldname, self.var_d811dda6);
			self.var_d811dda6 = undefined;
		}
		if(isdefined(self gettagorigin("tag_fx_headlight_left")))
		{
			self.var_cba3a992 = function_239993de(fieldname, "sr/fx9_veh_payload_light_top_red", self, "tag_fx_headlight_left");
		}
	}
}

/*
	Name: function_c9a7fbd9
	Namespace: namespace_fa1c4f0a
	Checksum: 0xDDB5ABB8
	Offset: 0xCC0
	Size: 0x1C4
	Parameters: 7
	Flags: Linked
*/
function function_c9a7fbd9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self clearanim("p9_fxanim_sv_payload_atv_loop_anim", 0.2);
	wait(0.15);
	self setanim("p9_fxanim_sv_payload_atv_extend_anim");
	wait(getanimlength("p9_fxanim_sv_payload_atv_extend_anim") + 0.5);
	self clearanim("p9_fxanim_sv_payload_atv_extend_anim", 0.2);
	wait(0.15);
	self setanim("p9_fxanim_sv_payload_atv_extend_loop_anim");
	wait(1);
	self clearanim("p9_fxanim_sv_payload_atv_extend_loop_anim", 0.2);
	wait(0.15);
	self setanim("p9_fxanim_sv_payload_atv_retract_anim");
	wait(getanimlength("p9_fxanim_sv_payload_atv_retract_anim") + 0.5);
	self clearanim("p9_fxanim_sv_payload_atv_retract_anim", 0.25);
	wait(0.15);
	self setanim("p9_fxanim_sv_payload_atv_loop_anim");
}

/*
	Name: function_979e0ba7
	Namespace: namespace_fa1c4f0a
	Checksum: 0x6FE5B47B
	Offset: 0xE90
	Size: 0x154
	Parameters: 7
	Flags: Linked
*/
function function_979e0ba7(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self clearanim("p9_fxanim_sv_payload_atv_static_anim", 0.2);
	wait(0.15);
	self setanim("p9_fxanim_sv_payload_atv_initiate_anim");
	wait(getanimlength("p9_fxanim_sv_payload_atv_initiate_anim") + 1);
	self clearanim("p9_fxanim_sv_payload_atv_initiate_anim", 0.2);
	wait(0.15);
	self setanim("p9_fxanim_sv_payload_atv_loop_anim");
	v_org = self gettagorigin("tag_camera_d0");
	if(isdefined(v_org))
	{
		function_239993de(bwastimejump, "sr/fx9_veh_payload_light_camera", self, "tag_camera_d0");
	}
}

/*
	Name: function_612a9925
	Namespace: namespace_fa1c4f0a
	Checksum: 0xA5533546
	Offset: 0xFF0
	Size: 0x54
	Parameters: 7
	Flags: Linked
*/
function function_612a9925(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self function_1f0c7136(3);
}

/*
	Name: stunnedcallback
	Namespace: namespace_fa1c4f0a
	Checksum: 0x4C66E961
	Offset: 0x1050
	Size: 0x2C
	Parameters: 2
	Flags: Linked
*/
function stunnedcallback(localclientnum, val)
{
	self setstunned(val);
}

/*
	Name: function_5884461e
	Namespace: namespace_fa1c4f0a
	Checksum: 0x6A444A13
	Offset: 0x1088
	Size: 0x10E
	Parameters: 7
	Flags: Linked
*/
function function_5884461e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self util::waittill_dobj(fieldname);
	if(bwastimejump == 1)
	{
		function_239993de(fieldname, "sr/fx9_obj_payload_teleport_depart", self, "tag_origin");
	}
	else
	{
		if(bwastimejump == 2)
		{
			self.var_c25fe395 = util::playfxontag(fieldname, "sr/fx9_obj_payload_aether_portal_pillar", self, "tag_origin");
		}
		else if(isdefined(self.var_c25fe395))
		{
			stopfx(fieldname, self.var_c25fe395);
			self.var_c25fe395 = undefined;
		}
	}
}

/*
	Name: function_96636479
	Namespace: namespace_fa1c4f0a
	Checksum: 0xB99B10AC
	Offset: 0x11A0
	Size: 0x64
	Parameters: 7
	Flags: Linked
*/
function function_96636479(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	util::playfxontag(bwastimejump, "sr/fx9_obj_payload_aether_portal_exp_buildup", self, "tag_origin");
}

/*
	Name: function_fa7a206b
	Namespace: namespace_fa1c4f0a
	Checksum: 0x35FE1DC6
	Offset: 0x1210
	Size: 0x1A4
	Parameters: 7
	Flags: Linked
*/
function function_fa7a206b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		if(function_65b9eb0f(fieldname))
		{
			return;
		}
		self postfx::playpostfxbundle(#"pstfx_speedblur");
		self function_116b95e5(#"pstfx_speedblur", #"hash_77259d33b3998de9", 0.3);
		self function_116b95e5(#"pstfx_speedblur", #"hash_1a3ba6e8a0732aac", 0.8);
		self thread paintjob_stickers_s3_rokkr_majormaniak_base_ms();
	}
	else
	{
		if(function_65b9eb0f(fieldname))
		{
			return;
		}
		self notify(#"hash_639f680ae2bb2ff");
		wait(0.5);
		self function_116b95e5(#"pstfx_speedblur", #"blur", 0);
		self postfx::exitpostfxbundle(#"pstfx_speedblur");
	}
}

/*
	Name: paintjob_stickers_s3_rokkr_majormaniak_base_ms
	Namespace: namespace_fa1c4f0a
	Checksum: 0xD4AE73DA
	Offset: 0x13C0
	Size: 0xC0
	Parameters: 0
	Flags: Linked
*/
function paintjob_stickers_s3_rokkr_majormaniak_base_ms()
{
	self endon(#"death", #"disconnect", #"hash_639f680ae2bb2ff");
	n_blur = 0.01;
	while(true)
	{
		self function_116b95e5(#"pstfx_speedblur", #"blur", n_blur);
		wait(0.08);
		if(n_blur < 0.3)
		{
			n_blur = n_blur + 0.01;
		}
	}
}

/*
	Name: portal_fx
	Namespace: namespace_fa1c4f0a
	Checksum: 0x12D3A51B
	Offset: 0x1488
	Size: 0xA4
	Parameters: 7
	Flags: Linked
*/
function portal_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self.var_ae8b25ed = util::playfxontag(fieldname, "sr/fx9_obj_payload_aether_portal", self, "tag_origin");
	}
	else if(isdefined(self.var_ae8b25ed))
	{
		stopfx(fieldname, self.var_ae8b25ed);
	}
}

/*
	Name: function_36ab0d37
	Namespace: namespace_fa1c4f0a
	Checksum: 0xE926E665
	Offset: 0x1538
	Size: 0xCC
	Parameters: 7
	Flags: Linked
*/
function function_36ab0d37(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self.var_2d3c8170 = util::playfxontag(fieldname, "sr/fx9_obj_payload_aether_rift", self, "tag_origin");
	}
	else
	{
		if(isdefined(self.var_2d3c8170))
		{
			stopfx(fieldname, self.var_2d3c8170);
		}
		function_239993de(fieldname, "sr/fx9_obj_payload_aether_rift_close", self, "tag_origin");
	}
}

/*
	Name: function_691412b4
	Namespace: namespace_fa1c4f0a
	Checksum: 0x61722134
	Offset: 0x1610
	Size: 0x12A
	Parameters: 7
	Flags: Linked
*/
function function_691412b4(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	if(bwastimejump == 1)
	{
		if(isdefined(self gettagorigin("tag_body_animate")))
		{
			self.var_942f8233 = util::playfxontag(fieldname, "sr/fx9_obj_payload_aether_portal_veh_trail", self, "tag_origin");
		}
	}
	else
	{
		if(isdefined(self.var_942f8233))
		{
			stopfx(fieldname, self.var_942f8233);
		}
		if(isdefined(self gettagorigin("tag_body_animate")))
		{
			self.var_e818b36c = util::playfxontag(fieldname, "sr/fx9_obj_payload_aether_portal_veh_trail_impact", self, "tag_origin");
		}
	}
}

