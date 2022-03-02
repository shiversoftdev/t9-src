#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\util_shared.csc;

#namespace gibclientutils;

/*
	Name: main
	Namespace: gibclientutils
	Checksum: 0x35BFFC70
	Offset: 0x218
	Size: 0xB4
	Parameters: 0
	Flags: AutoExec
*/
function autoexec main()
{
	clientfield::register("actor", "gib_state", 1, 12, "int", &_gibhandler, 0, 0);
	clientfield::register("playercorpse", "gib_state", 1, 15, "int", &_gibhandler, 0, 0);
	level.var_ad0f5efa = [];
	level thread _annihilatecorpse();
}

/*
	Name: function_3aa023f1
	Namespace: gibclientutils
	Checksum: 0xBF872F5E
	Offset: 0x2D8
	Size: 0x2E8
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3aa023f1(name)
{
	if(!isdefined(name))
	{
		return undefined;
	}
	gibdef = level.var_ad0f5efa[name];
	if(isdefined(gibdef))
	{
		return gibdef;
	}
	definition = getscriptbundle(name);
	if(!isdefined(definition))
	{
		/#
			assertmsg("" + name);
		#/
		return undefined;
	}
	gibpiecelookup = [];
	gibpiecelookup[2] = "annihilate";
	gibpiecelookup[8] = "head";
	gibpiecelookup[16] = "rightarm";
	gibpiecelookup[32] = "leftarm";
	gibpiecelookup[128] = "rightleg";
	gibpiecelookup[256] = "leftleg";
	var_90aba050 = [];
	foreach(gibflag, gibpiece in gibpiecelookup)
	{
		if(!isdefined(gibpiece))
		{
			/#
				assertmsg("" + gibflag);
			#/
			continue;
		}
		gibstruct = spawnstruct();
		gibstruct.gibmodel = definition.(gibpiece + "_gibmodel");
		gibstruct.gibtag = definition.(gibpiece + "_gibtag");
		gibstruct.gibfx = definition.(gibpiece + "_gibfx");
		gibstruct.gibfxtag = definition.(gibpiece + "_gibeffecttag");
		gibstruct.gibdynentfx = definition.(gibpiece + "_gibdynentfx");
		gibstruct.gibcinematicfx = definition.(gibpiece + "_gibcinematicfx");
		gibstruct.gibsound = definition.(gibpiece + "_gibsound");
		gibstruct.gibhidetag = definition.(gibpiece + "_gibhidetag");
		var_90aba050[gibflag] = gibstruct;
	}
	level.var_ad0f5efa[name] = var_90aba050;
	return var_90aba050;
}

/*
	Name: function_9fe14ca3
	Namespace: gibclientutils
	Checksum: 0x13D4ABCE
	Offset: 0x5C8
	Size: 0x360
	Parameters: 3
	Flags: Linked, Private
*/
function private function_9fe14ca3(entity, gibflag, var_c3317960)
{
	if(gibflag == 8)
	{
		part = "head";
	}
	else
	{
		if(gibflag == 16 || gibflag == 32)
		{
			part = "arms";
		}
		else if(gibflag == 128 || gibflag == 256)
		{
			part = "legs";
		}
	}
	if(!isdefined(part))
	{
		return undefined;
	}
	name = entity getplayergibdef(part, var_c3317960);
	if(!isdefined(name))
	{
		/#
			assertmsg("" + gibflag);
		#/
		return undefined;
	}
	gibdef = level.var_ad0f5efa[name];
	if(isdefined(gibdef))
	{
		return gibdef;
	}
	definition = getscriptbundle(name);
	if(!isdefined(definition))
	{
		/#
			assertmsg("" + name);
		#/
		return undefined;
	}
	gibpiecelookup = [];
	gibpiecelookup[0] = "left";
	gibpiecelookup[1] = "right";
	var_90aba050 = [];
	foreach(gibpiece in gibpiecelookup)
	{
		if(!isdefined(gibpiece))
		{
			continue;
		}
		gibstruct = spawnstruct();
		gibstruct.gibmodel = definition.(gibpiece + "_gibmodel");
		gibstruct.gibtag = definition.(gibpiece + "_gibtag");
		gibstruct.gibfx = definition.(gibpiece + "_gibfx");
		gibstruct.gibfxtag = definition.(gibpiece + "_gibeffecttag");
		gibstruct.gibdynentfx = definition.(gibpiece + "_gibdynentfx");
		gibstruct.gibcinematicfx = definition.(gibpiece + "_gibcinematicfx");
		gibstruct.gibsound = definition.(gibpiece + "_gibsound");
		gibstruct.gibhidetag = definition.(gibpiece + "_gibhidetag");
		var_90aba050[side] = gibstruct;
	}
	level.var_ad0f5efa[name] = var_90aba050;
	return var_90aba050;
}

