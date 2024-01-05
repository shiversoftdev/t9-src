#using script_243ea03c7a285692;
#using scripts\core_common\util_shared.gsc;

#namespace laststand;

/*
	Name: player_is_in_laststand
	Namespace: laststand
	Checksum: 0x42132075
	Offset: 0x70
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function player_is_in_laststand()
{
	return is_true(self.laststand);
}

/*
	Name: player_num_in_laststand
	Namespace: laststand
	Checksum: 0xA7BB8887
	Offset: 0x98
	Size: 0x6E
	Parameters: 0
	Flags: Linked
*/
function player_num_in_laststand()
{
	num = 0;
	players = getplayers();
	for(i = 0; i < players.size; i++)
	{
		if(players[i] player_is_in_laststand())
		{
			num++;
		}
	}
	return num;
}

/*
	Name: player_all_players_in_laststand
	Namespace: laststand
	Checksum: 0x2017765B
	Offset: 0x110
	Size: 0x26
	Parameters: 0
	Flags: None
*/
function player_all_players_in_laststand()
{
	return player_num_in_laststand() == getplayers().size;
}

/*
	Name: player_any_player_in_laststand
	Namespace: laststand
	Checksum: 0x23B44057
	Offset: 0x140
	Size: 0x16
	Parameters: 0
	Flags: Linked
*/
function player_any_player_in_laststand()
{
	return player_num_in_laststand() > 0;
}

/*
	Name: function_7fb2bbfc
	Namespace: laststand
	Checksum: 0x6A38E0A6
	Offset: 0x160
	Size: 0xF2
	Parameters: 0
	Flags: Linked
*/
function function_7fb2bbfc()
{
	var_5eb47b1d = [];
	foreach(player in function_a1ef346b())
	{
		if(!player inlaststand())
		{
			if(!isdefined(var_5eb47b1d))
			{
				var_5eb47b1d = [];
			}
			else if(!isarray(var_5eb47b1d))
			{
				var_5eb47b1d = array(var_5eb47b1d);
			}
			var_5eb47b1d[var_5eb47b1d.size] = player;
		}
	}
	return var_5eb47b1d;
}

/*
	Name: is_facing
	Namespace: laststand
	Checksum: 0x5A00154B
	Offset: 0x260
	Size: 0x124
	Parameters: 2
	Flags: Linked
*/
function is_facing(facee, requireddot)
{
	if(!isdefined(requireddot))
	{
		requireddot = 0.9;
	}
	orientation = self getplayerangles();
	forwardvec = anglestoforward(orientation);
	forwardvec2d = (forwardvec[0], forwardvec[1], 0);
	unitforwardvec2d = vectornormalize(forwardvec2d);
	tofaceevec = facee.origin - self.origin;
	tofaceevec2d = (tofaceevec[0], tofaceevec[1], 0);
	unittofaceevec2d = vectornormalize(tofaceevec2d);
	dotproduct = vectordot(unitforwardvec2d, unittofaceevec2d);
	return dotproduct > requireddot;
}

/*
	Name: revive_hud_create
	Namespace: laststand
	Checksum: 0xFE74F82B
	Offset: 0x390
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function revive_hud_create()
{
	/#
		assert(isdefined(level.revive_hud));
	#/
	if(!level.revive_hud revive_hud::is_open(self))
	{
		level.revive_hud revive_hud::open(self, (1 | 2) | 4);
	}
	self thread function_7c7d873();
}

/*
	Name: function_7c7d873
	Namespace: laststand
	Checksum: 0xA8008829
	Offset: 0x428
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function function_7c7d873()
{
	waitframe(1);
	self function_f5714974();
}

/*
	Name: revive_hud_show_n_fade
	Namespace: laststand
	Checksum: 0x707A8D2E
	Offset: 0x450
	Size: 0x13C
	Parameters: 3
	Flags: Linked
*/
function revive_hud_show_n_fade(text, time, player)
{
	if(!isdefined(player))
	{
		player = undefined;
	}
	if(!is_true(level.var_dc60105c) && isdefined(level.revive_hud) && level.revive_hud revive_hud::is_open(self))
	{
		level.revive_hud revive_hud::set_fadetime(self, 0);
		util::wait_network_frame();
		if(!isdefined(self))
		{
			return;
		}
		level.revive_hud revive_hud::set_text(self, text);
		if(isdefined(player))
		{
			level.revive_hud revive_hud::set_clientnum(self, player getentitynumber());
		}
		level.revive_hud revive_hud::set_fadetime(self, int(time * 10));
	}
}

/*
	Name: function_f5714974
	Namespace: laststand
	Checksum: 0x64BC10C2
	Offset: 0x598
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function function_f5714974()
{
	if(isdefined(self) && isdefined(level.revive_hud) && level.revive_hud revive_hud::is_open(self))
	{
		level.revive_hud revive_hud::set_fadetime(self, 0);
	}
}

/*
	Name: drawcylinder
	Namespace: laststand
	Checksum: 0x736BC32C
	Offset: 0x600
	Size: 0x234
	Parameters: 3
	Flags: None
*/
function drawcylinder(pos, rad, height)
{
	/#
		currad = rad;
		curheight = height;
		for(r = 0; r < 20; r++)
		{
			theta = (r / 20) * 360;
			theta2 = ((r + 1) / 20) * 360;
			line(pos + (cos(theta) * currad, sin(theta) * currad, 0), pos + (cos(theta2) * currad, sin(theta2) * currad, 0));
			line(pos + (cos(theta) * currad, sin(theta) * currad, curheight), pos + (cos(theta2) * currad, sin(theta2) * currad, curheight));
			line(pos + (cos(theta) * currad, sin(theta) * currad, 0), pos + (cos(theta) * currad, sin(theta) * currad, curheight));
		}
	#/
}

/*
	Name: function_d4c9e1b5
	Namespace: laststand
	Checksum: 0x54E622ED
	Offset: 0x840
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function function_d4c9e1b5()
{
	self endon(#"player_revived", #"player_suicide", #"bled_out");
	self waittill(#"disconnect");
	if(isdefined(self.revivetrigger))
	{
		self.revivetrigger delete();
	}
}

