#using scripts\core_common\ai\zombie_vortex.gsc;
#using script_76983b49bef66b2e;
#using script_3d173c89c2828216;
#using script_74970cdde0a631ed;
#using script_60c2b013c242647;
#using script_1edff2e0ab8e8655;
#using script_4f80bd5a062c37a8;
#using script_2c052d834cd7619a;
#using script_51351e47175c6116;
#using script_1d730eca5a7f1fa8;
#using script_544ada140645565d;
#using script_717759a5d2a40e63;
#using script_7aeb0ef28c222444;
#using script_29362c2d16adb2be;
#using script_2dc29943582f8278;
#using script_2440f86f9cd325ac;
#using script_22f7f737d389d6e2;
#using script_afe02542e6c60f5;
#using script_26187f7b449f7b92;
#using script_abb3791af68bace;
#using script_3d5e6c007c0e2bb1;
#using script_5fa6f3b5786efa65;
#using script_4611af4073d18808;
#using script_17381cbdd152c031;
#using script_1a9763988299e68d;
#using script_2a5bf5b4a00cee0d;
#using script_40f967ad5d18ea74;
#using script_3faf478d5b0850fe;
#using script_47851dbeea22fe66;
#using script_1ce46999727f2f2b;
#using script_164a456ce05c3483;
#using script_4d748e58ce25b60c;
#using script_5f20d3b434d24884;
#using script_1b0b07ff57d1dde3;
#using script_6b6510e124bad778;
#using script_1ee011cd0961afd7;
#using script_350cffecd05ef6cf;
#using script_5701633066d199f2;
#using script_1b01e95a6b5270fd;
#using script_17dcb1172e441bf6;
#using script_74a56359b7d02ab6;
#using script_5549681e1669c11a;
#using scripts\core_common\player\player_stats.gsc;
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

class class_38f05ef0 
{
	var var_5d9462ef;
	var var_6b7b10c2;
	var var_f7688f8b;
	var var_b61c7f39;
	var var_3d570e2e;
	var var_6ea99c7a;
	var var_2b20fb3b;
	var m_type;
	var var_9453b0c1;
	var var_b24182b5;
	var var_e7c8f3cc;
	var var_5bcecdc5;
	var var_82953f8a;
	var var_cc2e45c1;
	var var_3b17d6fc;
	var var_7248a65a;
	var var_f3072bed;
	var var_2e39f9a9;
	var var_f360c9a6;
	var var_480dae1c;
	var var_45b48e54;
	var var_6269b9a1;
	var m_timeout;
	var var_cafa7e0c;
	var var_12094064;

	/*
		Name: constructor
		Namespace: namespace_38f05ef0
		Checksum: 0xA75C25E3
		Offset: 0x2090
		Size: 0x17C
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
		self.var_f7688f8b = "";
		self.var_82953f8a = 0;
		self.var_cafa7e0c = 1;
		self.m_type = 0;
		self.m_timeout = 10;
		self.var_2e39f9a9 = vectorscale((0, 0, 1), 70);
		self.var_9453b0c1 = &think;
		self.var_5d9462ef = &idle;
		self.var_12094064 = 0;
		self.var_45b48e54 = 0;
		self.var_6269b9a1 = &function_91c693d3;
		self.var_6269b9a1 = &function_91c693d3;
		self.var_cc2e45c1 = undefined;
		self.var_6b7b10c2 = 1;
		self.var_3b17d6fc = 0;
		self.var_7248a65a = 0;
		self.var_f3072bed = 0;
		self.var_e7c8f3cc = 1;
		self.var_3d570e2e = "evt_doa_pickup_default_spawn";
		self.var_f360c9a6 = "evt_doa_pickup_default_lp";
		self.var_480dae1c = "evt_doa_pickup_default_despawn";
		self.var_6ea99c7a = "evt_doa_pickup_default_consumed";
		self.var_2b20fb3b = 1;
		function_f8694033();
	}

	/*
		Name: destructor
		Namespace: namespace_38f05ef0
		Checksum: 0x80F724D1
		Offset: 0x2218
		Size: 0x4
		Parameters: 0
		Flags: Linked, 128
	*/
	destructor()
	{
	}

	/*
		Name: function_1e4ba7d0
		Namespace: namespace_38f05ef0
		Checksum: 0xE9B9CBE1
		Offset: 0x2558
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_1e4ba7d0()
	{
		return var_5d9462ef;
	}

	/*
		Name: function_2c127eb5
		Namespace: namespace_38f05ef0
		Checksum: 0xFF4A7529
		Offset: 0x27E0
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_2c127eb5()
	{
		return var_6b7b10c2;
	}

	/*
		Name: getname
		Namespace: namespace_38f05ef0
		Checksum: 0xA883B4EF
		Offset: 0x2540
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function getname()
	{
		return var_f7688f8b;
	}

	/*
		Name: function_32b47cc3
		Namespace: namespace_38f05ef0
		Checksum: 0xB3851912
		Offset: 0x25B8
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_32b47cc3()
	{
		return var_b61c7f39;
	}

	/*
		Name: function_371cc878
		Namespace: namespace_38f05ef0
		Checksum: 0xBF27EE0D
		Offset: 0x2730
		Size: 0x10
		Parameters: 0
		Flags: Linked
	*/
	function function_371cc878()
	{
		self.var_f3072bed++;
	}

	/*
		Name: idle
		Namespace: namespace_38f05ef0
		Checksum: 0x80F724D1
		Offset: 0x2488
		Size: 0x4
		Parameters: 0
		Flags: Linked
	*/
	function idle()
	{
	}

	/*
		Name: function_3e72c5c3
		Namespace: namespace_38f05ef0
		Checksum: 0xEDD5BB83
		Offset: 0x2410
		Size: 0x32
		Parameters: 1
		Flags: Linked
	*/
	function function_3e72c5c3(var_41157a40)
	{
		if(!isdefined(var_41157a40))
		{
			var_41157a40 = &think;
		}
		self.var_9453b0c1 = var_41157a40;
	}

	/*
		Name: function_3f40904b
		Namespace: namespace_38f05ef0
		Checksum: 0xDFDF1726
		Offset: 0x2748
		Size: 0xE
		Parameters: 0
		Flags: Linked
	*/
	function function_3f40904b()
	{
		self.var_f3072bed = 0;
	}

	/*
		Name: function_424c961e
		Namespace: namespace_38f05ef0
		Checksum: 0xB12460B4
		Offset: 0x2600
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_424c961e()
	{
		return var_3d570e2e;
	}

	/*
		Name: function_43e11510
		Namespace: namespace_38f05ef0
		Checksum: 0xEE48645D
		Offset: 0x2838
		Size: 0x1A
		Parameters: 1
		Flags: Linked
	*/
	function function_43e11510(durationmsec)
	{
		self.var_3b17d6fc = durationmsec;
	}

	/*
		Name: function_526bfcd9
		Namespace: namespace_38f05ef0
		Checksum: 0xD9F2A6A9
		Offset: 0x2648
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_526bfcd9()
	{
		return var_6ea99c7a;
	}

	/*
		Name: function_55b7a101
		Namespace: namespace_38f05ef0
		Checksum: 0x638CAF9E
		Offset: 0x26A0
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_55b7a101()
	{
		return var_2b20fb3b;
	}

	/*
		Name: function_5ce4fb28
		Namespace: namespace_38f05ef0
		Checksum: 0xF56FEE02
		Offset: 0x2570
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_5ce4fb28()
	{
		return m_type;
	}

	/*
		Name: function_63c67234
		Namespace: namespace_38f05ef0
		Checksum: 0xB2C19768
		Offset: 0x25A0
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_63c67234()
	{
		return var_9453b0c1;
	}

	/*
		Name: getheight
		Namespace: namespace_38f05ef0
		Checksum: 0xFC0553C0
		Offset: 0x24D8
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function getheight()
	{
		return var_b24182b5;
	}

	/*
		Name: function_755a46e6
		Namespace: namespace_38f05ef0
		Checksum: 0xB2EE158B
		Offset: 0x2860
		Size: 0xE
		Parameters: 0
		Flags: Linked
	*/
	function function_755a46e6()
	{
		self.var_7248a65a = gettime();
	}

	/*
		Name: function_799a63cf
		Namespace: namespace_38f05ef0
		Checksum: 0x55D6C9A9
		Offset: 0x26B8
		Size: 0x56
		Parameters: 4
		Flags: Linked
	*/
	function function_799a63cf(spawn, loop, despawn, consumed)
	{
		self.var_3d570e2e = spawn;
		self.var_f360c9a6 = loop;
		self.var_480dae1c = despawn;
		self.var_6ea99c7a = consumed;
	}

	/*
		Name: think
		Namespace: namespace_38f05ef0
		Checksum: 0x80F724D1
		Offset: 0x2478
		Size: 0x4
		Parameters: 0
		Flags: Linked
	*/
	function think()
	{
	}

	/*
		Name: function_8fa82fe8
		Namespace: namespace_38f05ef0
		Checksum: 0x930DBF1B
		Offset: 0x2660
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_8fa82fe8()
	{
		return var_e7c8f3cc;
	}

	/*
		Name: function_91c693d3
		Namespace: namespace_38f05ef0
		Checksum: 0x80F724D1
		Offset: 0x2498
		Size: 0x4
		Parameters: 0
		Flags: Linked
	*/
	function function_91c693d3()
	{
	}

	/*
		Name: init
		Namespace: namespace_38f05ef0
		Checksum: 0x3BECF20F
		Offset: 0x2228
		Size: 0x142
		Parameters: 10
		Flags: Linked
	*/
	function init(gdtname, variant, var_44dbff18, rarity, scale, type, timeout, angles, data, entries)
	{
		if(!isdefined(angles))
		{
			angles = vectorscale((0, 0, 1), 70);
		}
		if(!isdefined(data))
		{
			data = 0;
		}
		if(!isdefined(entries))
		{
			entries = 1;
		}
		self.var_f7688f8b = gdtname;
		self.var_82953f8a = variant;
		self.var_9453b0c1 = (isdefined(var_44dbff18) ? var_44dbff18 : &think);
		self.var_cafa7e0c = scale;
		self.m_type = type;
		self.m_timeout = timeout;
		self.var_2e39f9a9 = angles;
		self.var_12094064 = data;
		self.var_45b48e54 = rarity;
		self.var_3b17d6fc = 0;
		self.var_7248a65a = 0;
		self.var_f3072bed = 0;
		self.var_2b20fb3b = entries;
	}

	/*
		Name: getwidth
		Namespace: namespace_38f05ef0
		Checksum: 0x68BCE0A7
		Offset: 0x24C0
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function getwidth()
	{
		return var_5bcecdc5;
	}

	/*
		Name: function_9a8ff4b1
		Namespace: namespace_38f05ef0
		Checksum: 0xEB395EB4
		Offset: 0x27F8
		Size: 0x1A
		Parameters: 1
		Flags: Linked
	*/
	function function_9a8ff4b1(round)
	{
		self.var_6b7b10c2 = round;
	}

	/*
		Name: function_a0da66ec
		Namespace: namespace_38f05ef0
		Checksum: 0xD728329B
		Offset: 0x24A8
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_a0da66ec()
	{
		return var_82953f8a;
	}

	/*
		Name: function_a1e5bdf5
		Namespace: namespace_38f05ef0
		Checksum: 0xC0E35466
		Offset: 0x2450
		Size: 0x1A
		Parameters: 1
		Flags: Linked
	*/
	function function_a1e5bdf5(var_1656afe6)
	{
		self.var_b61c7f39 = var_1656afe6;
	}

