#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace destructible_character;

/*
	Name: function_e747ae00
	Namespace: destructible_character
	Checksum: 0x335E0A5E
	Offset: 0x260
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e747ae00()
{
	level notify(1375637567);
}

#namespace destructserverutils;

/*
	Name: function_89f2df9
	Namespace: destructserverutils
	Checksum: 0x4FE7217E
	Offset: 0x280
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"destructible_character", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: destructserverutils
	Checksum: 0xEC684E9A
	Offset: 0x2C8
	Size: 0x5B0
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("actor", "destructible_character_state", 1, 21, "int");
	destructibles = getscriptbundles("destructiblecharacterdef");
	processedbundles = [];
	foreach(destructible in destructibles)
	{
		destructbundle = spawnstruct();
		destructbundle.piececount = destructible.piececount;
		destructbundle.pieces = [];
		destructbundle.name = destructible.name;
		for(index = 1; index <= destructbundle.piececount; index++)
		{
			piecestruct = spawnstruct();
			piecestruct.name = destructible.(("piece" + index) + "_name");
			piecestruct.gibmodel = destructible.(("piece" + index) + "_gibmodel");
			piecestruct.gibtag = destructible.(("piece" + index) + "_gibtag");
			piecestruct.gibfx = destructible.(("piece" + index) + "_gibfx");
			piecestruct.gibfxtag = destructible.(("piece" + index) + "_gibeffecttag");
			piecestruct.gibdynentfx = destructible.(("piece" + index) + "_gibdynentfx");
			piecestruct.gibsound = destructible.(("piece" + index) + "_gibsound");
			piecestruct.hitlocation = destructible.(("piece" + index) + "_hitlocation");
			piecestruct.hidetag = destructible.(("piece" + index) + "_hidetag");
			piecestruct.detachmodel = destructible.(("piece" + index) + "_detachmodel");
			piecestruct.var_1377a2a4 = destructible.(("piece" + index) + "_detachtag");
			if(isdefined(destructible.(("piece" + index) + "_hittags")))
			{
				piecestruct.var_d8fa3d82 = [];
				foreach(var_5440c126 in destructible.(("piece" + index) + "_hittags"))
				{
					if(!isdefined(piecestruct.var_d8fa3d82))
					{
						piecestruct.var_d8fa3d82 = [];
					}
					else if(!isarray(piecestruct.var_d8fa3d82))
					{
						piecestruct.var_d8fa3d82 = array(piecestruct.var_d8fa3d82);
					}
					piecestruct.var_d8fa3d82[piecestruct.var_d8fa3d82.size] = var_5440c126.var_f16c2276;
				}
			}
			if(isdefined(destructible.(("piece" + index) + "_additionalhitlocations")))
			{
				piecestruct.var_d8fa3d82 = [];
				foreach(var_9c2171bc in destructible.(("piece" + index) + "_additionalhitlocations"))
				{
					if(!isdefined(piecestruct.var_47627399))
					{
						piecestruct.var_47627399 = [];
					}
					else if(!isarray(piecestruct.var_47627399))
					{
						piecestruct.var_47627399 = array(piecestruct.var_47627399);
					}
					piecestruct.var_47627399[piecestruct.var_47627399.size] = var_9c2171bc.hitlocation;
				}
			}
			destructbundle.pieces[destructbundle.pieces.size] = piecestruct;
		}
		processedbundles[destructible.name] = destructbundle;
	}
	level.destructiblecharacterdefs = processedbundles;
}

/*
	Name: _getdestructibledef
	Namespace: destructserverutils
	Checksum: 0xB51CF531
	Offset: 0x880
	Size: 0x20
	Parameters: 1
	Flags: Linked, Private
*/
function private _getdestructibledef(entity)
{
	return level.destructiblecharacterdefs[entity.destructibledef];
}

/*
	Name: function_b9568365
	Namespace: destructserverutils
	Checksum: 0xFDD0B700
	Offset: 0x8A8
	Size: 0x2A
	Parameters: 1
	Flags: Linked
*/
function function_b9568365(entity)
{
	if(isdefined(entity._destruct_state))
	{
		return entity._destruct_state;
	}
	return 0;
}