/*
	Name: function_c0099e86
	Namespace: gibclientutils
	Checksum: 0xD865DB16
	Offset: 0x930
	Size: 0xBE
	Parameters: 3
	Flags: Linked
*/
function function_c0099e86(entity, gibflag, var_c3317960)
{
	gibpiece = function_9fe14ca3(entity, gibflag, var_c3317960);
	if(!isdefined(gibpiece))
	{
		return undefined;
	}
	if(gibflag == 8)
	{
		side = 0;
	}
	else
	{
		if(gibflag == 16 || gibflag == 128)
		{
			side = 1;
		}
		else if(gibflag == 32 || gibflag == 256)
		{
			side = 0;
		}
	}
	return gibpiece[side];
}

/*
	Name: function_d956078a
	Namespace: gibclientutils
	Checksum: 0x7694FC4
	Offset: 0x9F8
	Size: 0x88
	Parameters: 2
	Flags: Linked, Private
*/
function private function_d956078a(entity, var_c3317960)
{
	name = entity.gibdef;
	if(isdefined(entity.var_868d0717))
	{
		if(isdefined(entity.var_868d0717[var_c3317960]))
		{
			name = entity.var_868d0717[var_c3317960];
		}
		else if(isdefined(entity.var_868d0717[0]))
		{
			name = entity.var_868d0717[0];
		}
	}
	return name;
}

/*
	Name: function_69db754
	Namespace: gibclientutils
	Checksum: 0x8D42AA0D
	Offset: 0xA88
	Size: 0xDC
	Parameters: 3
	Flags: Linked, Private
*/
function private function_69db754(entity, gibflag, var_c3317960)
{
	if(isplayer(entity) || entity isplayercorpse())
	{
		return function_c0099e86(entity, gibflag, var_c3317960);
	}
	if(isdefined(entity.gib_data))
	{
		var_90aba050 = function_3aa023f1(entity.gib_data.gibdef);
	}
	else
	{
		var_90aba050 = function_3aa023f1(function_d956078a(entity, var_c3317960));
	}
	return var_90aba050[gibflag];
}

/*
	Name: _annihilatecorpse
	Namespace: gibclientutils
	Checksum: 0x50981F07
	Offset: 0xB70
	Size: 0x230
	Parameters: 0
	Flags: Linked, Private
*/
function private _annihilatecorpse()
{
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"corpse_explode");
		localclientnum = waitresult.localclientnum;
		body = waitresult.body;
		origin = waitresult.position;
		if(!util::is_mature() || util::is_gib_restricted_build())
		{
			continue;
		}
		if(isdefined(body) && _hasgibdef(body, 0) && body isragdoll())
		{
			cliententgibhead(localclientnum, body, 0);
			cliententgibrightarm(localclientnum, body, 0);
			cliententgibleftarm(localclientnum, body, 0);
			cliententgibrightleg(localclientnum, body, 0);
			cliententgibleftleg(localclientnum, body, 0);
		}
		if(isdefined(body) && _hasgibdef(body, 0) && body.archetype == #"human")
		{
			if(randomint(100) >= 50)
			{
				continue;
			}
			if(isdefined(origin) && distancesquared(body.origin, origin) <= 14400)
			{
				body.ignoreragdoll = 1;
				body _gibentity(localclientnum, 50 | 384, 1, 0);
			}
		}
	}
}

/*
	Name: _clonegibdata
	Namespace: gibclientutils
	Checksum: 0x4BC19FF8
	Offset: 0xDA8
	Size: 0x182
	Parameters: 4
	Flags: Linked, Private
*/
function private _clonegibdata(localclientnum, entity, var_c3317960, clone)
{
	clone.gib_data = spawnstruct();
	clone.gib_data.gib_state = entity.gib_state;
	clone.gib_data.gibdef = function_d956078a(entity, var_c3317960);
	clone.gib_data.hatmodel = entity.hatmodel;
	clone.gib_data.head = entity.head;
	clone.gib_data.legdmg1 = entity.legdmg1;
	clone.gib_data.legdmg2 = entity.legdmg2;
	clone.gib_data.legdmg3 = entity.legdmg3;
	clone.gib_data.legdmg4 = entity.legdmg4;
	clone.gib_data.torsodmg1 = entity.torsodmg1;
	clone.gib_data.torsodmg2 = entity.torsodmg2;
	clone.gib_data.torsodmg3 = entity.torsodmg3;
	clone.gib_data.torsodmg4 = entity.torsodmg4;
	clone.gib_data.torsodmg5 = entity.torsodmg5;
}

