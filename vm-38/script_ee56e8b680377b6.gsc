#namespace namespace_9c817acd;

/*
	Name: function_94e0b1f4
	Namespace: namespace_9c817acd
	Checksum: 0xD6B80A6
	Offset: 0x60
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_94e0b1f4()
{
	level notify(130967054);
}

/*
	Name: function_70a657d8
	Namespace: namespace_9c817acd
	Checksum: 0x80F724D1
	Offset: 0x80
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
}

/*
	Name: think
	Namespace: namespace_9c817acd
	Checksum: 0xF15F8531
	Offset: 0x90
	Size: 0x13C
	Parameters: 0
	Flags: Linked
*/
function think()
{
	if(isdefined(self.bot.traversal) || self isplayinganimscripted() || self arecontrolsfrozen() || self function_5972c3cf())
	{
		return;
	}
	if(is_true(self.bot.var_9cf66413))
	{
		self bottapbutton(8);
	}
	else
	{
		if(is_true(self.bot.var_ce28855b))
		{
			self bottapbutton(9);
		}
		else
		{
			if(self function_29975d32())
			{
				self bottapbutton(39);
			}
			else if(self function_a4a505a9())
			{
				self bottapbutton(1);
			}
		}
	}
}

/*
	Name: function_29975d32
	Namespace: namespace_9c817acd
	Checksum: 0x81B71739
	Offset: 0x1D8
	Size: 0x1C0
	Parameters: 0
	Flags: Linked, Private
*/
function private function_29975d32()
{
	if(!(!isdefined(self.bot.difficulty) || is_true(self.bot.difficulty.allowslide)))
	{
		return false;
	}
	if(self issliding())
	{
		return true;
	}
	if(!self issprinting())
	{
		return false;
	}
	var_8be65bb9 = self function_f04bd922();
	if(!isdefined(var_8be65bb9) || !isdefined(var_8be65bb9.var_b8c123c0))
	{
		return false;
	}
	mindist = 250;
	if(isdefined(var_8be65bb9.var_2cfdc66d))
	{
		if(self.bot.order !== #"chase_enemy")
		{
			return false;
		}
		mindist = mindist * 0.8;
	}
	var_b8c123c0 = var_8be65bb9.var_b8c123c0;
	if((var_b8c123c0[2] - self.origin[2]) >= 16)
	{
		return false;
	}
	maxdist = mindist + 75;
	distsq = distance2dsquared(self.origin, var_b8c123c0);
	if(distsq > (maxdist * maxdist) || distsq < (mindist * mindist))
	{
		return false;
	}
	return true;
}

/*
	Name: function_a4a505a9
	Namespace: namespace_9c817acd
	Checksum: 0xCE590123
	Offset: 0x3A0
	Size: 0x176
	Parameters: 0
	Flags: Linked, Private
*/
function private function_a4a505a9()
{
	if(!(!isdefined(self.bot.difficulty) || is_true(self.bot.difficulty.allowsprint)))
	{
		return false;
	}
	if(self playerads() > 0)
	{
		return false;
	}
	move = self getnormalizedmovement();
	if(move[0] < 0.8267717)
	{
		return false;
	}
	if(self.bot.order === #"assault" || self.bot.order === #"chase_enemy")
	{
		return true;
	}
	var_8be65bb9 = self function_f04bd922();
	if(!isdefined(var_8be65bb9) || !isdefined(var_8be65bb9.var_b8c123c0))
	{
		return false;
	}
	distsq = distance2dsquared(self.origin, var_8be65bb9.var_b8c123c0);
	if(distsq < 202500)
	{
		return false;
	}
	return true;
}