	/*
		Name: function_a46e1955
		Namespace: namespace_38f05ef0
		Checksum: 0xE580AB76
		Offset: 0x27B8
		Size: 0x1A
		Parameters: 1
		Flags: Linked
	*/
	function function_a46e1955(func)
	{
		self.var_cc2e45c1 = func;
	}

	/*
		Name: function_a8f2b5de
		Namespace: namespace_38f05ef0
		Checksum: 0xD4BDBFF
		Offset: 0x27A0
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_a8f2b5de()
	{
		return var_cc2e45c1;
	}

	/*
		Name: function_ac2eae0a
		Namespace: namespace_38f05ef0
		Checksum: 0x7FAA92B
		Offset: 0x2778
		Size: 0x1A
		Parameters: 1
		Flags: Linked
	*/
	function function_ac2eae0a(func)
	{
		self.var_6269b9a1 = func;
	}

	/*
		Name: function_b0378495
		Namespace: namespace_38f05ef0
		Checksum: 0x2E464875
		Offset: 0x2890
		Size: 0x48
		Parameters: 0
		Flags: Linked
	*/
	function function_b0378495()
	{
		if(var_3b17d6fc == 0 || var_7248a65a == 0)
		{
			return true;
		}
		if((gettime() - var_7248a65a) >= var_3b17d6fc)
		{
			return true;
		}
		return false;
	}

	/*
		Name: function_b27f6758
		Namespace: namespace_38f05ef0
		Checksum: 0x3B768CF0
		Offset: 0x2878
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_b27f6758()
	{
		return var_7248a65a;
	}

	/*
		Name: function_b3131904
		Namespace: namespace_38f05ef0
		Checksum: 0xC0072756
		Offset: 0x2718
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_b3131904()
	{
		return var_f3072bed;
	}

	/*
		Name: getangles
		Namespace: namespace_38f05ef0
		Checksum: 0x5AC936B8
		Offset: 0x2528
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function getangles()
	{
		return var_2e39f9a9;
	}

	/*
		Name: function_c1403591
		Namespace: namespace_38f05ef0
		Checksum: 0x3D08CB65
		Offset: 0x23D0
		Size: 0x32
		Parameters: 1
		Flags: Linked
	*/
	function function_c1403591(var_dec486a3)
	{
		if(!isdefined(var_dec486a3))
		{
			var_dec486a3 = &idle;
		}
		self.var_5d9462ef = var_dec486a3;
	}

	/*
		Name: function_c62ea2e6
		Namespace: namespace_38f05ef0
		Checksum: 0xAD27CD8E
		Offset: 0x2618
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_c62ea2e6()
	{
		return var_f360c9a6;
	}

	/*
		Name: function_cd066492
		Namespace: namespace_38f05ef0
		Checksum: 0x95B4AC92
		Offset: 0x2630
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_cd066492()
	{
		return var_480dae1c;
	}

	/*
		Name: shouldtimeout
		Namespace: namespace_38f05ef0
		Checksum: 0xF37B1E6B
		Offset: 0x24F0
		Size: 0x18
		Parameters: 0
		Flags: Linked
	*/
	function shouldtimeout()
	{
		return function_ed9402ec() != -1;
	}

	/*
		Name: function_e2564c16
		Namespace: namespace_38f05ef0
		Checksum: 0x608D6957
		Offset: 0x25E8
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_e2564c16()
	{
		return var_45b48e54;
	}

	/*
		Name: function_e52fe3ad
		Namespace: namespace_38f05ef0
		Checksum: 0x4BE016C2
		Offset: 0x2760
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_e52fe3ad()
	{
		return var_6269b9a1;
	}

	/*
		Name: function_ea0e8d6d
		Namespace: namespace_38f05ef0
		Checksum: 0x9B753BB0
		Offset: 0x2678
		Size: 0x1A
		Parameters: 1
		Flags: Linked
	*/
	function function_ea0e8d6d(val)
	{
		self.var_e7c8f3cc = val;
	}

	/*
		Name: function_ed9402ec
		Namespace: namespace_38f05ef0
		Checksum: 0x6A557A2F
		Offset: 0x2510
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_ed9402ec()
	{
		return m_timeout;
	}

	/*
		Name: function_f49b5612
		Namespace: namespace_38f05ef0
		Checksum: 0x7BEF9E2A
		Offset: 0x2820
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_f49b5612()
	{
		return var_3b17d6fc;
	}

	/*
		Name: getscale
		Namespace: namespace_38f05ef0
		Checksum: 0xADEBF4E6
		Offset: 0x2588
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function getscale()
	{
		return var_cafa7e0c;
	}

	/*
		Name: function_f8694033
		Namespace: namespace_38f05ef0
		Checksum: 0xF71D5CD0
		Offset: 0x2378
		Size: 0x4E
		Parameters: 2
		Flags: Linked
	*/
	function function_f8694033(width, height)
	{
		if(!isdefined(width))
		{
			width = 42;
		}
		if(!isdefined(height))
		{
			height = 72;
		}
		self.var_5bcecdc5 = width;
		self.var_b24182b5 = height;
	}

	/*
		Name: getdata
		Namespace: namespace_38f05ef0
		Checksum: 0xFBF963FB
		Offset: 0x25D0
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function getdata()
	{
		return var_12094064;
	}

}

class class_a08a1bec 
{
	var var_ff66dbc5;
	var m_origin;
	var var_a116600e;
	var var_9453b0c1;
	var origin;
	var var_12094064;

	/*
		Name: constructor
		Namespace: namespace_a08a1bec
		Checksum: 0x80F724D1
		Offset: 0x31A8
		Size: 0x4
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_a08a1bec
		Checksum: 0xBF53ED0
		Offset: 0x31B8
		Size: 0x2C
		Parameters: 0
		Flags: Linked, 128
	*/
	destructor()
	{
		if(isdefined(var_a116600e))
		{
			var_a116600e delete();
		}
	}

	/*
		Name: getname
		Namespace: namespace_a08a1bec
		Checksum: 0xDA1A5D9C
		Offset: 0x3860
		Size: 0x16
		Parameters: 0
		Flags: Linked
	*/
	function getname()
	{
		return [[ var_ff66dbc5 ]]->getname();
	}

	/*
		Name: function_5b9895db
		Namespace: namespace_a08a1bec
		Checksum: 0xC002289
		Offset: 0x38E0
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_5b9895db()
	{
		return var_ff66dbc5;
	}

	/*
		Name: function_5ce4fb28
		Namespace: namespace_a08a1bec
		Checksum: 0x82972F18
		Offset: 0x3880
		Size: 0x16
		Parameters: 0
		Flags: Linked
	*/
	function function_5ce4fb28()
	{
		return [[ var_ff66dbc5 ]]->function_5ce4fb28();
	}

