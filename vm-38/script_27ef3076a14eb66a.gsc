#namespace namespace_7db676d5;

/*
	Name: function_253489d8
	Namespace: namespace_7db676d5
	Checksum: 0x3E583DF0
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_253489d8()
{
	level notify(1943069896);
}

#namespace snipercam;

/*
	Name: get_parms
	Namespace: snipercam
	Checksum: 0xF76920A5
	Offset: 0xA0
	Size: 0x366
	Parameters: 5
	Flags: Linked
*/
function get_parms(attacker, var_4fa5c66a, var_83634238, victim, mode)
{
	if(!isdefined(mode))
	{
		mode = 1;
	}
	parms = spawnstruct();
	var_83ca76ef = 200;
	var_3d5fa3d5 = 30;
	target_tag = "j_head";
	if(mode == 2)
	{
		target_tag = "tag_weapon_chest";
	}
	parms.attacker = attacker;
	parms.var_4fa5c66a = var_4fa5c66a;
	parms.var_83634238 = var_83634238;
	parms.victim = victim;
	parms.startpos = var_4fa5c66a;
	parms.startpos = parms.startpos + (anglestoforward(var_83634238) * var_83ca76ef);
	parms.targetpos = victim gettagorigin(target_tag);
	parms.targetpos = parms.targetpos + ((vectornormalize(parms.startpos - parms.targetpos)) * var_3d5fa3d5);
	parms.var_b21e26bd = victim gettagorigin("j_head");
	parms.var_e93a7f0f = victim.origin;
	parms.angles = vectortoangles(parms.targetpos - parms.startpos);
	parms.forward = anglestoforward(parms.angles);
	parms.startpos = parms.startpos + parms.forward;
	parms.distance = distance(parms.targetpos, parms.startpos);
	parms.endpos = parms.startpos + (parms.forward * parms.distance);
	parms.timescale = 0.5;
	parms.time = (parms.distance / 1500) * parms.timescale;
	var_9066ce9a = 0.1;
	if(mode == 3 || mode == 4)
	{
		var_9066ce9a = 0.02;
	}
	else if(mode == 2)
	{
		var_9066ce9a = 0.02;
	}
	parms.var_684cf08c = parms.time - var_9066ce9a;
	if(parms.var_684cf08c <= 0)
	{
		parms.var_684cf08c = parms.time;
	}
	parms.var_6051349d = 1;
	if(mode == 3 || mode == 2 || mode == 4)
	{
		parms.var_6051349d = 0.7;
	}
	return parms;
}

