#using scripts\core_common\ai_shared.csc;

#namespace archetype_notetracks;

/*
	Name: function_59fffdca
	Namespace: archetype_notetracks
	Checksum: 0x7B3C9473
	Offset: 0xE0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_59fffdca()
{
	level notify(703498417);
}

#namespace notetracks;

/*
	Name: main
	Namespace: notetracks
	Checksum: 0xEFC74DD9
	Offset: 0x100
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
	Checksum: 0x6DD722C8
	Offset: 0x178
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
	Checksum: 0x200B123F
	Offset: 0x208
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
	Checksum: 0x4BB412D1
	Offset: 0x258
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

