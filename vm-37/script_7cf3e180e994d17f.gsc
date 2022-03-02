#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_db2381c4;

/*
	Name: function_89f2df9
	Namespace: namespace_db2381c4
	Checksum: 0x4C8F3910
	Offset: 0x248
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_4ddffaa090d81227", &function_c7f33cce, &function_fa076c68, undefined, undefined);
}

/*
	Name: function_c7f33cce
	Namespace: namespace_db2381c4
	Checksum: 0xB818440B
	Offset: 0x2A0
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_c7f33cce()
{
	function_bc948200();
	function_7c9b0132();
}

/*
	Name: function_fa076c68
	Namespace: namespace_db2381c4
	Checksum: 0x80F724D1
	Offset: 0x2D0
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_fa076c68()
{
}

/*
	Name: function_bc948200
	Namespace: namespace_db2381c4
	Checksum: 0xC9BDBC5
	Offset: 0x2E0
	Size: 0x2D4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_bc948200()
{
	clientfield::register("scriptmover", "clf_billiardslight_client_register", 1, 1, "int");
	clientfield::register("scriptmover", "clf_billiardslight_fx", 1, 1, "int");
	clientfield::register("scriptmover", "clf_cargoplane_client_register", 1, 1, "int");
	clientfield::register("scriptmover", "clf_cargoplane_landing_lights", 1, 1, "int");
	clientfield::register("scriptmover", "clf_cargoplane_nav_lights", 1, 1, "int");
	clientfield::register("scriptmover", "clf_cargoplane_door_sparks", 1, 1, "int");
	clientfield::register("vehicle", "clf_rccar_fxstate", 1, 8, "int");
	clientfield::register("vehicle", "clf_bronco_roof_lights", 1, 1, "int");
	clientfield::register("vehicle", "clf_bronco_cab_lights", 1, 1, "int");
	clientfield::register("vehicle", "clf_whizbyfx_bronco", 1, 1, "int");
	clientfield::register("toplayer", "clf_postfx_rccar", 1, 1, "int");
	clientfield::register("toplayer", "clf_postfx_transition", 1, 1, "int");
	clientfield::register("toplayer", "clf_postfx_rooftop_slide", 1, 1, "int");
	clientfield::register("toplayer", "clf_footstep_override", 1, 1, "int");
	clientfield::register("actor", "clf_rob_snipercam_blood", 1, 2, "int");
}

/*
	Name: function_7c9b0132
	Namespace: namespace_db2381c4
	Checksum: 0x3ACF1DC6
	Offset: 0x5C0
	Size: 0x6C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_7c9b0132()
{
	/#
		function_5ac4dc99("", 0);
		function_cd140ee9("", &function_7db8d681);
		function_5ac4dc99("", 2);
	#/
}

/*
	Name: function_7db8d681
	Namespace: namespace_db2381c4
	Checksum: 0x20D0F943
	Offset: 0x638
	Size: 0x34
	Parameters: 1
	Flags: Private
*/
function private function_7db8d681(parms)
{
	/#
		level.var_e561515d thread function_256335fe(parms.value);
	#/
}