	/*
		Name: function_65ee50ba
		Namespace: namespace_a08a1bec
		Checksum: 0x5EB1BDE
		Offset: 0x37D0
		Size: 0x66
		Parameters: 1
		Flags: Linked, Private
	*/
	function private function_65ee50ba(start)
	{
		s_trace = groundtrace(start + vectorscale((0, 0, 1), 48), start + (vectorscale((0, 0, -1), 1000)), 0, self);
		return s_trace[#"position"];
	}

	/*
		Name: init
		Namespace: namespace_a08a1bec
		Checksum: 0x8CE27998
		Offset: 0x31F0
		Size: 0x54C
		Parameters: 8
		Flags: Linked
	*/
	function init(itemdef, origin, angles, data, width, height, scale, clientside)
	{
		if(!isdefined(angles))
		{
			angles = [[ itemdef ]]->getangles();
		}
		if(!isdefined(data))
		{
			data = [[ itemdef ]]->getdata();
		}
		if(!isdefined(width))
		{
			width = [[ itemdef ]]->getwidth();
		}
		if(!isdefined(height))
		{
			height = [[ itemdef ]]->getheight();
		}
		if(!isdefined(scale))
		{
			scale = [[ itemdef ]]->getscale();
		}
		if(!isdefined(clientside))
		{
			clientside = 1;
		}
		self.var_ff66dbc5 = itemdef;
		[[ var_ff66dbc5 ]]->function_371cc878();
		self.m_origin = function_65ee50ba(origin) + vectorscale((0, 0, 1), 18);
		if(abs(m_origin[2] - origin[2]) > 40)
		{
			self.m_origin = (m_origin[0], m_origin[1], origin[2]);
		}
		self.var_12094064 = data;
		self.var_9453b0c1 = [[ var_ff66dbc5 ]]->function_63c67234();
		self.var_a116600e = namespace_ec06fe4a::function_e22ae9b3(m_origin);
		if(!isdefined(var_a116600e))
		{
			return false;
		}
		var_a116600e.angles = angles;
		var_a116600e.pickup = self;
		var_a116600e.def = itemdef;
		model = [[ itemdef ]]->getname();
		var_a116600e.scale = scale;
		var_a116600e setscale(var_a116600e.scale);
		var_a116600e.type = function_5ce4fb28();
		var_a116600e [[[[ var_ff66dbc5 ]]->function_e52fe3ad()]]();
		if(!clientside || ([[ var_a116600e.def ]]->function_8fa82fe8()) == 0 || is_true(var_a116600e.popup) || !1)
		{
			if(var_a116600e.type == 6)
			{
				model = getweaponworldmodel(getweapon(model));
			}
			var_a116600e setmodel(model);
		}
		else
		{
			var_a116600e setmodel("tag_origin");
			var_a116600e clientfield::set("pickupsettype", var_a116600e.type + (([[ var_a116600e.def ]]->function_a0da66ec()) << 6));
			var_a116600e notsolid();
			var_a116600e.var_9ca559f5 = 1;
		}
		var_a116600e.script_noteworthy = "a_pickup_item";
		var_a116600e.targetname = "a_pickup_item";
		var_a116600e.radius = width;
		var_a116600e.height = height;
		var_a116600e.var_b20c0bc5 = [[ itemdef ]]->function_32b47cc3();
		var_a116600e thread [[[[ var_ff66dbc5 ]]->function_1e4ba7d0()]]();
		var_a116600e thread [[var_9453b0c1]]();
		var_a116600e thread doa_pickups::pickuptimeout(function_ed9402ec());
		var_a116600e.var_2f0b512f = level.doa.var_3902985f;
		if(isdefined(level.doa.var_a71b0305))
		{
			[[level.doa.var_a71b0305]](var_a116600e);
		}
		level.doa.var_cc831548[level.doa.var_cc831548.size] = var_a116600e;
		return true;
	}

	/*
		Name: drop_to_ground
		Namespace: namespace_a08a1bec
		Checksum: 0xAEE8E3BB
		Offset: 0x3748
		Size: 0x7E
		Parameters: 0
		Flags: Linked, Private
	*/
	function private drop_to_ground()
	{
		s_trace = groundtrace(origin + vectorscale((0, 0, 1), 16), origin + (vectorscale((0, 0, -1), 1000)), 0, self);
		self.origin = s_trace[#"position"] + vectorscale((0, 0, 1), 24);
	}

	/*
		Name: function_e2564c16
		Namespace: namespace_a08a1bec
		Checksum: 0x15B99673
		Offset: 0x38A0
		Size: 0x16
		Parameters: 0
		Flags: Linked
	*/
	function function_e2564c16()
	{
		return [[ var_ff66dbc5 ]]->function_e2564c16();
	}

	/*
		Name: getmodel
		Namespace: namespace_a08a1bec
		Checksum: 0x205D250C
		Offset: 0x38F8
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function getmodel()
	{
		return var_a116600e;
	}

	/*
		Name: function_ed9402ec
		Namespace: namespace_a08a1bec
		Checksum: 0xB1979101
		Offset: 0x38C0
		Size: 0x16
		Parameters: 0
		Flags: Linked
	*/
	function function_ed9402ec()
	{
		return [[ var_ff66dbc5 ]]->function_ed9402ec();
	}

	/*
		Name: getdata
		Namespace: namespace_a08a1bec
		Checksum: 0x1B78D65E
		Offset: 0x3840
		Size: 0x12
		Parameters: 1
		Flags: Linked
	*/
	function getdata(data)
	{
		return var_12094064;
	}

}

#namespace doa_pickups;

/*
	Name: function_10d59096
	Namespace: doa_pickups
	Checksum: 0x49737E9B
	Offset: 0xDE8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_10d59096()
{
	level notify(799311061);
}

/*
	Name: init
	Namespace: doa_pickups
	Checksum: 0x46CC1326
	Offset: 0xE08
	Size: 0x127A
	Parameters: 0
	Flags: Linked
*/
function init()
{
	/#
		assert(isdefined(level.doa));
	#/
	clientfield::register("scriptmover", "pickuprotate", 1, 1, "int");
	clientfield::register("scriptmover", "pickupsettype", 1, 6 + 3, "int");
	clientfield::register("scriptmover", "pickupvisibility", 1, 1, "int");
	clientfield::register("scriptmover", "pickuptimeout", 1, 1, "int");
	clientfield::register("scriptmover", "pickupmoveto", 1, 4, "int");
	level.doa.pickups = spawnstruct();
	level.doa.pickups.var_79d6391f = 0;
	level.doa.var_271e8e25 = [];
	level.doa.pickups.itemdefs = [];
	level.doa.var_f99feb1e = [];
	level.doa.var_cc831548 = [];
	level.doa.var_537a3e29 = [];
	level.doa.pickups.var_d11c709 = [];
	level.doa.pickups.var_a81bed69 = [];
	namespace_c501aa2e::init();
	level.doa.pickups.var_92a02b26 = getent("zombietron_siegebot_spawner", "targetname");
	level.doa.pickups.var_f20eb59f = getent("zombietron_tank_spawner", "targetname");
	level.doa.pickups.var_4480248f = getent("zombietron_hind_spawner", "targetname");
	level.doa.pickups.var_ef3f4447 = getent("zombietron_sentry_spawner", "targetname");
	level.doa.pickups.var_9eec57e8 = getent("zombietron_grenade_spawner", "targetname");
	function_8cf6a668(13, {#hash_9f6d7ee9:"evt_doa_pickup_gem_consumed", #hash_860ac8be:undefined, #loopsnd:"evt_doa_pickup_gem_lp", #hash_d266c0d8:"evt_doa_pickup_gem_spawn"});
	function_8cf6a668(1, {#hash_9f6d7ee9:"evt_doa_pickup_money_consumed", #hash_860ac8be:undefined, #loopsnd:"evt_doa_pickup_money_lp", #hash_d266c0d8:"evt_doa_pickup_money_spawn"});
	function_8cf6a668(6, {#hash_9f6d7ee9:"evt_doa_pickup_weapon_consumed", #hash_860ac8be:undefined, #loopsnd:undefined, #hash_d266c0d8:"evt_doa_pickup_weapon_spawn"});
	function_8cf6a668(15, {#hash_9f6d7ee9:"evt_doa_pickup_chicken_consumed", #hash_860ac8be:"evt_doa_pickup_chicken_despawn", #loopsnd:"evt_doa_pickup_chicken_lp", #hash_d266c0d8:"evt_doa_pickup_chicken_spawn"});
	function_8cf6a668(14, {#hash_9f6d7ee9:"evt_doa_pickup_key_consumed", #hash_860ac8be:"evt_doa_pickup_default_despawn", #loopsnd:"evt_doa_pickup_default_lp", #hash_d266c0d8:"evt_doa_pickup_key_spawn"});
	function_8cf6a668(8, {#hash_9f6d7ee9:"evt_doa_powerup_nuke_consumed", #hash_860ac8be:"evt_doa_pickup_default_despawn", #loopsnd:"evt_doa_pickup_default_lp", #hash_d266c0d8:"evt_doa_pickup_default_spawn"});
	function_8cf6a668(9, {#hash_9f6d7ee9:"evt_doa_powerup_boost_consumed", #hash_860ac8be:"evt_doa_pickup_default_despawn", #loopsnd:"evt_doa_pickup_default_lp", #hash_d266c0d8:"evt_doa_pickup_default_spawn"});
	function_8cf6a668(17, {#hash_9f6d7ee9:"evt_doa_pickup_barrel_consumed", #hash_860ac8be:"evt_doa_pickup_default_despawn", #loopsnd:"evt_doa_pickup_default_lp", #hash_d266c0d8:"evt_doa_pickup_barrel_spawn"});
	function_8cf6a668(24, {#hash_9f6d7ee9:"evt_doa_pickup_boots_consumed", #hash_860ac8be:"evt_doa_pickup_default_despawn", #loopsnd:"evt_doa_pickup_default_lp", #hash_d266c0d8:"evt_doa_pickup_boots_spawn"});
	function_8cf6a668(18, {#hash_9f6d7ee9:"evt_doa_pickup_boxers_consumed", #hash_860ac8be:"evt_doa_pickup_default_despawn", #loopsnd:"evt_doa_pickup_default_lp", #hash_d266c0d8:"evt_doa_pickup_boxers_spawn"});
	function_8cf6a668(25, {#hash_9f6d7ee9:"evt_doa_pickup_clock_consumed", #hash_860ac8be:"evt_doa_pickup_default_despawn", #loopsnd:"evt_doa_pickup_default_lp", #hash_d266c0d8:"evt_doa_pickup_clock_spawn"});
	function_8cf6a668(26, {#hash_9f6d7ee9:"evt_doa_pickup_default_consumed", #hash_860ac8be:"evt_doa_pickup_default_despawn", #loopsnd:"evt_doa_pickup_default_lp", #hash_d266c0d8:"evt_doa_pickup_coatofarms_spawn"});
	function_8cf6a668(16, {#hash_9f6d7ee9:"evt_doa_pickup_extralife_consumed", #hash_860ac8be:"evt_doa_pickup_default_despawn", #loopsnd:"evt_doa_pickup_default_lp", #hash_d266c0d8:"evt_doa_pickup_extralife_spawn"});
	function_8cf6a668(3, {#hash_9f6d7ee9:"evt_doa_pickup_firstperson_consumed", #hash_860ac8be:"evt_doa_pickup_default_despawn", #loopsnd:"evt_doa_pickup_default_lp", #hash_d266c0d8:"evt_doa_pickup_firstperson_spawn"});
	function_8cf6a668(11, {#hash_9f6d7ee9:undefined, #hash_860ac8be:"evt_doa_pickup_default_despawn", #loopsnd:undefined, #hash_d266c0d8:"evt_doa_pickup_giftbox_spawn"});
	function_8cf6a668(31, {#hash_9f6d7ee9:"evt_doa_pickup_magichat_consumed", #hash_860ac8be:"evt_doa_pickup_default_despawn", #loopsnd:"evt_doa_pickup_default_lp", #hash_d266c0d8:"evt_doa_pickup_magichat_spawn"});
	function_8cf6a668(10, {#hash_9f6d7ee9:"evt_doa_pickup_healthpotion_consumed", #hash_860ac8be:"evt_doa_pickup_default_despawn", #loopsnd:"evt_doa_pickup_default_lp", #hash_d266c0d8:"evt_doa_pickup_healthpotion_spawn"});
	function_8cf6a668(23, {#hash_9f6d7ee9:"evt_doa_pickup_magnet_consumed", #hash_860ac8be:"evt_doa_pickup_default_despawn", #loopsnd:"evt_doa_pickup_default_lp", #hash_d266c0d8:"evt_doa_pickup_magnet_spawn"});
	function_8cf6a668(27, {#hash_9f6d7ee9:"evt_doa_pickup_monkeybomb_consumed", #hash_860ac8be:"evt_doa_pickup_default_despawn", #loopsnd:"evt_doa_pickup_default_lp", #hash_d266c0d8:"evt_doa_pickup_monkeybomb_spawn"});
	function_8cf6a668(19, {#hash_9f6d7ee9:"evt_doa_pickup_sawblade_consumed", #hash_860ac8be:"evt_doa_pickup_default_despawn", #loopsnd:"evt_doa_pickup_default_lp", #hash_d266c0d8:"evt_doa_pickup_sawblade_spawn"});
	function_8cf6a668(22, {#hash_9f6d7ee9:"evt_doa_pickup_sentry_consumed", #hash_860ac8be:"evt_doa_pickup_default_despawn", #loopsnd:"evt_doa_pickup_default_lp", #hash_d266c0d8:"evt_doa_pickup_sentry_spawn"});
	function_8cf6a668(45, {#hash_9f6d7ee9:"evt_doa_pickup_sentry_consumed", #hash_860ac8be:"evt_doa_pickup_default_despawn", #loopsnd:"evt_doa_pickup_default_lp", #hash_d266c0d8:"evt_doa_pickup_sentry_spawn"});
	function_8cf6a668(34, {#hash_9f6d7ee9:"evt_doa_pickup_skeleton_consumed", #hash_860ac8be:"evt_doa_pickup_default_despawn", #loopsnd:"evt_doa_pickup_default_lp", #hash_d266c0d8:"evt_doa_pickup_skeleton_spawn"});
	function_8cf6a668(30, {#hash_9f6d7ee9:"evt_doa_pickup_sprinkler_consumed", #hash_860ac8be:"evt_doa_pickup_default_despawn", #loopsnd:"evt_doa_pickup_default_lp", #hash_d266c0d8:"evt_doa_pickup_sprinkler_spawn"});
	function_8cf6a668(28, {#hash_9f6d7ee9:"evt_doa_pickup_teddybear_consumed", #hash_860ac8be:"evt_doa_pickup_default_despawn", #loopsnd:"evt_doa_pickup_default_lp", #hash_d266c0d8:"evt_doa_pickup_teddybear_spawn"});
	function_8cf6a668(29, {#hash_9f6d7ee9:"evt_doa_pickup_teslaball_consumed", #hash_860ac8be:"evt_doa_pickup_default_despawn", #loopsnd:"evt_doa_pickup_default_lp", #hash_d266c0d8:"evt_doa_pickup_teslaball_spawn"});
	function_8cf6a668(21, {#hash_9f6d7ee9:"evt_doa_pickup_umbrella_consumed", #hash_860ac8be:"evt_doa_pickup_default_despawn", #loopsnd:"evt_doa_pickup_default_lp", #hash_d266c0d8:"evt_doa_pickup_umbrella_spawn"});
	function_8cf6a668(4, {#hash_9f6d7ee9:"evt_doa_pickup_mech_consumed", #hash_860ac8be:"evt_doa_pickup_default_despawn", #loopsnd:"evt_doa_pickup_default_lp", #hash_d266c0d8:"evt_doa_pickup_mech_spawn"});
	function_8cf6a668(5, {#hash_9f6d7ee9:"evt_doa_pickup_tank_consumed", #hash_860ac8be:"evt_doa_pickup_default_despawn", #loopsnd:"evt_doa_pickup_default_lp", #hash_d266c0d8:"evt_doa_pickup_tank_spawn"});
	function_8cf6a668(40, {#hash_9f6d7ee9:"evt_doa_pickup_hind_consumed", #hash_860ac8be:"evt_doa_pickup_default_despawn", #loopsnd:"evt_doa_pickup_default_lp", #hash_d266c0d8:"evt_doa_pickup_hind_spawn"});
	function_8cf6a668(44, {#hash_9f6d7ee9:"evt_doa_pickup_arcade_consumed", #hash_860ac8be:"evt_doa_pickup_default_despawn", #loopsnd:"evt_doa_pickup_default_lp", #hash_d266c0d8:"evt_doa_pickup_arcade_spawn"});
	function_8cf6a668(43, {#hash_9f6d7ee9:"evt_doa_pickup_vortex_consumed", #hash_860ac8be:"evt_doa_pickup_default_despawn", #loopsnd:"evt_doa_pickup_default_lp", #hash_d266c0d8:"evt_doa_pickup_vortex_spawn"});
	function_51ab3213();
	namespace_4ff32993::init();
	namespace_5d515bd5::init();
	level.doa.var_9a6327ee = function_6265bde4("zombietron_beryl");
	level.doa.var_4b113826 = function_6265bde4("zombietron_ruby");
}

/*
	Name: function_8cf6a668
	Namespace: doa_pickups
	Checksum: 0xAAFFB02B
	Offset: 0x3B78
	Size: 0x160
	Parameters: 2
	Flags: Linked
*/
function function_8cf6a668(type, var_a63abfbe)
{
	items = [];
	foreach(def in level.doa.pickups.itemdefs)
	{
		if(([[ def ]]->function_5ce4fb28()) == type)
		{
			items[items.size] = def;
		}
	}
	foreach(itemdef in items)
	{
		[[ itemdef ]]->function_799a63cf(var_a63abfbe.var_d266c0d8, var_a63abfbe.loopsnd, var_a63abfbe.var_860ac8be, var_a63abfbe.var_9f6d7ee9);
	}
}

/*
	Name: function_72e8509
	Namespace: doa_pickups
	Checksum: 0x933E41D2
	Offset: 0x3CE0
	Size: 0xC4
	Parameters: 1
	Flags: Linked
*/
function function_72e8509(def)
{
	if(isdefined(def))
	{
		return [[ def ]]->function_b3131904();
	}
	count = 0;
	foreach(def in level.doa.pickups.itemdefs)
	{
		count = count + ([[ def ]]->function_b3131904());
	}
	return count;
}

/*
	Name: function_b950ecde
	Namespace: doa_pickups
	Checksum: 0x22EEE838
	Offset: 0x3DB0
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function function_b950ecde()
{
	foreach(def in level.doa.pickups.itemdefs)
	{
		[[ def ]]->function_3f40904b();
	}
}

/*
	Name: function_c1018360
	Namespace: doa_pickups
	Checksum: 0x56D4C3C7
	Offset: 0x3E50
	Size: 0x81A
	Parameters: 8
	Flags: Linked
*/
function function_c1018360(gdtname, type, variant, rarity, modelscale, angles, data, entries)
{
	if(!isdefined(angles))
	{
		angles = vectorscale((0, 0, 1), 70);
	}
	if(!isdefined(entries))
	{
		entries = 1;
	}
	/#
		assert(type <= ((1 << 6) - 1), "");
	#/
	/#
		assert(variant <= ((1 << 3) - 1), "");
	#/
	var_4d842336 = new class_38f05ef0();
	[[ var_4d842336 ]]->init(gdtname, variant, &function_2ebebd0c, rarity, modelscale, type, 10, angles, data, entries);
	level.doa.pickups.itemdefs[level.doa.pickups.itemdefs.size] = var_4d842336;
	[[ var_4d842336 ]]->function_c1403591(&pickuprotate);
	switch(type)
	{
		case 6:
		{
			namespace_41cb996::function_377d91b2(gdtname, data);
			break;
		}
		case 13:
		{
			[[ var_4d842336 ]]->function_c1403591(&function_2cfd5616);
			[[ var_4d842336 ]]->function_ac2eae0a(&function_2c64b1c7);
			[[ var_4d842336 ]]->function_a46e1955(&function_b8f6a8cd);
			level.doa.pickups.var_a81bed69[level.doa.pickups.var_a81bed69.size] = var_4d842336;
			break;
		}
		case 1:
		{
			level.doa.pickups.var_d11c709[level.doa.pickups.var_d11c709.size] = var_4d842336;
			break;
		}
		case 14:
		{
			[[ var_4d842336 ]]->function_c1403591(&function_594c2e4e);
			[[ var_4d842336 ]]->function_ea0e8d6d(0);
			break;
		}
		case 15:
		{
			[[ var_4d842336 ]]->function_c1403591(&namespace_4ff32993::chicken_idle);
			[[ var_4d842336 ]]->function_ea0e8d6d(0);
			break;
		}
		case 32:
		case 33:
		{
			[[ var_4d842336 ]]->function_3e72c5c3(&namespace_3a8e4a3::function_98acc465);
			[[ var_4d842336 ]]->function_a1e5bdf5(&namespace_3a8e4a3::function_22c4e231);
			[[ var_4d842336 ]]->function_c1403591(undefined);
			[[ var_4d842336 ]]->function_ea0e8d6d(0);
			break;
		}
	}
	switch(type)
	{
		case 17:
		case 19:
		case 20:
		case 22:
		case 24:
		case 29:
		{
			[[ var_4d842336 ]]->function_9a8ff4b1(1);
			break;
		}
		case 15:
		case 27:
		{
			[[ var_4d842336 ]]->function_9a8ff4b1(2);
			break;
		}
		case 8:
		case 9:
		case 30:
		case 31:
		{
			[[ var_4d842336 ]]->function_9a8ff4b1(3);
			break;
		}
		case 16:
		{
			[[ var_4d842336 ]]->function_43e11510(20 * 60000);
			[[ var_4d842336 ]]->function_9a8ff4b1(4);
			break;
		}
		case 3:
		case 42:
		{
			[[ var_4d842336 ]]->function_9a8ff4b1(4);
			break;
		}
		case 11:
		case 18:
		case 23:
		case 28:
		case 32:
		{
			[[ var_4d842336 ]]->function_9a8ff4b1(9);
			break;
		}
		case 25:
		case 45:
		{
			[[ var_4d842336 ]]->function_9a8ff4b1(12);
			break;
		}
		case 5:
		case 14:
		case 26:
		case 34:
		case 40:
		{
			[[ var_4d842336 ]]->function_9a8ff4b1(16);
			[[ var_4d842336 ]]->function_43e11510(30 * 60000);
			break;
		}
		case 4:
		case 21:
		case 43:
		{
			[[ var_4d842336 ]]->function_9a8ff4b1(20);
			[[ var_4d842336 ]]->function_43e11510(20 * 60000);
			break;
		}
		case 33:
		case 46:
		{
			[[ var_4d842336 ]]->function_9a8ff4b1(9);
			[[ var_4d842336 ]]->function_43e11510(45 * 60000);
			break;
		}
		case 44:
		{
			[[ var_4d842336 ]]->function_9a8ff4b1(20);
			[[ var_4d842336 ]]->function_43e11510(70 * 60000);
			break;
		}
		case 12:
		case 36:
		case 37:
		case 38:
		case 39:
		case 41:
		{
			[[ var_4d842336 ]]->function_9a8ff4b1(999999);
			break;
		}
	}
}

/*
	Name: function_51ab3213
	Namespace: doa_pickups
	Checksum: 0x90190A60
	Offset: 0x4678
	Size: 0x62E
	Parameters: 0
	Flags: Linked
*/
function function_51ab3213()
{
	level.doa.pickups.var_8f94e67 = [];
	level.doa.pickups.var_8f94e67[0] = [];
	level.doa.pickups.var_8f94e67[1] = [];
	level.doa.pickups.var_8f94e67[2] = [];
	level.doa.pickups.var_8f94e67[3] = [];
	level.doa.pickups.var_8f94e67[4] = [];
	level.doa.pickups.var_2a93b19 = [];
	level.doa.pickups.var_2a93b19[0] = [];
	level.doa.pickups.var_2a93b19[1] = [];
	level.doa.pickups.var_2a93b19[2] = [];
	level.doa.pickups.var_2a93b19[3] = [];
	level.doa.pickups.var_2a93b19[4] = [];
	level.doa.pickups.var_3031eb5c = [];
	foreach(item in level.doa.pickups.itemdefs)
	{
		entries = [[ item ]]->function_55b7a101();
		/#
			assert(entries > 0, "");
		#/
		while(entries)
		{
			entries--;
			if(([[ item ]]->function_5ce4fb28()) == 6)
			{
				if(!isdefined(level.doa.pickups.var_3031eb5c))
				{
					level.doa.pickups.var_3031eb5c = [];
				}
				else if(!isarray(level.doa.pickups.var_3031eb5c))
				{
					level.doa.pickups.var_3031eb5c = array(level.doa.pickups.var_3031eb5c);
				}
				level.doa.pickups.var_3031eb5c[level.doa.pickups.var_3031eb5c.size] = item;
			}
			else
			{
				if(([[ item ]]->function_5ce4fb28()) == 1 || ([[ item ]]->function_5ce4fb28()) == 13)
				{
					if(!isdefined(level.doa.pickups.var_2a93b19[[[ item ]]->function_e2564c16()]))
					{
						level.doa.pickups.var_2a93b19[[[ item ]]->function_e2564c16()] = [];
					}
					else if(!isarray(level.doa.pickups.var_2a93b19[[[ item ]]->function_e2564c16()]))
					{
						level.doa.pickups.var_2a93b19[[[ item ]]->function_e2564c16()] = array(level.doa.pickups.var_2a93b19[[[ item ]]->function_e2564c16()]);
					}
					level.doa.pickups.var_2a93b19[[[ item ]]->function_e2564c16()][level.doa.pickups.var_2a93b19[[[ item ]]->function_e2564c16()].size] = item;
				}
				else
				{
					if(!isdefined(level.doa.pickups.var_8f94e67[[[ item ]]->function_e2564c16()]))
					{
						level.doa.pickups.var_8f94e67[[[ item ]]->function_e2564c16()] = [];
					}
					else if(!isarray(level.doa.pickups.var_8f94e67[[[ item ]]->function_e2564c16()]))
					{
						level.doa.pickups.var_8f94e67[[[ item ]]->function_e2564c16()] = array(level.doa.pickups.var_8f94e67[[[ item ]]->function_e2564c16()]);
					}
					level.doa.pickups.var_8f94e67[[[ item ]]->function_e2564c16()][level.doa.pickups.var_8f94e67[[[ item ]]->function_e2564c16()].size] = item;
				}
			}
		}
	}
}

/*
	Name: function_f9ae7957
	Namespace: doa_pickups
	Checksum: 0xD5988018
	Offset: 0x4CB0
	Size: 0x26A
	Parameters: 0
	Flags: Linked
*/
function function_f9ae7957()
{
	type = [[ self ]]->function_5ce4fb28();
	if(type == 32 || type == 33)
	{
		return undefined;
	}
	if(type == 14)
	{
		return "glow_yellow";
	}
	if(type == 6)
	{
		return "glow_weapon";
	}
	if(type == 10)
	{
		return "glow_red";
	}
	if(type == 46)
	{
		return "glow_yellow";
	}
	if(type == 13)
	{
		name = [[ self ]]->getname();
		switch(name)
		{
			case "zombietron_diamond":
			{
				self.var_4212fdee = "gem_trail_white";
				return "glow_white";
			}
			case "zombietron_ruby":
			{
				self.var_4212fdee = "gem_trail_red";
				return "glow_red";
			}
			case "zombietron_beryl":
			{
				self.var_4212fdee = "gem_trail_yellow";
				return "glow_yellow";
			}
			case "zombietron_sapphire":
			{
				self.var_4212fdee = "gem_trail_blue";
				return "glow_blue";
			}
			case "hash_42741ff16c0ed21b":
			{
				self.var_4212fdee = "gem_trail_green";
				return "glow_green";
			}
		}
	}
	if(([[ self ]]->function_e2564c16()) >= 2)
	{
		return "glow_yellow";
	}
	if(type == 1)
	{
		data = [[ self ]]->getdata();
		if(isdefined(data))
		{
			switch(data)
			{
				case 3:
				case 4:
				case 5:
				{
					return "glow_yellow";
				}
				case 6:
				case 7:
				{
					return "glow_white";
				}
			}
		}
	}
	return "glow_item";
}

/*
	Name: function_7e4e4b8a
	Namespace: doa_pickups
	Checksum: 0x3C8772C0
	Offset: 0x4F28
	Size: 0x15E
	Parameters: 2
	Flags: Linked
*/
function function_7e4e4b8a(player, height)
{
	if(!isdefined(height))
	{
		height = 1200;
	}
	self endon(#"picked_up", #"death");
	player endon(#"disconnect");
	self thread namespace_ec06fe4a::function_ae010bb4(player);
	var_eaf9387b = gettime() + 3500;
	self.origin = self.origin + (0, 0, height);
	while(isdefined(self) && gettime() < var_eaf9387b)
	{
		if(self.origin[2] <= player.origin[2])
		{
			self.origin = player.origin;
			break;
		}
		modz = (player.origin[0], player.origin[1], self.origin[2] - 32);
		self.origin = modz;
		waitframe(1);
	}
	if(isdefined(self))
	{
		self notify(#"hash_3c6becfe7248c004");
	}
}

/*
	Name: itemspawn
	Namespace: doa_pickups
	Checksum: 0x537EBD94
	Offset: 0x5090
	Size: 0x2E0
	Parameters: 11
	Flags: Linked
*/
function itemspawn(var_4d842336, origin, angles, data, forced, glow, width, height, owner, dropheight, clientside)
{
	if(!isdefined(forced))
	{
		forced = 0;
	}
	if(!isdefined(clientside))
	{
		clientside = 1;
	}
	if(!mayspawnentity())
	{
		return;
	}
	if(!is_true(forced) && !function_ae609287(var_4d842336, origin))
	{
		return;
	}
	if(function_4821dfcf([[ var_4d842336 ]]->function_5ce4fb28()))
	{
		level.doa.var_4b491c02 = gettime() + 300000;
	}
	pickup = new class_a08a1bec();
	/#
		assert(isdefined(pickup));
	#/
	if(!isdefined(pickup))
	{
		return;
	}
	if(![[ pickup ]]->init(var_4d842336, origin, angles, data, width, height, undefined, clientside))
	{
		pickup = undefined;
		return;
	}
	model = [[ pickup ]]->getmodel();
	if(!isdefined(glow))
	{
		glow = pickup function_f9ae7957();
	}
	model.glowfx = glow;
	if(isdefined(model.glowfx))
	{
		model namespace_83eb6304::function_3ecfde67(model.glowfx);
	}
	if(isdefined(pickup.var_4212fdee))
	{
		model namespace_83eb6304::function_3ecfde67(pickup.var_4212fdee);
	}
	if(isdefined(owner))
	{
		model.var_54dddc17 = owner;
		model thread function_7e4e4b8a(owner, dropheight);
	}
	var_c5fd79c8 = [[ var_4d842336 ]]->function_424c961e();
	var_2b2c2c96 = [[ var_4d842336 ]]->function_c62ea2e6();
	model thread function_7347b447(var_c5fd79c8, var_2b2c2c96);
	if(!forced)
	{
		[[ var_4d842336 ]]->function_755a46e6();
	}
	if(([[ var_4d842336 ]]->function_5ce4fb28()) == 39)
	{
		model clientfield::set("set_icon", 9);
	}
	return model;
}

/*
	Name: function_7347b447
	Namespace: doa_pickups
	Checksum: 0x788C1FBA
	Offset: 0x5378
	Size: 0x84
	Parameters: 2
	Flags: Linked
*/
function function_7347b447(var_c5fd79c8, var_2b2c2c96)
{
	self endon(#"death");
	self endon(#"picked_up");
	if(isdefined(var_c5fd79c8))
	{
		self namespace_e32bb68::function_3a59ec34(var_c5fd79c8);
	}
	if(isdefined(var_2b2c2c96))
	{
		util::wait_network_frame();
		self namespace_e32bb68::function_3a59ec34(var_2b2c2c96);
	}
}

/*
	Name: function_ad7ac41b
	Namespace: doa_pickups
	Checksum: 0xE1770BA2
	Offset: 0x5408
	Size: 0xC4
	Parameters: 6
	Flags: Linked
*/
function function_ad7ac41b(origin, numitems, radius, itemtype, forced, data)
{
	if(!isdefined(numitems))
	{
		numitems = 10;
	}
	if(!isdefined(radius))
	{
		radius = 256;
	}
	if(!isdefined(itemtype))
	{
		itemtype = 0;
	}
	if(!isdefined(forced))
	{
		forced = 0;
	}
	while(numitems > 0)
	{
		var_4d842336 = function_57160cba(itemtype);
		function_83aea294(origin, 1, radius, var_4d842336, data, forced);
		numitems--;
	}
}

/*
	Name: function_83aea294
	Namespace: doa_pickups
	Checksum: 0xF91F3A64
	Offset: 0x54D8
	Size: 0x14C
	Parameters: 6
	Flags: Linked
*/
function function_83aea294(origin, numitems, radius, var_4d842336, data, forced)
{
	if(!isdefined(numitems))
	{
		numitems = 10;
	}
	if(!isdefined(radius))
	{
		radius = 256;
	}
	radius = int(radius);
	while(numitems)
	{
		spawner::global_spawn_throttle();
		spot = origin;
		if(radius > 0)
		{
			spot = spot + (randomintrange(radius * -1, radius), randomintrange(radius * -1, radius), 0);
		}
		spawnfunc = [[ var_4d842336 ]]->function_a8f2b5de();
		if(isdefined(spawnfunc))
		{
			[[spawnfunc]](var_4d842336, spot, data, forced);
		}
		else
		{
			itemspawn(var_4d842336, spot, undefined, data, forced);
		}
		numitems--;
	}
}

/*
	Name: function_68442ee7
	Namespace: doa_pickups
	Checksum: 0x3CB9069A
	Offset: 0x5630
	Size: 0xEC
	Parameters: 6
	Flags: Linked
*/
function function_68442ee7(origin, numitems, radius, rare, data, forced)
{
	if(!isdefined(numitems))
	{
		numitems = 10;
	}
	if(!isdefined(radius))
	{
		radius = 256;
	}
	if(!isdefined(rare))
	{
		rare = 0;
	}
	if(!isdefined(forced))
	{
		forced = 0;
	}
	while(numitems)
	{
		if(rare)
		{
			var_4d842336 = function_57160cba(2);
		}
		else
		{
			var_4d842336 = function_57160cba(1);
		}
		function_83aea294(origin, 1, radius, var_4d842336, data, forced);
		numitems--;
	}
}

/*
	Name: function_d06cbfe8
	Namespace: doa_pickups
	Checksum: 0x4F984B17
	Offset: 0x5728
	Size: 0x124
	Parameters: 7
	Flags: Linked
*/
function function_d06cbfe8(origin, numitems, radius, popup, var_4d842336, forced, scale)
{
	if(!isdefined(numitems))
	{
		numitems = 10;
	}
	if(!isdefined(radius))
	{
		radius = 256;
	}
	if(!isdefined(popup))
	{
		popup = 0;
	}
	if(!isdefined(forced))
	{
		forced = 0;
	}
	radius = int(radius);
	while(numitems)
	{
		spawner::global_spawn_throttle();
		spot = origin + (randomintrange(radius * -1, radius), randomintrange(radius * -1, radius), 0);
		function_b8f6a8cd(var_4d842336, spot, popup, forced, scale);
		numitems--;
	}
}

/*
	Name: function_b8f6a8cd
	Namespace: doa_pickups
	Checksum: 0xB2501467
	Offset: 0x5858
	Size: 0x1EA
	Parameters: 6
	Flags: Linked
*/
function function_b8f6a8cd(var_4d842336, origin, popup, forced, scale, angles)
{
	if(!isdefined(popup))
	{
		popup = 0;
	}
	if(!isdefined(var_4d842336))
	{
		var_4d842336 = function_57160cba(13);
	}
	data = (popup ? 1 : 0) << 16;
	if(!isdefined(scale))
	{
		rnd = randomint(100);
		if(rnd < 90)
		{
			scale = randomfloatrange(1, 2);
		}
		else
		{
			if(rnd < 96)
			{
				scale = randomfloatrange(1, 3 * 2);
			}
			else
			{
				scale = randomfloatrange(1, 10);
			}
		}
	}
	if(scale < 1)
	{
		scale = 1;
	}
	width = (scale > 3 ? 2 : 1) * 42;
	height = (scale > 3 ? 2 : 1) * 72;
	scale = int((scale / 10) * 65535);
	data = data + scale;
	return itemspawn(var_4d842336, origin, angles, data, forced, undefined, width, height);
}

/*
	Name: function_57160cba
	Namespace: doa_pickups
	Checksum: 0xB7156363
	Offset: 0x5A50
	Size: 0x43A
	Parameters: 1
	Flags: Linked
*/
function function_57160cba(type)
{
	if(!isdefined(type))
	{
		type = 0;
	}
	/#
		assert(level.doa.pickups.itemdefs.size);
	#/
	if(type == 6)
	{
		return level.doa.pickups.var_3031eb5c[randomint(level.doa.pickups.var_3031eb5c.size)];
	}
	if(type == 13)
	{
		return level.doa.pickups.var_a81bed69[randomint(level.doa.pickups.var_a81bed69.size)];
	}
	if(type == 1 || type == 2)
	{
		roll = randomint(100);
		if(type == 2)
		{
			roll = roll - 50;
		}
		itemtype = 0;
		if(roll < 50 && level.doa.pickups.var_2a93b19[1].size)
		{
			itemtype = 1;
		}
		if(roll < 23 && level.doa.pickups.var_2a93b19[2].size)
		{
			itemtype = 2;
		}
		if(roll < 5 && level.doa.pickups.var_2a93b19[3].size)
		{
			itemtype = 3;
		}
		if(roll < 1 && level.doa.pickups.var_2a93b19[4].size)
		{
			itemtype = 4;
		}
		return level.doa.pickups.var_2a93b19[itemtype][randomint(level.doa.pickups.var_2a93b19[itemtype].size)];
	}
	if(type == 0)
	{
		roll = randomint(100);
		itemtype = 0;
		if(roll < 1 && level.doa.pickups.var_8f94e67[4].size)
		{
			itemtype = 4;
		}
		else
		{
			if(roll < 5 && level.doa.pickups.var_8f94e67[3].size)
			{
				itemtype = 3;
			}
			else
			{
				if(roll < 23 && level.doa.pickups.var_8f94e67[2].size)
				{
					itemtype = 2;
				}
				else if(roll < 50 && level.doa.pickups.var_8f94e67[1].size)
				{
					itemtype = 1;
				}
			}
		}
		return level.doa.pickups.var_8f94e67[itemtype][randomint(level.doa.pickups.var_8f94e67[itemtype].size)];
	}
	return function_2c9923d7(type);
}

/*
	Name: function_6265bde4
	Namespace: doa_pickups
	Checksum: 0xB59A053
	Offset: 0x5E98
	Size: 0xAA
	Parameters: 1
	Flags: Linked
*/
function function_6265bde4(name)
{
	foreach(def in level.doa.pickups.itemdefs)
	{
		if(([[ def ]]->getname()) == name)
		{
			return def;
		}
	}
}

/*
	Name: function_2c9923d7
	Namespace: doa_pickups
	Checksum: 0xF657416
	Offset: 0x5F50
	Size: 0xE0
	Parameters: 1
	Flags: Linked
*/
function function_2c9923d7(type)
{
	items = [];
	foreach(def in level.doa.pickups.itemdefs)
	{
		if(([[ def ]]->function_5ce4fb28()) == type)
		{
			items[items.size] = def;
		}
	}
	if(items.size > 0)
	{
		return items[randomint(items.size)];
	}
}

/*
	Name: function_ae609287
	Namespace: doa_pickups
	Checksum: 0x27DE628A
	Offset: 0x6038
	Size: 0x570
	Parameters: 2
	Flags: Linked
*/
function function_ae609287(var_4d842336, origin)
{
	if(!isdefined(var_4d842336))
	{
		return 0;
	}
	if(!mayspawnentity())
	{
		return 0;
	}
	if([[ var_4d842336 ]]->function_2c127eb5() > level.doa.roundnumber)
	{
		return 0;
	}
	if(([[ var_4d842336 ]]->function_b0378495()) == 0)
	{
		return 0;
	}
	type = [[ var_4d842336 ]]->function_5ce4fb28();
	if(type == 10 && level.doa.world_state != 4)
	{
		return 0;
	}
	if(type == 3)
	{
		if(is_true(level.doa.var_318aa67a))
		{
			return 0;
		}
		pickupsitems = getentarray("a_pickup_item", "script_noteworthy");
		foreach(item in pickupsitems)
		{
			if(!isdefined(item))
			{
				continue;
			}
			var_7048016d = [[ item.pickup ]]->function_5ce4fb28();
			if(var_7048016d === 3 || var_7048016d === 5 || var_7048016d === 4 || var_7048016d === 40)
			{
				distsq = distancesquared(origin, item.origin);
				if(distsq < sqr(256))
				{
					return 0;
				}
			}
		}
	}
	if(type == 42)
	{
		if(!isdefined(level.doa.var_182fb75a))
		{
			return 0;
		}
		foreach(player in getplayers())
		{
			if(is_true(player.doa.var_deaabc77))
			{
				return 0;
			}
		}
	}
	if(type == 44)
	{
		if(is_true(level.doa.var_41adf604))
		{
			return 0;
		}
		room1 = namespace_5a917022::function_c8892b0f("slideways");
		room2 = namespace_5a917022::function_c8892b0f("slideways2");
		var_3fcd0176 = namespace_5a917022::function_c8892b0f("slideways3");
		var_3462eaa2 = var_3fcd0176;
		discovered = is_true(room1.var_5250d109) || is_true(room2.var_5250d109) || is_true(var_3fcd0176.var_5250d109) || is_true(var_3462eaa2.var_5250d109);
		if(!discovered)
		{
			return 0;
		}
		if(isdefined(level.doa.var_54c5c3e6))
		{
			return 0;
		}
		if(level.doa.var_4cfbc260 < 1)
		{
			return 0;
		}
	}
	if(type == 43)
	{
		if(zombie_vortex::get_active_vortex_count() > 0)
		{
			return 0;
		}
	}
	if(type == 14 && level.doa.var_6c58d51 > 0)
	{
		return 0;
	}
	if(function_4821dfcf(type))
	{
		if(isdefined(level.doa.var_182fb75a))
		{
			return 0;
		}
		if(level.doa.var_4b491c02 > gettime())
		{
			return 0;
		}
	}
	if(type == 39 && !isdefined(level.doa.var_182fb75a))
	{
		return 0;
	}
	if(isdefined(origin))
	{
		return function_3238d10d(origin);
	}
	return 1;
}

/*
	Name: function_4821dfcf
	Namespace: doa_pickups
	Checksum: 0x843B05E9
	Offset: 0x65B0
	Size: 0x42
	Parameters: 1
	Flags: Linked
*/
function function_4821dfcf(type)
{
	if(type == 5 || type == 4 || type == 40)
	{
		return true;
	}
	return false;
}

/*
	Name: function_5bcfaaa1
	Namespace: doa_pickups
	Checksum: 0x445BAAFB
	Offset: 0x6600
	Size: 0x220
	Parameters: 2
	Flags: Linked
*/
function function_5bcfaaa1(type, player)
{
	if(player hasdobj() == 0)
	{
		return 0;
	}
	if(is_true(player.laststand))
	{
		return 0;
	}
	if(type == 1)
	{
		return 1;
	}
	if(type == 13)
	{
		return 1;
	}
	if(type == 32 || type == 33)
	{
		return 0;
	}
	if(type == 8)
	{
		return player.doa.score.bombs < player namespace_eccff4fb::function_4091beb5();
	}
	if(type == 14)
	{
		return player.doa.score.keys < player namespace_eccff4fb::function_9d6bf0a9();
	}
	if(type == 9)
	{
		return player.doa.score.boosts < player namespace_eccff4fb::function_fd3d9ee0();
	}
	if(type == 16)
	{
		return 1;
	}
	if(isdefined(player.doa.vehicle))
	{
		return 0;
	}
	if(type == 39 && !isdefined(level.doa.var_182fb75a))
	{
		return 0;
	}
	if(type == 46 && player.doa.var_ccd8393c > 0)
	{
		return 0;
	}
	if(type == 41 && is_true(player.doa.var_82fb5d17))
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_f759a457
	Namespace: doa_pickups
	Checksum: 0xEADE98D7
	Offset: 0x6828
	Size: 0x6A
	Parameters: 0
	Flags: Linked
*/
function function_f759a457()
{
	if(isdefined(level.doa.var_182fb75a))
	{
		return true;
	}
	if(isdefined(level.doa.var_6f3d327) && !is_true(level.doa.var_79574675))
	{
		return false;
	}
	return true;
}

/*
	Name: function_2ebebd0c
	Namespace: doa_pickups
	Checksum: 0x66676D0E
	Offset: 0x68A0
	Size: 0x17E4
	Parameters: 0
	Flags: Linked
*/
function function_2ebebd0c()
{
	self notify("2f85e6ca9849c57d");
	self endon("2f85e6ca9849c57d");
	self endon(#"death", #"hash_6749c13ce29143f7");
	self thread namespace_7da86f3c::function_77af9e81();
	wait(0.4);
	if(1)
	{
		for(;;)
		{
			waitresult = undefined;
			waitresult = self waittill(#"hash_221d94db078860dd");
			player = waitresult.activator;
			type = [[ self.def ]]->function_5ce4fb28();
		}
		for(;;)
		{
			player = player.owner;
		}
		for(;;)
		{
		}
		for(;;)
		{
		}
		if(isplayer(player))
		{
			if(isdefined(self.var_54dddc17) && self.var_54dddc17 !== player)
			{
			}
			if(isvehicle(player) && isdefined(player.owner) && isplayer(player.owner) && !is_true(player.autonomous))
			{
			}
			if(!isplayer(player))
			{
			}
			if(!isdefined(player.doa) || !isdefined(player.doa.score))
			{
			}
			if(!function_5bcfaaa1(type, player))
			{
			}
		}
		self.pickedup = 1;
		arrayremovevalue(level.doa.var_cc831548, self);
		var_2b2c2c96 = [[ self.def ]]->function_c62ea2e6();
		if(isdefined(var_2b2c2c96))
		{
			self namespace_e32bb68::function_ae271c0b(var_2b2c2c96);
		}
		var_5750296b = [[ self.def ]]->function_526bfcd9();
		if(isdefined(var_5750296b))
		{
			self namespace_e32bb68::function_3a59ec34(var_5750296b);
		}
		if(isai(player))
		{
			player notify(#"picked_up", {#item:self});
			self function_4ecd84a8(player);
			self namespace_ec06fe4a::function_8c808737();
			if(isdefined(self.glowfx))
			{
				self thread namespace_83eb6304::turnofffx(self.glowfx);
			}
			util::wait_network_frame();
			self notify(#"picked_up");
			self.pickup = undefined;
			return;
		}
		if(isdefined(self.var_2f0b512f))
		{
			[[self.var_2f0b512f]](self);
		}
		if(isdefined(level.doa.var_d5e9e183))
		{
			level [[level.doa.var_d5e9e183]](player, self, type);
		}
		else
		{
			switch(type)
			{
				case 1:
				case 13:
				{
					player namespace_eccff4fb::function_9e8690e0(self, [[ self.def ]]->getdata());
					self function_4ecd84a8(player);
					break;
				}
				case 6:
				{
					player namespace_6e90e490::showhint(3);
					player namespace_41cb996::function_6c4d9896([[ self.def ]]->getname(), 1);
					break;
				}
				case 15:
				{
					if(isdefined(player.revives))
					{
						player.revives++;
					}
					level thread namespace_9fc66ac::announce(31, 1 << player.entnum);
					player namespace_4ff32993::function_f69400ca(self.model);
					break;
				}
				case 3:
				{
					level thread namespace_9fc66ac::announce(37, 1 << player.entnum);
					player thread namespace_a4bedd45::function_1f704cee();
					break;
				}
				case 4:
				{
					level thread namespace_9fc66ac::announce(56, 1 << player.entnum);
					player thread namespace_6e90e490::function_47e11416(19);
					player namespace_6e90e490::showhint(2);
					level thread namespace_78792ce8::function_b974aa72(self.origin, player);
					break;
				}
				case 5:
				{
					level thread namespace_9fc66ac::announce(57, 1 << player.entnum);
					player thread namespace_6e90e490::function_47e11416(19);
					player namespace_6e90e490::showhint(2);
					level thread namespace_2889c797::function_9c1c5551(self.origin + vectorscale((0, 0, 1), 72), player);
					break;
				}
				case 40:
				{
					level thread namespace_9fc66ac::announce(42, 1 << player.entnum);
					player thread namespace_6e90e490::function_47e11416(19);
					player namespace_6e90e490::showhint(2);
					level thread namespace_56b772a5::function_ee81f2ca(self.origin, player);
					break;
				}
				case 8:
				{
					if(isdefined(player.doa.score))
					{
						if(player.doa.score.bombs < player namespace_eccff4fb::function_4091beb5())
						{
							if(!isdefined(self.var_54dddc17) && player doa_fate::function_8a19ece() && level.doa.var_6c58d51 > 0)
							{
								players = namespace_7f5aeb59::function_23e1f90f();
								foreach(guy in players)
								{
									if(guy.doa.score.bombs < guy namespace_eccff4fb::function_4091beb5())
									{
										guy thread namespace_6e90e490::function_47e11416(4);
										guy.doa.score.bombs++;
										model = namespace_ec06fe4a::function_e22ae9b3(self.origin, "zombietron_nuke");
										if(isdefined(model))
										{
											model.angles = self.angles;
											model setscale(self.scale);
											model thread namespace_ec06fe4a::deletemeonnotify("movedone", 2.5);
											model thread function_401a53c4(guy);
										}
									}
								}
							}
							else
							{
								player.doa.score.bombs++;
							}
							level thread namespace_9fc66ac::announce(28, 1 << player.entnum);
						}
					}
					self function_4ecd84a8(player);
					break;
				}
				case 9:
				{
					if(isdefined(player.doa.score))
					{
						if(player.doa.score.boosts < player namespace_eccff4fb::function_fd3d9ee0())
						{
							player.doa.score.boosts++;
							level thread namespace_9fc66ac::announce(27, 1 << player.entnum);
						}
					}
					self function_4ecd84a8(player);
					break;
				}
				case 14:
				{
					if(isdefined(player.doa.score))
					{
						if(player.doa.score.keys < player namespace_eccff4fb::function_9d6bf0a9())
						{
							player namespace_eccff4fb::function_6c15a74e();
							player thread namespace_6e90e490::function_47e11416(20, undefined, 1);
							level thread namespace_9fc66ac::announce(49, 1 << player.entnum);
						}
					}
					self function_4ecd84a8(player);
					break;
				}
				case 10:
				{
					level thread namespace_9fc66ac::announce(41, 1 << player.entnum);
				}
				case 12:
				case 46:
				{
					player thread namespace_b754744b::function_b784c6bd(type);
					break;
				}
				case 42:
				{
					level thread namespace_9fc66ac::announce(43, 1 << player.entnum);
					player thread function_32370b0d();
					break;
				}
				case 16:
				{
					self namespace_ec06fe4a::function_8c808737();
					if(isdefined(self.var_54dddc17))
					{
						player thread namespace_6e90e490::function_47e11416(4);
						if(player.doa.score.lives < player namespace_eccff4fb::function_77cbfb85())
						{
							player.doa.score.lives++;
							level thread namespace_9fc66ac::announce(36, 1 << player.entnum);
						}
					}
					else
					{
						level thread namespace_9fc66ac::announce(36);
						players = namespace_7f5aeb59::function_23e1f90f();
						foreach(guy in players)
						{
							if(guy.doa.score.lives < guy namespace_eccff4fb::function_77cbfb85())
							{
								guy thread namespace_6e90e490::function_47e11416(4);
								guy.doa.score.lives++;
								model = namespace_ec06fe4a::function_e22ae9b3(self.origin, "zombietron_extra_life");
								if(isdefined(model))
								{
									model.angles = self.angles;
									model setscale(self.scale);
									model thread namespace_ec06fe4a::deletemeonnotify("movedone", 2.5);
									model thread function_401a53c4(guy);
								}
							}
						}
					}
					break;
				}
				case 17:
				{
					level thread namespace_9fc66ac::announce(26, 1 << player.entnum);
					player thread namespace_bf41daf8::barrelupdate();
					break;
				}
				case 18:
				{
					level thread namespace_9fc66ac::announce(30, 1 << player.entnum);
					player thread namespace_dcd37093::function_d28e9b17();
					break;
				}
				case 19:
				{
					level thread namespace_9fc66ac::announce(46, 1 << player.entnum);
					player thread namespace_52ba5a8a::sawbladeupdate();
					break;
				}
				case 20:
				{
					level thread namespace_9fc66ac::announce(24, 1 << player.entnum);
					player namespace_41cb996::function_41a10718(8);
					player namespace_41cb996::function_d5bd34b4();
					break;
				}
				case 21:
				{
					level thread namespace_9fc66ac::announce(53, 1 << player.entnum);
					player thread namespace_6e90e490::function_47e11416(18);
					level thread function_2735024b();
					break;
				}
				case 22:
				{
					level thread namespace_9fc66ac::announce(47, 1 << player.entnum);
					level thread namespace_7fdfcd5b::function_86bd7962(player);
					break;
				}
				case 45:
				{
					level thread namespace_9fc66ac::announce(58, 1 << player.entnum);
					level thread namespace_7fdfcd5b::function_86bd7962(player, undefined, 0);
					break;
				}
				case 11:
				{
					level thread namespace_9fc66ac::announce(39, 1 << player.entnum);
					level thread namespace_14f8bd8f::function_32160152(player, "zombietron_gift_box", self.origin, self.angles, self.scale);
					break;
				}
				case 23:
				{
					level thread namespace_9fc66ac::announce(44, 1 << player.entnum);
					player thread namespace_6e90e490::function_47e11416(16);
					level thread namespace_7da86f3c::function_eeb092f5(player);
					break;
				}
				case 24:
				{
					level thread namespace_9fc66ac::announce(29, 1 << player.entnum);
					player thread namespace_7f5aeb59::function_a99cfd4f();
					break;
				}
				case 25:
				{
					level thread namespace_9fc66ac::announce(32, 1 << player.entnum);
					level thread namespace_e7f07a2a::timeshifterupdate(player, self.origin);
					break;
				}
				case 26:
				{
					level thread namespace_9fc66ac::announce(33, 1 << player.entnum);
					level thread namespace_ad27dfd8::function_8dbbde01(player, self.origin);
					break;
				}
				case 27:
				{
					level thread namespace_9fc66ac::announce(45, 1 << player.entnum);
					level thread namespace_e8bada13::function_a53db30e(player, self.origin);
					break;
				}
				case 28:
				{
					level thread namespace_9fc66ac::announce(51, 1 << player.entnum);
					player thread namespace_5f74ac47::function_f44fbe7c();
					break;
				}
				case 29:
				{
					level thread namespace_9fc66ac::announce(52, 1 << player.entnum);
					player thread namespace_9038b9d9::function_6ec0595a();
					break;
				}
				case 30:
				{
					level thread namespace_9fc66ac::announce(50, 1 << player.entnum);
					level thread namespace_b0e844dd::function_d275f769(player, self.origin);
					break;
				}
				case 31:
				{
					level thread namespace_9fc66ac::announce(40, 1 << player.entnum);
					player thread namespace_5d515bd5::function_60c2247c();
					break;
				}
				case 34:
				{
					level thread namespace_9fc66ac::announce(48, 1 << player.entnum);
					player thread namespace_6e90e490::function_47e11416(17);
					player thread namespace_545df111::function_90cdf7ba(type, self.origin);
					break;
				}
				case 36:
				case 37:
				case 38:
				{
					player namespace_41cb996::function_51e99bc7(2);
					self function_401a53c4(player);
					break;
				}
				case 39:
				{
					level notify(#"ladder_up", {#pickup:self});
					self notify(#"ladder_up");
					break;
				}
				case 41:
				{
					level thread namespace_9fc66ac::announce(38, 1 << player.entnum);
					player.doa.var_82fb5d17 = 1;
					player namespace_6e90e490::showhint(5);
					break;
				}
				case 43:
				{
					level thread namespace_9fc66ac::announce(54, 1 << player.entnum);
					level thread zombie_vortex::start_timed_vortex(2, self.origin, 128, 128, player);
					break;
				}
				case 44:
				{
					level thread namespace_9fc66ac::announce(25, 1 << player.entnum);
					level thread namespace_6d0b8a1a::function_465aaf09(player, self.origin);
					break;
				}
				default:
				{
					/#
						assert(0, "");
					#/
					break;
				}
			}
		}
		self namespace_ec06fe4a::function_8c808737();
		if(isdefined(self.glowfx))
		{
			self thread namespace_83eb6304::turnofffx(self.glowfx);
		}
		util::wait_network_frame();
		self notify(#"unlink");
		self notify(#"picked_up");
		self.pickup = undefined;
		return;
	}
}

/*
	Name: function_d936944a
	Namespace: doa_pickups
	Checksum: 0x625F0C2F
	Offset: 0x8090
	Size: 0x10E
	Parameters: 0
	Flags: Linked
*/
function function_d936944a()
{
	time = gettime();
	if(self.doa.var_6b4163f1 > time)
	{
		return;
	}
	if(!is_true(self.doa.var_c026f7c9))
	{
		self.doa.var_6b4163f1 = time + 250;
	}
	else
	{
		self.doa.var_6b4163f1 = time;
	}
	if(level.doa.var_cc831548.size)
	{
		arrayremovevalue(level.doa.var_cc831548, undefined, 0);
		self.doa.var_ad888d1f = arraysortclosest(level.doa.var_cc831548, self.origin, 16, 0, 1024);
	}
	else
	{
		self.doa.var_ad888d1f = [];
	}
}

/*
	Name: function_cbae9ca3
	Namespace: doa_pickups
	Checksum: 0x76FA82E9
	Offset: 0x81A8
	Size: 0x32C
	Parameters: 0
	Flags: Linked
*/
function function_cbae9ca3()
{
	if(self.doa.var_ad888d1f.size == 0)
	{
		return;
	}
	playerx = self.origin[0];
	playery = self.origin[1];
	playerz = self.origin[2];
	if(isdefined(self.doa.vehicle) && isdefined(self.doa.var_baad518e))
	{
		playerz = self.doa.var_baad518e[2];
	}
	playerh = 72;
	playerw = 25;
	var_b2876baf = playerz + playerh;
	var_4eae5a61 = playerx - playerw;
	playerright = playerx + playerw;
	var_a2eaa855 = playery - playerw;
	var_ec175a2f = playery + playerw;
	foreach(pickup in self.doa.var_ad888d1f)
	{
		if(!isdefined(pickup))
		{
			continue;
		}
		if(0)
		{
			pickup thread namespace_1e25ad94::function_e8f2d12c(pickup.origin + (vectorscale((0, 0, -1), 16)), pickup.radius, pickup.height, 1, (0, 0, 1));
		}
		var_f0dd222e = pickup.height;
		pickupz = pickup.origin[2] - 16;
		if((pickupz + var_f0dd222e) < playerz || (pickupz - var_f0dd222e) > var_b2876baf)
		{
			continue;
		}
		var_ed781dc = pickup.radius;
		var_acf65447 = pickup.origin[0];
		minx = var_acf65447 - var_ed781dc;
		maxx = var_acf65447 + var_ed781dc;
		if(maxx < var_4eae5a61 || minx > playerright)
		{
			continue;
		}
		var_7fe7fa2b = pickup.origin[1];
		minx = var_7fe7fa2b - var_ed781dc;
		maxx = var_7fe7fa2b + var_ed781dc;
		if(maxx < var_a2eaa855 || minx > var_ec175a2f)
		{
			continue;
		}
		pickup notify(#"hash_221d94db078860dd", {#activator:self});
	}
}

/*
	Name: function_594c2e4e
	Namespace: doa_pickups
	Checksum: 0x6DF9B595
	Offset: 0x84E0
	Size: 0x96
	Parameters: 0
	Flags: Linked
*/
function function_594c2e4e()
{
	self endon(#"death");
	self.origin = self.origin + vectorscale((0, 0, 1), 12);
	self thread namespace_ec06fe4a::function_f506b4c7();
	self thread namespace_ec06fe4a::function_8b1ae345(undefined, 12, "stopIdle");
	self waittill(#"hash_221d94db078860dd");
	self notify(#"stopidle");
}

/*
	Name: function_a12517b
	Namespace: doa_pickups
	Checksum: 0x7A661174
	Offset: 0x8580
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function function_a12517b()
{
	self endon(#"death");
	self waittill(#"stopidle");
	if(is_true(self.var_9ca559f5))
	{
		self clientfield::set("pickuprotate", 0);
	}
}

/*
	Name: pickuprotate
	Namespace: doa_pickups
	Checksum: 0x32FACF42
	Offset: 0x85F0
	Size: 0x12E
	Parameters: 0
	Flags: Linked
*/
function pickuprotate()
{
	self endon(#"death", #"stopidle");
	if(is_true(self.var_9ca559f5))
	{
		util::wait_network_frame();
		self thread function_a12517b();
		self clientfield::set("pickuprotate", 1);
	}
	else
	{
		dir = 180;
		if(randomint(100) > 50)
		{
			dir = -180;
		}
		time = randomfloatrange(3, 7);
		while(isdefined(self))
		{
			self rotateto(self.angles + (0, dir, 0), time);
			wait(time);
		}
	}
}

/*
	Name: function_4ecd84a8
	Namespace: doa_pickups
	Checksum: 0xB71D98DE
	Offset: 0x8728
	Size: 0x2CA
	Parameters: 4
	Flags: Linked
*/
function function_4ecd84a8(player, entnum, end_pt, time)
{
	if(!isdefined(entnum))
	{
		entnum = player.entnum;
	}
	if(!isdefined(time))
	{
		time = 2;
	}
	self endon(#"death");
	self notify(#"picked_up");
	self notify(#"unlink");
	waitframe(1);
	if(isdefined(self))
	{
		if(!isdefined(end_pt))
		{
			if(isdefined(player) && isplayer(player))
			{
				x = 2000;
				y = 3000;
				z = 1000;
				if(is_true(level.doa.var_ecff3871))
				{
					x = 0 - x;
					y = 0 - y;
				}
				end_pt = player.origin;
				if(entnum == 0 || entnum > 3)
				{
				}
				else
				{
					if(entnum == 1)
					{
						y = 0 - y;
					}
					else
					{
						if(entnum == 2)
						{
							x = 0 - x;
						}
						else if(entnum == 3)
						{
							y = 0 - y;
							x = 0 - x;
						}
					}
				}
				end_pt = end_pt + (x, y, z);
			}
			else
			{
				end_pt = self.origin + vectorscale((0, 0, 1), 3000);
			}
		}
		self function_469baf4a();
		if(is_true(self.var_9ca559f5))
		{
			var_61ea5ba6 = 0;
			if(isdefined(player) && isplayer(player))
			{
				var_61ea5ba6 = (1 + player.entnum) << 1;
				val = var_61ea5ba6 + 1;
			}
			else
			{
				val = 15;
			}
			self clientfield::set("pickupmoveto", val);
		}
		else
		{
			self moveto(end_pt, time, 0, 0);
		}
		wait(time);
	}
}

/*
	Name: function_401a53c4
	Namespace: doa_pickups
	Checksum: 0xA8F7EF89
	Offset: 0x8A00
	Size: 0x1E4
	Parameters: 1
	Flags: Linked
*/
function function_401a53c4(player)
{
	self endon(#"death");
	if(isdefined(self))
	{
		if(isdefined(player))
		{
			var_bead1873 = 13500;
			topy = 30000;
			var_d7e22d96 = 20000;
			bottomy = 30000;
			if(is_true(level.doa.var_ecff3871))
			{
				var_bead1873 = var_bead1873 * -1;
				topy = topy * -1;
				var_d7e22d96 = var_d7e22d96 * -1;
				bottomy = bottomy * -1;
			}
			end_pt = player.origin;
			if(player.entnum == 0)
			{
				offset = (var_bead1873, topy, 10000);
			}
			else
			{
				if(player.entnum == 1)
				{
					offset = (var_bead1873, topy * -1, 10000);
				}
				else
				{
					if(player.entnum == 2)
					{
						offset = (var_d7e22d96 * -1, bottomy, 10000);
					}
					else if(player.entnum == 3)
					{
						offset = (var_d7e22d96 * -1, bottomy * -1, 10000);
					}
				}
			}
			end_pt = end_pt + offset;
		}
		else
		{
			end_pt = self.origin + vectorscale((0, 0, 1), 3000);
		}
		self function_4ecd84a8(player, undefined, end_pt, 20);
	}
}

/*
	Name: function_2cfd5616
	Namespace: doa_pickups
	Checksum: 0x462D41C1
	Offset: 0x8BF0
	Size: 0x13C
	Parameters: 1
	Flags: Linked
*/
function function_2cfd5616(popvec)
{
	if(isdefined(self.popup) && self.popup == 0)
	{
		self thread pickuprotate();
		return;
	}
	if(!isdefined(popvec))
	{
		target_point = self.origin + (randomfloatrange(-0.1, 0.1), randomfloatrange(-0.1, 0.1), 20);
	}
	else
	{
		target_point = self.origin + popvec;
	}
	self solid();
	vel = target_point - self.origin;
	self.origin = self.origin + (4 * vel);
	vel = vel * randomfloatrange(0.5, 3);
	self physicslaunch(self.origin, vel);
}

/*
	Name: function_2c64b1c7
	Namespace: doa_pickups
	Checksum: 0x9D7DE6AC
	Offset: 0x8D38
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function function_2c64b1c7()
{
	data = [[ self.pickup ]]->getdata();
	self.scale = ((data & 65535) / 65535) * 10;
	self.popup = data >> 16;
	self setscale(self.scale);
	self.var_d34e5888 = self.scale * 2;
	if(self.scale == 10)
	{
		self.var_d34e5888 = self.var_d34e5888 + 50;
	}
	self solid();
}

/*
	Name: function_93de1cd5
	Namespace: doa_pickups
	Checksum: 0x91C4E411
	Offset: 0x8E08
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function function_93de1cd5()
{
	if(is_true(self.var_9ca559f5))
	{
		self clientfield::set("pickupvisibility", 1);
	}
	else
	{
		self ghost();
	}
}

/*
	Name: function_469baf4a
	Namespace: doa_pickups
	Checksum: 0xB597C408
	Offset: 0x8E68
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function function_469baf4a()
{
	if(is_true(self.var_9ca559f5))
	{
		self clientfield::set("pickupvisibility", 0);
	}
	else
	{
		self namespace_ec06fe4a::function_4f72130c();
	}
}

/*
	Name: function_c2b49bb2
	Namespace: doa_pickups
	Checksum: 0x1B15F4F7
	Offset: 0x8EC8
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function function_c2b49bb2()
{
	self endon(#"death");
	self waittill(#"hash_2a866f50cc161ca8");
	if(is_true(self.var_9ca559f5))
	{
		self clientfield::set("pickuptimeout", 0);
	}
}

/*
	Name: pickuptimeout
	Namespace: doa_pickups
	Checksum: 0xA850CD41
	Offset: 0x8F38
	Size: 0x272
	Parameters: 1
	Flags: Linked
*/
function pickuptimeout(timetowait)
{
	if(timetowait <= 0)
	{
		return;
	}
	self endon(#"death", #"hash_2a866f50cc161ca8");
	wait(randomint(5));
	if(is_true(self.var_9ca559f5))
	{
		self clientfield::set("pickuptimeout", 1);
		self thread function_c2b49bb2();
	}
	wait(timetowait);
	for(i = 0; i < 40; i++)
	{
		if(!isdefined(self))
		{
			break;
		}
		if(isdefined(self.var_b20c0bc5))
		{
			[[self.var_b20c0bc5]](i % 2);
		}
		else if(!is_true(self.var_9ca559f5))
		{
			if(i % 2)
			{
				self function_93de1cd5();
			}
			else
			{
				self function_469baf4a();
			}
		}
		if(i < 15)
		{
			wait(0.5);
			continue;
		}
		if(i < 25)
		{
			wait(0.25);
			continue;
		}
		wait(0.1);
	}
	var_2b2c2c96 = [[ self.def ]]->function_c62ea2e6();
	if(isdefined(var_2b2c2c96))
	{
		self namespace_e32bb68::function_ae271c0b(var_2b2c2c96);
	}
	var_779128e2 = [[ self.def ]]->function_cd066492();
	if(isdefined(var_779128e2))
	{
		self namespace_e32bb68::function_3a59ec34(var_779128e2);
		util::wait_network_frame();
	}
	self notify(#"pickup_timeout");
	wait(0.2);
	if(isdefined(self) && !is_true(self.var_ef88bfeb))
	{
		self.pickup = undefined;
	}
}

/*
	Name: function_18372b20
	Namespace: doa_pickups
	Checksum: 0x78AAC952
	Offset: 0x91B8
	Size: 0xE2
	Parameters: 0
	Flags: Linked
*/
function function_18372b20()
{
	function_19fa261e();
	foreach(orb in level.doa.var_537a3e29)
	{
		if(isdefined(orb))
		{
			orb delete();
		}
	}
	function_b950ecde();
	level.doa.var_537a3e29 = [];
	level.doa.var_4b491c02 = 0;
}

/*
	Name: function_19fa261e
	Namespace: doa_pickups
	Checksum: 0x9A7C7A77
	Offset: 0x92A8
	Size: 0xB0
	Parameters: 0
	Flags: Linked
*/
function function_19fa261e()
{
	level notify(#"stop_spawning_pickups");
	util::wait_network_frame();
	pickupsitems = getentarray("a_pickup_item", "script_noteworthy");
	for(i = 0; i < pickupsitems.size; i++)
	{
		item = pickupsitems[i];
		if(isdefined(item))
		{
			item.pickup = undefined;
		}
	}
	level notify(#"hash_7eba5f3243b496b8");
}

/*
	Name: function_69cafbe0
	Namespace: doa_pickups
	Checksum: 0x895A99D5
	Offset: 0x9360
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_69cafbe0()
{
	pickupsitems = getentarray("a_pickup_item", "script_noteworthy");
	return pickupsitems.size;
}

/*
	Name: function_2735024b
	Namespace: doa_pickups
	Checksum: 0xAC1C579F
	Offset: 0x93A0
	Size: 0x1B4
	Parameters: 0
	Flags: Linked
*/
function function_2735024b()
{
	ent = namespace_ec06fe4a::function_e22ae9b3((0, 0, 0));
	if(isdefined(ent))
	{
		ent namespace_e32bb68::function_3a59ec34("evt_doa_pickup_umbrella_storm_2d_lp");
	}
	amount = randomintrange((namespace_7f5aeb59::function_23e1f90f().size * 3) + 4, (namespace_7f5aeb59::function_23e1f90f().size * 5) + 6);
	while(amount)
	{
		if(isdefined(level.doa.var_39e3fa99))
		{
			spot = [[ level.doa.var_39e3fa99 ]]->function_70fb5745().origin;
			spot = spot + vectorscale((0, 0, 1), 1000);
			function_b8f6a8cd(undefined, spot, 1);
			amount--;
			wait(randomintrange(1, 3));
		}
		else
		{
			break;
		}
	}
	if(isdefined(ent))
	{
		ent namespace_e32bb68::function_ae271c0b("evt_doa_pickup_umbrella_storm_2d_lp");
		ent namespace_e32bb68::function_3a59ec34("evt_doa_pickup_umbrella_storm_2d_end");
		ent thread namespace_ec06fe4a::function_52afe5df(1);
	}
}

/*
	Name: function_32370b0d
	Namespace: doa_pickups
	Checksum: 0x5E8792AF
	Offset: 0x9560
	Size: 0x26A
	Parameters: 1
	Flags: Linked
*/
function function_32370b0d(timeout)
{
	if(!isdefined(timeout))
	{
		timeout = 120;
	}
	timeout = self doa_fate::function_4808b985(timeout);
	timeleft = gettime() + (timeout * 1000);
	self.doa.var_d320bb5d = timeleft - 15000;
	if(isdefined(self.doa.var_ad639ebd))
	{
		return;
	}
	self.doa.var_ad639ebd = namespace_ec06fe4a::function_e22ae9b3(self.origin, "tag_origin", self.angles, "player lanternOrg");
	if(isdefined(self.doa.var_ad639ebd))
	{
		self.doa.var_ad639ebd thread namespace_ec06fe4a::function_d55f042c(self, "lantern_terminated");
	}
	self.doa.var_ad639ebd linkto(self);
	self endon(#"lantern_terminated", #"disconnect");
	self.doa.var_ad639ebd namespace_83eb6304::turnofffx("lantern_fade");
	self.doa.var_ad639ebd namespace_83eb6304::function_3ecfde67("lantern");
	while(gettime() < self.doa.var_d320bb5d && !is_true(self.laststand))
	{
		wait(1);
	}
	if(!is_true(self.laststand))
	{
		self namespace_83eb6304::function_3ecfde67("lantern_fade");
	}
	self.doa.var_ad639ebd namespace_83eb6304::turnofffx("lantern");
	self.doa.var_ad639ebd delete();
	self.doa.var_ad639ebd = undefined;
}

