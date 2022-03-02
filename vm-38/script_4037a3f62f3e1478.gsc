#using script_31816d064a53f516;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\zm_common\zm_utility.csc;

#namespace namespace_1a2bd81f;

/*
	Name: function_f4b741a1
	Namespace: namespace_1a2bd81f
	Checksum: 0x276081A4
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f4b741a1()
{
	level notify(2139524896);
}

/*
	Name: function_89f2df9
	Namespace: namespace_1a2bd81f
	Checksum: 0xC327070C
	Offset: 0xF8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_d287d6d0be9f28c", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_1a2bd81f
	Checksum: 0xDD4B0446
	Offset: 0x140
	Size: 0xE4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(is_true(getgametypesetting(#"hash_4751990deae37e66")))
	{
		callback::on_localclient_connect(&on_localclient_connect);
		callback::on_actor_spawned(&on_actor_spawned);
		clientfield::register("actor", "" + #"hash_477ed992854f5645", 28000, 1, "counter", &function_3b11146f, 0, 0);
		level thread function_ff03ce49();
	}
}

/*
	Name: on_actor_spawned
	Namespace: namespace_1a2bd81f
	Checksum: 0x5EFE235F
	Offset: 0x230
	Size: 0x354
	Parameters: 1
	Flags: Linked
*/
function on_actor_spawned(localclientnum)
{
	self endon(#"death");
	if(isdefined(self.archetype) && self.team === "axis")
	{
		switch(self.archetype)
		{
			case "hash_1bc8194446d4722f":
			case "zombie":
			case "avogadro":
			{
				self.var_6ffc5953 = array::random([2:#"hash_3b9bcbfd7d34544e", 1:#"hash_3b9bccfd7d345601", 0:#"hash_3b9bc9fd7d3450e8"]);
				self.var_dee85a7a = "j_head";
				break;
			}
			case "zombie_dog":
			{
				if(self.var_9fde8624 === #"hash_2a5479b83161cb35")
				{
					self.var_6ffc5953 = #"hash_2d158c5af72b951c";
				}
				else
				{
					self.var_6ffc5953 = #"hash_2d158c5af72b951c";
				}
				self.var_dee85a7a = "j_head";
				break;
			}
			case "raz":
			{
				self.var_6ffc5953 = #"hash_279687d633e3788b";
				self.var_dee85a7a = "j_head";
				self.var_fbfc64db = #"hash_567c329bd17fa23e";
				break;
			}
			case "mimic":
			{
				self.var_6ffc5953 = #"hash_577e281da25751ae";
				self.var_dee85a7a = "j_head";
				self.var_fbfc64db = #"hash_567c329bd17fa23e";
				break;
			}
			case "mechz":
			{
				self.var_6ffc5953 = #"hash_36be37cb09a62a29";
				self.var_dee85a7a = "j_head";
				self.var_fbfc64db = #"hash_567c329bd17fa23e";
				break;
			}
			case "hash_7c0d83ac1e845ac2":
			{
				self.var_6ffc5953 = #"hash_208ba71db2a5843e";
				self.var_dee85a7a = "j_head";
				self.var_fbfc64db = #"hash_567c329bd17fa23e";
				break;
			}
			case "hash_24f9e195cf2de42":
			{
				self.var_6ffc5953 = #"hash_73aa050fa52a8f98";
				self.var_dee85a7a = "j_head";
				wait(1.416);
				break;
			}
		}
		if(isdefined(self.var_6ffc5953) && isdefined(self.var_dee85a7a) && !self isattached(self.var_6ffc5953, self.var_dee85a7a))
		{
			self attach(self.var_6ffc5953, self.var_dee85a7a);
		}
	}
}

/*
	Name: function_3b11146f
	Namespace: namespace_1a2bd81f
	Checksum: 0xBAB93E27
	Offset: 0x590
	Size: 0x27E
	Parameters: 7
	Flags: Linked
*/
function function_3b11146f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(isdefined(self.var_6ffc5953) && isdefined(self.var_dee85a7a) && self isattached(self.var_6ffc5953, self.var_dee85a7a))
	{
		self detach(self.var_6ffc5953, self.var_dee85a7a);
		if(math::cointoss(20) || level flag::get(#"hash_63e59d16907d2aab"))
		{
			v_hit_pos = self gettagorigin(self.var_dee85a7a);
			v_force = (randomfloatrange(-0.5, 0.5), randomfloatrange(-0.5, 0.5), randomfloatrange(0.75, 1.5));
			createdynentandlaunch(bwastimejump, self.var_6ffc5953, self gettagorigin(self.var_dee85a7a), self gettagangles(self.var_dee85a7a), v_hit_pos, v_force);
		}
		var_297c3a3d = (isdefined(self.var_fbfc64db) ? self.var_fbfc64db : #"hash_2990c4a0be6af31e");
		playfx(bwastimejump, var_297c3a3d, self gettagorigin(self.var_dee85a7a));
		playsound(bwastimejump, #"hash_15d4351d6a8d884e", self gettagorigin(self.var_dee85a7a));
		self.var_6ffc5953 = undefined;
		self.var_dee85a7a = undefined;
		self.var_fbfc64db = undefined;
	}
}

/*
	Name: function_ff03ce49
	Namespace: namespace_1a2bd81f
	Checksum: 0x57F69DB2
	Offset: 0x818
	Size: 0x194
	Parameters: 0
	Flags: Linked
*/
function function_ff03ce49()
{
	force_stream_model(#"hash_73aa050fa52a8f98", 4, 1);
	force_stream_model(#"hash_2d158c5af72b951c", 4, 1);
	force_stream_model(#"hash_36be37cb09a62a29", 4, 1);
	force_stream_model(#"hash_577e281da25751ae", 4, 1);
	force_stream_model(#"hash_2d158c5af72b951c", 4, 1);
	force_stream_model(#"hash_279687d633e3788b", 4, 1);
	force_stream_model(#"hash_208ba71db2a5843e", 4, 1);
	force_stream_model(#"hash_3b9bc9fd7d3450e8", 4, 1);
	force_stream_model(#"hash_3b9bccfd7d345601", 4, 1);
	force_stream_model(#"hash_3b9bcbfd7d34544e", 4, 1);
}

/*
	Name: force_stream_model
	Namespace: namespace_1a2bd81f
	Checksum: 0x48D6D02D
	Offset: 0x9B8
	Size: 0x5C
	Parameters: 3
	Flags: Linked, Private
*/
function private force_stream_model(var_618821b1, var_9940b166, mip)
{
	for(lod = var_9940b166; lod > 1; lod--)
	{
		forcestreamxmodel(var_618821b1, lod, mip);
	}
}

/*
	Name: on_localclient_connect
	Namespace: namespace_1a2bd81f
	Checksum: 0xC82C5B4E
	Offset: 0xA20
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private on_localclient_connect(localclientnum)
{
	/#
		level thread function_4ebcb98d(localclientnum);
	#/
}

/*
	Name: function_4ebcb98d
	Namespace: namespace_1a2bd81f
	Checksum: 0x496A09D7
	Offset: 0xA58
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function function_4ebcb98d(localclientnum)
{
	/#
		util::init_dvar(#"hash_4cf563ada0725f21", "", &function_5f56213c);
		util::function_e2e9d901(localclientnum, "", "");
	#/
}

/*
	Name: function_5f56213c
	Namespace: namespace_1a2bd81f
	Checksum: 0xCEF3533E
	Offset: 0xAD8
	Size: 0xFC
	Parameters: 1
	Flags: Private
*/
function private function_5f56213c(params)
{
	/#
		if(params.value === "")
		{
			return;
		}
		switch(params.name)
		{
			case "hash_4cf563ada0725f21":
			{
				level flag::toggle(#"hash_63e59d16907d2aab");
				if(level flag::get(#"hash_63e59d16907d2aab"))
				{
					iprintlnbold("");
				}
				else
				{
					iprintlnbold("");
				}
				break;
			}
		}
		setdvar(#"hash_4cf563ada0725f21", "");
	#/
}

