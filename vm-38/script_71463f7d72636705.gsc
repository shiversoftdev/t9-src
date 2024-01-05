#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;

#namespace sound_tinnitus;

/*
	Name: function_e4c2724c
	Namespace: sound_tinnitus
	Checksum: 0xF68CF31F
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e4c2724c()
{
	level notify(2009426007);
}

/*
	Name: function_fbb3b7ed
	Namespace: sound_tinnitus
	Checksum: 0x6CD5CCB7
	Offset: 0x90
	Size: 0x40
	Parameters: 2
	Flags: Linked
*/
function function_fbb3b7ed(_notify, var_cc1545d8)
{
	if(isdefined(var_cc1545d8))
	{
		self stoploopsound(var_cc1545d8);
		level.var_2b64ba11--;
	}
}

/*
	Name: function_9a82b890
	Namespace: sound_tinnitus
	Checksum: 0x3B0B2FE7
	Offset: 0xD8
	Size: 0x148
	Parameters: 5
	Flags: Linked
*/
function function_9a82b890(localclientnum, duration, startsound, var_ed2d4562, endsound)
{
	if(level.var_2b64ba11 < 200)
	{
		level.var_2b64ba11++;
		handle = undefined;
		self endoncallback(&function_fbb3b7ed, &handle, #"death", #"disconnect");
		endtime = gettime() + (duration * 1000);
		if(isdefined(startsound))
		{
			if(gettime() < endtime)
			{
				self playsound(localclientnum, startsound);
			}
		}
		if(isdefined(var_ed2d4562))
		{
			while(gettime() < endtime)
			{
				handle = self playloopsound(var_ed2d4562);
				waitframe(1);
			}
			self stoploopsound(handle);
			handle = undefined;
		}
		if(isdefined(endsound))
		{
			self playsound(localclientnum, endsound);
		}
		level.var_2b64ba11--;
	}
}

/*
	Name: function_928600de
	Namespace: sound_tinnitus
	Checksum: 0x73AA3214
	Offset: 0x228
	Size: 0x444
	Parameters: 1
	Flags: Event
*/
event function_928600de(eventstruct)
{
	if(!isdefined(level.tinnitus[eventstruct.weapon.var_b57f13ef]))
	{
		level.tinnitus[eventstruct.weapon.var_b57f13ef] = getscriptbundle(eventstruct.weapon.var_b57f13ef);
		if(!isdefined(level.tinnitus[eventstruct.weapon.var_b57f13ef]))
		{
			return;
		}
	}
	tinnitus = level.tinnitus[eventstruct.weapon.var_b57f13ef];
	local_player = function_5c10bd79(eventstruct.localclientnum);
	if(!function_56e2eaa8(local_player))
	{
		return;
	}
	if(!isplayer(local_player) || isdefined(getplayervehicle(local_player)))
	{
		return;
	}
	if(distancesquared(local_player.origin, eventstruct.position) < tinnitus.maxrange * tinnitus.maxrange)
	{
		if(!isdefined(level.var_2b64ba11))
		{
			level.var_2b64ba11 = 0;
		}
		viewangles = local_player getplayerangles();
		dirtotarget = vectornormalize(eventstruct.position - local_player.origin);
		playerforward = anglestoforward(viewangles);
		playerright = anglestoright(viewangles);
		var_1978c7fc = vectordot(dirtotarget, playerforward);
		var_1006dafa = vectordot(dirtotarget, playerright);
		var_5c9ee157 = dirtotarget * -1;
		var_6059f1ff = local_player.origin + (randomfloat(10) - 5, randomfloat(10) - 5, randomfloat(10) - 5) + (2 * var_5c9ee157);
		local_player function_3edb40f5(eventstruct.weapon, eventstruct.position, var_6059f1ff, dirtotarget * -1);
		if(var_1978c7fc >= 0.5)
		{
			local_player thread function_9a82b890(eventstruct.localclientnum, tinnitus.duration, tinnitus.var_499e1c7f, tinnitus.var_d45165cb, tinnitus.var_82c14e93);
		}
		else if(var_1978c7fc <= -0.5)
		{
			local_player thread function_9a82b890(eventstruct.localclientnum, tinnitus.duration, tinnitus.var_f3b0d4f, tinnitus.var_9d3d0581, tinnitus.var_efce6189);
		}
		if(var_1006dafa >= 0.5)
		{
			local_player thread function_9a82b890(eventstruct.localclientnum, tinnitus.duration, tinnitus.var_3db06635, tinnitus.var_5dddb8e8, tinnitus.var_edcc1468);
		}
		else if(var_1006dafa <= -0.5)
		{
			local_player thread function_9a82b890(eventstruct.localclientnum, tinnitus.duration, tinnitus.var_90c3ef0c, tinnitus.var_60e944e1, tinnitus.var_94f03120);
		}
	}
}

