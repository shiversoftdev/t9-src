#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\fx_shared.gsc;
#using scripts\core_common\sound_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\zm_common\util.gsc;

#namespace fx;

/*
	Name: function_6ed4574c
	Namespace: fx
	Checksum: 0xD252BEEB
	Offset: 0x88
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_6ed4574c()
{
	level notify(407758150);
}

/*
	Name: print_org
	Namespace: fx
	Checksum: 0xD071E24A
	Offset: 0xA8
	Size: 0x17C
	Parameters: 4
	Flags: None
*/
function print_org(fxcommand, fxid, fxpos, waittime)
{
	/#
		if(getdvarint(#"debug", 0))
		{
			println("");
			println(((((("" + fxpos[0]) + "") + fxpos[1]) + "") + fxpos[2]) + "");
			println("");
			println("");
			println(("" + fxcommand) + "");
			println(("" + fxid) + "");
			println(("" + waittime) + "");
			println("");
		}
	#/
}

/*
	Name: gunfireloopfx
	Namespace: fx
	Checksum: 0x67DCB2DC
	Offset: 0x230
	Size: 0x6C
	Parameters: 8
	Flags: None
*/
function gunfireloopfx(fxid, fxpos, shotsmin, shotsmax, shotdelaymin, shotdelaymax, betweensetsmin, betweensetsmax)
{
	thread gunfireloopfxthread(fxid, fxpos, shotsmin, shotsmax, shotdelaymin, shotdelaymax, betweensetsmin, betweensetsmax);
}

/*
	Name: gunfireloopfxthread
	Namespace: fx
	Checksum: 0x1A46702C
	Offset: 0x2A8
	Size: 0x1EA
	Parameters: 8
	Flags: None
*/
function gunfireloopfxthread(fxid, fxpos, shotsmin, shotsmax, shotdelaymin, shotdelaymax, betweensetsmin, betweensetsmax)
{
	level endon(#"hash_d5682445dd3d910");
	waitframe(1);
	if(betweensetsmax < betweensetsmin)
	{
		temp = betweensetsmax;
		betweensetsmax = betweensetsmin;
		betweensetsmin = temp;
	}
	betweensetsbase = betweensetsmin;
	betweensetsrange = betweensetsmax - betweensetsmin;
	if(shotdelaymax < shotdelaymin)
	{
		temp = shotdelaymax;
		shotdelaymax = shotdelaymin;
		shotdelaymin = temp;
	}
	shotdelaybase = shotdelaymin;
	shotdelayrange = shotdelaymax - shotdelaymin;
	if(shotsmax < shotsmin)
	{
		temp = shotsmax;
		shotsmax = shotsmin;
		shotsmin = temp;
	}
	shotsbase = shotsmin;
	shotsrange = shotsmax - shotsmin;
	fxent = spawnfx(level._effect[fxid], fxpos);
	for(;;)
	{
		shotnum = shotsbase + randomint(shotsrange);
		for(i = 0; i < shotnum; i++)
		{
			triggerfx(fxent);
			wait(shotdelaybase + randomfloat(shotdelayrange));
		}
		wait(betweensetsbase + randomfloat(betweensetsrange));
	}
}

/*
	Name: gunfireloopfxvec
	Namespace: fx
	Checksum: 0x57D51BBB
	Offset: 0x4A0
	Size: 0x74
	Parameters: 9
	Flags: None
*/
function gunfireloopfxvec(fxid, fxpos, fxpos2, shotsmin, shotsmax, shotdelaymin, shotdelaymax, betweensetsmin, betweensetsmax)
{
	thread gunfireloopfxvecthread(fxid, fxpos, fxpos2, shotsmin, shotsmax, shotdelaymin, shotdelaymax, betweensetsmin, betweensetsmax);
}

/*
	Name: gunfireloopfxvecthread
	Namespace: fx
	Checksum: 0x74E5D1BC
	Offset: 0x520
	Size: 0x282
	Parameters: 9
	Flags: None
*/
function gunfireloopfxvecthread(fxid, fxpos, fxpos2, shotsmin, shotsmax, shotdelaymin, shotdelaymax, betweensetsmin, betweensetsmax)
{
	level endon(#"hash_d5682445dd3d910");
	waitframe(1);
	if(betweensetsmax < betweensetsmin)
	{
		temp = betweensetsmax;
		betweensetsmax = betweensetsmin;
		betweensetsmin = temp;
	}
	betweensetsbase = betweensetsmin;
	betweensetsrange = betweensetsmax - betweensetsmin;
	if(shotdelaymax < shotdelaymin)
	{
		temp = shotdelaymax;
		shotdelaymax = shotdelaymin;
		shotdelaymin = temp;
	}
	shotdelaybase = shotdelaymin;
	shotdelayrange = shotdelaymax - shotdelaymin;
	if(shotsmax < shotsmin)
	{
		temp = shotsmax;
		shotsmax = shotsmin;
		shotsmin = temp;
	}
	shotsbase = shotsmin;
	shotsrange = shotsmax - shotsmin;
	fxpos2 = vectornormalize(fxpos2 - fxpos);
	fxent = spawnfx(level._effect[fxid], fxpos, fxpos2);
	for(;;)
	{
		shotnum = shotsbase + randomint(shotsrange);
		for(i = 0; i < int(shotnum / level.fxfireloopmod); i++)
		{
			triggerfx(fxent);
			delay = (shotdelaybase + randomfloat(shotdelayrange)) * level.fxfireloopmod;
			if(delay < 0.05)
			{
				delay = 0.05;
			}
			wait(delay);
		}
		wait(shotdelaybase + randomfloat(shotdelayrange));
		wait(betweensetsbase + randomfloat(betweensetsrange));
	}
}

/*
	Name: grenadeexplosionfx
	Namespace: fx
	Checksum: 0xB4C22309
	Offset: 0x7B0
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function grenadeexplosionfx(pos)
{
	playfx(level._effect[#"hash_38faf2be38a9b539"], pos);
	earthquake(0.15, 0.5, pos, 250);
}

