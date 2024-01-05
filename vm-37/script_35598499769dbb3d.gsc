#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\throttle_shared.gsc;
#using script_4c5c4a64a59247a2;
#using script_41fe08c37d53a635;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace gib;

/*
	Name: main
	Namespace: gib
	Checksum: 0x2931799D
	Offset: 0x1B8
	Size: 0xBC
	Parameters: 0
	Flags: AutoExec
*/
function autoexec main()
{
	clientfield::register("actor", "gib_state", 1, 12, "int");
	clientfield::register("playercorpse", "gib_state", 1, 15, "int");
	level.var_ad0f5efa = [];
	if(!isdefined(level.gib_throttle))
	{
		level.gib_throttle = new throttle();
		[[ level.gib_throttle ]]->initialize(2, 0.2);
	}
}

#namespace gibserverutils;

/*
	Name: function_3aa023f1
	Namespace: gibserverutils
	Checksum: 0xAD57575D
	Offset: 0x280
	Size: 0x380
	Parameters: 2
	Flags: Linked, Private
*/
function private function_3aa023f1(entity, var_c3317960)
{
	if(!isdefined(entity) || !_hasgibdef(entity, var_c3317960))
	{
		return undefined;
	}
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
	gibpieces = [];
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
		gibpieces[gibflag] = gibstruct;
	}
	level.var_ad0f5efa[name] = gibpieces;
	return gibpieces;
}

/*
	Name: function_69db754
	Namespace: gibserverutils
	Checksum: 0x822B409E
	Offset: 0x608
	Size: 0x44
	Parameters: 3
	Flags: Linked, Private
*/
function private function_69db754(entity, gibflag, var_c3317960)
{
	gibpieces = function_3aa023f1(entity, var_c3317960);
	return gibpieces[gibflag];
}

/*
	Name: _annihilate
	Namespace: gibserverutils
	Checksum: 0x1187CC39
	Offset: 0x658
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private _annihilate(entity)
{
	if(isdefined(entity))
	{
		entity notsolid();
	}
}

/*
	Name: _getgibextramodel
	Namespace: gibserverutils
	Checksum: 0x7FC4C978
	Offset: 0x690
	Size: 0xB4
	Parameters: 2
	Flags: Linked, Private
*/
function private _getgibextramodel(entity, gibflag)
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
	Name: _gibextra
	Namespace: gibserverutils
	Checksum: 0x879840D8
	Offset: 0x750
	Size: 0x78
	Parameters: 3
	Flags: Linked, Private
*/
function private _gibextra(entity, gibflag, var_c3317960)
{
	if(isgibbed(entity, gibflag))
	{
		return false;
	}
	if(!_hasgibdef(entity, var_c3317960))
	{
		return false;
	}
	entity thread _gibextrainternal(entity, gibflag, var_c3317960);
	return true;
}

/*
	Name: _gibextrainternal
	Namespace: gibserverutils
	Checksum: 0x83FC2176
	Offset: 0x7D0
	Size: 0x1E4
	Parameters: 3
	Flags: Linked, Private
*/
function private _gibextrainternal(entity, gibflag, var_c3317960)
{
	if(entity.gib_time !== gettime())
	{
		[[ level.gib_throttle ]]->waitinqueue(entity);
	}
	if(!isdefined(entity))
	{
		return;
	}
	entity.gib_time = gettime();
	if(isgibbed(entity, gibflag))
	{
		return false;
	}
	if(gibflag == 8)
	{
		if(isdefined((isdefined(entity.gib_data) ? entity.gib_data.torsodmg5 : entity.torsodmg5)))
		{
			entity attach((isdefined(entity.gib_data) ? entity.gib_data.torsodmg5 : entity.torsodmg5), "", 1);
		}
	}
	_setgibbed(entity, gibflag, undefined, var_c3317960);
	destructserverutils::showdestructedpieces(entity);
	showhiddengibpieces(entity, var_c3317960);
	gibmodel = _getgibextramodel(entity, gibflag);
	if(isdefined(gibmodel) && entity isattached(gibmodel))
	{
		entity detach(gibmodel, "");
	}
	destructserverutils::reapplydestructedpieces(entity);
	reapplyhiddengibpieces(entity, var_c3317960);
}

