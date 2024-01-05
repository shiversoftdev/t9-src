#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace dynent_use;

/*
	Name: __init__system__
	Namespace: dynent_use
	Checksum: 0x63983C7F
	Offset: 0x100
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"dynent_use", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: dynent_use
	Checksum: 0x998EF663
	Offset: 0x148
	Size: 0x15C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(currentsessionmode() == 4 || !(isdefined(getgametypesetting(#"usabledynents")) ? getgametypesetting(#"usabledynents") : 0))
	{
		return;
	}
	clientfield::register_clientuimodel("hudItems.dynentUseHoldProgress", 13000, 5, "float", 0);
	/#
		level thread devgui_loop();
	#/
	level thread update_loop();
	callback::on_connect(&on_player_connect);
	callback::on_disconnect(&on_player_disconnect);
	callback::on_player_killed(&on_player_killed);
	level.var_29e3cd8 = &function_7f2040e8;
	level.var_7d3131e8 = &function_662eb91e;
}

/*
	Name: on_player_connect
	Namespace: dynent_use
	Checksum: 0x144462B5
	Offset: 0x2B0
	Size: 0x74
	Parameters: 0
	Flags: Linked, Private
*/
function private on_player_connect()
{
	usetrigger = create_use_trigger();
	self clientclaimtrigger(usetrigger);
	self.var_8a022726 = usetrigger;
	/#
		if(self ishost())
		{
			self thread function_6b66543a();
		}
	#/
}

