#using scripts\core_common\util_shared.gsc;
#using scripts\killstreaks\killstreakrules_shared.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\killstreaks\killstreak_bundles.gsc;
#using scripts\killstreaks\helicopter_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace ir_strobe;

/*
	Name: init_shared
	Namespace: ir_strobe
	Checksum: 0xAB30E5BF
	Offset: 0x170
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function init_shared()
{
	if(!isdefined(level.var_860c22f0))
	{
		level.var_860c22f0 = {};
		clientfield::register("toplayer", "marker_state", 1, 2, "int");
	}
}

/*
	Name: function_8806675d
	Namespace: ir_strobe
	Checksum: 0x9CEE4994
	Offset: 0x1D0
	Size: 0x58
	Parameters: 2
	Flags: Linked
*/
function function_8806675d(var_45e9e49f, activatefunc)
{
	if(!isdefined(level.var_d2c88dc5))
	{
		level.var_d2c88dc5 = [];
	}
	if(isdefined(level.var_d2c88dc5[var_45e9e49f]))
	{
		return;
	}
	level.var_d2c88dc5[var_45e9e49f] = activatefunc;
}

/*
	Name: function_c5d20b5c
	Namespace: ir_strobe
	Checksum: 0xDA45DB59
	Offset: 0x230
	Size: 0x8E
	Parameters: 4
	Flags: Linked
*/
function function_c5d20b5c(owner, context, position, ksweapon)
{
	self sethintstring("");
	if(isdefined(level.var_d2c88dc5[ksweapon.rootweapon.name]))
	{
		[[level.var_d2c88dc5[ksweapon.rootweapon.name]]](owner, context, position);
	}
}

