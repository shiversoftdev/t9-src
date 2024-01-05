#using script_73eb42a5c11334f7;
#using scripts\core_common\audio_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm_magicbox;

/*
	Name: __init__system__
	Namespace: zm_magicbox
	Checksum: 0x17F7D737
	Offset: 0x1D0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_magicbox", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_magicbox
	Checksum: 0x4449CD65
	Offset: 0x218
	Size: 0x4B4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level._effect[#"hash_63f729c169af0c3e"] = #"hash_43a26488c9e5ce57";
	level._effect[#"chest_light_closed"] = #"zombie/fx_weapon_box_closed_glow_zmb";
	level._effect[#"hash_19f4dd97cbb87594"] = #"hash_5f376e9395e16666";
	level._effect[#"fire_runner"] = #"hash_409439bf8b3dd862";
	level._effect[#"hash_6778cbcf34bfebef"] = #"hash_43a26488c9e5ce57";
	level._effect[#"hash_5f2da0ff081c1699"] = #"hash_43a26488c9e5ce57";
	level._effect[#"hash_63697be07cc11490"] = #"hash_4924963a116d71bd";
	level._effect[#"hash_360e9275d6096589"] = #"hash_1bc8b1078984dbda";
	level._effect[#"hash_66be32f919d8b4a4"] = #"hash_53280ae47e5295e0";
	level._effect[#"hash_638a4ec653717ef6"] = #"hash_1a1142d2a6711364";
	level._effect[#"hash_1fa861cbe30adda9"] = #"hash_344ba1202db8c50a";
	level.var_1d1c6c28 = [];
	clientfield::register("zbarrier", "magicbox_open_fx", 1, 1, "int", &function_8f69e904, 0, 0);
	clientfield::register("zbarrier", "magicbox_closed_fx", 1, 1, "int", &function_9253a233, 0, 0);
	clientfield::register("zbarrier", "magicbox_leave_fx", 1, 1, "counter", &function_68f67f85, 0, 0);
	clientfield::register("zbarrier", "zbarrier_arriving_sounds", 1, 1, "counter", &magicbox_show_sounds_callback, 1, 0);
	clientfield::register("zbarrier", "zbarrier_leaving_sounds", 1, 1, "counter", &magicbox_leave_sounds_callback, 1, 0);
	clientfield::register("zbarrier", "force_stream_magicbox", 1, 1, "int", &force_stream_magicbox, 0, 0);
	clientfield::register("zbarrier", "force_stream_magicbox_leave", 1, 1, "int", &force_stream_magicbox_leave, 0, 0);
	clientfield::register("zbarrier", "" + #"hash_2fcdae6b889933c7", 1, 1, "int", &function_b5807489, 0, 0);
	clientfield::register("zbarrier", "" + #"hash_66b8b96e588ce1ac", 1, 3, "int", &function_abe84c14, 0, 0);
	clientfield::register("toplayer", "stream_magicbox_guns", 1, 1, "int", &stream_magicbox_guns, 0, 0);
}

/*
	Name: stream_magicbox_guns
	Namespace: zm_magicbox
	Checksum: 0xB60BCE14
	Offset: 0x6D8
	Size: 0x158
	Parameters: 7
	Flags: Linked
*/
function stream_magicbox_guns(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		foreach(modelname in level.var_1d1c6c28)
		{
			forcestreamxmodel(modelname, -1, 1);
		}
	}
	else
	{
		foreach(modelname in level.var_1d1c6c28)
		{
			stopforcestreamingxmodel(modelname);
		}
	}
}

/*
	Name: force_stream_magicbox
	Namespace: zm_magicbox
	Checksum: 0x3A0FF776
	Offset: 0x838
	Size: 0xA4
	Parameters: 7
	Flags: Linked
*/
function force_stream_magicbox(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	var_d80c44f = self zbarriergetpiece(2);
	if(bwastimejump)
	{
		forcestreamxmodel(var_d80c44f.model);
	}
	else
	{
		stopforcestreamingxmodel(var_d80c44f.model);
	}
}

/*
	Name: force_stream_magicbox_leave
	Namespace: zm_magicbox
	Checksum: 0x1F47DC45
	Offset: 0x8E8
	Size: 0xA4
	Parameters: 7
	Flags: Linked
*/
function force_stream_magicbox_leave(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	var_e6289732 = self zbarriergetpiece(1);
	if(bwastimejump)
	{
		forcestreamxmodel(var_e6289732.model);
	}
	else
	{
		stopforcestreamingxmodel(var_e6289732.model);
	}
}

