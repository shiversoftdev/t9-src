#using scripts\weapons\land_mine.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\flag_shared.gsc;
#using script_1cd491b1807da8f7;
#using scripts\core_common\callbacks_shared.gsc;

#namespace namespace_f3e83343;

/*
	Name: function_84e32eb7
	Namespace: namespace_f3e83343
	Checksum: 0xB1A5316A
	Offset: 0x138
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_84e32eb7()
{
	level notify(1969989462);
}

/*
	Name: __init__system__
	Namespace: namespace_f3e83343
	Checksum: 0xDF26A495
	Offset: 0x158
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_56764d013a0eb19c", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_f3e83343
	Checksum: 0x6056F057
	Offset: 0x1A0
	Size: 0x274
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	dynents = getdynentarray("dynent_garage_button");
	foreach(dynent in dynents)
	{
		dynent.onuse = &function_51a020;
		dynent.ondamaged = &function_724a2fa5;
	}
	dynents = getdynentarray("dynent_door_check_for_vehicles");
	foreach(dynent in dynents)
	{
		dynent.onuse = &function_995a4e51;
	}
	dynents = getdynentarray("dynent_destroyable_door");
	foreach(dynent in dynents)
	{
		dynent.ondamaged = &function_5d409a7b;
		dynent.maxhealth = dynent.health;
	}
	doors = function_f3e164a9(#"hash_4d1fb8524fdfd254");
	if(isdefined(doors) && doors.size > 0)
	{
		level thread function_92f2f8cf(doors);
		level thread function_160e40a2();
	}
	level thread function_b217acf();
}

/*
	Name: function_3981d015
	Namespace: namespace_f3e83343
	Checksum: 0xCF887E6
	Offset: 0x420
	Size: 0x118
	Parameters: 1
	Flags: Private, Event
*/
event private function_3981d015(eventstruct)
{
	dynent = eventstruct.ent;
	if(!isdefined(dynent.var_667629e9))
	{
		return;
	}
	foreach(object in dynent.var_667629e9)
	{
		if(!isdefined(object))
		{
			continue;
		}
		if(object.weapon.name == #"land_mine")
		{
			object land_mine::function_338f99f5();
			continue;
		}
		object dodamage(object.health - 1, dynent.origin);
	}
}

/*
	Name: function_b217acf
	Namespace: namespace_f3e83343
	Checksum: 0x9487324D
	Offset: 0x540
	Size: 0xA6
	Parameters: 0
	Flags: Linked
*/
function function_b217acf()
{
	while(true)
	{
		params = undefined;
		params = level waittill(#"hash_2d1093d938f2fad6");
		dynent = params.hitent;
		if(!isdefined(dynent.var_667629e9))
		{
			dynent.var_667629e9 = [];
		}
		arrayremovevalue(dynent.var_667629e9, undefined);
		dynent.var_667629e9[dynent.var_667629e9.size] = params.projectile;
		waitframe(1);
	}
}

/*
	Name: function_160e40a2
	Namespace: namespace_f3e83343
	Checksum: 0x5EFD3155
	Offset: 0x5F0
	Size: 0xA4E
	Parameters: 0
	Flags: Linked
*/
function function_160e40a2()
{
	level endon(#"game_ended");
	var_1a1c0d86 = 0;
	cosangle = cos(20);
	var_3393f5fe = cos(50);
	var_2c51fa57 = sqr(64);
	while(true)
	{
		foreach(i, player in getplayers())
		{
			time = gettime();
			if((i % 2) == var_1a1c0d86)
			{
				if(!isdefined(player.var_8a022726))
				{
					continue;
				}
				if(player sprintbuttonpressed() || player issprinting() || player issliding())
				{
					var_42b5b0df = player getvelocity() * 0.1;
					var_40676129 = player.origin + var_42b5b0df;
					playerorigin = player.origin;
					bounds = (300, 300, 150);
					var_5ed7231a = player getcentroid();
					var_e86a4d9 = function_db4bc717(var_5ed7231a, bounds);
					foreach(dynent in var_e86a4d9)
					{
						if(isdefined(dynent.var_a548ec11) && dynent.var_a548ec11 > time)
						{
							continue;
						}
						if(dynent.script_noteworthy !== #"hash_4d1fb8524fdfd254")
						{
							continue;
						}
						if(abs(playerorigin[2] - dynent.origin[2]) > 36)
						{
							continue;
						}
						bundle = function_489009c1(dynent);
						v_offset = ((isdefined(bundle.var_aa0fba03) ? bundle.var_aa0fba03 : 0), (isdefined(bundle.var_f8525687) ? bundle.var_f8525687 : 0), (isdefined(bundle.var_54b28eee) ? bundle.var_54b28eee : 0));
						v_offset = rotatepoint(v_offset, dynent.angles);
						var_dea242aa = dynent.origin + v_offset;
						playerdir = var_dea242aa - playerorigin;
						playerdir = vectornormalize((playerdir[0], playerdir[1], 0));
						var_f8682cca = vectordot(anglestoforward(player.angles), playerdir);
						var_772fc240 = distance2dsquared(playerorigin, var_dea242aa);
						var_6bcc2b9b = var_772fc240 <= var_2c51fa57;
						if(!var_6bcc2b9b && var_f8682cca <= cosangle || (var_6bcc2b9b && var_f8682cca <= var_3393f5fe))
						{
							continue;
						}
						var_df2e06ad = distance2dsquared(var_40676129, var_dea242aa);
						var_cdc68fb8 = distance2dsquared(playerorigin, var_dea242aa);
						if(var_df2e06ad <= sqr(75) || var_cdc68fb8 <= sqr(100))
						{
							stateindex = function_ffdbe8c2(dynent);
							if(stateindex == 1 || stateindex == 2 || stateindex == 4 || stateindex == 5)
							{
								if(var_df2e06ad > (sqr(75 * 0.5)) && var_cdc68fb8 > (sqr(100 * 0.5)))
								{
									continue;
								}
								var_b4b3af4c = anglestoforward(dynent.angles);
								dot = vectordot(var_b4b3af4c, playerdir);
								if(dot >= 0 && (stateindex == 1 || stateindex == 4))
								{
									continue;
								}
								else if(dot <= 0 && (stateindex == 2 || stateindex == 5))
								{
									continue;
								}
							}
							else
							{
								if(stateindex == 0 || stateindex == 6)
								{
									var_b4b3af4c = anglestoforward(dynent.angles);
									var_4df98d7a = anglestoforward(player.angles);
									dot = abs(vectordot(var_b4b3af4c, var_4df98d7a));
									if(dot < cos(45))
									{
										continue;
									}
								}
								else if(stateindex == 3)
								{
									continue;
								}
							}
							var_dbfa3e4e = bullettrace(player.origin, var_dea242aa, 0, player, 0);
							if(!isdefined(var_dbfa3e4e[#"dynent"]))
							{
								continue;
							}
							bundle = function_489009c1(dynent);
							if(isdefined(bundle) && isdefined(bundle.dynentstates) && isdefined(bundle.dynentstates[stateindex]))
							{
								var_b731b99b = 6;
								if(stateindex == 0 || stateindex == 6)
								{
									var_b4b3af4c = anglestoforward(dynent.angles);
									dot = vectordot(var_b4b3af4c, playerdir);
									if(dot >= 0)
									{
										var_b731b99b = 4;
									}
									else
									{
										var_b731b99b = 5;
									}
								}
								var_bb075e98 = {#origin:var_dea242aa};
								var_a852a7dd = var_bb075e98 dynent_use::use_dynent(dynent, player, var_b731b99b, 1, 1);
								player gestures::play_gesture("ges_t9_door_shove", undefined, 0);
								player function_bc82f900("door_shove");
								playsoundatposition("evt_door_bash", dynent.origin);
								playfx("debris/fx9_door_bash", dynent.origin, anglestoforward(dynent.angles), anglestoup(dynent.angles));
								var_a548ec11 = 1;
								dynent.var_a548ec11 = (gettime() + (int(var_a852a7dd * 1000))) + (int(var_a548ec11 * 1000));
								if(isdefined(level.var_83c46567))
								{
									[[level.var_83c46567]](dynent);
								}
							}
						}
					}
				}
			}
		}
		var_1a1c0d86 = (var_1a1c0d86 + 1) % 2;
		waitframe(1);
	}
}

/*
	Name: function_92f2f8cf
	Namespace: namespace_f3e83343
	Checksum: 0xFBFB4139
	Offset: 0x1048
	Size: 0x8E
	Parameters: 1
	Flags: Linked
*/
function function_92f2f8cf(doors)
{
	foreach(door in doors)
	{
		door.ondamaged = &function_c743094d;
	}
}

/*
	Name: function_c743094d
	Namespace: namespace_f3e83343
	Checksum: 0xA4888262
	Offset: 0x10E0
	Size: 0x3E0
	Parameters: 1
	Flags: Linked
*/
function function_c743094d(eventstruct)
{
	dynent = eventstruct.ent;
	activator = eventstruct.attacker;
	if(is_true(eventstruct.melee) && isplayer(activator) && isdefined(activator.var_8a022726) && activator.var_8a022726 istriggerenabled())
	{
		dynent.health = dynent.health + eventstruct.amount;
		stateindex = function_ffdbe8c2(dynent);
		var_b4b3af4c = anglestoforward(dynent.angles);
		playerdir = activator.var_8a022726.origin - activator.origin;
		playerdir = vectornormalize((playerdir[0], playerdir[1], 0));
		dot = vectordot(var_b4b3af4c, playerdir);
		if(stateindex == 1 || stateindex == 2 || stateindex == 4 || stateindex == 5)
		{
			if(dot >= 0 && (stateindex == 1 || stateindex == 4))
			{
				return;
			}
			if(dot <= 0 && (stateindex == (stateindex == 2 || stateindex == 5)))
			{
				return;
			}
		}
		bundle = function_489009c1(dynent);
		if(isdefined(bundle) && isdefined(bundle.dynentstates) && isdefined(bundle.dynentstates[stateindex]))
		{
			var_b731b99b = 6;
			if(stateindex == 0 || stateindex == 6)
			{
				if(dot >= 0)
				{
					var_b731b99b = 4;
				}
				else
				{
					var_b731b99b = 5;
				}
			}
			var_a852a7dd = eventstruct.attacker.var_8a022726 dynent_use::use_dynent(dynent, eventstruct.attacker, var_b731b99b, 1, 1);
			playsoundatposition("evt_door_bash", dynent.origin);
			playfx("debris/fx9_door_bash", dynent.origin, anglestoforward(dynent.angles), anglestoup(dynent.angles));
			dynent.var_a548ec11 = gettime() + (var_a852a7dd * 1000);
		}
	}
	else if(isplayer(activator) && dynent.health <= 0)
	{
		activator notify(#"hash_34928429a0070510", {#dynent:dynent});
	}
}

/*
	Name: function_995a4e51
	Namespace: namespace_f3e83343
	Checksum: 0x9CFAEE77
	Offset: 0x14C8
	Size: 0x308
	Parameters: 3
	Flags: Linked
*/
function function_995a4e51(activator, laststate, state)
{
	if(state != 0 || laststate == state)
	{
		return true;
	}
	forward = anglestoforward(self.angles);
	right = anglestoright(self.angles);
	bounds = function_c440d28e(self.var_15d44120);
	midpoint = (bounds.mins + bounds.maxs) * 0.5;
	var_53c592d9 = midpoint - bounds.mins;
	doorcenter = self.origin + rotatepoint(midpoint, self.angles);
	/#
		box(doorcenter, var_53c592d9 * -1, var_53c592d9, self.angles, (1, 0, 1), 1, 0, 600);
	#/
	radius = max(max(midpoint[0], midpoint[1]), midpoint[2]);
	ents = getentitiesinradius(doorcenter, radius);
	foreach(ent in ents)
	{
		if(!isvehicle(ent))
		{
			continue;
		}
		var_84c67202 = ent.origin + rotatepoint(ent getboundsmidpoint(), ent.angles);
		var_59485761 = ent getboundshalfsize();
		if(function_ecdf9b24(doorcenter, self.angles, var_53c592d9, var_84c67202, ent.angles, var_59485761))
		{
			/#
				box(var_84c67202, var_59485761 * -1, var_59485761, ent.angles, (1, 0, 0), 1, 0, 600);
			#/
			return false;
		}
	}
	return true;
}

/*
	Name: function_d7b6ee00
	Namespace: namespace_f3e83343
	Checksum: 0x8E1A05EE
	Offset: 0x17D8
	Size: 0x1F4
	Parameters: 3
	Flags: None
*/
function function_d7b6ee00(activator, laststate, state)
{
	if(laststate == state)
	{
		return;
	}
	if(state != 0)
	{
		forward = anglestoforward(self.angles);
		right = anglestoright(self.angles);
		bounds = function_c440d28e(self.var_15d44120);
		start = self.origin + vectorscale((0, 0, 1), 35);
		start = start - ((right * (bounds.mins[1] + bounds.maxs[1])) * 0.5);
		if(state == 1)
		{
			start = start + (forward * 5);
			end = start + (forward * 35);
		}
		else
		{
			start = start - (forward * 5);
			end = start - (forward * 35);
		}
		/#
			line(start, end, (1, 1, 1), 1, 1, 300);
		#/
		results = bullettracepassed(start, end, 0, activator);
		if(!results)
		{
			if(state == 1)
			{
				state = 2;
			}
			else if(state == 2)
			{
				state = 1;
			}
			function_e2a06860(self, state);
			return false;
		}
	}
	return true;
}

/*
	Name: function_51a020
	Namespace: namespace_f3e83343
	Checksum: 0x4863D552
	Offset: 0x19D8
	Size: 0x238
	Parameters: 3
	Flags: Linked
*/
function function_51a020(activator, laststate, state)
{
	if(isdefined(self.target))
	{
		if(laststate == state)
		{
			return false;
		}
		var_a9309589 = getdynent(self.target);
		if(!isdefined(var_a9309589))
		{
			return false;
		}
		currentstate = function_ffdbe8c2(var_a9309589);
		if(state == 0)
		{
			right = anglestoright(var_a9309589.angles);
			bounds = function_c440d28e(var_a9309589.var_15d44120);
			center = var_a9309589.origin + vectorscale((0, 0, 1), 25);
			start = center + ((right * bounds.mins[1]) * 0.85);
			end = center + ((right * bounds.maxs[1]) * 0.85);
			results = bullettracepassed(start, end, 0, activator);
			if(!results)
			{
				return false;
			}
			center = var_a9309589.origin + vectorscale((0, 0, 1), 40);
			start = center + ((right * bounds.mins[1]) * 0.85);
			end = center + ((right * bounds.maxs[1]) * 0.85);
			results = bullettracepassed(start, end, 0, activator);
			if(!results)
			{
				return false;
			}
		}
		if(currentstate != state)
		{
			function_e2a06860(var_a9309589, state);
		}
	}
	return true;
}

/*
	Name: function_724a2fa5
	Namespace: namespace_f3e83343
	Checksum: 0x19F8BA21
	Offset: 0x1C18
	Size: 0xEE
	Parameters: 1
	Flags: Linked, Private
*/
function private function_724a2fa5(eventstruct)
{
	dynent = eventstruct.ent;
	if(isdefined(eventstruct))
	{
		dynent.health = dynent.health + eventstruct.amount;
	}
	if(isdefined(dynent.var_a548ec11) && gettime() <= dynent.var_a548ec11)
	{
		return;
	}
	if(distancesquared(eventstruct.ent.origin, eventstruct.position) > sqr(15))
	{
		return;
	}
	var_a852a7dd = dynent_use::use_dynent(dynent);
	dynent.var_a548ec11 = gettime() + (var_a852a7dd * 1000);
}

/*
	Name: function_5d409a7b
	Namespace: namespace_f3e83343
	Checksum: 0x370FAC36
	Offset: 0x1D10
	Size: 0x9C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5d409a7b(eventstruct)
{
	dynent = eventstruct.ent;
	state = function_ffdbe8c2(dynent);
	if(state <= 2)
	{
		var_6c9f448d = dynent.health / dynent.maxhealth;
		if(var_6c9f448d <= 0.5)
		{
			function_e2a06860(dynent, state + 3);
		}
	}
}