/*
	Name: function_f625256f
	Namespace: ir_strobe
	Checksum: 0xA0A14409
	Offset: 0x2C8
	Size: 0x24C
	Parameters: 2
	Flags: Linked
*/
function function_f625256f(killstreak_id, context)
{
	self notify("2e9c03808bbcc5d7");
	self endon("2e9c03808bbcc5d7");
	player = self;
	self endon(#"disconnect", #"spawned_player");
	var_9eb4725b = level.weaponnone;
	currentweapon = self getcurrentweapon();
	prevweapon = currentweapon;
	if(currentweapon.issupplydropweapon)
	{
		var_9eb4725b = currentweapon;
	}
	if(var_9eb4725b.isgrenadeweapon)
	{
		trigger_event = "grenade_fire";
	}
	else
	{
		trigger_event = "weapon_fired";
	}
	player sethintstring("MP/DEPLOY_MARKER");
	self thread function_ef6c4a46(killstreak_id, trigger_event, var_9eb4725b, context);
	while(true)
	{
		player allowmelee(0);
		notifystring = undefined;
		notifystring = self waittill(#"weapon_change", trigger_event, #"disconnect", #"spawned_player");
		player allowmelee(1);
		if(trigger_event != "none")
		{
			if(notifystring._notify != trigger_event)
			{
				cleanup(context, player);
				return false;
			}
		}
		if(isdefined(player.markerposition))
		{
			break;
		}
	}
	self notify(#"trigger_weapon_shutdown");
	if(var_9eb4725b == level.weaponnone)
	{
		cleanup(context, player);
		return false;
	}
	return true;
}

/*
	Name: cleanup
	Namespace: ir_strobe
	Checksum: 0x72CE9DF1
	Offset: 0x520
	Size: 0x112
	Parameters: 2
	Flags: Linked
*/
function cleanup(context, player)
{
	if(isdefined(context) && isdefined(context.marker))
	{
		context.marker delete();
		context.marker = undefined;
		if(isdefined(context.markerfxhandle))
		{
			context.markerfxhandle delete();
			context.markerfxhandle = undefined;
		}
		if(isdefined(player))
		{
			player clientfield::set_to_player("marker_state", 0);
			player sethintstring("");
		}
	}
	if(isdefined(context) && isdefined(context.var_597ac911) && isdefined(context.var_43dc1011))
	{
		[[context.var_597ac911]](context);
		context.var_597ac911 = undefined;
	}
}

/*
	Name: markercleanupthread
	Namespace: ir_strobe
	Checksum: 0xB59C59D6
	Offset: 0x640
	Size: 0xDC
	Parameters: 1
	Flags: Linked
*/
function markercleanupthread(context)
{
	self notify("1cdf09967b6e7734");
	self endon("1cdf09967b6e7734");
	player = self;
	player waittill(#"death", #"disconnect", #"joined_team", #"joined_spectators", #"cleanup_marker", #"changed_specialist");
	if(player flag::get(#"marking_done"))
	{
		return;
	}
	cleanup(context, player);
}

/*
	Name: markerupdatethread
	Namespace: ir_strobe
	Checksum: 0x534C1347
	Offset: 0x728
	Size: 0x6BE
	Parameters: 1
	Flags: Linked
*/
function markerupdatethread(context)
{
	player = self;
	player endon(#"hash_27be2db04a0908d5", #"spawned_player", #"disconnect", #"weapon_change", #"death");
	markermodel = spawn("script_model", (0, 0, 0));
	context.marker = markermodel;
	if(isdefined(level.var_14151f16))
	{
		[[level.var_14151f16]](markermodel, 0);
	}
	player thread markercleanupthread(context);
	while(true)
	{
		if(player flag::get(#"marking_done"))
		{
			break;
		}
		ksbundle = killstreaks::get_script_bundle(context);
		minrange = 20;
		maxrange = 500;
		if(isdefined(ksbundle) && isdefined(ksbundle.var_3307f79d))
		{
			minrange = ksbundle.var_3307f79d;
			maxrange = ksbundle.var_ffbb43eb;
		}
		forwardvector = vectorscale(anglestoforward(player getplayerangles()), maxrange);
		mask = 1;
		if(isdefined(context.tracemask))
		{
			mask = context.tracemask;
		}
		angles = player getplayerangles();
		if(is_true(level.var_4970b0af))
		{
			mask = 1;
			radius = 10;
			eyepos = player geteye();
			forwardvector = vectorscale(anglestoforward(angles), 300);
			results = bullettrace(eyepos, eyepos + forwardvector, 0, player, 1);
			if(results[#"fraction"] >= 1)
			{
				results = bullettrace(results[#"position"], results[#"position"] + (vectorscale((0, 0, -1), 1000)), 0, player, 1);
			}
		}
		else
		{
			weapon = getweapon("ir_strobe");
			eye = player getweaponmuzzlepoint();
			results = function_e6ba3ec9(weapon, eye, angles, player);
		}
		markermodel.origin = results[#"position"] + vectorscale((0, 0, 1), 6);
		node = helicopter::getvalidrandomstartnode(markermodel.origin);
		var_6aa266d6 = undefined;
		if(isdefined(node))
		{
			var_6aa266d6 = node.origin;
		}
		tooclose = distancesquared(markermodel.origin, player.origin) < (minrange * minrange);
		waterheight = getwaterheight(markermodel.origin);
		inwater = markermodel.origin[2] < waterheight || results[#"surfacetype"] === "water";
		if(inwater)
		{
			markermodel.origin = (markermodel.origin[0], markermodel.origin[1], waterheight + 20);
		}
		if(isdefined(var_6aa266d6) && !tooclose && !inwater && isdefined(context.islocationgood) && [[context.islocationgood]](markermodel.origin, context))
		{
			player.markerposition = markermodel.origin;
			player clientfield::set_to_player("marker_state", 1);
			player function_bf191832(1, markermodel.origin, markermodel.angles);
		}
		else
		{
			player clientfield::set_to_player("marker_state", 2);
			iskillstreakallowed = 1;
			if(isdefined(context) && isdefined(context.killstreakref))
			{
				if(!self killstreakrules::iskillstreakallowed(context.killstreakref, self.team, 1))
				{
					iskillstreakallowed = 0;
				}
			}
			if(getdvarint(#"hash_7ccc40e85206e0a5", 1))
			{
				player.markerposition = markermodel.origin;
				if(iskillstreakallowed)
				{
					player function_bf191832(1, markermodel.origin, markermodel.angles);
				}
				else
				{
					player.markerposition = undefined;
					player function_bf191832(0, (0, 0, 0), (0, 0, 0));
				}
			}
			else
			{
				player.markerposition = undefined;
				player function_bf191832(0, (0, 0, 0), (0, 0, 0));
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_ef6c4a46
	Namespace: ir_strobe
	Checksum: 0xB10892BC
	Offset: 0xDF0
	Size: 0x574
	Parameters: 4
	Flags: Linked
*/
function function_ef6c4a46(killstreak_id, trigger_event, supplydropweapon, context)
{
	player = self;
	self notify(#"hash_27be2db04a0908d5");
	self endon(#"hash_27be2db04a0908d5", #"spawned_player", #"disconnect", #"weapon_change");
	team = self.team;
	if(isdefined(killstreak_id) && killstreak_id == -1)
	{
		return;
	}
	context.killstreak_id = killstreak_id;
	player flag::clear(#"marking_done");
	self thread checkforemp();
	if(trigger_event != "none")
	{
		self thread markerupdatethread(context);
	}
	self thread cleanupwatcherondeath(killstreak_id, supplydropweapon);
	while(true)
	{
		waitframe(1);
		if(trigger_event == "none")
		{
			weapon = supplydropweapon;
			weapon_instance = weapon;
		}
		else
		{
			waitresult = undefined;
			waitresult = self waittill(trigger_event);
			weapon = waitresult.weapon;
			weapon_instance = waitresult.projectile;
		}
		if(isdefined(weapon_instance))
		{
			if(isdefined(level.var_14151f16))
			{
				[[level.var_14151f16]](weapon_instance, 0);
			}
		}
		if(isdefined(weapon_instance))
		{
			if(isdefined(level.var_48c30195))
			{
				[[level.var_48c30195]](weapon_instance, 0);
			}
		}
		issupplydropweapon = 1;
		if(trigger_event == "grenade_fire")
		{
			issupplydropweapon = weapon.issupplydropweapon;
		}
		if(isdefined(self) && issupplydropweapon)
		{
			if(isdefined(context))
			{
				var_9fdd755d = !isdefined(player.markerposition) || (!(isdefined(context.islocationgood) && [[context.islocationgood]](player.markerposition, context)));
				if(!getdvarint(#"hash_7ccc40e85206e0a5", 1))
				{
					if(var_9fdd755d)
					{
						if(isdefined(level.killstreakcorebundle.ksinvalidlocationsound))
						{
							player playsoundtoplayer(level.killstreakcorebundle.ksinvalidlocationsound, player);
						}
						if(isdefined(level.killstreakcorebundle.ksinvalidlocationstring))
						{
							player iprintlnbold(level.killstreakcorebundle.ksinvalidlocationstring);
						}
						continue;
					}
					if(isdefined(context.validlocationsound))
					{
						player playsoundtoplayer(context.validlocationsound, player);
					}
				}
				else
				{
					if(var_9fdd755d)
					{
						if(isdefined(level.killstreakcorebundle.ksinvalidlocationsound))
						{
							player playsoundtoplayer(level.killstreakcorebundle.ksinvalidlocationsound, player);
						}
					}
					else if(isdefined(context.validlocationsound))
					{
						player playsoundtoplayer(context.validlocationsound, player);
					}
				}
				ksbundle = killstreaks::get_script_bundle(context.killstreaktype);
				if(isdefined(ksbundle))
				{
					context.time = ksbundle.kstime;
					context.fx_name = ksbundle.var_3af79d7e;
				}
				var_ca7e0817 = player.markerposition;
				player flag::set(#"marking_done");
				player clientfield::set_to_player("marker_state", 0);
				self thread function_c5d20b5c(self, context, var_ca7e0817, supplydropweapon);
			}
			self killstreaks::switch_to_last_non_killstreak_weapon();
		}
		break;
	}
	player flag::set(#"marking_done");
	if(isdefined(supplydropweapon) && isdefined(context.killstreakref))
	{
		self killstreakrules::iskillstreakallowed(context.killstreakref, self.team);
	}
	player clientfield::set_to_player("marker_state", 0);
}

/*
	Name: cleanupwatcherondeath
	Namespace: ir_strobe
	Checksum: 0x50041F51
	Offset: 0x1370
	Size: 0xCE
	Parameters: 2
	Flags: Linked
*/
function cleanupwatcherondeath(killstreak_id, var_b57ab85c)
{
	player = self;
	self endon(#"disconnect", #"supplydropwatcher", #"trigger_weapon_shutdown", #"spawned_player", #"weapon_change");
	self waittill(#"death", #"joined_team", #"joined_spectators", #"changed_specialist");
	self notify(#"cleanup_marker");
}

/*
	Name: checkforemp
	Namespace: ir_strobe
	Checksum: 0x480F83A0
	Offset: 0x1448
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function checkforemp()
{
	self endon(#"supplydropwatcher", #"spawned_player", #"disconnect", #"weapon_change", #"death", #"trigger_weapon_shutdown");
	self waittill(#"emp_jammed");
	self killstreaks::switch_to_last_non_killstreak_weapon();
}

/*
	Name: function_cb63f633
	Namespace: ir_strobe
	Checksum: 0x90419FBA
	Offset: 0x14E0
	Size: 0xF4
	Parameters: 1
	Flags: Event
*/
event function_cb63f633(eventstruct)
{
	if(!isdefined(level.var_d2c88dc5))
	{
		return;
	}
	if(!isplayer(self))
	{
		return;
	}
	grenade = eventstruct.projectile;
	if(grenade util::ishacked())
	{
		return;
	}
	weapon = eventstruct.weapon;
	if(!isdefined(level.var_d2c88dc5[weapon.rootweapon.name]))
	{
		return;
	}
	if(isdefined(self.markerposition))
	{
		grenade thread function_d5ca3f62(self);
	}
	else
	{
		grenade notify(#"death");
		waittillframeend();
		grenade delete();
	}
}

/*
	Name: function_d5ca3f62
	Namespace: ir_strobe
	Checksum: 0x8D4D79DA
	Offset: 0x15E0
	Size: 0x17C
	Parameters: 1
	Flags: Linked
*/
function function_d5ca3f62(player)
{
	self endon(#"death");
	self.team = player.team;
	self waittill(#"rolling");
	if(!isdefined(player))
	{
		return;
	}
	player notify(#"strobe_marked");
	if(!isdefined(self))
	{
		return;
	}
	fx_name = undefined;
	if(isdefined(self.weapon))
	{
		killstreak_type = killstreaks::get_killstreak_for_weapon(self.weapon);
		killstreak_bundle = killstreaks::get_script_bundle(killstreak_type);
		fx_name = killstreak_bundle.var_3af79d7e;
	}
	self function_2cbae477(fx_name);
	player waittilltimeout(90, #"strobe_marked", #"payload_delivered", #"payload_fail", #"disconnect");
	if(!isdefined(self))
	{
		return;
	}
	self.sndent delete();
	self delete();
}

/*
	Name: function_2cbae477
	Namespace: ir_strobe
	Checksum: 0x577DE608
	Offset: 0x1768
	Size: 0xE4
	Parameters: 2
	Flags: Linked, Private
*/
function private function_2cbae477(var_babebdbc, var_76361c1a)
{
	if(!isdefined(var_babebdbc))
	{
		var_babebdbc = #"weapon/fx8_equip_swat_smk_signal";
	}
	if(!isdefined(var_76361c1a))
	{
		var_76361c1a = "tag_flash";
	}
	playfxontag(var_babebdbc, self, var_76361c1a);
	self playsound(#"hash_6c91edfde8408dad");
	self.sndent = spawn("script_origin", self.origin);
	self.sndent linkto(self);
	self.sndent playloopsound(#"hash_63e34e1932c25073");
}

/*
	Name: function_284b1d4c
	Namespace: ir_strobe
	Checksum: 0x385EA807
	Offset: 0x1858
	Size: 0xC8
	Parameters: 5
	Flags: None
*/
function function_284b1d4c(origin, model, timeout, var_babebdbc, var_76361c1a)
{
	if(!isdefined(timeout))
	{
		timeout = undefined;
	}
	if(!isdefined(var_babebdbc))
	{
		var_babebdbc = undefined;
	}
	if(!isdefined(var_76361c1a))
	{
		var_76361c1a = undefined;
	}
	strobe = spawn("script_model", origin);
	strobe setmodel(model);
	strobe function_2cbae477(var_babebdbc, var_76361c1a);
	strobe thread function_f61c0c1(timeout);
	return strobe;
}

/*
	Name: function_f61c0c1
	Namespace: ir_strobe
	Checksum: 0x968CF213
	Offset: 0x1928
	Size: 0xA4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f61c0c1(timeout)
{
	if(isdefined(timeout))
	{
		self waittilltimeout(timeout, #"death", #"strobe_stop");
	}
	else
	{
		self waittill(#"death", #"strobe_stop");
	}
	if(!isdefined(self))
	{
		return;
	}
	self.sndent delete();
	self delete();
}