/*
	Name: function_256335fe
	Namespace: namespace_db2381c4
	Checksum: 0x15110C3E
	Offset: 0x678
	Size: 0x184
	Parameters: 1
	Flags: Private
*/
function private function_256335fe(value)
{
	/#
		self notify("");
		self endon("");
		wait(getdvarfloat(#"hash_6aa37454960fce7a", 2));
		var_9ce32949 = self clientfield::get("");
		var_9ce32949 = var_9ce32949 & (~112);
		switch(value)
		{
			case 1:
			{
				iprintlnbold("");
				var_9ce32949 = var_9ce32949 | 16;
				break;
			}
			case 2:
			{
				iprintlnbold("");
				var_9ce32949 = (var_9ce32949 | 16) | 32;
				break;
			}
			case 3:
			{
				iprintlnbold("");
				var_9ce32949 = ((var_9ce32949 | 16) | 32) | 64;
				break;
			}
		}
		self clientfield::set("", var_9ce32949);
	#/
}

/*
	Name: function_c8bc54e4
	Namespace: namespace_db2381c4
	Checksum: 0x955A0CD1
	Offset: 0x808
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_c8bc54e4()
{
	if(is_true(self.var_fa325a51))
	{
		return;
	}
	self.var_fa325a51 = 1;
	self clientfield::set_to_player("clf_footstep_override", 1);
}

/*
	Name: function_ec0a577
	Namespace: namespace_db2381c4
	Checksum: 0xF6C12FC6
	Offset: 0x860
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_ec0a577()
{
	if(!is_true(self.var_fa325a51))
	{
		return;
	}
	self.var_fa325a51 = undefined;
	self clientfield::set_to_player("clf_footstep_override", 0);
}

/*
	Name: function_d1dc8e50
	Namespace: namespace_db2381c4
	Checksum: 0x34D0DA42
	Offset: 0x8B8
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_d1dc8e50()
{
	self clientfield::set("clf_billiardslight_client_register", 1);
}

/*
	Name: function_7eba1826
	Namespace: namespace_db2381c4
	Checksum: 0xEFCBA48F
	Offset: 0x8E8
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_7eba1826()
{
	if(is_true(self.var_47d689f3))
	{
		return;
	}
	self.var_47d689f3 = 1;
	self clientfield::set("clf_billiardslight_fx", 1);
}

/*
	Name: function_20d8e1fa
	Namespace: namespace_db2381c4
	Checksum: 0xF3C28C9B
	Offset: 0x940
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function function_20d8e1fa()
{
	if(!is_true(self.var_47d689f3))
	{
		return;
	}
	self.var_47d689f3 = undefined;
	self clientfield::set("clf_billiardslight_fx", 0);
}

/*
	Name: function_f0ecd8
	Namespace: namespace_db2381c4
	Checksum: 0x94E2C81
	Offset: 0x998
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function function_f0ecd8()
{
	var_9ce32949 = self clientfield::get("clf_rccar_fxstate");
	if(var_9ce32949 & 1 || var_9ce32949 & 128)
	{
		return;
	}
	/#
		println("");
	#/
	self clientfield::set("clf_rccar_fxstate", var_9ce32949 | 1);
}

/*
	Name: function_85afc2fb
	Namespace: namespace_db2381c4
	Checksum: 0xDBB87EE4
	Offset: 0xA38
	Size: 0x94
	Parameters: 0
	Flags: None
*/
function function_85afc2fb()
{
	var_9ce32949 = self clientfield::get("clf_rccar_fxstate");
	if(!var_9ce32949 & 1)
	{
		return;
	}
	var_9ce32949 = var_9ce32949 & (~14);
	/#
		println("");
	#/
	self clientfield::set("clf_rccar_fxstate", var_9ce32949 & (~1));
}

/*
	Name: function_3419411b
	Namespace: namespace_db2381c4
	Checksum: 0x614D8D2F
	Offset: 0xAD8
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function function_3419411b()
{
	var_9ce32949 = self clientfield::get("clf_rccar_fxstate");
	if(var_9ce32949 & 2 || var_9ce32949 & 128)
	{
		return;
	}
	/#
		println("");
	#/
	self clientfield::set("clf_rccar_fxstate", var_9ce32949 | 2);
}

/*
	Name: function_98db0a95
	Namespace: namespace_db2381c4
	Checksum: 0x79658A0
	Offset: 0xB78
	Size: 0x94
	Parameters: 0
	Flags: None
*/
function function_98db0a95()
{
	var_9ce32949 = self clientfield::get("clf_rccar_fxstate");
	if(var_9ce32949 & 2 && !var_9ce32949 & 128)
	{
		/#
			println("");
		#/
		self clientfield::set("clf_rccar_fxstate", var_9ce32949 & (~2));
	}
}

/*
	Name: function_323b6e10
	Namespace: namespace_db2381c4
	Checksum: 0x759ECD98
	Offset: 0xC18
	Size: 0xA4
	Parameters: 0
	Flags: Linked
*/
function function_323b6e10()
{
	var_9ce32949 = self clientfield::get("clf_rccar_fxstate");
	if(var_9ce32949 & 4 || var_9ce32949 & 128)
	{
		return;
	}
	var_9ce32949 = var_9ce32949 & (~8);
	/#
		println("");
	#/
	self clientfield::set("clf_rccar_fxstate", var_9ce32949 | 4);
}

/*
	Name: function_a66b2882
	Namespace: namespace_db2381c4
	Checksum: 0x1FB5C9D5
	Offset: 0xCC8
	Size: 0x94
	Parameters: 0
	Flags: None
*/
function function_a66b2882()
{
	var_9ce32949 = self clientfield::get("clf_rccar_fxstate");
	if(var_9ce32949 & 4 && !var_9ce32949 & 128)
	{
		/#
			println("");
		#/
		self clientfield::set("clf_rccar_fxstate", var_9ce32949 & (~4));
	}
}

/*
	Name: function_53bd0317
	Namespace: namespace_db2381c4
	Checksum: 0x2D574FF0
	Offset: 0xD68
	Size: 0xA4
	Parameters: 0
	Flags: Linked
*/
function function_53bd0317()
{
	var_9ce32949 = self clientfield::get("clf_rccar_fxstate");
	if(var_9ce32949 & 8 || var_9ce32949 & 128)
	{
		return;
	}
	var_9ce32949 = var_9ce32949 & (~4);
	/#
		println("");
	#/
	self clientfield::set("clf_rccar_fxstate", var_9ce32949 | 8);
}

/*
	Name: function_f2cb4cab
	Namespace: namespace_db2381c4
	Checksum: 0x2706E892
	Offset: 0xE18
	Size: 0x94
	Parameters: 0
	Flags: None
*/
function function_f2cb4cab()
{
	var_9ce32949 = self clientfield::get("clf_rccar_fxstate");
	if(var_9ce32949 & 8 && !var_9ce32949 & 128)
	{
		/#
			println("");
		#/
		self clientfield::set("clf_rccar_fxstate", var_9ce32949 & (~8));
	}
}

/*
	Name: function_6bd3950d
	Namespace: namespace_db2381c4
	Checksum: 0x3DAC04EC
	Offset: 0xEB8
	Size: 0x174
	Parameters: 1
	Flags: Linked
*/
function function_6bd3950d(var_7737e6aa)
{
	var_9ce32949 = self clientfield::get("clf_rccar_fxstate");
	if(var_9ce32949 & 128)
	{
		return;
	}
	if(!isdefined(self.var_e32d3cab))
	{
		self.var_e32d3cab = 100;
	}
	self.var_e32d3cab = self.var_e32d3cab - var_7737e6aa;
	if(self.var_e32d3cab <= 0)
	{
		self function_fe8be1e0();
	}
	else
	{
		if(self.var_e32d3cab <= 25 && !var_9ce32949 & 64)
		{
			self clientfield::set("clf_rccar_fxstate", var_9ce32949 | 64);
		}
		else
		{
			if(self.var_e32d3cab <= 50 && !var_9ce32949 & 32)
			{
				self clientfield::set("clf_rccar_fxstate", var_9ce32949 | 32);
			}
			else if(self.var_e32d3cab <= 75 && !var_9ce32949 & 16)
			{
				self clientfield::set("clf_rccar_fxstate", var_9ce32949 | 16);
			}
		}
	}
}

/*
	Name: function_fe8be1e0
	Namespace: namespace_db2381c4
	Checksum: 0xDE382E53
	Offset: 0x1038
	Size: 0xA4
	Parameters: 0
	Flags: Linked
*/
function function_fe8be1e0()
{
	self notify(#"killed");
	var_9ce32949 = self clientfield::get("clf_rccar_fxstate");
	if(var_9ce32949 & 128)
	{
		return;
	}
	var_9ce32949 = var_9ce32949 & (~126);
	/#
		println("");
	#/
	self clientfield::set("clf_rccar_fxstate", var_9ce32949 | 128);
}

/*
	Name: function_c5bbfcb8
	Namespace: namespace_db2381c4
	Checksum: 0xF928B475
	Offset: 0x10E8
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_c5bbfcb8()
{
	self clientfield::set("clf_cargoplane_client_register", 1);
}

/*
	Name: function_b6cccb8
	Namespace: namespace_db2381c4
	Checksum: 0xCBF6F0B2
	Offset: 0x1118
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_b6cccb8()
{
	if(is_true(self.var_1b0a7080))
	{
		return;
	}
	self.var_1b0a7080 = 1;
	self clientfield::set("clf_cargoplane_nav_lights", 1);
}

/*
	Name: function_ee23b003
	Namespace: namespace_db2381c4
	Checksum: 0xC9D19C8F
	Offset: 0x1170
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_ee23b003()
{
	if(!is_true(self.var_1b0a7080))
	{
		return;
	}
	self.var_1b0a7080 = undefined;
	self clientfield::set("clf_cargoplane_nav_lights", 0);
}

/*
	Name: function_8e4c996d
	Namespace: namespace_db2381c4
	Checksum: 0x1E0F7486
	Offset: 0x11C8
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_8e4c996d()
{
	if(is_true(self.var_fd00d4f8))
	{
		return;
	}
	self.var_fd00d4f8 = 1;
	self clientfield::set("clf_cargoplane_landing_lights", 1);
}

/*
	Name: function_675a8b8c
	Namespace: namespace_db2381c4
	Checksum: 0x12D2B10F
	Offset: 0x1220
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_675a8b8c()
{
	if(!is_true(self.var_fd00d4f8))
	{
		return;
	}
	self.var_fd00d4f8 = undefined;
	self clientfield::set("clf_cargoplane_landing_lights", 0);
}

/*
	Name: function_4c265dee
	Namespace: namespace_db2381c4
	Checksum: 0x9C0CD029
	Offset: 0x1278
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_4c265dee()
{
	if(is_true(self.var_25333943))
	{
		return;
	}
	self.var_25333943 = 1;
	self clientfield::set("clf_bronco_roof_lights", 1);
}

/*
	Name: function_2c185955
	Namespace: namespace_db2381c4
	Checksum: 0x286E2176
	Offset: 0x12D0
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_2c185955()
{
	if(!is_true(self.var_25333943))
	{
		return;
	}
	self.var_25333943 = undefined;
	self clientfield::set("clf_bronco_roof_lights", 0);
}

/*
	Name: function_4b711786
	Namespace: namespace_db2381c4
	Checksum: 0xE0BB2D93
	Offset: 0x1328
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_4b711786()
{
	if(is_true(self.var_c7ccb16c))
	{
		return;
	}
	self.var_c7ccb16c = 1;
	self clientfield::set("clf_bronco_cab_lights", 1);
}

/*
	Name: function_b21aeabe
	Namespace: namespace_db2381c4
	Checksum: 0xE11DBDFA
	Offset: 0x1380
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_b21aeabe()
{
	if(!is_true(self.var_c7ccb16c))
	{
		return;
	}
	self.var_c7ccb16c = undefined;
	self clientfield::set("clf_bronco_cab_lights", 0);
}

/*
	Name: function_59e9c6f4
	Namespace: namespace_db2381c4
	Checksum: 0x76BA7A88
	Offset: 0x13D8
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function function_59e9c6f4()
{
	if(is_true(self.var_3bfbcde4))
	{
		return;
	}
	self.var_3bfbcde4 = 1;
	self clientfield::set("clf_whizbyfx_bronco", 1);
}

/*
	Name: function_733ed949
	Namespace: namespace_db2381c4
	Checksum: 0x295D60B9
	Offset: 0x1430
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function function_733ed949()
{
	if(!is_true(self.var_3bfbcde4))
	{
		return;
	}
	self.var_3bfbcde4 = undefined;
	self clientfield::set_to_player("clf_whizbyfx_bronco", 0);
}

/*
	Name: function_2be1d5b0
	Namespace: namespace_db2381c4
	Checksum: 0x95760729
	Offset: 0x1488
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_2be1d5b0()
{
	if(is_true(self.var_c7ace249))
	{
		return;
	}
	self.var_c7ace249 = 1;
	self clientfield::set_to_player("clf_postfx_rccar", 1);
}

/*
	Name: function_6539055f
	Namespace: namespace_db2381c4
	Checksum: 0xFF2CFAAD
	Offset: 0x14E0
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_6539055f()
{
	if(!is_true(self.var_c7ace249))
	{
		return;
	}
	self.var_c7ace249 = undefined;
	self clientfield::set_to_player("clf_postfx_rccar", 0);
}

/*
	Name: function_701c25a5
	Namespace: namespace_db2381c4
	Checksum: 0xC2154C2A
	Offset: 0x1538
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_701c25a5()
{
	if(is_true(self.var_947d8f8b))
	{
		return;
	}
	self.var_947d8f8b = 1;
	self clientfield::set_to_player("clf_postfx_transition", 1);
}

/*
	Name: function_a31136d8
	Namespace: namespace_db2381c4
	Checksum: 0xB3B8D996
	Offset: 0x1590
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_a31136d8()
{
	if(!is_true(self.var_947d8f8b))
	{
		return;
	}
	self.var_947d8f8b = undefined;
	self clientfield::set_to_player("clf_postfx_transition", 0);
}

/*
	Name: function_febff01e
	Namespace: namespace_db2381c4
	Checksum: 0xE60B6CF9
	Offset: 0x15E8
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_febff01e()
{
	if(is_true(self.var_70a967fd))
	{
		return;
	}
	self.var_70a967fd = 1;
	self clientfield::set_to_player("clf_postfx_rooftop_slide", 1);
}

/*
	Name: function_d413059b
	Namespace: namespace_db2381c4
	Checksum: 0xE928E43C
	Offset: 0x1640
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function function_d413059b()
{
	if(!is_true(self.var_70a967fd))
	{
		return;
	}
	self.var_70a967fd = undefined;
	self clientfield::set_to_player("clf_postfx_rooftop_slide", 0);
}

/*
	Name: function_f60520a9
	Namespace: namespace_db2381c4
	Checksum: 0xB574027E
	Offset: 0x1698
	Size: 0xF4
	Parameters: 3
	Flags: None
*/
function function_f60520a9(waittime, var_b47dc8ef, end)
{
	if(!isdefined(waittime))
	{
		waittime = 0;
	}
	if(!isdefined(var_b47dc8ef))
	{
		var_b47dc8ef = 0;
	}
	if(!isdefined(end))
	{
		end = 0;
	}
	var_37dc93e2 = 0;
	if(is_true(var_b47dc8ef))
	{
		var_37dc93e2 = 2;
	}
	if(waittime > 0)
	{
		wait(waittime);
	}
	if(is_false(end))
	{
		self clientfield::set("clf_rob_snipercam_blood", 1 + var_37dc93e2);
	}
	else
	{
		self clientfield::set("clf_rob_snipercam_blood", 0 + var_37dc93e2);
	}
}

