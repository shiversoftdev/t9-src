#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace fx;

/*
	Name: set_forward_and_up_vectors
	Namespace: fx
	Checksum: 0xEF0DBFFF
	Offset: 0x260
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function set_forward_and_up_vectors()
{
	self.v[#"up"] = anglestoup(self.v[#"angles"]);
	self.v[#"forward"] = anglestoforward(self.v[#"angles"]);
}

/*
	Name: get
	Namespace: fx
	Checksum: 0xE60DCAF5
	Offset: 0x2F0
	Size: 0x36
	Parameters: 1
	Flags: Linked
*/
function get(fx)
{
	if(isdefined(level._effect[fx]))
	{
		return level._effect[fx];
	}
	return fx;
}

/*
	Name: create_effect
	Namespace: fx
	Checksum: 0x5378F690
	Offset: 0x330
	Size: 0x136
	Parameters: 2
	Flags: Linked
*/
function create_effect(type, fxid)
{
	ent = undefined;
	if(!isdefined(level.createfxent))
	{
		level.createfxent = [];
	}
	if(type == "exploder")
	{
		ent = spawnstruct();
	}
	else
	{
		if(!isdefined(level._fake_createfx_struct))
		{
			level._fake_createfx_struct = spawnstruct();
		}
		ent = level._fake_createfx_struct;
	}
	level.createfxent[level.createfxent.size] = ent;
	ent.v = [];
	ent.v[#"type"] = type;
	ent.v[#"fxid"] = fxid;
	ent.v[#"angles"] = (0, 0, 0);
	ent.v[#"origin"] = (0, 0, 0);
	ent.drawn = 1;
	return ent;
}

/*
	Name: create_loop_effect
	Namespace: fx
	Checksum: 0xCB38F8B9
	Offset: 0x470
	Size: 0x50
	Parameters: 1
	Flags: None
*/
function create_loop_effect(fxid)
{
	ent = create_effect("loopfx", fxid);
	ent.v[#"delay"] = 0.5;
	return ent;
}

/*
	Name: create_oneshot_effect
	Namespace: fx
	Checksum: 0xA56694F3
	Offset: 0x4C8
	Size: 0x50
	Parameters: 1
	Flags: None
*/
function create_oneshot_effect(fxid)
{
	ent = create_effect("oneshotfx", fxid);
	ent.v[#"delay"] = -15;
	return ent;
}

/*
	Name: play
	Namespace: fx
	Checksum: 0xD3385C66
	Offset: 0x520
	Size: 0x294
	Parameters: 8
	Flags: Linked
*/
function play(str_fx, v_origin, v_angles, time_to_delete_or_notify, b_link_to_self, str_tag, b_no_cull, b_ignore_pause_world)
{
	if(!isdefined(v_origin))
	{
		v_origin = (0, 0, 0);
	}
	if(!isdefined(v_angles))
	{
		v_angles = (0, 0, 0);
	}
	if(!isdefined(b_link_to_self))
	{
		b_link_to_self = 0;
	}
	self notify(str_fx);
	if(!isdefined(time_to_delete_or_notify) || (!isstring(time_to_delete_or_notify) && !function_7a600918(time_to_delete_or_notify) && time_to_delete_or_notify == -1) && is_true(b_link_to_self) && isdefined(str_tag))
	{
		playfxontag(get(str_fx), self, str_tag, b_ignore_pause_world);
		return self;
	}
	if(isdefined(time_to_delete_or_notify))
	{
		m_fx = util::spawn_model("tag_origin", v_origin, v_angles);
		if(is_true(b_link_to_self))
		{
			if(isdefined(str_tag))
			{
				m_fx linkto(self, str_tag, (0, 0, 0), (0, 0, 0));
			}
			else
			{
				m_fx linkto(self);
			}
		}
		if(is_true(b_no_cull))
		{
			m_fx setforcenocull();
		}
		playfxontag(get(str_fx), m_fx, "tag_origin", b_ignore_pause_world);
		m_fx thread _play_fx_delete(self, time_to_delete_or_notify);
		return m_fx;
	}
	playfx(get(str_fx), v_origin, anglestoforward(v_angles), anglestoup(v_angles), b_ignore_pause_world);
}

/*
	Name: _play_fx_delete
	Namespace: fx
	Checksum: 0x138C7633
	Offset: 0x7C0
	Size: 0xD4
	Parameters: 2
	Flags: Linked
*/
function _play_fx_delete(ent, time_to_delete_or_notify)
{
	if(!isdefined(time_to_delete_or_notify))
	{
		time_to_delete_or_notify = -1;
	}
	if(isstring(time_to_delete_or_notify) || function_7a600918(time_to_delete_or_notify))
	{
		ent waittill(#"death", time_to_delete_or_notify);
	}
	else
	{
		if(time_to_delete_or_notify > 0)
		{
			ent waittilltimeout(time_to_delete_or_notify, #"death");
		}
		else
		{
			ent waittill(#"death");
		}
	}
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: function_70ba68f1
	Namespace: fx
	Checksum: 0xAAEB8B7F
	Offset: 0x8A0
	Size: 0x4FC
	Parameters: 5
	Flags: None
*/
function function_70ba68f1(target, var_486f31cd, var_bef008a5, var_e9f7aace, var_1436aa92)
{
	self flag::set("flag_autofocus_on");
	function_5ac4dc99("_internal_dof_i_target_type", -1);
	function_5ac4dc99("_internal_dof_i_target_entnum", -1);
	function_5ac4dc99("_internal_dof_v_target_origin", (-1, -1, -1));
	function_5ac4dc99("_internal_dof_s_target_tag", "-1");
	function_5ac4dc99("_internal_dof_f_fstop", -1);
	function_5ac4dc99("_internal_dof_f_focus_time", -1);
	function_5ac4dc99("_internal_dof_f_fstop_time", -1);
	function_5ac4dc99("_internal_dof_i_playernum", -1);
	function_5ac4dc99("_internal_dof_i_refcounter", 0);
	if(!isdefined(target))
	{
		return;
	}
	if(isvec(target))
	{
		setdvar(#"_internal_dof_i_target_entnum", -999);
		setdvar(#"_internal_dof_i_target_type", -1);
		setdvar(#"hash_7c405920e0b200ee", target);
	}
	else
	{
		var_3ed74fac = target getentitynumber();
		var_dc3df1b8 = target getentitytype();
		setdvar(#"_internal_dof_i_target_entnum", var_3ed74fac);
		setdvar(#"_internal_dof_i_target_type", var_dc3df1b8);
		setdvar(#"_internal_dof_v_target_origin", (-1, -1, -1));
		if(isdefined(var_1436aa92))
		{
			setdvar(#"_internal_dof_s_target_tag", var_1436aa92);
		}
		else
		{
			setdvar(#"_internal_dof_s_target_tag", "-1");
		}
	}
	if(isdefined(var_486f31cd))
	{
		setdvar(#"_internal_dof_f_fstop", float(var_486f31cd));
	}
	else
	{
		setdvar(#"_internal_dof_f_fstop", -1);
	}
	if(isdefined(var_bef008a5))
	{
		setdvar(#"_internal_dof_f_focus_time", float(var_bef008a5));
	}
	else
	{
		setdvar(#"_internal_dof_f_focus_time", -1);
	}
	if(isdefined(var_e9f7aace))
	{
		setdvar(#"_internal_dof_f_fstop_time", float(var_e9f7aace));
	}
	else
	{
		setdvar(#"_internal_dof_f_fstop_time", -1);
	}
	entnum = self getentitynumber();
	setdvar(#"_internal_dof_i_playernum", entnum);
	refcount = getdvarint(#"_internal_dof_i_refcounter", 0);
	refcount++;
	setdvar(#"_internal_dof_i_refcounter", refcount);
	self thread function_13fa0731();
}

/*
	Name: function_82104e32
	Namespace: fx
	Checksum: 0x5B9C9C4A
	Offset: 0xDA8
	Size: 0x254
	Parameters: 2
	Flags: None
*/
function function_82104e32(var_486f31cd, var_e9f7aace)
{
	self flag::set("flag_autofocus_on");
	function_5ac4dc99("_internal_fob_i_playernum", -1);
	function_5ac4dc99("_internal_fob_f_fstop", -1);
	function_5ac4dc99("_internal_fob_f_fstop_time", -1);
	function_5ac4dc99("_internal_fob_or_dof_i_refcounter", 0);
	function_5ac4dc99("_internal_debug_dof", 0);
	if(isdefined(var_486f31cd))
	{
		setdvar(#"_internal_fob_f_fstop", float(var_486f31cd));
	}
	else
	{
		setdvar(#"_internal_fob_f_fstop", -1);
	}
	if(isdefined(var_e9f7aace))
	{
		setdvar(#"_internal_fob_f_fstop_time", float(var_e9f7aace));
	}
	else
	{
		setdvar(#"_internal_fob_f_fstop_time", -1);
	}
	entnum = self getentitynumber();
	setdvar(#"_internal_fob_i_playernum", entnum);
	refcount = getdvarint(#"_internal_fob_i_refcounter", 0);
	refcount++;
	setdvar(#"_internal_fob_i_refcounter", refcount);
	self thread function_13fa0731();
}

/*
	Name: function_13fa0731
	Namespace: fx
	Checksum: 0x1235B54D
	Offset: 0x1008
	Size: 0x84
	Parameters: 0
	Flags: Linked, Private
*/
function private function_13fa0731()
{
	self notify(#"hash_1481a83e14539c4");
	self endon(#"hash_1481a83e14539c4");
	self endoncallback(&function_e592b635, #"death");
	while(true)
	{
		self flag::wait_till_clear("flag_autofocus_on");
		function_e592b635();
		break;
	}
}

/*
	Name: function_e592b635
	Namespace: fx
	Checksum: 0x8AF00E8A
	Offset: 0x1098
	Size: 0x19C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e592b635(eventstruct)
{
	setdvar(#"_internal_dof_i_playernum", -1);
	setdvar(#"_internal_dof_i_target_type", -1);
	setdvar(#"_internal_dof_i_target_entnum", -1);
	setdvar(#"_internal_dof_v_target_origin", (-1, -1, -1));
	setdvar(#"_internal_dof_s_target_tag", "-1");
	setdvar(#"_internal_dof_f_fstop", -1);
	setdvar(#"_internal_dof_f_focus_time", -1);
	setdvar(#"_internal_dof_f_fstop_time", -1);
	setdvar(#"_internal_fob_i_playernum", -1);
	setdvar(#"_internal_fob_f_fstop", -1);
}

