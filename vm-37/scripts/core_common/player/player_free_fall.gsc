#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\player\player_insertion.gsc;
#using script_1d29de500c266470;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace player_free_fall;

/*
	Name: __init__system__
	Namespace: player_free_fall
	Checksum: 0x8D822FD7
	Offset: 0xF0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"player_free_fall", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: player_free_fall
	Checksum: 0x5303E71
	Offset: 0x138
	Size: 0x134
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_7abaaef1 = getdvarint(#"player_freefall", 0);
	if(is_true(level.var_7abaaef1))
	{
		function_7c19fac2();
		return;
	}
	callback::add_callback(#"debug_movement", &function_a7e644f6);
	callback::add_callback(#"freefall", &function_a0950b54);
	callback::add_callback(#"parachute", &function_c75bd5cb);
	callback::add_callback(#"hash_171443902e2a22ee", &function_f99c2453);
	/#
		level thread function_1fc427dc();
	#/
}

/*
	Name: function_a0950b54
	Namespace: player_free_fall
	Checksum: 0xCD1180AE
	Offset: 0x278
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_a0950b54(event_params)
{
	self val::set(#"player_free_fall", "show_weapon_hud", 0);
	self callback::function_d8abfc3d(#"death", &function_c76a70ab);
}

/*
	Name: function_c75bd5cb
	Namespace: player_free_fall
	Checksum: 0xB5BE6355
	Offset: 0x2E8
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_c75bd5cb(event_params)
{
	self val::set(#"player_free_fall", "show_weapon_hud", 0);
}

/*
	Name: function_f99c2453
	Namespace: player_free_fall
	Checksum: 0xE7D7C398
	Offset: 0x328
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_f99c2453(event_params)
{
	self val::reset(#"player_free_fall", "show_weapon_hud");
	self callback::function_52ac9652(#"death", &function_c76a70ab);
}

/*
	Name: function_c76a70ab
	Namespace: player_free_fall
	Checksum: 0x8182913F
	Offset: 0x398
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_c76a70ab(event_params)
{
	self val::reset(#"player_free_fall", "show_weapon_hud");
	self callback::function_52ac9652(#"death", &function_c76a70ab);
}

/*
	Name: allow_player_basejumping
	Namespace: player_free_fall
	Checksum: 0xB5D1E51F
	Offset: 0x408
	Size: 0xC4
	Parameters: 1
	Flags: None
*/
function allow_player_basejumping(bool)
{
	if(!isdefined(self.enabledbasejumping))
	{
		self.enabledbasejumping = 0;
	}
	if(bool)
	{
		self.enabledbasejumping++;
		self function_8b8a321a(1);
		self function_8a945c0e(1);
	}
	else
	{
		self.enabledbasejumping--;
		if(self.enabledbasejumping < 0)
		{
			self.enabledbasejumping = 0;
		}
		if(!self.enabledbasejumping)
		{
			self function_8b8a321a(0);
			self function_8a945c0e(0);
		}
	}
}

/*
	Name: function_2979b1be
	Namespace: player_free_fall
	Checksum: 0x7464E11C
	Offset: 0x4D8
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function function_2979b1be(waitsec)
{
	self endon(#"death", #"disconnect");
	if(isdefined(waitsec) && waitsec > 0)
	{
		self function_8a945c0e(0);
		self function_8b8a321a(0);
		wait(waitsec);
	}
	if(isdefined(self))
	{
		if(self player_insertion::function_b9370594())
		{
			return;
		}
		self function_8a945c0e(1);
		self function_8b8a321a(1);
	}
}

/*
	Name: function_7705a7fc
	Namespace: player_free_fall
	Checksum: 0x43FE0DAD
	Offset: 0x5B0
	Size: 0xB4
	Parameters: 2
	Flags: Linked
*/
function function_7705a7fc(fall_time, velocity)
{
	if(is_true(level.var_7abaaef1))
	{
		self function_2ffa8aaf(1, velocity, 1);
		return;
	}
	self function_8cf53a19();
	if(isdefined(velocity))
	{
		self setvelocity(velocity);
	}
	self function_b02c52b();
	wait(fall_time);
	self thread pull_chute();
}

