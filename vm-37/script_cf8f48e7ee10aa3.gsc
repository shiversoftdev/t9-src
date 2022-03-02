#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\system_shared.gsc;

class class_5f632c1e 
{
	var squadmembers;
	var squadleader;
	var squadbreadcrumb;

	/*
		Name: constructor
		Namespace: namespace_5f632c1e
		Checksum: 0x34950577
		Offset: 0x168
		Size: 0x26
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
		self.squadleader = 0;
		self.squadmembers = [];
		self.squadbreadcrumb = [];
	}

	/*
		Name: destructor
		Namespace: namespace_5f632c1e
		Checksum: 0x80F724D1
		Offset: 0x408
		Size: 0x4
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: getmembers
		Namespace: namespace_5f632c1e
		Checksum: 0xA0A1FE33
		Offset: 0x270
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function getmembers()
	{
		return squadmembers;
	}

	/*
		Name: removeaifromsqaud
		Namespace: namespace_5f632c1e
		Checksum: 0xBE5966D9
		Offset: 0x310
		Size: 0x5E
		Parameters: 1
		Flags: Linked
	*/
	function removeaifromsqaud(ai)
	{
		if(isinarray(squadmembers, ai))
		{
			arrayremovevalue(squadmembers, ai, 0);
			if(squadleader === ai)
			{
				self.squadleader = undefined;
			}
		}
	}

	/*
		Name: getsquadbreadcrumb
		Namespace: namespace_5f632c1e
		Checksum: 0x2D05E388
		Offset: 0x240
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function getsquadbreadcrumb()
	{
		return squadbreadcrumb;
	}

	/*
		Name: think
		Namespace: namespace_5f632c1e
		Checksum: 0x93C2AD
		Offset: 0x378
		Size: 0x86
		Parameters: 0
		Flags: Linked
	*/
	function think()
	{
		if(isint(squadleader) && squadleader == 0 || !isdefined(squadleader))
		{
			if(squadmembers.size > 0)
			{
				self.squadleader = squadmembers[0];
				self.squadbreadcrumb = squadleader.origin;
			}
			else
			{
				return false;
			}
		}
		return true;
	}

	/*
		Name: addsquadbreadcrumbs
		Namespace: namespace_5f632c1e
		Checksum: 0x44C66F9A
		Offset: 0x198
		Size: 0x9E
		Parameters: 1
		Flags: Linked
	*/
	function addsquadbreadcrumbs(ai)
	{
		/#
			assert(squadleader == ai);
		#/
		if(distance2dsquared(squadbreadcrumb, ai.origin) >= 9216)
		{
			/#
				recordcircle(ai.origin, 4, (0, 0, 1), "", ai);
			#/
			self.squadbreadcrumb = ai.origin;
		}
	}

