#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace deathicons;

/*
	Name: function_63a17634
	Namespace: deathicons
	Checksum: 0x6480F2B
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_63a17634()
{
	level notify(1445306313);
}

/*
	Name: __init__system__
	Namespace: deathicons
	Checksum: 0x40894FF3
	Offset: 0xC8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"deathicons", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: deathicons
	Checksum: 0xC4F7BAA8
	Offset: 0x110
	Size: 0x44
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_start_gametype(&init);
	callback::on_connect(&on_player_connect);
}

/*
	Name: init
	Namespace: deathicons
	Checksum: 0x4EADEAA3
	Offset: 0x160
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	if(!isdefined(level.ragdoll_override))
	{
		level.ragdoll_override = &ragdoll_override;
	}
	if(!level.teambased)
	{
		return;
	}
}

/*
	Name: on_player_connect
	Namespace: deathicons
	Checksum: 0x85391FBF
	Offset: 0x1A8
	Size: 0xE
	Parameters: 0
	Flags: Linked
*/
function on_player_connect()
{
	self.selfdeathicons = [];
}

/*
	Name: update_enabled
	Namespace: deathicons
	Checksum: 0x80F724D1
	Offset: 0x1C0
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function update_enabled()
{
}

/*
	Name: add
	Namespace: deathicons
	Checksum: 0x90A785EA
	Offset: 0x1D0
	Size: 0x19C
	Parameters: 4
	Flags: Linked
*/
function add(entity, dyingplayer, team, timeout)
{
	if(!level.teambased)
	{
		return;
	}
	iconorg = entity.origin;
	dyingplayer endon(#"spawned_player", #"disconnect");
	waitframe(1);
	util::waittillslowprocessallowed();
	/#
		assert(isdefined(level.teams[team]));
	#/
	/#
		assert(isdefined(level.teamindex[team]));
	#/
	if(!getdvarint(#"ui_hud_showdeathicons", 1))
	{
		return;
	}
	if(level.hardcoremode)
	{
		return;
	}
	deathiconobjid = gameobjects::get_next_obj_id();
	objective_add(deathiconobjid, "active", iconorg, #"headicon_dead");
	objective_setteam(deathiconobjid, team);
	level thread destroy_slowly(timeout, deathiconobjid);
}

/*
	Name: destroy_slowly
	Namespace: deathicons
	Checksum: 0xADD0D573
	Offset: 0x378
	Size: 0x6C
	Parameters: 2
	Flags: Linked
*/
function destroy_slowly(timeout, deathiconobjid)
{
	wait(timeout);
	objective_setstate(deathiconobjid, "done");
	wait(1);
	objective_delete(deathiconobjid);
	gameobjects::release_obj_id(deathiconobjid);
}

/*
	Name: ragdoll_override
	Namespace: deathicons
	Checksum: 0xA6313DC1
	Offset: 0x3F0
	Size: 0xDC
	Parameters: 10
	Flags: Linked
*/
function ragdoll_override(idamage, smeansofdeath, weapon, shitloc, vdir, vattackerorigin, deathanimduration, einflictor, ragdoll_jib, body)
{
	if(ragdoll_jib == "MOD_FALLING" && self isonground() == 1)
	{
		body startragdoll();
		if(!isdefined(self.switching_teams))
		{
			thread add(body, self, self.team, 5);
		}
		return true;
	}
	return false;
}

