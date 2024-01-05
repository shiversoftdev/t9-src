#using scripts\core_common\system_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\animation_shared.csc;

#namespace animation_debug_shared;

/*
	Name: function_b33ae6e0
	Namespace: animation_debug_shared
	Checksum: 0x49BBC9F1
	Offset: 0x78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b33ae6e0()
{
	level notify(-416225204);
}

#namespace animation;

/*
	Name: __init__system__
	Namespace: animation
	Checksum: 0x4323BBDC
	Offset: 0x98
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
	Offset: 0xE0
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
	Checksum: 0x78B06FA4
	Offset: 0x108
	Size: 0x24C
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
			a_players = getlocalplayers();
			foreach(player in a_players)
			{
				var_16f8cca9 = player getlocalclientnumber();
				a_ents = getentarray(var_16f8cca9, "", "");
				foreach(ent in a_ents)
				{
					ent thread anim_info_render_thread();
				}
			}
			level flag::wait_till_clear_all([1:#"anim_debug_pause", 0:#"anim_debug"]);
			level notify(#"kill_anim_debug");
		}
	#/
}

/*
	Name: anim_info_render_thread
	Namespace: animation
	Checksum: 0xAB92CC78
	Offset: 0x360
	Size: 0x5AE
	Parameters: 0
	Flags: None
*/
function anim_info_render_thread()
{
	/#
		animation = self.var_6c4bb19.animation;
		v_origin_or_ent = self.var_6c4bb19.v_origin_or_ent;
		v_angles_or_tag = self.var_6c4bb19.v_angles_or_tag;
		self notify(#"_anim_info_render_thread_");
		self endon(#"_anim_info_render_thread_", #"death", #"scriptedanim");
		level endon(#"kill_anim_debug");
		while(true)
		{
			level flag::wait_till("");
			_init_frame();
			str_extra_info = "";
			color = (0, 1, 1);
			if(flag::get(#"firstframe"))
			{
				str_extra_info = str_extra_info + "";
			}
			var_958054e5 = getanimlength(animation);
			var_f667af2f = self getanimtime(animation) * var_958054e5;
			var_4ef0e636 = int(var_f667af2f * 30);
			var_477f1c98 = int(var_958054e5 * 30);
			str_extra_info = str_extra_info + (((((((("" + var_f667af2f) + "") + var_958054e5) + "") + var_4ef0e636) + "") + var_477f1c98) + "");
			s_pos = _get_align_pos(v_origin_or_ent, v_angles_or_tag);
			self anim_origin_render(s_pos.origin, s_pos.angles);
			line(self.origin, s_pos.origin, color, 0.5, 1);
			sphere(s_pos.origin, 2, vectorscale((1, 1, 1), 0.3), 0.5, 1);
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
				print3d(v_origin_or_ent.origin + vectorscale((0, 0, 1), 5), str_name, vectorscale((1, 1, 1), 0.3), 1, 0.15);
			}
			self anim_origin_render(self.origin, self.angles);
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
			print3d(self.origin, ((self getentnum() + get_ent_type()) + "") + str_name, color, 0.8, 0.3);
			print3d(self.origin - vectorscale((0, 0, 1), 5), "" + function_9e72a96(animation), color, 0.8, 0.3);
			print3d(self.origin - vectorscale((0, 0, 1), 7), str_extra_info, color, 0.8, 0.15);
			render_tag("", "");
			render_tag("", "");
			render_tag("", "");
			render_tag("", "");
			_reset_frame();
			waitframe(1);
		}
	#/
}

/*
	Name: get_ent_type
	Namespace: animation
	Checksum: 0x923E8CAB
	Offset: 0x918
	Size: 0x70
	Parameters: 0
	Flags: None
*/
function get_ent_type()
{
	/#
		return ("" + (isdefined((isdefined(self.classname) ? self.classname : self.type)) ? "" + (isdefined(self.classname) ? self.classname : self.type) : "")) + "";
	#/
}

/*
	Name: _init_frame
	Namespace: animation
	Checksum: 0x5EF2C20A
	Offset: 0x998
	Size: 0x8
	Parameters: 0
	Flags: None
*/
function _init_frame()
{
	/#
	#/
}

/*
	Name: _reset_frame
	Namespace: animation
	Checksum: 0x9F834E38
	Offset: 0x9A8
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
	Checksum: 0x60EB2C94
	Offset: 0x9C8
	Size: 0xCC
	Parameters: 2
	Flags: None
*/
function render_tag(str_tag, str_label)
{
	/#
		if(!isdefined(str_label))
		{
			str_label = str_tag;
		}
		v_tag_org = self gettagorigin(str_tag);
		if(isdefined(v_tag_org))
		{
			v_tag_ang = self gettagangles(str_tag);
			anim_origin_render(v_tag_org, v_tag_ang, 2, str_label);
			if(isdefined(self.v_centroid))
			{
				line(self.v_centroid, v_tag_org, vectorscale((1, 1, 1), 0.3), 0.5, 1);
			}
		}
	#/
}

/*
	Name: anim_origin_render
	Namespace: animation
	Checksum: 0x3CCF14EB
	Offset: 0xAA0
	Size: 0x15C
	Parameters: 4
	Flags: None
*/
function anim_origin_render(org, angles, line_length, str_label)
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
			line(org, originendpoint, (1, 0, 0));
			line(org, originrightpoint, (0, 1, 0));
			line(org, originuppoint, (0, 0, 1));
			if(isdefined(str_label))
			{
				print3d(org, str_label, (1, 0.7529412, 0.7960784), 1, 0.05);
			}
		}
	#/
}

