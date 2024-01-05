#using scripts\mp_common\player\player_record.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using script_1d29de500c266470;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\match_record.gsc;
#using scripts\core_common\loot_tracking.gsc;
#using script_32c8b5b0eb2854f3;
#using scripts\core_common\contracts_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace wz_medals;

/*
	Name: __init__system__
	Namespace: wz_medals
	Checksum: 0xA04850D0
	Offset: 0xD8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"wz_medals", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: wz_medals
	Checksum: 0xA21AEDC6
	Offset: 0x120
	Size: 0x44
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	callback::on_revived(&function_843da215);
	callback::on_player_killed(&function_f4837321);
}

/*
	Name: function_843da215
	Namespace: wz_medals
	Checksum: 0xBFFF481E
	Offset: 0x170
	Size: 0xE4
	Parameters: 1
	Flags: None
*/
function function_843da215(params)
{
	if(!gamestate::is_state(#"playing") || !isplayer(params.reviver) || !isdefined(params.attacker))
	{
		return;
	}
	if(params.attacker.team === params.reviver.team)
	{
		return;
	}
	weapon = getweapon(#"bare_hands");
	scoreevents::processscoreevent(#"revives", params.reviver, undefined, weapon);
}

/*
	Name: function_f4837321
	Namespace: wz_medals
	Checksum: 0xD4BD055
	Offset: 0x260
	Size: 0x104
	Parameters: 1
	Flags: None
*/
function function_f4837321(params)
{
	if(!isdefined(self.laststandparams) || !isdefined(self.var_a1d415ee))
	{
		return;
	}
	original_attacker = self.laststandparams.attacker;
	var_8efbdcbb = self.var_a1d415ee.attacker;
	weapon = self.laststandparams.weapon;
	if(!isdefined(original_attacker) || !isplayer(var_8efbdcbb) || !isdefined(weapon))
	{
		return;
	}
	if(var_8efbdcbb.team === self.team)
	{
		return;
	}
	if(original_attacker != var_8efbdcbb)
	{
		scoreevents::processscoreevent(#"assists", var_8efbdcbb, undefined, weapon);
	}
}

