#using scripts\core_common\util_shared.csc;

#namespace namespace_b6ee49c3;

/*
	Name: function_dfa86c6a
	Namespace: namespace_b6ee49c3
	Checksum: 0x11D8A453
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_dfa86c6a()
{
	level notify(1560502344);
}

/*
	Name: function_3981d015
	Namespace: namespace_b6ee49c3
	Checksum: 0x663ADABD
	Offset: 0xA0
	Size: 0x884
	Parameters: 1
	Flags: Event
*/
event function_3981d015(eventstruct)
{
	dynent = eventstruct.ent;
	var_16a4afdc = eventstruct.state;
	bundle = function_489009c1(dynent);
	if(isdefined(bundle) && isdefined(bundle.var_c14aa186) && isdefined(bundle.var_c14aa186[var_16a4afdc]))
	{
		newstate = bundle.var_c14aa186[var_16a4afdc];
		var_eb7c2031 = is_true(bundle.var_eb7c2031);
		var_59102aec = (isdefined(bundle.vehicledestroyed) ? bundle.vehicledestroyed : 0);
		if(var_16a4afdc == var_59102aec)
		{
			if(var_eb7c2031 && !function_8a8a409b(dynent))
			{
				if(isdefined(newstate.var_55c3fa1))
				{
					playsound(0, newstate.var_55c3fa1, dynent.origin);
				}
				return;
			}
		}
		teleport = eventstruct.teleport;
		var_718063b0 = eventstruct.var_f29ec684;
		var_c286a1ae = eventstruct.var_f2f9b257;
		if(!is_true(bundle.var_f710132b))
		{
			pos = ((isdefined(newstate.pos_x) ? newstate.pos_x : 0), (isdefined(newstate.pos_y) ? newstate.pos_y : 0), (isdefined(newstate.pos_z) ? newstate.pos_z : 0));
			pos = rotatepoint(pos, var_c286a1ae);
			neworigin = var_718063b0 + pos;
			pitch = var_c286a1ae[0] + (isdefined(newstate.var_9d1a4684) ? newstate.var_9d1a4684 : 0);
			yaw = var_c286a1ae[1] + (isdefined(newstate.var_d81008de) ? newstate.var_d81008de : 0);
			roll = var_c286a1ae[2] + (isdefined(newstate.var_774f5d57) ? newstate.var_774f5d57 : 0);
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
		if(!is_true(bundle.var_fd4bc8dd) && !teleport && isdefined(newstate.var_55c3fa1))
		{
			playsound(0, newstate.var_55c3fa1, dynent.origin);
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
			else if(teleport && !isanimlooping(0, newstate.var_879eb2ff))
			{
				starttime = 1;
			}
			if(is_true(newstate.var_570bd8aa))
			{
				function_56d48ab3(dynent, newstate.var_879eb2ff, starttime, rate, var_718063b0, var_c286a1ae);
			}
			else
			{
				if(is_true(newstate.var_786684c1))
				{
					function_1ef41caa(dynent, newstate.var_879eb2ff, starttime, rate, is_true(newstate.var_3f644836));
				}
				else
				{
					function_1e23c01f(dynent, newstate.var_879eb2ff, starttime, rate);
				}
			}
		}
		else
		{
			function_27b5ddff(dynent);
		}
		if(isdefined(newstate.var_af128328) && isdefined(eventstruct.localclientnum))
		{
			if(isdefined(dynent.fx))
			{
				stopfx(eventstruct.localclientnum, dynent.fx);
				dynent.fx = undefined;
			}
			if(newstate.var_af128328 !== #"hash_633319dd8957ddbb")
			{
				dynent.fx = playfxondynent(newstate.var_af128328, dynent);
			}
		}
		var_ceeada02 = is_true(newstate.var_fd3b5e91);
		for(i = 0; i < 5; i++)
		{
			if(isdefined(newstate.("boneConstraint" + i)))
			{
				dynent function_d309e55a(newstate.("boneConstraint" + i), var_ceeada02);
			}
		}
		setdynentenabled(dynent, is_true(newstate.enable));
		function_9d43a7ef(dynent, is_true(newstate.ignoredamage));
	}
}

/*
	Name: function_209450ae
	Namespace: namespace_b6ee49c3
	Checksum: 0x457F77BC
	Offset: 0x930
	Size: 0x80
	Parameters: 1
	Flags: Event
*/
event function_209450ae(eventstruct)
{
	dynent = eventstruct.ent;
	level endon(#"game_ended");
	dynent endon(#"death");
	waittillframeend();
	if(isdefined(dynent) && isdefined(dynent.ondamaged))
	{
		[[dynent.ondamaged]](eventstruct);
	}
}

/*
	Name: function_ff8b3908
	Namespace: namespace_b6ee49c3
	Checksum: 0xE5922C11
	Offset: 0x9B8
	Size: 0x80
	Parameters: 1
	Flags: Event
*/
event function_ff8b3908(eventstruct)
{
	dynent = eventstruct.ent;
	level endon(#"game_ended");
	dynent endon(#"death");
	waittillframeend();
	if(isdefined(dynent) && isdefined(dynent.ondestroyed))
	{
		[[dynent.ondestroyed]](eventstruct);
	}
}