/*
	Name: on_player_disconnect
	Namespace: dynent_use
	Checksum: 0xD393E890
	Offset: 0x330
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private on_player_disconnect()
{
	if(isdefined(self.var_8a022726))
	{
		self.var_8a022726 delete();
	}
}

/*
	Name: on_player_killed
	Namespace: dynent_use
	Checksum: 0xF4C8E32C
	Offset: 0x368
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private on_player_killed(params)
{
	self clientfield::set_player_uimodel("hudItems.dynentUseHoldProgress", 0);
}

/*
	Name: create_use_trigger
	Namespace: dynent_use
	Checksum: 0xDA0F72D3
	Offset: 0x3A0
	Size: 0x1A0
	Parameters: 0
	Flags: Linked, Private
*/
function private create_use_trigger()
{
	usetrigger = spawn("trigger_radius_use", vectorscale((0, 0, -1), 10000), 0, 128, 64, 1);
	usetrigger.targetname = "dynent_use";
	usetrigger triggerignoreteam();
	usetrigger setinvisibletoall();
	usetrigger setvisibletoplayer(self);
	usetrigger setteamfortrigger(#"none");
	usetrigger setcursorhint("HINT_NOICON");
	usetrigger triggerenable(0);
	usetrigger usetriggerignoreuseholdtime();
	usetrigger function_4bf6de9a(0);
	usetrigger function_c96c67a5(0);
	usetrigger function_89fca53b(1);
	usetrigger function_49462027(1, (1 | 16) | 1024);
	usetrigger callback::on_trigger_once(&function_46502841);
	return usetrigger;
}

/*
	Name: update_loop
	Namespace: dynent_use
	Checksum: 0x3B8D1CBC
	Offset: 0x548
	Size: 0x196
	Parameters: 0
	Flags: Linked, Private
*/
function private update_loop()
{
	level endon(#"game_ended");
	var_1a1c0d86 = 0;
	while(true)
	{
		foreach(i, player in getplayers())
		{
			if((i % 5) == var_1a1c0d86)
			{
				if(!isdefined(player.var_8a022726))
				{
					continue;
				}
				if(player.sessionstate != "playing" || !isalive(player) || player isinvehicle() || (isdefined(level.var_3dfbaf65) && player [[level.var_3dfbaf65]]()))
				{
					player.var_8a022726 triggerenable(0);
					continue;
				}
				player function_2f394f36();
			}
		}
		var_1a1c0d86 = (var_1a1c0d86 + 1) % 5;
		waitframe(1);
	}
}

/*
	Name: function_2f394f36
	Namespace: dynent_use
	Checksum: 0xA95E838
	Offset: 0x6E8
	Size: 0x69C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_2f394f36()
{
	height = self getmaxs()[2];
	bounds = (50, 50, height / 2);
	var_5ed7231a = self getcentroid();
	/#
		debug = self ishost() && getdvarint(#"hash_23e7101285284738", 0);
		if(debug)
		{
			box(var_5ed7231a, (0, 0, 0) - bounds, bounds, 0, (0, 0, 1), 1, 0, 5);
		}
	#/
	viewheight = self getplayerviewheight();
	vieworigin = self.origin + (0, 0, viewheight);
	viewangles = self getplayerangles();
	viewforward = anglestoforward(viewangles);
	var_e86a4d9 = function_db4bc717(var_5ed7231a, bounds);
	var_c61b7280 = undefined;
	var_97684497 = undefined;
	bestdot = -1;
	foreach(dynent in var_e86a4d9)
	{
		centroid = function_c5689a6a(dynent);
		var_966ddbb9 = centroid - vieworigin;
		var_966ddbb9 = vectornormalize((var_966ddbb9[0], var_966ddbb9[1], 0));
		var_755fcbbd = vectordot(viewforward, var_966ddbb9);
		/#
			if(debug)
			{
				sphere(dynent.origin, 9, (0, 0, 1), 1, 0, 8, 5);
			}
		#/
		if(var_755fcbbd < 0)
		{
			continue;
		}
		if(isdefined(dynent.var_a548ec11) && gettime() <= dynent.var_a548ec11)
		{
			/#
				if(debug)
				{
					print3d(dynent.origin, "", (1, 1, 1), 1, 0.5, 5);
				}
			#/
			continue;
		}
		stateindex = function_ffdbe8c2(dynent);
		bundle = function_489009c1(dynent);
		if(isdefined(bundle) && isdefined(bundle.dynentstates) && isdefined(bundle.dynentstates[stateindex]) && (is_true(bundle.dynentstates[stateindex].var_efabe801) || (level.inprematchperiod && !is_true(bundle.dynentstates[stateindex].var_4a78f198))))
		{
			/#
				if(debug)
				{
					print3d(dynent.origin, "", (1, 1, 1), 1, 0.5, 5);
				}
			#/
			continue;
		}
		if(isdefined(dynent.canuse) && !dynent [[dynent.canuse]](self))
		{
			continue;
		}
		if(self function_662eb91e(dynent, vieworigin, viewforward, 5))
		{
			var_c61b7280 = undefined;
			break;
		}
		if(var_755fcbbd > bestdot)
		{
			bestdot = var_755fcbbd;
			var_c61b7280 = dynent;
		}
	}
	if(!isdefined(var_c61b7280))
	{
		self.var_8a022726 triggerenable(0);
		return;
	}
	trigger = self.var_8a022726;
	state = function_ffdbe8c2(var_c61b7280);
	if(trigger.var_a9309589 === var_c61b7280 && trigger.dynentstate === state)
	{
		trigger triggerenable(1);
		return;
	}
	trigger.var_a9309589 = var_c61b7280;
	trigger.dynentstate = state;
	bundle = function_489009c1(var_c61b7280);
	v_offset = ((isdefined(bundle.var_aa0fba03) ? bundle.var_aa0fba03 : 0), (isdefined(bundle.var_f8525687) ? bundle.var_f8525687 : 0), (isdefined(bundle.var_54b28eee) ? bundle.var_54b28eee : 0));
	v_offset = rotatepoint(v_offset, var_c61b7280.angles);
	trigger.origin = var_c61b7280.origin + v_offset;
	trigger.usetime = (isdefined(bundle.use_time) ? bundle.use_time : 0);
	trigger function_836af3b3(bundle, state);
	trigger triggerenable(1);
}

/*
	Name: function_662eb91e
	Namespace: dynent_use
	Checksum: 0x8794523D
	Offset: 0xD90
	Size: 0x2F8
	Parameters: 4
	Flags: Linked
*/
function function_662eb91e(dynent, vieworigin, viewforward, var_7c927bcc)
{
	if(!isdefined(var_7c927bcc))
	{
		var_7c927bcc = 1;
	}
	if(!isdefined(dynent.var_667629e9) || dynent.var_667629e9.size <= 0)
	{
		return false;
	}
	foreach(var_806e6091 in dynent.var_667629e9)
	{
		if(!isdefined(var_806e6091.owner) || var_806e6091.owner != self || !isdefined(var_806e6091.pickuptrigger))
		{
			continue;
		}
		var_75b2d824 = var_806e6091 getboundsmidpoint();
		var_ed0847f8 = var_806e6091.origin + rotatepoint(var_75b2d824, var_806e6091.angles);
		var_7113bae6 = var_ed0847f8 - vieworigin;
		var_5a188b65 = vectornormalize(var_7113bae6);
		var_99957205 = vectordot(viewforward, var_5a188b65);
		if(var_99957205 <= 0.7 || !bullettracepassed(vieworigin, var_ed0847f8, 0, self, var_806e6091))
		{
			continue;
		}
		var_bfe39478 = var_806e6091 getboundshalfsize();
		var_594916e6 = length(var_bfe39478);
		var_fcdb3664 = sqrt(1 - (var_99957205 * var_99957205));
		var_c1b1ec6c = ((var_fcdb3664 * length(var_7113bae6)) / var_99957205) < var_594916e6;
		/#
			if(getdvarint(#"hash_23e7101285284738", 0))
			{
				var_d8959d2a = (var_c1b1ec6c ? (1, 0, 0) : (0, 1, 0));
				sphere(var_ed0847f8, var_594916e6, var_d8959d2a, 0.75, 0, 10, var_7c927bcc);
			}
		#/
		if(var_c1b1ec6c)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_836af3b3
	Namespace: dynent_use
	Checksum: 0x278412D5
	Offset: 0x1090
	Size: 0xA4
	Parameters: 2
	Flags: Linked
*/
function function_836af3b3(bundle, state)
{
	hintstring = #"";
	if(isdefined(bundle) && isdefined(bundle.dynentstates) && isdefined(bundle.dynentstates[state]) && isdefined(bundle.dynentstates[state].hintstring))
	{
		hintstring = bundle.dynentstates[state].hintstring;
	}
	self sethintstring(hintstring);
}

/*
	Name: function_46502841
	Namespace: dynent_use
	Checksum: 0xBDD1EDAE
	Offset: 0x1140
	Size: 0x11A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_46502841(trigger_struct)
{
	if(is_true(level.gameended))
	{
		return;
	}
	activator = trigger_struct.activator;
	dynent = self.var_a9309589;
	success = activator function_2b9e2224(self);
	while(success && isdefined(dynent) && self.var_a9309589 === dynent && is_true(dynent.var_e7823894))
	{
		if(isdefined(dynent.canuse) && !dynent [[dynent.canuse]](activator))
		{
			break;
		}
		self triggerenable(1);
		success = activator function_2b9e2224(self);
	}
}

/*
	Name: function_2b9e2224
	Namespace: dynent_use
	Checksum: 0x45E133B5
	Offset: 0x1268
	Size: 0x2F8
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2b9e2224(trigger)
{
	self endon(#"disconnect");
	dynent = trigger.var_a9309589;
	success = 0;
	var_957a77d9 = !(isdefined(dynent.var_a548ec11) && dynent.var_a548ec11 > gettime());
	if(isdefined(dynent) && var_957a77d9)
	{
		begintime = gettime();
		usetime = int(trigger.usetime * 1000);
		endtime = begintime + usetime;
		if(isdefined(dynent.onbeginuse))
		{
			dynent thread [[dynent.onbeginuse]](self);
		}
		if(isdefined(dynent.var_263c4ded))
		{
			var_36c3259 = trigger.usetime;
			usetime = int(dynent thread [[dynent.var_263c4ded]](self) * 1000);
			endtime = begintime + usetime;
		}
		while(self function_58fa8833(trigger, dynent))
		{
			if(is_true(level.gameended))
			{
				trigger triggerenable(0);
				break;
			}
			if(gettime() >= endtime)
			{
				success = 1;
				var_a852a7dd = trigger use_dynent(dynent, self);
				dynent.var_a548ec11 = gettime() + (var_a852a7dd * 1000);
				trigger triggerenable(0);
				break;
			}
			if(usetime > 0)
			{
				progress = (gettime() - begintime) / usetime;
				progress = max(progress, 0.01);
				self clientfield::set_player_uimodel("hudItems.dynentUseHoldProgress", progress);
			}
			waitframe(1);
		}
		if(isdefined(dynent.onusecancel) && !success)
		{
			dynent thread [[dynent.onusecancel]](self);
		}
	}
	self clientfield::set_player_uimodel("hudItems.dynentUseHoldProgress", 0);
	self thread function_e882de59(trigger);
	return success;
}

/*
	Name: function_58fa8833
	Namespace: dynent_use
	Checksum: 0x223967B7
	Offset: 0x1568
	Size: 0xC0
	Parameters: 2
	Flags: Linked
*/
function function_58fa8833(trigger, dynent)
{
	if(!isalive(self))
	{
		return false;
	}
	if(self inlaststand())
	{
		return false;
	}
	if(!self usebuttonpressed())
	{
		return false;
	}
	if(!trigger istriggerenabled())
	{
		return false;
	}
	if(!self istouching(trigger))
	{
		return false;
	}
	if(!isdefined(dynent))
	{
		return false;
	}
	if(trigger.var_a9309589 !== dynent)
	{
		return false;
	}
	return true;
}

/*
	Name: function_e882de59
	Namespace: dynent_use
	Checksum: 0xEFDC905F
	Offset: 0x1630
	Size: 0xCC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e882de59(trigger)
{
	if(is_true(level.gameended))
	{
		return;
	}
	self notify("14ab9227773147ee");
	self endon("14ab9227773147ee");
	level endon(#"game_ended");
	self endon(#"disconnect");
	while(isalive(self) && self usebuttonpressed())
	{
		waitframe(1);
	}
	trigger callback::on_trigger_once(&function_46502841);
}

/*
	Name: function_7f2040e8
	Namespace: dynent_use
	Checksum: 0x964F91FA
	Offset: 0x1708
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function function_7f2040e8()
{
	if(!isdefined(self.var_8a022726))
	{
		return;
	}
	self.var_8a022726 callback::remove_on_trigger_once(&function_46502841);
	self thread function_e882de59(self.var_8a022726);
}

/*
	Name: use_dynent
	Namespace: dynent_use
	Checksum: 0x449C40B8
	Offset: 0x1770
	Size: 0x340
	Parameters: 5
	Flags: Linked
*/
function use_dynent(dynent, activator, var_b731b99b, disablegesture, var_c78a0afc)
{
	if(!isdefined(disablegesture))
	{
		disablegesture = 0;
	}
	if(!isdefined(var_c78a0afc))
	{
		var_c78a0afc = 0;
	}
	stateindex = function_ffdbe8c2(dynent);
	bundle = function_489009c1(dynent);
	var_9bdcfcd8 = undefined;
	if(isdefined(bundle) && isdefined(bundle.dynentstates) && isdefined(bundle.dynentstates[stateindex]))
	{
		state = bundle.dynentstates[stateindex];
		var_9bdcfcd8 = (isdefined(var_b731b99b) ? var_b731b99b : (isdefined(state.var_8a7fcb87) ? state.var_8a7fcb87 : 0));
		if(!isdefined(var_b731b99b) && isdefined(activator))
		{
			var_b4b3af4c = anglestoforward(dynent.angles);
			playerdir = self.origin - activator.origin;
			playerdir = vectornormalize((playerdir[0], playerdir[1], 0));
			dot = vectordot(var_b4b3af4c, playerdir);
			if(dot >= 0)
			{
				var_9bdcfcd8 = (isdefined(state.var_8a7fcb87) ? state.var_8a7fcb87 : 0);
			}
			else
			{
				var_9bdcfcd8 = (isdefined(state.var_afc94db1) ? state.var_afc94db1 : 0);
			}
		}
		if(!disablegesture && isplayer(activator) && isdefined(state.var_20630681))
		{
			activator gestures::function_56e00fbf(state.var_20630681, undefined, 0);
		}
		if(isdefined(dynent.onuse))
		{
			succeeded = dynent [[dynent.onuse]](activator, stateindex, var_9bdcfcd8);
		}
		if(!isdefined(succeeded) || succeeded == 1)
		{
			dynent.var_c78a0afc = (var_c78a0afc ? 1 : undefined);
			function_e2a06860(dynent, var_9bdcfcd8);
			dynent.var_c78a0afc = undefined;
		}
		dynent callback::callback(#"hash_4248afa7a68c391b", {#activator:activator});
		return true;
	}
	return false;
}

/*
	Name: devgui_loop
	Namespace: dynent_use
	Checksum: 0x8C21F14E
	Offset: 0x1AB8
	Size: 0x6C
	Parameters: 0
	Flags: Private
*/
function private devgui_loop()
{
	/#
		level endon(#"game_ended");
		while(!canadddebugcommand())
		{
			waitframe(1);
		}
		adddebugcommand("");
		adddebugcommand("");
	#/
}

/*
	Name: function_6b66543a
	Namespace: dynent_use
	Checksum: 0x25C99544
	Offset: 0x1B30
	Size: 0x288
	Parameters: 0
	Flags: Private
*/
function private function_6b66543a()
{
	/#
		self endon(#"disconnect");
		while(true)
		{
			waitframe(1);
			waittillframeend();
			if(!getdvarint(#"hash_23e7101285284738", 0))
			{
				continue;
			}
			trigger = self.var_8a022726;
			if(isdefined(trigger))
			{
				dynent = trigger.var_a9309589;
				if(isdefined(dynent))
				{
					sphere(function_c5689a6a(dynent), 8, (0, 1, 1));
					sphere(dynent.origin, 7, (1, 0.5, 0));
					print3d(dynent.origin, function_ffdbe8c2(dynent), (1, 1, 1), 1, 0.5);
				}
				color = (trigger istriggerenabled() ? (1, 0, 1) : (1, 0, 0));
				maxs = trigger getmaxs();
				mins = trigger getmins();
				origin = trigger.origin;
				top = origin + (0, 0, maxs[2]);
				bottom = origin + (0, 0, mins[2]);
				line(bottom, top, color);
				sphere(origin, 2, color);
				circle(bottom, maxs[0], color, 0, 1);
				circle(top, maxs[0], color, 0, 1);
			}
		}
	#/
}

