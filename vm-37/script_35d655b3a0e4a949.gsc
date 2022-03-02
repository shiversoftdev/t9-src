#using scripts\core_common\util_shared.csc;

#namespace ability_util;

/*
	Name: init_aoe_fx_info
	Namespace: ability_util
	Checksum: 0x4F3242F2
	Offset: 0x90
	Size: 0xC0
	Parameters: 1
	Flags: None
*/
function init_aoe_fx_info(aoe_name)
{
	if(!isdefined(level.aoe_fx_info) || !isarray(level.aoe_fx_info))
	{
		level.aoe_fx_info = [];
	}
	if(!isdefined(level.aoe_fx_info[aoe_name]) || !isstruct(level.aoe_fx_info[aoe_name]))
	{
		level.aoe_fx_info[aoe_name] = spawnstruct();
	}
	return level.aoe_fx_info[aoe_name];
}

/*
	Name: get_aoe_fx_info
	Namespace: ability_util
	Checksum: 0xC597ABD3
	Offset: 0x158
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function get_aoe_fx_info(aoe_name)
{
	return level.aoe_fx_info[aoe_name];
}

/*
	Name: init_applied_aoe_fx_info
	Namespace: ability_util
	Checksum: 0x868633FB
	Offset: 0x180
	Size: 0xC0
	Parameters: 1
	Flags: None
*/
function init_applied_aoe_fx_info(aoe_name)
{
	if(!isdefined(level.applied_aoe_fx_info) || !isarray(level.applied_aoe_fx_info))
	{
		level.applied_aoe_fx_info = [];
	}
	if(!isdefined(level.applied_aoe_fx_info[aoe_name]) || !isstruct(level.applied_aoe_fx_info[aoe_name]))
	{
		level.applied_aoe_fx_info[aoe_name] = spawnstruct();
	}
	return level.applied_aoe_fx_info[aoe_name];
}

