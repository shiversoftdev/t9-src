#using scripts\core_common\system_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace wz_perk_bloody_tracker;

/*
	Name: __init__system__
	Namespace: wz_perk_bloody_tracker
	Checksum: 0x32811F9B
	Offset: 0xC8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"wz_perk_bloody_tracker", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: wz_perk_bloody_tracker
	Checksum: 0xA258CE87
	Offset: 0x110
	Size: 0x5C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!is_true(getgametypesetting(#"hash_1d02e28ba907a343")))
	{
		return;
	}
	callback::on_localclient_connect(&on_player_connect);
}

/*
	Name: on_player_connect
	Namespace: wz_perk_bloody_tracker
	Checksum: 0xE8478ADB
	Offset: 0x178
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function on_player_connect(localclientnum)
{
	level thread bloody_tracker(localclientnum);
}

/*
	Name: bloody_tracker
	Namespace: wz_perk_bloody_tracker
	Checksum: 0x6F71B7CA
	Offset: 0x1A8
	Size: 0x1EA
	Parameters: 1
	Flags: None
*/
function bloody_tracker(localclientnum)
{
	while(true)
	{
		wait(0.2);
		if(!function_5778f82(localclientnum, #"specialty_tracker"))
		{
			continue;
		}
		origin = getlocalclientpos(localclientnum);
		players = getplayers(localclientnum);
		players = arraysortclosest(players, origin, undefined, 1, 6000);
		tracked = 0;
		foreach(player in players)
		{
			if(tracked >= 10 || !isalive(player) || player function_ca024039() || isdefined(getplayervehicle(player)))
			{
				player.tracker_last_pos = undefined;
				continue;
			}
			tracked++;
			if(!isdefined(player.tracker_last_pos))
			{
				player.tracker_last_pos = player.origin;
			}
			positionandrotationstruct = player gettrackerfxposition(localclientnum);
			if(isdefined(positionandrotationstruct))
			{
				player tracker_playfx(localclientnum, positionandrotationstruct);
			}
		}
		players = undefined;
	}
}

/*
	Name: gettrackerfxposition
	Namespace: wz_perk_bloody_tracker
	Checksum: 0x1EC0B9B
	Offset: 0x3A0
	Size: 0x2DE
	Parameters: 1
	Flags: None
*/
function gettrackerfxposition(localclientnum)
{
	positionandrotation = undefined;
	player = self;
	offset = (0, 0, 1);
	dist2 = 1024;
	if(is_true(self.trailrightfoot))
	{
		fx = "player/fx8_plyr_footstep_tracker_blood_r";
	}
	else
	{
		fx = "player/fx8_plyr_footstep_tracker_blood_l";
	}
	pos = self.origin + offset;
	if(distancesquared(self.tracker_last_pos, pos) > dist2)
	{
		trace = physicstraceex(pos, pos + (vectorscale((0, 0, -1), 10)), (0, 0, 0), (0, 0, 0), self, 1);
		if(trace[#"fraction"] < 1)
		{
			up = trace[#"normal"];
			up = (0, 0, 0) - up;
			if(lengthsquared(up) <= 0)
			{
				return undefined;
			}
			fwd = anglestoforward(self.angles);
			vel = self getvelocity();
			if(lengthsquared(vel) > 1)
			{
				fwd = vel;
			}
			right = vectorcross(fwd, up);
			if(lengthsquared(right) <= 0)
			{
				return undefined;
			}
			fwd = vectorcross(up, right);
			pos = trace[#"position"] + trace[#"normal"];
			positionandrotation = spawnstruct();
			positionandrotation.fx = fx;
			positionandrotation.pos = pos;
			positionandrotation.fwd = fwd;
			positionandrotation.up = up;
			self.tracker_last_pos = self.origin;
			if(is_true(self.trailrightfoot))
			{
				self.trailrightfoot = 0;
			}
			else
			{
				self.trailrightfoot = 1;
			}
		}
	}
	return positionandrotation;
}

/*
	Name: tracker_playfx
	Namespace: wz_perk_bloody_tracker
	Checksum: 0x29FFDF13
	Offset: 0x688
	Size: 0x56
	Parameters: 2
	Flags: None
*/
function tracker_playfx(localclientnum, positionandrotationstruct)
{
	handle = playfx(localclientnum, positionandrotationstruct.fx, positionandrotationstruct.pos, positionandrotationstruct.fwd, positionandrotationstruct.up);
}

