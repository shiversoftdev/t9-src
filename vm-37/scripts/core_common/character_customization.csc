#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\scene_shared.csc;
#using scripts\core_common\animation_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\multi_extracam.csc;
#using scripts\core_common\array_shared.csc;
#using script_474309807eb94f34;
#using scripts\core_common\activecamo_shared.csc;

class class_7da27482 
{
	var var_1d18f5c7;
	var var_cbcee022;
	var var_228f64da;
	var var_506d3c33;
	var var_9896541c;
	var var_5633914d;
	var var_1d73bad9;
	var _i_mode;
	var var_f141235b;
	var var_180f1c7d;
	var var_c31e86ed;
	var var_f5c0467b;
	var var_cf55444c;
	var var_6ce65c01;
	var var_b3113387;
	var var_54430cb6;
	var var_a287debe;
	var _angles;
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
	var var_851003fe;
	var _origin;
	var var_b627749c;
	var var_eb95665;
	var var_d781e2e4;
	var _target_name;
	var var_bf4feef5;
	var var_5d01abf7;
	var var_bf273e28;
	var var_609efd3e;
	var var_27af8d38;
	var var_45210dc7;
	var _xuid;
	var var_266b2ff0;
	var var_9a4a8ea;

	/*
		Name: constructor
		Namespace: namespace_7da27482
		Checksum: 0x45FFDAFE
		Offset: 0x548
		Size: 0x262
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
		self.var_f141235b = 0;
		self.var_81bd1932 = 0;
		self._xuid = undefined;
		self._target_name = undefined;
		self._i_mode = 1;
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
		self.var_43b94d19 = 1;
		self.var_c31e86ed = 0;
		self.var_b3113387 = 0;
		self.var_444a0d45 = 0;
		self._origin = (0, 0, 0);
		self._angles = (0, 0, 0);
		self.var_9a4a8ea = undefined;
		self.var_cbcee022 = undefined;
		self.var_54430cb6 = undefined;
		self.var_5d01abf7 = undefined;
		self.var_6ce65c01 = undefined;
		self.var_9bea772f = undefined;
		self.var_a287debe = undefined;
		self.var_8d2161e9 = 0;
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
		self.var_1d18f5c7 = 0;
	}

	/*
		Name: destructor
		Namespace: namespace_7da27482
		Checksum: 0x80F724D1
		Offset: 0x4A70
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
		Checksum: 0xD0B38FB2
		Offset: 0x3D58
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
		Checksum: 0x91D34827
		Offset: 0x1400
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
		Name: is_streamed
		Namespace: namespace_7da27482
		Checksum: 0x63AC5C94
		Offset: 0x47E8
		Size: 0xF2
		Parameters: 0
		Flags: Linked
	*/
	function is_streamed()
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
		Checksum: 0x15804BFF
		Offset: 0x45E8
		Size: 0x38
		Parameters: 0
		Flags: Linked
	*/
	function function_10b0cbea()
	{
		[[ self ]]->function_158505aa(function_76fbb09e(var_f141235b, _i_mode, var_1d73bad9));
	}

	/*
		Name: function_158505aa
		Namespace: namespace_7da27482
		Checksum: 0xD6547EAE
		Offset: 0x1898
		Size: 0x42
		Parameters: 1
		Flags: Linked
	*/
	function function_158505aa(outfit_index)
	{
		/#
			/#
				assert(_i_mode != 4);
			#/
		#/
		self.var_cfe86a3e = outfit_index;
	}

	/*
		Name: function_15a8906a
		Namespace: namespace_7da27482
		Checksum: 0x6D8B10FF
		Offset: 0x4378
		Size: 0x144
		Parameters: 1
		Flags: Linked
	*/
	function function_15a8906a(var_23904c1d)
	{
		if(isdefined(var_23904c1d.xuid))
		{
			[[ self ]]->set_xuid(var_23904c1d.xuid);
		}
		[[ self ]]->set_character_mode(var_23904c1d.charactermode);
		[[ self ]]->set_character_index(var_23904c1d.charactertype);
		[[ self ]]->set_character_outfit(var_23904c1d.outfit);
		[[ self ]]->function_158505aa(var_23904c1d.var_665ae20e);
		/#
			/#
				assert(var_23904c1d.outfititems.size == 8);
			#/
		#/
		foreach(itemindex in var_23904c1d.outfititems)
		{
			[[ self ]]->set_character_outfit_item(itemindex, itemtype);
		}
	}

	/*
		Name: function_184a4d2e
		Namespace: namespace_7da27482
		Checksum: 0xE885D700
		Offset: 0xB58
		Size: 0x90
		Parameters: 1
		Flags: Linked
	*/
	function function_184a4d2e(callback_fn)
	{
		if(!isdefined(var_180f1c7d))
		{
			self.var_180f1c7d = [];
		}
		else if(!isarray(var_180f1c7d))
		{
			self.var_180f1c7d = array(var_180f1c7d);
		}
		if(!isinarray(var_180f1c7d, callback_fn))
		{
			self.var_180f1c7d[var_180f1c7d.size] = callback_fn;
		}
	}