/*
	Name: _getgibbedstate
	Namespace: gibclientutils
	Checksum: 0xB9DD79F5
	Offset: 0xF38
	Size: 0x72
	Parameters: 2
	Flags: Linked, Private
*/
function private _getgibbedstate(localclientnum, entity)
{
	if(isdefined(entity.gib_data) && isdefined(entity.gib_data.gib_state))
	{
		return entity.gib_data.gib_state;
	}
	if(isdefined(entity.gib_state))
	{
		return entity.gib_state;
	}
	return 0;
}

/*
	Name: _getgibbedlegmodel
	Namespace: gibclientutils
	Checksum: 0x1E2EE85D
	Offset: 0xFB8
	Size: 0x14A
	Parameters: 2
	Flags: Linked, Private
*/
function private _getgibbedlegmodel(localclientnum, entity)
{
	gibstate = _getgibbedstate(localclientnum, entity);
	rightleggibbed = gibstate & 128;
	leftleggibbed = gibstate & 256;
	if(rightleggibbed && leftleggibbed)
	{
		return (isdefined(entity.gib_data) ? entity.gib_data.legdmg4 : entity.legdmg4);
	}
	if(rightleggibbed)
	{
		return (isdefined(entity.gib_data) ? entity.gib_data.legdmg2 : entity.legdmg2);
	}
	if(leftleggibbed)
	{
		return (isdefined(entity.gib_data) ? entity.gib_data.legdmg3 : entity.legdmg3);
	}
	return (isdefined(entity.gib_data) ? entity.gib_data.legdmg1 : entity.legdmg1);
}

/*
	Name: _getgibextramodel
	Namespace: gibclientutils
	Checksum: 0x8557AC0C
	Offset: 0x1110
	Size: 0xBC
	Parameters: 3
	Flags: Linked, Private
*/
function private _getgibextramodel(localclientnumm, entity, gibflag)
{
	if(gibflag == 4)
	{
		return (isdefined(entity.gib_data) ? entity.gib_data.hatmodel : entity.hatmodel);
	}
	if(gibflag == 8)
	{
		return (isdefined(entity.gib_data) ? entity.gib_data.head : entity.head);
	}
	/#
		assertmsg("");
	#/
}

/*
	Name: _getgibbedtorsomodel
	Namespace: gibclientutils
	Checksum: 0xB235904C
	Offset: 0x11D8
	Size: 0x14A
	Parameters: 2
	Flags: Linked, Private
*/
function private _getgibbedtorsomodel(localclientnum, entity)
{
	gibstate = _getgibbedstate(localclientnum, entity);
	rightarmgibbed = gibstate & 16;
	leftarmgibbed = gibstate & 32;
	if(rightarmgibbed && leftarmgibbed)
	{
		return (isdefined(entity.gib_data) ? entity.gib_data.torsodmg2 : entity.torsodmg2);
	}
	if(rightarmgibbed)
	{
		return (isdefined(entity.gib_data) ? entity.gib_data.torsodmg2 : entity.torsodmg2);
	}
	if(leftarmgibbed)
	{
		return (isdefined(entity.gib_data) ? entity.gib_data.torsodmg3 : entity.torsodmg3);
	}
	return (isdefined(entity.gib_data) ? entity.gib_data.torsodmg1 : entity.torsodmg1);
}

/*
	Name: _gibpiecetag
	Namespace: gibclientutils
	Checksum: 0x2C772CAE
	Offset: 0x1330
	Size: 0x78
	Parameters: 4
	Flags: Private
*/
function private _gibpiecetag(localclientnum, entity, gibflag, var_c3317960)
{
	if(!_hasgibdef(self, var_c3317960))
	{
		return;
	}
	gibpiece = function_69db754(entity, gibflag, var_c3317960);
	if(isdefined(gibpiece))
	{
		return gibpiece.gibfxtag;
	}
}

