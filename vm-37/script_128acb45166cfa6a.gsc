#using scripts\core_common\footsteps_shared.csc;
#using scripts\core_common\util_shared.csc;
#using script_ac6a30f1991e105;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\ai_shared.csc;

#namespace namespace_6479037a;

/*
	Name: init
	Namespace: namespace_6479037a
	Checksum: 0xE71E9164
	Offset: 0x280
	Size: 0x13C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	function_cae618b4("spawner_zombietron_steiner");
	function_cae618b4("spawner_zombietron_steiner_split_radiation_blast");
	function_cae618b4("spawner_zombietron_steiner_split_radiation_bomb");
	clientfield::register("actor", "steiner_radiation_bomb_prepare_fire_clientfield", 1, 1, "int", &function_bc28111c, 0, 0);
	clientfield::register("actor", "steiner_split_combine_fx_clientfield", 1, 1, "int", &function_66027924, 0, 0);
	footsteps::registeraitypefootstepcb(#"hash_7c0d83ac1e845ac2", &function_5a53905d);
	ai::add_archetype_spawn_function(#"hash_7c0d83ac1e845ac2", &function_7ec99c76);
}

/*
	Name: function_7ec99c76
	Namespace: namespace_6479037a
	Checksum: 0x302DA3E5
	Offset: 0x3C8
	Size: 0xD4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7ec99c76(localclientnum)
{
	util::playfxontag(localclientnum, "zm_ai/fx9_steiner_eyes_glow", self, "J_EyeBall_LE");
	util::playfxontag(localclientnum, "zm_ai/fx9_steiner_eyes_glow", self, "J_EyeBall_RI");
	if(self.var_9fde8624 === #"hash_5653bbc44a034094")
	{
		self thread function_59ee055f(localclientnum);
	}
	else
	{
		if(self.var_9fde8624 === #"hash_70162f4bc795092")
		{
			self thread function_59ee055f(localclientnum);
		}
		else
		{
			self thread function_8d607c5a(localclientnum);
		}
	}
}

/*
	Name: function_bc28111c
	Namespace: namespace_6479037a
	Checksum: 0x11951700
	Offset: 0x4A8
	Size: 0xB2
	Parameters: 7
	Flags: Linked
*/
function function_bc28111c(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump)
{
	if(!isdefined(self))
	{
		return;
	}
	if(isdefined(self.var_ce9323af))
	{
		stopfx(fieldname, self.var_ce9323af);
		self.var_ce9323af = undefined;
	}
	if(wasdemojump)
	{
		self.var_ce9323af = util::playfxontag(fieldname, "zm_ai/fx9_steiner_rad_bomb_ai", self, "tag_bombthrower_FX");
	}
}

/*
	Name: function_5a53905d
	Namespace: namespace_6479037a
	Checksum: 0x2CFA9FED
	Offset: 0x568
	Size: 0x174
	Parameters: 5
	Flags: Linked
*/
function function_5a53905d(localclientnum, pos, surface, notetrack, bone)
{
	if(self.var_9fde8624 === #"hash_5653bbc44a034094" || self.var_9fde8624 === #"hash_70162f4bc795092")
	{
		return;
	}
	/#
		if(isdefined(level.var_53094f02))
		{
			return;
		}
	#/
	a_players = getlocalplayers();
	for(i = 0; i < a_players.size; i++)
	{
		if(abs(self.origin[2] - a_players[i].origin[2]) < 128)
		{
			var_ed2e93e5 = a_players[i] getlocalclientnumber();
			if(isdefined(var_ed2e93e5))
			{
				earthquake(var_ed2e93e5, 0.5, 0.1, self.origin, 1000);
				playrumbleonposition(var_ed2e93e5, "steiner_footsteps", self.origin);
			}
		}
	}
}

/*
	Name: function_66027924
	Namespace: namespace_6479037a
	Checksum: 0x33E175DF
	Offset: 0x6E8
	Size: 0x74
	Parameters: 7
	Flags: Linked
*/
function function_66027924(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump && isdefined(self))
	{
		util::playfxontag(fieldname, "zombie/fx8_red_bathhouse_mirror_glare_loop", self, "j_spineupper");
	}
}

