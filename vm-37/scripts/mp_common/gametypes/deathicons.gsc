#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace deathicons;

/*
	Name: function_89f2df9
	Namespace: deathicons
	Checksum: 0x3F9154ED
	Offset: 0xA8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"deathicons", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: deathicons
	Checksum: 0x27515BEF
	Offset: 0xF0
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
	Checksum: 0x6E507E51
	Offset: 0x140
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
	Checksum: 0x14547BF
	Offset: 0x188
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
	Offset: 0x1A0
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
	Checksum: 0x884B82C2
	Offset: 0x1B0
	Size: 0x24C
	Parameters: 3
	Flags: Linked
*/
function add(entity, dyingplayer, team)
{
	if(!level.teambased)
	{
		return;
	}
	if(is_true(dyingplayer.isjammed))
	{
		return;
	}
	timeout = getdvarfloat(#"scr_deathicon_time", 5);
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
	if(getdvarint(#"ui_hud_showdeathicons", 1) == 0)
	{
		return;
	}
	if(level.hardcoremode)
	{
		return;
	}
	objectivename = (function_f99d2668() ? #"hash_2fc33ea98b703187" : #"headicon_dead");
	deathiconobjid = gameobjects::get_next_obj_id();
	objective_add(deathiconobjid, "active", iconorg, objectivename, dyingplayer);
	objective_setteam(deathiconobjid, team);
	function_4339912c(deathiconobjid);
	function_29ef32ee(deathiconobjid, team);
	level thread destroy_slowly(timeout, deathiconobjid);
}

/*
	Name: destroy_slowly
	Namespace: deathicons
	Checksum: 0x93C9057F
	Offset: 0x408
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
	Checksum: 0xF5AF7628
	Offset: 0x480
	Size: 0xD4
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
			thread add(body, self, self.team);
		}
		return true;
	}
	return false;
}

