#using script_1cc417743d7c262d;
#using script_229f24b1662651c4;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\damagefeedback_shared.gsc;
#using scripts\core_common\dogtags.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\fx_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\hostmigration_shared.gsc;
#using scripts\core_common\hud_util_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\tweakables_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\mp_common\gametypes\_prop_dev.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\mp_common\gametypes\globallogic_spawn.gsc;
#using scripts\mp_common\gametypes\globallogic_utils.gsc;
#using scripts\mp_common\gametypes\prop.gsc;
#using scripts\mp_common\gametypes\spawning.gsc;
#using scripts\mp_common\gametypes\spawnlogic.gsc;
#using scripts\mp_common\util.gsc;

#namespace _prop_controls;

/*
	Name: function_c8c5c0b8
	Namespace: _prop_controls
	Checksum: 0x86037452
	Offset: 0x428
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c8c5c0b8()
{
	level notify(1102763481);
}

#namespace namespace_314165c4;

/*
	Name: notifyonplayercommand
	Namespace: namespace_314165c4
	Checksum: 0xFBE498A0
	Offset: 0x448
	Size: 0x54
	Parameters: 2
	Flags: None
*/
function notifyonplayercommand(command, key)
{
	/#
		assert(isplayer(self));
	#/
	self thread function_255e9614(command, key);
}

/*
	Name: notifyonplayercommandremove
	Namespace: namespace_314165c4
	Checksum: 0x7EB7D574
	Offset: 0x4A8
	Size: 0x2A
	Parameters: 2
	Flags: None
*/
function notifyonplayercommandremove(command, key)
{
	self notify((command + "_") + key);
}

