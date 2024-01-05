#using script_6c2a6f88ebaa044;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\string_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\animation_debug_shared.gsc;

#namespace animation;

/*
	Name: __init__system__
	Namespace: animation
	Checksum: 0x2025734A
	Offset: 0x458
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
	Checksum: 0xCDE6912B
	Offset: 0x4A0
	Size: 0xF4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(getdvarstring(#"debug_anim_shared", "") == "")
	{
		setdvar(#"debug_anim_shared", "");
	}
	setup_notetracks();
	callback::on_laststand(&reset_player);
	callback::on_bleedout(&reset_player);
	callback::on_player_killed(&reset_player);
	callback::on_spawned(&reset_player);
}

/*
	Name: reset_player
	Namespace: animation
	Checksum: 0x8E4CAAB2
	Offset: 0x5A0
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function reset_player(params)
{
	flag::clear(#"firstframe");
	flag::clear(#"scripted_anim_this_frame");
	flag::clear(#"scriptedanim");
}

/*
	Name: first_frame
	Namespace: animation
	Checksum: 0x94E0C26D
	Offset: 0x618
	Size: 0x3C
	Parameters: 3
	Flags: None
*/
function first_frame(animation, v_origin_or_ent, v_angles_or_tag)
{
	self thread play(animation, v_origin_or_ent, v_angles_or_tag, 0);
}

/*
	Name: last_frame
	Namespace: animation
	Checksum: 0x5AA7EEA7
	Offset: 0x660
	Size: 0x54
	Parameters: 3
	Flags: None
*/
function last_frame(animation, v_origin_or_ent, v_angles_or_tag)
{
	self thread play(animation, v_origin_or_ent, v_angles_or_tag, 1, 0, 0, 0, 1, undefined, undefined, undefined, 1);
}