	/*
		Name: function_1978bfeb
		Namespace: namespace_7da27482
		Checksum: 0xBBB950D2
		Offset: 0x1A58
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
		return character_customization::function_6bca50af(&function_6b7000e, var_1d73bad9, var_cf55444c, var_f5c0467b[3], _i_mode);
	}

	/*
		Name: function_1a57b132
		Namespace: namespace_7da27482
		Checksum: 0xD885F806
		Offset: 0x14F0
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
		Checksum: 0xA5D28704
		Offset: 0xC08
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
		Checksum: 0xCD230357
		Offset: 0xE18
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
		Checksum: 0x88C7C8A9
		Offset: 0xBF0
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
		Checksum: 0x4420AE2D
		Offset: 0x42E8
		Size: 0x44
		Parameters: 0
		Flags: Linked
	*/
	function function_22039feb()
	{
		set_character_outfit(0);
		function_158505aa(0);
		function_95779b72();
	}

	/*
		Name: update
		Namespace: namespace_7da27482
		Checksum: 0x117CD138
		Offset: 0x1C68
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function update(params)
	{
		self thread update_internal(params);
	}

	/*
		Name: function_225b6e07
		Namespace: namespace_7da27482
		Checksum: 0xA38EF70C
		Offset: 0x4788
		Size: 0x58
		Parameters: 0
		Flags: Linked
	*/
	function function_225b6e07()
	{
		var_65496229 = [[ self ]]->function_690c9509();
		character_index = getequippedheroindex(var_65496229, _i_mode);
		[[ self ]]->set_character_index(character_index);
	}

