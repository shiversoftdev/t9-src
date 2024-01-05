#using script_59f62971655f7103;
#using scripts\core_common\battlechatter.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace grapple;

/*
	Name: function_ed79c381
	Namespace: grapple
	Checksum: 0x17140E24
	Offset: 0x148
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ed79c381()
{
	level notify(1468608882);
}

/*
	Name: __init__system__
	Namespace: grapple
	Checksum: 0xCF6CC4EE
	Offset: 0x168
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"grapple", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: grapple
	Checksum: 0x9622FF1E
	Offset: 0x1B0
	Size: 0x5C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	callback::on_localplayer_spawned(&player_on_spawned);
	level.var_c3e66138 = &function_bbd7fc60;
	level.var_1b2035de = getscriptbundle("grapple_custom_settings");
}

/*
	Name: player_on_spawned
	Namespace: grapple
	Checksum: 0x6881F227
	Offset: 0x218
	Size: 0x94
	Parameters: 1
	Flags: None
*/
function player_on_spawned(localclientnum)
{
	player = self;
	if(sessionmodeismultiplayergame() || sessionmodeiswarzonegame())
	{
		if(!player function_21c0fa55())
		{
			return;
		}
		player thread function_664d0a50(localclientnum);
		player thread function_2297363d(localclientnum);
	}
}

/*
	Name: function_664d0a50
	Namespace: grapple
	Checksum: 0x1AE3B7B0
	Offset: 0x2B8
	Size: 0x21C
	Parameters: 1
	Flags: None
*/
function function_664d0a50(localclientnum)
{
	self notify("23372589bea0150");
	self endon("23372589bea0150");
	player = self;
	var_e413b7c3 = undefined;
	invalidhandle = undefined;
	while(isdefined(player))
	{
		var_6e521a44 = function_15f112c3(localclientnum);
		if(isdefined(var_6e521a44))
		{
			if(var_6e521a44 && !isdefined(var_e413b7c3))
			{
				if(isdefined(invalidhandle))
				{
					killfx(localclientnum, invalidhandle);
					player notify("grapple_light_done_watch" + "invalid");
					invalidhandle = undefined;
				}
				var_e413b7c3 = playviewmodelfx(localclientnum, #"hash_2a3978ae302f2faf", "tag_fx1", 0);
				thread grapple_light_watch_end(localclientnum, var_e413b7c3, "valid");
			}
			else if(!var_6e521a44 && !isdefined(invalidhandle))
			{
				if(isdefined(var_e413b7c3))
				{
					killfx(localclientnum, var_e413b7c3);
					player notify("grapple_light_done_watch" + "valid");
					var_e413b7c3 = undefined;
				}
				invalidhandle = playviewmodelfx(localclientnum, #"hash_39ed4a0ecba806a2", "tag_fx1", 0);
				thread grapple_light_watch_end(localclientnum, invalidhandle, "invalid");
			}
		}
		else
		{
			if(isdefined(invalidhandle))
			{
				killfx(localclientnum, invalidhandle);
				invalidhandle = undefined;
			}
			if(isdefined(var_e413b7c3))
			{
				killfx(localclientnum, var_e413b7c3);
				var_e413b7c3 = undefined;
			}
		}
		waitframe(1);
	}
}

/*
	Name: grapple_light_watch_end
	Namespace: grapple
	Checksum: 0xBADC4812
	Offset: 0x4E0
	Size: 0xA4
	Parameters: 3
	Flags: None
*/
function grapple_light_watch_end(localclientnum, handle, name)
{
	player = self;
	player endon("grapple_light_done_watch" + name);
	player notify("grapple_light_watch_end" + name);
	player endon("grapple_light_watch_end" + name);
	player waittill(#"death");
	if(isdefined(handle))
	{
		killfx(localclientnum, handle);
	}
}

/*
	Name: function_2297363d
	Namespace: grapple
	Checksum: 0x1873DE56
	Offset: 0x590
	Size: 0x1D8
	Parameters: 1
	Flags: None
*/
function function_2297363d(localclientnum)
{
	self notify("78e2574a6ed24754");
	self endon("78e2574a6ed24754");
	player = self;
	doearthquake = 1;
	var_30f9f328 = 0;
	while(isdefined(player))
	{
		if(function_fd33f2ef(localclientnum) == 3)
		{
			if(doearthquake)
			{
				player.grappleeq = earthquake(localclientnum, level.var_1b2035de.var_1598129, 10000, player.origin, 0, 0);
				doearthquake = 0;
			}
			player mapshaderconstant(localclientnum, 0, "scriptVector1", var_30f9f328, 0, 0, 0);
			var_30f9f328 = var_30f9f328 + 0.05;
		}
		else
		{
			if(function_fd33f2ef(localclientnum) == 0)
			{
				player mapshaderconstant(localclientnum, 0, "scriptVector1", var_30f9f328, 0, 0, 0);
				var_30f9f328 = var_30f9f328 - 0.05;
			}
			else
			{
				player mapshaderconstant(localclientnum, 0, "scriptVector1", 0, 0, 0, 0);
				if(isdefined(player.grappleeq))
				{
					function_196e7c4b(localclientnum, player.grappleeq);
					player.grappleeq = undefined;
					doearthquake = 1;
				}
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_bbd7fc60
	Namespace: grapple
	Checksum: 0xDE7D793F
	Offset: 0x770
	Size: 0x84
	Parameters: 1
	Flags: None
*/
function function_bbd7fc60(var_428d0be2)
{
	if(!isdefined(var_428d0be2) || is_false(level.allowspecialistdialog))
	{
		return;
	}
	dialogalias = var_428d0be2 battlechatter::get_player_dialog_alias("grappleGunWeaponUseFail");
	if(!isdefined(dialogalias))
	{
		return;
	}
	var_428d0be2 playsound(0, dialogalias);
}

