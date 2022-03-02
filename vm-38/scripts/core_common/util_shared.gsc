#using script_2dc48f46bfeac894;
#using script_32c8b5b0eb2854f3;
#using script_3d703ef87a841fe4;
#using script_4194df57536e11ed;
#using script_51e19a6cd0b4d30f;
#using script_7f6cd71c43c45c57;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\weapons_shared.gsc;

#namespace util_shared;

/*
	Name: function_b0f1a100
	Namespace: util_shared
	Checksum: 0xE8805DD5
	Offset: 0x3B8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b0f1a100()
{
	level notify(310954237);
}

#namespace util;

/*
	Name: function_89f2df9
	Namespace: util
	Checksum: 0x41943B57
	Offset: 0x3D8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"util_shared", &function_70a657d8, undefined, &function_3cb7a62d, undefined);
}

/*
	Name: function_70a657d8
	Namespace: util
	Checksum: 0xAE3A7928
	Offset: 0x428
	Size: 0x94
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_9fee970c = function_60d95f53();
	function_73fab74d();
	function_f9ce1d49();
	register_clientfields();
	namespace_1e38a8f6::init();
	/#
		function_5ac4dc99("", 1);
	#/
	/#
		function_d0ca1d49();
	#/
}

/*
	Name: function_95d3192c
	Namespace: util
	Checksum: 0xD08AA075
	Offset: 0x4C8
	Size: 0x20
	Parameters: 1
	Flags: Private, Event
*/
event private function_95d3192c(eventstruct)
{
	level.var_1c5d2bf4 = eventstruct.var_6dfed201;
}

/*
	Name: register_clientfields
	Namespace: util
	Checksum: 0x3D8A8D33
	Offset: 0x4F0
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function register_clientfields()
{
	clientfield::register("world", "cf_team_mapping", 1, 1, "int");
	clientfield::register("world", "preload_frontend", 1, 1, "int");
}

/*
	Name: function_d0ca1d49
	Namespace: util
	Checksum: 0x92D13EFA
	Offset: 0x560
	Size: 0x2CE
	Parameters: 0
	Flags: None
*/
function function_d0ca1d49()
{
	/#
		foo = #"hash_2cbf19b375ce697b";
		foo = #"hash_181d101310c5b7d8";
		foo = #"hash_7d7aa223a009b278";
		foo = #"hash_20418753afb5fa52";
		foo = #"hash_378d2214490d6382";
		foo = #"hash_3436ce80f0d5c5d0";
		foo = #"hash_6621f02399acae09";
		foo = #"hash_30e901b829d424bd";
		foo = #"hash_2623a8dc653f53c4";
		foo = #"hash_7e1ddbe4460800cb";
		foo = #"hash_7b4c202f980d9dad";
		foo = #"hash_2090be0c418abec4";
		foo = #"hash_253100c3583a80f1";
		foo = #"hash_544c94c5fbac431c";
		foo = #"hash_6d1d6fcd128ab7b4";
		foo = #"hash_57758c2a11405c9e";
		foo = #"hash_e4328120e760ce3";
		foo = #"hash_6cbb59fa4b3f5a50";
		foo = #"hash_35002f9f1e35c896";
		foo = #"hash_297b5219ec680c76";
		foo = #"hash_505dc71b920e6128";
		foo = #"hash_8a348f3fe0535d0";
		foo = #"hash_5882b6a8f9547351";
		foo = #"hash_7b2e004311415ea7";
		foo = #"hash_463834f670f7faac";
		foo = #"hash_50eb3266c73376fa";
		foo = #"hash_59f0d889b0d9e974";
		foo = #"hash_46bfeaeb90cf3db4";
		foo = #"hash_715acca500367619";
		foo = #"hash_3f7121fa3e7804ba";
		foo = #"hash_7b8cee431191d495";
		foo = #"hash_7799488d593a04fa";
		foo = #"hash_6bd7b78c7f75bb76";
		foo = #"hash_38e2dc706b6e3aca";
		foo = #"hash_42d9eb2ff30acbf";
		foo = #"hash_3df08d3b3ec03a70";
		foo = #"hash_2e3ee9672a69326f";
		foo = #"hash_1d257299f8fcb384";
		foo = #"hash_50816054223f50e6";
		foo = #"hash_1df06c8b694f7f87";
		foo = #"hash_19944d4fce93c20a";
		foo = #"hash_6a28e9c680155a4d";
		foo = #"hash_79c0898a0bad8044";
		foo = #"hash_7dd72283dd0ab6f6";
	#/
}

