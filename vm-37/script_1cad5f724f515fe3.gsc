#using script_59f07c660e6710a5;
#using scripts\core_common\ai_shared.gsc;

#namespace blackboard;

/*
	Name: bb_getarrivaltype
	Namespace: blackboard
	Checksum: 0xA85DBEFA
	Offset: 0x160
	Size: 0x36
	Parameters: 0
	Flags: Linked, Private
*/
function private bb_getarrivaltype()
{
	if(self ai::get_behavior_attribute("disablearrivals"))
	{
		return "dont_arrive_at_goal";
	}
	return "arrive_at_goal";
}

/*
	Name: bb_gettacticalarrivalfacingyaw
	Namespace: blackboard
	Checksum: 0x2BB40739
	Offset: 0x1A0
	Size: 0x3A
	Parameters: 0
	Flags: Linked, Private
*/
function private bb_gettacticalarrivalfacingyaw()
{
	return angleclamp180(self.angles[1] - self.node.angles[1]);
}

/*
	Name: bb_getlocomotionmovementtype
	Namespace: blackboard
	Checksum: 0x9322B0A7
	Offset: 0x1E8
	Size: 0x16E
	Parameters: 0
	Flags: Linked, Private
*/
function private bb_getlocomotionmovementtype()
{
	if(!isdefined(self.nearbyfriendlycheck))
	{
		self.nearbyfriendlycheck = 0;
	}
	now = gettime();
	if(now >= self.nearbyfriendlycheck)
	{
		self.nearbyfriendlycount = getactorteamcountradius(self.origin, 120, self.team, #"neutral");
		self.nearbyfriendlycheck = now + 500;
	}
	if(self.nearbyfriendlycount >= 3)
	{
		return "human_locomotion_movement_default";
	}
	if(isdefined(self.enemy) && isdefined(self.runandgundist))
	{
		if(distancesquared(self.origin, self lastknownpos(self.enemy)) > self.runandgundist * self.runandgundist)
		{
			return "human_locomotion_movement_sprint";
		}
	}
	else if(isdefined(self.goalpos) && isdefined(self.runandgundist))
	{
		if(distancesquared(self.origin, self.goalpos) > self.runandgundist * self.runandgundist)
		{
			return "human_locomotion_movement_sprint";
		}
	}
	return "human_locomotion_movement_default";
}

/*
	Name: bb_getcoverflankability
	Namespace: blackboard
	Checksum: 0x60F25F31
	Offset: 0x360
	Size: 0x1FA
	Parameters: 0
	Flags: Linked, Private
*/
function private bb_getcoverflankability()
{
	if(self asmistransitionrunning())
	{
		return "unflankable";
	}
	if(!isdefined(self.node))
	{
		return "unflankable";
	}
	covermode = self getblackboardattribute("_cover_mode");
	if(isdefined(covermode))
	{
		covernode = self.node;
		if(covermode == "cover_alert" || covermode == "cover_mode_none")
		{
			return "flankable";
		}
		if(covernode.type == #"cover pillar")
		{
			return covermode == "cover_blind";
		}
		if(covernode.type == #"cover left" || covernode.type == #"cover right")
		{
			return covermode == "cover_blind" || covermode == "cover_over";
		}
		if(covernode.type == #"cover stand" || covernode.type == #"conceal stand" || (covernode.type == #"cover crouch" || covernode.type == #"cover crouch window" || covernode.type == #"conceal crouch"))
		{
			return "flankable";
		}
	}
	return "unflankable";
}

