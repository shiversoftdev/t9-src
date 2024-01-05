#using script_31671175564a93b7;
#using script_1cd690a97dfca36e;
#using script_3318f11e3a1b2358;
#using script_dfd475a961626c7;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\vehicle_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\fx_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace namespace_db2381c4;

/*
	Name: function_4b2a0ea3
	Namespace: namespace_db2381c4
	Checksum: 0x8F0317D7
	Offset: 0x8F0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4b2a0ea3()
{
	level notify(-1407960418);
}

/*
	Name: __init__system__
	Namespace: namespace_db2381c4
	Checksum: 0x215000B9
	Offset: 0x910
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_4ddffaa090d81227", &function_c7f33cce, &function_fa076c68, undefined, undefined);
}

/*
	Name: function_c7f33cce
	Namespace: namespace_db2381c4
	Checksum: 0xB4DE7BC2
	Offset: 0x968
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_c7f33cce()
{
	if(!isdefined(level._fx))
	{
		level._fx = {};
	}
	function_bc948200();
}

/*
	Name: function_fa076c68
	Namespace: namespace_db2381c4
	Checksum: 0xCC6979FE
	Offset: 0x9A8
	Size: 0x94
	Parameters: 0
	Flags: Linked, Private
*/
function private function_fa076c68()
{
	vehicle::add_vehicletype_callback(#"hash_1598bee2e954e43a", &function_54f94439);
	vehicle::add_vehicletype_callback(#"hash_46249425f37afc74", &function_5f6bf482);
	vehicle::add_vehicletype_callback(#"hash_1d28a638b43b4117", &function_d7fc17ab);
}

/*
	Name: function_bc948200
	Namespace: namespace_db2381c4
	Checksum: 0x843188A1
	Offset: 0xA48
	Size: 0x43C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_bc948200()
{
	clientfield::register("scriptmover", "clf_billiardslight_client_register", 1, 1, "int", &function_efaa9fbd, 0, 0);
	clientfield::register("scriptmover", "clf_billiardslight_fx", 1, 1, "int", &function_786ac693, 0, 0);
	clientfield::register("scriptmover", "clf_cargoplane_client_register", 1, 1, "int", &function_a9581e24, 0, 0);
	clientfield::register("scriptmover", "clf_cargoplane_door_sparks", 1, 1, "int", &function_49365e3b, 0, 0);
	clientfield::register("scriptmover", "clf_cargoplane_landing_lights", 1, 1, "int", &function_5caef633, 0, 0);
	clientfield::register("scriptmover", "clf_cargoplane_nav_lights", 1, 1, "int", &function_c4178945, 0, 0);
	clientfield::register("vehicle", "clf_rccar_fxstate", 1, 8, "int", &function_b68c2eb9, 0, 0);
	clientfield::register("vehicle", "clf_bronco_roof_lights", 1, 1, "int", &function_979cbf76, 0, 0);
	clientfield::register("vehicle", "clf_bronco_cab_lights", 1, 1, "int", &function_f6936758, 0, 0);
	clientfield::register("vehicle", "clf_whizbyfx_bronco", 1, 1, "int", &function_92a58466, 0, 0);
	clientfield::register("toplayer", "clf_postfx_rccar", 1, 1, "int", &function_a4c9adb9, 0, 0);
	clientfield::register("toplayer", "clf_postfx_transition", 1, 1, "int", &function_f14b954c, 0, 0);
	clientfield::register("toplayer", "clf_postfx_rooftop_slide", 1, 1, "int", &function_636d3664, 0, 0);
	clientfield::register("toplayer", "clf_footstep_override", 1, 1, "int", &function_4a75f4b6, 0, 0);
	clientfield::register("actor", "clf_rob_snipercam_blood", 1, 2, "int", &function_d1374213, 0, 0);
}

/*
	Name: function_4a75f4b6
	Namespace: namespace_db2381c4
	Checksum: 0xE5EA3E89
	Offset: 0xE90
	Size: 0xB4
	Parameters: 7
	Flags: Linked, Private
*/
function private function_4a75f4b6(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	/#
		function_907070de("", localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump);
	#/
	if(newval)
	{
		function_27d5cafd(#"hash_6596d53586d3ef06", #"hash_6596d53586d3ef06");
	}
	else
	{
		function_27d5cafd();
	}
}

/*
	Name: function_efaa9fbd
	Namespace: namespace_db2381c4
	Checksum: 0x24192513
	Offset: 0xF50
	Size: 0x6A
	Parameters: 7
	Flags: Linked, Private
*/
function private function_efaa9fbd(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(level._fx))
	{
		level._fx = {};
	}
	level._fx.var_6e8a28b6 = self;
}

/*
	Name: function_786ac693
	Namespace: namespace_db2381c4
	Checksum: 0x8A176557
	Offset: 0xFC8
	Size: 0xC6
	Parameters: 7
	Flags: Linked, Private
*/
function private function_786ac693(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self util::waittill_dobj(localclientnum);
	/#
		function_907070de("", localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump);
	#/
	if(newval)
	{
		self function_7ab521db(localclientnum);
	}
	else
	{
		self notify(#"hash_50cc63ed1ff3cc9a");
	}
}

/*
	Name: function_7ab521db
	Namespace: namespace_db2381c4
	Checksum: 0x1B487DDE
	Offset: 0x1098
	Size: 0x6C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7ab521db(localclientnum)
{
	self notify(#"hash_6c3d9a30da5f352d");
	fxid = util::playfxontag(localclientnum, "maps/cp_takedown/fx9_hit2_billiards_light", self, "tag_light");
	self thread function_ef765af1(localclientnum, fxid);
}

/*
	Name: function_ef765af1
	Namespace: namespace_db2381c4
	Checksum: 0xEE42DDF5
	Offset: 0x1110
	Size: 0x64
	Parameters: 2
	Flags: Linked, Private
*/
function private function_ef765af1(localclientnum, fxid)
{
	self waittill(#"death", #"hash_6c3d9a30da5f352d", #"hash_50cc63ed1ff3cc9a");
	stopfx(localclientnum, fxid);
}

/*
	Name: function_a9581e24
	Namespace: namespace_db2381c4
	Checksum: 0x2F684EE5
	Offset: 0x1180
	Size: 0x6A
	Parameters: 7
	Flags: Linked, Private
*/
function private function_a9581e24(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(level._fx))
	{
		level._fx = {};
	}
	level._fx.cargo_plane = self;
}

/*
	Name: function_5caef633
	Namespace: namespace_db2381c4
	Checksum: 0xF6ABAF97
	Offset: 0x11F8
	Size: 0xC6
	Parameters: 7
	Flags: Linked, Private
*/
function private function_5caef633(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self util::waittill_dobj(localclientnum);
	/#
		function_907070de("", localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump);
	#/
	if(newval)
	{
		self function_9a0e9c31(localclientnum);
	}
	else
	{
		self notify(#"hash_10d9c330299e2a6d");
	}
}

/*
	Name: function_9a0e9c31
	Namespace: namespace_db2381c4
	Checksum: 0xD6ED2CBB
	Offset: 0x12C8
	Size: 0x64
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9a0e9c31(localclientnum)
{
	self notify(#"hash_16331609e21e3a86");
	var_3f79908d = playtagfxset(localclientnum, "fx9_cargo_plane_landing_lights", self);
	self thread function_b053bd08(localclientnum, var_3f79908d);
}

/*
	Name: function_b053bd08
	Namespace: namespace_db2381c4
	Checksum: 0x78289F78
	Offset: 0x1338
	Size: 0xD0
	Parameters: 2
	Flags: Linked, Private
*/
function private function_b053bd08(localclientnum, var_3f79908d)
{
	self waittill(#"death", #"hash_16331609e21e3a86", #"hash_10d9c330299e2a6d");
	foreach(fxid in var_3f79908d)
	{
		stopfx(localclientnum, fxid);
	}
}

/*
	Name: function_c4178945
	Namespace: namespace_db2381c4
	Checksum: 0xCE0CA51D
	Offset: 0x1410
	Size: 0xC6
	Parameters: 7
	Flags: Linked, Private
*/
function private function_c4178945(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self util::waittill_dobj(localclientnum);
	/#
		function_907070de("", localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump);
	#/
	if(newval)
	{
		self function_54105299(localclientnum);
	}
	else
	{
		self notify(#"hash_5bd6457a6c206a17");
	}
}

/*
	Name: function_54105299
	Namespace: namespace_db2381c4
	Checksum: 0x74DD5B87
	Offset: 0x14E0
	Size: 0x64
	Parameters: 1
	Flags: Linked, Private
*/
function private function_54105299(localclientnum)
{
	self notify(#"hash_8d07a9f3af1838");
	var_3f79908d = playtagfxset(localclientnum, "fx9_cargo_plane_nav_lights", self);
	self thread function_fa38e4db(localclientnum, var_3f79908d);
}

/*
	Name: function_fa38e4db
	Namespace: namespace_db2381c4
	Checksum: 0xBBDDD4F5
	Offset: 0x1550
	Size: 0xD0
	Parameters: 2
	Flags: Linked, Private
*/
function private function_fa38e4db(localclientnum, var_3f79908d)
{
	self waittill(#"death", #"hash_8d07a9f3af1838", #"hash_5bd6457a6c206a17");
	foreach(fxid in var_3f79908d)
	{
		stopfx(localclientnum, fxid);
	}
}

/*
	Name: function_49365e3b
	Namespace: namespace_db2381c4
	Checksum: 0x872357D5
	Offset: 0x1628
	Size: 0xC6
	Parameters: 7
	Flags: Linked, Private
*/
function private function_49365e3b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self util::waittill_dobj(localclientnum);
	/#
		function_907070de("", localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump);
	#/
	if(newval)
	{
		self function_ad43fc89(localclientnum);
	}
	else
	{
		self notify(#"hash_3d54cb0fcf6b56fa");
	}
}

/*
	Name: function_ad43fc89
	Namespace: namespace_db2381c4
	Checksum: 0xD7DF8306
	Offset: 0x16F8
	Size: 0x164
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ad43fc89(localclientnum)
{
	self notify(#"hash_23f28ccc6f5f0d8d");
	var_201ef63e = util::playfxontag(localclientnum, "maps/cp_takedown/fx9_takedown_pcrash_cargo_spark_loop_start", self, "tag_gate_flap_01");
	fxid2 = util::playfxontag(localclientnum, "maps/cp_takedown/fx9_takedown_pcrash_cargo_spark_loop_start", self, "tag_gate_flap_02");
	var_929f5b4d = util::playfxontag(localclientnum, "maps/cp_takedown/fx9_takedown_pcrash_cargo_spark_loop_start", self, "tag_gate_flap_03");
	var_a06276d3 = util::playfxontag(localclientnum, "maps/cp_takedown/fx9_takedown_pcrash_cargo_spark_loop_start", self, "tag_gate_flap_04");
	var_d76364c8 = util::playfxontag(localclientnum, "maps/cp_takedown/fx9_hit3_chase_prop_mist", self, "tag_engine_right_01_null");
	var_84e2bfd4 = util::playfxontag(localclientnum, "maps/cp_takedown/fx9_hit3_chase_prop_mist", self, "tag_engine_left_02_null");
	self thread function_9b722964(localclientnum, var_201ef63e, fxid2, var_929f5b4d, var_a06276d3, var_d76364c8, var_84e2bfd4);
}

/*
	Name: function_9b722964
	Namespace: namespace_db2381c4
	Checksum: 0x6D30C257
	Offset: 0x1868
	Size: 0x104
	Parameters: 7
	Flags: Linked, Private
*/
function private function_9b722964(localclientnum, var_201ef63e, fxid2, var_929f5b4d, var_a06276d3, var_d76364c8, var_84e2bfd4)
{
	self waittill(#"death", #"hash_23f28ccc6f5f0d8d", #"hash_3d54cb0fcf6b56fa");
	stopfx(localclientnum, var_201ef63e);
	stopfx(localclientnum, fxid2);
	stopfx(localclientnum, var_929f5b4d);
	stopfx(localclientnum, var_a06276d3);
	stopfx(localclientnum, var_d76364c8);
	stopfx(localclientnum, var_84e2bfd4);
}

/*
	Name: function_d7fc17ab
	Namespace: namespace_db2381c4
	Checksum: 0xA802589B
	Offset: 0x1978
	Size: 0x94
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d7fc17ab(localclientnum)
{
	if(!isdefined(level._fx))
	{
		level._fx = {};
	}
	self util::waittill_dobj(localclientnum);
	level._fx.var_a736d041 = self;
	var_3f79908d = playtagfxset(localclientnum, "fx9_cargo_plane_nav_lights", self);
	self thread function_5445f621(localclientnum, var_3f79908d);
}

/*
	Name: function_5445f621
	Namespace: namespace_db2381c4
	Checksum: 0x246DB475
	Offset: 0x1A18
	Size: 0xB0
	Parameters: 2
	Flags: Linked, Private
*/
function private function_5445f621(localclientnum, var_3f79908d)
{
	self waittill(#"death");
	foreach(fxid in var_3f79908d)
	{
		stopfx(localclientnum, fxid);
	}
}

/*
	Name: function_5f6bf482
	Namespace: namespace_db2381c4
	Checksum: 0x980BF73A
	Offset: 0x1AD0
	Size: 0x1B0
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5f6bf482(localclientnum)
{
	if(!isdefined(level._fx))
	{
		level._fx = {};
	}
	self util::waittill_dobj(localclientnum);
	level._fx.var_e561515d = self;
	level._fx.var_e561515d.var_7351c5a = [];
	level._fx.var_e561515d.var_7351c5a[1] = &function_5c750f8f;
	level._fx.var_e561515d.var_7351c5a[2] = &function_a718a890;
	level._fx.var_e561515d.var_7351c5a[4] = &function_2550ab3e;
	level._fx.var_e561515d.var_7351c5a[8] = &function_3383f5e2;
	level._fx.var_e561515d.var_7351c5a[16] = &function_4cfdb901;
	level._fx.var_e561515d.var_7351c5a[32] = &function_4cfdb901;
	level._fx.var_e561515d.var_7351c5a[64] = &function_4cfdb901;
	level._fx.var_e561515d.var_7351c5a[128] = &function_51de3dc2;
}

/*
	Name: function_b68c2eb9
	Namespace: namespace_db2381c4
	Checksum: 0x6BB04FCC
	Offset: 0x1C88
	Size: 0x164
	Parameters: 7
	Flags: Linked, Private
*/
function private function_b68c2eb9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	changed = fieldname ^ bwastimejump;
	if(!changed)
	{
		return;
	}
	/#
		println("");
	#/
	/#
		println(((((("" + fieldname) + "") + bwastimejump) + "") + changed) + "");
	#/
	/#
		println("");
	#/
	var_67e99fbd = 1;
	while(changed >= var_67e99fbd)
	{
		if(changed & var_67e99fbd)
		{
			self thread [[level._fx.var_e561515d.var_7351c5a[var_67e99fbd]]](binitialsnap, bwastimejump);
		}
		var_67e99fbd = var_67e99fbd << 1;
	}
	/#
		println("");
	#/
}

/*
	Name: function_d4cb569b
	Namespace: namespace_db2381c4
	Checksum: 0x20C29ABA
	Offset: 0x1DF8
	Size: 0x8E
	Parameters: 3
	Flags: Linked, Private
*/
function private function_d4cb569b(localclientnum, fxid, end_notify)
{
	self waittill(#"death", #"fx_death", end_notify);
	stopfx(localclientnum, fxid);
	if(isdefined(self.loopsnd))
	{
		snd::stop(self.loopsnd);
		self.loopsnd = undefined;
	}
}

/*
	Name: function_5c750f8f
	Namespace: namespace_db2381c4
	Checksum: 0xDB9979C0
	Offset: 0x1E90
	Size: 0x9C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_5c750f8f(localclientnum, state)
{
	self notify("1b2da60ebd37930");
	self endon("1b2da60ebd37930");
	self endon(#"death", #"fx_death");
	if(state & 1)
	{
		/#
			println("");
		#/
	}
	else
	{
		/#
			println("");
		#/
	}
}

/*
	Name: function_a718a890
	Namespace: namespace_db2381c4
	Checksum: 0xE32F7268
	Offset: 0x1F38
	Size: 0xFE
	Parameters: 2
	Flags: Linked, Private
*/
function private function_a718a890(localclientnum, state)
{
	self notify("311048a0bc7152f6");
	self endon("311048a0bc7152f6");
	self endon(#"death", #"fx_death");
	if(state & 2)
	{
		/#
			println("");
		#/
		fxid = util::playfxontag(localclientnum, "maps/cp_takedown/fx9_td_rc_flashlight", self, "tag_fx_flashlight");
		self thread function_d4cb569b(localclientnum, fxid, "stop_flashlight_fx");
	}
	else
	{
		/#
			println("");
		#/
		self notify(#"stop_flashlight_fx");
	}
}

/*
	Name: function_2550ab3e
	Namespace: namespace_db2381c4
	Checksum: 0xCC759541
	Offset: 0x2040
	Size: 0xD6
	Parameters: 2
	Flags: Linked, Private
*/
function private function_2550ab3e(localclientnum, state)
{
	self notify("441a582706e2ec76");
	self endon("441a582706e2ec76");
	self endon(#"death", #"fx_death");
	if(state & 4)
	{
		/#
			println("");
		#/
		self thread function_7dc13ec9(localclientnum);
	}
	else
	{
		/#
			println("");
		#/
		self notify(#"hash_28344e38d8947eea");
		self notify(#"stop_blink_fx");
	}
}

/*
	Name: function_7dc13ec9
	Namespace: namespace_db2381c4
	Checksum: 0x728D9CF8
	Offset: 0x2120
	Size: 0x240
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7dc13ec9(localclientnum)
{
	self notify("4486f93a90fd6e7");
	self endon("4486f93a90fd6e7");
	self endon(#"death", #"fx_death", #"hash_28344e38d8947eea");
	if(isdefined(level._fx.cargo_plane))
	{
		var_3b16b806 = sqr(400);
		var_87c1e213 = sqr(2500);
		while(true)
		{
			distsqr = distance2dsquared(self.origin, level._fx.cargo_plane.origin);
			self.fx_interval = (distsqr - var_3b16b806) / (var_87c1e213 - var_3b16b806);
			self.fx_interval = max(0.1, min(1, self.fx_interval));
			self notify(#"stop_blink_fx");
			var_b2b52cb5 = self.fx_interval * 0.5;
			util::server_wait(localclientnum, var_b2b52cb5);
			fxid = util::playfxontag(localclientnum, "maps/cp_takedown/fx9_td_rc_light_red", self, "tag_fx_light_rear");
			self thread function_d4cb569b(localclientnum, fxid, "stop_blink_fx");
			snd::play("wpn_tkd_rcxd_detonate_timer", [1:"tag_fx_light_rear", 0:self]);
			util::server_wait(localclientnum, var_b2b52cb5);
		}
	}
}

/*
	Name: function_3383f5e2
	Namespace: namespace_db2381c4
	Checksum: 0xCBC8C88D
	Offset: 0x2368
	Size: 0x13E
	Parameters: 2
	Flags: Linked, Private
*/
function private function_3383f5e2(localclientnum, state)
{
	self notify("7df042faaef394e8");
	self endon("7df042faaef394e8");
	self endon(#"death", #"fx_death");
	if(state & 8)
	{
		/#
			println("");
		#/
		fxid = util::playfxontag(localclientnum, "maps/cp_takedown/fx9_td_rc_light_green", self, "tag_fx_light_rear");
		self thread function_d4cb569b(localclientnum, fxid, "stop_proximity_fx");
		self.loopsnd = snd::play("wpn_tkd_rcxd_detonate_timer_ready", [1:"tag_fx_light_rear", 0:self]);
	}
	else
	{
		/#
			println("");
		#/
		self notify(#"stop_proximity_fx");
	}
}

/*
	Name: function_4cfdb901
	Namespace: namespace_db2381c4
	Checksum: 0xAE8CA94B
	Offset: 0x24B0
	Size: 0x296
	Parameters: 2
	Flags: Linked, Private
*/
function private function_4cfdb901(localclientnum, state)
{
	self notify("6b1164a992a5029b");
	self endon("6b1164a992a5029b");
	self endon(#"death", #"fx_death");
	if(state & 16)
	{
		/#
			println("");
		#/
		snd::play("wpn_tkd_rcxd_impact_lt");
		fxid = util::playfxontag(localclientnum, "maps/cp_takedown/fx9_td_rc_damage_light", self, "tag_origin");
		self thread function_d4cb569b(localclientnum, fxid, "stop_damage_light_fx");
	}
	else
	{
		/#
			println("");
		#/
		self notify(#"stop_damage_light_fx");
	}
	if(state & 32)
	{
		/#
			println("");
		#/
		snd::play("wpn_tkd_rcxd_impact_md");
		fxid = util::playfxontag(localclientnum, "maps/cp_takedown/fx9_td_rc_damage_medium", self, "tag_origin");
		self thread function_d4cb569b(localclientnum, fxid, "stop_damage_medium_fx");
	}
	else
	{
		/#
			println("");
		#/
		self notify(#"stop_damage_medium_fx");
	}
	if(state & 64)
	{
		/#
			println("");
		#/
		snd::play("wpn_tkd_rcxd_impact_hv");
		fxid = util::playfxontag(localclientnum, "maps/cp_takedown/fx9_td_rc_damage_heavy", self, "tag_origin");
		self thread function_d4cb569b(localclientnum, fxid, "stop_damage_heavy_fx");
	}
	else
	{
		/#
			println("");
		#/
		self notify(#"stop_damage_heavy_fx");
	}
}

/*
	Name: function_51de3dc2
	Namespace: namespace_db2381c4
	Checksum: 0xC60548EF
	Offset: 0x2750
	Size: 0xDE
	Parameters: 2
	Flags: Linked, Private
*/
function private function_51de3dc2(localclientnum, state)
{
	self notify("6db46cb8b5275540");
	self endon("6db46cb8b5275540");
	if(state & 128)
	{
		/#
			println("");
		#/
		fxid = util::playfxontag(localclientnum, "maps/cp_takedown/fx9_td_rc_exp_c4", self, "tag_origin");
		self thread function_d4cb569b(localclientnum, fxid, "stop_death_fx");
	}
	else
	{
		/#
			println("");
		#/
		self notify(#"stop_death_fx");
	}
}

/*
	Name: function_54f94439
	Namespace: namespace_db2381c4
	Checksum: 0x617D567B
	Offset: 0x2838
	Size: 0x4E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_54f94439(localclientnum)
{
	if(!isdefined(level._fx))
	{
		level._fx = {};
	}
	self util::waittill_dobj(localclientnum);
	level._fx.var_56d8a882 = self;
}

/*
	Name: function_979cbf76
	Namespace: namespace_db2381c4
	Checksum: 0x55CDBD25
	Offset: 0x2890
	Size: 0xC6
	Parameters: 7
	Flags: Linked, Private
*/
function private function_979cbf76(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self util::waittill_dobj(localclientnum);
	/#
		function_907070de("", localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump);
	#/
	if(newval)
	{
		self function_bc597003(localclientnum);
	}
	else
	{
		self notify(#"hash_34ad886fbd5f4182");
	}
}

/*
	Name: function_bc597003
	Namespace: namespace_db2381c4
	Checksum: 0x8D48B437
	Offset: 0x2960
	Size: 0x64
	Parameters: 1
	Flags: Linked, Private
*/
function private function_bc597003(localclientnum)
{
	self notify(#"hash_6391f06161389fb");
	var_3f79908d = playtagfxset(localclientnum, "fx9_bronco_roof_lights", self);
	self thread function_b671b8d8(localclientnum, var_3f79908d);
}

/*
	Name: function_b671b8d8
	Namespace: namespace_db2381c4
	Checksum: 0xB9EB5CEA
	Offset: 0x29D0
	Size: 0xD0
	Parameters: 2
	Flags: Linked, Private
*/
function private function_b671b8d8(localclientnum, var_3f79908d)
{
	self waittill(#"death", #"hash_6391f06161389fb", #"hash_34ad886fbd5f4182");
	foreach(fxid in var_3f79908d)
	{
		stopfx(localclientnum, fxid);
	}
}

/*
	Name: function_f6936758
	Namespace: namespace_db2381c4
	Checksum: 0x7B02129
	Offset: 0x2AA8
	Size: 0xC6
	Parameters: 7
	Flags: Linked, Private
*/
function private function_f6936758(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self util::waittill_dobj(localclientnum);
	/#
		function_907070de("", localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump);
	#/
	if(newval)
	{
		self function_3ff9983b(localclientnum);
	}
	else
	{
		self notify(#"hash_22f3d135b4aea2a6");
	}
}

/*
	Name: function_3ff9983b
	Namespace: namespace_db2381c4
	Checksum: 0x830ADE18
	Offset: 0x2B78
	Size: 0x64
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3ff9983b(localclientnum)
{
	self notify(#"hash_26c936f0d412b1c9");
	var_3f79908d = playtagfxset(localclientnum, "fx9_bronco_cab_lights", self);
	self thread function_3d982979(localclientnum, var_3f79908d);
}

/*
	Name: function_3d982979
	Namespace: namespace_db2381c4
	Checksum: 0x61204BD8
	Offset: 0x2BE8
	Size: 0xD0
	Parameters: 2
	Flags: Linked, Private
*/
function private function_3d982979(localclientnum, var_3f79908d)
{
	self waittill(#"death", #"hash_26c936f0d412b1c9", #"hash_22f3d135b4aea2a6");
	foreach(fxid in var_3f79908d)
	{
		stopfx(localclientnum, fxid);
	}
}

/*
	Name: function_a4c9adb9
	Namespace: namespace_db2381c4
	Checksum: 0x2F807B41
	Offset: 0x2CC0
	Size: 0xC4
	Parameters: 7
	Flags: Linked, Private
*/
function private function_a4c9adb9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	/#
		function_907070de("", localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump);
	#/
	self notify(#"hash_18d68ed133347a19");
	if(newval)
	{
		self thread function_40f427f7();
	}
	else
	{
		self thread function_fe60975();
	}
}

/*
	Name: function_40f427f7
	Namespace: namespace_db2381c4
	Checksum: 0xF6D2C8BF
	Offset: 0x2D90
	Size: 0x194
	Parameters: 0
	Flags: Linked, Private
*/
function private function_40f427f7()
{
	self notify("33575834ba727e2");
	self endon("33575834ba727e2");
	self endon(#"death", #"hash_18d68ed133347a19");
	if(self postfx::function_556665f2("pstfx_vehicle_rcxd_fade_in") || self postfx::function_556665f2("pstfx_speedblur") || self postfx::function_556665f2("pstfx_rain_loop_tkdn_rccar"))
	{
		self postfx::stoppostfxbundle("pstfx_vehicle_rcxd_fade_in");
		self postfx::stoppostfxbundle("pstfx_speedblur");
		self postfx::stoppostfxbundle("pstfx_rain_loop_tkdn_rccar");
	}
	self postfx::playpostfxbundle("pstfx_vehicle_rcxd_fade_in");
	namespace_a052577e::function_b233d29e(0.5, 0);
	wait(1);
	self postfx::playpostfxbundle("pstfx_speedblur");
	self postfx::playpostfxbundle("pstfx_rain_loop_tkdn_rccar");
	self thread function_23f6671d();
}

/*
	Name: function_fe60975
	Namespace: namespace_db2381c4
	Checksum: 0xC56118DC
	Offset: 0x2F30
	Size: 0xBC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_fe60975()
{
	self notify("244e3efdeb0cf8b6");
	self endon("244e3efdeb0cf8b6");
	self endon(#"death", #"hash_18d68ed133347a19");
	self postfx::stoppostfxbundle("pstfx_speedblur");
	self postfx::stoppostfxbundle("pstfx_rain_loop_tkdn_rccar");
	self postfx::playpostfxbundle("pstfx_vehicle_rcxd_fade_out");
	namespace_a052577e::function_b233d29e(0.5, 0);
}

/*
	Name: function_23f6671d
	Namespace: namespace_db2381c4
	Checksum: 0x17E1F8DA
	Offset: 0x2FF8
	Size: 0x47E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_23f6671d()
{
	self notify("4e8916e051945f74");
	self endon("4e8916e051945f74");
	self endon(#"death", #"hash_18d68ed133347a19");
	if(!isdefined(level._fx.var_e561515d))
	{
		return;
	}
	self postfx::function_c8b5f318("pstfx_speedblur", "Inner Mask", 0.15);
	self postfx::function_c8b5f318("pstfx_speedblur", "Outer Mask", 0.8);
	self postfx::function_c8b5f318("pstfx_speedblur", "Blur", 0);
	self postfx::function_c8b5f318("pstfx_rain_loop_tkdn_rccar", "Sprite Count Squash", 1);
	setdvar(#"hash_252e699c41531f1a", 2);
	setdvar(#"hash_38c17ad45d6603c0", 0.2);
	while(true)
	{
		level._fx.var_e561515d.velocity = function_72c0c267(level._fx.var_e561515d getvelocity(), level._fx.var_e561515d.angles);
		scalar = level._fx.var_e561515d.velocity[0] / 1100;
		scalar = max(0, min(1, scalar));
		var_75128a58 = 1 - scalar;
		lateral = level._fx.var_e561515d.velocity[1] / 20;
		lateral = max(-1, min(1, lateral));
		lateral = lateral * 0.5;
		focal_point = (level._fx.var_e561515d.origin + (anglestoforward(level._fx.var_e561515d.angles) * 100)) + vectorscale((0, 0, 1), 15);
		var_2233e093 = self function_a6a764a9(focal_point, 1);
		if(isdefined(var_2233e093))
		{
			self postfx::function_c8b5f318("pstfx_speedblur", "X Offset", var_2233e093[0]);
			self postfx::function_c8b5f318("pstfx_speedblur", "Y Offset", var_2233e093[1]);
			self postfx::function_c8b5f318("pstfx_rain_loop_tkdn_rccar", "Origin X", var_2233e093[0] + lateral);
			self postfx::function_c8b5f318("pstfx_rain_loop_tkdn_rccar", "Origin Y", var_2233e093[1]);
		}
		self postfx::function_c8b5f318("pstfx_speedblur", "Blur", 0.05 * sqr(scalar));
		self postfx::function_c8b5f318("pstfx_rain_loop_tkdn_rccar", "Sprite Count Squash", sqr(var_75128a58));
		waitframe(1);
	}
}

/*
	Name: function_92a58466
	Namespace: namespace_db2381c4
	Checksum: 0x132B0977
	Offset: 0x3480
	Size: 0xAE
	Parameters: 7
	Flags: Linked, Private
*/
function private function_92a58466(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		fxid = util::playfxontag(fieldname, "maps/cp_takedown/fx9_takedown_rc_view_wisp", self, "tag_origin");
		self thread function_86203754(fieldname, fxid);
	}
	else
	{
		self notify(#"hash_18ccf59470efbae9");
	}
}

/*
	Name: function_86203754
	Namespace: namespace_db2381c4
	Checksum: 0x9DBE2F4D
	Offset: 0x3538
	Size: 0x54
	Parameters: 2
	Flags: Linked, Private
*/
function private function_86203754(localclientnum, fxid)
{
	self waittill(#"death", #"hash_18ccf59470efbae9");
	stopfx(localclientnum, fxid);
}

/*
	Name: function_f14b954c
	Namespace: namespace_db2381c4
	Checksum: 0x3A179C18
	Offset: 0x3598
	Size: 0x17C
	Parameters: 7
	Flags: Linked, Private
*/
function private function_f14b954c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	/#
		function_907070de("", localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump);
	#/
	self notify(#"hash_6df70d945404449d");
	if(newval)
	{
		if(self postfx::function_556665f2("pstfx_vehicle_rcxd_fade_in"))
		{
			self postfx::stoppostfxbundle("pstfx_vehicle_rcxd_fade_in");
		}
		self postfx::playpostfxbundle("pstfx_vehicle_rcxd_fade_in");
		namespace_a052577e::function_b233d29e(0.5, 0);
	}
	else
	{
		if(self postfx::function_556665f2("pstfx_vehicle_rcxd_fade_out"))
		{
			self postfx::stoppostfxbundle("pstfx_vehicle_rcxd_fade_out");
		}
		self postfx::playpostfxbundle("pstfx_vehicle_rcxd_fade_out");
		namespace_a052577e::function_b233d29e(0.5, 0);
	}
}

/*
	Name: function_636d3664
	Namespace: namespace_db2381c4
	Checksum: 0x24AD31EE
	Offset: 0x3720
	Size: 0xCC
	Parameters: 7
	Flags: Linked, Private
*/
function private function_636d3664(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	/#
		function_907070de("", localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump);
	#/
	if(self postfx::function_556665f2("pstfx_rooftop_slide"))
	{
		self postfx::stoppostfxbundle("pstfx_rooftop_slide");
	}
	if(newval)
	{
		self postfx::playpostfxbundle("pstfx_rooftop_slide");
	}
}

/*
	Name: function_d1374213
	Namespace: namespace_db2381c4
	Checksum: 0xFEF57A7E
	Offset: 0x37F8
	Size: 0x112
	Parameters: 7
	Flags: Linked, Private
*/
function private function_d1374213(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	switch(bwastimejump)
	{
		case 0:
		{
			self function_f6e99a8d("rob_p9_cp_takedown_snipercam_blood_henchman");
			break;
		}
		case 1:
		{
			self playrenderoverridebundle("rob_p9_cp_takedown_snipercam_blood_henchman");
			break;
		}
		case 2:
		{
			self function_f6e99a8d("rob_p9_cp_takedown_snipercam_blood_splatter");
			break;
		}
		case 3:
		{
			self playrenderoverridebundle("rob_p9_cp_takedown_snipercam_blood_splatter");
			break;
		}
	}
}

/*
	Name: function_907070de
	Namespace: namespace_db2381c4
	Checksum: 0xDD4B530F
	Offset: 0x3918
	Size: 0xD4
	Parameters: 8
	Flags: Private
*/
function private function_907070de(var_55ee7def, localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	/#
		println((((((((((((((("" + var_55ee7def) + "") + localclientnum) + "") + oldval) + "") + newval) + "") + bnewent) + "") + binitialsnap) + "") + fieldname) + "") + bwastimejump);
	#/
}

