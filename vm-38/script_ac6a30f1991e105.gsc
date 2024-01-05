#using script_14d2d89964cae0b1;
#using script_210a5cc36b23f9c9;
#using scripts\core_common\struct.csc;

#namespace fx_character;

/*
	Name: function_cef5425d
	Namespace: fx_character
	Checksum: 0xBBC78BD8
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_cef5425d()
{
	level notify(1532537339);
}

/*
	Name: main
	Namespace: fx_character
	Checksum: 0x95B49810
	Offset: 0xF0
	Size: 0x240
	Parameters: 0
	Flags: AutoExec
*/
function autoexec main()
{
	fxbundles = getscriptbundles("fxcharacterdef");
	processedfxbundles = [];
	foreach(fxbundle in fxbundles)
	{
		processedfxbundle = spawnstruct();
		processedfxbundle.effectcount = fxbundle.effectcount;
		processedfxbundle.fx = [];
		processedfxbundle.name = fxbundle.name;
		for(index = 1; index <= fxbundle.effectcount; index++)
		{
			fx = fxbundle.(("effect" + index) + "_fx");
			if(isdefined(fx))
			{
				fxstruct = spawnstruct();
				fxstruct.attachtag = fxbundle.(("effect" + index) + "_attachtag");
				fxstruct.fx = fxbundle.(("effect" + index) + "_fx");
				fxstruct.stopongib = fxclientutils::_gibpartnametogibflag(fxbundle.(("effect" + index) + "_stopongib"));
				fxstruct.stoponpiecedestroyed = fxbundle.(("effect" + index) + "_stoponpiecedestroyed");
				processedfxbundle.fx[processedfxbundle.fx.size] = fxstruct;
			}
		}
		processedfxbundles[fxbundle.name] = processedfxbundle;
	}
	level.fxcharacterdefs = processedfxbundles;
}

#namespace fxclientutils;

/*
	Name: _getfxbundle
	Namespace: fxclientutils
	Checksum: 0xE5413F88
	Offset: 0x338
	Size: 0x1C
	Parameters: 1
	Flags: Linked, Private
*/
function private _getfxbundle(name)
{
	return level.fxcharacterdefs[name];
}

/*
	Name: _configentity
	Namespace: fxclientutils
	Checksum: 0x7B167711
	Offset: 0x360
	Size: 0x13C
	Parameters: 2
	Flags: Linked, Private
*/
function private _configentity(localclientnum, entity)
{
	if(!isdefined(entity._fxcharacter))
	{
		entity._fxcharacter = [];
		handledgibs = array(8, 16, 32, 128, 256);
		foreach(gibflag in handledgibs)
		{
			gibclientutils::addgibcallback(localclientnum, entity, gibflag, &_gibhandler);
		}
		for(index = 1; index <= 20; index++)
		{
			destructclientutils::adddestructpiececallback(localclientnum, entity, index, &_destructhandler);
		}
	}
}

/*
	Name: _destructhandler
	Namespace: fxclientutils
	Checksum: 0x3ABD593
	Offset: 0x4A8
	Size: 0x132
	Parameters: 3
	Flags: Linked, Private
*/
function private _destructhandler(localclientnum, entity, piecenumber)
{
	if(!isdefined(entity._fxcharacter))
	{
		return;
	}
	foreach(fxbundleinst in entity._fxcharacter)
	{
		fxbundle = _getfxbundle(fxbundlename);
		for(index = 0; index < fxbundle.fx.size; index++)
		{
			if(isdefined(fxbundleinst[index]) && fxbundle.fx[index].stoponpiecedestroyed === piecenumber)
			{
				stopfx(localclientnum, fxbundleinst[index]);
				fxbundleinst[index] = undefined;
			}
		}
	}
}

/*
	Name: _gibhandler
	Namespace: fxclientutils
	Checksum: 0xA0BF4ED0
	Offset: 0x5E8
	Size: 0x132
	Parameters: 3
	Flags: Linked, Private
*/
function private _gibhandler(localclientnum, entity, gibflag)
{
	if(!isdefined(entity._fxcharacter))
	{
		return;
	}
	foreach(fxbundleinst in entity._fxcharacter)
	{
		fxbundle = _getfxbundle(fxbundlename);
		for(index = 0; index < fxbundle.fx.size; index++)
		{
			if(isdefined(fxbundleinst[index]) && fxbundle.fx[index].stopongib === gibflag)
			{
				stopfx(localclientnum, fxbundleinst[index]);
				fxbundleinst[index] = undefined;
			}
		}
	}
}

/*
	Name: _gibpartnametogibflag
	Namespace: fxclientutils
	Checksum: 0x5BF1E391
	Offset: 0x728
	Size: 0x92
	Parameters: 1
	Flags: Linked, Private
*/
function private _gibpartnametogibflag(gibpartname)
{
	if(isdefined(gibpartname))
	{
		switch(gibpartname)
		{
			case "head":
			{
				return 8;
			}
			case "right arm":
			{
				return 16;
			}
			case "left arm":
			{
				return 32;
			}
			case "right leg":
			{
				return 128;
			}
			case "left leg":
			{
				return 256;
			}
		}
	}
}