/*
	Name: function_f865501b
	Namespace: destructserverutils
	Checksum: 0xD5182CB6
	Offset: 0x8E0
	Size: 0x5C
	Parameters: 3
	Flags: None
*/
function function_f865501b(entity, destruct_state, spawn_gibs)
{
	entity._destruct_state = destruct_state;
	togglespawngibs(entity, spawn_gibs);
	reapplydestructedpieces(entity);
}

/*
	Name: _setdestructed
	Namespace: destructserverutils
	Checksum: 0xE88375FA
	Offset: 0x948
	Size: 0x64
	Parameters: 2
	Flags: Linked, Private
*/
function private _setdestructed(entity, destructflag)
{
	entity._destruct_state = function_b9568365(entity) | destructflag;
	entity clientfield::set("destructible_character_state", entity._destruct_state);
}

/*
	Name: copydestructstate
	Namespace: destructserverutils
	Checksum: 0x907AB7F0
	Offset: 0x9B8
	Size: 0x64
	Parameters: 2
	Flags: Linked
*/
function copydestructstate(originalentity, newentity)
{
	newentity._destruct_state = function_b9568365(originalentity);
	togglespawngibs(newentity, 0);
	reapplydestructedpieces(newentity);
}

/*
	Name: function_8475c53a
	Namespace: destructserverutils
	Checksum: 0x9F073243
	Offset: 0xA28
	Size: 0xD4
	Parameters: 2
	Flags: Linked
*/
function function_8475c53a(entity, piecename)
{
	if(isdefined(entity.destructibledef))
	{
		destructbundle = _getdestructibledef(entity);
		for(index = 1; index <= destructbundle.pieces.size; index++)
		{
			piece = destructbundle.pieces[index - 1];
			if(isdefined(piece.name) && piece.name == piecename)
			{
				destructpiece(entity, index);
			}
		}
	}
}

/*
	Name: destructhitlocpieces
	Namespace: destructserverutils
	Checksum: 0x2A55C407
	Offset: 0xB08
	Size: 0x104
	Parameters: 2
	Flags: Linked
*/
function destructhitlocpieces(entity, hitloc)
{
	if(isdefined(entity.destructibledef))
	{
		destructbundle = _getdestructibledef(entity);
		for(index = 1; index <= destructbundle.pieces.size; index++)
		{
			piece = destructbundle.pieces[index - 1];
			if(isdefined(piece.hitlocation) && piece.hitlocation === hitloc || (isdefined(piece.var_47627399) && isinarray(piece.var_47627399, hitloc)))
			{
				destructpiece(entity, index);
			}
		}
	}
}

/*
	Name: function_629a8d54
	Namespace: destructserverutils
	Checksum: 0x81D88BEF
	Offset: 0xC18
	Size: 0xEC
	Parameters: 2
	Flags: Linked
*/
function function_629a8d54(entity, var_f16c2276)
{
	if(isdefined(var_f16c2276) && isdefined(entity.destructibledef))
	{
		destructbundle = _getdestructibledef(entity);
		for(index = 1; index <= destructbundle.pieces.size; index++)
		{
			piece = destructbundle.pieces[index - 1];
			if(isdefined(piece.var_d8fa3d82) && isinarray(piece.var_d8fa3d82, var_f16c2276))
			{
				destructpiece(entity, index);
			}
		}
	}
}

