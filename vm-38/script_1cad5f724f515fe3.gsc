#using script_59f07c660e6710a5;
#using scripts\core_common\ai_shared.gsc;

#namespace archetype_human_blackboard;

/*
	Name: function_a2ab9f0e
	Namespace: archetype_human_blackboard
	Checksum: 0x461B5419
	Offset: 0x160
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a2ab9f0e()
{
	level notify(177876212);
}

#namespace blackboard;

/*
	Name: bb_getarrivaltype
	Namespace: blackboard
	Checksum: 0xFE5225B
	Offset: 0x180
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
	Checksum: 0xC0D489A
	Offset: 0x1C0
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
	Checksum: 0xBF972E2E
	Offset: 0x208
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
	Checksum: 0x16D14C8
	Offset: 0x380
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
		if(covernode.type == #"hash_7a0e62fbbe3989d4")
		{
			return covermode == "cover_blind";
		}
		if(covernode.type == #"hash_63cbb4767da2a801" || covernode.type == #"hash_2a7b1ca393696762")
		{
			return covermode == "cover_blind" || covermode == "cover_over";
		}
		if(covernode.type == #"hash_581529fff05853f0" || covernode.type == #"hash_1bb444d857814e92" || (covernode.type == #"hash_6d8019ab9d39bf96" || covernode.type == #"hash_280d1247a6abdbae" || covernode.type == #"hash_171465527444ed14"))
		{
			return "flankable";
		}
	}
	return "unflankable";
}

