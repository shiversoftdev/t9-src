#using scripts\core_common\system_shared.gsc;

#namespace namespace_b6ee49c3;

/*
	Name: function_89f2df9
	Namespace: namespace_b6ee49c3
	Checksum: 0x1B0D438A
	Offset: 0x68
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_442c4eb4e72ecbe2", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_b6ee49c3
	Checksum: 0x7776FEC
	Offset: 0xB0
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	/#
		level thread function_5f747d5a();
	#/
}

/*
	Name: function_3981d015
	Namespace: namespace_b6ee49c3
	Checksum: 0xE42C6884
	Offset: 0xD8
	Size: 0x61C
	Parameters: 1
	Flags: Private, Event
*/
event private function_3981d015(eventstruct)
{
	dynent = eventstruct.ent;
	var_16a4afdc = eventstruct.state;
	bundle = function_489009c1(dynent);
	if(isdefined(bundle) && isdefined(bundle.var_c14aa186) && isdefined(bundle.var_c14aa186[var_16a4afdc]))
	{
		newstate = bundle.var_c14aa186[var_16a4afdc];
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
			function_b562a1b4(dynent, newstate.var_c7ae60e8);
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
	Namespace: namespace_b6ee49c3
	Checksum: 0xAE8107BA
	Offset: 0x700
	Size: 0xFC
	Parameters: 1
	Flags: Private, Event
*/
event private function_ff8b3908(eventstruct)
{
	dynent = eventstruct.ent;
	bundle = function_489009c1(dynent);
	var_1a5e0c43 = is_true(eventstruct.clientside);
	if(isdefined(bundle) && isdefined(bundle.var_c14aa186))
	{
		stateindex = (var_1a5e0c43 ? (isdefined(bundle.vehicledestroyed) ? bundle.vehicledestroyed : 0) : (isdefined(bundle.destroyed) ? bundle.destroyed : 0));
		if(isdefined(bundle.var_c14aa186[stateindex]))
		{
			function_e2a06860(dynent, stateindex);
		}
	}
}

/*
	Name: function_209450ae
	Namespace: namespace_b6ee49c3
	Checksum: 0x70B4760C
	Offset: 0x808
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
	Name: function_5f747d5a
	Namespace: namespace_b6ee49c3
	Checksum: 0xF93CF060
	Offset: 0x858
	Size: 0x13E
	Parameters: 0
	Flags: Private
*/
function private function_5f747d5a()
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

