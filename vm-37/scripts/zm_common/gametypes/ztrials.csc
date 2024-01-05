#using scripts\zm_common\zm_trial.csc;
#using script_45657e86e8f90414;
#using script_1793e0dffb81a6c8;
#using script_70ab01a7690ea256;
#using scripts\zm_common\trials\zm_trial_disable_hud.csc;
#using scripts\zm_common\trials\zm_trial_disable_buys.csc;
#using script_5afd8ff8f8304cc4;
#using scripts\zm_common\zm_trial_util.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\struct.csc;

#namespace ztrials;

/*
	Name: main
	Namespace: ztrials
	Checksum: 0xC421CDDB
	Offset: 0xB0
	Size: 0x84
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	level._zombie_gamemodeprecache = &onprecachegametype;
	level._zombie_gamemodemain = &onstartgametype;
	level flag::init(#"ztrial", 1);
	/#
		println("");
	#/
}

/*
	Name: onprecachegametype
	Namespace: ztrials
	Checksum: 0xC76FC5FC
	Offset: 0x140
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function onprecachegametype()
{
	/#
		println("");
	#/
}

/*
	Name: onstartgametype
	Namespace: ztrials
	Checksum: 0xEF611D8C
	Offset: 0x170
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function onstartgametype()
{
	/#
		println("");
	#/
}

/*
	Name: function_df05c5d
	Namespace: ztrials
	Checksum: 0x871859D3
	Offset: 0x1A0
	Size: 0x5C
	Parameters: 1
	Flags: Private, Event
*/
event private function_df05c5d(eventstruct)
{
	if(namespace_fcd611c3::is_active() && self namespace_fcd611c3::function_26f124d8())
	{
		return;
	}
	self thread zm_trial_util::function_97444b02(eventstruct.localclientnum);
}

