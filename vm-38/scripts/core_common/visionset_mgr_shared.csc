#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace visionset_mgr_shared;

/*
	Name: function_348f299d
	Namespace: visionset_mgr_shared
	Checksum: 0xA9821AF7
	Offset: 0x168
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_348f299d()
{
	level notify(1301534249);
}

#namespace visionset_mgr;

/*
	Name: function_89f2df9
	Namespace: visionset_mgr
	Checksum: 0xFC14CD32
	Offset: 0x188
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"visionset_mgr", &function_70a657d8, &finalize_initialization, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: visionset_mgr
	Checksum: 0x30D54903
	Offset: 0x1E0
	Size: 0x1FC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.vsmgr_initializing = 1;
	level.vsmgr_default_info_name = "__none";
	level.vsmgr = [];
	level.vsmgr_states_inited = [];
	level._fv2vs_unset_visionset = "default";
	level._fv2vs_prev_visionsets = [];
	level._fv2vs_prev_visionsets[0] = level._fv2vs_unset_visionset;
	level._fv2vs_prev_visionsets[1] = level._fv2vs_unset_visionset;
	level._fv2vs_prev_visionsets[2] = level._fv2vs_unset_visionset;
	level._fv2vs_prev_visionsets[3] = level._fv2vs_unset_visionset;
	level._fv2vs_force_instant_transition = [];
	level._fv2vs_force_instant_transition[0] = 0;
	level._fv2vs_force_instant_transition[1] = 0;
	level._fv2vs_force_instant_transition[2] = 0;
	level._fv2vs_force_instant_transition[3] = 0;
	level thread register_type("visionset", &visionset_slot_cb, &visionset_lerp_cb, &visionset_update_cb);
	register_visionset_info(level.vsmgr_default_info_name, 1, 1, "undefined", "undefined");
	level thread register_type("overlay", &overlay_slot_cb, &overlay_lerp_cb, &overlay_update_cb);
	register_overlay_info_style_none(level.vsmgr_default_info_name, 1, 1);
	level thread monitor();
}

/*
	Name: register_visionset_info
	Namespace: visionset_mgr
	Checksum: 0x1FD27601
	Offset: 0x3E8
	Size: 0xF6
	Parameters: 6
	Flags: Linked
*/
function register_visionset_info(name, version, lerp_step_count, visionset_from, visionset_to, visionset_type)
{
	if(!isdefined(visionset_type))
	{
		visionset_type = 0;
	}
	if(!register_info("visionset", name, version, lerp_step_count))
	{
		return;
	}
	level.vsmgr[#"visionset"].info[name].visionset_from = visionset_from;
	level.vsmgr[#"visionset"].info[name].visionset_to = visionset_to;
	level.vsmgr[#"visionset"].info[name].visionset_type = visionset_type;
}

/*
	Name: register_overlay_info_style_none
	Namespace: visionset_mgr
	Checksum: 0x73C69C4C
	Offset: 0x4E8
	Size: 0x6E
	Parameters: 3
	Flags: Linked
*/
function register_overlay_info_style_none(name, version, lerp_step_count)
{
	if(!register_info("overlay", name, version, lerp_step_count))
	{
		return;
	}
	level.vsmgr[#"overlay"].info[name].style = 0;
}

/*
	Name: register_overlay_info_style_blur
	Namespace: visionset_mgr
	Checksum: 0x27A528CD
	Offset: 0x560
	Size: 0x34
	Parameters: 6
	Flags: None
*/
function register_overlay_info_style_blur(name, version, lerp_step_count, transition_in, transition_out, magnitude)
{
}

/*
	Name: register_overlay_info_style_burn
	Namespace: visionset_mgr
	Checksum: 0x999F1C71
	Offset: 0x5A0
	Size: 0x24
	Parameters: 4
	Flags: None
*/
function register_overlay_info_style_burn(name, version, lerp_step_count, duration)
{
}

/*
	Name: register_overlay_info_style_speed_blur
	Namespace: visionset_mgr
	Checksum: 0x6727F95F
	Offset: 0x5D0
	Size: 0x22E
	Parameters: 11
	Flags: Linked
*/
function register_overlay_info_style_speed_blur(name, version, lerp_step_count, amount, inner_radius, outer_radius, velocity_should_scale, velocity_scale, blur_in, blur_out, should_offset)
{
	if(!register_info("overlay", name, version, lerp_step_count))
	{
		return;
	}
	level.vsmgr[#"overlay"].info[name].style = 8;
	level.vsmgr[#"overlay"].info[name].amount = amount;
	level.vsmgr[#"overlay"].info[name].inner_radius = inner_radius;
	level.vsmgr[#"overlay"].info[name].outer_radius = outer_radius;
	level.vsmgr[#"overlay"].info[name].velocity_should_scale = velocity_should_scale;
	level.vsmgr[#"overlay"].info[name].velocity_scale = velocity_scale;
	level.vsmgr[#"overlay"].info[name].blur_in = blur_in;
	level.vsmgr[#"overlay"].info[name].blur_out = blur_out;
	level.vsmgr[#"overlay"].info[name].should_offset = should_offset;
}

/*
	Name: register_overlay_info_style_postfx_bundle
	Namespace: visionset_mgr
	Checksum: 0xC6F59760
	Offset: 0x808
	Size: 0xDE
	Parameters: 5
	Flags: Linked
*/
function register_overlay_info_style_postfx_bundle(name, version, lerp_step_count, bundle, duration)
{
	if(!register_info("overlay", name, version, lerp_step_count))
	{
		return;
	}
	level.vsmgr[#"overlay"].info[name].style = 1;
	level.vsmgr[#"overlay"].info[name].bundle = bundle;
	level.vsmgr[#"overlay"].info[name].duration = duration;
}

/*
	Name: is_type_currently_default
	Namespace: visionset_mgr
	Checksum: 0x4559922A
	Offset: 0x8F0
	Size: 0x9C
	Parameters: 2
	Flags: None
*/
function is_type_currently_default(localclientnum, type)
{
	if(!level.vsmgr[type].in_use)
	{
		return 1;
	}
	state = get_state(localclientnum, type);
	if(isdefined(state))
	{
		curr_info = get_info(type, state.curr_slot);
		return curr_info.name === level.vsmgr_default_info_name;
	}
	return 0;
}

/*
	Name: register_type
	Namespace: visionset_mgr
	Checksum: 0x3E729CF2
	Offset: 0x998
	Size: 0x18A
	Parameters: 4
	Flags: Linked
*/
function register_type(type, cf_slot_cb, cf_lerp_cb, update_cb)
{
	level.vsmgr[type] = spawnstruct();
	level.vsmgr[type].type = type;
	level.vsmgr[type].in_use = 0;
	level.vsmgr[type].highest_version = 0;
	level.vsmgr[type].server_version = getserverhighestclientfieldversion();
	level.vsmgr[type].cf_slot_name = type + "_slot";
	level.vsmgr[type].cf_lerp_name = type + "_lerp";
	level.vsmgr[type].cf_slot_cb = cf_slot_cb;
	level.vsmgr[type].cf_lerp_cb = cf_lerp_cb;
	level.vsmgr[type].update_cb = update_cb;
	level.vsmgr[type].info = [];
	level.vsmgr[type].sorted_name_keys = [];
}

/*
	Name: finalize_initialization
	Namespace: visionset_mgr
	Checksum: 0xEA42040F
	Offset: 0xB30
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function finalize_initialization(localclientnum)
{
	finalize_clientfields();
}

/*
	Name: finalize_clientfields
	Namespace: visionset_mgr
	Checksum: 0x767AA55C
	Offset: 0xB58
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function finalize_clientfields()
{
	foreach(v in level.vsmgr)
	{
		v thread finalize_type_clientfields();
	}
	level.vsmgr_initializing = 0;
}

/*
	Name: finalize_type_clientfields
	Namespace: visionset_mgr
	Checksum: 0x330EBA43
	Offset: 0xBF8
	Size: 0x254
	Parameters: 0
	Flags: Linked
*/
function finalize_type_clientfields()
{
	/#
		println(("" + self.type) + "");
	#/
	if(1 >= self.info.size)
	{
		return;
	}
	self.in_use = 1;
	self.cf_slot_bit_count = getminbitcountfornum(self.info.size - 1);
	self.cf_lerp_bit_count = self.info[self.sorted_name_keys[0]].lerp_bit_count;
	for(i = 0; i < self.sorted_name_keys.size; i++)
	{
		self.info[self.sorted_name_keys[i]].slot_index = i;
		if(self.info[self.sorted_name_keys[i]].lerp_bit_count > self.cf_lerp_bit_count)
		{
			self.cf_lerp_bit_count = self.info[self.sorted_name_keys[i]].lerp_bit_count;
		}
		/#
			println(((((("" + self.info[self.sorted_name_keys[i]].name) + "") + self.info[self.sorted_name_keys[i]].version) + "") + self.info[self.sorted_name_keys[i]].lerp_step_count) + "");
		#/
	}
	clientfield::register("toplayer", self.cf_slot_name, self.highest_version, self.cf_slot_bit_count, "int", self.cf_slot_cb, 0, 1);
	if(1 < self.cf_lerp_bit_count)
	{
		clientfield::register("toplayer", self.cf_lerp_name, self.highest_version, self.cf_lerp_bit_count, "float", self.cf_lerp_cb, 0, 1);
	}
}

/*
	Name: validate_info
	Namespace: visionset_mgr
	Checksum: 0x90F01B44
	Offset: 0xE58
	Size: 0x14C
	Parameters: 3
	Flags: Linked
*/
function validate_info(type, name, version)
{
	keys = getarraykeys(level.vsmgr);
	for(i = 0; i < keys.size; i++)
	{
		if(type == keys[i])
		{
			break;
		}
	}
	/#
		assert(i < keys.size, ("" + type) + "");
	#/
	if(version > level.vsmgr[type].server_version)
	{
		return false;
	}
	if(isdefined(level.vsmgr[type].info[name]) && version < level.vsmgr[type].info[name].version)
	{
		if(version < level.vsmgr[type].info[name].version)
		{
			return false;
		}
		level.vsmgr[type].info[name] = undefined;
	}
	return true;
}

/*
	Name: add_sorted_name_key
	Namespace: visionset_mgr
	Checksum: 0x65DBB0D6
	Offset: 0xFB0
	Size: 0x94
	Parameters: 2
	Flags: Linked
*/
function add_sorted_name_key(type, name)
{
	for(i = 0; i < level.vsmgr[type].sorted_name_keys.size; i++)
	{
		if(name < level.vsmgr[type].sorted_name_keys[i])
		{
			break;
		}
	}
	arrayinsert(level.vsmgr[type].sorted_name_keys, name, i);
}

/*
	Name: add_info
	Namespace: visionset_mgr
	Checksum: 0xC1658FB8
	Offset: 0x1050
	Size: 0x72
	Parameters: 4
	Flags: Linked
*/
function add_info(type, name, version, lerp_step_count)
{
	self.type = type;
	self.name = name;
	self.version = version;
	self.lerp_step_count = lerp_step_count;
	self.lerp_bit_count = getminbitcountfornum(lerp_step_count);
}

/*
	Name: register_info
	Namespace: visionset_mgr
	Checksum: 0x83235FF3
	Offset: 0x10D0
	Size: 0x13A
	Parameters: 4
	Flags: Linked
*/
function register_info(type, name, version, lerp_step_count)
{
	/#
		assert(level.vsmgr_initializing, "");
	#/
	lower_name = tolower(name);
	if(!validate_info(type, lower_name, version))
	{
		return false;
	}
	add_sorted_name_key(type, lower_name);
	level.vsmgr[type].info[lower_name] = spawnstruct();
	level.vsmgr[type].info[lower_name] add_info(type, lower_name, version, lerp_step_count);
	if(version > level.vsmgr[type].highest_version)
	{
		level.vsmgr[type].highest_version = version;
	}
	return true;
}

/*
	Name: slot_cb
	Namespace: visionset_mgr
	Checksum: 0x8B6678EB
	Offset: 0x1218
	Size: 0xD0
	Parameters: 8
	Flags: Linked
*/
function slot_cb(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump, type)
{
	init_states(bnewent);
	level.vsmgr[type].state[bnewent].curr_slot = binitialsnap;
	if(fieldname || bwastimejump)
	{
		level.vsmgr[type].state[bnewent].force_update = 1;
	}
	level notify(#"hash_4dea82d5e85dfc");
}

/*
	Name: visionset_slot_cb
	Namespace: visionset_mgr
	Checksum: 0x5AC7F9C9
	Offset: 0x12F0
	Size: 0x6C
	Parameters: 7
	Flags: Linked
*/
function visionset_slot_cb(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self slot_cb(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump, "visionset");
}

/*
	Name: overlay_slot_cb
	Namespace: visionset_mgr
	Checksum: 0xDC6E456B
	Offset: 0x1368
	Size: 0x6C
	Parameters: 7
	Flags: Linked
*/
function overlay_slot_cb(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self slot_cb(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump, "overlay");
}

/*
	Name: lerp_cb
	Namespace: visionset_mgr
	Checksum: 0xADB25782
	Offset: 0x13E0
	Size: 0xD0
	Parameters: 8
	Flags: Linked
*/
function lerp_cb(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump, type)
{
	init_states(bnewent);
	level.vsmgr[type].state[bnewent].curr_lerp = binitialsnap;
	if(fieldname || bwastimejump)
	{
		level.vsmgr[type].state[bnewent].force_update = 1;
	}
	level notify(#"hash_4dea82d5e85dfc");
}

/*
	Name: visionset_lerp_cb
	Namespace: visionset_mgr
	Checksum: 0x9A627B3D
	Offset: 0x14B8
	Size: 0x6C
	Parameters: 7
	Flags: Linked
*/
function visionset_lerp_cb(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self lerp_cb(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump, "visionset");
}

/*
	Name: overlay_lerp_cb
	Namespace: visionset_mgr
	Checksum: 0xC0443F3E
	Offset: 0x1530
	Size: 0x6C
	Parameters: 7
	Flags: Linked
*/
function overlay_lerp_cb(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self lerp_cb(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump, "overlay");
}

/*
	Name: get_info
	Namespace: visionset_mgr
	Checksum: 0x9FD50446
	Offset: 0x15A8
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function get_info(type, slot)
{
	return level.vsmgr[type].info[level.vsmgr[type].sorted_name_keys[slot]];
}

/*
	Name: get_state
	Namespace: visionset_mgr
	Checksum: 0xD4F51E9B
	Offset: 0x15F8
	Size: 0x4C
	Parameters: 2
	Flags: Linked
*/
function get_state(localclientnum, type)
{
	if(!isdefined(level.vsmgr[type].state))
	{
		return undefined;
	}
	return level.vsmgr[type].state[localclientnum];
}

/*
	Name: should_update_state
	Namespace: visionset_mgr
	Checksum: 0x9C736E85
	Offset: 0x1650
	Size: 0x3A
	Parameters: 0
	Flags: Linked
*/
function should_update_state()
{
	return self.force_update || self.prev_slot != self.curr_slot || self.prev_lerp != self.curr_lerp;
}

/*
	Name: transition_state
	Namespace: visionset_mgr
	Checksum: 0xB489B752
	Offset: 0x1698
	Size: 0x2E
	Parameters: 0
	Flags: Linked
*/
function transition_state()
{
	self.prev_slot = self.curr_slot;
	self.prev_lerp = self.curr_lerp;
	self.force_update = 0;
}

/*
	Name: init_states
	Namespace: visionset_mgr
	Checksum: 0x3BE22ABE
	Offset: 0x16D0
	Size: 0x1A0
	Parameters: 1
	Flags: Linked
*/
function init_states(localclientnum)
{
	if(isdefined(level.vsmgr_states_inited[localclientnum]))
	{
		return;
	}
	foreach(v in level.vsmgr)
	{
		if(!v.in_use)
		{
			continue;
		}
		if(!isdefined(v.state))
		{
			v.state = [];
		}
		v.state[localclientnum] = spawnstruct();
		v.state[localclientnum].prev_slot = v.info[level.vsmgr_default_info_name].slot_index;
		v.state[localclientnum].curr_slot = v.info[level.vsmgr_default_info_name].slot_index;
		v.state[localclientnum].prev_lerp = 1;
		v.state[localclientnum].curr_lerp = 1;
		v.state[localclientnum].force_update = 0;
	}
	level.vsmgr_states_inited[localclientnum] = 1;
}

/*
	Name: demo_jump_monitor
	Namespace: visionset_mgr
	Checksum: 0xC19B0AAF
	Offset: 0x1878
	Size: 0x124
	Parameters: 0
	Flags: Linked
*/
function demo_jump_monitor()
{
	if(!level.isdemoplaying)
	{
		return;
	}
	oldlerps = [];
	while(true)
	{
		level waittill(#"demo_jump", #"demo_player_switch", #"visionset_mgr_reset");
		foreach(v in level.vsmgr)
		{
			if(!v.in_use)
			{
				continue;
			}
			if(isdefined(v.state))
			{
				v.state[0].force_update = 1;
			}
		}
		level notify(#"hash_4dea82d5e85dfc");
	}
}

/*
	Name: demo_spectate_monitor
	Namespace: visionset_mgr
	Checksum: 0x3F0249E9
	Offset: 0x19A8
	Size: 0xBE
	Parameters: 0
	Flags: Linked
*/
function demo_spectate_monitor()
{
	if(!level.isdemoplaying)
	{
		return;
	}
	while(true)
	{
		if(function_65b9eb0f(0))
		{
			if(!is_true(level.vsmgr_is_spectating))
			{
				level notify(#"visionset_mgr_reset");
			}
			level.vsmgr_is_spectating = 1;
		}
		else
		{
			if(is_true(level.vsmgr_is_spectating))
			{
				level notify(#"visionset_mgr_reset");
			}
			level.vsmgr_is_spectating = 0;
		}
		waitframe(1);
	}
}

/*
	Name: monitor
	Namespace: visionset_mgr
	Checksum: 0xF1BD95E7
	Offset: 0x1A70
	Size: 0x1A4
	Parameters: 0
	Flags: Linked
*/
function monitor()
{
	while(level.vsmgr_initializing)
	{
		waitframe(1);
	}
	if(is_true(level.isdemoplaying))
	{
		level thread demo_spectate_monitor();
		level thread demo_jump_monitor();
	}
	while(true)
	{
		level waittill(#"hash_4dea82d5e85dfc");
		foreach(v in level.vsmgr)
		{
			if(!v.in_use)
			{
				continue;
			}
			for(localclientnum = 0; localclientnum < level.localplayers.size; localclientnum++)
			{
				init_states(localclientnum);
				if(v.state[localclientnum] should_update_state())
				{
					v thread [[v.update_cb]](localclientnum, k);
					v.state[localclientnum] transition_state();
				}
			}
		}
	}
}

/*
	Name: killcam_visionset_vehicle_mismatch
	Namespace: visionset_mgr
	Checksum: 0x49DA9765
	Offset: 0x1C20
	Size: 0x4E
	Parameters: 3
	Flags: Linked
*/
function killcam_visionset_vehicle_mismatch(visionset_to, visionset_vehicle, vehicletype)
{
	if(visionset_to == visionset_vehicle)
	{
		if(isdefined(self.vehicletype) && self.vehicletype != vehicletype)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: killcam_visionset_player_mismatch
	Namespace: visionset_mgr
	Checksum: 0xB4C7914C
	Offset: 0x1C78
	Size: 0x3E
	Parameters: 2
	Flags: Linked
*/
function killcam_visionset_player_mismatch(visionset_to, visionset_vehicle)
{
	if(visionset_to == visionset_vehicle)
	{
		if(!isplayer(self))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: visionset_update_cb
	Namespace: visionset_mgr
	Checksum: 0x50BE6ECF
	Offset: 0x1CC0
	Size: 0x31C
	Parameters: 2
	Flags: Linked
*/
function visionset_update_cb(localclientnum, type)
{
	state = get_state(localclientnum, type);
	curr_info = get_info(type, state.curr_slot);
	prev_info = get_info(type, state.prev_slot);
	/#
	#/
	if(is_true(level.isdemoplaying) && function_65b9eb0f(localclientnum))
	{
		visionsetnaked(localclientnum, "default", 0);
		return;
	}
	if(level.vsmgr_default_info_name == curr_info.name)
	{
		return;
	}
	if(function_1cbf351b(localclientnum))
	{
		if(isdefined(curr_info.visionset_to))
		{
			killcament = function_93e0f729(localclientnum);
			if(isdefined(killcament))
			{
				if(curr_info.visionset_to == "mp_vehicles_agr" || curr_info.visionset_to == "mp_hellstorm")
				{
					if(killcament.type == "vehicle")
					{
						return;
					}
				}
				if(killcament killcam_visionset_vehicle_mismatch(curr_info.visionset_to, "mp_vehicles_dart", "veh_dart_mp"))
				{
					return;
				}
				if(killcament killcam_visionset_player_mismatch(curr_info.visionset_to, "mp_vehicles_turret"))
				{
					return;
				}
				if(killcament killcam_visionset_player_mismatch(curr_info.visionset_to, "mp_vehicles_sentinel"))
				{
					return;
				}
			}
		}
	}
	if(!isdefined(curr_info.visionset_from))
	{
		if(curr_info.visionset_type == 6)
		{
			visionsetlaststandlerp(localclientnum, curr_info.visionset_to, level._fv2vs_prev_visionsets[localclientnum], state.curr_lerp);
		}
		else
		{
			visionsetnakedlerp(localclientnum, curr_info.visionset_to, level._fv2vs_prev_visionsets[localclientnum], state.curr_lerp);
		}
	}
	else
	{
		if(curr_info.visionset_type == 6)
		{
			visionsetlaststandlerp(localclientnum, curr_info.visionset_to, curr_info.visionset_from, state.curr_lerp);
		}
		else
		{
			visionsetnakedlerp(localclientnum, curr_info.visionset_to, curr_info.visionset_from, state.curr_lerp);
		}
	}
}

/*
	Name: overlay_update_cb
	Namespace: visionset_mgr
	Checksum: 0x906A1F80
	Offset: 0x1FE8
	Size: 0x51A
	Parameters: 2
	Flags: Linked
*/
function overlay_update_cb(localclientnum, type)
{
	state = get_state(localclientnum, type);
	if(!isdefined(state))
	{
		return;
	}
	curr_info = get_info(type, state.curr_slot);
	prev_info = get_info(type, state.prev_slot);
	player = level.localplayers[localclientnum];
	/#
	#/
	if(state.force_update || state.prev_slot != state.curr_slot)
	{
		switch(prev_info.style)
		{
			case 0:
			{
				break;
			}
			case 1:
			{
				player thread postfx::exitpostfxbundle(prev_info.bundle);
				break;
			}
			case 3:
			{
				setblurbylocalclientnum(localclientnum, 0, prev_info.transition_out);
				break;
			}
			case 8:
			{
				disablespeedblur(localclientnum);
				break;
			}
		}
	}
	if(is_true(level.isdemoplaying) && !function_65b9eb0f(localclientnum))
	{
		return;
	}
	switch(curr_info.style)
	{
		case 0:
		{
			break;
		}
		case 1:
		{
			if(state.force_update || state.prev_slot != state.curr_slot || state.prev_lerp <= state.curr_lerp)
			{
				player thread postfx::playpostfxbundle(curr_info.bundle);
			}
			break;
		}
		case 3:
		{
			if(state.force_update || state.prev_slot != state.curr_slot || state.prev_lerp <= state.curr_lerp)
			{
				setblurbylocalclientnum(localclientnum, curr_info.magnitude, curr_info.transition_in);
			}
			break;
		}
		case 8:
		{
			if(state.force_update || state.prev_slot != state.curr_slot || state.prev_lerp <= state.curr_lerp)
			{
				if(isdefined(curr_info.should_offset))
				{
					enablespeedblur(localclientnum, curr_info.amount, curr_info.inner_radius, curr_info.outer_radius, curr_info.velocity_should_scale, curr_info.velocity_scale, curr_info.blur_in, curr_info.blur_out, curr_info.should_offset);
				}
				else
				{
					if(isdefined(curr_info.blur_out))
					{
						enablespeedblur(localclientnum, curr_info.amount, curr_info.inner_radius, curr_info.outer_radius, curr_info.velocity_should_scale, curr_info.velocity_scale, curr_info.blur_in, curr_info.blur_out);
					}
					else
					{
						if(isdefined(curr_info.blur_in))
						{
							enablespeedblur(localclientnum, curr_info.amount, curr_info.inner_radius, curr_info.outer_radius, curr_info.velocity_should_scale, curr_info.velocity_scale, curr_info.blur_in);
						}
						else
						{
							if(isdefined(curr_info.velocity_scale))
							{
								enablespeedblur(localclientnum, curr_info.amount, curr_info.inner_radius, curr_info.outer_radius, curr_info.velocity_should_scale, curr_info.velocity_scale);
							}
							else
							{
								if(isdefined(curr_info.velocity_should_scale))
								{
									enablespeedblur(localclientnum, curr_info.amount, curr_info.inner_radius, curr_info.outer_radius, curr_info.velocity_should_scale);
								}
								else
								{
									enablespeedblur(localclientnum, curr_info.amount, curr_info.inner_radius, curr_info.outer_radius);
								}
							}
						}
					}
				}
			}
			break;
		}
	}
}

