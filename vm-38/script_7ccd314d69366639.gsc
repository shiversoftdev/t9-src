#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace objective_retrieval;

/*
	Name: function_c969dcc2
	Namespace: objective_retrieval
	Checksum: 0xD2B5E9F0
	Offset: 0x2C0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c969dcc2()
{
	level notify(1713415931);
}

/*
	Name: main
	Namespace: objective_retrieval
	Checksum: 0xA416BE57
	Offset: 0x2E0
	Size: 0x1DC
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	clientfield::register("toplayer", "" + #"hash_502dbbefce1f656c", 1, 1, "int", &function_d3af9ddb, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_25f023cad32eccf0", 1, 1, "counter", &function_704685e1, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_29bff1aafecc8591", 1, 1, "int", &function_6b90cf3a, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_7e6957dfc36e2214", 1, 1, "int", &function_1eb1d4d6, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_5bc7fe725b36bd67", 1, 1, "int", &function_5ce76614, 0, 0);
	util::waitforclient(0);
}

/*
	Name: function_5ce76614
	Namespace: objective_retrieval
	Checksum: 0x76FF9075
	Offset: 0x4C8
	Size: 0x246
	Parameters: 7
	Flags: Linked
*/
function function_5ce76614(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self.var_3e09a106 = util::playfxontag(fieldname, "sr/fx9_obj_retrieval_truck_light_spin", self, "tag_fx_launch_beacon_light_lb");
		self.var_c454a3d = util::playfxontag(fieldname, "sr/fx9_obj_retrieval_truck_light_spin", self, "tag_fx_launch_beacon_light_lf");
		self.var_faaadabb = util::playfxontag(fieldname, "sr/fx9_obj_retrieval_truck_light_spin", self, "tag_fx_launch_beacon_light_rb");
		self.var_c7ae258d = util::playfxontag(fieldname, "sr/fx9_obj_retrieval_truck_light_spin", self, "tag_fx_launch_beacon_light_rf");
		wait(4);
		self.var_67819d90 = util::playfxontag(fieldname, "sr/fx9_obj_retrieval_rocket_thruster_cam_shack", self, "tag_rocket_animate");
	}
	else
	{
		if(isdefined(self.var_67819d90))
		{
			stopfx(fieldname, self.var_67819d90);
			self.var_67819d90 = undefined;
		}
		wait(15);
		if(isdefined(self.var_3e09a106))
		{
			stopfx(fieldname, self.var_3e09a106);
			self.var_3e09a106 = undefined;
		}
		if(isdefined(self.var_c454a3d))
		{
			stopfx(fieldname, self.var_c454a3d);
			self.var_c454a3d = undefined;
		}
		if(isdefined(self.var_faaadabb))
		{
			stopfx(fieldname, self.var_faaadabb);
			self.var_faaadabb = undefined;
		}
		if(isdefined(self.var_c7ae258d))
		{
			stopfx(fieldname, self.var_c7ae258d);
			self.var_c7ae258d = undefined;
		}
	}
}

/*
	Name: function_6b90cf3a
	Namespace: objective_retrieval
	Checksum: 0x44F65BF3
	Offset: 0x718
	Size: 0x11E
	Parameters: 7
	Flags: Linked
*/
function function_6b90cf3a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self.n_fx_id = util::playfxontag(fieldname, "sr/fx9_canister_pod_aether", self, "tag_animate");
		self.var_b3673abf = self playloopsound(#"hash_724ba66a7599d72d", undefined, vectorscale((0, 0, 1), 15));
	}
	else
	{
		if(isdefined(self.n_fx_id))
		{
			stopfx(fieldname, self.n_fx_id);
			self.n_fx_id = undefined;
		}
		if(isdefined(self.var_b3673abf))
		{
			self stoploopsound(self.var_b3673abf);
			self.var_b3673abf = undefined;
		}
	}
}

/*
	Name: function_1eb1d4d6
	Namespace: objective_retrieval
	Checksum: 0x6AAA9733
	Offset: 0x840
	Size: 0x166
	Parameters: 7
	Flags: Linked
*/
function function_1eb1d4d6(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump === 1)
	{
		if(isdefined(self.n_fx_id))
		{
			killfx(fieldname, self.n_fx_id);
			self.n_fx_id = undefined;
		}
		self.n_fx_id = util::playfxontag(fieldname, "sr/fx9_obj_retrieval_container_glow", self, "p9_sur_console_control_01_canister_handle_jnt");
		if(!isdefined(self.var_b3673abf))
		{
			self.var_b3673abf = self playloopsound(#"hash_3432d05cab6568b1", undefined, vectorscale((0, 0, 1), 10));
		}
	}
	else
	{
		if(isdefined(self.n_fx_id))
		{
			killfx(fieldname, self.n_fx_id);
			self.n_fx_id = undefined;
		}
		if(isdefined(self.var_b3673abf))
		{
			self stoploopsound(self.var_b3673abf);
			self.var_b3673abf = undefined;
		}
	}
}

