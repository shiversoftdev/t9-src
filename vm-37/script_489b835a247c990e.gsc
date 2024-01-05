#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\ai\archetype_utility.gsc;
#using script_4a3f9b8905878272;
#using script_3aa0f32b70d4f7cb;
#using script_178024232e91b0a1;
#using script_caf007e2a98afa2;

#namespace aiutility;

/*
	Name: registerbehaviorscriptfunctions
	Namespace: aiutility
	Checksum: 0x60F050DF
	Offset: 0x310
	Size: 0x171C
	Parameters: 0
	Flags: AutoExec
*/
function autoexec registerbehaviorscriptfunctions()
{
	/#
		assert(iscodefunctionptr(&btapi_locomotionbehaviorcondition));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"btapi_locomotionbehaviorcondition", &btapi_locomotionbehaviorcondition);
	/#
		assert(iscodefunctionptr(&btapi_locomotionbehaviorcondition));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"btapi_locomotionbehaviorcondition", &btapi_locomotionbehaviorcondition);
	/#
		assert(isscriptfunctionptr(&setdesiredstanceformovement));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"setdesiredstanceformovement", &setdesiredstanceformovement);
	/#
		assert(isscriptfunctionptr(&clearpathfromscript));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"clearpathfromscript", &clearpathfromscript);
	/#
		assert(isscriptfunctionptr(&function_41b88b98));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"cleararrivalpos", &function_41b88b98);
	/#
		assert(isscriptfunctionptr(&function_41b88b98));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"cleararrivalpos", &function_41b88b98);
	/#
		assert(iscodefunctionptr(&btapi_shouldtacticalwalk));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("btApi_shouldtacticalwalk", &btapi_shouldtacticalwalk);
	/#
		assert(iscodefunctionptr(&btapi_shouldtacticalwalk));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"btapi_shouldtacticalwalk", &btapi_shouldtacticalwalk);
	/#
		assert(isscriptfunctionptr(&shouldadjuststanceattacticalwalk));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldadjuststanceattacticalwalk", &shouldadjuststanceattacticalwalk);
	/#
		assert(isscriptfunctionptr(&adjuststancetofaceenemyinitialize));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"adjuststancetofaceenemyinitialize", &adjuststancetofaceenemyinitialize);
	/#
		assert(isscriptfunctionptr(&adjuststancetofaceenemyterminate));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"adjuststancetofaceenemyterminate", &adjuststancetofaceenemyterminate);
	/#
		assert(isscriptfunctionptr(&tacticalwalkactionstart));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"tacticalwalkactionstart", &tacticalwalkactionstart);
	/#
		assert(isscriptfunctionptr(&tacticalwalkactionstart));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"tacticalwalkactionstart", &tacticalwalkactionstart);
	/#
		assert(isscriptfunctionptr(&function_63edf1f4));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_357c9f602346da68", &function_63edf1f4);
	/#
		assert(isscriptfunctionptr(&function_63edf1f4));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_357c9f602346da68", &function_63edf1f4);
	/#
		assert(isscriptfunctionptr(&function_907ba31a));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7f40a2df5ff125a6", &function_907ba31a);
	/#
		assert(isscriptfunctionptr(&function_907ba31a));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_7f40a2df5ff125a6", &function_907ba31a);
	/#
		assert(isscriptfunctionptr(&function_37e22c7));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1a211a9a98652ef2", &function_37e22c7);
	/#
		assert(isscriptfunctionptr(&function_37e22c7));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_1a211a9a98652ef2", &function_37e22c7);
	/#
		assert(isscriptfunctionptr(&shouldstartarrivalcondition));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldstartarrival", &shouldstartarrivalcondition);
	/#
		assert(isscriptfunctionptr(&shouldstartarrivalcondition));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"shouldstartarrival", &shouldstartarrivalcondition);
	/#
		assert(isscriptfunctionptr(&function_2f14d74f));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_1e1d62204a080a4", &function_2f14d74f);
	/#
		assert(isscriptfunctionptr(&locomotionshouldtraverse));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"locomotionshouldtraverse", &locomotionshouldtraverse);
	/#
		assert(isscriptfunctionptr(&locomotionshouldtraverse));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"locomotionshouldtraverse", &locomotionshouldtraverse);
	/#
		assert(isscriptfunctionptr(&locomotionshouldparametrictraverse));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"locomotionshouldparametrictraverse", &locomotionshouldparametrictraverse);
	/#
		assert(isscriptfunctionptr(&locomotionshouldparametrictraverse));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"locomotionshouldparametrictraverse", &locomotionshouldparametrictraverse);
	/#
		assert(isscriptfunctionptr(&function_5ef5b35a));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7234c48b18665dc6", &function_5ef5b35a);
	/#
		assert(isscriptfunctionptr(&function_5ef5b35a));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_7234c48b18665dc6", &function_5ef5b35a);
	/#
		assert(isscriptfunctionptr(&function_8a8c5d44));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4c93e133d3b1accc", &function_8a8c5d44);
	/#
		assert(isscriptfunctionptr(&function_8a8c5d44));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_4c93e133d3b1accc", &function_8a8c5d44);
	/#
		assert(isscriptfunctionptr(&traverseactionstart));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"traverseactionstart", &traverseactionstart);
	/#
		assert(isscriptfunctionptr(&wpn_debug_bot_joinleave));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_5d1b3df7dd4e60c0", &wpn_debug_bot_joinleave);
	/#
		assert(isscriptfunctionptr(&traverseactionstart));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"traverseactionstart", &traverseactionstart);
	/#
		assert(isscriptfunctionptr(&wpn_debug_bot_joinleave));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_5d1b3df7dd4e60c0", &wpn_debug_bot_joinleave);
	/#
		assert(!isdefined(&traverseactionstart) || isscriptfunctionptr(&traverseactionstart));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	/#
		assert(!isdefined(&wpn_debug_bot_joinleave) || isscriptfunctionptr(&wpn_debug_bot_joinleave));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"traverseactionstart", &traverseactionstart, undefined, &wpn_debug_bot_joinleave);
	/#
		assert(isscriptfunctionptr(&traversesetup));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"traversesetup", &traversesetup);
	/#
		assert(isscriptfunctionptr(&traversesetup));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"traversesetup", &traversesetup);
	/#
		assert(isscriptfunctionptr(&disablerepath));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"disablerepath", &disablerepath);
	/#
		assert(isscriptfunctionptr(&enablerepath));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"enablerepath", &enablerepath);
	/#
		assert(isscriptfunctionptr(&canjuke));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"canjuke", &canjuke);
	/#
		assert(isscriptfunctionptr(&choosejukedirection));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"choosejukedirection", &choosejukedirection);
	/#
		assert(isscriptfunctionptr(&locomotionpainbehaviorcondition));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"locomotionpainbehaviorcondition", &locomotionpainbehaviorcondition);
	/#
		assert(isscriptfunctionptr(&locomotionisonstairs));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"locomotionisonstairs", &locomotionisonstairs);
	/#
		assert(isscriptfunctionptr(&locomotionisonstairs));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"locomotionisonstairs", &locomotionisonstairs);
	/#
		assert(isscriptfunctionptr(&locomotionshouldlooponstairs));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"locomotionshouldlooponstairs", &locomotionshouldlooponstairs);
	/#
		assert(isscriptfunctionptr(&locomotionshouldskipstairs));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"locomotionshouldskipstairs", &locomotionshouldskipstairs);
	/#
		assert(isscriptfunctionptr(&locomotionstairsstart));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"locomotionstairsstart", &locomotionstairsstart);
	/#
		assert(isscriptfunctionptr(&locomotionstairsend));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"locomotionstairsend", &locomotionstairsend);
	/#
		assert(isscriptfunctionptr(&function_7589776c));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_69eb39facbba57d5", &function_7589776c);
	/#
		assert(isscriptfunctionptr(&function_39c609a4));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_7497a51aec712e8e", &function_39c609a4);
	/#
		assert(isscriptfunctionptr(&function_95b175c0));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_4e3d1194b4da7cdd", &function_95b175c0);
	/#
		assert(isscriptfunctionptr(&function_9948d7a));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_3339c9781a08f98f", &function_9948d7a);
	/#
		assert(isscriptfunctionptr(&delaymovement));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"delaymovement", &delaymovement);
	/#
		assert(isscriptfunctionptr(&delaymovement));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"delaymovement", &delaymovement);
	/#
		function_5ac4dc99(#"hash_1d32e0542bbcf72d", 0);
		level.var_ace44d97 = getdvar(#"hash_1d32e0542bbcf72d");
		function_cd140ee9(#"hash_1d32e0542bbcf72d", &function_73bd30d3);
	#/
}

/*
	Name: locomotionisonstairs
	Namespace: aiutility
	Checksum: 0xC70DC899
	Offset: 0x1A38
	Size: 0x186
	Parameters: 1
	Flags: Linked, Private
*/
function private locomotionisonstairs(behaviortreeentity)
{
	if(is_true(behaviortreeentity.var_73e3e2aa))
	{
		return false;
	}
	startnode = behaviortreeentity.traversestartnode;
	if(isdefined(startnode) && behaviortreeentity shouldstarttraversal())
	{
		if(isdefined(startnode.animscript) && issubstr(tolower(startnode.animscript), "stairs"))
		{
			/#
				if(behaviortreeentity function_3b027260())
				{
					println("", behaviortreeentity.origin[0], "", behaviortreeentity.origin[1], "", behaviortreeentity.origin[2]);
				}
			#/
			return true;
		}
	}
	/#
		if(behaviortreeentity function_3b027260())
		{
			println("", behaviortreeentity.origin[0], "", behaviortreeentity.origin[1], "", behaviortreeentity.origin[2]);
		}
	#/
	return false;
}

/*
	Name: locomotionshouldskipstairs
	Namespace: aiutility
	Checksum: 0x4C4CA6B3
	Offset: 0x1BC8
	Size: 0x1AC
	Parameters: 1
	Flags: Linked, Private
*/
function private locomotionshouldskipstairs(behaviortreeentity)
{
	/#
		assert(isdefined(behaviortreeentity._stairsstartnode) && isdefined(behaviortreeentity._stairsendnode));
	#/
	numtotalsteps = behaviortreeentity getblackboardattribute("_staircase_num_total_steps");
	stepssofar = behaviortreeentity getblackboardattribute("_staircase_num_steps");
	direction = behaviortreeentity getblackboardattribute("_staircase_direction");
	if(direction != "staircase_up")
	{
		return false;
	}
	numoutsteps = 2;
	totalstepswithoutout = numtotalsteps - numoutsteps;
	if(stepssofar >= totalstepswithoutout)
	{
		return false;
	}
	remainingsteps = totalstepswithoutout - stepssofar;
	if(remainingsteps >= 3 || remainingsteps >= 6 || remainingsteps >= 8)
	{
		/#
			if(behaviortreeentity function_3b027260())
			{
				println("", behaviortreeentity.origin[0], "", behaviortreeentity.origin[1], "", behaviortreeentity.origin[2]);
			}
		#/
		return true;
	}
	return false;
}

/*
	Name: locomotionshouldlooponstairs
	Namespace: aiutility
	Checksum: 0x4AE5B965
	Offset: 0x1D80
	Size: 0x194
	Parameters: 1
	Flags: Linked, Private
*/
function private locomotionshouldlooponstairs(behaviortreeentity)
{
	/#
		assert(isdefined(behaviortreeentity._stairsstartnode) && isdefined(behaviortreeentity._stairsendnode));
	#/
	numtotalsteps = behaviortreeentity getblackboardattribute("_staircase_num_total_steps");
	stepssofar = behaviortreeentity getblackboardattribute("_staircase_num_steps");
	exittype = behaviortreeentity getblackboardattribute("_staircase_exit_type");
	direction = behaviortreeentity getblackboardattribute("_staircase_direction");
	numoutsteps = 2;
	if(direction == "staircase_up")
	{
		switch(exittype)
		{
			case "staircase_up_exit_l_3_stairs":
			case "staircase_up_exit_r_3_stairs":
			{
				numoutsteps = 3;
				break;
			}
			case "staircase_up_exit_r_4_stairs":
			case "staircase_up_exit_l_4_stairs":
			{
				numoutsteps = 4;
				break;
			}
		}
	}
	if(stepssofar >= (numtotalsteps - numoutsteps))
	{
		behaviortreeentity setstairsexittransform();
		return false;
	}
	return true;
}

/*
	Name: locomotionstairsstart
	Namespace: aiutility
	Checksum: 0x4EAB20A0
	Offset: 0x1F20
	Size: 0x400
	Parameters: 1
	Flags: Linked, Private
*/
function private locomotionstairsstart(behaviortreeentity)
{
	/#
		if(behaviortreeentity function_3b027260())
		{
			println("", behaviortreeentity.origin[0], "", behaviortreeentity.origin[1], "", behaviortreeentity.origin[2]);
		}
	#/
	startnode = behaviortreeentity.traversestartnode;
	endnode = behaviortreeentity.traverseendnode;
	/#
		assert(isdefined(startnode) && isdefined(endnode));
	#/
	behaviortreeentity._stairsstartnode = startnode;
	behaviortreeentity._stairsendnode = endnode;
	if(startnode.type == #"begin")
	{
		direction = "staircase_down";
	}
	else
	{
		direction = "staircase_up";
	}
	behaviortreeentity setblackboardattribute("_staircase_type", behaviortreeentity._stairsstartnode.animscript);
	behaviortreeentity setblackboardattribute("_staircase_state", "staircase_start");
	behaviortreeentity setblackboardattribute("_staircase_direction", direction);
	numtotalsteps = undefined;
	if(isdefined(startnode.script_int))
	{
		numtotalsteps = int(endnode.script_int);
	}
	else if(isdefined(endnode.script_int))
	{
		numtotalsteps = int(endnode.script_int);
	}
	/#
		assert(isdefined(numtotalsteps) && isint(numtotalsteps) && numtotalsteps > 0);
	#/
	behaviortreeentity setblackboardattribute("_staircase_num_total_steps", numtotalsteps);
	behaviortreeentity setblackboardattribute("_staircase_num_steps", 0);
	exittype = undefined;
	if(direction == "staircase_up")
	{
		switch(int(behaviortreeentity._stairsstartnode.script_int) % 4)
		{
			case 0:
			{
				exittype = "staircase_up_exit_r_3_stairs";
				break;
			}
			case 1:
			{
				exittype = "staircase_up_exit_r_4_stairs";
				break;
			}
			case 2:
			{
				exittype = "staircase_up_exit_l_3_stairs";
				break;
			}
			case 3:
			{
				exittype = "staircase_up_exit_l_4_stairs";
				break;
			}
		}
	}
	else
	{
		switch(int(behaviortreeentity._stairsstartnode.script_int) % 2)
		{
			case 0:
			{
				exittype = "staircase_down_exit_l_2_stairs";
				break;
			}
			case 1:
			{
				exittype = "staircase_down_exit_r_2_stairs";
				break;
			}
		}
	}
	behaviortreeentity setblackboardattribute("_staircase_exit_type", exittype);
	return true;
}

/*
	Name: locomotionstairsend
	Namespace: aiutility
	Checksum: 0xC2A6C904
	Offset: 0x2328
	Size: 0xB4
	Parameters: 1
	Flags: Linked, Private
*/
function private locomotionstairsend(behaviortreeentity)
{
	/#
		if(behaviortreeentity function_3b027260())
		{
			println("", behaviortreeentity.origin[0], "", behaviortreeentity.origin[1], "", behaviortreeentity.origin[2]);
		}
	#/
	behaviortreeentity setblackboardattribute("_staircase_state", undefined);
	behaviortreeentity setblackboardattribute("_staircase_direction", undefined);
}

/*
	Name: function_bb046570
	Namespace: aiutility
	Checksum: 0xB49A1331
	Offset: 0x23E8
	Size: 0x342
	Parameters: 0
	Flags: Linked, Private
*/
function private function_bb046570()
{
	if(!isdefined(self.ai.var_4183a6fc))
	{
		self.ai.var_4183a6fc = spawnstruct();
	}
	self.ai.var_4183a6fc.goalpos = self.pathgoalpos;
	points = self function_f14f56a8();
	for(i = 1; i < points.size - 1; i++)
	{
		direction = vectornormalize((points[i + 1]) - points[i]);
		checkpoint = points[i] + direction;
		if(ispointonstairs(checkpoint))
		{
			startpoint = points[i];
			endpoint = self.pathgoalpos;
			for(j = i + 1; j < points.size; j++)
			{
				direction = vectornormalize(points[j] - (points[j - 1]));
				if(!ispointonstairs(points[j] + direction))
				{
					endpoint = points[j];
					break;
				}
			}
			var_ef0e5eed = distance2dsquared(startpoint, endpoint);
			if(var_ef0e5eed >= sqr(36))
			{
				self.ai.var_4183a6fc.var_60198839 = 1;
				self.ai.var_4183a6fc.startpos = startpoint;
				self.ai.var_4183a6fc.endpos = endpoint;
				self.ai.var_4183a6fc.var_ef0e5eed = var_ef0e5eed;
				if(startpoint[2] < endpoint[2])
				{
					self.ai.var_4183a6fc.direction = "staircase_up";
				}
				else
				{
					self.ai.var_4183a6fc.direction = "staircase_down";
				}
				return;
			}
		}
	}
	self.ai.var_4183a6fc.var_60198839 = 0;
	self.ai.var_4183a6fc.startpos = undefined;
	self.ai.var_4183a6fc.endpos = undefined;
	self.ai.var_4183a6fc.direction = undefined;
	self.ai.var_4183a6fc.var_ba319abd = undefined;
	self.ai.var_4183a6fc.var_4a6a42e4 = undefined;
}

/*
	Name: function_37ae0b11
	Namespace: aiutility
	Checksum: 0xE8DD7545
	Offset: 0x2738
	Size: 0x4BA
	Parameters: 0
	Flags: Linked, Private
*/
function private function_37ae0b11()
{
	var_25f63bae = self.ai.var_4183a6fc.endpos - self.ai.var_4183a6fc.startpos;
	var_25f63bae = (var_25f63bae[0], var_25f63bae[1], 0);
	var_25f63bae = vectornormalize(var_25f63bae);
	startorigin = self.origin;
	var_c0292a97 = 0;
	if(distance2dsquared(self.origin, self.var_14b548c5) < distance2dsquared(self.origin, self.ai.var_4183a6fc.startpos))
	{
		startorigin = self.var_14b548c5;
		var_c0292a97 = 1;
	}
	dirtogoal = self.ai.var_4183a6fc.endpos - startorigin;
	var_a0bb1f9c = self.ai.var_4183a6fc.startpos - startorigin;
	var_95c1be9 = (var_25f63bae[1], var_25f63bae[0] * -1, 0);
	var_babaf3f3 = startorigin - self.ai.var_4183a6fc.startpos;
	dot = vectordot(var_babaf3f3, var_95c1be9);
	if(var_c0292a97)
	{
		if(dot < -12)
		{
			dot = -12;
		}
		else if(dot > 12)
		{
			dot = 12;
		}
	}
	var_ba319abd = self.ai.var_4183a6fc.startpos + (var_95c1be9 * dot);
	var_92cbdd4c = distance2dsquared(self.var_14b548c5, var_ba319abd);
	var_afc4c793 = distance2dsquared(self.var_14b548c5, self.ai.var_4183a6fc.endpos);
	var_93cae7cc = distance2dsquared(var_ba319abd, self.ai.var_4183a6fc.endpos);
	if(var_92cbdd4c < var_afc4c793 && var_afc4c793 < var_93cae7cc)
	{
		if(vectordot(var_25f63bae, vectornormalize(dirtogoal)) > 0.7)
		{
			self.ai.var_4183a6fc.var_ba319abd = (self.var_14b548c5[0], self.var_14b548c5[1], self.ai.var_4183a6fc.startpos[2]);
			self.ai.var_4183a6fc.var_4a6a42e4 = 1;
		}
		else
		{
			self.ai.var_4183a6fc.var_ba319abd = var_ba319abd;
			self.ai.var_4183a6fc.var_4a6a42e4 = 0;
		}
	}
	else if(!is_true(self.ai.var_4183a6fc.var_4a6a42e4))
	{
		self.ai.var_4183a6fc.var_ba319abd = var_ba319abd;
	}
	if(isdefined(self.ai.var_4183a6fc.var_ba319abd))
	{
		var_48a0209 = distance2dsquared(self.ai.var_4183a6fc.var_ba319abd, self.origin);
		var_b0a0a668 = distance2dsquared(self.origin, self.ai.var_4183a6fc.startpos);
		return min(var_48a0209, var_b0a0a668);
	}
	self.ai.var_4183a6fc.var_ba319abd = undefined;
	return length2dsquared(var_a0bb1f9c);
}

/*
	Name: function_7589776c
	Namespace: aiutility
	Checksum: 0x9C39C94D
	Offset: 0x2C00
	Size: 0x61E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7589776c(behaviortreeentity)
{
	if(!behaviortreeentity function_ab533a33())
	{
		return false;
	}
	if(is_true(behaviortreeentity.var_73e3e2aa))
	{
		return false;
	}
	if(!isdefined(self.ai.var_4183a6fc) || distancesquared(self.ai.var_4183a6fc.goalpos, self.pathgoalpos) > 1)
	{
		self function_bb046570();
	}
	if(isdefined(self.ai.var_4183a6fc) && is_true(self.ai.var_4183a6fc.var_60198839))
	{
		var_4226005f = self function_37ae0b11();
		/#
			if(behaviortreeentity function_3b027260())
			{
				recordcircle(self.origin, 2, (0, 1, 1), "", self);
				recordcircle(self.ai.var_4183a6fc.startpos, 2, (0, 1, 0), "", self);
				recordcircle(self.ai.var_4183a6fc.endpos, 2, (1, 0, 0), "", self);
				if(isdefined(self.ai.var_4183a6fc.var_ba319abd))
				{
					recordcircle(self.ai.var_4183a6fc.var_ba319abd, 2, (1, 0.5, 0), "", self);
				}
				recordcircle(self.var_14b548c5, 3, (0, 0, 1), "", self);
			}
		#/
		if(self.ai.var_4183a6fc.direction == "staircase_down")
		{
			if(var_4226005f <= (max(60, length2dsquared((self getvelocity() * (float(function_60d95f53()) / 1000)) * 2))))
			{
				behaviortreeentity setblackboardattribute("_staircase_direction", self.ai.var_4183a6fc.direction);
				/#
					if(behaviortreeentity function_3b027260())
					{
						record3dtext("" + behaviortreeentity.origin, behaviortreeentity.origin, (1, 0, 0), "", behaviortreeentity);
					}
				#/
				return true;
			}
			/#
				if(behaviortreeentity function_3b027260())
				{
					record3dtext((("" + var_4226005f) + "") + (length2dsquared((self getvelocity() * (float(function_60d95f53()) / 1000)) * 2)) + behaviortreeentity.origin, behaviortreeentity.origin, (1, 0.5, 0), "", behaviortreeentity);
				}
			#/
		}
		else
		{
			if(var_4226005f <= (max(40, length2dsquared((self getvelocity() * (float(function_60d95f53()) / 1000)) * 2))))
			{
				behaviortreeentity setblackboardattribute("_staircase_direction", self.ai.var_4183a6fc.direction);
				/#
					if(behaviortreeentity function_3b027260())
					{
						record3dtext("" + behaviortreeentity.origin, behaviortreeentity.origin, (1, 0, 0), "", behaviortreeentity);
					}
				#/
				return true;
			}
			/#
				if(behaviortreeentity function_3b027260())
				{
					record3dtext((("" + var_4226005f) + "") + (length2dsquared((self getvelocity() * (float(function_60d95f53()) / 1000)) * 2)) + behaviortreeentity.origin, behaviortreeentity.origin, (1, 0.5, 0), "", behaviortreeentity);
				}
			#/
		}
	}
	return false;
}

/*
	Name: function_118d27ad
	Namespace: aiutility
	Checksum: 0x424E9942
	Offset: 0x3228
	Size: 0xF0
	Parameters: 1
	Flags: Linked, Private
*/
function private function_118d27ad(behaviortreeentity)
{
	behaviortreeentity setblackboardattribute("_staircase_state", "staircase_start");
	behaviortreeentity.ai.var_4183a6fc.var_2b01e722 = behaviortreeentity.enableterrainik;
	behaviortreeentity.enableterrainik = 1;
	/#
		if(behaviortreeentity function_3b027260())
		{
			println("", self.ai.var_4183a6fc.direction, "", behaviortreeentity.origin[0], "", behaviortreeentity.origin[1], "", behaviortreeentity.origin[2]);
		}
	#/
	return true;
}

/*
	Name: function_9948d7a
	Namespace: aiutility
	Checksum: 0xC9EFBFAE
	Offset: 0x3320
	Size: 0xBE
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9948d7a(behaviortreeentity)
{
	behaviortreeentity.var_73e3e2aa = 1;
	if(!isdefined(behaviortreeentity getblackboardattribute("_staircase_state")))
	{
		self function_118d27ad(behaviortreeentity);
	}
	behaviortreeentity setblackboardattribute("_staircase_state", "staircase_loop");
	behaviortreeentity.ai.var_4183a6fc.var_ef0e5eed = distance2dsquared(behaviortreeentity.origin, behaviortreeentity.ai.var_4183a6fc.endpos);
	return true;
}

/*
	Name: function_39c609a4
	Namespace: aiutility
	Checksum: 0x6C3FCC71
	Offset: 0x33E8
	Size: 0x310
	Parameters: 1
	Flags: Linked, Private
*/
function private function_39c609a4(behaviortreeentity)
{
	var_ef0e5eed = distance2dsquared(behaviortreeentity.origin, behaviortreeentity.ai.var_4183a6fc.endpos);
	if(behaviortreeentity.ai.var_4183a6fc.direction === "staircase_up")
	{
		if(var_ef0e5eed <= 60 || var_ef0e5eed > behaviortreeentity.ai.var_4183a6fc.var_ef0e5eed)
		{
			/#
				if(behaviortreeentity function_3b027260())
				{
					record3dtext("" + behaviortreeentity.origin, behaviortreeentity.origin, (1, 0.5, 0), "", behaviortreeentity);
					end = behaviortreeentity.ai.var_4183a6fc.endpos;
					println("", behaviortreeentity.origin[0], "", behaviortreeentity.origin[1], "", (((((behaviortreeentity.origin[2] + "") + end[0]) + "") + end[1]) + "") + end[2]);
				}
			#/
			return true;
		}
	}
	else if(var_ef0e5eed <= 30 || var_ef0e5eed > behaviortreeentity.ai.var_4183a6fc.var_ef0e5eed)
	{
		/#
			if(behaviortreeentity function_3b027260())
			{
				record3dtext("" + behaviortreeentity.origin, behaviortreeentity.origin, (1, 0.5, 0), "", behaviortreeentity);
				end = behaviortreeentity.ai.var_4183a6fc.endpos;
				println("", behaviortreeentity.origin[0], "", behaviortreeentity.origin[1], "", (((((behaviortreeentity.origin[2] + "") + end[0]) + "") + end[1]) + "") + end[2]);
			}
		#/
		return true;
	}
	behaviortreeentity.ai.var_4183a6fc.var_ef0e5eed = var_ef0e5eed;
	return false;
}

/*
	Name: function_95b175c0
	Namespace: aiutility
	Checksum: 0xBB5A9F51
	Offset: 0x3700
	Size: 0x148
	Parameters: 1
	Flags: Linked, Private
*/
function private function_95b175c0(behaviortreeentity)
{
	behaviortreeentity.enableterrainik = (isdefined(behaviortreeentity.ai.var_4183a6fc.var_2b01e722) ? behaviortreeentity.ai.var_4183a6fc.var_2b01e722 : 0);
	behaviortreeentity.ai.var_4183a6fc = undefined;
	behaviortreeentity.var_73e3e2aa = undefined;
	/#
		if(behaviortreeentity function_3b027260())
		{
			println("", behaviortreeentity getblackboardattribute(""), "", behaviortreeentity.origin[0], "", behaviortreeentity.origin[1], "", behaviortreeentity.origin[2]);
		}
	#/
	behaviortreeentity setblackboardattribute("_staircase_state", undefined);
	behaviortreeentity setblackboardattribute("_staircase_direction", undefined);
	return true;
}

/*
	Name: locomotionpainbehaviorcondition
	Namespace: aiutility
	Checksum: 0x8720DAC8
	Offset: 0x3850
	Size: 0x44
	Parameters: 1
	Flags: Linked, Private
*/
function private locomotionpainbehaviorcondition(entity)
{
	return entity haspath() && entity hasvalidinterrupt("pain");
}

/*
	Name: clearpathfromscript
	Namespace: aiutility
	Checksum: 0xDCDDE209
	Offset: 0x38A0
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function clearpathfromscript(behaviortreeentity)
{
	behaviortreeentity clearpath();
}

/*
	Name: setdesiredstanceformovement
	Namespace: aiutility
	Checksum: 0xCE4294C1
	Offset: 0x38D0
	Size: 0x5C
	Parameters: 1
	Flags: Linked, Private
*/
function private setdesiredstanceformovement(behaviortreeentity)
{
	if(behaviortreeentity getblackboardattribute("_stance") != "stand")
	{
		behaviortreeentity setblackboardattribute("_desired_stance", "stand");
	}
}

/*
	Name: function_2f14d74f
	Namespace: aiutility
	Checksum: 0x65001C96
	Offset: 0x3938
	Size: 0x54
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2f14d74f(entity)
{
	result = 0;
	if(locomotionshouldtraverse(entity) || locomotionshouldparametrictraverse(entity))
	{
		result = 1;
	}
	return result;
}

/*
	Name: locomotionshouldtraverse
	Namespace: aiutility
	Checksum: 0x512E9E5E
	Offset: 0x3998
	Size: 0xFC
	Parameters: 1
	Flags: Linked, Private
*/
function private locomotionshouldtraverse(behaviortreeentity)
{
	startnode = behaviortreeentity.traversestartnode;
	if(isdefined(startnode) && isdefined(startnode.animscript) && behaviortreeentity shouldstarttraversal())
	{
		behaviortreeentity setblackboardattribute("_staircase_type", startnode.animscript);
		/#
			if(behaviortreeentity function_3b027260())
			{
				print(("" + self.origin) + "");
			}
			record3dtext("" + startnode.animscript, self.origin, (1, 0, 0), "");
		#/
		return true;
	}
	return false;
}

/*
	Name: locomotionshouldparametrictraverse
	Namespace: aiutility
	Checksum: 0x567E83C3
	Offset: 0x3AA0
	Size: 0xFC
	Parameters: 1
	Flags: Linked, Private
*/
function private locomotionshouldparametrictraverse(entity)
{
	if(isdefined(entity.traversestartnode) || entity function_3c566724())
	{
		if(entity shouldstarttraversal())
		{
			traversaltype = entity getblackboardattribute("_parametric_traversal_type");
			/#
				if(entity function_3b027260())
				{
					print(("" + self.origin) + "");
				}
				record3dtext("", self.origin, (1, 0, 0), "");
			#/
			return traversaltype != "unknown_traversal";
		}
	}
	return 0;
}

/*
	Name: function_5ef5b35a
	Namespace: aiutility
	Checksum: 0x42640FA2
	Offset: 0x3BA8
	Size: 0xC4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5ef5b35a(behaviortreeentity)
{
	startnode = behaviortreeentity.traversestartnode;
	if(isdefined(startnode) && behaviortreeentity function_420d1e6b())
	{
		/#
			if(behaviortreeentity function_3b027260())
			{
				print(("" + self.origin) + "");
			}
			record3dtext("", self.origin, (1, 0, 0), "");
		#/
		return true;
	}
	return false;
}

/*
	Name: function_8a8c5d44
	Namespace: aiutility
	Checksum: 0x281295CD
	Offset: 0x3C78
	Size: 0xFC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_8a8c5d44(entity)
{
	if(isdefined(entity.traversestartnode) || entity function_3c566724())
	{
		if(entity function_420d1e6b())
		{
			traversaltype = entity getblackboardattribute("_parametric_traversal_type");
			/#
				if(entity function_3b027260())
				{
					print(("" + self.origin) + "");
				}
				record3dtext("", self.origin, (1, 0, 0), "");
			#/
			return traversaltype != "unknown_traversal";
		}
	}
	return 0;
}

/*
	Name: traversesetup
	Namespace: aiutility
	Checksum: 0x76150303
	Offset: 0x3D80
	Size: 0xE8
	Parameters: 1
	Flags: Linked
*/
function traversesetup(behaviortreeentity)
{
	behaviortreeentity setblackboardattribute("_stance", "stand");
	/#
		if(behaviortreeentity function_3b027260())
		{
			print(("" + behaviortreeentity.origin) + "");
		}
	#/
	if(behaviortreeentity function_3c566724())
	{
		behaviortreeentity setblackboardattribute("_traversal_type", undefined);
	}
	else
	{
		behaviortreeentity setblackboardattribute("_traversal_type", behaviortreeentity.traversestartnode.animscript);
	}
	return true;
}

/*
	Name: traverseactionstart
	Namespace: aiutility
	Checksum: 0x13CC75E8
	Offset: 0x3E70
	Size: 0x240
	Parameters: 2
	Flags: Linked
*/
function traverseactionstart(behaviortreeentity, asmstatename)
{
	traversesetup(behaviortreeentity);
	/#
		if(behaviortreeentity function_3b027260())
		{
			print(("" + behaviortreeentity.origin) + "");
		}
	#/
	if(!isdefined(asmstatename) && isdefined(self.ai.var_2b570fa6))
	{
		asmstatename = self.ai.var_2b570fa6;
	}
	behaviortreeentity.var_efe0efe7 = behaviortreeentity function_b7350442();
	behaviortreeentity.var_846d7e33 = behaviortreeentity function_f650e40b();
	behaviortreeentity allowpitchangle(0);
	behaviortreeentity clearpitchorient();
	/#
		result = behaviortreeentity astsearch(asmstatename);
		if(!isdefined(result[#"animation"]))
		{
			record3dtext("", self.origin + vectorscale((0, 0, 1), 16), (1, 0, 0), "");
		}
		else
		{
			record3dtext("" + (ishash(result[#"animation"]) ? function_9e72a96(result[#"animation"]) : result[#"animation"]), self.origin + vectorscale((0, 0, 1), 16), (1, 0, 0), "");
		}
	#/
	animationstatenetworkutility::requeststate(behaviortreeentity, asmstatename);
	return 5;
}

/*
	Name: wpn_debug_bot_joinleave
	Namespace: aiutility
	Checksum: 0xE816F96
	Offset: 0x40B8
	Size: 0xD6
	Parameters: 2
	Flags: Linked
*/
function wpn_debug_bot_joinleave(behaviortreeentity, asmstatename)
{
	/#
		if(asmstatename function_3b027260())
		{
			print(("" + asmstatename.origin) + "");
		}
	#/
	asmstatename allowpitchangle(is_true(asmstatename.var_efe0efe7));
	if(is_true(asmstatename.var_846d7e33))
	{
		asmstatename setpitchorient();
	}
	asmstatename.var_efe0efe7 = undefined;
	asmstatename.var_846d7e33 = undefined;
	return 4;
}

/*
	Name: disablerepath
	Namespace: aiutility
	Checksum: 0xB3A0C8F7
	Offset: 0x4198
	Size: 0x1A
	Parameters: 1
	Flags: Linked, Private
*/
function private disablerepath(entity)
{
	entity.disablerepath = 1;
}

/*
	Name: enablerepath
	Namespace: aiutility
	Checksum: 0x8F07779C
	Offset: 0x41C0
	Size: 0x16
	Parameters: 1
	Flags: Linked, Private
*/
function private enablerepath(entity)
{
	entity.disablerepath = 0;
}

/*
	Name: shouldstartarrivalcondition
	Namespace: aiutility
	Checksum: 0x5679D651
	Offset: 0x41E0
	Size: 0xB8
	Parameters: 1
	Flags: Linked
*/
function shouldstartarrivalcondition(behaviortreeentity)
{
	var_e05332cd = 0;
	if(function_c94f0d1(behaviortreeentity))
	{
		var_e05332cd = behaviortreeentity shouldstartarrival();
		/#
			if(var_e05332cd && getdvarint(#"ai_debugarrivals", 0))
			{
				record3dtext("", behaviortreeentity.origin, (1, 0.5, 0), "", behaviortreeentity);
			}
		#/
	}
	return var_e05332cd;
}

/*
	Name: function_907ba31a
	Namespace: aiutility
	Checksum: 0xE593009E
	Offset: 0x42A0
	Size: 0x28
	Parameters: 1
	Flags: Linked, Private
*/
function private function_907ba31a(entity)
{
	keepclaimnode(entity);
	return true;
}

/*
	Name: function_37e22c7
	Namespace: aiutility
	Checksum: 0xCFFA2150
	Offset: 0x42D0
	Size: 0x28
	Parameters: 1
	Flags: Linked, Private
*/
function private function_37e22c7(entity)
{
	keepclaimnode(entity);
	return true;
}

/*
	Name: function_c94f0d1
	Namespace: aiutility
	Checksum: 0x601491B4
	Offset: 0x4300
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_c94f0d1(entity)
{
	var_55a3f1d3 = entity function_144f21ef();
	if(var_55a3f1d3 < -60 || var_55a3f1d3 > 60)
	{
		return false;
	}
	return true;
}

/*
	Name: cleararrivalpos
	Namespace: aiutility
	Checksum: 0xD9AF52E5
	Offset: 0x4360
	Size: 0x58
	Parameters: 1
	Flags: Linked
*/
function cleararrivalpos(behaviortreeentity)
{
	if(!isdefined(behaviortreeentity.isarrivalpending) || is_true(behaviortreeentity.isarrivalpending))
	{
		self function_d4c687c9();
	}
	return true;
}

/*
	Name: function_63edf1f4
	Namespace: aiutility
	Checksum: 0xED75786B
	Offset: 0x43C0
	Size: 0x70
	Parameters: 1
	Flags: Linked, Private
*/
function private function_63edf1f4(behaviortreeentity)
{
	if(!isdefined(behaviortreeentity.isarrivalpending) || is_true(behaviortreeentity.isarrivalpending))
	{
		self function_d4c687c9();
	}
	self clearpath();
	return true;
}

/*
	Name: function_41b88b98
	Namespace: aiutility
	Checksum: 0xE4ABF1C3
	Offset: 0x4438
	Size: 0x58
	Parameters: 1
	Flags: Linked, Private
*/
function private function_41b88b98(behaviortreeentity)
{
	if(!isdefined(behaviortreeentity.isarrivalpending) || is_true(behaviortreeentity.isarrivalpending))
	{
		self function_d4c687c9();
	}
	return true;
}

/*
	Name: delaymovement
	Namespace: aiutility
	Checksum: 0x5AAC6B44
	Offset: 0x4498
	Size: 0x48
	Parameters: 1
	Flags: Linked
*/
function delaymovement(entity)
{
	entity pathmode("move delayed", 0, randomfloatrange(1, 2));
	return true;
}

/*
	Name: shouldadjuststanceattacticalwalk
	Namespace: aiutility
	Checksum: 0x1FD4BD50
	Offset: 0x44E8
	Size: 0x50
	Parameters: 1
	Flags: Linked, Private
*/
function private shouldadjuststanceattacticalwalk(behaviortreeentity)
{
	stance = behaviortreeentity getblackboardattribute("_stance");
	if(stance != "stand")
	{
		return true;
	}
	return false;
}

/*
	Name: adjuststancetofaceenemyinitialize
	Namespace: aiutility
	Checksum: 0xBB7B75A
	Offset: 0x4540
	Size: 0x60
	Parameters: 1
	Flags: Linked, Private
*/
function private adjuststancetofaceenemyinitialize(behaviortreeentity)
{
	behaviortreeentity.newenemyreaction = 0;
	behaviortreeentity setblackboardattribute("_desired_stance", "stand");
	behaviortreeentity orientmode("face enemy");
	return true;
}

/*
	Name: adjuststancetofaceenemyterminate
	Namespace: aiutility
	Checksum: 0x59069B47
	Offset: 0x45A8
	Size: 0x34
	Parameters: 1
	Flags: Linked, Private
*/
function private adjuststancetofaceenemyterminate(behaviortreeentity)
{
	behaviortreeentity setblackboardattribute("_stance", "stand");
}

/*
	Name: tacticalwalkactionstart
	Namespace: aiutility
	Checksum: 0x5E882A2B
	Offset: 0x45E8
	Size: 0xA0
	Parameters: 1
	Flags: Linked, Private
*/
function private tacticalwalkactionstart(behaviortreeentity)
{
	cleararrivalpos(behaviortreeentity);
	resetcoverparameters(behaviortreeentity);
	setcanbeflanked(behaviortreeentity, 0);
	behaviortreeentity setblackboardattribute("_stance", "stand");
	behaviortreeentity orientmode("face enemy");
	return true;
}

/*
	Name: validjukedirection
	Namespace: aiutility
	Checksum: 0x50E934D8
	Offset: 0x4690
	Size: 0x128
	Parameters: 4
	Flags: Linked, Private
*/
function private validjukedirection(entity, entitynavmeshposition, forwardoffset, lateraloffset)
{
	jukenavmeshthreshold = 6;
	forwardposition = (entitynavmeshposition.origin + lateraloffset) + forwardoffset;
	backwardposition = (entitynavmeshposition.origin + lateraloffset) - forwardoffset;
	forwardpositionvalid = ispointonnavmesh(forwardposition, entitynavmeshposition) && tracepassedonnavmesh(entitynavmeshposition.origin, forwardposition);
	backwardpositionvalid = ispointonnavmesh(backwardposition, entitynavmeshposition) && tracepassedonnavmesh(entitynavmeshposition.origin, backwardposition);
	if(!isdefined(entitynavmeshposition.ignorebackwardposition))
	{
		return forwardpositionvalid && backwardpositionvalid;
	}
	return forwardpositionvalid;
}

/*
	Name: calculatejukedirection
	Namespace: aiutility
	Checksum: 0x969F1AFC
	Offset: 0x47C8
	Size: 0x2C4
	Parameters: 3
	Flags: Linked
*/
function calculatejukedirection(entity, entityradius, jukedistance)
{
	jukenavmeshthreshold = 30;
	defaultdirection = "forward";
	if(isdefined(entity.defaultjukedirection))
	{
		defaultdirection = entity.defaultjukedirection;
	}
	if(isdefined(entity.enemy))
	{
		navmeshposition = getclosestpointonnavmesh(entity.origin, jukenavmeshthreshold);
		if(!isvec(navmeshposition))
		{
			return defaultdirection;
		}
		vectortoenemy = entity.enemy.origin - entity.origin;
		vectortoenemyangles = vectortoangles(vectortoenemy);
		forwarddistance = anglestoforward(vectortoenemyangles) * entityradius;
		rightjukedistance = anglestoright(vectortoenemyangles) * jukedistance;
		preferleft = undefined;
		if(entity haspath())
		{
			rightposition = entity.origin + rightjukedistance;
			leftposition = entity.origin - rightjukedistance;
			preferleft = distancesquared(leftposition, entity.pathgoalpos) <= distancesquared(rightposition, entity.pathgoalpos);
		}
		else
		{
			preferleft = math::cointoss();
		}
		if(preferleft)
		{
			if(validjukedirection(entity, navmeshposition, forwarddistance, rightjukedistance * -1))
			{
				return "left";
			}
			if(validjukedirection(entity, navmeshposition, forwarddistance, rightjukedistance))
			{
				return "right";
			}
		}
		else
		{
			if(validjukedirection(entity, navmeshposition, forwarddistance, rightjukedistance))
			{
				return "right";
			}
			if(validjukedirection(entity, navmeshposition, forwarddistance, rightjukedistance * -1))
			{
				return "left";
			}
		}
	}
	return defaultdirection;
}

/*
	Name: calculatedefaultjukedirection
	Namespace: aiutility
	Checksum: 0xA605FEF
	Offset: 0x4A98
	Size: 0x7A
	Parameters: 1
	Flags: Linked, Private
*/
function private calculatedefaultjukedirection(entity)
{
	jukedistance = 30;
	entityradius = 15;
	if(isdefined(entity.jukedistance))
	{
		jukedistance = entity.jukedistance;
	}
	if(isdefined(entity.entityradius))
	{
		entityradius = entity.entityradius;
	}
	return calculatejukedirection(entity, entityradius, jukedistance);
}

/*
	Name: canjuke
	Namespace: aiutility
	Checksum: 0x4A195D0D
	Offset: 0x4B20
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function canjuke(entity)
{
	if(isdefined(entity.jukemaxdistance) && isdefined(entity.enemy))
	{
		maxdistsquared = entity.jukemaxdistance * entity.jukemaxdistance;
		if(distance2dsquared(entity.origin, entity.enemy.origin) > maxdistsquared)
		{
			return 0;
		}
	}
	jukedirection = calculatedefaultjukedirection(entity);
	return jukedirection != "forward";
}

/*
	Name: choosejukedirection
	Namespace: aiutility
	Checksum: 0x8C869623
	Offset: 0x4BD8
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function choosejukedirection(entity)
{
	jukedirection = calculatedefaultjukedirection(entity);
	entity setblackboardattribute("_juke_direction", jukedirection);
}

/*
	Name: function_3b027260
	Namespace: aiutility
	Checksum: 0x67756E2F
	Offset: 0x4C30
	Size: 0x50
	Parameters: 0
	Flags: Private
*/
function private function_3b027260()
{
	/#
		return level.var_ace44d97 != 0 && (level.var_ace44d97 == 1 || level.var_ace44d97 == self getentnum());
	#/
}

/*
	Name: function_73bd30d3
	Namespace: aiutility
	Checksum: 0x7E424D11
	Offset: 0x4C90
	Size: 0x24
	Parameters: 1
	Flags: Private
*/
function private function_73bd30d3(params)
{
	/#
		level.var_ace44d97 = params.value;
	#/
}

