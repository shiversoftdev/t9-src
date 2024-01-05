#using scripts\core_common\animation_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\array_shared.csc;

#namespace clientfaceanim_shared;

/*
	Name: function_51c12c96
	Namespace: clientfaceanim_shared
	Checksum: 0x71800DA8
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_51c12c96()
{
	level notify(1114748140);
}

#namespace clientfaceanim;

/*
	Name: __init__system__
	Namespace: clientfaceanim
	Checksum: 0xE93264B9
	Offset: 0xB8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"clientfaceanim_shared", undefined, &main, undefined, undefined);
}

/*
	Name: main
	Namespace: clientfaceanim
	Checksum: 0xE441B514
	Offset: 0x100
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function main()
{
	callback::on_spawned(&on_player_spawned);
	callback::on_localclient_connect(&on_localclient_connect);
	buildandvalidatefacialanimationlist(0);
	animation::add_notetrack_func(#"clientfaceanim::deathanimshutdown", &deathanimshutdown);
}

/*
	Name: on_localclient_connect
	Namespace: clientfaceanim
	Checksum: 0x6F00657B
	Offset: 0x198
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private on_localclient_connect(localclientnum)
{
	thread update_players(localclientnum);
}

/*
	Name: on_player_spawned
	Namespace: clientfaceanim
	Checksum: 0xD6E1A714
	Offset: 0x1C8
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private on_player_spawned(localclientnum)
{
	self callback::on_shutdown(&on_player_shutdown);
}

/*
	Name: on_player_shutdown
	Namespace: clientfaceanim
	Checksum: 0xA03FB2F7
	Offset: 0x200
	Size: 0xDA
	Parameters: 1
	Flags: Linked, Private
*/
function private on_player_shutdown(localclientnum)
{
	if(isplayer(self))
	{
		self notify(#"stopfacialthread");
		corpse = self getplayercorpse();
		if(!isdefined(corpse))
		{
			return;
		}
		if(self == corpse)
		{
			return;
		}
		if(is_true(corpse.facialdeathanimstarted))
		{
			return;
		}
		corpse util::waittill_dobj(localclientnum);
		if(isdefined(corpse))
		{
			corpse applydeathanim(localclientnum);
			corpse.facialdeathanimstarted = 1;
		}
	}
}

/*
	Name: buildandvalidatefacialanimationlist
	Namespace: clientfaceanim
	Checksum: 0x805843EF
	Offset: 0x2E8
	Size: 0x380
	Parameters: 1
	Flags: Linked
*/
function buildandvalidatefacialanimationlist(localclientnum)
{
	if(!isdefined(level.__clientfacialanimationslist))
	{
		level.__clientfacialanimationslist = [];
		level.__clientfacialanimationslist[#"combat"] = array(#"ai_t8_face_hero_generic_idle_1", #"ai_t8_face_hero_generic_idle_2", #"ai_t8_face_hero_generic_idle_3");
		level.__clientfacialanimationslist[#"combat_shoot"] = array(#"ai_t8_face_hero_aim_fire_1", #"ai_t8_face_hero_aim_fire_2");
		level.__clientfacialanimationslist[#"death"] = array(#"ai_t8_face_hero_dth_1", #"ai_t8_face_hero_dth_2", #"ai_t8_face_hero_dth_3");
		level.__clientfacialanimationslist[#"melee"] = array(#"ai_t8_face_hero_melee_1");
		level.__clientfacialanimationslist[#"pain"] = array(#"ai_t8_face_hero_pain_1");
		level.__clientfacialanimationslist[#"swimming"] = array(#"mp_t8_face_hero_swim_idle_1");
		level.__clientfacialanimationslist[#"jumping"] = array(#"mp_t8_face_hero_jump_idle_1");
		level.__clientfacialanimationslist[#"sliding"] = array(#"mp_t8_face_hero_slides_1");
		level.__clientfacialanimationslist[#"sprinting"] = array(#"mp_t8_face_hero_sprint_1");
		level.__clientfacialanimationslist[#"wallrunning"] = array(#"mp_t8_face_hero_wall_run_1");
		deathanims = level.__clientfacialanimationslist[#"death"];
		foreach(deathanim in deathanims)
		{
			/#
				assert(!isanimlooping(localclientnum, deathanim), ("" + deathanim) + "");
			#/
		}
	}
}

/*
	Name: facialanimationthink_getwaittime
	Namespace: clientfaceanim
	Checksum: 0xCBA36377
	Offset: 0x670
	Size: 0x138
	Parameters: 1
	Flags: Linked, Private
*/
function private facialanimationthink_getwaittime(localclientnum)
{
	min_wait = 0.1;
	max_wait = 1;
	min_wait_distance_sq = 2500;
	max_wait_distance_sq = 640000;
	if(self function_21c0fa55() && !isthirdperson(localclientnum))
	{
		return max_wait;
	}
	local_player = function_5c10bd79(localclientnum);
	if(!isdefined(local_player))
	{
		return max_wait;
	}
	distancesq = distancesquared(local_player.origin, self.origin);
	if(distancesq > max_wait_distance_sq)
	{
		distance_factor = 1;
	}
	else
	{
		if(distancesq < min_wait_distance_sq)
		{
			distance_factor = 0;
		}
		else
		{
			distance_factor = (distancesq - min_wait_distance_sq) / (max_wait_distance_sq - min_wait_distance_sq);
		}
	}
	return ((max_wait - min_wait) * distance_factor) + min_wait;
}

/*
	Name: function_26ff990a
	Namespace: clientfaceanim
	Checksum: 0xA3B46A6B
	Offset: 0x7B0
	Size: 0x290
	Parameters: 1
	Flags: Linked, Private
*/
function private function_26ff990a(local_client_num)
{
	max_players = 10;
	max_distance = 2000;
	var_62cc2a1a = max_distance * max_distance;
	camera_origin = getcamposbylocalclientnum(local_client_num);
	players = getplayers(local_client_num);
	players = arraysort(players, camera_origin);
	first_person = function_d17ae3cc(local_client_num);
	time = gettime();
	count = 0;
	foreach(player in players)
	{
		waitframe(1);
		if(!isdefined(player))
		{
			return;
		}
		if(first_person && player function_21c0fa55())
		{
			vehicle = getplayervehicle(player);
			if(isdefined(player._currentfacestate) && player._currentfacestate != "inactive" && !isdefined(vehicle))
			{
				player clearallfacialanims(local_client_num);
				player._currentfacestate = "inactive";
			}
			continue;
		}
		if(player.team == #"spectator")
		{
			continue;
		}
		distance_sq = distancesquared(camera_origin, player.origin);
		if(distance_sq > var_62cc2a1a)
		{
			return;
		}
		if((isdefined(player.var_a0161fed) ? player.var_a0161fed : 0) < time)
		{
			updatefacialanimforplayer(local_client_num, player);
		}
		count++;
		if(count == max_players)
		{
			return;
		}
	}
}

/*
	Name: update_players
	Namespace: clientfaceanim
	Checksum: 0xBE636E15
	Offset: 0xA48
	Size: 0x62
	Parameters: 1
	Flags: Linked, Private
*/
function private update_players(local_client_num)
{
	var_40425722 = 1;
	while(true)
	{
		function_26ff990a(local_client_num);
		if(isdemoplaying())
		{
			waitframe(1);
		}
		else
		{
			wait(var_40425722);
		}
	}
}

/*
	Name: updatefacialanimforplayer
	Namespace: clientfaceanim
	Checksum: 0xB349FEEA
	Offset: 0xAB8
	Size: 0x2F6
	Parameters: 2
	Flags: Linked, Private
*/
function private updatefacialanimforplayer(localclientnum, player)
{
	if(!isdefined(player._currentfacestate))
	{
		player._currentfacestate = "inactive";
	}
	if(!player hasdobj(localclientnum))
	{
		return;
	}
	if(!isplayer(player))
	{
		return;
	}
	if(is_true(player function_bee2bbc7()))
	{
		return;
	}
	currfacestate = player._currentfacestate;
	nextfacestate = player._currentfacestate;
	currenttime = gettime();
	if(player isinscritpedanim())
	{
		clearallfacialanims(localclientnum);
		player._currentfacestate = "inactive";
		return;
	}
	if(player isplayerdead())
	{
		nextfacestate = #"death";
	}
	else
	{
		if(player isplayerfiring())
		{
			nextfacestate = #"combat_shoot";
		}
		else
		{
			if(player isplayersliding())
			{
				nextfacestate = #"sliding";
			}
			else
			{
				if(player isplayerwallrunning())
				{
					nextfacestate = #"wallrunning";
				}
				else
				{
					if(player isplayersprinting())
					{
						nextfacestate = #"sprinting";
					}
					else
					{
						if(player isplayerjumping() || player isplayerdoublejumping())
						{
							nextfacestate = #"jumping";
						}
						else
						{
							if(player isplayerswimming())
							{
								nextfacestate = #"swimming";
							}
							else
							{
								nextfacestate = #"combat";
							}
						}
					}
				}
			}
		}
	}
	if(player._currentfacestate == "inactive" || currfacestate != nextfacestate)
	{
		/#
			assert(isdefined(level.__clientfacialanimationslist[nextfacestate]));
		#/
		player applynewfaceanim(localclientnum, array::random(level.__clientfacialanimationslist[nextfacestate]));
		player._currentfacestate = nextfacestate;
	}
	player.var_a0161fed = gettime() + player facialanimationthink_getwaittime(localclientnum);
}

/*
	Name: applynewfaceanim
	Namespace: clientfaceanim
	Checksum: 0xA9B9EBE0
	Offset: 0xDB8
	Size: 0x7C
	Parameters: 2
	Flags: Linked, Private
*/
function private applynewfaceanim(localclientnum, animation)
{
	clearallfacialanims(localclientnum);
	if(isdefined(animation))
	{
		self._currentfaceanim = animation;
		self setflaggedanimknob(#"ai_secondary_facial_anim", animation, 0.9, 0.1, 1);
	}
}

/*
	Name: applydeathanim
	Namespace: clientfaceanim
	Checksum: 0x18FD06CA
	Offset: 0xE40
	Size: 0xBC
	Parameters: 1
	Flags: Linked, Private
*/
function private applydeathanim(localclientnum)
{
	if(isdefined(self._currentfacestate) && self._currentfacestate == #"death")
	{
		return;
	}
	if(isdefined(self) && isdefined(level.__clientfacialanimationslist) && isdefined(level.__clientfacialanimationslist[#"death"]))
	{
		self._currentfacestate = #"death";
		applynewfaceanim(localclientnum, array::random(level.__clientfacialanimationslist[#"death"]));
	}
}

/*
	Name: deathanimshutdown
	Namespace: clientfaceanim
	Checksum: 0x8EAD57C8
	Offset: 0xF08
	Size: 0x34
	Parameters: 2
	Flags: Linked, Private
*/
function private deathanimshutdown(notifystring, param3)
{
	self clearallfacialanims(self.localclientnum);
}

/*
	Name: clearallfacialanims
	Namespace: clientfaceanim
	Checksum: 0xFB876CAC
	Offset: 0xF48
	Size: 0x5E
	Parameters: 1
	Flags: Linked, Private
*/
function private clearallfacialanims(localclientnum)
{
	if(isdefined(self._currentfaceanim) && self hasdobj(localclientnum))
	{
		self clearanim(self._currentfaceanim, 0.2);
	}
	self._currentfaceanim = undefined;
}

