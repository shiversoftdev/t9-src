#using scripts\core_common\system_shared.csc;
#using script_3d0f36632dad12df;
#using scripts\core_common\postfx_shared.csc;
#using script_13da4e6b98ca81a1;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace player_shared;

/*
	Name: function_ebc560f9
	Namespace: player_shared
	Checksum: 0x7871B6AF
	Offset: 0x128
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ebc560f9()
{
	level notify(570703208);
}

#namespace player;

/*
	Name: __init__system__
	Namespace: player
	Checksum: 0xCA2C6911
	Offset: 0x148
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"player", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: player
	Checksum: 0xB51DD468
	Offset: 0x190
	Size: 0x16C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("world", "gameplay_started", 1, 1, "int", &gameplay_started_callback, 0, 1);
	clientfield::register("toplayer", "gameplay_allows_deploy", 1, 1, "int", undefined, 0, 0);
	clientfield::register("toplayer", "player_dof_settings", 1, 2, "int", &function_f9e445ee, 0, 0);
	callback::on_localplayer_spawned(&local_player_spawn);
	callback::on_spawned(&on_player_spawned);
	callback::on_killcam_begin(&function_5bec2ba9);
	callback::on_killcam_end(&function_5bec2ba9);
	callback::function_fb65b7c2(&function_5bec2ba9);
}

/*
	Name: function_8183e35a
	Namespace: player
	Checksum: 0x623020C6
	Offset: 0x308
	Size: 0xA4
	Parameters: 1
	Flags: Event
*/
event function_8183e35a(eventstruct)
{
	if(!self function_21c0fa55())
	{
		return;
	}
	if(self postfx::function_556665f2(#"hash_715247c8f8a6a967"))
	{
		self postfx::exitpostfxbundle(#"hash_715247c8f8a6a967");
	}
	if(!squad_spawn::function_21b773d5(self.localclientnum))
	{
		self thread postfx::playpostfxbundle(#"hash_715247c8f8a6a967");
	}
}

/*
	Name: gameplay_started_callback
	Namespace: player
	Checksum: 0xED19CBA8
	Offset: 0x3B8
	Size: 0x84
	Parameters: 7
	Flags: Linked
*/
function gameplay_started_callback(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	setdvar(#"cg_isgameplayactive", bwastimejump);
	if(bwastimejump)
	{
		level callback::callback(#"on_gameplay_started", fieldname);
	}
}

/*
	Name: local_player_spawn
	Namespace: player
	Checksum: 0xEA4B22F1
	Offset: 0x448
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function local_player_spawn(localclientnum)
{
	if(!self function_21c0fa55())
	{
		return;
	}
	setdepthoffield(localclientnum, 0, 0, 0, 0, 6, 1.8);
}

/*
	Name: on_player_spawned
	Namespace: player
	Checksum: 0x6E7DF10D
	Offset: 0x4A8
	Size: 0x120
	Parameters: 1
	Flags: Linked
*/
function on_player_spawned(localclientnum)
{
	self thread function_8f03c3d0(localclientnum);
	if(self function_47493647())
	{
		self setsoundentcontext("npc_gender", "female");
	}
	else
	{
		self setsoundentcontext("npc_gender", "male");
	}
	foreach(player in getplayers(localclientnum))
	{
		player function_f22aa227(localclientnum);
	}
}

/*
	Name: function_5bec2ba9
	Namespace: player
	Checksum: 0x6F03A0BC
	Offset: 0x5D0
	Size: 0xC0
	Parameters: 1
	Flags: Linked
*/
function function_5bec2ba9(params)
{
	foreach(player in getplayers(params.localclientnum))
	{
		player function_e450e3e1(params);
		player function_4ff4a239(params.localclientnum);
	}
}

/*
	Name: function_4ff4a239
	Namespace: player
	Checksum: 0x48ABC074
	Offset: 0x698
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function function_4ff4a239(localclientnum)
{
	if(!self function_21c0fa55())
	{
		if(self.team === function_73f4b33(localclientnum))
		{
			self function_9974c822("cmn_teammate_duck");
			self callback::add_entity_callback(#"death", &function_e450e3e1);
		}
	}
}

/*
	Name: function_8f03c3d0
	Namespace: player
	Checksum: 0xEE4A3976
	Offset: 0x738
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function function_8f03c3d0(localclientnum)
{
	if(sessionmodeiscampaigngame())
	{
		return;
	}
	self endon(#"death");
	self endon(#"disconnect");
	waitframe(1);
	self function_4ff4a239(localclientnum);
}

/*
	Name: function_e450e3e1
	Namespace: player
	Checksum: 0x8A93A6B0
	Offset: 0x7A0
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function function_e450e3e1(params)
{
	self function_5dcc74d1("cmn_teammate_duck");
	self callback::function_52ac9652(#"death", &function_e450e3e1);
}

/*
	Name: function_f9e445ee
	Namespace: player
	Checksum: 0xC3747465
	Offset: 0x808
	Size: 0x122
	Parameters: 7
	Flags: Linked
*/
function function_f9e445ee(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	switch(bwastimejump)
	{
		case 0:
		{
			setdepthoffield(fieldname, 0, 0, 512, 512, 4, 0);
			break;
		}
		case 1:
		{
			setdepthoffield(fieldname, 0, 0, 512, 4000, 4, 0);
			break;
		}
		case 2:
		{
			setdepthoffield(fieldname, 0, 128, 512, 4000, 6, 1.8);
			break;
		}
		default:
		{
			break;
		}
	}
}

/*
	Name: function_f22aa227
	Namespace: player
	Checksum: 0xC6F66DF2
	Offset: 0x938
	Size: 0xFC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f22aa227(localclientnum)
{
	if(codcaster::function_b8fe9b52(localclientnum))
	{
		return;
	}
	if(!isalive(self))
	{
		return;
	}
	var_2d9ea0a1 = function_27673a7(localclientnum);
	if(self.team !== var_2d9ea0a1.team)
	{
		if(!self function_d2503806(#"rob_sonar_set_enemy"))
		{
			self playrenderoverridebundle(#"rob_sonar_set_enemy");
		}
	}
	else if(self function_d2503806(#"rob_sonar_set_enemy"))
	{
		self stoprenderoverridebundle(#"rob_sonar_set_enemy");
	}
}

