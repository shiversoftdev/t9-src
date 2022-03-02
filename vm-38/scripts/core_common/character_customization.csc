#using script_158d50d476435605;
#using script_474309807eb94f34;
#using scripts\core_common\animation_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\custom_class.csc;
#using scripts\core_common\multi_extracam.csc;
#using scripts\core_common\scene_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

class class_7da27482 
{
	var var_1d18f5c7;
	var var_cbcee022;
	var var_228f64da;
	var var_506d3c33;
	var var_9896541c;
	var var_5633914d;
	var var_1d73bad9;
	var var_ea1ac6a5;
	var var_f141235b;
	var var_180f1c7d;
	var var_c31e86ed;
	var var_f5c0467b;
	var var_cf55444c;
	var var_6ce65c01;
	var var_61e64cb8;
	var var_b3113387;
	var var_54430cb6;
	var var_a287debe;
	var var_7e5e7fa2;
	var var_ef017bf9;
	var var_8d2161e9;
	var var_cfe86a3e;
	var var_ff2bed36;
	var var_8d79cdc7;
	var var_81bd1932;
	var var_640fbaae;
	var var_444a0d45;
	var var_9bea772f;
	var var_43b94d19;
	var var_e09268b7;
	var var_b6892e9d;
	var var_851003fe;
	var _origin;
	var var_b627749c;
	var var_eb95665;
	var var_d781e2e4;
	var var_87449256;
	var _target_name;
	var var_bf4feef5;
	var var_5d01abf7;
	var var_bf273e28;
	var var_609efd3e;
	var var_45210dc7;
	var var_266b2ff0;
	var var_9a4a8ea;

	/*
		Name: constructor
		Namespace: namespace_7da27482
		Checksum: 0x58DAF3C2
		Offset: 0x5C0
		Size: 0x286
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
		self.var_f141235b = 0;
		self.var_81bd1932 = 0;
		self.var_61e64cb8 = undefined;
		self._target_name = undefined;
		self.var_ea1ac6a5 = 1;
		self.var_1d73bad9 = 0;
		self.var_cf55444c = 0;
		self.var_cfe86a3e = 0;
		self.var_f5c0467b = [7:0, 6:0, 5:0, 4:0, 3:0, 2:0, 1:0, 0:0];
		/#
			/#
				assert(-1);
			#/
		#/
		self.var_228f64da = undefined;
		self.var_e09268b7 = undefined;
		self.var_43b94d19 = 1;
		self.var_c31e86ed = 0;
		self.var_b3113387 = 0;
		self.var_444a0d45 = 0;
		self._origin = (0, 0, 0);
		self.var_7e5e7fa2 = (0, 0, 0);
		self.var_9a4a8ea = undefined;
		self.var_cbcee022 = undefined;
		self.var_54430cb6 = undefined;
		self.var_5d01abf7 = undefined;
		self.var_6ce65c01 = undefined;
		self.var_9bea772f = undefined;
		self.var_a287debe = undefined;
		self.var_8d2161e9 = 0;
		self.var_b6892e9d = 0;
		self.var_45210dc7 = [];
		self.var_bf273e28 = [];
		self.var_5633914d = [];
		self.var_eb95665 = undefined;
		self.var_b627749c = 1;
		self.var_27af8d38 = [];
		self.var_bf4feef5 = 1;
		self.var_609efd3e = 1;
		self.var_9896541c = 0;
		self.var_851003fe = 1;
		self.var_ef017bf9 = 0;
		self.var_506d3c33 = [];
		self.var_ff2bed36 = undefined;
		self.var_8d79cdc7 = undefined;
		self.var_640fbaae = undefined;
		self.var_266b2ff0 = undefined;
		self.var_d781e2e4 = undefined;
		self.var_180f1c7d = [];
		self.var_87449256 = undefined;
		self.var_1d18f5c7 = 0;
	}

	/*
		Name: destructor
		Namespace: namespace_7da27482
		Checksum: 0x80F724D1
		Offset: 0x5198
		Size: 0x4
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: function_47ad026
		Namespace: namespace_7da27482
		Checksum: 0x276AC214
		Offset: 0x4420
		Size: 0x44
		Parameters: 0
		Flags: Linked
	*/
	function function_47ad026()
	{
		if(var_1d18f5c7 && isdefined(var_cbcee022))
		{
			var_228f64da thread animation::play(var_cbcee022, var_228f64da);
		}
	}

