#using scripts\core_common\bots\bot.gsc;

#namespace namespace_87549638;

/*
	Name: function_70a657d8
	Namespace: namespace_87549638
	Checksum: 0x80F724D1
	Offset: 0xC8
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
}

/*
	Name: think
	Namespace: namespace_87549638
	Checksum: 0xF6CE6D38
	Offset: 0xD8
	Size: 0x418
	Parameters: 0
	Flags: Linked
*/
function think()
{
	pixbeginevent();
	if(self isinexecutionvictim() || self isinexecutionattack())
	{
		pixendevent();
		return;
	}
	if(isdefined(self.bot.var_5efe88e4))
	{
		self botsetlookangles(self.bot.var_5efe88e4);
		self.bot.var_9931c7dc = 0;
	}
	else
	{
		if(self isplayinganimscripted() || self arecontrolsfrozen() || self.bot.flashed)
		{
			self.bot.var_9931c7dc = 0;
		}
		else
		{
			if(self function_37d408b6())
			{
				self function_23401de9();
				self.bot.var_9931c7dc = 0;
			}
			else
			{
				if(isdefined(self.bot.var_87751145))
				{
					self.bot.var_9931c7dc = self function_2f110827();
				}
				else
				{
					if(self.bot.var_2cf887f8)
					{
						entity = self.enemy;
						if(isplayer(self.enemy))
						{
							if(self.enemy isinvehicle() && !self.enemy isremotecontrolling())
							{
								entity = self.enemy getvehicleoccupied();
							}
							else if(isdefined(self.enemy.prop))
							{
								entity = self.enemy.prop;
							}
						}
						self.bot.var_9931c7dc = self aim_at_entity(entity, self.bot.enemydist, self.bot.var_2d563ebf);
					}
					else
					{
						if(self.bot.var_e8c84f98 && self function_204b5b9c() && self function_8174b063(self.enemylastseenpos))
						{
							self.bot.var_9931c7dc = self function_e958519b();
						}
						else
						{
							if(self function_b21ea513())
							{
								self.bot.var_9931c7dc = 0;
							}
							else
							{
								if(isdefined(self.bot.var_941ba251) && self function_8174b063(self.bot.var_941ba251))
								{
									self function_19ef91d7();
									self.bot.var_9931c7dc = 1;
								}
								else
								{
									if(self haspath())
									{
										self function_311aed8b();
										self.bot.var_9931c7dc = 0;
									}
									else
									{
										if(isdefined(self.bot.traversal))
										{
											self function_23401de9();
											self.bot.var_9931c7dc = 0;
										}
										else
										{
											self function_eb94f73e();
											self.bot.var_9931c7dc = 0;
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
	pixendevent();
}

/*
	Name: function_8174b063
	Namespace: namespace_87549638
	Checksum: 0x2B81C92F
	Offset: 0x4F8
	Size: 0x74
	Parameters: 1
	Flags: Linked, Private
*/
function private function_8174b063(aimpoint)
{
	pixbeginevent();
	eye = self.origin + (0, 0, self getplayerviewheight());
	pixendevent();
	return bullettracepassed(eye, aimpoint, 0, self, self.enemy, 1, 1, 1);
}

/*
	Name: function_37d408b6
	Namespace: namespace_87549638
	Checksum: 0x7C28215F
	Offset: 0x578
	Size: 0x72
	Parameters: 1
	Flags: Linked, Private
*/
function private function_37d408b6(traversal)
{
	if(!isdefined(traversal))
	{
		return 0;
	}
	return traversal.type == #"ladder" || traversal.type == #"jump" || traversal.deltaz >= 50;
}

/*
	Name: function_9b25bbe5
	Namespace: namespace_87549638
	Checksum: 0x666CAFB5
	Offset: 0x5F8
	Size: 0xAC
	Parameters: 2
	Flags: Linked, Private
*/
function private function_9b25bbe5(traversal, aimpoint)
{
	if(!self function_37d408b6(traversal))
	{
		return 0;
	}
	eye = self.origin + (0, 0, self getplayerviewheight());
	dir = vectornormalize(eye - aimpoint);
	return vectordot(traversal.normal, dir) < 0.5;
}

/*
	Name: function_204b5b9c
	Namespace: namespace_87549638
	Checksum: 0xD767044B
	Offset: 0x6B0
	Size: 0xA8
	Parameters: 0
	Flags: Linked, Private
*/
function private function_204b5b9c()
{
	point = self.enemylastseenpos;
	if(distance2dsquared(self.origin, point) <= 9216)
	{
		return 0;
	}
	normal = self.bot.var_a0b6205e;
	if(isdefined(normal))
	{
		dir = self.origin - self.enemylastseenpos;
		return vectordot(dir, normal) > 0;
	}
	return 1;
}

/*
	Name: function_b21ea513
	Namespace: namespace_87549638
	Checksum: 0xDED1E611
	Offset: 0x760
	Size: 0x210
	Parameters: 0
	Flags: Linked, Private
*/
function private function_b21ea513()
{
	if(self.bot.var_e8c84f98 || self.ignoreall)
	{
		return false;
	}
	enemies = self getenemiesinradius(self.origin, 1000);
	var_8a75d6bc = undefined;
	var_6e4e5c17 = undefined;
	foreach(enemy in enemies)
	{
		if(is_true(enemy.ignoreme))
		{
			continue;
		}
		var_f1e73cd = self lastknowntime(enemy);
		enemypos = self lastknownpos(enemy);
		if(!isdefined(var_f1e73cd) || !isdefined(enemypos) || (var_f1e73cd + 3000) < gettime())
		{
			continue;
		}
		if(!isdefined(var_6e4e5c17) || var_6e4e5c17 < var_f1e73cd)
		{
			var_6e4e5c17 = var_f1e73cd;
			var_8a75d6bc = enemypos;
		}
	}
	if(!isdefined(var_8a75d6bc))
	{
		return false;
	}
	var_8a75d6bc = var_8a75d6bc + (0, 0, self getplayerviewheight());
	self function_b5460039(var_8a75d6bc, #"hash_4d7ab907ebdddd3c", (1, 0.5, 0));
	return true;
}

/*
	Name: function_2f110827
	Namespace: namespace_87549638
	Checksum: 0xAC2D6705
	Offset: 0x978
	Size: 0xAA
	Parameters: 0
	Flags: Linked, Private
*/
function private function_2f110827()
{
	point = self.bot.var_87751145;
	if(self function_9b25bbe5(self.bot.traversal, point))
	{
		self function_23401de9();
		return 0;
	}
	self function_b5460039(point, #"point", (0, 1, 1));
	return self function_8174b063(point);
}

/*
	Name: function_e958519b
	Namespace: namespace_87549638
	Checksum: 0x4649FC96
	Offset: 0xA30
	Size: 0x88
	Parameters: 0
	Flags: Linked, Private
*/
function private function_e958519b()
{
	point = self.enemylastseenpos;
	if(self function_9b25bbe5(self.bot.traversal, point))
	{
		self function_23401de9();
		return false;
	}
	self function_b5460039(point, #"hash_517fc0a2cf80dbb8", (1, 0, 1));
	return true;
}

/*
	Name: function_19ef91d7
	Namespace: namespace_87549638
	Checksum: 0x98FBE003
	Offset: 0xAC0
	Size: 0x94
	Parameters: 0
	Flags: Linked, Private
*/
function private function_19ef91d7()
{
	point = self.bot.var_941ba251;
	if(self function_9b25bbe5(self.bot.traversal, point))
	{
		self function_23401de9();
		return;
	}
	self function_b5460039(point, #"threat", (1, 0.5, 0));
}

/*
	Name: aim_at_entity
	Namespace: namespace_87549638
	Checksum: 0x410E1BAB
	Offset: 0xB60
	Size: 0x240
	Parameters: 3
	Flags: Linked, Private
*/
function private aim_at_entity(ent, dist, tag)
{
	if(self function_9b25bbe5(self.bot.traversal, ent.origin))
	{
		self function_23401de9();
		return false;
	}
	if(isdefined(self.scriptenemy) && self.scriptenemy == ent)
	{
		tag = self.scriptenemytag;
	}
	else if(isdefined(ent.shootattag))
	{
		tag = ent.shootattag;
	}
	if(isdefined(tag))
	{
		tagorigin = ent gettagorigin(tag);
		if(isdefined(tagorigin))
		{
			self function_b5460039(tagorigin, tag, (1, 0, 1));
			return true;
		}
	}
	else
	{
		if(isvehicle(ent) && target_istarget(ent))
		{
			tagorigin = target_getorigin(ent);
			self function_b5460039(tagorigin, #"hash_7b9926f357c45aa8", (1, 0, 1));
			return true;
		}
		point = self function_466e841e(ent, dist);
		if(isdefined(point))
		{
			self function_b5460039(point, #"entity", (1, 0, 1));
			return true;
		}
	}
	centroid = ent getcentroid();
	self function_b5460039(centroid, #"centroid", (1, 0, 1));
	return true;
}

/*
	Name: function_466e841e
	Namespace: namespace_87549638
	Checksum: 0x4D040185
	Offset: 0xDA8
	Size: 0xE4
	Parameters: 2
	Flags: Linked, Private
*/
function private function_466e841e(ent, dist)
{
	pixbeginevent();
	var_c8e8809e = ent gettagorigin("j_spineupper");
	if(!isdefined(var_c8e8809e))
	{
		pixendevent();
		return undefined;
	}
	if(dist >= 250)
	{
		pixendevent();
		return var_c8e8809e;
	}
	var_d7b829fb = ent gettagorigin("j_neck");
	if(!isdefined(var_d7b829fb))
	{
		pixendevent();
		return var_c8e8809e;
	}
	t = max(dist / 250, 0.25);
	pixendevent();
	return vectorlerp(var_d7b829fb, var_c8e8809e, t);
}

/*
	Name: function_311aed8b
	Namespace: namespace_87549638
	Checksum: 0x369C015B
	Offset: 0xE98
	Size: 0xF4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_311aed8b()
{
	var_8be65bb9 = self function_f04bd922();
	if(isdefined(var_8be65bb9))
	{
		if(self function_35170b35(var_8be65bb9.var_b8c123c0, 128, #"hash_c5ef7c07caa7856", (0, 1, 1)))
		{
			return;
		}
		if(self function_35170b35(var_8be65bb9.var_bef48941, 64, #"hash_77da0a5a26fe7baf", (0, 0, 1)))
		{
			return;
		}
		if(self function_35170b35(var_8be65bb9.var_2cfdc66d, 32, #"hash_4c52ca575ab8182b", (1, 0, 1)))
		{
			return;
		}
	}
	self function_eb94f73e();
}

/*
	Name: function_35170b35
	Namespace: namespace_87549638
	Checksum: 0x51E4943D
	Offset: 0xF98
	Size: 0x130
	Parameters: 4
	Flags: Linked, Private
*/
function private function_35170b35(var_104d463, mindist, var_e125ba43, debugcolor)
{
	if(!isdefined(var_104d463) || distance2dsquared(self.origin, var_104d463) < (mindist * mindist))
	{
		return false;
	}
	if(self isplayerswimming())
	{
		eye = self.origin + (0, 0, self getplayerviewheight());
		var_42e28bb1 = (var_104d463[0], var_104d463[1], eye[2]);
		self function_b5460039(var_42e28bb1, var_e125ba43, debugcolor);
	}
	else
	{
		aimoffset = (0, 0, self getplayerviewheight());
		self function_b5460039(var_104d463 + aimoffset, var_e125ba43, debugcolor);
	}
	return true;
}

/*
	Name: function_eb94f73e
	Namespace: namespace_87549638
	Checksum: 0x759B47F3
	Offset: 0x10D0
	Size: 0xFC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_eb94f73e()
{
	movedir = self bot::move_dir();
	if(lengthsquared(movedir) > 0.0001)
	{
		eye = self.origin + (0, 0, self getplayerviewheight());
		var_d9100e0 = eye + (vectornormalize(movedir) * 128);
		self function_b5460039(var_d9100e0, #"forward", (0, 1, 1));
	}
	else
	{
		self botsetlookangles(self.angles);
	}
}

/*
	Name: function_23401de9
	Namespace: namespace_87549638
	Checksum: 0xDD7A64BA
	Offset: 0x11D8
	Size: 0xFC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_23401de9()
{
	traversal = self.bot.traversal;
	enddist = vectordot(self.origin - traversal.var_15dca465, traversal.normal);
	if(enddist > 15)
	{
		endpoint = traversal.end_position + (0, 0, self getplayerviewheight());
		self function_b5460039(endpoint, #"hash_7d35f3d861b9ec10", (1, 1, 0));
	}
	else
	{
		dir = (0, 0, 0) - traversal.normal;
		self botsetlookdir(dir);
	}
}

/*
	Name: function_b5460039
	Namespace: namespace_87549638
	Checksum: 0x49E4264B
	Offset: 0x12E0
	Size: 0x2C4
	Parameters: 3
	Flags: Linked, Private
*/
function private function_b5460039(point, var_e125ba43, debugcolor)
{
	initialpoint = undefined;
	if(isdefined(self.bot.var_32d8dabe))
	{
		initialpoint = point;
		point = point + (rotatepoint(self.bot.var_32d8dabe, self.angles + vectorscale((0, 1, 0), 180)));
	}
	/#
		if(self bot::should_record(""))
		{
			function_af72dbc5(point, vectorscale((-1, -1, -1), 1.5), vectorscale((1, 1, 1), 1.5), self.angles[1], debugcolor, "", self);
			record3dtext(function_9e72a96(var_e125ba43), point + (vectorscale((0, 0, -1), 0.75)), (1, 1, 1), "", self, 0.5);
			if(isdefined(initialpoint))
			{
				function_af72dbc5(initialpoint, vectorscale((-1, -1, -1), 1.5), vectorscale((1, 1, 1), 1.5), self.angles[1], vectorscale((1, 1, 1), 0.75), "", self);
				recordline(initialpoint, point, vectorscale((1, 1, 1), 0.75), "", self);
				if(isdefined(self.bot.var_9e5aaf8d))
				{
					record3dtext(self.bot.var_9e5aaf8d + "", initialpoint, (1, 1, 0), "", self, 0.5);
				}
			}
		}
	#/
	if(isdefined(self.bot.var_f50fa466))
	{
		var_deb75a87 = self botgetprojectileaimangles(self.bot.var_f50fa466, point);
		if(isdefined(var_deb75a87))
		{
			self botsetlookangles(var_deb75a87.var_478aeacd);
		}
		else
		{
			self botsetlookcurrent();
		}
	}
	else
	{
		self botsetlookpoint(point);
	}
}

