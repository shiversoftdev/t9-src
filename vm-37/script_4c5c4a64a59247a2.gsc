#using script_5dfa1afaab9c1935;
#using script_6809bf766eba194a;
#using script_7bafaa95bb1b427e;
#using scripts\core_common\throttle_shared.gsc;

#namespace shared;

/*
	Name: main
	Namespace: shared
	Checksum: 0xC02513D1
	Offset: 0x140
	Size: 0x50
	Parameters: 0
	Flags: AutoExec
*/
function autoexec main()
{
	if(!isdefined(level.ai_weapon_throttle))
	{
		level.ai_weapon_throttle = new throttle();
		[[ level.ai_weapon_throttle ]]->initialize(1, 0.1);
	}
}

/*
	Name: _throwstowedweapon
	Namespace: shared
	Checksum: 0xB6728E5C
	Offset: 0x198
	Size: 0x9C
	Parameters: 3
	Flags: Linked, Private
*/
function private _throwstowedweapon(entity, weapon, weaponmodel)
{
	entity waittill(#"death");
	if(isdefined(entity))
	{
		weaponmodel unlink();
		entity throwweapon(weapon, gettagforpos("back"), 0, 0);
	}
	weaponmodel delete();
}

/*
	Name: stowweapon
	Namespace: shared
	Checksum: 0x8CC0EF1E
	Offset: 0x240
	Size: 0xCC
	Parameters: 3
	Flags: None
*/
function stowweapon(weapon, positionoffset, orientationoffset)
{
	entity = self;
	if(!isdefined(positionoffset))
	{
		positionoffset = (0, 0, 0);
	}
	if(!isdefined(orientationoffset))
	{
		orientationoffset = (0, 0, 0);
	}
	weaponmodel = spawn("script_model", (0, 0, 0));
	weaponmodel setmodel(weapon.worldmodel);
	weaponmodel linkto(entity, "tag_stowed_back", positionoffset, orientationoffset);
	entity thread _throwstowedweapon(entity, weapon, weaponmodel);
}

/*
	Name: placeweaponon
	Namespace: shared
	Checksum: 0x7B6287E3
	Offset: 0x318
	Size: 0x3FC
	Parameters: 2
	Flags: Linked
*/
function placeweaponon(weapon, position)
{
	self notify(#"weapon_position_change");
	if(isstring(weapon) || function_7a600918(weapon))
	{
		weapon = getweapon(weapon);
	}
	if(!isdefined(self.weaponinfo[weapon.name]))
	{
		self init::initweapon(weapon);
	}
	curposition = self.weaponinfo[weapon.name].position;
	/#
		assert(curposition == "" || self.a.weaponpos[curposition] == weapon);
	#/
	if(!isarray(self.a.weaponpos))
	{
		self.a.weaponpos = [];
	}
	/#
		assert(isarray(self.a.weaponpos));
	#/
	/#
		assert(position == "" || isdefined(self.a.weaponpos[position]), ("" + position) + "");
	#/
	/#
		assert(isweapon(weapon));
	#/
	if(position != "none" && self.a.weaponpos[position] == weapon)
	{
		return;
	}
	self detachallweaponmodels();
	if(curposition != "none")
	{
		self detachweapon(weapon);
	}
	if(position == "none")
	{
		self updateattachedweaponmodels();
		self aiutility::setcurrentweapon(level.weaponnone);
		return;
	}
	if(self.a.weaponpos[position] != level.weaponnone)
	{
		self detachweapon(self.a.weaponpos[position]);
	}
	if(position == "left" || position == "right")
	{
		self updatescriptweaponinfoandpos(weapon, position);
		self aiutility::setcurrentweapon(weapon);
	}
	else
	{
		self updatescriptweaponinfoandpos(weapon, position);
	}
	self updateattachedweaponmodels();
	/#
		assert(self.a.weaponpos[#"left"] == level.weaponnone || self.a.weaponpos[#"right"] == level.weaponnone);
	#/
}

/*
	Name: detachweapon
	Namespace: shared
	Checksum: 0x968D79F0
	Offset: 0x720
	Size: 0x62
	Parameters: 1
	Flags: Linked
*/
function detachweapon(weapon)
{
	self.a.weaponpos[self.weaponinfo[weapon.name].position] = level.weaponnone;
	self.weaponinfo[weapon.name].position = "none";
}

/*
	Name: updatescriptweaponinfoandpos
	Namespace: shared
	Checksum: 0x7FF1A526
	Offset: 0x790
	Size: 0x48
	Parameters: 2
	Flags: Linked
*/
function updatescriptweaponinfoandpos(weapon, position)
{
	self.weaponinfo[weapon.name].position = position;
	self.a.weaponpos[position] = weapon;
}

/*
	Name: detachallweaponmodels
	Namespace: shared
	Checksum: 0x111E17EB
	Offset: 0x7E0
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function detachallweaponmodels()
{
	if(isdefined(self.weapon_positions))
	{
		for(index = 0; index < self.weapon_positions.size; index++)
		{
			weapon = self.a.weaponpos[self.weapon_positions[index]];
			if(weapon == level.weaponnone)
			{
				continue;
			}
			self setactorweapon(level.weaponnone, self getactorweaponoptions(), self function_6a055ef4());
		}
	}
}

/*
	Name: updateattachedweaponmodels
	Namespace: shared
	Checksum: 0xA373A521
	Offset: 0x8A0
	Size: 0x12C
	Parameters: 0
	Flags: Linked
*/
function updateattachedweaponmodels()
{
	if(isdefined(self.weapon_positions))
	{
		for(index = 0; index < self.weapon_positions.size; index++)
		{
			weapon = self.a.weaponpos[self.weapon_positions[index]];
			if(weapon == level.weaponnone)
			{
				continue;
			}
			if(self.weapon_positions[index] != "right")
			{
				continue;
			}
			self setactorweapon(weapon, self getactorweaponoptions(), self function_6a055ef4());
			if(self.weaponinfo[weapon.name].useclip && !self.weaponinfo[weapon.name].hasclip)
			{
				self hidepart("tag_clip");
			}
		}
	}
}

/*
	Name: gettagforpos
	Namespace: shared
	Checksum: 0xAD373A06
	Offset: 0x9D8
	Size: 0xD2
	Parameters: 1
	Flags: Linked
*/
function gettagforpos(position)
{
	switch(position)
	{
		case "chest":
		{
			return "tag_weapon_chest";
		}
		case "back":
		{
			return "tag_stowed_back";
		}
		case "left":
		{
			return "tag_weapon_left";
		}
		case "right":
		{
			return "tag_weapon_right";
		}
		case "hand":
		{
			return "tag_inhand";
		}
		default:
		{
			/#
				assertmsg("" + position);
			#/
			break;
		}
	}
}

/*
	Name: function_403d795c
	Namespace: shared
	Checksum: 0xAA740DFA
	Offset: 0xAB8
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_403d795c()
{
	self endon(#"death");
	self waittilltimeout(3, #"stationary");
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: throwweapon
	Namespace: shared
	Checksum: 0xE40B9DCF
	Offset: 0xB10
	Size: 0x2CE
	Parameters: 4
	Flags: Linked
*/
function throwweapon(weapon, positiontag, scavenger, deleteweaponafterdropping)
{
	if(!getdvarint(#"hash_6b1268d7e44b1a20", 0) && (positiontag == "tag_weapon_right" || positiontag == "tag_weapon_left"))
	{
		throwweapon = self dropweapon(weapon, positiontag);
		if(isdefined(throwweapon))
		{
			self weapons::dropweaponfordeathlaunch(throwweapon, 50, self.angles, weapon, 0.5, 0.15);
		}
		if(deleteweaponafterdropping)
		{
			throwweapon thread function_403d795c();
			return;
		}
		return throwweapon;
	}
	waittime = 0.1;
	linearscalar = 2;
	angularscalar = 10;
	startposition = self gettagorigin(positiontag);
	startangles = self gettagangles(positiontag);
	if(!isdefined(startposition) || !isdefined(startangles))
	{
		return;
	}
	wait(waittime);
	if(isdefined(self))
	{
		endposition = self gettagorigin(positiontag);
		endangles = self gettagangles(positiontag);
		linearvelocity = (endposition - startposition) * (1 / waittime) * linearscalar;
		angularvelocity = (vectornormalize(endangles - startangles)) * angularscalar;
		throwweapon = self dropweapon(weapon, positiontag, linearvelocity, angularvelocity, scavenger);
		if(isdefined(throwweapon))
		{
			throwweapon setcontents(throwweapon setcontents(0) & (~(((32768 | 16777216) | 2097152) | 8388608)));
		}
		if(deleteweaponafterdropping)
		{
			throwweapon delete();
		}
		else
		{
			return throwweapon;
		}
	}
}

/*
	Name: dropaiweapon
	Namespace: shared
	Checksum: 0x19B96BFA
	Offset: 0xDE8
	Size: 0x314
	Parameters: 0
	Flags: Linked
*/
function dropaiweapon()
{
	self endon(#"death");
	if(self.weapon == level.weaponnone)
	{
		return;
	}
	if(is_true(self.script_nodropsecondaryweapon) && self.weapon == self.initial_secondaryweapon)
	{
		/#
			println(("" + self.weapon.name) + "");
		#/
		return;
	}
	if(is_true(self.script_nodropsidearm) && self.weapon == self.sidearm)
	{
		/#
			println(("" + self.weapon.name) + "");
		#/
		return;
	}
	[[ level.ai_weapon_throttle ]]->waitinqueue(self);
	current_weapon = self.weapon;
	dropweaponname = player_weapon_drop(current_weapon);
	position = "right";
	if(isdefined(self.weaponinfo[current_weapon.name]))
	{
		position = self.weaponinfo[current_weapon.name].position;
	}
	shoulddropweapon = !isdefined(self.dontdropweapon) || self.dontdropweapon === 0;
	shoulddeleteafterdropping = current_weapon == getweapon("riotshield");
	if(current_weapon.isscavengable == 0)
	{
		shoulddropweapon = 0;
	}
	if(shoulddropweapon && self.dropweapon)
	{
		self.dontdropweapon = 1;
		positiontag = gettagforpos(position);
		throwweapon(dropweaponname, positiontag, 0, shoulddeleteafterdropping);
	}
	if(self.weapon != level.weaponnone)
	{
		placeweaponon(current_weapon, "none");
		if(self.weapon == self.primaryweapon)
		{
			self aiutility::setprimaryweapon(level.weaponnone);
		}
		else if(self.weapon == self.secondaryweapon)
		{
			self aiutility::setsecondaryweapon(level.weaponnone);
		}
	}
	self aiutility::setcurrentweapon(level.weaponnone);
}

/*
	Name: dropallaiweapons
	Namespace: shared
	Checksum: 0xB4C0BD70
	Offset: 0x1108
	Size: 0x3D2
	Parameters: 0
	Flags: None
*/
function dropallaiweapons()
{
	if(is_true(self.a.dropping_weapons))
	{
		return;
	}
	if(!self.dropweapon)
	{
		if(self.weapon != level.weaponnone)
		{
			placeweaponon(self.weapon, "none");
			self aiutility::setcurrentweapon(level.weaponnone);
		}
		return;
	}
	self.a.dropping_weapons = 1;
	self detachallweaponmodels();
	droppedsidearm = 0;
	if(isdefined(self.weapon_positions))
	{
		for(index = 0; index < self.weapon_positions.size; index++)
		{
			weapon = self.a.weaponpos[self.weapon_positions[index]];
			if(weapon != level.weaponnone)
			{
				self.weaponinfo[weapon.name].position = "none";
				self.a.weaponpos[self.weapon_positions[index]] = level.weaponnone;
				if(is_true(self.script_nodropsecondaryweapon) && weapon == self.initial_secondaryweapon)
				{
					/#
						println(("" + weapon.name) + "");
					#/
					continue;
				}
				if(is_true(self.script_nodropsidearm) && weapon == self.sidearm)
				{
					/#
						println(("" + weapon.name) + "");
					#/
					continue;
				}
				velocity = self getvelocity();
				speed = length(velocity) * 0.5;
				weapon = player_weapon_drop(weapon);
				droppedweapon = self dropweapon(weapon, self.weapon_positions[index], speed);
				if(self.sidearm != level.weaponnone)
				{
					if(weapon == self.sidearm)
					{
						droppedsidearm = 1;
					}
				}
			}
		}
	}
	if(!droppedsidearm && self.sidearm != level.weaponnone)
	{
		if(randomint(100) <= 10)
		{
			velocity = self getvelocity();
			speed = length(velocity) * 0.5;
			droppedweapon = self dropweapon(self.sidearm, "chest", speed);
		}
	}
	self aiutility::setcurrentweapon(level.weaponnone);
	self.a.dropping_weapons = undefined;
}

/*
	Name: player_weapon_drop
	Namespace: shared
	Checksum: 0x32DAB453
	Offset: 0x14E8
	Size: 0x10
	Parameters: 1
	Flags: Linked
*/
function player_weapon_drop(weapon)
{
	return weapon;
}

/*
	Name: handlenotetrack
	Namespace: shared
	Checksum: 0x3E78A88B
	Offset: 0x1500
	Size: 0x24
	Parameters: 4
	Flags: Linked
*/
function handlenotetrack(note, flagname, customfunction, var1)
{
}

/*
	Name: donotetracks
	Namespace: shared
	Checksum: 0x7B36CF19
	Offset: 0x1530
	Size: 0xA8
	Parameters: 4
	Flags: Linked
*/
function donotetracks(flagname, customfunction, debugidentifier, var1)
{
	for(;;)
	{
		waitresult = undefined;
		waitresult = self waittill(customfunction);
		note = waitresult.notetrack;
		if(!isdefined(note))
		{
			note = "undefined";
		}
		val = self handlenotetrack(note, customfunction, debugidentifier, var1);
		if(isdefined(val))
		{
			return val;
		}
	}
}

/*
	Name: donotetracksintercept
	Namespace: shared
	Checksum: 0x3061E72E
	Offset: 0x15E0
	Size: 0xE0
	Parameters: 3
	Flags: Linked
*/
function donotetracksintercept(flagname, interceptfunction, debugidentifier)
{
	/#
		assert(isdefined(debugidentifier));
	#/
	for(;;)
	{
		waitresult = undefined;
		waitresult = self waittill(interceptfunction);
		note = waitresult.notetrack;
		if(!isdefined(note))
		{
			note = "undefined";
		}
		intercepted = [[debugidentifier]](note);
		if(isdefined(intercepted) && intercepted)
		{
			continue;
		}
		val = self handlenotetrack(note, interceptfunction);
		if(isdefined(val))
		{
			return val;
		}
	}
}

/*
	Name: donotetrackspostcallback
	Namespace: shared
	Checksum: 0xCB15AB13
	Offset: 0x16C8
	Size: 0xB6
	Parameters: 2
	Flags: None
*/
function donotetrackspostcallback(flagname, postfunction)
{
	/#
		assert(isdefined(postfunction));
	#/
	for(;;)
	{
		waitresult = undefined;
		waitresult = self waittill(flagname);
		note = waitresult.notetrack;
		if(!isdefined(note))
		{
			note = "undefined";
		}
		val = self handlenotetrack(note, flagname);
		[[postfunction]](note);
		if(isdefined(val))
		{
			return val;
		}
	}
}

/*
	Name: donotetracksforever
	Namespace: shared
	Checksum: 0x5E6A6D06
	Offset: 0x1788
	Size: 0x4C
	Parameters: 4
	Flags: Linked
*/
function donotetracksforever(flagname, killstring, customfunction, debugidentifier)
{
	donotetracksforeverproc(&donotetracks, flagname, killstring, customfunction, debugidentifier);
}

/*
	Name: donotetracksforeverintercept
	Namespace: shared
	Checksum: 0xEB7EAF76
	Offset: 0x17E0
	Size: 0x4C
	Parameters: 4
	Flags: Linked
*/
function donotetracksforeverintercept(flagname, killstring, interceptfunction, debugidentifier)
{
	donotetracksforeverproc(&donotetracksintercept, flagname, killstring, interceptfunction, debugidentifier);
}

/*
	Name: donotetracksforeverproc
	Namespace: shared
	Checksum: 0x19551492
	Offset: 0x1838
	Size: 0x146
	Parameters: 5
	Flags: Linked
*/
function donotetracksforeverproc(notetracksfunc, flagname, killstring, customfunction, debugidentifier)
{
	if(isdefined(killstring))
	{
		self endon(killstring);
	}
	self endon(#"killanimscript");
	if(!isdefined(debugidentifier))
	{
		debugidentifier = "undefined";
	}
	for(;;)
	{
		time = gettime();
		returnednote = [[notetracksfunc]](flagname, customfunction, debugidentifier);
		timetaken = gettime() - time;
		if(timetaken < 0.05)
		{
			time = gettime();
			returnednote = [[notetracksfunc]](flagname, customfunction, debugidentifier);
			timetaken = gettime() - time;
			if(timetaken < 0.05)
			{
				/#
					println(((((((gettime() + "") + debugidentifier) + "") + flagname) + "") + returnednote) + "");
				#/
				wait(0.05 - timetaken);
			}
		}
	}
}

/*
	Name: donotetracksfortime
	Namespace: shared
	Checksum: 0x216A31F3
	Offset: 0x1988
	Size: 0x7C
	Parameters: 4
	Flags: None
*/
function donotetracksfortime(time, flagname, customfunction, debugidentifier)
{
	ent = spawnstruct();
	ent thread donotetracksfortimeendnotify(time);
	donotetracksfortimeproc(&donotetracksforever, time, flagname, customfunction, debugidentifier, ent);
}

/*
	Name: donotetracksfortimeintercept
	Namespace: shared
	Checksum: 0x8211B720
	Offset: 0x1A10
	Size: 0x7C
	Parameters: 4
	Flags: None
*/
function donotetracksfortimeintercept(time, flagname, interceptfunction, debugidentifier)
{
	ent = spawnstruct();
	ent thread donotetracksfortimeendnotify(time);
	donotetracksfortimeproc(&donotetracksforeverintercept, time, flagname, interceptfunction, debugidentifier, ent);
}

/*
	Name: donotetracksfortimeproc
	Namespace: shared
	Checksum: 0xB2F96156
	Offset: 0x1A98
	Size: 0x5E
	Parameters: 6
	Flags: Linked
*/
function donotetracksfortimeproc(donotetracksforeverfunc, time, flagname, customfunction, debugidentifier, ent)
{
	ent endon(#"stop_notetracks");
	[[time]](flagname, undefined, customfunction, debugidentifier);
}

/*
	Name: donotetracksfortimeendnotify
	Namespace: shared
	Checksum: 0x2929D12B
	Offset: 0x1B00
	Size: 0x26
	Parameters: 1
	Flags: Linked
*/
function donotetracksfortimeendnotify(time)
{
	wait(time);
	self notify(#"stop_notetracks");
}

/*
	Name: function_d0b05b9e
	Namespace: shared
	Checksum: 0x37CCF377
	Offset: 0x1B30
	Size: 0x10
	Parameters: 1
	Flags: Event
*/
event function_d0b05b9e(eventstruct)
{
	/#
	#/
}

