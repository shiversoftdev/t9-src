#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_db2381c4;

/*
	Name: function_4d3dbfb7
	Namespace: namespace_db2381c4
	Checksum: 0xFE65AB2A
	Offset: 0x248
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4d3dbfb7()
{
	level notify(759337596);
}

/*
	Name: function_89f2df9
	Namespace: namespace_db2381c4
	Checksum: 0xFCBB8EE7
	Offset: 0x268
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
	Checksum: 0xF14491E8
	Offset: 0x2C0
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
	Offset: 0x2F0
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
	Checksum: 0xC775B06D
	Offset: 0x300
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
	Checksum: 0x1D9E9F56
	Offset: 0x5E0
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
	Checksum: 0xFC2D6124
	Offset: 0x658
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
	Checksum: 0x59A5BB9A
	Offset: 0x698
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
	Checksum: 0x8EFDDE6D
	Offset: 0x828
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
	Checksum: 0xC4AE9D82
	Offset: 0x880
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
	Checksum: 0xBE3B9F0
	Offset: 0x8D8
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
	Checksum: 0xA94D78D3
	Offset: 0x908
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
	Checksum: 0xD278F3B2
	Offset: 0x960
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
	Checksum: 0x6719F128
	Offset: 0x9B8
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
	Checksum: 0x1B01AE7D
	Offset: 0xA58
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
	Checksum: 0xFDAEB5C1
	Offset: 0xAF8
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
	Checksum: 0xD1ED6BA6
	Offset: 0xB98
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
	Checksum: 0xBF77A426
	Offset: 0xC38
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
	Checksum: 0x663AB200
	Offset: 0xCE8
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
	Checksum: 0x58B7C7BE
	Offset: 0xD88
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
	Checksum: 0x702E133E
	Offset: 0xE38
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
	Checksum: 0x4BAEFC8
	Offset: 0xED8
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
	Checksum: 0x576FE29D
	Offset: 0x1058
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
	Checksum: 0xD64A85A1
	Offset: 0x1108
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
	Checksum: 0x9D24583
	Offset: 0x1138
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
	Checksum: 0x71057DEE
	Offset: 0x1190
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
	Checksum: 0x1B493F3B
	Offset: 0x11E8
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
	Checksum: 0x7D2852A4
	Offset: 0x1240
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
	Checksum: 0x56226F01
	Offset: 0x1298
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
	Checksum: 0x3EC2EECA
	Offset: 0x12F0
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
	Checksum: 0x3DC8A1F1
	Offset: 0x1348
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
	Checksum: 0x58EED24B
	Offset: 0x13A0
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
	Checksum: 0x26B7E8F5
	Offset: 0x13F8
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
	Checksum: 0x43A0DF4D
	Offset: 0x1450
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
	Checksum: 0x93FC1212
	Offset: 0x14A8
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
	Checksum: 0x106E8165
	Offset: 0x1500
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
	Checksum: 0x954FC184
	Offset: 0x1558
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
	Checksum: 0xC8BDA755
	Offset: 0x15B0
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
	Checksum: 0x5BEB330B
	Offset: 0x1608
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
	Checksum: 0x93476696
	Offset: 0x1660
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
	Checksum: 0xB52B8F7D
	Offset: 0x16B8
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

