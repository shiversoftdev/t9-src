#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\globallogic\globallogic_score.gsc;
#using script_1cc417743d7c262d;
#using scripts\core_common\influencers_shared.gsc;
#using scripts\weapons\weaponobjects.gsc;
#using scripts\weapons\deployable.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\damagefeedback_shared.gsc;
#using scripts\core_common\damage.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\battlechatter.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using script_4721de209091b1a6;
#using scripts\killstreaks\killstreak_bundles.gsc;
#using scripts\abilities\ability_player.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace gadget_smart_cover;

/*
	Name: function_949cc599
	Namespace: gadget_smart_cover
	Checksum: 0xC98780F4
	Offset: 0x360
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_949cc599()
{
	level notify(-539718133);
}

#namespace smart_cover;

/*
	Name: init_shared
	Namespace: smart_cover
	Checksum: 0xB71596F1
	Offset: 0x380
	Size: 0x53C
	Parameters: 0
	Flags: Linked
*/
function init_shared()
{
	level.var_5101157d = spawnstruct();
	if(sessionmodeismultiplayergame())
	{
		if(getgametypesetting(#"competitivesettings") === 1)
		{
			level.var_5101157d.bundle = getscriptbundle(#"hash_1df8cd70e8310c57");
		}
		else
		{
			level.var_5101157d.bundle = getscriptbundle(#"hash_25c242b3e86ced05");
		}
	}
	else
	{
		if(sessionmodeiswarzonegame())
		{
			level.var_5101157d.bundle = getscriptbundle(#"smartcover_settings_wz");
		}
		else if(sessionmodeiscampaigngame())
		{
			level.var_5101157d.bundle = getscriptbundle(#"hash_25a046b3e8500d6b");
		}
	}
	level.var_5101157d.var_ac3f76c7 = "smart_cover_objective_full";
	level.var_5101157d.var_546a220c = "smart_cover_objective_open";
	level.var_5101157d.var_8d86ade8 = getweapon("ability_smart_cover");
	level.var_5101157d.var_4115bb3a = getweapon(#"hash_34575452eba07c65");
	level.var_5101157d.var_d6a27a84 = [];
	setupdvars();
	ability_player::register_gadget_should_notify(27, 1);
	weaponobjects::function_e6400478(#"ability_smart_cover", &function_21e722f6, 1);
	callback::on_spawned(&on_player_spawned);
	level.var_5101157d.var_f115c746 = [];
	deployable::register_deployable(level.var_5101157d.var_8d86ade8, &function_b7f5b1cc, &function_a47ce1c2, undefined, undefined, 1);
	level.var_5101157d.var_357db326 = 10000;
	level.var_5101157d.var_ff1a491d = level.var_5101157d.bundle.var_76d79155 * level.var_5101157d.bundle.var_76d79155;
	if(!sessionmodeiswarzonegame())
	{
		globallogic_score::function_5a241bd8(level.var_5101157d.var_8d86ade8, &function_92112113);
		globallogic_score::function_86f90713(level.var_5101157d.var_8d86ade8, &function_92112113);
	}
	clientfield::register_clientuimodel("hudItems.smartCoverState", 1, 1, "int");
	clientfield::register("scriptmover", "smartcover_placed", 1, 5, "float");
	clientfield::register("scriptmover", "start_smartcover_microwave", 1, 1, "int");
	callback::on_end_game(&on_end_game);
	setdvar(#"hash_4d17057924212aa9", 20);
	setdvar(#"hash_686a676b28ae0af4", 0);
	setdvar(#"hash_7f893c50ae5356c8", -15);
	setdvar(#"hash_70ce44b2b0b4005", 30);
	setdvar(#"hash_477cc29b988c0b75", -10);
	setdvar(#"hash_41cfd0e34c53ef02", 30);
	callback::on_finalize_initialization(&function_1c601b99);
}

/*
	Name: function_1c601b99
	Namespace: smart_cover
	Checksum: 0x6FF1E86B
	Offset: 0x8C8
	Size: 0x80
	Parameters: 0
	Flags: Linked
*/
function function_1c601b99()
{
	if(isdefined(level.var_1b900c1d))
	{
		[[level.var_1b900c1d]](level.var_5101157d.var_8d86ade8, &function_bff5c062);
	}
	if(isdefined(level.var_a5dacbea))
	{
		[[level.var_a5dacbea]](level.var_5101157d.var_8d86ade8, &function_127fb8f3);
	}
}

/*
	Name: function_716c6c70
	Namespace: smart_cover
	Checksum: 0x3174DF7A
	Offset: 0x950
	Size: 0xE4
	Parameters: 0
	Flags: Linked
*/
function function_716c6c70()
{
	self endon(#"death", #"cancel_timeout");
	util::wait_network_frame(1);
	if(isdefined(self) && self getentitytype() == 6)
	{
		self clientfield::set("start_smartcover_microwave", 0);
	}
	util::wait_network_frame(1);
	if(isdefined(self) && self getentitytype() == 6)
	{
		self clientfield::set("start_smartcover_microwave", 1);
	}
}

/*
	Name: function_bff5c062
	Namespace: smart_cover
	Checksum: 0x5BA99230
	Offset: 0xA40
	Size: 0x31A
	Parameters: 2
	Flags: Linked
*/
function function_bff5c062(smartcover, attackingplayer)
{
	original_owner = smartcover.owner;
	original_owner weaponobjects::hackerremoveweapon(smartcover);
	smartcover notify(#"hacked");
	if(isdefined(smartcover.grenade))
	{
		smartcover.grenade notify(#"hacked");
	}
	smartcover notify(#"cancel_timeout");
	function_375cfa56(smartcover, original_owner);
	smartcover.owner = attackingplayer;
	smartcover setowner(attackingplayer);
	smartcover.team = attackingplayer.team;
	if(isdefined(smartcover.var_40bfd9cf))
	{
		smartcover influencers::remove_influencer(smartcover.var_40bfd9cf);
	}
	if(isdefined(smartcover.var_2d045452) && isdefined(original_owner))
	{
		watcher = original_owner weaponobjects::getweaponobjectwatcherbyweapon(smartcover.var_2d045452.weapon);
		if(isdefined(watcher))
		{
			smartcover.var_2d045452 thread weaponobjects::function_6d8aa6a0(attackingplayer, watcher);
		}
	}
	smartcover.var_40bfd9cf = smartcover influencers::create_entity_enemy_influencer("turret_close", attackingplayer.team);
	smartcover thread function_37f1dcd1();
	array::add(attackingplayer.smartcover.var_19e1ea69, smartcover);
	var_26c9fcc2 = function_57f553e9(attackingplayer.smartcover.var_19e1ea69, level.var_5101157d.bundle.var_a0b69d8b);
	if(isdefined(var_26c9fcc2))
	{
		var_26c9fcc2 function_2a494565(1);
	}
	smartcover thread function_716c6c70();
	if(isdefined(level.var_f1edf93f))
	{
		var_eb79e7c3 = [[level.var_f1edf93f]]();
		smartcover thread function_b397b517(var_eb79e7c3);
	}
	if(is_true(smartcover.smartcoverjammed))
	{
		smartcover startmicrowave();
		smartcover.smartcoverjammed = 0;
		if(isdefined(level.var_fc1bbaef))
		{
			[[level.var_fc1bbaef]](smartcover);
		}
		smartcover.smartcoverjammed = 0;
	}
}

/*
	Name: on_end_game
	Namespace: smart_cover
	Checksum: 0x5F13057D
	Offset: 0xD68
	Size: 0x1F8
	Parameters: 0
	Flags: Linked
*/
function on_end_game()
{
	if(!isdefined(level.var_5101157d) || !isdefined(level.var_5101157d.var_8d86ade8))
	{
		return;
	}
	foreach(player in level.players)
	{
		var_9d063af9 = player gadgetgetslot(level.var_5101157d.var_8d86ade8);
		player gadgetdeactivate(var_9d063af9, level.var_5101157d.var_8d86ade8);
		player function_48e08b4(var_9d063af9, level.var_5101157d.var_8d86ade8);
	}
	if(!isdefined(level.var_5101157d.var_f115c746))
	{
		return;
	}
	var_73137502 = arraycopy(level.var_5101157d.var_f115c746);
	foreach(smartcover in var_73137502)
	{
		if(!isdefined(smartcover))
		{
			continue;
		}
		smartcover function_2a494565(1);
	}
}

/*
	Name: setupdvars
	Namespace: smart_cover
	Checksum: 0xC96F0210
	Offset: 0xF68
	Size: 0x16C
	Parameters: 0
	Flags: Linked
*/
function setupdvars()
{
	setdvar(#"hash_4f4ce3cb18b004bc", 8);
	setdvar(#"hash_417afa70d515fba5", (isdefined(level.var_5101157d.bundle.var_76d79155) ? level.var_5101157d.bundle.var_76d79155 : 0));
	setdvar(#"hash_1d8eb304f5cf8033", 0);
	setdvar(#"hash_71f8bd4cd30de4b3", (isdefined(level.var_5101157d.bundle.var_e35fc674) ? level.var_5101157d.bundle.var_e35fc674 : 0));
	setdvar(#"hash_39a564d4801c4b2e", (isdefined(level.var_5101157d.bundle.var_1f0ae388) ? level.var_5101157d.bundle.var_1f0ae388 : 0));
}

/*
	Name: function_649f8cbe
	Namespace: smart_cover
	Checksum: 0x3FD05447
	Offset: 0x10E0
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function function_649f8cbe(func)
{
	level.onsmartcoverplaced = func;
}

/*
	Name: function_a9427b5c
	Namespace: smart_cover
	Checksum: 0x2E29A5EC
	Offset: 0x1108
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function function_a9427b5c(func)
{
	level.var_a430cceb = func;
}

/*
	Name: function_b397b517
	Namespace: smart_cover
	Checksum: 0xDE7401C1
	Offset: 0x1130
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function function_b397b517(var_84e5ee08)
{
	self endon(#"death", #"cancel_timeout");
	timeouttime = (isdefined(var_84e5ee08) ? var_84e5ee08 : level.var_5101157d.bundle.timeout);
	if((isdefined(timeouttime) ? timeouttime : 0) == 0)
	{
		return;
	}
	wait(timeouttime);
	if(isdefined(self))
	{
		self thread function_2a494565(1);
	}
}

/*
	Name: function_b11be5dc
	Namespace: smart_cover
	Checksum: 0xB1CD719A
	Offset: 0x11E8
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function function_b11be5dc()
{
	if(!isdefined(self.smartcover))
	{
		return;
	}
	for(index = self.smartcover.var_58e8b64d.size; index >= 0; index--)
	{
		smartcover = self.smartcover.var_58e8b64d[index];
		if(isdefined(smartcover))
		{
			smartcover function_2a494565(1);
		}
	}
}

/*
	Name: function_bd071599
	Namespace: smart_cover
	Checksum: 0x53003E20
	Offset: 0x1278
	Size: 0x384
	Parameters: 2
	Flags: Linked
*/
function function_bd071599(player, smartcover)
{
	level endon(#"game_ended");
	player notify(#"hash_53db5f084a244a94");
	player endon(#"hash_53db5f084a244a94");
	player endon(#"death", #"disconnect", #"joined_team", #"changed_specialist");
	smartcover endon(#"death");
	var_f5929597 = gettime() + (int((isdefined(level.var_5101157d.bundle.var_fee887dc) ? level.var_5101157d.bundle.var_fee887dc : 0) * 1000));
	player.var_622765b5 = 1;
	currenttime = gettime();
	timeelapsed = 0;
	while(var_f5929597 > gettime())
	{
		if(!player gamepadusedlast())
		{
			break;
		}
		if(!player offhandspecialbuttonpressed())
		{
			player clientfield::set_player_uimodel("huditems.abilityDelayProgress", 0);
			player.var_622765b5 = 0;
			return;
		}
		timeelapsed = gettime() - currenttime;
		var_1cf1ae8b = timeelapsed / (int((isdefined(level.var_5101157d.bundle.var_fee887dc) ? level.var_5101157d.bundle.var_fee887dc : 0) * 1000));
		player clientfield::set_player_uimodel("huditems.abilityDelayProgress", var_1cf1ae8b);
		waitframe(1);
	}
	player thread gestures::function_f3e2696f(player, level.var_5101157d.var_4115bb3a, undefined, 0.75, undefined, undefined, undefined);
	if(isdefined(level.var_5101157d.bundle.var_d47e600f))
	{
		smartcover playsound(level.var_5101157d.bundle.var_d47e600f);
	}
	player clientfield::set_player_uimodel("huditems.abilityHoldToActivate", 0);
	player clientfield::set_player_uimodel("huditems.abilityDelayProgress", 0);
	wait((isdefined(level.var_5101157d.bundle.detonationtime) ? level.var_5101157d.bundle.detonationtime : 0));
	player.var_622765b5 = 0;
	player.var_d3bf8986 = 1;
	smartcover function_2a494565(1);
}

/*
	Name: function_7ecb04ff
	Namespace: smart_cover
	Checksum: 0xAF703A22
	Offset: 0x1608
	Size: 0x426
	Parameters: 1
	Flags: Linked
*/
function function_7ecb04ff(player)
{
	level endon(#"game_ended");
	player notify(#"hash_51faf1a32d7e36b0");
	player endon(#"hash_51faf1a32d7e36b0");
	player endon(#"death", #"disconnect", #"joined_team", #"changed_specialist");
	while(true)
	{
		waitframe(1);
		while(level.inprematchperiod)
		{
			waitframe(1);
			continue;
		}
		if(!player hasweapon(level.var_5101157d.var_8d86ade8))
		{
			return;
		}
		var_9d063af9 = player gadgetgetslot(level.var_5101157d.var_8d86ade8);
		if(!isdefined(var_9d063af9) || var_9d063af9 == -1)
		{
			continue;
		}
		ammocount = player getammocount(level.var_5101157d.var_8d86ade8);
		gadgetpower = player gadgetpowerget(var_9d063af9);
		if(gadgetpower >= 100 || ammocount > 0)
		{
			player clientfield::set_player_uimodel("huditems.abilityHoldToActivate", 0);
			player clientfield::set_player_uimodel("hudItems.smartCoverState", 0);
			continue;
		}
		if(player.smartcover.var_19e1ea69.size == 0)
		{
			continue;
		}
		if((isdefined(level.var_5101157d.bundle.var_ad7084b4) ? level.var_5101157d.bundle.var_ad7084b4 : 0))
		{
			player clientfield::set_player_uimodel("huditems.abilityHoldToActivate", 2);
			player clientfield::set_player_uimodel("hudItems.smartCoverState", 1);
			if((isdefined(level.var_5101157d.bundle.var_ad7084b4) ? level.var_5101157d.bundle.var_ad7084b4 : 0) && player offhandspecialbuttonpressed() && (!isdefined(player.var_622765b5) || !player.var_622765b5) && !(isdefined(player.var_d3bf8986) ? player.var_d3bf8986 : 0))
			{
				foreach(smartcover in player.smartcover.var_58e8b64d)
				{
					if(!isdefined(smartcover))
					{
						continue;
					}
					smartcover thread function_bd071599(player, smartcover);
					break;
				}
			}
			player.var_d3bf8986 = 0;
		}
	}
}

/*
	Name: on_player_spawned
	Namespace: smart_cover
	Checksum: 0x36C12471
	Offset: 0x1A38
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	if(!isdefined(self.smartcover))
	{
		self.smartcover = spawnstruct();
		self.smartcover.var_58e8b64d = [];
		self.smartcover.var_19e1ea69 = [];
		self.smartcover.var_d5258d02 = [];
	}
	self clientfield::set_player_uimodel("huditems.abilityDelayProgress", 0);
	self.var_622765b5 = 0;
	self reset_being_microwaved();
}

/*
	Name: function_b7f5b1cc
	Namespace: smart_cover
	Checksum: 0xECB001DE
	Offset: 0x1AE0
	Size: 0x48
	Parameters: 3
	Flags: Linked
*/
function function_b7f5b1cc(origin, angles, player)
{
	if(isdefined(level.var_b57c1895))
	{
		return [[level.var_b57c1895]](origin, angles, player);
	}
	return 1;
}

/*
	Name: function_a47ce1c2
	Namespace: smart_cover
	Checksum: 0xA061D865
	Offset: 0x1B30
	Size: 0x1D0
	Parameters: 1
	Flags: Linked
*/
function function_a47ce1c2(player)
{
	var_b43e8dc2 = player function_287dcf4b(level.var_5101157d.bundle.var_63aab046, level.var_5101157d.bundle.maxwidth, 1, 1, level.var_5101157d.var_8d86ade8);
	player.smartcover.lastvalid = var_b43e8dc2;
	var_9e596670 = 0;
	if(isdefined(var_b43e8dc2) && isdefined(var_b43e8dc2.origin))
	{
		var_9e596670 = function_bf4c81d2(var_b43e8dc2.origin, level.var_5101157d.var_ff1a491d);
	}
	var_2b68b641 = function_54267517(var_b43e8dc2.origin);
	var_1e5ed37a = isdefined(var_b43e8dc2) && var_b43e8dc2.isvalid && !var_9e596670 && !var_2b68b641;
	if(var_1e5ed37a && (isdefined(var_b43e8dc2.width) ? var_b43e8dc2.width : 0) >= level.var_5101157d.bundle.maxwidth)
	{
		player function_bf191832(var_1e5ed37a, var_b43e8dc2.origin, var_b43e8dc2.angles);
	}
	else
	{
		player function_bf191832(var_1e5ed37a, (0, 0, 0), (0, 0, 0));
	}
	return var_b43e8dc2;
}

/*
	Name: function_408a9ea8
	Namespace: smart_cover
	Checksum: 0x3A411164
	Offset: 0x1D08
	Size: 0xE8
	Parameters: 1
	Flags: Linked
*/
function function_408a9ea8(var_bf2bf1a)
{
	var_bf2bf1a endon(#"death");
	var_bf2bf1a useanimtree("generic");
	var_bf2bf1a setanim(level.var_5101157d.bundle.deployanim);
	animtime = 0;
	while(animtime < 1)
	{
		var_bf2bf1a clientfield::set("smartcover_placed", 1 - animtime);
		animtime = var_bf2bf1a getanimtime(level.var_5101157d.bundle.deployanim);
		waitframe(1);
	}
}

/*
	Name: function_548a710a
	Namespace: smart_cover
	Checksum: 0xF6CAF06C
	Offset: 0x1DF8
	Size: 0x2F8
	Parameters: 1
	Flags: None
*/
function function_548a710a(traceresults)
{
	if(!traceresults.var_e2543923 && !traceresults.var_e18fd6c3)
	{
		return traceresults.origin;
	}
	halfwidth = level.var_5101157d.bundle.maxwidth * 0.5;
	var_93cd60ae = halfwidth * halfwidth;
	var_b80b6889 = distance2d(traceresults.origin, traceresults.var_c0e006dc);
	var_65ea35de = distance2d(traceresults.origin, traceresults.var_44cf251d);
	if(traceresults.var_e2543923 && traceresults.var_e18fd6c3)
	{
		var_a5b1e71f = traceresults.var_c0e006dc;
		pointleft = traceresults.var_44cf251d;
	}
	else
	{
		if(traceresults.var_e2543923 && var_b80b6889 < halfwidth)
		{
			var_a5b1e71f = traceresults.var_c0e006dc;
			directionleft = vectornormalize(traceresults.var_44cf251d - traceresults.var_c0e006dc);
			pointleft = traceresults.var_c0e006dc + (level.var_5101157d.bundle.maxwidth * directionleft);
		}
		else
		{
			if(traceresults.var_e2543923 && var_b80b6889 >= halfwidth)
			{
				return traceresults.origin;
			}
			if(traceresults.var_e18fd6c3 && var_65ea35de < halfwidth)
			{
				pointleft = traceresults.var_44cf251d;
				directionright = vectornormalize(traceresults.var_c0e006dc - traceresults.var_44cf251d);
				var_a5b1e71f = traceresults.var_44cf251d + (level.var_5101157d.bundle.maxwidth * directionright);
			}
			else if(traceresults.var_e18fd6c3 && var_65ea35de >= halfwidth)
			{
				return traceresults.origin;
			}
		}
	}
	direction = vectornormalize(var_a5b1e71f - pointleft);
	origin = (pointleft[0], pointleft[1], traceresults.origin[2]) + ((level.var_5101157d.bundle.maxwidth * 0.5) * direction);
	return origin;
}

/*
	Name: function_3b96637
	Namespace: smart_cover
	Checksum: 0x64C0D14A
	Offset: 0x20F8
	Size: 0x38C
	Parameters: 2
	Flags: Linked
*/
function function_3b96637(watcher, owner)
{
	self endon(#"death");
	player = owner;
	self.canthack = 1;
	self.delete_on_death = 1;
	self hide();
	if(!isdefined(player.smartcover.lastvalid) || !player.smartcover.lastvalid.isvalid)
	{
		player deployable::function_416f03e6(level.var_5101157d.var_8d86ade8);
		return;
	}
	var_bf2bf1a = player createsmartcover(watcher, self, player.smartcover.lastvalid.var_83050ca1, player.smartcover.lastvalid.angles, 1);
	var_bf2bf1a.var_48d842c3 = 1;
	var_bf2bf1a.var_515d6dda = 1;
	var_bf2bf1a.angles = player.angles;
	var_bf2bf1a.var_8120c266 = [];
	var_bf2bf1a.var_9a3bd50f = 0;
	array::add(player.smartcover.var_19e1ea69, var_bf2bf1a);
	var_26c9fcc2 = function_57f553e9(player.smartcover.var_19e1ea69, level.var_5101157d.bundle.var_a0b69d8b);
	if(isdefined(var_26c9fcc2))
	{
		var_26c9fcc2 function_2a494565(1);
	}
	if(isdefined(level.onsmartcoverplaced))
	{
		owner [[level.onsmartcoverplaced]](self);
	}
	if(isdefined(level.var_5101157d.bundle.deployanim))
	{
		thread function_408a9ea8(var_bf2bf1a);
	}
	if((isdefined(level.var_5101157d.bundle.var_ad7084b4) ? level.var_5101157d.bundle.var_ad7084b4 : 0))
	{
		player clientfield::set_player_uimodel("huditems.abilityHoldToActivate", 2);
	}
	var_bf2bf1a.var_40bfd9cf = var_bf2bf1a influencers::create_entity_enemy_influencer("turret_close", owner.team);
	var_bf2bf1a util::make_sentient();
	if(isdefined(level.var_5101157d.var_8d86ade8.var_414fa79e))
	{
		player playrumbleonentity(level.var_5101157d.var_8d86ade8.var_414fa79e);
	}
	thread function_7ecb04ff(player);
	var_bf2bf1a thread function_670cd4a3();
	var_bf2bf1a thread function_b397b517();
}

/*
	Name: function_670cd4a3
	Namespace: smart_cover
	Checksum: 0x23D42C06
	Offset: 0x2490
	Size: 0x80
	Parameters: 0
	Flags: Linked
*/
function function_670cd4a3()
{
	self endon(#"death");
	self.var_19fde5b7 = [];
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"grenade_stuck");
		if(isdefined(waitresult.projectile))
		{
			array::add(self.var_19fde5b7, waitresult.projectile);
		}
	}
}

/*
	Name: function_21e722f6
	Namespace: smart_cover
	Checksum: 0xB8E5DECF
	Offset: 0x2518
	Size: 0x5A
	Parameters: 1
	Flags: Linked
*/
function function_21e722f6(watcher)
{
	watcher.watchforfire = 1;
	watcher.onspawn = &function_3b96637;
	watcher.var_994b472b = &function_46f4e542;
	watcher.var_10efd558 = "switched_field_upgrade";
}

/*
	Name: function_46f4e542
	Namespace: smart_cover
	Checksum: 0x18BBC2A8
	Offset: 0x2580
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_46f4e542(player)
{
	if(isdefined(self.smartcover))
	{
		self.smartcover thread function_2a494565(1);
	}
}

/*
	Name: function_37f1dcd1
	Namespace: smart_cover
	Checksum: 0xF0472026
	Offset: 0x25C0
	Size: 0xBC
	Parameters: 0
	Flags: Linked
*/
function function_37f1dcd1()
{
	level endon(#"game_ended");
	self.owner endon(#"disconnect", #"joined_team", #"changed_specialist", #"hacked");
	self endon(#"hash_5de1fc3780ea0eaa");
	waitresult = undefined;
	waitresult = self waittill(#"death");
	if(!isdefined(self))
	{
		return;
	}
	self thread onkilled(waitresult);
}

/*
	Name: ondamage
	Namespace: smart_cover
	Checksum: 0x49E46616
	Offset: 0x2688
	Size: 0xF8
	Parameters: 0
	Flags: Linked
*/
function ondamage()
{
	self endon(#"death");
	level endon(#"game_ended");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"damage");
		if(isdefined(waitresult.attacker) && isplayer(waitresult.attacker))
		{
			if(waitresult.amount > 0 && damagefeedback::dodamagefeedback(waitresult.weapon, waitresult.attacker))
			{
				waitresult.attacker damagefeedback::update(waitresult.mod, waitresult.inflictor, undefined, waitresult.weapon, self);
			}
		}
	}
}

/*
	Name: function_375cfa56
	Namespace: smart_cover
	Checksum: 0x28A83EC5
	Offset: 0x2788
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function function_375cfa56(smartcover, owner)
{
	if(isdefined(owner))
	{
		arrayremovevalue(owner.smartcover.var_19e1ea69, smartcover);
	}
}

/*
	Name: function_2a494565
	Namespace: smart_cover
	Checksum: 0x37DAC2DD
	Offset: 0x27D8
	Size: 0x544
	Parameters: 1
	Flags: Linked
*/
function function_2a494565(isselfdestruct)
{
	smartcover = self;
	smartcover notify(#"hash_5de1fc3780ea0eaa");
	smartcover clientfield::set("enemyequip", 0);
	smartcover clientfield::set("friendlyequip", 0);
	if(isdefined(smartcover.objectiveid))
	{
		objective_delete(smartcover.objectiveid);
		gameobjects::release_obj_id(smartcover.objectiveid);
	}
	smartcover function_9813d292();
	if(isdefined(level.var_5101157d.bundle.var_35fbc280))
	{
		if(is_true(isselfdestruct))
		{
			var_415135a0 = level.var_5101157d.bundle.var_28811698;
			var_72db9941 = level.var_5101157d.bundle.var_5493f8b0;
		}
		else
		{
			var_415135a0 = level.var_5101157d.bundle.var_35fbc280;
			var_72db9941 = level.var_5101157d.bundle.var_b3756378;
		}
		var_b0e81be9 = (isdefined(self gettagorigin("tag_cover_base_d0")) ? self gettagorigin("tag_cover_base_d0") : self.origin);
		var_505e3308 = (isdefined(self gettagangles("tag_cover_base_d0")) ? self gettagangles("tag_cover_base_d0") : self.angles);
		var_8fec56c4 = anglestoforward(var_505e3308);
		var_61753233 = anglestoup(var_505e3308);
		playfx(var_415135a0, var_b0e81be9, var_8fec56c4, var_61753233);
		if(isdefined(var_72db9941))
		{
			smartcover playsound(var_72db9941);
		}
	}
	if(isdefined(level.var_5101157d.bundle.var_bb6c29b4) && isdefined(self.var_d02ddb8e) && self.var_d02ddb8e == getweapon(#"shock_rifle"))
	{
		playfx(level.var_5101157d.bundle.var_bb6c29b4, smartcover.origin);
	}
	removeindex = -1;
	arrayremovevalue(level.var_5101157d.var_f115c746, smartcover);
	if(isdefined(smartcover.owner))
	{
		arrayremovevalue(smartcover.owner.smartcover.var_58e8b64d, smartcover);
		arrayremovevalue(smartcover.owner.smartcover.var_19e1ea69, smartcover);
	}
	if(is_true(level.var_5101157d.bundle.var_f4e0e7d7))
	{
		smartcover stopmicrowave();
		smartcover notify(#"microwave_turret_shutdown");
	}
	if(isdefined(smartcover.owner))
	{
		smartcover.owner globallogic_score::function_d3ca3608(#"hash_78cb6a053f51a857");
	}
	deployable::function_81598103(smartcover);
	if(isdefined(smartcover.killcament))
	{
		smartcover.killcament thread util::deleteaftertime(5);
	}
	if(isdefined(smartcover.grenade))
	{
		smartcover.grenade thread util::deleteaftertime(1);
	}
	if(isdefined(smartcover.trigger))
	{
		smartcover.trigger delete();
	}
	if(isdefined(smartcover.var_2d045452))
	{
		smartcover.var_2d045452 delete();
	}
	smartcover deletedelay();
}

/*
	Name: onkilled
	Namespace: smart_cover
	Checksum: 0x880252CF
	Offset: 0x2D28
	Size: 0x174
	Parameters: 1
	Flags: Linked
*/
function onkilled(var_c946c04c)
{
	smartcover = self;
	if(isdefined(var_c946c04c.attacker) && var_c946c04c.attacker != smartcover.owner)
	{
		smartcover.owner globallogic_score::function_5829abe3(var_c946c04c.attacker, var_c946c04c.weapon, smartcover.weapon);
		self battlechatter::function_d2600afc(var_c946c04c.attacker, smartcover.owner, smartcover.weapon, var_c946c04c.weapon);
		if(isdefined(self.owner))
		{
			var_f3ab6571 = self.owner weaponobjects::function_8481fc06(smartcover.weapon) > 1;
			smartcover.owner thread globallogic_audio::function_6daffa93(smartcover.weapon, var_f3ab6571);
		}
	}
	smartcover.var_d02ddb8e = var_c946c04c.weapon;
	if(isdefined(level.var_a430cceb))
	{
		smartcover [[level.var_a430cceb]](var_c946c04c.attacker, smartcover.var_d02ddb8e);
	}
	smartcover thread function_2a494565(0);
}

/*
	Name: function_884d0700
	Namespace: smart_cover
	Checksum: 0x6A715201
	Offset: 0x2EA8
	Size: 0x5E
	Parameters: 1
	Flags: Linked
*/
function function_884d0700(var_796be15d)
{
	return (self.team == #"allies" ? level.var_5101157d.bundle.var_ee0c73a5 : level.var_5101157d.bundle.var_d3ea02d6);
}

/*
	Name: getmodel
	Namespace: smart_cover
	Checksum: 0x515F4A03
	Offset: 0x2F10
	Size: 0x5E
	Parameters: 1
	Flags: Linked
*/
function getmodel(var_796be15d)
{
	return (self.team == #"allies" ? level.var_5101157d.bundle.var_397ed90c : level.var_5101157d.bundle.var_b256e3da);
}

/*
	Name: function_d2368084
	Namespace: smart_cover
	Checksum: 0xBAFD0145
	Offset: 0x2F78
	Size: 0x1CA
	Parameters: 13
	Flags: Linked
*/
function function_d2368084(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, iboneindex, imodelindex)
{
	bundle = getscriptbundle("killstreak_smart_cover");
	startinghealth = (isdefined(self.startinghealth) ? self.startinghealth : 0);
	if((isdefined(self.health) ? self.health : 0) < (startinghealth * 0.5) && !self.var_2cf2e843 === 1 && isdefined(self.owner) && isplayer(self.owner) && !vdir === self.owner)
	{
		self.owner thread namespace_f9b02f80::play_taacom_dialog("smartCoverWeaponDamaged");
		self.var_2cf2e843 = 1;
	}
	finaldamage = killstreak_bundles::function_dd7587e4(bundle, startinghealth, vdir, imodelindex, iboneindex, shitloc, psoffsettime);
	if(!isdefined(finaldamage))
	{
		finaldamage = killstreaks::get_old_damage(vdir, imodelindex, iboneindex, shitloc, 1);
	}
	return int(finaldamage);
}

/*
	Name: function_20be77a3
	Namespace: smart_cover
	Checksum: 0xCF742919
	Offset: 0x3150
	Size: 0x204
	Parameters: 1
	Flags: Linked
*/
function function_20be77a3(smartcover)
{
	smartcover.var_eda9690f = [];
	forwardangles = anglestoforward(smartcover.angles);
	var_2358ae9 = anglestoright(smartcover.angles);
	var_526ec5aa = smartcover.origin + (0, 0, 1) * getdvarfloat(#"hash_4d17057924212aa9", 1);
	smartcover.var_eda9690f[smartcover.var_eda9690f.size] = var_526ec5aa + (forwardangles * getdvarfloat(#"hash_477cc29b988c0b75", 1));
	smartcover.var_eda9690f[smartcover.var_eda9690f.size] = smartcover.var_eda9690f[0] + (0, 0, 1) * getdvarfloat(#"hash_41cfd0e34c53ef02", 1);
	backpoint = var_526ec5aa + (forwardangles * getdvarfloat(#"hash_7f893c50ae5356c8", 1));
	smartcover.var_eda9690f[smartcover.var_eda9690f.size] = backpoint + (var_2358ae9 * getdvarfloat(#"hash_70ce44b2b0b4005", 1));
	smartcover.var_eda9690f[smartcover.var_eda9690f.size] = backpoint - (var_2358ae9 * getdvarfloat(#"hash_70ce44b2b0b4005", 1));
}

/*
	Name: function_9813d292
	Namespace: smart_cover
	Checksum: 0xA95826
	Offset: 0x3360
	Size: 0x3C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_9813d292()
{
	if(isdefined(self))
	{
		badplace_delete("smart_cover_badplace" + self getentitynumber());
	}
}

/*
	Name: function_d2d0a813
	Namespace: smart_cover
	Checksum: 0xE2737AC0
	Offset: 0x33A8
	Size: 0x11C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d2d0a813(var_24e0878b)
{
	var_3b0688ef = "smart_cover_badplace" + self getentitynumber();
	var_2c0980ab = self.origin + self getboundsmidpoint();
	var_e5afa076 = self getboundshalfsize();
	var_921c5821 = max(var_e5afa076[0], var_e5afa076[1]) + 5;
	var_e5afa076 = (var_921c5821, var_921c5821, var_e5afa076[2]);
	if(var_24e0878b === 1)
	{
		badplace_cylinder(var_3b0688ef, 0, var_2c0980ab, var_921c5821, var_e5afa076[2] * 2, "all");
	}
	else
	{
		badplace_box(var_3b0688ef, 0, var_2c0980ab, var_e5afa076, "all");
	}
}

/*
	Name: createsmartcover
	Namespace: smart_cover
	Checksum: 0x9E82A4B3
	Offset: 0x34D0
	Size: 0x670
	Parameters: 5
	Flags: Linked
*/
function createsmartcover(watcher, var_5ebbec19, origin, angles, var_796be15d)
{
	player = self;
	var_89b6fd44 = spawn("script_model", origin);
	var_89b6fd44.targetname = "smart_cover";
	var_5ebbec19.smartcover = var_89b6fd44;
	var_89b6fd44.grenade = var_5ebbec19;
	var_89b6fd44 setmodel(player getmodel(var_796be15d));
	var_89b6fd44.var_2d045452 = var_5ebbec19;
	var_c6f47ca9 = getdvarint(#"hash_1d8eb304f5cf8033", 0);
	if(var_c6f47ca9 == 1)
	{
		var_89b6fd44 function_41b29ff0(player function_884d0700(var_796be15d));
	}
	var_89b6fd44.angles = angles;
	var_89b6fd44.owner = player;
	var_89b6fd44.takedamage = 1;
	var_89b6fd44.startinghealth = (var_796be15d ? (isdefined(level.var_5101157d.bundle.var_d9317c6b) ? level.var_5101157d.bundle.var_d9317c6b : 100) : (isdefined(level.var_5101157d.bundle.var_4d358e2d) ? level.var_5101157d.bundle.var_4d358e2d : 100));
	var_89b6fd44.health = var_89b6fd44.startinghealth;
	var_89b6fd44 solid();
	var_89b6fd44 function_d2d0a813();
	var_89b6fd44 setteam(player getteam());
	var_89b6fd44.var_86a21346 = &function_d2368084;
	var_89b6fd44.weapon = level.var_5101157d.var_8d86ade8;
	var_89b6fd44 setweapon(var_89b6fd44.weapon);
	player.smartcover.var_58e8b64d[player.smartcover.var_58e8b64d.size] = var_89b6fd44;
	var_c892a9a = (var_796be15d ? level.var_5101157d.var_546a220c : level.var_5101157d.var_ac3f76c7);
	if(isdefined(var_c892a9a))
	{
		var_89b6fd44.objectiveid = gameobjects::get_next_obj_id();
		objective_add(var_89b6fd44.objectiveid, "active", var_89b6fd44, var_c892a9a);
		function_6da98133(var_89b6fd44.objectiveid);
		objective_setteam(var_89b6fd44.objectiveid, player.team);
	}
	var_9d063af9 = player gadgetgetslot(level.var_5101157d.var_8d86ade8);
	if(!sessionmodeiswarzonegame())
	{
		self gadgetpowerset(var_9d063af9, 0);
	}
	var_89b6fd44 setteam(player.team);
	array::add(level.var_5101157d.var_f115c746, var_89b6fd44);
	function_20be77a3(var_89b6fd44);
	var_89b6fd44 clientfield::set("friendlyequip", 1);
	var_89b6fd44 clientfield::set("enemyequip", 1);
	var_89b6fd44.var_24ac884b = 1;
	var_89b6fd44 thread ondamage();
	var_89b6fd44 thread function_37f1dcd1();
	thread function_18dd6b22(var_89b6fd44);
	player deployable::function_6ec9ee30(var_89b6fd44, level.var_5101157d.var_8d86ade8);
	var_89b6fd44.victimsoundmod = "vehicle";
	if(is_true(level.var_5101157d.bundle.var_f4e0e7d7))
	{
		var_89b6fd44 thread startmicrowave();
	}
	killcament = spawn("script_model", var_89b6fd44.origin + ((isdefined(level.var_5101157d.bundle.var_eb9150a5) ? level.var_5101157d.bundle.var_eb9150a5 : 0), (isdefined(level.var_5101157d.bundle.var_26a346c8) ? level.var_5101157d.bundle.var_26a346c8 : 0), (isdefined(level.var_5101157d.bundle.var_d0fb9b7a) ? level.var_5101157d.bundle.var_d0fb9b7a : 0)));
	killcament.targetname = "smart_cover_killcament";
	var_89b6fd44.killcament = killcament;
	watcher.objectarray[watcher.objectarray.size] = killcament;
	return var_89b6fd44;
}

/*
	Name: function_127fb8f3
	Namespace: smart_cover
	Checksum: 0xC7EBDE99
	Offset: 0x3B48
	Size: 0xFC
	Parameters: 2
	Flags: Linked
*/
function function_127fb8f3(smartcover, attackingplayer)
{
	if(!is_true(smartcover.smartcoverjammed))
	{
		smartcover stopmicrowave();
		smartcover clientfield::set("enemyequip", 0);
	}
	smartcover.smartcoverjammed = 1;
	if(isdefined(level.var_86e3d17a))
	{
		smartcover notify(#"cancel_timeout");
		var_77b9f495 = [[level.var_86e3d17a]]();
		smartcover thread function_b397b517(var_77b9f495);
	}
	if(isdefined(level.var_1794f85f))
	{
		[[level.var_1794f85f]](attackingplayer, "disrupted_barricade");
	}
	return true;
}

/*
	Name: function_18dd6b22
	Namespace: smart_cover
	Checksum: 0x80E39980
	Offset: 0x3C50
	Size: 0x98
	Parameters: 1
	Flags: Linked
*/
function function_18dd6b22(smartcover)
{
	level endon(#"game_ended");
	smartcover endon(#"death");
	while(true)
	{
		waitresult = undefined;
		waitresult = smartcover waittill(#"broken");
		if(waitresult.type == "base_piece_broken")
		{
			smartcover function_2a494565(0);
		}
	}
}

/*
	Name: function_bf4c81d2
	Namespace: smart_cover
	Checksum: 0x61594EFE
	Offset: 0x3CF0
	Size: 0xC6
	Parameters: 2
	Flags: Linked
*/
function function_bf4c81d2(origin, maxdistancesq)
{
	foreach(smartcover in level.var_5101157d.var_f115c746)
	{
		if(!isdefined(smartcover))
		{
			continue;
		}
		if(distancesquared(smartcover.origin, origin) < maxdistancesq)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: watchweaponchange
	Namespace: smart_cover
	Checksum: 0x8CAF6827
	Offset: 0x3DC0
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function watchweaponchange()
{
	player = self;
	self notify(#"watchweaponchange_singleton");
	self endon(#"watchweaponchange_singleton");
	while(true)
	{
		if(self weaponswitchbuttonpressed())
		{
			if(isdefined(player.smartcover))
			{
				player.smartcover.var_5af6633b = 1;
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_57f553e9
	Namespace: smart_cover
	Checksum: 0x706B5865
	Offset: 0x3E50
	Size: 0x70
	Parameters: 2
	Flags: Linked
*/
function function_57f553e9(&var_85947e0d, maxallowed)
{
	if(var_85947e0d.size <= maxallowed)
	{
		return undefined;
	}
	outstayed_spawner = array::pop_front(var_85947e0d, 0);
	arrayremovevalue(var_85947e0d, undefined, 0);
	return outstayed_spawner;
}

/*
	Name: function_92112113
	Namespace: smart_cover
	Checksum: 0x2474B4BB
	Offset: 0x3EC8
	Size: 0x34E
	Parameters: 5
	Flags: Linked
*/
function function_92112113(attacker, victim, weapon, attackerweapon, meansofdeath)
{
	if(!isdefined(level.var_5101157d) || !isdefined(level.var_5101157d.var_f115c746) || !isdefined(weapon) || !isdefined(victim) || !isdefined(meansofdeath) || !isdefined(attackerweapon))
	{
		return false;
	}
	if(isdefined(level.iskillstreakweapon) && [[level.iskillstreakweapon]](meansofdeath) || meansofdeath == attackerweapon)
	{
		return false;
	}
	foreach(smartcover in level.var_5101157d.var_f115c746)
	{
		if(!isdefined(smartcover))
		{
			continue;
		}
		if(!isdefined(weapon) || !isdefined(weapon.team) || !isdefined(smartcover.owner))
		{
			continue;
		}
		if(weapon == smartcover.owner || (level.teambased && !util::function_fbce7263(weapon.team, smartcover.owner.team)))
		{
			continue;
		}
		var_583e1573 = distancesquared(smartcover.origin, victim.origin);
		if(var_583e1573 > level.var_5101157d.var_357db326)
		{
			continue;
		}
		var_eb870c = distancesquared(weapon.origin, smartcover.origin);
		var_ae30f518 = distancesquared(weapon.origin, victim.origin);
		var_d9ecf725 = var_ae30f518 > var_583e1573;
		var_1d1ca33b = var_ae30f518 > var_eb870c;
		if(var_d9ecf725 && var_1d1ca33b)
		{
			var_a3aba5a9 = 1;
			var_71eedb0b = smartcover.owner;
			break;
		}
	}
	if(isdefined(var_71eedb0b) && isdefined(var_a3aba5a9) && var_a3aba5a9)
	{
		if(smartcover.owner == victim)
		{
			return true;
		}
		scoreevents::processscoreevent(#"hash_3d0d53aff3c68c68", var_71eedb0b, weapon, level.var_5101157d.var_8d86ade8);
	}
	return false;
}

/*
	Name: function_4e6d9621
	Namespace: smart_cover
	Checksum: 0x2A13F99
	Offset: 0x4220
	Size: 0x2AA
	Parameters: 3
	Flags: Linked, Private
*/
function private function_4e6d9621(smartcover, origins, radii)
{
	/#
		assert(isarray(origins));
	#/
	/#
		assert(!isarray(radii) || origins.size == radii.size);
	#/
	/#
		assert(isdefined(smartcover.var_eda9690f) && smartcover.var_eda9690f.size > 0);
	#/
	foreach(var_592587c3 in smartcover.var_eda9690f)
	{
		for(index = 0; index < origins.size; index++)
		{
			distance = distancesquared(origins[index], var_592587c3);
			radius = (isarray(radii) ? radii[index] : radii);
			var_d3892c92 = radius + getdvarfloat(#"hash_4d17057924212aa9", 1);
			if(getdvarint(#"hash_686a676b28ae0af4", 0) == 1)
			{
				/#
					sphere(origins[index], radius, (0, 0, 1), 0.5, 0, 10, 500);
					sphere(var_592587c3, getdvarfloat(#"hash_4d17057924212aa9", 1), (1, 0, 0), 0.5, 0, 10, 500);
				#/
			}
			radiussqr = var_d3892c92 * var_d3892c92;
			if(distance < radiussqr)
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: function_e3a901c
	Namespace: smart_cover
	Checksum: 0x9A044314
	Offset: 0x44D8
	Size: 0xDA
	Parameters: 2
	Flags: Linked
*/
function function_e3a901c(origins, radii)
{
	if(!isdefined(level.var_5101157d.var_f115c746))
	{
		return false;
	}
	foreach(smartcover in level.var_5101157d.var_f115c746)
	{
		if(!isdefined(smartcover))
		{
			continue;
		}
		if(function_4e6d9621(smartcover, origins, radii))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: reset_being_microwaved
	Namespace: smart_cover
	Checksum: 0x746E5481
	Offset: 0x45C0
	Size: 0x16
	Parameters: 0
	Flags: Linked
*/
function reset_being_microwaved()
{
	self.lastmicrowavedby = undefined;
	self.beingmicrowavedby = undefined;
}

/*
	Name: startmicrowave
	Namespace: smart_cover
	Checksum: 0xD27F121A
	Offset: 0x45E0
	Size: 0x18C
	Parameters: 0
	Flags: Linked
*/
function startmicrowave()
{
	if(isdefined(self.trigger))
	{
		self.trigger delete();
	}
	self clientfield::set("start_smartcover_microwave", 1);
	loc_0000466A:
	loc_000046AE:
	self.trigger = spawn("trigger_radius", self.origin + (0, 0, (isdefined(level.var_5101157d.bundle.var_b345c668) ? level.var_5101157d.bundle.var_b345c668 : 0) * -1), ((4096 | 16384) | level.aitriggerspawnflags) | level.vehicletriggerspawnflags, (isdefined(level.var_5101157d.bundle.var_b345c668) ? level.var_5101157d.bundle.var_b345c668 : 0), (isdefined(level.var_5101157d.bundle.var_b345c668) ? level.var_5101157d.bundle.var_b345c668 : 0) * 2);
	self thread turretthink();
	/#
		self thread turretdebugwatch();
	#/
}

/*
	Name: stopmicrowave
	Namespace: smart_cover
	Checksum: 0x4FD073F3
	Offset: 0x4778
	Size: 0xAE
	Parameters: 0
	Flags: Linked
*/
function stopmicrowave()
{
	if(!isdefined(self))
	{
		return;
	}
	self playsound(#"mpl_microwave_beam_off");
	if(self getentitytype() == 6)
	{
		self clientfield::set("start_smartcover_microwave", 0);
	}
	if(isdefined(self.trigger))
	{
		self.trigger delete();
	}
	/#
		self notify(#"stop_turret_debug");
	#/
}

/*
	Name: turretdebugwatch
	Namespace: smart_cover
	Checksum: 0xF4288DE7
	Offset: 0x4830
	Size: 0x7C
	Parameters: 0
	Flags: None
*/
function turretdebugwatch()
{
	turret = self;
	turret endon(#"stop_turret_debug");
	for(;;)
	{
		if(getdvarint(#"scr_microwave_turret_debug", 0) != 0)
		{
			turret turretdebug();
			waitframe(1);
			continue;
		}
		wait(1);
	}
}

/*
	Name: turretdebug
	Namespace: smart_cover
	Checksum: 0x1E5CA6F1
	Offset: 0x48B8
	Size: 0x174
	Parameters: 0
	Flags: Linked
*/
function turretdebug()
{
	turret = self;
	angles = turret gettagangles("tag_flash");
	origin = turret gettagorigin("tag_flash");
	cone_apex = origin;
	forward = anglestoforward(angles);
	dome_apex = cone_apex + vectorscale(forward, (isdefined(level.var_5101157d.bundle.var_b345c668) ? level.var_5101157d.bundle.var_b345c668 : 0));
	/#
		util::debug_spherical_cone(cone_apex, dome_apex, (isdefined(level.var_5101157d.bundle.var_cbd5f27c) ? level.var_5101157d.bundle.var_cbd5f27c : 0), 16, (0.95, 0.1, 0.1), 0.3, 1, 3);
	#/
}

/*
	Name: turretthink
	Namespace: smart_cover
	Checksum: 0x70B80CCE
	Offset: 0x4A38
	Size: 0x138
	Parameters: 0
	Flags: Linked
*/
function turretthink()
{
	turret = self;
	turret endon(#"microwave_turret_shutdown");
	turret endon(#"death");
	turret.trigger endon(#"death");
	turret.turret_vehicle_entnum = turret getentitynumber();
	while(true)
	{
		waitresult = undefined;
		waitresult = turret.trigger waittill(#"trigger");
		ent = waitresult.activator;
		if(ent == turret)
		{
			continue;
		}
		if(!isdefined(ent.beingmicrowavedby))
		{
			ent.beingmicrowavedby = [];
		}
		if(turret microwaveturretaffectsentity(ent) && !isdefined(ent.beingmicrowavedby[turret.turret_vehicle_entnum]))
		{
			turret thread microwaveentity(ent);
		}
	}
}

/*
	Name: microwaveentitypostshutdowncleanup
	Namespace: smart_cover
	Checksum: 0x128D236C
	Offset: 0x4B78
	Size: 0xC0
	Parameters: 1
	Flags: Linked
*/
function microwaveentitypostshutdowncleanup(entity)
{
	entity endon(#"disconnect", #"end_microwaveentitypostshutdowncleanup");
	self endon(#"death");
	turret = self;
	turret_vehicle_entnum = turret.turret_vehicle_entnum;
	turret waittill(#"microwave_turret_shutdown");
	if(isdefined(entity))
	{
		if(isdefined(entity.beingmicrowavedby) && isdefined(entity.beingmicrowavedby[turret_vehicle_entnum]))
		{
			entity.beingmicrowavedby[turret_vehicle_entnum] = undefined;
		}
	}
}

/*
	Name: microwaveentity
	Namespace: smart_cover
	Checksum: 0x770B0613
	Offset: 0x4C40
	Size: 0x7F0
	Parameters: 1
	Flags: Linked
*/
function microwaveentity(entity)
{
	turret = self;
	turret endon(#"microwave_turret_shutdown", #"death");
	entity endon(#"disconnect", #"death");
	if(isplayer(entity))
	{
		entity endon(#"joined_team", #"joined_spectators");
	}
	turret thread microwaveentitypostshutdowncleanup(entity);
	entity.beingmicrowavedby[turret.turret_vehicle_entnum] = turret.owner;
	entity.microwavedamageinitialdelay = 1;
	entity.microwaveeffect = 0;
	shellshockscalar = 1;
	viewkickscalar = 1;
	damagescalar = 1;
	if(isplayer(entity) && entity hasperk(#"specialty_microwaveprotection"))
	{
		shellshockscalar = getdvarfloat(#"specialty_microwaveprotection_shellshock_scalar", 0.5);
		viewkickscalar = getdvarfloat(#"specialty_microwaveprotection_viewkick_scalar", 0.5);
		damagescalar = getdvarfloat(#"specialty_microwaveprotection_damage_scalar", 0.5);
	}
	if(getgametypesetting(#"competitivesettings") === 1)
	{
		var_756fda07 = getstatuseffect(#"hash_4571e9bb8d1be2af");
		var_2b29cf8c = getstatuseffect(#"hash_13ef8ef2acaa9aec");
	}
	else
	{
		var_756fda07 = getstatuseffect(#"microwave_slowed");
		var_2b29cf8c = getstatuseffect(#"microwave_dot");
	}
	turret_vehicle_entnum = turret.turret_vehicle_entnum;
	var_2b29cf8c.killcament = turret;
	while(true)
	{
		if(!isdefined(turret) || !isdefined(turret.trigger) || !turret microwaveturretaffectsentity(entity))
		{
			if(!isdefined(entity))
			{
				return;
			}
			if(isdefined(entity.beingmicrowavedby[turret_vehicle_entnum]))
			{
				entity thread status_effect::function_408158ef(var_756fda07.setype, var_756fda07.var_18d16a6b);
				entity thread status_effect::function_408158ef(var_2b29cf8c.setype, var_2b29cf8c.var_18d16a6b);
				if(isdefined(entity.var_553267c8))
				{
					entity stoprumble(entity.var_553267c8);
					entity.var_553267c8 = undefined;
				}
			}
			entity.beingmicrowavedby[turret_vehicle_entnum] = undefined;
			if(isdefined(entity.microwavepoisoning) && entity.microwavepoisoning)
			{
				entity.microwavepoisoning = 0;
			}
			entity notify(#"end_microwaveentitypostshutdowncleanup");
			return;
		}
		damage = (isdefined(level.var_5101157d.bundle.var_d2369c5a) ? level.var_5101157d.bundle.var_d2369c5a : 0) * damagescalar;
		if(level.hardcoremode)
		{
			damage = damage * (isdefined(level.var_5101157d.bundle.var_78c1e37b) ? level.var_5101157d.bundle.var_78c1e37b : 0.25);
		}
		if(!isai(entity) && entity util::mayapplyscreeneffect())
		{
			if(!isdefined(entity.microwavepoisoning) || !entity.microwavepoisoning)
			{
				entity.microwavepoisoning = 1;
				entity.microwaveeffect = 0;
			}
		}
		if(isdefined(entity.microwavedamageinitialdelay))
		{
			wait(randomfloatrange(0.1, 0.3));
			entity.microwavedamageinitialdelay = undefined;
		}
		entity thread status_effect::status_effect_apply(var_2b29cf8c, level.var_5101157d.var_8d86ade8, self, 0);
		entity.microwaveeffect++;
		entity.lastmicrowavedby = turret.owner;
		time = gettime();
		if(isplayer(entity) && isdefined(entity.clientid))
		{
			entity playsoundtoplayer(#"hash_5eecc78116b1fc85", entity);
			if(!entity isremotecontrolling() && (time - (isdefined(entity.microwaveshellshockandviewkicktime) ? entity.microwaveshellshockandviewkicktime : 0)) > 950)
			{
				if((entity.microwaveeffect % 2) == 1)
				{
					entity viewkick(int(25 * viewkickscalar), turret.origin);
					entity.microwaveshellshockandviewkicktime = time;
					entity thread status_effect::status_effect_apply(var_756fda07, level.var_5101157d.var_8d86ade8, self, 0);
					var_83cd8106 = level.var_5101157d.bundle.var_5223868e;
					if(isdefined(var_83cd8106))
					{
						entity playrumbleonentity(var_83cd8106);
						entity.var_553267c8 = var_83cd8106;
					}
				}
			}
			if(!isdefined(turret.playersdamaged))
			{
				turret.playersdamaged = [];
			}
			turret.playersdamaged[entity.clientid] = 1;
			if(!(isdefined(level.var_5101157d.bundle.var_74dcfa31) ? level.var_5101157d.bundle.var_74dcfa31 : 0) && (entity.microwaveeffect % 3) == 2)
			{
				scoreevents::processscoreevent(#"hpm_suppress", turret.owner, entity, level.var_5101157d.var_8d86ade8, turret.playersdamaged.size);
			}
		}
		wait(0.5);
	}
}

/*
	Name: microwaveturretaffectsentity
	Namespace: smart_cover
	Checksum: 0x5C65EEE5
	Offset: 0x5438
	Size: 0x49A
	Parameters: 1
	Flags: Linked
*/
function microwaveturretaffectsentity(entity)
{
	turret = self;
	if(!isalive(entity))
	{
		return false;
	}
	if(!isplayer(entity) && !isai(entity))
	{
		return false;
	}
	if(entity.ignoreme === 1)
	{
		return false;
	}
	if(isdefined(turret.carried) && turret.carried)
	{
		return false;
	}
	if(turret weaponobjects::isstunned())
	{
		return false;
	}
	if(isdefined(turret.owner) && entity == turret.owner)
	{
		return false;
	}
	if(!damage::friendlyfirecheck(turret.owner, entity, 0))
	{
		return false;
	}
	if(isplayer(entity) && entity geteye()[2] < turret.origin[2])
	{
		return false;
	}
	if(isai(entity))
	{
		var_caf90a7c = (entity.maxs[2] - entity.mins[2]) + entity.origin[2];
		if(var_caf90a7c < turret.origin[2])
		{
			return false;
		}
	}
	if((isdefined(level.var_5101157d.bundle.var_7ba68eb6) ? level.var_5101157d.bundle.var_7ba68eb6 : 0) > 0 && entity.origin[2] > (turret.origin[2] + level.var_5101157d.bundle.var_7ba68eb6))
	{
		return false;
	}
	if(distancesquared(entity.origin, turret.origin) > (isdefined(level.var_5101157d.bundle.var_b345c668) ? level.var_5101157d.bundle.var_b345c668 : 0) * (isdefined(level.var_5101157d.bundle.var_b345c668) ? level.var_5101157d.bundle.var_b345c668 : 0))
	{
		return false;
	}
	angles = turret getangles();
	realorigin = turret.origin + vectorscale((0, 0, 1), 30);
	forward = anglestoforward(angles);
	origin = realorigin - (forward * 50);
	shoot_at_pos = entity getshootatpos(turret);
	var_29d7e93f = vectornormalize(shoot_at_pos - realorigin);
	var_2d95367c = vectordot(var_29d7e93f, forward);
	if(var_2d95367c < 0)
	{
		return false;
	}
	entdirection = vectornormalize(shoot_at_pos - origin);
	dot = vectordot(entdirection, forward);
	if(dot < cos((isdefined(level.var_5101157d.bundle.var_cbd5f27c) ? level.var_5101157d.bundle.var_cbd5f27c : 0)))
	{
		return false;
	}
	if(entity damageconetrace(origin, turret, forward) <= 0)
	{
		return false;
	}
	return true;
}

