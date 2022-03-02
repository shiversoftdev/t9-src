#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\zm_common\gametypes\globallogic.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_47809ab2;

/*
	Name: function_b53cda83
	Namespace: namespace_47809ab2
	Checksum: 0x6AF18038
	Offset: 0x2A0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b53cda83()
{
	level notify(347199258);
}

/*
	Name: init
	Namespace: namespace_47809ab2
	Checksum: 0x59DE4FF6
	Offset: 0x2C0
	Size: 0x2C4
	Parameters: 0
	Flags: Linked
*/
function init()
{
	zm_player::register_player_damage_callback(&function_6f03042);
	clientfield::register("toplayer", "" + #"hash_227c832bd5864419", 1, 1, "int");
	clientfield::register("allplayers", "" + #"hash_31c153af499657fd", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_5822132672ad230f", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_6219dce209d171ed", 1, 2, "int");
	level.var_d99df9f9 = 500;
	var_97d7f69d = [];
	var_867ebaba = getentarray("flinger_pad_aimer", "targetname");
	foreach(entity in var_867ebaba)
	{
		if(entity.script_noteworthy === "jump_pad")
		{
			if(!isdefined(var_97d7f69d))
			{
				var_97d7f69d = [];
			}
			else if(!isarray(var_97d7f69d))
			{
				var_97d7f69d = array(var_97d7f69d);
			}
			if(!isinarray(var_97d7f69d, entity))
			{
				var_97d7f69d[var_97d7f69d.size] = entity;
			}
			entity function_619a5c20();
		}
	}
	array::thread_all(var_97d7f69d, &function_cc21ae2e);
	callback::on_spawned(&function_c10ae9f9);
	/#
		level thread devgui_setup();
	#/
}

/*
	Name: function_c10ae9f9
	Namespace: namespace_47809ab2
	Checksum: 0x488A72D9
	Offset: 0x590
	Size: 0x12E
	Parameters: 0
	Flags: Linked
*/
function function_c10ae9f9()
{
	self endon(#"death");
	while(true)
	{
		self flag::clear(#"hash_681b86c36426c957");
		while(!self zm_laststand::function_c3249e8c() && (!(self laststand::player_is_in_laststand() && self zm_laststand::function_30b9cdd5())))
		{
			waitframe(1);
		}
		self flag::set(#"hash_681b86c36426c957");
		while(self zm_laststand::function_c3249e8c() || (self laststand::player_is_in_laststand() && self zm_laststand::function_30b9cdd5()) || self usebuttonpressed())
		{
			waitframe(1);
		}
	}
}

/*
	Name: function_cc21ae2e
	Namespace: namespace_47809ab2
	Checksum: 0xA877E28C
	Offset: 0x6C8
	Size: 0x35C
	Parameters: 0
	Flags: Linked
*/
function function_cc21ae2e()
{
	level flag::wait_till("start_zombie_round_logic");
	self.var_43032f5e = util::spawn_model("tag_origin", self.origin, self.angles);
	self.var_63c8edf4 = util::spawn_model("tag_origin", self.origin, self.angles);
	self.var_6f3293fb = util::spawn_model(#"hash_28eb426b6bafb85e", self.origin, self.angles);
	self.var_6f3293fb clientfield::set("" + #"hash_6219dce209d171ed", 1);
	self.var_63c8edf4 linkto(self);
	self.var_6f3293fb linkto(self);
	var_b0c3aec3 = getentarray("flinger_landing_pad", "targetname");
	foreach(var_f504f705 in var_b0c3aec3)
	{
		if(var_f504f705.script_noteworthy === "landing_pad" && self.script_int === var_f504f705.script_int)
		{
			var_f504f705 thread function_b4913776();
			self.var_e5a262d8 = var_f504f705;
			self.var_803f2038 = "landing_pad_active" + var_f504f705.script_int;
			var_f504f705.var_90ddceac = self;
			var_f504f705 function_619a5c20();
			break;
		}
	}
	self.vol_fling = getent("flinger_vol" + self.script_int, "targetname");
	var_948355ad = self zm_unitrigger::create(&function_679a29cd, 100, &function_23ef27c);
	var_948355ad.origin = self.origin + vectorscale((0, 0, 1), 30);
	var_948355ad.cost = 500;
	var_948355ad.var_90ddceac = self;
	var_948355ad.var_b555f02e = self.var_b555f02e;
	var_948355ad.var_803f2038 = self.var_803f2038;
	var_948355ad.var_90ddceac.var_37db5cf = 1;
	self.var_2ddd9b0c = getvehiclenode("flinger_vehicle_startnode" + self.script_int, "targetname");
	self thread function_b2a2cce8();
}

/*
	Name: function_b2a2cce8
	Namespace: namespace_47809ab2
	Checksum: 0xBAB4ABA
	Offset: 0xA30
	Size: 0xB8
	Parameters: 0
	Flags: Linked
*/
function function_b2a2cce8()
{
	while(true)
	{
		level flag::wait_till("captured_control_point" + self.var_b555f02e);
		self clientfield::set("" + #"hash_5822132672ad230f", 1);
		level flag::wait_till_clear("captured_control_point" + self.var_b555f02e);
		self clientfield::set("" + #"hash_5822132672ad230f", 0);
	}
}

/*
	Name: function_679a29cd
	Namespace: namespace_47809ab2
	Checksum: 0x97438EAE
	Offset: 0xAF0
	Size: 0x4A4
	Parameters: 1
	Flags: Linked
*/
function function_679a29cd(player)
{
	if(self.stub.var_90ddceac flag::get("jump_pad_quest_start"))
	{
		self sethintstring("");
		return false;
	}
	if(isplayer(player))
	{
		player globallogic::function_d96c031e();
		if(player flag::get(#"hash_681b86c36426c957"))
		{
			return false;
		}
		if(isdefined(self.stub.var_b555f02e) && !level flag::get("power_on" + self.stub.var_b555f02e))
		{
			self sethintstringforplayer(player, #"hash_693242528304c52d");
			return true;
		}
		if(isdefined(self.stub.var_803f2038) && !level flag::get(self.stub.var_803f2038))
		{
			self sethintstringforplayer(player, #"hash_6a411ebcdb1ae4b4");
			return true;
		}
		if(!is_true(self.stub.var_90ddceac.var_37db5cf))
		{
			self sethintstringforplayer(player, #"hash_6b9dfd4a8ab2a386");
			return true;
		}
		if(level flag::get(#"hash_58d741b93fb5a331"))
		{
			self sethintstringforplayer(player, #"hash_344777202de67020");
			return true;
		}
		switch(self.stub.var_90ddceac.script_string)
		{
			case "napalm_strike":
			{
				hint_string = player zm_utility::function_d6046228(#"hash_1c38e0fdb20ef055", #"hash_52a497d7fdd2698b");
				self sethintstringforplayer(player, hint_string, level.var_d99df9f9);
				if(!player zm_score::can_player_purchase(level.var_d99df9f9))
				{
					player globallogic::function_d1924f29(#"hash_6e3ae7967dc5d414");
				}
				break;
			}
			case "hash_64dce2b960119f23":
			{
				hint_string = player zm_utility::function_d6046228(#"hash_306dab4c836b1026", #"hash_2771ace3aa8dfe02");
				self sethintstringforplayer(player, hint_string, level.var_d99df9f9);
				if(!player zm_score::can_player_purchase(level.var_d99df9f9))
				{
					player globallogic::function_d1924f29(#"hash_6e3ae7967dc5d414");
				}
				break;
			}
			case "chopper_gunner":
			{
				hint_string = player zm_utility::function_d6046228(#"hash_61ac30cb1d0b9c0", #"hash_6d2d30daf8cd1ec");
				self sethintstringforplayer(player, hint_string, level.var_d99df9f9);
				if(!player zm_score::can_player_purchase(level.var_d99df9f9))
				{
					player globallogic::function_d1924f29(#"hash_6e3ae7967dc5d414");
				}
				break;
			}
			default:
			{
				break;
			}
		}
		return true;
	}
}

/*
	Name: function_23ef27c
	Namespace: namespace_47809ab2
	Checksum: 0xA132E73D
	Offset: 0xFA0
	Size: 0x256
	Parameters: 0
	Flags: Linked
*/
function function_23ef27c()
{
	level endon(#"end_game");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"trigger");
		player = waitresult.activator;
		if(!is_true(self.stub.var_90ddceac.var_37db5cf))
		{
			continue;
		}
		if(!level flag::get(self.stub.var_803f2038))
		{
			continue;
		}
		if(!level flag::get("power_on" + self.stub.var_b555f02e))
		{
			continue;
		}
		if(level flag::get(#"hash_58d741b93fb5a331"))
		{
			continue;
		}
		if(!isplayer(player))
		{
			continue;
		}
		if(player flag::get(#"hash_681b86c36426c957"))
		{
			continue;
		}
		if(!player zm_score::can_player_purchase(level.var_d99df9f9))
		{
			continue;
		}
		else
		{
			player zm_score::minus_to_player_score(level.var_d99df9f9);
		}
		playsoundatposition(#"hash_1d376319d5304199", self.origin);
		player thread function_d9e25369(self.stub.var_90ddceac);
		level notify(#"hash_cb2d8c59ec2fc84", {#hash_b8e13043:self.stub.var_90ddceac.script_int});
		self.stub.var_90ddceac thread function_f626ab3d();
		waitframe(1);
	}
}

/*
	Name: function_f626ab3d
	Namespace: namespace_47809ab2
	Checksum: 0xA06760E9
	Offset: 0x1200
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function function_f626ab3d()
{
	self endon(#"hash_7b651a1275b8f825");
	self.var_37db5cf = 0;
	wait(5);
	self function_7c7f1e12();
	wait(30);
	self.var_37db5cf = 1;
	self function_b858693f(self.var_b555f02e);
}

/*
	Name: function_d9e25369
	Namespace: namespace_47809ab2
	Checksum: 0xB9DB3F91
	Offset: 0x1278
	Size: 0x1D4
	Parameters: 1
	Flags: Linked
*/
function function_d9e25369(var_90ddceac)
{
	level endon(#"end_game");
	var_90ddceac endon(#"hash_7b651a1275b8f825");
	a_players = function_a1ef346b();
	var_d044a2f0 = self;
	var_945f1b6c = 5;
	while(var_945f1b6c > 0)
	{
		if(isalive(var_d044a2f0))
		{
			var_d044a2f0 thread function_c14f39dc(var_90ddceac.var_2ddd9b0c, var_90ddceac.var_e5a262d8);
			arrayremovevalue(a_players, var_d044a2f0);
			if(a_players.size == 0)
			{
				return;
			}
			var_d044a2f0 = undefined;
			var_bea2fd38 = 0.25;
		}
		else
		{
			var_bea2fd38 = 0.05;
		}
		var_945f1b6c = var_945f1b6c - var_bea2fd38;
		wait(var_bea2fd38);
		foreach(player in a_players)
		{
			if(isalive(player) && player istouching(var_90ddceac.vol_fling))
			{
				var_d044a2f0 = player;
				break;
			}
		}
	}
}

/*
	Name: function_a23af398
	Namespace: namespace_47809ab2
	Checksum: 0x257641FE
	Offset: 0x1458
	Size: 0x42
	Parameters: 0
	Flags: Linked
*/
function function_a23af398()
{
	self endon(#"hash_47017b5a7ed2b46b");
	level waittill(#"end_game");
	if(isdefined(self))
	{
		self.var_62b63681 = 1;
	}
}

/*
	Name: function_c14f39dc
	Namespace: namespace_47809ab2
	Checksum: 0xFAD844AD
	Offset: 0x14A8
	Size: 0x4DC
	Parameters: 2
	Flags: Linked
*/
function function_c14f39dc(nd_start, var_b338b8ed)
{
	self endon(#"death");
	if(isplayer(self))
	{
		self thread function_a23af398();
		self val::set(#"fling_player", "takedamage", 0);
		self function_bc82f900(#"hash_37581512bae8abf3");
		self.is_flung = 1;
		self.var_16735873 = 1;
		while(self isslamming())
		{
			util::wait_network_frame();
		}
		self zm_utility::create_streamer_hint(var_b338b8ed.origin, self.angles, 1);
		self notsolid();
		if(!self inlaststand())
		{
			self val::set(#"fling_player", "allow_crouch", 0);
			self val::set(#"fling_player", "allow_prone", 0);
			self val::set(#"fling_player", "allow_stand", 1);
			if(self getstance() != "stand")
			{
				self setstance("stand");
			}
		}
		self clientfield::set_to_player("" + #"hash_227c832bd5864419", 1);
		self clientfield::set("" + #"hash_31c153af499657fd", 1);
		playsoundatposition(#"hash_7ff8d8dbf89e6f0d", self.origin);
		var_dc3c3330 = vehicle::spawn(undefined, "player_vehicle", "fake_vehicle", nd_start.origin, nd_start.angles);
		self function_648c1f6(var_dc3c3330, undefined, 0, 180, 180, 180, 180, 1, 1);
		var_dc3c3330 setignorepauseworld(1);
		var_dc3c3330 vehicle::get_on_and_go_path(nd_start);
		var_dc3c3330 waittill(#"reached_end_node");
		self thread function_695ec0(var_b338b8ed);
		self solid();
		self thread function_b7e924cf();
		if(!self inlaststand())
		{
			self val::reset(#"fling_player", "allow_crouch");
			self val::reset(#"fling_player", "allow_prone");
		}
		waitframe(1);
		self.is_flung = undefined;
		self.var_16735873 = 0;
		self notify(#"hash_47017b5a7ed2b46b");
		self clientfield::set_to_player("" + #"hash_227c832bd5864419", 0);
		self clientfield::set("" + #"hash_31c153af499657fd", 0);
		playsoundatposition(#"hash_6062a28f5bf1780", self.origin);
		var_dc3c3330 delete();
		self zm_utility::clear_streamer_hint();
	}
}

/*
	Name: function_b7e924cf
	Namespace: namespace_47809ab2
	Checksum: 0x6EA925C3
	Offset: 0x1990
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function function_b7e924cf()
{
	wait(0.5);
	self val::reset(#"fling_player", "takedamage");
}

/*
	Name: function_695ec0
	Namespace: namespace_47809ab2
	Checksum: 0x9A5DB2E
	Offset: 0x19D8
	Size: 0x146
	Parameters: 1
	Flags: Linked
*/
function function_695ec0(var_b338b8ed)
{
	if(isplayer(self))
	{
		var_14ddabc6 = var_b338b8ed function_a5df8834(self);
		var_15316677 = var_14ddabc6.origin;
		while(positionwouldtelefrag(var_15316677))
		{
			waitframe(1);
			var_15316677 = var_14ddabc6.origin + (randomfloatrange(-24, 24), randomfloatrange(-24, 24), 0);
		}
		self unlink();
		self setorigin(var_15316677);
		if(is_true(self.var_62b63681))
		{
			self val::set(#"fling_player", "freezecontrols", 1);
		}
		wait(3);
		var_14ddabc6.occupied = undefined;
	}
}

/*
	Name: function_a5df8834
	Namespace: namespace_47809ab2
	Checksum: 0x9EC647FD
	Offset: 0x1B28
	Size: 0xEC
	Parameters: 1
	Flags: Linked
*/
function function_a5df8834(player)
{
	a_s_spots = struct::get_array(self.target, "targetname");
	foreach(spot in a_s_spots)
	{
		player_id = player getentitynumber();
		if(spot.script_int === player_id)
		{
			var_3cb2df83 = spot;
			break;
		}
	}
	return var_3cb2df83;
}

/*
	Name: function_6f03042
	Namespace: namespace_47809ab2
	Checksum: 0xD7330B8A
	Offset: 0x1C20
	Size: 0x82
	Parameters: 11
	Flags: Linked
*/
function function_6f03042(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex)
{
	if(is_true(self.is_flung))
	{
		return 0;
	}
	return -1;
}

/*
	Name: function_b4913776
	Namespace: namespace_47809ab2
	Checksum: 0xD1B0DC89
	Offset: 0x1CB0
	Size: 0x164
	Parameters: 0
	Flags: Linked
*/
function function_b4913776()
{
	level endon(#"end_game");
	self.mdl = util::spawn_model(#"hash_a1d2c05a50dd55", self.origin, self.angles);
	self.mdl.targetname = "landing_pad";
	self.var_43032f5e = util::spawn_model("tag_origin", self.origin, self.angles);
	self.var_63c8edf4 = util::spawn_model("tag_origin", self.origin, self.angles);
	self.var_43032f5e linkto(self);
	self.var_63c8edf4 linkto(self);
	level flag::wait_till("power_on" + self.var_b555f02e);
	level flag::set("landing_pad_active" + self.script_int);
	self function_726d8f3a();
}

/*
	Name: function_726d8f3a
	Namespace: namespace_47809ab2
	Checksum: 0x578F116F
	Offset: 0x1E20
	Size: 0x2FC
	Parameters: 1
	Flags: Linked
*/
function function_726d8f3a(var_fd713d4b)
{
	if(!isdefined(var_fd713d4b))
	{
		var_fd713d4b = 1;
	}
	if(!isdefined(self.var_43032f5e) || !isdefined(self.var_63c8edf4))
	{
		return;
	}
	if(var_fd713d4b)
	{
		self.var_43032f5e setmodel(#"hash_487c692b572bc449");
		wait(0.3);
		self.var_43032f5e setmodel(#"hash_487c662b572bbf30");
		wait(0.3);
		self.var_43032f5e setmodel(#"hash_487c672b572bc0e3");
		wait(0.3);
	}
	self.var_63c8edf4 setmodel(#"hash_9b7e079e1dcd5b0");
	switch(self.script_int)
	{
		case 1:
		{
			self.var_43032f5e setmodel(#"hash_2dc5f32522c37c29");
			break;
		}
		case 2:
		{
			self.var_43032f5e setmodel(#"hash_2dc5f02522c37710");
			break;
		}
		case 3:
		{
			self.var_43032f5e setmodel(#"hash_2dc5f12522c378c3");
			break;
		}
		case 4:
		{
			self.var_43032f5e setmodel(#"hash_2dc5f62522c38142");
			break;
		}
		case 5:
		{
			self.var_43032f5e setmodel(#"hash_2dc5f72522c382f5");
			break;
		}
		case 6:
		{
			self.var_43032f5e setmodel(#"hash_2dc5f42522c37ddc");
			break;
		}
		default:
		{
			break;
		}
	}
	if(level flag::get("power_on" + self.var_90ddceac.var_b555f02e))
	{
		function_b858693f(self.var_90ddceac.var_b555f02e);
	}
}

/*
	Name: function_b858693f
	Namespace: namespace_47809ab2
	Checksum: 0xDFE0F9EB
	Offset: 0x2128
	Size: 0x3A0
	Parameters: 1
	Flags: Linked
*/
function function_b858693f(index)
{
	var_1c9a65cd = getentarray("flinger_pad_aimer", "targetname");
	foreach(var_90ddceac in var_1c9a65cd)
	{
		if(var_90ddceac.var_b555f02e == index)
		{
			if(!isdefined(var_90ddceac.var_43032f5e) || !isdefined(var_90ddceac.var_63c8edf4) || !isdefined(var_90ddceac.var_6f3293fb))
			{
				break;
			}
			switch(var_90ddceac.script_int)
			{
				case 1:
				{
					var_b4fbcdc9 = #"hash_612ce7acf731e45c";
					break;
				}
				case 2:
				{
					var_b4fbcdc9 = #"hash_612ceaacf731e975";
					break;
				}
				case 3:
				{
					var_b4fbcdc9 = #"hash_612ce9acf731e7c2";
					break;
				}
				case 4:
				{
					var_b4fbcdc9 = #"hash_612ce4acf731df43";
					break;
				}
				case 5:
				{
					var_b4fbcdc9 = #"hash_612ce3acf731dd90";
					break;
				}
				case 6:
				{
					var_b4fbcdc9 = #"hash_612ce6acf731e2a9";
					break;
				}
				default:
				{
					break;
				}
			}
			if(level flag::get(var_90ddceac.var_803f2038))
			{
				var_90ddceac.var_43032f5e setmodel(#"hash_cbac724d17f7914");
				var_90ddceac.var_63c8edf4 setmodel(#"hash_229ea252394102ef");
				var_90ddceac.var_63c8edf4 stoploopsound();
				var_90ddceac.var_63c8edf4 playsound(#"hash_56bfe731349ae3ce");
			}
			else
			{
				var_90ddceac.var_43032f5e setmodel(var_b4fbcdc9);
				var_90ddceac.var_63c8edf4 setmodel(#"hash_16fb2319be7e56c7");
			}
			var_90ddceac.var_6f3293fb clientfield::set("" + #"hash_6219dce209d171ed", 2);
			if(!var_90ddceac scene::is_playing(#"hash_684bd2711559163d", "play"))
			{
				var_90ddceac thread scene::play(#"hash_684bd2711559163d", "play", var_90ddceac);
			}
		}
	}
}

/*
	Name: function_7c7f1e12
	Namespace: namespace_47809ab2
	Checksum: 0x71756A3B
	Offset: 0x24D0
	Size: 0xAC
	Parameters: 0
	Flags: Linked
*/
function function_7c7f1e12()
{
	if(!isdefined(self.var_43032f5e) || !isdefined(self.var_63c8edf4) || !isdefined(self.var_6f3293fb))
	{
		return;
	}
	self.var_43032f5e setmodel(#"hash_475b514611cd4cdd");
	self.var_63c8edf4 setmodel(#"hash_a894b6c603d3613");
	self.var_63c8edf4 playloopsound(#"hash_53528a3f2802b9d9");
}

/*
	Name: function_df6e6fce
	Namespace: namespace_47809ab2
	Checksum: 0x39B90950
	Offset: 0x2588
	Size: 0x1BA
	Parameters: 0
	Flags: None
*/
function function_df6e6fce()
{
	if(!isdefined(self.var_43032f5e))
	{
		return;
	}
	switch(self.script_int)
	{
		case 1:
		{
			self.var_43032f5e setmodel(#"hash_1730e3d42048d1b5");
			break;
		}
		case 2:
		{
			self.var_43032f5e setmodel(#"hash_1730e0d42048cc9c");
			break;
		}
		case 3:
		{
			self.var_43032f5e setmodel(#"hash_1730e1d42048ce4f");
			break;
		}
		case 4:
		{
			self.var_43032f5e setmodel(#"hash_1730ded42048c936");
			break;
		}
		case 5:
		{
			self.var_43032f5e setmodel(#"hash_1730dfd42048cae9");
			break;
		}
		case 6:
		{
			self.var_43032f5e setmodel(#"hash_1730dcd42048c5d0");
			break;
		}
		default:
		{
			break;
		}
	}
}

/*
	Name: function_1f622ac
	Namespace: namespace_47809ab2
	Checksum: 0x2381CC16
	Offset: 0x2750
	Size: 0x230
	Parameters: 1
	Flags: Linked
*/
function function_1f622ac(index)
{
	var_97d7f69d = getentarray("flinger_pad_aimer", "targetname");
	foreach(var_90ddceac in var_97d7f69d)
	{
		if(var_90ddceac.var_b555f02e == index && var_90ddceac.script_noteworthy === "jump_pad")
		{
			var_90ddceac.var_43032f5e setmodel("tag_origin");
		}
		var_90ddceac.var_6f3293fb clientfield::set("" + #"hash_6219dce209d171ed", 1);
		var_90ddceac scene::stop(#"hash_684bd2711559163d");
	}
	var_b0c3aec3 = getentarray("flinger_landing_pad", "targetname");
	foreach(var_e5a262d8 in var_b0c3aec3)
	{
		if(var_e5a262d8.var_b555f02e == index && var_e5a262d8.script_noteworthy === "landing_pad")
		{
			var_e5a262d8.var_43032f5e setmodel("tag_origin");
		}
	}
}

/*
	Name: devgui_setup
	Namespace: namespace_47809ab2
	Checksum: 0x8D8EA9A5
	Offset: 0x2988
	Size: 0x5C
	Parameters: 0
	Flags: None
*/
function devgui_setup()
{
	/#
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		zm_devgui::add_custom_devgui_callback(&cmd);
	#/
}

/*
	Name: cmd
	Namespace: namespace_47809ab2
	Checksum: 0x55A85B13
	Offset: 0x29F0
	Size: 0x82
	Parameters: 1
	Flags: None
*/
function cmd(cmd)
{
	/#
		switch(cmd)
		{
			case "hash_3785a966b663fa40":
			{
				function_de5992a1();
				break;
			}
			case "hash_627810dd51e05760":
			{
				function_f4d4dc3b();
				break;
			}
			default:
			{
				break;
			}
		}
	#/
}

/*
	Name: function_de5992a1
	Namespace: namespace_47809ab2
	Checksum: 0x4FDA30FC
	Offset: 0x2A80
	Size: 0xE8
	Parameters: 0
	Flags: None
*/
function function_de5992a1()
{
	/#
		var_97d7f69d = getentarray("", "");
		foreach(var_90ddceac in var_97d7f69d)
		{
			if(isdefined(var_90ddceac.var_6f3293fb))
			{
				var_90ddceac.var_6f3293fb clientfield::set("" + #"hash_6219dce209d171ed", 1);
			}
		}
	#/
}

/*
	Name: function_f4d4dc3b
	Namespace: namespace_47809ab2
	Checksum: 0x9A3053C0
	Offset: 0x2B70
	Size: 0xE0
	Parameters: 0
	Flags: None
*/
function function_f4d4dc3b()
{
	/#
		var_97d7f69d = getentarray("", "");
		foreach(var_90ddceac in var_97d7f69d)
		{
			if(isdefined(var_90ddceac.var_6f3293fb))
			{
				var_90ddceac.var_6f3293fb clientfield::set("" + #"hash_6219dce209d171ed", 0);
			}
		}
	#/
}

