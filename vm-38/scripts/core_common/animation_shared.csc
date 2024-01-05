#using script_274952f8a08d7ad0;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\shaderanim_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\animation_debug_shared.csc;

#namespace animation_shared;

/*
	Name: function_4b73c73
	Namespace: animation_shared
	Checksum: 0xBD9ABCCC
	Offset: 0x310
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4b73c73()
{
	level notify(-1554073009);
}

#namespace animation;

/*
	Name: __init__system__
	Namespace: animation
	Checksum: 0xC934263D
	Offset: 0x330
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"animation", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: animation
	Checksum: 0x8D763856
	Offset: 0x378
	Size: 0xC4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("scriptmover", "cracks_on", 1, getminbitcountfornum(4), "int", &cf_cracks_on, 0, 0);
	clientfield::register("scriptmover", "cracks_off", 1, getminbitcountfornum(4), "int", &cf_cracks_off, 0, 0);
	setup_notetracks();
}

/*
	Name: first_frame
	Namespace: animation
	Checksum: 0x172A8BCE
	Offset: 0x448
	Size: 0x3C
	Parameters: 3
	Flags: None
*/
function first_frame(animation, v_origin_or_ent, v_angles_or_tag)
{
	self thread play(animation, v_origin_or_ent, v_angles_or_tag, 0);
}