/*
	Name: destructleftarmpieces
	Namespace: destructserverutils
	Checksum: 0xF2CA70B0
	Offset: 0xD10
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function destructleftarmpieces(entity)
{
	destructhitlocpieces(entity, "left_arm_upper");
	destructhitlocpieces(entity, "left_arm_lower");
	destructhitlocpieces(entity, "left_hand");
}

/*
	Name: destructleftlegpieces
	Namespace: destructserverutils
	Checksum: 0xFBCB2E18
	Offset: 0xD88
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function destructleftlegpieces(entity)
{
	destructhitlocpieces(entity, "left_leg_upper");
	destructhitlocpieces(entity, "left_leg_lower");
	destructhitlocpieces(entity, "left_foot");
}

/*
	Name: destructpiece
	Namespace: destructserverutils
	Checksum: 0x4B8928F9
	Offset: 0xE00
	Size: 0x1AC
	Parameters: 2
	Flags: Linked
*/
function destructpiece(entity, piecenumber)
{
	/#
		/#
			assert(1 <= piecenumber && piecenumber <= 20);
		#/
	#/
	if(isdestructed(entity, piecenumber))
	{
		return;
	}
	_setdestructed(entity, 1 << piecenumber);
	if(!isdefined(entity.destructibledef))
	{
		return;
	}
	destructbundle = _getdestructibledef(entity);
	piece = destructbundle.pieces[piecenumber - 1];
	if(isdefined(piece.hidetag) && entity haspart(piece.hidetag))
	{
		entity hidepart(piece.hidetag);
	}
	if(isdefined(piece.detachmodel) && entity isattached(piece.detachmodel))
	{
		var_1377a2a4 = "";
		if(isdefined(piece.var_1377a2a4))
		{
			var_1377a2a4 = piece.var_1377a2a4;
		}
		entity detach(piece.detachmodel, var_1377a2a4);
	}
}

/*
	Name: destructnumberrandompieces
	Namespace: destructserverutils
	Checksum: 0x24B2C0E4
	Offset: 0xFB8
	Size: 0x15C
	Parameters: 2
	Flags: None
*/
function destructnumberrandompieces(entity, num_pieces_to_destruct)
{
	if(!isdefined(num_pieces_to_destruct))
	{
		num_pieces_to_destruct = 0;
	}
	destructible_pieces_list = [];
	destructablepieces = getpiececount(entity);
	if(num_pieces_to_destruct == 0)
	{
		num_pieces_to_destruct = destructablepieces;
	}
	for(i = 0; i < destructablepieces; i++)
	{
		destructible_pieces_list[i] = i + 1;
	}
	destructible_pieces_list = array::randomize(destructible_pieces_list);
	foreach(piece in destructible_pieces_list)
	{
		if(!isdestructed(entity, piece))
		{
			destructpiece(entity, piece);
			num_pieces_to_destruct--;
			if(num_pieces_to_destruct == 0)
			{
				break;
			}
		}
	}
}

/*
	Name: destructrandompieces
	Namespace: destructserverutils
	Checksum: 0x9F33B92
	Offset: 0x1120
	Size: 0x7C
	Parameters: 1
	Flags: None
*/
function destructrandompieces(entity)
{
	destructpieces = getpiececount(entity);
	for(index = 0; index < destructpieces; index++)
	{
		if(math::cointoss())
		{
			destructpiece(entity, index + 1);
		}
	}
}

/*
	Name: destructrightarmpieces
	Namespace: destructserverutils
	Checksum: 0xA298E844
	Offset: 0x11A8
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function destructrightarmpieces(entity)
{
	destructhitlocpieces(entity, "right_arm_upper");
	destructhitlocpieces(entity, "right_arm_lower");
	destructhitlocpieces(entity, "right_hand");
}

/*
	Name: destructrightlegpieces
	Namespace: destructserverutils
	Checksum: 0x329A8605
	Offset: 0x1220
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function destructrightlegpieces(entity)
{
	destructhitlocpieces(entity, "right_leg_upper");
	destructhitlocpieces(entity, "right_leg_lower");
	destructhitlocpieces(entity, "right_foot");
}

/*
	Name: getpiececount
	Namespace: destructserverutils
	Checksum: 0xD8CB6035
	Offset: 0x1298
	Size: 0x52
	Parameters: 1
	Flags: Linked
*/
function getpiececount(entity)
{
	if(isdefined(entity.destructibledef))
	{
		destructbundle = _getdestructibledef(entity);
		if(isdefined(destructbundle))
		{
			return destructbundle.piececount;
		}
	}
	return 0;
}

