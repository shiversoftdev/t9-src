#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using script_14d2d89964cae0b1;
#using scripts\core_common\struct.csc;

#namespace destructclientutils;

/*
	Name: __init__system__
	Namespace: destructclientutils
	Checksum: 0x7F52A9AA
	Offset: 0x1B8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"destructible_character", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: destructclientutils
	Checksum: 0x3360A572
	Offset: 0x200
	Size: 0x610
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("actor", "destructible_character_state", 1, 21, "int", &_destructhandler, 0, 0);
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
			piecestruct.gibmodel = destructible.(("piece" + index) + "_gibmodel");
			piecestruct.gibtag = destructible.(("piece" + index) + "_gibtag");
			if(isdefined(destructible.(("piece" + index) + "_gibdirX")) || isdefined(destructible.(("piece" + index) + "_gibdirY")) || isdefined(destructible.(("piece" + index) + "_gibdirZ")))
			{
				loc_00000488:
				loc_000004D0:
				piecestruct.gibdir = ((isdefined(destructible.(("piece" + index) + "_gibdirX")) ? destructible.(("piece" + index) + "_gibdirX") : 0), (isdefined(destructible.(("piece" + index) + "_gibdirY")) ? destructible.(("piece" + index) + "_gibdirY") : 0), (isdefined(destructible.(("piece" + index) + "_gibdirZ")) ? destructible.(("piece" + index) + "_gibdirZ") : 0));
			}
			piecestruct.gibdirscale = destructible.(("piece" + index) + "_gibdirscale");
			piecestruct.gibdynentfx = destructible.(("piece" + index) + "_gibdynentfx");
			piecestruct.gibfx = destructible.(("piece" + index) + "_gibfx");
			piecestruct.gibfxtag = destructible.(("piece" + index) + "_gibeffecttag");
			piecestruct.var_ed372a00 = destructible.(("piece" + index) + "_gibfx2");
			piecestruct.var_e230b617 = destructible.(("piece" + index) + "_gibeffecttag2");
			piecestruct.gibsound = destructible.(("piece" + index) + "_gibsound");
			piecestruct.hitlocation = destructible.(("piece" + index) + "_hitlocation");
			piecestruct.hidetag = destructible.(("piece" + index) + "_hidetag");
			piecestruct.detachmodel = destructible.(("piece" + index) + "_detachmodel");
			if(isdefined(destructible.(("piece" + index) + "_hittags")))
			{
				piecestruct.hittags = [];
				foreach(var_5440c126 in destructible.(("piece" + index) + "_hittags"))
				{
					if(!isdefined(piecestruct.hittags))
					{
						piecestruct.hittags = [];
					}
					else if(!isarray(piecestruct.hittags))
					{
						piecestruct.hittags = array(piecestruct.hittags);
					}
					piecestruct.hittags[piecestruct.hittags.size] = var_5440c126.hittag;
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
	Namespace: destructclientutils
	Checksum: 0x246F7258
	Offset: 0x818
	Size: 0x20
	Parameters: 1
	Flags: Linked, Private
*/
function private _getdestructibledef(entity)
{
	return level.destructiblecharacterdefs[entity.destructibledef];
}

/*
	Name: _destructhandler
	Namespace: destructclientutils
	Checksum: 0x12B60269
	Offset: 0x840
	Size: 0x136
	Parameters: 7
	Flags: Linked, Private
*/
function private _destructhandler(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump)
{
	if(!util::is_mature() || util::is_gib_restricted_build())
	{
		return;
	}
	entity = self;
	destructflags = binitialsnap ^ fieldname;
	shouldspawngibs = fieldname & 1;
	if(wasdemojump)
	{
		destructflags = 0 ^ fieldname;
	}
	if(!isdefined(entity.destructibledef))
	{
		return;
	}
	currentdestructflag = 2;
	piecenumber = 1;
	while(destructflags >= currentdestructflag)
	{
		if(destructflags & currentdestructflag)
		{
			_destructpiece(bnewent, entity, piecenumber, shouldspawngibs);
		}
		currentdestructflag = currentdestructflag << 1;
		piecenumber++;
	}
	entity._destruct_state = fieldname;
}

