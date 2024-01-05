#using scripts\core_common\bots\bot.gsc;
#using scripts\core_common\bots\bot_animation.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace bot_traversals;

/*
	Name: function_f9ef1998
	Namespace: bot_traversals
	Checksum: 0x477DF624
	Offset: 0xA0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f9ef1998()
{
	level notify(-647304488);
}

/*
	Name: function_70a657d8
	Namespace: bot_traversals
	Checksum: 0x4663C1E5
	Offset: 0xC0
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	callback::add_callback(#"hash_767bb029d2dcda7c", &function_45ed4ebd);
}

/*
	Name: function_45ed4ebd
	Namespace: bot_traversals
	Checksum: 0x94C9E53D
	Offset: 0x100
	Size: 0x15C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_45ed4ebd(eventstruct)
{
	if(self isplayinganimscripted())
	{
		return;
	}
	self function_c8aebd21(eventstruct);
	if(isdefined(eventstruct.var_921d19f9) && eventstruct.var_921d19f9 == 0)
	{
		self function_38db71f(eventstruct);
	}
	if(function_5186819c(eventstruct))
	{
		self thread function_342c7f77(eventstruct);
	}
	else
	{
		if(function_51cbae24(eventstruct))
		{
			self thread function_e48afac9(eventstruct);
		}
		else
		{
			if(isdefined(eventstruct.var_a8cc518d))
			{
				self thread function_9bd9969f(eventstruct);
			}
			else
			{
				if(eventstruct.deltaz > 0 || eventstruct.var_d9db209e > 30)
				{
					self thread function_adeef583(eventstruct);
				}
				else
				{
					self thread function_b2ff3887(eventstruct);
				}
			}
		}
	}
}

/*
	Name: function_b1528302
	Namespace: bot_traversals
	Checksum: 0xB8E94FAF
	Offset: 0x268
	Size: 0x84
	Parameters: 2
	Flags: Linked, Private
*/
function private function_b1528302(eventstruct, type)
{
	/#
		self thread function_c20f7b00(eventstruct, "" + function_9e72a96(type));
	#/
	eventstruct.type = type;
	self.bot.traversal = eventstruct;
	self bottakemanualcontrol();
}

/*
	Name: function_1aaef814
	Namespace: bot_traversals
	Checksum: 0xC2FC9EC2
	Offset: 0x2F8
	Size: 0x54
	Parameters: 1
	Flags: Linked, Private
*/
function private function_1aaef814(notifyhash)
{
	self.bot.traversal = undefined;
	self.bot.traversaltype = undefined;
	if(isbot(self))
	{
		self botreleasemanualcontrol();
	}
}

/*
	Name: function_5186819c
	Namespace: bot_traversals
	Checksum: 0x33F737AB
	Offset: 0x358
	Size: 0x52
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5186819c(eventstruct)
{
	return isdefined(eventstruct.start_node) && isdefined(eventstruct.start_node.spawnflags) && eventstruct.start_node.spawnflags & 134217728;
}

/*
	Name: function_51cbae24
	Namespace: bot_traversals
	Checksum: 0x5EE1D292
	Offset: 0x3B8
	Size: 0xAA
	Parameters: 1
	Flags: Linked, Private
*/
function private function_51cbae24(eventstruct)
{
	if(eventstruct.deltaz < 18 || isdefined(eventstruct.var_921d19f9) || isdefined(eventstruct.var_a8cc518d) || !isdefined(eventstruct.start_node) || !isdefined(eventstruct.end_node))
	{
		return 0;
	}
	return eventstruct.start_node.spawnflags & 4194304 || eventstruct.end_node.spawnflags & 4194304;
}