	/*
		Name: addaitosquad
		Namespace: namespace_5f632c1e
		Checksum: 0x622FA3
		Offset: 0x288
		Size: 0x7C
		Parameters: 1
		Flags: Linked
	*/
	function addaitosquad(ai)
	{
		if(!isinarray(squadmembers, ai))
		{
			if(ai.archetype == #"robot")
			{
				ai ai::set_behavior_attribute("move_mode", "squadmember");
			}
			self.squadmembers[squadmembers.size] = ai;
		}
	}

	/*
		Name: getleader
		Namespace: namespace_5f632c1e
		Checksum: 0x52674316
		Offset: 0x258
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function getleader()
	{
		return squadleader;
	}

}

#namespace aisquads;

/*
	Name: function_89f2df9
	Namespace: aisquads
	Checksum: 0xFC995B3B
	Offset: 0xA8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"ai_squads", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: aisquads
	Checksum: 0x639422F2
	Offset: 0xF0
	Size: 0x6C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level._squads = [];
	actorspawnerarray = getactorspawnerteamarray(#"axis");
	array::run_all(actorspawnerarray, &spawner::add_spawn_function, &squadmemberthink);
}

/*
	Name: createsquad
	Namespace: aisquads
	Checksum: 0x36B593A1
	Offset: 0x5F0
	Size: 0x3C
	Parameters: 1
	Flags: Linked, Private
*/
function private createsquad(squadname)
{
	level._squads[squadname] = new class_5f632c1e();
	return level._squads[squadname];
}

/*
	Name: removesquad
	Namespace: aisquads
	Checksum: 0x88A29714
	Offset: 0x638
	Size: 0x44
	Parameters: 1
	Flags: Linked, Private
*/
function private removesquad(squadname)
{
	if(isdefined(level._squads) && isdefined(level._squads[squadname]))
	{
		level._squads[squadname] = undefined;
	}
}

/*
	Name: getsquad
	Namespace: aisquads
	Checksum: 0x7A073BDB
	Offset: 0x688
	Size: 0x1C
	Parameters: 1
	Flags: Linked, Private
*/
function private getsquad(squadname)
{
	return level._squads[squadname];
}

/*
	Name: thinksquad
	Namespace: aisquads
	Checksum: 0x8EC346A8
	Offset: 0x6B0
	Size: 0x5C
	Parameters: 1
	Flags: Linked, Private
*/
function private thinksquad(squadname)
{
	while(true)
	{
		if([[ level._squads[squadname] ]]->think())
		{
			wait(0.5);
		}
		else
		{
			removesquad(squadname);
			break;
		}
	}
}

/*
	Name: squadmemberdeath
	Namespace: aisquads
	Checksum: 0xE65DBD0B
	Offset: 0x718
	Size: 0x60
	Parameters: 0
	Flags: Linked, Private
*/
function private squadmemberdeath()
{
	self waittill(#"death");
	if(isdefined(self.squadname) && isdefined(level._squads[self.squadname]))
	{
		[[ level._squads[self.squadname] ]]->removeaifromsqaud(self);
	}
}

/*
	Name: squadmemberthink
	Namespace: aisquads
	Checksum: 0x78A9AF9D
	Offset: 0x780
	Size: 0x40E
	Parameters: 0
	Flags: Linked, Private
*/
function private squadmemberthink()
{
	self endon(#"death");
	if(!isdefined(self.script_aisquadname))
	{
		return;
	}
	wait(0.5);
	self.squadname = self.script_aisquadname;
	if(isdefined(self.squadname))
	{
		if(!isdefined(level._squads[self.squadname]))
		{
			squad = createsquad(self.squadname);
			newsquadcreated = 1;
		}
		else
		{
			squad = getsquad(self.squadname);
		}
		[[ squad ]]->addaitosquad(self);
		self thread squadmemberdeath();
		if(is_true(newsquadcreated))
		{
			level thread thinksquad(self.squadname);
		}
		while(true)
		{
			squadleader = [[ level._squads[self.squadname] ]]->getleader();
			if(isdefined(squadleader) && (!(isint(squadleader) && squadleader == 0)))
			{
				if(squadleader == self)
				{
					/#
						recordenttext(self.squadname + "", self, (0, 1, 0), "");
					#/
					/#
						recordenttext(self.squadname + "", self, (0, 1, 0), "");
					#/
					/#
						recordcircle(self.origin, 300, (1, 0.5, 0), "", self);
					#/
					if(isdefined(self.enemy))
					{
						self setgoal(self.enemy);
					}
					[[ squad ]]->addsquadbreadcrumbs(self);
				}
				else
				{
					/#
						recordline(self.origin, squadleader.origin, (0, 1, 0), "", self);
					#/
					/#
						recordenttext(self.squadname + "", self, (0, 1, 0), "");
					#/
					followposition = [[ squad ]]->getsquadbreadcrumb();
					followdistsq = distance2dsquared(self.goalpos, followposition);
					if(isdefined(squadleader.enemy))
					{
						if(!isdefined(self.enemy) || (isdefined(self.enemy) && self.enemy != squadleader.enemy))
						{
							self setentitytarget(squadleader.enemy, 1);
						}
					}
					if(isdefined(self.goalpos) && followdistsq >= 256)
					{
						if(followdistsq >= 22500)
						{
							self ai::set_behavior_attribute("sprint", 1);
						}
						else
						{
							self ai::set_behavior_attribute("sprint", 0);
						}
						self setgoal(followposition, 1);
					}
				}
			}
			wait(1);
		}
	}
}

/*
	Name: isfollowingsquadleader
	Namespace: aisquads
	Checksum: 0xA8F62CA9
	Offset: 0xB98
	Size: 0xB6
	Parameters: 1
	Flags: None
*/
function isfollowingsquadleader(ai)
{
	if(ai ai::get_behavior_attribute("move_mode") != "squadmember")
	{
		return false;
	}
	squadmember = issquadmember(ai);
	currentsquadleader = getsquadleader(ai);
	isaisquadleader = isdefined(currentsquadleader) && currentsquadleader == ai;
	if(squadmember && !isaisquadleader)
	{
		return true;
	}
	return false;
}

/*
	Name: issquadmember
	Namespace: aisquads
	Checksum: 0xF7B8F840
	Offset: 0xC58
	Size: 0x66
	Parameters: 1
	Flags: Linked
*/
function issquadmember(ai)
{
	if(isdefined(ai.squadname))
	{
		squad = getsquad(ai.squadname);
		if(isdefined(squad))
		{
			return isinarray([[ squad ]]->getmembers(), ai);
		}
	}
	return 0;
}

/*
	Name: issquadleader
	Namespace: aisquads
	Checksum: 0x282F2138
	Offset: 0xCC8
	Size: 0x72
	Parameters: 1
	Flags: None
*/
function issquadleader(ai)
{
	if(isdefined(ai.squadname))
	{
		squad = getsquad(ai.squadname);
		if(isdefined(squad))
		{
			squadleader = [[ squad ]]->getleader();
			return isdefined(squadleader) && squadleader == ai;
		}
	}
	return 0;
}

/*
	Name: getsquadleader
	Namespace: aisquads
	Checksum: 0x410DC7ED
	Offset: 0xD48
	Size: 0x56
	Parameters: 1
	Flags: Linked
*/
function getsquadleader(ai)
{
	if(isdefined(ai.squadname))
	{
		squad = getsquad(ai.squadname);
		if(isdefined(squad))
		{
			return [[ squad ]]->getleader();
		}
	}
	return undefined;
}