/*
	Name: handledamage
	Namespace: destructserverutils
	Checksum: 0x2DE127E8
	Offset: 0x12F8
	Size: 0x138
	Parameters: 13
	Flags: Linked
*/
function handledamage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, var_a9e3f040, modelindex)
{
	entity = self;
	if(is_true(entity.skipdeath))
	{
		return psoffsettime;
	}
	togglespawngibs(entity, 1);
	destructhitlocpieces(entity, var_a9e3f040);
	if(isdefined(modelindex))
	{
		bonename = modelindex;
		if(!isstring(modelindex))
		{
			bonename = getpartname(entity, modelindex);
		}
		if(isdefined(bonename))
		{
			function_629a8d54(entity, bonename);
		}
	}
	return psoffsettime;
}

/*
	Name: function_9885f550
	Namespace: destructserverutils
	Checksum: 0x51749ED2
	Offset: 0x1438
	Size: 0xB4
	Parameters: 3
	Flags: None
*/
function function_9885f550(entity, hitloc, var_a9e3f040)
{
	togglespawngibs(entity, 1);
	destructhitlocpieces(entity, hitloc);
	if(isdefined(var_a9e3f040))
	{
		bonename = var_a9e3f040;
		if(!isstring(var_a9e3f040))
		{
			bonename = getpartname(entity, var_a9e3f040);
		}
		if(isdefined(bonename))
		{
			function_629a8d54(entity, bonename);
		}
	}
}

/*
	Name: isdestructed
	Namespace: destructserverutils
	Checksum: 0x4463E752
	Offset: 0x14F8
	Size: 0x6E
	Parameters: 2
	Flags: Linked
*/
function isdestructed(entity, piecenumber)
{
	/#
		/#
			assert(1 <= piecenumber && piecenumber <= 20);
		#/
	#/
	return function_b9568365(entity) & (1 << piecenumber);
}

/*
	Name: reapplydestructedpieces
	Namespace: destructserverutils
	Checksum: 0xE9DF59B2
	Offset: 0x1570
	Size: 0x17C
	Parameters: 1
	Flags: Linked
*/
function reapplydestructedpieces(entity)
{
	if(!isdefined(entity.destructibledef))
	{
		return;
	}
	destructbundle = _getdestructibledef(entity);
	for(index = 1; index <= destructbundle.pieces.size; index++)
	{
		if(!isdestructed(entity, index))
		{
			continue;
		}
		piece = destructbundle.pieces[index - 1];
		if(isdefined(piece.hidetag) && entity haspart(piece.hidetag))
		{
			entity hidepart(piece.hidetag);
		}
		if(isdefined(piece.detachmodel))
		{
			var_1377a2a4 = "";
			if(isdefined(piece.var_1377a2a4))
			{
				var_1377a2a4 = piece.var_1377a2a4;
			}
			if(entity isattached(piece.detachmodel, var_1377a2a4))
			{
				entity detach(piece.detachmodel, var_1377a2a4);
			}
		}
	}
}

/*
	Name: showdestructedpieces
	Namespace: destructserverutils
	Checksum: 0x2990C8DB
	Offset: 0x16F8
	Size: 0xDC
	Parameters: 1
	Flags: Linked
*/
function showdestructedpieces(entity)
{
	if(!isdefined(entity.destructibledef))
	{
		return;
	}
	destructbundle = _getdestructibledef(entity);
	for(index = 1; index <= destructbundle.pieces.size; index++)
	{
		piece = destructbundle.pieces[index - 1];
		if(isdefined(piece.hidetag) && entity haspart(piece.hidetag))
		{
			entity showpart(piece.hidetag);
		}
	}
}

/*
	Name: togglespawngibs
	Namespace: destructserverutils
	Checksum: 0x35846E8
	Offset: 0x17E0
	Size: 0x94
	Parameters: 2
	Flags: Linked
*/
function togglespawngibs(entity, shouldspawngibs)
{
	if(shouldspawngibs)
	{
		entity._destruct_state = function_b9568365(entity) | 1;
	}
	else
	{
		entity._destruct_state = function_b9568365(entity) & -2;
	}
	entity clientfield::set("destructible_character_state", entity._destruct_state);
}

