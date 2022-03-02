#using scripts\core_common\sound_shared.gsc;

#namespace zombie_shared;

/*
	Name: handlenotetrack
	Namespace: zombie_shared
	Checksum: 0x96754207
	Offset: 0xF0
	Size: 0x2DA
	Parameters: 4
	Flags: Linked
*/
function handlenotetrack(note, flagname, customfunction, var1)
{
	switch(flagname)
	{
		case "undefined":
		case "end":
		case "finish":
		{
			return flagname;
		}
		case "hash_701bc5c059dfaa52":
		{
			self thread sound::play_in_space("fly_gear_enemy", self gettagorigin("TAG_WEAPON_RIGHT"));
			break;
		}
		case "hash_5f5e275b9f3b93ee":
		{
			self thread sound::play_in_space("fly_gear_enemy_large", self gettagorigin("TAG_WEAPON_RIGHT"));
			break;
		}
		case "hash_1c88a07f5d53a11c":
		{
			self.a.nodeath = 1;
			break;
		}
		case "hash_70c20f2d48c55e02":
		{
			self.allowpain = 0;
			break;
		}
		case "hash_50c6c08f5de3ec2a":
		{
			self.allowpain = 1;
			break;
		}
		case "hash_d734c21f2e3b83e":
		case "hash_39ec7b0969bab796":
		{
			self.a.meleestate = "right";
			break;
		}
		case "hash_1791db148d16d825":
		case "hash_6b554a9080ec8b07":
		{
			self.a.meleestate = "left";
			break;
		}
		case "swap taghelmet to tagleft":
		{
			if(isdefined(self.hatmodel))
			{
				if(isdefined(self.helmetsidemodel))
				{
					self detach(self.helmetsidemodel, "TAG_HELMETSIDE");
					self.helmetsidemodel = undefined;
				}
				self detach(self.hatmodel, "");
				self attach(self.hatmodel, "TAG_WEAPON_LEFT");
				self.hatmodel = undefined;
			}
			break;
		}
		default:
		{
			if(isdefined(customfunction))
			{
				if(!isdefined(var1))
				{
					return [[customfunction]](flagname);
				}
				else
				{
					return [[customfunction]](flagname, var1);
				}
			}
			break;
		}
	}
}

/*
	Name: donotetracks
	Namespace: zombie_shared
	Checksum: 0x8FDDFD42
	Offset: 0x3D8
	Size: 0xA0
	Parameters: 3
	Flags: Linked
*/
function donotetracks(flagname, customfunction, var1)
{
	for(;;)
	{
		waitresult = undefined;
		waitresult = self waittill(flagname);
		note = waitresult.notetrack;
		if(!isdefined(note))
		{
			note = "undefined";
		}
		val = self handlenotetrack(note, flagname, customfunction, var1);
		if(isdefined(val))
		{
			return val;
		}
	}
}

/*
	Name: donotetracksforeverproc
	Namespace: zombie_shared
	Checksum: 0xB07A5ED9
	Offset: 0x480
	Size: 0x126
	Parameters: 5
	Flags: Linked
*/
function donotetracksforeverproc(notetracksfunc, flagname, killstring, customfunction, var1)
{
	if(isdefined(killstring))
	{
		self endon(killstring, #"killanimscript");
	}
	for(;;)
	{
		time = gettime();
		returnednote = [[notetracksfunc]](flagname, customfunction, var1);
		timetaken = gettime() - time;
		if(timetaken < 0.05)
		{
			time = gettime();
			returnednote = [[notetracksfunc]](flagname, customfunction, var1);
			timetaken = gettime() - time;
			if(timetaken < 0.05)
			{
				/#
					println(((((gettime() + "") + flagname) + "") + returnednote) + "");
				#/
				wait(0.05 - timetaken);
			}
		}
	}
}

/*
	Name: donotetracksforever
	Namespace: zombie_shared
	Checksum: 0x60F59991
	Offset: 0x5B0
	Size: 0x4C
	Parameters: 4
	Flags: Linked
*/
function donotetracksforever(flagname, killstring, customfunction, var1)
{
	donotetracksforeverproc(&donotetracks, flagname, killstring, customfunction, var1);
}

/*
	Name: donotetracksfortimeproc
	Namespace: zombie_shared
	Checksum: 0x42E33409
	Offset: 0x608
	Size: 0x5E
	Parameters: 6
	Flags: Linked
*/
function donotetracksfortimeproc(donotetracksforeverfunc, time, flagname, customfunction, ent, var1)
{
	ent endon(#"stop_notetracks");
	[[time]](flagname, undefined, customfunction, var1);
}

/*
	Name: donotetracksfortime
	Namespace: zombie_shared
	Checksum: 0xFA4E133A
	Offset: 0x670
	Size: 0x7C
	Parameters: 4
	Flags: None
*/
function donotetracksfortime(time, flagname, customfunction, var1)
{
	ent = spawnstruct();
	ent thread donotetracksfortimeendnotify(time);
	donotetracksfortimeproc(&donotetracksforever, time, flagname, customfunction, ent, var1);
}

/*
	Name: donotetracksfortimeendnotify
	Namespace: zombie_shared
	Checksum: 0xF508DB26
	Offset: 0x6F8
	Size: 0x26
	Parameters: 1
	Flags: Linked
*/
function donotetracksfortimeendnotify(time)
{
	wait(time);
	self notify(#"stop_notetracks");
}

