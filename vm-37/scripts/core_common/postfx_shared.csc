#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace postfx;

/*
	Name: __init__system__
	Namespace: postfx
	Checksum: 0xE7FA879E
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"postfx_bundle", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: postfx
	Checksum: 0xBD80DD91
	Offset: 0xD8
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_localplayer_spawned(&localplayer_postfx_bundle_init);
}

/*
	Name: localplayer_postfx_bundle_init
	Namespace: postfx
	Checksum: 0x7F471D28
	Offset: 0x108
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function localplayer_postfx_bundle_init(localclientnum)
{
	if(isdefined(self.postfxbundelsinited))
	{
		return;
	}
	self.postfxbundelsinited = 1;
	self.playingpostfxbundle = "";
	self.forcestoppostfxbundle = 0;
	self.exitpostfxbundle = 0;
	/#
		self thread postfxbundledebuglisten();
		self thread function_764eb053();
	#/
}

/*
	Name: postfxbundledebuglisten
	Namespace: postfx
	Checksum: 0xC9539EAE
	Offset: 0x190
	Size: 0x210
	Parameters: 0
	Flags: None
*/
function postfxbundledebuglisten()
{
	/#
		self endon(#"death");
		setdvar(#"scr_play_postfx_bundle", "");
		setdvar(#"scr_stop_postfx_bundle", "");
		setdvar(#"scr_exit_postfx_bundle", "");
		while(true)
		{
			playbundlename = getdvarstring(#"scr_play_postfx_bundle");
			if(playbundlename != "")
			{
				self thread playpostfxbundle(playbundlename);
				setdvar(#"scr_play_postfx_bundle", "");
			}
			stopbundlename = getdvarstring(#"scr_stop_postfx_bundle");
			if(stopbundlename != "")
			{
				self thread stoppostfxbundle(stopbundlename);
				setdvar(#"scr_stop_postfx_bundle", "");
			}
			var_38ce085 = getdvarstring(#"scr_exit_postfx_bundle");
			if(var_38ce085 != "")
			{
				self thread exitpostfxbundle(var_38ce085);
				setdvar(#"scr_exit_postfx_bundle", "");
			}
			wait(0.5);
		}
	#/
}

/*
	Name: function_764eb053
	Namespace: postfx
	Checksum: 0xB42044B1
	Offset: 0x3A8
	Size: 0x2AE
	Parameters: 0
	Flags: None
*/
function function_764eb053()
{
	/#
		self endon(#"death");
		var_986c8888 = 0;
		var_4828f60f = 0;
		var_e0f0fb1d = "";
		ent = undefined;
		while(true)
		{
			showmodel = getdvarint(#"hash_56d8c90edb7a97b6", 0);
			showviewmodel = getdvarint(#"hash_65c459b02d95c9c9", 0);
			newspawn = 0;
			if(showmodel != var_986c8888)
			{
				if(showmodel > 0)
				{
					if(!isdefined(ent))
					{
						newspawn = 1;
						ent = util::spawn_model(self.localclientnum, "");
					}
				}
				else if(var_986c8888 > 0)
				{
					if(isdefined(ent))
					{
						ent delete();
						ent = undefined;
					}
				}
				var_986c8888 = showmodel;
			}
			if(newspawn || showmodel == 1 && isdefined(ent))
			{
				ent.origin = (self.origin + vectorscale((0, 0, 1), 70)) + (anglestoforward(self.angles) * 250);
			}
			bundlename = getdvarstring(#"cg_playrenderoverridebundle", "");
			if(bundlename != var_e0f0fb1d && isdefined(ent))
			{
				ent stoprenderoverridebundle(var_e0f0fb1d);
				if(bundlename != "")
				{
					ent playrenderoverridebundle(bundlename);
				}
			}
			if(showviewmodel && (showviewmodel != var_4828f60f || bundlename != var_e0f0fb1d))
			{
				self stoprenderoverridebundle(var_e0f0fb1d);
				if(bundlename != "")
				{
					self playrenderoverridebundle(bundlename);
				}
			}
			var_e0f0fb1d = bundlename;
			var_4828f60f = showviewmodel;
			waitframe(1);
		}
	#/
}

/*
	Name: playpostfxbundle
	Namespace: postfx
	Checksum: 0x9E30427B
	Offset: 0x660
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function playpostfxbundle(playbundlename)
{
	self thread watchentityshutdown(playbundlename);
	self codeplaypostfxbundle(playbundlename);
}

/*
	Name: watchentityshutdown
	Namespace: postfx
	Checksum: 0x1200B8C0
	Offset: 0x6A8
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function watchentityshutdown(playbundlename)
{
	var_17b7891d = "6433c543b3eba711" + playbundlename;
	self notify(var_17b7891d);
	self endon(var_17b7891d);
	localclientnum = self.localclientnum;
	self waittill(#"death", #"finished_playing_postfx_bundle");
	codestoppostfxbundlelocal(localclientnum, playbundlename);
}

/*
	Name: stoppostfxbundle
	Namespace: postfx
	Checksum: 0xBCFE88FD
	Offset: 0x740
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function stoppostfxbundle(bundlename)
{
	self codestoppostfxbundle(bundlename);
}

/*
	Name: function_c8b5f318
	Namespace: postfx
	Checksum: 0xAE44EDDB
	Offset: 0x770
	Size: 0x34
	Parameters: 3
	Flags: Linked
*/
function function_c8b5f318(bundlename, constname, constvalue)
{
	self function_116b95e5(bundlename, constname, constvalue);
}

/*
	Name: function_556665f2
	Namespace: postfx
	Checksum: 0xF42D8AFD
	Offset: 0x7B0
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function function_556665f2(bundlename)
{
	return self function_d2cb869e(bundlename);
}

/*
	Name: exitpostfxbundle
	Namespace: postfx
	Checksum: 0x92817A13
	Offset: 0x7E0
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function exitpostfxbundle(bundlename)
{
	self function_3f145588(bundlename);
}

/*
	Name: setfrontendstreamingoverlay
	Namespace: postfx
	Checksum: 0xD9CD7741
	Offset: 0x810
	Size: 0x124
	Parameters: 3
	Flags: Linked
*/
function setfrontendstreamingoverlay(localclientnum, system, enabled)
{
	if(!isdefined(self.overlayclients))
	{
		self.overlayclients = [];
	}
	if(!isdefined(self.overlayclients[localclientnum]))
	{
		self.overlayclients[localclientnum] = [];
	}
	self.overlayclients[localclientnum][system] = enabled;
	foreach(en in self.overlayclients[localclientnum])
	{
		if(en)
		{
			enablefrontendstreamingoverlay(localclientnum, 1);
			return;
		}
	}
	enablefrontendstreamingoverlay(localclientnum, 0);
}

/*
	Name: toggle_postfx
	Namespace: postfx
	Checksum: 0xF63D078B
	Offset: 0x940
	Size: 0x9C
	Parameters: 3
	Flags: None
*/
function toggle_postfx(localclientnum, enabled, var_c8b06dda)
{
	/#
		assert(isdefined(var_c8b06dda));
	#/
	if(!enabled)
	{
		if(self function_556665f2(var_c8b06dda))
		{
			self stoppostfxbundle(var_c8b06dda);
		}
	}
	else if(!self function_556665f2(var_c8b06dda))
	{
		self playpostfxbundle(var_c8b06dda);
	}
}