/*
	Name: function_704685e1
	Namespace: objective_retrieval
	Checksum: 0x6EE91E75
	Offset: 0x9B0
	Size: 0xB4
	Parameters: 7
	Flags: Linked
*/
function function_704685e1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	playfx(bwastimejump, "zombie/fx9_player_shockwave_retrieval", self.origin, vectorscale((1, 0, 0), 180));
	self playsound(bwastimejump, #"hash_5db462e1df5084e7");
	self playrumbleonentity(bwastimejump, "damage_heavy");
}

/*
	Name: function_d3af9ddb
	Namespace: objective_retrieval
	Checksum: 0x84B595C5
	Offset: 0xA70
	Size: 0x354
	Parameters: 7
	Flags: Linked
*/
function function_d3af9ddb(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		if(function_65b9eb0f(fieldname))
		{
			return;
		}
		if(self isplayer())
		{
			self.var_726a59ef = playfxoncamera(fieldname, "sr/fx9_camera_canister_in_hand", (0, 0, 0), (1, 0, 0), (0, 0, 1));
			self postfx::playpostfxbundle(#"hash_75fe7a4dbc759253");
			self function_116b95e5(#"hash_75fe7a4dbc759253", #"hash_77259d33b3998de9", 0.3);
			self function_116b95e5(#"hash_75fe7a4dbc759253", #"hash_1a3ba6e8a0732aac", 0.8);
			if(!isdefined(self.var_fbd5f7c8))
			{
				self.var_fbd5f7c8 = util::playfxontag(fieldname, "sr/fx9_obj_retrieval_container_gas_trail", self, "tag_stowed_back");
			}
			if(!isdefined(self.var_e53a5eb7))
			{
				self playsound(fieldname, #"hash_22a6864697c92c12");
				self.var_e53a5eb7 = self playloopsound(#"hash_6d68538eca6c8226");
			}
			self thread paintjob_stickers_s3_rokkr_majormaniak_base_ms();
		}
	}
	else
	{
		if(function_65b9eb0f(fieldname))
		{
			return;
		}
		if(self isplayer())
		{
			if(isdefined(self.var_726a59ef))
			{
				stopfx(fieldname, self.var_726a59ef);
				self.var_726a59ef = undefined;
			}
			if(isdefined(self.var_fbd5f7c8))
			{
				stopfx(fieldname, self.var_fbd5f7c8);
				self.var_fbd5f7c8 = undefined;
			}
			if(isdefined(self.var_e53a5eb7))
			{
				self playsound(fieldname, #"hash_211ebca22128a977");
				self stoploopsound(self.var_e53a5eb7);
				self.var_e53a5eb7 = undefined;
			}
			self notify(#"hash_639f680ae2bb2ff");
			wait(0.5);
			self function_116b95e5(#"hash_75fe7a4dbc759253", #"blur", 0);
			self postfx::exitpostfxbundle(#"hash_75fe7a4dbc759253");
		}
	}
}

/*
	Name: paintjob_stickers_s3_rokkr_majormaniak_base_ms
	Namespace: objective_retrieval
	Checksum: 0xEBD51939
	Offset: 0xDD0
	Size: 0x114
	Parameters: 0
	Flags: Linked
*/
function paintjob_stickers_s3_rokkr_majormaniak_base_ms()
{
	self endon(#"death", #"disconnect", #"hash_639f680ae2bb2ff");
	n_blur = 0.01;
	while(true)
	{
		self function_116b95e5(#"hash_75fe7a4dbc759253", #"blur", n_blur);
		wait(0.08);
		n_blur = n_blur + 0.01;
		if(n_blur > 0.1)
		{
			while(n_blur > 0)
			{
				n_blur = n_blur - 0.01;
				self function_116b95e5(#"hash_75fe7a4dbc759253", #"blur", n_blur);
				wait(0.08);
			}
		}
	}
}