/*
	Name: _gibentity
	Namespace: gibserverutils
	Checksum: 0x93FC53A3
	Offset: 0x9C0
	Size: 0x90
	Parameters: 3
	Flags: Linked, Private
*/
function private _gibentity(entity, gibflag, var_c3317960)
{
	if(isgibbed(entity, gibflag) || !_hasgibpieces(entity, gibflag, var_c3317960))
	{
		return false;
	}
	if(!_hasgibdef(entity, var_c3317960))
	{
		return false;
	}
	entity thread _gibentityinternal(entity, gibflag, var_c3317960);
	return true;
}

/*
	Name: _gibentityinternal
	Namespace: gibserverutils
	Checksum: 0xAD9E4886
	Offset: 0xA58
	Size: 0x194
	Parameters: 3
	Flags: Linked, Private
*/
function private _gibentityinternal(entity, gibflag, var_c3317960)
{
	if(entity.gib_time !== gettime())
	{
		[[ level.gib_throttle ]]->waitinqueue(entity);
	}
	if(!isdefined(entity))
	{
		return;
	}
	entity.gib_time = gettime();
	if(isgibbed(entity, gibflag))
	{
		return;
	}
	destructserverutils::showdestructedpieces(entity);
	showhiddengibpieces(entity, var_c3317960);
	if(!_getgibbedstate(entity) < 16)
	{
		legmodel = _getgibbedlegmodel(entity);
		entity detach(legmodel);
	}
	_setgibbed(entity, gibflag, undefined, var_c3317960);
	entity setmodel(_getgibbedtorsomodel(entity));
	entity attach(_getgibbedlegmodel(entity));
	destructserverutils::reapplydestructedpieces(entity);
	reapplyhiddengibpieces(entity, var_c3317960);
}

