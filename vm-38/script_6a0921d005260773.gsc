#using scripts\cp_common\bb.gsc;
#using script_35598499769dbb3d;

#namespace namespace_c78c9cc2;

/*
	Name: function_d5366ba5
	Namespace: namespace_c78c9cc2
	Checksum: 0xCEA966C5
	Offset: 0xC0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d5366ba5()
{
	level notify(737396344);
}

#namespace abilities;

/*
	Name: draworiginforever
	Namespace: abilities
	Checksum: 0x5F82F5C8
	Offset: 0xE0
	Size: 0x46
	Parameters: 0
	Flags: None
*/
function draworiginforever()
{
	/#
		self endon(#"death");
		for(;;)
		{
			debug_arrow(self.origin, self.angles);
			waitframe(1);
		}
	#/
}

/*
	Name: debug_arrow
	Namespace: abilities
	Checksum: 0x6886589A
	Offset: 0x130
	Size: 0x27C
	Parameters: 3
	Flags: None
*/
function debug_arrow(org, ang, opcolor)
{
	/#
		forward = anglestoforward(ang);
		forwardfar = vectorscale(forward, 50);
		forwardclose = vectorscale(forward, 50 * 0.8);
		right = anglestoright(ang);
		leftdraw = vectorscale(right, 50 * -0.2);
		rightdraw = vectorscale(right, 50 * 0.2);
		up = anglestoup(ang);
		right = vectorscale(right, 50);
		up = vectorscale(up, 50);
		red = (0.9, 0.2, 0.2);
		green = (0.2, 0.9, 0.2);
		blue = (0.2, 0.2, 0.9);
		if(isdefined(opcolor))
		{
			red = opcolor;
			green = opcolor;
			blue = opcolor;
		}
		line(org, org + forwardfar, red, 0.9);
		line(org + forwardfar, (org + forwardclose) + rightdraw, red, 0.9);
		line(org + forwardfar, (org + forwardclose) + leftdraw, red, 0.9);
		line(org, org + right, blue, 0.9);
		line(org, org + up, green, 0.9);
	#/
}

/*
	Name: debug_circle
	Namespace: abilities
	Checksum: 0x3B868828
	Offset: 0x3B8
	Size: 0x94
	Parameters: 4
	Flags: None
*/
function debug_circle(origin, radius, seconds, color)
{
	/#
		if(!isdefined(seconds))
		{
			seconds = 1;
		}
		if(!isdefined(color))
		{
			color = (1, 0, 0);
		}
		frames = int(20 * seconds);
		circle(origin, radius, color, 0, 1, frames);
	#/
}

/*
	Name: getclosestto
	Namespace: abilities
	Checksum: 0x1816BD8
	Offset: 0x458
	Size: 0x6A
	Parameters: 3
	Flags: None
*/
function getclosestto(origin, entarray, max)
{
	if(!isdefined(entarray))
	{
		return;
	}
	if(entarray.size == 0)
	{
		return;
	}
	arraysortclosest(entarray, origin, 1, 0, (isdefined(max) ? max : 2048));
	return entarray[0];
}

/*
	Name: cybercom_aioptoutgetflag
	Namespace: abilities
	Checksum: 0xFBFC1874
	Offset: 0x4D0
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function cybercom_aioptoutgetflag(name)
{
}

/*
	Name: function_23c1f0b0
	Namespace: abilities
	Checksum: 0xDBBF975
	Offset: 0x4E8
	Size: 0xFE
	Parameters: 0
	Flags: None
*/
function function_23c1f0b0()
{
	if(!isdefined(self))
	{
		return;
	}
	self cybercom_initentityfields();
	foreach(ability in level.abilities.abilities)
	{
		if(!isdefined(ability))
		{
			continue;
		}
		flag = cybercom_aioptoutgetflag(ability.name);
		if(isdefined(flag))
		{
			self.abilities.optoutflags = self.abilities.optoutflags | flag;
		}
	}
}

/*
	Name: cybercom_aioptout
	Namespace: abilities
	Checksum: 0x728FE26C
	Offset: 0x5F0
	Size: 0x76
	Parameters: 1
	Flags: None
*/
function cybercom_aioptout(name)
{
	if(!isdefined(self))
	{
		return;
	}
	flag = cybercom_aioptoutgetflag(name);
	if(!isdefined(flag))
	{
		return;
	}
	self cybercom_initentityfields();
	self.abilities.optoutflags = self.abilities.optoutflags | flag;
}

/*
	Name: cybercom_aiclearoptout
	Namespace: abilities
	Checksum: 0x7345CCE2
	Offset: 0x670
	Size: 0x7E
	Parameters: 1
	Flags: None
*/
function cybercom_aiclearoptout(name)
{
	if(!isdefined(self))
	{
		return;
	}
	self cybercom_initentityfields();
	flag = cybercom_aioptoutgetflag(name);
	if(!isdefined(flag))
	{
		return;
	}
	self.abilities.optoutflags = self.abilities.optoutflags & (~flag);
}

/*
	Name: cybercom_aicheckoptout
	Namespace: abilities
	Checksum: 0x393123F3
	Offset: 0x6F8
	Size: 0xA4
	Parameters: 1
	Flags: None
*/
function cybercom_aicheckoptout(name)
{
	if(!isdefined(self))
	{
		return false;
	}
	if(is_true(self.nocybercom))
	{
		return true;
	}
	self cybercom_initentityfields();
	flag = cybercom_aioptoutgetflag(name);
	if(!isdefined(flag))
	{
		return false;
	}
	if(self.abilities.optoutflags & flag)
	{
		return true;
	}
	return false;
}

/*
	Name: cybercom_initentityfields
	Namespace: abilities
	Checksum: 0x6D6EC764
	Offset: 0x7A8
	Size: 0x52
	Parameters: 0
	Flags: Linked
*/
function cybercom_initentityfields()
{
	if(!isdefined(self.abilities))
	{
		self.abilities = spawnstruct();
	}
	if(!isdefined(self.abilities.optoutflags))
	{
		self.abilities.optoutflags = 0;
	}
}

/*
	Name: notifymeonmatchend
	Namespace: abilities
	Checksum: 0x9F28D895
	Offset: 0x808
	Size: 0x5C
	Parameters: 2
	Flags: Linked
*/
function notifymeonmatchend(note, animname)
{
	self endon(note, #"death");
	self waittillmatch({#notetrack:"end"}, animname);
	self notify(note);
}

/*
	Name: stopanimscriptedonnotify
	Namespace: abilities
	Checksum: 0x2FAC4D4B
	Offset: 0x870
	Size: 0x15C
	Parameters: 5
	Flags: None
*/
function stopanimscriptedonnotify(note, animname, kill, attacker, weapon)
{
	if(!isdefined(kill))
	{
		kill = 0;
	}
	self notify(("stopOnNotify" + note) + animname);
	self endon(("stopOnNotify" + note) + animname);
	if(isdefined(animname))
	{
		self thread notifymeonmatchend(("stopOnNotify" + note) + animname, animname);
	}
	self waittill(note, #"death");
	if(isdefined(self) && self isinscriptedstate())
	{
		self stopanimscripted(0.3);
	}
	if(isalive(self) && is_true(kill))
	{
		self kill(self.origin, (isdefined(attacker) ? attacker : undefined), undefined, weapon);
	}
}

/*
	Name: function_ee76cb20
	Namespace: abilities
	Checksum: 0x15BDA7BA
	Offset: 0x9D8
	Size: 0xD2
	Parameters: 0
	Flags: None
*/
function function_ee76cb20()
{
	if(isdefined(self.allowdeath))
	{
		if(self.allowdeath == 0)
		{
			return false;
		}
	}
	if(is_true(self.var_4bc8b4c4))
	{
		return true;
	}
	if(isdefined(self.rider_info))
	{
		return true;
	}
	if(isdefined(self.archetype) && self.archetype == "robot" && !function_4b870e5a(self))
	{
		return true;
	}
	if(isactor(self) && !self isonground())
	{
		return true;
	}
	return false;
}

/*
	Name: islinked
	Namespace: abilities
	Checksum: 0x77C885D7
	Offset: 0xAB8
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function islinked()
{
	return isdefined(self getlinkedent());
}

/*
	Name: function_733a4915
	Namespace: abilities
	Checksum: 0xD4050FC5
	Offset: 0xAE0
	Size: 0xE2
	Parameters: 2
	Flags: None
*/
function function_733a4915(context, max)
{
	if(!isdefined(max))
	{
		max = 2;
	}
	if(!isdefined(self.abilities.variants))
	{
		self.abilities.variants = [];
	}
	if(isdefined(self.abilities.variants[context]))
	{
		self.abilities.variants[context] = undefined;
	}
	self.abilities.variants[context] = spawnstruct();
	self.abilities.variants[context].var_20f37629 = 0;
	self.abilities.variants[context].var_67ce2ba5 = max;
}

/*
	Name: getanimationvariant
	Namespace: abilities
	Checksum: 0x984E3FFE
	Offset: 0xBD0
	Size: 0x12
	Parameters: 1
	Flags: None
*/
function getanimationvariant(context)
{
	return "";
}

/*
	Name: debug_box
	Namespace: abilities
	Checksum: 0xDEAC70BF
	Offset: 0xBF0
	Size: 0x8C
	Parameters: 6
	Flags: None
*/
function debug_box(origin, mins, maxs, yaw, frames, color)
{
	/#
		if(!isdefined(yaw))
		{
			yaw = 0;
		}
		if(!isdefined(frames))
		{
			frames = 20;
		}
		if(!isdefined(color))
		{
			color = (1, 0, 0);
		}
		box(origin, mins, maxs, yaw, color, 1, 0, frames);
	#/
}

/*
	Name: debug_sphere
	Namespace: abilities
	Checksum: 0xECE58C59
	Offset: 0xC88
	Size: 0xCC
	Parameters: 5
	Flags: None
*/
function debug_sphere(origin, radius, color, alpha, timeframes)
{
	/#
		if(!isdefined(color))
		{
			color = (1, 0, 0);
		}
		if(!isdefined(alpha))
		{
			alpha = 0.1;
		}
		if(!isdefined(timeframes))
		{
			timeframes = 1;
		}
		sides = int(10 * (1 + (int(radius) % 100)));
		sphere(origin, radius, color, alpha, 1, sides, timeframes);
	#/
}

/*
	Name: notifymeinnsec
	Namespace: abilities
	Checksum: 0x3A874C52
	Offset: 0xD60
	Size: 0x3A
	Parameters: 2
	Flags: None
*/
function notifymeinnsec(note, seconds)
{
	self endon(note, #"death");
	wait(seconds);
	self notify(note);
}

/*
	Name: notifymeonnote
	Namespace: abilities
	Checksum: 0xDF481EAA
	Offset: 0xDA8
	Size: 0x40
	Parameters: 2
	Flags: None
*/
function notifymeonnote(note, waitnote)
{
	self endon(note, #"death");
	self waittill(waitnote);
	self notify(note);
}

/*
	Name: deleteentonnote
	Namespace: abilities
	Checksum: 0x4798A959
	Offset: 0xDF0
	Size: 0x54
	Parameters: 2
	Flags: None
*/
function deleteentonnote(note, ent)
{
	ent endon(#"death");
	self waittill(note);
	if(isdefined(ent))
	{
		ent delete();
	}
}

/*
	Name: function_23de7dc6
	Namespace: abilities
	Checksum: 0x5D5F3D38
	Offset: 0xE50
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function function_23de7dc6()
{
	/#
		assert(isactor(self) || isplayer(self), "");
	#/
	if(isactor(self))
	{
		return self getblackboardattribute("_stance");
	}
	if(isplayer(self))
	{
		return self getstance();
	}
}

/*
	Name: function_650c0f8f
	Namespace: abilities
	Checksum: 0xDD441647
	Offset: 0xF10
	Size: 0xA6
	Parameters: 0
	Flags: None
*/
function function_650c0f8f()
{
	/#
		assert(isactor(self) || isplayer(self), "");
	#/
	stance = self function_23de7dc6();
	if(stance == "stand")
	{
		return "stn";
	}
	if(stance == "crouch")
	{
		return "crc";
	}
	return "";
}

/*
	Name: debugmsg
	Namespace: abilities
	Checksum: 0x2EA02505
	Offset: 0xFC0
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function debugmsg(txt)
{
	/#
		println("" + txt);
	#/
}

/*
	Name: function_4b870e5a
	Namespace: abilities
	Checksum: 0xF37D1211
	Offset: 0x1000
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function function_4b870e5a(entity)
{
	if(is_true(entity.missinglegs))
	{
		return false;
	}
	if(is_true(entity.iscrawler))
	{
		return false;
	}
	return true;
}

/*
	Name: function_e0a4efa
	Namespace: abilities
	Checksum: 0xF2B64AC3
	Offset: 0x1080
	Size: 0x5C
	Parameters: 4
	Flags: None
*/
function function_e0a4efa(slot, weapon, var_55cd789e, endnote)
{
	self endon(#"death", endnote);
	self waittill(var_55cd789e);
	self gadgetdeactivate(slot, weapon);
}

/*
	Name: getyawtospot
	Namespace: abilities
	Checksum: 0xBB788CB2
	Offset: 0x10E8
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
	Name: getyaw
	Namespace: abilities
	Checksum: 0x69F5ADF
	Offset: 0x1158
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
	Name: function_cc83a141
	Namespace: abilities
	Checksum: 0xC8757C54
	Offset: 0x11A0
	Size: 0x160
	Parameters: 3
	Flags: None
*/
function function_cc83a141(eattacker, eplayer, idamage)
{
	if(!isplayer(eplayer) || !isdefined(eattacker) || !isdefined(eattacker.aitype))
	{
		return idamage;
	}
	if(!isdefined(eplayer.abilities.var_69544378) || !eplayer.abilities.var_69544378)
	{
		return idamage;
	}
	var_32419617 = level.var_277e6832[eattacker.aitype];
	if(!isdefined(var_32419617))
	{
		var_32419617 = level.var_277e6832[#"default"];
	}
	damage_scale = 1;
	distancetoplayer = distance(eattacker.origin, eplayer.origin);
	if(distancetoplayer < 750)
	{
		damage_scale = var_32419617.var_79b26a3f;
	}
	else
	{
		if(distancetoplayer < 1500)
		{
			damage_scale = var_32419617.var_9fa71cab;
		}
		else
		{
			damage_scale = var_32419617.var_b9d1b33b;
		}
	}
	return idamage * damage_scale;
}

/*
	Name: function_8107e1c2
	Namespace: abilities
	Checksum: 0x38CE00F4
	Offset: 0x1308
	Size: 0x6C
	Parameters: 0
	Flags: None
*/
function function_8107e1c2()
{
	if(isdefined(self.currentweapon) && (self.currentweapon == getweapon(#"gadget_unstoppable_force") || self.currentweapon == getweapon(#"gadget_unstoppable_force_upgraded")))
	{
		return true;
	}
	return false;
}