/*
	Name: _isgibbed
	Namespace: fxclientutils
	Checksum: 0xDA79E942
	Offset: 0x7C8
	Size: 0x42
	Parameters: 3
	Flags: Linked, Private
*/
function private _isgibbed(localclientnum, entity, stopongibflag)
{
	if(!isdefined(stopongibflag))
	{
		return 0;
	}
	return gibclientutils::isgibbed(localclientnum, entity, stopongibflag);
}

/*
	Name: _ispiecedestructed
	Namespace: fxclientutils
	Checksum: 0xEB78C8BC
	Offset: 0x818
	Size: 0x42
	Parameters: 3
	Flags: Linked, Private
*/
function private _ispiecedestructed(localclientnum, entity, stoponpiecedestroyed)
{
	if(!isdefined(stoponpiecedestroyed))
	{
		return 0;
	}
	return destructclientutils::ispiecedestructed(localclientnum, entity, stoponpiecedestroyed);
}

/*
	Name: _shouldplayfx
	Namespace: fxclientutils
	Checksum: 0x3EDC901F
	Offset: 0x868
	Size: 0x6E
	Parameters: 3
	Flags: Linked, Private
*/
function private _shouldplayfx(localclientnum, entity, fxstruct)
{
	if(_isgibbed(localclientnum, entity, fxstruct.stopongib))
	{
		return false;
	}
	if(_ispiecedestructed(localclientnum, entity, fxstruct.stoponpiecedestroyed))
	{
		return false;
	}
	return true;
}

/*
	Name: playfxbundle
	Namespace: fxclientutils
	Checksum: 0xB618FD96
	Offset: 0x8E0
	Size: 0x144
	Parameters: 3
	Flags: Linked
*/
function playfxbundle(localclientnum, entity, fxscriptbundle)
{
	if(!isdefined(entity) || !isdefined(fxscriptbundle))
	{
		return;
	}
	_configentity(localclientnum, entity);
	fxbundle = _getfxbundle(fxscriptbundle);
	if(isdefined(entity._fxcharacter[fxbundle.name]))
	{
		return;
	}
	if(isdefined(fxbundle))
	{
		playingfx = [];
		for(index = 0; index < fxbundle.fx.size; index++)
		{
			fxstruct = fxbundle.fx[index];
			if(_shouldplayfx(localclientnum, entity, fxstruct))
			{
				playingfx[index] = gibclientutils::_playgibfx(localclientnum, entity, fxstruct.fx, fxstruct.attachtag);
			}
		}
		if(playingfx.size > 0)
		{
			entity._fxcharacter[fxbundle.name] = playingfx;
		}
	}
}

/*
	Name: stopallfxbundles
	Namespace: fxclientutils
	Checksum: 0x88D0EBB9
	Offset: 0xA30
	Size: 0x130
	Parameters: 2
	Flags: None
*/
function stopallfxbundles(localclientnum, entity)
{
	_configentity(localclientnum, entity);
	fxbundlenames = [];
	foreach(fxbundle in entity._fxcharacter)
	{
		fxbundlenames[fxbundlenames.size] = fxbundlename;
	}
	foreach(fxbundlename in fxbundlenames)
	{
		stopfxbundle(localclientnum, entity, fxbundlename);
	}
}

/*
	Name: stopfxbundle
	Namespace: fxclientutils
	Checksum: 0x8B51053
	Offset: 0xB68
	Size: 0x124
	Parameters: 3
	Flags: Linked
*/
function stopfxbundle(localclientnum, entity, fxscriptbundle)
{
	if(!isdefined(fxscriptbundle))
	{
		return;
	}
	_configentity(localclientnum, entity);
	fxbundle = _getfxbundle(fxscriptbundle);
	if(isdefined(entity._fxcharacter[fxbundle.name]))
	{
		foreach(fx in entity._fxcharacter[fxbundle.name])
		{
			if(isdefined(fx))
			{
				stopfx(localclientnum, fx);
			}
		}
		entity._fxcharacter[fxbundle.name] = undefined;
	}
}

/*
	Name: function_ae92446
	Namespace: fxclientutils
	Checksum: 0x9EA0C008
	Offset: 0xC98
	Size: 0x124
	Parameters: 3
	Flags: Linked
*/
function function_ae92446(localclientnum, entity, fxscriptbundle)
{
	if(!isdefined(fxscriptbundle))
	{
		return;
	}
	_configentity(localclientnum, entity);
	fxbundle = _getfxbundle(fxscriptbundle);
	if(isdefined(entity._fxcharacter[fxbundle.name]))
	{
		foreach(fx in entity._fxcharacter[fxbundle.name])
		{
			if(isdefined(fx))
			{
				killfx(localclientnum, fx);
			}
		}
		entity._fxcharacter[fxbundle.name] = undefined;
	}
}

