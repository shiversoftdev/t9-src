#using scripts\core_common\globallogic\globallogic_score.gsc;
#using scripts\weapons\weaponobjects.gsc;
#using scripts\core_common\weapons_shared.gsc;
#using scripts\core_common\influencers_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\damagefeedback_shared.gsc;
#using scripts\core_common\damage.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using script_396f7d71538c9677;
#using scripts\core_common\battlechatter.gsc;

#namespace gadget_tripwire;

/*
	Name: __init__system__
	Namespace: gadget_tripwire
	Checksum: 0xE334A63C
	Offset: 0x220
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"gadget_tripwire", &function_70a657d8, undefined, &function_3675de8b, undefined);
}

/*
	Name: function_70a657d8
	Namespace: gadget_tripwire
	Checksum: 0x822CB280
	Offset: 0x270
	Size: 0x1E4
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	clientfield::register("missile", "tripwire_state", 1, 2, "int");
	clientfield::register("scriptmover", "tripwire_solo_beam_fx", 1, 1, "int");
	callback::on_connect(&function_d863663f);
	weaponobjects::function_e6400478(#"eq_tripwire", &function_9f97e1a3, 1);
	level.var_c27600b0 = getweapon("eq_tripwire");
	if(getgametypesetting(#"competitivesettings") === 1)
	{
		level.var_c72e8c51 = getscriptbundle("tripwire_custom_settings_comp");
	}
	else
	{
		if(isdefined(level.var_c27600b0.customsettings))
		{
			level.var_c72e8c51 = getscriptbundle(level.var_c27600b0.customsettings);
		}
		else
		{
			level.var_c72e8c51 = getscriptbundle("tripwire_custom_settings");
		}
	}
	if(!isdefined(level.tripwires))
	{
		level.tripwires = [];
	}
	if(!isdefined(level.var_5f6cceae))
	{
		level.var_5f6cceae = [];
	}
	level.var_2e06b76a = &function_9e546fb3;
}

/*
	Name: function_3675de8b
	Namespace: gadget_tripwire
	Checksum: 0x8327A6D7
	Offset: 0x460
	Size: 0x90
	Parameters: 0
	Flags: None
*/
function function_3675de8b()
{
	if(isdefined(level.var_1b900c1d))
	{
		[[level.var_1b900c1d]](getweapon("eq_tripwire"), &function_bff5c062);
	}
	if(isdefined(level.var_a5dacbea))
	{
		[[level.var_a5dacbea]](getweapon("eq_tripwire"), &weaponobjects::function_127fb8f3);
	}
}

