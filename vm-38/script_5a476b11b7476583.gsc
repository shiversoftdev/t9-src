#using script_59f07c660e6710a5;
#using script_6809bf766eba194a;
#using script_75ce7fc4212a82af;

#namespace archetype_human_interface;

/*
	Name: function_bca0b02c
	Namespace: archetype_human_interface
	Checksum: 0x5C548477
	Offset: 0x178
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_bca0b02c()
{
	level notify(1558802148);
}

#namespace humaninterface;

/*
	Name: registerhumaninterfaceattributes
	Namespace: humaninterface
	Checksum: 0x4BDD268F
	Offset: 0x198
	Size: 0x4EC
	Parameters: 0
	Flags: Linked
*/
function registerhumaninterfaceattributes()
{
	ai::registermatchedinterface(#"human", #"can_be_meleed", 1, array(1, 0), &aiutility::meleeattributescallback);
	ai::registermatchedinterface(#"human", #"can_melee", 1, array(1, 0), &aiutility::meleeattributescallback);
	ai::registermatchedinterface(#"human", #"can_initiateaivsaimelee", 1, array(1, 0));
	ai::registermatchedinterface(#"human", #"coveridleonly", 0, array(1, 0));
	ai::registermatchedinterface(#"human", #"useanimationoverride", 0, array(1, 0), &humansoldierserverutils::useanimationoverridecallback);
	ai::registermatchedinterface(#"human", #"disablearrivals", 0, array(1, 0), &aiutility::arrivalattributescallback);
	ai::registermatchedinterface(#"human", #"disablepeek", 0, array(1, 0), &aiutility::function_eef4346c);
	ai::registermatchedinterface(#"human", #"disablelean", 0, array(1, 0), &aiutility::function_1cd75f29);
	ai::registermatchedinterface(#"human", #"disablereload", 0, array(1, 0), &aiutility::function_a626b1a9);
	ai::registermatchedinterface(#"human", #"stealth", 0, array(1, 0));
	ai::registermatchedinterface(#"human", #"vignette_mode", "off", array("off", "slow", "fast"), &humansoldierserverutils::vignettemodecallback);
	ai::registermatchedinterface(#"human", #"usegrenades", 1, array(1, 0));
	ai::registermatchedinterface(#"human", #"demeanor", "combat", array("combat", "patrol", "cqb", "alert"), &humansoldierserverutils::function_20fdb709);
	ai::registermatchedinterface(#"human", #"hash_1e055d856280060c", "none", array("none", "ads", "up", "down"), &humansoldierserverutils::function_beabbc97);
}

#namespace humansoldierserverutils;

/*
	Name: useanimationoverridecallback
	Namespace: humansoldierserverutils
	Checksum: 0x4CF5BAEA
	Offset: 0x690
	Size: 0x64
	Parameters: 4
	Flags: Linked
*/
function useanimationoverridecallback(entity, attribute, oldvalue, value)
{
	if(value)
	{
		oldvalue asmchangeanimmappingtable(1);
	}
	else
	{
		oldvalue asmchangeanimmappingtable(0);
	}
}

/*
	Name: vignettemodecallback
	Namespace: humansoldierserverutils
	Checksum: 0x78AA2B95
	Offset: 0x700
	Size: 0x19A
	Parameters: 4
	Flags: Linked
*/
function vignettemodecallback(entity, attribute, oldvalue, value)
{
	switch(value)
	{
		case "off":
		{
			oldvalue.pushable = 1;
			oldvalue collidewithactors(0);
			oldvalue pushplayer(0);
			oldvalue setavoidancemask("avoid all");
			break;
		}
		case "slow":
		{
			oldvalue.pushable = 0;
			oldvalue collidewithactors(0);
			oldvalue pushplayer(1);
			oldvalue setavoidancemask("avoid ai");
			break;
		}
		case "fast":
		{
			oldvalue.pushable = 0;
			oldvalue collidewithactors(1);
			oldvalue pushplayer(1);
			oldvalue setavoidancemask("avoid none");
			break;
		}
		default:
		{
			break;
		}
	}
}

/*
	Name: function_20fdb709
	Namespace: humansoldierserverutils
	Checksum: 0x519075EB
	Offset: 0x8A8
	Size: 0x17A
	Parameters: 4
	Flags: Linked
*/
function function_20fdb709(entity, attribute, oldvalue, value)
{
	if(value === oldvalue)
	{
		return;
	}
	attribute setblackboardattribute("_human_prev_demeanor", oldvalue);
	switch(value)
	{
		case "combat":
		{
			attribute setblackboardattribute("_human_demeanor", "COMBAT");
			break;
		}
		case "patrol":
		{
			attribute setblackboardattribute("_human_demeanor", "PATROL");
			break;
		}
		case "cqb":
		{
			attribute setblackboardattribute("_human_demeanor", "CQB");
			break;
		}
		case "alert":
		{
			attribute setblackboardattribute("_human_demeanor", "ALERT");
			break;
		}
		default:
		{
			attribute setblackboardattribute("_human_demeanor", "COMBAT");
			break;
		}
	}
}

/*
	Name: function_beabbc97
	Namespace: humansoldierserverutils
	Checksum: 0x337FD005
	Offset: 0xA30
	Size: 0x132
	Parameters: 4
	Flags: Linked
*/
function function_beabbc97(entity, attribute, oldvalue, value)
{
	if(value === oldvalue)
	{
		return;
	}
	switch(value)
	{
		case "ads":
		{
			attribute setblackboardattribute("_aim_overlay", "ADS");
			break;
		}
		case "up":
		{
			attribute setblackboardattribute("_aim_overlay", "UP");
			break;
		}
		case "down":
		{
			attribute setblackboardattribute("_aim_overlay", "DOWN");
			break;
		}
		case "none":
		default:
		{
			attribute setblackboardattribute("_aim_overlay", "NONE");
			break;
		}
	}
}