/*
	Name: update_applied_aoe_fx
	Namespace: ability_util
	Checksum: 0xA5E41648
	Offset: 0x248
	Size: 0x1A4
	Parameters: 7
	Flags: None
*/
function update_applied_aoe_fx(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	fx_info = level.applied_aoe_fx_info[bwastimejump];
	if(!isdefined(fx_info))
	{
		return;
	}
	if(fieldname != binitialsnap)
	{
		self endon(#"death");
		self util::waittill_dobj(bnewent);
		if(!self function_21c0fa55())
		{
			if(isdefined(self.var_3186a45e))
			{
				stopfx(bnewent, self.var_3186a45e);
				self.var_3186a45e = undefined;
			}
			if(fieldname)
			{
				self.var_3186a45e = util::playfxontag(bnewent, fx_info.fx_3p, self, "j_mainroot");
			}
		}
		else if(fieldname)
		{
			firstperson = !isthirdperson(bnewent);
			if(firstperson)
			{
				playtagfxset(bnewent, fx_info.fx_1p, self);
			}
			else
			{
				util::playfxontag(bnewent, fx_info.fx_3p, self, "j_mainroot");
			}
		}
	}
}

/*
	Name: set_aoe_fx
	Namespace: ability_util
	Checksum: 0x10AC759D
	Offset: 0x3F8
	Size: 0x16E
	Parameters: 7
	Flags: None
*/
function set_aoe_fx(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	aoe_fx_info = level.aoe_fx_info[bwastimejump];
	if(!isdefined(aoe_fx_info))
	{
		return;
	}
	self stop_aoe_fx(binitialsnap, bwastimejump, aoe_fx_info);
	if(fieldname)
	{
		self thread aoe_fx(binitialsnap, bwastimejump, aoe_fx_info);
		if(isdefined(aoe_fx_info.var_f32a2e98))
		{
			fx = playfx(binitialsnap, aoe_fx_info.var_f32a2e98, self.origin);
			if(!isdefined(self.aoe_fx_arrays[bwastimejump]))
			{
				self.aoe_fx_arrays[bwastimejump] = [];
			}
			else if(!isarray(self.aoe_fx_arrays[bwastimejump]))
			{
				self.aoe_fx_arrays[bwastimejump] = array(self.aoe_fx_arrays[bwastimejump]);
			}
			self.aoe_fx_arrays[bwastimejump][self.aoe_fx_arrays[bwastimejump].size] = fx;
		}
	}
}

/*
	Name: stop_aoe_fx
	Namespace: ability_util
	Checksum: 0xD347F69B
	Offset: 0x570
	Size: 0xE8
	Parameters: 3
	Flags: Linked
*/
function stop_aoe_fx(local_client_num, clientfield_name, aoe_fx_info)
{
	if(!isdefined(self.aoe_fx_arrays))
	{
		return;
	}
	if(!isdefined(self.aoe_fx_arrays[aoe_fx_info]))
	{
		return;
	}
	foreach(fx in self.aoe_fx_arrays[aoe_fx_info])
	{
		if(!isdefined(fx))
		{
			continue;
		}
		stopfx(clientfield_name, fx);
	}
	self.aoe_fx_arrays[aoe_fx_info] = undefined;
}

/*
	Name: aoe_fx
	Namespace: ability_util
	Checksum: 0xEFA58733
	Offset: 0x660
	Size: 0x34C
	Parameters: 3
	Flags: Linked, Private
*/
function private aoe_fx(local_client_num, clientfield_name, aoe_fx_info)
{
	self endon(#"death");
	center = self.origin + (0, 0, aoe_fx_info.center_offset_z);
	startpitch = -90;
	yaw_count = [];
	yaw_count[0] = 1;
	yaw_count[1] = 4;
	yaw_count[2] = 6;
	yaw_count[3] = 8;
	yaw_count[4] = 6;
	yaw_count[5] = 4;
	yaw_count[6] = 1;
	pitch_vals = [];
	pitch_vals[0] = 90;
	pitch_vals[3] = 0;
	pitch_vals[6] = -90;
	trace = bullettrace(center, center + ((0, 0, -1) * aoe_fx_info.explosion_radius), 0, self);
	if(trace[#"fraction"] < 1)
	{
		pitch_vals[1] = 90 - (atan(150 / (trace[#"fraction"] * aoe_fx_info.explosion_radius)));
		pitch_vals[2] = 90 - (atan(300 / (trace[#"fraction"] * aoe_fx_info.explosion_radius)));
	}
	else
	{
		pitch_vals[1] = 60;
		pitch_vals[2] = 30;
	}
	trace = bullettrace(center, center + ((0, 0, 1) * aoe_fx_info.explosion_radius), 0, self);
	if(trace[#"fraction"] < 1)
	{
		pitch_vals[5] = -90 + (atan(150 / (trace[#"fraction"] * aoe_fx_info.explosion_radius)));
		pitch_vals[4] = -90 + (atan(300 / (trace[#"fraction"] * aoe_fx_info.explosion_radius)));
	}
	else
	{
		pitch_vals[5] = -60;
		pitch_vals[4] = -30;
	}
	currentpitch = startpitch;
	for(yaw_level = 0; yaw_level < yaw_count.size; yaw_level++)
	{
		currentpitch = pitch_vals[yaw_level];
		do_aoe_fx(local_client_num, center, yaw_count[yaw_level], currentpitch, clientfield_name, aoe_fx_info);
	}
}

/*
	Name: do_aoe_fx
	Namespace: ability_util
	Checksum: 0x5B2B3838
	Offset: 0x9B8
	Size: 0x51C
	Parameters: 6
	Flags: Linked, Private
*/
function private do_aoe_fx(local_client_num, center, yaw_count, pitch, clientfield_name, aoe_fx_info)
{
	profile_script = getdvarint(#"scr_profile_aoe_client", 0);
	if(profile_script)
	{
		profile_start_time = util::get_start_time();
		profile_elapsed_times = [];
	}
	if(!isdefined(self.aoe_fx_arrays))
	{
		self.aoe_fx_arrays = [];
	}
	if(!isdefined(self.aoe_fx_arrays[clientfield_name]))
	{
		self.aoe_fx_arrays[clientfield_name] = [];
	}
	/#
		debug_aoe_traces = getdvarint(#"debug_aoe_traces", 0);
	#/
	currentyaw = randomint(360);
	for(fxcount = 0; fxcount < yaw_count; fxcount++)
	{
		randomoffsetpitch = randomint(5) - 2.5;
		randomoffsetyaw = randomint(30) - 15;
		angles = (pitch + randomoffsetpitch, currentyaw + randomoffsetyaw, 0);
		tracedir = anglestoforward(angles);
		currentyaw = currentyaw + (360 / yaw_count);
		fx_position = center + (tracedir * aoe_fx_info.explosion_radius);
		trace = bullettrace(center, fx_position, 0, self);
		sphere_size = 5;
		angles = (0, randomint(360), 0);
		forward = anglestoforward(angles);
		if(trace[#"fraction"] < 1)
		{
			fx_position = center + ((tracedir * aoe_fx_info.explosion_radius) * trace[#"fraction"]);
			/#
				if(debug_aoe_traces)
				{
					sphere(fx_position, sphere_size, (1, 0, 1), 1, 1, 8, 300);
					sphere(trace[#"position"], sphere_size, (1, 1, 0), 1, 1, 8, 300);
				}
			#/
			normal = trace[#"normal"];
			if(lengthsquared(normal) == 0)
			{
				normal = -1 * tracedir;
			}
			right = (normal[2] * -1, normal[1] * -1, normal[0]);
			if(lengthsquared(vectorcross(forward, normal)) == 0)
			{
				forward = vectorcross(right, forward);
			}
		}
		else
		{
			/#
				line(fx_position + vectorscale((0, 0, 1), 50), fx_position - vectorscale((0, 0, 1), 50), (1, 0, 0), 1, 0, 300);
				sphere(fx_position, sphere_size, (1, 0, 1), 1, 1, 8, 300);
			#/
			if(debug_aoe_traces)
			{
			}
			if((lengthsquared(vectorcross(forward, tracedir * -1))) == 0)
			{
				forward = vectorcross(right, forward);
			}
		}
		if(profile_script)
		{
			util::record_elapsed_time(profile_start_time, profile_elapsed_times);
		}
		if(fxcount % aoe_fx_info.fx_per_frame)
		{
			waitframe(1);
		}
		if(profile_script)
		{
			profile_start_time = util::get_start_time();
		}
	}
	if(profile_script)
	{
		util::note_elapsed_times(profile_elapsed_times, "util aoe client");
	}
}

/*
	Name: aoe_trace_entity
	Namespace: ability_util
	Checksum: 0x947B3E6
	Offset: 0xEE0
	Size: 0x80
	Parameters: 3
	Flags: None
*/
function aoe_trace_entity(entity, origin, trace_z_offset)
{
	entitypoint = entity.origin + (0, 0, trace_z_offset);
	res = bullettrace(origin, entitypoint, 0, self);
	return res[#"fraction"] == 1;
}