/*
	Name: function_bff5c062
	Namespace: gadget_tripwire
	Checksum: 0xC970D07F
	Offset: 0x4F8
	Size: 0x1AC
	Parameters: 2
	Flags: None
*/
function function_bff5c062(tripwire, attackingplayer)
{
	if(!isdefined(tripwire) || !isdefined(tripwire.watcher))
	{
		return;
	}
	tripwire.owner weaponobjects::hackerremoveweapon(tripwire);
	tripwire notify(#"hacked");
	tripwire.owner = attackingplayer;
	tripwire setowner(attackingplayer);
	tripwire setteam(attackingplayer getteam());
	if(isdefined(tripwire.hacked))
	{
		tripwire clientfield::set("tripwire_state", 3);
		tripwire.hacked = undefined;
	}
	else
	{
		tripwire clientfield::set("tripwire_state", 2);
		tripwire.hacked = 1;
	}
	if(isdefined(tripwire.entityenemyinfluencer))
	{
		tripwire influencers::remove_influencer(tripwire.entityenemyinfluencer);
	}
	tripwire.entityenemyinfluencer = tripwire influencers::create_entity_enemy_influencer("claymore", attackingplayer.team);
	tripwire thread weaponobjects::function_6d8aa6a0(attackingplayer, tripwire.watcher);
	level function_d77f9442();
}

/*
	Name: function_d863663f
	Namespace: gadget_tripwire
	Checksum: 0x80F724D1
	Offset: 0x6B0
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function function_d863663f()
{
}

/*
	Name: function_9f97e1a3
	Namespace: gadget_tripwire
	Checksum: 0x8381D16F
	Offset: 0x6C0
	Size: 0xFA
	Parameters: 1
	Flags: None
*/
function function_9f97e1a3(watcher)
{
	watcher.watchforfire = 1;
	watcher.ondetonatecallback = &function_9e546fb3;
	watcher.ownergetsassist = 1;
	watcher.ignoredirection = 1;
	watcher.immediatedetonation = 0;
	watcher.onspawn = &on_tripwire_spawn;
	watcher.ondamage = &function_7a905654;
	watcher.ondestroyed = &function_9b3a657f;
	watcher.var_994b472b = &function_9a98f669;
	watcher.activatesound = #"hash_3185e3ad37d8b947";
	watcher.ontimeout = &function_9b3a657f;
	watcher.onfizzleout = &function_9b3a657f;
}

/*
	Name: function_ec88b3b9
	Namespace: gadget_tripwire
	Checksum: 0x5ABD1EF4
	Offset: 0x7C8
	Size: 0x178
	Parameters: 1
	Flags: None
*/
function function_ec88b3b9(pos)
{
	newx = ((pos[0] - int(pos[0])) >= 0.5 ? ceil(pos[0]) : floor(pos[0]));
	newy = ((pos[1] - int(pos[1])) >= 0.5 ? ceil(pos[1]) : floor(pos[1]));
	newz = ((pos[2] - int(pos[2])) >= 0.5 ? ceil(pos[2]) : floor(pos[2]));
	pos = (newx, newy, newz);
	return pos;
}

/*
	Name: function_9366bdf9
	Namespace: gadget_tripwire
	Checksum: 0xE3E3A16D
	Offset: 0x948
	Size: 0x150
	Parameters: 2
	Flags: None
*/
function function_9366bdf9(tripwire, owner)
{
	enemyplayers = owner getenemiesinradius(tripwire.origin, battlechatter::mpdialog_value("tripwireThreatRadius", 500));
	foreach(enemy in enemyplayers)
	{
		if(!isplayer(enemy))
		{
			continue;
		}
		enemyeye = enemy geteyeapprox();
		if(!sighttracepassed(enemyeye, tripwire.origin, 0, enemy))
		{
			continue;
		}
		battlechatter::function_95e44f78(getweapon("eq_tripwire"), 0);
	}
}

/*
	Name: on_tripwire_spawn
	Namespace: gadget_tripwire
	Checksum: 0x68B231B4
	Offset: 0xAA0
	Size: 0x3A4
	Parameters: 2
	Flags: None
*/
function on_tripwire_spawn(watcher, player)
{
	player endon(#"disconnect");
	level endon(#"game_ended");
	self endon(#"death");
	weaponobjects::onspawnuseweaponobject(watcher, player);
	self.var_2d045452 = watcher;
	self.weapon = level.var_c27600b0;
	self setweapon(level.var_c27600b0);
	waitresult = undefined;
	waitresult = self waittill(#"stationary");
	self util::make_sentient();
	self.hitnormal = waitresult.normal;
	self.origin = function_ec88b3b9(waitresult.position);
	killcament = spawn("script_model", self.origin + (self.hitnormal * 5));
	killcament.targetname = "gadget_tripwire_killcament";
	self.killcament = killcament;
	if(isdefined(waitresult.target) && (isvehicle(waitresult.target) || waitresult.target ismovingplatform() || waitresult.target.dynamicent === 1))
	{
		self thread function_15566346(waitresult.target);
	}
	self.var_db7f2def = self gettagorigin("tag_fx") + (self.hitnormal * 2);
	self.owner = player;
	self.team = player.team;
	self.watcher = watcher;
	self clientfield::set("friendlyequip", 1);
	self.entityenemyinfluencer = self influencers::create_entity_enemy_influencer("claymore", player.team);
	self.destroyablebytrophysystem = 0;
	self.detonating = 0;
	wait(level.var_c72e8c51.var_e14f5fca);
	player notify(#"tripwire_spawn", {#tripwire:self});
	self clientfield::set("tripwire_state", 1);
	arrayinsert(level.tripwires, self, level.tripwires.size);
	level function_d77f9442();
	function_9366bdf9(self, player);
	self thread function_15de8daf();
}

/*
	Name: function_15566346
	Namespace: gadget_tripwire
	Checksum: 0x14184595
	Offset: 0xE50
	Size: 0xE2
	Parameters: 1
	Flags: None
*/
function function_15566346(ent)
{
	self endon(#"death");
	oldpos = ent.origin;
	while(true)
	{
		if(!isdefined(ent))
		{
			return;
		}
		curpos = ent.origin;
		if(isdefined(curpos) && distancesquared(oldpos, curpos))
		{
			self thread function_9e546fb3(undefined, self.weapon, undefined, undefined);
		}
		oldpos = curpos;
		wait(float(function_60d95f53()) / 1000);
	}
}

/*
	Name: function_d77f9442
	Namespace: gadget_tripwire
	Checksum: 0xFB372626
	Offset: 0xF40
	Size: 0x198
	Parameters: 0
	Flags: None
*/
function function_d77f9442()
{
	foreach(tripwire in level.tripwires)
	{
		if(!isdefined(tripwire))
		{
			continue;
		}
		tripwire thread function_55c50f15();
	}
	foreach(tripwire in level.tripwires)
	{
		if(!isdefined(tripwire))
		{
			continue;
		}
		if(tripwire.var_c2f0f6da)
		{
			tripwire thread function_6c66b650();
			continue;
		}
		if(!isdefined(tripwire.var_886bd8dc))
		{
			tripwire function_b9549a9();
		}
		else
		{
			tripwire function_684adc9();
		}
		tripwire.var_886bd8dc clientfield::set("tripwire_solo_beam_fx", 1);
	}
}

/*
	Name: function_684adc9
	Namespace: gadget_tripwire
	Checksum: 0x89BE6F6
	Offset: 0x10E0
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function function_684adc9()
{
	if(isdefined(self.owner))
	{
		self.var_886bd8dc setowner(self.owner);
		self.var_886bd8dc setteam(self.owner.team);
	}
	else
	{
		self.var_886bd8dc setteam(self.team);
	}
}

/*
	Name: function_b9549a9
	Namespace: gadget_tripwire
	Checksum: 0x9ED514D9
	Offset: 0x1170
	Size: 0x16C
	Parameters: 0
	Flags: None
*/
function function_b9549a9()
{
	self endon(#"death");
	angles = vectortoangles(self.hitnormal);
	pos = self gettagorigin("tag_fx");
	fxorg = spawn("script_model", pos, 0, angles);
	fxorg.targetname = "gadget_tripwire_fxorg";
	fxorg.angles = angles;
	fxorg setmodel(#"tag_origin");
	self.var_886bd8dc = fxorg;
	fxorg linkto(self);
	if(!isdefined(self.activated))
	{
		self playsound(#"hash_58a0696fb1726978");
		self playloopsound(#"hash_3e09d676ac6291c1", 0.25);
		self.activated = 1;
	}
	self function_684adc9();
}

/*
	Name: function_6c66b650
	Namespace: gadget_tripwire
	Checksum: 0x1982ECC2
	Offset: 0x12E8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_6c66b650()
{
	if(isdefined(self.var_886bd8dc))
	{
		self.var_886bd8dc clientfield::set("tripwire_solo_beam_fx", 0);
	}
}

/*
	Name: function_a4b3da97
	Namespace: gadget_tripwire
	Checksum: 0x92B9F81D
	Offset: 0x1328
	Size: 0x2E
	Parameters: 1
	Flags: None
*/
function function_a4b3da97(trace)
{
	if(trace[#"fraction"] < 1)
	{
		return false;
	}
	return true;
}

/*
	Name: function_55c50f15
	Namespace: gadget_tripwire
	Checksum: 0x288BA4EB
	Offset: 0x1360
	Size: 0x286
	Parameters: 0
	Flags: None
*/
function function_55c50f15()
{
	self endon(#"death");
	self.var_c2f0f6da = 0;
	self.var_5cbe5bde = [];
	foreach(tripwire in level.tripwires)
	{
		if(!isdefined(tripwire))
		{
			continue;
		}
		if(self.owner != tripwire.owner)
		{
			continue;
		}
		if(self == tripwire)
		{
			continue;
		}
		if(distancesquared(tripwire.origin, self.origin) >= 100 && distancesquared(tripwire.origin, self.origin) <= (level.var_c72e8c51.var_831055cb * level.var_c72e8c51.var_831055cb))
		{
			trace = beamtrace(tripwire.var_db7f2def, self.var_db7f2def, 0, self, 0, 0, tripwire);
			var_f2edf308 = beamtrace(self.var_db7f2def, tripwire.var_db7f2def, 0, self, 0, 0, tripwire);
			if(self function_a4b3da97(trace) && self function_a4b3da97(var_f2edf308))
			{
				arrayinsert(self.var_5cbe5bde, tripwire, self.var_5cbe5bde.size);
				self.var_c2f0f6da = 1;
				if(!isdefined(self.activated))
				{
					self playsound(#"hash_58a0696fb1726978");
					self playloopsound(#"hash_3e09d676ac6291c1", 0.25);
					self.activated = 1;
				}
			}
		}
	}
	return self.var_c2f0f6da;
}

/*
	Name: function_55e95173
	Namespace: gadget_tripwire
	Checksum: 0x1904CFCE
	Offset: 0x15F0
	Size: 0x5E
	Parameters: 1
	Flags: None
*/
function function_55e95173(hitent)
{
	if(sessionmodeiswarzonegame())
	{
		return false;
	}
	if(!isdefined(hitent))
	{
		return false;
	}
	if(util::function_fbce7263(self.team, hitent.team))
	{
		return false;
	}
	return true;
}

/*
	Name: function_430b5b99
	Namespace: gadget_tripwire
	Checksum: 0x630E57D5
	Offset: 0x1658
	Size: 0x248
	Parameters: 2
	Flags: None
*/
function function_430b5b99(entity, var_7ffaab28)
{
	if(sessionmodeiswarzonegame() && is_true(self.var_c2f0f6da) && !isdefined(entity))
	{
		return true;
	}
	if(!isdefined(entity))
	{
		return false;
	}
	if(!util::function_fbce7263(entity.team, var_7ffaab28.team))
	{
		return false;
	}
	if(!isplayer(entity) && !isvehicle(entity) && !isai(entity) && !entity ismovingplatform() && !is_true(entity.var_4f564337))
	{
		return false;
	}
	if(isvehicle(entity))
	{
		if(entity isremotecontrol())
		{
			owner = entity getvehicleowner();
			if(!isdefined(owner))
			{
				return false;
			}
		}
		else
		{
			owner = entity getseatoccupant(0);
		}
		if(isplayer(owner) && !util::function_fbce7263(owner.team, var_7ffaab28.team))
		{
			return false;
		}
	}
	if(isplayer(entity) && entity hasperk(#"specialty_nottargetedbytripwire"))
	{
		return false;
	}
	if(isplayer(entity) && entity isjuking())
	{
		return false;
	}
	return true;
}

/*
	Name: function_5b8dea90
	Namespace: gadget_tripwire
	Checksum: 0xAA6F471A
	Offset: 0x18A8
	Size: 0xAA
	Parameters: 1
	Flags: None
*/
function function_5b8dea90(player)
{
	if(!player isgrappling())
	{
		return false;
	}
	if(!util::function_fbce7263(player.team, self.team))
	{
		return false;
	}
	if(player hasperk(#"specialty_nottargetedbytripwire"))
	{
		return false;
	}
	if(distancesquared(player.origin, player.prev_origin) == 0)
	{
		return false;
	}
	return true;
}

/*
	Name: function_d334c3fa
	Namespace: gadget_tripwire
	Checksum: 0xA1C8B1D9
	Offset: 0x1960
	Size: 0x20E
	Parameters: 1
	Flags: None
*/
function function_d334c3fa(endpoint)
{
	self endon(#"death");
	if(!isdefined(self.owner))
	{
		return 0;
	}
	result = 0;
	enemyplayers = getplayers("all", self.origin, level.var_c72e8c51.var_831055cb);
	foreach(player in enemyplayers)
	{
		if(!isdefined(player.prev_origin))
		{
			player.prev_origin = player.origin;
		}
		if(!function_5b8dea90(player))
		{
			player.prev_origin = player.origin;
			continue;
		}
		points = math::function_f16fbd66(self.var_db7f2def, endpoint, player.origin, player.prev_origin, 1);
		if(!isdefined(points))
		{
			return 0;
		}
		mins = player getmins() + points.pointb;
		maxs = player getmaxs() + points.pointb;
		result = function_fc3f770b(mins, maxs, points.pointa);
		if(result)
		{
			return result;
		}
		player.prev_origin = player.origin;
	}
	return result;
}

/*
	Name: function_15de8daf
	Namespace: gadget_tripwire
	Checksum: 0x4E5F61A0
	Offset: 0x1B78
	Size: 0x4BE
	Parameters: 0
	Flags: None
*/
function function_15de8daf()
{
	self endoncallback(&function_84101bb5, #"death");
	self.var_d33355ff = [];
	while(true)
	{
		if(self.var_c2f0f6da)
		{
			foreach(tripwire in self.var_5cbe5bde)
			{
				if(!isdefined(tripwire))
				{
					continue;
				}
				if(self.var_d33355ff.size > 0 && isinarray(self.var_d33355ff, tripwire))
				{
					continue;
				}
				if(!self.detonating && !tripwire.detonating)
				{
					dotrace = 1;
					if(function_d334c3fa(tripwire.var_db7f2def))
					{
						self thread function_9e546fb3(undefined, self.weapon, undefined, tripwire);
						dotrace = 0;
						break;
					}
					if(dotrace)
					{
						tripwire.var_d33355ff[tripwire.var_d33355ff.size] = self;
						trace = beamtrace(tripwire.var_db7f2def, self.var_db7f2def, 1, self, 0, 0, tripwire, 1);
						if(trace[#"fraction"] < 0.99)
						{
							if(function_430b5b99(trace[#"entity"], self))
							{
								level notify(#"tripwire_detonation", {#entity:trace[#"entity"]});
								self thread function_9e546fb3(undefined, self.weapon, undefined, tripwire, trace[#"entity"]);
							}
							if(function_55e95173(trace[#"entity"]))
							{
								trace = beamtrace(self.var_db7f2def, tripwire.var_db7f2def, 1, self, 0, 0, tripwire, 1);
								if(trace[#"fraction"] < 0.99)
								{
									if(function_430b5b99(trace[#"entity"], self))
									{
										level notify(#"tripwire_detonation", {#entity:trace[#"entity"]});
										self thread function_9e546fb3(undefined, self.weapon, undefined, tripwire, trace[#"entity"]);
									}
								}
							}
						}
					}
				}
			}
			self.var_d33355ff = [];
		}
		else if(self.detonating == 0)
		{
			endpos = self.var_db7f2def + (self.hitnormal * level.var_c72e8c51.var_9e266f9b);
			dotrace = 1;
			if(function_d334c3fa(endpos))
			{
				self thread function_9e546fb3(undefined, self.weapon, undefined, undefined);
				dotrace = 0;
				break;
			}
			if(dotrace)
			{
				trace = beamtrace(self.var_db7f2def - (self.hitnormal * 5), endpos, 1, self);
				if(trace[#"fraction"] < 0.95)
				{
					if(function_430b5b99(trace[#"entity"], self))
					{
						self thread function_9e546fb3(undefined, self.weapon, undefined, undefined);
					}
				}
			}
		}
		waitframe(2);
	}
}

/*
	Name: function_84101bb5
	Namespace: gadget_tripwire
	Checksum: 0x714A0022
	Offset: 0x2040
	Size: 0xBC
	Parameters: 1
	Flags: Private
*/
function private function_84101bb5(notifyhash)
{
	beamfx = self.var_886bd8dc;
	killcament = self.killcament;
	self.var_886bd8dc = undefined;
	self.killcament = undefined;
	waitframe(1);
	if(isdefined(beamfx))
	{
		beamfx clientfield::set("tripwire_solo_beam_fx", 0);
		util::wait_network_frame();
		if(isdefined(beamfx))
		{
			beamfx delete();
		}
	}
	if(isdefined(killcament))
	{
		killcament delete();
	}
}

/*
	Name: function_9e546fb3
	Namespace: gadget_tripwire
	Checksum: 0xBDF63B41
	Offset: 0x2108
	Size: 0x9E4
	Parameters: 5
	Flags: None
*/
function function_9e546fb3(attacker, weapon, target, var_2f6adbe3, tripper)
{
	if(!isdefined(self))
	{
		return;
	}
	self endon(#"death");
	if(isdefined(weapon))
	{
		if(self.owner util::isenemyplayer(weapon))
		{
			self.owner globallogic_score::function_5829abe3(weapon, target, self.weapon);
		}
		self radiusdamage(self.origin, 55, 10, 10, self.owner, "MOD_UNKNOWN");
		self battlechatter::function_d2600afc(weapon, self.owner, self.weapon, target);
		self thread function_9b3a657f(target);
	}
	else
	{
		self playsound(#"hash_1f0de5f27d29d3aa");
		self.detonating = 1;
		if(isdefined(var_2f6adbe3))
		{
			var_2f6adbe3.detonating = 1;
		}
		wait(level.var_c72e8c51.var_7f1fc1ee);
		if(!isdefined(self))
		{
			return;
		}
		if(isdefined(var_2f6adbe3))
		{
			explosiondist = (isdefined(level.var_c72e8c51.var_e44a7667) ? level.var_c72e8c51.var_e44a7667 : 0);
			var_15d2965b = (isdefined(level.var_c72e8c51.var_b1f240d7) ? level.var_c72e8c51.var_b1f240d7 : 0);
			var_36684ed2 = (isdefined(level.var_c72e8c51.var_d484364c) ? level.var_c72e8c51.var_d484364c : 0);
			maxdamage = (isdefined(level.var_c72e8c51.var_89d80d88) ? level.var_c72e8c51.var_89d80d88 : 0);
			mindamage = (isdefined(level.var_c72e8c51.var_cd9b7eaf) ? level.var_c72e8c51.var_cd9b7eaf : 0);
		}
		else
		{
			explosiondist = (isdefined(level.var_c72e8c51.var_13e9ceba) ? level.var_c72e8c51.var_13e9ceba : 0);
			var_15d2965b = (isdefined(level.var_c72e8c51.var_d0a598a5) ? level.var_c72e8c51.var_d0a598a5 : 0);
			var_36684ed2 = (isdefined(level.var_c72e8c51.var_fcb3348e) ? level.var_c72e8c51.var_fcb3348e : 0);
			maxdamage = (isdefined(level.var_c72e8c51.var_aebac5e5) ? level.var_c72e8c51.var_aebac5e5 : 0);
			mindamage = (isdefined(level.var_c72e8c51.var_69bf01c2) ? level.var_c72e8c51.var_69bf01c2 : 0);
		}
		explosiondir = self.hitnormal;
		explosionsound = #"exp_tripwire";
		if(isdefined(var_2f6adbe3))
		{
			explosionsound = #"exp_tripwire";
			explosiondir = self.origin - var_2f6adbe3.origin;
			explosiondir = vectornormalize(explosiondir);
			var_dcd20d50 = perpendicularvector(explosiondir);
			owner = (isentity(var_2f6adbe3.owner) ? var_2f6adbe3.owner : undefined);
			var_2f6adbe3 cylinderdamage(explosiondir * explosiondist, var_2f6adbe3.origin, var_15d2965b, var_36684ed2, maxdamage, mindamage, owner, "MOD_EXPLOSIVE", self.weapon);
			playfx(#"hash_69455dfeef0311c2", var_2f6adbe3.origin, explosiondir, var_dcd20d50);
			playsoundatposition(explosionsound, self.origin);
			playsoundatposition(explosionsound, var_2f6adbe3.origin);
			var_2f6adbe3 ghost();
			explosiondir = var_2f6adbe3.origin - self.origin;
			explosiondir = vectornormalize(explosiondir);
		}
		if(isdefined(self))
		{
			if(!isdefined(explosiondir))
			{
				ang = self.angles;
				if(isdefined(ang))
				{
					explosiondir = anglestoforward(ang);
				}
				else
				{
					explosiondir = (1, 0, 0);
				}
			}
			var_dcd20d50 = perpendicularvector(explosiondir);
			playfx(#"hash_69455dfeef0311c2", self.origin, explosiondir, var_dcd20d50);
			self playsound(explosionsound);
			if(!isdefined(self.hitnormal))
			{
				self.hitnormal = (0, 0, 1);
			}
			if(isdefined(tripper) && isvehicle(tripper))
			{
				if(isdefined(var_2f6adbe3))
				{
					maxdamage = maxdamage * 1.5;
					mindamage = mindamage * 1.5;
				}
				self radiusdamage(self.origin + (self.hitnormal * 5), explosiondist * 0.75, maxdamage, mindamage, self.owner, "MOD_EXPLOSIVE", self.weapon);
			}
			else
			{
				if(!isdefined(var_2f6adbe3))
				{
					self radiusdamage(self.origin + (self.hitnormal * 5), explosiondist / 2, maxdamage, mindamage, self.owner, "MOD_EXPLOSIVE", self.weapon);
				}
				else
				{
					self cylinderdamage(explosiondir * explosiondist, self.origin, var_15d2965b, var_36684ed2, maxdamage, mindamage, self.owner, "MOD_EXPLOSIVE", self.weapon);
				}
			}
		}
	}
	self ghost();
	wait(0.1);
	if(!isdefined(self))
	{
		return;
	}
	if(isdefined(var_2f6adbe3))
	{
		arrayremovevalue(level.tripwires, var_2f6adbe3);
		if(isdefined(var_2f6adbe3.var_886bd8dc))
		{
			var_2f6adbe3.var_886bd8dc clientfield::set("tripwire_solo_beam_fx", 0);
			util::wait_network_frame();
			if(isdefined(var_2f6adbe3) && isdefined(var_2f6adbe3.var_886bd8dc))
			{
				var_2f6adbe3.var_886bd8dc delete();
				var_2f6adbe3.var_886bd8dc = undefined;
			}
		}
		if(isdefined(self.killcament))
		{
			self.killcament delete();
			self.killcament = undefined;
		}
		if(isdefined(var_2f6adbe3))
		{
			if(isdefined(var_2f6adbe3.killcament))
			{
				var_2f6adbe3.killcament delete();
			}
			var_2f6adbe3 delete();
		}
	}
	self stoploopsound(0.5);
	arrayremovevalue(level.tripwires, self);
	if(isdefined(self.var_886bd8dc))
	{
		self.var_886bd8dc clientfield::set("tripwire_solo_beam_fx", 0);
		util::wait_network_frame();
		if(!isdefined(self))
		{
			return;
		}
		if(isdefined(self.var_886bd8dc))
		{
			self.var_886bd8dc delete();
			self.var_886bd8dc = undefined;
		}
	}
	if(isdefined(self.killcament))
	{
		self.killcament delete();
		self.killcament = undefined;
	}
	level thread function_d77f9442();
	self delete();
}

/*
	Name: function_9a98f669
	Namespace: gadget_tripwire
	Checksum: 0x4A41734
	Offset: 0x2AF8
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function function_9a98f669(player)
{
	self function_9b3a657f(undefined);
}

/*
	Name: function_9b3a657f
	Namespace: gadget_tripwire
	Checksum: 0x10235B4F
	Offset: 0x2B28
	Size: 0x22C
	Parameters: 1
	Flags: None
*/
function function_9b3a657f(weapon)
{
	self clientfield::set("friendlyequip", 1);
	playfx(#"hash_65c5042becfbaa7d", self.origin);
	if(isdefined(level.var_c72e8c51.var_bb6c29b4) && isdefined(weapon) && weapon == getweapon(#"shock_rifle"))
	{
		playfx(level.var_c72e8c51.var_bb6c29b4, self.origin);
	}
	playsoundatposition(#"hash_5a530df2bd2b027c", self.origin);
	self stoploopsound(0.5);
	arrayremovevalue(level.tripwires, self);
	var_886bd8dc = self.var_886bd8dc;
	killcament = self.killcament;
	if(isdefined(var_886bd8dc))
	{
		var_886bd8dc clientfield::set("tripwire_solo_beam_fx", 0);
		util::wait_network_frame();
		if(isdefined(var_886bd8dc))
		{
			var_886bd8dc delete();
			if(isdefined(self))
			{
				self.var_886bd8dc = undefined;
			}
		}
	}
	if(isdefined(killcament))
	{
		killcament delete();
		if(isdefined(self))
		{
			self.killcament = undefined;
		}
	}
	level thread function_d77f9442();
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: function_7a905654
	Namespace: gadget_tripwire
	Checksum: 0xE8B57DCB
	Offset: 0x2D60
	Size: 0x34A
	Parameters: 1
	Flags: None
*/
function function_7a905654(watcher)
{
	self endon(#"death");
	self setcandamage(1);
	damagemax = 20;
	self.maxhealth = 100000;
	self.health = self.maxhealth;
	self.damagetaken = 0;
	attacker = undefined;
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"damage");
		attacker = waitresult.attacker;
		weapon = waitresult.weapon;
		damage = waitresult.amount;
		type = waitresult.mod;
		idflags = waitresult.flags;
		if(weapon == getweapon("eq_tripwire"))
		{
			continue;
		}
		damage = weapons::function_74bbb3fa(damage, weapon, self.weapon);
		attacker = self [[level.figure_out_attacker]](waitresult.attacker);
		if(!isdefined(self.owner))
		{
			continue;
		}
		if(level.teambased && isplayer(attacker))
		{
			if(!is_true(level.hardcoremode) && !util::function_fbce7263(self.owner.team, attacker.pers[#"team"]) && self.owner !== attacker)
			{
				continue;
			}
		}
		if(watcher.stuntime > 0 && weapon.dostun)
		{
			self thread weaponobjects::stunstart(watcher, watcher.stuntime);
		}
		if(damage::friendlyfirecheck(self.owner, attacker))
		{
			if(damagefeedback::dodamagefeedback(weapon, attacker))
			{
				attacker damagefeedback::update();
			}
		}
		if(type == "MOD_MELEE" || weapon.isemp || weapon.destroysequipment)
		{
			self.damagetaken = damagemax;
		}
		else
		{
			self.damagetaken = self.damagetaken + damage;
		}
		if(self.damagetaken >= damagemax)
		{
			watcher thread weaponobjects::waitanddetonate(self, 0.05, attacker, weapon);
			return;
		}
	}
}

