#using scripts\core_common\ai_shared.csc;

#namespace notetracks;

/*
	Name: main
	Namespace: notetracks
	Checksum: 0x6F0B6219
	Offset: 0xE0
	Size: 0x6C
	Parameters: 0
	Flags: AutoExec
*/
function autoexec main()
{
	if(sessionmodeiszombiesgame() && getdvarint(#"splitscreen_playercount", 0) > 2)
	{
		return;
	}
	ai::add_ai_spawn_function(&initializenotetrackhandlers);
}

/*
	Name: initializenotetrackhandlers
	Namespace: notetracks
	Checksum: 0xC78CDBBE
	Offset: 0x158
	Size: 0x84
	Parameters: 1
	Flags: Linked, Private
*/
function private initializenotetrackhandlers(localclientnum)
{
	addsurfacenotetrackfxhandler(localclientnum, "jumping", "surfacefxtable_jumping");
	addsurfacenotetrackfxhandler(localclientnum, "landing", "surfacefxtable_landing");
	addsurfacenotetrackfxhandler(localclientnum, "vtol_landing", "surfacefxtable_vtollanding");
}

/*
	Name: addsurfacenotetrackfxhandler
	Namespace: notetracks
	Checksum: 0xA4F1A18
	Offset: 0x1E8
	Size: 0x44
	Parameters: 3
	Flags: Linked, Private
*/
function private addsurfacenotetrackfxhandler(localclientnum, notetrack, surfacetable)
{
	entity = self;
	entity thread handlesurfacenotetrackfx(localclientnum, notetrack, surfacetable);
}

/*
	Name: handlesurfacenotetrackfx
	Namespace: notetracks
	Checksum: 0xCEE9044B
	Offset: 0x238
	Size: 0xA0
	Parameters: 3
	Flags: Linked, Private
*/
function private handlesurfacenotetrackfx(localclientnum, notetrack, surfacetable)
{
	entity = self;
	entity endon(#"death");
	while(true)
	{
		entity waittill(notetrack);
		fxname = entity getaifxname(localclientnum, surfacetable);
		if(isdefined(fxname))
		{
			playfx(localclientnum, fxname, entity.origin);
		}
	}
}

