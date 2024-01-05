#using scripts\core_common\struct.gsc;
#using script_35598499769dbb3d;
#using scripts\core_common\ai\zombie_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace zombie_utility;

/*
	Name: zombiespawnsetup
	Namespace: zombie_utility
	Checksum: 0x10460918
	Offset: 0x490
	Size: 0xFA
	Parameters: 0
	Flags: Linked
*/
function zombiespawnsetup()
{
	self.zombie_move_speed = "walk";
	if(!isdefined(self.zombie_arms_position))
	{
		if(randomint(3) == 0)
		{
			self.zombie_arms_position = "up";
		}
		else
		{
			self.zombie_arms_position = "down";
		}
	}
	self function_df5afb5e(0);
	if(!is_true(self.ai.var_870d0893))
	{
		self setavoidancemask("avoid none");
	}
	self collidewithactors(1);
	clientfield::set("zombie", 1);
	self.ignorepathenemyfightdist = 1;
}

/*
	Name: get_closest_valid_player
	Namespace: zombie_utility
	Checksum: 0x9FD6FE28
	Offset: 0x598
	Size: 0x25C
	Parameters: 3
	Flags: Linked
*/
function get_closest_valid_player(origin, ignore_player, ignore_laststand_players)
{
	if(!isdefined(ignore_laststand_players))
	{
		ignore_laststand_players = 0;
	}
	pixbeginevent();
	valid_player_found = 0;
	targets = getplayers();
	if(isdefined(level.closest_player_targets_override))
	{
		targets = [[level.closest_player_targets_override]]();
	}
	if(isdefined(ignore_player))
	{
		for(i = 0; i < ignore_player.size; i++)
		{
			arrayremovevalue(targets, ignore_player[i]);
		}
	}
	done = 1;
	while(targets.size && !done)
	{
		done = 1;
		for(i = 0; i < targets.size; i++)
		{
			target = targets[i];
			if(!is_player_valid(target, 1, ignore_laststand_players))
			{
				arrayremovevalue(targets, target);
				done = 0;
				break;
			}
		}
	}
	if(targets.size == 0)
	{
		pixendevent();
		return undefined;
	}
	if(isdefined(self.closest_player_override))
	{
		target = [[self.closest_player_override]](origin, targets);
	}
	else if(isdefined(level.closest_player_override))
	{
		target = [[level.closest_player_override]](origin, targets);
	}
	if(isdefined(target))
	{
		pixendevent();
		return target;
	}
	sortedpotentialtargets = arraysortclosest(targets, self.origin);
	while(sortedpotentialtargets.size)
	{
		if(is_player_valid(sortedpotentialtargets[0], 1, ignore_laststand_players))
		{
			pixendevent();
			return sortedpotentialtargets[0];
		}
		arrayremovevalue(sortedpotentialtargets, sortedpotentialtargets[0]);
	}
	pixendevent();
	return undefined;
}

/*
	Name: is_player_valid
	Namespace: zombie_utility
	Checksum: 0xDD031658
	Offset: 0x800
	Size: 0x1A4
	Parameters: 4
	Flags: Linked
*/
function is_player_valid(player, checkignoremeflag, ignore_laststand_players, var_da861165)
{
	if(!isdefined(var_da861165))
	{
		var_da861165 = 1;
	}
	if(!isdefined(player))
	{
		return 0;
	}
	if(!isalive(player))
	{
		return 0;
	}
	if(!isplayer(player))
	{
		return 0;
	}
	if(isdefined(player.is_zombie) && player.is_zombie == 1)
	{
		return 0;
	}
	if(player.sessionstate == "spectator")
	{
		return 0;
	}
	if(player.sessionstate == "intermission")
	{
		return 0;
	}
	if(!var_da861165 && player scene::is_igc_active())
	{
		return 0;
	}
	if(is_true(player.intermission))
	{
		return 0;
	}
	if(!is_true(ignore_laststand_players))
	{
		if(player laststand::player_is_in_laststand())
		{
			return 0;
		}
	}
	if(is_true(checkignoremeflag) && (player.ignoreme || player isnotarget()))
	{
		return 0;
	}
	if(isdefined(level.is_player_valid_override))
	{
		return [[level.is_player_valid_override]](player);
	}
	return 1;
}

/*
	Name: append_missing_legs_suffix
	Namespace: zombie_utility
	Checksum: 0x69510628
	Offset: 0x9B0
	Size: 0x5A
	Parameters: 1
	Flags: Linked
*/
function append_missing_legs_suffix(animstate)
{
	if(is_true(self.missinglegs) && self hasanimstatefromasd(animstate + "_crawl"))
	{
		return animstate + "_crawl";
	}
	return animstate;
}

/*
	Name: initanimtree
	Namespace: zombie_utility
	Checksum: 0x6F2D0C52
	Offset: 0xA18
	Size: 0x76
	Parameters: 1
	Flags: Linked
*/
function initanimtree(animscript)
{
	if(animscript != "pain" && animscript != "death")
	{
		self.a.special = "none";
	}
	/#
		assert(isdefined(animscript), "");
	#/
	self.a.script = animscript;
}

/*
	Name: updateanimpose
	Namespace: zombie_utility
	Checksum: 0xCAB48275
	Offset: 0xA98
	Size: 0xAE
	Parameters: 0
	Flags: Linked
*/
function updateanimpose()
{
	/#
		assert(self.a.movement == "" || self.a.movement == "" || self.a.movement == "", (("" + self.a.pose) + "") + self.a.movement);
	#/
	self.desired_anim_pose = undefined;
}

