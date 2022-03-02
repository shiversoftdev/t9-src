#using script_2d142c6d365a90a3;
#using script_3d0f36632dad12df;
#using script_7ebad89114ecedb1;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace radiation;

/*
	Name: function_47861e64
	Namespace: radiation
	Checksum: 0x8F9BB65F
	Offset: 0xF0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_47861e64()
{
	level notify(1124953623);
}

/*
	Name: function_89f2df9
	Namespace: radiation
	Checksum: 0x286DC2CE
	Offset: 0x110
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"radiation", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: radiation
	Checksum: 0x24B23578
	Offset: 0x158
	Size: 0xD4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!namespace_956bd4dd::function_ab99e60c())
	{
		return;
	}
	clientfield::register("toplayer", "ftdb_inZone", 1, 1, "int", &function_c76638c, 0, 1);
	level.var_96929d7f = [];
	level.var_2200e558 = [];
	level.var_e7fd1b8f = [];
	level.var_d91da973 = 1;
	callback::on_localclient_connect(&function_f45ee99d);
	callback::on_end_game(&on_end_game);
}

/*
	Name: function_f45ee99d
	Namespace: radiation
	Checksum: 0x304B4674
	Offset: 0x238
	Size: 0x5E
	Parameters: 1
	Flags: Linked
*/
function function_f45ee99d(localclientnum)
{
	level.var_96929d7f[localclientnum] = spawnstruct();
	level.var_96929d7f[localclientnum].var_32adf91d = 0;
	level.var_96929d7f[localclientnum].sickness = [];
}

/*
	Name: on_end_game
	Namespace: radiation
	Checksum: 0xB754E2ED
	Offset: 0x2A0
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function on_end_game(localclientnum)
{
	forceambientroom("");
}

/*
	Name: function_c76638c
	Namespace: radiation
	Checksum: 0xD3AB738D
	Offset: 0x2D0
	Size: 0x290
	Parameters: 7
	Flags: Linked, Private
*/
function private function_c76638c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	level.var_2200e558[fieldname] = bwastimejump;
	ambientroom = "";
	foreach(val in level.var_2200e558)
	{
		if(val > 0)
		{
			ambientroom = "wz_radiation";
			break;
		}
	}
	if(function_52a9d718() !== ambientroom)
	{
		forceambientroom(ambientroom);
	}
	if(bwastimejump)
	{
		while(isdefined(self) && !self hasdobj(fieldname))
		{
			waitframe(1);
		}
		if(!isdefined(self))
		{
			return;
		}
		if(squad_spawn::function_21b773d5(fieldname))
		{
			return;
		}
		if(!isarray(level.var_e7fd1b8f[fieldname]))
		{
			level.var_e7fd1b8f[fieldname] = playtagfxset(fieldname, "tagfx9_camfx_gametype_dirtybomb_ash", self);
		}
	}
	else if(isarray(level.var_e7fd1b8f[fieldname]))
	{
		foreach(fx in level.var_e7fd1b8f[fieldname])
		{
			stopfx(fieldname, fx);
		}
		level.var_e7fd1b8f[fieldname] = undefined;
	}
}