/*
	Name: function_255e9614
	Namespace: namespace_314165c4
	Checksum: 0x3ABA0521
	Offset: 0x4E0
	Size: 0x4AA
	Parameters: 2
	Flags: None
*/
function function_255e9614(command, key)
{
	self endon(#"disconnect");
	level endon(#"game_ended");
	self notify((command + "_") + key);
	self endon((command + "_") + key);
	switch(key)
	{
		case "+attack":
		{
			function_9024fce3(&attackbuttonpressed, command);
			break;
		}
		case "+speed_throw":
		{
			function_9024fce3(&adsbuttonpressed, command);
			break;
		}
		case "hash_7fa1df65551193d3":
		{
			function_9024fce3(&changeseatbuttonpressed, command);
			break;
		}
		case "weapnext":
		{
			function_9024fce3(&function_903bba26, command);
			break;
		}
		case "+usereload":
		{
			function_9024fce3(&usebuttonpressed, command);
			break;
		}
		case "+smoke":
		{
			function_9024fce3(&secondaryoffhandbuttonpressed, command);
			break;
		}
		case "+frag":
		{
			function_9024fce3(&fragbuttonpressed, command);
			break;
		}
		case "hash_329305cda840577":
		{
			function_9024fce3(&actionslotonebuttonpressed, command);
			break;
		}
		case "hash_329315cda84072a":
		{
			function_9024fce3(&actionslottwobuttonpressed, command);
			break;
		}
		case "+actionslot 3":
		{
			function_9024fce3(&actionslotthreebuttonpressed, command);
			break;
		}
		case "+actionslot 4":
		{
			function_9024fce3(&actionslotfourbuttonpressed, command);
			break;
		}
		case "hash_6fba413807bd1e19":
		{
			function_21e5a72f(&actionslotonebuttonpressed, command);
			break;
		}
		case "hash_6fba3e3807bd1900":
		{
			function_21e5a72f(&actionslottwobuttonpressed, command);
			break;
		}
		case "hash_6fba3f3807bd1ab3":
		{
			function_21e5a72f(&actionslotthreebuttonpressed, command);
			break;
		}
		case "hash_6fba443807bd2332":
		{
			function_21e5a72f(&actionslotfourbuttonpressed, command);
			break;
		}
		case "+stance":
		{
			function_21e5a72f(&stancebuttonpressed, command);
			break;
		}
		case "+breath_sprint":
		{
			function_21e5a72f(&sprintbuttonpressed, command);
			break;
		}
		case "+melee_zoom":
		{
			function_21e5a72f(&meleebuttonpressed, command);
			break;
		}
		case "+melee":
		{
			function_21e5a72f(&meleebuttonpressed, command);
			break;
		}
	}
}

/*
	Name: function_9024fce3
	Namespace: namespace_314165c4
	Checksum: 0x11B9CCB
	Offset: 0x998
	Size: 0x5C
	Parameters: 2
	Flags: None
*/
function function_9024fce3(var_59b87232, command)
{
	while(true)
	{
		while(!self [[var_59b87232]]())
		{
			waitframe(1);
		}
		self notify(command);
		while(self [[var_59b87232]]())
		{
			waitframe(1);
		}
	}
}

/*
	Name: function_21e5a72f
	Namespace: namespace_314165c4
	Checksum: 0x4907F947
	Offset: 0xA00
	Size: 0x5C
	Parameters: 2
	Flags: None
*/
function function_21e5a72f(var_59b87232, command)
{
	while(true)
	{
		while(!self [[var_59b87232]]())
		{
			waitframe(1);
		}
		while(self [[var_59b87232]]())
		{
			waitframe(1);
		}
		self notify(command);
	}
}

/*
	Name: function_903bba26
	Namespace: namespace_314165c4
	Checksum: 0x4B709630
	Offset: 0xA68
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function function_903bba26()
{
	return self weaponswitchbuttonpressed() || self buttonbitstate("BUTTON_BIT_WEAPNEXT");
}

/*
	Name: setupkeybindings
	Namespace: namespace_314165c4
	Checksum: 0x6F6D86BB
	Offset: 0xAB0
	Size: 0x15C
	Parameters: 0
	Flags: None
*/
function setupkeybindings()
{
	if(isai(self))
	{
		return;
	}
	self notifyonplayercommand("lock", "+attack");
	self notifyonplayercommand("spin", "+speed_throw");
	self notifyonplayercommand("changeProp", "weapnext");
	self notifyonplayercommand("setToSlope", "+usereload");
	self notifyonplayercommand("propAbility", "+frag");
	self notifyonplayercommand("cloneProp", "+smoke");
	self notifyonplayercommand("hide", "+melee");
	self notifyonplayercommand("hide", "+melee_zoom");
}

/*
	Name: function_1e25f968
	Namespace: namespace_314165c4
	Checksum: 0x7CCEF216
	Offset: 0xC18
	Size: 0x15C
	Parameters: 0
	Flags: None
*/
function function_1e25f968()
{
	if(isai(self))
	{
		return;
	}
	self notifyonplayercommandremove("lock", "+attack");
	self notifyonplayercommandremove("spin", "+speed_throw");
	self notifyonplayercommandremove("changeProp", "weapnext");
	self notifyonplayercommandremove("setToSlope", "+usereload");
	self notifyonplayercommandremove("propAbility", "+frag");
	self notifyonplayercommandremove("cloneProp", "+smoke");
	self notifyonplayercommandremove("hide", "+melee");
	self notifyonplayercommandremove("hide", "+melee_zoom");
}

/*
	Name: is_player_gamepad_enabled
	Namespace: namespace_314165c4
	Checksum: 0x37F630F0
	Offset: 0xD80
	Size: 0x1A
	Parameters: 0
	Flags: None
*/
function is_player_gamepad_enabled()
{
	return self gamepadusedlast();
}

/*
	Name: setvalue
	Namespace: namespace_314165c4
	Checksum: 0x83ECD65F
	Offset: 0xDA8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function setvalue(value)
{
	self.value = value;
}

/*
	Name: addupperrighthudelem
	Namespace: namespace_314165c4
	Checksum: 0x97F964A7
	Offset: 0xDD0
	Size: 0x1A6
	Parameters: 4
	Flags: None
*/
function addupperrighthudelem(label, value, text, labelpc)
{
	hudelem = spawnstruct();
	hudelem.x = -15;
	hudelem.y = self.currenthudy;
	hudelem.alignx = "right";
	hudelem.aligny = "bottom";
	hudelem.horzalign = "right";
	hudelem.vertalign = "bottom";
	hudelem.archived = 1;
	hudelem.alpha = 1;
	hudelem.glowalpha = 0;
	hudelem.hidewheninmenu = 1;
	hudelem.hidewheninkillcam = 1;
	hudelem.startfontscale = hudelem.fontscale;
	if(isdefined(label) && isdefined(labelpc))
	{
		if(self is_player_gamepad_enabled())
		{
			hudelem.label = label;
		}
		else
		{
			hudelem.label = labelpc;
		}
	}
	else
	{
		if(isdefined(label))
		{
			hudelem.label = label;
		}
		else if(isdefined(text))
		{
			/#
				hudelem settext(text);
			#/
		}
	}
	if(isdefined(value))
	{
		hudelem setvalue(value);
	}
	self.currenthudy = self.currenthudy - 20;
	return hudelem;
}

/*
	Name: propcontrolshud
	Namespace: namespace_314165c4
	Checksum: 0x36B8C2A3
	Offset: 0xF80
	Size: 0x1E4
	Parameters: 0
	Flags: None
*/
function propcontrolshud()
{
	/#
		assert(!isdefined(self.changepropkey));
	#/
	if(self issplitscreen())
	{
		self.currenthudy = -10;
	}
	else
	{
		self.currenthudy = -80;
	}
	self.abilitykey = addupperrighthudelem();
	self.clonekey = addupperrighthudelem(#"mp_ph_clone");
	self.changepropkey = addupperrighthudelem(#"mp_ph_change", 0);
	self.currenthudy = self.currenthudy - 20;
	self.var_8e3b5c8c = addupperrighthudelem(#"mp_ph_hideprop");
	self.matchslopekey = addupperrighthudelem(#"mp_ph_slope", undefined, undefined, #"mp_ph_slope_pc");
	self.lockpropkey = addupperrighthudelem(#"mp_ph_lock");
	self.spinpropkey = addupperrighthudelem(#"mp_ph_spin", undefined, undefined, #"mp_ph_spin_pc");
	self setnewabilityhud();
	self.zoomkey = addupperrighthudelem(#"mp_ph_zoom");
	self thread updatetextongamepadchange();
}

/*
	Name: cleanuppropcontrolshudondeath
	Namespace: namespace_314165c4
	Checksum: 0x41D078DD
	Offset: 0x1170
	Size: 0x6C
	Parameters: 0
	Flags: None
*/
function cleanuppropcontrolshudondeath()
{
	level endon(#"game_ended");
	self endon(#"disconnect");
	self waittill(#"death");
	self thread function_1e25f968();
	self thread cleanuppropcontrolshud();
}

/*
	Name: safedestroy
	Namespace: namespace_314165c4
	Checksum: 0xB1DD43EC
	Offset: 0x11E8
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function safedestroy(hudelem)
{
	if(isdefined(hudelem))
	{
		/#
			hudelem destroy();
		#/
	}
}

/*
	Name: cleanuppropcontrolshud
	Namespace: namespace_314165c4
	Checksum: 0x6DA667E9
	Offset: 0x1220
	Size: 0x4E
	Parameters: 0
	Flags: None
*/
function cleanuppropcontrolshud()
{
	self.changepropkey = undefined;
	self.spinpropkey = undefined;
	self.lockpropkey = undefined;
	self.matchslopekey = undefined;
	self.abilitykey = undefined;
	self.zoomkey = undefined;
	self.spectatekey = undefined;
	self.clonekey = undefined;
	self.var_8e3b5c8c = undefined;
}

/*
	Name: updatetextongamepadchange
	Namespace: namespace_314165c4
	Checksum: 0x9DF332F9
	Offset: 0x1278
	Size: 0x19C
	Parameters: 0
	Flags: None
*/
function updatetextongamepadchange()
{
	level endon(#"game_ended");
	self endon(#"death");
	if(level.console)
	{
		return;
	}
	waittillframeend();
	var_8671d17 = self is_player_gamepad_enabled();
	while(true)
	{
		var_4084aa7 = self is_player_gamepad_enabled();
		if(var_4084aa7 != var_8671d17)
		{
			var_8671d17 = var_4084aa7;
			if(var_4084aa7)
			{
				if(!is_true(self.slopelocked))
				{
					self.matchslopekey.label = #"mp_ph_slope";
				}
				else
				{
					self.matchslopekey.label = #"mp_ph_sloped";
				}
				self.spinpropkey.label = #"mp_ph_spin";
			}
			else
			{
				if(!is_true(self.slopelocked))
				{
					self.matchslopekey.label = #"mp_ph_slope_pc";
				}
				else
				{
					self.matchslopekey.label = #"mp_ph_sloped_pc";
				}
				self.spinpropkey.label = #"mp_ph_spin_pc";
			}
		}
		waitframe(1);
	}
}

/*
	Name: propinputwatch
	Namespace: namespace_314165c4
	Checksum: 0x28AA5912
	Offset: 0x1420
	Size: 0x280
	Parameters: 0
	Flags: None
*/
function propinputwatch()
{
	self endon(#"death", #"disconnect");
	level endon(#"game_ended");
	if(isai(self))
	{
		return;
	}
	self.lock = 0;
	self.slopelocked = 0;
	prop::function_241f7953();
	self thread propmoveunlock();
	self thread propcamerazoom();
	self.debugnextpropindex = 1;
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"lock", #"spin", #"changeprop", #"settoslope", #"propability", #"cloneprop", #"hide");
		msg = waitresult._notify;
		if(!isdefined(msg))
		{
			continue;
		}
		waittillframeend();
		if(msg == "lock")
		{
			self proplockunlock();
		}
		else
		{
			if(msg == "spin")
			{
				self function_9bc7ac53();
			}
			else
			{
				if(msg == "changeProp")
				{
					self propchange();
				}
				else
				{
					if(msg == "setToSlope")
					{
						self propmatchslope();
					}
					else
					{
						if(msg == "propAbility")
						{
							self propability();
						}
						else
						{
							if(msg == "cloneProp")
							{
								self propclonepower();
							}
							else if(msg == "hide")
							{
								self function_2b14e8b1();
							}
						}
					}
				}
			}
		}
	}
}

/*
	Name: proplockunlock
	Namespace: namespace_314165c4
	Checksum: 0xB4C0D1FC
	Offset: 0x16A8
	Size: 0x54
	Parameters: 0
	Flags: None
*/
function proplockunlock()
{
	if(self ismantling())
	{
		return;
	}
	if(self.lock)
	{
		self unlockprop();
	}
	else
	{
		self lockprop();
	}
}

/*
	Name: function_9bc7ac53
	Namespace: namespace_314165c4
	Checksum: 0x3CEEE851
	Offset: 0x1708
	Size: 0xD4
	Parameters: 0
	Flags: None
*/
function function_9bc7ac53()
{
	self.propent unlink();
	self.propent.angles = self.propent.angles + vectorscale((0, 1, 0), 45);
	self.propent.origin = self.propanchor.origin;
	if(self.slopelocked && is_true(self.lock))
	{
		self.propent set_pitch_roll_for_ground_normal(self.prop);
	}
	self.propent linkto(self.propanchor);
}

/*
	Name: registerpreviousprop
	Namespace: namespace_314165c4
	Checksum: 0x72BEE0DC
	Offset: 0x17E8
	Size: 0x82
	Parameters: 1
	Flags: None
*/
function registerpreviousprop(var_d8316f60)
{
	var_d8171b71 = 3;
	if(!isdefined(var_d8316f60.usedpropsindex))
	{
		var_d8316f60.usedpropsindex = 0;
	}
	var_d8316f60.usedprops[var_d8316f60.usedpropsindex] = var_d8316f60.prop.info;
	var_d8316f60.usedpropsindex++;
	if(var_d8316f60.usedpropsindex >= var_d8171b71)
	{
		var_d8316f60.usedpropsindex = 0;
	}
}

/*
	Name: propchange
	Namespace: namespace_314165c4
	Checksum: 0x5B8053A7
	Offset: 0x1878
	Size: 0x2CC
	Parameters: 0
	Flags: None
*/
function propchange()
{
	if(!self prophaschangesleft())
	{
		return;
	}
	if(!level.console)
	{
		var_17d6ea37 = 300;
		if(isdefined(self.lastpropchangetime) && (gettime() - self.lastpropchangetime) < var_17d6ea37)
		{
			return;
		}
		self.lastpropchangetime = gettime();
	}
	self notify(#"hash_17365159190a4895");
	registerpreviousprop(self);
	self.prop.info = prop::getnextprop(self);
	/#
		if(getdvarint(#"hash_1463efb6c1a55cd3", 0) != 0)
		{
			self.prop.info = level.proplist[self.debugnextpropindex];
			self.debugnextpropindex++;
			if(self.debugnextpropindex >= level.proplist.size)
			{
				self.debugnextpropindex = 0;
			}
		}
	#/
	self propchangeto(self.prop.info);
	if(level.phsettings.var_bca517c5)
	{
		playfxontag("player/fx_plyr_clone_reaper_appear", self.prop, "tag_origin");
	}
	self prop::function_239d2233(int(prop::getprophealth(self.prop.info)));
	self setnormalhealth(1);
	self setnewabilitycount(self.currentability);
	self setnewabilitycount("CLONE");
	if(prop::useprophudserver())
	{
		self.abilitykey.alpha = 1;
		self.clonekey.alpha = 1;
	}
	/#
		if(getdvarint(#"hash_1463efb6c1a55cd3", 0) != 0)
		{
			return;
		}
	#/
	self propdeductchange();
}

/*
	Name: prophaschangesleft
	Namespace: namespace_314165c4
	Checksum: 0x554E3F6B
	Offset: 0x1B50
	Size: 0x36
	Parameters: 0
	Flags: None
*/
function prophaschangesleft()
{
	/#
		if(is_true(self.var_f18a4260))
		{
			return 1;
		}
	#/
	return self.changesleft > 0;
}

/*
	Name: propdeductchange
	Namespace: namespace_314165c4
	Checksum: 0x4B9B2AB2
	Offset: 0x1B90
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function propdeductchange()
{
	/#
		if(is_true(self.var_f18a4260))
		{
			return;
		}
	#/
	propsetchangesleft(self.changesleft - 1);
}

/*
	Name: propsetchangesleft
	Namespace: namespace_314165c4
	Checksum: 0x867FB6AF
	Offset: 0x1BE8
	Size: 0x94
	Parameters: 1
	Flags: None
*/
function propsetchangesleft(newvalue)
{
	self.changesleft = newvalue;
	if(prop::useprophudserver())
	{
		self.changepropkey setvalue(self.changesleft);
		if(self.changesleft <= 0)
		{
			self.changepropkey.alpha = 0.5;
		}
		self clientfield::set_player_uimodel("hudItems.numPropChanges", self.changesleft);
	}
}

/*
	Name: propchangeto
	Namespace: namespace_314165c4
	Checksum: 0x24D1A820
	Offset: 0x1C88
	Size: 0x3E4
	Parameters: 1
	Flags: None
*/
function propchangeto(info)
{
	self.prop.info = info;
	self.propinfo = info;
	if(level.phsettings.var_bca517c5)
	{
		var_2b249f2c = self.propent.angles;
		var_c1de4a4e = self.prop.angles;
		var_fd85abcf = self.angles;
	}
	self.prop setmodel(info.modelname);
	self.prop.xyzoffset = info.xyzoffset;
	self.prop.anglesoffset = info.anglesoffset;
	self.prop setscale(info.var_9846ca56);
	self.prop unlink();
	self.propent unlink();
	self.propent.origin = self.propanchor.origin;
	self.prop.origin = self.propent.origin;
	self.propent.angles = (self.angles[0], self.propent.angles[1], self.angles[2]);
	self.prop.angles = self.propent.angles;
	if(is_true(self.isangleoffset))
	{
		self.prop.angles = self.angles;
		self.isangleoffset = 0;
	}
	self prop::applyxyzoffset();
	self prop::applyanglesoffset();
	if(level.phsettings.var_bca517c5)
	{
		self.propent.angles = var_2b249f2c;
		self.prop.angles = var_c1de4a4e;
		self.angles = var_fd85abcf;
	}
	self.prop linkto(self.propent);
	if(self.slopelocked && is_true(self.lock))
	{
		self.propent set_pitch_roll_for_ground_normal(self.prop);
	}
	self.propent linkto(self.propanchor);
	self.thirdpersonrange = info.proprange;
	self.thirdpersonheightoffset = info.propheight;
	self setclientthirdperson(1);
	clientfield::set_to_player("PROP.cameraRange", int(self.thirdpersonrange / 10));
	clientfield::set_to_player("PROP.cameraHeight", int(self.thirdpersonheightoffset / 10));
	clientfield::set_to_player("PROP.change_prop", !clientfield::get_to_player("PROP.change_prop"));
}

/*
	Name: propmatchslope
	Namespace: namespace_314165c4
	Checksum: 0x7D94A5A2
	Offset: 0x2078
	Size: 0x24A
	Parameters: 0
	Flags: None
*/
function propmatchslope()
{
	if(!is_true(self.slopelocked))
	{
		self.slopelocked = 1;
		if(is_true(self.lock) && !is_true(self.var_635e22e7))
		{
			self.propent unlink();
			self.propent set_pitch_roll_for_ground_normal(self.prop);
			self.propent linkto(self.propanchor);
		}
		if(prop::useprophudserver())
		{
			if(self is_player_gamepad_enabled())
			{
				self.matchslopekey.label = #"mp_ph_sloped";
			}
			else
			{
				self.matchslopekey.label = #"mp_ph_sloped_pc";
			}
		}
	}
	else
	{
		self.slopelocked = 0;
		if(is_true(self.lock))
		{
			self.propent unlink();
			self.propent.angles = (self.angles[0], self.propent.angles[1], self.angles[2]);
			self.propent.origin = self.propanchor.origin;
			self.propent linkto(self.propanchor);
		}
		if(prop::useprophudserver())
		{
			if(self is_player_gamepad_enabled())
			{
				self.matchslopekey.label = #"mp_ph_slope";
			}
			else
			{
				self.matchslopekey.label = #"mp_ph_slope_pc";
			}
		}
	}
}

/*
	Name: propability
	Namespace: namespace_314165c4
	Checksum: 0x84093862
	Offset: 0x22D0
	Size: 0x6C
	Parameters: 0
	Flags: None
*/
function propability()
{
	if(!level flag::get("props_hide_over"))
	{
		return;
	}
	if(self prophasflashesleft())
	{
		self thread flashenemies();
		self propdeductflash();
	}
}

/*
	Name: propclonepower
	Namespace: namespace_314165c4
	Checksum: 0x17281F9B
	Offset: 0x2348
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function propclonepower()
{
	if(prophasclonesleft())
	{
		self thread cloneprop();
		self thread propdeductclonechange();
	}
}

/*
	Name: prophasclonesleft
	Namespace: namespace_314165c4
	Checksum: 0x2FCDBBFD
	Offset: 0x2398
	Size: 0x36
	Parameters: 0
	Flags: None
*/
function prophasclonesleft()
{
	/#
		if(is_true(self.var_7ddbf78d))
		{
			return 1;
		}
	#/
	return self.clonesleft > 0;
}

/*
	Name: propdeductclonechange
	Namespace: namespace_314165c4
	Checksum: 0xC436E62A
	Offset: 0x23D8
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function propdeductclonechange()
{
	/#
		if(is_true(self.var_7ddbf78d))
		{
			return;
		}
	#/
	propsetclonesleft(self.clonesleft - 1);
}

/*
	Name: propsetclonesleft
	Namespace: namespace_314165c4
	Checksum: 0xE9FDEF55
	Offset: 0x2430
	Size: 0xDC
	Parameters: 1
	Flags: None
*/
function propsetclonesleft(newvalue)
{
	self.clonesleft = newvalue;
	if(prop::useprophudserver() && isdefined(self) && isalive(self) && isdefined(self.clonekey))
	{
		self.clonekey setvalue(self.clonesleft);
		if(self.clonesleft <= 0)
		{
			self.clonekey.alpha = 0.5;
		}
		else
		{
			self.clonekey.alpha = 1;
		}
		self clientfield::set_player_uimodel("hudItems.numPropDecoys", self.clonesleft);
	}
}

/*
	Name: prophasflashesleft
	Namespace: namespace_314165c4
	Checksum: 0x76D47A44
	Offset: 0x2518
	Size: 0x36
	Parameters: 0
	Flags: None
*/
function prophasflashesleft()
{
	/#
		if(is_true(self.var_d0e95c44))
		{
			return 1;
		}
	#/
	return self.abilityleft > 0;
}

/*
	Name: propdeductflash
	Namespace: namespace_314165c4
	Checksum: 0x16D2547E
	Offset: 0x2558
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function propdeductflash()
{
	/#
		if(is_true(self.var_d0e95c44))
		{
			return;
		}
	#/
	propsetflashesleft(self.abilityleft - 1);
}

/*
	Name: propsetflashesleft
	Namespace: namespace_314165c4
	Checksum: 0xB1420407
	Offset: 0x25B0
	Size: 0x94
	Parameters: 1
	Flags: None
*/
function propsetflashesleft(newvalue)
{
	self.abilityleft = newvalue;
	if(prop::useprophudserver())
	{
		self.abilitykey setvalue(self.abilityleft);
		if(self.abilityleft <= 0)
		{
			self.abilitykey.alpha = 0.5;
		}
		self clientfield::set_player_uimodel("hudItems.numPropConcusses", self.abilityleft);
	}
}

/*
	Name: set_pitch_roll_for_ground_normal
	Namespace: namespace_314165c4
	Checksum: 0x61AD1EC5
	Offset: 0x2650
	Size: 0x1BA
	Parameters: 1
	Flags: None
*/
function set_pitch_roll_for_ground_normal(var_67b8306d)
{
	groundnormal = get_ground_normal(var_67b8306d, 0);
	if(!isdefined(groundnormal))
	{
		return;
	}
	var_bcd5e04 = anglestoforward(self.angles);
	ovr = anglestoright(self.angles);
	new_angles = vectortoangles(groundnormal);
	pitch = angleclamp180(new_angles[0] + 90);
	new_angles = (0, new_angles[1], 0);
	var_c13d4c82 = anglestoforward(new_angles);
	mod = vectordot(var_c13d4c82, ovr);
	if(mod < 0)
	{
		mod = -1;
	}
	else
	{
		mod = 1;
	}
	dot = vectordot(var_c13d4c82, var_bcd5e04);
	var_535a15b1 = dot * pitch;
	var_d1ee48d6 = ((1 - abs(dot)) * pitch) * mod;
	self.angles = (var_535a15b1, self.angles[1], var_d1ee48d6);
}

/*
	Name: function_c0665212
	Namespace: namespace_314165c4
	Checksum: 0x111AE477
	Offset: 0x2818
	Size: 0xD0
	Parameters: 1
	Flags: None
*/
function function_c0665212(var_ec9c756e)
{
	foreach(player in level.players)
	{
		if(isdefined(player.prop))
		{
			if(var_ec9c756e)
			{
				player.prop notsolid();
				continue;
			}
			player.prop solid();
		}
	}
}

/*
	Name: function_5b73beef
	Namespace: namespace_314165c4
	Checksum: 0x87882F1
	Offset: 0x28F0
	Size: 0x13C
	Parameters: 1
	Flags: None
*/
function function_5b73beef(var_ec9c756e)
{
	foreach(player in level.players)
	{
		if(isdefined(player.propclones))
		{
			foreach(clone in player.propclones)
			{
				if(isdefined(clone))
				{
					if(var_ec9c756e)
					{
						clone notsolid();
						continue;
					}
					clone solid();
				}
			}
		}
	}
}

/*
	Name: get_ground_normal
	Namespace: namespace_314165c4
	Checksum: 0x2AFA846A
	Offset: 0x2A38
	Size: 0x3AE
	Parameters: 2
	Flags: None
*/
function get_ground_normal(var_67b8306d, debug)
{
	if(!isdefined(var_67b8306d))
	{
		ignore = self;
	}
	else
	{
		ignore = var_67b8306d;
	}
	var_3503303 = array(self.origin);
	if(getdvarint(#"scr_ph_useboundsforgroundnormal", 1))
	{
		i = -1;
		while(i <= 1)
		{
			j = -1;
			while(j <= 1)
			{
				corner = ignore getpointinbounds(i, j, 0);
				corner = (corner[0], corner[1], self.origin[2]);
				var_3503303[var_3503303.size] = corner;
				j = j + 2;
			}
			i = i + 2;
		}
	}
	function_c0665212(1);
	var_683999d6 = (0, 0, 0);
	var_10ccb3f8 = 0;
	foreach(point in var_3503303)
	{
		trace = bullettrace(point + vectorscale((0, 0, 1), 4), point + (vectorscale((0, 0, -1), 16)), 0, ignore);
		tracehit = trace[#"fraction"] > 0 && trace[#"fraction"] < 1;
		if(tracehit)
		{
			var_683999d6 = var_683999d6 + trace[#"normal"];
			var_10ccb3f8++;
		}
		/#
			if(debug)
			{
				if(tracehit)
				{
					line(point, point + (trace[#"normal"] * 30), (0, 1, 0));
					continue;
				}
				sphere(point, 3, (1, 0, 0));
			}
		#/
	}
	function_c0665212(0);
	if(var_10ccb3f8 > 0)
	{
		var_683999d6 = var_683999d6 / var_10ccb3f8;
		/#
			if(debug)
			{
				line(self.origin, self.origin + (var_683999d6 * 20), (1, 1, 1));
			}
		#/
		return var_683999d6;
	}
	/#
		if(debug)
		{
			sphere(self.origin, 5, (1, 0, 0));
		}
	#/
	return undefined;
}

/*
	Name: propmoveunlock
	Namespace: namespace_314165c4
	Checksum: 0xDC882859
	Offset: 0x2DF0
	Size: 0x192
	Parameters: 0
	Flags: None
*/
function propmoveunlock()
{
	self endon(#"death", #"disconnect");
	level endon(#"game_ended");
	var_554b8919 = 0;
	var_cd6d7e01 = 0;
	var_de410ab8 = 0;
	while(true)
	{
		waitframe(1);
		movement = self getnormalizedmovement();
		jumping = self jumpbuttonpressed();
		if(!isdefined(movement))
		{
			continue;
		}
		ismoving = movement[0] != 0 || movement[1] != 0 || jumping;
		if(self.lock && var_de410ab8 && !ismoving)
		{
			var_de410ab8 = 0;
		}
		else
		{
			if(self.lock && !var_554b8919 && ismoving)
			{
				var_de410ab8 = 1;
			}
			else if(self.lock && ismoving && !var_de410ab8)
			{
				self unlockprop();
			}
		}
		var_554b8919 = self.lock;
		var_cd6d7e01 = ismoving;
	}
}

/*
	Name: unlockprop
	Namespace: namespace_314165c4
	Checksum: 0xBF91A7BE
	Offset: 0x2F90
	Size: 0x224
	Parameters: 0
	Flags: None
*/
function unlockprop()
{
	if(isdefined(self.var_fb6d3a39) && (abs(self.var_fb6d3a39 - gettime())) <= 100)
	{
		return;
	}
	self.var_fb6d3a39 = gettime();
	self unlink();
	self resetdoublejumprechargetime();
	offset = self.propanchor.origin - self.origin;
	offsetangles = self.propanchor.angles - self.angles;
	if(self.slopelocked)
	{
		self.propent unlink();
		self.propent.angles = (self.angles[0], self.propent.angles[1], self.angles[2]);
		self.propent.origin = self.propanchor.origin;
		self.propent linkto(self.propanchor);
	}
	self.var_635e22e7 = 1;
	waitframe(1);
	if(isdefined(self))
	{
		if(isdefined(self.propanchor))
		{
			self.propanchor.angles = self.angles + offsetangles;
			self.propanchor.origin = self.origin + offset;
			self.propanchor linkto(self);
		}
		self.lock = 0;
		self.var_635e22e7 = 0;
		if(prop::useprophudserver())
		{
			self.lockpropkey.label = #"mp_ph_lock";
			self thread flashlockpropkey();
		}
	}
}

/*
	Name: lockprop
	Namespace: namespace_314165c4
	Checksum: 0xAAFDBF8F
	Offset: 0x31C0
	Size: 0x144
	Parameters: 0
	Flags: None
*/
function lockprop()
{
	if(!canlock())
	{
		return;
	}
	self.propanchor unlink();
	self.propanchor.origin = self.origin;
	self playerlinkto(self.propanchor);
	if(self.slopelocked)
	{
		self.propent unlink();
		self.propent set_pitch_roll_for_ground_normal(self.prop);
		self.propent.origin = self.origin;
		self.propent linkto(self.propanchor);
	}
	self.lock = 1;
	self notify(#"locked");
	if(prop::useprophudserver())
	{
		self.lockpropkey.label = #"mp_ph_locked";
		self thread flashlockpropkey();
	}
}

/*
	Name: flashlockpropkey
	Namespace: namespace_314165c4
	Checksum: 0x9066A56A
	Offset: 0x3310
	Size: 0xF6
	Parameters: 0
	Flags: None
*/
function flashlockpropkey()
{
	self endon(#"death", #"disconnect");
	level endon(#"game_ended");
	self notify(#"flashlockpropkey");
	self endon(#"flashlockpropkey");
	if(!isdefined(self.lockpropkey.startfontscale))
	{
		self.lockpropkey.startfontscale = 1;
	}
	var_df67e195 = self.lockpropkey.startfontscale + 0.75;
	self.lockpropkey.fontscale = var_df67e195;
	wait(0.1);
	if(isdefined(self.lockpropkey))
	{
		self.lockpropkey.fontscale = self.lockpropkey.startfontscale;
	}
}

/*
	Name: function_56cae8fa
	Namespace: namespace_314165c4
	Checksum: 0x4B332DEB
	Offset: 0x3410
	Size: 0x72
	Parameters: 0
	Flags: None
*/
function function_56cae8fa()
{
	/#
		assert(isplayer(self));
	#/
	start = self.origin;
	end = start + (vectorscale((0, 0, -1), 2000));
	return playerphysicstrace(start, end);
}

/*
	Name: function_97f02d5c
	Namespace: namespace_314165c4
	Checksum: 0xDEC1E7C2
	Offset: 0x3490
	Size: 0x8A
	Parameters: 0
	Flags: None
*/
function function_97f02d5c()
{
	/#
		assert(isplayer(self));
	#/
	start = self.origin;
	end = start + (vectorscale((0, 0, -1), 2000));
	trace = bullettrace(start, end, 0, self.prop);
	return trace;
}

/*
	Name: function_6de7bc19
	Namespace: namespace_314165c4
	Checksum: 0x60B57754
	Offset: 0x3528
	Size: 0x192
	Parameters: 9
	Flags: None
*/
function function_6de7bc19(success, type, player, origin1, text1, origin2, text2, origin3, text3)
{
	/#
		if(!isdefined(level.var_f8f7808e))
		{
			level.var_f8f7808e = spawnstruct();
		}
		level.var_f8f7808e.success = success;
		level.var_f8f7808e.type = type;
		level.var_f8f7808e.playerorg = player.origin;
		level.var_f8f7808e.playerangles = player.angles;
		level.var_f8f7808e.playermins = player getmins();
		level.var_f8f7808e.playermaxs = player getmaxs();
		level.var_f8f7808e.origin1 = origin1;
		level.var_f8f7808e.text1 = text1;
		level.var_f8f7808e.origin2 = origin2;
		level.var_f8f7808e.text2 = text2;
		level.var_f8f7808e.origin3 = origin3;
		level.var_f8f7808e.text3 = text3;
	#/
}

/*
	Name: canlock
	Namespace: namespace_314165c4
	Checksum: 0x7ECFA624
	Offset: 0x36C8
	Size: 0x678
	Parameters: 0
	Flags: None
*/
function canlock()
{
	killtriggers = getentarray("trigger_hurt", "classname");
	oobtriggers = getentarray("trigger_out_of_bounds", "classname");
	triggers = arraycombine(killtriggers, oobtriggers, 0, 0);
	var_1bc5fbd6 = getentarray("prop_no_lock", "targetname");
	if(var_1bc5fbd6.size > 0)
	{
		triggers = arraycombine(triggers, var_1bc5fbd6, 0, 0);
	}
	foreach(trigger in triggers)
	{
		if(trigger istouchingvolume(self.origin, self getmins(), self getmaxs()))
		{
			/#
				function_6de7bc19(0, "", self, trigger.origin, trigger.classname);
			#/
			return false;
		}
	}
	if(self isplayerswimming())
	{
		/#
			function_6de7bc19(1, "", self);
		#/
		return true;
	}
	if(!self isonground() || self iswallrunning())
	{
		trace1 = self function_97f02d5c();
		frac = trace1[#"fraction"];
		org1 = trace1[#"position"];
		if(frac == 1)
		{
			/#
				function_6de7bc19(0, "", self, org1, "");
			#/
			return false;
		}
		foreach(trigger in triggers)
		{
			if(trigger istouchingvolume(org1, self getmins(), self getmaxs()))
			{
				/#
					function_6de7bc19(0, "", self, trigger.origin, trigger.classname);
				#/
				return false;
			}
		}
		point = getnearestpathpoint(org1, 256);
		if(!isdefined(point))
		{
			/#
				function_6de7bc19(0, "", self, org1);
			#/
			return false;
		}
		distz = point[2] - org1[2];
		if(distz > 50)
		{
			point2 = getnearestpathpoint(org1, 50);
			if(!isdefined(point2))
			{
				/#
					function_6de7bc19(0, "", self, org1, "", point, "");
				#/
				return false;
			}
		}
		dist2d = distance2d(point, org1);
		if(dist2d > 100)
		{
			/#
				function_6de7bc19(0, "", self, org1, "", point, "");
			#/
			return false;
		}
		org2 = self function_56cae8fa();
		foreach(trigger in triggers)
		{
			if(trigger istouchingvolume(org2, self getmins(), self getmaxs()))
			{
				/#
					function_6de7bc19(0, "", self, trigger.origin, trigger.classname);
				#/
				return false;
			}
		}
		/#
			function_6de7bc19(1, "", self, org1, "", org2, "", point, "" + distance(org1, point));
		#/
		return true;
	}
	/#
		function_6de7bc19(1, "", self);
	#/
	return true;
}

/*
	Name: propcamerazoom
	Namespace: namespace_314165c4
	Checksum: 0x1BC6617A
	Offset: 0x3D50
	Size: 0x1C0
	Parameters: 0
	Flags: None
*/
function propcamerazoom()
{
	self endon(#"death", #"disconnect");
	level endon(#"game_ended");
	var_fc464c9b = 10;
	self.thirdpersonrange = self.prop.info.proprange;
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"zoomin", #"zoomout");
		zoom = waitresult._notify;
		if(!isdefined(zoom))
		{
			continue;
		}
		if(zoom == "zoomin")
		{
			if(self.thirdpersonrange - var_fc464c9b < 50)
			{
				continue;
			}
			self.thirdpersonrange = self.thirdpersonrange - var_fc464c9b;
			self setclientthirdperson(1);
		}
		else if(zoom == "zoomout")
		{
			var_70fc228b = math::clamp(self.prop.info.proprange + 50, 50, 360);
			if(self.thirdpersonrange + var_fc464c9b > var_70fc228b)
			{
				continue;
			}
			self.thirdpersonrange = self.thirdpersonrange + var_fc464c9b;
			self setclientthirdperson(1);
		}
	}
}

/*
	Name: setnewabilityhud
	Namespace: namespace_314165c4
	Checksum: 0x3F30147E
	Offset: 0x3F18
	Size: 0x82
	Parameters: 0
	Flags: None
*/
function setnewabilityhud()
{
	switch(self.currentability)
	{
		case "flash":
		{
			self.abilitykey.label = #"mp_ph_flash";
			break;
		}
		default:
		{
			/#
				assertmsg("");
			#/
			break;
		}
	}
}

/*
	Name: setnewabilitycount
	Namespace: namespace_314165c4
	Checksum: 0xB3985A28
	Offset: 0x3FA8
	Size: 0xEA
	Parameters: 2
	Flags: None
*/
function setnewabilitycount(var_8c8fd413, count)
{
	switch(var_8c8fd413)
	{
		case "flash":
		{
			if(!isdefined(count))
			{
				count = level.phsettings.propnumflashes;
			}
			propsetflashesleft(count);
			break;
		}
		case "clone":
		{
			if(!isdefined(count))
			{
				count = level.phsettings.propnumclones;
			}
			propsetclonesleft(count);
			break;
		}
		default:
		{
			/#
				assertmsg("" + var_8c8fd413);
			#/
			break;
		}
	}
}

/*
	Name: endondeath
	Namespace: namespace_314165c4
	Checksum: 0xB30E4680
	Offset: 0x40A0
	Size: 0x2E
	Parameters: 0
	Flags: None
*/
function endondeath()
{
	self waittill(#"death");
	waittillframeend();
	self notify(#"end_explode");
}

/*
	Name: flashtheprops
	Namespace: namespace_314165c4
	Checksum: 0x4F1DE82E
	Offset: 0x40D8
	Size: 0xBC
	Parameters: 1
	Flags: None
*/
function flashtheprops(var_c8c9bf0f)
{
	level endon(#"game_ended");
	var_c8c9bf0f endon(#"disconnect");
	self thread endondeath();
	self endon(#"end_explode");
	res = undefined;
	res = self waittill(#"explode");
	position = res.position;
	if(!isdefined(var_c8c9bf0f))
	{
		return;
	}
	flashenemies(var_c8c9bf0f, position);
}

/*
	Name: flashenemies
	Namespace: namespace_314165c4
	Checksum: 0x5B998399
	Offset: 0x41A0
	Size: 0x10E
	Parameters: 2
	Flags: None
*/
function flashenemies(var_c8c9bf0f, position)
{
	if(!isdefined(var_c8c9bf0f))
	{
		var_c8c9bf0f = self;
	}
	if(!isdefined(position))
	{
		position = self.origin;
	}
	fwd = anglestoforward(var_c8c9bf0f getplayerangles());
	fwd = vectornormalize((fwd[0], fwd[1], 0));
	var_ec24ae95 = fwd * 60;
	spawn_pos = (position + vectorscale((0, 0, 1), 10)) + (fwd * 30);
	var_f6beab23 = var_c8c9bf0f magicmissile(getweapon(#"eq_slow_grenade"), spawn_pos, var_ec24ae95);
}

/*
	Name: deletepropsifatmax
	Namespace: namespace_314165c4
	Checksum: 0x18ADBB80
	Offset: 0x42B8
	Size: 0x1BA
	Parameters: 0
	Flags: None
*/
function deletepropsifatmax()
{
	var_5c6eb952 = 9;
	if(level.phsettings.var_5b677bf1)
	{
		var_5c6eb952 = 27;
	}
	if((self.propclones.size + 1) <= var_5c6eb952)
	{
		return;
	}
	var_a78751de = 0;
	foreach(clone in self.propclones)
	{
		if(isdefined(clone))
		{
			var_a78751de++;
		}
	}
	if((var_a78751de + 1) <= var_5c6eb952)
	{
		return;
	}
	clones = [];
	var_ccb1dd7 = undefined;
	for(i = 0; i < self.propclones.size; i++)
	{
		clone = self.propclones[i];
		if(!isdefined(clone))
		{
			continue;
		}
		if(!isdefined(var_ccb1dd7))
		{
			var_ccb1dd7 = clone;
			continue;
		}
		clones[clones.size] = clone;
	}
	/#
		assert(isdefined(var_ccb1dd7));
	#/
	var_ccb1dd7 notify(#"hash_5913274f83579b1e");
	var_ccb1dd7 delete();
	self.propclones = clones;
}

/*
	Name: cloneprop
	Namespace: namespace_314165c4
	Checksum: 0x6636BF91
	Offset: 0x4480
	Size: 0x228
	Parameters: 0
	Flags: None
*/
function cloneprop()
{
	if(!isdefined(self.propclones))
	{
		self.propclones = [];
	}
	else
	{
		deletepropsifatmax();
	}
	var_6e55957c = spawn("script_model", self.prop.origin);
	var_6e55957c.targetname = "propClone";
	var_6e55957c setmodel(self.prop.model);
	var_6e55957c setscale(self.prop.info.var_9846ca56);
	var_6e55957c.angles = self.prop.angles;
	var_6e55957c setcandamage(1);
	var_6e55957c.fakehealth = 50;
	var_6e55957c.health = 99999;
	var_6e55957c.maxhealth = 99999;
	var_6e55957c.playerowner = self;
	var_6e55957c thread prop::function_aa8db165(&damageclonewatch);
	var_6e55957c setplayercollision(0);
	var_6e55957c makesentient();
	var_6e55957c clientfield::set("enemyequip", 2);
	if(prop::function_5a6214bd())
	{
		var_6e55957c hidefromteam(game.attackers);
		var_6e55957c notsolid();
	}
	if(level.phsettings.var_5b677bf1)
	{
		var_6e55957c.fakehealth = 100;
	}
	self.propclones[self.propclones.size] = var_6e55957c;
}

/*
	Name: damageclonewatch
	Namespace: namespace_314165c4
	Checksum: 0x420ABEA9
	Offset: 0x46B0
	Size: 0x176
	Parameters: 10
	Flags: None
*/
function damageclonewatch(damage, attacker, direction_vec, point, meansofdeath, modelname, tagname, partname, weapon, idflags)
{
	if(!isdefined(tagname))
	{
		return;
	}
	if(isplayer(tagname))
	{
		if(is_true(self.isdying))
		{
			return;
		}
		if(isdefined(idflags) && idflags.rootweapon.name == "concussion_grenade" && isdefined(weapon) && weapon != "MOD_IMPACT")
		{
			function_d04b961(tagname, undefined, weapon, modelname, partname, idflags);
		}
		tagname thread damagefeedback::update();
		self.lastattacker = tagname;
		self.fakehealth = self.fakehealth - modelname;
		if(self.fakehealth <= 0)
		{
			self function_d1a1cc8d();
			return;
		}
	}
	self.health = self.health + modelname;
}

/*
	Name: function_d1a1cc8d
	Namespace: namespace_314165c4
	Checksum: 0x2BFD5BC1
	Offset: 0x4830
	Size: 0x10C
	Parameters: 0
	Flags: None
*/
function function_d1a1cc8d()
{
	if(isdefined(self.lastattacker))
	{
		scoreevents::processscoreevent("clone_was_destroyed", self.lastattacker);
		if(isdefined(self.playerowner))
		{
			scoreevents::processscoreevent("clone_was_destroyed", self.playerowner);
		}
	}
	if(!isdefined(self.isdying))
	{
		self.isdying = 1;
	}
	playsoundatposition("wpn_flash_grenade_explode", self.origin + vectorscale((0, 0, 1), 4));
	playfx(fx::get("propDeathFX"), self.origin + vectorscale((0, 0, 1), 4));
	waittillframeend();
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: function_d8b858d4
	Namespace: namespace_314165c4
	Checksum: 0x9D8D1B89
	Offset: 0x4948
	Size: 0x202
	Parameters: 3
	Flags: None
*/
function function_d8b858d4(var_2953b091, fade_in_time, fade_out_time)
{
	level endon(#"game_ended");
	self endon(#"disconnect");
	if(!isdefined(var_2953b091))
	{
		var_2953b091 = 5;
	}
	if(!isdefined(fade_in_time))
	{
		fade_in_time = 1;
	}
	if(!isdefined(fade_out_time))
	{
		fade_out_time = 1;
	}
	overlay = spawnstruct();
	overlay.foreground = 0;
	overlay.x = 0;
	overlay.y = 0;
	overlay.alignx = "left";
	overlay.aligny = "top";
	overlay.horzalign = "fullscreen";
	overlay.vertalign = "fullscreen";
	overlay.alpha = 0;
	waitframe(1);
	overlay.alpha = 1;
	self prop::function_1ee6f124(fade_in_time);
	self useservervisionset(1);
	self setvisionsetforplayer("blackout_ph", fade_in_time);
	self prop::function_1ee6f124((var_2953b091 - fade_out_time) - fade_in_time);
	overlay.alpha = 0;
	self useservervisionset(0);
	self setvisionsetforplayer("blackout_ph", fade_out_time);
	self prop::function_1ee6f124(fade_out_time);
	waitframe(1);
}

/*
	Name: watchspecialgrenadethrow
	Namespace: namespace_314165c4
	Checksum: 0xC9ABE040
	Offset: 0x4B58
	Size: 0xEE
	Parameters: 0
	Flags: None
*/
function watchspecialgrenadethrow()
{
	self endon(#"death", #"disconnect");
	level endon(#"game_ended");
	self notify(#"watchspecialgrenadethrow");
	self endon(#"watchspecialgrenadethrow");
	while(true)
	{
		res = undefined;
		res = self waittill(#"grenade_fire");
		grenade = res.projectile;
		weapon = res.weapon;
		self thread function_6eadaf78(grenade, weapon);
		self.thrownspecialcount = self.thrownspecialcount + 1;
	}
}

/*
	Name: function_6eadaf78
	Namespace: namespace_314165c4
	Checksum: 0x10F210EE
	Offset: 0x4C50
	Size: 0x120
	Parameters: 2
	Flags: None
*/
function function_6eadaf78(grenade, weapon)
{
	level endon(#"game_ended");
	self endon(#"disconnect");
	res = undefined;
	res = grenade waittill(#"explode");
	damageorigin = res.position;
	if(!isdefined(level.var_fe458fef))
	{
		level.var_fe458fef = [];
	}
	index = function_5d3e918a(damageorigin);
	if(!isdefined(index))
	{
		index = function_7278d508(self, damageorigin, weapon, 1, "MOD_GRENADE_SPLASH");
	}
	waitframe(1);
	waitframe(1);
	self function_58699cee(index);
	waitframe(1);
	level.var_fe458fef[index] = undefined;
}

/*
	Name: function_7278d508
	Namespace: namespace_314165c4
	Checksum: 0x4562805B
	Offset: 0x4D78
	Size: 0xFA
	Parameters: 5
	Flags: None
*/
function function_7278d508(attacker, damageorigin, weapon, damage, meansofdeath)
{
	index = level.var_fe458fef.size;
	level.var_fe458fef[index] = spawnstruct();
	level.var_fe458fef[index].players = [];
	level.var_fe458fef[index].attacker = self;
	level.var_fe458fef[index].damageorigin = damageorigin;
	level.var_fe458fef[index].damage = damage;
	level.var_fe458fef[index].meansofdeath = meansofdeath;
	level.var_fe458fef[index].weapon = weapon;
	return index;
}

/*
	Name: function_d04b961
	Namespace: namespace_314165c4
	Checksum: 0x479129F1
	Offset: 0x4E80
	Size: 0xE0
	Parameters: 6
	Flags: None
*/
function function_d04b961(attacker, var_28a0d57c, meansofdeath, damage, damageorigin, weapon)
{
	if(!isdefined(level.var_fe458fef))
	{
		level.var_fe458fef = [];
	}
	index = function_5d3e918a(damageorigin);
	if(!isdefined(index))
	{
		index = function_7278d508(attacker, damageorigin, weapon, damage, meansofdeath);
	}
	if(isdefined(var_28a0d57c))
	{
		playerindex = level.var_fe458fef[index].players.size;
		level.var_fe458fef[index].players[playerindex] = var_28a0d57c;
	}
}

/*
	Name: function_5d3e918a
	Namespace: namespace_314165c4
	Checksum: 0xFA106EFC
	Offset: 0x4F68
	Size: 0xA6
	Parameters: 1
	Flags: None
*/
function function_5d3e918a(damageorigin)
{
	if(!isdefined(level.var_fe458fef))
	{
		return;
	}
	foreach(index, event in level.var_fe458fef)
	{
		if(event.damageorigin == damageorigin)
		{
			return index;
		}
	}
}

/*
	Name: function_58699cee
	Namespace: namespace_314165c4
	Checksum: 0x7E09FD77
	Offset: 0x5018
	Size: 0x2E4
	Parameters: 1
	Flags: None
*/
function function_58699cee(index)
{
	if(!isdefined(level.var_fe458fef) || !isdefined(level.var_fe458fef[index].attacker))
	{
		return;
	}
	weapon = level.var_fe458fef[index].weapon;
	damageorigin = level.var_fe458fef[index].damageorigin;
	var_921c264 = weapon.explosionradius;
	var_1c404e8 = var_921c264 * var_921c264;
	foreach(player in level.players)
	{
		if(!player util::isprop() || !isalive(player) || player function_791579c9(index))
		{
			continue;
		}
		distsq = distancesquared(damageorigin, player.origin);
		if(distsq <= var_1c404e8)
		{
			function_e896a36a(0);
			function_45534e6c(0);
			function_d08dcbaf(1);
			function_44a27dd6(0);
			damage = level.var_fe458fef[index].damage;
			attacker = level.var_fe458fef[index].attacker;
			meansofdeath = level.var_fe458fef[index].meansofdeath;
			attacker radiusdamage(damageorigin, var_921c264, damage, damage, attacker, meansofdeath, weapon);
			function_e896a36a(1);
			function_45534e6c(1);
			function_d08dcbaf(0);
			function_44a27dd6(1);
			break;
		}
	}
}

/*
	Name: function_e896a36a
	Namespace: namespace_314165c4
	Checksum: 0x7F0CC10D
	Offset: 0x5308
	Size: 0x170
	Parameters: 1
	Flags: None
*/
function function_e896a36a(var_319af7f5)
{
	foreach(player in level.players)
	{
		if(isdefined(player.prop))
		{
			if(var_319af7f5)
			{
				if(isdefined(player.prop.var_7ccb9924))
				{
					player.prop setcontents(player.prop.var_7ccb9924);
				}
				player.prop solid();
				continue;
			}
			if(!isdefined(player.prop.var_7ccb9924))
			{
				player.prop.var_7ccb9924 = player.prop setcontents(0);
			}
			else
			{
				player.prop setcontents(0);
			}
			player.prop notsolid();
		}
	}
}

/*
	Name: function_45534e6c
	Namespace: namespace_314165c4
	Checksum: 0x45A2A5C1
	Offset: 0x5480
	Size: 0x1BC
	Parameters: 1
	Flags: None
*/
function function_45534e6c(var_319af7f5)
{
	foreach(player in level.players)
	{
		if(isdefined(player.propclones))
		{
			foreach(clone in player.propclones)
			{
				if(isdefined(clone))
				{
					if(var_319af7f5)
					{
						if(isdefined(clone.var_fc18a70a))
						{
							clone setcontents(clone.var_fc18a70a);
						}
						clone solid();
						continue;
					}
					if(!isdefined(clone.var_fc18a70a))
					{
						clone.var_fc18a70a = clone setcontents(0);
					}
					else
					{
						clone setcontents(0);
					}
					clone notsolid();
				}
			}
		}
	}
}

/*
	Name: function_d08dcbaf
	Namespace: namespace_314165c4
	Checksum: 0x35570D82
	Offset: 0x5648
	Size: 0x130
	Parameters: 1
	Flags: None
*/
function function_d08dcbaf(var_319af7f5)
{
	foreach(player in level.players)
	{
		if(!player util::isprop() || !isalive(player))
		{
			continue;
		}
		if(var_319af7f5)
		{
			player setcontents(level.phsettings.var_b5f21379);
			player solid();
			continue;
		}
		player setcontents(0);
		player notsolid();
	}
}

/*
	Name: function_44a27dd6
	Namespace: namespace_314165c4
	Checksum: 0x5A99D47
	Offset: 0x5780
	Size: 0x130
	Parameters: 1
	Flags: None
*/
function function_44a27dd6(var_319af7f5)
{
	foreach(player in level.players)
	{
		if(!player prop::function_84793f03() || !isalive(player))
		{
			continue;
		}
		if(var_319af7f5)
		{
			player setcontents(level.phsettings.var_b5f21379);
			player solid();
			continue;
		}
		player setcontents(0);
		player notsolid();
	}
}

/*
	Name: function_d3b8a20e
	Namespace: namespace_314165c4
	Checksum: 0xC5F369D
	Offset: 0x58B8
	Size: 0x4E
	Parameters: 1
	Flags: None
*/
function function_d3b8a20e(damageorigin)
{
	index = function_5d3e918a(damageorigin);
	if(isdefined(index))
	{
		return self function_791579c9(index);
	}
	return 0;
}

/*
	Name: function_791579c9
	Namespace: namespace_314165c4
	Checksum: 0x271CE044
	Offset: 0x5910
	Size: 0xA8
	Parameters: 1
	Flags: None
*/
function function_791579c9(index)
{
	foreach(var_f21c4191 in level.var_fe458fef[index].players)
	{
		if(isdefined(var_f21c4191) && var_f21c4191 == self)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: safesetalpha
	Namespace: namespace_314165c4
	Checksum: 0xE07B936D
	Offset: 0x59C0
	Size: 0x2A
	Parameters: 2
	Flags: None
*/
function safesetalpha(hudelem, var_9c73f6bb)
{
	if(isdefined(hudelem))
	{
		hudelem.alpha = var_9c73f6bb;
	}
}

/*
	Name: propabilitykeysvisible
	Namespace: namespace_314165c4
	Checksum: 0xAEF4568A
	Offset: 0x59F8
	Size: 0x174
	Parameters: 2
	Flags: None
*/
function propabilitykeysvisible(visible, override)
{
	if(is_true(visible))
	{
		var_2aaefb47 = 1;
	}
	else
	{
		var_2aaefb47 = 0;
	}
	if(prop::useprophudserver() || is_true(override))
	{
		safesetalpha(self.changepropkey, var_2aaefb47);
		safesetalpha(self.spinpropkey, var_2aaefb47);
		safesetalpha(self.lockpropkey, var_2aaefb47);
		safesetalpha(self.matchslopekey, var_2aaefb47);
		safesetalpha(self.abilitykey, var_2aaefb47);
		safesetalpha(self.clonekey, var_2aaefb47);
		safesetalpha(self.zoomkey, var_2aaefb47);
		safesetalpha(self.var_8e3b5c8c, var_2aaefb47);
		if(!is_true(level.nopropsspectate))
		{
			safesetalpha(self.spectatekey, var_2aaefb47);
		}
	}
}

/*
	Name: function_2b14e8b1
	Namespace: namespace_314165c4
	Checksum: 0xD2BA5E34
	Offset: 0x5B78
	Size: 0xE2
	Parameters: 0
	Flags: None
*/
function function_2b14e8b1()
{
	if(!isdefined(self.var_b251eb4f))
	{
		self.var_b251eb4f = 1;
	}
	else
	{
		self.var_b251eb4f = !self.var_b251eb4f;
	}
	if(self.var_b251eb4f)
	{
		self clientfield::set_to_player("PROP.hide_prop", 1);
		if(prop::useprophudserver())
		{
			self.var_8e3b5c8c.label = #"mp_ph_showprop";
		}
	}
	else
	{
		self clientfield::set_to_player("PROP.hide_prop", 0);
		if(prop::useprophudserver())
		{
			self.var_8e3b5c8c.label = #"mp_ph_hideprop";
		}
	}
}