/*
	Name: _destructpiece
	Namespace: destructclientutils
	Checksum: 0x65B43BF
	Offset: 0x980
	Size: 0x1B4
	Parameters: 4
	Flags: Linked, Private
*/
function private _destructpiece(localclientnum, entity, piecenumber, shouldspawngibs)
{
	if(!isdefined(entity.destructibledef))
	{
		return;
	}
	destructbundle = _getdestructibledef(entity);
	piece = destructbundle.pieces[piecenumber - 1];
	if(isdefined(piece))
	{
		if(shouldspawngibs)
		{
			gibclientutils::_playgibfx(localclientnum, entity, piece.gibfx, piece.gibfxtag);
			gibclientutils::_playgibfx(localclientnum, entity, piece.var_ed372a00, piece.var_e230b617);
			entity thread gibclientutils::_gibpiece(localclientnum, entity, piece.gibmodel, piece.gibtag, piece.gibdynentfx, piece.gibdir, piece.gibdirscale, (1 | 2) | 4);
			gibclientutils::_playgibsound(localclientnum, entity, piece.gibsound);
		}
		else if(isdefined(piece.gibfx) && function_9229eb67(piece.gibfx))
		{
			gibclientutils::_playgibfx(localclientnum, entity, piece.gibfx, piece.gibfxtag);
		}
		_handledestructcallbacks(localclientnum, entity, piecenumber);
	}
}

/*
	Name: _getdestructstate
	Namespace: destructclientutils
	Checksum: 0x4ADE3587
	Offset: 0xB40
	Size: 0x32
	Parameters: 2
	Flags: Linked, Private
*/
function private _getdestructstate(localclientnum, entity)
{
	if(isdefined(entity._destruct_state))
	{
		return entity._destruct_state;
	}
	return 0;
}

/*
	Name: _handledestructcallbacks
	Namespace: destructclientutils
	Checksum: 0x8F3BB94A
	Offset: 0xB80
	Size: 0xDC
	Parameters: 3
	Flags: Linked, Private
*/
function private _handledestructcallbacks(localclientnum, entity, piecenumber)
{
	if(isdefined(entity._destructcallbacks) && isdefined(entity._destructcallbacks[piecenumber]))
	{
		foreach(callback in entity._destructcallbacks[piecenumber])
		{
			if(isfunctionptr(callback))
			{
				[[callback]](localclientnum, entity, piecenumber);
			}
		}
	}
}

/*
	Name: adddestructpiececallback
	Namespace: destructclientutils
	Checksum: 0x61A0C8E1
	Offset: 0xC68
	Size: 0xC0
	Parameters: 4
	Flags: Linked
*/
function adddestructpiececallback(localclientnum, entity, piecenumber, callbackfunction)
{
	/#
		assert(isfunctionptr(callbackfunction));
	#/
	if(!isdefined(entity._destructcallbacks))
	{
		entity._destructcallbacks = [];
	}
	if(!isdefined(entity._destructcallbacks[piecenumber]))
	{
		entity._destructcallbacks[piecenumber] = [];
	}
	destructcallbacks = entity._destructcallbacks[piecenumber];
	destructcallbacks[destructcallbacks.size] = callbackfunction;
	entity._destructcallbacks[piecenumber] = destructcallbacks;
}

/*
	Name: ispiecedestructed
	Namespace: destructclientutils
	Checksum: 0x655005A8
	Offset: 0xD30
	Size: 0x3E
	Parameters: 3
	Flags: Linked
*/
function ispiecedestructed(localclientnum, entity, piecenumber)
{
	return _getdestructstate(localclientnum, entity) & (1 << piecenumber);
}