/*
	Name: play
	Namespace: animation
	Checksum: 0xDDF531AB
	Offset: 0x490
	Size: 0x122
	Parameters: 11
	Flags: Linked
*/
function play(animation, v_origin_or_ent, v_angles_or_tag, n_rate, n_blend_in, n_blend_out, n_lerp, b_link, n_start_time, var_b2e32ae2, localclientnum)
{
	if(!isdefined(n_rate))
	{
		n_rate = 1;
	}
	if(!isdefined(n_blend_in))
	{
		n_blend_in = 0.2;
	}
	if(!isdefined(n_blend_out))
	{
		n_blend_out = 0.2;
	}
	if(!isdefined(b_link))
	{
		b_link = 0;
	}
	if(!isdefined(n_start_time))
	{
		n_start_time = 0;
	}
	if(!isdefined(var_b2e32ae2))
	{
		var_b2e32ae2 = "linear";
	}
	if(!isdefined(localclientnum))
	{
		localclientnum = 0;
	}
	self endon(#"death");
	self thread _play(animation, v_origin_or_ent, v_angles_or_tag, n_rate, n_blend_in, n_blend_out, n_lerp, b_link, n_start_time, var_b2e32ae2, localclientnum);
	self waittill(#"scriptedanim");
}

/*
	Name: _play
	Namespace: animation
	Checksum: 0xDB78974A
	Offset: 0x5C0
	Size: 0x54C
	Parameters: 11
	Flags: Linked
*/
function _play(animation, v_origin_or_ent, v_angles_or_tag, n_rate, n_blend_in, n_blend_out, n_lerp, b_link, n_start_time, var_b2e32ae2, localclientnum)
{
	if(!isdefined(n_blend_out))
	{
		n_blend_out = 1;
	}
	if(!isdefined(n_lerp))
	{
		n_lerp = 0.2;
	}
	if(!isdefined(b_link))
	{
		b_link = 0;
	}
	if(!isdefined(self))
	{
		return;
	}
	self notify(#"new_scripted_anim");
	self endon(#"new_scripted_anim", #"death");
	if(!isdefined(self.model) || self.model == #"")
	{
		/#
			/#
				assertmsg("" + self.origin);
			#/
		#/
		return;
	}
	flag::set_val("firstframe", n_blend_out == 0);
	flag::set(#"scripted_anim_this_frame");
	flag::set(#"scriptedanim");
	if(!isdefined(n_rate))
	{
		n_rate = self;
	}
	n_start_time = math::clamp(n_start_time, 0, 1);
	if(isvec(n_rate) && isvec(n_blend_in))
	{
		self animscripted("_anim_notify_", n_rate, n_blend_in, v_angles_or_tag, n_lerp, n_blend_out, n_start_time, var_b2e32ae2);
	}
	else
	{
		if(isstring(n_blend_in))
		{
			/#
				assert(isdefined(n_rate.model), ((("" + v_angles_or_tag) + "") + n_blend_in) + "");
			#/
			v_pos = n_rate gettagorigin(n_blend_in);
			v_ang = n_rate gettagangles(n_blend_in);
			self.origin = v_pos;
			self.angles = v_ang;
			b_link = 1;
			self animscripted("_anim_notify_", self.origin, self.angles, v_angles_or_tag, n_lerp, n_blend_out, n_start_time, var_b2e32ae2);
		}
		else
		{
			v_angles = (isdefined(n_rate.angles) ? n_rate.angles : (0, 0, 0));
			v_origin = (isdefined(n_rate.origin) ? n_rate.origin : (0, 0, 0));
			self animscripted("_anim_notify_", v_origin, v_angles, v_angles_or_tag, n_lerp, n_blend_out, n_start_time, var_b2e32ae2);
		}
		if(n_start_time > 0 && (!isanimlooping(localclientnum, v_angles_or_tag) || n_start_time < 1))
		{
			self setanimtimebyname(v_angles_or_tag, n_start_time, 1);
		}
	}
	if(!b_link)
	{
		self unlink();
	}
	/#
		self.var_80c69db6 = "";
		self.var_6c4bb19 = {#v_angles_or_tag:n_blend_in, #v_origin_or_ent:n_rate, #animation:v_angles_or_tag};
		if(level flag::get(""))
		{
			self thread anim_info_render_thread();
		}
	#/
	self thread handle_notetracks();
	self waittill_end();
	if(b_link)
	{
		self unlink();
	}
	flag::clear(#"scriptedanim");
	flag::clear(#"firstframe");
	self.var_80c69db6 = undefined;
	self.var_6c4bb19 = undefined;
	waittillframeend();
	flag::clear(#"scripted_anim_this_frame");
}

/*
	Name: waittill_end
	Namespace: animation
	Checksum: 0x404ACD89
	Offset: 0xB18
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private waittill_end()
{
	level endon(#"demo_jump");
	self waittillmatch({#notetrack:"end"}, #"_anim_notify_");
}

/*
	Name: _get_align_ent
	Namespace: animation
	Checksum: 0x24975452
	Offset: 0xB70
	Size: 0x4A
	Parameters: 1
	Flags: Linked
*/
function _get_align_ent(e_align)
{
	e = self;
	if(isdefined(e_align))
	{
		e = e_align;
	}
	if(!isdefined(e.angles))
	{
		e.angles = (0, 0, 0);
	}
	return e;
}

/*
	Name: _get_align_pos
	Namespace: animation
	Checksum: 0xF2535A8
	Offset: 0xBC8
	Size: 0x186
	Parameters: 2
	Flags: None
*/
function _get_align_pos(v_origin_or_ent, v_angles_or_tag)
{
	if(!isdefined(v_origin_or_ent))
	{
		v_origin_or_ent = self.origin;
	}
	if(!isdefined(v_angles_or_tag))
	{
		v_angles_or_tag = (isdefined(self.angles) ? self.angles : (0, 0, 0));
	}
	s = spawnstruct();
	if(isvec(v_origin_or_ent))
	{
		/#
			assert(isvec(v_angles_or_tag), "");
		#/
		s.origin = v_origin_or_ent;
		s.angles = v_angles_or_tag;
	}
	else
	{
		e_align = _get_align_ent(v_origin_or_ent);
		if(isstring(v_angles_or_tag))
		{
			s.origin = e_align gettagorigin(v_angles_or_tag);
			s.angles = e_align gettagangles(v_angles_or_tag);
		}
		else
		{
			s.origin = e_align.origin;
			s.angles = e_align.angles;
		}
	}
	if(!isdefined(s.angles))
	{
		s.angles = (0, 0, 0);
	}
	return s;
}

/*
	Name: play_siege
	Namespace: animation
	Checksum: 0x5F851A1E
	Offset: 0xD58
	Size: 0x16A
	Parameters: 4
	Flags: Linked
*/
function play_siege(str_anim, str_shot, n_rate, b_loop)
{
	if(!isdefined(str_shot))
	{
		str_shot = "default";
	}
	if(!isdefined(n_rate))
	{
		n_rate = 1;
	}
	if(!isdefined(b_loop))
	{
		b_loop = 0;
	}
	self notify(#"end");
	level endon(#"demo_jump");
	self endon(#"death");
	if(!isdefined(str_shot))
	{
		str_shot = "default";
	}
	if(n_rate == 0)
	{
		self siegecmd("set_anim", str_anim, "set_shot", str_shot, "pause", "goto_start");
	}
	else
	{
		self siegecmd("set_anim", str_anim, "set_shot", str_shot, "unpause", "set_playback_speed", n_rate, "send_end_events", 1, (b_loop ? "loop" : "unloop"));
	}
	self waittill(#"end");
}

/*
	Name: add_notetrack_func
	Namespace: animation
	Checksum: 0xC6A78A55
	Offset: 0xED0
	Size: 0x74
	Parameters: 2
	Flags: Linked
*/
function add_notetrack_func(funcname, func)
{
	if(!isdefined(level._animnotifyfuncs))
	{
		level._animnotifyfuncs = [];
	}
	/#
		assert(!isdefined(level._animnotifyfuncs[funcname]), "");
	#/
	level._animnotifyfuncs[funcname] = func;
}

/*
	Name: add_global_notetrack_handler
	Namespace: animation
	Checksum: 0xA4F32304
	Offset: 0xF50
	Size: 0x112
	Parameters: 3
	Flags: Linked, Variadic
*/
function add_global_notetrack_handler(str_note, func, ...)
{
	if(!isdefined(level._animnotetrackhandlers))
	{
		level._animnotetrackhandlers = [];
	}
	if(!isdefined(level._animnotetrackhandlers[str_note]))
	{
		level._animnotetrackhandlers[str_note] = [];
	}
	if(!isdefined(level._animnotetrackhandlers[str_note]))
	{
		level._animnotetrackhandlers[str_note] = [];
	}
	else if(!isarray(level._animnotetrackhandlers[str_note]))
	{
		level._animnotetrackhandlers[str_note] = array(level._animnotetrackhandlers[str_note]);
	}
	level._animnotetrackhandlers[str_note][level._animnotetrackhandlers[str_note].size] = array(func, vararg);
}

/*
	Name: call_notetrack_handler
	Namespace: animation
	Checksum: 0xCEDBA3F6
	Offset: 0x1070
	Size: 0x29E
	Parameters: 1
	Flags: Linked
*/
function call_notetrack_handler(str_note)
{
	if(isdefined(level._animnotetrackhandlers) && isdefined(level._animnotetrackhandlers[str_note]))
	{
		foreach(handler in level._animnotetrackhandlers[str_note])
		{
			func = handler[0];
			args = handler[1];
			switch(args.size)
			{
				case 6:
				{
					self [[func]](args[0], args[1], args[2], args[3], args[4], args[5]);
					break;
				}
				case 5:
				{
					self [[func]](args[0], args[1], args[2], args[3], args[4]);
					break;
				}
				case 4:
				{
					self [[func]](args[0], args[1], args[2], args[3]);
					break;
				}
				case 3:
				{
					self [[func]](args[0], args[1], args[2]);
					break;
				}
				case 2:
				{
					self [[func]](args[0], args[1]);
					break;
				}
				case 1:
				{
					self [[func]](args[0]);
					break;
				}
				case 0:
				{
					self [[func]]();
					break;
				}
				default:
				{
					/#
						assertmsg("");
					#/
				}
			}
		}
	}
}

/*
	Name: setup_notetracks
	Namespace: animation
	Checksum: 0x1F09CAB
	Offset: 0x1318
	Size: 0x274
	Parameters: 0
	Flags: Linked
*/
function setup_notetracks()
{
	add_notetrack_func("flag::set", &flag::set);
	add_notetrack_func("flag::clear", &flag::clear);
	add_notetrack_func("postfx::PlayPostFxBundle", &postfx::playpostfxbundle);
	add_notetrack_func("postfx::StopPostFxBundle", &postfx::stoppostfxbundle);
	add_notetrack_func("cinematicMotion::SpeedModifierClient", &cinematicmotion::function_bd8097ae);
	add_notetrack_func("cinematicMotion::OverrideClient", &cinematicmotion::function_8152b11);
	add_global_notetrack_handler("red_cracks_on", &cracks_on, "red");
	add_global_notetrack_handler("green_cracks_on", &cracks_on, "green");
	add_global_notetrack_handler("blue_cracks_on", &cracks_on, "blue");
	add_global_notetrack_handler("all_cracks_on", &cracks_on, "all");
	add_global_notetrack_handler("red_cracks_off", &cracks_off, "red");
	add_global_notetrack_handler("green_cracks_off", &cracks_off, "green");
	add_global_notetrack_handler("blue_cracks_off", &cracks_off, "blue");
	add_global_notetrack_handler("all_cracks_off", &cracks_off, "all");
}

/*
	Name: handle_notetracks
	Namespace: animation
	Checksum: 0xA604BA22
	Offset: 0x1598
	Size: 0xD6
	Parameters: 0
	Flags: Linked
*/
function handle_notetracks()
{
	self notify(#"handle_notetracks");
	level endon(#"demo_jump");
	self endon(#"handle_notetracks", #"death");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"_anim_notify_");
		str_note = waitresult.notetrack;
		if(str_note != "end" && str_note != "loop_end")
		{
			self thread call_notetrack_handler(str_note);
		}
		else
		{
			return;
		}
	}
}

/*
	Name: cracks_on
	Namespace: animation
	Checksum: 0x5510BCC2
	Offset: 0x1678
	Size: 0xE2
	Parameters: 1
	Flags: Linked
*/
function cracks_on(str_type)
{
	switch(str_type)
	{
		case "red":
		{
			cf_cracks_on(self.localclientnum, 0, 1);
			break;
		}
		case "green":
		{
			cf_cracks_on(self.localclientnum, 0, 3);
			break;
		}
		case "blue":
		{
			cf_cracks_on(self.localclientnum, 0, 2);
			break;
		}
		case "all":
		{
			cf_cracks_on(self.localclientnum, 0, 4);
			break;
		}
	}
}

/*
	Name: cracks_off
	Namespace: animation
	Checksum: 0x81F873B7
	Offset: 0x1768
	Size: 0xE2
	Parameters: 1
	Flags: Linked
*/
function cracks_off(str_type)
{
	switch(str_type)
	{
		case "red":
		{
			cf_cracks_off(self.localclientnum, 0, 1);
			break;
		}
		case "green":
		{
			cf_cracks_off(self.localclientnum, 0, 3);
			break;
		}
		case "blue":
		{
			cf_cracks_off(self.localclientnum, 0, 2);
			break;
		}
		case "all":
		{
			cf_cracks_off(self.localclientnum, 0, 4);
			break;
		}
	}
}

/*
	Name: cf_cracks_on
	Namespace: animation
	Checksum: 0x5C31A6CA
	Offset: 0x1858
	Size: 0x1B2
	Parameters: 7
	Flags: Linked
*/
function cf_cracks_on(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	switch(bwastimejump)
	{
		case 1:
		{
			shaderanim::animate_crack(fieldname, "scriptVector1", 0, 3, 0, 1);
			break;
		}
		case 3:
		{
			shaderanim::animate_crack(fieldname, "scriptVector2", 0, 3, 0, 1);
			break;
		}
		case 2:
		{
			shaderanim::animate_crack(fieldname, "scriptVector3", 0, 3, 0, 1);
			break;
		}
		case 4:
		{
			shaderanim::animate_crack(fieldname, "scriptVector1", 0, 3, 0, 1);
			shaderanim::animate_crack(fieldname, "scriptVector2", 0, 3, 0, 1);
			shaderanim::animate_crack(fieldname, "scriptVector3", 0, 3, 0, 1);
		}
	}
}

/*
	Name: cf_cracks_off
	Namespace: animation
	Checksum: 0x212D9BE5
	Offset: 0x1A18
	Size: 0x19A
	Parameters: 7
	Flags: Linked
*/
function cf_cracks_off(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	switch(bwastimejump)
	{
		case 1:
		{
			shaderanim::animate_crack(fieldname, "scriptVector1", 0, 0, 1, 0);
			break;
		}
		case 3:
		{
			shaderanim::animate_crack(fieldname, "scriptVector2", 0, 0, 1, 0);
			break;
		}
		case 2:
		{
			shaderanim::animate_crack(fieldname, "scriptVector3", 0, 0, 1, 0);
			break;
		}
		case 4:
		{
			shaderanim::animate_crack(fieldname, "scriptVector1", 0, 0, 1, 0);
			shaderanim::animate_crack(fieldname, "scriptVector2", 0, 0, 1, 0);
			shaderanim::animate_crack(fieldname, "scriptVector3", 0, 0, 1, 0);
		}
	}
}