/*
	Name: play_siege
	Namespace: animation
	Checksum: 0x8D8D759B
	Offset: 0x6C0
	Size: 0x1E4
	Parameters: 2
	Flags: Linked
*/
function play_siege(str_anim, n_rate)
{
	if(!isdefined(n_rate))
	{
		n_rate = 1;
	}
	self notify(#"stop_siege_anim");
	self endon(#"death", #"scene_stop", #"stop_siege_anim");
	/#
		if(sessionmodeismultiplayergame() || sessionmodeiswarzonegame())
		{
			iprintlnbold(("" + function_9e72a96(str_anim)) + "");
			println(("" + function_9e72a96(str_anim)) + "");
		}
	#/
	if(isdedicated())
	{
		/#
			println(("" + function_9e72a96(str_anim)) + "");
		#/
		waitframe(1);
		return;
	}
	b_loop = function_35c3fa74(str_anim);
	self function_cf6be307(str_anim, "default", n_rate, b_loop);
	if(b_loop)
	{
		self waittill(#"stop_siege_anim");
	}
	else
	{
		n_length = function_658484f7(str_anim);
		wait(n_length);
	}
}

/*
	Name: play
	Namespace: animation
	Checksum: 0xAC428C98
	Offset: 0x8B0
	Size: 0x1BA
	Parameters: 15
	Flags: Linked
*/
function play(animation, v_origin_or_ent, v_angles_or_tag, n_rate, n_blend_in, n_blend_out, n_lerp, n_start_time, b_show_player_firstperson_weapon, b_unlink_after_completed, var_f4b34dc1, paused, mode, var_dc569aa8, var_1971fee9)
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
	if(!isdefined(n_lerp))
	{
		n_lerp = 0;
	}
	if(!isdefined(n_start_time))
	{
		n_start_time = 0;
	}
	if(!isdefined(b_show_player_firstperson_weapon))
	{
		b_show_player_firstperson_weapon = 0;
	}
	if(!isdefined(b_unlink_after_completed))
	{
		b_unlink_after_completed = 1;
	}
	if(!isdefined(paused))
	{
		paused = 0;
	}
	if(!isdefined(mode))
	{
		mode = "normal";
	}
	if(!isdefined(var_dc569aa8))
	{
		var_dc569aa8 = "linear";
	}
	if(!isdefined(var_1971fee9))
	{
		var_1971fee9 = 0;
	}
	if(self isragdoll())
	{
		return;
	}
	self endon(#"death", #"entering_last_stand");
	self thread _play(animation, v_origin_or_ent, v_angles_or_tag, n_rate, n_blend_in, n_blend_out, n_lerp, n_start_time, b_show_player_firstperson_weapon, b_unlink_after_completed, var_f4b34dc1, paused, mode, var_dc569aa8, var_1971fee9);
	if(n_rate > 0)
	{
		self waittill(#"scriptedanim");
	}
}

/*
	Name: stop
	Namespace: animation
	Checksum: 0xB5A1794
	Offset: 0xA78
	Size: 0x74
	Parameters: 2
	Flags: Linked
*/
function stop(n_blend, var_8b43f3e3)
{
	if(!isdefined(n_blend))
	{
		n_blend = 0.2;
	}
	if(!isdefined(var_8b43f3e3))
	{
		var_8b43f3e3 = 0;
	}
	flag::clear(#"scriptedanim");
	if(isdefined(self))
	{
		self stopanimscripted(n_blend, var_8b43f3e3);
	}
}

/*
	Name: debug_print
	Namespace: animation
	Checksum: 0x33DA20E4
	Offset: 0xAF8
	Size: 0x204
	Parameters: 2
	Flags: None
*/
function debug_print(str_animation, str_msg)
{
	/#
		str_dvar = getdvarstring(#"debug_anim_shared", "");
		if(str_dvar != "")
		{
			if(!isstring(str_animation))
			{
				str_animation = (isdefined(function_9e72a96(str_animation)) ? "" + function_9e72a96(str_animation) : "");
			}
			b_print = 0;
			if(strisnumber(str_dvar))
			{
				if(int(str_dvar) > 0)
				{
					b_print = 1;
				}
			}
			else if(issubstr(str_animation, str_dvar) || (isdefined(self.animname) && issubstr(self.animname, str_dvar)))
			{
				b_print = 1;
			}
			if(b_print)
			{
				printtoprightln((((str_animation + "") + string::rjust(str_msg, 10) + "") + (string::rjust("" + self getentitynumber(), 4)) + "") + (string::rjust("" + gettime(), 6)) + "", (1, 1, 0), -1);
			}
		}
	#/
}

/*
	Name: _play
	Namespace: animation
	Checksum: 0xD69E1A15
	Offset: 0xD08
	Size: 0xA34
	Parameters: 15
	Flags: Linked
*/
function _play(animation, v_origin_or_ent, v_angles_or_tag, n_rate, n_blend_in, n_blend_out, n_lerp, n_start_time, b_show_player_firstperson_weapon, b_unlink_after_completed, var_f4b34dc1, paused, mode, var_dc569aa8, var_1971fee9)
{
	self notify(#"new_scripted_anim");
	self endoncallback(&function_2adc2518, #"death", #"entering_last_stand", #"new_scripted_anim");
	function_2ddeb362("animation::_play " + animation);
	/#
		debug_print(animation, "");
	#/
	flag::set_val("firstframe", n_rate == 0 && !is_true(paused) && n_start_time === 0);
	flag::set(#"scripted_anim_this_frame");
	flag::set(#"scriptedanim");
	if(!isdefined(v_origin_or_ent))
	{
		v_origin_or_ent = self;
	}
	if(!isdefined(mode))
	{
		mode = "normal";
	}
	if(isvec(v_origin_or_ent))
	{
		v_origin = v_origin_or_ent;
	}
	else
	{
		v_origin = (isdefined(v_origin_or_ent.origin) ? v_origin_or_ent.origin : (0, 0, 0));
	}
	if(isvec(v_angles_or_tag))
	{
		v_angles = v_angles_or_tag;
	}
	else
	{
		if(isstring(v_angles_or_tag))
		{
			str_tag = v_angles_or_tag;
			v_origin = v_origin_or_ent gettagorigin(str_tag);
			v_angles = v_origin_or_ent gettagangles(str_tag);
			/#
				/#
					assert(isdefined(v_origin) && isdefined(v_angles), (((("" + function_9e72a96(animation)) + "") + v_origin_or_ent getentitynumber() + "") + v_angles_or_tag) + "");
				#/
			#/
			if(!isdefined(v_origin))
			{
				v_origin = v_origin_or_ent.origin;
			}
			if(!isdefined(v_angles))
			{
				v_angles = v_origin_or_ent.angles;
			}
		}
		else
		{
			v_angles = (isdefined(v_origin_or_ent.angles) ? v_origin_or_ent.angles : (0, 0, 0));
		}
	}
	if(self isplayinganimscripted() && isanimlooping(animation))
	{
		waittillframeend();
	}
	self.str_current_anim = animation;
	b_link = isentity(v_origin_or_ent);
	if(isdefined(self.n_script_anim_rate))
	{
		n_rate = self.n_script_anim_rate;
	}
	if(isdefined(self.var_5b22d53))
	{
		n_blend_out = self.var_5b22d53;
	}
	if(n_lerp > 0)
	{
		prevorigin = self.origin;
		prevangles = self.angles;
	}
	if(b_link)
	{
		if(isactor(self))
		{
			self forceteleport(v_origin, v_angles);
		}
		else
		{
			if(isplayer(self))
			{
				self setorigin(v_origin);
				self setplayerangles(v_angles);
			}
			else
			{
				self.origin = v_origin;
				self.angles = v_angles;
			}
		}
		if(v_origin_or_ent != self)
		{
			if(isstring(str_tag))
			{
				self linkto(v_origin_or_ent, str_tag, (0, 0, 0), (0, 0, 0));
			}
			else
			{
				self linkto(v_origin_or_ent);
			}
		}
		if(n_lerp > 0)
		{
			if(isactor(self))
			{
				self forceteleport(prevorigin, prevangles);
			}
			else
			{
				if(isplayer(self))
				{
					self setorigin(prevorigin);
					self setplayerangles(prevangles);
				}
				else
				{
					self.origin = prevorigin;
					self.angles = prevangles;
				}
			}
		}
	}
	if(self hasdobj() && !self.classname === "noclass")
	{
		self animscripted(animation, v_origin, v_angles, animation, mode, undefined, n_rate, n_blend_in, n_lerp, n_start_time, 1, b_show_player_firstperson_weapon, var_f4b34dc1, paused, var_dc569aa8, var_1971fee9);
		var_1abb7e22 = 1;
	}
	else
	{
		/#
			println((("" + self getentitynumber()) + "") + function_9e72a96(animation));
		#/
	}
	if(isplayer(self))
	{
		thread set_player_clamps(max(n_lerp, n_blend_in));
	}
	/#
		self.var_80c69db6 = "";
		self.var_6c4bb19 = {#hash_f4b34dc1:var_f4b34dc1, #v_angles_or_tag:v_angles_or_tag, #v_origin_or_ent:v_origin_or_ent, #animation:animation};
		if(level flag::get(""))
		{
			self thread anim_info_render_thread();
		}
	#/
	if(!isanimlooping(animation) && n_blend_out > 0 && n_rate > 0 && n_start_time < 1)
	{
		if(!animhasnotetrack(animation, "start_ragdoll") && !animhasnotetrack(animation, "stop_anim"))
		{
			self thread _blend_out(animation, n_blend_out, n_rate, n_start_time);
		}
	}
	if(!flag::get(#"firstframe"))
	{
		self thread handle_notetracks(animation);
		if(is_true(var_1abb7e22) && (getanimframecount(animation) > 1 || isanimlooping(animation)))
		{
			self waittillmatch({#notetrack:"end"}, animation);
		}
		else
		{
			waitframe(1);
		}
		if(b_link && is_true(b_unlink_after_completed))
		{
			self unlink();
		}
		if(isplayer(self))
		{
			self util::delay(float(function_60d95f53()) / 1000, array("disconnect", #"setviewclamp"), &function_d497dbe7);
		}
		self.str_current_anim = undefined;
		self.var_80c69db6 = undefined;
		self.var_6c4bb19 = undefined;
		flag::clear(#"scriptedanim");
		flag::clear(#"firstframe");
		/#
			debug_print(animation, "");
		#/
		waittillframeend();
		flag::clear(#"scripted_anim_this_frame");
	}
}

/*
	Name: function_2adc2518
	Namespace: animation
	Checksum: 0x81CDFD5C
	Offset: 0x1748
	Size: 0x9E
	Parameters: 1
	Flags: Linked
*/
function function_2adc2518(str_notify)
{
	if(isalive(self) && isplayer(self) && str_notify !== #"new_scripted_anim")
	{
		function_d497dbe7();
	}
	if(isdefined(self) && str_notify == "entering_last_stand")
	{
		self.var_80c69db6 = undefined;
		self.str_current_anim = undefined;
		self.var_6c4bb19 = undefined;
	}
}

/*
	Name: _blend_out
	Namespace: animation
	Checksum: 0xDBC7AFCF
	Offset: 0x17F0
	Size: 0x15A
	Parameters: 4
	Flags: Linked
*/
function _blend_out(animation, n_blend, n_rate, n_start_time)
{
	self endon(#"death", #"end", #"scriptedanim", #"new_scripted_anim");
	n_server_length = (floor(getanimlength(n_rate) / (float(function_60d95f53()) / 1000))) * (float(function_60d95f53()) / 1000);
	while(true)
	{
		n_current_time = self getanimtime(n_rate) * n_server_length;
		n_time_left = n_server_length - n_current_time;
		if(n_time_left <= n_start_time)
		{
			self stop(n_start_time);
			break;
		}
		waitframe(1);
	}
}

/*
	Name: _get_align_ent
	Namespace: animation
	Checksum: 0xA106D676
	Offset: 0x1958
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
	Checksum: 0xB1030565
	Offset: 0x19B0
	Size: 0x186
	Parameters: 2
	Flags: Linked
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
	Name: teleport
	Namespace: animation
	Checksum: 0xDFBF2C5E
	Offset: 0x1B40
	Size: 0xCC
	Parameters: 4
	Flags: None
*/
function teleport(animation, v_origin_or_ent, v_angles_or_tag, time)
{
	if(!isdefined(time))
	{
		time = 0;
	}
	s = _get_align_pos(v_origin_or_ent, v_angles_or_tag);
	v_pos = getstartorigin(s.origin, s.angles, animation, time);
	v_ang = getstartangles(s.origin, s.angles, animation, time);
	util::teleport(v_pos, v_ang);
}

/*
	Name: function_a23b2a60
	Namespace: animation
	Checksum: 0xA8195142
	Offset: 0x1C18
	Size: 0xDC
	Parameters: 3
	Flags: Linked
*/
function function_a23b2a60(animation, var_f9e56773, var_d7b4a07c)
{
	if(!isdefined(var_f9e56773))
	{
		var_f9e56773 = 0;
	}
	if(!isdefined(var_d7b4a07c))
	{
		var_d7b4a07c = 1;
	}
	/#
		assert(var_d7b4a07c > var_f9e56773);
	#/
	var_16e3f434 = getmovedelta(animation, var_f9e56773, var_d7b4a07c);
	animtime = getanimlength(animation);
	length = length2d(var_16e3f434);
	speed = length / (animtime * (var_d7b4a07c - var_f9e56773));
	return speed;
}

/*
	Name: reach
	Namespace: animation
	Checksum: 0x481248BA
	Offset: 0x1D00
	Size: 0xCC
	Parameters: 6
	Flags: Linked
*/
function reach(animation, v_origin_or_ent, v_angles_or_tag, b_disable_arrivals, b_shoot, var_5207b7a8)
{
	if(!isdefined(b_disable_arrivals))
	{
		b_disable_arrivals = 0;
	}
	if(!isdefined(b_shoot))
	{
		b_shoot = 1;
	}
	if(!isdefined(var_5207b7a8))
	{
		var_5207b7a8 = undefined;
	}
	self endon(#"death");
	s_tracker = spawnstruct();
	self thread _reach(s_tracker, animation, v_origin_or_ent, v_angles_or_tag, b_disable_arrivals, b_shoot, var_5207b7a8);
	s_tracker waittill(#"done");
}

/*
	Name: _reach
	Namespace: animation
	Checksum: 0xDD08F616
	Offset: 0x1DD8
	Size: 0x51E
	Parameters: 7
	Flags: Linked
*/
function _reach(s_tracker, animation, v_origin_or_ent, v_angles_or_tag, b_disable_arrivals, b_shoot, var_5207b7a8)
{
	if(!isdefined(b_disable_arrivals))
	{
		b_disable_arrivals = 0;
	}
	if(!isdefined(b_shoot))
	{
		b_shoot = 1;
	}
	if(!isdefined(var_5207b7a8))
	{
		var_5207b7a8 = undefined;
	}
	self endon(#"death");
	if(!isdefined(self.smart_object))
	{
		self notify(#"stop_going_to_node");
	}
	self notify(#"new_anim_reach");
	flag::wait_till_clear("anim_reach");
	flag::set(#"anim_reach");
	s = _get_align_pos(v_origin_or_ent, v_angles_or_tag);
	v_goal = getstartorigin(s.origin, s.angles, animation);
	n_delta = distancesquared(v_goal, self.origin);
	var_6e0391f9 = undefined;
	if(ai::has_behavior_attribute("demeanor"))
	{
		var_6e0391f9 = ai::get_behavior_attribute("demeanor");
	}
	if(isdefined(var_5207b7a8))
	{
		ai::set_behavior_attribute("demeanor", var_5207b7a8);
	}
	if(n_delta > 4 * 4)
	{
		self stop(0.2);
		if(b_disable_arrivals)
		{
			if(!is_true(self.var_b8b2cd98) && ai::has_behavior_attribute("disablearrivals"))
			{
				ai::set_behavior_attribute("disablearrivals", 1);
			}
			self.stopanimdistsq = 0.0001;
		}
		if(ai::has_behavior_attribute("vignette_mode") && !is_true(self.ignorevignettemodeforanimreach))
		{
			ai::set_behavior_attribute("vignette_mode", "fast");
		}
		self thread ai::force_goal(v_goal, b_shoot, "reach_timed_out", 0, 1);
		/#
			self thread debug_anim_reach(v_goal, animation);
		#/
		self thread function_ba45bb6c();
		self childthread function_d7627522(animation, v_goal);
		s_waitresult = undefined;
		s_waitresult = self waittill(#"goal", #"new_anim_reach", #"new_scripted_anim", #"stop_scripted_anim", #"reach_timed_out");
		/#
			if(s_waitresult._notify === "")
			{
				iprintlnbold((("" + function_9e72a96(animation)) + "") + v_goal);
				println((("" + function_9e72a96(animation)) + "") + v_goal);
			}
		#/
		if(ai::has_behavior_attribute("disablearrivals"))
		{
			ai::set_behavior_attribute("disablearrivals", 0);
			self.stopanimdistsq = 0;
		}
		self.var_b8b2cd98 = undefined;
	}
	else
	{
		waittillframeend();
	}
	if(ai::has_behavior_attribute("vignette_mode"))
	{
		ai::set_behavior_attribute("vignette_mode", "off");
	}
	if(isdefined(var_5207b7a8))
	{
		ai::set_behavior_attribute("demeanor", var_6e0391f9);
	}
	flag::clear(#"anim_reach");
	s_tracker notify(#"done");
	self notify(#"reach_done");
}

/*
	Name: function_d7627522
	Namespace: animation
	Checksum: 0xD9666A3
	Offset: 0x2300
	Size: 0x15C
	Parameters: 3
	Flags: Linked
*/
function function_d7627522(animation, v_goal, radius)
{
	if(!isdefined(radius))
	{
		radius = 100;
	}
	radiussq = sqr(radius);
	var_f11838cd = function_a23b2a60(animation, 0, 0.1);
	if(var_f11838cd <= 1 || var_f11838cd >= 300)
	{
		return;
	}
	while(distance2dsquared(self.origin, v_goal) > radiussq)
	{
		waitframe(1);
	}
	self function_2ce879d2(var_f11838cd);
	s_waitresult = undefined;
	s_waitresult = self waittill(#"goal", #"new_anim_reach", #"new_scripted_anim", #"stop_scripted_anim", #"reach_timed_out");
	self function_9ae1c50();
}

/*
	Name: function_ba45bb6c
	Namespace: animation
	Checksum: 0x73C56CFA
	Offset: 0x2468
	Size: 0x134
	Parameters: 0
	Flags: Linked
*/
function function_ba45bb6c()
{
	self endon(#"death", #"goal", #"new_anim_reach", #"new_scripted_anim", #"stop_scripted_anim", #"reach_done", #"reach_timed_out");
	var_89ae1c69 = self.origin;
	var_dc2b2d0b = 0;
	while(true)
	{
		wait(1);
		var_ab436758 = self.origin;
		if(distance(var_ab436758, var_89ae1c69) < 60)
		{
			var_dc2b2d0b = var_dc2b2d0b + 1;
		}
		else
		{
			var_dc2b2d0b = 0;
			var_89ae1c69 = self.origin;
		}
		if(var_dc2b2d0b > 10)
		{
			self notify(#"reach_timed_out");
			return;
		}
	}
}

/*
	Name: debug_anim_reach
	Namespace: animation
	Checksum: 0xCCFFAAB6
	Offset: 0x25A8
	Size: 0x166
	Parameters: 2
	Flags: None
*/
function debug_anim_reach(v_goal, str_anim)
{
	/#
		self endon(#"death", #"goal", #"new_anim_reach", #"new_scripted_anim", #"stop_scripted_anim");
		while(true)
		{
			level flag::wait_till("");
			print3d(self.origin, (((("" + function_9e72a96(str_anim)) + "") + v_goal) + "") + (ispointonnavmesh(v_goal) ? "" : ""), (1, 0, 0), 1, 0.4, 1);
			line(self.origin, v_goal, (1, 0, 0));
			circle(v_goal, 10, (1, 0, 0));
			waitframe(1);
		}
	#/
}

/*
	Name: set_death_anim
	Namespace: animation
	Checksum: 0x253E3D03
	Offset: 0x2718
	Size: 0x92
	Parameters: 7
	Flags: Linked
*/
function set_death_anim(animation, v_origin_or_ent, v_angles_or_tag, n_rate, n_blend_in, n_blend_out, n_lerp)
{
	self notify(#"new_death_anim");
	if(isdefined(animation))
	{
		self.skipdeath = 1;
		self thread _do_death_anim(animation, v_origin_or_ent, v_angles_or_tag, n_rate, n_blend_in, n_blend_out, n_lerp);
	}
	else
	{
		self.skipdeath = 0;
	}
}

/*
	Name: _do_death_anim
	Namespace: animation
	Checksum: 0xF1B887AC
	Offset: 0x27B8
	Size: 0xA4
	Parameters: 7
	Flags: Linked
*/
function _do_death_anim(animation, v_origin_or_ent, v_angles_or_tag, n_rate, n_blend_in, n_blend_out, n_lerp)
{
	self endon(#"new_death_anim");
	self waittill(#"death");
	if(isdefined(self) && !self isragdoll())
	{
		self play(animation, v_origin_or_ent, v_angles_or_tag, n_rate, n_blend_in, n_blend_out, n_lerp);
	}
}

/*
	Name: set_player_clamps
	Namespace: animation
	Checksum: 0x463CEF83
	Offset: 0x2868
	Size: 0xB2
	Parameters: 1
	Flags: Linked
*/
function set_player_clamps(blend_time)
{
	if(is_true(self.player_anim_look_enabled))
	{
		if(!isdefined(blend_time))
		{
			blend_time = 0;
		}
		if(blend_time > 0 && !is_true(self.var_cdb243ec))
		{
			wait(blend_time);
		}
		self setviewclamp(self.player_anim_clamp_right, self.player_anim_clamp_left, self.player_anim_clamp_top, self.player_anim_clamp_bottom, undefined, self.var_fcbf7c5a);
		self.var_cdb243ec = 1;
	}
}

/*
	Name: function_d497dbe7
	Namespace: animation
	Checksum: 0x330E8A7F
	Offset: 0x2928
	Size: 0x2E
	Parameters: 0
	Flags: Linked
*/
function function_d497dbe7()
{
	self setviewclamp(0, 0, 0, 0, undefined, 0);
	self.var_cdb243ec = undefined;
}

/*
	Name: add_notetrack_func
	Namespace: animation
	Checksum: 0x6B4BC773
	Offset: 0x2960
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
	Checksum: 0xA5021A0A
	Offset: 0x29E0
	Size: 0x11A
	Parameters: 4
	Flags: Linked, Variadic
*/
function add_global_notetrack_handler(str_note, func, pass_notify_params, ...)
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
	level._animnotetrackhandlers[str_note][level._animnotetrackhandlers[str_note].size] = array(func, pass_notify_params, vararg);
}

/*
	Name: call_notetrack_handler
	Namespace: animation
	Checksum: 0xCB33AF00
	Offset: 0x2B08
	Size: 0x120
	Parameters: 3
	Flags: Linked
*/
function call_notetrack_handler(str_note, param1, param2)
{
	if(isdefined(level._animnotetrackhandlers[str_note]))
	{
		foreach(handler in level._animnotetrackhandlers[str_note])
		{
			func = handler[0];
			passnotifyparams = handler[1];
			args = handler[2];
			if(passnotifyparams)
			{
				self [[func]](param1, param2);
				continue;
			}
			util::single_func_argarray(self, func, args);
		}
	}
}

/*
	Name: setup_notetracks
	Namespace: animation
	Checksum: 0x8825E662
	Offset: 0x2C30
	Size: 0x534
	Parameters: 0
	Flags: Linked
*/
function setup_notetracks()
{
	add_notetrack_func("flag::set", &flag::set);
	add_notetrack_func("flag::clear", &flag::clear);
	add_notetrack_func("util::break_glass", &util::break_glass);
	add_notetrack_func("PhysicsLaunch", &function_eb0aa7cf);
	add_notetrack_func("cinematicMotion::SpeedModifierServer", &cinematicmotion::function_92dd9a20);
	add_notetrack_func("cinematicMotion::OverrideServer", &cinematicmotion::function_bbf6e778);
	add_notetrack_func("PlayGestureViewmodel", &playgestureviewmodel);
	clientfield::register("scriptmover", "cracks_on", 1, getminbitcountfornum(4), "int");
	clientfield::register("scriptmover", "cracks_off", 1, getminbitcountfornum(4), "int");
	add_global_notetrack_handler("red_cracks_on", &cracks_on, 0, "red");
	add_global_notetrack_handler("green_cracks_on", &cracks_on, 0, "green");
	add_global_notetrack_handler("blue_cracks_on", &cracks_on, 0, "blue");
	add_global_notetrack_handler("all_cracks_on", &cracks_on, 0, "all");
	add_global_notetrack_handler("red_cracks_off", &cracks_off, 0, "red");
	add_global_notetrack_handler("green_cracks_off", &cracks_off, 0, "green");
	add_global_notetrack_handler("blue_cracks_off", &cracks_off, 0, "blue");
	add_global_notetrack_handler("all_cracks_off", &cracks_off, 0, "all");
	add_global_notetrack_handler("headlook_on", &enable_headlook, 0, 1);
	add_global_notetrack_handler("headlook_off", &enable_headlook, 0, 0);
	add_global_notetrack_handler("headlook_notorso_on", &enable_headlook_notorso, 0, 1);
	add_global_notetrack_handler("headlook_notorso_off", &enable_headlook_notorso, 0, 0);
	add_global_notetrack_handler("attach weapon", &attach_weapon, 1);
	add_global_notetrack_handler("detach weapon", &detach_weapon, 1);
	add_global_notetrack_handler("fire", &fire_weapon, 0);
	add_global_notetrack_handler("stop_anim", &function_6eb39026, 1);
	add_global_notetrack_handler("gun_up", &function_bd10424d, 0);
	add_global_notetrack_handler("gun_down", &function_e97a4b27, 0);
	add_global_notetrack_handler("gun_up_quick", &function_a37627b3, 0);
	add_global_notetrack_handler("gun_down_quick", &function_54657829, 0);
}

/*
	Name: handle_notetracks
	Namespace: animation
	Checksum: 0xC07DB0FB
	Offset: 0x3170
	Size: 0xCE
	Parameters: 1
	Flags: Linked
*/
function handle_notetracks(animation)
{
	self endon(#"death", #"new_scripted_anim");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(animation);
		str_note = waitresult.notetrack;
		if(isdefined(str_note))
		{
			if(str_note != "end" && str_note != "loop_end")
			{
				self thread call_notetrack_handler(str_note, waitresult.param2, waitresult.param3);
			}
			else
			{
				return;
			}
		}
	}
}

/*
	Name: cracks_on
	Namespace: animation
	Checksum: 0xB5926FAA
	Offset: 0x3248
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
			clientfield::set("cracks_on", 1);
			break;
		}
		case "green":
		{
			clientfield::set("cracks_on", 3);
			break;
		}
		case "blue":
		{
			clientfield::set("cracks_on", 2);
			break;
		}
		case "all":
		{
			clientfield::set("cracks_on", 4);
			break;
		}
	}
}

/*
	Name: cracks_off
	Namespace: animation
	Checksum: 0xBDD85E44
	Offset: 0x3338
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
			clientfield::set("cracks_off", 1);
			break;
		}
		case "green":
		{
			clientfield::set("cracks_off", 3);
			break;
		}
		case "blue":
		{
			clientfield::set("cracks_off", 2);
			break;
		}
		case "all":
		{
			clientfield::set("cracks_off", 4);
			break;
		}
	}
}

/*
	Name: enable_headlook
	Namespace: animation
	Checksum: 0xA3883056
	Offset: 0x3428
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function enable_headlook(b_on)
{
	if(!isdefined(b_on))
	{
		b_on = 1;
	}
	if(isactor(self))
	{
		if(b_on)
		{
			self lookatentity(level.players[0]);
		}
		else
		{
			self lookatentity();
		}
	}
}

/*
	Name: enable_headlook_notorso
	Namespace: animation
	Checksum: 0x2D9E2728
	Offset: 0x34A8
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function enable_headlook_notorso(b_on)
{
	if(!isdefined(b_on))
	{
		b_on = 1;
	}
	if(isactor(self))
	{
		if(b_on)
		{
			self lookatentity(level.players[0], 1);
		}
		else
		{
			self lookatentity();
		}
	}
}

/*
	Name: is_valid_weapon
	Namespace: animation
	Checksum: 0x6E947C51
	Offset: 0x3530
	Size: 0x5E
	Parameters: 1
	Flags: Linked
*/
function is_valid_weapon(weaponobject)
{
	if(!isdefined(level.weaponnone))
	{
		level.weaponnone = getweapon(#"none");
	}
	return isdefined(weaponobject) && weaponobject != level.weaponnone;
}

/*
	Name: attach_weapon
	Namespace: animation
	Checksum: 0xCB1E4374
	Offset: 0x3598
	Size: 0x192
	Parameters: 2
	Flags: Linked
*/
function attach_weapon(weaponobject, tag)
{
	if(!isdefined(tag))
	{
		tag = "tag_weapon_right";
	}
	if(isactor(self))
	{
		if(is_valid_weapon(weaponobject))
		{
			ai::gun_switchto(weaponobject.name, "right");
		}
		else
		{
			ai::gun_recall();
		}
	}
	else
	{
		if(!is_valid_weapon(weaponobject))
		{
			weaponobject = self.last_item;
		}
		if(is_valid_weapon(weaponobject))
		{
			if(self.item != level.weaponnone)
			{
				detach_weapon();
			}
			/#
				assert(isdefined(weaponobject.worldmodel));
			#/
			self attach(weaponobject.worldmodel, tag);
			if(is_true(self.var_8323de3e))
			{
				self setentityweapon(weaponobject, 1);
			}
			else
			{
				self setentityweapon(weaponobject);
			}
			self.gun_removed = undefined;
			self.last_item = weaponobject;
		}
	}
}

/*
	Name: detach_weapon
	Namespace: animation
	Checksum: 0x15356790
	Offset: 0x3738
	Size: 0xDA
	Parameters: 2
	Flags: Linked
*/
function detach_weapon(weaponobject, tag)
{
	if(!isdefined(tag))
	{
		tag = "tag_weapon_right";
	}
	if(isactor(self))
	{
		ai::gun_remove();
	}
	else
	{
		if(!is_valid_weapon(weaponobject))
		{
			weaponobject = self.item;
		}
		if(is_valid_weapon(weaponobject))
		{
			self detach(weaponobject.worldmodel, tag);
			self setentityweapon(level.weaponnone);
		}
		self.gun_removed = 1;
	}
}

/*
	Name: fire_weapon
	Namespace: animation
	Checksum: 0xD72C5359
	Offset: 0x3820
	Size: 0x16C
	Parameters: 0
	Flags: Linked
*/
function fire_weapon()
{
	if(!isai(self) && !function_8d8e91af(self))
	{
		if(self.item != level.weaponnone)
		{
			v_start_pos = (isdefined(self gettagorigin("tag_flash")) ? self gettagorigin("tag_flash") : self gettagorigin("tag_aim"));
			v_start_ang = (isdefined(self gettagangles("tag_flash")) ? self gettagangles("tag_flash") : self gettagangles("tag_aim"));
			v_end_pos = v_start_pos + vectorscale(anglestoforward(v_start_ang), 100);
			magicbullet(self.item, v_start_pos, v_end_pos, self);
		}
	}
}

/*
	Name: function_eb0aa7cf
	Namespace: animation
	Checksum: 0x3080C420
	Offset: 0x3998
	Size: 0x25C
	Parameters: 2
	Flags: Linked
*/
function function_eb0aa7cf(n_pulse, bone)
{
	if(!isdefined(n_pulse))
	{
		n_pulse = 100;
	}
	/#
		assert(!issentient(self), "");
	#/
	if(!isdefined(bone))
	{
		bone = "tag_physics_pulse";
	}
	var_8ef160cb = (isdefined(self gettagorigin(bone)) ? self gettagorigin(bone) : self getcentroid());
	n_pulse = float(n_pulse);
	if(n_pulse == 0)
	{
		self physicslaunch(var_8ef160cb);
	}
	else
	{
		var_cc487a10 = self gettagangles(bone);
		var_236556ec = vectorscale((0, 0, 1), 100);
		color = (1, 0, 0);
		if(isdefined(var_cc487a10))
		{
			var_236556ec = vectorscale(anglestoforward(var_cc487a10), n_pulse);
			color = (0, 1, 0);
		}
		else
		{
			x_dir = (math::cointoss() ? 1 : -1);
			y_dir = (math::cointoss() ? 1 : -1);
			z_dir = (math::cointoss() ? 1 : -1);
			var_236556ec = vectorscale((x_dir, y_dir, z_dir), n_pulse);
			color = (1, 1, 0);
		}
		self physicslaunch(var_8ef160cb, var_236556ec);
		/#
			util::draw_arrow_time(var_8ef160cb, var_8ef160cb + var_236556ec, color, 2);
		#/
	}
}

/*
	Name: function_6eb39026
	Namespace: animation
	Checksum: 0x76C9DE86
	Offset: 0x3C00
	Size: 0x6C
	Parameters: 2
	Flags: Linked
*/
function function_6eb39026(var_1d146ef3, str_param)
{
	if(!isdefined(str_param) || str_param == "")
	{
		str_param = 0.2;
	}
	else
	{
		str_param = float(str_param);
	}
	self stop(str_param);
}

/*
	Name: function_bd10424d
	Namespace: animation
	Checksum: 0x21E3DFA3
	Offset: 0x3C78
	Size: 0x64
	Parameters: 0
	Flags: Linked, Private
*/
function private function_bd10424d()
{
	player = self;
	if(currentsessionmode() == 2)
	{
		player = getplayers()[0];
	}
	player function_f2729fc0(0);
}

/*
	Name: function_e97a4b27
	Namespace: animation
	Checksum: 0xFB2B962D
	Offset: 0x3CE8
	Size: 0x64
	Parameters: 0
	Flags: Linked, Private
*/
function private function_e97a4b27()
{
	player = self;
	if(currentsessionmode() == 2)
	{
		player = getplayers()[0];
	}
	player function_d8cae271(0);
}

/*
	Name: function_a37627b3
	Namespace: animation
	Checksum: 0x1ED28720
	Offset: 0x3D58
	Size: 0x64
	Parameters: 0
	Flags: Linked, Private
*/
function private function_a37627b3()
{
	player = self;
	if(currentsessionmode() == 2)
	{
		player = getplayers()[0];
	}
	player function_f2729fc0(1);
}

/*
	Name: function_54657829
	Namespace: animation
	Checksum: 0xC2342848
	Offset: 0x3DC8
	Size: 0x64
	Parameters: 0
	Flags: Linked, Private
*/
function private function_54657829()
{
	player = self;
	if(currentsessionmode() == 2)
	{
		player = getplayers()[0];
	}
	player function_d8cae271(1);
}

/*
	Name: function_f2729fc0
	Namespace: animation
	Checksum: 0x9E4B3845
	Offset: 0x3E38
	Size: 0x94
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f2729fc0(quick)
{
	if(isdefined(self.var_d3b4e4f4))
	{
		self [[self.var_d3b4e4f4]](quick);
	}
	else
	{
		if(isdefined(level.var_d3b4e4f4))
		{
			self [[level.var_d3b4e4f4]](quick);
		}
		else if(isplayer(self))
		{
			self val::reset(#"animation_shared", "disable_weapons");
		}
	}
}

/*
	Name: function_d8cae271
	Namespace: animation
	Checksum: 0x519B37B7
	Offset: 0x3ED8
	Size: 0xAC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d8cae271(quick)
{
	if(isdefined(self.var_852e84c9))
	{
		self [[self.var_852e84c9]](quick);
	}
	else
	{
		if(isdefined(level.var_852e84c9))
		{
			self [[level.var_852e84c9]](quick);
		}
		else if(isplayer(self))
		{
			self val::set(#"animation_shared", "disable_weapons", (quick ? 2 : 1));
		}
	}
}

