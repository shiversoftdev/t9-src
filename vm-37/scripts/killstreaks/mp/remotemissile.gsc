#using script_396f7d71538c9677;
#using scripts\core_common\battlechatter.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\killstreaks\remotemissile_shared.gsc;

#namespace remotemissile;

/*
	Name: __init__system__
	Namespace: remotemissile
	Checksum: 0x399FF803
	Offset: 0xE8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"remotemissile", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: remotemissile
	Checksum: 0x4D408218
	Offset: 0x138
	Size: 0x9C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	bundlename = "killstreak_remote_missile";
	if(sessionmodeiswarzonegame())
	{
		bundlename = bundlename + "_wz";
	}
	init_shared(bundlename);
	level.var_5951cb24 = &function_5951cb24;
	level.var_dab39bb8 = &function_dab39bb8;
	level.var_feddd85a = &function_feddd85a;
}

/*
	Name: function_5951cb24
	Namespace: remotemissile
	Checksum: 0xF8BCCB12
	Offset: 0x1E0
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_5951cb24(killstreak_id, team)
{
	self thread battlechatter::function_fff18afc("callInRemoteMissile", "callInFutzRemoteMissile");
}

/*
	Name: function_dab39bb8
	Namespace: remotemissile
	Checksum: 0x58CC1C5C
	Offset: 0x228
	Size: 0x1B8
	Parameters: 1
	Flags: Linked
*/
function function_dab39bb8(rocket)
{
	self endon(#"remotemissile_done");
	rocket endon(#"death");
	self.owner endon(#"death", #"disconnect");
	var_b5e50364 = 0;
	while(!var_b5e50364)
	{
		if(!isdefined(self.owner))
		{
			return;
		}
		enemy = self.owner battlechatter::get_closest_player_enemy(self.origin, 1);
		if(!isdefined(enemy))
		{
			return;
		}
		eyepoint = enemy geteye();
		relativepos = vectornormalize(self.origin - eyepoint);
		dir = anglestoforward(enemy getplayerangles());
		dotproduct = vectordot(relativepos, dir);
		if(dotproduct > 0 && sighttracepassed(self.origin, eyepoint, 1, enemy, self))
		{
			enemy thread battlechatter::playkillstreakthreat("remote_missile");
			var_b5e50364 = 1;
		}
		wait(0.1);
	}
}

/*
	Name: function_feddd85a
	Namespace: remotemissile
	Checksum: 0x57A07F8C
	Offset: 0x3E8
	Size: 0x34
	Parameters: 2
	Flags: Linked
*/
function function_feddd85a(attacker, weapon)
{
	weapon battlechatter::function_eebf94f6("remote_missile");
}