	/*
		Name: function_c358189
		Namespace: namespace_7da27482
		Checksum: 0xE0BDC018
		Offset: 0x1548
		Size: 0xE2
		Parameters: 3
		Flags: Linked, Private
	*/
	function private function_c358189(model_name, lod, mip)
	{
		if(!isdefined(lod))
		{
			lod = -1;
		}
		if(!isdefined(mip))
		{
			mip = -1;
		}
		index = array::find(var_506d3c33, {#mip:mip, #lod:lod, #model:model_name}, &function_1a57b132);
		/#
			/#
				assert(isdefined(index));
			#/
		#/
		if(!isdefined(index))
		{
			return 1;
		}
		return character_customization::function_c358189(model_name, lod, mip);
	}

	/*
		Name: function_ca932c8
		Namespace: namespace_7da27482
		Checksum: 0x5DD7542A
		Offset: 0x4F10
		Size: 0xF2
		Parameters: 0
		Flags: Linked
	*/
	function function_ca932c8()
	{
		if(isdefined(var_228f64da))
		{
			if(!var_228f64da isstreamed())
			{
				return false;
			}
		}
		if(var_9896541c && function_d9aed86())
		{
			return false;
		}
		foreach(ent in var_5633914d)
		{
			if(isdefined(ent))
			{
				if(!ent isstreamed())
				{
					return false;
				}
			}
		}
		return true;
	}

	/*
		Name: function_10b0cbea
		Namespace: namespace_7da27482
		Checksum: 0x49DB4261
		Offset: 0x4D10
		Size: 0x38
		Parameters: 0
		Flags: Linked
	*/
	function function_10b0cbea()
	{
		[[ self ]]->function_158505aa(function_76fbb09e(var_f141235b, var_ea1ac6a5, var_1d73bad9));
	}

	/*
		Name: function_158505aa
		Namespace: namespace_7da27482
		Checksum: 0xB512B587
		Offset: 0x19E0
		Size: 0x42
		Parameters: 1
		Flags: Linked
	*/
	function function_158505aa(var_7abdc6dd)
	{
		/#
			/#
				assert(var_ea1ac6a5 != 4);
			#/
		#/
		self.var_cfe86a3e = var_7abdc6dd;
	}

	/*
		Name: function_15a8906a
		Namespace: namespace_7da27482
		Checksum: 0xCCE0BD70
		Offset: 0x4AA0
		Size: 0x144
		Parameters: 1
		Flags: Linked
	*/
	function function_15a8906a(var_23904c1d)
	{
		if(isdefined(var_23904c1d.xuid))
		{
			[[ self ]]->function_3eaf9e07(var_23904c1d.xuid);
		}
		[[ self ]]->set_character_mode(var_23904c1d.charactermode);
		[[ self ]]->function_72e88afb(var_23904c1d.charactertype);
		[[ self ]]->function_4a1dc0d3(var_23904c1d.outfit);
		[[ self ]]->function_158505aa(var_23904c1d.var_665ae20e);
		/#
			/#
				assert(var_23904c1d.var_5f383817.size == 8);
			#/
		#/
		foreach(itemindex in var_23904c1d.var_5f383817)
		{
			[[ self ]]->function_8701f84e(itemindex, itemtype);
		}
	}

	/*
		Name: function_184a4d2e
		Namespace: namespace_7da27482
		Checksum: 0xEF2F8BB8
		Offset: 0xBF0
		Size: 0x90
		Parameters: 1
		Flags: Linked
	*/
	function function_184a4d2e(var_f31bf62c)
	{
		if(!isdefined(var_180f1c7d))
		{
			self.var_180f1c7d = [];
		}
		else if(!isarray(var_180f1c7d))
		{
			self.var_180f1c7d = array(var_180f1c7d);
		}
		if(!isinarray(var_180f1c7d, var_f31bf62c))
		{
			self.var_180f1c7d[var_180f1c7d.size] = var_f31bf62c;
		}
	}

	/*
		Name: function_1978bfeb
		Namespace: namespace_7da27482
		Checksum: 0x1032F59
		Offset: 0x1BA0
		Size: 0x62
		Parameters: 0
		Flags: Linked
	*/
	function function_1978bfeb()
	{
		if(var_c31e86ed)
		{
			return #"tag_origin";
		}
		return character_customization::function_6bca50af(&function_6b7000e, var_1d73bad9, var_cf55444c, var_f5c0467b[3], var_ea1ac6a5);
	}

	/*
		Name: function_1a57b132
		Namespace: namespace_7da27482
		Checksum: 0xE6ED8CCE
		Offset: 0x1638
		Size: 0x5A
		Parameters: 2
		Flags: Linked, Private
	*/
	function private function_1a57b132(data_1, data_2)
	{
		return data_1.model === data_2.model && data_1.lod === data_2.lod && data_1.mip === data_2.mip;
	}

	/*
		Name: function_1ec9448d
		Namespace: namespace_7da27482
		Checksum: 0x6424F5CB
		Offset: 0xCA0
		Size: 0x36
		Parameters: 1
		Flags: Linked
	*/
	function function_1ec9448d(var_6ef2ca20)
	{
		if(var_6ef2ca20 != var_c31e86ed)
		{
			self.var_c31e86ed = var_6ef2ca20;
			self.var_b627749c = 1;
		}
	}

	/*
		Name: function_1f70adfe
		Namespace: namespace_7da27482
		Checksum: 0xE6984341
		Offset: 0xF08
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_1f70adfe()
	{
		return var_6ce65c01;
	}

	/*
		Name: function_217b10ed
		Namespace: namespace_7da27482
		Checksum: 0xC7A61BEF
		Offset: 0xC88
		Size: 0xA
		Parameters: 0
		Flags: Linked, Private
	*/
	function private function_217b10ed()
	{
		return var_228f64da;
	}

	/*
		Name: function_22039feb
		Namespace: namespace_7da27482
		Checksum: 0x1947CA00
		Offset: 0x4A10
		Size: 0x44
		Parameters: 0
		Flags: Linked
	*/
	function function_22039feb()
	{
		function_4a1dc0d3(0);
		function_158505aa(0);
		function_95779b72();
	}

	/*
		Name: update
		Namespace: namespace_7da27482
		Checksum: 0x4644D76
		Offset: 0x2138
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function update(params)
	{
		self thread function_7ea1db75(params);
	}

	/*
		Name: function_225b6e07
		Namespace: namespace_7da27482
		Checksum: 0x67E918DC
		Offset: 0x4EB0
		Size: 0x58
		Parameters: 0
		Flags: Linked
	*/
	function function_225b6e07()
	{
		var_65496229 = [[ self ]]->function_690c9509();
		character_index = getequippedheroindex(var_65496229, var_ea1ac6a5);
		[[ self ]]->function_72e88afb(character_index);
	}

	/*
		Name: get_character_mode
		Namespace: namespace_7da27482
		Checksum: 0x3DE46DC7
		Offset: 0x1898
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function get_character_mode()
	{
		return var_ea1ac6a5;
	}

	/*
		Name: function_25725c05
		Namespace: namespace_7da27482
		Checksum: 0xCD0BC
		Offset: 0xE18
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_25725c05()
	{
		return var_61e64cb8;
	}

	/*
		Name: function_27945cb8
		Namespace: namespace_7da27482
		Checksum: 0x61832AF4
		Offset: 0x50E8
		Size: 0x5C
		Parameters: 2
		Flags: Linked
	*/
	function function_27945cb8(on_off, force)
	{
		if(!isdefined(force))
		{
			force = 0;
		}
		if(var_b3113387 != on_off || force)
		{
			self.var_b3113387 = on_off;
			function_2a5421e3();
		}
	}

	/*
		Name: function_2a5421e3
		Namespace: namespace_7da27482
		Checksum: 0xA66AC9A6
		Offset: 0x5010
		Size: 0xCC
		Parameters: 0
		Flags: Linked, Private
	*/
	function private function_2a5421e3()
	{
		if(var_b3113387 && !var_228f64da function_d2503806(#"hash_79892e1d5a8f9f33"))
		{
			var_228f64da function_bf9d3071(#"hash_79892e1d5a8f9f33");
		}
		else if(!var_b3113387 && var_228f64da function_d2503806(#"hash_79892e1d5a8f9f33"))
		{
			var_228f64da function_5d482e78(#"hash_79892e1d5a8f9f33");
		}
	}

	/*
		Name: function_3941dad9
		Namespace: namespace_7da27482
		Checksum: 0x861CA15E
		Offset: 0xD08
		Size: 0x1A
		Parameters: 1
		Flags: Linked
	*/
	function function_3941dad9(alt_render_mode)
	{
		self.var_bf4feef5 = alt_render_mode;
	}

	/*
		Name: function_39a68bf2
		Namespace: namespace_7da27482
		Checksum: 0x3F6C7E6E
		Offset: 0x4518
		Size: 0xCA
		Parameters: 2
		Flags: Linked
	*/
	function function_39a68bf2(var_58351d8b, var_93eea46f)
	{
		if(!isdefined(var_58351d8b))
		{
			var_58351d8b = 1;
		}
		if(!isdefined(var_93eea46f))
		{
			var_93eea46f = 0;
		}
		self.var_1d18f5c7 = 0;
		if(var_58351d8b)
		{
			self notify(#"hash_578cb70e92c24a5a");
			self.var_1d18f5c7 = 1;
		}
		if(isdefined(var_54430cb6))
		{
			var_a287debe scene::cancel(var_54430cb6, 0);
			if(!var_93eea46f)
			{
				self.var_54430cb6 = undefined;
				self.var_5d01abf7 = undefined;
				self.var_6ce65c01 = undefined;
				self.var_a287debe = undefined;
			}
		}
	}

	/*
		Name: function_3eaf9e07
		Namespace: namespace_7da27482
		Checksum: 0xAB5429E3
		Offset: 0xDF0
		Size: 0x1A
		Parameters: 1
		Flags: Linked
	*/
	function function_3eaf9e07(xuid)
	{
		self.var_61e64cb8 = xuid;
	}

	/*
		Name: function_4240a39a
		Namespace: namespace_7da27482
		Checksum: 0x6B2F2CF1
		Offset: 0x1068
		Size: 0x5A
		Parameters: 2
		Flags: Linked
	*/
	function function_4240a39a(var_1f64805f, angles)
	{
		self.var_ef017bf9 = var_1f64805f;
		if(isdefined(angles))
		{
			var_228f64da.angles = angles;
		}
		else
		{
			var_228f64da.angles = var_7e5e7fa2;
		}
	}

	/*
		Name: function_47cb6b19
		Namespace: namespace_7da27482
		Checksum: 0x96EB3694
		Offset: 0xF20
		Size: 0x1A
		Parameters: 0
		Flags: Linked
	*/
	function function_47cb6b19()
	{
		return var_228f64da getentitynumber();
	}

	/*
		Name: function_4a1dc0d3
		Namespace: namespace_7da27482
		Checksum: 0x4076186F
		Offset: 0x18B0
		Size: 0x5E
		Parameters: 1
		Flags: Linked
	*/
	function function_4a1dc0d3(var_7abdc6dd)
	{
		/#
			/#
				assert(var_ea1ac6a5 != 4);
			#/
		#/
		if(var_cf55444c != var_7abdc6dd)
		{
			self.var_b627749c = 1;
			self.var_cf55444c = var_7abdc6dd;
		}
	}

	/*
		Name: function_4a271da1
		Namespace: namespace_7da27482
		Checksum: 0x38E402C0
		Offset: 0x10D0
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_4a271da1()
	{
		return var_ef017bf9;
	}

	/*
		Name: function_4b2b3712
		Namespace: namespace_7da27482
		Checksum: 0x73313FF
		Offset: 0x45F0
		Size: 0xC2
		Parameters: 4
		Flags: Linked, Private
	*/
	function private function_4b2b3712(localclientnum, weaponmodel, var_6f2ae9c0, var_49daa2f6)
	{
		camoindex = getcamoindex(var_6f2ae9c0);
		var_f4eb4a50 = activecamo::function_13e12ab1(camoindex);
		if(!isdefined(var_f4eb4a50))
		{
			return 0;
		}
		stage = function_5442be13(var_6f2ae9c0);
		var_3594168e = var_f4eb4a50.stages[stage];
		return activecamo::function_6c9e0e1a(localclientnum, weaponmodel, var_3594168e, var_49daa2f6);
	}

	/*
		Name: function_59d1302f
		Namespace: namespace_7da27482
		Checksum: 0xE1DE24F6
		Offset: 0x4D50
		Size: 0x38
		Parameters: 0
		Flags: Linked
	*/
	function function_59d1302f()
	{
		for(itemtype = 0; itemtype < 8; itemtype++)
		{
			[[ self ]]->function_ac9cc79d(itemtype);
		}
	}

	/*
		Name: function_60b3658e
		Namespace: namespace_7da27482
		Checksum: 0x7FB1BC3B
		Offset: 0x4068
		Size: 0xCC
		Parameters: 2
		Flags: Linked, Private
	*/
	function private function_60b3658e(var_2ec36514, need_wait)
	{
		if(need_wait)
		{
			self endon(#"deleted", #"hash_578cb70e92c24a5a");
			self waittill(#"hash_7e1333ff017b0007", #"hash_3d69d89a5c0c677");
		}
		if(isdefined(var_2ec36514))
		{
			var_228f64da thread animation::play(var_2ec36514, var_228f64da);
		}
		else if(isdefined(var_54430cb6))
		{
			if(var_8d2161e9)
			{
				var_a287debe thread scene::play(var_54430cb6, var_228f64da);
			}
		}
	}

	/*
		Name: function_617a9ce4
		Namespace: namespace_7da27482
		Checksum: 0xCE880C01
		Offset: 0x1788
		Size: 0x2C
		Parameters: 1
		Flags: Linked
	*/
	function function_617a9ce4(var_8065b05)
	{
		/#
			assert(var_8065b05 === var_ea1ac6a5);
		#/
	}

	/*
		Name: function_62dd99d6
		Namespace: namespace_7da27482
		Checksum: 0xA96F45A3
		Offset: 0x1CF0
		Size: 0xB4
		Parameters: 1
		Flags: Linked
	*/
	function function_62dd99d6(model)
	{
		render_options = function_aa478513({#hash_18d63ea2:var_f5c0467b, #hash_34ba1b60:var_cfe86a3e, #outfitindex:var_cf55444c, #characterindex:var_1d73bad9, #mode:var_ea1ac6a5});
		model function_1fac41e4(render_options);
	}

	/*
		Name: function_66de4847
		Namespace: namespace_7da27482
		Checksum: 0x74E535E2
		Offset: 0x1380
		Size: 0x10A
		Parameters: 0
		Flags: Linked, Private
	*/
	function private function_66de4847()
	{
		if(isdefined(var_ff2bed36))
		{
			var_ff2bed36 delete();
			self.var_ff2bed36 = undefined;
		}
		if(isdefined(var_8d79cdc7))
		{
			var_8d79cdc7 delete();
			self.var_8d79cdc7 = undefined;
		}
		foreach(var_24112f50 in var_506d3c33)
		{
			character_customization::function_247f6628(var_24112f50.model, var_24112f50.lod, var_24112f50.mip);
		}
		self.var_506d3c33 = [];
	}

	/*
		Name: function_690c9509
		Namespace: namespace_7da27482
		Checksum: 0x1B2814E9
		Offset: 0xDC0
		Size: 0x22
		Parameters: 0
		Flags: Linked
	*/
	function function_690c9509()
	{
		return (isdefined(var_81bd1932) ? var_81bd1932 : var_f141235b);
	}

	/*
		Name: function_69ac4009
		Namespace: namespace_7da27482
		Checksum: 0xC8C857BB
		Offset: 0x44E0
		Size: 0x2E
		Parameters: 1
		Flags: Linked
	*/
	function function_69ac4009(var_cc478c99)
	{
		gesture = get_gesture(var_cc478c99);
	}

	/*
		Name: function_72be01b9
		Namespace: namespace_7da27482
		Checksum: 0xC015FF81
		Offset: 0x4CD0
		Size: 0x38
		Parameters: 0
		Flags: Linked
	*/
	function function_72be01b9()
	{
		[[ self ]]->function_4a1dc0d3(function_9ec573f1(var_f141235b, var_ea1ac6a5, var_1d73bad9));
	}

	/*
		Name: function_72e88afb
		Namespace: namespace_7da27482
		Checksum: 0xB789ABEF
		Offset: 0x1820
		Size: 0x56
		Parameters: 1
		Flags: Linked
	*/
	function function_72e88afb(character_index)
	{
		/#
			/#
				assert(isdefined(character_index));
			#/
		#/
		if(var_1d73bad9 != character_index)
		{
			self.var_b627749c = 1;
			self.var_1d73bad9 = character_index;
		}
	}

	/*
		Name: function_7412658d
		Namespace: namespace_7da27482
		Checksum: 0x9F975997
		Offset: 0x48A8
		Size: 0x8C
		Parameters: 1
		Flags: Linked
	*/
	function function_7412658d(params)
	{
		if(var_640fbaae !== params.exploder_id)
		{
			if(isdefined(var_640fbaae))
			{
				killradiantexploder(var_f141235b, var_640fbaae);
			}
			self.var_640fbaae = params.exploder_id;
			if(isdefined(var_640fbaae))
			{
				playradiantexploder(var_f141235b, var_640fbaae);
			}
		}
	}

	/*
		Name: function_7792df22
		Namespace: namespace_7da27482
		Checksum: 0x6F63EDC0
		Offset: 0x5150
		Size: 0x3C
		Parameters: 1
		Flags: Linked
	*/
	function function_7792df22(locked)
	{
		if(var_444a0d45 != locked)
		{
			self.var_444a0d45 = locked;
			function_2a5421e3();
		}
	}

	/*
		Name: function_77e3be08
		Namespace: namespace_7da27482
		Checksum: 0x48D06DB1
		Offset: 0x4C90
		Size: 0x34
		Parameters: 0
		Flags: Linked
	*/
	function function_77e3be08()
	{
		[[ self ]]->function_72be01b9();
		[[ self ]]->function_10b0cbea();
		[[ self ]]->function_59d1302f();
	}

	/*
		Name: function_782bdd96
		Namespace: namespace_7da27482
		Checksum: 0xCBAFCE78
		Offset: 0xED8
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_782bdd96()
	{
		return var_54430cb6;
	}

	/*
		Name: function_79f89fb6
		Namespace: namespace_7da27482
		Checksum: 0x91D02AB8
		Offset: 0xD30
		Size: 0x1A
		Parameters: 1
		Flags: Linked
	*/
	function function_79f89fb6(var_925f39ce)
	{
		self.var_9896541c = var_925f39ce;
	}

	/*
		Name: function_7ea1db75
		Namespace: namespace_7da27482
		Checksum: 0xAFB9BEE9
		Offset: 0x2168
		Size: 0x15A0
		Parameters: 1
		Flags: Linked
	*/
	function function_7ea1db75(params)
	{
		self notify("459032096b78f175");
		self endon("459032096b78f175");
		level endon(#"disconnect");
		self endon(#"deleted", #"hash_578cb70e92c24a5a");
		if(isdefined(var_9bea772f))
		{
			function_66b6e720(var_9bea772f);
			self.var_9bea772f = undefined;
			if(var_43b94d19)
			{
				var_228f64da show();
				if(isdefined(var_e09268b7) && var_b6892e9d)
				{
					var_e09268b7 show();
				}
			}
		}
		function_66de4847();
		if(!isdefined(params))
		{
			params = {};
		}
		self.var_1d18f5c7 = 0;
		if(!is_true(params.var_401d9a1))
		{
			[[ self ]]->function_27945cb8(0);
		}
		if([[ self ]]->function_bf7bce05())
		{
			base_model = [[ self ]]->function_d5e754c6();
			attached_models = [#"hash_6fbc03ba2c7779e6":#"tag_origin", #"hash_75bb30e3db362b72":#"tag_origin", #"hash_624d1a4c293770ca":#"tag_origin", #"outfit_head":[[ self ]]->function_8c6b7af7(params)];
		}
		else
		{
			base_model = [[ self ]]->function_b06080fb();
			attached_models = [#"hash_6fbc03ba2c7779e6":[[ self ]]->function_d5e754c6(), #"hash_75bb30e3db362b72":[[ self ]]->function_cdc02b18(), #"hash_624d1a4c293770ca":[[ self ]]->function_1978bfeb(), #"outfit_head":[[ self ]]->function_8c6b7af7(params)];
		}
		var_9e7c4fde = array(base_model);
		self.var_ff2bed36 = util::spawn_model(var_f141235b, base_model, var_228f64da.origin);
		var_ff2bed36 hide();
		self.var_8d79cdc7 = util::spawn_model(var_f141235b, base_model, var_228f64da.origin);
		var_8d79cdc7 hide();
		var_8d79cdc7 function_2649d965(1);
		var_8d79cdc7 sethighdetail(var_851003fe);
		function_9b661089(params);
		var_9dccf4b9 = [];
		foreach(slot, model in attached_models)
		{
			if(isdefined(model) && !isdefined(array::find(var_9e7c4fde, model)))
			{
				array::add(var_9e7c4fde, model);
				bone = (isdefined(level.model_type_bones[slot]) ? level.model_type_bones[slot] : slot);
				var_ff2bed36 attach(model, bone);
				var_8d79cdc7 attach(model, bone);
			}
		}
		if(isdefined(params.activeweapon))
		{
			var_ff2bed36 attachweapon(params.activeweapon, (isdefined(params.var_b8f20727) ? params.var_b8f20727 : 0), (isdefined(params.var_452aa9c0) ? params.var_452aa9c0 : 0));
			var_8d79cdc7 attachweapon(params.activeweapon, (isdefined(params.var_b8f20727) ? params.var_b8f20727 : 0), (isdefined(params.var_452aa9c0) ? params.var_452aa9c0 : 0));
		}
		foreach(model in var_9e7c4fde)
		{
			force_stream_model(model);
		}
		if(is_true(params.var_d8cb38a9) && isdefined(params.scene))
		{
			self.var_9bea772f = params.scene;
			var_a942d0c7 = 1;
			while(!forcestreambundle(params.scene))
			{
				if(var_a942d0c7)
				{
					var_228f64da hide();
					if(isdefined(var_e09268b7))
					{
						var_e09268b7 hide();
					}
					var_a942d0c7 = 0;
				}
				waitframe(1);
			}
			if(var_43b94d19)
			{
				var_228f64da show();
				if(isdefined(var_e09268b7) && var_b6892e9d)
				{
					var_e09268b7 show();
				}
			}
		}
		var_56293673 = 1;
		foreach(model in var_9e7c4fde)
		{
			var_56293673 = var_56293673 & function_c358189(model);
		}
		[[ self ]]->function_62dd99d6(var_ff2bed36);
		[[ self ]]->function_62dd99d6(var_8d79cdc7);
		if(is_true(params.var_c76f3e47) && !var_c31e86ed && !var_ff2bed36 function_e56f5549())
		{
			if(is_true(params.var_401d9a1))
			{
				if(isdefined(var_228f64da))
				{
					var_228f64da hide();
				}
				if(isdefined(var_e09268b7))
				{
					var_e09268b7 hide();
				}
				[[ self ]]->function_27945cb8(1, 1);
				var_7abdc6dd = function_9ec573f1(var_f141235b, var_ea1ac6a5, var_1d73bad9);
				var_d92aad5c = function_bd9a67ae(var_f141235b, var_ea1ac6a5, var_1d73bad9, var_7abdc6dd, 0);
				var_2f1dcdbb = function_bd9a67ae(var_f141235b, var_ea1ac6a5, var_1d73bad9, var_7abdc6dd, 2);
				var_cb9bcfe7 = function_bd9a67ae(var_f141235b, var_ea1ac6a5, var_1d73bad9, var_7abdc6dd, 3);
				var_173f7170 = function_bd9a67ae(var_f141235b, var_ea1ac6a5, var_1d73bad9, var_7abdc6dd, 4);
				var_1f170bc0 = function_bd9a67ae(var_f141235b, var_ea1ac6a5, var_1d73bad9, var_7abdc6dd, 6);
				if([[ self ]]->function_bf7bce05())
				{
					var_867954ad = character_customization::function_6bca50af(&function_92ea4100, var_1d73bad9, var_7abdc6dd, 0, var_ea1ac6a5);
					var_89610e9c = [#"hash_6fbc03ba2c7779e6":#"tag_origin", #"hash_75bb30e3db362b72":#"tag_origin", #"hash_624d1a4c293770ca":#"tag_origin", #"outfit_head":character_customization::function_6bca50af(&function_44a7328f, var_1d73bad9, var_7abdc6dd, 0, var_ea1ac6a5)];
				}
				else
				{
					var_867954ad = character_customization::function_6bca50af(&function_5d23af5b, var_1d73bad9, var_7abdc6dd, var_d92aad5c, var_ea1ac6a5);
					var_89610e9c = [#"hash_6fbc03ba2c7779e6":character_customization::function_6bca50af(&function_92ea4100, var_1d73bad9, var_7abdc6dd, var_1f170bc0, var_ea1ac6a5), #"hash_75bb30e3db362b72":character_customization::function_6bca50af(&function_cde23658, var_1d73bad9, var_7abdc6dd, var_173f7170, var_ea1ac6a5), #"hash_624d1a4c293770ca":character_customization::function_6bca50af(&function_6b7000e, var_1d73bad9, var_7abdc6dd, var_cb9bcfe7, var_ea1ac6a5), #"outfit_head":character_customization::function_6bca50af(&function_44a7328f, var_1d73bad9, var_7abdc6dd, var_2f1dcdbb, var_ea1ac6a5)];
				}
				var_cf2f5fb7 = array(var_867954ad);
				foreach(model in var_89610e9c)
				{
					if(!isdefined(var_cf2f5fb7))
					{
						var_cf2f5fb7 = [];
					}
					else if(!isarray(var_cf2f5fb7))
					{
						var_cf2f5fb7 = array(var_cf2f5fb7);
					}
					if(!isinarray(var_cf2f5fb7, model))
					{
						var_cf2f5fb7[var_cf2f5fb7.size] = model;
					}
				}
				var_a9916921 = getdvarint(#"hash_388720e05d574ed2", 1);
				foreach(model in var_cf2f5fb7)
				{
					force_stream_model(model, var_a9916921, 0);
				}
				n_timeout = 0;
				do
				{
					waitframe(1);
					var_e2e2ee90 = 1;
					foreach(model in var_cf2f5fb7)
					{
						var_e2e2ee90 = var_e2e2ee90 & function_c358189(model, var_a9916921, 0);
					}
					n_timeout = n_timeout + 0.016;
				}
				while(!var_e2e2ee90 && n_timeout < level.var_d323a7f5);
				function_91cd5499(util::spawn_model(var_f141235b, var_867954ad, _origin, var_7e5e7fa2), 0, 0);
				self.var_b627749c = 1;
				[[ self ]]->function_27945cb8(1, 1);
				if(!var_43b94d19)
				{
					var_228f64da hide();
					if(isdefined(var_e09268b7))
					{
						var_e09268b7 hide();
					}
				}
				var_cc204afb = [];
				foreach(slot, model in var_89610e9c)
				{
					if(isdefined(model) && !isdefined(array::find(var_cc204afb, model)))
					{
						array::add(var_cc204afb, model);
						bone = (isdefined(level.model_type_bones[slot]) ? level.model_type_bones[slot] : slot);
						var_228f64da attach(model, bone);
					}
				}
				[[ self ]]->function_ef064067(params, 1);
				var_61ef988d = 1;
				foreach(model in var_cf2f5fb7)
				{
					function_b020b858(model, var_a9916921, 0);
				}
			}
			n_timeout = 0;
			do
			{
				waitframe(1);
				n_timeout = n_timeout + 0.016;
			}
			while(!var_ff2bed36 isstreamed(params.var_5bd51249, params.var_13fb1841) && n_timeout < level.var_d323a7f5);
		}
		var_ff704b7c = is_true(params.var_99a89f83);
		if(var_b627749c)
		{
			self.var_b627749c = 0;
			var_ff704b7c = 1;
			[[ self ]]->function_39a68bf2(0);
			if(is_true(var_61ef988d) && !isdefined(params.var_f5332569))
			{
				params.var_f5332569 = [[ self ]]->function_98d70bef();
			}
			if(!isdefined(params.var_b1e821c5))
			{
				params.var_b1e821c5 = spawnstruct();
			}
			params.var_b1e821c5.blend = 0;
			if(isdefined(base_model))
			{
				function_91cd5499(util::spawn_model(var_f141235b, base_model, _origin, var_7e5e7fa2));
				self.var_45210dc7 = [];
				self.var_bf273e28 = [];
				self.var_5633914d = [];
			}
			if(!var_43b94d19)
			{
				var_228f64da hide();
				if(isdefined(var_e09268b7))
				{
					var_e09268b7 hide();
				}
			}
			else
			{
				var_228f64da show();
				if(isdefined(var_e09268b7))
				{
					thread function_c23b6091(params);
				}
			}
		}
		foreach(model in attached_models)
		{
			[[ self ]]->update_model_attachment(model, slot, undefined, undefined, 1);
		}
		[[ self ]]->function_62dd99d6(var_228f64da);
		function_66de4847();
		changed = [[ self ]]->function_ef064067(params, var_ff704b7c);
		[[ self ]]->function_dd872e2b(params, changed);
		[[ self ]]->function_7412658d(params);
		self.var_9bea772f = undefined;
		if(is_true(params.var_401d9a1))
		{
			[[ self ]]->function_27945cb8(0);
		}
		if(is_true(params.var_8d3b5f69))
		{
			fbc = getuimodel(function_5f72e972(#"hash_31e97ba41cad1834"), "fullscreenBlackCount");
			setuimodelvalue(fbc, 0);
		}
		thread [[ self ]]->function_81d84c71();
		self.var_1d18f5c7 = 1;
		var_2d0192e5 = [[ self ]]->function_82e05d64();
		if(isdefined(var_2d0192e5))
		{
			if(isdefined(var_2d0192e5.visible_model))
			{
				setuimodelvalue(var_2d0192e5.visible_model, [[ self ]]->function_ea4ac9f8() && [[ self ]]->is_visible());
			}
		}
		gestureindex = character_customization::function_6aee5a4e(self);
		if(isdefined(gestureindex) && gestureindex > 0)
		{
			thread [[ self ]]->function_b204f6e3(gestureindex, 0, 1, 0);
		}
	}

	/*
		Name: function_7ed995de
		Namespace: namespace_7da27482
		Checksum: 0x52BD009E
		Offset: 0xB20
		Size: 0xC4
		Parameters: 3
		Flags: Linked
	*/
	function function_7ed995de(local_client_num, character_model, alt_render_mode)
	{
		if(!isdefined(alt_render_mode))
		{
			alt_render_mode = 1;
		}
		/#
			/#
				assert(!isdefined(var_228f64da), "");
			#/
		#/
		self.var_f141235b = local_client_num;
		self.var_81bd1932 = local_client_num;
		self.var_bf4feef5 = alt_render_mode;
		self._target_name = character_model.targetname;
		self._origin = character_model.origin;
		self.var_7e5e7fa2 = character_model.angles;
		function_91cd5499(character_model);
	}

	/*
		Name: function_8144231c
		Namespace: namespace_7da27482
		Checksum: 0xC6F7573A
		Offset: 0x4470
		Size: 0x62
		Parameters: 0
		Flags: Linked
	*/
	function function_8144231c()
	{
		if(!var_c31e86ed && #"female" === getherogender(var_1d73bad9, var_ea1ac6a5))
		{
			return #"hash_26d5282647da1123";
		}
		return #"hash_4157b71749071ad4";
	}

	/*
		Name: function_81d84c71
		Namespace: namespace_7da27482
		Checksum: 0xBB4660E8
		Offset: 0x4940
		Size: 0xC4
		Parameters: 0
		Flags: Linked
	*/
	function function_81d84c71()
	{
		self notify("7b2a4ac2c4160df7");
		self endon("7b2a4ac2c4160df7");
		if(var_9896541c)
		{
			while(function_d9aed86())
			{
				waitframe(1);
			}
			if(isdefined(var_eb95665))
			{
				var_228f64da function_5790ec6e(var_eb95665);
			}
			else
			{
				var_228f64da function_a72ef0c5(var_f141235b, var_ea1ac6a5);
			}
		}
		else
		{
			var_228f64da function_a7842493();
		}
	}

	/*
		Name: function_82e05d64
		Namespace: namespace_7da27482
		Checksum: 0x152140C4
		Offset: 0x1238
		Size: 0x22
		Parameters: 0
		Flags: Linked
	*/
	function function_82e05d64()
	{
		if(!isdefined(var_d781e2e4))
		{
			self.var_d781e2e4 = {};
		}
		return var_d781e2e4;
	}

	/*
		Name: function_8567daf2
		Namespace: namespace_7da27482
		Checksum: 0xC1BBB192
		Offset: 0xE58
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_8567daf2()
	{
		return var_87449256;
	}

	/*
		Name: function_8701f84e
		Namespace: namespace_7da27482
		Checksum: 0x51FE4073
		Offset: 0x1918
		Size: 0xBC
		Parameters: 2
		Flags: Linked
	*/
	function function_8701f84e(item_index, item_type)
	{
		/#
			/#
				assert(var_ea1ac6a5 != 4);
			#/
		#/
		if(var_f5c0467b[item_type] != item_index)
		{
			self.var_b627749c = var_b627749c | (item_type == 0 || item_type == 2 || item_type == 3 || item_type == 4 || item_type == 6);
			self.var_f5c0467b[item_type] = item_index;
		}
	}

	/*
		Name: function_8c6b7af7
		Namespace: namespace_7da27482
		Checksum: 0x7004D309
		Offset: 0x1B08
		Size: 0x8A
		Parameters: 1
		Flags: Linked
	*/
	function function_8c6b7af7(params)
	{
		if(var_c31e86ed)
		{
			return #"c_t8_mp_swatbuddy_head2";
		}
		if(![[ self ]]->function_ef6f931f(params))
		{
			return #"tag_origin";
		}
		return character_customization::function_6bca50af(&function_44a7328f, var_1d73bad9, var_cf55444c, var_f5c0467b[2], var_ea1ac6a5);
	}

	/*
		Name: function_9004475c
		Namespace: namespace_7da27482
		Checksum: 0xC75ACE79
		Offset: 0x1880
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_9004475c()
	{
		return var_1d73bad9;
	}

	/*
		Name: function_9146bf81
		Namespace: namespace_7da27482
		Checksum: 0x83B3D438
		Offset: 0x4E10
		Size: 0x94
		Parameters: 2
		Flags: Linked
	*/
	function function_9146bf81(itemindex, itemtype)
	{
		var_7abdc6dd = (itemtype == 7 ? var_cfe86a3e : var_cf55444c);
		if(!isdefined(itemindex))
		{
			itemindex = function_bd9a67ae(var_f141235b, var_ea1ac6a5, var_1d73bad9, var_7abdc6dd, itemtype);
		}
		[[ self ]]->function_8701f84e(itemindex, itemtype);
	}

	/*
		Name: function_91cd5499
		Namespace: namespace_7da27482
		Checksum: 0x67CFF671
		Offset: 0x8E0
		Size: 0x234
		Parameters: 3
		Flags: Linked, Private
	*/
	function private function_91cd5499(character_model, var_87606b20, var_584905de)
	{
		if(isdefined(var_228f64da))
		{
			self._origin = var_228f64da.origin;
			self.var_7e5e7fa2 = var_228f64da.angles;
			[[ self ]]->function_39a68bf2(0);
			var_228f64da delete();
		}
		self.var_228f64da = character_model;
		var_228f64da.targetname = _target_name;
		var_228f64da.origin = _origin;
		var_228f64da.angles = var_7e5e7fa2;
		var_228f64da sethighdetail((isdefined(var_87606b20) ? var_87606b20 : var_851003fe), (isdefined(var_584905de) ? var_584905de : var_bf4feef5));
		if(var_228f64da hasdobj(var_f141235b) && !var_228f64da hasanimtree())
		{
			var_228f64da useanimtree("all_player");
		}
		var_228f64da.var_90ff9782 = self;
		var_228f64da.var_463f8196 = 1;
		function_2a5421e3();
		function_c39fbf91();
		/#
			if(getdvarint(#"hash_59cf96a0da4d7689", 0))
			{
				function_bba23c40(#"hash_4befe7b7a56e2a92", var_228f64da getentitynumber());
			}
		#/
	}

	/*
		Name: function_95779b72
		Namespace: namespace_7da27482
		Checksum: 0xB386940
		Offset: 0x4A60
		Size: 0x38
		Parameters: 0
		Flags: Linked
	*/
	function function_95779b72()
	{
		for(itemtype = 0; itemtype < 8; itemtype++)
		{
			[[ self ]]->function_8701f84e(0, itemtype);
		}
	}

	/*
		Name: function_98d70bef
		Namespace: namespace_7da27482
		Checksum: 0xEAB81F84
		Offset: 0xE70
		Size: 0x5C
		Parameters: 0
		Flags: Linked
	*/
	function function_98d70bef()
	{
		if(isdefined(var_228f64da))
		{
			animation = var_228f64da getcurrentanimscriptedname();
			if(isdefined(animation))
			{
				return var_228f64da getanimtime(animation);
			}
		}
	}

	/*
		Name: function_9afbd994
		Namespace: namespace_7da27482
		Checksum: 0x9CFE27D5
		Offset: 0xEF0
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_9afbd994()
	{
		return var_5d01abf7;
	}

	/*
		Name: function_9b661089
		Namespace: namespace_7da27482
		Checksum: 0x4F3AE1DB
		Offset: 0x1DB0
		Size: 0x25E
		Parameters: 1
		Flags: Linked
	*/
	function function_9b661089(params)
	{
		if(is_true(params.var_66125429) && isdefined(var_61e64cb8))
		{
			var_b0324f12 = function_aa09bdbb(var_61e64cb8);
			if(isdefined(var_b0324f12) && var_b0324f12 != #"")
			{
				var_521d2f55 = function_61067007(var_b0324f12);
				var_7668a4b7 = var_521d2f55.var_fdd95115;
			}
			/#
				var_b8d88aa7 = getdvarstring(#"hash_54784bf3c8d31aeb", "");
				if(var_b8d88aa7 != "")
				{
					var_7668a4b7 = var_b8d88aa7;
				}
			#/
			if(isdefined(var_e09268b7))
			{
				var_e09268b7 delete();
			}
			if(isdefined(var_7668a4b7))
			{
				self.var_e09268b7 = util::spawn_anim_model(var_f141235b, var_7668a4b7, _origin, var_7e5e7fa2);
				var_e09268b7.var_463f8196 = 1;
				var_e09268b7 hide();
				var_e09268b7 function_2649d965(1);
				var_e09268b7 sethighdetail(var_851003fe);
				var_e09268b7.animname = #"companion";
				self.var_b6892e9d = 1;
				force_stream_model(var_7668a4b7);
				thread function_c23b6091(params);
			}
			else
			{
				self.var_b6892e9d = 0;
			}
		}
		else
		{
			if(isdefined(var_e09268b7))
			{
				var_e09268b7 delete();
			}
			self.var_b6892e9d = 0;
		}
	}

	/*
		Name: show_model
		Namespace: namespace_7da27482
		Checksum: 0x1C11F62D
		Offset: 0xF60
		Size: 0x7C
		Parameters: 0
		Flags: Linked
	*/
	function show_model()
	{
		if(isdefined(var_228f64da))
		{
			var_228f64da show();
		}
		if(isdefined(var_e09268b7) && var_b6892e9d)
		{
			var_e09268b7 show();
		}
		self.var_43b94d19 = 1;
		function_c39fbf91();
	}

	/*
		Name: function_a5861a97
		Namespace: namespace_7da27482
		Checksum: 0x4F6B3637
		Offset: 0x1100
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_a5861a97()
	{
		return var_7e5e7fa2;
	}

	/*
		Name: function_ac9cc79d
		Namespace: namespace_7da27482
		Checksum: 0x69CA7085
		Offset: 0x4D90
		Size: 0x78
		Parameters: 1
		Flags: Linked
	*/
	function function_ac9cc79d(itemtype)
	{
		var_7abdc6dd = (itemtype == 7 ? var_cfe86a3e : var_cf55444c);
		[[ self ]]->function_8701f84e(function_bd9a67ae(var_f141235b, var_ea1ac6a5, var_1d73bad9, var_7abdc6dd, itemtype), itemtype);
	}

	/*
		Name: delete_models
		Namespace: namespace_7da27482
		Checksum: 0xCE3C4451
		Offset: 0x1118
		Size: 0x114
		Parameters: 0
		Flags: Linked
	*/
	function delete_models()
	{
		self notify(#"deleted");
		foreach(ent in var_5633914d)
		{
			ent unlink();
			ent delete();
		}
		level.custom_characters[var_f141235b][var_228f64da.targetname] = undefined;
		self.var_5633914d = [];
		var_228f64da delete();
		self.var_228f64da = undefined;
		function_66de4847();
	}

	/*
		Name: function_b020b858
		Namespace: namespace_7da27482
		Checksum: 0x20EEFA14
		Offset: 0x16A0
		Size: 0xDC
		Parameters: 3
		Flags: Linked, Private
	*/
	function private function_b020b858(model_name, lod, mip)
	{
		if(!isdefined(lod))
		{
			lod = -1;
		}
		if(!isdefined(mip))
		{
			mip = -1;
		}
		index = array::find(var_506d3c33, {#mip:mip, #lod:lod, #model:model_name}, &function_1a57b132);
		if(isdefined(index))
		{
			array::pop(var_506d3c33, index, 0);
			character_customization::function_247f6628(model_name, lod, mip);
		}
	}

	/*
		Name: function_b06080fb
		Namespace: namespace_7da27482
		Checksum: 0x3EC4F910
		Offset: 0x1AA0
		Size: 0x5A
		Parameters: 0
		Flags: Linked
	*/
	function function_b06080fb()
	{
		if(var_c31e86ed)
		{
			return #"tag_origin";
		}
		return character_customization::function_6bca50af(&function_5d23af5b, var_1d73bad9, var_cf55444c, var_f5c0467b[0], var_ea1ac6a5);
	}

	/*
		Name: function_b204f6e3
		Namespace: namespace_7da27482
		Checksum: 0x319EB850
		Offset: 0x4140
		Size: 0x2D4
		Parameters: 4
		Flags: Linked
	*/
	function function_b204f6e3(var_cc478c99, var_4a759822, var_1b1e990c, var_e14a92d8)
	{
		if(!isdefined(var_1b1e990c))
		{
			var_1b1e990c = 1;
		}
		if(!isdefined(var_e14a92d8))
		{
			var_e14a92d8 = 0;
		}
		self endon(#"deleted");
		self endon(#"hash_7e1333ff017b0007");
		if(var_4a759822 && isdefined(var_1d18f5c7))
		{
			while(![[ self ]]->function_ea4ac9f8())
			{
				wait(0.25);
			}
		}
		var_2ec36514 = var_cbcee022;
		[[ self ]]->function_39a68bf2(1, 1);
		gesture = get_gesture(var_cc478c99);
		if(isdefined(gesture) && isdefined(gesture.animation))
		{
			self endon(#"hash_578cb70e92c24a5a", #"hash_7e1333ff017b0007");
			while(!isdefined(var_cbcee022) && !isdefined(var_54430cb6))
			{
				wait(0.1);
			}
			var_a7e34ee1 = var_228f64da getcurrentanimscriptedname();
			var_99789677 = var_a7e34ee1 === gesture.animation || var_a7e34ee1 === gesture.intro || var_a7e34ee1 === gesture.outro;
			if(!var_e14a92d8 || !var_99789677)
			{
				if(var_1b1e990c || !var_99789677)
				{
					self thread function_60b3658e(var_2ec36514, 1);
					character_customization::function_bee62aa1(self);
					if(isdefined(gesture.intro))
					{
						var_228f64da animation::play(gesture.intro, var_228f64da);
					}
					var_228f64da animation::play(gesture.animation, var_228f64da);
					if(isdefined(gesture.outro))
					{
						var_228f64da animation::play(gesture.outro, var_228f64da);
					}
					self notify(#"hash_3d69d89a5c0c677");
				}
				else
				{
					self thread function_60b3658e(var_2ec36514, 0);
				}
			}
		}
	}

	/*
		Name: is_visible
		Namespace: namespace_7da27482
		Checksum: 0x90AB090D
		Offset: 0xF48
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function is_visible()
	{
		return var_43b94d19;
	}

	/*
		Name: function_b94f710e
		Namespace: namespace_7da27482
		Checksum: 0xBBF6EFEA
		Offset: 0x3EF0
		Size: 0x170
		Parameters: 0
		Flags: Linked
	*/
	function function_b94f710e()
	{
		if(isdefined(var_cbcee022))
		{
			[[ self ]]->function_39a68bf2();
			var_228f64da thread character_customization::play_intro_and_animation(_origin, var_7e5e7fa2, undefined, var_cbcee022, 0);
		}
		else if(isdefined(var_54430cb6))
		{
			[[ self ]]->function_39a68bf2();
			if(var_8d2161e9)
			{
				var_a287debe thread scene::play(var_54430cb6, var_228f64da);
			}
			else
			{
				var_a287debe thread scene::play(var_54430cb6);
			}
		}
		foreach(slot, ent in var_5633914d)
		{
			ent thread character_customization::play_intro_and_animation(_origin, var_7e5e7fa2, undefined, var_bf273e28[slot], 1);
		}
	}

	/*
		Name: force_stream_model
		Namespace: namespace_7da27482
		Checksum: 0x6F61E607
		Offset: 0x1498
		Size: 0xA4
		Parameters: 3
		Flags: Linked, Private
	*/
	function private force_stream_model(model_name, lod, mip)
	{
		if(!isdefined(lod))
		{
			lod = -1;
		}
		if(!isdefined(mip))
		{
			mip = -1;
		}
		array::add(var_506d3c33, {#mip:mip, #lod:lod, #model:model_name});
		character_customization::function_221a94ac(model_name, lod, mip);
	}

	/*
		Name: hide_model
		Namespace: namespace_7da27482
		Checksum: 0xCD79FFCE
		Offset: 0xFE8
		Size: 0x74
		Parameters: 0
		Flags: Linked
	*/
	function hide_model()
	{
		var_228f64da hide();
		if(isdefined(var_e09268b7))
		{
			var_e09268b7 hide();
		}
		self notify(#"hash_7e1333ff017b0007");
		self.var_43b94d19 = 0;
		function_c39fbf91();
	}

	/*
		Name: function_bf7bce05
		Namespace: namespace_7da27482
		Checksum: 0xA2A0BAC7
		Offset: 0x1A30
		Size: 0x32
		Parameters: 0
		Flags: Linked
	*/
	function function_bf7bce05()
	{
		if(var_c31e86ed)
		{
			return 1;
		}
		return function_4611d0e6(var_ea1ac6a5, var_1d73bad9);
	}

	/*
		Name: function_c0ccd9ea
		Namespace: namespace_7da27482
		Checksum: 0x342EA6DF
		Offset: 0xCE0
		Size: 0x1A
		Parameters: 1
		Flags: Linked
	*/
	function function_c0ccd9ea(default_exploder)
	{
		self.var_266b2ff0 = default_exploder;
	}

	/*
		Name: set_character_mode
		Namespace: namespace_7da27482
		Checksum: 0xA19483E5
		Offset: 0x17C0
		Size: 0x56
		Parameters: 1
		Flags: Linked
	*/
	function set_character_mode(var_8065b05)
	{
		/#
			/#
				assert(isdefined(var_8065b05));
			#/
		#/
		if(var_ea1ac6a5 != var_8065b05)
		{
			self.var_b627749c = 1;
			self.var_ea1ac6a5 = var_8065b05;
		}
	}

	/*
		Name: function_c23b6091
		Namespace: namespace_7da27482
		Checksum: 0xDC4B8C03
		Offset: 0x2018
		Size: 0x114
		Parameters: 1
		Flags: Linked
	*/
	function function_c23b6091(params)
	{
		self notify("646eec8ae90b98a3");
		self endon("646eec8ae90b98a3");
		var_e09268b7 endon(#"death");
		if(is_true(params.var_c76f3e47))
		{
			n_timeout = 0;
			do
			{
				waitframe(1);
				n_timeout = n_timeout + 0.016;
			}
			while(!var_e09268b7 function_e56f5549() || !function_ea4ac9f8() && n_timeout < level.var_d323a7f5);
		}
		if(var_b6892e9d)
		{
			var_e09268b7 show();
		}
		else
		{
			var_e09268b7 hide();
		}
	}

	/*
		Name: function_c39fbf91
		Namespace: namespace_7da27482
		Checksum: 0x35B98A62
		Offset: 0x850
		Size: 0x88
		Parameters: 0
		Flags: Linked, Private
	*/
	function private function_c39fbf91()
	{
		foreach(callback in var_180f1c7d)
		{
			[[callback]](var_f141235b, self);
		}
	}

	/*
		Name: set_showcase_weapon
		Namespace: namespace_7da27482
		Checksum: 0xF797FCF3
		Offset: 0xE30
		Size: 0x1A
		Parameters: 1
		Flags: Linked
	*/
	function set_showcase_weapon(showcase_weapon)
	{
		self.var_87449256 = showcase_weapon;
	}

	/*
		Name: function_cdc02b18
		Namespace: namespace_7da27482
		Checksum: 0x49127A40
		Offset: 0x1C10
		Size: 0x62
		Parameters: 0
		Flags: Linked
	*/
	function function_cdc02b18()
	{
		if(var_c31e86ed)
		{
			return #"tag_origin";
		}
		return character_customization::function_6bca50af(&function_cde23658, var_1d73bad9, var_cf55444c, var_f5c0467b[4], var_ea1ac6a5);
	}

	/*
		Name: function_d41f7478
		Namespace: namespace_7da27482
		Checksum: 0xFE49E646
		Offset: 0xD80
		Size: 0x38
		Parameters: 1
		Flags: Linked
	*/
	function function_d41f7478(show_helmets)
	{
		if(var_609efd3e != show_helmets)
		{
			self.var_609efd3e = show_helmets;
			[[ self ]]->function_c1aab607();
		}
	}

	/*
		Name: function_d5e754c6
		Namespace: namespace_7da27482
		Checksum: 0xF6BE21D9
		Offset: 0x1C80
		Size: 0x62
		Parameters: 0
		Flags: Linked
	*/
	function function_d5e754c6()
	{
		if(var_c31e86ed)
		{
			return #"c_t8_mp_swatbuddy_body2";
		}
		return character_customization::function_6bca50af(&function_92ea4100, var_1d73bad9, var_cf55444c, var_f5c0467b[6], var_ea1ac6a5);
	}

	/*
		Name: function_dd872e2b
		Namespace: namespace_7da27482
		Checksum: 0xA4CF20AF
		Offset: 0x46C0
		Size: 0x1DC
		Parameters: 2
		Flags: Linked
	*/
	function function_dd872e2b(params, var_d3ec8b24)
	{
		if(isdefined(params.weapon_right) || isdefined(params.weapon_left))
		{
			[[ self ]]->update_model_attachment(params.weapon_right, "tag_weapon_right", params.weapon_right_anim, params.weapon_right_anim_intro, var_d3ec8b24);
			[[ self ]]->update_model_attachment(params.weapon_left, "tag_weapon_left", params.weapon_left_anim, params.weapon_left_anim_intro, var_d3ec8b24);
		}
		else if(isdefined(params.activeweapon))
		{
			var_228f64da attachweapon(params.activeweapon, (isdefined(params.var_b8f20727) ? params.var_b8f20727 : 0), (isdefined(params.var_452aa9c0) ? params.var_452aa9c0 : 0), 1);
			notify_event = "update_character_weapons_notify";
			if(isdefined(var_61e64cb8))
			{
				notify_event = "update_character_weapons_" + var_61e64cb8;
			}
			var_228f64da thread customclass::function_1f5168a3(var_f141235b, params.activeweapon, (isdefined(params.var_452aa9c0) ? params.var_452aa9c0 : 0), notify_event, getdvarint(#"hash_41ef264ae8370dc7", 6), 0);
			var_228f64da useweaponhidetags(params.activeweapon);
		}
	}

	/*
		Name: function_e08bf4f2
		Namespace: namespace_7da27482
		Checksum: 0xE138D390
		Offset: 0xD58
		Size: 0x1A
		Parameters: 1
		Flags: Linked
	*/
	function function_e08bf4f2(var_db61785f)
	{
		self.var_81bd1932 = var_db61785f;
	}

	/*
		Name: update_model_attachment
		Namespace: namespace_7da27482
		Checksum: 0xF2BF5752
		Offset: 0x3710
		Size: 0x370
		Parameters: 5
		Flags: Linked
	*/
	function update_model_attachment(attached_model, slot, model_anim, model_intro_anim, force_update)
	{
		/#
			/#
				assert(isdefined(level.model_type_bones));
			#/
		#/
		if(force_update || attached_model !== var_45210dc7[slot] || model_anim !== var_bf273e28[slot])
		{
			bone = (isdefined(level.model_type_bones[slot]) ? level.model_type_bones[slot] : slot);
			/#
				assert(isdefined(bone));
			#/
			if(isdefined(var_45210dc7[slot]))
			{
				if(isdefined(var_5633914d[slot]))
				{
					var_5633914d[slot] unlink();
					var_5633914d[slot] delete();
					self.var_5633914d[slot] = undefined;
				}
				else if(var_228f64da isattached(var_45210dc7[slot], bone))
				{
					var_228f64da detach(var_45210dc7[slot], bone);
				}
				self.var_45210dc7[slot] = undefined;
			}
			self.var_45210dc7[slot] = attached_model;
			if(isdefined(var_45210dc7[slot]))
			{
				if(isdefined(model_anim))
				{
					ent = spawn(var_f141235b, var_228f64da.origin, "script_model");
					ent sethighdetail(var_851003fe, var_bf4feef5);
					self.var_5633914d[slot] = ent;
					ent setmodel(var_45210dc7[slot]);
					if(!ent hasanimtree())
					{
						ent useanimtree("generic");
					}
					ent.origin = _origin;
					ent.angles = var_7e5e7fa2;
					ent thread character_customization::play_intro_and_animation(_origin, var_7e5e7fa2, model_intro_anim, model_anim, 1);
				}
				else if(!var_228f64da isattached(var_45210dc7[slot], bone))
				{
					var_228f64da attach(var_45210dc7[slot], bone);
				}
				self.var_bf273e28[slot] = model_anim;
			}
		}
		if(isdefined(var_5633914d[slot]))
		{
			[[ self ]]->function_62dd99d6(var_5633914d[slot]);
		}
	}

	/*
		Name: function_e599283f
		Namespace: namespace_7da27482
		Checksum: 0x518F902C
		Offset: 0x4BF0
		Size: 0x94
		Parameters: 0
		Flags: Linked
	*/
	function function_e599283f()
	{
		return {#hash_5f383817:var_f5c0467b, #hash_665ae20e:var_cfe86a3e, #outfit:var_cf55444c, #charactertype:var_1d73bad9, #charactermode:var_ea1ac6a5, #xuid:var_61e64cb8};
	}

	/*
		Name: get_origin
		Namespace: namespace_7da27482
		Checksum: 0x82B381CF
		Offset: 0x10E8
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function get_origin()
	{
		return _origin;
	}

	/*
		Name: function_e8b0acef
		Namespace: namespace_7da27482
		Checksum: 0xFF5BC502
		Offset: 0x1268
		Size: 0x22
		Parameters: 0
		Flags: Linked
	*/
	function function_e8b0acef()
	{
		return getcharacterfields(var_1d73bad9, var_ea1ac6a5);
	}

	/*
		Name: function_ea4ac9f8
		Namespace: namespace_7da27482
		Checksum: 0x25C9ECC6
		Offset: 0x1368
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_ea4ac9f8()
	{
		return var_1d18f5c7;
	}

	/*
		Name: function_ef064067
		Namespace: namespace_7da27482
		Checksum: 0x541053E5
		Offset: 0x3A88
		Size: 0x460
		Parameters: 2
		Flags: Linked
	*/
	function function_ef064067(params, force_update)
	{
		changed = 0;
		if(!isdefined(params))
		{
			params = {};
		}
		if(!isdefined(params.exploder_id))
		{
			params.exploder_id = var_266b2ff0;
		}
		align_changed = 0;
		if(isdefined(var_9a4a8ea))
		{
			if(!isdefined(params.align_struct))
			{
				params.align_struct = struct::get(var_9a4a8ea);
			}
		}
		if(isdefined(params.align_struct) && (params.align_struct.origin !== _origin || params.align_struct.angles !== var_7e5e7fa2))
		{
			self._origin = params.align_struct.origin;
			self.var_7e5e7fa2 = params.align_struct.angles;
			if(!isdefined(params.anim_name))
			{
				params.anim_name = var_cbcee022;
			}
			align_changed = 1;
		}
		if(isdefined(params.anim_name) && (params.anim_name !== var_cbcee022 || align_changed || force_update))
		{
			changed = 1;
			[[ self ]]->function_39a68bf2(0);
			self.var_cbcee022 = params.anim_name;
			self.var_54430cb6 = undefined;
			self.var_5d01abf7 = undefined;
			self.var_6ce65c01 = undefined;
			self.var_a287debe = undefined;
			var_228f64da thread character_customization::play_intro_and_animation(_origin, var_7e5e7fa2, params.anim_intro_name, var_cbcee022, 0);
		}
		else if(isdefined(params.scene) && (params.scene !== var_54430cb6 || params.var_c66a4a5d !== var_a287debe || is_true(params.var_a34c858c) != var_8d2161e9 || force_update))
		{
			changed = 1;
			[[ self ]]->function_39a68bf2(0);
			self.var_54430cb6 = params.scene;
			self.var_5d01abf7 = params.var_74741b75;
			self.var_6ce65c01 = params.var_a68ab9c2;
			self.var_a287debe = (isdefined(params.var_c66a4a5d) ? params.var_c66a4a5d : level);
			self.var_8d2161e9 = is_true(params.var_a34c858c);
			self.var_cbcee022 = undefined;
			models = [];
			if(var_8d2161e9)
			{
				if(!isdefined(models))
				{
					models = [];
				}
				else if(!isarray(models))
				{
					models = array(models);
				}
				models[models.size] = var_228f64da;
			}
			if(var_b6892e9d && isdefined(var_e09268b7))
			{
				if(!isdefined(models))
				{
					models = [];
				}
				else if(!isarray(models))
				{
					models = array(models);
				}
				models[models.size] = var_e09268b7;
			}
			thread character_customization::function_f7a5fba4(var_a287debe, var_54430cb6, models, var_5d01abf7, var_6ce65c01, params.var_f5332569, params.var_b1e821c5, params.var_bfbc1f4f);
		}
		return changed;
	}

	/*
		Name: function_ef6f931f
		Namespace: namespace_7da27482
		Checksum: 0x76164C91
		Offset: 0x1A88
		Size: 0x10
		Parameters: 1
		Flags: Linked
	*/
	function function_ef6f931f(params)
	{
		return true;
	}

	/*
		Name: function_f941c5de
		Namespace: namespace_7da27482
		Checksum: 0xA36F9FC6
		Offset: 0x1A70
		Size: 0x10
		Parameters: 1
		Flags: Linked
	*/
	function function_f941c5de(params)
	{
		return true;
	}

	/*
		Name: get_gesture
		Namespace: namespace_7da27482
		Checksum: 0xB15CF9AE
		Offset: 0x1298
		Size: 0xC2
		Parameters: 1
		Flags: Linked
	*/
	function get_gesture(var_cc478c99)
	{
		if(var_cc478c99 == -1)
		{
			if(#"female" === getherogender(var_1d73bad9, var_ea1ac6a5))
			{
				return {#animation:#"hash_108a8b0f7d2f377d"};
			}
			return {#animation:#"hash_233be4ac797ac20"};
		}
		return function_2a6a2af(var_1d73bad9, var_ea1ac6a5, var_cc478c99);
	}

}

#namespace character_customization;

/*
	Name: function_1caede2a
	Namespace: character_customization
	Checksum: 0xACA0271C
	Offset: 0x338
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_1caede2a()
{
	level notify(2145203057);
}

/*
	Name: function_89f2df9
	Namespace: character_customization
	Checksum: 0xBCDA3A7F
	Offset: 0x358
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"character_customization", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_6bca50af
	Namespace: character_customization
	Checksum: 0x4D5B0C5C
	Offset: 0x3A0
	Size: 0xA2
	Parameters: 5
	Flags: Linked
*/
function function_6bca50af(fn, character_index, var_7abdc6dd, var_e1daa8d9, mode)
{
	model = [[fn]](character_index, var_7abdc6dd, var_e1daa8d9, mode);
	if(!isdefined(model))
	{
		model = [[fn]](character_index, var_7abdc6dd, 0, mode);
		if(!isdefined(model))
		{
			model = [[fn]](character_index, 0, 0, mode);
		}
	}
	return (isdefined(model) ? model : #"tag_origin");
}

/*
	Name: function_6aee5a4e
	Namespace: character_customization
	Checksum: 0xD5472182
	Offset: 0x450
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function function_6aee5a4e(character)
{
	if(isdefined(level.var_6963abdb))
	{
		var_2d0192e5 = [[ character ]]->function_82e05d64();
		if(isdefined(var_2d0192e5) && isdefined(var_2d0192e5.xuid))
		{
			xuid = function_baf6cb99(var_2d0192e5.xuid);
			return level.var_6963abdb[xuid];
		}
		if(isdefined(character.var_61e64cb8))
		{
			return level.var_6963abdb[character.var_61e64cb8];
		}
	}
	return 0;
}

/*
	Name: function_bee62aa1
	Namespace: character_customization
	Checksum: 0xB927A24
	Offset: 0x508
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function function_bee62aa1(character)
{
	if(isdefined(level.var_6963abdb))
	{
		var_2d0192e5 = [[ character ]]->function_82e05d64();
		if(isdefined(var_2d0192e5) && isdefined(var_2d0192e5.xuid))
		{
			xuid = function_baf6cb99(var_2d0192e5.xuid);
			level.var_6963abdb[xuid] = 0;
		}
		if(isdefined(character.var_61e64cb8))
		{
			level.var_6963abdb[character.var_61e64cb8] = 0;
		}
	}
}

/*
	Name: function_70a657d8
	Namespace: character_customization
	Checksum: 0xD38BF549
	Offset: 0x6280
	Size: 0x12C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_dda8e1d8 = &function_1c0ddf49;
	level.model_type_bones = [#"hash_6fbc03ba2c7779e6":"", #"hash_75bb30e3db362b72":"", #"hash_624d1a4c293770ca":"", #"outfit_head":""];
	if(!isdefined(level.liveccdata))
	{
		level.liveccdata = [];
	}
	if(!isdefined(level.custom_characters))
	{
		level.custom_characters = [];
	}
	if(!isdefined(level.extra_cam_hero_data))
	{
		level.extra_cam_hero_data = [];
	}
	level.charactercustomizationsetup = &localclientconnect;
	level.var_6e23b0fc = [];
	level.var_d323a7f5 = getdvarfloat(#"hash_5fba2278b1340b1c", 8);
}

/*
	Name: localclientconnect
	Namespace: character_customization
	Checksum: 0x2F210088
	Offset: 0x63B8
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function localclientconnect(localclientnum)
{
	level.liveccdata[localclientnum] = setup_live_character_customization_target(localclientnum, "updateHero");
	level.staticccdata = setup_static_character_customization_target(localclientnum);
}

/*
	Name: function_cb64c6d0
	Namespace: character_customization
	Checksum: 0x5CA6BFD8
	Offset: 0x6418
	Size: 0xC0
	Parameters: 3
	Flags: Linked, Private
*/
function private function_cb64c6d0(model_name, lod, mip)
{
	if(!isdefined(level.var_6e23b0fc[model_name]))
	{
		level.var_6e23b0fc[model_name] = array();
	}
	if(!isdefined(level.var_6e23b0fc[model_name][lod]))
	{
		level.var_6e23b0fc[model_name][lod] = array();
	}
	if(!isdefined(level.var_6e23b0fc[model_name][lod][mip]))
	{
		level.var_6e23b0fc[model_name][lod][mip] = 0;
	}
}

/*
	Name: function_221a94ac
	Namespace: character_customization
	Checksum: 0x3C20B740
	Offset: 0x64E0
	Size: 0x8C
	Parameters: 3
	Flags: Linked
*/
function function_221a94ac(model_name, lod, mip)
{
	if(!isdefined(model_name))
	{
		return;
	}
	function_cb64c6d0(model_name, lod, mip);
	level.var_6e23b0fc[model_name][lod][mip]++;
	if(level.var_6e23b0fc[model_name][lod][mip] == 1)
	{
		forcestreamxmodel(model_name, lod, mip);
	}
}

/*
	Name: function_c358189
	Namespace: character_customization
	Checksum: 0x3ED543CA
	Offset: 0x6578
	Size: 0x92
	Parameters: 3
	Flags: Linked, Private
*/
function private function_c358189(model_name, lod, mip)
{
	if(!isdefined(model_name))
	{
		return 1;
	}
	function_cb64c6d0(model_name, lod, mip);
	if(level.var_6e23b0fc[model_name][lod][mip] == 0)
	{
		function_221a94ac(model_name);
	}
	return forcestreamxmodel(model_name, lod, mip);
}

/*
	Name: function_247f6628
	Namespace: character_customization
	Checksum: 0xE1E82A60
	Offset: 0x6618
	Size: 0x12C
	Parameters: 3
	Flags: Linked
*/
function function_247f6628(model_name, lod, mip)
{
	if(!isdefined(model_name))
	{
		return;
	}
	function_cb64c6d0(model_name, lod, mip);
	level.var_6e23b0fc[model_name][lod][mip]--;
	if(level.var_6e23b0fc[model_name][lod][mip] == 0)
	{
		stopforcestreamingxmodel(model_name);
		array::pop(level.var_6e23b0fc[model_name][lod], mip);
		if(level.var_6e23b0fc[model_name][lod].size == 0)
		{
			array::pop(level.var_6e23b0fc[model_name], lod);
			if(level.var_6e23b0fc[model_name].size == 0)
			{
				array::pop(level.var_6e23b0fc, model_name);
			}
		}
	}
}

/*
	Name: function_dd295310
	Namespace: character_customization
	Checksum: 0xEA11A9AB
	Offset: 0x6750
	Size: 0xEE
	Parameters: 3
	Flags: Linked
*/
function function_dd295310(charactermodel, localclientnum, alt_render_mode)
{
	if(!isdefined(alt_render_mode))
	{
		alt_render_mode = 1;
	}
	if(!isdefined(charactermodel))
	{
		return undefined;
	}
	if(!isdefined(level.custom_characters[localclientnum]))
	{
		level.custom_characters[localclientnum] = [];
	}
	if(isdefined(level.custom_characters[localclientnum][charactermodel.targetname]))
	{
		return level.custom_characters[localclientnum][charactermodel.targetname];
	}
	var_c372a4ea = new class_7da27482();
	[[ var_c372a4ea ]]->function_7ed995de(localclientnum, charactermodel, alt_render_mode);
	level.custom_characters[localclientnum][charactermodel.targetname] = var_c372a4ea;
	return var_c372a4ea;
}

/*
	Name: function_aa5382ed
	Namespace: character_customization
	Checksum: 0x98530269
	Offset: 0x6848
	Size: 0x11A
	Parameters: 3
	Flags: Linked
*/
function function_aa5382ed(var_1c843d99, var_671ed2ed, var_f91927a1)
{
	if(!isdefined(var_f91927a1))
	{
		var_f91927a1 = 1;
	}
	if(isdefined(var_1c843d99) != isdefined(var_671ed2ed))
	{
		return true;
	}
	if(!isdefined(var_1c843d99))
	{
		return false;
	}
	if(var_f91927a1 && var_1c843d99.xuid !== var_671ed2ed.xuid)
	{
		return true;
	}
	if(var_1c843d99.charactertype != var_671ed2ed.charactertype)
	{
		return true;
	}
	if(var_1c843d99.outfit != var_671ed2ed.outfit)
	{
		return true;
	}
	if(var_1c843d99.var_cfe86a3e != var_671ed2ed.var_cfe86a3e)
	{
		return true;
	}
	for(i = 0; i < var_1c843d99.var_5f383817.size; i++)
	{
		if(var_1c843d99.var_5f383817[i] != var_671ed2ed.var_5f383817[i])
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_7474681d
	Namespace: character_customization
	Checksum: 0xD77347CF
	Offset: 0x6970
	Size: 0x134
	Parameters: 3
	Flags: Linked
*/
function function_7474681d(local_client_num, session_mode, character_index)
{
	var_7abdc6dd = function_9ec573f1(local_client_num, session_mode, character_index);
	var_17b172ca = function_76fbb09e(local_client_num, session_mode, character_index);
	var_809a2fb0 = [];
	for(itemtype = 0; itemtype < 8; itemtype++)
	{
		var_9b90e15d = (itemtype == 7 ? var_17b172ca : var_7abdc6dd);
		var_809a2fb0[itemtype] = function_bd9a67ae(local_client_num, session_mode, character_index, var_9b90e15d, itemtype);
	}
	return {#hash_5f383817:var_809a2fb0, #hash_665ae20e:var_17b172ca, #outfit:var_7abdc6dd, #charactertype:character_index, #charactermode:session_mode};
}

/*
	Name: function_3f5625f1
	Namespace: character_customization
	Checksum: 0xFA36612
	Offset: 0x6AB0
	Size: 0xB4
	Parameters: 2
	Flags: Linked
*/
function function_3f5625f1(mode, character_index)
{
	if(!isdefined(character_index))
	{
		character_index = 1;
	}
	var_809a2fb0 = [];
	for(itemtype = 0; itemtype < 8; itemtype++)
	{
		var_809a2fb0[itemtype] = 0;
	}
	return {#hash_5f383817:var_809a2fb0, #hash_665ae20e:0, #outfit:0, #charactertype:character_index, #charactermode:mode};
}

/*
	Name: play_intro_and_animation
	Namespace: character_customization
	Checksum: 0x302C1C1E
	Offset: 0x6B70
	Size: 0xAC
	Parameters: 5
	Flags: Linked
*/
function play_intro_and_animation(origin, angles, intro_anim_name, anim_name, b_keep_link)
{
	self notify("1f5b65b4957c396b");
	self endon("1f5b65b4957c396b");
	if(isdefined(intro_anim_name))
	{
		self animation::play(intro_anim_name, origin, angles, 1, 0, 0, 0, b_keep_link);
	}
	if(isdefined(self))
	{
		self animation::play(anim_name, origin, angles, 1, 0, 0, 0, b_keep_link);
	}
}

/*
	Name: function_f7a5fba4
	Namespace: character_customization
	Checksum: 0xD7768714
	Offset: 0x6C28
	Size: 0x334
	Parameters: 8
	Flags: Linked
*/
function function_f7a5fba4(align_target, str_scene, model, var_f647c5b2, var_559c5c3e, var_b8f75d74, var_b1e821c5, var_bfbc1f4f)
{
	if(!isdefined(var_bfbc1f4f))
	{
		var_bfbc1f4f = 0;
	}
	self notify("93e1fdc3643601a");
	self endon("93e1fdc3643601a");
	if(isdefined(var_b8f75d74) && var_b8f75d74 > 0 && var_b8f75d74 < 1)
	{
		if(isdefined(var_f647c5b2))
		{
			align_target scene::play_from_time(str_scene, var_f647c5b2, model, var_b8f75d74, 1, 1, var_b1e821c5);
			if(isdefined(var_559c5c3e))
			{
				str_scene = function_9faa5b77(str_scene);
				var_559c5c3e = function_7d2b4e1f(str_scene, var_559c5c3e);
				align_target = function_bdd0baed(var_bfbc1f4f, align_target);
				if(isdefined(var_b1e821c5.var_9e6d8a3d))
				{
					var_cf0b13c3 = {#hash_dcfaf6c7:var_b1e821c5.var_dcfaf6c7, #blend:var_b1e821c5.var_9e6d8a3d};
				}
				align_target thread scene::play(str_scene, var_559c5c3e, model, undefined, undefined, undefined, (isdefined(var_cf0b13c3) ? var_cf0b13c3 : var_b1e821c5));
			}
		}
		else
		{
			str_scene = function_9faa5b77(str_scene);
			var_559c5c3e = function_7d2b4e1f(str_scene, var_559c5c3e);
			align_target = function_bdd0baed(var_bfbc1f4f, align_target);
			align_target thread scene::play_from_time(str_scene, var_559c5c3e, model, var_b8f75d74, 1, 1, var_b1e821c5);
		}
	}
	else
	{
		if(isdefined(var_f647c5b2) || isdefined(var_559c5c3e))
		{
			if(isdefined(var_f647c5b2))
			{
				align_target scene::play(str_scene, var_f647c5b2, model, undefined, undefined, undefined, var_b1e821c5);
			}
			if(isdefined(var_559c5c3e))
			{
				str_scene = function_9faa5b77(str_scene);
				var_559c5c3e = function_7d2b4e1f(str_scene, var_559c5c3e);
				align_target = function_bdd0baed(var_bfbc1f4f, align_target);
				if(isdefined(var_b1e821c5.var_9e6d8a3d))
				{
					var_cf0b13c3 = {#hash_dcfaf6c7:var_b1e821c5.var_dcfaf6c7, #blend:var_b1e821c5.var_9e6d8a3d};
				}
				align_target thread scene::play(str_scene, var_559c5c3e, model, undefined, undefined, undefined, (isdefined(var_cf0b13c3) ? var_cf0b13c3 : var_b1e821c5));
			}
		}
		else
		{
			align_target thread scene::play(str_scene, model, undefined, undefined, undefined, undefined, var_b1e821c5);
		}
	}
}

/*
	Name: function_9faa5b77
	Namespace: character_customization
	Checksum: 0x6C03E7C8
	Offset: 0x6F68
	Size: 0x2E
	Parameters: 1
	Flags: Linked
*/
function function_9faa5b77(str_scene)
{
	if(isdefined(self.var_72e4ebb3))
	{
		str_scene = self.var_72e4ebb3;
		self.var_72e4ebb3 = undefined;
	}
	return str_scene;
}

/*
	Name: function_7d2b4e1f
	Namespace: character_customization
	Checksum: 0x54902709
	Offset: 0x6FA0
	Size: 0x56
	Parameters: 2
	Flags: Linked
*/
function function_7d2b4e1f(str_scene, var_559c5c3e)
{
	if(isdefined(self.var_31ccd6da) && scene::function_9730988a(str_scene, self.var_31ccd6da))
	{
		var_559c5c3e = self.var_31ccd6da;
		self.var_31ccd6da = undefined;
	}
	return var_559c5c3e;
}

/*
	Name: function_bdd0baed
	Namespace: character_customization
	Checksum: 0x62A6A4E8
	Offset: 0x7000
	Size: 0x94
	Parameters: 2
	Flags: Linked
*/
function function_bdd0baed(var_bfbc1f4f, align_target)
{
	if(!isdefined(var_bfbc1f4f))
	{
		var_bfbc1f4f = 0;
	}
	if(var_bfbc1f4f && [[ self ]]->function_ea4ac9f8())
	{
		model = [[ self ]]->function_217b10ed();
		align_target = {#angles:model.angles, #origin:model.origin};
	}
	return align_target;
}

/*
	Name: setup_live_character_customization_target
	Namespace: character_customization
	Checksum: 0xE31EA53
	Offset: 0x70A0
	Size: 0xB4
	Parameters: 2
	Flags: Linked
*/
function setup_live_character_customization_target(localclientnum, notifyname)
{
	characterent = getent(localclientnum, "character_customization", "targetname");
	if(isdefined(characterent))
	{
		var_d0b01271 = function_dd295310(characterent, localclientnum, 1);
		[[ var_d0b01271 ]]->function_c0ccd9ea("char_customization");
		level thread updateeventthread(localclientnum, var_d0b01271, notifyname);
		return var_d0b01271;
	}
	return undefined;
}

/*
	Name: update_locked_shader
	Namespace: character_customization
	Checksum: 0x3E9BACB0
	Offset: 0x7160
	Size: 0x74
	Parameters: 2
	Flags: None
*/
function update_locked_shader(localclientnum, params)
{
	if(isdefined(params.isitemunlocked) && params.isitemunlocked != 1)
	{
		enablefrontendlockedweaponoverlay(localclientnum, 1);
	}
	else
	{
		enablefrontendlockedweaponoverlay(localclientnum, 0);
	}
}

/*
	Name: function_bcc8bdf4
	Namespace: character_customization
	Checksum: 0x27219664
	Offset: 0x71E0
	Size: 0x3A
	Parameters: 4
	Flags: Linked
*/
function function_bcc8bdf4(localclientnum, var_d0b01271, waitresult, params)
{
	params.anim_name = [[ waitresult ]]->function_8144231c();
}

/*
	Name: updateeventthread
	Namespace: character_customization
	Checksum: 0x39CBFDEB
	Offset: 0x7228
	Size: 0xAFE
	Parameters: 4
	Flags: Linked
*/
function updateeventthread(localclientnum, var_d0b01271, notifyname, var_1d7f1597)
{
	if(!isdefined(var_1d7f1597))
	{
		var_1d7f1597 = &function_bcc8bdf4;
	}
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(notifyname + localclientnum);
		switch(waitresult.event_name)
		{
			case "update_lcn":
			{
				[[ var_d0b01271 ]]->function_e08bf4f2(waitresult.local_client_num);
				break;
			}
			case "hash_75f94233f30e66bf":
			{
				[[ var_d0b01271 ]]->function_7792df22(waitresult.locked);
				break;
			}
			case "refresh":
			{
				[[ var_d0b01271 ]]->function_e08bf4f2(waitresult.local_client_num);
				[[ var_d0b01271 ]]->set_character_mode(waitresult.mode);
				[[ var_d0b01271 ]]->function_225b6e07();
				[[ var_d0b01271 ]]->function_77e3be08();
				params = {};
				[[var_1d7f1597]](localclientnum, var_d0b01271, waitresult, params);
				if(is_true(params.var_c76f3e47))
				{
					[[ var_d0b01271 ]]->function_27945cb8(1);
				}
				[[ var_d0b01271 ]]->update(params);
				break;
			}
			case "hash_b47cfb439dd87ac":
			{
				params = {};
				[[var_1d7f1597]](localclientnum, var_d0b01271, waitresult, params);
				params.var_99a89f83 = 1;
				if(is_true(params.var_c76f3e47))
				{
					[[ var_d0b01271 ]]->function_27945cb8(1);
				}
				[[ var_d0b01271 ]]->update(params);
				break;
			}
			case "changehero":
			{
				[[ var_d0b01271 ]]->set_character_mode(waitresult.mode);
				[[ var_d0b01271 ]]->function_72e88afb(waitresult.character_index);
				[[ var_d0b01271 ]]->function_77e3be08();
				params = {};
				[[var_1d7f1597]](localclientnum, var_d0b01271, waitresult, params);
				if(is_true(params.var_c76f3e47))
				{
					[[ var_d0b01271 ]]->function_27945cb8(1);
				}
				[[ var_d0b01271 ]]->update(params);
				break;
			}
			case "hash_134f8f26b2045c5f":
			{
				[[ var_d0b01271 ]]->function_77e3be08();
				params = {};
				[[var_1d7f1597]](localclientnum, var_d0b01271, waitresult, params);
				[[ var_d0b01271 ]]->update(params);
				break;
			}
			case "hash_7343a6439630685e":
			{
				[[ var_d0b01271 ]]->function_4a1dc0d3(waitresult.var_7abdc6dd);
				[[ var_d0b01271 ]]->function_10b0cbea();
				[[ var_d0b01271 ]]->function_59d1302f();
				params = {};
				[[var_1d7f1597]](localclientnum, var_d0b01271, waitresult, params);
				if(is_true(params.var_c76f3e47))
				{
					[[ var_d0b01271 ]]->function_27945cb8(1);
				}
				[[ var_d0b01271 ]]->update(params);
				break;
			}
			case "hash_4d0b69451140c364":
			{
				[[ var_d0b01271 ]]->function_72be01b9();
				[[ var_d0b01271 ]]->function_158505aa(waitresult.var_7abdc6dd);
				[[ var_d0b01271 ]]->function_59d1302f();
				params = {};
				[[var_1d7f1597]](localclientnum, var_d0b01271, waitresult, params);
				if(is_true(params.var_c76f3e47))
				{
					[[ var_d0b01271 ]]->function_27945cb8(1);
				}
				[[ var_d0b01271 ]]->update(params);
				break;
			}
			case "hash_51c6c251729c60bd":
			{
				if(isdefined(waitresult.var_7abdc6dd))
				{
					if(waitresult.item_type == 7)
					{
						[[ var_d0b01271 ]]->function_158505aa(waitresult.var_7abdc6dd);
					}
					else
					{
						[[ var_d0b01271 ]]->function_4a1dc0d3(waitresult.var_7abdc6dd);
					}
				}
				[[ var_d0b01271 ]]->function_8701f84e(waitresult.item_index, waitresult.item_type);
				params = {};
				[[var_1d7f1597]](localclientnum, var_d0b01271, waitresult, params);
				if(is_true(params.var_c76f3e47))
				{
					[[ var_d0b01271 ]]->function_27945cb8(1);
				}
				[[ var_d0b01271 ]]->update(params);
				break;
			}
			case "hash_220546ce38834f4c":
			{
				[[ var_d0b01271 ]]->function_ac9cc79d(waitresult.item_type);
				params = {};
				[[var_1d7f1597]](localclientnum, var_d0b01271, waitresult, params);
				if(is_true(params.var_c76f3e47))
				{
					[[ var_d0b01271 ]]->function_27945cb8(1);
				}
				[[ var_d0b01271 ]]->update(params);
				break;
			}
			case "hash_330d7c7694ff5505":
			{
				[[ var_d0b01271 ]]->function_617a9ce4(waitresult.mode);
				thread [[ var_d0b01271 ]]->function_81d84c71();
				break;
			}
			case "hash_c1b79705509feb":
			case "previewshopface":
			{
				[[ var_d0b01271 ]]->set_character_mode(waitresult.mode);
				[[ var_d0b01271 ]]->function_72e88afb(waitresult.character_index);
				[[ var_d0b01271 ]]->function_4a1dc0d3(waitresult.var_7abdc6dd);
				[[ var_d0b01271 ]]->function_158505aa(waitresult.var_7abdc6dd);
				var_5f383817 = strtok(waitresult.var_5f383817, ";");
				foreach(item in var_5f383817)
				{
					[[ var_d0b01271 ]]->function_9146bf81(int(item), type);
				}
				params = {};
				[[var_1d7f1597]](localclientnum, var_d0b01271, waitresult, params);
				if(waitresult.event_name == "previewShopFace")
				{
					params.align_struct = struct::get(#"hash_1b6b643ea423735b");
				}
				if(is_true(params.var_c76f3e47))
				{
					[[ var_d0b01271 ]]->function_27945cb8(1);
				}
				[[ var_d0b01271 ]]->update(params);
				break;
			}
			case "hash_6ee688669569d68a":
			{
				if(isdefined(waitresult.mode))
				{
					[[ var_d0b01271 ]]->set_character_mode(waitresult.mode);
				}
				if(isdefined(waitresult.character_index))
				{
					[[ var_d0b01271 ]]->function_72e88afb(waitresult.character_index);
				}
				if(isdefined(waitresult.var_7abdc6dd))
				{
					[[ var_d0b01271 ]]->function_4a1dc0d3(waitresult.var_7abdc6dd);
				}
				var_5f383817 = strtok(waitresult.presets, ";");
				foreach(type, item in var_5f383817)
				{
					if(type != 7 && type != 1)
					{
						[[ var_d0b01271 ]]->function_9146bf81(int(item), type);
					}
				}
				params = {};
				[[var_1d7f1597]](localclientnum, var_d0b01271, waitresult, params);
				if(is_true(params.var_c76f3e47))
				{
					[[ var_d0b01271 ]]->function_27945cb8(1);
				}
				[[ var_d0b01271 ]]->update(params);
				break;
			}
			case "hash_3741c905cf8e8dba":
			{
				[[ var_d0b01271 ]]->set_character_mode(waitresult.mode);
				[[ var_d0b01271 ]]->function_72e88afb(waitresult.character_index);
				[[ var_d0b01271 ]]->function_22039feb();
				params = {};
				[[var_1d7f1597]](localclientnum, var_d0b01271, waitresult, params);
				if(is_true(params.var_c76f3e47))
				{
					[[ var_d0b01271 ]]->function_27945cb8(1);
				}
				[[ var_d0b01271 ]]->update(params);
				break;
			}
			case "previewgesture":
			{
				thread [[ var_d0b01271 ]]->function_b204f6e3(waitresult.var_cc478c99, waitresult.var_4a759822, waitresult.var_1b1e990c, waitresult.var_e14a92d8);
				break;
			}
			case "hash_d3d0b01a04ff6f4":
			{
				var_d0b01271 notify(#"hash_7e1333ff017b0007");
				break;
			}
			case "hide":
			{
				[[ var_d0b01271 ]]->hide_model();
				break;
			}
			case "show":
			{
				[[ var_d0b01271 ]]->show_model();
				break;
			}
		}
	}
}

/*
	Name: rotation_thread_spawner
	Namespace: character_customization
	Checksum: 0x42221969
	Offset: 0x7D30
	Size: 0x9E
	Parameters: 4
	Flags: Linked
*/
function rotation_thread_spawner(localclientnum, var_d0b01271, endonevent, var_cd34be2e)
{
	if(!isdefined(endonevent))
	{
		return;
	}
	baseangles = [[ var_d0b01271 ]]->function_217b10ed().angles;
	level update_model_rotation_for_right_stick(localclientnum, var_d0b01271, endonevent, var_cd34be2e);
	var_d0b01271.var_c492e538 = undefined;
	if(![[ var_d0b01271 ]]->function_4a271da1())
	{
		[[ var_d0b01271 ]]->function_217b10ed().angles = baseangles;
	}
}

/*
	Name: update_model_rotation_for_right_stick
	Namespace: character_customization
	Checksum: 0x6725F1F6
	Offset: 0x7DD8
	Size: 0x4AC
	Parameters: 4
	Flags: Linked, Private
*/
function private update_model_rotation_for_right_stick(localclientnum, var_d0b01271, endonevent, var_cd34be2e)
{
	level endon(endonevent);
	while(true)
	{
		data_lcn = [[ var_d0b01271 ]]->function_690c9509();
		if(localclientnum == data_lcn && localclientactive(data_lcn) && !([[ var_d0b01271 ]]->function_4a271da1()))
		{
			model = [[ var_d0b01271 ]]->function_217b10ed();
			if(isdefined(model))
			{
				pos = getcontrollerposition(data_lcn);
				change = pos[#"rightstick"][0];
				if(!gamepadusedlast(localclientnum))
				{
					pos = getxcammousecontrol(data_lcn);
					change = change - pos[#"yaw"];
				}
				s_align = {#angles:model.angles, #origin:model.origin};
				if(isdefined(var_cd34be2e.str_scene))
				{
					if(isdefined(var_cd34be2e.var_c76d5a0b) && isdefined(var_cd34be2e.var_e982dc6b) && change < -0.5)
					{
						var_d0b01271.var_c492e538 = var_cd34be2e.var_c76d5a0b;
						var_d0b01271.var_ae32b908 = model.origin;
						var_d0b01271.var_aba63ea = model.angles;
						if(isdefined(level.var_6365df1f))
						{
							params = [[level.var_6365df1f]](localclientnum, var_d0b01271);
							params = function_923a14da(params, var_d0b01271);
							[[ var_d0b01271 ]]->update(params);
						}
						else
						{
							var_d0b01271 thread function_f7a5fba4(s_align, var_cd34be2e.str_scene, model, var_cd34be2e.var_c76d5a0b, var_cd34be2e.var_e982dc6b);
						}
						var_41173053 = scene::function_8582657c(var_cd34be2e.str_scene, var_cd34be2e.var_c76d5a0b);
						wait(var_41173053);
						var_d0b01271.var_c492e538 = undefined;
						var_d0b01271.var_ae32b908 = undefined;
						var_d0b01271.var_aba63ea = undefined;
						var_d0b01271 notify(#"hash_6b33c66d373ab370");
					}
					else if(isdefined(var_cd34be2e.var_3480dd47) && isdefined(var_cd34be2e.var_1aa99c8b) && change > 0.5)
					{
						var_d0b01271.var_c492e538 = var_cd34be2e.var_3480dd47;
						var_d0b01271.var_ae32b908 = model.origin;
						var_d0b01271.var_aba63ea = model.angles;
						if(isdefined(level.var_6365df1f))
						{
							params = [[level.var_6365df1f]](localclientnum, var_d0b01271);
							params = function_923a14da(params, var_d0b01271);
							[[ var_d0b01271 ]]->update(params);
						}
						else
						{
							var_d0b01271 thread function_f7a5fba4(s_align, var_cd34be2e.str_scene, model, var_cd34be2e.var_3480dd47, var_cd34be2e.var_1aa99c8b);
						}
						var_41173053 = scene::function_8582657c(var_cd34be2e.str_scene, var_cd34be2e.var_3480dd47);
						wait(var_41173053);
						var_d0b01271.var_c492e538 = undefined;
						var_d0b01271.var_ae32b908 = undefined;
						var_d0b01271.var_aba63ea = undefined;
						var_d0b01271 notify(#"hash_6b33c66d373ab370");
					}
				}
				else if(abs(change) > 0.0001)
				{
					model.angles = (model.angles[0], absangleclamp360(model.angles[1] + (change * 3)), model.angles[2]);
				}
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_f40eb809
	Namespace: character_customization
	Checksum: 0x934A8272
	Offset: 0x8290
	Size: 0xC
	Parameters: 0
	Flags: Linked
*/
function function_f40eb809()
{
	return isdefined(self.var_c492e538);
}

/*
	Name: function_923a14da
	Namespace: character_customization
	Checksum: 0x28D0AAC5
	Offset: 0x82A8
	Size: 0xBA
	Parameters: 2
	Flags: Linked, Private
*/
function private function_923a14da(params, var_d0b01271)
{
	if(!isdefined(params))
	{
		params = spawnstruct();
	}
	if(!isdefined(params.var_b1e821c5))
	{
		params.var_b1e821c5 = spawnstruct();
	}
	if([[ var_d0b01271 ]]->function_ca932c8() && [[ var_d0b01271 ]]->function_ea4ac9f8() && [[ var_d0b01271 ]]->is_visible())
	{
		params.var_b1e821c5.blend = 0.5;
	}
	else
	{
		params.var_b1e821c5.blend = 0;
	}
	return params;
}

/*
	Name: setup_static_character_customization_target
	Namespace: character_customization
	Checksum: 0x1830D648
	Offset: 0x8370
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function setup_static_character_customization_target(localclientnum)
{
	characterent = getent(localclientnum, "character_customization_staging", "targetname");
	level.extra_cam_hero_data[localclientnum] = setup_character_extracam_struct("ui_cam_character_customization", "cam_menu_unfocus", #"pb_cac_main_lobby_idle");
	if(isdefined(characterent))
	{
		var_d0b01271 = function_dd295310(characterent, localclientnum);
		level thread update_character_extracam(localclientnum, var_d0b01271);
		return var_d0b01271;
	}
	return undefined;
}

/*
	Name: setup_character_extracam_struct
	Namespace: character_customization
	Checksum: 0xFE7F2C49
	Offset: 0x8448
	Size: 0x64
	Parameters: 3
	Flags: Linked
*/
function setup_character_extracam_struct(xcam, subxcam, model_animation)
{
	newstruct = {#anim_name:model_animation, #subxcam:subxcam, #xcam:xcam};
	return newstruct;
}

/*
	Name: setup_character_extracam_settings
	Namespace: character_customization
	Checksum: 0xE7BB9A1E
	Offset: 0x84B8
	Size: 0x3C0
	Parameters: 3
	Flags: Linked
*/
function setup_character_extracam_settings(localclientnum, var_d0b01271, extracam_data_struct)
{
	/#
		assert(isdefined(extracam_data_struct.jobindex));
	#/
	if(!isdefined(level.camera_ents))
	{
		level.camera_ents = [];
	}
	initializedextracam = 0;
	camera_ent = (isdefined(level.camera_ents[localclientnum]) ? level.camera_ents[localclientnum][extracam_data_struct.extracamindex] : undefined);
	if(!isdefined(camera_ent))
	{
		initializedextracam = 1;
		multi_extracam::extracam_init_index(localclientnum, "character_staging_extracam" + (extracam_data_struct.extracamindex + 1), extracam_data_struct.extracamindex);
		camera_ent = level.camera_ents[localclientnum][extracam_data_struct.extracamindex];
	}
	/#
		assert(isdefined(camera_ent));
	#/
	camera_ent playextracamxcam(extracam_data_struct.xcam, 0, extracam_data_struct.subxcam);
	params = {#hide_helmet:is_true(extracam_data_struct.hidehelmet), #sessionmode:extracam_data_struct.sessionmode, #extracam_data:extracam_data_struct, #anim_name:extracam_data_struct.anim_name};
	[[ var_d0b01271 ]]->function_79f89fb6(extracam_data_struct.sessionmode === 2);
	[[ var_d0b01271 ]]->function_3941dad9(0);
	[[ var_d0b01271 ]]->set_character_mode(extracam_data_struct.sessionmode);
	[[ var_d0b01271 ]]->function_72e88afb(extracam_data_struct.characterindex);
	if(is_true(extracam_data_struct.isdefaulthero) || is_true(extracam_data_struct.defaultimagerender))
	{
		[[ var_d0b01271 ]]->function_22039feb();
	}
	else
	{
		[[ var_d0b01271 ]]->function_77e3be08();
		if(isdefined(extracam_data_struct.var_d3927004) && isdefined(extracam_data_struct.var_eb3dfef8))
		{
			[[ var_d0b01271 ]]->function_8701f84e(extracam_data_struct.var_eb3dfef8, extracam_data_struct.var_d3927004);
		}
	}
	[[ var_d0b01271 ]]->update(params);
	while(![[ var_d0b01271 ]]->function_ca932c8())
	{
		waitframe(1);
	}
	if(is_true(extracam_data_struct.defaultimagerender))
	{
		wait(0.5);
	}
	else
	{
		wait(0.1);
	}
	setextracamrenderready(extracam_data_struct.jobindex);
	extracam_data_struct.jobindex = undefined;
	level waittill((("render_complete_" + localclientnum) + "_") + extracam_data_struct.extracamindex);
	if(initializedextracam)
	{
		multi_extracam::extracam_reset_index(localclientnum, extracam_data_struct.extracamindex);
	}
	[[ var_d0b01271 ]]->function_79f89fb6(0);
}

/*
	Name: update_character_extracam
	Namespace: character_customization
	Checksum: 0x31E48861
	Offset: 0x8880
	Size: 0x78
	Parameters: 2
	Flags: Linked
*/
function update_character_extracam(localclientnum, var_d0b01271)
{
	level endon(#"disconnect");
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill("process_character_extracam" + localclientnum);
		setup_character_extracam_settings(localclientnum, var_d0b01271, waitresult.extracam_data_struct);
	}
}

/*
	Name: function_1c0ddf49
	Namespace: character_customization
	Checksum: 0x48B0C6A6
	Offset: 0x8900
	Size: 0x156
	Parameters: 9
	Flags: Linked
*/
function function_1c0ddf49(localclientnum, jobindex, extracamindex, sessionmode, characterindex, outfitindex, itemtype, itemindex, defaultimagerender)
{
	extracam_data = undefined;
	if(defaultimagerender)
	{
		extracam_data = setup_character_extracam_struct("ui_cam_char_customization_icons_render", "loot_body", #"pb_cac_vs_screen_idle_1");
	}
	else
	{
		extracam_data = setup_character_extracam_struct("ui_cam_char_customization_icons", "cam_body", #"pb_cac_vs_screen_idle_1");
	}
	extracam_data.jobindex = jobindex;
	extracam_data.extracamindex = extracamindex;
	extracam_data.sessionmode = sessionmode;
	extracam_data.characterindex = characterindex;
	extracam_data.outfitindex = outfitindex;
	extracam_data.var_d3927004 = itemtype;
	extracam_data.var_eb3dfef8 = itemindex;
	extracam_data.defaultimagerender = defaultimagerender;
	level notify("process_character_extracam" + localclientnum, {#extracam_data_struct:extracam_data});
}

