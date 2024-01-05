#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\animation_shared.gsc;

#namespace animation_debug_shared;

/*
	Name: function_f1737e2e
	Namespace: animation_debug_shared
	Checksum: 0xF0999244
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f1737e2e()
{
	level notify(386493957);
}

#namespace animation;

/*
	Name: __init__system__
	Namespace: animation
	Checksum: 0x4323BBDC
	Offset: 0xA0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_26dee29e21290041", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: animation
	Checksum: 0x169ADE
	Offset: 0xE8
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	/#
		thread init();
	#/
}

/*
	Name: init
	Namespace: animation
	Checksum: 0xE7BE09C0
	Offset: 0x110
	Size: 0x1AC
	Parameters: 0
	Flags: None
*/
function init()
{
	/#
		flag::init_dvar(#"anim_debug");
		flag::init_dvar(#"anim_debug_pause");
		for(;;)
		{
			level flag::wait_till_any([1:#"anim_debug_pause", 0:#"anim_debug"]);
			waitframe(1);
			a_ents = getentarray("", "", 1);
			foreach(ent in a_ents)
			{
				ent thread anim_info_render_thread();
			}
			level flag::wait_till_clear_all([1:#"anim_debug_pause", 0:#"anim_debug"]);
			level notify(#"kill_anim_debug");
		}
	#/
}

/*
	Name: is_anim_debugging
	Namespace: animation
	Checksum: 0x4CA3D63C
	Offset: 0x2C8
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function is_anim_debugging(ent)
{
	/#
		return isdefined(ent) && ent flag::get(#"scriptedanim");
	#/
}

/*
	Name: anim_info_render_thread
	Namespace: animation
	Checksum: 0xAE4EC6D9
	Offset: 0x310
	Size: 0xD0E
	Parameters: 0
	Flags: None
*/
function anim_info_render_thread()
{
	/#
		animation = self.var_6c4bb19.animation;
		v_origin_or_ent = self.var_6c4bb19.v_origin_or_ent;
		v_angles_or_tag = self.var_6c4bb19.v_angles_or_tag;
		var_f4b34dc1 = self.var_6c4bb19.var_f4b34dc1;
		self notify(#"_anim_info_render_thread_");
		self endon(#"_anim_info_render_thread_", #"death", #"scriptedanim");
		level endon(#"kill_anim_debug");
		if(!isdefined(v_origin_or_ent))
		{
			v_origin_or_ent = self.origin;
		}
		if(!isvec(v_origin_or_ent))
		{
			v_origin_or_ent endon(#"death");
		}
		if(!isdefined(level.debug_ents_by_origin))
		{
			level.debug_ents_by_origin = [];
		}
		str_origin = ((("" + ((floor(self.origin[0] / 10)) * 10)) + "") + ((floor(self.origin[1] / 10)) * 10) + "") + ((floor(self.origin[2] / 10)) * 10);
		if(!isdefined(level.debug_ents_by_origin[str_origin]))
		{
			level.debug_ents_by_origin[str_origin] = [];
		}
		array::filter(level.debug_ents_by_origin[str_origin], 0, &is_anim_debugging);
		array::add(level.debug_ents_by_origin[str_origin], self, 0);
		n_same_origin_index = array::find(level.debug_ents_by_origin[str_origin], self);
		recordent(self);
		while(true)
		{
			_init_frame();
			str_extra_info = "";
			color = (1, 1, 0);
			if(flag::get(#"firstframe"))
			{
				str_extra_info = str_extra_info + "";
			}
			var_13edeb1f = getanimframecount(animation);
			var_7b160393 = self getanimtime(animation) * var_13edeb1f;
			var_958054e5 = getanimlength(animation);
			var_f667af2f = self getanimtime(animation) * var_958054e5;
			str_extra_info = str_extra_info + (((((((("" + var_f667af2f) + "") + var_958054e5) + "") + var_7b160393) + "") + var_13edeb1f) + "");
			s_pos = _get_align_pos(v_origin_or_ent, v_angles_or_tag);
			self anim_origin_render(s_pos.origin, s_pos.angles, undefined, undefined, !1);
			if(1)
			{
				line(self.origin, s_pos.origin, color, 0.5, 1);
				sphere(s_pos.origin, 2, vectorscale((1, 1, 1), 0.3), 0.5, 1);
			}
			recordline(self.origin, s_pos.origin, color, "");
			recordsphere(s_pos.origin, 2, vectorscale((1, 1, 1), 0.3), "");
			if(!isvec(v_origin_or_ent) && (v_origin_or_ent != self && v_origin_or_ent != level))
			{
				str_name = "";
				if(isdefined(v_origin_or_ent.animname))
				{
					str_name = v_origin_or_ent.animname;
				}
				else if(isdefined(v_origin_or_ent.targetname))
				{
					str_name = v_origin_or_ent.targetname;
				}
				if(1)
				{
					print3d(v_origin_or_ent.origin + vectorscale((0, 0, 1), 5), str_name, vectorscale((1, 1, 1), 0.3), 1, 0.15);
				}
				record3dtext(str_name, v_origin_or_ent.origin + vectorscale((0, 0, 1), 5), vectorscale((1, 1, 1), 0.3), "");
			}
			self anim_origin_render(self.origin, self.angles, undefined, undefined, !1);
			str_name = "";
			if(isdefined(self.anim_debug_name))
			{
				str_name = self.anim_debug_name;
			}
			else
			{
				if(isdefined(self.animname))
				{
					str_name = self.animname;
				}
				else if(isdefined(self.targetname))
				{
					str_name = self.targetname;
				}
			}
			maso_they_don_t_see_us_ye_ = self.origin - (0, 0, 15 * n_same_origin_index);
			if(1)
			{
				print3d(maso_they_don_t_see_us_ye_, ((self getentnum() + get_ent_type()) + "") + str_name, color, 0.8, 0.3);
				print3d(maso_they_don_t_see_us_ye_ - vectorscale((0, 0, 1), 5), ("" + (isanimlooping(animation) ? "" : "")) + function_9e72a96(animation), color, 0.8, 0.3);
				print3d(maso_they_don_t_see_us_ye_ - vectorscale((0, 0, 1), 11), str_extra_info, color, 0.8, 0.3);
				if(isarray(var_f4b34dc1) && var_f4b34dc1.size)
				{
					n_z_offset = 17;
					foreach(var_21c1ba1, str_anim in var_f4b34dc1)
					{
						var_1c56a327 = (("" + var_21c1ba1) + "") + function_9e72a96(str_anim);
						print3d(maso_they_don_t_see_us_ye_ - (0, 0, n_z_offset), var_1c56a327, (0, 1, 1), 0.8, 0.15);
						n_z_offset = n_z_offset + 6;
					}
				}
			}
			record3dtext(((self getentnum() + get_ent_type()) + "") + str_name, maso_they_don_t_see_us_ye_, color, "");
			record3dtext("" + animation, maso_they_don_t_see_us_ye_ - vectorscale((0, 0, 1), 5), color, "");
			record3dtext(str_extra_info, maso_they_don_t_see_us_ye_ - vectorscale((0, 0, 1), 7), color, "");
			render_tag("", "", !1);
			render_tag("", "", !1);
			render_tag("", "", !1);
			render_tag("", "", !1);
			render_tag("", "", !1);
			render_tag("", "", !1);
			render_tag("", "", !1);
			render_tag("", "", !1);
			render_tag("", "", !1);
			render_tag("", "", !1);
			render_tag("", "", !1);
			render_tag("", "", !1);
			render_tag("", "", !1);
			render_tag("", "", !1);
			render_tag("", "", !1);
			render_tag("", "", !1);
			render_tag("", "", !1);
			render_tag("", "", !1);
			render_tag("", "", !1);
			render_tag("", "", !1);
			_reset_frame();
			waitframe(1);
		}
	#/
}

/*
	Name: get_ent_type
	Namespace: animation
	Checksum: 0xB5DDA020
	Offset: 0x1028
	Size: 0x6C
	Parameters: 0
	Flags: None
*/
function get_ent_type()
{
	/#
		if(isactor(self))
		{
			return "";
		}
		if(isvehicle(self))
		{
			return "";
		}
		return ("" + self.classname) + "";
	#/
}

/*
	Name: _init_frame
	Namespace: animation
	Checksum: 0xB429F018
	Offset: 0x10A0
	Size: 0x22
	Parameters: 0
	Flags: None
*/
function _init_frame()
{
	/#
		self.v_centroid = self getcentroid();
	#/
}

/*
	Name: _reset_frame
	Namespace: animation
	Checksum: 0x960587F8
	Offset: 0x10D0
	Size: 0x12
	Parameters: 0
	Flags: None
*/
function _reset_frame()
{
	/#
		self.v_centroid = undefined;
	#/
}

/*
	Name: render_tag
	Namespace: animation
	Checksum: 0x923E3D44
	Offset: 0x10F0
	Size: 0x134
	Parameters: 3
	Flags: None
*/
function render_tag(str_tag, str_label, b_recorder_only)
{
	/#
		if(!isdefined(str_label))
		{
			str_label = str_tag;
		}
		if(!isdefined(self.v_centroid))
		{
			self.v_centroid = self getcentroid();
		}
		v_tag_org = self gettagorigin(str_tag);
		if(isdefined(v_tag_org))
		{
			v_tag_ang = self gettagangles(str_tag);
			anim_origin_render(v_tag_org, v_tag_ang, 2, str_label, b_recorder_only);
			if(!b_recorder_only)
			{
				line(self.v_centroid, v_tag_org, vectorscale((1, 1, 1), 0.3), 0.5, 1);
			}
			recordline(self.v_centroid, v_tag_org, vectorscale((1, 1, 1), 0.3), "");
		}
	#/
}

/*
	Name: anim_origin_render
	Namespace: animation
	Checksum: 0x9C0FC126
	Offset: 0x1230
	Size: 0x20C
	Parameters: 5
	Flags: None
*/
function anim_origin_render(org, angles, line_length, str_label, b_recorder_only)
{
	/#
		if(!isdefined(line_length))
		{
			line_length = 6;
		}
		if(isdefined(org) && isdefined(angles))
		{
			originendpoint = org + vectorscale(anglestoforward(angles), line_length);
			originrightpoint = org + (vectorscale(anglestoright(angles), -1 * line_length));
			originuppoint = org + vectorscale(anglestoup(angles), line_length);
			if(!b_recorder_only)
			{
				line(org, originendpoint, (1, 0, 0));
				line(org, originrightpoint, (0, 1, 0));
				line(org, originuppoint, (0, 0, 1));
			}
			recordline(org, originendpoint, (1, 0, 0), "");
			recordline(org, originrightpoint, (0, 1, 0), "");
			recordline(org, originuppoint, (0, 0, 1), "");
			if(isdefined(str_label))
			{
				if(!b_recorder_only)
				{
					print3d(org, str_label, (1, 0.7529412, 0.7960784), 1, 0.05);
				}
				record3dtext(str_label, org, (1, 0.7529412, 0.7960784), "");
			}
		}
	#/
}

