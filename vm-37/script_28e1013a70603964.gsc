#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace namespace_ae89c65;

/*
	Name: function_89f2df9
	Namespace: namespace_ae89c65
	Checksum: 0x3081632
	Offset: 0x88
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_1a2c7d30c76b0412", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_ae89c65
	Checksum: 0x51733B3A
	Offset: 0xD0
	Size: 0x5C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(is_true(getgametypesetting(#"hash_1d02e28ba907a343")))
	{
		return;
	}
	callback::on_localclient_connect(&on_player_connect);
}

/*
	Name: on_player_connect
	Namespace: namespace_ae89c65
	Checksum: 0x60070802
	Offset: 0x138
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function on_player_connect(localclientnum)
{
	level thread tracker(localclientnum);
}

/*
	Name: tracker
	Namespace: namespace_ae89c65
	Checksum: 0x4BE12D73
	Offset: 0x168
	Size: 0x20A
	Parameters: 1
	Flags: None
*/
function tracker(localclientnum)
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
			if(tracked >= 10 || !isalive(player) || player function_ca024039() || isdefined(getplayervehicle(player)) || player hasperk(localclientnum, "specialty_spycraft"))
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
	Namespace: namespace_ae89c65
	Checksum: 0xAB031FA1
	Offset: 0x380
	Size: 0x26E
	Parameters: 1
	Flags: None
*/
function gettrackerfxposition(localclientnum)
{
	positionandrotation = undefined;
	offset = (0, 0, getdvarfloat(#"perk_tracker_fx_foot_height", 0));
	dist2 = 1024;
	if(is_true(self.trailrightfoot))
	{
		fx = #"player/fx9_perk_tracker_footstep_rgt";
	}
	else
	{
		fx = #"player/fx9_perk_tracker_footstep_lft";
	}
	pos = self.origin + offset;
	fwd = anglestoforward(self.angles);
	right = anglestoright(self.angles);
	up = anglestoup(self.angles);
	vel = self getvelocity();
	if(lengthsquared(vel) > 1)
	{
		up = vectorcross(vel, right);
		if(lengthsquared(up) < 0.0001)
		{
			up = vectorcross(fwd, vel);
		}
		fwd = vel;
	}
	if(distancesquared(self.tracker_last_pos, pos) > dist2)
	{
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
	return positionandrotation;
}

/*
	Name: tracker_playfx
	Namespace: namespace_ae89c65
	Checksum: 0x2E62859
	Offset: 0x5F8
	Size: 0x56
	Parameters: 2
	Flags: None
*/
function tracker_playfx(localclientnum, positionandrotationstruct)
{
	handle = playfx(localclientnum, positionandrotationstruct.fx, positionandrotationstruct.pos, positionandrotationstruct.fwd, positionandrotationstruct.up);
}