/*
	Name: initialize
	Namespace: zombie_utility
	Checksum: 0xB0F72AB5
	Offset: 0xB50
	Size: 0x214
	Parameters: 1
	Flags: None
*/
function initialize(animscript)
{
	if(isdefined(self.longdeathstarting))
	{
		if(animscript != "pain" && animscript != "death")
		{
			self dodamage(self.health + 100, self.origin);
		}
		if(animscript != "pain")
		{
			self.longdeathstarting = undefined;
			self notify(#"kill_long_death");
		}
	}
	if(isdefined(self.a.mayonlydie) && animscript != "death")
	{
		self dodamage(self.health + 100, self.origin);
	}
	if(isdefined(self.a.postscriptfunc))
	{
		scriptfunc = self.a.postscriptfunc;
		self.a.postscriptfunc = undefined;
		[[scriptfunc]](animscript);
	}
	if(animscript != "death")
	{
		self.a.nodeath = 0;
	}
	self.isholdinggrenade = undefined;
	self.covernode = undefined;
	self.changingcoverpos = 0;
	self.a.scriptstarttime = gettime();
	self.a.atconcealmentnode = 0;
	if(isdefined(self.node) && (self.node.type == #"conceal crouch" || self.node.type == #"conceal stand"))
	{
		self.a.atconcealmentnode = 1;
	}
	initanimtree(animscript);
	updateanimpose();
}

/*
	Name: getnodeyawtoorigin
	Namespace: zombie_utility
	Checksum: 0x4E4EC89D
	Offset: 0xD70
	Size: 0x92
	Parameters: 1
	Flags: None
*/
function getnodeyawtoorigin(pos)
{
	if(isdefined(self.node))
	{
		yaw = self.node.angles[1] - getyaw(pos);
	}
	else
	{
		yaw = self.angles[1] - getyaw(pos);
	}
	yaw = angleclamp180(yaw);
	return yaw;
}

/*
	Name: getnodeyawtoenemy
	Namespace: zombie_utility
	Checksum: 0x2A3095FA
	Offset: 0xE10
	Size: 0x142
	Parameters: 0
	Flags: None
*/
function getnodeyawtoenemy()
{
	pos = undefined;
	if(isvalidenemy(self.enemy))
	{
		pos = self.enemy.origin;
	}
	else
	{
		if(isdefined(self.node))
		{
			forward = anglestoforward(self.node.angles);
		}
		else
		{
			forward = anglestoforward(self.angles);
		}
		forward = vectorscale(forward, 150);
		pos = self.origin + forward;
	}
	if(isdefined(self.node))
	{
		yaw = self.node.angles[1] - getyaw(pos);
	}
	else
	{
		yaw = self.angles[1] - getyaw(pos);
	}
	yaw = angleclamp180(yaw);
	return yaw;
}

/*
	Name: getcovernodeyawtoenemy
	Namespace: zombie_utility
	Checksum: 0x3A0D9B0E
	Offset: 0xF60
	Size: 0x132
	Parameters: 0
	Flags: None
*/
function getcovernodeyawtoenemy()
{
	pos = undefined;
	if(isvalidenemy(self.enemy))
	{
		pos = self.enemy.origin;
	}
	else
	{
		forward = anglestoforward(self.covernode.angles + self.animarray[#"angle_step_out"][self.a.cornermode]);
		forward = vectorscale(forward, 150);
		pos = self.origin + forward;
	}
	yaw = (self.covernode.angles[1] + self.animarray[#"angle_step_out"][self.a.cornermode]) - getyaw(pos);
	yaw = angleclamp180(yaw);
	return yaw;
}

/*
	Name: getyawtospot
	Namespace: zombie_utility
	Checksum: 0xEF98D1F1
	Offset: 0x10A0
	Size: 0x62
	Parameters: 1
	Flags: None
*/
function getyawtospot(spot)
{
	pos = spot;
	yaw = self.angles[1] - getyaw(pos);
	yaw = angleclamp180(yaw);
	return yaw;
}

/*
	Name: getyawtoenemy
	Namespace: zombie_utility
	Checksum: 0xF913FF3D
	Offset: 0x1110
	Size: 0xCA
	Parameters: 0
	Flags: None
*/
function getyawtoenemy()
{
	pos = undefined;
	if(isvalidenemy(self.enemy))
	{
		pos = self.enemy.origin;
	}
	else
	{
		forward = anglestoforward(self.angles);
		forward = vectorscale(forward, 150);
		pos = self.origin + forward;
	}
	yaw = self.angles[1] - getyaw(pos);
	yaw = angleclamp180(yaw);
	return yaw;
}

/*
	Name: getyaw
	Namespace: zombie_utility
	Checksum: 0x7137B1C7
	Offset: 0x11E8
	Size: 0x3E
	Parameters: 1
	Flags: Linked
*/
function getyaw(org)
{
	angles = vectortoangles(org - self.origin);
	return angles[1];
}

/*
	Name: getyaw2d
	Namespace: zombie_utility
	Checksum: 0x87BFDB19
	Offset: 0x1230
	Size: 0x66
	Parameters: 1
	Flags: Linked
*/
function getyaw2d(org)
{
	angles = vectortoangles((org[0], org[1], 0) - (self.origin[0], self.origin[1], 0));
	return angles[1];
}

/*
	Name: absyawtoenemy
	Namespace: zombie_utility
	Checksum: 0x9EF4DE82
	Offset: 0x12A0
	Size: 0xA2
	Parameters: 0
	Flags: None
*/
function absyawtoenemy()
{
	/#
		assert(isvalidenemy(self.enemy));
	#/
	yaw = self.angles[1] - getyaw(self.enemy.origin);
	yaw = angleclamp180(yaw);
	if(yaw < 0)
	{
		yaw = -1 * yaw;
	}
	return yaw;
}

/*
	Name: absyawtoenemy2d
	Namespace: zombie_utility
	Checksum: 0x1901A5C3
	Offset: 0x1350
	Size: 0xA2
	Parameters: 0
	Flags: None
*/
function absyawtoenemy2d()
{
	/#
		assert(isvalidenemy(self.enemy));
	#/
	yaw = self.angles[1] - getyaw2d(self.enemy.origin);
	yaw = angleclamp180(yaw);
	if(yaw < 0)
	{
		yaw = -1 * yaw;
	}
	return yaw;
}

/*
	Name: absyawtoorigin
	Namespace: zombie_utility
	Checksum: 0x598FF4E4
	Offset: 0x1400
	Size: 0x6A
	Parameters: 1
	Flags: None
*/
function absyawtoorigin(org)
{
	yaw = self.angles[1] - getyaw(org);
	yaw = angleclamp180(yaw);
	if(yaw < 0)
	{
		yaw = -1 * yaw;
	}
	return yaw;
}

/*
	Name: absyawtoangles
	Namespace: zombie_utility
	Checksum: 0x50083D13
	Offset: 0x1478
	Size: 0x5A
	Parameters: 1
	Flags: None
*/
function absyawtoangles(angles)
{
	yaw = self.angles[1] - angles;
	yaw = angleclamp180(yaw);
	if(yaw < 0)
	{
		yaw = -1 * yaw;
	}
	return yaw;
}

/*
	Name: getyawfromorigin
	Namespace: zombie_utility
	Checksum: 0xE87CDBA0
	Offset: 0x14E0
	Size: 0x3E
	Parameters: 2
	Flags: Linked
*/
function getyawfromorigin(org, start)
{
	angles = vectortoangles(org - start);
	return angles[1];
}

/*
	Name: getyawtotag
	Namespace: zombie_utility
	Checksum: 0xD8A1FEEB
	Offset: 0x1528
	Size: 0x7A
	Parameters: 2
	Flags: None
*/
function getyawtotag(tag, org)
{
	yaw = self gettagangles(tag)[1] - getyawfromorigin(org, self gettagorigin(tag));
	yaw = angleclamp180(yaw);
	return yaw;
}

/*
	Name: getyawtoorigin
	Namespace: zombie_utility
	Checksum: 0xAF4E6717
	Offset: 0x15B0
	Size: 0x52
	Parameters: 1
	Flags: None
*/
function getyawtoorigin(org)
{
	yaw = self.angles[1] - getyaw(org);
	yaw = angleclamp180(yaw);
	return yaw;
}

/*
	Name: geteyeyawtoorigin
	Namespace: zombie_utility
	Checksum: 0xDBE732BE
	Offset: 0x1610
	Size: 0x6A
	Parameters: 1
	Flags: None
*/
function geteyeyawtoorigin(org)
{
	yaw = self gettagangles("TAG_EYE")[1] - getyaw(org);
	yaw = angleclamp180(yaw);
	return yaw;
}

/*
	Name: getcovernodeyawtoorigin
	Namespace: zombie_utility
	Checksum: 0x6E5A484E
	Offset: 0x1688
	Size: 0x82
	Parameters: 1
	Flags: None
*/
function getcovernodeyawtoorigin(org)
{
	yaw = (self.covernode.angles[1] + self.animarray[#"angle_step_out"][self.a.cornermode]) - getyaw(org);
	yaw = angleclamp180(yaw);
	return yaw;
}

/*
	Name: isstanceallowedwrapper
	Namespace: zombie_utility
	Checksum: 0x7E8AD96A
	Offset: 0x1718
	Size: 0x4A
	Parameters: 1
	Flags: None
*/
function isstanceallowedwrapper(stance)
{
	if(isdefined(self.covernode))
	{
		return doesnodeallowstance(self.covernode, stance);
	}
	return self isstanceallowed(stance);
}

/*
	Name: getclaimednode
	Namespace: zombie_utility
	Checksum: 0xDC6DC787
	Offset: 0x1770
	Size: 0x62
	Parameters: 0
	Flags: Linked
*/
function getclaimednode()
{
	mynode = self.node;
	if(isdefined(mynode) && (self nearnode(mynode) || (isdefined(self.covernode) && mynode == self.covernode)))
	{
		return mynode;
	}
	return undefined;
}

/*
	Name: getnodetype
	Namespace: zombie_utility
	Checksum: 0xEB0DD807
	Offset: 0x17E0
	Size: 0x36
	Parameters: 0
	Flags: None
*/
function getnodetype()
{
	mynode = getclaimednode();
	if(isdefined(mynode))
	{
		return mynode.type;
	}
	return "none";
}

/*
	Name: getnodedirection
	Namespace: zombie_utility
	Checksum: 0xAA1F67D1
	Offset: 0x1820
	Size: 0x3E
	Parameters: 0
	Flags: None
*/
function getnodedirection()
{
	mynode = getclaimednode();
	if(isdefined(mynode))
	{
		return mynode.angles[1];
	}
	return self.desiredangle;
}

/*
	Name: getnodeforward
	Namespace: zombie_utility
	Checksum: 0xCDE96201
	Offset: 0x1868
	Size: 0x5A
	Parameters: 0
	Flags: None
*/
function getnodeforward()
{
	mynode = getclaimednode();
	if(isdefined(mynode))
	{
		return anglestoforward(mynode.angles);
	}
	return anglestoforward(self.angles);
}

/*
	Name: getnodeorigin
	Namespace: zombie_utility
	Checksum: 0x3298DD1A
	Offset: 0x18D0
	Size: 0x36
	Parameters: 0
	Flags: None
*/
function getnodeorigin()
{
	mynode = getclaimednode();
	if(isdefined(mynode))
	{
		return mynode.origin;
	}
	return self.origin;
}

/*
	Name: safemod
	Namespace: zombie_utility
	Checksum: 0x39C6FF01
	Offset: 0x1910
	Size: 0x4C
	Parameters: 2
	Flags: None
*/
function safemod(a, b)
{
	result = int(a) % b;
	result = result + b;
	return result % b;
}

/*
	Name: angleclamp
	Namespace: zombie_utility
	Checksum: 0x8E4E7AF1
	Offset: 0x1968
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function angleclamp(angle)
{
	anglefrac = angle / 360;
	angle = (anglefrac - floor(anglefrac)) * 360;
	return angle;
}

/*
	Name: quadrantanimweights
	Namespace: zombie_utility
	Checksum: 0x6234BF47
	Offset: 0x19C0
	Size: 0x28C
	Parameters: 1
	Flags: None
*/
function quadrantanimweights(yaw)
{
	forwardweight = (90 - abs(yaw)) / 90;
	leftweight = (90 - (absangleclamp180(abs(yaw - 90)))) / 90;
	result[#"front"] = 0;
	result[#"right"] = 0;
	result[#"back"] = 0;
	result[#"left"] = 0;
	if(isdefined(self.alwaysrunforward))
	{
		/#
			assert(self.alwaysrunforward);
		#/
		result[#"front"] = 1;
		return result;
	}
	useleans = getdvarint(#"ai_useleanrunanimations", 0);
	if(forwardweight > 0)
	{
		result[#"front"] = forwardweight;
		if(leftweight > 0)
		{
			result[#"left"] = leftweight;
		}
		else
		{
			result[#"right"] = -1 * leftweight;
		}
	}
	else
	{
		if(useleans)
		{
			result[#"back"] = -1 * forwardweight;
			if(leftweight > 0)
			{
				result[#"left"] = leftweight;
			}
			else
			{
				result[#"right"] = -1 * leftweight;
			}
		}
		else
		{
			backweight = -1 * forwardweight;
			if(leftweight > backweight)
			{
				result[#"left"] = 1;
			}
			else
			{
				if(leftweight < forwardweight)
				{
					result[#"right"] = 1;
				}
				else
				{
					result[#"back"] = 1;
				}
			}
		}
	}
	return result;
}

/*
	Name: getquadrant
	Namespace: zombie_utility
	Checksum: 0xEFBE2DD3
	Offset: 0x1C58
	Size: 0xA2
	Parameters: 1
	Flags: None
*/
function getquadrant(angle)
{
	angle = angleclamp(angle);
	if(angle < 45 || angle > 315)
	{
		quadrant = "front";
	}
	else
	{
		if(angle < 135)
		{
			quadrant = "left";
		}
		else
		{
			if(angle < 225)
			{
				quadrant = "back";
			}
			else
			{
				quadrant = "right";
			}
		}
	}
	return quadrant;
}

/*
	Name: isinset
	Namespace: zombie_utility
	Checksum: 0x563EF7D7
	Offset: 0x1D08
	Size: 0x56
	Parameters: 2
	Flags: None
*/
function isinset(input, set)
{
	for(i = set.size - 1; i >= 0; i--)
	{
		if(input == set[i])
		{
			return true;
		}
	}
	return false;
}

/*
	Name: notifyaftertime
	Namespace: zombie_utility
	Checksum: 0x2AA16119
	Offset: 0x1D68
	Size: 0x3E
	Parameters: 3
	Flags: None
*/
function notifyaftertime(notifystring, killmestring, time)
{
	self endon(#"death", killmestring);
	wait(time);
	self notify(notifystring);
}

/*
	Name: drawstringtime
	Namespace: zombie_utility
	Checksum: 0xDD3B7B4A
	Offset: 0x1DB0
	Size: 0x82
	Parameters: 4
	Flags: None
*/
function drawstringtime(msg, org, color, timer)
{
	/#
		maxtime = timer * 20;
		for(i = 0; i < maxtime; i++)
		{
			print3d(org, msg, color, 1, 1);
			waitframe(1);
		}
	#/
}

/*
	Name: showlastenemysightpos
	Namespace: zombie_utility
	Checksum: 0xB50714CD
	Offset: 0x1E40
	Size: 0x110
	Parameters: 1
	Flags: None
*/
function showlastenemysightpos(string)
{
	/#
		self notify(#"got known enemy2");
		self endon(#"got known enemy2", #"death");
		if(!isvalidenemy(self.enemy))
		{
			return;
		}
		if(self.enemy.team == #"allies")
		{
			color = (0.4, 0.7, 1);
		}
		else
		{
			color = (1, 0.7, 0.4);
		}
		while(true)
		{
			waitframe(1);
			if(!isdefined(self.lastenemysightpos))
			{
				continue;
			}
			print3d(self.lastenemysightpos, string, color, 1, 2.15);
		}
	#/
}

/*
	Name: debugtimeout
	Namespace: zombie_utility
	Checksum: 0xE8E43CC9
	Offset: 0x1F58
	Size: 0x1E
	Parameters: 0
	Flags: None
*/
function debugtimeout()
{
	wait(5);
	self notify(#"timeout");
}

/*
	Name: debugposinternal
	Namespace: zombie_utility
	Checksum: 0x5739A4F
	Offset: 0x1F80
	Size: 0x138
	Parameters: 3
	Flags: Linked
*/
function debugposinternal(org, string, size)
{
	/#
		self endon(#"death");
		self notify("" + org);
		self endon("" + org);
		ent = spawnstruct();
		ent thread debugtimeout();
		ent endon(#"timeout");
		if(self.enemy.team == #"allies")
		{
			color = (0.4, 0.7, 1);
		}
		else
		{
			color = (1, 0.7, 0.4);
		}
		while(true)
		{
			waitframe(1);
			print3d(org, string, color, 1, size);
		}
	#/
}

/*
	Name: debugpos
	Namespace: zombie_utility
	Checksum: 0x6A583789
	Offset: 0x20C0
	Size: 0x34
	Parameters: 2
	Flags: None
*/
function debugpos(org, string)
{
	thread debugposinternal(org, string, 2.15);
}

/*
	Name: debugpossize
	Namespace: zombie_utility
	Checksum: 0x35A7932
	Offset: 0x2100
	Size: 0x34
	Parameters: 3
	Flags: None
*/
function debugpossize(org, string, size)
{
	thread debugposinternal(org, string, size);
}

/*
	Name: showdebugproc
	Namespace: zombie_utility
	Checksum: 0xA993681F
	Offset: 0x2140
	Size: 0x96
	Parameters: 4
	Flags: Linked
*/
function showdebugproc(frompoint, topoint, color, printtime)
{
	/#
		self endon(#"death");
		timer = printtime * 20;
		i = 0;
		while(i < timer)
		{
			waitframe(1);
			line(frompoint, topoint, color);
			i = i + 1;
		}
	#/
}

/*
	Name: showdebugline
	Namespace: zombie_utility
	Checksum: 0xE214C649
	Offset: 0x21E0
	Size: 0x54
	Parameters: 4
	Flags: None
*/
function showdebugline(frompoint, topoint, color, printtime)
{
	self thread showdebugproc(frompoint, topoint + (vectorscale((0, 0, -1), 5)), color, printtime);
}

/*
	Name: getnodeoffset
	Namespace: zombie_utility
	Checksum: 0x1279D6E
	Offset: 0x2240
	Size: 0x32E
	Parameters: 1
	Flags: None
*/
function getnodeoffset(node)
{
	if(isdefined(node.offset))
	{
		return node.offset;
	}
	cover_left_crouch_offset = (-26, 0.4, 36);
	cover_left_stand_offset = (-32, 7, 63);
	cover_right_crouch_offset = (43.5, 11, 36);
	cover_right_stand_offset = (36, 8.3, 63);
	cover_crouch_offset = (3.5, -12.5, 45);
	cover_stand_offset = (-3.7, -22, 63);
	cornernode = 0;
	nodeoffset = (0, 0, 0);
	right = anglestoright(node.angles);
	forward = anglestoforward(node.angles);
	switch(node.type)
	{
		case "hash_4767a02d3b3b87cc":
		case "cover left":
		{
			if(node isnodedontstand() && !node isnodedontcrouch())
			{
				nodeoffset = calculatenodeoffset(right, forward, cover_left_crouch_offset);
			}
			else
			{
				nodeoffset = calculatenodeoffset(right, forward, cover_left_stand_offset);
			}
			break;
		}
		case "cover right":
		case "hash_3aeea178f890eb31":
		{
			if(node isnodedontstand() && !node isnodedontcrouch())
			{
				nodeoffset = calculatenodeoffset(right, forward, cover_right_crouch_offset);
			}
			else
			{
				nodeoffset = calculatenodeoffset(right, forward, cover_right_stand_offset);
			}
			break;
		}
		case "conceal stand":
		case "turret":
		case "cover stand":
		{
			nodeoffset = calculatenodeoffset(right, forward, cover_stand_offset);
			break;
		}
		case "conceal crouch":
		case "cover crouch window":
		case "cover crouch":
		{
			nodeoffset = calculatenodeoffset(right, forward, cover_crouch_offset);
			break;
		}
	}
	node.offset = nodeoffset;
	return node.offset;
}

/*
	Name: calculatenodeoffset
	Namespace: zombie_utility
	Checksum: 0x2F1DA107
	Offset: 0x2578
	Size: 0x48
	Parameters: 3
	Flags: Linked
*/
function calculatenodeoffset(right, forward, baseoffset)
{
	return (vectorscale(right, baseoffset[0]) + vectorscale(forward, baseoffset[1])) + (0, 0, baseoffset[2]);
}

/*
	Name: showlines
	Namespace: zombie_utility
	Checksum: 0xCC26393F
	Offset: 0x25C8
	Size: 0x6E
	Parameters: 3
	Flags: None
*/
function showlines(start, end, end2)
{
	/#
		for(;;)
		{
			line(start, end, (1, 0, 0), 1);
			waitframe(1);
			line(start, end2, (0, 0, 1), 1);
			waitframe(1);
		}
	#/
}

/*
	Name: anim_array
	Namespace: zombie_utility
	Checksum: 0xE5EA91A6
	Offset: 0x2640
	Size: 0x148
	Parameters: 2
	Flags: None
*/
function anim_array(animarray, animweights)
{
	total_anims = animarray.size;
	idleanim = randomint(total_anims);
	/#
		assert(total_anims);
	#/
	/#
		assert(animarray.size == animweights.size);
	#/
	if(total_anims == 1)
	{
		return animarray[0];
	}
	weights = 0;
	total_weight = 0;
	for(i = 0; i < total_anims; i++)
	{
		total_weight = total_weight + animweights[i];
	}
	anim_play = randomfloat(total_weight);
	current_weight = 0;
	for(i = 0; i < total_anims; i++)
	{
		current_weight = current_weight + animweights[i];
		if(anim_play >= current_weight)
		{
			continue;
		}
		idleanim = i;
		break;
	}
	return animarray[idleanim];
}

/*
	Name: notforcedcover
	Namespace: zombie_utility
	Checksum: 0xBF1AF7BC
	Offset: 0x2790
	Size: 0x3A
	Parameters: 0
	Flags: None
*/
function notforcedcover()
{
	return self.a.forced_cover == "none" || self.a.forced_cover == "Show";
}

/*
	Name: forcedcover
	Namespace: zombie_utility
	Checksum: 0xFB5EE19C
	Offset: 0x27D8
	Size: 0x36
	Parameters: 1
	Flags: None
*/
function forcedcover(msg)
{
	return isdefined(self.a.forced_cover) && self.a.forced_cover == msg;
}

/*
	Name: print3dtime
	Namespace: zombie_utility
	Checksum: 0x7A6ADF1D
	Offset: 0x2818
	Size: 0x92
	Parameters: 6
	Flags: None
*/
function print3dtime(timer, org, msg, color, alpha, scale)
{
	/#
		newtime = timer / 0.05;
		for(i = 0; i < newtime; i++)
		{
			print3d(org, msg, color, alpha, scale);
			waitframe(1);
		}
	#/
}

/*
	Name: print3drise
	Namespace: zombie_utility
	Checksum: 0xD0077404
	Offset: 0x28B8
	Size: 0xBA
	Parameters: 5
	Flags: None
*/
function print3drise(org, msg, color, alpha, scale)
{
	/#
		newtime = 100;
		up = 0;
		org = org;
		for(i = 0; i < newtime; i++)
		{
			up = up + 0.5;
			print3d(org + (0, 0, up), msg, color, alpha, scale);
			waitframe(1);
		}
	#/
}

/*
	Name: random_weight
	Namespace: zombie_utility
	Checksum: 0x6F7C27
	Offset: 0x2980
	Size: 0xDA
	Parameters: 1
	Flags: None
*/
function random_weight(array)
{
	idleanim = randomint(array.size);
	if(array.size > 1)
	{
		anim_weight = 0;
		for(i = 0; i < array.size; i++)
		{
			anim_weight = anim_weight + array[i];
		}
		anim_play = randomfloat(anim_weight);
		anim_weight = 0;
		for(i = 0; i < array.size; i++)
		{
			anim_weight = anim_weight + array[i];
			if(anim_play < anim_weight)
			{
				idleanim = i;
				break;
			}
		}
	}
	return idleanim;
}

/*
	Name: persistentdebugline
	Namespace: zombie_utility
	Checksum: 0x4AA3D950
	Offset: 0x2A68
	Size: 0x86
	Parameters: 2
	Flags: None
*/
function persistentdebugline(start, end)
{
	/#
		self endon(#"death");
		level notify(#"newdebugline");
		level endon(#"newdebugline");
		for(;;)
		{
			line(start, end, (0.3, 1, 0), 1);
			waitframe(1);
		}
	#/
}

/*
	Name: isnodedontstand
	Namespace: zombie_utility
	Checksum: 0xAEE70072
	Offset: 0x2AF8
	Size: 0x16
	Parameters: 0
	Flags: Linked
*/
function isnodedontstand()
{
	return (self.spawnflags & 4) == 4;
}

/*
	Name: isnodedontcrouch
	Namespace: zombie_utility
	Checksum: 0xD69B0F24
	Offset: 0x2B18
	Size: 0x16
	Parameters: 0
	Flags: Linked
*/
function isnodedontcrouch()
{
	return (self.spawnflags & 8) == 8;
}

/*
	Name: animarray
	Namespace: zombie_utility
	Checksum: 0x5A645086
	Offset: 0x2B38
	Size: 0xB8
	Parameters: 1
	Flags: None
*/
function animarray(animname)
{
	/#
		assert(isdefined(self.a.array));
	#/
	/#
		if(!isdefined(self.a.array[animname]))
		{
			dumpanimarray();
			/#
				assert(isdefined(self.a.array[animname]), ("" + animname) + "");
			#/
		}
	#/
	return self.a.array[animname];
}

/*
	Name: animarrayanyexist
	Namespace: zombie_utility
	Checksum: 0x6FCFC7BD
	Offset: 0x2BF8
	Size: 0xBE
	Parameters: 1
	Flags: None
*/
function animarrayanyexist(animname)
{
	/#
		assert(isdefined(self.a.array));
	#/
	/#
		if(!isdefined(self.a.array[animname]))
		{
			dumpanimarray();
			/#
				assert(isdefined(self.a.array[animname]), ("" + animname) + "");
			#/
		}
	#/
	return self.a.array[animname].size > 0;
}

/*
	Name: animarraypickrandom
	Namespace: zombie_utility
	Checksum: 0x6A7D9E6F
	Offset: 0x2CC0
	Size: 0x146
	Parameters: 1
	Flags: None
*/
function animarraypickrandom(animname)
{
	/#
		assert(isdefined(self.a.array));
	#/
	/#
		if(!isdefined(self.a.array[animname]))
		{
			dumpanimarray();
			/#
				assert(isdefined(self.a.array[animname]), ("" + animname) + "");
			#/
		}
	#/
	/#
		assert(self.a.array[animname].size > 0);
	#/
	if(self.a.array[animname].size > 1)
	{
		index = randomint(self.a.array[animname].size);
	}
	else
	{
		index = 0;
	}
	return self.a.array[animname][index];
}

/*
	Name: dumpanimarray
	Namespace: zombie_utility
	Checksum: 0xE44D6034
	Offset: 0x2E10
	Size: 0x118
	Parameters: 0
	Flags: None
*/
function dumpanimarray()
{
	/#
		println("");
		foreach(k, v in self.a.array)
		{
			if(isarray(v))
			{
				println(((("" + k) + "") + v.size) + "");
				continue;
			}
			println(("" + k) + "", v);
		}
	#/
}

/*
	Name: getanimendpos
	Namespace: zombie_utility
	Checksum: 0xDFABCF9E
	Offset: 0x2F30
	Size: 0x4A
	Parameters: 1
	Flags: None
*/
function getanimendpos(theanim)
{
	movedelta = getmovedelta(theanim, 0, 1);
	return self localtoworldcoords(movedelta);
}

/*
	Name: isvalidenemy
	Namespace: zombie_utility
	Checksum: 0xD89916A6
	Offset: 0x2F88
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function isvalidenemy(enemy)
{
	if(!isdefined(enemy))
	{
		return false;
	}
	return true;
}

/*
	Name: damagelocationisany
	Namespace: zombie_utility
	Checksum: 0x230EF14
	Offset: 0x2FB0
	Size: 0x21E
	Parameters: 12
	Flags: Linked
*/
function damagelocationisany(a, b, c, d, e, f, g, h, i, j, k, ovr)
{
	if(!isdefined(self.damagelocation))
	{
		return false;
	}
	if(!isdefined(a))
	{
		return false;
	}
	if(self.damagelocation == a)
	{
		return true;
	}
	if(!isdefined(b))
	{
		return false;
	}
	if(self.damagelocation == b)
	{
		return true;
	}
	if(!isdefined(c))
	{
		return false;
	}
	if(self.damagelocation == c)
	{
		return true;
	}
	if(!isdefined(d))
	{
		return false;
	}
	if(self.damagelocation == d)
	{
		return true;
	}
	if(!isdefined(e))
	{
		return false;
	}
	if(self.damagelocation == e)
	{
		return true;
	}
	if(!isdefined(f))
	{
		return false;
	}
	if(self.damagelocation == f)
	{
		return true;
	}
	if(!isdefined(g))
	{
		return false;
	}
	if(self.damagelocation == g)
	{
		return true;
	}
	if(!isdefined(h))
	{
		return false;
	}
	if(self.damagelocation == h)
	{
		return true;
	}
	if(!isdefined(i))
	{
		return false;
	}
	if(self.damagelocation == i)
	{
		return true;
	}
	if(!isdefined(j))
	{
		return false;
	}
	if(self.damagelocation == j)
	{
		return true;
	}
	if(!isdefined(k))
	{
		return false;
	}
	if(self.damagelocation == k)
	{
		return true;
	}
	/#
		assert(!isdefined(ovr));
	#/
	return false;
}

/*
	Name: set_orient_mode
	Namespace: zombie_utility
	Checksum: 0x58450B8E
	Offset: 0x31D8
	Size: 0xE4
	Parameters: 2
	Flags: None
*/
function set_orient_mode(mode, val1)
{
	/#
		if(level.dog_debug_orient == self getentnum())
		{
			if(isdefined(val1))
			{
				println((((("" + mode) + "") + val1) + "") + gettime());
			}
			else
			{
				println((("" + mode) + "") + gettime());
			}
		}
	#/
	if(isdefined(val1))
	{
		self orientmode(mode, val1);
	}
	else
	{
		self orientmode(mode);
	}
}

/*
	Name: debug_anim_print
	Namespace: zombie_utility
	Checksum: 0xF6A712D2
	Offset: 0x32C8
	Size: 0xAC
	Parameters: 1
	Flags: None
*/
function debug_anim_print(text)
{
	/#
		if(isdefined(level.dog_debug_anims) && level.dog_debug_anims)
		{
			println((text + "") + gettime());
		}
		if(isdefined(level.dog_debug_anims_ent) && level.dog_debug_anims_ent == self getentnum())
		{
			println((text + "") + gettime());
		}
	#/
}

/*
	Name: debug_turn_print
	Namespace: zombie_utility
	Checksum: 0x14FACD50
	Offset: 0x3380
	Size: 0x17C
	Parameters: 2
	Flags: None
*/
function debug_turn_print(text, line)
{
	/#
		if(isdefined(level.dog_debug_turns) && level.dog_debug_turns == self getentnum())
		{
			duration = 200;
			currentyawcolor = (1, 1, 1);
			lookaheadyawcolor = (1, 0, 0);
			desiredyawcolor = (1, 1, 0);
			currentyaw = angleclamp180(self.angles[1]);
			desiredyaw = angleclamp180(self.desiredangle);
			lookaheaddir = self.lookaheaddir;
			lookaheadangles = vectortoangles(lookaheaddir);
			lookaheadyaw = angleclamp180(lookaheadangles[1]);
			println(((((((line + "") + gettime() + "") + currentyaw) + "") + lookaheadyaw) + "") + desiredyaw);
		}
	#/
}

/*
	Name: set_zombie_var
	Namespace: zombie_utility
	Checksum: 0xC47192C2
	Offset: 0x3508
	Size: 0x128
	Parameters: 4
	Flags: Linked
*/
function set_zombie_var(zvar, value, defaultvalue, is_team_based)
{
	if(!isdefined(is_team_based))
	{
		is_team_based = 0;
	}
	if(!isdefined(level.zombie_vars))
	{
		level.zombie_vars = [];
	}
	if(!isdefined(value))
	{
		value = defaultvalue;
	}
	if(is_team_based)
	{
		foreach(team, _ in level.teams)
		{
			if(!isdefined(level.zombie_vars[team]))
			{
				level.zombie_vars[team] = [];
			}
			level.zombie_vars[team][zvar] = value;
		}
	}
	else
	{
		level.zombie_vars[zvar] = value;
	}
	return value;
}

/*
	Name: function_c7ab6cbc
	Namespace: zombie_utility
	Checksum: 0xF24738AA
	Offset: 0x3638
	Size: 0x7A
	Parameters: 3
	Flags: Linked
*/
function function_c7ab6cbc(zvar, team, value)
{
	if(!isdefined(level.zombie_vars))
	{
		level.zombie_vars = [];
	}
	if(!isdefined(level.zombie_vars[team]))
	{
		level.zombie_vars[team] = [];
	}
	level.zombie_vars[team][zvar] = value;
	return value;
}

/*
	Name: function_d2dfacfd
	Namespace: zombie_utility
	Checksum: 0x6FA478C6
	Offset: 0x36C0
	Size: 0x38
	Parameters: 1
	Flags: Linked
*/
function function_d2dfacfd(zvar)
{
	if(!isdefined(level.zombie_vars))
	{
		level.zombie_vars = [];
	}
	return level.zombie_vars[zvar];
}

/*
	Name: function_6403cf83
	Namespace: zombie_utility
	Checksum: 0xCE53E2DB
	Offset: 0x3700
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_6403cf83(zvar, team)
{
	if(isdefined(level.zombie_vars[team]))
	{
		return level.zombie_vars[team][zvar];
	}
}

/*
	Name: function_826f5e98
	Namespace: zombie_utility
	Checksum: 0x32B1231F
	Offset: 0x3748
	Size: 0x68
	Parameters: 2
	Flags: Linked
*/
function function_826f5e98(zvar, value)
{
	/#
		assert(isplayer(self), "");
	#/
	if(!isdefined(self.zombie_vars))
	{
		self.zombie_vars = [];
	}
	self.zombie_vars[zvar] = value;
}

/*
	Name: function_73061b82
	Namespace: zombie_utility
	Checksum: 0x655264C9
	Offset: 0x37B8
	Size: 0x60
	Parameters: 1
	Flags: Linked
*/
function function_73061b82(zvar)
{
	/#
		assert(isplayer(self), "");
	#/
	if(!isdefined(self.zombie_vars))
	{
		self.zombie_vars = [];
	}
	return self.zombie_vars[zvar];
}

/*
	Name: spawn_zombie
	Namespace: zombie_utility
	Checksum: 0xDD4F679C
	Offset: 0x3820
	Size: 0x2EE
	Parameters: 4
	Flags: Linked
*/
function spawn_zombie(spawner, target_name, spawn_point, round_number)
{
	if(!isdefined(spawner))
	{
		/#
			println("");
		#/
		return undefined;
	}
	while(getfreeactorcount() < 1)
	{
		waitframe(1);
	}
	spawner.script_moveoverride = 1;
	if(is_true(spawner.script_forcespawn))
	{
		if(isactorspawner(spawner) && isdefined(level.overridezombiespawn))
		{
			guy = [[level.overridezombiespawn]](spawner, target_name, spawn_point, round_number);
		}
		else
		{
			guy = spawner spawnfromspawner(0, 1);
		}
		if(!zombie_spawn_failed(guy))
		{
			if(isdefined(level.giveextrazombies))
			{
				guy [[level.giveextrazombies]]();
			}
			guy enableaimassist();
			if(isdefined(round_number))
			{
				guy._starting_round_number = round_number;
			}
			if(isdefined(level.zombie_team))
			{
				guy.team = level.zombie_team;
			}
			if(isactor(guy))
			{
				guy clearentityowner();
			}
			level.zombiemeleeplayercounter = 0;
			if(isactor(guy))
			{
				guy forceteleport(spawner.origin);
			}
			guy show();
			spawner.count = 666;
			if(isdefined(target_name))
			{
				guy.targetname = target_name;
			}
			if(isdefined(spawn_point) && isdefined(level.move_spawn_func))
			{
				guy thread [[level.move_spawn_func]](spawn_point);
			}
			/#
				if(isdefined(spawner.zm_variant_type))
				{
					guy.variant_type = spawner.zm_variant_type;
				}
			#/
			return guy;
		}
		/#
			println("", spawner.origin);
		#/
		return undefined;
	}
	/#
		println("", spawner.origin);
	#/
	return undefined;
}

/*
	Name: zombie_spawn_failed
	Namespace: zombie_utility
	Checksum: 0xC5AA2E4A
	Offset: 0x3B20
	Size: 0x4E
	Parameters: 1
	Flags: Linked
*/
function zombie_spawn_failed(spawn)
{
	if(isdefined(spawn) && isalive(spawn))
	{
		if(isalive(spawn))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: get_desired_origin
	Namespace: zombie_utility
	Checksum: 0xA42F96E6
	Offset: 0x3B78
	Size: 0xDA
	Parameters: 0
	Flags: Linked
*/
function get_desired_origin()
{
	if(isdefined(self.target))
	{
		ent = getent(self.target, "targetname");
		if(!isdefined(ent))
		{
			ent = struct::get(self.target, "targetname");
		}
		if(!isdefined(ent))
		{
			ent = getnode(self.target, "targetname");
		}
		/#
			assert(isdefined(ent), (("" + self.target) + "") + self.origin);
		#/
		return ent.origin;
	}
	return undefined;
}

/*
	Name: hide_pop
	Namespace: zombie_utility
	Checksum: 0x168F5D95
	Offset: 0x3C60
	Size: 0x7A
	Parameters: 0
	Flags: Linked
*/
function hide_pop()
{
	self endon(#"death");
	self ghost();
	wait(0.5);
	if(isdefined(self))
	{
		self show();
		util::wait_network_frame();
		if(isdefined(self))
		{
			self.create_eyes = 1;
		}
	}
}

/*
	Name: handle_rise_notetracks
	Namespace: zombie_utility
	Checksum: 0x4EA52AE
	Offset: 0x3CE8
	Size: 0x2C
	Parameters: 2
	Flags: Linked
*/
function handle_rise_notetracks(note, spot)
{
	self thread finish_rise_notetracks(note, spot);
}

/*
	Name: finish_rise_notetracks
	Namespace: zombie_utility
	Checksum: 0x91C97980
	Offset: 0x3D20
	Size: 0x70
	Parameters: 2
	Flags: Linked
*/
function finish_rise_notetracks(note, spot)
{
	if(note == "deathout" || note == "deathhigh")
	{
		self.zombie_rise_death_out = 1;
		self notify(#"zombie_rise_death_out");
		wait(2);
		spot notify(#"stop_zombie_rise_fx");
	}
}

/*
	Name: zombie_rise_death
	Namespace: zombie_utility
	Checksum: 0xA4B6900F
	Offset: 0x3D98
	Size: 0xDC
	Parameters: 2
	Flags: Linked
*/
function zombie_rise_death(zombie, spot)
{
	zombie.zombie_rise_death_out = 0;
	zombie endon(#"rise_anim_finished", #"death");
	while(isdefined(zombie) && isdefined(zombie.health) && zombie.health > 1)
	{
		zombie waittill(#"damage");
	}
	if(isdefined(spot))
	{
		spot notify(#"stop_zombie_rise_fx");
	}
	if(isdefined(zombie))
	{
		zombie.deathanim = zombie get_rise_death_anim();
		zombie stopanimscripted();
	}
}

/*
	Name: get_rise_death_anim
	Namespace: zombie_utility
	Checksum: 0xCD583067
	Offset: 0x3E80
	Size: 0x3A
	Parameters: 0
	Flags: Linked
*/
function get_rise_death_anim()
{
	if(self.zombie_rise_death_out)
	{
		return "zm_rise_death_out";
	}
	self.noragdoll = 1;
	self.nodeathragdoll = 1;
	return "zm_rise_death_in";
}

/*
	Name: reset_attack_spot
	Namespace: zombie_utility
	Checksum: 0x6FFA5BA
	Offset: 0x3EC8
	Size: 0x7A
	Parameters: 0
	Flags: Linked
*/
function reset_attack_spot()
{
	if(isdefined(self.attacking_node))
	{
		node = self.attacking_node;
		index = self.attacking_spot_index;
		node.attack_spots_taken[index] = 0;
		node notify(#"hash_45aa77702fef26f4");
	}
	self.attacking_node = undefined;
	self.attacking_spot_index = undefined;
	self.attacking_spot = undefined;
}

/*
	Name: zombie_gut_explosion
	Namespace: zombie_utility
	Checksum: 0x8D9E75F3
	Offset: 0x3F50
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function zombie_gut_explosion()
{
	self.guts_explosion = 1;
	self playsound(#"zmb_zombie_head_gib");
	gibserverutils::annihilate(self);
}

/*
	Name: round_spawn_failsafe_debug_draw
	Namespace: zombie_utility
	Checksum: 0x2DF8FBFE
	Offset: 0x3FA8
	Size: 0x12A
	Parameters: 0
	Flags: Linked
*/
function round_spawn_failsafe_debug_draw()
{
	self notify("7a43702ee566cd8");
	self endon("7a43702ee566cd8");
	self endon(#"death");
	prevorigin = self.origin;
	while(true)
	{
		if(is_true(level.toggle_keyline_always))
		{
			self clientfield::set("zombie_keyline_render", 1);
			wait(1);
			continue;
		}
		wait(4);
		if(isdefined(self.lastchunk_destroy_time))
		{
			if(gettime() - self.lastchunk_destroy_time < 8000)
			{
				continue;
			}
		}
		if(distancesquared(self.origin, prevorigin) < 576)
		{
			self clientfield::set("zombie_keyline_render", 1);
		}
		else
		{
			self clientfield::set("zombie_keyline_render", 0);
		}
		prevorigin = self.origin;
	}
}

/*
	Name: round_spawn_failsafe
	Namespace: zombie_utility
	Checksum: 0xD45AA572
	Offset: 0x40E0
	Size: 0x4C6
	Parameters: 0
	Flags: Linked
*/
function round_spawn_failsafe()
{
	self notify("79f4c7cce4a2f648");
	self endon("79f4c7cce4a2f648");
	self endon(#"death");
	if(is_true(level.debug_keyline_zombies))
	{
		self thread round_spawn_failsafe_debug_draw();
	}
	v_prev_origin = self.origin;
	while(true)
	{
		if(!function_d2dfacfd(#"zombie_use_failsafe"))
		{
			return;
		}
		if(is_true(self.ignore_round_spawn_failsafe))
		{
			return;
		}
		if(!isdefined(level.failsafe_waittime))
		{
			level.failsafe_waittime = 30;
		}
		wait(level.failsafe_waittime);
		if(is_true(self.missinglegs))
		{
			wait(10);
		}
		if(is_true(self.is_inert))
		{
			continue;
		}
		if(isdefined(self.lastchunk_destroy_time) && (gettime() - self.lastchunk_destroy_time) < 8000)
		{
			continue;
		}
		if(self.origin[2] < function_d2dfacfd(#"below_world_check"))
		{
			if(isdefined(level.var_455393ef))
			{
				self thread [[level.var_455393ef]](v_prev_origin);
			}
			else
			{
				if(is_true(level.put_timed_out_zombies_back_in_queue) && !is_true(self.isscreecher))
				{
					level.zombie_total++;
					level.zombie_total_subtract++;
				}
				self.var_e700d5e2 = 1;
				self kill(undefined, undefined, undefined, undefined, undefined, 1);
			}
			break;
		}
		var_25e376fd = 0;
		if(isdefined(level.var_62fc4786))
		{
			var_25e376fd = self [[level.var_62fc4786]](v_prev_origin);
		}
		else if(distancesquared(self.origin, v_prev_origin) < 576)
		{
			var_25e376fd = 1;
		}
		if(var_25e376fd)
		{
			if(isdefined(level.var_455393ef))
			{
				self thread [[level.var_455393ef]](v_prev_origin);
			}
			else
			{
				if(is_true(level.put_timed_out_zombies_back_in_queue))
				{
					if(!is_true(self.nuked) && !is_true(self.marked_for_death) && !is_true(self.isscreecher) && !is_true(self.missinglegs))
					{
						level.zombie_total++;
						level.zombie_total_subtract++;
						var_1a8c05ae = {#hash_e0d660f6:self.var_e0d660f6, #n_health:self.health};
						if(!isdefined(level.var_fc73bad4[self.archetype]))
						{
							level.var_fc73bad4[self.archetype] = [];
						}
						else if(!isarray(level.var_fc73bad4[self.archetype]))
						{
							level.var_fc73bad4[self.archetype] = array(level.var_fc73bad4[self.archetype]);
						}
						level.var_fc73bad4[self.archetype][level.var_fc73bad4[self.archetype].size] = var_1a8c05ae;
					}
				}
				level.zombies_timeout_playspace++;
				self.var_e700d5e2 = 1;
				self.allowdeath = 1;
				self kill(undefined, undefined, undefined, undefined, undefined, 1);
			}
			break;
		}
		v_prev_origin = self.origin;
	}
}

/*
	Name: ai_calculate_health
	Namespace: zombie_utility
	Checksum: 0x619A40A3
	Offset: 0x45B0
	Size: 0x1AA
	Parameters: 2
	Flags: Linked
*/
function ai_calculate_health(base_health, round_number)
{
	if(isdefined(level.var_5d1805c4))
	{
		var_d082c739 = [[level.var_5d1805c4]](base_health, round_number);
		if(var_d082c739 >= 0)
		{
			return var_d082c739;
		}
	}
	if(util::get_game_type() == #"zclassic" && level.gamedifficulty < 2 && round_number > 35)
	{
		round_number = 35;
	}
	var_d082c739 = base_health;
	for(i = 2; i <= round_number; i++)
	{
		if(i >= 10 && !is_true(level.var_50dd0ec5))
		{
			old_health = var_d082c739;
			var_d082c739 = var_d082c739 + (int(var_d082c739 * function_d2dfacfd(#"zombie_health_increase_multiplier")));
			if(var_d082c739 < old_health)
			{
				var_d082c739 = old_health;
				break;
			}
			continue;
		}
		var_d082c739 = int(var_d082c739 + function_d2dfacfd(#"zombie_health_increase"));
	}
	return var_d082c739;
}

/*
	Name: default_max_zombie_func
	Namespace: zombie_utility
	Checksum: 0xC47D856C
	Offset: 0x4768
	Size: 0x25E
	Parameters: 2
	Flags: Linked
*/
function default_max_zombie_func(max_num, n_round)
{
	/#
		count = getdvarint(#"zombie_default_max", -1);
		if(count > -1)
		{
			return count;
		}
	#/
	n_players = getplayers().size;
	var_872cd28a = array(6, 8, 11, 14, 17);
	var_753ada67 = array(9, 11, 14, 18, 21);
	var_41446be2 = array(13, 15, 20, 25, 31);
	var_68849261 = array(18, 20, 25, 33, 40);
	var_979708f = array(24, 25, 32, 42, 48);
	switch(n_round)
	{
		case 1:
		{
			max = var_872cd28a[n_players - 1];
			break;
		}
		case 2:
		{
			max = var_753ada67[n_players - 1];
			break;
		}
		case 3:
		{
			max = var_41446be2[n_players - 1];
			break;
		}
		case 4:
		{
			max = var_68849261[n_players - 1];
			break;
		}
		case 5:
		{
			max = var_979708f[n_players - 1];
			break;
		}
		default:
		{
			max = max_num;
			break;
		}
	}
	return max;
}

/*
	Name: get_current_zombie_count
	Namespace: zombie_utility
	Checksum: 0x8FE5E011
	Offset: 0x49D0
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function get_current_zombie_count()
{
	enemies = get_round_enemy_array();
	return enemies.size;
}

/*
	Name: get_round_enemy_array
	Namespace: zombie_utility
	Checksum: 0x50E69637
	Offset: 0x4A00
	Size: 0xDC
	Parameters: 0
	Flags: Linked
*/
function get_round_enemy_array()
{
	a_ai_enemies = [];
	a_ai_valid_enemies = [];
	a_ai_enemies = getaiteamarray(level.zombie_team);
	for(i = 0; i < a_ai_enemies.size; i++)
	{
		if(is_true(a_ai_enemies[i].ignore_enemy_count))
		{
			continue;
		}
		if(!isdefined(a_ai_valid_enemies))
		{
			a_ai_valid_enemies = [];
		}
		else if(!isarray(a_ai_valid_enemies))
		{
			a_ai_valid_enemies = array(a_ai_valid_enemies);
		}
		a_ai_valid_enemies[a_ai_valid_enemies.size] = a_ai_enemies[i];
	}
	return a_ai_valid_enemies;
}

/*
	Name: get_zombie_array
	Namespace: zombie_utility
	Checksum: 0x3A54195F
	Offset: 0x4AE8
	Size: 0x3A
	Parameters: 0
	Flags: Linked
*/
function get_zombie_array()
{
	valid_enemies = getaiarchetypearray(#"zombie", level.zombie_team);
	return valid_enemies;
}

/*
	Name: set_zombie_run_cycle_override_value
	Namespace: zombie_utility
	Checksum: 0xE3D315ED
	Offset: 0x4B30
	Size: 0x32
	Parameters: 1
	Flags: Linked
*/
function set_zombie_run_cycle_override_value(new_move_speed)
{
	set_zombie_run_cycle(new_move_speed);
	self.zombie_move_speed_override = new_move_speed;
}

/*
	Name: set_zombie_run_cycle_restore_from_override
	Namespace: zombie_utility
	Checksum: 0x7DB8B9E2
	Offset: 0x4B70
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function set_zombie_run_cycle_restore_from_override()
{
	str_restore_move_speed = self.zombie_move_speed_restore;
	self.zombie_move_speed_override = undefined;
	set_zombie_run_cycle(str_restore_move_speed);
}

/*
	Name: function_d2f660ce
	Namespace: zombie_utility
	Checksum: 0xA9B9F29B
	Offset: 0x4BB0
	Size: 0x1E4
	Parameters: 1
	Flags: Linked
*/
function function_d2f660ce(var_a598c292)
{
	if(is_true(self.var_b518759e))
	{
		return var_a598c292;
	}
	if(isdefined(level.var_43fb4347))
	{
		switch(level.var_43fb4347)
		{
			case "run":
			{
				if(var_a598c292 == "walk")
				{
					var_70b46d1c = "run";
				}
				break;
			}
			case "sprint":
			{
				if(var_a598c292 == "walk" || var_a598c292 == "run")
				{
					var_70b46d1c = "sprint";
				}
				break;
			}
			case "super_sprint":
			{
				if(var_a598c292 != "super_sprint")
				{
					var_70b46d1c = "super_sprint";
				}
				break;
			}
		}
	}
	if(isdefined(level.var_102b1301))
	{
		switch(level.var_102b1301)
		{
			case "walk":
			{
				if(var_a598c292 != "walk")
				{
					var_70b46d1c = "walk";
				}
				break;
			}
			case "run":
			{
				if(var_a598c292 == "sprint" || var_a598c292 == "super_sprint")
				{
					var_70b46d1c = "run";
				}
				break;
			}
			case "sprint":
			{
				if(var_a598c292 == "super_sprint")
				{
					var_70b46d1c = "sprint";
				}
				break;
			}
		}
	}
	if(isdefined(var_70b46d1c))
	{
		return var_70b46d1c;
	}
	return var_a598c292;
}

/*
	Name: set_zombie_run_cycle
	Namespace: zombie_utility
	Checksum: 0xBCB71FC5
	Offset: 0x4DA0
	Size: 0x304
	Parameters: 1
	Flags: Linked
*/
function set_zombie_run_cycle(new_move_speed)
{
	if(isdefined(level.var_deb2145c))
	{
		self [[level.var_deb2145c]]();
		return;
	}
	if(isdefined(self.zombie_move_speed_override))
	{
		if(!isdefined(new_move_speed))
		{
			new_move_speed = function_33da7a07();
		}
		new_move_speed = self function_d2f660ce(new_move_speed);
		self.zombie_move_speed_restore = new_move_speed;
		return;
	}
	if(isdefined(new_move_speed))
	{
		self.zombie_move_speed = new_move_speed;
	}
	else
	{
		if(level.gamedifficulty === 0)
		{
			self.zombie_move_speed = function_33da7a07(1);
		}
		else
		{
			self.zombie_move_speed = function_33da7a07();
		}
	}
	self.zombie_move_speed = self function_d2f660ce(self.zombie_move_speed);
	if(isdefined(level.zm_variant_type_max))
	{
		/#
			if(0)
			{
				debug_variant_type = getdvarint(#"scr_zombie_variant_type", -1);
				if(debug_variant_type != -1)
				{
					if(debug_variant_type <= level.zm_variant_type_max[self.zombie_move_speed][self.zombie_arms_position])
					{
						self.variant_type = debug_variant_type;
					}
					else
					{
						self.variant_type = level.zm_variant_type_max[self.zombie_move_speed][self.zombie_arms_position] - 1;
					}
				}
				else
				{
					self.variant_type = randomint(level.zm_variant_type_max[self.zombie_move_speed][self.zombie_arms_position]);
				}
			}
		#/
		if(self.archetype === #"zombie" || self.archetype === #"catalyst")
		{
			if(isdefined(self.zm_variant_type_max))
			{
				self.variant_type = randomint(self.zm_variant_type_max[self.zombie_move_speed][self.zombie_arms_position]);
			}
			else
			{
				self.variant_type = randomint(level.zm_variant_type_max[self.zombie_move_speed][self.zombie_arms_position]);
			}
		}
	}
	self.needs_run_update = 1;
	self notify(#"needs_run_update");
	self.deathanim = self append_missing_legs_suffix("zm_death");
	self callback::callback(#"hash_dfbeaa068b23e7c");
}

/*
	Name: function_33da7a07
	Namespace: zombie_utility
	Checksum: 0xDAA2FCB6
	Offset: 0x50B0
	Size: 0xCA
	Parameters: 1
	Flags: Linked
*/
function function_33da7a07(is_easy)
{
	if(!isdefined(self._starting_round_number))
	{
		self._starting_round_number = level.round_number;
	}
	if(self._starting_round_number == 1)
	{
		n_move_speed = 1;
	}
	else
	{
		n_move_speed = int(self._starting_round_number * function_d2dfacfd(#"zombie_move_speed_multiplier"));
	}
	var_750836cc = randomintrange(n_move_speed, n_move_speed + 35);
	return function_f9c50a93(var_750836cc, is_easy);
}

/*
	Name: function_f9c50a93
	Namespace: zombie_utility
	Checksum: 0x675A2EFA
	Offset: 0x5188
	Size: 0xAA
	Parameters: 2
	Flags: Linked
*/
function function_f9c50a93(move_speed, is_easy)
{
	if(is_true(is_easy))
	{
		if(move_speed <= 35)
		{
			return "walk";
		}
		return "run";
	}
	if(move_speed <= 35)
	{
		return "walk";
	}
	if(move_speed <= 70)
	{
		return "run";
	}
	if(move_speed <= 236)
	{
		return "sprint";
	}
	return "super_sprint";
}

/*
	Name: setup_zombie_knockdown
	Namespace: zombie_utility
	Checksum: 0x2C5C2624
	Offset: 0x5240
	Size: 0x342
	Parameters: 2
	Flags: Linked
*/
function setup_zombie_knockdown(var_5f02306b, var_43b3242)
{
	if(!isactor(self) || is_true(self.missinglegs) || is_true(self.var_5dd07a80) || is_true(self.isinmantleaction) || self isplayinganimscripted() || (self function_dd070839() && !is_true(var_43b3242)))
	{
		return;
	}
	if(!isdefined(var_5f02306b))
	{
		return;
	}
	self.knockdown = 1;
	if(isvec(var_5f02306b))
	{
		zombie_to_entity = var_5f02306b - self.origin;
	}
	else
	{
		zombie_to_entity = var_5f02306b.origin - self.origin;
	}
	zombie_to_entity_2d = vectornormalize((zombie_to_entity[0], zombie_to_entity[1], 0));
	zombie_forward = anglestoforward(self.angles);
	zombie_forward_2d = vectornormalize((zombie_forward[0], zombie_forward[1], 0));
	zombie_right = anglestoright(self.angles);
	zombie_right_2d = vectornormalize((zombie_right[0], zombie_right[1], 0));
	dot = vectordot(zombie_to_entity_2d, zombie_forward_2d);
	if(dot >= 0.5)
	{
		self.knockdown_direction = "front";
		self.getup_direction = "getup_back";
	}
	else
	{
		if(dot < 0.5 && dot > -0.5)
		{
			dot = vectordot(zombie_to_entity_2d, zombie_right_2d);
			if(dot > 0)
			{
				self.knockdown_direction = "right";
				if(math::cointoss())
				{
					self.getup_direction = "getup_back";
				}
				else
				{
					self.getup_direction = "getup_belly";
				}
			}
			else
			{
				self.knockdown_direction = "left";
				self.getup_direction = "getup_belly";
			}
		}
		else
		{
			self.knockdown_direction = "back";
			self.getup_direction = "getup_belly";
		}
	}
}

/*
	Name: function_fc0cb93d
	Namespace: zombie_utility
	Checksum: 0xA9923061
	Offset: 0x5590
	Size: 0x102
	Parameters: 1
	Flags: None
*/
function function_fc0cb93d(entity)
{
	self.pushed = 1;
	zombie_to_entity = entity.origin - self.origin;
	zombie_to_entity_2d = vectornormalize((zombie_to_entity[0], zombie_to_entity[1], 0));
	zombie_right = anglestoright(self.angles);
	zombie_right_2d = vectornormalize((zombie_right[0], zombie_right[1], 0));
	dot = vectordot(zombie_to_entity_2d, zombie_right_2d);
	if(dot < 0)
	{
		self.push_direction = "right";
	}
	else
	{
		self.push_direction = "left";
	}
}

/*
	Name: clear_all_corpses
	Namespace: zombie_utility
	Checksum: 0xE111B4C9
	Offset: 0x56A0
	Size: 0x7C
	Parameters: 0
	Flags: Linked
*/
function clear_all_corpses()
{
	level notify(#"clear_all_corpses");
	corpse_array = getcorpsearray();
	for(i = 0; i < corpse_array.size; i++)
	{
		if(isdefined(corpse_array[i]))
		{
			corpse_array[i] delete();
		}
	}
}

/*
	Name: get_current_actor_count
	Namespace: zombie_utility
	Checksum: 0x77113648
	Offset: 0x5728
	Size: 0x76
	Parameters: 0
	Flags: Linked
*/
function get_current_actor_count()
{
	count = 0;
	actors = getaispeciesarray(level.zombie_team, "all");
	if(isdefined(actors))
	{
		count = count + actors.size;
	}
	count = count + getcorpsearray().size;
	return count;
}

/*
	Name: zombie_gib_on_damage
	Namespace: zombie_utility
	Checksum: 0x7B2F9A4B
	Offset: 0x57A8
	Size: 0xB0
	Parameters: 0
	Flags: Linked
*/
function zombie_gib_on_damage()
{
	self endon(#"death");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"damage");
		self thread zombie_gib(waitresult.amount, waitresult.attacker, waitresult.direction, waitresult.position, waitresult.mod, waitresult.tag_name, waitresult.model_name, waitresult.part_name, waitresult.weapon, waitresult.var_fd90b0bb);
	}
}

/*
	Name: zombie_gib
	Namespace: zombie_utility
	Checksum: 0x7AAE0254
	Offset: 0x5860
	Size: 0x890
	Parameters: 10
	Flags: Linked
*/
function zombie_gib(amount, attacker, direction_vec, point, type, tagname, modelname, partname, weapon, var_fd90b0bb)
{
	if(!isdefined(self))
	{
		return;
	}
	if(!self zombie_should_gib(type, tagname, partname, weapon))
	{
		return;
	}
	if(self head_should_gib(tagname, partname, modelname, weapon) && partname != "MOD_BURNED")
	{
		self zombie_head_gib(weapon, var_fd90b0bb, tagname, partname);
		return;
	}
	if(!is_true(self.gibbed) && !isdefined(self.damagelocation))
	{
		if(type >= (self.maxhealth * 0.5) && (partname != "MOD_GRENADE" || partname != "MOD_GRENADE_SPLASH" || partname != "MOD_PROJECTILE" || partname != "MOD_PROJECTILE_SPLASH"))
		{
			self derive_damage_refs(weapon, var_fd90b0bb, modelname, 0);
		}
	}
	if(!is_true(self.gibbed) && isdefined(self.damagelocation))
	{
		if(self damagelocationisany("head", "helmet", "neck"))
		{
			return;
		}
		if(self damagelocationisany("right_leg_upper", "right_leg_lower", "right_foot", "left_leg_upper", "left_leg_lower", "left_foot") && type < (self.maxhealth * 0.5) && (partname != "MOD_GRENADE" || partname != "MOD_GRENADE_SPLASH" || partname != "MOD_PROJECTILE" || partname != "MOD_PROJECTILE_SPLASH"))
		{
			return;
		}
		self.stumble = undefined;
		b_gibbed = 1;
		var_c3317960 = gibserverutils::function_de4d9d(weapon, var_fd90b0bb);
		switch(self.damagelocation)
		{
			case "right_arm_lower":
			case "right_arm_upper":
			case "right_hand":
			{
				if(!gibserverutils::isgibbed(self, 32))
				{
					gibserverutils::gibrightarm(self, var_c3317960);
				}
				break;
			}
			case "left_arm_lower":
			case "left_arm_upper":
			case "left_hand":
			{
				if(!gibserverutils::isgibbed(self, 16))
				{
					gibserverutils::gibleftarm(self, var_c3317960);
				}
				break;
			}
			case "right_leg_upper":
			case "right_leg_lower":
			case "right_foot":
			{
				if(is_true(self.nocrawler) || is_true(level.var_41259f0d) || ((isdefined(level.num_crawlers) ? level.num_crawlers : 0)) || gibserverutils::isgibbed(self, 16) || gibserverutils::isgibbed(self, 32))
				{
					break;
				}
				gibserverutils::gibrightleg(self, var_c3317960);
				if(randomint(100) > 75)
				{
					gibserverutils::gibleftleg(self, var_c3317960);
				}
				self function_df5afb5e(1);
				break;
			}
			case "left_leg_lower":
			case "left_foot":
			case "left_leg_upper":
			{
				if(is_true(self.nocrawler) || is_true(level.var_41259f0d) || ((isdefined(level.num_crawlers) ? level.num_crawlers : 0)) || gibserverutils::isgibbed(self, 16) || gibserverutils::isgibbed(self, 32))
				{
					break;
				}
				gibserverutils::gibleftleg(self, var_c3317960);
				if(randomint(100) > 75)
				{
					gibserverutils::gibrightleg(self, var_c3317960);
				}
				self function_df5afb5e(1);
				break;
			}
			default:
			{
				if(self.damagelocation == "none")
				{
					if(partname == "MOD_GRENADE" || partname == "MOD_GRENADE_SPLASH" || partname == "MOD_PROJECTILE" || partname == "MOD_PROJECTILE_SPLASH")
					{
						self derive_damage_refs(weapon, var_fd90b0bb, modelname);
						break;
					}
				}
			}
		}
		if(isdefined(level.custom_derive_damage_refs))
		{
			self [[level.custom_derive_damage_refs]](weapon, var_fd90b0bb, modelname);
		}
		if(is_true(self.missinglegs) && self.health > 0)
		{
			b_gibbed = 1;
			level notify(#"crawler_created", {#weapon:weapon, #player:tagname, #zombie:self});
			self allowedstances("crouch");
			self setphysparams(15, 0, 24);
			self allowpitchangle(1);
			self setpitchorient();
			health = self.health;
			health = health * 0.1;
			if(isdefined(self.crawl_anim_override))
			{
				self [[self.crawl_anim_override]]();
			}
		}
		if(b_gibbed && self.health > 0)
		{
			if(isdefined(level.gib_on_damage))
			{
				self thread [[level.gib_on_damage]](tagname);
			}
		}
	}
}

/*
	Name: add_zombie_gib_weapon_callback
	Namespace: zombie_utility
	Checksum: 0x928AC88F
	Offset: 0x60F8
	Size: 0x74
	Parameters: 3
	Flags: Linked
*/
function add_zombie_gib_weapon_callback(weapon_name, gib_callback, gib_head_callback)
{
	if(!isdefined(level.zombie_gib_weapons))
	{
		level.zombie_gib_weapons = [];
	}
	if(!isdefined(level.zombie_gib_head_weapons))
	{
		level.zombie_gib_head_weapons = [];
	}
	level.zombie_gib_weapons[weapon_name] = gib_callback;
	level.zombie_gib_head_weapons[weapon_name] = gib_head_callback;
}

/*
	Name: have_zombie_weapon_gib_callback
	Namespace: zombie_utility
	Checksum: 0x3C7EFEBC
	Offset: 0x6178
	Size: 0x86
	Parameters: 1
	Flags: Linked
*/
function have_zombie_weapon_gib_callback(weapon)
{
	if(!isdefined(level.zombie_gib_weapons))
	{
		level.zombie_gib_weapons = [];
	}
	if(!isdefined(level.zombie_gib_head_weapons))
	{
		level.zombie_gib_head_weapons = [];
	}
	if(isweapon(weapon))
	{
		weapon = weapon.name;
	}
	if(isdefined(level.zombie_gib_weapons[weapon]))
	{
		return true;
	}
	return false;
}

/*
	Name: get_zombie_weapon_gib_callback
	Namespace: zombie_utility
	Checksum: 0x705B4685
	Offset: 0x6208
	Size: 0xA4
	Parameters: 2
	Flags: Linked
*/
function get_zombie_weapon_gib_callback(weapon, damage_percent)
{
	if(!isdefined(level.zombie_gib_weapons))
	{
		level.zombie_gib_weapons = [];
	}
	if(!isdefined(level.zombie_gib_head_weapons))
	{
		level.zombie_gib_head_weapons = [];
	}
	if(isweapon(weapon))
	{
		weapon = weapon.name;
	}
	if(isdefined(level.zombie_gib_weapons[weapon]))
	{
		return self [[level.zombie_gib_weapons[weapon]]](damage_percent);
	}
	return 0;
}

/*
	Name: have_zombie_weapon_gib_head_callback
	Namespace: zombie_utility
	Checksum: 0x6426EA51
	Offset: 0x62B8
	Size: 0x86
	Parameters: 1
	Flags: Linked
*/
function have_zombie_weapon_gib_head_callback(weapon)
{
	if(!isdefined(level.zombie_gib_weapons))
	{
		level.zombie_gib_weapons = [];
	}
	if(!isdefined(level.zombie_gib_head_weapons))
	{
		level.zombie_gib_head_weapons = [];
	}
	if(isweapon(weapon))
	{
		weapon = weapon.name;
	}
	if(isdefined(level.zombie_gib_head_weapons[weapon]))
	{
		return true;
	}
	return false;
}

/*
	Name: get_zombie_weapon_gib_head_callback
	Namespace: zombie_utility
	Checksum: 0xCB517E19
	Offset: 0x6348
	Size: 0xA4
	Parameters: 2
	Flags: Linked
*/
function get_zombie_weapon_gib_head_callback(weapon, damage_location)
{
	if(!isdefined(level.zombie_gib_weapons))
	{
		level.zombie_gib_weapons = [];
	}
	if(!isdefined(level.zombie_gib_head_weapons))
	{
		level.zombie_gib_head_weapons = [];
	}
	if(isweapon(weapon))
	{
		weapon = weapon.name;
	}
	if(isdefined(level.zombie_gib_head_weapons[weapon]))
	{
		return self [[level.zombie_gib_head_weapons[weapon]]](damage_location);
	}
	return 0;
}

/*
	Name: zombie_should_gib
	Namespace: zombie_utility
	Checksum: 0xECC4425B
	Offset: 0x63F8
	Size: 0x298
	Parameters: 4
	Flags: Linked
*/
function zombie_should_gib(amount, attacker, type, weapon)
{
	if(!isdefined(type))
	{
		return false;
	}
	if(is_true(self.is_on_fire))
	{
		return false;
	}
	if(isdefined(self.no_gib) && self.no_gib == 1)
	{
		return false;
	}
	prev_health = amount + self.health;
	if(prev_health <= 0)
	{
		prev_health = 1;
	}
	damage_percent = (amount / prev_health) * 100;
	if(isdefined(attacker))
	{
		if(isplayer(attacker) || is_true(attacker.can_gib_zombies))
		{
			if(isdefined(weapon) && is_true(weapon.doannihilate))
			{
				return false;
			}
			if(have_zombie_weapon_gib_callback(weapon))
			{
				if(self get_zombie_weapon_gib_callback(weapon, damage_percent))
				{
					return true;
				}
				return false;
			}
		}
	}
	switch(type)
	{
		case "mod_telefrag":
		case "mod_unknown":
		case "mod_burned":
		case "mod_trigger_hurt":
		case "mod_suicide":
		case "mod_falling":
		{
			return false;
		}
		case "mod_melee":
		{
			return false;
		}
	}
	if(type == "MOD_PISTOL_BULLET" || type == "MOD_RIFLE_BULLET")
	{
		if(!isdefined(attacker) || !isplayer(attacker))
		{
			return false;
		}
		if(weapon == level.weaponnone || (isdefined(level.start_weapon) && weapon == level.start_weapon) || weapon.isgasweapon)
		{
			return false;
		}
	}
	return true;
}

/*
	Name: head_should_gib
	Namespace: zombie_utility
	Checksum: 0x35E489A2
	Offset: 0x6698
	Size: 0x38E
	Parameters: 4
	Flags: Linked
*/
function head_should_gib(attacker, type, point, weaponused)
{
	if(is_true(self.head_gibbed))
	{
		return false;
	}
	if(!isdefined(attacker) || !isplayer(attacker))
	{
		if(!is_true(attacker.can_gib_zombies))
		{
			return false;
		}
	}
	if(isplayer(attacker))
	{
		weapon = attacker getcurrentweapon();
	}
	else
	{
		weapon = attacker.weapon;
	}
	if(have_zombie_weapon_gib_head_callback(weapon))
	{
		if(self get_zombie_weapon_gib_head_callback(weapon, self.damagelocation))
		{
			return true;
		}
		return false;
	}
	if(type != "MOD_RIFLE_BULLET" && type != "MOD_PISTOL_BULLET")
	{
		if(type == "MOD_GRENADE" || type == "MOD_GRENADE_SPLASH")
		{
			if(distance(point, self gettagorigin("j_head")) > 16 || (isdefined(weaponused) && isdefined(weaponused.explosionradius) && weaponused.explosionradius < distance(point, self gettagorigin("j_head"))))
			{
				return false;
			}
			return true;
		}
		if(type == "MOD_PROJECTILE")
		{
			if(distance(point, self gettagorigin("j_head")) > 10)
			{
				return false;
			}
			return true;
		}
		if(weapon.weapclass != "spread")
		{
			return false;
		}
	}
	if(!self damagelocationisany("head", "helmet", "neck"))
	{
		return false;
	}
	if(type == "MOD_PISTOL_BULLET" && weapon.weapclass != "smg" || weapon == level.weaponnone || (isdefined(level.start_weapon) && weapon == level.start_weapon) || weapon.isgasweapon)
	{
		return false;
	}
	if(sessionmodeiscampaigngame() && (type == "MOD_PISTOL_BULLET" && weapon.weapclass != "smg"))
	{
		return false;
	}
	low_health_percent = (self.health / self.maxhealth) * 100;
	if(low_health_percent > 10)
	{
		return false;
	}
	return true;
}

/*
	Name: zombie_hat_gib
	Namespace: zombie_utility
	Checksum: 0xFC2DBDA
	Offset: 0x6A30
	Size: 0x114
	Parameters: 2
	Flags: None
*/
function zombie_hat_gib(attacker, means_of_death)
{
	self endon(#"death");
	if(is_true(self.hat_gibbed))
	{
		return;
	}
	if(!isdefined(self.gibspawn5) || !isdefined(self.gibspawntag5))
	{
		return;
	}
	self.hat_gibbed = 1;
	if(isdefined(self.hatmodel))
	{
		self detach(self.hatmodel, "");
	}
	temp_array = [];
	temp_array[0] = level._zombie_gib_piece_index_hat;
	self gib("normal", temp_array);
	if(isdefined(level.track_gibs))
	{
		level [[level.track_gibs]](self, temp_array);
	}
}

/*
	Name: damage_over_time
	Namespace: zombie_utility
	Checksum: 0x991B57F4
	Offset: 0x6B50
	Size: 0x158
	Parameters: 4
	Flags: Linked
*/
function damage_over_time(dmg, delay, attacker, means_of_death)
{
	self endon(#"death", #"exploding");
	self endon(#"exploding");
	if(!isalive(self))
	{
		return;
	}
	if(!isplayer(attacker))
	{
		attacker = self;
	}
	if(!isdefined(means_of_death))
	{
		means_of_death = "MOD_UNKNOWN";
	}
	while(true)
	{
		if(isdefined(delay))
		{
			wait(delay);
		}
		if(isdefined(self))
		{
			var_223fc6f5 = self gettagorigin("j_neck");
			if(!isdefined(var_223fc6f5))
			{
				var_223fc6f5 = self.origin;
			}
			if(isdefined(attacker))
			{
				self dodamage(dmg, var_223fc6f5, attacker, self, self.damagelocation, means_of_death, 4096, self.damageweapon);
			}
			else
			{
				self dodamage(dmg, var_223fc6f5);
			}
		}
	}
}

/*
	Name: derive_damage_refs
	Namespace: zombie_utility
	Checksum: 0x1672FEFD
	Offset: 0x6CB0
	Size: 0x584
	Parameters: 4
	Flags: Linked
*/
function derive_damage_refs(weapon, var_fd90b0bb, point, var_87a07ff5)
{
	if(!isdefined(var_87a07ff5))
	{
		var_87a07ff5 = 1;
	}
	if(!isdefined(self))
	{
		return;
	}
	if(!isdefined(point))
	{
		return;
	}
	if(!isdefined(level.gib_tags))
	{
		init_gib_tags();
	}
	closesttag = "tag_origin";
	var_19874b3 = [];
	for(i = 0; i < level.gib_tags.size; i++)
	{
		if(self haspart(level.gib_tags[i]))
		{
			var_19874b3[var_19874b3.size] = {#origin:self gettagorigin(level.gib_tags[i]), #tag:level.gib_tags[i]};
		}
	}
	var_6844367f = arraygetclosest(point, var_19874b3);
	if(isdefined(var_6844367f))
	{
		closesttag = var_6844367f.tag;
	}
	var_c3317960 = gibserverutils::function_de4d9d(weapon, var_fd90b0bb);
	if(closesttag == "J_SpineLower" || closesttag == "J_SpineUpper" || closesttag == "J_Spine4")
	{
		gibserverutils::gibrightarm(self, var_c3317960);
	}
	else
	{
		if(closesttag == "J_Shoulder_LE" || closesttag == "J_Elbow_LE" || closesttag == "J_Wrist_LE")
		{
			if(!gibserverutils::isgibbed(self, 16))
			{
				gibserverutils::gibleftarm(self, var_c3317960);
			}
		}
		else
		{
			if(closesttag == "J_Shoulder_RI" || closesttag == "J_Elbow_RI" || closesttag == "J_Wrist_RI")
			{
				if(!gibserverutils::isgibbed(self, 32))
				{
					gibserverutils::gibrightarm(self, var_c3317960);
				}
			}
			else
			{
				if(closesttag == "J_Hip_LE" || closesttag == "J_Knee_LE" || closesttag == "J_Ankle_LE")
				{
					if(is_true(self.nocrawler) || is_true(level.var_41259f0d) || ((isdefined(level.num_crawlers) ? level.num_crawlers : 0)) || gibserverutils::isgibbed(self, 16) || gibserverutils::isgibbed(self, 32))
					{
						return;
					}
					gibserverutils::gibleftleg(self, var_c3317960);
					if(var_87a07ff5)
					{
						if(randomint(100) > 75)
						{
							gibserverutils::gibrightleg(self, var_c3317960);
						}
					}
					self function_df5afb5e(1);
				}
				else if(closesttag == "J_Hip_RI" || closesttag == "J_Knee_RI" || closesttag == "J_Ankle_RI")
				{
					if(is_true(self.nocrawler) || is_true(level.var_41259f0d) || ((isdefined(level.num_crawlers) ? level.num_crawlers : 0)) || gibserverutils::isgibbed(self, 16) || gibserverutils::isgibbed(self, 32))
					{
						return;
					}
					gibserverutils::gibrightleg(self, var_c3317960);
					if(var_87a07ff5)
					{
						if(randomint(100) > 75)
						{
							gibserverutils::gibleftleg(self, var_c3317960);
						}
					}
					self function_df5afb5e(1);
				}
			}
		}
	}
}

/*
	Name: init_gib_tags
	Namespace: zombie_utility
	Checksum: 0xC4FC9362
	Offset: 0x7240
	Size: 0x14C
	Parameters: 0
	Flags: Linked
*/
function init_gib_tags()
{
	tags = [];
	tags[tags.size] = "J_SpineLower";
	tags[tags.size] = "J_SpineUpper";
	tags[tags.size] = "J_Spine4";
	tags[tags.size] = "J_Shoulder_LE";
	tags[tags.size] = "J_Elbow_LE";
	tags[tags.size] = "J_Wrist_LE";
	tags[tags.size] = "J_Shoulder_RI";
	tags[tags.size] = "J_Elbow_RI";
	tags[tags.size] = "J_Wrist_RI";
	tags[tags.size] = "J_Hip_LE";
	tags[tags.size] = "J_Knee_LE";
	tags[tags.size] = "J_Ankle_LE";
	tags[tags.size] = "J_Hip_RI";
	tags[tags.size] = "J_Knee_RI";
	tags[tags.size] = "J_Ankle_RI";
	level.gib_tags = tags;
}

/*
	Name: getanimdirection
	Namespace: zombie_utility
	Checksum: 0x26731A1D
	Offset: 0x7398
	Size: 0x96
	Parameters: 1
	Flags: None
*/
function getanimdirection(damageyaw)
{
	if(damageyaw > 135 || damageyaw <= -135)
	{
		return "front";
	}
	if(damageyaw > 45 && damageyaw <= 135)
	{
		return "right";
	}
	if(damageyaw > -45 && damageyaw <= 45)
	{
		return "back";
	}
	return "left";
}

/*
	Name: makezombiecrawler
	Namespace: zombie_utility
	Checksum: 0x6032404D
	Offset: 0x7440
	Size: 0x208
	Parameters: 1
	Flags: Linked
*/
function makezombiecrawler(b_both_legs)
{
	if(is_true(level.var_41259f0d) || ((isdefined(level.num_crawlers) ? level.num_crawlers : 0)))
	{
		return;
	}
	if(is_true(b_both_legs))
	{
		val = 100;
	}
	else
	{
		val = randomint(100);
	}
	if(val > 75)
	{
		gibserverutils::gibrightleg(self, 0);
		gibserverutils::gibleftleg(self, 0);
	}
	else
	{
		if(val > 37)
		{
			gibserverutils::gibrightleg(self, 0);
		}
		else
		{
			gibserverutils::gibleftleg(self, 0);
		}
	}
	self.has_legs = 0;
	self function_df5afb5e(1);
	self allowedstances("crouch");
	self setphysparams(15, 0, 24);
	self allowpitchangle(1);
	self setpitchorient();
	health = self.health;
	health = health * 0.1;
}

/*
	Name: zombie_head_gib
	Namespace: zombie_utility
	Checksum: 0x93931FFF
	Offset: 0x7650
	Size: 0xEC
	Parameters: 4
	Flags: Linked
*/
function zombie_head_gib(weapon, var_fd90b0bb, attacker, means_of_death)
{
	self endon(#"death");
	if(is_true(self.head_gibbed))
	{
		return;
	}
	self.head_gibbed = 1;
	if(!is_true(self.disable_head_gib))
	{
		gibserverutils::gibhead(self, gibserverutils::function_de4d9d(weapon, var_fd90b0bb));
	}
	self thread damage_over_time(ceil(self.health * 0.2), 1, attacker, means_of_death);
}

/*
	Name: gib_random_part
	Namespace: zombie_utility
	Checksum: 0x81CAAD0C
	Offset: 0x7748
	Size: 0x1CA
	Parameters: 0
	Flags: None
*/
function gib_random_part()
{
	if(is_true(self.no_gib))
	{
		return;
	}
	playsoundatposition(#"zmb_death_gibss", self.origin);
	gib_index = randomint(5);
	if(gib_index == 3 && gibserverutils::isgibbed(self, 32) || (gib_index == 4 && gibserverutils::isgibbed(self, 16)))
	{
		gib_index = randomint(3);
	}
	switch(gib_index)
	{
		case 0:
		{
			self zombie_head_gib();
			break;
		}
		case 1:
		{
			gibserverutils::gibrightleg(self, 0);
			break;
		}
		case 2:
		{
			gibserverutils::gibleftleg(self, 0);
			break;
		}
		case 3:
		{
			gibserverutils::gibrightarm(self, 0);
			break;
		}
		case 4:
		{
			gibserverutils::gibleftarm(self, 0);
			break;
		}
		default:
		{
			break;
		}
	}
}

/*
	Name: gib_random_parts
	Namespace: zombie_utility
	Checksum: 0x9B27228
	Offset: 0x7920
	Size: 0x1BC
	Parameters: 0
	Flags: Linked
*/
function gib_random_parts()
{
	if(is_true(self.no_gib))
	{
		return;
	}
	playsoundatposition(#"zmb_death_gibss", self.origin);
	val = randomint(100);
	if(val > 50)
	{
		self zombie_head_gib();
	}
	val = randomint(100);
	if(val > 50)
	{
		gibserverutils::gibrightleg(self, 0);
	}
	val = randomint(100);
	if(val > 50)
	{
		gibserverutils::gibleftleg(self, 0);
	}
	val = randomint(100);
	if(val > 50)
	{
		if(!gibserverutils::isgibbed(self, 32))
		{
			gibserverutils::gibrightarm(self, 0);
		}
	}
	val = randomint(100);
	if(val > 50)
	{
		if(!gibserverutils::isgibbed(self, 16))
		{
			gibserverutils::gibleftarm(self, 0);
		}
	}
}

/*
	Name: function_df5afb5e
	Namespace: zombie_utility
	Checksum: 0xD83D3675
	Offset: 0x7AE8
	Size: 0xD2
	Parameters: 1
	Flags: Linked
*/
function function_df5afb5e(missinglegs)
{
	if(!isdefined(missinglegs))
	{
		missinglegs = 0;
	}
	if(missinglegs)
	{
		self.var_177172b0 = gettime();
		self.knockdown = 0;
		if(is_true(self.var_1731eda3))
		{
			self.var_1731eda3 = undefined;
		}
		if(isdefined(level.var_9b91564e))
		{
			if(!isdefined(level.num_crawlers))
			{
				level.num_crawlers = 0;
			}
			level.num_crawlers++;
			self callback::function_d8abfc3d(#"on_ai_killed", &function_c768f32b);
		}
	}
	self.missinglegs = missinglegs;
}

/*
	Name: function_c768f32b
	Namespace: zombie_utility
	Checksum: 0x27B267EB
	Offset: 0x7BC8
	Size: 0x18
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c768f32b(params)
{
	level.num_crawlers--;
}

/*
	Name: init_ignore_player_handler
	Namespace: zombie_utility
	Checksum: 0x6C0BC36
	Offset: 0x7BE8
	Size: 0x10
	Parameters: 0
	Flags: AutoExec
*/
function autoexec init_ignore_player_handler()
{
	level._ignore_player_handler = [];
}

/*
	Name: register_ignore_player_handler
	Namespace: zombie_utility
	Checksum: 0x5F8DF5BE
	Offset: 0x7C00
	Size: 0x84
	Parameters: 2
	Flags: None
*/
function register_ignore_player_handler(archetype, ignore_player_func)
{
	/#
		assert(isdefined(archetype), "");
	#/
	/#
		assert(!isdefined(level._ignore_player_handler[archetype]), ("" + archetype) + "");
	#/
	level._ignore_player_handler[archetype] = ignore_player_func;
}

/*
	Name: run_ignore_player_handler
	Namespace: zombie_utility
	Checksum: 0x6132510E
	Offset: 0x7C90
	Size: 0x36
	Parameters: 0
	Flags: Linked
*/
function run_ignore_player_handler()
{
	if(isdefined(level._ignore_player_handler[self.archetype]))
	{
		self [[level._ignore_player_handler[self.archetype]]]();
	}
}

/*
	Name: updateanimationrate
	Namespace: zombie_utility
	Checksum: 0xB63DC0F1
	Offset: 0x7CD0
	Size: 0x118
	Parameters: 0
	Flags: None
*/
function updateanimationrate()
{
	/#
		self notify(#"updateanimationrate");
		self endon(#"death", #"updateanimationrate");
		settings_bundle = self ai::function_9139c839();
		if(!isdefined(settings_bundle))
		{
			return;
		}
		var_fd8e23d9 = self ai::function_9139c839().var_450edb3b;
		if(isdefined(var_fd8e23d9))
		{
			self asmsetanimationrate(var_fd8e23d9);
		}
		while(true)
		{
			wait(1);
			animation_rate = self ai::function_9139c839().var_450edb3b;
			if(!isdefined(animation_rate))
			{
				return;
			}
			if(var_fd8e23d9 == animation_rate)
			{
				continue;
			}
			self asmsetanimationrate(animation_rate);
			var_fd8e23d9 = animation_rate;
		}
	#/
}

