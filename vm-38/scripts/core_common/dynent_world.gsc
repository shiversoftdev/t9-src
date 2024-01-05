#using scripts\core_common\system_shared.gsc;

#namespace dynent_world;

/*
	Name: function_75132bfd
	Namespace: dynent_world
	Checksum: 0x782FC71F
	Offset: 0x68
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_75132bfd()
{
	level notify(-1630345418);
}

/*
	Name: __init__system__
	Namespace: dynent_world
	Checksum: 0xB422E4FE
	Offset: 0x88
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"dynent_world", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: dynent_world
	Checksum: 0x1E72BFA1
	Offset: 0xD0
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	/#
		level thread devgui_loop();
	#/
}

/*
	Name: function_3981d015
	Namespace: dynent_world
	Checksum: 0xD7D55381
	Offset: 0xF8
	Size: 0x61C
	Parameters: 1
	Flags: Private, Event
*/
event private function_3981d015(eventstruct)
{
	dynent = eventstruct.ent;
	var_16a4afdc = eventstruct.state;
	bundle = function_489009c1(dynent);
	if(isdefined(bundle) && isdefined(bundle.dynentstates) && isdefined(bundle.dynentstates[var_16a4afdc]))
	{
		newstate = bundle.dynentstates[var_16a4afdc];
		teleport = eventstruct.teleport;
		if(!is_true(bundle.var_f710132b))
		{
			pos = ((isdefined(newstate.pos_x) ? newstate.pos_x : 0), (isdefined(newstate.pos_y) ? newstate.pos_y : 0), (isdefined(newstate.pos_z) ? newstate.pos_z : 0));
			pos = rotatepoint(pos, dynent.var_c286a1ae);
			neworigin = dynent.var_718063b0 + pos;
			pitch = dynent.var_c286a1ae[0] + (isdefined(newstate.var_9d1a4684) ? newstate.var_9d1a4684 : 0);
			yaw = dynent.var_c286a1ae[1] + (isdefined(newstate.var_d81008de) ? newstate.var_d81008de : 0);
			roll = dynent.var_c286a1ae[2] + (isdefined(newstate.var_774f5d57) ? newstate.var_774f5d57 : 0);
			newangles = (absangleclamp360(pitch), absangleclamp360(yaw), absangleclamp360(roll));
			var_a852a7dd = (isdefined(newstate.var_b272e331) ? newstate.var_b272e331 : (isdefined(bundle.var_a852a7dd) ? bundle.var_a852a7dd : 0));
			var_72e281d4 = (isdefined(newstate.var_f5cff1c7) ? newstate.var_f5cff1c7 : (isdefined(bundle.var_72e281d4) ? bundle.var_72e281d4 : 0));
			if(!teleport && var_a852a7dd > 0)
			{
				dynent function_49ed8678(neworigin, var_a852a7dd);
				dynent function_7622f013(newangles, var_a852a7dd, var_72e281d4);
			}
			else
			{
				dynent.origin = neworigin;
				dynent.angles = newangles;
			}
		}
		if(is_true(bundle.var_fd4bc8dd) && !teleport && isdefined(newstate.var_55c3fa1))
		{
			if(!is_true(dynent.var_c78a0afc))
			{
				playsoundatposition(newstate.var_55c3fa1, dynent.origin);
			}
		}
		if(isdefined(newstate.var_c7ae60e8))
		{
			add_helico(dynent, newstate.var_c7ae60e8);
		}
		if(isdefined(newstate.var_879eb2ff))
		{
			starttime = 0;
			rate = (isdefined(newstate.animrate) ? newstate.animrate : 0);
			if(is_true(newstate.var_8725802))
			{
				gametime = gettime();
				if(is_true(newstate.var_e23400ad))
				{
					gametime = gametime + (abs((dynent.origin[0] + dynent.origin[1]) + dynent.origin[2]));
				}
				animlength = int(getanimlength(newstate.var_879eb2ff) * 1000);
				starttime = gametime / (animlength / rate);
				starttime = starttime - int(starttime);
			}
			else if(teleport && !isanimlooping(newstate.var_879eb2ff))
			{
				starttime = 1;
			}
			function_1e23c01f(dynent, newstate.var_879eb2ff, starttime, rate);
		}
		else
		{
			function_27b5ddff(dynent);
		}
		setdynentenabled(dynent, is_true(newstate.enable));
		function_9d43a7ef(dynent, is_true(newstate.ignoredamage));
	}
}

/*
	Name: function_ff8b3908
	Namespace: dynent_world
	Checksum: 0x68770C29
	Offset: 0x720
	Size: 0x25C
	Parameters: 1
	Flags: Private, Event
*/
event private function_ff8b3908(eventstruct)
{
	dynent = eventstruct.ent;
	bundle = function_489009c1(dynent);
	var_1a5e0c43 = is_true(eventstruct.clientside);
	if(isdefined(bundle) && isdefined(bundle.dynentstates))
	{
		stateindex = (var_1a5e0c43 ? (isdefined(bundle.vehicledestroyed) ? bundle.vehicledestroyed : 0) : (isdefined(bundle.destroyed) ? bundle.destroyed : 0));
		if(isdefined(bundle.dynentstates[stateindex]))
		{
			function_e2a06860(dynent, stateindex);
		}
		if(var_1a5e0c43 && dynent.script_noteworthy === #"hash_4d1fb8524fdfd254")
		{
			a_players = function_a1ef346b(undefined, dynent.origin, 225);
			foreach(player in a_players)
			{
				if(player isinvehicle())
				{
					vehicle = player getvehicleoccupied();
					n_speed = vehicle getspeed();
					if(abs(n_speed) > 0)
					{
						player notify(#"hash_34928429a0070510", {#dynent:dynent});
					}
				}
			}
		}
	}
}

/*
	Name: function_209450ae
	Namespace: dynent_world
	Checksum: 0xA230D583
	Offset: 0x988
	Size: 0x44
	Parameters: 1
	Flags: Event
*/
event function_209450ae(eventstruct)
{
	dynent = eventstruct.ent;
	if(isdefined(dynent.ondamaged))
	{
		[[dynent.ondamaged]](eventstruct);
	}
}

/*
	Name: devgui_loop
	Namespace: dynent_world
	Checksum: 0x5259262B
	Offset: 0x9D8
	Size: 0x13E
	Parameters: 0
	Flags: Private
*/
function private devgui_loop()
{
	/#
		level endon(#"game_ended");
		while(!canadddebugcommand())
		{
			waitframe(1);
		}
		adddebugcommand("");
		while(true)
		{
			wait(0.25);
			dvarstr = getdvarstring(#"hash_40f9f26f308dd924", "");
			if(dvarstr == "")
			{
				continue;
			}
			setdvar(#"hash_40f9f26f308dd924", "");
			args = strtok(dvarstr, "");
			switch(args[0])
			{
				case "reset":
				{
					function_3ca3c6e4();
					break;
				}
			}
		}
	#/
}

