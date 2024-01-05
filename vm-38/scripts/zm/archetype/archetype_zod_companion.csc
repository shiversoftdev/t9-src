#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using script_14d2d89964cae0b1;
#using script_ac6a30f1991e105;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\ai_shared.csc;

#namespace archetype_zod_companion;

/*
	Name: function_ec19b7e4
	Namespace: archetype_zod_companion
	Checksum: 0xC9F3BEFF
	Offset: 0x110
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ec19b7e4()
{
	level notify(386202393);
}

#namespace zodcompanionclientutils;

/*
	Name: __init__system__
	Namespace: zodcompanionclientutils
	Checksum: 0x4E3E21AE
	Offset: 0x130
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_zod_companion", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zodcompanionclientutils
	Checksum: 0x48197AE
	Offset: 0x178
	Size: 0x124
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	clientfield::register("allplayers", "" + #"being_robot_revived", 24000, 1, "int", &play_revival_fx, 0, 0);
	ai::add_archetype_spawn_function(#"zod_companion", &zodcompanionspawnsetup);
	level._effect[#"fx_dest_robot_head_sparks"] = "destruct/fx_dest_robot_head_sparks";
	level._effect[#"fx_dest_robot_body_sparks"] = "destruct/fx_dest_robot_body_sparks";
	level._effect[#"companion_revive_effect"] = #"hash_3adc423957988632";
	ai::add_archetype_spawn_function(#"robot", &zodcompanionspawnsetup);
}

/*
	Name: zodcompanionspawnsetup
	Namespace: zodcompanionclientutils
	Checksum: 0x1979D57B
	Offset: 0x2A8
	Size: 0x12C
	Parameters: 1
	Flags: Private
*/
function private zodcompanionspawnsetup(localclientnum)
{
	entity = self;
	gibclientutils::addgibcallback(localclientnum, entity, 8, &zodcompanionheadgibfx);
	gibclientutils::addgibcallback(localclientnum, entity, 8, &_gibcallback);
	gibclientutils::addgibcallback(localclientnum, entity, 16, &_gibcallback);
	gibclientutils::addgibcallback(localclientnum, entity, 32, &_gibcallback);
	gibclientutils::addgibcallback(localclientnum, entity, 128, &_gibcallback);
	gibclientutils::addgibcallback(localclientnum, entity, 256, &_gibcallback);
	fxclientutils::playfxbundle(localclientnum, entity, entity.fxdef);
}

/*
	Name: zodcompanionheadgibfx
	Namespace: zodcompanionclientutils
	Checksum: 0xDC58F1C
	Offset: 0x3E0
	Size: 0x104
	Parameters: 3
	Flags: None
*/
function zodcompanionheadgibfx(localclientnum, entity, gibflag)
{
	if(!isdefined(gibflag) || !gibflag isai() || !isalive(gibflag))
	{
		return;
	}
	if(isdefined(gibflag.mindcontrolheadfx))
	{
		stopfx(entity, gibflag.mindcontrolheadfx);
		gibflag.mindcontrolheadfx = undefined;
	}
	gibflag.headgibfx = util::playfxontag(entity, level._effect[#"fx_dest_robot_head_sparks"], gibflag, "j_neck");
	playsound(0, #"prj_bullet_impact_robot_headshot", gibflag.origin);
}

/*
	Name: zodcompaniondamagedfx
	Namespace: zodcompanionclientutils
	Checksum: 0x8DBC63DB
	Offset: 0x4F0
	Size: 0x9A
	Parameters: 2
	Flags: None
*/
function zodcompaniondamagedfx(localclientnum, entity)
{
	if(!isdefined(entity) || !entity isai() || !isalive(entity))
	{
		return;
	}
	entity.damagedfx = util::playfxontag(localclientnum, level._effect[#"fx_dest_robot_body_sparks"], entity, "j_spine4");
}

/*
	Name: zodcompanionclearfx
	Namespace: zodcompanionclientutils
	Checksum: 0xE662C01E
	Offset: 0x598
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function zodcompanionclearfx(localclientnum, entity)
{
	if(!isdefined(entity) || !entity isai())
	{
		return;
	}
}

/*
	Name: _gibcallback
	Namespace: zodcompanionclientutils
	Checksum: 0x6022B973
	Offset: 0x5E0
	Size: 0xBA
	Parameters: 3
	Flags: Private
*/
function private _gibcallback(localclientnum, entity, gibflag)
{
	if(!isdefined(entity) || !entity isai())
	{
		return;
	}
	switch(gibflag)
	{
		case 8:
		{
			break;
		}
		case 16:
		{
			break;
		}
		case 32:
		{
			break;
		}
		case 128:
		{
			break;
		}
		case 256:
		{
			break;
		}
	}
}

/*
	Name: play_revival_fx
	Namespace: zodcompanionclientutils
	Checksum: 0x81820F4C
	Offset: 0x6A8
	Size: 0xF2
	Parameters: 7
	Flags: None
*/
function play_revival_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(isdefined(self.robot_revival_fx) && fieldname == 1 && bwastimejump == 0)
	{
		stopfx(binitialsnap, self.robot_revival_fx);
	}
	if(bwastimejump === 1)
	{
		self playsound(0, #"evt_civil_protector_revive_plr");
		self.robot_revival_fx = util::playfxontag(binitialsnap, level._effect[#"companion_revive_effect"], self, "j_spine4");
	}
}