/*
	Name: error
	Namespace: util
	Checksum: 0x14246864
	Offset: 0x838
	Size: 0xA4
	Parameters: 1
	Flags: None
*/
function error(msg)
{
	/#
		println("", msg);
		if(!sessionmodeismultiplayergame() && !function_f99d2668())
		{
			waitframe(1);
		}
		if(getdvar(#"debug", 0))
		{
			/#
				assertmsg("");
			#/
		}
	#/
}

/*
	Name: warning
	Namespace: util
	Checksum: 0xEB0C9DED
	Offset: 0x8E8
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function warning(msg)
{
	/#
		println("" + msg);
	#/
}

/*
	Name: void
	Namespace: util
	Checksum: 0xC488505D
	Offset: 0x928
	Size: 0xC
	Parameters: 1
	Flags: Linked, Variadic
*/
function void(vararg)
{
}

/*
	Name: wait_network_frame
	Namespace: util
	Checksum: 0x3C556F01
	Offset: 0x940
	Size: 0xEA
	Parameters: 1
	Flags: Linked
*/
function wait_network_frame(n_count)
{
	if(!isdefined(n_count))
	{
		n_count = 1;
	}
	if(numremoteclients())
	{
		for(i = 0; i < n_count; i++)
		{
			snapshot_ids = getsnapshotindexarray();
			acked = undefined;
			for(n_tries = 0; !isdefined(acked) && n_tries < 5; n_tries++)
			{
				level waittill(#"snapacknowledged");
				acked = snapshotacknowledged(snapshot_ids);
			}
		}
	}
	else
	{
		wait(0.1 * n_count);
	}
}

/*
	Name: preload_frontend
	Namespace: util
	Checksum: 0x73D037C4
	Offset: 0xA38
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function preload_frontend()
{
	level clientfield::set("preload_frontend", 1);
	wait_network_frame();
	level clientfield::set("preload_frontend", 0);
}

/*
	Name: clear_streamer_hint
	Namespace: util
	Checksum: 0x7F5F817F
	Offset: 0xA98
	Size: 0x12E
	Parameters: 1
	Flags: Linked
*/
function clear_streamer_hint(var_9e124d58)
{
	if(isarray(self.var_5cc1b17f))
	{
		foreach(e_streamer_hint in self.var_5cc1b17f)
		{
			if(isdefined(var_9e124d58))
			{
				if(e_streamer_hint === var_9e124d58)
				{
					e_streamer_hint delete();
					break;
				}
				continue;
			}
			if(!is_true(e_streamer_hint.var_d54e170d))
			{
				if(isdefined(e_streamer_hint))
				{
					e_streamer_hint delete();
				}
			}
		}
		arrayremovevalue(self.var_5cc1b17f, undefined);
	}
	self notify(#"wait_clear_streamer_hint");
}

/*
	Name: function_f6847a11
	Namespace: util
	Checksum: 0x375D2EB1
	Offset: 0xBD0
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function function_f6847a11()
{
	if(self == level)
	{
		foreach(player in getplayers())
		{
			player clear_streamer_hint();
		}
	}
	self clear_streamer_hint();
}

/*
	Name: wait_clear_streamer_hint
	Namespace: util
	Checksum: 0xE3BF9E4D
	Offset: 0xC90
	Size: 0x5C
	Parameters: 2
	Flags: Linked
*/
function wait_clear_streamer_hint(lifetime, e_streamer_hint)
{
	self endon(#"wait_clear_streamer_hint");
	self waittilltimeout(lifetime, #"clear_streamer_hint");
	if(isdefined(self))
	{
		self clear_streamer_hint(e_streamer_hint);
	}
}

/*
	Name: function_35840de8
	Namespace: util
	Checksum: 0xA858CE6B
	Offset: 0xCF8
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function function_35840de8(seconds)
{
	if(isdefined(seconds) && float(seconds) > 0)
	{
		wait(float(seconds));
	}
}

/*
	Name: create_streamer_hint
	Namespace: util
	Checksum: 0x642071C7
	Offset: 0xD50
	Size: 0x1C0
	Parameters: 7
	Flags: Linked
*/
function create_streamer_hint(origin, angles, value, lifetime, var_9045aedc, clear, var_d54e170d)
{
	if(!isdefined(clear))
	{
		clear = 1;
	}
	if(clear)
	{
		function_f6847a11();
	}
	if(!isdefined(self.var_5cc1b17f))
	{
		self.var_5cc1b17f = [];
	}
	var_c1b815dc = createstreamerhint(origin, value, var_9045aedc);
	var_c1b815dc.var_d54e170d = var_d54e170d;
	if(!isdefined(self.var_5cc1b17f))
	{
		self.var_5cc1b17f = [];
	}
	else if(!isarray(self.var_5cc1b17f))
	{
		self.var_5cc1b17f = array(self.var_5cc1b17f);
	}
	self.var_5cc1b17f[self.var_5cc1b17f.size] = var_c1b815dc;
	if(isdefined(angles))
	{
		var_c1b815dc.angles = angles;
	}
	if(self != level)
	{
		var_c1b815dc setinvisibletoall();
		var_c1b815dc setvisibletoplayer(self);
	}
	var_c1b815dc setincludemeshes(1);
	self notify(#"wait_clear_streamer_hint");
	if(isdefined(lifetime) && lifetime > 0)
	{
		self thread wait_clear_streamer_hint(lifetime, var_c1b815dc);
	}
	return var_c1b815dc;
}

/*
	Name: function_819c50c3
	Namespace: util
	Checksum: 0x455593C2
	Offset: 0xF18
	Size: 0xC2
	Parameters: 2
	Flags: Linked
*/
function function_819c50c3(n_stream_request_id, str_scenedef)
{
	if(isarray(self.var_16672042) && isdefined(self.var_16672042[str_scenedef]))
	{
		var_5a2f2554 = self.var_16672042[str_scenedef];
	}
	else
	{
		var_5a2f2554 = (isdefined(n_stream_request_id) ? n_stream_request_id : self.var_ecd30af1);
	}
	if(isdefined(var_5a2f2554))
	{
		if(var_5a2f2554 == -1)
		{
			return 1;
		}
		return self isstreamerready(var_5a2f2554);
	}
	return self isstreamerready();
}

/*
	Name: function_20120d2a
	Namespace: util
	Checksum: 0x779B4280
	Offset: 0xFE8
	Size: 0x98
	Parameters: 2
	Flags: None
*/
function function_20120d2a(n_stream_request_id, str_scenedef)
{
	/#
		if(isdefined(str_scenedef))
		{
			return ("" + function_9e72a96(str_scenedef)) + "";
		}
		return ("" + (isdefined((isdefined(n_stream_request_id) ? n_stream_request_id : self.var_ecd30af1)) ? (isdefined(n_stream_request_id) ? n_stream_request_id : self.var_ecd30af1) : -1)) + "";
	#/
}

/*
	Name: function_8b0c9d28
	Namespace: util
	Checksum: 0xAD5DA9CF
	Offset: 0x1090
	Size: 0x18C
	Parameters: 2
	Flags: None
*/
function function_8b0c9d28(n_wait_frames, var_5d93c5f1)
{
	if(!isdefined(n_wait_frames))
	{
		n_wait_frames = 3;
	}
	if(!isdefined(var_5d93c5f1))
	{
		var_5d93c5f1 = 15;
	}
	/#
		assert(isplayer(self));
	#/
	/#
		assert(sessionmodeiscampaigngame());
	#/
	/#
		var_62c78ae = getdvarint(#"hash_4eb9ff1768129046", 0);
		if(getdvarint(#"developer_script", 1) != 0 && !is_true(var_62c78ae))
		{
			waitframe(1);
			return;
		}
	#/
	level flag::increment("streamer_waits");
	if(n_wait_frames > 0)
	{
		wait_network_frame(n_wait_frames);
	}
	self function_5f6dddac(var_5d93c5f1);
	self waittill(#"hash_4a1a37d8aeaa2b95");
	waitframe(1);
	level flag::decrement("streamer_waits");
}

/*
	Name: streamer_wait
	Namespace: util
	Checksum: 0xC17FFCDB
	Offset: 0x1228
	Size: 0x5DC
	Parameters: 5
	Flags: Linked
*/
function streamer_wait(n_stream_request_id, n_wait_frames, n_timeout, str_team, str_scenedef)
{
	if(!isdefined(n_wait_frames))
	{
		n_wait_frames = 3;
	}
	if(!isdefined(n_timeout))
	{
		n_timeout = 15;
	}
	/#
		var_62c78ae = getdvarint(#"hash_4eb9ff1768129046", 0);
		if(getdvarint(#"developer_script", 1) != 0 && !is_true(var_62c78ae))
		{
			waitframe(1);
			return;
		}
		reason = "";
		request = "";
		start = gettime();
		var_e1f110d9 = start + 5000;
	#/
	level flag::increment("streamer_waits");
	var_b737eb14 = 1;
	if(n_wait_frames > 0)
	{
		wait_network_frame(n_wait_frames);
	}
	timeout = gettime() + (int(n_timeout * 1000));
	if(self == level)
	{
		n_num_streamers_ready = 0;
		do
		{
			wait_network_frame();
			n_num_streamers_ready = 0;
			if(isdefined(str_team))
			{
				a_players = getplayers(str_team);
			}
			else
			{
				a_players = getplayers();
			}
			foreach(player in a_players)
			{
				if(!player function_819c50c3(n_stream_request_id, str_scenedef))
				{
					/#
						request = "" + player function_20120d2a(n_stream_request_id, str_scenedef);
					#/
					continue;
				}
				n_num_streamers_ready++;
			}
			if(n_timeout > 0 && gettime() > timeout)
			{
				/#
					if(n_timeout > 5)
					{
						iprintln("");
						debug2dtext(vectorscale((1, 1, 0), 50), "", (1, 0, 0), 1, (0, 0, 0), 0, 2, 40);
						reason = (("" + request) + "") + n_timeout;
					}
				#/
				break;
			}
			var_b737eb14 = n_num_streamers_ready < max(1, a_players.size);
			/#
				if(var_62c78ae > 1 && var_b737eb14 && gettime() > var_e1f110d9)
				{
					iprintlnbold(("" + request) + "");
					var_e1f110d9 = gettime() + 5000;
				}
			#/
		}
		while(var_b737eb14);
		/#
			if(!var_b737eb14)
			{
				reason = (request + "") + ((float(gettime() - start)) / 1000);
			}
		#/
	}
	else
	{
		self endon(#"disconnect");
		/#
			request = "" + self function_20120d2a(n_stream_request_id, str_scenedef);
		#/
		var_b737eb14 = 1;
		do
		{
			wait_network_frame();
			if(n_timeout > 0 && gettime() > timeout)
			{
				/#
					reason = (("" + request) + "") + n_timeout;
				#/
				break;
			}
			if(self function_819c50c3(n_stream_request_id, str_scenedef))
			{
				var_b737eb14 = 0;
			}
			/#
				if(var_62c78ae > 1 && var_b737eb14 && gettime() > var_e1f110d9)
				{
					iprintlnbold(("" + request) + "");
					var_e1f110d9 = gettime() + 5000;
				}
			#/
		}
		while(var_b737eb14);
		/#
			if(!var_b737eb14)
			{
				reason = (request + "") + ((float(gettime() - start)) / 1000);
			}
		#/
	}
	/#
		if(var_62c78ae > 1)
		{
			iprintlnbold("" + reason);
		}
	#/
	level flag::decrement("streamer_waits");
}

/*
	Name: function_52d401ed
	Namespace: util
	Checksum: 0x8FEC67C9
	Offset: 0x1810
	Size: 0x6E
	Parameters: 0
	Flags: None
*/
function function_52d401ed()
{
	if(isbot(self))
	{
		return false;
	}
	if(is_true(self.hasspawned))
	{
		return false;
	}
	if(gamestate::is_state(#"pregame"))
	{
		return false;
	}
	return true;
}

/*
	Name: function_21678f2c
	Namespace: util
	Checksum: 0x6D424D93
	Offset: 0x1888
	Size: 0x1F6
	Parameters: 4
	Flags: Linked
*/
function function_21678f2c(players, timeout, mintime, var_552f6263)
{
	if(!isdefined(timeout))
	{
		timeout = getdvarint(#"hash_6974ec4bbf3b9e97");
	}
	if(!isdefined(mintime))
	{
		mintime = 2000;
	}
	if(!isdefined(var_552f6263))
	{
		var_552f6263 = 0;
	}
	starttime = gettime();
	while(true)
	{
		var_9e72bc5d = gettime();
		if(var_9e72bc5d - starttime > timeout)
		{
			waittillframeend();
			return;
		}
		if(var_9e72bc5d - starttime > mintime)
		{
			var_351d88ca = 1;
			foreach(player in players)
			{
				if(!isdefined(player))
				{
					continue;
				}
				if(var_552f6263 && isdefined(player.predicted_spawn_point))
				{
					player setorigin(player.predicted_spawn_point.origin);
					player setplayerangles(player.predicted_spawn_point.angles);
				}
				if(!player isstreamerready(-1, 1))
				{
					var_351d88ca = 0;
				}
				player resetinactivitytimer();
			}
			if(var_351d88ca)
			{
				waittillframeend();
				return;
			}
		}
		waitframe(1);
	}
}

/*
	Name: draw_debug_line
	Namespace: util
	Checksum: 0x93E97E92
	Offset: 0x1A88
	Size: 0x72
	Parameters: 3
	Flags: None
*/
function draw_debug_line(start, end, timer)
{
	/#
		for(i = 0; i < timer * 20; i++)
		{
			line(start, end, (1, 1, 0.5));
			waitframe(1);
		}
	#/
}

/*
	Name: debug_line
	Namespace: util
	Checksum: 0xB360B67F
	Offset: 0x1B08
	Size: 0x94
	Parameters: 6
	Flags: None
*/
function debug_line(start, end, color, alpha, depthtest, duration)
{
	/#
		if(!isdefined(color))
		{
			color = (1, 1, 1);
		}
		if(!isdefined(alpha))
		{
			alpha = 1;
		}
		if(!isdefined(depthtest))
		{
			depthtest = 0;
		}
		if(!isdefined(duration))
		{
			duration = 100;
		}
		line(start, end, color, alpha, depthtest, duration);
	#/
}

/*
	Name: debug_spherical_cone
	Namespace: util
	Checksum: 0x71DB4671
	Offset: 0x1BA8
	Size: 0xBC
	Parameters: 8
	Flags: None
*/
function debug_spherical_cone(origin, domeapex, angle, slices, color, alpha, depthtest, duration)
{
	/#
		if(!isdefined(slices))
		{
			slices = 10;
		}
		if(!isdefined(color))
		{
			color = (1, 1, 1);
		}
		if(!isdefined(alpha))
		{
			alpha = 1;
		}
		if(!isdefined(depthtest))
		{
			depthtest = 0;
		}
		if(!isdefined(duration))
		{
			duration = 100;
		}
		sphericalcone(origin, domeapex, angle, slices, color, alpha, depthtest, duration);
	#/
}

/*
	Name: debug_sphere
	Namespace: util
	Checksum: 0x623A44A
	Offset: 0x1C70
	Size: 0xB4
	Parameters: 5
	Flags: None
*/
function debug_sphere(origin, radius, color, alpha, time)
{
	/#
		if(!isdefined(time))
		{
			time = 1000;
		}
		if(!isdefined(color))
		{
			color = (1, 1, 1);
		}
		sides = int(10 * (1 + (int(radius) % 100)));
		sphere(origin, radius, color, alpha, 1, sides, time);
	#/
}

/*
	Name: plot_points
	Namespace: util
	Checksum: 0xF1DF60D6
	Offset: 0x1D30
	Size: 0xD6
	Parameters: 5
	Flags: None
*/
function plot_points(plotpoints, r, g, b, timer)
{
	/#
		lastpoint = plotpoints[0];
		if(!isdefined(r))
		{
			r = 1;
		}
		if(!isdefined(g))
		{
			g = 1;
		}
		if(!isdefined(b))
		{
			b = 1;
		}
		if(!isdefined(timer))
		{
			timer = 0.05;
		}
		for(i = 1; i < plotpoints.size; i++)
		{
			thread draw_line_for_time(lastpoint, plotpoints[i], r, g, b, timer);
			lastpoint = plotpoints[i];
		}
	#/
}

/*
	Name: draw_arrow_time
	Namespace: util
	Checksum: 0xD7E78EEC
	Offset: 0x1E10
	Size: 0x274
	Parameters: 4
	Flags: None
*/
function draw_arrow_time(start, end, color, timer)
{
	/#
		level endon(#"newpath");
		pts = [];
		angles = vectortoangles(start - end);
		right = anglestoright(angles);
		forward = anglestoforward(angles);
		up = anglestoup(angles);
		dist = distance(start, end);
		arrow = [];
		arrow[0] = start;
		arrow[1] = (start + (vectorscale(right, dist * 0.1))) + (vectorscale(forward, dist * -0.1));
		arrow[2] = end;
		arrow[3] = (start + (vectorscale(right, dist * -1 * 0.1))) + (vectorscale(forward, dist * -0.1));
		arrow[4] = start;
		arrow[5] = (start + (vectorscale(up, dist * 0.1))) + (vectorscale(forward, dist * -0.1));
		arrow[6] = end;
		arrow[7] = (start + (vectorscale(up, dist * -1 * 0.1))) + (vectorscale(forward, dist * -0.1));
		arrow[8] = start;
		r = color[0];
		g = color[1];
		b = color[2];
		plot_points(arrow, r, g, b, timer);
	#/
}

/*
	Name: draw_arrow
	Namespace: util
	Checksum: 0x5FE8C9A5
	Offset: 0x2090
	Size: 0x1D4
	Parameters: 3
	Flags: None
*/
function draw_arrow(start, end, color)
{
	/#
		level endon(#"newpath");
		pts = [];
		angles = vectortoangles(start - end);
		right = anglestoright(angles);
		forward = anglestoforward(angles);
		dist = distance(start, end);
		arrow = [];
		arrow[0] = start;
		arrow[1] = (start + (vectorscale(right, dist * 0.05))) + (vectorscale(forward, dist * -0.2));
		arrow[2] = end;
		arrow[3] = (start + (vectorscale(right, dist * -1 * 0.05))) + (vectorscale(forward, dist * -0.2));
		for(p = 0; p < 4; p++)
		{
			nextpoint = p + 1;
			if(nextpoint >= 4)
			{
				nextpoint = 0;
			}
			line(arrow[p], arrow[nextpoint], color, 1);
		}
	#/
}

/*
	Name: debugorigin
	Namespace: util
	Checksum: 0x22D87BCA
	Offset: 0x2270
	Size: 0x1D6
	Parameters: 0
	Flags: None
*/
function debugorigin()
{
	/#
		self notify(#"hash_45a5e6185b1b69aa");
		self endon(#"hash_45a5e6185b1b69aa", #"death");
		for(;;)
		{
			forward = anglestoforward(self.angles);
			forwardfar = vectorscale(forward, 30);
			forwardclose = vectorscale(forward, 20);
			right = anglestoright(self.angles);
			left = vectorscale(right, -10);
			right = vectorscale(right, 10);
			line(self.origin, self.origin + forwardfar, (0.9, 0.7, 0.6), 0.9);
			line(self.origin + forwardfar, (self.origin + forwardclose) + right, (0.9, 0.7, 0.6), 0.9);
			line(self.origin + forwardfar, (self.origin + forwardclose) + left, (0.9, 0.7, 0.6), 0.9);
			waitframe(1);
		}
	#/
}

/*
	Name: draw_line_for_time
	Namespace: util
	Checksum: 0xCDC62420
	Offset: 0x2450
	Size: 0xA6
	Parameters: 6
	Flags: None
*/
function draw_line_for_time(org1, org2, r, g, b, timer)
{
	/#
		timer = gettime() + (timer * 1000);
		while(gettime() < timer)
		{
			line(org1, org2, (r, g, b), 1);
			recordline(org1, org2, (1, 1, 1), "");
			waitframe(1);
		}
	#/
}

/*
	Name: function_6844bea4
	Namespace: util
	Checksum: 0xCC68A94C
	Offset: 0x2500
	Size: 0x14C
	Parameters: 6
	Flags: None
*/
function function_6844bea4(radius1, radius2, time, color, origin, normal)
{
	/#
		if(!isdefined(color))
		{
			color = (0, 1, 0);
		}
		circleres = 6;
		circleinc = 360 / circleres;
		circleres++;
		plotpoints = [];
		rad = 0;
		radius = radius2;
		angletoplayer = vectortoangles(normal);
		for(i = 0; i < circleres; i++)
		{
			plotpoints[plotpoints.size] = origin + (vectorscale(anglestoforward(angletoplayer + (rad, 90, 0)), radius));
			rad = rad + circleinc;
		}
		plot_points(plotpoints, color[0], color[1], color[2], time);
	#/
}

/*
	Name: track
	Namespace: util
	Checksum: 0xBE29DFA6
	Offset: 0x2658
	Size: 0x36
	Parameters: 1
	Flags: None
*/
function track(spot_to_track)
{
	if(isdefined(self.current_target))
	{
		if(spot_to_track == self.current_target)
		{
			return;
		}
	}
	self.current_target = spot_to_track;
}

/*
	Name: waittill_string
	Namespace: util
	Checksum: 0xFCBEB22C
	Offset: 0x2698
	Size: 0x80
	Parameters: 2
	Flags: Linked
*/
function waittill_string(msg, ent)
{
	if(msg != "death")
	{
		self endon(#"death");
	}
	ent endon(#"die");
	self waittill(msg);
	ent notify(#"returned", {#msg:msg});
}

/*
	Name: waittill_level_string
	Namespace: util
	Checksum: 0x91F1E572
	Offset: 0x2720
	Size: 0x80
	Parameters: 3
	Flags: Linked
*/
function waittill_level_string(msg, ent, otherent)
{
	otherent endon(#"death");
	ent endon(#"die");
	level waittill(msg);
	ent notify(#"returned", {#msg:msg});
}

/*
	Name: waittill_multiple
	Namespace: util
	Checksum: 0xD771258E
	Offset: 0x27A8
	Size: 0x9C
	Parameters: 1
	Flags: Variadic
*/
function waittill_multiple(...)
{
	s_tracker = spawnstruct();
	s_tracker._wait_count = 0;
	for(i = 0; i < vararg.size; i++)
	{
		self thread _waitlogic(s_tracker, vararg[i]);
	}
	if(s_tracker._wait_count > 0)
	{
		s_tracker waittill(#"waitlogic_finished");
	}
}

/*
	Name: break_glass
	Namespace: util
	Checksum: 0x310E0CD0
	Offset: 0x2850
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function break_glass(n_radius)
{
	if(!isdefined(n_radius))
	{
		n_radius = 50;
	}
	n_radius = float(n_radius);
	if(n_radius == -1)
	{
		v_origin_offset = (0, 0, 0);
		n_radius = 100;
	}
	else
	{
		v_origin_offset = vectorscale((0, 0, 1), 40);
	}
	glassradiusdamage(self.origin + v_origin_offset, n_radius, 500, 500);
}

/*
	Name: waittill_multiple_ents
	Namespace: util
	Checksum: 0xBBD03E83
	Offset: 0x2908
	Size: 0x1A4
	Parameters: 1
	Flags: Variadic
*/
function waittill_multiple_ents(...)
{
	a_ents = [];
	a_notifies = [];
	for(i = 0; i < vararg.size; i++)
	{
		if(i % 2)
		{
			if(!isdefined(a_notifies))
			{
				a_notifies = [];
			}
			else if(!isarray(a_notifies))
			{
				a_notifies = array(a_notifies);
			}
			a_notifies[a_notifies.size] = vararg[i];
			continue;
		}
		if(!isdefined(a_ents))
		{
			a_ents = [];
		}
		else if(!isarray(a_ents))
		{
			a_ents = array(a_ents);
		}
		a_ents[a_ents.size] = vararg[i];
	}
	s_tracker = spawnstruct();
	s_tracker._wait_count = 0;
	for(i = 0; i < a_ents.size; i++)
	{
		ent = a_ents[i];
		if(isdefined(ent))
		{
			ent thread _waitlogic(s_tracker, a_notifies[i]);
		}
	}
	if(s_tracker._wait_count > 0)
	{
		s_tracker waittill(#"waitlogic_finished");
	}
}

/*
	Name: _waitlogic
	Namespace: util
	Checksum: 0x1A4017E7
	Offset: 0x2AB8
	Size: 0xB0
	Parameters: 2
	Flags: Linked
*/
function _waitlogic(s_tracker, notifies)
{
	s_tracker._wait_count++;
	if(!isdefined(notifies))
	{
		notifies = [];
	}
	else if(!isarray(notifies))
	{
		notifies = array(notifies);
	}
	notifies[notifies.size] = "death";
	self waittill(notifies);
	s_tracker._wait_count--;
	if(s_tracker._wait_count == 0)
	{
		s_tracker notify(#"waitlogic_finished");
	}
}

/*
	Name: waittill_level_any_timeout
	Namespace: util
	Checksum: 0x5CA931C2
	Offset: 0x2B70
	Size: 0x1BA
	Parameters: 7
	Flags: Linked
*/
function waittill_level_any_timeout(n_timeout, otherent, string1, string2, string3, string4, string5)
{
	otherent endon(#"death");
	ent = spawnstruct();
	if(isdefined(string1))
	{
		level thread waittill_level_string(string1, ent, otherent);
	}
	if(isdefined(string2))
	{
		level thread waittill_level_string(string2, ent, otherent);
	}
	if(isdefined(string3))
	{
		level thread waittill_level_string(string3, ent, otherent);
	}
	if(isdefined(string4))
	{
		level thread waittill_level_string(string4, ent, otherent);
	}
	if(isdefined(string5))
	{
		level thread waittill_level_string(string5, ent, otherent);
	}
	if(isdefined(otherent))
	{
		otherent thread waittill_string("death", ent);
	}
	ent thread _timeout(n_timeout);
	waitresult = undefined;
	waitresult = ent waittill(#"returned");
	ent notify(#"die");
	return waitresult.msg;
}

/*
	Name: _timeout
	Namespace: util
	Checksum: 0xA43B85CD
	Offset: 0x2D38
	Size: 0x56
	Parameters: 1
	Flags: Linked
*/
function _timeout(delay)
{
	self endon(#"die");
	wait(delay);
	self notify(#"returned", {#msg:"timeout"});
}

/*
	Name: waittill_any_ents
	Namespace: util
	Checksum: 0xC0B39BD2
	Offset: 0x2D98
	Size: 0x14A
	Parameters: 14
	Flags: Linked
*/
function waittill_any_ents(ent1, string1, ent2, string2, ent3, string3, ent4, string4, ent5, string5, ent6, string6, ent7, string7)
{
	/#
		assert(isdefined(ent1));
	#/
	/#
		assert(isdefined(string1));
	#/
	if(isdefined(ent2) && isdefined(string2))
	{
		ent2 endon(string2);
	}
	if(isdefined(ent3) && isdefined(string3))
	{
		ent3 endon(string3);
	}
	if(isdefined(ent4) && isdefined(string4))
	{
		ent4 endon(string4);
	}
	if(isdefined(ent5) && isdefined(string5))
	{
		ent5 endon(string5);
	}
	if(isdefined(ent6) && isdefined(string6))
	{
		ent6 endon(string6);
	}
	if(isdefined(ent7) && isdefined(string7))
	{
		ent7 endon(string7);
	}
	ent1 waittill(string1);
}

/*
	Name: waittill_any_ents_two
	Namespace: util
	Checksum: 0x77D4415E
	Offset: 0x2EF0
	Size: 0x78
	Parameters: 4
	Flags: Linked
*/
function waittill_any_ents_two(ent1, string1, ent2, string2)
{
	/#
		assert(isdefined(ent1));
	#/
	/#
		assert(isdefined(string1));
	#/
	if(isdefined(ent2) && isdefined(string2))
	{
		ent2 endon(string2);
	}
	ent1 waittill(string1);
}

/*
	Name: isflashed
	Namespace: util
	Checksum: 0xBBA37B1C
	Offset: 0x2F70
	Size: 0x20
	Parameters: 0
	Flags: None
*/
function isflashed()
{
	if(!isdefined(self.flashendtime))
	{
		return 0;
	}
	return gettime() < self.flashendtime;
}

/*
	Name: isstunned
	Namespace: util
	Checksum: 0x24802C70
	Offset: 0x2F98
	Size: 0x20
	Parameters: 0
	Flags: None
*/
function isstunned()
{
	if(!isdefined(self.flashendtime))
	{
		return 0;
	}
	return gettime() < self.flashendtime;
}

/*
	Name: single_func
	Namespace: util
	Checksum: 0xDE39164D
	Offset: 0x2FC0
	Size: 0x32
	Parameters: 3
	Flags: Linked, Variadic
*/
function single_func(entity, func, ...)
{
	return _single_func(entity, func, vararg);
}

/*
	Name: single_func_argarray
	Namespace: util
	Checksum: 0x7F5FE5CF
	Offset: 0x3000
	Size: 0x32
	Parameters: 3
	Flags: Linked
*/
function single_func_argarray(entity, func, a_vars)
{
	return _single_func(entity, func, a_vars);
}

/*
	Name: _single_func
	Namespace: util
	Checksum: 0xE9DF14B0
	Offset: 0x3040
	Size: 0x48A
	Parameters: 3
	Flags: Linked
*/
function _single_func(entity, func, a_vars)
{
	_clean_up_arg_array(a_vars);
	switch(a_vars.size)
	{
		case 8:
		{
			if(isdefined(entity))
			{
				return entity [[func]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6], a_vars[7]);
			}
			else
			{
				return [[func]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6], a_vars[7]);
			}
			break;
		}
		case 7:
		{
			if(isdefined(entity))
			{
				return entity [[func]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6]);
			}
			else
			{
				return [[func]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6]);
			}
			break;
		}
		case 6:
		{
			if(isdefined(entity))
			{
				return entity [[func]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5]);
			}
			else
			{
				return [[func]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5]);
			}
			break;
		}
		case 5:
		{
			if(isdefined(entity))
			{
				return entity [[func]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4]);
			}
			else
			{
				return [[func]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4]);
			}
			break;
		}
		case 4:
		{
			if(isdefined(entity))
			{
				return entity [[func]](a_vars[0], a_vars[1], a_vars[2], a_vars[3]);
			}
			else
			{
				return [[func]](a_vars[0], a_vars[1], a_vars[2], a_vars[3]);
			}
			break;
		}
		case 3:
		{
			if(isdefined(entity))
			{
				return entity [[func]](a_vars[0], a_vars[1], a_vars[2]);
			}
			else
			{
				return [[func]](a_vars[0], a_vars[1], a_vars[2]);
			}
			break;
		}
		case 2:
		{
			if(isdefined(entity))
			{
				return entity [[func]](a_vars[0], a_vars[1]);
			}
			else
			{
				return [[func]](a_vars[0], a_vars[1]);
			}
			break;
		}
		case 1:
		{
			if(isdefined(entity))
			{
				return entity [[func]](a_vars[0]);
			}
			else
			{
				return [[func]](a_vars[0]);
			}
			break;
		}
		case 0:
		{
			if(isdefined(entity))
			{
				return entity [[func]]();
			}
			else
			{
				return [[func]]();
			}
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

/*
	Name: _clean_up_arg_array
	Namespace: util
	Checksum: 0xDA5B3215
	Offset: 0x34D8
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function _clean_up_arg_array(&a_vars)
{
	for(i = a_vars.size - 1; i >= 0; i--)
	{
		if(a_vars[i] === undefined)
		{
			arrayremoveindex(a_vars, i, 0);
			continue;
		}
		break;
	}
}

/*
	Name: new_func
	Namespace: util
	Checksum: 0xF1D16D91
	Offset: 0x3548
	Size: 0xAE
	Parameters: 7
	Flags: None
*/
function new_func(func, arg1, arg2, arg3, arg4, arg5, arg6)
{
	s_func = spawnstruct();
	s_func.func = func;
	s_func.arg1 = arg1;
	s_func.arg2 = arg2;
	s_func.arg3 = arg3;
	s_func.arg4 = arg4;
	s_func.arg5 = arg5;
	s_func.arg6 = arg6;
	return s_func;
}

/*
	Name: call_func
	Namespace: util
	Checksum: 0x256ED13E
	Offset: 0x3600
	Size: 0x5A
	Parameters: 1
	Flags: None
*/
function call_func(s_func)
{
	return single_func(self, s_func.func, s_func.arg1, s_func.arg2, s_func.arg3, s_func.arg4, s_func.arg5, s_func.arg6);
}

/*
	Name: single_thread
	Namespace: util
	Checksum: 0xFC2277F4
	Offset: 0x3668
	Size: 0x3C
	Parameters: 3
	Flags: Linked, Variadic
*/
function single_thread(entity, func, ...)
{
	_single_thread(entity, func, undefined, undefined, vararg);
}

/*
	Name: single_thread_argarray
	Namespace: util
	Checksum: 0xD0CC77D4
	Offset: 0x36B0
	Size: 0x3C
	Parameters: 3
	Flags: Linked
*/
function single_thread_argarray(entity, func, &a_vars)
{
	_single_thread(entity, func, undefined, undefined, a_vars);
}

/*
	Name: function_50f54b6f
	Namespace: util
	Checksum: 0x9C3AD37F
	Offset: 0x36F8
	Size: 0x44
	Parameters: 4
	Flags: Linked
*/
function function_50f54b6f(entity, func, arg1, &a_vars)
{
	_single_thread(entity, func, arg1, undefined, a_vars);
}

/*
	Name: function_cf55c866
	Namespace: util
	Checksum: 0x8536AF3F
	Offset: 0x3748
	Size: 0x4C
	Parameters: 5
	Flags: Linked
*/
function function_cf55c866(entity, func, arg1, arg2, &a_vars)
{
	_single_thread(entity, func, arg1, arg2, a_vars);
}

/*
	Name: _single_thread
	Namespace: util
	Checksum: 0x51A573E0
	Offset: 0x37A0
	Size: 0x85A
	Parameters: 5
	Flags: Linked
*/
function _single_thread(entity, func, arg1, arg2, &a_vars)
{
	_clean_up_arg_array(a_vars);
	/#
		/#
			assert(isfunctionptr(func), "" + "");
		#/
	#/
	if(!isfunctionptr(func))
	{
		return;
	}
	if(isdefined(arg2))
	{
		switch(a_vars.size)
		{
			case 8:
			{
				entity thread [[func]](arg1, arg2, a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6], a_vars[7]);
				break;
			}
			case 7:
			{
				entity thread [[func]](arg1, arg2, a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6]);
				break;
			}
			case 6:
			{
				entity thread [[func]](arg1, arg2, a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5]);
				break;
			}
			case 5:
			{
				entity thread [[func]](arg1, arg2, a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4]);
				break;
			}
			case 4:
			{
				entity thread [[func]](arg1, arg2, a_vars[0], a_vars[1], a_vars[2], a_vars[3]);
				break;
			}
			case 3:
			{
				entity thread [[func]](arg1, arg2, a_vars[0], a_vars[1], a_vars[2]);
				break;
			}
			case 2:
			{
				entity thread [[func]](arg1, arg2, a_vars[0], a_vars[1]);
				break;
			}
			case 1:
			{
				entity thread [[func]](arg1, arg2, a_vars[0]);
				break;
			}
			case 0:
			{
				entity thread [[func]](arg1, arg2);
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
	else
	{
		if(isdefined(arg1))
		{
			switch(a_vars.size)
			{
				case 8:
				{
					entity thread [[func]](arg1, a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6], a_vars[7]);
					break;
				}
				case 7:
				{
					entity thread [[func]](arg1, a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6]);
					break;
				}
				case 6:
				{
					entity thread [[func]](arg1, a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5]);
					break;
				}
				case 5:
				{
					entity thread [[func]](arg1, a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4]);
					break;
				}
				case 4:
				{
					entity thread [[func]](arg1, a_vars[0], a_vars[1], a_vars[2], a_vars[3]);
					break;
				}
				case 3:
				{
					entity thread [[func]](arg1, a_vars[0], a_vars[1], a_vars[2]);
					break;
				}
				case 2:
				{
					entity thread [[func]](arg1, a_vars[0], a_vars[1]);
					break;
				}
				case 1:
				{
					entity thread [[func]](arg1, a_vars[0]);
					break;
				}
				case 0:
				{
					entity thread [[func]](arg1);
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
		else
		{
			switch(a_vars.size)
			{
				case 8:
				{
					entity thread [[func]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6], a_vars[7]);
					break;
				}
				case 7:
				{
					entity thread [[func]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6]);
					break;
				}
				case 6:
				{
					entity thread [[func]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5]);
					break;
				}
				case 5:
				{
					entity thread [[func]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4]);
					break;
				}
				case 4:
				{
					entity thread [[func]](a_vars[0], a_vars[1], a_vars[2], a_vars[3]);
					break;
				}
				case 3:
				{
					entity thread [[func]](a_vars[0], a_vars[1], a_vars[2]);
					break;
				}
				case 2:
				{
					entity thread [[func]](a_vars[0], a_vars[1]);
					break;
				}
				case 1:
				{
					entity thread [[func]](a_vars[0]);
					break;
				}
				case 0:
				{
					entity thread [[func]]();
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
	Name: function_9a464797
	Namespace: util
	Checksum: 0xCD96A15A
	Offset: 0x4008
	Size: 0x7C
	Parameters: 1
	Flags: Private, Event
*/
event private function_9a464797(eventstruct)
{
	level endon(eventstruct.var_e81ce538);
	wait(randomintrange(10, 30));
	/#
		println("" + eventstruct.var_e81ce538);
	#/
	function_17cf7de1(2);
}

/*
	Name: script_delay
	Namespace: util
	Checksum: 0xBF7E0625
	Offset: 0x4090
	Size: 0xCA
	Parameters: 0
	Flags: Linked
*/
function script_delay()
{
	n_time = gettime();
	self.var_653e059d = 1;
	function_35840de8(self.script_delay);
	n_min_delay = (isdefined(self.script_delay_min) ? self.script_delay_min : 0);
	n_max_delay = (isdefined(self.script_delay_max) ? self.script_delay_max : 0);
	if(n_max_delay > n_min_delay)
	{
		wait(randomfloatrange(n_min_delay, n_max_delay));
	}
	else if(n_min_delay > 0)
	{
		wait(n_min_delay);
	}
	if(isdefined(self))
	{
		self.var_653e059d = undefined;
	}
	return gettime() - n_time;
}

/*
	Name: timeout
	Namespace: util
	Checksum: 0x542F6573
	Offset: 0x4168
	Size: 0xB4
	Parameters: 8
	Flags: Linked
*/
function timeout(n_time, func, arg1, arg2, arg3, arg4, arg5, arg6)
{
	if(isdefined(n_time))
	{
		__s = spawnstruct();
		__s endon(#"timeout");
		__s delay_notify(n_time, "timeout");
	}
	single_func(self, func, arg1, arg2, arg3, arg4, arg5, arg6);
}

/*
	Name: create_flags_and_return_tokens
	Namespace: util
	Checksum: 0x4E6E948A
	Offset: 0x4228
	Size: 0x78
	Parameters: 1
	Flags: Linked
*/
function create_flags_and_return_tokens(flags)
{
	tokens = strtok(flags, " ");
	for(i = 0; i < tokens.size; i++)
	{
		level trigger::function_ac2f203a(tokens[i]);
	}
	return tokens;
}

/*
	Name: function_aebdb74f
	Namespace: util
	Checksum: 0x2028AD06
	Offset: 0x42A8
	Size: 0xB8
	Parameters: 1
	Flags: Linked
*/
function function_aebdb74f(var_a8ca40f5)
{
	var_af1bea51 = strtok(var_a8ca40f5, " ");
	foreach(str_flag in var_af1bea51)
	{
		level flag::set(str_flag);
	}
}

/*
	Name: fileprint_start
	Namespace: util
	Checksum: 0xE8ABFD6A
	Offset: 0x4368
	Size: 0x68
	Parameters: 1
	Flags: None
*/
function fileprint_start(file)
{
	/#
		filename = file;
		file = openfile(filename, "");
		level.fileprint = file;
		level.fileprintlinecount = 0;
		level.fileprint_filename = filename;
	#/
}

/*
	Name: fileprint_map_start
	Namespace: util
	Checksum: 0x363DB36B
	Offset: 0x43D8
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function fileprint_map_start(file)
{
	/#
		file = ("" + file) + "";
		fileprint_start(file);
		level.fileprint_mapentcount = 0;
		fileprint_map_header(1);
	#/
}

/*
	Name: fileprint_chk
	Namespace: util
	Checksum: 0x2F5BF1CF
	Offset: 0x4440
	Size: 0x6C
	Parameters: 2
	Flags: None
*/
function fileprint_chk(file, str)
{
	/#
		level.fileprintlinecount++;
		if(level.fileprintlinecount > 400)
		{
			waitframe(1);
			level.fileprintlinecount++;
			level.fileprintlinecount = 0;
		}
		fprintln(file, str);
	#/
}

/*
	Name: fileprint_map_header
	Namespace: util
	Checksum: 0xC467369B
	Offset: 0x44B8
	Size: 0xF4
	Parameters: 1
	Flags: None
*/
function fileprint_map_header(binclude_blank_worldspawn)
{
	if(!isdefined(binclude_blank_worldspawn))
	{
		binclude_blank_worldspawn = 0;
	}
	/#
		assert(isdefined(level.fileprint));
	#/
	/#
		fileprint_chk(level.fileprint, "");
		fileprint_chk(level.fileprint, "");
		fileprint_chk(level.fileprint, "");
		if(!binclude_blank_worldspawn)
		{
			return;
		}
		fileprint_map_entity_start();
		fileprint_map_keypairprint("", "");
		fileprint_map_entity_end();
	#/
}

/*
	Name: fileprint_map_keypairprint
	Namespace: util
	Checksum: 0xD3573047
	Offset: 0x45B8
	Size: 0x7C
	Parameters: 2
	Flags: None
*/
function fileprint_map_keypairprint(key1, key2)
{
	/#
		/#
			assert(isdefined(level.fileprint));
		#/
		fileprint_chk(level.fileprint, ((("" + key1) + "") + key2) + "");
	#/
}

/*
	Name: fileprint_map_entity_start
	Namespace: util
	Checksum: 0xAB57D944
	Offset: 0x4640
	Size: 0xB8
	Parameters: 0
	Flags: None
*/
function fileprint_map_entity_start()
{
	/#
		/#
			assert(!isdefined(level.fileprint_entitystart));
		#/
		level.fileprint_entitystart = 1;
		/#
			assert(isdefined(level.fileprint));
		#/
		fileprint_chk(level.fileprint, "" + level.fileprint_mapentcount);
		fileprint_chk(level.fileprint, "");
		level.fileprint_mapentcount++;
	#/
}

/*
	Name: fileprint_map_entity_end
	Namespace: util
	Checksum: 0xFB0EDB3C
	Offset: 0x4700
	Size: 0x74
	Parameters: 0
	Flags: None
*/
function fileprint_map_entity_end()
{
	/#
		/#
			assert(isdefined(level.fileprint_entitystart));
		#/
		/#
			assert(isdefined(level.fileprint));
		#/
		level.fileprint_entitystart = undefined;
		fileprint_chk(level.fileprint, "");
	#/
}

/*
	Name: fileprint_end
	Namespace: util
	Checksum: 0x6A12D0FE
	Offset: 0x4780
	Size: 0x262
	Parameters: 0
	Flags: None
*/
function fileprint_end()
{
	/#
		/#
			assert(!isdefined(level.fileprint_entitystart));
		#/
		saved = closefile(level.fileprint);
		if(saved != 1)
		{
			println("");
			println("");
			println("");
			println("" + level.fileprint_filename);
			println("");
			println("");
			println("");
			println("");
			println("");
			println("");
			println("");
			println("");
			println("");
			println("");
			println("");
			println("");
			println("");
			println("");
			println("");
			println("");
		}
		level.fileprint = undefined;
		level.fileprint_filename = undefined;
	#/
}

/*
	Name: fileprint_radiant_vec
	Namespace: util
	Checksum: 0xECB65BB7
	Offset: 0x49F0
	Size: 0x60
	Parameters: 1
	Flags: None
*/
function fileprint_radiant_vec(vector)
{
	/#
		string = ((((("" + vector[0]) + "") + vector[1]) + "") + vector[2]) + "";
		return string;
	#/
}

/*
	Name: death_notify_wrapper
	Namespace: util
	Checksum: 0x6A7B11A4
	Offset: 0x4A60
	Size: 0x8E
	Parameters: 2
	Flags: Linked
*/
function death_notify_wrapper(attacker, damagetype)
{
	level notify(#"face", {#entity:self, #face_notify:"death"});
	self notify(#"death", {#mod:damagetype, #attacker:attacker});
}

/*
	Name: damage_notify_wrapper
	Namespace: util
	Checksum: 0x2FF7CF75
	Offset: 0x4AF8
	Size: 0x136
	Parameters: 9
	Flags: Linked
*/
function damage_notify_wrapper(damage, attacker, direction_vec, point, type, modelname, tagname, partname, idflags)
{
	level notify(#"face", {#entity:self, #face_notify:"damage"});
	self notify(#"damage", {#flags:idflags, #part_name:partname, #tag_name:tagname, #model_name:modelname, #mod:type, #position:point, #direction:direction_vec, #attacker:attacker, #amount:damage});
}

/*
	Name: explode_notify_wrapper
	Namespace: util
	Checksum: 0x29543004
	Offset: 0x4C38
	Size: 0x5E
	Parameters: 0
	Flags: Linked
*/
function explode_notify_wrapper()
{
	level notify(#"face", {#entity:self, #face_notify:"explode"});
	self notify(#"explode");
}

/*
	Name: alert_notify_wrapper
	Namespace: util
	Checksum: 0xDDA95A67
	Offset: 0x4CA0
	Size: 0x5E
	Parameters: 0
	Flags: None
*/
function alert_notify_wrapper()
{
	level notify(#"face", {#entity:self, #face_notify:"alert"});
	self notify(#"alert");
}

/*
	Name: shoot_notify_wrapper
	Namespace: util
	Checksum: 0xFA0744C3
	Offset: 0x4D08
	Size: 0x5E
	Parameters: 0
	Flags: None
*/
function shoot_notify_wrapper()
{
	level notify(#"face", {#entity:self, #face_notify:"shoot"});
	self notify(#"shoot");
}

/*
	Name: melee_notify_wrapper
	Namespace: util
	Checksum: 0xA68EBC17
	Offset: 0x4D70
	Size: 0x5E
	Parameters: 0
	Flags: None
*/
function melee_notify_wrapper()
{
	level notify(#"face", {#entity:self, #face_notify:"melee"});
	self notify(#"melee");
}

/*
	Name: isusabilityenabled
	Namespace: util
	Checksum: 0xDA07B089
	Offset: 0x4DD8
	Size: 0xC
	Parameters: 0
	Flags: None
*/
function isusabilityenabled()
{
	return !self.disabledusability;
}

/*
	Name: _disableusability
	Namespace: util
	Checksum: 0xD9698BBD
	Offset: 0x4DF0
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function _disableusability()
{
	self.disabledusability++;
	self disableusability();
}

/*
	Name: _enableusability
	Namespace: util
	Checksum: 0xA2BA979C
	Offset: 0x4E20
	Size: 0x54
	Parameters: 0
	Flags: None
*/
function _enableusability()
{
	self.disabledusability--;
	/#
		assert(self.disabledusability >= 0);
	#/
	if(!self.disabledusability)
	{
		self enableusability();
	}
}

/*
	Name: resetusability
	Namespace: util
	Checksum: 0xA5D03B45
	Offset: 0x4E80
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function resetusability()
{
	self.disabledusability = 0;
	self enableusability();
}

/*
	Name: orient_to_normal
	Namespace: util
	Checksum: 0xBCD4CDAF
	Offset: 0x4EB0
	Size: 0xE2
	Parameters: 1
	Flags: None
*/
function orient_to_normal(normal)
{
	hor_normal = (normal[0], normal[1], 0);
	hor_length = length(hor_normal);
	if(!hor_length)
	{
		return (0, 0, 0);
	}
	hor_dir = vectornormalize(hor_normal);
	neg_height = normal[2] * -1;
	tangent = (hor_dir[0] * neg_height, hor_dir[1] * neg_height, hor_length);
	plant_angle = vectortoangles(tangent);
	return plant_angle;
}

/*
	Name: delay
	Namespace: util
	Checksum: 0x12E98CCF
	Offset: 0x4FA0
	Size: 0x74
	Parameters: 9
	Flags: Linked
*/
function delay(time_or_notify, str_endon, func, arg1, arg2, arg3, arg4, arg5, arg6)
{
	self thread _delay(time_or_notify, str_endon, func, arg1, arg2, arg3, arg4, arg5, arg6);
}

/*
	Name: _delay
	Namespace: util
	Checksum: 0x7C940664
	Offset: 0x5020
	Size: 0x11C
	Parameters: 9
	Flags: Linked
*/
function _delay(time_or_notify, str_endon, func, arg1, arg2, arg3, arg4, arg5, arg6)
{
	self endon(#"death");
	if(isdefined(str_endon))
	{
		self endon(str_endon);
	}
	if(function_7a600918(time_or_notify) || isstring(time_or_notify))
	{
		self waittill(time_or_notify);
	}
	else
	{
		wait(time_or_notify);
	}
	if(iscodefunctionptr(func))
	{
		single_func(self, func, arg1, arg2, arg3, arg4, arg5, arg6);
	}
	else
	{
		single_thread(self, func, arg1, arg2, arg3, arg4, arg5, arg6);
	}
}

/*
	Name: delay_network_frames
	Namespace: util
	Checksum: 0xC6F64334
	Offset: 0x5148
	Size: 0x74
	Parameters: 9
	Flags: Linked
*/
function delay_network_frames(n_frames, str_endon, func, arg1, arg2, arg3, arg4, arg5, arg6)
{
	self thread _delay_network_frames(n_frames, str_endon, func, arg1, arg2, arg3, arg4, arg5, arg6);
}

/*
	Name: _delay_network_frames
	Namespace: util
	Checksum: 0x43E4F3E6
	Offset: 0x51C8
	Size: 0xA4
	Parameters: 9
	Flags: Linked
*/
function _delay_network_frames(n_frames, str_endon, func, arg1, arg2, arg3, arg4, arg5, arg6)
{
	self endon(#"death");
	if(isdefined(str_endon))
	{
		self endon(str_endon);
	}
	wait_network_frame(n_frames);
	single_func(self, func, arg1, arg2, arg3, arg4, arg5, arg6);
}

/*
	Name: delay_notify
	Namespace: util
	Checksum: 0xE9595D7
	Offset: 0x5278
	Size: 0x44
	Parameters: 4
	Flags: Linked
*/
function delay_notify(time_or_notify, str_notify, str_endon, arg1)
{
	self thread _delay_notify(time_or_notify, str_notify, str_endon, arg1);
}

/*
	Name: _delay_notify
	Namespace: util
	Checksum: 0x8CD4965
	Offset: 0x52C8
	Size: 0x9A
	Parameters: 4
	Flags: Linked
*/
function _delay_notify(time_or_notify, str_notify, str_endon, arg1)
{
	self endon(#"death");
	if(isdefined(str_endon))
	{
		self endon(str_endon);
	}
	if(function_7a600918(time_or_notify) || isstring(time_or_notify))
	{
		self waittill(time_or_notify);
	}
	else
	{
		wait(time_or_notify);
	}
	self notify(str_notify, arg1);
}

/*
	Name: get_closest_player
	Namespace: util
	Checksum: 0x38B7B623
	Offset: 0x5370
	Size: 0x6C
	Parameters: 2
	Flags: None
*/
function get_closest_player(org, team)
{
	team = get_team_mapping(team);
	players = getplayers(team);
	return arraysort(players, org, 1, 1)[0];
}

/*
	Name: registerclientsys
	Namespace: util
	Checksum: 0x9289C22C
	Offset: 0x53E8
	Size: 0xEA
	Parameters: 1
	Flags: Linked
*/
function registerclientsys(ssysname)
{
	if(!isdefined(level._clientsys))
	{
		level._clientsys = [];
	}
	if(level._clientsys.size >= 32)
	{
		/#
			/#
				assertmsg("");
			#/
		#/
		return;
	}
	if(isdefined(level._clientsys[ssysname]))
	{
		/#
			/#
				assertmsg("" + ssysname);
			#/
		#/
		return;
	}
	level._clientsys[ssysname] = spawnstruct();
	level._clientsys[ssysname].sysid = clientsysregister(ssysname);
}

/*
	Name: setclientsysstate
	Namespace: util
	Checksum: 0xD4C12423
	Offset: 0x54E0
	Size: 0x10E
	Parameters: 3
	Flags: Linked
*/
function setclientsysstate(ssysname, ssysstate, player)
{
	if(!isdefined(level._clientsys))
	{
		/#
			/#
				assertmsg("");
			#/
		#/
		return;
	}
	if(!isdefined(level._clientsys[ssysname]))
	{
		/#
			/#
				assertmsg("" + ssysname);
			#/
		#/
		return;
	}
	if(isdefined(player))
	{
		player clientsyssetstate(level._clientsys[ssysname].sysid, ssysstate);
	}
	else
	{
		clientsyssetstate(level._clientsys[ssysname].sysid, ssysstate);
		level._clientsys[ssysname].sysstate = ssysstate;
	}
}

/*
	Name: getclientsysstate
	Namespace: util
	Checksum: 0x8D435541
	Offset: 0x55F8
	Size: 0xCE
	Parameters: 1
	Flags: None
*/
function getclientsysstate(ssysname)
{
	if(!isdefined(level._clientsys))
	{
		/#
			/#
				assertmsg("");
			#/
		#/
		return "";
	}
	if(!isdefined(level._clientsys[ssysname]))
	{
		/#
			/#
				assertmsg(("" + ssysname) + "");
			#/
		#/
		return "";
	}
	if(isdefined(level._clientsys[ssysname].sysstate))
	{
		return level._clientsys[ssysname].sysstate;
	}
	return "";
}

/*
	Name: clientnotify
	Namespace: util
	Checksum: 0x4DF74E22
	Offset: 0x56D0
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function clientnotify(event)
{
	if(level.clientscripts)
	{
		if(isplayer(self))
		{
			setclientsysstate("levelNotify", event, self);
		}
		else
		{
			setclientsysstate("levelNotify", event);
		}
	}
}

/*
	Name: coopgame
	Namespace: util
	Checksum: 0xF9F9F40
	Offset: 0x5748
	Size: 0x46
	Parameters: 0
	Flags: None
*/
function coopgame()
{
	return sessionmodeissystemlink() || (sessionmodeisonlinegame() || issplitscreen());
}

/*
	Name: is_looking_at
	Namespace: util
	Checksum: 0x6724BC78
	Offset: 0x5798
	Size: 0x19E
	Parameters: 4
	Flags: Linked
*/
function is_looking_at(ent_or_org, n_dot_range, do_trace, v_offset)
{
	if(!isdefined(n_dot_range))
	{
		n_dot_range = 0.9;
	}
	if(!isdefined(do_trace))
	{
		do_trace = 0;
	}
	/#
		assert(isdefined(ent_or_org), "");
	#/
	v_point = (isvec(ent_or_org) ? ent_or_org : ent_or_org.origin);
	if(isvec(v_offset))
	{
		v_point = v_point + v_offset;
	}
	b_can_see = 0;
	b_use_tag_eye = 0;
	if(isplayer(self) || isai(self))
	{
		b_use_tag_eye = 1;
	}
	n_dot = self math::get_dot_direction(v_point, 0, 1, "forward", b_use_tag_eye);
	if(n_dot > n_dot_range)
	{
		if(do_trace)
		{
			v_eye = self get_eye();
			b_can_see = sighttracepassed(v_eye, v_point, 0, ent_or_org);
		}
		else
		{
			b_can_see = 1;
		}
	}
	return b_can_see;
}

/*
	Name: get_eye
	Namespace: util
	Checksum: 0xA0174D5A
	Offset: 0x5940
	Size: 0x4A
	Parameters: 0
	Flags: Linked
*/
function get_eye()
{
	if(isplayer(self))
	{
		return self getplayercamerapos();
	}
	return self geteye();
}

/*
	Name: is_ads
	Namespace: util
	Checksum: 0x7F875F4F
	Offset: 0x5998
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function is_ads()
{
	return self playerads() > 0.5;
}

/*
	Name: function_e05fc3fb
	Namespace: util
	Checksum: 0xD89DEFDD
	Offset: 0x59C8
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_e05fc3fb(isplaying)
{
	self flag::set_val(#"hash_2b62b2990144ebf6", isplaying);
}

/*
	Name: function_a1d6293
	Namespace: util
	Checksum: 0x3EBE7333
	Offset: 0x5A00
	Size: 0x22
	Parameters: 0
	Flags: Linked
*/
function function_a1d6293()
{
	return self flag::get(#"hash_2b62b2990144ebf6");
}

/*
	Name: spawn_model
	Namespace: util
	Checksum: 0x90B795FC
	Offset: 0x5A30
	Size: 0x17E
	Parameters: 5
	Flags: Linked
*/
function spawn_model(model_name, origin, angles, n_spawnflags, b_throttle)
{
	if(!isdefined(n_spawnflags))
	{
		n_spawnflags = 0;
	}
	if(!isdefined(b_throttle))
	{
		b_throttle = 0;
	}
	if(!isdefined(origin))
	{
		origin = (0, 0, 0);
	}
	if(!isdefined(angles))
	{
		angles = (0, 0, 0);
	}
	while(true)
	{
		if(b_throttle)
		{
			spawner::global_spawn_throttle(4);
		}
		model = spawn("script_model", origin, n_spawnflags);
		if(isdefined(model))
		{
			break;
		}
		else
		{
			/#
				println(((((("" + "") + model_name) + "") + origin) + "") + angles);
			#/
		}
		waitframe(1);
	}
	if(isstring(model_name) || function_7a600918(model_name))
	{
		model setmodel(model_name);
	}
	model.angles = angles;
	return model;
}

/*
	Name: spawn_anim_model
	Namespace: util
	Checksum: 0xC0C21451
	Offset: 0x5BB8
	Size: 0x8E
	Parameters: 5
	Flags: Linked
*/
function spawn_anim_model(model_name, origin, angles, n_spawnflags, b_throttle)
{
	if(!isdefined(n_spawnflags))
	{
		n_spawnflags = 0;
	}
	model = spawn_model(model_name, origin, angles, n_spawnflags, b_throttle);
	model useanimtree("generic");
	model.animtree = "generic";
	return model;
}

/*
	Name: spawn_anim_player_model
	Namespace: util
	Checksum: 0xE387BDA4
	Offset: 0x5C50
	Size: 0x8E
	Parameters: 5
	Flags: Linked
*/
function spawn_anim_player_model(model_name, origin, angles, n_spawnflags, b_throttle)
{
	if(!isdefined(n_spawnflags))
	{
		n_spawnflags = 0;
	}
	model = spawn_model(model_name, origin, angles, n_spawnflags, b_throttle);
	model useanimtree("all_player");
	model.animtree = "all_player";
	return model;
}

/*
	Name: waittill_player_looking_at
	Namespace: util
	Checksum: 0x714BE7B2
	Offset: 0x5CE8
	Size: 0xB0
	Parameters: 4
	Flags: Linked
*/
function waittill_player_looking_at(origin, arc_angle_degrees, do_trace, e_ignore)
{
	if(!isdefined(arc_angle_degrees))
	{
		arc_angle_degrees = 90;
	}
	self endon(#"death");
	arc_angle_degrees = absangleclamp360(arc_angle_degrees);
	dot = cos(arc_angle_degrees * 0.5);
	while(!is_player_looking_at(origin, dot, do_trace, e_ignore))
	{
		waitframe(1);
	}
}

/*
	Name: waittill_player_not_looking_at
	Namespace: util
	Checksum: 0x34F0CE92
	Offset: 0x5DA0
	Size: 0x58
	Parameters: 3
	Flags: Linked
*/
function waittill_player_not_looking_at(origin, dot, do_trace)
{
	self endon(#"death");
	while(is_player_looking_at(origin, dot, do_trace))
	{
		waitframe(1);
	}
}

/*
	Name: is_player_looking_at
	Namespace: util
	Checksum: 0x3089A59E
	Offset: 0x5E00
	Size: 0x1B8
	Parameters: 5
	Flags: Linked
*/
function is_player_looking_at(v_origin, n_dot, b_do_trace, e_ignore, var_c4943182)
{
	if(!isdefined(n_dot))
	{
		n_dot = 0.7;
	}
	if(!isdefined(b_do_trace))
	{
		b_do_trace = 1;
	}
	/#
		assert(isplayer(self), "");
	#/
	if(isdefined(self.hijacked_vehicle_entity))
	{
		v_eye = self.hijacked_vehicle_entity gettagorigin("tag_driver");
		v_view = anglestoforward(self.hijacked_vehicle_entity gettagangles("tag_driver"));
	}
	else
	{
		v_eye = self get_eye();
		v_view = anglestoforward(self getplayerangles());
	}
	v_delta = vectornormalize(v_origin - v_eye);
	n_new_dot = vectordot(v_delta, v_view);
	if(n_new_dot >= n_dot)
	{
		if(b_do_trace)
		{
			return bullettracepassed(v_origin, v_eye, 0, e_ignore, var_c4943182);
		}
		return 1;
	}
	return 0;
}

/*
	Name: wait_endon
	Namespace: util
	Checksum: 0xF7B8A041
	Offset: 0x5FC0
	Size: 0x76
	Parameters: 5
	Flags: Linked
*/
function wait_endon(waittime, endonstring, endonstring2, endonstring3, endonstring4)
{
	self endon(endonstring);
	if(isdefined(endonstring2))
	{
		self endon(endonstring2);
	}
	if(isdefined(endonstring3))
	{
		self endon(endonstring3);
	}
	if(isdefined(endonstring4))
	{
		self endon(endonstring4);
	}
	wait(waittime);
	return true;
}

/*
	Name: waittillendonthreaded
	Namespace: util
	Checksum: 0x165F0EE5
	Offset: 0x6040
	Size: 0x84
	Parameters: 5
	Flags: None
*/
function waittillendonthreaded(waitcondition, callback, endcondition1, endcondition2, endcondition3)
{
	if(isdefined(endcondition1))
	{
		self endon(endcondition1);
	}
	if(isdefined(endcondition2))
	{
		self endon(endcondition2);
	}
	if(isdefined(endcondition3))
	{
		self endon(endcondition3);
	}
	self waittill(waitcondition);
	if(isdefined(callback))
	{
		[[callback]](waitcondition);
	}
}

/*
	Name: new_timer
	Namespace: util
	Checksum: 0xDFA1F8B8
	Offset: 0x60D0
	Size: 0x42
	Parameters: 1
	Flags: None
*/
function new_timer(n_timer_length)
{
	s_timer = spawnstruct();
	s_timer.n_time_created = gettime();
	s_timer.n_length = n_timer_length;
	return s_timer;
}

/*
	Name: get_time
	Namespace: util
	Checksum: 0xCDA3727B
	Offset: 0x6120
	Size: 0x20
	Parameters: 0
	Flags: Linked
*/
function get_time()
{
	t_now = gettime();
	return t_now - self.n_time_created;
}

/*
	Name: get_time_in_seconds
	Namespace: util
	Checksum: 0xAADFB005
	Offset: 0x6148
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function get_time_in_seconds()
{
	return float(get_time()) / 1000;
}

/*
	Name: get_time_frac
	Namespace: util
	Checksum: 0x6CC314AA
	Offset: 0x6188
	Size: 0x4A
	Parameters: 1
	Flags: None
*/
function get_time_frac(n_end_time)
{
	if(!isdefined(n_end_time))
	{
		n_end_time = self.n_length;
	}
	return lerpfloat(0, 1, get_time_in_seconds() / n_end_time);
}

/*
	Name: get_time_left
	Namespace: util
	Checksum: 0x869E4077
	Offset: 0x61E0
	Size: 0x58
	Parameters: 0
	Flags: Linked
*/
function get_time_left()
{
	if(isdefined(self.n_length))
	{
		n_current_time = get_time_in_seconds();
		return max(self.n_length - n_current_time, 0);
	}
	return -1;
}

/*
	Name: is_time_left
	Namespace: util
	Checksum: 0x584D4E92
	Offset: 0x6240
	Size: 0x16
	Parameters: 0
	Flags: None
*/
function is_time_left()
{
	return get_time_left() != 0;
}

/*
	Name: timer_wait
	Namespace: util
	Checksum: 0xC6A413F5
	Offset: 0x6260
	Size: 0x62
	Parameters: 1
	Flags: None
*/
function timer_wait(n_wait)
{
	if(isdefined(self.n_length))
	{
		n_wait = min(n_wait, get_time_left());
	}
	wait(n_wait);
	n_current_time = get_time_in_seconds();
	return n_current_time;
}

/*
	Name: is_primary_damage
	Namespace: util
	Checksum: 0xD6020C8A
	Offset: 0x62D0
	Size: 0x36
	Parameters: 1
	Flags: None
*/
function is_primary_damage(meansofdeath)
{
	if(meansofdeath == "MOD_RIFLE_BULLET" || meansofdeath == "MOD_PISTOL_BULLET")
	{
		return true;
	}
	return false;
}

/*
	Name: delete_on_death
	Namespace: util
	Checksum: 0x991BFF97
	Offset: 0x6310
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function delete_on_death(ent)
{
	ent endon(#"death");
	self waittill(#"death");
	if(isdefined(ent))
	{
		ent delete();
	}
}

/*
	Name: delete_on_death_or_notify
	Namespace: util
	Checksum: 0x59075131
	Offset: 0x6370
	Size: 0xA4
	Parameters: 3
	Flags: None
*/
function delete_on_death_or_notify(e_to_delete, str_notify, str_clientfield)
{
	if(!isdefined(str_clientfield))
	{
		str_clientfield = undefined;
	}
	e_to_delete endon(#"death");
	self waittill(#"death", str_notify);
	if(isdefined(e_to_delete))
	{
		if(isdefined(str_clientfield))
		{
			e_to_delete clientfield::set(str_clientfield, 0);
			wait(0.1);
		}
		e_to_delete delete();
	}
}

/*
	Name: wait_till_not_touching
	Namespace: util
	Checksum: 0x8CA7F0F
	Offset: 0x6420
	Size: 0xA8
	Parameters: 2
	Flags: None
*/
function wait_till_not_touching(e_to_check, e_to_touch)
{
	/#
		assert(isdefined(e_to_check), "");
	#/
	/#
		assert(isdefined(e_to_touch), "");
	#/
	e_to_check endon(#"death");
	e_to_touch endon(#"death");
	while(e_to_check istouching(e_to_touch))
	{
		waitframe(1);
	}
}

/*
	Name: any_player_is_touching
	Namespace: util
	Checksum: 0xBAFE4B0F
	Offset: 0x64D0
	Size: 0xE4
	Parameters: 2
	Flags: None
*/
function any_player_is_touching(ent, team)
{
	team = get_team_mapping(team);
	foreach(player in getplayers(team))
	{
		if(isalive(player) && player istouching(ent))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: set_console_status
	Namespace: util
	Checksum: 0xD74019C5
	Offset: 0x65C0
	Size: 0x134
	Parameters: 0
	Flags: None
*/
function set_console_status()
{
	if(!isdefined(level.console))
	{
		level.console = getdvarstring(#"consolegame") == "true";
	}
	else
	{
		/#
			assert(level.console == getdvarstring(#"consolegame") == "", "");
		#/
	}
	if(!isdefined(level.xenon))
	{
		level.xenon = getdvarstring(#"xenongame") == "true";
	}
	else
	{
		/#
			assert(level.xenon == getdvarstring(#"xenongame") == "", "");
		#/
	}
}

/*
	Name: waittill_asset_loaded
	Namespace: util
	Checksum: 0x93D88E53
	Offset: 0x6700
	Size: 0x14
	Parameters: 2
	Flags: Linked
*/
function waittill_asset_loaded(str_type, str_name)
{
}

/*
	Name: function_e387bcd
	Namespace: util
	Checksum: 0xC1DBCE92
	Offset: 0x6720
	Size: 0x60
	Parameters: 0
	Flags: Linked
*/
function function_e387bcd()
{
	if(!isdefined(self))
	{
		return false;
	}
	if(isdefined(self.script_wait))
	{
		return true;
	}
	if(isdefined(self.script_wait_add))
	{
		return true;
	}
	if(isdefined(self.script_wait_min))
	{
		return true;
	}
	if(isdefined(self.script_wait_max))
	{
		return true;
	}
	return false;
}

/*
	Name: function_4b93f9c2
	Namespace: util
	Checksum: 0x3A8ADA09
	Offset: 0x6788
	Size: 0xBC
	Parameters: 0
	Flags: None
*/
function function_4b93f9c2()
{
	result = 0;
	if(isdefined(self.script_wait))
	{
		result = result + self.script_wait;
	}
	n_min = (isdefined(self.script_wait_min) ? self.script_wait_min : 0);
	n_max = (isdefined(self.script_wait_max) ? self.script_wait_max : 0);
	if(n_max > n_min)
	{
		result = result + randomfloatrange(n_min, n_max);
	}
	else if(n_min > 0)
	{
		result = result + n_min;
	}
	return result;
}

/*
	Name: script_wait
	Namespace: util
	Checksum: 0xFA3C2E54
	Offset: 0x6850
	Size: 0x15A
	Parameters: 0
	Flags: Linked
*/
function script_wait()
{
	n_time = gettime();
	if(isdefined(self.script_wait))
	{
		wait(self.script_wait);
		if(isdefined(self.script_wait_add))
		{
			self.script_wait = self.script_wait + self.script_wait_add;
		}
	}
	n_min = (isdefined(self.script_wait_min) ? self.script_wait_min : 0);
	n_max = (isdefined(self.script_wait_max) ? self.script_wait_max : 0);
	if(n_max > n_min)
	{
		wait(randomfloatrange(n_min, n_max));
		self.script_wait_min = self.script_wait_min + (isdefined(self.script_wait_add) ? self.script_wait_add : 0);
		self.script_wait_max = self.script_wait_max + (isdefined(self.script_wait_add) ? self.script_wait_add : 0);
	}
	else if(n_min > 0)
	{
		wait(n_min);
		self.script_wait_min = self.script_wait_min + (isdefined(self.script_wait_add) ? self.script_wait_add : 0);
	}
	return gettime() - n_time;
}

/*
	Name: send_notify
	Namespace: util
	Checksum: 0x197951AD
	Offset: 0x69B8
	Size: 0x34
	Parameters: 2
	Flags: None
*/
function send_notify(msg, optional_param)
{
	if(isdefined(optional_param))
	{
		self notify(msg, optional_param);
	}
	else
	{
		self notify(msg);
	}
}

/*
	Name: is_killstreaks_enabled
	Namespace: util
	Checksum: 0x3B98F1B8
	Offset: 0x69F8
	Size: 0x20
	Parameters: 0
	Flags: Linked
*/
function is_killstreaks_enabled()
{
	return isdefined(level.killstreaksenabled) && level.killstreaksenabled;
}

/*
	Name: is_flashbanged
	Namespace: util
	Checksum: 0xE2B8D17
	Offset: 0x6A20
	Size: 0x1E
	Parameters: 0
	Flags: None
*/
function is_flashbanged()
{
	return isdefined(self.flashendtime) && gettime() < self.flashendtime;
}

/*
	Name: magic_bullet_shield
	Namespace: util
	Checksum: 0x3043F5C5
	Offset: 0x6A48
	Size: 0x112
	Parameters: 1
	Flags: Linked
*/
function magic_bullet_shield(ent)
{
	if(!isdefined(ent))
	{
		ent = self;
	}
	ent val::set(#"magic_bullet_shield", "allowdeath", 0);
	ent.magic_bullet_shield = 1;
	/#
		ent notify(#"_stop_magic_bullet_shield_debug");
		level thread debug_magic_bullet_shield_death(ent);
	#/
	/#
		assert(isalive(ent), "");
	#/
	if(isai(ent))
	{
		if(isactor(ent))
		{
			ent bloodimpact("hero");
		}
		ent.attackeraccuracy = 0.1;
	}
}

/*
	Name: debug_magic_bullet_shield_death
	Namespace: util
	Checksum: 0x42C6547
	Offset: 0x6B68
	Size: 0x13C
	Parameters: 1
	Flags: None
*/
function debug_magic_bullet_shield_death(guy)
{
	/#
		targetname = "";
		if(isdefined(guy.targetname))
		{
			targetname = guy.targetname;
		}
		guy endon(#"stop_magic_bullet_shield", #"_stop_magic_bullet_shield_debug");
		var_7f729179 = undefined;
		var_7f729179 = guy waittill(#"death");
		if(!is_true(level.var_5be43b2d) && getdvarint(#"enable_moving_paths", 0) && !is_true(guy.in_melee_death) && !is_true(guy.var_16735873))
		{
			/#
				assert(!isdefined(guy), "" + targetname);
			#/
		}
	#/
}

/*
	Name: spawn_player_clone
	Namespace: util
	Checksum: 0xC0C15EF1
	Offset: 0x6CB0
	Size: 0x480
	Parameters: 5
	Flags: Linked
*/
function spawn_player_clone(player, animname, s_align, var_df23b31f, var_b661e70a)
{
	if(!isdefined(var_df23b31f))
	{
		var_df23b31f = 0;
	}
	playerclone = spawn("script_model", player.origin);
	playerclone.angles = player.angles;
	playerclone.var_8323de3e = 1;
	playerclone.var_1ff8de20 = player;
	playerclone.str_gender = player getplayergendertype();
	if(player function_390cb543())
	{
		var_1749f1e8 = player function_92ea4100();
		if(isdefined(var_1749f1e8))
		{
			playerclone setmodel(var_1749f1e8);
		}
		headmodel = player function_44a7328f();
		if(isdefined(headmodel))
		{
			playerclone attach(headmodel);
		}
	}
	else
	{
		var_41206ae3 = player function_5d23af5b();
		if(isdefined(var_41206ae3))
		{
			playerclone setmodel(var_41206ae3);
		}
		headmodel = player function_44a7328f();
		if(isdefined(headmodel) && !playerclone isattached(headmodel))
		{
			playerclone attach(headmodel);
		}
		var_b4d88433 = player function_cde23658();
		if(isdefined(var_b4d88433) && !playerclone isattached(var_b4d88433))
		{
			playerclone attach(var_b4d88433);
		}
		var_1749f1e8 = player function_92ea4100();
		if(isdefined(var_1749f1e8) && !playerclone isattached(var_1749f1e8))
		{
			playerclone attach(var_1749f1e8);
		}
	}
	playerclone function_1fac41e4(player function_19124308());
	if(var_df23b31f)
	{
		weapon = (isdefined(var_b661e70a) ? var_b661e70a : player getcurrentweapon());
		var_d71dafc1 = player function_ade49959(weapon);
		var_f34a225e = player function_8cbd254d(weapon);
		var_c071948 = player function_f0655be3(weapon);
		playerclone animation::attach_weapon(weapon);
		playerclone.weapon = weapon;
		playerclone function_44adade0(var_d71dafc1);
		playerclone function_9affc544(var_f34a225e);
		playerclone function_cda62355(var_c071948);
	}
	playerclone useanimtree("all_player");
	if(isdefined(animname))
	{
		if(isdefined(s_align))
		{
			playerclone thread animation::play(animname, s_align);
		}
		else
		{
			playerclone thread animation::play(animname, playerclone.origin, playerclone.angles);
		}
	}
	playerclone.health = 100;
	playerclone setowner(player);
	playerclone.team = player.team;
	playerclone solid();
	return playerclone;
}

/*
	Name: stop_magic_bullet_shield
	Namespace: util
	Checksum: 0xCE0F48B1
	Offset: 0x7138
	Size: 0xC8
	Parameters: 1
	Flags: Linked
*/
function stop_magic_bullet_shield(ent)
{
	if(!isdefined(ent))
	{
		ent = self;
	}
	ent val::reset(#"magic_bullet_shield", "allowdeath");
	ent.magic_bullet_shield = undefined;
	if(isai(ent))
	{
		if(isactor(ent))
		{
			ent bloodimpact("normal");
			ent.allowdeath = 1;
		}
		ent.attackeraccuracy = 1;
	}
	ent notify(#"stop_magic_bullet_shield");
}

/*
	Name: get_rounds_won
	Namespace: util
	Checksum: 0xA9247695
	Offset: 0x7208
	Size: 0x46
	Parameters: 1
	Flags: None
*/
function get_rounds_won(team)
{
	team = get_team_mapping(team);
	return game.stat[#"roundswon"][team];
}

/*
	Name: within_fov
	Namespace: util
	Checksum: 0x7CE3D58
	Offset: 0x7258
	Size: 0x8C
	Parameters: 4
	Flags: Linked
*/
function within_fov(start_origin, start_angles, end_origin, fov)
{
	normal = vectornormalize(end_origin - start_origin);
	forward = anglestoforward(start_angles);
	dot = vectordot(forward, normal);
	return dot >= fov;
}

/*
	Name: has_tac_vis
	Namespace: util
	Checksum: 0xF41401AA
	Offset: 0x72F0
	Size: 0xCA
	Parameters: 2
	Flags: None
*/
function has_tac_vis(target, var_2e4f087a)
{
	if(isentity(target))
	{
		target = target.origin;
	}
	tacpoint = function_ad6356f5(self.origin);
	var_fe33f767 = 0;
	if(isdefined(tacpoint))
	{
		var_fe33f767 = function_96c81b85(tacpoint, target);
	}
	if(var_fe33f767 && is_true(var_2e4f087a))
	{
		var_fe33f767 = self point_in_fov(target);
	}
	return var_fe33f767;
}

/*
	Name: point_in_fov
	Namespace: util
	Checksum: 0xD4BF620E
	Offset: 0x73C8
	Size: 0xA2
	Parameters: 3
	Flags: Linked
*/
function point_in_fov(origin, fov, checkpitch)
{
	from_origin = self.origin;
	var_5e321cee = self.angles;
	if(isplayer(self) && is_true(checkpitch))
	{
		var_5e321cee = self getplayerangles();
	}
	return function_aae7d83d(from_origin, var_5e321cee, origin, fov);
}

/*
	Name: function_aae7d83d
	Namespace: util
	Checksum: 0x4F39974F
	Offset: 0x7478
	Size: 0xAC
	Parameters: 4
	Flags: Linked
*/
function function_aae7d83d(from_origin, var_5e321cee, origin, fov)
{
	if(!isdefined(origin))
	{
		return 0;
	}
	if(!isdefined(fov))
	{
		fov = 0.766;
	}
	forward = anglestoforward(var_5e321cee);
	normalvec = vectornormalize(origin - from_origin);
	dot = vectordot(forward, normalvec);
	return dot > fov;
}

/*
	Name: button_held_think
	Namespace: util
	Checksum: 0x24053433
	Offset: 0x7530
	Size: 0x14C
	Parameters: 1
	Flags: Linked
*/
function button_held_think(which_button)
{
	self endon(#"disconnect");
	if(!isdefined(self._holding_button))
	{
		self._holding_button = [];
	}
	self._holding_button[which_button] = 0;
	time_started = 0;
	while(true)
	{
		usinggamepad = self gamepadusedlast();
		use_time = (usinggamepad ? 0 : 250);
		if(self._holding_button[which_button])
		{
			if(!self [[level._button_funcs[which_button]]]())
			{
				self._holding_button[which_button] = 0;
			}
		}
		else
		{
			if(self [[level._button_funcs[which_button]]]())
			{
				if(time_started == 0)
				{
					time_started = gettime();
				}
				if(gettime() - time_started > use_time)
				{
					self._holding_button[which_button] = 1;
				}
			}
			else if(time_started != 0)
			{
				time_started = 0;
			}
		}
		waitframe(1);
	}
}

/*
	Name: use_button_held
	Namespace: util
	Checksum: 0xD9B3D6BA
	Offset: 0x7688
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function use_button_held()
{
	init_button_wrappers();
	if(!isdefined(self._use_button_think_threaded))
	{
		self thread button_held_think(0);
		self._use_button_think_threaded = 1;
	}
	return self._holding_button[0];
}

/*
	Name: stance_button_held
	Namespace: util
	Checksum: 0x7D548CF9
	Offset: 0x76E0
	Size: 0x58
	Parameters: 0
	Flags: Linked
*/
function stance_button_held()
{
	init_button_wrappers();
	if(!isdefined(self._stance_button_think_threaded))
	{
		self thread button_held_think(1);
		self._stance_button_think_threaded = 1;
	}
	return self._holding_button[1];
}

/*
	Name: ads_button_held
	Namespace: util
	Checksum: 0x6D53A030
	Offset: 0x7740
	Size: 0x58
	Parameters: 0
	Flags: None
*/
function ads_button_held()
{
	init_button_wrappers();
	if(!isdefined(self._ads_button_think_threaded))
	{
		self thread button_held_think(2);
		self._ads_button_think_threaded = 1;
	}
	return self._holding_button[2];
}

/*
	Name: attack_button_held
	Namespace: util
	Checksum: 0xB4C3BB04
	Offset: 0x77A0
	Size: 0x58
	Parameters: 0
	Flags: None
*/
function attack_button_held()
{
	init_button_wrappers();
	if(!isdefined(self._attack_button_think_threaded))
	{
		self thread button_held_think(3);
		self._attack_button_think_threaded = 1;
	}
	return self._holding_button[3];
}

/*
	Name: button_right_held
	Namespace: util
	Checksum: 0xF0E6DBEC
	Offset: 0x7800
	Size: 0x58
	Parameters: 0
	Flags: None
*/
function button_right_held()
{
	init_button_wrappers();
	if(!isdefined(self._dpad_right_button_think_threaded))
	{
		self thread button_held_think(6);
		self._dpad_right_button_think_threaded = 1;
	}
	return self._holding_button[6];
}

/*
	Name: function_c4e7922d
	Namespace: util
	Checksum: 0x32C04369
	Offset: 0x7860
	Size: 0x58
	Parameters: 0
	Flags: Linked
*/
function function_c4e7922d()
{
	init_button_wrappers();
	if(!isdefined(self.var_a8aff46))
	{
		self thread button_held_think(8);
		self.var_a8aff46 = 1;
	}
	return self._holding_button[8];
}

/*
	Name: waittill_use_button_pressed
	Namespace: util
	Checksum: 0x9A0D9B88
	Offset: 0x78C0
	Size: 0x28
	Parameters: 0
	Flags: None
*/
function waittill_use_button_pressed()
{
	while(!self usebuttonpressed())
	{
		waitframe(1);
	}
}

/*
	Name: waittill_use_button_held
	Namespace: util
	Checksum: 0x3A5657CE
	Offset: 0x78F0
	Size: 0x28
	Parameters: 0
	Flags: None
*/
function waittill_use_button_held()
{
	while(!self use_button_held())
	{
		waitframe(1);
	}
}

/*
	Name: waittill_stance_button_pressed
	Namespace: util
	Checksum: 0x1C99CC67
	Offset: 0x7920
	Size: 0x28
	Parameters: 0
	Flags: None
*/
function waittill_stance_button_pressed()
{
	while(!self stancebuttonpressed())
	{
		waitframe(1);
	}
}

/*
	Name: function_a29c8ab9
	Namespace: util
	Checksum: 0x74D5D0DE
	Offset: 0x7950
	Size: 0x28
	Parameters: 0
	Flags: None
*/
function function_a29c8ab9()
{
	while(!self jumpbuttonpressed())
	{
		waitframe(1);
	}
}

/*
	Name: waittill_stance_button_held
	Namespace: util
	Checksum: 0x6D2821F5
	Offset: 0x7980
	Size: 0x28
	Parameters: 0
	Flags: None
*/
function waittill_stance_button_held()
{
	while(!self stance_button_held())
	{
		waitframe(1);
	}
}

/*
	Name: function_394b3718
	Namespace: util
	Checksum: 0xD29630EF
	Offset: 0x79B0
	Size: 0x28
	Parameters: 0
	Flags: None
*/
function function_394b3718()
{
	while(!self function_c4e7922d())
	{
		waitframe(1);
	}
}

/*
	Name: waittill_attack_button_pressed
	Namespace: util
	Checksum: 0xF93F0793
	Offset: 0x79E0
	Size: 0x28
	Parameters: 0
	Flags: Linked
*/
function waittill_attack_button_pressed()
{
	while(!self attackbuttonpressed())
	{
		waitframe(1);
	}
}

/*
	Name: waittill_ads_button_pressed
	Namespace: util
	Checksum: 0x2208A589
	Offset: 0x7A10
	Size: 0x28
	Parameters: 0
	Flags: None
*/
function waittill_ads_button_pressed()
{
	while(!self adsbuttonpressed())
	{
		waitframe(1);
	}
}

/*
	Name: waittill_vehicle_move_up_button_pressed
	Namespace: util
	Checksum: 0xA44C0E87
	Offset: 0x7A40
	Size: 0x28
	Parameters: 0
	Flags: None
*/
function waittill_vehicle_move_up_button_pressed()
{
	while(!self vehiclemoveupbuttonpressed())
	{
		waitframe(1);
	}
}

/*
	Name: init_button_wrappers
	Namespace: util
	Checksum: 0x81FEC011
	Offset: 0x7A70
	Size: 0xE0
	Parameters: 0
	Flags: Linked
*/
function init_button_wrappers()
{
	if(!isdefined(level._button_funcs))
	{
		level._button_funcs[0] = &usebuttonpressed;
		level._button_funcs[2] = &adsbuttonpressed;
		level._button_funcs[3] = &attackbuttonpressed;
		level._button_funcs[1] = &stancebuttonpressed;
		level._button_funcs[6] = &actionslotfourbuttonpressed;
		level._button_funcs[8] = &weaponswitchbuttonpressed;
		/#
			level._button_funcs[4] = &up_button_pressed;
			level._button_funcs[5] = &down_button_pressed;
		#/
	}
}

/*
	Name: up_button_held
	Namespace: util
	Checksum: 0x9D8A54E1
	Offset: 0x7B58
	Size: 0x60
	Parameters: 0
	Flags: None
*/
function up_button_held()
{
	/#
		init_button_wrappers();
		if(!isdefined(self._up_button_think_threaded))
		{
			self thread button_held_think(4);
			self._up_button_think_threaded = 1;
		}
		return self._holding_button[4];
	#/
}

/*
	Name: down_button_held
	Namespace: util
	Checksum: 0xA455BA6F
	Offset: 0x7BC8
	Size: 0x60
	Parameters: 0
	Flags: None
*/
function down_button_held()
{
	/#
		init_button_wrappers();
		if(!isdefined(self._down_button_think_threaded))
		{
			self thread button_held_think(5);
			self._down_button_think_threaded = 1;
		}
		return self._holding_button[5];
	#/
}

/*
	Name: up_button_pressed
	Namespace: util
	Checksum: 0xA4BD3410
	Offset: 0x7C38
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function up_button_pressed()
{
	/#
		return self buttonpressed("") || self buttonpressed("");
	#/
}

/*
	Name: waittill_up_button_pressed
	Namespace: util
	Checksum: 0xD94FB8DD
	Offset: 0x7C88
	Size: 0x28
	Parameters: 0
	Flags: None
*/
function waittill_up_button_pressed()
{
	/#
		while(!self up_button_pressed())
		{
			waitframe(1);
		}
	#/
}

/*
	Name: down_button_pressed
	Namespace: util
	Checksum: 0xB978894B
	Offset: 0x7CB8
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function down_button_pressed()
{
	/#
		return self buttonpressed("") || self buttonpressed("");
	#/
}

/*
	Name: waittill_down_button_pressed
	Namespace: util
	Checksum: 0xAF16B5D8
	Offset: 0x7D08
	Size: 0x28
	Parameters: 0
	Flags: None
*/
function waittill_down_button_pressed()
{
	/#
		while(!self down_button_pressed())
		{
			waitframe(1);
		}
	#/
}

/*
	Name: ishacked
	Namespace: util
	Checksum: 0xB5A70EA2
	Offset: 0x7D38
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function ishacked()
{
	return isdefined(self.hacked) && self.hacked || is_true(self.ishacked);
}

/*
	Name: function_fbce7263
	Namespace: util
	Checksum: 0x6D5791B4
	Offset: 0x7D78
	Size: 0x5C
	Parameters: 2
	Flags: Linked
*/
function function_fbce7263(team_a, team_b)
{
	if(team_a === team_b || function_9b7092ef(team_a, team_b))
	{
		return false;
	}
	if(!isdefined(team_a) || !isdefined(team_b))
	{
		return true;
	}
	return true;
}

/*
	Name: isenemyteam
	Namespace: util
	Checksum: 0xB1ED851A
	Offset: 0x7DE0
	Size: 0x4A
	Parameters: 1
	Flags: Linked
*/
function isenemyteam(team)
{
	/#
		assert(isdefined(team));
	#/
	if(!isdefined(self))
	{
		return 0;
	}
	return function_fbce7263(team, self.team);
}

/*
	Name: function_4ded36e3
	Namespace: util
	Checksum: 0x52A5095A
	Offset: 0x7E38
	Size: 0x80
	Parameters: 1
	Flags: None
*/
function function_4ded36e3(player)
{
	if(!isplayer(player) || !isdefined(self))
	{
		return 0;
	}
	if(level.teambased)
	{
		return !isenemyteam(player.team);
	}
	if(player == self)
	{
		return 1;
	}
	return 1;
}

/*
	Name: isenemyplayer
	Namespace: util
	Checksum: 0xC97D5753
	Offset: 0x7EC0
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function isenemyplayer(player)
{
	if(!isplayer(player) || !isdefined(self))
	{
		return 0;
	}
	if(level.teambased)
	{
		return isenemyteam(player.team);
	}
	if(player == self)
	{
		return 0;
	}
	return 1;
}

/*
	Name: waittillslowprocessallowed
	Namespace: util
	Checksum: 0x748726DA
	Offset: 0x7F48
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function waittillslowprocessallowed()
{
	while(level.lastslowprocessframe == gettime())
	{
		waitframe(1);
	}
	level.lastslowprocessframe = gettime();
}

/*
	Name: function_1ea0b2ce
	Namespace: util
	Checksum: 0xE0BFAA11
	Offset: 0x7F80
	Size: 0x10
	Parameters: 0
	Flags: None
*/
function function_1ea0b2ce()
{
	level.lastslowprocessframe = gettime();
}

/*
	Name: function_64ebd94d
	Namespace: util
	Checksum: 0xB89FAAFC
	Offset: 0x7F98
	Size: 0x38
	Parameters: 0
	Flags: Linked
*/
function function_64ebd94d()
{
	while((level.lastslowprocessframe + (3 * function_60d95f53())) >= gettime())
	{
		waitframe(1);
	}
}

/*
	Name: get_start_time
	Namespace: util
	Checksum: 0x78EF09D9
	Offset: 0x7FD8
	Size: 0x12
	Parameters: 0
	Flags: Linked
*/
function get_start_time()
{
	return getmicrosecondsraw();
}

/*
	Name: note_elapsed_time
	Namespace: util
	Checksum: 0x532E6109
	Offset: 0x7FF8
	Size: 0xC4
	Parameters: 2
	Flags: Linked
*/
function note_elapsed_time(start_time, label)
{
	if(!isdefined(label))
	{
		label = "unspecified";
	}
	/#
		elapsed_time = get_elapsed_time(start_time, getmicrosecondsraw());
		if(!isdefined(start_time))
		{
			return;
		}
		elapsed_time = elapsed_time * 0.001;
		msg = ((label + "") + elapsed_time) + "";
		profileprintln(msg);
		iprintln(msg);
	#/
}

/*
	Name: function_d11b3582
	Namespace: util
	Checksum: 0x59E1A5AA
	Offset: 0x80C8
	Size: 0xA4
	Parameters: 2
	Flags: None
*/
function function_d11b3582(var_43692bd4, label)
{
	if(!isdefined(label))
	{
		label = "unspecified";
	}
	/#
		if(!isdefined(var_43692bd4))
		{
			return;
		}
		elapsed_time = var_43692bd4 * 0.001;
		msg = ((label + "") + elapsed_time) + "";
		profileprintln(msg);
		iprintln(msg);
	#/
}

/*
	Name: record_elapsed_time
	Namespace: util
	Checksum: 0xF0D866D2
	Offset: 0x8178
	Size: 0x92
	Parameters: 2
	Flags: Linked
*/
function record_elapsed_time(start_time, &elapsed_time_array)
{
	elapsed_time = get_elapsed_time(start_time, getmicrosecondsraw());
	if(!isdefined(elapsed_time_array))
	{
		elapsed_time_array = [];
	}
	else if(!isarray(elapsed_time_array))
	{
		elapsed_time_array = array(elapsed_time_array);
	}
	elapsed_time_array[elapsed_time_array.size] = elapsed_time;
}

/*
	Name: note_elapsed_times
	Namespace: util
	Checksum: 0x27C60F4
	Offset: 0x8218
	Size: 0x1B4
	Parameters: 2
	Flags: Linked
*/
function note_elapsed_times(&elapsed_time_array, label)
{
	if(!isdefined(label))
	{
		label = "unspecified";
	}
	/#
		if(!isarray(elapsed_time_array))
		{
			return;
		}
		if(elapsed_time_array.size == 0)
		{
			return;
		}
		total_elapsed_time = 0;
		smallest_elapsed_time = 2147483647;
		largest_elapsed_time = 0;
		foreach(elapsed_time in elapsed_time_array)
		{
			elapsed_time = elapsed_time * 0.001;
			total_elapsed_time = total_elapsed_time + elapsed_time;
			if(elapsed_time < smallest_elapsed_time)
			{
				smallest_elapsed_time = elapsed_time;
			}
			if(elapsed_time > largest_elapsed_time)
			{
				largest_elapsed_time = elapsed_time;
			}
		}
		average_elapsed_time = total_elapsed_time / elapsed_time_array.size;
		msg = ((((((label + "") + smallest_elapsed_time) + "") + average_elapsed_time) + "") + largest_elapsed_time) + "";
		profileprintln(msg);
		iprintln(msg);
	#/
}

/*
	Name: function_53966f9c
	Namespace: util
	Checksum: 0xBC2707F2
	Offset: 0x83D8
	Size: 0x144
	Parameters: 4
	Flags: None
*/
function function_53966f9c(&elapsed_time_array, label, var_5461755f, reset_count)
{
	if(!isdefined(label))
	{
		label = "unspecified";
	}
	if(!isdefined(var_5461755f))
	{
		var_5461755f = 10;
	}
	if(!isdefined(reset_count))
	{
		reset_count = 100;
	}
	/#
		if((elapsed_time_array.size % var_5461755f) == 0)
		{
			note_elapsed_times(elapsed_time_array, label);
		}
		if(elapsed_time_array.size >= reset_count)
		{
			keys = getarraykeys(elapsed_time_array);
			foreach(key in keys)
			{
				elapsed_time_array[key] = undefined;
			}
			arrayremovevalue(elapsed_time_array, undefined);
		}
	#/
}

/*
	Name: get_elapsed_time
	Namespace: util
	Checksum: 0xE35DB6D1
	Offset: 0x8528
	Size: 0x6C
	Parameters: 2
	Flags: Linked
*/
function get_elapsed_time(start_time, end_time)
{
	if(!isdefined(end_time))
	{
		end_time = getmicrosecondsraw();
	}
	if(!isdefined(start_time))
	{
		return undefined;
	}
	elapsed_time = end_time - start_time;
	if(elapsed_time < 0)
	{
		elapsed_time = elapsed_time + -2147483648;
	}
	return elapsed_time;
}

/*
	Name: note_raw_time
	Namespace: util
	Checksum: 0xF95DD1DE
	Offset: 0x85A0
	Size: 0x7C
	Parameters: 1
	Flags: None
*/
function note_raw_time(label)
{
	if(!isdefined(label))
	{
		label = "unspecified";
	}
	now = getmicrosecondsraw();
	msg = ("us = " + now) + (" -- ") + label;
	profileprintln(msg);
}

/*
	Name: mayapplyscreeneffect
	Namespace: util
	Checksum: 0x72BDEB70
	Offset: 0x8628
	Size: 0x4E
	Parameters: 0
	Flags: Linked
*/
function mayapplyscreeneffect()
{
	/#
		assert(isdefined(self));
	#/
	/#
		assert(isplayer(self));
	#/
	return !isdefined(self.viewlockedentity);
}

/*
	Name: waittillnotmoving
	Namespace: util
	Checksum: 0x206EA8D3
	Offset: 0x8680
	Size: 0x9E
	Parameters: 0
	Flags: Linked
*/
function waittillnotmoving()
{
	if(self ishacked())
	{
		waitframe(1);
		return;
	}
	if(self.classname == "grenade")
	{
		self waittill(#"stationary");
	}
	else
	{
		prevorigin = self.origin;
		while(true)
		{
			wait(0.15);
			if(self.origin == prevorigin)
			{
				break;
			}
			prevorigin = self.origin;
		}
	}
}

/*
	Name: waittillrollingornotmoving
	Namespace: util
	Checksum: 0xFC8C4078
	Offset: 0x8728
	Size: 0x6E
	Parameters: 0
	Flags: None
*/
function waittillrollingornotmoving()
{
	if(self ishacked())
	{
		waitframe(1);
		return "stationary";
	}
	movestate = undefined;
	movestate = self waittill(#"stationary", #"rolling");
	return movestate._notify;
}

/*
	Name: getweaponclass
	Namespace: util
	Checksum: 0xF05D8D89
	Offset: 0x87A0
	Size: 0x12C
	Parameters: 1
	Flags: Linked
*/
function getweaponclass(weapon)
{
	if(weapon == level.weaponnone)
	{
		return undefined;
	}
	if(!weapon.isvalid)
	{
		return undefined;
	}
	if(!isdefined(level.weaponclassarray))
	{
		level.weaponclassarray = [];
	}
	if(isdefined(level.weaponclassarray[weapon.name]))
	{
		return level.weaponclassarray[weapon.name];
	}
	baseweaponparam = weapons::getbaseweapon(weapon);
	baseweaponindex = getbaseweaponitemindex(baseweaponparam);
	weaponclass = #"";
	weaponinfo = getunlockableiteminfofromindex(baseweaponindex, 1);
	if(isdefined(weaponinfo))
	{
		weaponclass = weaponinfo.itemgroupname;
	}
	level.weaponclassarray[weapon.name] = weaponclass;
	return weaponclass;
}

/*
	Name: function_56353fe9
	Namespace: util
	Checksum: 0x6E3567A
	Offset: 0x88D8
	Size: 0x56
	Parameters: 1
	Flags: None
*/
function function_56353fe9(weaponname)
{
	weapon = getweapon(weaponname);
	if(!isdefined(weapon) || weapon == level.weaponnone)
	{
		return undefined;
	}
	return weapon;
}

/*
	Name: isusingremote
	Namespace: util
	Checksum: 0xF20720E4
	Offset: 0x8938
	Size: 0xC
	Parameters: 0
	Flags: Linked
*/
function isusingremote()
{
	return isdefined(self.usingremote);
}

/*
	Name: function_63d27d4e
	Namespace: util
	Checksum: 0xBE273DA1
	Offset: 0x8950
	Size: 0x18
	Parameters: 1
	Flags: Linked
*/
function function_63d27d4e(remotename)
{
	return self.usingremote === remotename;
}

/*
	Name: setusingremote
	Namespace: util
	Checksum: 0x8DC2FCE0
	Offset: 0x8970
	Size: 0xC6
	Parameters: 2
	Flags: Linked
*/
function setusingremote(remotename, set_killstreak_delay_killcam)
{
	if(!isdefined(set_killstreak_delay_killcam))
	{
		set_killstreak_delay_killcam = !sessionmodeiszombiesgame();
	}
	if(isdefined(self.carryicon))
	{
		self.carryicon.alpha = 0;
	}
	/#
		assert(!self isusingremote());
	#/
	self.usingremote = remotename;
	if(set_killstreak_delay_killcam)
	{
		self.killstreak_delay_killcam = remotename;
	}
	self disableoffhandweapons();
	self notify(#"using_remote");
}

/*
	Name: function_9a39538a
	Namespace: util
	Checksum: 0x62E7FC39
	Offset: 0x8A40
	Size: 0x56
	Parameters: 0
	Flags: None
*/
function function_9a39538a()
{
	if(isdefined(self.carryicon))
	{
		self.carryicon.alpha = 1;
	}
	self.usingremote = undefined;
	self enableoffhandweapons();
	self.killstreak_delay_killcam = undefined;
	self notify(#"stopped_using_remote");
}

/*
	Name: deleteaftertime
	Namespace: util
	Checksum: 0xC87084D6
	Offset: 0x8AA0
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function deleteaftertime(time)
{
	/#
		assert(isdefined(self));
	#/
	/#
		assert(isdefined(time));
	#/
	/#
		assert(time >= 0.05);
	#/
	self thread deleteaftertimethread(time);
}

/*
	Name: deleteaftertimethread
	Namespace: util
	Checksum: 0xDEB80166
	Offset: 0x8B20
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function deleteaftertimethread(time)
{
	self endon(#"death");
	wait(time);
	self delete();
}

/*
	Name: waitfortime
	Namespace: util
	Checksum: 0x385A93C8
	Offset: 0x8B68
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function waitfortime(time)
{
	if(!isdefined(time))
	{
		time = 0;
	}
	if(time > 0)
	{
		wait(time);
	}
}

/*
	Name: waitfortimeandnetworkframe
	Namespace: util
	Checksum: 0x4E32695C
	Offset: 0x8BA8
	Size: 0x7A
	Parameters: 1
	Flags: Linked
*/
function waitfortimeandnetworkframe(time)
{
	if(!isdefined(time))
	{
		time = 0;
	}
	start_time_ms = gettime();
	wait_network_frame();
	elapsed_time = (gettime() - start_time_ms) * 0.001;
	remaining_time = time - elapsed_time;
	if(remaining_time > 0)
	{
		wait(remaining_time);
	}
}

/*
	Name: deleteaftertimeandnetworkframe
	Namespace: util
	Checksum: 0x1030E3A0
	Offset: 0x8C30
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function deleteaftertimeandnetworkframe(time)
{
	/#
		assert(isdefined(self));
	#/
	waitfortimeandnetworkframe(time);
	self delete();
}

/*
	Name: orientedbox
	Namespace: util
	Checksum: 0x1DD56797
	Offset: 0x8C90
	Size: 0x8C
	Parameters: 6
	Flags: None
*/
function orientedbox(pos, dims, angles, color, depthtest, duration)
{
	mins = dims * -0.5;
	maxs = dims * 0.5;
	/#
		box(pos, mins, maxs, angles, color, depthtest, duration);
	#/
}

/*
	Name: drawcylinder
	Namespace: util
	Checksum: 0x1B500A6
	Offset: 0x8D28
	Size: 0x74
	Parameters: 7
	Flags: None
*/
function drawcylinder(pos, rad, height, duration, stop_notify, color, alpha)
{
	/#
		if(!isdefined(duration))
		{
			duration = 0;
		}
		level thread drawcylinder_think(pos, rad, height, duration, stop_notify, color, alpha);
	#/
}

/*
	Name: drawcylinder_think
	Namespace: util
	Checksum: 0x3BFF3726
	Offset: 0x8DA8
	Size: 0x2DE
	Parameters: 7
	Flags: None
*/
function drawcylinder_think(pos, rad, height, seconds, stop_notify, color, alpha)
{
	/#
		if(isdefined(stop_notify))
		{
			level endon(stop_notify);
		}
		stop_time = gettime() + (int(seconds * 1000));
		currad = rad;
		curheight = height;
		if(!isdefined(color))
		{
			color = (1, 1, 1);
		}
		if(!isdefined(alpha))
		{
			alpha = 1;
		}
		for(;;)
		{
			if(seconds > 0 && stop_time <= gettime())
			{
				return;
			}
			for(r = 0; r < 20; r++)
			{
				theta = (r / 20) * 360;
				theta2 = ((r + 1) / 20) * 360;
				line(pos + (cos(theta) * currad, sin(theta) * currad, 0), pos + (cos(theta2) * currad, sin(theta2) * currad, 0), color, alpha);
				line(pos + (cos(theta) * currad, sin(theta) * currad, curheight), pos + (cos(theta2) * currad, sin(theta2) * currad, curheight), color, alpha);
				line(pos + (cos(theta) * currad, sin(theta) * currad, 0), pos + (cos(theta) * currad, sin(theta) * currad, curheight), color, alpha);
			}
			waitframe(1);
		}
	#/
}

/*
	Name: spawn_array_struct
	Namespace: util
	Checksum: 0x176107BB
	Offset: 0x9090
	Size: 0x2E
	Parameters: 0
	Flags: Linked
*/
function spawn_array_struct()
{
	s = spawnstruct();
	s.a = [];
	return s;
}

/*
	Name: gethostplayer
	Namespace: util
	Checksum: 0x85D111B9
	Offset: 0x90C8
	Size: 0xA8
	Parameters: 0
	Flags: Linked
*/
function gethostplayer()
{
	players = getplayers();
	foreach(player in players)
	{
		if(player ishost())
		{
			return player;
		}
	}
}

/*
	Name: gethostplayerforbots
	Namespace: util
	Checksum: 0x52798AD7
	Offset: 0x9178
	Size: 0x5E
	Parameters: 0
	Flags: Linked
*/
function gethostplayerforbots()
{
	players = getplayers();
	for(index = 0; index < players.size; index++)
	{
		if(players[index] ishostforbots())
		{
			return players[index];
		}
	}
}

/*
	Name: get_array_of_closest
	Namespace: util
	Checksum: 0x6137BA8E
	Offset: 0x91E0
	Size: 0x294
	Parameters: 5
	Flags: Linked
*/
function get_array_of_closest(org, array, excluders, max, maxdist)
{
	if(!isdefined(max))
	{
		max = array.size;
	}
	if(!isdefined(excluders))
	{
		excluders = [];
	}
	maxdists2rd = undefined;
	if(isdefined(maxdist))
	{
		maxdists2rd = maxdist * maxdist;
	}
	dist = [];
	index = [];
	for(i = 0; i < array.size; i++)
	{
		if(!isdefined(array[i]))
		{
			continue;
		}
		if(isinarray(excluders, array[i]))
		{
			continue;
		}
		if(isvec(array[i]))
		{
			length = distancesquared(org, array[i]);
		}
		else
		{
			length = distancesquared(org, array[i].origin);
		}
		if(isdefined(maxdists2rd) && maxdists2rd < length)
		{
			continue;
		}
		dist[dist.size] = length;
		index[index.size] = i;
	}
	for(;;)
	{
		change = 0;
		for(i = 0; i < dist.size - 1; i++)
		{
			if(dist[i] <= (dist[i + 1]))
			{
				continue;
			}
			change = 1;
			temp = dist[i];
			dist[i] = dist[i + 1];
			dist[i + 1] = temp;
			temp = index[i];
			index[i] = index[i + 1];
			index[i + 1] = temp;
		}
		if(!change)
		{
			break;
		}
	}
	newarray = [];
	if(max > dist.size)
	{
		max = dist.size;
	}
	for(i = 0; i < max; i++)
	{
		newarray[i] = array[index[i]];
	}
	return newarray;
}

/*
	Name: set_lighting_state
	Namespace: util
	Checksum: 0x4CCE4AB
	Offset: 0x9480
	Size: 0x194
	Parameters: 2
	Flags: Linked
*/
function set_lighting_state(n_state, var_2f177f67)
{
	if(!isdefined(var_2f177f67))
	{
		var_2f177f67 = 1;
	}
	self.var_564dda4 = self.lighting_state;
	if(isdefined(n_state))
	{
		self.lighting_state = n_state;
	}
	else
	{
		self.lighting_state = level.lighting_state;
	}
	if(isdefined(self.lighting_state))
	{
		if(self == level)
		{
			players = (var_2f177f67 ? function_a1ef346b() : getplayers());
			foreach(player in players)
			{
				player set_lighting_state(level.lighting_state);
			}
		}
		else
		{
			if(isplayer(self))
			{
				self setlightingstate(self.lighting_state);
			}
			else
			{
				/#
					assertmsg("");
				#/
			}
		}
	}
}

/*
	Name: set_sun_shadow_split_distance
	Namespace: util
	Checksum: 0xAF3DE053
	Offset: 0x9620
	Size: 0x144
	Parameters: 1
	Flags: Linked
*/
function set_sun_shadow_split_distance(f_distance)
{
	if(isdefined(f_distance))
	{
		self.sun_shadow_split_distance = f_distance;
	}
	else
	{
		self.sun_shadow_split_distance = level.sun_shadow_split_distance;
	}
	if(isdefined(self.sun_shadow_split_distance))
	{
		if(self == level)
		{
			foreach(player in function_a1ef346b())
			{
				player set_sun_shadow_split_distance(level.sun_shadow_split_distance);
			}
		}
		else
		{
			if(isplayer(self))
			{
				self setsunshadowsplitdistance(self.sun_shadow_split_distance);
			}
			else
			{
				/#
					assertmsg("");
				#/
			}
		}
	}
}

/*
	Name: function_7f49ffb7
	Namespace: util
	Checksum: 0x880FC31
	Offset: 0x9770
	Size: 0x164
	Parameters: 1
	Flags: Linked
*/
function function_7f49ffb7(var_bf01552a)
{
	if(!isdefined(level.var_bf01552a))
	{
		level.var_bf01552a = -1;
	}
	if(isdefined(var_bf01552a))
	{
		self.var_bf01552a = var_bf01552a;
	}
	else
	{
		self.var_bf01552a = level.var_bf01552a;
	}
	if(isdefined(self.var_bf01552a))
	{
		if(self == level)
		{
			foreach(player in function_a1ef346b())
			{
				player function_7f49ffb7(level.var_bf01552a);
			}
		}
		else
		{
			if(isplayer(self))
			{
				self function_61471b4a(self.var_bf01552a);
			}
			else
			{
				/#
					assertmsg("");
				#/
			}
		}
	}
}

/*
	Name: auto_delete
	Namespace: util
	Checksum: 0xF4BA5C18
	Offset: 0x98E0
	Size: 0x54A
	Parameters: 4
	Flags: Linked
*/
function auto_delete(n_mode, n_min_time_alive, n_dist_horizontal, n_dist_vertical)
{
	if(!isdefined(n_mode))
	{
		n_mode = 1;
	}
	if(!isdefined(n_min_time_alive))
	{
		n_min_time_alive = 0;
	}
	if(!isdefined(n_dist_horizontal))
	{
		n_dist_horizontal = 0;
	}
	if(!isdefined(n_dist_vertical))
	{
		n_dist_vertical = 0;
	}
	if(!isentity(self))
	{
		return;
	}
	self endon(#"death", #"hash_375a9d48dd6a9427");
	self notify(#"__auto_delete__");
	self endon(#"__auto_delete__");
	level flag::wait_till("all_players_spawned");
	if(isdefined(level.heroes) && isinarray(level.heroes, self))
	{
		return;
	}
	if(isplayer(self))
	{
		return;
	}
	if(n_mode & 16 || n_mode == 1 || n_mode == 8)
	{
		n_mode = n_mode | 2;
		n_mode = n_mode | 4;
	}
	n_think_time = 1;
	n_tests_to_do = 2;
	n_dot_check = 0;
	if(n_mode & 16)
	{
		n_think_time = 0.2;
		n_tests_to_do = 1;
		n_dot_check = 0.4;
	}
	n_test_count = 0;
	n_dist_horizontal_sq = n_dist_horizontal * n_dist_horizontal;
	while(true)
	{
		do
		{
			wait(randomfloatrange(n_think_time - (n_think_time / 3), n_think_time + (n_think_time / 3)));
		}
		while(isdefined(self.birthtime) && ((float(gettime() - self.birthtime)) / 1000) < n_min_time_alive);
		n_tests_passed = 0;
		playerlist = getplayers();
		foreach(player in playerlist)
		{
			if(isbot(player))
			{
				n_tests_passed++;
				continue;
			}
			if(n_dist_horizontal && distance2dsquared(self.origin, player.origin) < n_dist_horizontal_sq)
			{
				continue;
			}
			if(n_dist_vertical && (abs(self.origin[2] - player.origin[2])) < n_dist_vertical)
			{
				continue;
			}
			v_eye = player getplayercamerapos();
			b_behind = 0;
			if(n_mode & 2)
			{
				v_facing = anglestoforward(player getplayerangles());
				v_to_ent = vectornormalize(self.origin - v_eye);
				n_dot = vectordot(v_facing, v_to_ent);
				if(n_dot < n_dot_check)
				{
					b_behind = 1;
					if(!n_mode & 1)
					{
						n_tests_passed++;
						continue;
					}
				}
			}
			if(n_mode & 4)
			{
				if(!self sightconetrace(v_eye, (isdefined(player getvehicleoccupied()) ? player getvehicleoccupied() : player)))
				{
					if(b_behind || !n_mode & 1)
					{
						n_tests_passed++;
					}
				}
			}
		}
		if(n_tests_passed == playerlist.size)
		{
			n_test_count++;
			if(n_test_count < n_tests_to_do)
			{
				continue;
			}
			self notify(#"_disable_reinforcement");
			self delete();
		}
		else
		{
			n_test_count = 0;
		}
	}
}

/*
	Name: get_weapon_by_name
	Namespace: util
	Checksum: 0xD7936B24
	Offset: 0x9E38
	Size: 0xA2
	Parameters: 2
	Flags: Linked
*/
function get_weapon_by_name(weapon_name, var_2f3a032e)
{
	split = [];
	if("" != var_2f3a032e)
	{
		split = strtok(var_2f3a032e, "+");
	}
	if(split.size)
	{
		weapon = getweapon(weapon_name, split);
	}
	else
	{
		weapon = getweapon(weapon_name);
	}
	return weapon;
}

/*
	Name: function_2146bd83
	Namespace: util
	Checksum: 0xD4C469A0
	Offset: 0x9EE8
	Size: 0x76
	Parameters: 1
	Flags: Linked
*/
function function_2146bd83(weapon)
{
	var_2f3a032e = "";
	for(i = 0; i < weapon.attachments.size; i++)
	{
		if(i)
		{
			var_2f3a032e = var_2f3a032e + ("+");
		}
		var_2f3a032e = var_2f3a032e + weapon.attachments[i];
	}
	return var_2f3a032e;
}

/*
	Name: function_4c1656d5
	Namespace: util
	Checksum: 0x7397801D
	Offset: 0x9F68
	Size: 0x6A
	Parameters: 0
	Flags: Linked
*/
function function_4c1656d5()
{
	if(function_f99d2668())
	{
		return getdvarfloat(#"hash_4e7a02edee964bf9", 250);
	}
	return getdvarfloat(#"hash_4ec50cedeed64871", 250);
}

/*
	Name: function_16fb0a3b
	Namespace: util
	Checksum: 0x69487297
	Offset: 0x9FE0
	Size: 0x122
	Parameters: 0
	Flags: Linked
*/
function function_16fb0a3b()
{
	if(function_f99d2668())
	{
		if(getdvarint(#"hash_23a1d3a9139af42b", 0) > 0)
		{
			return getdvarfloat(#"hash_608e7bb0e9517884", 250);
		}
		return getdvarfloat(#"hash_4e7a02edee964bf9", 250);
	}
	if(getdvarint(#"hash_23fac9a913e70c03", 0) > 0)
	{
		return getdvarfloat(#"hash_606c79b0e9348eb8", 250);
	}
	return getdvarfloat(#"hash_4ec50cedeed64871", 250);
}

/*
	Name: is_female
	Namespace: util
	Checksum: 0x57494B16
	Offset: 0xA110
	Size: 0x6A
	Parameters: 0
	Flags: Linked
*/
function is_female()
{
	gender = self getplayergendertype(currentsessionmode());
	b_female = 0;
	if(isdefined(gender) && gender == "female")
	{
		b_female = 1;
	}
	return b_female;
}

/*
	Name: positionquery_pointarray
	Namespace: util
	Checksum: 0x58F6A276
	Offset: 0xA188
	Size: 0x162
	Parameters: 6
	Flags: None
*/
function positionquery_pointarray(origin, minsearchradius, maxsearchradius, halfheight, innerspacing, reachableby_ent)
{
	if(isdefined(reachableby_ent))
	{
		queryresult = positionquery_source_navigation(origin, minsearchradius, maxsearchradius, halfheight, innerspacing, reachableby_ent);
	}
	else
	{
		queryresult = positionquery_source_navigation(origin, minsearchradius, maxsearchradius, halfheight, innerspacing);
	}
	pointarray = [];
	foreach(pointstruct in queryresult.data)
	{
		if(!isdefined(pointarray))
		{
			pointarray = [];
		}
		else if(!isarray(pointarray))
		{
			pointarray = array(pointarray);
		}
		pointarray[pointarray.size] = pointstruct.origin;
	}
	return pointarray;
}

/*
	Name: totalplayercount
	Namespace: util
	Checksum: 0x979D0C07
	Offset: 0xA2F8
	Size: 0x9A
	Parameters: 0
	Flags: Linked
*/
function totalplayercount()
{
	count = 0;
	foreach(_ in level.teams)
	{
		count = count + level.playercount[team];
	}
	return count;
}

/*
	Name: isrankenabled
	Namespace: util
	Checksum: 0x99975C88
	Offset: 0xA3A0
	Size: 0x1A
	Parameters: 0
	Flags: None
*/
function isrankenabled()
{
	return is_true(level.rankenabled);
}

/*
	Name: isoneround
	Namespace: util
	Checksum: 0x6CFA2C04
	Offset: 0xA3C8
	Size: 0x20
	Parameters: 0
	Flags: Linked
*/
function isoneround()
{
	if(level.roundlimit == 1)
	{
		return true;
	}
	return false;
}

/*
	Name: isfirstround
	Namespace: util
	Checksum: 0xCBA92F30
	Offset: 0xA3F0
	Size: 0x30
	Parameters: 0
	Flags: Linked
*/
function isfirstround()
{
	if(!isdefined(game.roundsplayed) || game.roundsplayed == 0)
	{
		return true;
	}
	return false;
}

/*
	Name: islastround
	Namespace: util
	Checksum: 0xBE9A945
	Offset: 0xA428
	Size: 0x40
	Parameters: 0
	Flags: None
*/
function islastround()
{
	if(level.roundlimit > 1 && game.roundsplayed >= (level.roundlimit - 1))
	{
		return true;
	}
	return false;
}

/*
	Name: waslastround
	Namespace: util
	Checksum: 0xA2E18C81
	Offset: 0xA470
	Size: 0xC8
	Parameters: 0
	Flags: Linked
*/
function waslastround()
{
	if(level.forcedend)
	{
		return true;
	}
	if(isdefined(level.nextroundisovertime))
	{
		if(level.nextroundisovertime)
		{
			level.nextroundisovertime = 1;
			return false;
		}
		if(isdefined(game.overtime_round) && game.overtime_round > 0)
		{
			return true;
		}
	}
	if(hitroundlimit() || hitscorelimit() || hitroundwinlimit())
	{
		return true;
	}
	return false;
}

/*
	Name: hitroundlimit
	Namespace: util
	Checksum: 0xD73C97B2
	Offset: 0xA540
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function hitroundlimit()
{
	if(level.roundlimit <= 0)
	{
		return 0;
	}
	return getroundsplayed() >= level.roundlimit;
}

/*
	Name: anyteamhitroundwinlimit
	Namespace: util
	Checksum: 0x2A315923
	Offset: 0xA580
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function anyteamhitroundwinlimit()
{
	foreach(_ in level.teams)
	{
		if(getroundswon(team) >= level.roundwinlimit)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: anyteamhitroundlimitwithdraws
	Namespace: util
	Checksum: 0xA92768C9
	Offset: 0xA628
	Size: 0xDC
	Parameters: 0
	Flags: Linked
*/
function anyteamhitroundlimitwithdraws()
{
	tie_wins = game.stat[#"roundswon"][#"tie"];
	foreach(_ in level.teams)
	{
		if((getroundswon(team) + tie_wins) >= level.roundwinlimit)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_385658da
	Namespace: util
	Checksum: 0x263E84E1
	Offset: 0xA710
	Size: 0xC8
	Parameters: 0
	Flags: Linked
*/
function function_385658da()
{
	count = 0;
	foreach(_ in level.teams)
	{
		wins = getroundswon(team);
		if(!isdefined(count))
		{
			count = wins;
			continue;
		}
		if(wins != count)
		{
			return false;
		}
	}
	return true;
}

/*
	Name: hitroundwinlimit
	Namespace: util
	Checksum: 0x15C339C9
	Offset: 0xA7E0
	Size: 0x76
	Parameters: 0
	Flags: Linked
*/
function hitroundwinlimit()
{
	if(!isdefined(level.roundwinlimit) || level.roundwinlimit <= 0)
	{
		return false;
	}
	if(anyteamhitroundwinlimit())
	{
		return true;
	}
	if(anyteamhitroundlimitwithdraws())
	{
		if(!function_385658da())
		{
			return true;
		}
	}
	return false;
}

/*
	Name: hitscorelimit
	Namespace: util
	Checksum: 0x2A6FEC5C
	Offset: 0xA860
	Size: 0xCE
	Parameters: 0
	Flags: Linked
*/
function hitscorelimit()
{
	if(level.scoreroundwinbased)
	{
		return false;
	}
	if(level.scorelimit <= 0)
	{
		return false;
	}
	if(level.teambased)
	{
		if(teams::any_team_hit_score_limit())
		{
			return true;
		}
	}
	else
	{
		for(i = 0; i < level.players.size; i++)
		{
			player = level.players[i];
			if(isdefined(player.pointstowin) && player.pointstowin >= level.scorelimit)
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: get_current_round_score_limit
	Namespace: util
	Checksum: 0x11A85901
	Offset: 0xA938
	Size: 0x1E
	Parameters: 0
	Flags: Linked
*/
function get_current_round_score_limit()
{
	return level.roundscorelimit * (game.roundsplayed + 1);
}

/*
	Name: any_team_hit_round_score_limit
	Namespace: util
	Checksum: 0xBF7C1203
	Offset: 0xA960
	Size: 0xBC
	Parameters: 0
	Flags: Linked
*/
function any_team_hit_round_score_limit()
{
	round_score_limit = get_current_round_score_limit();
	foreach(team, _ in level.teams)
	{
		if(game.stat[#"teamscores"][team] >= round_score_limit)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: hitroundscorelimit
	Namespace: util
	Checksum: 0x1F58988A
	Offset: 0xAA28
	Size: 0xDA
	Parameters: 0
	Flags: None
*/
function hitroundscorelimit()
{
	if(level.roundscorelimit <= 0)
	{
		return false;
	}
	if(level.teambased)
	{
		if(any_team_hit_round_score_limit())
		{
			return true;
		}
	}
	else
	{
		roundscorelimit = get_current_round_score_limit();
		for(i = 0; i < level.players.size; i++)
		{
			player = level.players[i];
			if(isdefined(player.pointstowin) && player.pointstowin >= roundscorelimit)
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: getroundswon
	Namespace: util
	Checksum: 0xA63FF692
	Offset: 0xAB10
	Size: 0x46
	Parameters: 1
	Flags: Linked
*/
function getroundswon(team)
{
	team = get_team_mapping(team);
	return game.stat[#"roundswon"][team];
}

/*
	Name: getotherteamsroundswon
	Namespace: util
	Checksum: 0x93E22D8F
	Offset: 0xAB60
	Size: 0xE4
	Parameters: 1
	Flags: None
*/
function getotherteamsroundswon(str_skip_team)
{
	str_skip_team = get_team_mapping(str_skip_team);
	roundswon = 0;
	if(!isdefined(str_skip_team))
	{
		return roundswon;
	}
	foreach(_ in level.teams)
	{
		if(team === str_skip_team)
		{
			continue;
		}
		roundswon = roundswon + game.stat[#"roundswon"][team];
	}
	return roundswon;
}

/*
	Name: getroundsplayed
	Namespace: util
	Checksum: 0xB1B04049
	Offset: 0xAC50
	Size: 0xE
	Parameters: 0
	Flags: Linked
*/
function getroundsplayed()
{
	return game.roundsplayed;
}

/*
	Name: isroundbased
	Namespace: util
	Checksum: 0xAD0E6A8E
	Offset: 0xAC68
	Size: 0x20
	Parameters: 0
	Flags: Linked
*/
function isroundbased()
{
	if(level.roundlimit != 1)
	{
		return true;
	}
	return false;
}

/*
	Name: getcurrentgamemode
	Namespace: util
	Checksum: 0xAD30453D
	Offset: 0xAC90
	Size: 0x26
	Parameters: 0
	Flags: Linked
*/
function getcurrentgamemode()
{
	if(gamemodeisarena())
	{
		return "leaguematch";
	}
	return "publicmatch";
}

/*
	Name: function_14e61d05
	Namespace: util
	Checksum: 0x5F5B40F0
	Offset: 0xACC0
	Size: 0x22
	Parameters: 0
	Flags: Linked
*/
function function_14e61d05()
{
	return self hasperk(#"hash_5fef46715b368a6e");
}

/*
	Name: function_5e7e010
	Namespace: util
	Checksum: 0x662FD904
	Offset: 0xACF0
	Size: 0x22
	Parameters: 0
	Flags: None
*/
function function_5e7e010()
{
	return self hasperk(#"hash_37f82f1d672c4870");
}

/*
	Name: function_97cf7eb0
	Namespace: util
	Checksum: 0xC4662C99
	Offset: 0xAD20
	Size: 0x184
	Parameters: 6
	Flags: Linked
*/
function function_97cf7eb0(v_start, n_max_dist, n_ground_offset, e_ignore, b_ignore_water, b_ignore_glass)
{
	if(!isdefined(n_max_dist))
	{
		n_max_dist = 5000;
	}
	if(!isdefined(n_ground_offset))
	{
		n_ground_offset = 0;
	}
	if(!isdefined(b_ignore_water))
	{
		b_ignore_water = 0;
	}
	if(!isdefined(b_ignore_glass))
	{
		b_ignore_glass = 0;
	}
	v_trace_start = v_start + (0, 0, 5);
	v_trace_end = v_trace_start + (0, 0, (n_max_dist + 5) * -1);
	a_trace = groundtrace(v_trace_start, v_trace_end, 0, e_ignore, b_ignore_water, b_ignore_glass);
	if(a_trace[#"surfacetype"] != "none")
	{
		return {#entity:a_trace[#"entity"], #position:a_trace[#"position"] + (0, 0, n_ground_offset)};
	}
	return {#entity:a_trace[#"entity"], #position:v_start};
}

/*
	Name: ground_position
	Namespace: util
	Checksum: 0xAB3607E1
	Offset: 0xAEB0
	Size: 0x92
	Parameters: 6
	Flags: None
*/
function ground_position(v_start, n_max_dist, n_ground_offset, e_ignore, b_ignore_water, b_ignore_glass)
{
	if(!isdefined(n_max_dist))
	{
		n_max_dist = 5000;
	}
	if(!isdefined(n_ground_offset))
	{
		n_ground_offset = 0;
	}
	if(!isdefined(b_ignore_water))
	{
		b_ignore_water = 0;
	}
	if(!isdefined(b_ignore_glass))
	{
		b_ignore_glass = 0;
	}
	return function_97cf7eb0(v_start, n_max_dist, n_ground_offset, e_ignore, b_ignore_water, b_ignore_glass).position;
}

/*
	Name: delayed_notify
	Namespace: util
	Checksum: 0x783E43CA
	Offset: 0xAF50
	Size: 0x2A
	Parameters: 2
	Flags: None
*/
function delayed_notify(str_notify, f_delay_seconds)
{
	wait(f_delay_seconds);
	if(isdefined(self))
	{
		self notify(str_notify);
	}
}

/*
	Name: delayed_delete
	Namespace: util
	Checksum: 0xD360AD61
	Offset: 0xAF88
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function delayed_delete(f_delay_seconds)
{
	/#
		assert(isentity(self));
	#/
	wait(f_delay_seconds);
	if(isdefined(self) && isentity(self))
	{
		self delete();
	}
}

/*
	Name: is_safehouse
	Namespace: util
	Checksum: 0xD55D09F5
	Offset: 0xB000
	Size: 0x20
	Parameters: 0
	Flags: None
*/
function is_safehouse()
{
	mapname = function_53bbf9d2();
	return false;
}

/*
	Name: is_new_cp_map
	Namespace: util
	Checksum: 0xED9BC094
	Offset: 0xB028
	Size: 0x4A
	Parameters: 0
	Flags: None
*/
function is_new_cp_map()
{
	mapname = function_53bbf9d2();
	switch(mapname)
	{
		default:
		{
			return false;
		}
	}
}

/*
	Name: add_queued_debug_command
	Namespace: util
	Checksum: 0xDE6F4447
	Offset: 0xB080
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function add_queued_debug_command(cmd)
{
	/#
		if(!isdefined(level.dbg_cmd_queue))
		{
			level thread queued_debug_commands();
		}
		if(isdefined(level.dbg_cmd_queue))
		{
			array::push(level.dbg_cmd_queue, cmd);
		}
	#/
}

/*
	Name: queued_debug_commands
	Namespace: util
	Checksum: 0x10AB0364
	Offset: 0xB0F0
	Size: 0x158
	Parameters: 0
	Flags: None
*/
function queued_debug_commands()
{
	/#
		self notify(#"queued_debug_commands");
		self endon(#"queued_debug_commands");
		if(!isdefined(level.dbg_cmd_queue))
		{
			level.dbg_cmd_queue = [];
		}
		while(true)
		{
			waitframe(1);
			if(level.dbg_cmd_queue.size == 0)
			{
				level.dbg_cmd_queue = undefined;
				return;
			}
			trickle = 0;
			if(isdefined(level.players) && level.players.size > 1)
			{
				trickle = 1;
				var_1085858 = 12;
			}
			while(!trickle || var_1085858 > 0 && canadddebugcommand() && level.dbg_cmd_queue.size > 0)
			{
				cmd = array::pop_front(level.dbg_cmd_queue, 0);
				adddebugcommand(cmd);
				if(trickle)
				{
					var_1085858--;
				}
			}
		}
	#/
}

/*
	Name: array_copy_if_array
	Namespace: util
	Checksum: 0x5639A7C5
	Offset: 0xB250
	Size: 0x42
	Parameters: 1
	Flags: None
*/
function array_copy_if_array(any_var)
{
	return (isarray(any_var) ? arraycopy(any_var) : any_var);
}

/*
	Name: is_item_purchased
	Namespace: util
	Checksum: 0x384B1EAE
	Offset: 0xB2A0
	Size: 0x62
	Parameters: 1
	Flags: Linked
*/
function is_item_purchased(ref)
{
	itemindex = getitemindexfromref(ref);
	return (itemindex >= 256 ? 0 : self isitempurchased(itemindex));
}

/*
	Name: has_purchased_perk_equipped
	Namespace: util
	Checksum: 0x607F5EF5
	Offset: 0xB310
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function has_purchased_perk_equipped(ref)
{
	return self hasperk(ref) && self is_item_purchased(ref);
}

/*
	Name: function_43b91cd0
	Namespace: util
	Checksum: 0xA80822DB
	Offset: 0xB358
	Size: 0x44
	Parameters: 2
	Flags: None
*/
function function_43b91cd0(specialty, talent)
{
	return self hasperk(specialty) && self is_item_purchased(talent);
}

/*
	Name: has_purchased_perk_equipped_with_specific_stat
	Namespace: util
	Checksum: 0x443DC4A6
	Offset: 0xB3A8
	Size: 0x64
	Parameters: 2
	Flags: Linked
*/
function has_purchased_perk_equipped_with_specific_stat(single_perk_ref, stats_table_ref)
{
	if(isplayer(self))
	{
		return self hasperk(single_perk_ref) && self is_item_purchased(stats_table_ref);
	}
	return 0;
}

/*
	Name: has_flak_jacket_perk_purchased_and_equipped
	Namespace: util
	Checksum: 0x3AC5FFE6
	Offset: 0xB418
	Size: 0x22
	Parameters: 0
	Flags: None
*/
function has_flak_jacket_perk_purchased_and_equipped()
{
	return has_purchased_perk_equipped(#"specialty_flakjacket");
}

/*
	Name: has_blind_eye_perk_purchased_and_equipped
	Namespace: util
	Checksum: 0xB65CC83B
	Offset: 0xB448
	Size: 0x32
	Parameters: 0
	Flags: Linked
*/
function has_blind_eye_perk_purchased_and_equipped()
{
	return self has_purchased_perk_equipped_with_specific_stat(#"specialty_nottargetedbyairsupport", #"hash_1989bed2fa3c7b67");
}

/*
	Name: has_ghost_perk_purchased_and_equipped
	Namespace: util
	Checksum: 0x53C0E9A2
	Offset: 0xB488
	Size: 0x22
	Parameters: 0
	Flags: None
*/
function has_ghost_perk_purchased_and_equipped()
{
	return has_purchased_perk_equipped(#"specialty_gpsjammer");
}

/*
	Name: has_tactical_mask_purchased_and_equipped
	Namespace: util
	Checksum: 0x5747DFAE
	Offset: 0xB4B8
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function has_tactical_mask_purchased_and_equipped()
{
	return self has_purchased_perk_equipped_with_specific_stat(#"specialty_stunprotection", #"hash_18d73d37c73a8114");
}

/*
	Name: has_hacker_perk_purchased_and_equipped
	Namespace: util
	Checksum: 0xB1A22B44
	Offset: 0xB4F8
	Size: 0x32
	Parameters: 0
	Flags: Linked
*/
function has_hacker_perk_purchased_and_equipped()
{
	return self has_purchased_perk_equipped_with_specific_stat(#"specialty_showenemyequipment", #"hash_1897ec9fa8c5c1c");
}

/*
	Name: has_cold_blooded_perk_purchased_and_equipped
	Namespace: util
	Checksum: 0x1E8976B
	Offset: 0xB538
	Size: 0x32
	Parameters: 0
	Flags: Linked
*/
function has_cold_blooded_perk_purchased_and_equipped()
{
	return self has_purchased_perk_equipped_with_specific_stat(#"specialty_nottargetedbyaitank", #"hash_b28558f13693bd9");
}

/*
	Name: has_hard_wired_perk_purchased_and_equipped
	Namespace: util
	Checksum: 0x979C8AB3
	Offset: 0xB578
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function has_hard_wired_perk_purchased_and_equipped()
{
	return self has_purchased_perk_equipped_with_specific_stat(#"specialty_immunecounteruav", #"hash_6537e48a9b3f0527");
}

/*
	Name: has_gung_ho_perk_purchased_and_equipped
	Namespace: util
	Checksum: 0xA6AD6757
	Offset: 0xB5B8
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function has_gung_ho_perk_purchased_and_equipped()
{
	return self has_purchased_perk_equipped_with_specific_stat(#"specialty_sprintfire", #"hash_1fee6b565ce51b8");
}

/*
	Name: has_fast_hands_perk_purchased_and_equipped
	Namespace: util
	Checksum: 0x80C74496
	Offset: 0xB5F8
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function has_fast_hands_perk_purchased_and_equipped()
{
	return self has_purchased_perk_equipped_with_specific_stat(#"specialty_fastweaponswitch", #"hash_7fc4f09d0daa7cc6");
}

/*
	Name: has_scavenger_perk_purchased_and_equipped
	Namespace: util
	Checksum: 0x340B2AB
	Offset: 0xB638
	Size: 0x22
	Parameters: 0
	Flags: None
*/
function has_scavenger_perk_purchased_and_equipped()
{
	return has_purchased_perk_equipped(#"specialty_scavenger");
}

/*
	Name: has_jetquiet_perk_purchased_and_equipped
	Namespace: util
	Checksum: 0x92135376
	Offset: 0xB668
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function has_jetquiet_perk_purchased_and_equipped()
{
	return self has_purchased_perk_equipped_with_specific_stat(#"specialty_jetquiet", #"hash_37417e9ac4c35344");
}

/*
	Name: has_awareness_perk_purchased_and_equipped
	Namespace: util
	Checksum: 0x61225B5B
	Offset: 0xB6A8
	Size: 0x22
	Parameters: 0
	Flags: None
*/
function has_awareness_perk_purchased_and_equipped()
{
	return has_purchased_perk_equipped(#"specialty_loudenemies");
}

/*
	Name: has_ninja_perk_purchased_and_equipped
	Namespace: util
	Checksum: 0xC744FE40
	Offset: 0xB6D8
	Size: 0x22
	Parameters: 0
	Flags: None
*/
function has_ninja_perk_purchased_and_equipped()
{
	return has_purchased_perk_equipped(#"specialty_quieter");
}

/*
	Name: has_toughness_perk_purchased_and_equipped
	Namespace: util
	Checksum: 0xEC581FDC
	Offset: 0xB708
	Size: 0x22
	Parameters: 0
	Flags: None
*/
function has_toughness_perk_purchased_and_equipped()
{
	return has_purchased_perk_equipped(#"specialty_bulletflinch");
}

/*
	Name: str_strip_lh
	Namespace: util
	Checksum: 0xE45CCB85
	Offset: 0xB738
	Size: 0x58
	Parameters: 1
	Flags: None
*/
function str_strip_lh(str)
{
	if(strendswith(str, "_lh"))
	{
		return getsubstr(str, 0, str.size - 3);
	}
	return str;
}

/*
	Name: trackwallrunningdistance
	Namespace: util
	Checksum: 0x90E1BC63
	Offset: 0xB798
	Size: 0x176
	Parameters: 0
	Flags: None
*/
function trackwallrunningdistance()
{
	self endon(#"disconnect");
	self.movementtracking.wallrunning = spawnstruct();
	self.movementtracking.wallrunning.distance = 0;
	self.movementtracking.wallrunning.count = 0;
	self.movementtracking.wallrunning.time = 0;
	while(true)
	{
		self waittill(#"wallrun_begin");
		startpos = self.origin;
		starttime = gettime();
		self.movementtracking.wallrunning.count++;
		self waittill(#"wallrun_end");
		self.movementtracking.wallrunning.distance = self.movementtracking.wallrunning.distance + distance(startpos, self.origin);
		self.movementtracking.wallrunning.time = self.movementtracking.wallrunning.time + (gettime() - starttime);
	}
}

/*
	Name: tracksprintdistance
	Namespace: util
	Checksum: 0xEFAD1802
	Offset: 0xB918
	Size: 0x176
	Parameters: 0
	Flags: None
*/
function tracksprintdistance()
{
	self endon(#"disconnect");
	self.movementtracking.sprinting = spawnstruct();
	self.movementtracking.sprinting.distance = 0;
	self.movementtracking.sprinting.count = 0;
	self.movementtracking.sprinting.time = 0;
	while(true)
	{
		self waittill(#"sprint_begin");
		startpos = self.origin;
		starttime = gettime();
		self.movementtracking.sprinting.count++;
		self waittill(#"sprint_end");
		self.movementtracking.sprinting.distance = self.movementtracking.sprinting.distance + distance(startpos, self.origin);
		self.movementtracking.sprinting.time = self.movementtracking.sprinting.time + (gettime() - starttime);
	}
}

/*
	Name: trackdoublejumpdistance
	Namespace: util
	Checksum: 0x3888D1AF
	Offset: 0xBA98
	Size: 0x176
	Parameters: 0
	Flags: None
*/
function trackdoublejumpdistance()
{
	self endon(#"disconnect");
	self.movementtracking.doublejump = spawnstruct();
	self.movementtracking.doublejump.distance = 0;
	self.movementtracking.doublejump.count = 0;
	self.movementtracking.doublejump.time = 0;
	while(true)
	{
		self waittill(#"doublejump_begin");
		startpos = self.origin;
		starttime = gettime();
		self.movementtracking.doublejump.count++;
		self waittill(#"doublejump_end");
		self.movementtracking.doublejump.distance = self.movementtracking.doublejump.distance + distance(startpos, self.origin);
		self.movementtracking.doublejump.time = self.movementtracking.doublejump.time + (gettime() - starttime);
	}
}

/*
	Name: getplayspacecenter
	Namespace: util
	Checksum: 0x21DCF39D
	Offset: 0xBC18
	Size: 0x68
	Parameters: 0
	Flags: Linked
*/
function getplayspacecenter()
{
	minimaporigins = getentarray("minimap_corner", "targetname");
	if(minimaporigins.size)
	{
		return math::find_box_center(minimaporigins[0].origin, minimaporigins[1].origin);
	}
	return (0, 0, 0);
}

/*
	Name: getplayspacemaxwidth
	Namespace: util
	Checksum: 0x43DC5DAB
	Offset: 0xBC88
	Size: 0xDE
	Parameters: 0
	Flags: Linked
*/
function getplayspacemaxwidth()
{
	minimaporigins = getentarray("minimap_corner", "targetname");
	if(minimaporigins.size)
	{
		x = abs(minimaporigins[0].origin[0] - minimaporigins[1].origin[0]);
		y = abs(minimaporigins[0].origin[1] - minimaporigins[1].origin[1]);
		return max(x, y);
	}
	return 0;
}

/*
	Name: getteammask
	Namespace: util
	Checksum: 0x91AE6FC8
	Offset: 0xBD70
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function getteammask(team)
{
	team = get_team_mapping(team);
	if(!level.teambased || !isdefined(team) || !isdefined(level.spawnsystem.ispawn_teammask[team]))
	{
		return level.spawnsystem.var_c2989de;
	}
	return level.spawnsystem.ispawn_teammask[team];
}

/*
	Name: getotherteam
	Namespace: util
	Checksum: 0x7E70A00D
	Offset: 0xBE08
	Size: 0x82
	Parameters: 1
	Flags: Linked
*/
function getotherteam(team)
{
	team = get_team_mapping(team);
	if(team == #"allies")
	{
		return #"axis";
	}
	if(team == #"axis")
	{
		return #"allies";
	}
	return #"allies";
}

/*
	Name: function_668e9d6c
	Namespace: util
	Checksum: 0x469B6A95
	Offset: 0xBEC0
	Size: 0xE0
	Parameters: 1
	Flags: None
*/
function function_668e9d6c(skip_team)
{
	team = get_team_mapping(skip_team);
	var_314ec275 = [];
	foreach(team, _ in level.teams)
	{
		if(team == skip_team)
		{
			continue;
		}
		if(team == #"spectator")
		{
			continue;
		}
		var_314ec275[var_314ec275.size] = team;
	}
	return var_314ec275;
}

/*
	Name: getotherteamsmask
	Namespace: util
	Checksum: 0x252C7C0E
	Offset: 0xBFA8
	Size: 0xE0
	Parameters: 1
	Flags: Linked
*/
function getotherteamsmask(str_skip_team)
{
	str_skip_team = get_team_mapping(str_skip_team);
	mask = 0;
	if(!isdefined(str_skip_team))
	{
		return mask;
	}
	foreach(_ in level.teams)
	{
		if(team === str_skip_team)
		{
			continue;
		}
		mask = mask | getteammask(team);
	}
	return mask;
}

/*
	Name: waittill_can_add_debug_command
	Namespace: util
	Checksum: 0xF08A2CB3
	Offset: 0xC090
	Size: 0x20
	Parameters: 0
	Flags: None
*/
function waittill_can_add_debug_command()
{
	while(!canadddebugcommand())
	{
		waitframe(1);
	}
}

/*
	Name: function_345e5b9a
	Namespace: util
	Checksum: 0xE19F8204
	Offset: 0xC0B8
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_345e5b9a(cmd)
{
	/#
		waittill_can_add_debug_command();
		adddebugcommand(cmd);
	#/
}

/*
	Name: function_8e89351
	Namespace: util
	Checksum: 0x7DD6F91
	Offset: 0xC100
	Size: 0x3E
	Parameters: 1
	Flags: Linked
*/
function function_8e89351(player)
{
	return isplayer(player) && !isbot(player);
}

/*
	Name: is_game_solo
	Namespace: util
	Checksum: 0xA0159DA1
	Offset: 0xC148
	Size: 0x22
	Parameters: 1
	Flags: None
*/
function is_game_solo(team)
{
	return function_58385b58().size == 1;
}

/*
	Name: is_game_coop
	Namespace: util
	Checksum: 0xCB623AA4
	Offset: 0xC178
	Size: 0x22
	Parameters: 1
	Flags: None
*/
function is_game_coop(team)
{
	return function_58385b58().size > 1;
}

/*
	Name: function_cfa8b8df
	Namespace: util
	Checksum: 0x911C6CC
	Offset: 0xC1A8
	Size: 0x28
	Parameters: 1
	Flags: None
*/
function function_cfa8b8df(team)
{
	return getplayers(team).size > 0;
}

/*
	Name: function_cda17472
	Namespace: util
	Checksum: 0xB7267904
	Offset: 0xC1D8
	Size: 0x28
	Parameters: 1
	Flags: None
*/
function function_cda17472(team)
{
	return function_58385b58(team).size > 0;
}

/*
	Name: timesince
	Namespace: util
	Checksum: 0x3494FB16
	Offset: 0xC208
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function timesince(starttimeinmilliseconds)
{
	return (gettime() - starttimeinmilliseconds) * 0.001;
}

/*
	Name: cooldowninit
	Namespace: util
	Checksum: 0xCBA4105F
	Offset: 0xC230
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function cooldowninit()
{
	if(!isdefined(self._cooldown))
	{
		self._cooldown = [];
	}
}

/*
	Name: cooldown
	Namespace: util
	Checksum: 0xB04D2901
	Offset: 0xC258
	Size: 0x54
	Parameters: 2
	Flags: Linked
*/
function cooldown(name, time_seconds)
{
	cooldowninit();
	self._cooldown[name] = gettime() + (int(time_seconds * 1000));
}

/*
	Name: getcooldowntimeraw
	Namespace: util
	Checksum: 0xA2F2C19F
	Offset: 0xC2B8
	Size: 0x50
	Parameters: 1
	Flags: Linked
*/
function getcooldowntimeraw(name)
{
	cooldowninit();
	if(!isdefined(self._cooldown[name]))
	{
		self._cooldown[name] = gettime() - 1;
	}
	return self._cooldown[name];
}

/*
	Name: getcooldownleft
	Namespace: util
	Checksum: 0x708F561E
	Offset: 0xC310
	Size: 0x40
	Parameters: 1
	Flags: Linked
*/
function getcooldownleft(name)
{
	cooldowninit();
	return (getcooldowntimeraw(name) - gettime()) * 0.001;
}

/*
	Name: iscooldownready
	Namespace: util
	Checksum: 0x27AB46B5
	Offset: 0xC358
	Size: 0x7C
	Parameters: 2
	Flags: Linked
*/
function iscooldownready(name, timeforward_seconds)
{
	cooldowninit();
	if(!isdefined(timeforward_seconds))
	{
		timeforward_seconds = 0;
	}
	cooldownreadytime = self._cooldown[name];
	return !isdefined(cooldownreadytime) || (gettime() + (int(timeforward_seconds * 1000))) > cooldownreadytime;
}

/*
	Name: clearcooldown
	Namespace: util
	Checksum: 0xD26B5586
	Offset: 0xC3E0
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function clearcooldown(name)
{
	cooldowninit();
	self._cooldown[name] = gettime() - 1;
}

/*
	Name: addcooldowntime
	Namespace: util
	Checksum: 0xCE2DBE4
	Offset: 0xC420
	Size: 0x6C
	Parameters: 2
	Flags: Linked
*/
function addcooldowntime(name, time_seconds)
{
	cooldowninit();
	self._cooldown[name] = getcooldowntimeraw(name) + (int(time_seconds * 1000));
}

/*
	Name: clearallcooldowns
	Namespace: util
	Checksum: 0xA23615F9
	Offset: 0xC498
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function clearallcooldowns()
{
	if(isdefined(self._cooldown))
	{
		foreach(str_name, cooldown in self._cooldown)
		{
			self._cooldown[str_name] = gettime() - 1;
		}
	}
}

/*
	Name: function_4627b63d
	Namespace: util
	Checksum: 0xC5032548
	Offset: 0xC538
	Size: 0x64
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4627b63d(alias)
{
	/#
		assert(isdefined(level.var_3c691677));
	#/
	/#
		assert(isdefined(level.var_3c691677[alias]));
	#/
	return level.var_3c691677[alias];
}

/*
	Name: function_3cb7a62d
	Namespace: util
	Checksum: 0x534C9CF4
	Offset: 0xC5A8
	Size: 0xC4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_3cb7a62d()
{
	/#
		assert(isdefined(level.team_mapping));
	#/
	if(get_team_mapping("sidea") == #"allies" && get_team_mapping("sideb") == #"axis")
	{
		level clientfield::set("cf_team_mapping", 1);
	}
	else
	{
		level clientfield::set("cf_team_mapping", 0);
	}
}

/*
	Name: function_73fab74d
	Namespace: util
	Checksum: 0xF744A7C3
	Offset: 0xC678
	Size: 0x2B4
	Parameters: 0
	Flags: Linked
*/
function function_73fab74d()
{
	if(isdefined(level.var_1bbf77be))
	{
		return;
	}
	if(!isdefined(level.team_mapping))
	{
		level.team_mapping = [];
	}
	level.var_1bbf77be = 1;
	function_9db3109f(#"allies", #"allies");
	function_9db3109f(#"axis", #"axis");
	function_9db3109f(#"allies", #"cia");
	function_9db3109f(#"axis", #"kgb");
	function_9db3109f(#"team3", #"side3");
	function_d3e0802c(#"sidea", #"sideb");
	function_d3e0802c(#"teama", #"teamb");
	function_d3e0802c(#"attacker", #"defender");
	function_d3e0802c(#"attackers", #"defenders");
	function_d3e0802c(#"cia", #"kgb");
	function_c16f65a3(#"allies", #"axis");
	function_c16f65a3(#"team3", #"any");
	set_team_mapping(#"allies", #"axis");
}

/*
	Name: function_f9ce1d49
	Namespace: util
	Checksum: 0x59D59A88
	Offset: 0xC938
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_f9ce1d49()
{
	if(isdefined(level.var_fdf974de))
	{
		return;
	}
	level.var_fdf974de = array();
}

/*
	Name: function_d7e70327
	Namespace: util
	Checksum: 0x5E58C4F3
	Offset: 0xC978
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_d7e70327(var_23866d2)
{
	array::add(level.var_fdf974de, var_23866d2);
}

/*
	Name: function_3d66774c
	Namespace: util
	Checksum: 0x7C089FA1
	Offset: 0xC9B0
	Size: 0xB0
	Parameters: 1
	Flags: None
*/
function function_3d66774c(var_23866d2)
{
	foreach(v in level.var_fdf974de)
	{
		if(array::function_460f3c24(v, var_23866d2))
		{
			array::remove_index(i);
		}
	}
}

/*
	Name: function_9b7092ef
	Namespace: util
	Checksum: 0x9CA56694
	Offset: 0xCA68
	Size: 0x13C
	Parameters: 4
	Flags: Linked
*/
function function_9b7092ef(team1, team2, team3, team4)
{
	if(!isdefined(team1) || !isdefined(team2))
	{
		return false;
	}
	foreach(var_ef54b214 in level.var_fdf974de)
	{
		if(array::contains(var_ef54b214, team1))
		{
			if(array::contains(var_ef54b214, team2))
			{
				if(!isdefined(team3) || array::contains(var_ef54b214, team3))
				{
					if(!isdefined(team4) || array::contains(var_ef54b214, team4))
					{
						return true;
					}
				}
			}
		}
	}
	return false;
}

/*
	Name: function_c77e4851
	Namespace: util
	Checksum: 0xD8A1078B
	Offset: 0xCBB0
	Size: 0x38
	Parameters: 2
	Flags: Linked
*/
function function_c77e4851(var_cdcc5ad6, var_f947dce)
{
	level.team_mapping[0] = var_cdcc5ad6;
	level.team_mapping[1] = var_f947dce;
}

/*
	Name: set_team_mapping
	Namespace: util
	Checksum: 0xF1D6200C
	Offset: 0xCBF0
	Size: 0xFC
	Parameters: 2
	Flags: Linked
*/
function set_team_mapping(var_b0dd114d, var_54495823)
{
	var_b0dd114d = function_4627b63d(var_b0dd114d);
	var_54495823 = function_4627b63d(var_54495823);
	/#
		assert(var_b0dd114d != var_54495823, "");
	#/
	game.attackers = var_b0dd114d;
	game.defenders = var_54495823;
	level.team_mapping[0] = var_b0dd114d;
	level.team_mapping[1] = var_54495823;
	if(clientfield::function_6b3b55da())
	{
		function_3cb7a62d();
	}
	flag::set(#"hash_6d0b534ae9b670d2");
}

/*
	Name: function_d3e0802c
	Namespace: util
	Checksum: 0x2DBB187
	Offset: 0xCCF8
	Size: 0x60
	Parameters: 2
	Flags: Linked
*/
function function_d3e0802c(var_1dc5879e, var_128bf12b)
{
	/#
		assert(var_1dc5879e != var_128bf12b, "");
	#/
	level.var_af68e94e[var_1dc5879e] = 0;
	level.var_af68e94e[var_128bf12b] = 1;
}

/*
	Name: function_c16f65a3
	Namespace: util
	Checksum: 0xF62EA20C
	Offset: 0xCD60
	Size: 0x5C
	Parameters: 2
	Flags: Linked
*/
function function_c16f65a3(enemy_a, enemy_b)
{
	/#
		assert(enemy_a != enemy_b, "");
	#/
	level.var_766875b1[enemy_a] = enemy_b;
	level.var_766875b1[enemy_b] = enemy_a;
}

/*
	Name: function_9db3109f
	Namespace: util
	Checksum: 0xAB00CB9F
	Offset: 0xCDC8
	Size: 0x7C
	Parameters: 2
	Flags: Linked
*/
function function_9db3109f(team, alias)
{
	/#
		assert(team == #"allies" || team == #"axis" || team == #"team3");
	#/
	level.var_3c691677[alias] = team;
}

/*
	Name: get_team_mapping
	Namespace: util
	Checksum: 0xEC89EF7F
	Offset: 0xCE50
	Size: 0xB2
	Parameters: 1
	Flags: Linked
*/
function get_team_mapping(team)
{
	/#
		assert(isdefined(level.team_mapping));
	#/
	/#
		assert(isdefined(level.var_af68e94e));
	#/
	if(isdefined(team))
	{
		if(isdefined(level.var_af68e94e[team]))
		{
			return level.team_mapping[level.var_af68e94e[team]];
		}
		if(isdefined(level.var_3c691677[team]))
		{
			return level.var_3c691677[team];
		}
	}
	return team;
}

/*
	Name: function_310d70e2
	Namespace: util
	Checksum: 0x6735150A
	Offset: 0xCF10
	Size: 0xC4
	Parameters: 1
	Flags: None
*/
function function_310d70e2(team)
{
	/#
		assert(isdefined(level.team_mapping));
	#/
	/#
		assert(isdefined(level.var_af68e94e));
	#/
	if(isdefined(team))
	{
		if(team === level.team_mapping[level.var_af68e94e[#"sidea"]])
		{
			return "sidea";
		}
		if(team === level.team_mapping[level.var_af68e94e[#"sideb"]])
		{
			return "sideb";
		}
	}
	return team;
}

/*
	Name: is_on_side
	Namespace: util
	Checksum: 0x3546557
	Offset: 0xCFE0
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function is_on_side(team)
{
	return self getteam() === get_team_mapping(team);
}

/*
	Name: get_enemy_team
	Namespace: util
	Checksum: 0xFEEEAE38
	Offset: 0xD020
	Size: 0x62
	Parameters: 1
	Flags: Linked
*/
function get_enemy_team(team)
{
	team = get_team_mapping(team);
	if(!isdefined(team))
	{
		return undefined;
	}
	if(isdefined(level.var_766875b1[team]))
	{
		return level.var_766875b1[team];
	}
	return #"none";
}

/*
	Name: function_5df4294
	Namespace: util
	Checksum: 0x27358075
	Offset: 0xD090
	Size: 0x32
	Parameters: 0
	Flags: Linked
*/
function function_5df4294()
{
	return tolower(getdvarstring(#"g_gametype"));
}

/*
	Name: function_53bbf9d2
	Namespace: util
	Checksum: 0x9716878D
	Offset: 0xD0D0
	Size: 0x32
	Parameters: 0
	Flags: Linked
*/
function function_53bbf9d2()
{
	return tolower(getdvarstring(#"hash_3b7b241b78207c96"));
}

/*
	Name: function_3f165ee8
	Namespace: util
	Checksum: 0x8FF6AD79
	Offset: 0xD110
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function function_3f165ee8()
{
	return function_53bbf9d2() === "core_frontend";
}

/*
	Name: function_e2e9d901
	Namespace: util
	Checksum: 0x437E36F5
	Offset: 0xD138
	Size: 0x54
	Parameters: 2
	Flags: None
*/
function function_e2e9d901(menu_path, commands)
{
	/#
		add_queued_debug_command(((("" + menu_path) + "") + commands) + "");
	#/
}

/*
	Name: function_d84da933
	Namespace: util
	Checksum: 0x29701FA
	Offset: 0xD198
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function function_d84da933(menu_path)
{
	/#
		add_queued_debug_command(("" + menu_path) + "");
	#/
}

/*
	Name: function_3f749abc
	Namespace: util
	Checksum: 0x3C8A2212
	Offset: 0xD1E0
	Size: 0x54
	Parameters: 2
	Flags: None
*/
function function_3f749abc(menu_path, commands)
{
	/#
		function_345e5b9a(((("" + menu_path) + "") + commands) + "");
	#/
}

/*
	Name: function_85c62761
	Namespace: util
	Checksum: 0x15EBAA08
	Offset: 0xD240
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function function_85c62761(menu_path)
{
	/#
		function_345e5b9a(("" + menu_path) + "");
	#/
}

/*
	Name: gadget_is_in_use
	Namespace: util
	Checksum: 0x4C9C243F
	Offset: 0xD288
	Size: 0xBA
	Parameters: 1
	Flags: Linked
*/
function gadget_is_in_use(slot)
{
	if(isdefined(self._gadgets_player) && isdefined(self._gadgets_player[slot]))
	{
		if(isdefined(level._gadgets_level[self._gadgets_player[slot].gadget_type]))
		{
			if(isdefined(level._gadgets_level[self._gadgets_player[slot].gadget_type].isinuse))
			{
				return self [[level._gadgets_level[self._gadgets_player[slot].gadget_type].isinuse]](slot);
			}
		}
	}
	return self gadgetisactive(slot);
}

/*
	Name: function_72cbea07
	Namespace: util
	Checksum: 0x44C16C17
	Offset: 0xD350
	Size: 0xAC
	Parameters: 2
	Flags: Linked
*/
function function_72cbea07(player, weapon)
{
	if(!isdefined(player.var_9c4683a0))
	{
		return false;
	}
	foreach(var_e64f4a4a in player.var_9c4683a0)
	{
		if(var_e64f4a4a == weapon)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: ghost_wait_show
	Namespace: util
	Checksum: 0x21C35E9C
	Offset: 0xD408
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function ghost_wait_show(wait_time)
{
	if(!isdefined(wait_time))
	{
		wait_time = 0.1;
	}
	self endon(#"death");
	self ghost();
	wait(wait_time);
	self show();
}

/*
	Name: ghost_wait_show_to_player
	Namespace: util
	Checksum: 0x22E6BD7A
	Offset: 0xD470
	Size: 0x124
	Parameters: 3
	Flags: Linked
*/
function ghost_wait_show_to_player(player, wait_time, self_endon_string1)
{
	if(!isdefined(wait_time))
	{
		wait_time = 0.1;
	}
	if(!isdefined(self))
	{
		return;
	}
	self endon(#"death");
	self.abort_ghost_wait_show_to_player = undefined;
	if(isdefined(player))
	{
		player endon(#"death", #"disconnect", #"joined_team", #"joined_spectators");
	}
	if(isdefined(self_endon_string1))
	{
		self endon(self_endon_string1);
	}
	self ghost();
	self setinvisibletoall();
	self setvisibletoplayer(player);
	wait(wait_time);
	if(!isdefined(self.abort_ghost_wait_show_to_player))
	{
		self showtoplayer(player);
	}
}

/*
	Name: ghost_wait_show_to_others
	Namespace: util
	Checksum: 0xD3621443
	Offset: 0xD5A0
	Size: 0x124
	Parameters: 3
	Flags: Linked
*/
function ghost_wait_show_to_others(player, wait_time, self_endon_string1)
{
	if(!isdefined(wait_time))
	{
		wait_time = 0.1;
	}
	if(!isdefined(self))
	{
		return;
	}
	self endon(#"death");
	self.abort_ghost_wait_show_to_others = undefined;
	if(isdefined(player))
	{
		player endon(#"death", #"disconnect", #"joined_team", #"joined_spectators");
	}
	if(isdefined(self_endon_string1))
	{
		self endon(self_endon_string1);
	}
	self ghost();
	self setinvisibletoplayer(player);
	wait(wait_time);
	if(!isdefined(self.abort_ghost_wait_show_to_others))
	{
		self show();
		self setinvisibletoplayer(player);
	}
}

/*
	Name: show_hit_marker
	Namespace: util
	Checksum: 0x3D029DC9
	Offset: 0xD6D0
	Size: 0x1EC
	Parameters: 2
	Flags: Linked
*/
function show_hit_marker(var_554cb812, var_1ed250ec)
{
	if(!isdefined(var_554cb812))
	{
		var_554cb812 = 0;
	}
	if(!isdefined(var_1ed250ec))
	{
		var_1ed250ec = 0;
	}
	if(isplayer(self))
	{
		if(isdefined(self) && isdefined(self.hud_damagefeedback))
		{
			/#
				currenttime = gettime();
				if((isdefined(self.hud_damagefeedback.time) ? self.hud_damagefeedback.time : 0) != currenttime || !is_true(self.hud_damagefeedback.feedback_dead))
				{
					if(var_554cb812)
					{
						self.hud_damagefeedback setshader(#"damage_feedback_glow_orange", 24, 48);
						self.hud_damagefeedback.feedback_dead = 1;
					}
					else
					{
						self.hud_damagefeedback setshader(#"damage_feedback", 24, 48);
						self.hud_damagefeedback.feedback_dead = 0;
					}
					self.hud_damagefeedback.alpha = 1;
					self.hud_damagefeedback fadeovertime(1);
					self.hud_damagefeedback.alpha = 0;
					self.hud_damagefeedback.time = currenttime;
				}
			#/
		}
		else if(isdefined(self) && !isdefined(self.hud_damagefeedback))
		{
			self thread function_6e97119b(var_554cb812, var_1ed250ec);
		}
	}
}

/*
	Name: function_6e97119b
	Namespace: util
	Checksum: 0x685E6218
	Offset: 0xD8C8
	Size: 0xA0
	Parameters: 2
	Flags: Linked, Private
*/
function private function_6e97119b(var_554cb812, var_1ed250ec)
{
	self endon(#"death");
	if(!isdefined(self.var_9a94bf1))
	{
		self.var_9a94bf1 = 0;
	}
	if(self.var_9a94bf1 < 5)
	{
		self.var_9a94bf1++;
		self playhitmarker(undefined, 5, undefined, var_554cb812, var_1ed250ec);
		wait_network_frame();
		self.var_9a94bf1--;
	}
}

/*
	Name: function_5d36c37a
	Namespace: util
	Checksum: 0x1043DE85
	Offset: 0xD970
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function function_5d36c37a(str_tag)
{
	if(!isdefined(str_tag))
	{
		str_tag = "tag_aim_target";
	}
	if(!issentient(self) && !function_ffa5b184(self))
	{
		if(isdefined(self gettagorigin(str_tag)))
		{
			self function_2baad8fc(str_tag);
		}
		else
		{
			self function_2baad8fc();
		}
	}
}

/*
	Name: function_c596f193
	Namespace: util
	Checksum: 0xF228CC61
	Offset: 0xDA18
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_c596f193()
{
	if(!issentient(self))
	{
		self makesentient();
	}
}

/*
	Name: function_f9af3d43
	Namespace: util
	Checksum: 0x72CCD3A6
	Offset: 0xDA58
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_f9af3d43(time)
{
	self endon(#"death");
	wait(time);
	self delete();
}

/*
	Name: is_party_gamemode
	Namespace: util
	Checksum: 0xC5EEBD6E
	Offset: 0xDAA0
	Size: 0x6C
	Parameters: 0
	Flags: None
*/
function is_party_gamemode()
{
	switch(level.gametype)
	{
		case "sas":
		case "oic":
		case "shrp":
		case "gun":
		{
			return true;
			break;
		}
	}
	return false;
}

/*
	Name: get_gametype_name
	Namespace: util
	Checksum: 0xD814D88C
	Offset: 0xDB18
	Size: 0xE
	Parameters: 0
	Flags: None
*/
function get_gametype_name()
{
	return level.gametype;
}

/*
	Name: function_419f0c21
	Namespace: util
	Checksum: 0xEB0750B6
	Offset: 0xDB30
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function function_419f0c21()
{
	self endon(#"disconnect");
	if(isplayer(self) && !isbot(self))
	{
		wait_network_frame();
		self function_eb0dd56(0);
		wait_network_frame();
		self function_eb0dd56(0);
	}
}

/*
	Name: init_dvar
	Namespace: util
	Checksum: 0x8515E9E6
	Offset: 0xDBD8
	Size: 0x9A
	Parameters: 3
	Flags: Linked
*/
function init_dvar(str_dvar, default_val, func_callback)
{
	function_5ac4dc99(str_dvar, default_val);
	if(isdefined(func_callback))
	{
		function_cd140ee9(str_dvar, func_callback);
		level thread [[func_callback]]({#value:getdvar(str_dvar), #name:str_dvar});
	}
}

/*
	Name: debug_slow_heli_speed
	Namespace: util
	Checksum: 0x1BD72548
	Offset: 0xDC80
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function debug_slow_heli_speed()
{
	/#
		if(getdvarint(#"scr_slow_heli", 0) > 0)
		{
			self setspeed(getdvarint(#"scr_slow_heli", 0));
		}
	#/
}

/*
	Name: function_fb80e9ca
	Namespace: util
	Checksum: 0x54AC78DC
	Offset: 0xDCF0
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function function_fb80e9ca()
{
	n_timeout = 0;
	self flag::set(#"hash_157310a25dd4e508");
	if(isdefined(self.var_68d6a816))
	{
		n_timeout = self.var_68d6a816;
	}
	flag::function_5f02becb(n_timeout);
	self script_delay();
	self flag::clear(#"hash_157310a25dd4e508");
}

/*
	Name: function_74f2b2e9
	Namespace: util
	Checksum: 0x9A74C93A
	Offset: 0xDD90
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_74f2b2e9()
{
	return isdefined(self.script_flag_true) || isdefined(self.script_flag_false) || function_de0e7bbd();
}

/*
	Name: function_de0e7bbd
	Namespace: util
	Checksum: 0x37B18C5C
	Offset: 0xDDD0
	Size: 0x5A
	Parameters: 0
	Flags: Linked
*/
function function_de0e7bbd()
{
	return isdefined(self.script_delay) && self.script_delay > 0 || (isdefined(self.script_delay_min) && self.script_delay_min > 0) || (isdefined(self.script_delay_max) && self.script_delay_max > 0);
}

/*
	Name: function_d2dd4134
	Namespace: util
	Checksum: 0xD8970391
	Offset: 0xDE38
	Size: 0x136
	Parameters: 2
	Flags: Linked
*/
function function_d2dd4134(str_value, str_key)
{
	a_targets = [];
	if(!isdefined(str_key))
	{
		str_key = "targetname";
	}
	if(isdefined(str_value))
	{
		var_c747e345 = strtok(str_value, " ");
		foreach(var_2fd77a2f in var_c747e345)
		{
			a_targets = arraycombine(a_targets, getentarray(var_2fd77a2f, str_key), 0, 0);
			a_targets = arraycombine(a_targets, struct::get_array(var_2fd77a2f, str_key), 0, 0);
		}
	}
	return a_targets;
}

/*
	Name: get_array
	Namespace: util
	Checksum: 0xA06544CA
	Offset: 0xDF78
	Size: 0x146
	Parameters: 2
	Flags: Linked
*/
function get_array(str_value, str_key)
{
	if(!isdefined(str_key))
	{
		str_key = "targetname";
	}
	a_targets = function_d2dd4134(str_value, str_key);
	if(isdefined(str_value))
	{
		var_c747e345 = strtok(str_value, " ");
		foreach(var_2fd77a2f in var_c747e345)
		{
			a_targets = arraycombine(a_targets, getvehiclenodearray(var_2fd77a2f, str_key), 0, 0);
			a_targets = arraycombine(a_targets, getnodearray(var_2fd77a2f, str_key), 0, 0);
		}
	}
	return a_targets;
}

/*
	Name: function_a1281365
	Namespace: util
	Checksum: 0x18B9B9D2
	Offset: 0xE0C8
	Size: 0x52
	Parameters: 1
	Flags: None
*/
function function_a1281365(radius)
{
	if(!isdefined(radius) || radius <= 0)
	{
		return 0;
	}
	return randomfloatrange(radius * -1, radius);
}

/*
	Name: function_8eb53136
	Namespace: util
	Checksum: 0x6F765B2E
	Offset: 0xE128
	Size: 0x42
	Parameters: 1
	Flags: None
*/
function function_8eb53136(radius)
{
	if(!isdefined(radius) || radius <= 0)
	{
		return 0;
	}
	return function_21a3a673(radius * -1, radius);
}

/*
	Name: is_spectating
	Namespace: util
	Checksum: 0x67CE9A20
	Offset: 0xE178
	Size: 0x28
	Parameters: 0
	Flags: Linked
*/
function is_spectating()
{
	if(self.sessionstate == #"spectator")
	{
		return true;
	}
	return false;
}

/*
	Name: function_8570168d
	Namespace: util
	Checksum: 0xF55B3338
	Offset: 0xE1A8
	Size: 0x7C
	Parameters: 0
	Flags: None
*/
function function_8570168d()
{
	/#
		if(getdvar(#"hash_49e94b7aefac4f49", 0))
		{
			return true;
		}
	#/
	if(sessionmodeismultiplayergame())
	{
		mode = function_bea73b01();
		if(mode == 4)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_88c74107
	Namespace: util
	Checksum: 0xD1406F31
	Offset: 0xE230
	Size: 0x11A
	Parameters: 0
	Flags: Linked
*/
function function_88c74107()
{
	var_bf8813f9 = 0;
	if(self == level)
	{
		a_players = getplayers();
		var_bf8813f9 = 0;
		foreach(player in a_players)
		{
			if(player isinmovemode("ufo", "noclip"))
			{
				var_bf8813f9 = 1;
				break;
			}
		}
	}
	else if(self isinmovemode("ufo", "noclip"))
	{
		var_bf8813f9 = 1;
	}
	return var_bf8813f9;
}

/*
	Name: function_22bf0a4a
	Namespace: util
	Checksum: 0xDB3E6675
	Offset: 0xE358
	Size: 0xEA
	Parameters: 0
	Flags: Linked
*/
function function_22bf0a4a()
{
	player = self;
	if(level.var_e6f2a0c9 === 1)
	{
		return;
	}
	if(getdvarstring(#"hash_60bd94571c7f1e3b", "") != "community_galil_achievement")
	{
		return;
	}
	if(!gamemodeismode(0) && !gamemodeisarena())
	{
		return;
	}
	if(level.var_903e2252 === 1)
	{
		return;
	}
	if(!isdefined(player))
	{
		return;
	}
	if(!isplayer(player))
	{
		return;
	}
	level.var_e6f2a0c9 = 1;
}

/*
	Name: function_8bcb150e
	Namespace: util
	Checksum: 0xED3E0F15
	Offset: 0xE450
	Size: 0x7C
	Parameters: 0
	Flags: None
*/
function function_8bcb150e()
{
	self function_8561e73e();
	self function_2a269390();
	self function_baee40f5();
	self function_99c354e1();
	self function_f67628d4();
}

/*
	Name: function_8561e73e
	Namespace: util
	Checksum: 0x4E310AD9
	Offset: 0xE4D8
	Size: 0xD4
	Parameters: 0
	Flags: Linked
*/
function function_8561e73e()
{
	player = self;
	if(!isplayer(player))
	{
		return;
	}
	if(player.var_2981e271 === 1)
	{
		return;
	}
	if(getdvarstring(#"hash_60bd94571c7f1e3b", "") != #"hash_4a2ae4f804e5b4a8")
	{
		return;
	}
	if(!gamemodeismode(0) && !gamemodeisarena())
	{
		return;
	}
	player.var_2981e271 = 1;
}

/*
	Name: function_2a269390
	Namespace: util
	Checksum: 0x8583D2F8
	Offset: 0xE5B8
	Size: 0xD4
	Parameters: 0
	Flags: Linked
*/
function function_2a269390()
{
	player = self;
	if(!isplayer(player))
	{
		return;
	}
	if(player.var_a9ceab54 === 1)
	{
		return;
	}
	if(getdvarstring(#"hash_60bd94571c7f1e3b", "") != #"hash_4693c8962234d1af")
	{
		return;
	}
	if(!gamemodeismode(0) && !gamemodeisarena())
	{
		return;
	}
	player.var_a9ceab54 = 1;
}

/*
	Name: function_baee40f5
	Namespace: util
	Checksum: 0x25F0FDDC
	Offset: 0xE698
	Size: 0xD4
	Parameters: 0
	Flags: Linked
*/
function function_baee40f5()
{
	player = self;
	if(!isplayer(player))
	{
		return;
	}
	if(player.var_d5ae8847 === 1)
	{
		return;
	}
	if(getdvarstring(#"hash_60bd94571c7f1e3b", "") != #"hash_c294f0f7edcd8c7")
	{
		return;
	}
	if(!gamemodeismode(0) && !gamemodeisarena())
	{
		return;
	}
	player.var_d5ae8847 = 1;
}

/*
	Name: function_99c354e1
	Namespace: util
	Checksum: 0xB4B6313A
	Offset: 0xE778
	Size: 0xD4
	Parameters: 0
	Flags: Linked
*/
function function_99c354e1()
{
	player = self;
	if(!isplayer(player))
	{
		return;
	}
	if(player.var_a1e8de2b === 1)
	{
		return;
	}
	if(getdvarstring(#"hash_60bd94571c7f1e3b", "") != #"hash_4ddd5f4046a44f9c")
	{
		return;
	}
	if(!gamemodeismode(0) && !gamemodeisarena())
	{
		return;
	}
	player.var_a1e8de2b = 1;
}

/*
	Name: function_f67628d4
	Namespace: util
	Checksum: 0x92A03536
	Offset: 0xE858
	Size: 0xBA
	Parameters: 0
	Flags: Linked
*/
function function_f67628d4()
{
	player = self;
	if(!isplayer(player))
	{
		return;
	}
	if(player.var_f67628d4 === 1)
	{
		return;
	}
	if(getdvarstring(#"hash_60bd94571c7f1e3b", "") != #"hash_4bb3605f730f2335")
	{
		return;
	}
	if(!gamemodeismode(0) && !gamemodeisarena())
	{
		return;
	}
	player.var_f67628d4 = 1;
}

/*
	Name: time_has_passed
	Namespace: util
	Checksum: 0x9FBC5646
	Offset: 0xE920
	Size: 0x34
	Parameters: 2
	Flags: Linked
*/
function time_has_passed(var_bdb4b0ca, seconds)
{
	if(!isdefined(var_bdb4b0ca))
	{
		return 0;
	}
	return (gettime() - var_bdb4b0ca) >= (seconds * 1000);
}

/*
	Name: function_b5338ccb
	Namespace: util
	Checksum: 0x58A8084C
	Offset: 0xE960
	Size: 0x86
	Parameters: 2
	Flags: Linked
*/
function function_b5338ccb(value, deadzone)
{
	/#
		assert(deadzone < 1);
	#/
	if(abs(value) < deadzone)
	{
		return 0;
	}
	return (value - (deadzone * math::sign(value))) / (1 - deadzone);
}

/*
	Name: function_63320ea1
	Namespace: util
	Checksum: 0x8A36C0DE
	Offset: 0xE9F0
	Size: 0x9C
	Parameters: 3
	Flags: None
*/
function function_63320ea1(vector, deadzone, var_edfc4672)
{
	if(var_edfc4672)
	{
		return (function_b5338ccb(vector[0], deadzone), function_b5338ccb(vector[1], deadzone), 0);
	}
	return vectornormalize(vector) * function_b5338ccb(length(vector), deadzone);
}

/*
	Name: function_2bf19e35
	Namespace: util
	Checksum: 0x21888E53
	Offset: 0xEA98
	Size: 0xDA
	Parameters: 6
	Flags: None
*/
function function_2bf19e35(func, param1, param2, param3, param4, param5)
{
	localentity = spawnstruct();
	var_5e1dc4fe = 0;
	if(isdefined(self.var_2bf19e35))
	{
		var_5e1dc4fe = self.var_2bf19e35.size;
	}
	localentity thread function_64ba0ace(self, func, param1, param2, param3, param4, param5);
	if(self.var_2bf19e35.size == var_5e1dc4fe)
	{
		return function_97194cc7();
	}
	return self function_6a97560f(localentity);
}

/*
	Name: function_88e346a
	Namespace: util
	Checksum: 0x17371565
	Offset: 0xEB80
	Size: 0x102
	Parameters: 7
	Flags: None
*/
function function_88e346a(timeout, func, param1, param2, param3, param4, param5)
{
	localentity = spawnstruct();
	localentity thread function_64ba0ace(self, func, param1, param2, param3, param4, param5);
	result = undefined;
	if(!isdefined(localentity.var_8b8e0012))
	{
		result = undefined;
		result = localentity waittilltimeout(timeout, #"hash_38ae2fe7fa91829f");
	}
	if(result._notify !== "timeout")
	{
		return self function_6a97560f(localentity);
	}
	localentity notify(#"death");
	return 0;
}

/*
	Name: function_f78e220a
	Namespace: util
	Checksum: 0xC566D4C9
	Offset: 0xEC90
	Size: 0x96
	Parameters: 0
	Flags: None
*/
function function_f78e220a()
{
	var_afdf7ef9 = [];
	if(isdefined(self.var_2bf19e35[0]) && isdefined(self.var_2bf19e35[0].var_8b8e0012))
	{
		var_afdf7ef9[0] = self.var_2bf19e35[0];
	}
	self.var_2bf19e35 = undefined;
	self notify(#"hash_1245c8bd71378f60");
	waittillframeend();
	if(!var_afdf7ef9.size)
	{
		return;
	}
	if(!var_afdf7ef9[0].var_8b8e0012)
	{
		return;
	}
	self.var_2bf19e35 = var_afdf7ef9;
}

/*
	Name: function_91a0cbb3
	Namespace: util
	Checksum: 0x46BE611C
	Offset: 0xED30
	Size: 0x44
	Parameters: 1
	Flags: Linked, Private
*/
function private function_91a0cbb3(localentity)
{
	self endon(#"death");
	localentity waittill(#"hash_19a3d1fcff248e0a", #"death");
}

/*
	Name: function_6a97560f
	Namespace: util
	Checksum: 0xED27F026
	Offset: 0xED80
	Size: 0x32
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6a97560f(localentity)
{
	function_91a0cbb3(localentity);
	return function_97194cc7();
}

/*
	Name: function_97194cc7
	Namespace: util
	Checksum: 0x751ACC6D
	Offset: 0xEDC0
	Size: 0x4E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_97194cc7()
{
	if(!isdefined(self))
	{
		return false;
	}
	if(!issentient(self))
	{
		return true;
	}
	if(isalive(self))
	{
		return true;
	}
	return false;
}

/*
	Name: function_64ba0ace
	Namespace: util
	Checksum: 0x1D21812C
	Offset: 0xEE18
	Size: 0x206
	Parameters: 7
	Flags: Linked, Private
*/
function private function_64ba0ace(caller, func, param1, param2, param3, param4, param5)
{
	self endon(#"death");
	if(!isdefined(caller.var_2bf19e35))
	{
		caller.var_2bf19e35 = [];
	}
	caller.var_2bf19e35[caller.var_2bf19e35.size] = self;
	self thread function_a4eaf81f(caller);
	function_d5e0cb2a(caller);
	if(isdefined(caller) && isdefined(caller.var_2bf19e35))
	{
		self.var_8b8e0012 = 1;
		self notify(#"hash_38ae2fe7fa91829f");
		if(isdefined(param5))
		{
			caller [[func]](param1, param2, param3, param4, param5);
		}
		else
		{
			if(isdefined(param4))
			{
				caller [[func]](param1, param2, param3, param4);
			}
			else
			{
				if(isdefined(param3))
				{
					caller [[func]](param1, param2, param3);
				}
				else
				{
					if(isdefined(param2))
					{
						caller [[func]](param1, param2);
					}
					else
					{
						if(isdefined(param1))
						{
							caller [[func]](param1);
						}
						else
						{
							caller [[func]]();
						}
					}
				}
			}
		}
		if(isdefined(caller) && isdefined(caller.var_2bf19e35))
		{
			arrayremovevalue(caller.var_2bf19e35, self);
			caller notify(#"level_function_stack_ready");
		}
	}
	if(isdefined(self))
	{
		self.var_8b8e0012 = 0;
		self notify(#"hash_19a3d1fcff248e0a");
	}
}

/*
	Name: function_a4eaf81f
	Namespace: util
	Checksum: 0x42765E9D
	Offset: 0xF028
	Size: 0x68
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a4eaf81f(caller)
{
	self endon(#"hash_19a3d1fcff248e0a");
	self waittill(#"death");
	if(isdefined(caller))
	{
		arrayremovevalue(caller.var_2bf19e35, self);
		caller notify(#"level_function_stack_ready");
	}
}

/*
	Name: function_d5e0cb2a
	Namespace: util
	Checksum: 0xBC74539E
	Offset: 0xF098
	Size: 0x78
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d5e0cb2a(caller)
{
	caller endon(#"death");
	self endon(#"death");
	caller endon(#"hash_1245c8bd71378f60");
	while(caller.var_2bf19e35[0] != self)
	{
		caller waittill(#"level_function_stack_ready");
	}
}

/*
	Name: get_links
	Namespace: util
	Checksum: 0x284BE8C3
	Offset: 0xF118
	Size: 0x66
	Parameters: 0
	Flags: Linked
*/
function get_links()
{
	if(isdefined(self.linkto))
	{
		return strtok(self.linkto, " ");
	}
	if(isdefined(self.script_linkto))
	{
		return strtok(self.script_linkto, " ");
	}
	return [];
}

/*
	Name: get_linked_structs
	Namespace: util
	Checksum: 0x4E627A8
	Offset: 0xF188
	Size: 0xF2
	Parameters: 0
	Flags: Linked
*/
function get_linked_structs()
{
	array = [];
	var_feebff9c = "linkname";
	if(isdefined(self.script_linkto))
	{
		/#
			iprintlnbold("");
		#/
		var_feebff9c = "script_linkName";
	}
	linknames = get_links();
	for(i = 0; i < linknames.size; i++)
	{
		structs = struct::get_array(linknames[i], var_feebff9c);
		if(structs.size > 0)
		{
			array = arraycombine(array, structs, 1, 0);
		}
	}
	return array;
}

/*
	Name: get_linked_ents
	Namespace: util
	Checksum: 0x815727EC
	Offset: 0xF288
	Size: 0x136
	Parameters: 0
	Flags: Linked
*/
function get_linked_ents()
{
	array = [];
	var_feebff9c = "linkname";
	if(isdefined(self.script_linkto))
	{
		/#
			iprintlnbold("");
		#/
		var_feebff9c = "script_linkName";
	}
	linknames = [];
	linknames = get_links();
	foreach(name in linknames)
	{
		entities = getentarray(name, var_feebff9c);
		if(entities.size > 0)
		{
			array = arraycombine(array, entities, 1, 0);
		}
	}
	return array;
}

/*
	Name: get_linked_ent
	Namespace: util
	Checksum: 0xAC58B7E2
	Offset: 0xF3C8
	Size: 0x62
	Parameters: 0
	Flags: None
*/
function get_linked_ent()
{
	array = get_linked_ents();
	/#
		assert(array.size == 1);
	#/
	/#
		assert(isdefined(array[0]));
	#/
	return array[0];
}

/*
	Name: get_linked_nodes
	Namespace: util
	Checksum: 0x345DEEFF
	Offset: 0xF438
	Size: 0x136
	Parameters: 0
	Flags: None
*/
function get_linked_nodes()
{
	array = [];
	var_feebff9c = "linkname";
	if(isdefined(self.script_linkto))
	{
		/#
			iprintlnbold("");
		#/
		var_feebff9c = "script_linkName";
	}
	linknames = get_links();
	foreach(name in linknames)
	{
		entities = getnodearray(name, var_feebff9c);
		if(entities.size > 0)
		{
			array = arraycombine(array, entities, 1, 0);
		}
	}
	return array;
}

/*
	Name: function_bfa9c188
	Namespace: util
	Checksum: 0x46A56037
	Offset: 0xF578
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_bfa9c188(targetname, state)
{
	if(!isdefined(state))
	{
		state = 0;
	}
	level thread function_33fbb3e5(targetname, state);
}

/*
	Name: function_33fbb3e5
	Namespace: util
	Checksum: 0xCFE3820C
	Offset: 0xF5C0
	Size: 0x118
	Parameters: 2
	Flags: Linked, Private
*/
function private function_33fbb3e5(targetname, state)
{
	self notify("_set_dynent_state_thread_" + targetname);
	self endon("_set_dynent_state_thread_" + targetname);
	wait_network_frame();
	a_dynents = getdynentarray(targetname, 1);
	if(isdefined(a_dynents) && isarray(a_dynents))
	{
		foreach(dynent in a_dynents)
		{
			function_e2a06860(dynent, state);
		}
	}
}

/*
	Name: teleport
	Namespace: util
	Checksum: 0x8A98FA14
	Offset: 0xF6E0
	Size: 0x12A
	Parameters: 2
	Flags: Linked
*/
function teleport(pos, v_ang)
{
	if(isstruct(pos))
	{
		v_pos = pos.origin;
		if(!isdefined(v_ang))
		{
			v_ang = pos.angles;
		}
	}
	else
	{
		v_pos = pos;
	}
	if(isentity(self))
	{
		self dontinterpolate();
	}
	if(isactor(self))
	{
		self forceteleport(v_pos, v_ang);
	}
	else
	{
		if(isplayer(self))
		{
			self setorigin(v_pos);
			self setplayerangles(v_ang);
		}
		else
		{
			self.origin = v_pos;
			self.angles = v_ang;
		}
	}
}

/*
	Name: function_1690fd42
	Namespace: util
	Checksum: 0x3E1A1D2
	Offset: 0xF818
	Size: 0xC4
	Parameters: 2
	Flags: None
*/
function function_1690fd42(player, persistent)
{
	/#
		assert(isplayer(player));
	#/
	if(is_true(persistent))
	{
		thread function_d532c33b(player);
	}
	else
	{
		initial_black = lui::function_e810a527("InitialBlack");
		if(!initial_black initial_black::is_open(player))
		{
			initial_black initial_black::open(player);
		}
	}
}

/*
	Name: function_cd98604b
	Namespace: util
	Checksum: 0x695FA614
	Offset: 0xF8E8
	Size: 0x6C
	Parameters: 1
	Flags: None
*/
function function_cd98604b(player)
{
	/#
		assert(isplayer(player));
	#/
	initial_black = lui::function_e810a527("InitialBlack");
	initial_black initial_black::close(player);
}

/*
	Name: function_d532c33b
	Namespace: util
	Checksum: 0xF467BFAC
	Offset: 0xF960
	Size: 0xCC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d532c33b(player)
{
	player endon(#"death", #"disconnect");
	initial_black = lui::function_e810a527("InitialBlack");
	if(!initial_black initial_black::is_open(player))
	{
		initial_black initial_black::open(player, 1);
	}
	/#
		initial_black initial_black::function_2eb3f6e8(player, getdvarint(#"hash_73c93e31e0d1ea8b", 0) == 0);
	#/
}

/*
	Name: function_7f7a77ab
	Namespace: util
	Checksum: 0x28954724
	Offset: 0xFA38
	Size: 0x2A
	Parameters: 0
	Flags: Linked
*/
function function_7f7a77ab()
{
	return getdvarint(#"hash_5312b024b0f8fcd6", 1);
}

/*
	Name: function_5355d311
	Namespace: util
	Checksum: 0x771AEFE1
	Offset: 0xFA70
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_5355d311()
{
	if(function_7f7a77ab())
	{
		if(is_true(level.var_e80a117f))
		{
			level waittill(#"hash_22962c7c3ae16f30");
		}
	}
}

/*
	Name: function_9d5c26a
	Namespace: util
	Checksum: 0x6FF58CB2
	Offset: 0xFAC8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_9d5c26a()
{
	if(is_true(level.var_e80a117f))
	{
		level waittill(#"hash_22962c7c3ae16f30");
	}
}

/*
	Name: function_256dd160
	Namespace: util
	Checksum: 0x9C4A0F90
	Offset: 0xFB08
	Size: 0x13C
	Parameters: 1
	Flags: Linked
*/
function function_256dd160(player)
{
	player disableweaponreload();
	if(player isusingoffhand() || player isthrowinggrenade())
	{
		player disableoffhandweapons();
		player disableoffhandspecial();
		player forceoffhandend();
	}
	if(player getcurrentweapon() !== player.lastnonkillstreakweapon)
	{
		player switchtoweaponimmediate(player.lastnonkillstreakweapon, 1);
	}
	player val::set(#"hash_27ff38a58fcfc46e", "freezecontrols", 1);
	player val::set(#"hash_27ff38a58fcfc46e", "takedamage", 0);
}

/*
	Name: function_49be6dce
	Namespace: util
	Checksum: 0xF97F3721
	Offset: 0xFC50
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function function_49be6dce(player)
{
	player enableweaponreload();
	player enableoffhandweapons();
	player enableoffhandspecial();
	player val::reset(#"hash_27ff38a58fcfc46e", "freezecontrols");
	player val::reset(#"hash_27ff38a58fcfc46e", "takedamage");
}

/*
	Name: function_1c8873f6
	Namespace: util
	Checksum: 0x143A9D42
	Offset: 0xFD00
	Size: 0xE0
	Parameters: 1
	Flags: None
*/
function function_1c8873f6(pause)
{
	foreach(player in level.players)
	{
		if(player.team != #"spectator")
		{
			if(pause)
			{
				player function_256dd160(player);
				continue;
			}
			player function_49be6dce(player);
		}
	}
}

/*
	Name: function_a0d3d36f
	Namespace: util
	Checksum: 0xB385C281
	Offset: 0xFDE8
	Size: 0x2A
	Parameters: 0
	Flags: Linked
*/
function function_a0d3d36f()
{
	if(!isdefined(self.var_fd243db7))
	{
		self.var_fd243db7 = {};
	}
	self.var_fd243db7.var_245ad74 = [];
}

/*
	Name: function_f7fe3c5
	Namespace: util
	Checksum: 0x531AF4C1
	Offset: 0xFE20
	Size: 0xC0
	Parameters: 1
	Flags: None
*/
function function_f7fe3c5(shitloc)
{
	if(!isdefined(self.var_fd243db7) || !isdefined(self.var_fd243db7.var_245ad74))
	{
		self function_a0d3d36f();
	}
	if(!isdefined(self.var_fd243db7.var_245ad74[shitloc]))
	{
		self.var_fd243db7.var_245ad74[shitloc] = {#hitcount:0, #shitloc:shitloc};
	}
	self.var_fd243db7.var_245ad74[shitloc].hitcount++;
}

#namespace namespace_2e6206f9;

/*
	Name: function_278f9455
	Namespace: namespace_2e6206f9
	Checksum: 0x13EB2B36
	Offset: 0xFEE8
	Size: 0x2D4
	Parameters: 3
	Flags: Linked, Variadic
*/
function function_278f9455(str_kvp, func, ...)
{
	var_a12e87bd = hash(str_kvp);
	var_bcb861f = self.(str_kvp + "_target");
	if(isdefined(var_bcb861f))
	{
		if(!isdefined(mission.var_232d57d8))
		{
			mission.var_232d57d8 = [];
		}
		if(!isdefined(mission.var_232d57d8[var_a12e87bd]))
		{
			mission.var_232d57d8[var_a12e87bd] = [];
		}
		if(!isdefined(self.var_c18fbf49))
		{
			self.var_c18fbf49 = [];
		}
		s_callback = {#params:vararg, #func:func};
		self.var_c18fbf49[var_a12e87bd] = s_callback;
		var_c747e345 = strtok(var_bcb861f, " ");
		foreach(var_5afcf8a3 in var_c747e345)
		{
			if(!isdefined(mission.var_232d57d8[var_a12e87bd][hash(var_5afcf8a3)]))
			{
				mission.var_232d57d8[var_a12e87bd][hash(var_5afcf8a3)] = [];
			}
			else if(!isarray(mission.var_232d57d8[var_a12e87bd][hash(var_5afcf8a3)]))
			{
				mission.var_232d57d8[var_a12e87bd][hash(var_5afcf8a3)] = array(mission.var_232d57d8[var_a12e87bd][hash(var_5afcf8a3)]);
			}
			mission.var_232d57d8[var_a12e87bd][hash(var_5afcf8a3)][mission.var_232d57d8[var_a12e87bd][hash(var_5afcf8a3)].size] = self;
		}
		self thread function_d608a743();
	}
}

/*
	Name: function_c6dbc898
	Namespace: namespace_2e6206f9
	Checksum: 0x3DA3A570
	Offset: 0x101C8
	Size: 0x2C4
	Parameters: 3
	Flags: Linked
*/
function function_c6dbc898(str_name, str_kvp, func)
{
	var_ce100229 = hash(str_name);
	var_bcb861f = self.(str_kvp + "_target");
	if(isdefined(var_bcb861f))
	{
		if(!isdefined(mission.var_232d57d8))
		{
			mission.var_232d57d8 = [];
		}
		if(!isdefined(mission.var_232d57d8[var_ce100229]))
		{
			mission.var_232d57d8[var_ce100229] = [];
		}
		if(!isdefined(self.var_c18fbf49))
		{
			self.var_c18fbf49 = [];
		}
		s_callback = {#func:func};
		self.var_c18fbf49[var_ce100229] = s_callback;
		var_c747e345 = strtok(var_bcb861f, " ");
		foreach(var_5afcf8a3 in var_c747e345)
		{
			if(!isdefined(mission.var_232d57d8[var_ce100229][hash(var_5afcf8a3)]))
			{
				mission.var_232d57d8[var_ce100229][hash(var_5afcf8a3)] = [];
			}
			else if(!isarray(mission.var_232d57d8[var_ce100229][hash(var_5afcf8a3)]))
			{
				mission.var_232d57d8[var_ce100229][hash(var_5afcf8a3)] = array(mission.var_232d57d8[var_ce100229][hash(var_5afcf8a3)]);
			}
			mission.var_232d57d8[var_ce100229][hash(var_5afcf8a3)][mission.var_232d57d8[var_ce100229][hash(var_5afcf8a3)].size] = self;
		}
		self thread function_d608a743();
	}
}

/*
	Name: function_d608a743
	Namespace: namespace_2e6206f9
	Checksum: 0xC9E803F6
	Offset: 0x10498
	Size: 0x140
	Parameters: 0
	Flags: Linked
*/
function function_d608a743()
{
	self notify(#"hash_29bf696e43d4a08b");
	self endon(#"hash_29bf696e43d4a08b", #"death");
	var_9bc12626 = getarraykeys(self.var_c18fbf49);
	while(true)
	{
		s_result = undefined;
		s_result = self waittill(var_9bc12626);
		s_callback = self.var_c18fbf49[hash(s_result._notify)];
		if(isdefined(s_callback.params))
		{
			util::single_thread_argarray(self, s_callback.func, s_callback.params);
		}
		else
		{
			if(isdefined(s_result.params))
			{
				util::single_thread_argarray(self, s_callback.func, s_result.params);
			}
			else
			{
				util::single_thread_argarray(self, s_callback.func);
			}
		}
	}
}

/*
	Name: function_7ed1d198
	Namespace: namespace_2e6206f9
	Checksum: 0xCEB97DDA
	Offset: 0x105E0
	Size: 0x226
	Parameters: 2
	Flags: Linked
*/
function function_7ed1d198(str_kvp, str_name)
{
	var_eef18fbd = [];
	if(isdefined(mission.var_232d57d8))
	{
		var_ce100229 = hash((isdefined(str_name) ? str_name : str_kvp));
		var_7ac3e82f = mission.var_232d57d8[var_ce100229];
		if(isdefined(var_7ac3e82f))
		{
			var_bcb861f = self.(str_kvp + "_src");
			if(isdefined(var_bcb861f))
			{
				var_c747e345 = strtok(var_bcb861f, " ");
				foreach(var_5afcf8a3 in var_c747e345)
				{
					var_85c1bb33 = var_7ac3e82f[hash(var_5afcf8a3)];
					if(isdefined(var_85c1bb33))
					{
						foreach(var_8507e893 in var_85c1bb33)
						{
							if(!isdefined(var_eef18fbd))
							{
								var_eef18fbd = [];
							}
							else if(!isarray(var_eef18fbd))
							{
								var_eef18fbd = array(var_eef18fbd);
							}
							var_eef18fbd[var_eef18fbd.size] = var_8507e893;
						}
					}
				}
			}
		}
	}
	return var_eef18fbd;
}

/*
	Name: callback
	Namespace: namespace_2e6206f9
	Checksum: 0xD9B49E59
	Offset: 0x10810
	Size: 0xAE
	Parameters: 1
	Flags: None
*/
function callback(str_kvp)
{
	var_e028d750 = function_7ed1d198(str_kvp);
	if(var_e028d750.size)
	{
		foreach(var_8507e893 in var_e028d750)
		{
			var_8507e893 notify(str_kvp);
		}
	}
}

/*
	Name: function_2b1cab26
	Namespace: namespace_2e6206f9
	Checksum: 0x16D73CD3
	Offset: 0x108C8
	Size: 0xCE
	Parameters: 3
	Flags: Variadic
*/
function function_2b1cab26(str_name, str_kvp, ...)
{
	var_e028d750 = function_7ed1d198(str_kvp, str_name);
	if(var_e028d750.size)
	{
		foreach(var_8507e893 in var_e028d750)
		{
			var_8507e893 notify(str_name, {#params:vararg});
		}
	}
}

/*
	Name: function_4da758bf
	Namespace: namespace_2e6206f9
	Checksum: 0x63532A5E
	Offset: 0x109A0
	Size: 0x1E
	Parameters: 0
	Flags: None
*/
function function_4da758bf()
{
	self.var_c18fbf49 = undefined;
	self notify(#"hash_29bf696e43d4a08b");
}

/*
	Name: function_61e8e3c8
	Namespace: namespace_2e6206f9
	Checksum: 0x8F46E0F9
	Offset: 0x109C8
	Size: 0x3A
	Parameters: 1
	Flags: None
*/
function function_61e8e3c8(str_kvp)
{
	return util::get_array(self.(str_kvp + "_target"), str_kvp + "_src");
}

/*
	Name: get_target_structs
	Namespace: namespace_2e6206f9
	Checksum: 0xEC6BC11B
	Offset: 0x10A10
	Size: 0x3A
	Parameters: 1
	Flags: Linked
*/
function get_target_structs(str_kvp)
{
	return util::get_array(self.(str_kvp + "_src"), str_kvp + "_target");
}

