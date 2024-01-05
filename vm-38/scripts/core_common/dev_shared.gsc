#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\gestures.gsc;

#namespace dev_shared;

/*
	Name: function_baec831c
	Namespace: dev_shared
	Checksum: 0xF5400D41
	Offset: 0x78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_baec831c()
{
	level notify(-187265179);
}

#namespace dev;

/*
	Name: debug_sphere
	Namespace: dev
	Checksum: 0x454AF3DB
	Offset: 0x98
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
	Name: devgui_test_chart_think
	Namespace: dev
	Checksum: 0xDDB4171
	Offset: 0x158
	Size: 0x3C6
	Parameters: 0
	Flags: None
*/
function devgui_test_chart_think()
{
	/#
		waitframe(1);
		old_val = getdvarint(#"scr_debug_test_chart", 0);
		scale = 120;
		for(;;)
		{
			val = getdvarint(#"scr_debug_test_chart", 0);
			if(old_val != val)
			{
				if(isdefined(level.test_chart_model))
				{
					level.test_chart_model delete();
					level.test_chart_model = undefined;
				}
				if(val)
				{
					player = getplayers()[0];
					direction = player getplayerangles();
					direction_vec = anglestoforward((0, direction[1], 0));
					direction_vec = (direction_vec[0] * scale, direction_vec[1] * scale, direction_vec[2] * scale);
					level.test_chart_model = spawn("", player geteye() + direction_vec);
					level.test_chart_model setmodel(#"test_chart_model");
					level.test_chart_model.angles = (0, direction[1], 0) + vectorscale((0, 1, 0), 90);
				}
			}
			if(val)
			{
				player = getplayers()[0];
				if(val == 1)
				{
					level.test_chart_model setmodel(#"test_chart_model");
				}
				else
				{
					if(val == 2)
					{
						level.test_chart_model setmodel(#"hash_70a102226734fb49");
					}
					else if(val == 3)
					{
						level.test_chart_model setmodel(#"hash_70a101226734f996");
					}
				}
				direction = player getplayerangles();
				direction_vec = anglestoforward((0, direction[1], 0));
				direction_vec = (direction_vec[0] * scale, direction_vec[1] * scale, direction_vec[2] * scale);
				level.test_chart_model.angles = (0, direction[1], 0) + vectorscale((0, 1, 0), 90);
				level.test_chart_model.origin = player geteye() + direction_vec;
				if(player meleebuttonpressed())
				{
					scale = scale + 10;
				}
				if(player sprintbuttonpressed())
				{
					scale = scale - 10;
				}
			}
			old_val = val;
			waitframe(1);
		}
	#/
}

/*
	Name: updateminimapsetting
	Namespace: dev
	Checksum: 0x6D30A858
	Offset: 0x528
	Size: 0xA64
	Parameters: 0
	Flags: None
*/
function updateminimapsetting()
{
	/#
		requiredmapaspectratio = getdvarfloat(#"scr_requiredmapaspectratio", 0);
		if(!isdefined(level.minimapheight))
		{
			setdvar(#"scr_minimap_height", 0);
			level.minimapheight = 0;
		}
		minimapheight = getdvarfloat(#"scr_minimap_height", 0);
		if(minimapheight != level.minimapheight)
		{
			if(minimapheight <= 0)
			{
				util::gethostplayer() cameraactivate(0);
				level.minimapheight = minimapheight;
				level notify(#"end_draw_map_bounds");
			}
			if(minimapheight > 0)
			{
				level.minimapheight = minimapheight;
				players = getplayers();
				if(players.size > 0)
				{
					player = util::gethostplayer();
					corners = getentarray("", "");
					if(corners.size == 2)
					{
						viewpos = corners[0].origin + corners[1].origin;
						viewpos = (viewpos[0] * 0.5, viewpos[1] * 0.5, viewpos[2] * 0.5);
						level thread minimapwarn(corners);
						maxcorner = (corners[0].origin[0], corners[0].origin[1], viewpos[2]);
						mincorner = (corners[0].origin[0], corners[0].origin[1], viewpos[2]);
						if(corners[1].origin[0] > corners[0].origin[0])
						{
							maxcorner = (corners[1].origin[0], maxcorner[1], maxcorner[2]);
						}
						else
						{
							mincorner = (corners[1].origin[0], mincorner[1], mincorner[2]);
						}
						if(corners[1].origin[1] > corners[0].origin[1])
						{
							maxcorner = (maxcorner[0], corners[1].origin[1], maxcorner[2]);
						}
						else
						{
							mincorner = (mincorner[0], corners[1].origin[1], mincorner[2]);
						}
						viewpostocorner = maxcorner - viewpos;
						viewpos = (viewpos[0], viewpos[1], viewpos[2] + minimapheight);
						northvector = (cos(getnorthyaw()), sin(getnorthyaw()), 0);
						eastvector = (northvector[1], 0 - northvector[0], 0);
						disttotop = vectordot(northvector, viewpostocorner);
						if(disttotop < 0)
						{
							disttotop = 0 - disttotop;
						}
						disttoside = vectordot(eastvector, viewpostocorner);
						if(disttoside < 0)
						{
							disttoside = 0 - disttoside;
						}
						if(requiredmapaspectratio > 0)
						{
							mapaspectratio = disttoside / disttotop;
							if(mapaspectratio < requiredmapaspectratio)
							{
								incr = requiredmapaspectratio / mapaspectratio;
								disttoside = disttoside * incr;
								addvec = vecscale(eastvector, (vectordot(eastvector, maxcorner - viewpos)) * (incr - 1));
								mincorner = mincorner - addvec;
								maxcorner = maxcorner + addvec;
							}
							else
							{
								incr = mapaspectratio / requiredmapaspectratio;
								disttotop = disttotop * incr;
								addvec = vecscale(northvector, (vectordot(northvector, maxcorner - viewpos)) * (incr - 1));
								mincorner = mincorner - addvec;
								maxcorner = maxcorner + addvec;
							}
						}
						if(level.console)
						{
							aspectratioguess = 1.777778;
							angleside = 2 * (atan((disttoside * 0.8) / minimapheight));
							angletop = 2 * (atan(((disttotop * aspectratioguess) * 0.8) / minimapheight));
						}
						else
						{
							aspectratioguess = 1.333333;
							angleside = 2 * (atan(disttoside / minimapheight));
							angletop = 2 * (atan((disttotop * aspectratioguess) / minimapheight));
						}
						if(angleside > angletop)
						{
							angle = angleside;
						}
						else
						{
							angle = angletop;
						}
						znear = minimapheight - 1000;
						if(znear < 16)
						{
							znear = 16;
						}
						if(znear > 10000)
						{
							znear = 10000;
						}
						player camerasetposition(viewpos, (90, getnorthyaw(), 0));
						player cameraactivate(1);
						player takeallweapons();
						setdvar(#"cg_drawgun", 0);
						setdvar(#"cg_draw2d", 0);
						setdvar(#"cg_drawfps", 0);
						setdvar(#"fx_enable", 0);
						setdvar(#"r_fog", 0);
						setdvar(#"r_highloddist", 0);
						setdvar(#"r_znear", znear);
						setdvar(#"r_lodscalerigid", 0.1);
						setdvar(#"cg_drawversion", 0);
						setdvar(#"sm_enable", 1);
						setdvar(#"player_view_pitch_down", 90);
						setdvar(#"player_view_pitch_up", 0);
						setdvar(#"cg_fov", angle);
						setdvar(#"cg_drawminimap", 1);
						setdvar(#"r_umbranumthreads", 1);
						setdvar(#"r_umbradistancescale", 0.1);
						setdvar(#"r_uselensfov", 0);
						setdvar(#"hash_5ee9a4ac16993e50", 1);
						setdvar(#"debug_show_viewpos", 0);
						thread drawminimapbounds(viewpos, mincorner, maxcorner);
					}
					else
					{
						println("");
					}
				}
				else
				{
					setdvar(#"scr_minimap_height", 0);
				}
			}
		}
	#/
}

/*
	Name: vecscale
	Namespace: dev
	Checksum: 0x73C388A7
	Offset: 0xF98
	Size: 0x42
	Parameters: 2
	Flags: None
*/
function vecscale(vec, scalar)
{
	/#
		return (vec[0] * scalar, vec[1] * scalar, vec[2] * scalar);
	#/
}

/*
	Name: drawminimapbounds
	Namespace: dev
	Checksum: 0xF9CECD6F
	Offset: 0xFE8
	Size: 0x36E
	Parameters: 3
	Flags: None
*/
function drawminimapbounds(viewpos, mincorner, maxcorner)
{
	/#
		level notify(#"end_draw_map_bounds");
		level endon(#"end_draw_map_bounds");
		viewheight = viewpos[2] - maxcorner[2];
		north = (cos(getnorthyaw()), sin(getnorthyaw()), 0);
		diaglen = length(mincorner - maxcorner);
		mincorneroffset = mincorner - viewpos;
		mincorneroffset = vectornormalize((mincorneroffset[0], mincorneroffset[1], 0));
		mincorner = mincorner + (vecscale(mincorneroffset, (diaglen * 1) / 800));
		maxcorneroffset = maxcorner - viewpos;
		maxcorneroffset = vectornormalize((maxcorneroffset[0], maxcorneroffset[1], 0));
		maxcorner = maxcorner + (vecscale(maxcorneroffset, (diaglen * 1) / 800));
		diagonal = maxcorner - mincorner;
		side = vecscale(north, vectordot(diagonal, north));
		sidenorth = vecscale(north, abs(vectordot(diagonal, north)));
		corner0 = mincorner;
		corner1 = mincorner + side;
		corner2 = maxcorner;
		corner3 = maxcorner - side;
		toppos = (vecscale(mincorner + maxcorner, 0.5)) + vecscale(sidenorth, 0.51);
		textscale = diaglen * 0.003;
		while(true)
		{
			line(corner0, corner1);
			line(corner1, corner2);
			line(corner2, corner3);
			line(corner3, corner0);
			print3d(toppos, "", (1, 1, 1), 1, textscale);
			waitframe(1);
		}
	#/
}

/*
	Name: minimapwarn
	Namespace: dev
	Checksum: 0x34DB792F
	Offset: 0x1360
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function minimapwarn(corners)
{
	/#
	#/
}

/*
	Name: function_e5746ec1
	Namespace: dev
	Checksum: 0x1835A5CC
	Offset: 0x1378
	Size: 0x11E
	Parameters: 0
	Flags: None
*/
function function_e5746ec1()
{
	/#
		host = util::gethostplayer();
		all_players = getplayers();
		var_1645eaac = isdefined(host) && host getstance() == "";
		if(!isdefined(host) || var_1645eaac)
		{
			return all_players;
		}
		all_players = arraysort(all_players, host.origin);
		players = [];
		if(all_players.size == 1 || host getstance() == "")
		{
			players[0] = host;
		}
		else
		{
			players[0] = all_players[1];
		}
		return players;
	#/
}

/*
	Name: function_5639909a
	Namespace: dev
	Checksum: 0xDECE4655
	Offset: 0x14A0
	Size: 0xD0
	Parameters: 2
	Flags: None
*/
function function_5639909a(bodytype, outfitindex)
{
	/#
		players = function_e5746ec1();
		foreach(player in players)
		{
			player setcharacterbodytype(bodytype);
			player setcharacteroutfit(outfitindex);
		}
	#/
}

/*
	Name: function_f413b4d5
	Namespace: dev
	Checksum: 0x4FA55E2A
	Offset: 0x1578
	Size: 0x298
	Parameters: 4
	Flags: None
*/
function function_f413b4d5(bodytype, outfitindex, var_c1154821, index)
{
	/#
		players = function_e5746ec1();
		if(var_c1154821 == "")
		{
			function_5639909a(bodytype, outfitindex);
			var_9cf37283 = function_d7c3cf6c(bodytype, outfitindex, currentsessionmode());
			preset = var_9cf37283.presets[index];
			foreach(player in players)
			{
				foreach(type, data in level.var_1a409216)
				{
					if(type != 7 && type != 1)
					{
						player function_ab96a9b5(data.field, preset.parts[type]);
					}
				}
			}
		}
		else
		{
			foreach(player in players)
			{
				if(var_c1154821 == "")
				{
					player setcharacterwarpaintoutfit(outfitindex);
				}
				player function_ab96a9b5(var_c1154821, index);
			}
		}
	#/
}

/*
	Name: body_customization_process_command
	Namespace: dev
	Checksum: 0x6E84171B
	Offset: 0x1818
	Size: 0x3B2
	Parameters: 1
	Flags: None
*/
function body_customization_process_command(character_index)
{
	/#
		/#
			println(("" + character_index) + "");
		#/
		split = strtok(character_index, "");
		switch(split.size)
		{
			case 1:
			{
				command0 = strtok(split[0], "");
				bodytype = int(command0[1]);
				/#
					println(("" + bodytype) + "");
				#/
				function_5639909a(bodytype, 0);
				break;
			}
			case 2:
			{
				command0 = strtok(split[0], "");
				bodytype = int(command0[1]);
				command1 = strtok(split[1], "");
				outfitindex = int(command1[1]);
				/#
					println(((("" + bodytype) + "") + outfitindex) + "");
				#/
				function_5639909a(bodytype, outfitindex);
				break;
			}
			case 3:
			{
				command0 = strtok(split[0], "");
				bodytype = int(command0[1]);
				command1 = strtok(split[1], "");
				outfitindex = int(command1[1]);
				var_e7f74d2b = strtok(split[2], "");
				var_c1154821 = var_e7f74d2b[0];
				index = int(var_e7f74d2b[1]);
				/#
					println(((((((("" + bodytype) + "") + outfitindex) + "") + var_c1154821) + "") + index) + "");
				#/
				function_f413b4d5(bodytype, outfitindex, var_c1154821, index);
				break;
			}
			default:
			{
				break;
			}
		}
	#/
}

/*
	Name: function_3cec5609
	Namespace: dev
	Checksum: 0x4E50A024
	Offset: 0x1BD8
	Size: 0x130
	Parameters: 5
	Flags: None
*/
function function_3cec5609(&arr, devgui_path, bodytype, outfitindex, optiontype)
{
	/#
		foreach(index, option in arr)
		{
			if(option.isvalid)
			{
				util::add_debug_command((((((((((((((devgui_path + index) + "") + "") + "") + "") + bodytype) + "") + "") + outfitindex) + "") + optiontype) + "") + index) + "");
			}
		}
	#/
}

/*
	Name: function_c807b11d
	Namespace: dev
	Checksum: 0x471FD59D
	Offset: 0x1D10
	Size: 0x42
	Parameters: 1
	Flags: None
*/
function function_c807b11d(in_string)
{
	/#
		out_string = strreplace(in_string, "", "");
		return out_string;
	#/
}

/*
	Name: function_2c6232e5
	Namespace: dev
	Checksum: 0x7B6EEBBA
	Offset: 0x1D60
	Size: 0x42
	Parameters: 1
	Flags: None
*/
function function_2c6232e5(in_string)
{
	/#
		out_string = strreplace(in_string, "", "");
		return out_string;
	#/
}

/*
	Name: function_970d4891
	Namespace: dev
	Checksum: 0x71073529
	Offset: 0x1DB0
	Size: 0x160
	Parameters: 1
	Flags: None
*/
function function_970d4891(mode)
{
	/#
		bodies = getallcharacterbodies(mode);
		foreach(playerbodytype in bodies)
		{
			body_name = (function_2c6232e5(makelocalizedstring(getcharacterdisplayname(playerbodytype, mode))) + "") + function_9e72a96(getcharacterassetname(playerbodytype, mode));
			util::add_devgui(("" + body_name) + "", (("" + "") + "") + body_name);
		}
	#/
}

/*
	Name: body_customization_populate
	Namespace: dev
	Checksum: 0xD2CD5B34
	Offset: 0x1F18
	Size: 0x828
	Parameters: 2
	Flags: None
*/
function body_customization_populate(mode, var_ef4940a5)
{
	/#
		bodies = getallcharacterbodies(mode);
		body_customization_devgui_base = "" + "";
		level.var_1a409216 = [7:{#field:"", #path:""}, 6:{#field:"", #path:""}, 5:{#field:"", #path:""}, 4:{#field:"", #path:""}, 3:{#field:"", #path:""}, 2:{#field:"", #path:""}, 1:{#field:"", #path:""}, 0:{#field:"", #path:""}];
		foreach(playerbodytype in bodies)
		{
			body_name = (function_2c6232e5(makelocalizedstring(getcharacterdisplayname(playerbodytype, mode))) + "") + function_9e72a96(getcharacterassetname(playerbodytype, mode));
			if(isdefined(var_ef4940a5) && var_ef4940a5 != body_name)
			{
				continue;
			}
			util::add_debug_command((((((((body_customization_devgui_base + body_name) + "") + "") + "") + "") + "") + playerbodytype) + "");
			var_13240050 = function_d299ef16(playerbodytype, mode);
			for(outfitindex = 0; outfitindex < var_13240050; outfitindex++)
			{
				var_9cf37283 = function_d7c3cf6c(playerbodytype, outfitindex, mode);
				if(var_9cf37283.valid)
				{
					var_346660ac = function_2c6232e5(makelocalizedstring(var_9cf37283.var_74996050));
					var_1bf829f2 = ((((outfitindex + "") + var_346660ac) + "") + function_c807b11d(function_9e72a96(var_9cf37283.namehash)) + "") + outfitindex;
					var_a818c4e = ((body_customization_devgui_base + body_name) + "") + var_1bf829f2;
					util::add_debug_command((((((((((var_a818c4e + "") + "") + "") + "") + "") + playerbodytype) + "") + "") + outfitindex) + "");
					foreach(data in level.var_1a409216)
					{
						foreach(index, option in var_9cf37283.options[type])
						{
							if(option.isvalid)
							{
								util::waittill_can_add_debug_command();
								util::add_debug_command(((((((((((((((((((var_a818c4e + "") + data.path) + "") + index) + "") + index) + "") + "") + "") + "") + playerbodytype) + "") + "") + outfitindex) + "") + data.field) + "") + index) + "");
							}
						}
					}
					for(var_56fe70a0 = 0; var_56fe70a0 < var_9cf37283.presets.size; var_56fe70a0++)
					{
						preset = var_9cf37283.presets[var_56fe70a0];
						if(!preset.isvalid)
						{
							continue;
						}
						util::waittill_can_add_debug_command();
						util::add_debug_command((((((((((((((((((((var_a818c4e + "") + "") + var_56fe70a0) + "") + function_9e72a96(preset.lootid) + "") + "") + var_56fe70a0) + "") + "") + "") + "") + playerbodytype) + "") + "") + outfitindex) + "") + "") + "") + var_56fe70a0) + "");
					}
				}
				if(isdefined(var_ef4940a5))
				{
					util::remove_devgui(("" + body_name) + "");
				}
			}
		}
	#/
}

/*
	Name: function_986c93f0
	Namespace: dev
	Checksum: 0x7B819B87
	Offset: 0x2748
	Size: 0x264
	Parameters: 0
	Flags: None
*/
function function_986c93f0()
{
	/#
		roleindex = getdvarint(#"hash_66e77cf688988460", 0);
		if(roleindex < 0)
		{
			return;
		}
		players = getplayers();
		if(players.size <= 0)
		{
			return;
		}
		vehs = getvehiclearray();
		v = arraygetclosest(players[0].origin, vehs);
		if(!isalive(v))
		{
			return;
		}
		if(isdefined(v) && isdefined(v.var_13c5ef5f))
		{
			rolecount = v function_545738a();
			if(rolecount > 0 && roleindex < rolecount)
			{
				var_8de3e761 = v function_b655eac6();
				if(var_8de3e761 != roleindex)
				{
					v function_7be764cc(roleindex);
				}
				namehash = v function_d4e2ed8a(roleindex);
				if(isdefined(namehash))
				{
					pos = v.origin + vectorscale((0, 0, 1), 100);
					text = (("" + roleindex) + "") + function_9e72a96(namehash) + "";
					color = (1, 1, 1);
					alpha = 1;
					scale = 1;
					duration = 10;
					centered = 1;
					print3d(pos, text, color, alpha, scale, duration, centered);
				}
			}
		}
	#/
}

/*
	Name: function_6d793eb9
	Namespace: dev
	Checksum: 0xAA32DA6
	Offset: 0x29B8
	Size: 0x104
	Parameters: 1
	Flags: None
*/
function function_6d793eb9(var_78ab4739)
{
	/#
		players = getplayers();
		if(players.size <= 0)
		{
			return;
		}
		var_e2bbb439 = getscriptbundlelist(#"hash_4bea1d6b321100bb");
		if(!isdefined(var_e2bbb439))
		{
			return;
		}
		vehicles = getvehiclearray();
		vehicle = arraygetclosest(players[0].origin, vehicles);
		if(!isalive(vehicle))
		{
			return;
		}
		var_a0e911e = var_e2bbb439[var_78ab4739];
		if(!isdefined(var_a0e911e))
		{
			return;
		}
		vehicle function_3e79d199(var_a0e911e);
	#/
}

/*
	Name: body_customization_devgui
	Namespace: dev
	Checksum: 0x22F772EA
	Offset: 0x2AC8
	Size: 0x31C
	Parameters: 1
	Flags: None
*/
function body_customization_devgui(mode)
{
	/#
		function_970d4891(mode);
		wait(1);
		var_35383820 = 0;
		adddebugcommand("" + "");
		var_a02b3930 = 0;
		for(;;)
		{
			var_f12e4923 = getdvarstring(#"hash_2195b248bfe1371e", "");
			if(var_f12e4923 != "")
			{
				level thread body_customization_populate(mode, var_f12e4923);
				setdvar(#"hash_2195b248bfe1371e", "");
			}
			character_index = getdvarstring(#"char_devgui", "");
			if(character_index != "")
			{
				body_customization_process_command(character_index);
				setdvar(#"char_devgui", "");
			}
			if(getdvarint(#"hash_50a9783feccc726d", 0))
			{
				function_986c93f0();
			}
			var_dc07f52f = getdvarint(#"hash_4566ad68e232b908", 0);
			if(var_a02b3930 != var_dc07f52f)
			{
				function_6d793eb9(var_dc07f52f);
			}
			var_a02b3930 = var_dc07f52f;
			var_32e0e50a = getdvarint(#"hash_4976075f146e1fa2", 0);
			if(var_35383820 != var_32e0e50a)
			{
				players = getplayers();
				iprintln(("" + var_32e0e50a) + "");
				foreach(player in players)
				{
					if(!isdefined(player))
					{
						continue;
					}
					player function_97cf79d8(var_32e0e50a);
				}
			}
			var_35383820 = var_32e0e50a;
			wait(0.5);
		}
	#/
}

/*
	Name: add_perk_devgui
	Namespace: dev
	Checksum: 0x5C367C5A
	Offset: 0x2DF0
	Size: 0xBC
	Parameters: 2
	Flags: None
*/
function add_perk_devgui(name, specialties)
{
	/#
		perk_devgui_base = "";
		perk_name = name;
		test = (((((perk_devgui_base + perk_name) + "") + "") + "") + specialties) + "";
		util::add_debug_command((((((perk_devgui_base + perk_name) + "") + "") + "") + specialties) + "");
	#/
}

/*
	Name: function_373068ca
	Namespace: dev
	Checksum: 0xE1497B32
	Offset: 0x2EB8
	Size: 0xCC
	Parameters: 2
	Flags: None
*/
function function_373068ca(name, postfix)
{
	/#
		if(!isdefined(postfix))
		{
			postfix = "";
		}
		if(!isdefined(name))
		{
			return;
		}
		if(name == "")
		{
			return;
		}
		util::waittill_can_add_debug_command();
		talentname = ("" + name) + postfix;
		cmd = (("" + "") + "") + talentname;
		util::add_devgui("" + talentname, cmd);
	#/
}

/*
	Name: function_8263c0d5
	Namespace: dev
	Checksum: 0x872159A6
	Offset: 0x2F90
	Size: 0xDC
	Parameters: 2
	Flags: None
*/
function function_8263c0d5(name, postfix)
{
	/#
		if(!isdefined(postfix))
		{
			postfix = "";
		}
		if(!isdefined(name))
		{
			return;
		}
		if(name == "")
		{
			return;
		}
		util::waittill_can_add_debug_command();
		talentname = ("" + getsubstr(name, 7)) + postfix;
		cmd = (("" + "") + "") + talentname;
		util::add_devgui("" + talentname, cmd);
	#/
}

/*
	Name: function_a432e633
	Namespace: dev
	Checksum: 0x463CB732
	Offset: 0x3078
	Size: 0x184
	Parameters: 0
	Flags: None
*/
function function_a432e633()
{
	/#
		gesture = getdvarstring(#"scr_givegesture");
		if(isdefined(gesture) && gesture != "")
		{
			foreach(player in level.players)
			{
				if(isbot(player))
				{
					continue;
				}
				player gestures::clear_gesture();
				player.loadoutgesture = getweapon(gesture);
				if(isdefined(player.loadoutgesture) && player.loadoutgesture != level.weaponnone)
				{
					player gestures::give_gesture(player.loadoutgesture);
				}
			}
		}
		setdvar(#"scr_givegesture", "");
	#/
}

/*
	Name: function_487bf571
	Namespace: dev
	Checksum: 0xF2BFA0A8
	Offset: 0x3208
	Size: 0x90
	Parameters: 0
	Flags: None
*/
function function_487bf571()
{
	/#
		for(;;)
		{
			gesture = getdvarstring(#"scr_givegesture");
			if(gesture != "")
			{
				function_a432e633();
			}
			setdvar(#"scr_givegesture", "");
			wait(0.5);
		}
	#/
}

/*
	Name: get_lookat_origin
	Namespace: dev
	Checksum: 0x99D8DDF8
	Offset: 0x32A0
	Size: 0xBE
	Parameters: 1
	Flags: None
*/
function get_lookat_origin(player)
{
	/#
		angles = player getplayerangles();
		forward = anglestoforward(angles);
		dir = vectorscale(forward, 8000);
		eye = player geteye();
		trace = bullettrace(eye, eye + dir, 0, undefined);
		return trace[#"position"];
	#/
}

/*
	Name: draw_pathnode
	Namespace: dev
	Checksum: 0x5F70F463
	Offset: 0x3368
	Size: 0x6C
	Parameters: 2
	Flags: None
*/
function draw_pathnode(node, color)
{
	/#
		if(!isdefined(color))
		{
			color = (1, 0, 1);
		}
		box(node.origin, vectorscale((-1, -1, 0), 16), vectorscale((1, 1, 1), 16), 0, color, 1, 0, 1);
	#/
}

/*
	Name: draw_pathnode_think
	Namespace: dev
	Checksum: 0x1FCA195F
	Offset: 0x33E0
	Size: 0x4E
	Parameters: 2
	Flags: None
*/
function draw_pathnode_think(node, color)
{
	/#
		level endon(#"draw_pathnode_stop");
		for(;;)
		{
			draw_pathnode(node, color);
			waitframe(1);
		}
	#/
}

/*
	Name: draw_pathnodes_stop
	Namespace: dev
	Checksum: 0x11866367
	Offset: 0x3438
	Size: 0x20
	Parameters: 0
	Flags: None
*/
function draw_pathnodes_stop()
{
	/#
		wait(5);
		level notify(#"draw_pathnode_stop");
	#/
}

/*
	Name: node_get
	Namespace: dev
	Checksum: 0xDE43C623
	Offset: 0x3460
	Size: 0x120
	Parameters: 1
	Flags: None
*/
function node_get(player)
{
	/#
		for(;;)
		{
			waitframe(1);
			origin = get_lookat_origin(player);
			node = getnearestnode(origin);
			if(!isdefined(node))
			{
				continue;
			}
			if(player buttonpressed(""))
			{
				return node;
			}
			if(player buttonpressed(""))
			{
				return undefined;
			}
			if(node.type == #"path")
			{
				draw_pathnode(node, (1, 0, 1));
				continue;
			}
			draw_pathnode(node, (0.85, 0.85, 0.1));
		}
	#/
}

/*
	Name: dev_get_node_pair
	Namespace: dev
	Checksum: 0xFF8A09FA
	Offset: 0x3588
	Size: 0x1A0
	Parameters: 0
	Flags: None
*/
function dev_get_node_pair()
{
	/#
		player = util::gethostplayer();
		start = undefined;
		while(!isdefined(start))
		{
			start = node_get(player);
			if(player buttonpressed(""))
			{
				level notify(#"draw_pathnode_stop");
				return undefined;
			}
		}
		level thread draw_pathnode_think(start, (0, 1, 0));
		while(player buttonpressed(""))
		{
			waitframe(1);
		}
		end = undefined;
		while(!isdefined(end))
		{
			end = node_get(player);
			if(player buttonpressed(""))
			{
				level notify(#"draw_pathnode_stop");
				return undefined;
			}
		}
		level thread draw_pathnode_think(end, (0, 1, 0));
		level thread draw_pathnodes_stop();
		array = [];
		array[0] = start;
		array[1] = end;
		return array;
	#/
}

/*
	Name: draw_point
	Namespace: dev
	Checksum: 0x8A7D183A
	Offset: 0x3738
	Size: 0x54
	Parameters: 2
	Flags: None
*/
function draw_point(origin, color)
{
	/#
		if(!isdefined(color))
		{
			color = (1, 0, 1);
		}
		sphere(origin, 16, color, 0.25, 0, 16, 1);
	#/
}

/*
	Name: point_get
	Namespace: dev
	Checksum: 0x2344C906
	Offset: 0x3798
	Size: 0xA0
	Parameters: 1
	Flags: None
*/
function point_get(player)
{
	/#
		for(;;)
		{
			waitframe(1);
			origin = get_lookat_origin(player);
			if(player buttonpressed(""))
			{
				return origin;
			}
			if(player buttonpressed(""))
			{
				return undefined;
			}
			draw_point(origin, (1, 0, 1));
		}
	#/
}

/*
	Name: dev_get_point_pair
	Namespace: dev
	Checksum: 0x9ED51FF9
	Offset: 0x3840
	Size: 0xF6
	Parameters: 0
	Flags: None
*/
function dev_get_point_pair()
{
	/#
		player = util::gethostplayer();
		start = undefined;
		points = [];
		while(!isdefined(start))
		{
			start = point_get(player);
			if(!isdefined(start))
			{
				return points;
			}
		}
		while(player buttonpressed(""))
		{
			waitframe(1);
		}
		end = undefined;
		while(!isdefined(end))
		{
			end = point_get(player);
			if(!isdefined(end))
			{
				return points;
			}
		}
		points[0] = start;
		points[1] = end;
		return points;
	#/
}

/*
	Name: function_adde34ed
	Namespace: dev
	Checksum: 0xB97C5FC6
	Offset: 0x3940
	Size: 0xC4
	Parameters: 7
	Flags: None
*/
function function_adde34ed(initial_origin, initial_angle, a, b, c, radius, spacing)
{
	/#
		return {#spacing:spacing, #radius:radius, #c:c, #b:b, #a:a, #angle:0, #start_angle:initial_angle, #start_origin:initial_origin};
	#/
}

/*
	Name: function_a4ccb933
	Namespace: dev
	Checksum: 0x7AEE9C61
	Offset: 0x3A10
	Size: 0x102
	Parameters: 2
	Flags: None
*/
function function_a4ccb933(initial_origin, initial_angle)
{
	/#
		radius = 100;
		spacing = getdvarint(#"hash_71c117351507b9e5", 75);
		a = getdvarint(#"hash_3c42741c0efba07", 14);
		b = getdvarint(#"hash_3c42841c0efbbba", 35);
		c = getdvarfloat(#"hash_3c42941c0efbd6d", 1);
		return function_adde34ed(initial_origin, initial_angle, a, b, c, radius, spacing);
	#/
}

/*
	Name: function_df0b6f84
	Namespace: dev
	Checksum: 0x37C1F612
	Offset: 0x3B20
	Size: 0x92
	Parameters: 1
	Flags: None
*/
function function_df0b6f84(spiral)
{
	/#
		degrees = (spiral.spacing * 360) / (6.283185 * spiral.radius);
		spiral.angle = spiral.angle + degrees;
		spiral.radius = math::function_b1820790(spiral.a, spiral.b, spiral.c, spiral.angle);
	#/
}

/*
	Name: function_7de15c85
	Namespace: dev
	Checksum: 0xFA9456B7
	Offset: 0x3BC0
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function function_7de15c85(spiral)
{
	/#
		var_17e94d83 = rotatepointaroundaxis((spiral.radius, 0, 0), (0, 0, 1), spiral.angle + spiral.start_angle);
		return var_17e94d83 + spiral.start_origin;
	#/
}

/*
	Name: function_98c05766
	Namespace: dev
	Checksum: 0xF37ECB2D
	Offset: 0x3C30
	Size: 0x6E
	Parameters: 1
	Flags: None
*/
function function_98c05766(spiral)
{
	/#
		spawn_point = function_7de15c85(spiral);
		trace = bullettrace(spawn_point + vectorscale((0, 0, 1), 100), spawn_point, 0, self);
		return trace[#"position"];
	#/
}

/*
	Name: function_4783f10c
	Namespace: dev
	Checksum: 0x6DC37585
	Offset: 0x3CA8
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function function_4783f10c(spiral)
{
	/#
		return spiral.angle + spiral.start_angle;
	#/
}

