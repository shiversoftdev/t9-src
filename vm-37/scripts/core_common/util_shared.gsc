#using scripts\abilities\ability_player.gsc;
#using script_4194df57536e11ed;
#using scripts\core_common\lui_shared.gsc;
#using script_3d703ef87a841fe4;
#using script_51e19a6cd0b4d30f;
#using script_7f6cd71c43c45c57;
#using scripts\core_common\weapons_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using script_32c8b5b0eb2854f3;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace util;

/*
	Name: __init__system__
	Namespace: util
	Checksum: 0x9ED5F620
	Offset: 0x3B8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"util_shared", &function_70a657d8, undefined, &function_3cb7a62d, undefined);
}

/*
	Name: function_70a657d8
	Namespace: util
	Checksum: 0x49F6F578
	Offset: 0x408
	Size: 0x128
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
		function_5ac4dc99("", 0);
	#/
	/#
		function_5ac4dc99("", 1);
	#/
	/#
		function_d0ca1d49();
	#/
	level.var_b756a21c = [#"left_foot":1, #"right_foot":1, #"left_leg_lower":1, #"right_leg_lower":1, #"left_leg_upper":1, #"right_leg_upper":1];
}

/*
	Name: function_95d3192c
	Namespace: util
	Checksum: 0xCD853E33
	Offset: 0x538
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
	Checksum: 0x56D2D828
	Offset: 0x560
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
	Checksum: 0xD85918BA
	Offset: 0x5D0
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
	Checksum: 0xDE896340
	Offset: 0x8A8
	Size: 0xA4
	Parameters: 1
	Flags: None
*/
function error(msg)
{
	/#
		println("", msg);
		if(!sessionmodeismultiplayergame() && !sessionmodeiswarzonegame())
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
	Checksum: 0x58F1A197
	Offset: 0x958
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
	Checksum: 0xDA6D61F
	Offset: 0x998
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
	Checksum: 0xA9FAF6C1
	Offset: 0x9B0
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
	Checksum: 0xC7006144
	Offset: 0xAA8
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
	Checksum: 0x5825D677
	Offset: 0xB08
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
	Checksum: 0x1BEE9E1E
	Offset: 0xC40
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
	Checksum: 0x5B5FC85B
	Offset: 0xD00
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
	Checksum: 0x4214CDDD
	Offset: 0xD68
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
	Checksum: 0x6B5C1EA4
	Offset: 0xDC0
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
	Checksum: 0xEF5887B3
	Offset: 0xF88
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
	Checksum: 0x6D445EB7
	Offset: 0x1058
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
	Checksum: 0xCA6285C3
	Offset: 0x1100
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
	Checksum: 0xD8347E03
	Offset: 0x1298
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
	Checksum: 0x60805D5B
	Offset: 0x1880
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
	Checksum: 0xA1BC2496
	Offset: 0x18F8
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
	Checksum: 0xC0C6BB3D
	Offset: 0x1AF8
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
	Checksum: 0x22D54A7C
	Offset: 0x1B78
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
	Checksum: 0x549F6478
	Offset: 0x1C18
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
	Checksum: 0x6CA7511C
	Offset: 0x1CE0
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
	Checksum: 0xACC35ED3
	Offset: 0x1DA0
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
	Checksum: 0x425FDFAD
	Offset: 0x1E80
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
	Checksum: 0x32CCCD2D
	Offset: 0x2100
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
	Checksum: 0xB3D3C759
	Offset: 0x22E0
	Size: 0x1D6
	Parameters: 0
	Flags: None
*/
function debugorigin()
{
	/#
		self notify(#"debug origin");
		self endon(#"debug origin", #"death");
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
	Checksum: 0xDF4A037
	Offset: 0x24C0
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
	Checksum: 0x4528FAE1
	Offset: 0x2570
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
	Checksum: 0x8247F1AD
	Offset: 0x26C8
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
	Checksum: 0x8E40169
	Offset: 0x2708
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
	Checksum: 0x972E0FF4
	Offset: 0x2790
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
	Checksum: 0x5784D4BA
	Offset: 0x2818
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
	Checksum: 0xDC1D141C
	Offset: 0x28C0
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
	Checksum: 0x8B0788CE
	Offset: 0x2978
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
	Checksum: 0x291510DA
	Offset: 0x2B28
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
	Checksum: 0x8C14F8DF
	Offset: 0x2BE0
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
	Checksum: 0x85F5A74E
	Offset: 0x2DA8
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
	Checksum: 0x49D29EC4
	Offset: 0x2E08
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
	Checksum: 0x2FEB5F93
	Offset: 0x2F60
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
	Checksum: 0x9B933BA6
	Offset: 0x2FE0
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
	Checksum: 0xC7904F4A
	Offset: 0x3008
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
	Checksum: 0x261563BA
	Offset: 0x3030
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
	Checksum: 0x4D0A1EA
	Offset: 0x3070
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
	Checksum: 0xEEBAD621
	Offset: 0x30B0
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
	Checksum: 0x3D71C433
	Offset: 0x3548
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
	Checksum: 0xD5578940
	Offset: 0x35B8
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
	Checksum: 0x9A808541
	Offset: 0x3670
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
	Checksum: 0x4A71CE9A
	Offset: 0x36D8
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
	Checksum: 0x4A74E58D
	Offset: 0x3720
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
	Checksum: 0x348B3733
	Offset: 0x3768
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
	Checksum: 0x36DB9B60
	Offset: 0x37B8
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
	Checksum: 0x79596940
	Offset: 0x3810
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
	Name: script_delay
	Namespace: util
	Checksum: 0x7844BE00
	Offset: 0x4078
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
	Checksum: 0xADDEEF57
	Offset: 0x4150
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
	Checksum: 0x115F2013
	Offset: 0x4210
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
	Checksum: 0xC83161B9
	Offset: 0x4290
	Size: 0xB8
	Parameters: 1
	Flags: Linked
*/
function function_aebdb74f(str_flags)
{
	a_str_flags = strtok(str_flags, " ");
	foreach(str_flag in a_str_flags)
	{
		level flag::set(str_flag);
	}
}

/*
	Name: fileprint_start
	Namespace: util
	Checksum: 0xE8F97421
	Offset: 0x4350
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
	Checksum: 0x945EEB3B
	Offset: 0x43C0
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
	Checksum: 0x5D6A4498
	Offset: 0x4428
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
	Checksum: 0xB52582D9
	Offset: 0x44A0
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
	Checksum: 0xE2FD6AD1
	Offset: 0x45A0
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
	Checksum: 0xACB63D66
	Offset: 0x4628
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
	Checksum: 0x744C154E
	Offset: 0x46E8
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
	Checksum: 0xEFDCDBF7
	Offset: 0x4768
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
	Checksum: 0xF97EFA78
	Offset: 0x49D8
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
	Checksum: 0x17F127D6
	Offset: 0x4A48
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
	Checksum: 0x5BB0C37B
	Offset: 0x4AE0
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
	Checksum: 0x18C1E21C
	Offset: 0x4C20
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
	Checksum: 0x523951D3
	Offset: 0x4C88
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
	Checksum: 0xB25BF4D9
	Offset: 0x4CF0
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
	Checksum: 0xE58098BA
	Offset: 0x4D58
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
	Checksum: 0x5411F174
	Offset: 0x4DC0
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
	Checksum: 0x1B2669F6
	Offset: 0x4DD8
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
	Checksum: 0x9A9268A6
	Offset: 0x4E08
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
	Checksum: 0x27FDAE04
	Offset: 0x4E68
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
	Checksum: 0x58B80AB3
	Offset: 0x4E98
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
	Checksum: 0xAE6F52EF
	Offset: 0x4F88
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
	Checksum: 0x5825F4C4
	Offset: 0x5008
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
	if(ishash(time_or_notify) || isstring(time_or_notify))
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
	Checksum: 0x3EC31D3A
	Offset: 0x5130
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
	Checksum: 0xF292B444
	Offset: 0x51B0
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
	Checksum: 0x110A119D
	Offset: 0x5260
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
	Checksum: 0xDED512EF
	Offset: 0x52B0
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
	if(ishash(time_or_notify) || isstring(time_or_notify))
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
	Checksum: 0x5814D189
	Offset: 0x5358
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
	Checksum: 0xCEAFDB4E
	Offset: 0x53D0
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
	Checksum: 0x7F950337
	Offset: 0x54C8
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
	Checksum: 0x2ACB898B
	Offset: 0x55E0
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
	Checksum: 0x4DDBF5F8
	Offset: 0x56B8
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
	Checksum: 0x181C13A4
	Offset: 0x5730
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
	Checksum: 0xE3697F55
	Offset: 0x5780
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
	Checksum: 0xE08EEB93
	Offset: 0x5928
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
	Checksum: 0x23FD4E22
	Offset: 0x5980
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
	Checksum: 0xF15F9A14
	Offset: 0x59B0
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
	Checksum: 0x8A70AD10
	Offset: 0x59E8
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
	Checksum: 0x4B66DD80
	Offset: 0x5A18
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
	if(isstring(model_name) || ishash(model_name))
	{
		model setmodel(model_name);
	}
	model.angles = angles;
	return model;
}

/*
	Name: spawn_anim_model
	Namespace: util
	Checksum: 0x2E3E70D9
	Offset: 0x5BA0
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
	Checksum: 0xCB36FE41
	Offset: 0x5C38
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
	Checksum: 0x6EF98098
	Offset: 0x5CD0
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
	Checksum: 0x65DD8378
	Offset: 0x5D88
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
	Checksum: 0x71F53F9E
	Offset: 0x5DE8
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
	Checksum: 0xEAE8A935
	Offset: 0x5FA8
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
	Checksum: 0xA2692C81
	Offset: 0x6028
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
	Checksum: 0xF328CBFC
	Offset: 0x60B8
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
	Checksum: 0xEB24721B
	Offset: 0x6108
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
	Checksum: 0xDD3D6D38
	Offset: 0x6130
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
	Checksum: 0x25A3BB97
	Offset: 0x6170
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
	Checksum: 0x840C2ECF
	Offset: 0x61C8
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
	Checksum: 0xFB8C2FF5
	Offset: 0x6228
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
	Checksum: 0x343B8702
	Offset: 0x6248
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
	Checksum: 0x9C73D81F
	Offset: 0x62B8
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
	Checksum: 0x391D32F7
	Offset: 0x62F8
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
	Checksum: 0xA7460939
	Offset: 0x6358
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
	Checksum: 0xB25175FB
	Offset: 0x6408
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
	Checksum: 0x6422F794
	Offset: 0x64B8
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
	Checksum: 0xC70BD70
	Offset: 0x65A8
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
	Checksum: 0xA302EC9E
	Offset: 0x66E8
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
	Checksum: 0x1A635D03
	Offset: 0x6708
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
	Checksum: 0x465775A3
	Offset: 0x6770
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
	Checksum: 0xEB7AE513
	Offset: 0x6838
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
	Checksum: 0xBECD63F1
	Offset: 0x69A0
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
	Checksum: 0x375AD7D1
	Offset: 0x69E0
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
	Checksum: 0x12EB6F12
	Offset: 0x6A08
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
	Checksum: 0x60A97572
	Offset: 0x6A30
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
	Checksum: 0xEE92F771
	Offset: 0x6B50
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
	Checksum: 0x27011E59
	Offset: 0x6C98
	Size: 0x468
	Parameters: 4
	Flags: Linked
*/
function spawn_player_clone(player, animname, s_align, var_df23b31f)
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
		weapon = player getcurrentweapon();
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
	Checksum: 0xA52D73D4
	Offset: 0x7108
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
	Checksum: 0x61C685F6
	Offset: 0x71D8
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
	Checksum: 0x2A7FB73E
	Offset: 0x7228
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
	Checksum: 0x3428C887
	Offset: 0x72C0
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
	tacpoint = getclosesttacpoint(self.origin);
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
	Checksum: 0x30E995BB
	Offset: 0x7398
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
	Checksum: 0xC21F14C
	Offset: 0x7448
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
	Checksum: 0x94AEAF2A
	Offset: 0x7500
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
	Checksum: 0xEBC516F5
	Offset: 0x7658
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
	Checksum: 0x4CE24AE2
	Offset: 0x76B0
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
	Checksum: 0x3987140A
	Offset: 0x7710
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
	Checksum: 0x269BAA9C
	Offset: 0x7770
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
	Checksum: 0xA0B4C252
	Offset: 0x77D0
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
	Name: waittill_use_button_pressed
	Namespace: util
	Checksum: 0x3FB5CD13
	Offset: 0x7830
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
	Checksum: 0xE64B340E
	Offset: 0x7860
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
	Checksum: 0x4D03E1AA
	Offset: 0x7890
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
	Checksum: 0xD2CBEFAE
	Offset: 0x78C0
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
	Checksum: 0x30154163
	Offset: 0x78F0
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
	Name: waittill_attack_button_pressed
	Namespace: util
	Checksum: 0x799EE8B7
	Offset: 0x7920
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
	Checksum: 0x4A2D526
	Offset: 0x7950
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
	Checksum: 0x9B9036F9
	Offset: 0x7980
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
	Checksum: 0x4A866E74
	Offset: 0x79B0
	Size: 0xC8
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
		/#
			level._button_funcs[4] = &up_button_pressed;
			level._button_funcs[5] = &down_button_pressed;
		#/
	}
}

/*
	Name: up_button_held
	Namespace: util
	Checksum: 0x74C39E51
	Offset: 0x7A80
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
	Checksum: 0xA0061A78
	Offset: 0x7AF0
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
	Checksum: 0x3034386F
	Offset: 0x7B60
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
	Checksum: 0x16E8A164
	Offset: 0x7BB0
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
	Checksum: 0x68D7BE72
	Offset: 0x7BE0
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
	Checksum: 0xC491B3A3
	Offset: 0x7C30
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
	Checksum: 0x5088502
	Offset: 0x7C60
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
	Checksum: 0x5F8FDAC0
	Offset: 0x7CA0
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
	Checksum: 0x24E700BE
	Offset: 0x7D08
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
	Checksum: 0xF61FB28A
	Offset: 0x7D60
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
	Checksum: 0x80B2C52B
	Offset: 0x7DE8
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
	Checksum: 0x4907E96B
	Offset: 0x7E70
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
	Checksum: 0x90554CE0
	Offset: 0x7EA8
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
	Checksum: 0xF73AC432
	Offset: 0x7EC0
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
	Checksum: 0xA82FB316
	Offset: 0x7F00
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
	Checksum: 0x96D57EBD
	Offset: 0x7F20
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
	Checksum: 0x1A938F9D
	Offset: 0x7FF0
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
	Checksum: 0xA21F8D28
	Offset: 0x80A0
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
	Checksum: 0xD16F709F
	Offset: 0x8140
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
	Checksum: 0x669FE802
	Offset: 0x8300
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
	Checksum: 0x142F5183
	Offset: 0x8450
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
	Checksum: 0x36041738
	Offset: 0x84C8
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
	Checksum: 0x6B8C183A
	Offset: 0x8550
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
	Checksum: 0xCD953AD1
	Offset: 0x85A8
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
	Checksum: 0xB3893E9E
	Offset: 0x8650
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
	Checksum: 0x45E08D20
	Offset: 0x86C8
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
	Checksum: 0xA7372CF
	Offset: 0x8800
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
	Checksum: 0x1052168F
	Offset: 0x8860
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
	Checksum: 0x3F31DD12
	Offset: 0x8878
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
	Checksum: 0xC341B405
	Offset: 0x8898
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
	Checksum: 0x42ED6ED5
	Offset: 0x8968
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
	Checksum: 0xB9BC4B90
	Offset: 0x89C8
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
	Checksum: 0xFED3B678
	Offset: 0x8A48
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
	Checksum: 0x8D07E39E
	Offset: 0x8A90
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
	Checksum: 0x917D10A3
	Offset: 0x8AD0
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
	Checksum: 0xC344CFAE
	Offset: 0x8B58
	Size: 0x54
	Parameters: 1
	Flags: None
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
	Checksum: 0xC88ED1CE
	Offset: 0x8BB8
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
	Checksum: 0xECB9AEA3
	Offset: 0x8C50
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
	Checksum: 0xA5D03ECA
	Offset: 0x8CD0
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
	Checksum: 0x8A173BBC
	Offset: 0x8FB8
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
	Checksum: 0x1D509D50
	Offset: 0x8FF0
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
	Checksum: 0xFF14656
	Offset: 0x90A0
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
	Checksum: 0x8CB0806E
	Offset: 0x9108
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
	Checksum: 0xF7167F58
	Offset: 0x93A8
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
	Checksum: 0x862E2C7A
	Offset: 0x9548
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
	Checksum: 0x466A3BD3
	Offset: 0x9698
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
	Checksum: 0x59CEA09F
	Offset: 0x9808
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
	Checksum: 0x346CED3F
	Offset: 0x9D60
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
	Checksum: 0x27BBF282
	Offset: 0x9E10
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
	Checksum: 0x698E6D25
	Offset: 0x9E90
	Size: 0x6A
	Parameters: 0
	Flags: Linked
*/
function function_4c1656d5()
{
	if(sessionmodeiswarzonegame())
	{
		return getdvarfloat(#"hash_4e7a02edee964bf9", 250);
	}
	return getdvarfloat(#"hash_4ec50cedeed64871", 250);
}

/*
	Name: function_16fb0a3b
	Namespace: util
	Checksum: 0x56D8E16
	Offset: 0x9F08
	Size: 0x122
	Parameters: 0
	Flags: Linked
*/
function function_16fb0a3b()
{
	if(sessionmodeiswarzonegame())
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
	Checksum: 0x27DCE2B3
	Offset: 0xA038
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
	Checksum: 0x4AC8B1EE
	Offset: 0xA0B0
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
	Checksum: 0xA5E00140
	Offset: 0xA220
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
	Checksum: 0xC96610AF
	Offset: 0xA2C8
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
	Checksum: 0xBB2BBB8D
	Offset: 0xA2F0
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
	Checksum: 0x90F4E22C
	Offset: 0xA318
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
	Checksum: 0xFE37E4DA
	Offset: 0xA350
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
	Checksum: 0x922FA48B
	Offset: 0xA398
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
	Checksum: 0xCAF0BA73
	Offset: 0xA468
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
	Checksum: 0x692BA82F
	Offset: 0xA4A8
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
	Checksum: 0x38FDE49C
	Offset: 0xA550
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
	Checksum: 0xF47AE3E3
	Offset: 0xA638
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
	Checksum: 0xD2BD769B
	Offset: 0xA708
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
	Checksum: 0xC35D2EC9
	Offset: 0xA788
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
	Checksum: 0x8B0BCA57
	Offset: 0xA860
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
	Checksum: 0xB467AACA
	Offset: 0xA888
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
	Checksum: 0x4E70719
	Offset: 0xA950
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
	Checksum: 0xBCDE7524
	Offset: 0xAA38
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
	Checksum: 0xADB47C2E
	Offset: 0xAA88
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
	Checksum: 0x17A1E6F6
	Offset: 0xAB78
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
	Checksum: 0x1B5C9C6B
	Offset: 0xAB90
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
	Checksum: 0xF1BC9559
	Offset: 0xABB8
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
	Checksum: 0xBB24A3D7
	Offset: 0xABE8
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
	Checksum: 0xF4FDCE12
	Offset: 0xAC18
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
	Checksum: 0x1E9CE8C1
	Offset: 0xAC48
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
	Checksum: 0x4D23A5C7
	Offset: 0xADD8
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
	Checksum: 0x6579229F
	Offset: 0xAE78
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
	Checksum: 0x9C8D43B5
	Offset: 0xAEB0
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
	Checksum: 0xE3B606EA
	Offset: 0xAF28
	Size: 0x20
	Parameters: 0
	Flags: None
*/
function is_safehouse()
{
	mapname = get_map_name();
	return false;
}

/*
	Name: is_new_cp_map
	Namespace: util
	Checksum: 0x398C71C1
	Offset: 0xAF50
	Size: 0x4A
	Parameters: 0
	Flags: None
*/
function is_new_cp_map()
{
	mapname = get_map_name();
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
	Checksum: 0xEC2B69EC
	Offset: 0xAFA8
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
	Checksum: 0x57D671ED
	Offset: 0xB018
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
	Checksum: 0xE3DD9DF6
	Offset: 0xB178
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
	Checksum: 0xE8D03DEC
	Offset: 0xB1C8
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
	Checksum: 0x1B00780D
	Offset: 0xB238
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
	Checksum: 0xDF78C51F
	Offset: 0xB280
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
	Checksum: 0xA8813781
	Offset: 0xB2D0
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
	Checksum: 0x38E3EA70
	Offset: 0xB340
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
	Checksum: 0x428A0C4D
	Offset: 0xB370
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
	Checksum: 0xA9206BEE
	Offset: 0xB3B0
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
	Checksum: 0x32A8EEA2
	Offset: 0xB3E0
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
	Checksum: 0xB8E2650B
	Offset: 0xB420
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
	Checksum: 0x3173E5F1
	Offset: 0xB460
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
	Checksum: 0xB58ADFEC
	Offset: 0xB4A0
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
	Checksum: 0xFDA538A1
	Offset: 0xB4E0
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
	Checksum: 0x6722B707
	Offset: 0xB520
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
	Checksum: 0x37B26BFA
	Offset: 0xB560
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
	Checksum: 0x6A848F61
	Offset: 0xB590
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
	Checksum: 0x658722BE
	Offset: 0xB5D0
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
	Checksum: 0x7E570AE1
	Offset: 0xB600
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
	Checksum: 0x7D6DC914
	Offset: 0xB630
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
	Checksum: 0xD879A9B8
	Offset: 0xB660
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
	Checksum: 0x50BAE7DB
	Offset: 0xB6C0
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
	Checksum: 0x456A7642
	Offset: 0xB840
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
	Checksum: 0x544E8211
	Offset: 0xB9C0
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
	Checksum: 0x9B9A06E3
	Offset: 0xBB40
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
	Checksum: 0xBA50602C
	Offset: 0xBBB0
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
	Checksum: 0x176CCE0B
	Offset: 0xBC98
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
	Checksum: 0x43D0A450
	Offset: 0xBD30
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
	Checksum: 0xBB64D640
	Offset: 0xBDE8
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
	Checksum: 0x44C5D094
	Offset: 0xBED0
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
	Checksum: 0x932311C
	Offset: 0xBFB8
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
	Name: add_debug_command
	Namespace: util
	Checksum: 0x4FD4FC6
	Offset: 0xBFE0
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function add_debug_command(cmd)
{
	/#
		waittill_can_add_debug_command();
		adddebugcommand(cmd);
	#/
}

/*
	Name: function_8e89351
	Namespace: util
	Checksum: 0x37164A56
	Offset: 0xC028
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
	Checksum: 0xD89D08A4
	Offset: 0xC070
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
	Checksum: 0xB5D7B584
	Offset: 0xC0A0
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
	Checksum: 0xD938EDF4
	Offset: 0xC0D0
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
	Checksum: 0xA6CEB441
	Offset: 0xC100
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
	Checksum: 0x5B4ABB1D
	Offset: 0xC130
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
	Checksum: 0x24372804
	Offset: 0xC158
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
	Checksum: 0x19EA67F3
	Offset: 0xC180
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
	Checksum: 0x671E5C65
	Offset: 0xC1E0
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
	Checksum: 0x6F6F776
	Offset: 0xC238
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
	Checksum: 0xBBEF73F
	Offset: 0xC280
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
	Checksum: 0x69E46CB6
	Offset: 0xC308
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
	Checksum: 0xC01542B5
	Offset: 0xC348
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
	Checksum: 0x16ADEFC8
	Offset: 0xC3C0
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
	Checksum: 0xAB9D0AD4
	Offset: 0xC460
	Size: 0x64
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4627b63d(alias)
{
	/#
		assert(isdefined(level.team_mapping_alias));
	#/
	/#
		assert(isdefined(level.team_mapping_alias[alias]));
	#/
	return level.team_mapping_alias[alias];
}

/*
	Name: function_3cb7a62d
	Namespace: util
	Checksum: 0xC5C99A3D
	Offset: 0xC4D0
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
	Checksum: 0x5F8637DB
	Offset: 0xC5A0
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
	Checksum: 0x7727E2F4
	Offset: 0xC860
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
	Checksum: 0xF404457F
	Offset: 0xC8A0
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
	Checksum: 0x9A5CAAA2
	Offset: 0xC8D8
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
	Checksum: 0xADBE2EB
	Offset: 0xC990
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
	Checksum: 0x61B83837
	Offset: 0xCAD8
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
	Checksum: 0xF747F33B
	Offset: 0xCB18
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
	if(clientfield::can_set())
	{
		function_3cb7a62d();
	}
	flag::set(#"team_mapping_set");
}

/*
	Name: function_d3e0802c
	Namespace: util
	Checksum: 0x1760126E
	Offset: 0xCC20
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
	Checksum: 0x3D45B44E
	Offset: 0xCC88
	Size: 0x5C
	Parameters: 2
	Flags: Linked
*/
function function_c16f65a3(enemy_a, enemy_b)
{
	/#
		assert(enemy_a != enemy_b, "");
	#/
	level.team_enemy_mapping[enemy_a] = enemy_b;
	level.team_enemy_mapping[enemy_b] = enemy_a;
}

/*
	Name: function_9db3109f
	Namespace: util
	Checksum: 0xE2513C8B
	Offset: 0xCCF0
	Size: 0x7C
	Parameters: 2
	Flags: Linked
*/
function function_9db3109f(team, alias)
{
	/#
		assert(team == #"allies" || team == #"axis" || team == #"team3");
	#/
	level.team_mapping_alias[alias] = team;
}

/*
	Name: get_team_mapping
	Namespace: util
	Checksum: 0xBEBBD4C8
	Offset: 0xCD78
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
		if(isdefined(level.team_mapping_alias[team]))
		{
			return level.team_mapping_alias[team];
		}
	}
	return team;
}

/*
	Name: function_310d70e2
	Namespace: util
	Checksum: 0x1C9B9969
	Offset: 0xCE38
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
	Checksum: 0xD9EB5249
	Offset: 0xCF08
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
	Checksum: 0xF858ECD1
	Offset: 0xCF48
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
	if(isdefined(level.team_enemy_mapping[team]))
	{
		return level.team_enemy_mapping[team];
	}
	return #"none";
}

/*
	Name: get_game_type
	Namespace: util
	Checksum: 0x595D513F
	Offset: 0xCFB8
	Size: 0x32
	Parameters: 0
	Flags: Linked
*/
function get_game_type()
{
	return tolower(getdvarstring(#"g_gametype"));
}

/*
	Name: get_map_name
	Namespace: util
	Checksum: 0xCC4636FE
	Offset: 0xCFF8
	Size: 0x32
	Parameters: 0
	Flags: Linked
*/
function get_map_name()
{
	return tolower(getdvarstring(#"sv_mapname"));
}

/*
	Name: is_frontend_map
	Namespace: util
	Checksum: 0x89964F75
	Offset: 0xD038
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function is_frontend_map()
{
	return get_map_name() === "core_frontend";
}

/*
	Name: add_devgui
	Namespace: util
	Checksum: 0xC79DE503
	Offset: 0xD060
	Size: 0x54
	Parameters: 2
	Flags: Linked
*/
function add_devgui(menu_path, commands)
{
	/#
		add_queued_debug_command(((("" + menu_path) + "") + commands) + "");
	#/
}

/*
	Name: remove_devgui
	Namespace: util
	Checksum: 0xBA7FBE23
	Offset: 0xD0C0
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function remove_devgui(menu_path)
{
	/#
		add_queued_debug_command(("" + menu_path) + "");
	#/
}

/*
	Name: function_3f749abc
	Namespace: util
	Checksum: 0x2C45CA2
	Offset: 0xD108
	Size: 0x54
	Parameters: 2
	Flags: None
*/
function function_3f749abc(menu_path, commands)
{
	/#
		add_debug_command(((("" + menu_path) + "") + commands) + "");
	#/
}

/*
	Name: function_85c62761
	Namespace: util
	Checksum: 0xFB97F606
	Offset: 0xD168
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_85c62761(menu_path)
{
	/#
		add_debug_command(("" + menu_path) + "");
	#/
}

/*
	Name: gadget_is_in_use
	Namespace: util
	Checksum: 0xC7DA0183
	Offset: 0xD1B0
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
	Checksum: 0xDFB10052
	Offset: 0xD278
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
	Checksum: 0xD4B61789
	Offset: 0xD330
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
	Checksum: 0x437D4BF5
	Offset: 0xD398
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
	Checksum: 0x361BFB04
	Offset: 0xD4C8
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
	Checksum: 0xCF0A081
	Offset: 0xD5F8
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
			self thread _show_hit_marker(var_554cb812, var_1ed250ec);
		}
	}
}

/*
	Name: _show_hit_marker
	Namespace: util
	Checksum: 0xB9F1C9EF
	Offset: 0xD7F0
	Size: 0xA0
	Parameters: 2
	Flags: Linked, Private
*/
function private _show_hit_marker(var_554cb812, var_1ed250ec)
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
	Checksum: 0x84594BAA
	Offset: 0xD898
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
	Name: make_sentient
	Namespace: util
	Checksum: 0x7570F677
	Offset: 0xD940
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function make_sentient()
{
	if(!issentient(self))
	{
		self makesentient();
	}
}

/*
	Name: function_f9af3d43
	Namespace: util
	Checksum: 0x8DFC7B25
	Offset: 0xD980
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
	Checksum: 0x529A713F
	Offset: 0xD9C8
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
	Checksum: 0xEE602E87
	Offset: 0xDA40
	Size: 0xE
	Parameters: 0
	Flags: None
*/
function get_gametype_name()
{
	return level.gametype;
}

/*
	Name: cleanup_fancycam
	Namespace: util
	Checksum: 0x88F4ED8
	Offset: 0xDA58
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function cleanup_fancycam()
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
	Checksum: 0xA568EAE6
	Offset: 0xDB00
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
	Checksum: 0xD6B532D9
	Offset: 0xDBA8
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
	Checksum: 0x711E52ED
	Offset: 0xDC18
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
	Checksum: 0x5BB671EB
	Offset: 0xDCB8
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
	Checksum: 0x9E77448F
	Offset: 0xDCF8
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
	Checksum: 0x35A9D3AE
	Offset: 0xDD60
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
	Checksum: 0xE66A5710
	Offset: 0xDEA0
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
	Checksum: 0x457CEAC0
	Offset: 0xDFF0
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
	Checksum: 0x677EEEFD
	Offset: 0xE050
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
	Checksum: 0x3B6712CD
	Offset: 0xE0A0
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
	Checksum: 0xA5E6E92A
	Offset: 0xE0D0
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
	Checksum: 0x5F68116D
	Offset: 0xE158
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
	Checksum: 0x82E3F18A
	Offset: 0xE280
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
	Checksum: 0x74A58700
	Offset: 0xE378
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
	Checksum: 0x1FBE04D6
	Offset: 0xE400
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
	Checksum: 0x5D4452D7
	Offset: 0xE4E0
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
	Checksum: 0x31E07C2D
	Offset: 0xE5C0
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
	Checksum: 0xF174C382
	Offset: 0xE6A0
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
	Checksum: 0xEB70923E
	Offset: 0xE780
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
	Checksum: 0x6722BF12
	Offset: 0xE848
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
	Checksum: 0x43C13790
	Offset: 0xE888
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
	Checksum: 0xA1507555
	Offset: 0xE918
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
	Checksum: 0xC0FA4ECF
	Offset: 0xE9C0
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
	Checksum: 0x28EB6E1D
	Offset: 0xEAA8
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
	Checksum: 0xDCCA7F18
	Offset: 0xEBB8
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
	Checksum: 0x874F457A
	Offset: 0xEC58
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
	Checksum: 0xC47B7395
	Offset: 0xECA8
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
	Checksum: 0xF157AF2D
	Offset: 0xECE8
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
	Checksum: 0x3CEEBE70
	Offset: 0xED40
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
	Checksum: 0xBA40FE24
	Offset: 0xEF50
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
	Checksum: 0xAE8F47D4
	Offset: 0xEFC0
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
	Checksum: 0x65C085AF
	Offset: 0xF040
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
	Checksum: 0x702C7E62
	Offset: 0xF0B0
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
	Checksum: 0x66BB2E64
	Offset: 0xF1B0
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
	Checksum: 0x1EDD9B42
	Offset: 0xF2F0
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
	Checksum: 0x66B4F1E8
	Offset: 0xF360
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
	Checksum: 0x1D8413F2
	Offset: 0xF4A0
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
	Checksum: 0x5E369CCC
	Offset: 0xF4E8
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
	Checksum: 0xACF55AD3
	Offset: 0xF608
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
	Checksum: 0xD3D98DD9
	Offset: 0xF740
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
		initial_black = lui::get_luimenu("InitialBlack");
		if(!initial_black initial_black::is_open(player))
		{
			initial_black initial_black::open(player);
		}
	}
}

/*
	Name: function_cd98604b
	Namespace: util
	Checksum: 0x369A8405
	Offset: 0xF810
	Size: 0x6C
	Parameters: 1
	Flags: None
*/
function function_cd98604b(player)
{
	/#
		assert(isplayer(player));
	#/
	initial_black = lui::get_luimenu("InitialBlack");
	initial_black initial_black::close(player);
}

/*
	Name: function_d532c33b
	Namespace: util
	Checksum: 0xC75206F2
	Offset: 0xF888
	Size: 0xCC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d532c33b(player)
{
	player endon(#"death", #"disconnect");
	initial_black = lui::get_luimenu("InitialBlack");
	if(!initial_black initial_black::is_open(player))
	{
		initial_black initial_black::open(player, 1);
	}
	/#
		initial_black initial_black::set_developer_mode(player, getdvarint(#"hash_73c93e31e0d1ea8b", 0) == 0);
	#/
}

/*
	Name: function_7f7a77ab
	Namespace: util
	Checksum: 0x233252D1
	Offset: 0xF960
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
	Checksum: 0x7D422940
	Offset: 0xF998
	Size: 0x40
	Parameters: 0
	Flags: Linked
*/
function function_5355d311()
{
	if(function_7f7a77ab())
	{
		while(is_true(level.var_e80a117f))
		{
			waitframe(1);
		}
	}
}

/*
	Name: function_256dd160
	Namespace: util
	Checksum: 0xC83E0F5
	Offset: 0xF9E0
	Size: 0xDC
	Parameters: 1
	Flags: Linked
*/
function function_256dd160(player)
{
	if(player isusingoffhand() || player isthrowinggrenade())
	{
		player disableoffhandweapons();
		player disableoffhandspecial();
		player forceoffhandend();
	}
	player val::set(#"hash_27ff38a58fcfc46e", "freezecontrols", 1);
	player val::set(#"hash_27ff38a58fcfc46e", "takedamage", 0);
}

/*
	Name: function_49be6dce
	Namespace: util
	Checksum: 0x57F6BE8E
	Offset: 0xFAC8
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function function_49be6dce(player)
{
	player enableoffhandweapons();
	player enableoffhandspecial();
	player val::reset(#"hash_27ff38a58fcfc46e", "freezecontrols");
	player val::reset(#"hash_27ff38a58fcfc46e", "takedamage");
}

/*
	Name: function_1c8873f6
	Namespace: util
	Checksum: 0xFE0F9170
	Offset: 0xFB60
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
	Checksum: 0x9A991E7
	Offset: 0xFC48
	Size: 0x8A
	Parameters: 0
	Flags: Linked
*/
function function_a0d3d36f()
{
	if(!isdefined(self.var_fd243db7))
	{
		self.var_fd243db7 = {};
	}
	if(!isdefined(self.var_fd243db7.var_245ad74))
	{
		self.var_fd243db7.var_245ad74 = {};
	}
	self.var_fd243db7.var_245ad74.var_1b9146a2 = 0;
	self.var_fd243db7.var_245ad74.var_395c5b7d = 0;
	self.var_fd243db7.var_245ad74.var_801e7b16 = 0;
}

#namespace namespace_2e6206f9;

/*
	Name: register_callback
	Namespace: namespace_2e6206f9
	Checksum: 0xF1C90A60
	Offset: 0xFCE0
	Size: 0x2D4
	Parameters: 3
	Flags: Linked, Variadic
*/
function register_callback(str_kvp, func, ...)
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
	Checksum: 0xB927E31A
	Offset: 0xFFC0
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
	Checksum: 0x72639B8E
	Offset: 0x10290
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
	Checksum: 0x87BA5E4E
	Offset: 0x103D8
	Size: 0x226
	Parameters: 2
	Flags: Linked
*/
function function_7ed1d198(str_kvp, str_name)
{
	a_s_result = [];
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
							if(!isdefined(a_s_result))
							{
								a_s_result = [];
							}
							else if(!isarray(a_s_result))
							{
								a_s_result = array(a_s_result);
							}
							a_s_result[a_s_result.size] = var_8507e893;
						}
					}
				}
			}
		}
	}
	return a_s_result;
}

/*
	Name: callback
	Namespace: namespace_2e6206f9
	Checksum: 0x4831D43B
	Offset: 0x10608
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
	Name: custom_callback
	Namespace: namespace_2e6206f9
	Checksum: 0xDFC7653B
	Offset: 0x106C0
	Size: 0xCE
	Parameters: 3
	Flags: Variadic
*/
function custom_callback(str_name, str_kvp, ...)
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
	Checksum: 0x38B0790F
	Offset: 0x10798
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
	Checksum: 0x33739423
	Offset: 0x107C0
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
	Checksum: 0xDFF98F1
	Offset: 0x10808
	Size: 0x3A
	Parameters: 1
	Flags: Linked
*/
function get_target_structs(str_kvp)
{
	return util::get_array(self.(str_kvp + "_src"), str_kvp + "_target");
}