	/*
		Name: get_character_mode
		Namespace: namespace_7da27482
		Checksum: 0x5E127CB9
		Offset: 0x1750
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function get_character_mode()
	{
		return _i_mode;
	}

	/*
		Name: function_27945cb8
		Namespace: namespace_7da27482
		Checksum: 0xB57A4097
		Offset: 0x49C0
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
		Checksum: 0x2E5834F6
		Offset: 0x48E8
		Size: 0xCC
		Parameters: 0
		Flags: Linked, Private
	*/
	function private function_2a5421e3()
	{
		if(var_b3113387 && !var_228f64da function_d2503806(#"hash_79892e1d5a8f9f33"))
		{
			var_228f64da playrenderoverridebundle(#"hash_79892e1d5a8f9f33");
		}
		else if(!var_b3113387 && var_228f64da function_d2503806(#"hash_79892e1d5a8f9f33"))
		{
			var_228f64da stoprenderoverridebundle(#"hash_79892e1d5a8f9f33");
		}
	}

	/*
		Name: set_alt_render_mode
		Namespace: namespace_7da27482
		Checksum: 0x6AF371E3
		Offset: 0xC70
		Size: 0x1A
		Parameters: 1
		Flags: Linked
	*/
	function set_alt_render_mode(alt_render_mode)
	{
		self.var_bf4feef5 = alt_render_mode;
	}

	/*
		Name: function_39a68bf2
		Namespace: namespace_7da27482
		Checksum: 0xEC3F8756
		Offset: 0x3E50
		Size: 0xCA
		Parameters: 2
		Flags: Linked
	*/
	function function_39a68bf2(stop_update, var_93eea46f)
	{
		if(!isdefined(stop_update))
		{
			stop_update = 1;
		}
		if(!isdefined(var_93eea46f))
		{
			var_93eea46f = 0;
		}
		self.var_1d18f5c7 = 0;
		if(stop_update)
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
		Name: set_xuid
		Namespace: namespace_7da27482
		Checksum: 0x3A3B7DA7
		Offset: 0xD58
		Size: 0x1A
		Parameters: 1
		Flags: Linked
	*/
	function set_xuid(xuid)
	{
		self._xuid = xuid;
	}

	/*
		Name: function_4240a39a
		Namespace: namespace_7da27482
		Checksum: 0x4634887F
		Offset: 0xF20
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
			var_228f64da.angles = _angles;
		}
	}

	/*
		Name: function_47cb6b19
		Namespace: namespace_7da27482
		Checksum: 0x5521C68F
		Offset: 0xE30
		Size: 0x1A
		Parameters: 0
		Flags: Linked
	*/
	function function_47cb6b19()
	{
		return var_228f64da getentitynumber();
	}

	/*
		Name: set_character_outfit
		Namespace: namespace_7da27482
		Checksum: 0xE58A5901
		Offset: 0x1768
		Size: 0x5E
		Parameters: 1
		Flags: Linked
	*/
	function set_character_outfit(outfit_index)
	{
		/#
			/#
				assert(_i_mode != 4);
			#/
		#/
		if(var_cf55444c != outfit_index)
		{
			self.var_b627749c = 1;
			self.var_cf55444c = outfit_index;
		}
	}

	/*
		Name: function_4a271da1
		Namespace: namespace_7da27482
		Checksum: 0x3CC6E54
		Offset: 0xF88
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
		Checksum: 0x1EF5F0C4
		Offset: 0x3F28
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
		stage = getactivecamostage(var_6f2ae9c0);
		var_3594168e = var_f4eb4a50.stages[stage];
		return activecamo::function_6c9e0e1a(localclientnum, weaponmodel, var_3594168e, var_49daa2f6);
	}

	/*
		Name: function_59d1302f
		Namespace: namespace_7da27482
		Checksum: 0x9FF9CDD
		Offset: 0x4628
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
		Checksum: 0xF52E7962
		Offset: 0x39A0
		Size: 0xCC
		Parameters: 2
		Flags: Linked, Private
	*/
	function private function_60b3658e(var_2ec36514, need_wait)
	{
		if(need_wait)
		{
			self endon(#"deleted", #"hash_578cb70e92c24a5a");
			self waittill(#"cancel_gesture", #"gesture_ended");
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
		Checksum: 0xB943107B
		Offset: 0x1640
		Size: 0x2C
		Parameters: 1
		Flags: Linked
	*/
	function function_617a9ce4(character_mode)
	{
		/#
			assert(character_mode === _i_mode);
		#/
	}

	/*
		Name: function_62dd99d6
		Namespace: namespace_7da27482
		Checksum: 0xDB72780A
		Offset: 0x1BA8
		Size: 0xB4
		Parameters: 1
		Flags: Linked
	*/
	function function_62dd99d6(model)
	{
		render_options = function_aa478513({#hash_18d63ea2:var_f5c0467b, #hash_34ba1b60:var_cfe86a3e, #outfitindex:var_cf55444c, #characterindex:var_1d73bad9, #mode:_i_mode});
		model function_1fac41e4(render_options);
	}

	/*
		Name: function_66de4847
		Namespace: namespace_7da27482
		Checksum: 0x6DDAA0BA
		Offset: 0x1238
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
		foreach(model_data in var_506d3c33)
		{
			character_customization::function_247f6628(model_data.model, model_data.lod, model_data.mip);
		}
		self.var_506d3c33 = [];
	}

	/*
		Name: function_690c9509
		Namespace: namespace_7da27482
		Checksum: 0x5D3634CD
		Offset: 0xD28
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
		Checksum: 0x10BC3898
		Offset: 0x3E18
		Size: 0x2E
		Parameters: 1
		Flags: Linked
	*/
	function function_69ac4009(gesture_index)
	{
		gesture = get_gesture(gesture_index);
	}

	/*
		Name: function_72be01b9
		Namespace: namespace_7da27482
		Checksum: 0x35DF841B
		Offset: 0x45A8
		Size: 0x38
		Parameters: 0
		Flags: Linked
	*/
	function function_72be01b9()
	{
		[[ self ]]->set_character_outfit(function_9ec573f1(var_f141235b, _i_mode, var_1d73bad9));
	}

	/*
		Name: set_character_index
		Namespace: namespace_7da27482
		Checksum: 0x18129E88
		Offset: 0x16D8
		Size: 0x56
		Parameters: 1
		Flags: Linked
	*/
	function set_character_index(character_index)
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
		Checksum: 0xD634DC27
		Offset: 0x4180
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
		Checksum: 0x6E0502C7
		Offset: 0x4A28
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
		Checksum: 0x1520444E
		Offset: 0x4568
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
		Checksum: 0xADBA62AA
		Offset: 0xDE8
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
		Checksum: 0xEDD5DB19
		Offset: 0xC98
		Size: 0x1A
		Parameters: 1
		Flags: Linked
	*/
	function function_79f89fb6(var_925f39ce)
	{
		self.var_9896541c = var_925f39ce;
	}

	/*
		Name: update_internal
		Namespace: namespace_7da27482
		Checksum: 0xF2A579E1
		Offset: 0x1C98
		Size: 0x1468
		Parameters: 1
		Flags: Linked
	*/
	function update_internal(params)
	{
		self notify("1b90151b7183669f");
		self endon("1b90151b7183669f");
		level endon(#"disconnect");
		self endon(#"deleted", #"hash_578cb70e92c24a5a");
		if(isdefined(var_9bea772f))
		{
			function_66b6e720(var_9bea772f);
			self.var_9bea772f = undefined;
			if(var_43b94d19)
			{
				var_228f64da show();
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
			attached_models = [#"outfit_torso":#"tag_origin", #"outfit_legs":#"tag_origin", #"outfit_headgear":#"tag_origin", #"outfit_head":[[ self ]]->function_8c6b7af7(params)];
		}
		else
		{
			base_model = [[ self ]]->function_b06080fb();
			attached_models = [#"outfit_torso":[[ self ]]->function_d5e754c6(), #"outfit_legs":[[ self ]]->function_cdc02b18(), #"outfit_headgear":[[ self ]]->function_1978bfeb(), #"outfit_head":[[ self ]]->function_8c6b7af7(params)];
		}
		var_9e7c4fde = array(base_model);
		self.var_ff2bed36 = util::spawn_model(var_f141235b, base_model, var_228f64da.origin);
		var_ff2bed36 hide();
		self.var_8d79cdc7 = util::spawn_model(var_f141235b, base_model, var_228f64da.origin);
		var_8d79cdc7 hide();
		var_8d79cdc7 function_2649d965(1);
		var_8d79cdc7 sethighdetail(var_851003fe);
		_models = [];
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
					var_a942d0c7 = 0;
				}
				waitframe(1);
			}
			if(var_43b94d19)
			{
				var_228f64da show();
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
				[[ self ]]->function_27945cb8(1, 1);
				outfit_index = function_9ec573f1(var_f141235b, _i_mode, var_1d73bad9);
				var_d92aad5c = function_bd9a67ae(var_f141235b, _i_mode, var_1d73bad9, outfit_index, 0);
				var_2f1dcdbb = function_bd9a67ae(var_f141235b, _i_mode, var_1d73bad9, outfit_index, 2);
				var_cb9bcfe7 = function_bd9a67ae(var_f141235b, _i_mode, var_1d73bad9, outfit_index, 3);
				var_173f7170 = function_bd9a67ae(var_f141235b, _i_mode, var_1d73bad9, outfit_index, 4);
				var_1f170bc0 = function_bd9a67ae(var_f141235b, _i_mode, var_1d73bad9, outfit_index, 6);
				if([[ self ]]->function_bf7bce05())
				{
					var_867954ad = character_customization::function_6bca50af(&function_92ea4100, var_1d73bad9, outfit_index, 0, _i_mode);
					var_89610e9c = [#"outfit_torso":#"tag_origin", #"outfit_legs":#"tag_origin", #"outfit_headgear":#"tag_origin", #"outfit_head":character_customization::function_6bca50af(&function_44a7328f, var_1d73bad9, outfit_index, 0, _i_mode)];
				}
				else
				{
					var_867954ad = character_customization::function_6bca50af(&function_5d23af5b, var_1d73bad9, outfit_index, var_d92aad5c, _i_mode);
					var_89610e9c = [#"outfit_torso":character_customization::function_6bca50af(&function_92ea4100, var_1d73bad9, outfit_index, var_1f170bc0, _i_mode), #"outfit_legs":character_customization::function_6bca50af(&function_cde23658, var_1d73bad9, outfit_index, var_173f7170, _i_mode), #"outfit_headgear":character_customization::function_6bca50af(&function_6b7000e, var_1d73bad9, outfit_index, var_cb9bcfe7, _i_mode), #"outfit_head":character_customization::function_6bca50af(&function_44a7328f, var_1d73bad9, outfit_index, var_2f1dcdbb, _i_mode)];
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
				function_91cd5499(util::spawn_model(var_f141235b, var_867954ad, _origin, _angles), 0, 0);
				self.var_b627749c = 1;
				[[ self ]]->function_27945cb8(1, 1);
				if(!var_43b94d19)
				{
					var_228f64da hide();
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
				function_91cd5499(util::spawn_model(var_f141235b, base_model, _origin, _angles));
				self.var_45210dc7 = [];
				self.var_bf273e28 = [];
				self.var_5633914d = [];
			}
			if(!var_43b94d19)
			{
				var_228f64da hide();
			}
			else
			{
				var_228f64da show();
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
			thread [[ self ]]->play_gesture(gestureindex, 0, 1, 0);
		}
	}

	/*
		Name: function_7ed995de
		Namespace: namespace_7da27482
		Checksum: 0xA79344BE
		Offset: 0xA88
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
		self._angles = character_model.angles;
		function_91cd5499(character_model);
	}

	/*
		Name: function_8144231c
		Namespace: namespace_7da27482
		Checksum: 0x52873C6A
		Offset: 0x3DA8
		Size: 0x62
		Parameters: 0
		Flags: Linked
	*/
	function function_8144231c()
	{
		if(!var_c31e86ed && #"female" === getherogender(var_1d73bad9, _i_mode))
		{
			return #"hash_26d5282647da1123";
		}
		return #"hash_4157b71749071ad4";
	}

	/*
		Name: function_81d84c71
		Namespace: namespace_7da27482
		Checksum: 0x5AEDEDA1
		Offset: 0x4218
		Size: 0xC4
		Parameters: 0
		Flags: Linked
	*/
	function function_81d84c71()
	{
		self notify("6f9807f8baadc402");
		self endon("6f9807f8baadc402");
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
				var_228f64da function_a72ef0c5(var_f141235b, _i_mode);
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
		Checksum: 0x2F76D9A8
		Offset: 0x10F0
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
		Name: set_character_outfit_item
		Namespace: namespace_7da27482
		Checksum: 0x6045FB05
		Offset: 0x17D0
		Size: 0xBC
		Parameters: 2
		Flags: Linked
	*/
	function set_character_outfit_item(item_index, item_type)
	{
		/#
			/#
				assert(_i_mode != 4);
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
		Checksum: 0xF28E78A6
		Offset: 0x19C0
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
		return character_customization::function_6bca50af(&function_44a7328f, var_1d73bad9, var_cf55444c, var_f5c0467b[2], _i_mode);
	}

	/*
		Name: function_9004475c
		Namespace: namespace_7da27482
		Checksum: 0x6F31AB0E
		Offset: 0x1738
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
		Checksum: 0x88AC0F4F
		Offset: 0x46E8
		Size: 0x94
		Parameters: 2
		Flags: Linked
	*/
	function function_9146bf81(itemindex, itemtype)
	{
		outfit_index = (itemtype == 7 ? var_cfe86a3e : var_cf55444c);
		if(!isdefined(itemindex))
		{
			itemindex = function_bd9a67ae(var_f141235b, _i_mode, var_1d73bad9, outfit_index, itemtype);
		}
		[[ self ]]->set_character_outfit_item(itemindex, itemtype);
	}

	/*
		Name: function_91cd5499
		Namespace: namespace_7da27482
		Checksum: 0xCD70CAAB
		Offset: 0x848
		Size: 0x234
		Parameters: 3
		Flags: Linked, Private
	*/
	function private function_91cd5499(character_model, var_87606b20, var_584905de)
	{
		if(isdefined(var_228f64da))
		{
			self._origin = var_228f64da.origin;
			self._angles = var_228f64da.angles;
			[[ self ]]->function_39a68bf2(0);
			var_228f64da delete();
		}
		self.var_228f64da = character_model;
		var_228f64da.targetname = _target_name;
		var_228f64da.origin = _origin;
		var_228f64da.angles = _angles;
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
		Checksum: 0x1EEE4A61
		Offset: 0x4338
		Size: 0x38
		Parameters: 0
		Flags: Linked
	*/
	function function_95779b72()
	{
		for(itemtype = 0; itemtype < 8; itemtype++)
		{
			[[ self ]]->set_character_outfit_item(0, itemtype);
		}
	}

	/*
		Name: function_98d70bef
		Namespace: namespace_7da27482
		Checksum: 0xA89D7CBD
		Offset: 0xD80
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
		Checksum: 0xC88F6A4C
		Offset: 0xE00
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_9afbd994()
	{
		return var_5d01abf7;
	}

	/*
		Name: show_model
		Namespace: namespace_7da27482
		Checksum: 0x1A073E09
		Offset: 0xE70
		Size: 0x4C
		Parameters: 0
		Flags: Linked
	*/
	function show_model()
	{
		if(isdefined(var_228f64da))
		{
			var_228f64da show();
		}
		self.var_43b94d19 = 1;
		function_c39fbf91();
	}

	/*
		Name: get_angles
		Namespace: namespace_7da27482
		Checksum: 0x51540F6C
		Offset: 0xFB8
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function get_angles()
	{
		return _angles;
	}

	/*
		Name: function_ac9cc79d
		Namespace: namespace_7da27482
		Checksum: 0xA1FFF6E0
		Offset: 0x4668
		Size: 0x78
		Parameters: 1
		Flags: Linked
	*/
	function function_ac9cc79d(itemtype)
	{
		outfit_index = (itemtype == 7 ? var_cfe86a3e : var_cf55444c);
		[[ self ]]->set_character_outfit_item(function_bd9a67ae(var_f141235b, _i_mode, var_1d73bad9, outfit_index, itemtype), itemtype);
	}

	/*
		Name: delete_models
		Namespace: namespace_7da27482
		Checksum: 0xA5729F0C
		Offset: 0xFD0
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
		Checksum: 0x447787B8
		Offset: 0x1558
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
		Checksum: 0x166E7EF8
		Offset: 0x1958
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
		return character_customization::function_6bca50af(&function_5d23af5b, var_1d73bad9, var_cf55444c, var_f5c0467b[0], _i_mode);
	}

	/*
		Name: play_gesture
		Namespace: namespace_7da27482
		Checksum: 0x995FFCB6
		Offset: 0x3A78
		Size: 0x2D4
		Parameters: 4
		Flags: Linked
	*/
	function play_gesture(gesture_index, var_4a759822, var_1b1e990c, var_e14a92d8)
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
		self endon(#"cancel_gesture");
		if(var_4a759822 && isdefined(var_1d18f5c7))
		{
			while(![[ self ]]->function_ea4ac9f8())
			{
				wait(0.25);
			}
		}
		var_2ec36514 = var_cbcee022;
		[[ self ]]->function_39a68bf2(1, 1);
		gesture = get_gesture(gesture_index);
		if(isdefined(gesture) && isdefined(gesture.animation))
		{
			self endon(#"hash_578cb70e92c24a5a", #"cancel_gesture");
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
					self notify(#"gesture_ended");
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
		Checksum: 0x9F2F05E8
		Offset: 0xE58
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
		Checksum: 0x78008AE4
		Offset: 0x3828
		Size: 0x170
		Parameters: 0
		Flags: Linked
	*/
	function function_b94f710e()
	{
		if(isdefined(var_cbcee022))
		{
			[[ self ]]->function_39a68bf2();
			var_228f64da thread character_customization::play_intro_and_animation(_origin, _angles, undefined, var_cbcee022, 0);
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
			ent thread character_customization::play_intro_and_animation(_origin, _angles, undefined, var_bf273e28[slot], 1);
		}
	}

	/*
		Name: force_stream_model
		Namespace: namespace_7da27482
		Checksum: 0xC4BA68D
		Offset: 0x1350
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
		Checksum: 0x148182BE
		Offset: 0xEC8
		Size: 0x4C
		Parameters: 0
		Flags: Linked
	*/
	function hide_model()
	{
		var_228f64da hide();
		self notify(#"cancel_gesture");
		self.var_43b94d19 = 0;
		function_c39fbf91();
	}

	/*
		Name: function_bf7bce05
		Namespace: namespace_7da27482
		Checksum: 0x649E9915
		Offset: 0x18E8
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
		return function_4611d0e6(_i_mode, var_1d73bad9);
	}

	/*
		Name: function_c0ccd9ea
		Namespace: namespace_7da27482
		Checksum: 0x72636642
		Offset: 0xC48
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
		Checksum: 0x48BD4750
		Offset: 0x1678
		Size: 0x56
		Parameters: 1
		Flags: Linked
	*/
	function set_character_mode(character_mode)
	{
		/#
			/#
				assert(isdefined(character_mode));
			#/
		#/
		if(_i_mode != character_mode)
		{
			self.var_b627749c = 1;
			self._i_mode = character_mode;
		}
	}

	/*
		Name: function_c39fbf91
		Namespace: namespace_7da27482
		Checksum: 0x8A16941C
		Offset: 0x7B8
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
		Name: function_cdc02b18
		Namespace: namespace_7da27482
		Checksum: 0x1C8C34DF
		Offset: 0x1AC8
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
		return character_customization::function_6bca50af(&function_cde23658, var_1d73bad9, var_cf55444c, var_f5c0467b[4], _i_mode);
	}

	/*
		Name: set_show_helmets
		Namespace: namespace_7da27482
		Checksum: 0x52283FE7
		Offset: 0xCE8
		Size: 0x38
		Parameters: 1
		Flags: Linked
	*/
	function set_show_helmets(show_helmets)
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
		Checksum: 0x6D44505A
		Offset: 0x1B38
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
		return character_customization::function_6bca50af(&function_92ea4100, var_1d73bad9, var_cf55444c, var_f5c0467b[6], _i_mode);
	}

	/*
		Name: function_dd872e2b
		Namespace: namespace_7da27482
		Checksum: 0x4CBE32E0
		Offset: 0x3FF8
		Size: 0x17C
		Parameters: 2
		Flags: Linked
	*/
	function function_dd872e2b(params, force_updates)
	{
		if(isdefined(params.weapon_right) || isdefined(params.weapon_left))
		{
			[[ self ]]->update_model_attachment(params.weapon_right, "tag_weapon_right", params.weapon_right_anim, params.weapon_right_anim_intro, force_updates);
			[[ self ]]->update_model_attachment(params.weapon_left, "tag_weapon_left", params.weapon_left_anim, params.weapon_left_anim_intro, force_updates);
		}
		else if(isdefined(params.activeweapon))
		{
			var_228f64da attachweapon(params.activeweapon, (isdefined(params.var_b8f20727) ? params.var_b8f20727 : 0), (isdefined(params.var_452aa9c0) ? params.var_452aa9c0 : 0), 1);
			function_4b2b3712(var_f141235b, var_228f64da, (isdefined(params.var_b8f20727) ? params.var_b8f20727 : 0), var_27af8d38);
			var_228f64da useweaponhidetags(params.activeweapon);
		}
	}

	/*
		Name: function_e08bf4f2
		Namespace: namespace_7da27482
		Checksum: 0x7C67D06B
		Offset: 0xCC0
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
		Checksum: 0xCB49E8B1
		Offset: 0x3108
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
					ent.angles = _angles;
					ent thread character_customization::play_intro_and_animation(_origin, _angles, model_intro_anim, model_anim, 1);
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
		Checksum: 0xFC0981BA
		Offset: 0x44C8
		Size: 0x94
		Parameters: 0
		Flags: Linked
	*/
	function function_e599283f()
	{
		return {#outfititems:var_f5c0467b, #hash_665ae20e:var_cfe86a3e, #outfit:var_cf55444c, #charactertype:var_1d73bad9, #charactermode:_i_mode, #xuid:_xuid};
	}

	/*
		Name: get_origin
		Namespace: namespace_7da27482
		Checksum: 0x33B0B4FD
		Offset: 0xFA0
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
		Checksum: 0x3F5684BE
		Offset: 0x1120
		Size: 0x22
		Parameters: 0
		Flags: Linked
	*/
	function function_e8b0acef()
	{
		return getcharacterfields(var_1d73bad9, _i_mode);
	}

	/*
		Name: function_ea4ac9f8
		Namespace: namespace_7da27482
		Checksum: 0xD449ACFC
		Offset: 0x1220
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
		Checksum: 0x661E0F9E
		Offset: 0x3480
		Size: 0x3A0
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
		if(isdefined(params.align_struct) && (params.align_struct.origin !== _origin || params.align_struct.angles !== _angles))
		{
			self._origin = params.align_struct.origin;
			self._angles = params.align_struct.angles;
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
			var_228f64da thread character_customization::play_intro_and_animation(_origin, _angles, params.anim_intro_name, var_cbcee022, 0);
		}
		else if(isdefined(params.scene) && (params.scene !== var_54430cb6 || params.scene_target !== var_a287debe || is_true(params.var_a34c858c) != var_8d2161e9 || force_update))
		{
			changed = 1;
			[[ self ]]->function_39a68bf2(0);
			self.var_54430cb6 = params.scene;
			self.var_5d01abf7 = params.var_74741b75;
			self.var_6ce65c01 = params.var_a68ab9c2;
			self.var_a287debe = (isdefined(params.scene_target) ? params.scene_target : level);
			self.var_8d2161e9 = is_true(params.var_a34c858c);
			self.var_cbcee022 = undefined;
			if(var_8d2161e9)
			{
				model = var_228f64da;
			}
			thread character_customization::function_f7a5fba4(var_a287debe, var_54430cb6, model, var_5d01abf7, var_6ce65c01, params.var_f5332569, params.var_b1e821c5, params.var_bfbc1f4f);
		}
		return changed;
	}

	/*
		Name: function_ef6f931f
		Namespace: namespace_7da27482
		Checksum: 0xF21C93BA
		Offset: 0x1940
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
		Checksum: 0xA7172647
		Offset: 0x1928
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
		Checksum: 0xECC94B45
		Offset: 0x1150
		Size: 0xC2
		Parameters: 1
		Flags: Linked
	*/
	function get_gesture(gesture_index)
	{
		if(gesture_index == -1)
		{
			if(#"female" === getherogender(var_1d73bad9, _i_mode))
			{
				return {#animation:#"hash_108a8b0f7d2f377d"};
			}
			return {#animation:#"hash_233be4ac797ac20"};
		}
		return function_2a6a2af(var_1d73bad9, _i_mode, gesture_index);
	}

}

#namespace character_customization;

/*
	Name: __init__system__
	Namespace: character_customization
	Checksum: 0x30F1157A
	Offset: 0x2E0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"character_customization", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_6bca50af
	Namespace: character_customization
	Checksum: 0xE29D2446
	Offset: 0x328
	Size: 0xA2
	Parameters: 5
	Flags: Linked
*/
function function_6bca50af(fn, character_index, outfit_index, var_e1daa8d9, mode)
{
	model = [[fn]](character_index, outfit_index, var_e1daa8d9, mode);
	if(!isdefined(model))
	{
		model = [[fn]](character_index, outfit_index, 0, mode);
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
	Checksum: 0x5BE9AE2D
	Offset: 0x3D8
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
		if(isdefined(character._xuid))
		{
			return level.var_6963abdb[character._xuid];
		}
	}
	return 0;
}

/*
	Name: function_bee62aa1
	Namespace: character_customization
	Checksum: 0xE30C01B6
	Offset: 0x490
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
		if(isdefined(character._xuid))
		{
			level.var_6963abdb[character._xuid] = 0;
		}
	}
}

/*
	Name: function_70a657d8
	Namespace: character_customization
	Checksum: 0x1E4EA998
	Offset: 0x5A68
	Size: 0x12C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_dda8e1d8 = &function_1c0ddf49;
	level.model_type_bones = [#"outfit_torso":"", #"outfit_legs":"", #"outfit_headgear":"", #"outfit_head":""];
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
	Checksum: 0xA1D7A92E
	Offset: 0x5BA0
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
	Checksum: 0x3E3DAD08
	Offset: 0x5C00
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
	Checksum: 0xC4D3AC7A
	Offset: 0x5CC8
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
	Checksum: 0xC06D6826
	Offset: 0x5D60
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
	Checksum: 0x53DE56DC
	Offset: 0x5E00
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
	Checksum: 0xD0FDA02
	Offset: 0x5F38
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
	Checksum: 0x169641DB
	Offset: 0x6030
	Size: 0x11A
	Parameters: 3
	Flags: Linked
*/
function function_aa5382ed(customization1, customization2, check_xuid)
{
	if(!isdefined(check_xuid))
	{
		check_xuid = 1;
	}
	if(isdefined(customization1) != isdefined(customization2))
	{
		return true;
	}
	if(!isdefined(customization1))
	{
		return false;
	}
	if(check_xuid && customization1.xuid !== customization2.xuid)
	{
		return true;
	}
	if(customization1.charactertype != customization2.charactertype)
	{
		return true;
	}
	if(customization1.outfit != customization2.outfit)
	{
		return true;
	}
	if(customization1.var_cfe86a3e != customization2.var_cfe86a3e)
	{
		return true;
	}
	for(i = 0; i < customization1.outfititems.size; i++)
	{
		if(customization1.outfititems[i] != customization2.outfititems[i])
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_7474681d
	Namespace: character_customization
	Checksum: 0xB1E0A305
	Offset: 0x6158
	Size: 0x134
	Parameters: 3
	Flags: Linked
*/
function function_7474681d(local_client_num, session_mode, character_index)
{
	outfit_index = function_9ec573f1(local_client_num, session_mode, character_index);
	var_17b172ca = function_76fbb09e(local_client_num, session_mode, character_index);
	outfit_items = [];
	for(itemtype = 0; itemtype < 8; itemtype++)
	{
		var_9b90e15d = (itemtype == 7 ? var_17b172ca : outfit_index);
		outfit_items[itemtype] = function_bd9a67ae(local_client_num, session_mode, character_index, var_9b90e15d, itemtype);
	}
	return {#outfititems:outfit_items, #hash_665ae20e:var_17b172ca, #outfit:outfit_index, #charactertype:character_index, #charactermode:session_mode};
}

/*
	Name: function_3f5625f1
	Namespace: character_customization
	Checksum: 0x9C0D9434
	Offset: 0x6298
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
	outfit_items = [];
	for(itemtype = 0; itemtype < 8; itemtype++)
	{
		outfit_items[itemtype] = 0;
	}
	return {#outfititems:outfit_items, #hash_665ae20e:0, #outfit:0, #charactertype:character_index, #charactermode:mode};
}

/*
	Name: play_intro_and_animation
	Namespace: character_customization
	Checksum: 0x132140F
	Offset: 0x6358
	Size: 0xAC
	Parameters: 5
	Flags: Linked
*/
function play_intro_and_animation(origin, angles, intro_anim_name, anim_name, b_keep_link)
{
	self notify("5c9050f9ef4f60b2");
	self endon("5c9050f9ef4f60b2");
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
	Checksum: 0x8A038665
	Offset: 0x6410
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
	self notify("219163b58019a834");
	self endon("219163b58019a834");
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
	Checksum: 0xE6CF6F90
	Offset: 0x6750
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
	Checksum: 0xE2BFEAF0
	Offset: 0x6788
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
	Checksum: 0x7C5DA11F
	Offset: 0x67E8
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
	Checksum: 0x9E572C2D
	Offset: 0x6888
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
	Checksum: 0x97319956
	Offset: 0x6948
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
	Checksum: 0xA6799D2C
	Offset: 0x69C8
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
	Checksum: 0x6BFACA36
	Offset: 0x6A10
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
			case "update_locked":
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
			case "refresh_anim":
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
				[[ var_d0b01271 ]]->set_character_index(waitresult.character_index);
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
			case "resetcharacter":
			{
				[[ var_d0b01271 ]]->function_77e3be08();
				params = {};
				[[var_1d7f1597]](localclientnum, var_d0b01271, waitresult, params);
				[[ var_d0b01271 ]]->update(params);
				break;
			}
			case "changeoutfit":
			{
				[[ var_d0b01271 ]]->set_character_outfit(waitresult.outfit_index);
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
			case "changewarpaintoutfit":
			{
				[[ var_d0b01271 ]]->function_72be01b9();
				[[ var_d0b01271 ]]->function_158505aa(waitresult.outfit_index);
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
			case "changeoutfititem":
			{
				if(isdefined(waitresult.outfit_index))
				{
					if(waitresult.item_type == 7)
					{
						[[ var_d0b01271 ]]->function_158505aa(waitresult.outfit_index);
					}
					else
					{
						[[ var_d0b01271 ]]->set_character_outfit(waitresult.outfit_index);
					}
				}
				[[ var_d0b01271 ]]->set_character_outfit_item(waitresult.item_index, waitresult.item_type);
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
			case "updateface":
			{
				[[ var_d0b01271 ]]->function_617a9ce4(waitresult.mode);
				thread [[ var_d0b01271 ]]->function_81d84c71();
				break;
			}
			case "previewshop":
			case "previewshopface":
			{
				[[ var_d0b01271 ]]->set_character_mode(waitresult.mode);
				[[ var_d0b01271 ]]->set_character_index(waitresult.character_index);
				[[ var_d0b01271 ]]->set_character_outfit(waitresult.outfit_index);
				[[ var_d0b01271 ]]->function_158505aa(waitresult.outfit_index);
				outfititems = strtok(waitresult.outfititems, ";");
				foreach(item in outfititems)
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
			case "loadpreset":
			{
				if(isdefined(waitresult.mode))
				{
					[[ var_d0b01271 ]]->set_character_mode(waitresult.mode);
				}
				if(isdefined(waitresult.character_index))
				{
					[[ var_d0b01271 ]]->set_character_index(waitresult.character_index);
				}
				if(isdefined(waitresult.outfit_index))
				{
					[[ var_d0b01271 ]]->set_character_outfit(waitresult.outfit_index);
				}
				outfititems = strtok(waitresult.presets, ";");
				foreach(type, item in outfititems)
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
			case "previewshopgesture":
			{
				[[ var_d0b01271 ]]->set_character_mode(waitresult.mode);
				[[ var_d0b01271 ]]->set_character_index(waitresult.character_index);
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
				thread [[ var_d0b01271 ]]->play_gesture(waitresult.gesture_index, waitresult.var_4a759822, waitresult.var_1b1e990c, waitresult.var_e14a92d8);
				break;
			}
			case "stopgesture":
			{
				var_d0b01271 notify(#"cancel_gesture");
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
	Checksum: 0x35044240
	Offset: 0x7518
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
	Checksum: 0x9C9BC638
	Offset: 0x75C0
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
	Checksum: 0x1F4F2102
	Offset: 0x7A78
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
	Checksum: 0x2FE1872F
	Offset: 0x7A90
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
	if([[ var_d0b01271 ]]->is_streamed() && [[ var_d0b01271 ]]->function_ea4ac9f8() && [[ var_d0b01271 ]]->is_visible())
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
	Checksum: 0x832A02E7
	Offset: 0x7B58
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
	Checksum: 0xE31A6A15
	Offset: 0x7C30
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
	Checksum: 0x22BE3861
	Offset: 0x7CA0
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
	[[ var_d0b01271 ]]->set_alt_render_mode(0);
	[[ var_d0b01271 ]]->set_character_mode(extracam_data_struct.sessionmode);
	[[ var_d0b01271 ]]->set_character_index(extracam_data_struct.characterindex);
	if(is_true(extracam_data_struct.isdefaulthero) || is_true(extracam_data_struct.defaultimagerender))
	{
		[[ var_d0b01271 ]]->function_22039feb();
	}
	else
	{
		[[ var_d0b01271 ]]->function_77e3be08();
		if(isdefined(extracam_data_struct.var_d3927004) && isdefined(extracam_data_struct.var_eb3dfef8))
		{
			[[ var_d0b01271 ]]->set_character_outfit_item(extracam_data_struct.var_eb3dfef8, extracam_data_struct.var_d3927004);
		}
	}
	[[ var_d0b01271 ]]->update(params);
	while(![[ var_d0b01271 ]]->is_streamed())
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
	Checksum: 0x6FF3509
	Offset: 0x8068
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
	Checksum: 0x906FB4B7
	Offset: 0x80E8
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

