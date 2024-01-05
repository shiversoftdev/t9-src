#namespace targetting_delay;

/*
	Name: function_7e1a12ce
	Namespace: targetting_delay
	Checksum: 0x4AEE918
	Offset: 0x60
	Size: 0x3FA
	Parameters: 1
	Flags: Linked
*/
function function_7e1a12ce(radius)
{
	self endon(#"death");
	level endon(#"game_ended");
	if(!isdefined(radius))
	{
		radius = 8000;
	}
	self.var_5ddd7c26 = {};
	info = self.var_5ddd7c26;
	info.var_d1e06a5f = [];
	info.var_2fae95e = [];
	update_interval = (isdefined(self.var_ab84134) ? self.var_ab84134 : min(0.25, 1));
	var_dd3b2438 = int(update_interval * 1000);
	while(true)
	{
		enemy_players = self getenemiesinradius(self.origin, radius);
		foreach(enemy in enemy_players)
		{
			if(!isplayer(enemy))
			{
				continue;
			}
			delay = int(max(enemy function_9bd25293(), 250));
			if(delay <= 0)
			{
				continue;
			}
			entnum = enemy getentitynumber();
			if(isdefined(info.var_d1e06a5f[entnum]) && (!isalive(enemy) || (isdefined(enemy.lastspawntime) && enemy.lastspawntime > info.var_d1e06a5f[entnum])))
			{
				info.var_d1e06a5f[entnum] = undefined;
				info.var_2fae95e[entnum] = undefined;
			}
			if(!isalive(enemy))
			{
				continue;
			}
			if(issentient(self) && self cansee(enemy))
			{
				if(!isdefined(info.var_2fae95e[entnum]))
				{
					info.var_2fae95e[entnum] = 0;
				}
				if(info.var_2fae95e[entnum] < delay)
				{
					self setpersonalignore(enemy, update_interval);
				}
				info.var_d1e06a5f[entnum] = gettime();
				info.var_2fae95e[entnum] = info.var_2fae95e[entnum] + var_dd3b2438;
				continue;
			}
			if(isdefined(info.var_d1e06a5f[entnum]))
			{
				resettime = int(max(enemy function_348ab5dd(), 250));
				if(gettime() - info.var_d1e06a5f[entnum] > resettime)
				{
					info.var_d1e06a5f[entnum] = undefined;
					info.var_2fae95e[entnum] = undefined;
				}
			}
		}
		wait(update_interval);
	}
}

/*
	Name: function_568d5de9
	Namespace: targetting_delay
	Checksum: 0xE823032F
	Offset: 0x468
	Size: 0x312
	Parameters: 2
	Flags: None
*/
function function_568d5de9(radius, var_2770319)
{
	self endon(#"death");
	level endon(#"game_ended");
	if(!isdefined(radius))
	{
		radius = 8000;
	}
	if(!isdefined(var_2770319))
	{
		var_2770319 = 250;
	}
	self.var_5ddd7c26 = {};
	info = self.var_5ddd7c26;
	info.var_d1e06a5f = [];
	info.var_2fae95e = [];
	update_interval = (isdefined(self.var_ab84134) ? self.var_ab84134 : min(0.25, 1));
	var_dd3b2438 = int(update_interval * 1000);
	while(true)
	{
		enemy_players = self getenemiesinradius(self.origin, radius);
		foreach(enemy in enemy_players)
		{
			if(isplayer(enemy))
			{
				continue;
			}
			entnum = enemy getentitynumber();
			if(isdefined(info.var_d1e06a5f[entnum]) && (!isalive(enemy) || (isdefined(enemy.lastspawntime) && enemy.lastspawntime > info.var_d1e06a5f[entnum])))
			{
				info.var_d1e06a5f[entnum] = undefined;
				info.var_2fae95e[entnum] = undefined;
			}
			if(!isalive(enemy))
			{
				continue;
			}
			if(issentient(self))
			{
				if(!isdefined(info.var_2fae95e[entnum]))
				{
					info.var_2fae95e[entnum] = 0;
				}
				if(info.var_2fae95e[entnum] < var_2770319)
				{
					self setpersonalignore(enemy, update_interval);
				}
				info.var_d1e06a5f[entnum] = gettime();
				info.var_2fae95e[entnum] = info.var_2fae95e[entnum] + var_dd3b2438;
			}
		}
		wait(update_interval);
	}
}

/*
	Name: function_1c169b3a
	Namespace: targetting_delay
	Checksum: 0xCDB5403F
	Offset: 0x788
	Size: 0x12A
	Parameters: 2
	Flags: Linked
*/
function function_1c169b3a(enemy, defaultdelay)
{
	if(!isdefined(defaultdelay))
	{
		defaultdelay = 250;
	}
	if(isplayer(enemy))
	{
		delay = int(max(enemy function_9bd25293(), defaultdelay));
		if(delay <= 0)
		{
			return true;
		}
	}
	else
	{
		delay = defaultdelay;
	}
	info = self.var_5ddd7c26;
	if(!isdefined(info) || !isdefined(info.var_2fae95e))
	{
		return false;
	}
	if((isdefined(info.var_2fae95e[enemy getentitynumber()]) ? info.var_2fae95e[enemy getentitynumber()] : 0) < delay)
	{
		return false;
	}
	return true;
}

/*
	Name: function_a4d6d6d8
	Namespace: targetting_delay
	Checksum: 0xF263B374
	Offset: 0x8C0
	Size: 0x144
	Parameters: 2
	Flags: Linked
*/
function function_a4d6d6d8(enemy, var_2770319)
{
	if(isdefined(enemy))
	{
		if(isplayer(enemy))
		{
			delay = int(max(enemy function_9bd25293(), 250));
			if(delay <= 0)
			{
				return;
			}
			if(!isdefined(var_2770319))
			{
				var_2770319 = delay;
			}
		}
		else if(!isdefined(var_2770319))
		{
			var_2770319 = 250;
		}
		info = self.var_5ddd7c26;
		if(!isdefined(info) || !isdefined(info.var_2fae95e))
		{
			return;
		}
		entnum = enemy getentitynumber();
		if(!isdefined(info.var_2fae95e[entnum]))
		{
			info.var_2fae95e[entnum] = 0;
		}
		info.var_2fae95e[entnum] = info.var_2fae95e[entnum] + var_2770319;
	}
}