/*
	Name: parachutemidairdeathwatcher
	Namespace: player_free_fall
	Checksum: 0x80F724D1
	Offset: 0x670
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function parachutemidairdeathwatcher()
{
}

/*
	Name: pull_chute
	Namespace: player_free_fall
	Checksum: 0x3DED595A
	Offset: 0x680
	Size: 0xE4
	Parameters: 0
	Flags: Linked
*/
function pull_chute()
{
	self endon(#"death", #"disconnect");
	self thread function_2979b1be(3);
	self waittill(#"skydive_deployparachute");
	self function_8a945c0e(0);
	self notify(#"hash_6296a62cf6a8a8c4");
	if(!is_true(level.dontshootwhileparachuting) && isdefined(level.parachuteopencb))
	{
		self [[level.parachuteopencb]]();
	}
	self thread function_156d91ef();
}

/*
	Name: function_156d91ef
	Namespace: player_free_fall
	Checksum: 0x3E0814B6
	Offset: 0x770
	Size: 0x148
	Parameters: 0
	Flags: Linked
*/
function function_156d91ef()
{
	self endon(#"death", #"disconnect");
	if(getdvarint(#"scr_parachute_camera_transition_mode", 1) == 1)
	{
		self function_41170420(0);
	}
	self waittill(#"hash_171443902e2a22ee");
	waitframe(1);
	if(isdefined(level.parachuterestoreweaponscb))
	{
		self [[level.parachuterestoreweaponscb]]();
	}
	if(is_true(level.dontshootwhileparachuting) && isdefined(level.parachutecompletecb))
	{
		self [[level.parachutecompletecb]]();
	}
	self notify(#"hash_56c07a749ce0f359");
	self function_41170420(0);
	self notify(#"parachute_complete");
	if(isdefined(level.onfirstlandcallback))
	{
		self [[level.onfirstlandcallback]](self);
	}
}

/*
	Name: function_5352af94
	Namespace: player_free_fall
	Checksum: 0xADD945C0
	Offset: 0x8C0
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function function_5352af94()
{
	player = self;
	player function_8cf53a19();
	if(isdefined(player.parachute))
	{
		player.parachute delete();
	}
}

/*
	Name: function_a7e644f6
	Namespace: player_free_fall
	Checksum: 0x80D0FF43
	Offset: 0x918
	Size: 0xEC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a7e644f6(eventstruct)
{
	if(!eventstruct.debug_movement)
	{
		if(getdvarint(#"hash_bfa71d08f383550", 0))
		{
			speed = 17.6 * getdvarint(#"hash_3d4ce3a554eac78", 100);
			velocity = anglestoforward(self getplayerangles()) * speed;
			self function_7705a7fc(getdvarint(#"hash_bfa71d08f383550", 0) == 1, velocity);
		}
	}
}

/*
	Name: function_1fc427dc
	Namespace: player_free_fall
	Checksum: 0x5A94C7DF
	Offset: 0xA10
	Size: 0x44
	Parameters: 0
	Flags: Private
*/
function private function_1fc427dc()
{
	/#
		waitframe(1);
		waitframe(1);
		adddebugcommand("");
		adddebugcommand("");
	#/
}

/*
	Name: function_7c19fac2
	Namespace: player_free_fall
	Checksum: 0x3C975FC4
	Offset: 0xA60
	Size: 0xAC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_7c19fac2()
{
	callback::add_callback(#"freefall", &function_6a663396);
	callback::add_callback(#"parachute", &function_bd421742);
	callback::add_callback(#"debug_movement", &function_a7e644f6);
	/#
		level thread function_1fc427dc();
	#/
}

/*
	Name: function_d2a1520c
	Namespace: player_free_fall
	Checksum: 0x17B75A19
	Offset: 0xB18
	Size: 0x52
	Parameters: 0
	Flags: Linked
*/
function function_d2a1520c()
{
	wingsuit = self namespace_eb06e24d::function_c772633d();
	if(self util::is_female())
	{
		return wingsuit.var_5677bd3d;
	}
	return wingsuit.var_94166112;
}

/*
	Name: function_27f21242
	Namespace: player_free_fall
	Checksum: 0xDDADB25A
	Offset: 0xB78
	Size: 0x8C
	Parameters: 1
	Flags: None
*/
function function_27f21242(freefall)
{
	model = function_d2a1520c();
	if(freefall)
	{
		if(!self isattached(model))
		{
			self attach(model);
		}
	}
	else if(self isattached(model))
	{
		self detach(model);
	}
}

/*
	Name: function_6a663396
	Namespace: player_free_fall
	Checksum: 0x64158AF5
	Offset: 0xC10
	Size: 0x184
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6a663396(eventstruct)
{
	if(eventstruct.freefall)
	{
		if(!isdefined(eventstruct.var_695a7111) || eventstruct.var_695a7111)
		{
			parachute = self namespace_eb06e24d::function_fc6b6f3b();
			parachute_weapon = parachute.("parachute");
			if(isdefined(parachute_weapon))
			{
				if(!self hasweapon(parachute_weapon))
				{
					self giveweapon(parachute_weapon);
				}
				self switchtoweaponimmediate(parachute_weapon);
				self thread function_b6e83203(0.5);
			}
		}
	}
	else
	{
		if(!self function_9a0edd92())
		{
			parachute = self namespace_eb06e24d::function_fc6b6f3b();
			parachute_weapon = parachute.("parachute");
			if(isdefined(parachute_weapon))
			{
				if(self hasweapon(parachute_weapon))
				{
					self takeweapon(parachute_weapon);
				}
			}
		}
		self setclientuivisibilityflag("weapon_hud_visible", 1);
	}
}

/*
	Name: function_6aac1790
	Namespace: player_free_fall
	Checksum: 0xE361F809
	Offset: 0xDA0
	Size: 0x3A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6aac1790(var_dbb94a)
{
}

/*
	Name: function_b6e83203
	Namespace: player_free_fall
	Checksum: 0x869F8B3B
	Offset: 0xDE8
	Size: 0x8C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b6e83203(delay)
{
	if(isdefined(delay))
	{
		self endon(#"death", #"disconnect");
		wait(delay);
	}
	parachute = self namespace_eb06e24d::function_fc6b6f3b();
	var_dbb94a = parachute.("parachuteLit");
	function_6aac1790(var_dbb94a);
}

/*
	Name: function_bd421742
	Namespace: player_free_fall
	Checksum: 0x9F6392F
	Offset: 0xE80
	Size: 0xCC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_bd421742(eventstruct)
{
	if(eventstruct.parachute)
	{
		self function_b6e83203();
	}
	else
	{
		parachute = self namespace_eb06e24d::function_fc6b6f3b();
		parachute_weapon = parachute.("parachute");
		var_dbb94a = parachute.("parachuteLit");
		if(isdefined(parachute_weapon))
		{
			self takeweapon(parachute_weapon);
		}
		self setclientuivisibilityflag("weapon_hud_visible", 1);
	}
}

/*
	Name: function_a2b7e8a1
	Namespace: player_free_fall
	Checksum: 0x1DF3D54B
	Offset: 0xF58
	Size: 0x164
	Parameters: 0
	Flags: Private
*/
function private function_a2b7e8a1()
{
	/#
		mapname = util::get_map_name();
		waitframe(1);
		waitframe(1);
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand(("" + mapname) + "");
		adddebugcommand(("" + mapname) + "");
		adddebugcommand(("" + mapname) + "");
		adddebugcommand(("" + mapname) + "");
		waitframe(1);
		adddebugcommand(("" + mapname) + "");
	#/
}