/*
	Name: _getgibbedlegmodel
	Namespace: gibserverutils
	Checksum: 0x56E9D79E
	Offset: 0xBF8
	Size: 0x142
	Parameters: 1
	Flags: Linked, Private
*/
function private _getgibbedlegmodel(entity)
{
	gibstate = _getgibbedstate(entity);
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
	Name: _getgibbedstate
	Namespace: gibserverutils
	Checksum: 0x7B6EFC05
	Offset: 0xD48
	Size: 0x2A
	Parameters: 1
	Flags: Linked, Private
*/
function private _getgibbedstate(entity)
{
	if(isdefined(entity.gib_state))
	{
		return entity.gib_state;
	}
	return 0;
}

/*
	Name: _getgibbedtorsomodel
	Namespace: gibserverutils
	Checksum: 0x65C085C1
	Offset: 0xD80
	Size: 0x142
	Parameters: 1
	Flags: Linked, Private
*/
function private _getgibbedtorsomodel(entity)
{
	gibstate = _getgibbedstate(entity);
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
	Name: _hasgibdef
	Namespace: gibserverutils
	Checksum: 0x94321BE4
	Offset: 0xED0
	Size: 0x5C
	Parameters: 2
	Flags: Linked, Private
*/
function private _hasgibdef(entity, var_c3317960)
{
	if(isdefined(entity.var_868d0717))
	{
		if(isdefined(entity.var_868d0717[var_c3317960]) || isdefined(entity.var_868d0717[0]))
		{
			return 1;
		}
	}
	return isdefined(entity.gibdef);
}

/*
	Name: _hasgibpieces
	Namespace: gibserverutils
	Checksum: 0x97590A70
	Offset: 0xF38
	Size: 0xE2
	Parameters: 3
	Flags: Linked, Private
*/
function private _hasgibpieces(entity, gibflag, var_c3317960)
{
	if(3 < var_c3317960)
	{
		var_c3317960 = 0;
	}
	hasgibpieces = 0;
	gibstate = _getgibbedstate(entity);
	entity.gib_state = (gibstate & (512 - 1)) | (gibflag & (512 - 1)) + (var_c3317960 << 9);
	if(isdefined(_getgibbedtorsomodel(entity)) && isdefined(_getgibbedlegmodel(entity)))
	{
		hasgibpieces = 1;
	}
	entity.gib_state = gibstate;
	return hasgibpieces;
}

/*
	Name: _setgibbed
	Namespace: gibserverutils
	Checksum: 0x156322E
	Offset: 0x1028
	Size: 0x16C
	Parameters: 4
	Flags: Linked, Private
*/
function private _setgibbed(entity, gibflag, gibdir, var_c3317960)
{
	if(3 < var_c3317960)
	{
		var_c3317960 = 0;
	}
	if(isdefined(gibdir))
	{
		angles = vectortoangles(gibdir);
		yaw = angles[1];
		yaw_bits = getbitsforangle(yaw, 3);
		entity.gib_state = (_getgibbedstate(entity) & (512 - 1)) | (gibflag & (512 - 1)) + (var_c3317960 << 9) + (yaw_bits << 12);
	}
	else
	{
		entity.gib_state = (_getgibbedstate(entity) & (512 - 1)) | (gibflag & (512 - 1)) + (var_c3317960 << 9);
	}
	entity.gibbed = 1;
	entity clientfield::set("gib_state", entity.gib_state);
}

/*
	Name: annihilate
	Namespace: gibserverutils
	Checksum: 0xBEF36583
	Offset: 0x11A0
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function annihilate(entity)
{
	if(!_hasgibdef(entity, 0))
	{
		return false;
	}
	gibpiecestruct = function_69db754(entity, 2, 0);
	if(isdefined(gibpiecestruct))
	{
		if(isdefined(gibpiecestruct.gibfx))
		{
			_setgibbed(entity, 2, undefined, 0);
			entity thread _annihilate(entity);
			return true;
		}
	}
	return false;
}

/*
	Name: copygibstate
	Namespace: gibserverutils
	Checksum: 0xC6C8D246
	Offset: 0x1250
	Size: 0x8C
	Parameters: 2
	Flags: Linked
*/
function copygibstate(originalentity, newentity)
{
	newentity.gib_state = _getgibbedstate(originalentity);
	togglespawngibs(newentity, 0);
	var_c3317960 = (newentity.gib_state >> 9) & (8 - 1);
	reapplyhiddengibpieces(newentity, var_c3317960);
}

/*
	Name: isgibbed
	Namespace: gibserverutils
	Checksum: 0xFB65BF07
	Offset: 0x12E8
	Size: 0x30
	Parameters: 2
	Flags: Linked
*/
function isgibbed(entity, gibflag)
{
	return _getgibbedstate(entity) & gibflag;
}

/*
	Name: gibhat
	Namespace: gibserverutils
	Checksum: 0xAD2325F3
	Offset: 0x1320
	Size: 0x32
	Parameters: 2
	Flags: Linked
*/
function gibhat(entity, var_c3317960)
{
	return _gibextra(entity, 4, var_c3317960);
}

/*
	Name: gibhead
	Namespace: gibserverutils
	Checksum: 0x6E9C5BC2
	Offset: 0x1360
	Size: 0xD2
	Parameters: 2
	Flags: Linked
*/
function gibhead(entity, var_c3317960)
{
	if(!isdefined(var_c3317960))
	{
		var_c3317960 = 0;
	}
	gibhat(entity, var_c3317960);
	level notify(#"gib", {#area:"head", #attacker:self.attacker, #entity:entity});
	entity callback::callback(#"head_gibbed");
	return _gibextra(entity, 8, var_c3317960);
}

/*
	Name: gibleftarm
	Namespace: gibserverutils
	Checksum: 0x50D8F1D6
	Offset: 0x1440
	Size: 0xD0
	Parameters: 2
	Flags: Linked
*/
function gibleftarm(entity, var_c3317960)
{
	if(!isdefined(var_c3317960))
	{
		var_c3317960 = 0;
	}
	if(isgibbed(entity, 16))
	{
		return false;
	}
	if(_gibentity(entity, 32, var_c3317960))
	{
		destructserverutils::destructleftarmpieces(entity);
		level notify(#"gib", {#area:"left_arm", #attacker:self.attacker, #entity:entity});
		return true;
	}
	return false;
}

/*
	Name: gibrightarm
	Namespace: gibserverutils
	Checksum: 0xAFEAA520
	Offset: 0x1518
	Size: 0xE8
	Parameters: 2
	Flags: Linked
*/
function gibrightarm(entity, var_c3317960)
{
	if(!isdefined(var_c3317960))
	{
		var_c3317960 = 0;
	}
	if(isgibbed(entity, 32))
	{
		return false;
	}
	if(_gibentity(entity, 16, var_c3317960))
	{
		destructserverutils::destructrightarmpieces(entity);
		entity thread shared::dropaiweapon();
		level notify(#"gib", {#area:"right_arm", #attacker:self.attacker, #entity:entity});
		return true;
	}
	return false;
}

/*
	Name: gibleftleg
	Namespace: gibserverutils
	Checksum: 0x62CD004D
	Offset: 0x1608
	Size: 0xB0
	Parameters: 2
	Flags: Linked
*/
function gibleftleg(entity, var_c3317960)
{
	if(!isdefined(var_c3317960))
	{
		var_c3317960 = 0;
	}
	if(_gibentity(entity, 256, var_c3317960))
	{
		destructserverutils::destructleftlegpieces(entity);
		level notify(#"gib", {#area:"left_leg", #attacker:self.attacker, #entity:entity});
		return true;
	}
	return false;
}

/*
	Name: gibrightleg
	Namespace: gibserverutils
	Checksum: 0xAECA38F2
	Offset: 0x16C0
	Size: 0xB0
	Parameters: 2
	Flags: Linked
*/
function gibrightleg(entity, var_c3317960)
{
	if(!isdefined(var_c3317960))
	{
		var_c3317960 = 0;
	}
	if(_gibentity(entity, 128, var_c3317960))
	{
		destructserverutils::destructrightlegpieces(entity);
		level notify(#"gib", {#area:"right_leg", #attacker:self.attacker, #entity:entity});
		return true;
	}
	return false;
}

/*
	Name: giblegs
	Namespace: gibserverutils
	Checksum: 0x33F171E1
	Offset: 0x1778
	Size: 0xC8
	Parameters: 2
	Flags: Linked
*/
function giblegs(entity, var_c3317960)
{
	if(!isdefined(var_c3317960))
	{
		var_c3317960 = 0;
	}
	if(_gibentity(entity, 384, var_c3317960))
	{
		destructserverutils::destructrightlegpieces(entity);
		destructserverutils::destructleftlegpieces(entity);
		level notify(#"gib", {#area:"both_legs", #attacker:self.attacker, #entity:entity});
		return true;
	}
	return false;
}

/*
	Name: playergibleftarmvel
	Namespace: gibserverutils
	Checksum: 0x1556760E
	Offset: 0x1848
	Size: 0x5C
	Parameters: 1
	Flags: Event
*/
event playergibleftarmvel(entitystruct)
{
	if(isdefined(entitystruct.player.body))
	{
		_setgibbed(entitystruct.player.body, 32, entitystruct.direction, entitystruct.var_c3317960);
	}
}

/*
	Name: playergibrightarmvel
	Namespace: gibserverutils
	Checksum: 0xD5006984
	Offset: 0x18B0
	Size: 0x5C
	Parameters: 1
	Flags: Event
*/
event playergibrightarmvel(entitystruct)
{
	if(isdefined(entitystruct.player.body))
	{
		_setgibbed(entitystruct.player.body, 16, entitystruct.direction, entitystruct.var_c3317960);
	}
}

/*
	Name: playergibleftlegvel
	Namespace: gibserverutils
	Checksum: 0x8C7F1A96
	Offset: 0x1918
	Size: 0x5C
	Parameters: 1
	Flags: Event
*/
event playergibleftlegvel(entitystruct)
{
	if(isdefined(entitystruct.player.body))
	{
		_setgibbed(entitystruct.player.body, 256, entitystruct.direction, entitystruct.var_c3317960);
	}
}

/*
	Name: playergibrightlegvel
	Namespace: gibserverutils
	Checksum: 0xA1B2D675
	Offset: 0x1980
	Size: 0x5C
	Parameters: 1
	Flags: Event
*/
event playergibrightlegvel(entitystruct)
{
	if(isdefined(entitystruct.player.body))
	{
		_setgibbed(entitystruct.player.body, 128, entitystruct.direction, entitystruct.var_c3317960);
	}
}

/*
	Name: playergiblegsvel
	Namespace: gibserverutils
	Checksum: 0x312479B
	Offset: 0x19E8
	Size: 0x94
	Parameters: 1
	Flags: Event
*/
event playergiblegsvel(entitystruct)
{
	if(isdefined(entitystruct.player.body))
	{
		_setgibbed(entitystruct.player.body, 128, entitystruct.direction, entitystruct.var_c3317960);
		_setgibbed(entitystruct.player.body, 256, entitystruct.direction, entitystruct.var_c3317960);
	}
}

/*
	Name: function_b14ffba8
	Namespace: gibserverutils
	Checksum: 0xB0EC6035
	Offset: 0x1A88
	Size: 0x5C
	Parameters: 1
	Flags: Event
*/
event function_b14ffba8(entitystruct)
{
	if(isdefined(entitystruct.player.body))
	{
		_setgibbed(entitystruct.player.body, 8, entitystruct.direction, entitystruct.var_c3317960);
	}
}

/*
	Name: reapplyhiddengibpieces
	Namespace: gibserverutils
	Checksum: 0x12361D75
	Offset: 0x1AF0
	Size: 0x178
	Parameters: 2
	Flags: Linked
*/
function reapplyhiddengibpieces(entity, var_c3317960)
{
	if(!_hasgibdef(entity, var_c3317960))
	{
		return;
	}
	gibpieces = function_3aa023f1(entity, var_c3317960);
	foreach(gib in gibpieces)
	{
		if(!isgibbed(entity, gibflag))
		{
			continue;
		}
		if(!isdefined(gib))
		{
			continue;
		}
		if(isdefined(gib.gibhidetag) && isalive(entity) && entity haspart(gib.gibhidetag))
		{
			if(!is_true(entity.skipdeath))
			{
				entity hidepart(gib.gibhidetag, "", 1);
			}
		}
	}
}

/*
	Name: showhiddengibpieces
	Namespace: gibserverutils
	Checksum: 0xF7C1B7D8
	Offset: 0x1C70
	Size: 0x128
	Parameters: 2
	Flags: Linked
*/
function showhiddengibpieces(entity, var_c3317960)
{
	if(!_hasgibdef(entity, var_c3317960))
	{
		return;
	}
	gibpieces = function_3aa023f1(entity, var_c3317960);
	foreach(gib in gibpieces)
	{
		if(!isdefined(gib))
		{
			continue;
		}
		if(isdefined(gib.gibhidetag) && entity haspart(gib.gibhidetag))
		{
			entity showpart(gib.gibhidetag, "", 1);
		}
	}
}

/*
	Name: togglespawngibs
	Namespace: gibserverutils
	Checksum: 0x29415D55
	Offset: 0x1DA0
	Size: 0x94
	Parameters: 2
	Flags: Linked
*/
function togglespawngibs(entity, shouldspawngibs)
{
	if(!shouldspawngibs)
	{
		entity.gib_state = _getgibbedstate(entity) | 1;
	}
	else
	{
		entity.gib_state = _getgibbedstate(entity) & -2;
	}
	entity clientfield::set("gib_state", entity.gib_state);
}

/*
	Name: function_96bedd91
	Namespace: gibserverutils
	Checksum: 0x49179359
	Offset: 0x1E40
	Size: 0x154
	Parameters: 1
	Flags: Linked
*/
function function_96bedd91(entity)
{
	if([[ level.gib_throttle ]]->wm_ht_posidlestart(entity))
	{
		return;
	}
	var_c3317960 = (entity.gib_state >> 9) & (8 - 1);
	destructserverutils::showdestructedpieces(entity);
	showhiddengibpieces(entity, var_c3317960);
	if(!_getgibbedstate(entity) < 16)
	{
		legmodel = _getgibbedlegmodel(entity);
		entity detach(legmodel);
	}
	entity setmodel(_getgibbedtorsomodel(entity));
	entity attach(_getgibbedlegmodel(entity));
	destructserverutils::reapplydestructedpieces(entity);
	reapplyhiddengibpieces(entity, var_c3317960);
}

/*
	Name: function_de4d9d
	Namespace: gibserverutils
	Checksum: 0xE73A9E05
	Offset: 0x1FA0
	Size: 0x52
	Parameters: 2
	Flags: Linked
*/
function function_de4d9d(weapon, var_fd90b0bb)
{
	if(!isdefined(weapon) || !isdefined(var_fd90b0bb) || !var_fd90b0bb)
	{
		return 0;
	}
	return function_497b2440(weapon, var_fd90b0bb);
}