/*
	Name: function_c8aebd21
	Namespace: bot_traversals
	Checksum: 0x1D13FE09
	Offset: 0x470
	Size: 0x1DA
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c8aebd21(eventstruct)
{
	startpos = eventstruct.start_position;
	endpos = eventstruct.end_position;
	tracedist = distance2d(startpos, endpos);
	traversaldir = endpos - startpos;
	var_883d42a7 = checknavmeshdirection(startpos, traversaldir, tracedist, 0);
	eventstruct.var_883d42a7 = var_883d42a7;
	var_695ff8a6 = startpos - endpos;
	var_15dca465 = checknavmeshdirection(endpos, var_695ff8a6, tracedist, 0);
	eventstruct.var_15dca465 = var_15dca465;
	var_492af6a = physicstrace(startpos, var_883d42a7, (-15, -15, 18), (15, 15, 72), self, 32);
	eventstruct.var_75f5c2cb = var_492af6a[#"position"];
	normal = vectornormalize((var_695ff8a6[0], var_695ff8a6[1], 0));
	eventstruct.normal = normal;
	eventstruct.var_d9db209e = vectordot(normal, var_883d42a7 - var_15dca465);
	eventstruct.deltaz = eventstruct.var_15dca465[2] - eventstruct.var_883d42a7[2];
}

/*
	Name: function_38db71f
	Namespace: bot_traversals
	Checksum: 0x8D2608C
	Offset: 0x658
	Size: 0x1DA
	Parameters: 1
	Flags: Linked, Private
*/
function private function_38db71f(eventstruct)
{
	if(eventstruct.deltaz >= 18 || eventstruct.deltaz < -18)
	{
		return;
	}
	start = eventstruct.start_position + (0, 0, 9);
	end = eventstruct.end_position + (0, 0, 9);
	/#
		eventstruct.var_34a82e04 = start;
		eventstruct.var_5162591f = end;
	#/
	var_e74d8d10 = groundtrace(start, end, 0, self, 1, 1);
	if(var_e74d8d10[#"fraction"] >= 1)
	{
		return;
	}
	var_1582cba2 = var_e74d8d10[#"position"];
	dir = vectornormalize(end - start);
	var_74433575 = (var_1582cba2 + (dir * 5)) + vectorscale((0, 0, 1), 60);
	/#
		eventstruct.var_87d52c5 = var_74433575;
		eventstruct.var_19c7b18b = var_1582cba2;
	#/
	var_924b2657 = groundtrace(var_74433575, var_1582cba2, 0, self, 1, 1);
	toppos = var_924b2657[#"position"];
	eventstruct.var_a8cc518d = (var_1582cba2[0], var_1582cba2[1], toppos[2]);
}

/*
	Name: function_342c7f77
	Namespace: bot_traversals
	Checksum: 0x432250B8
	Offset: 0x840
	Size: 0x34
	Parameters: 1
	Flags: Linked, Private
*/
function private function_342c7f77(eventstruct)
{
	/#
		self thread function_c20f7b00(eventstruct, "");
	#/
}

/*
	Name: function_e48afac9
	Namespace: bot_traversals
	Checksum: 0x365DA5FF
	Offset: 0x880
	Size: 0x1AC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e48afac9(eventstruct)
{
	self endoncallback(&function_1aaef814, #"death", #"hash_3525e39d3694d0a9", #"hash_72f42e7610533d49", #"entering_last_stand", #"animscripted_start");
	self function_b1528302(eventstruct, #"ladder");
	self botsetmovepoint(eventstruct.end_position);
	self botsetmovemagnitude(1);
	while(!self isonladder())
	{
		waitframe(1);
	}
	normal = eventstruct.normal;
	var_b12a81ce = eventstruct.var_15dca465;
	while(self isonladder() || !self isonground() || (vectordot(normal, var_b12a81ce - self.origin)) < 15)
	{
		waitframe(1);
	}
	self function_1aaef814();
}

/*
	Name: function_9bd9969f
	Namespace: bot_traversals
	Checksum: 0xCDF0BB98
	Offset: 0xA38
	Size: 0x3B4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9bd9969f(eventstruct)
{
	self endoncallback(&function_1aaef814, #"death", #"hash_3525e39d3694d0a9", #"hash_72f42e7610533d49", #"entering_last_stand", #"animscripted_start");
	self function_b1528302(eventstruct, #"vault");
	self botsetmovepoint(eventstruct.end_position);
	self botsetmovemagnitude(1);
	normal = eventstruct.normal;
	var_75f5c2cb = eventstruct.var_75f5c2cb;
	do
	{
		waitframe(1);
		var_3566f0b1 = vectordot(self.origin - var_75f5c2cb, normal);
	}
	while(var_3566f0b1 > 8);
	var_2166cb2 = eventstruct.var_a8cc518d;
	do
	{
		self bottapbutton(10);
		self bottapbutton(64);
		waitframe(1);
		var_2aab82d7 = vectordot(self.origin - var_2166cb2, normal);
	}
	while(!self ismantling() && !self isonground() && var_2aab82d7 >= 0);
	while(self ismantling())
	{
		waitframe(1);
	}
	endpos = eventstruct.end_position;
	enddist = vectordot(self.origin - endpos, normal);
	while((var_2166cb2[2] - self.origin[2]) < 18 && enddist > 15)
	{
		waitframe(1);
		enddist = vectordot(self.origin - endpos, normal);
	}
	if(!self isonground() && !self isplayerswimming())
	{
		self botsetmovemagnitude(0);
		velocity = self getvelocity();
		self setvelocity((0, 0, velocity[2]));
		waitframe(1);
		while(!self isonground() && !self isplayerswimming())
		{
			waitframe(1);
		}
	}
	self function_1aaef814();
}

/*
	Name: function_adeef583
	Namespace: bot_traversals
	Checksum: 0xB060D715
	Offset: 0xDF8
	Size: 0x28C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_adeef583(eventstruct)
{
	self endoncallback(&function_1aaef814, #"death", #"hash_3525e39d3694d0a9", #"hash_72f42e7610533d49", #"entering_last_stand", #"animscripted_start");
	self function_b1528302(eventstruct, #"jump");
	endpos = eventstruct.var_15dca465;
	self botsetmovepoint(endpos);
	self botsetmovemagnitude(1);
	normal = eventstruct.normal;
	var_75f5c2cb = eventstruct.var_75f5c2cb;
	do
	{
		waitframe(1);
		var_3566f0b1 = vectordot(self.origin - var_75f5c2cb, normal);
	}
	while(var_3566f0b1 > 8);
	do
	{
		self bottapbutton(10);
		self bottapbutton(64);
		waitframe(1);
		enddist = vectordot(self.origin - endpos, normal);
	}
	while(!self ismantling() && enddist > 0);
	landed = self isplayerswimming() || self isonground();
	while(self ismantling() || !landed)
	{
		waitframe(1);
		landed = self isplayerswimming() || self isonground();
	}
	self function_1aaef814();
}

/*
	Name: function_b2ff3887
	Namespace: bot_traversals
	Checksum: 0x80DB89DF
	Offset: 0x1090
	Size: 0x25C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b2ff3887(eventstruct)
{
	self endoncallback(&function_1aaef814, #"death", #"hash_3525e39d3694d0a9", #"hash_72f42e7610533d49", #"entering_last_stand", #"animscripted_start");
	self function_b1528302(eventstruct, #"drop");
	self botsetmovepoint(eventstruct.end_position);
	self botsetmovemagnitude(1);
	normal = eventstruct.normal;
	var_75f5c2cb = eventstruct.var_75f5c2cb;
	var_883d42a7 = eventstruct.var_883d42a7;
	var_ba06b3fa = (vectordot(normal, var_75f5c2cb - var_883d42a7)) > (15 - 1);
	while(self isonground())
	{
		if(var_ba06b3fa)
		{
			self bottapbutton(9);
		}
		waitframe(1);
	}
	self botsetmovemagnitude(0);
	velocity = self getvelocity();
	self setvelocity((0, 0, velocity[2]));
	while(!self isonground() && !self isplayerswimming())
	{
		waitframe(1);
	}
	self function_1aaef814(eventstruct);
}

/*
	Name: function_c3452ef9
	Namespace: bot_traversals
	Checksum: 0x5F166689
	Offset: 0x12F8
	Size: 0xC6
	Parameters: 1
	Flags: Private
*/
function private function_c3452ef9(eventstruct)
{
	/#
		self thread function_c20f7b00(eventstruct, "");
	#/
	self.traversestartnode = eventstruct.start_node;
	self.traversalstartpos = eventstruct.start_position;
	self.traverseendnode = eventstruct.end_node;
	self.traversalendpos = eventstruct.end_position;
	self.traversemantlenode = eventstruct.mantle_node;
	bot_animation::play_animation("parametric_traverse@traversal");
	self.traversestartnode = undefined;
	self.traversalstartpos = undefined;
	self.traverseendnode = undefined;
	self.traversalendpos = undefined;
	self.traversemantlenode = undefined;
}

/*
	Name: function_c20f7b00
	Namespace: bot_traversals
	Checksum: 0x317067D
	Offset: 0x13C8
	Size: 0x5B6
	Parameters: 2
	Flags: Private
*/
function private function_c20f7b00(eventstruct, str)
{
	/#
		self endon(#"death", #"hash_3525e39d3694d0a9", #"hash_72f42e7610533d49", #"entering_last_stand", #"animscripted_start");
		textpos = vectorlerp(eventstruct.start_position, eventstruct.end_position, 0.5);
		yaw = vectortoangles(eventstruct.normal)[1];
		do
		{
			if(self bot::should_record(""))
			{
				record3dtext(str, textpos, (1, 1, 1), "", self, 0.5);
				recordstar(eventstruct.start_position, (0, 1, 0), "", self);
				function_af72dbc5(eventstruct.start_position, vectorscale((0, -1, 0), 64), vectorscale((0, 1, 0), 64), yaw, (0, 1, 0), "", self);
				recordstar(eventstruct.end_position, (1, 0, 0), "", self);
				function_af72dbc5(eventstruct.end_position, vectorscale((0, -1, 0), 64), vectorscale((0, 1, 0), 64), yaw, (1, 0, 0), "", self);
				if(isdefined(eventstruct.var_a8cc518d))
				{
					recordstar(eventstruct.var_a8cc518d, (1, 1, 0), "", self);
					function_af72dbc5(eventstruct.var_a8cc518d, vectorscale((0, -1, 0), 64), (0, 64, 128), yaw, (1, 1, 0), "", self);
					recordline(eventstruct.start_position, eventstruct.var_a8cc518d, (0, 1, 1), "", self);
					recordline(eventstruct.end_position, eventstruct.var_a8cc518d, (0, 1, 1), "", self);
				}
				else
				{
					recordline(eventstruct.start_position, eventstruct.end_position, (0, 1, 1), "", self);
				}
				recordstar(eventstruct.var_883d42a7, (0, 1, 0), "", self);
				function_af72dbc5(eventstruct.var_883d42a7, vectorscale((0, -1, 0), 64), (0, 64, 128), yaw, (0, 1, 0), "", self);
				recordstar(eventstruct.var_15dca465, (1, 0, 0), "", self);
				function_af72dbc5(eventstruct.var_15dca465, vectorscale((0, -1, 0), 64), (0, 64, 128), yaw, (1, 0, 0), "", self);
				function_af72dbc5(eventstruct.var_75f5c2cb, (-15, -15, 18), (15, 15, 72), yaw, (1, 0, 1), "", self);
				if(isdefined(eventstruct.start_node))
				{
					self function_3e781451(eventstruct.start_node, (0, 1, 0));
				}
				if(isdefined(eventstruct.end_node))
				{
					self function_3e781451(eventstruct.end_node, (1, 0, 0));
				}
				if(isdefined(eventstruct.mantle_node))
				{
					self function_3e781451(eventstruct.mantle_node, (1, 1, 0));
				}
				if(isdefined(eventstruct.var_34a82e04))
				{
					recordline(eventstruct.var_34a82e04, eventstruct.var_5162591f, (1, 1, 0), "", self);
				}
				if(isdefined(eventstruct.var_87d52c5))
				{
					recordline(eventstruct.var_87d52c5, eventstruct.var_19c7b18b, (1, 1, 0), "", self);
				}
			}
			waitframe(1);
		}
		while(isbot(self) && self botundermanualcontrol() && isdefined(self.bot) && isdefined(self.bot.traversal));
	#/
}

/*
	Name: function_3e781451
	Namespace: bot_traversals
	Checksum: 0xF4B38FF
	Offset: 0x1988
	Size: 0xF4
	Parameters: 2
	Flags: Private
*/
function private function_3e781451(node, color)
{
	/#
		if(node.type == #"volume")
		{
			mins = (0, 0, 0) - node.aabb_extents;
			maxs = node.aabb_extents;
			function_af72dbc5(node.origin, mins, maxs, node.angles[1], color, "", self);
		}
		else
		{
			function_af72dbc5(node.origin, vectorscale((-1, -1, 0), 15), vectorscale((1, 1, 1), 15), node.angles[1], color, "", self);
		}
	#/
}