/*
	Name: magicbox_show_sounds_callback
	Namespace: zm_magicbox
	Checksum: 0x2D665327
	Offset: 0x998
	Size: 0x64
	Parameters: 7
	Flags: Linked
*/
function magicbox_show_sounds_callback(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	playsound(bwastimejump, #"zmb_box_poof_land", self.origin);
}

/*
	Name: magicbox_leave_sounds_callback
	Namespace: zm_magicbox
	Checksum: 0xE0252C40
	Offset: 0xA08
	Size: 0x64
	Parameters: 7
	Flags: Linked
*/
function magicbox_leave_sounds_callback(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	audio::stoploopat(#"hash_1b59c1bfb1aa5d37", self.origin);
}

/*
	Name: function_8f69e904
	Namespace: zm_magicbox
	Checksum: 0x154D1C44
	Offset: 0xA78
	Size: 0x5C
	Parameters: 7
	Flags: Linked
*/
function function_8f69e904(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self thread function_b4b9937(fieldname, bwastimejump, "opened");
}

/*
	Name: function_9253a233
	Namespace: zm_magicbox
	Checksum: 0x4069D3AE
	Offset: 0xAE0
	Size: 0x5C
	Parameters: 7
	Flags: Linked
*/
function function_9253a233(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self thread function_b4b9937(fieldname, bwastimejump, "closed");
}

/*
	Name: function_68f67f85
	Namespace: zm_magicbox
	Checksum: 0xE115C7F5
	Offset: 0xB48
	Size: 0x64
	Parameters: 7
	Flags: Linked
*/
function function_68f67f85(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self thread function_b4b9937(bwastimejump, 1, "leave");
}

/*
	Name: function_b4b9937
	Namespace: zm_magicbox
	Checksum: 0x463432A6
	Offset: 0xBB8
	Size: 0x5B8
	Parameters: 3
	Flags: Linked
*/
function function_b4b9937(localclientnum, newval, str_state)
{
	if(!isdefined(self.var_7e616d59))
	{
		self.var_7e616d59 = [];
	}
	if(!isdefined(self.var_93e0dfa9))
	{
		self.var_93e0dfa9 = [];
	}
	if(!isdefined(self.var_6bcfabea))
	{
		self.var_6bcfabea = [];
	}
	if(localclientnum != 0)
	{
		return;
	}
	if(isdefined(self))
	{
		if(!isdefined(self.var_7e616d59[localclientnum]))
		{
			var_e0f13b51 = self zbarriergetpiece(2);
			v_tag_origin = var_e0f13b51 gettagorigin("tag_fx");
			v_tag_angles = var_e0f13b51 gettagangles("tag_fx");
			if(!isdefined(v_tag_origin))
			{
				v_tag_origin = var_e0f13b51 gettagorigin("tag_origin");
				v_tag_angles = var_e0f13b51 gettagangles("tag_origin");
			}
			if(isdefined(level.var_4016a739))
			{
				v_tag_angles = v_tag_angles + level.var_4016a739;
			}
			var_5b1d3ef = util::spawn_model(localclientnum, #"tag_origin", v_tag_origin, v_tag_angles);
			self.var_7e616d59[localclientnum] = var_5b1d3ef;
			waitframe(1);
		}
		if(isdefined(self) && !isdefined(self.var_93e0dfa9[localclientnum]))
		{
			v_tag_angles = self.angles;
			if(isdefined(level.var_4016a739))
			{
				v_tag_angles = v_tag_angles + level.var_4016a739;
			}
			fx_obj = util::spawn_model(localclientnum, #"tag_origin", self.origin, v_tag_angles);
			self.var_93e0dfa9[localclientnum] = fx_obj;
			waitframe(1);
		}
		if(isdefined(self) && !isdefined(self.var_ed9e4472))
		{
			self function_be9ece7("open");
			self.var_ed9e4472 = self zbarriergetpiece(1);
			self.var_ed9e4472.var_fc558e74 = "magicbox";
			if(isdefined(var_e0f13b51))
			{
				var_e0f13b51.var_fc558e74 = "magicbox";
			}
			waitframe(1);
		}
		if(isdefined(self) && (str_state == "opened" || str_state == "closed"))
		{
			self function_d7e80953(localclientnum, newval, str_state);
			if(newval)
			{
				switch(str_state)
				{
					case "opened":
					{
						str_fx = level._effect[#"hash_63f729c169af0c3e"];
						var_4c5fde13 = self.var_7e616d59[localclientnum];
						str_tag = "tag_origin";
						audio::playloopat(#"hash_1b59c1bfb1aa5d37", self.origin);
						break;
					}
					case "closed":
					{
						str_fx = level._effect[#"chest_light_closed"];
						var_4c5fde13 = self.var_93e0dfa9[localclientnum];
						str_tag = "tag_origin";
						audio::stoploopat(#"hash_1b59c1bfb1aa5d37", self.origin);
						break;
					}
				}
				if(isdefined(str_fx))
				{
					self.var_37becd64 = str_state;
					self.var_6bcfabea[localclientnum] = util::playfxontag(localclientnum, str_fx, var_4c5fde13, str_tag);
					self function_be97e893(localclientnum);
				}
			}
		}
		else if(isdefined(self) && str_state == "leave")
		{
			audio::stoploopat(#"hash_1b59c1bfb1aa5d37", self.origin);
			var_e5fdeba3 = [2:self zbarriergetpiece(2), 1:self zbarriergetpiece(1), 0:self zbarriergetpiece(0)];
			foreach(piece in var_e5fdeba3)
			{
				ping::function_f4f18dac(localclientnum, piece);
			}
		}
	}
}

/*
	Name: function_be97e893
	Namespace: zm_magicbox
	Checksum: 0x1C451FE0
	Offset: 0x1178
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function function_be97e893(localclientnum)
{
	self endon(#"end_demo_jump_listener");
	level waittill(#"demo_jump");
	if(isdefined(self))
	{
		self function_d7e80953(localclientnum, 1);
	}
}

/*
	Name: function_d7e80953
	Namespace: zm_magicbox
	Checksum: 0x95C2704F
	Offset: 0x11E0
	Size: 0xA6
	Parameters: 3
	Flags: Linked
*/
function function_d7e80953(localclientnum, newval, str_state)
{
	if(isdefined(self) && isdefined(self.var_6bcfabea[localclientnum]))
	{
		if(newval || (!newval && self.var_37becd64 === str_state))
		{
			stopfx(localclientnum, self.var_6bcfabea[localclientnum]);
			self.var_6bcfabea[localclientnum] = undefined;
		}
	}
	self notify(#"end_demo_jump_listener");
}

/*
	Name: function_b5807489
	Namespace: zm_magicbox
	Checksum: 0xEB1F690
	Offset: 0x1290
	Size: 0x104
	Parameters: 7
	Flags: Linked
*/
function function_b5807489(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(isdefined(self))
	{
		if(bwastimejump)
		{
			mdl_piece = self zbarriergetpiece(1);
			mdl_piece.tag_origin = mdl_piece gettagorigin("tag_origin");
			self.var_788272f2 = util::playfxontag(fieldname, level._effect[#"fire_runner"], mdl_piece, "tag_origin");
		}
		else if(isdefined(self.var_788272f2))
		{
			stopfx(fieldname, self.var_788272f2);
		}
	}
}

/*
	Name: function_abe84c14
	Namespace: zm_magicbox
	Checksum: 0xBB057EBD
	Offset: 0x13A0
	Size: 0x41A
	Parameters: 7
	Flags: Linked
*/
function function_abe84c14(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	mdl_piece = self zbarriergetpiece(2);
	switch(bwastimejump)
	{
		case 1:
		{
			self.var_5ad9ac45 = util::playfxontag(fieldname, level._effect[#"hash_6778cbcf34bfebef"], mdl_piece, "tag_origin");
			break;
		}
		case 2:
		{
			self.var_5ad9ac45 = util::playfxontag(fieldname, level._effect[#"hash_5f2da0ff081c1699"], mdl_piece, "tag_origin");
			break;
		}
		case 3:
		{
			self.var_5ad9ac45 = util::playfxontag(fieldname, level._effect[#"hash_63697be07cc11490"], mdl_piece, "tag_origin");
			playsound(fieldname, #"hash_604498b9077301d9", self.origin);
			break;
		}
		case 4:
		{
			self.var_5ad9ac45 = util::playfxontag(fieldname, level._effect[#"hash_360e9275d6096589"], mdl_piece, "tag_origin");
			playsound(fieldname, #"hash_6c870d0f85573f60", self.origin);
			break;
		}
		case 5:
		{
			self.var_5ad9ac45 = util::playfxontag(fieldname, level._effect[#"hash_66be32f919d8b4a4"], mdl_piece, "tag_origin");
			playsound(fieldname, #"hash_65ae6ba40cb558cd", self.origin);
			break;
		}
		case 6:
		{
			self.var_5ad9ac45 = util::playfxontag(fieldname, level._effect[#"hash_638a4ec653717ef6"], mdl_piece, "tag_origin");
			playsound(fieldname, #"hash_66f3cff29be77acd", self.origin);
			break;
		}
		case 7:
		{
			self.var_5ad9ac45 = util::playfxontag(fieldname, level._effect[#"hash_1fa861cbe30adda9"], mdl_piece, "tag_origin");
			playsound(fieldname, #"hash_30dce35bee22371a", self.origin);
			break;
		}
		case 0:
		default:
		{
			if(isdefined(self.var_5ad9ac45))
			{
				stopfx(fieldname, self.var_5ad9ac45);
				self.var_5ad9ac45 = undefined;
				audio::stoploopat(#"hash_1b59c1bfb1aa5d37", self.origin);
			}
		}
	}
}