/*
	Name: function_ba120c50
	Namespace: gibclientutils
	Checksum: 0xDB2ED099
	Offset: 0x13B0
	Size: 0x72
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ba120c50(gibflags)
{
	var_ec7623a6 = 0;
	if(gibflags & 12)
	{
		var_ec7623a6 = var_ec7623a6 | 1;
	}
	if(gibflags & 48)
	{
		var_ec7623a6 = var_ec7623a6 | 2;
	}
	if(gibflags & 384)
	{
		var_ec7623a6 = var_ec7623a6 | 4;
	}
	return var_ec7623a6;
}

/*
	Name: _gibentity
	Namespace: gibclientutils
	Checksum: 0x6CBB7D3
	Offset: 0x1430
	Size: 0x46E
	Parameters: 4
	Flags: Linked, Private
*/
function private _gibentity(localclientnum, gibflags, shouldspawngibs, var_c3317960)
{
	entity = self;
	if(!_hasgibdef(entity, var_c3317960))
	{
		return;
	}
	currentgibflag = 2;
	gibdir = undefined;
	var_8e57b530 = undefined;
	if(isplayer(entity) || entity isplayercorpse())
	{
		yaw_bits = (gibflags >> 12) & (8 - 1);
		yaw = getanglefrombits(yaw_bits, 3);
		gibdir = anglestoforward((0, yaw, 0));
	}
	while(gibflags >= currentgibflag)
	{
		if(gibflags & currentgibflag)
		{
			if(currentgibflag == 2)
			{
				if(isplayer(entity) || entity isplayercorpse())
				{
					var_c0c9eae3 = entity function_4976d5ee();
					if(isdefined(var_c0c9eae3))
					{
						_playgibfx(localclientnum, entity, var_c0c9eae3[#"fx"], var_c0c9eae3[#"tag"]);
					}
				}
				else
				{
					gibpiece = function_69db754(entity, currentgibflag, var_c3317960);
					if(isdefined(gibpiece))
					{
						_playgibfx(localclientnum, entity, gibpiece.gibfx, gibpiece.gibfxtag);
						if(isdefined(gibpiece.gibcinematicfx))
						{
							if(function_92beaa28(localclientnum))
							{
								_playgibfx(localclientnum, entity, gibpiece.gibcinematicfx, gibpiece.gibfxtag);
							}
						}
						_playgibsound(localclientnum, entity, gibpiece.gibsound);
					}
				}
				entity hide();
				entity.ignoreragdoll = 1;
			}
			else
			{
				gibpiece = function_69db754(entity, currentgibflag, var_c3317960);
				if(isdefined(gibpiece))
				{
					if(shouldspawngibs)
					{
						var_cd61eb7d = function_ba120c50(currentgibflag);
						entity thread _gibpiece(localclientnum, entity, gibpiece.gibmodel, gibpiece.gibtag, gibpiece.gibdynentfx, gibdir, var_8e57b530, var_cd61eb7d);
						if(isdefined(gibpiece.gibhidetag) && entity isplayercorpse() && entity hasdobj(localclientnum))
						{
							entity function_7a198d8c(localclientnum, gibpiece.gibhidetag, "", 1);
						}
					}
					_playgibfx(localclientnum, entity, gibpiece.gibfx, gibpiece.gibfxtag);
					if(isdefined(gibpiece.gibcinematicfx))
					{
						if(function_92beaa28(localclientnum))
						{
							_playgibfx(localclientnum, entity, gibpiece.gibcinematicfx, gibpiece.gibfxtag);
						}
					}
					_playgibsound(localclientnum, entity, gibpiece.gibsound);
				}
			}
			_handlegibcallbacks(localclientnum, entity, currentgibflag);
		}
		currentgibflag = currentgibflag << 1;
	}
}

/*
	Name: _setgibbed
	Namespace: gibclientutils
	Checksum: 0xD576C449
	Offset: 0x18A8
	Size: 0xA2
	Parameters: 4
	Flags: Linked, Private
*/
function private _setgibbed(localclientnum, entity, gibflag, var_c3317960)
{
	gib_state = (_getgibbedstate(localclientnum, entity) & (512 - 1)) | (gibflag & (512 - 1)) + (var_c3317960 << 9);
	if(isdefined(entity.gib_data))
	{
		entity.gib_data.gib_state = gib_state;
	}
	else
	{
		entity.gib_state = gib_state;
	}
}

/*
	Name: _gibcliententityinternal
	Namespace: gibclientutils
	Checksum: 0xECFF00EE
	Offset: 0x1958
	Size: 0x1AC
	Parameters: 4
	Flags: Linked, Private
*/
function private _gibcliententityinternal(localclientnum, entity, gibflag, var_c3317960)
{
	if(!util::is_mature() || util::is_gib_restricted_build())
	{
		return;
	}
	if(!isdefined(entity) || !_hasgibdef(entity, var_c3317960))
	{
		return;
	}
	if(entity.type !== "scriptmover")
	{
		return;
	}
	if(isgibbed(localclientnum, entity, gibflag))
	{
		return;
	}
	if(!_getgibbedstate(localclientnum, entity) < 16)
	{
		legmodel = _getgibbedlegmodel(localclientnum, entity);
		entity detach(legmodel, "");
	}
	_setgibbed(localclientnum, entity, gibflag, var_c3317960);
	entity setmodel(_getgibbedtorsomodel(localclientnum, entity));
	entity attach(_getgibbedlegmodel(localclientnum, entity), "");
	entity _gibentity(localclientnum, gibflag, 1, var_c3317960);
}

/*
	Name: _gibclientextrainternal
	Namespace: gibclientutils
	Checksum: 0x3B10E887
	Offset: 0x1B10
	Size: 0x1C4
	Parameters: 4
	Flags: Linked, Private
*/
function private _gibclientextrainternal(localclientnum, entity, gibflag, var_c3317960)
{
	if(!util::is_mature() || util::is_gib_restricted_build())
	{
		return;
	}
	if(!isdefined(entity))
	{
		return;
	}
	if(entity.type !== "scriptmover")
	{
		return;
	}
	if(isgibbed(localclientnum, entity, gibflag))
	{
		return;
	}
	gibmodel = _getgibextramodel(localclientnum, entity, gibflag);
	if(isdefined(gibmodel) && entity isattached(gibmodel, ""))
	{
		entity detach(gibmodel, "");
	}
	if(gibflag == 8)
	{
		if(isdefined((isdefined(entity.gib_data) ? entity.gib_data.torsodmg5 : entity.torsodmg5)))
		{
			entity attach((isdefined(entity.gib_data) ? entity.gib_data.torsodmg5 : entity.torsodmg5), "");
		}
	}
	_setgibbed(localclientnum, entity, gibflag, var_c3317960);
	entity _gibentity(localclientnum, gibflag, 1, var_c3317960);
}

/*
	Name: _gibhandler
	Namespace: gibclientutils
	Checksum: 0xE2276361
	Offset: 0x1CE0
	Size: 0x1D2
	Parameters: 7
	Flags: Linked, Private
*/
function private _gibhandler(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump)
{
	entity = self;
	var_c3317960 = (fieldname >> 9) & (8 - 1);
	if(3 < var_c3317960)
	{
		var_c3317960 = 0;
	}
	if(isplayer(entity) || entity isplayercorpse())
	{
		if(!util::is_mature() || util::is_gib_restricted_build())
		{
			return;
		}
	}
	else
	{
		if(isdefined(entity.maturegib) && entity.maturegib && (!util::is_mature() || !isshowgibsenabled()))
		{
			return;
		}
		if(isdefined(entity.restrictedgib) && entity.restrictedgib && !isshowgibsenabled())
		{
			return;
		}
	}
	gibflags = binitialsnap ^ fieldname;
	shouldspawngibs = !fieldname & 1;
	if(wasdemojump)
	{
		gibflags = 0 ^ fieldname;
	}
	entity _gibentity(bnewent, gibflags, shouldspawngibs, var_c3317960);
	entity.gib_state = fieldname;
}

/*
	Name: _gibpiece
	Namespace: gibclientutils
	Checksum: 0x2FC596AE
	Offset: 0x1EC0
	Size: 0x3CC
	Parameters: 8
	Flags: Linked
*/
function _gibpiece(localclientnum, entity, gibmodel, gibtag, gibfx, gibdir, var_8e57b530, var_bf41adc0)
{
	if(!isdefined(gibtag) || !isdefined(gibmodel))
	{
		return;
	}
	if(gibmodel == #"")
	{
		return;
	}
	startposition = entity gettagorigin(gibtag);
	startangles = entity gettagangles(gibtag);
	endposition = startposition;
	endangles = startangles;
	forwardvector = undefined;
	if(!isdefined(startposition) || !isdefined(startangles))
	{
		return;
	}
	if(isdefined(gibdir) && !isdefined(var_8e57b530))
	{
		startposition = (0, 0, 0);
		forwardvector = gibdir;
		forwardvector = forwardvector * randomfloatrange(100, 500);
	}
	else
	{
		waitframe(1);
		if(isdefined(entity))
		{
			endposition = entity gettagorigin(gibtag);
			endangles = entity gettagangles(gibtag);
		}
		else
		{
			endposition = startposition + (anglestoforward(startangles) * 10);
			endangles = startangles;
		}
		if(!isdefined(endposition) || !isdefined(endangles))
		{
			return;
		}
		scale = randomfloatrange(0.6, 1);
		dir = (randomfloatrange(0, 0.2), randomfloatrange(0, 0.2), randomfloatrange(0.2, 0.7));
		if(isdefined(gibdir) && isdefined(var_8e57b530) && var_8e57b530 > 0)
		{
			dir = gibdir + dir;
			scale = var_8e57b530;
		}
		forwardvector = vectornormalize(endposition - startposition);
		forwardvector = forwardvector * scale;
		forwardvector = forwardvector + dir;
	}
	if(isdefined(entity))
	{
		if(!isdefined(entity.var_f9a4eb08))
		{
			entity.var_f9a4eb08 = [];
		}
		gibentity = createdynentandlaunch(localclientnum, gibmodel, endposition, endangles, startposition, forwardvector, gibfx, 1, !is_true(level.var_2f78f66c));
		if(!isdefined(entity.var_f9a4eb08))
		{
			entity.var_f9a4eb08 = [];
		}
		else if(!isarray(entity.var_f9a4eb08))
		{
			entity.var_f9a4eb08 = array(entity.var_f9a4eb08);
		}
		entity.var_f9a4eb08[entity.var_f9a4eb08.size] = gibentity;
		if(isdefined(gibentity))
		{
			function_1cfbe3d4(gibentity, entity function_c70446c2(), var_bf41adc0);
		}
	}
}

/*
	Name: _handlegibcallbacks
	Namespace: gibclientutils
	Checksum: 0xA1149449
	Offset: 0x2298
	Size: 0xC6
	Parameters: 3
	Flags: Linked, Private
*/
function private _handlegibcallbacks(localclientnum, entity, gibflag)
{
	if(isdefined(entity._gibcallbacks) && isdefined(entity._gibcallbacks[gibflag]))
	{
		foreach(callback in entity._gibcallbacks[gibflag])
		{
			[[callback]](localclientnum, entity, gibflag);
		}
	}
}

/*
	Name: _handlegibannihilate
	Namespace: gibclientutils
	Checksum: 0x34E34E1D
	Offset: 0x2368
	Size: 0x7C
	Parameters: 1
	Flags: Linked, Private
*/
function private _handlegibannihilate(localclientnum)
{
	entity = self;
	entity endon(#"death");
	entity waittillmatch({#notetrack:"gib_annihilate"}, #"_anim_notify_");
	cliententgibannihilate(localclientnum, entity);
}

/*
	Name: _handlegibhead
	Namespace: gibclientutils
	Checksum: 0xCDEC7B43
	Offset: 0x23F0
	Size: 0x7C
	Parameters: 1
	Flags: Linked, Private
*/
function private _handlegibhead(localclientnum)
{
	entity = self;
	entity endon(#"death");
	entity waittillmatch({#notetrack:"gib = \"head\""}, #"_anim_notify_");
	cliententgibhead(localclientnum, entity, 0);
}

/*
	Name: _handlegibrightarm
	Namespace: gibclientutils
	Checksum: 0x380AFFD
	Offset: 0x2478
	Size: 0x7C
	Parameters: 1
	Flags: Linked, Private
*/
function private _handlegibrightarm(localclientnum)
{
	entity = self;
	entity endon(#"death");
	entity waittillmatch({#notetrack:"gib = \"arm_right\""}, #"_anim_notify_");
	cliententgibrightarm(localclientnum, entity, 0);
}

/*
	Name: _handlegibleftarm
	Namespace: gibclientutils
	Checksum: 0x27DF417
	Offset: 0x2500
	Size: 0x7C
	Parameters: 1
	Flags: Linked, Private
*/
function private _handlegibleftarm(localclientnum)
{
	entity = self;
	entity endon(#"death");
	entity waittillmatch({#notetrack:"gib = \"arm_left\""}, #"_anim_notify_");
	cliententgibleftarm(localclientnum, entity, 0);
}

/*
	Name: _handlegibrightleg
	Namespace: gibclientutils
	Checksum: 0x5730B279
	Offset: 0x2588
	Size: 0x7C
	Parameters: 1
	Flags: Linked, Private
*/
function private _handlegibrightleg(localclientnum)
{
	entity = self;
	entity endon(#"death");
	entity waittillmatch({#notetrack:"gib = \"leg_right\""}, #"_anim_notify_");
	cliententgibrightleg(localclientnum, entity, 0);
}

/*
	Name: _handlegibleftleg
	Namespace: gibclientutils
	Checksum: 0x2FCED723
	Offset: 0x2610
	Size: 0x7C
	Parameters: 1
	Flags: Linked, Private
*/
function private _handlegibleftleg(localclientnum)
{
	entity = self;
	entity endon(#"death");
	entity waittillmatch({#notetrack:"gib = \"leg_left\""}, #"_anim_notify_");
	cliententgibleftleg(localclientnum, entity, 0);
}

/*
	Name: _hasgibdef
	Namespace: gibclientutils
	Checksum: 0xA103CADA
	Offset: 0x2698
	Size: 0x90
	Parameters: 2
	Flags: Linked, Private
*/
function private _hasgibdef(entity, var_c3317960)
{
	return isdefined(entity.gib_data) && isdefined(entity.gib_data.gibdef) || isdefined(entity.gibdef) || (isdefined(entity getplayergibdef("arms", var_c3317960)) && isdefined(entity getplayergibdef("legs", var_c3317960)));
}

/*
	Name: _playgibfx
	Namespace: gibclientutils
	Checksum: 0x59768DD5
	Offset: 0x2730
	Size: 0xEA
	Parameters: 4
	Flags: Linked
*/
function _playgibfx(localclientnum, entity, fxfilename, fxtag)
{
	if(isdefined(fxfilename) && isdefined(fxtag) && entity hasdobj(localclientnum))
	{
		fx = util::playfxontag(localclientnum, fxfilename, entity, fxtag);
		if(isdefined(fx))
		{
			if(isdefined(entity.team))
			{
				setfxteam(localclientnum, fx, entity.team);
			}
			if(is_true(level.setgibfxtoignorepause))
			{
				setfxignorepause(localclientnum, fx, 1);
			}
		}
		return fx;
	}
}

/*
	Name: _playgibsound
	Namespace: gibclientutils
	Checksum: 0x3CE2CCAC
	Offset: 0x2828
	Size: 0x44
	Parameters: 3
	Flags: Linked
*/
function _playgibsound(localclientnum, entity, soundalias)
{
	if(isdefined(soundalias))
	{
		playsound(localclientnum, soundalias, entity.origin);
	}
}

/*
	Name: addgibcallback
	Namespace: gibclientutils
	Checksum: 0xD82302F6
	Offset: 0x2878
	Size: 0xC0
	Parameters: 4
	Flags: Linked
*/
function addgibcallback(localclientnum, entity, gibflag, callbackfunction)
{
	/#
		assert(isfunctionptr(callbackfunction));
	#/
	if(!isdefined(entity._gibcallbacks))
	{
		entity._gibcallbacks = [];
	}
	if(!isdefined(entity._gibcallbacks[gibflag]))
	{
		entity._gibcallbacks[gibflag] = [];
	}
	gibcallbacks = entity._gibcallbacks[gibflag];
	gibcallbacks[gibcallbacks.size] = callbackfunction;
	entity._gibcallbacks[gibflag] = gibcallbacks;
}

/*
	Name: cliententgibannihilate
	Namespace: gibclientutils
	Checksum: 0xB3940137
	Offset: 0x2940
	Size: 0x74
	Parameters: 2
	Flags: Linked
*/
function cliententgibannihilate(localclientnum, entity)
{
	if(!util::is_mature() || util::is_gib_restricted_build())
	{
		return;
	}
	entity.ignoreragdoll = 1;
	entity _gibentity(localclientnum, 50 | 384, 1, 0);
}

/*
	Name: cliententgibhead
	Namespace: gibclientutils
	Checksum: 0x45E70C94
	Offset: 0x29C0
	Size: 0x3C
	Parameters: 3
	Flags: Linked
*/
function cliententgibhead(localclientnum, entity, var_c3317960)
{
	_gibclientextrainternal(localclientnum, entity, 8, var_c3317960);
}

/*
	Name: cliententgibleftarm
	Namespace: gibclientutils
	Checksum: 0x1C382A3C
	Offset: 0x2A08
	Size: 0x54
	Parameters: 3
	Flags: Linked
*/
function cliententgibleftarm(localclientnum, entity, var_c3317960)
{
	if(isgibbed(localclientnum, entity, 16))
	{
		return;
	}
	_gibcliententityinternal(localclientnum, entity, 32, var_c3317960);
}

/*
	Name: cliententgibrightarm
	Namespace: gibclientutils
	Checksum: 0x65C9B8DE
	Offset: 0x2A68
	Size: 0x54
	Parameters: 3
	Flags: Linked
*/
function cliententgibrightarm(localclientnum, entity, var_c3317960)
{
	if(isgibbed(localclientnum, entity, 32))
	{
		return;
	}
	_gibcliententityinternal(localclientnum, entity, 16, var_c3317960);
}

/*
	Name: cliententgibleftleg
	Namespace: gibclientutils
	Checksum: 0xA22FA89B
	Offset: 0x2AC8
	Size: 0x3C
	Parameters: 3
	Flags: Linked
*/
function cliententgibleftleg(localclientnum, entity, var_c3317960)
{
	_gibcliententityinternal(localclientnum, entity, 256, var_c3317960);
}

/*
	Name: cliententgibrightleg
	Namespace: gibclientutils
	Checksum: 0xF4823117
	Offset: 0x2B10
	Size: 0x3C
	Parameters: 3
	Flags: Linked
*/
function cliententgibrightleg(localclientnum, entity, var_c3317960)
{
	_gibcliententityinternal(localclientnum, entity, 128, var_c3317960);
}

/*
	Name: createscriptmodelofentity
	Namespace: gibclientutils
	Checksum: 0x1396ECBB
	Offset: 0x2B58
	Size: 0x308
	Parameters: 3
	Flags: None
*/
function createscriptmodelofentity(localclientnum, entity, var_c3317960)
{
	clone = spawn(localclientnum, entity.origin, "script_model");
	clone.angles = entity.angles;
	_clonegibdata(localclientnum, entity, var_c3317960, clone);
	gibstate = _getgibbedstate(localclientnum, clone);
	if(!util::is_mature() || util::is_gib_restricted_build())
	{
		gibstate = 0;
	}
	if(!_getgibbedstate(localclientnum, entity) < 16)
	{
		clone setmodel(_getgibbedtorsomodel(localclientnum, entity));
		clone attach(_getgibbedlegmodel(localclientnum, entity), "");
	}
	else
	{
		clone setmodel(entity.model);
	}
	if(gibstate & 8)
	{
		if(isdefined((isdefined(clone.gib_data) ? clone.gib_data.torsodmg5 : clone.torsodmg5)))
		{
			clone attach((isdefined(clone.gib_data) ? clone.gib_data.torsodmg5 : clone.torsodmg5), "");
		}
	}
	else
	{
		if(isdefined((isdefined(clone.gib_data) ? clone.gib_data.head : clone.head)))
		{
			clone attach((isdefined(clone.gib_data) ? clone.gib_data.head : clone.head), "");
		}
		if(!gibstate & 4 && isdefined((isdefined(clone.gib_data) ? clone.gib_data.hatmodel : clone.hatmodel)))
		{
			clone attach((isdefined(clone.gib_data) ? clone.gib_data.hatmodel : clone.hatmodel), "");
		}
	}
	return clone;
}

/*
	Name: isgibbed
	Namespace: gibclientutils
	Checksum: 0xDE8DF82
	Offset: 0x2E68
	Size: 0x38
	Parameters: 3
	Flags: Linked
*/
function isgibbed(localclientnum, entity, gibflag)
{
	return _getgibbedstate(localclientnum, entity) & gibflag;
}

/*
	Name: isundamaged
	Namespace: gibclientutils
	Checksum: 0xD8C15CD9
	Offset: 0x2EA8
	Size: 0x2E
	Parameters: 2
	Flags: Linked
*/
function isundamaged(localclientnum, entity)
{
	return _getgibbedstate(localclientnum, entity) == 0;
}

/*
	Name: handlegibnotetracks
	Namespace: gibclientutils
	Checksum: 0x6CD00A61
	Offset: 0x2EE0
	Size: 0xAC
	Parameters: 1
	Flags: None
*/
function handlegibnotetracks(localclientnum)
{
	entity = self;
	entity thread _handlegibannihilate(localclientnum);
	entity thread _handlegibhead(localclientnum);
	entity thread _handlegibrightarm(localclientnum);
	entity thread _handlegibleftarm(localclientnum);
	entity thread _handlegibrightleg(localclientnum);
	entity thread _handlegibleftleg(localclientnum);
}