/*
	Name: function_8d607c5a
	Namespace: namespace_6479037a
	Checksum: 0xA3DC27DA
	Offset: 0x768
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function function_8d607c5a(localclientnum)
{
	self playsound(localclientnum, #"hash_13985582064d5e89");
	self.var_5bea7e99 = self playloopsound(#"hash_2353ca5802f38a90", undefined, vectorscale((0, 0, 1), 50));
	self thread function_c3ae0dcf();
	self thread function_ce1bd3f2(localclientnum);
}

/*
	Name: function_59ee055f
	Namespace: namespace_6479037a
	Checksum: 0x7E9333E7
	Offset: 0x808
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_59ee055f(localclientnum)
{
	self thread function_c3ae0dcf();
	self thread function_b53ee6c9(localclientnum);
}

/*
	Name: function_c3ae0dcf
	Namespace: namespace_6479037a
	Checksum: 0x84BBE05
	Offset: 0x850
	Size: 0x76
	Parameters: 0
	Flags: Linked
*/
function function_c3ae0dcf()
{
	self endon(#"death", #"entitydeleted");
	while(true)
	{
		s_result = undefined;
		s_result = self waittill(#"hash_75d966259d999fc2");
		self.var_ce0f9600 = int(s_result.active);
	}
}

/*
	Name: function_ce1bd3f2
	Namespace: namespace_6479037a
	Checksum: 0x6A323256
	Offset: 0x8D0
	Size: 0x1E8
	Parameters: 1
	Flags: Linked
*/
function function_ce1bd3f2(localclientnum)
{
	if(!isdefined(self.var_ce0f9600))
	{
		self.var_ce0f9600 = 1;
	}
	self endon(#"death", #"entitydeleted");
	var_b240b48 = "inhale";
	suffix = "";
	var_4f50b172 = 0.7;
	var_5fbfc988 = 0.8;
	var_7f07b218 = 1.2;
	var_4dfa7e5a = 1.3;
	n_wait_min = var_4f50b172;
	n_wait_max = var_5fbfc988;
	var_d49193ec = #"hash_43accb909782c33";
	while(true)
	{
		if(self.var_ce0f9600 >= 1)
		{
			suffix = "";
			n_wait_min = var_4f50b172;
			n_wait_max = var_5fbfc988;
			if(self.var_ce0f9600 >= 2)
			{
				suffix = "_slow";
				n_wait_min = var_7f07b218;
				n_wait_max = var_4dfa7e5a;
			}
			self playsound(localclientnum, (var_d49193ec + var_b240b48) + suffix, self.origin + vectorscale((0, 0, 1), 75));
			wait(randomfloatrange(n_wait_min, n_wait_max));
			if(var_b240b48 === "inhale")
			{
				var_b240b48 = "exhale";
			}
			else
			{
				var_b240b48 = "inhale";
			}
		}
		else
		{
			wait(0.1);
		}
	}
}

/*
	Name: function_b53ee6c9
	Namespace: namespace_6479037a
	Checksum: 0xAB082C59
	Offset: 0xAC0
	Size: 0x220
	Parameters: 1
	Flags: Linked
*/
function function_b53ee6c9(localclientnum)
{
	if(!isdefined(self.var_ce0f9600))
	{
		self.var_ce0f9600 = 1;
	}
	self endon(#"death", #"entitydeleted");
	var_b240b48 = "inhale";
	suffix = "";
	var_4f50b172 = 0.75;
	var_5fbfc988 = 0.85;
	var_7f07b218 = 0.75;
	var_4dfa7e5a = 0.85;
	n_wait_min = var_4f50b172;
	n_wait_max = var_5fbfc988;
	var_d49193ec = #"hash_24b7a2e5066beff3";
	while(true)
	{
		if(self.var_ce0f9600 >= 1)
		{
			suffix = "";
			n_wait_min = var_4f50b172;
			n_wait_max = var_5fbfc988;
			if(self.var_ce0f9600 >= 2)
			{
				suffix = "_slow";
				n_wait_min = var_7f07b218;
				n_wait_max = var_4dfa7e5a;
			}
			self playsound(localclientnum, (var_d49193ec + var_b240b48) + suffix, self.origin + vectorscale((0, 0, 1), 75));
			if(var_b240b48 === "inhale")
			{
				wait(randomfloatrange(0.45, 0.5));
			}
			else
			{
				wait(randomfloatrange(n_wait_min, n_wait_max));
			}
			if(var_b240b48 === "inhale")
			{
				var_b240b48 = "exhale";
			}
			else
			{
				var_b240b48 = "inhale";
			}
		}
		else
		{
			wait(0.1);
		}
	}
}

