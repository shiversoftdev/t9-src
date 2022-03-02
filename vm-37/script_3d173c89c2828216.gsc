#using script_164a456ce05c3483;
#using script_17dcb1172e441bf6;
#using script_1a9763988299e68d;
#using script_1b01e95a6b5270fd;
#using script_1b0b07ff57d1dde3;
#using script_1ee011cd0961afd7;
#using script_2a5bf5b4a00cee0d;
#using script_350cffecd05ef6cf;
#using script_40f967ad5d18ea74;
#using script_47851dbeea22fe66;
#using script_4d748e58ce25b60c;
#using script_5701633066d199f2;
#using script_5f20d3b434d24884;
#using script_74a56359b7d02ab6;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_5f74ac47;

/*
	Name: function_f44fbe7c
	Namespace: namespace_5f74ac47
	Checksum: 0xDB8EBDE9
	Offset: 0x270
	Size: 0x174
	Parameters: 0
	Flags: Linked
*/
function function_f44fbe7c()
{
	if(!isdefined(self.doa.var_121de807))
	{
		self.doa.var_121de807 = namespace_ec06fe4a::spawntrigger("trigger_radius", self.origin, (1 | 512) | 8, 130, 50);
		if(isdefined(self.doa.var_121de807))
		{
			self.doa.var_121de807.targetname = "stunBear";
			self.doa.var_121de807 enablelinkto();
			self.doa.var_121de807 linkto(self);
			self.doa.var_121de807 thread function_510ce803(self);
			self namespace_e32bb68::function_3a59ec34("evt_doa_pickup_teddybear_active_lp");
			self namespace_83eb6304::function_3ecfde67("stunbear");
		}
	}
	self thread function_6a9ffef0();
	self thread function_7343529d(self.doa.var_121de807);
}

/*
	Name: function_79cb4037
	Namespace: namespace_5f74ac47
	Checksum: 0xBA1D0764
	Offset: 0x3F0
	Size: 0x204
	Parameters: 0
	Flags: Linked, Private
*/
function private function_79cb4037()
{
	self notify("36c490e4e613efc0");
	self endon("36c490e4e613efc0");
	self endon(#"death");
	self.doa.stunned = 1;
	self namespace_83eb6304::function_3ecfde67("stunbear_affected");
	if(!is_true(self.doa.var_74e4ded8))
	{
		self.doa.var_db417b61 = self.doa.original_origin;
		self.doa.var_33b29baf = 1;
	}
	else
	{
		self.doa.var_db417b61 = self.origin;
		self.doa.var_33b29baf = 2;
	}
	self namespace_250e9486::function_41354e51(self.doa.var_db417b61, 1, self.doa.var_33b29baf);
	wait(20);
	if(self.zombie_move_speed == "walk")
	{
		self.zombie_move_speed = "run";
	}
	self.doa.stunned = 0;
	self namespace_83eb6304::turnofffx("stunbear_affected");
	self.ignoreall = 0;
	self clearenemy();
	self.favoriteenemy = undefined;
	self namespace_250e9486::function_4b49bf0d();
	if(isdefined(self.favoriteenemy))
	{
		self namespace_250e9486::function_41354e51(self namespace_250e9486::function_bd5a9fa6());
	}
	else
	{
		self thread namespace_ec06fe4a::function_570729f0(1);
	}
}

/*
	Name: function_510ce803
	Namespace: namespace_5f74ac47
	Checksum: 0x2482D926
	Offset: 0x600
	Size: 0x1B0
	Parameters: 1
	Flags: Linked, Private
*/
function private function_510ce803(player)
{
	self notify("38569382751b81b1");
	self endon("38569382751b81b1");
	player endon(#"hash_26b5087b9dec0906");
	if(isplayer(player))
	{
		player endon(#"disconnect");
	}
	self endon(#"death");
	while(true)
	{
		result = undefined;
		result = self waittill(#"trigger");
		guy = result.activator;
		if(!isdefined(guy) || !isdefined(guy.doa))
		{
			continue;
		}
		if(is_true(guy.var_bbdaef90) || is_true(guy.boss))
		{
			continue;
		}
		if(guy.doa.stunned === 0)
		{
			guy namespace_e32bb68::function_3a59ec34("evt_doa_pickup_teddybear_repulse");
			guy namespace_83eb6304::function_3ecfde67("stunbear_contact");
			player playrumbleonentity("slide_rumble");
			guy thread function_79cb4037();
		}
	}
}

/*
	Name: function_6a9ffef0
	Namespace: namespace_5f74ac47
	Checksum: 0xC499D1E2
	Offset: 0x7B8
	Size: 0xD6
	Parameters: 0
	Flags: Linked, Private
*/
function private function_6a9ffef0()
{
	self notify("4f772c13159aefb3");
	self endon("4f772c13159aefb3");
	self endon(#"hash_26b5087b9dec0906");
	if(isplayer(self))
	{
		self endon(#"disconnect");
	}
	timeout = self doa_fate::function_4808b985(20);
	self waittilltimeout(timeout, #"entering_last_stand", #"doa_exit_taken", #"player_died", #"death");
	self notify(#"hash_26b5087b9dec0906");
}

/*
	Name: function_7343529d
	Namespace: namespace_5f74ac47
	Checksum: 0xE93C415F
	Offset: 0x898
	Size: 0x17C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7343529d(trigger)
{
	self notify("38070fbe679eeaab");
	self endon("38070fbe679eeaab");
	self waittill(#"hash_26b5087b9dec0906", #"disconnect", #"doa_exit_taken", #"clone_shutdown");
	if(isdefined(self))
	{
		self notify(#"hash_26b5087b9dec0906");
		self namespace_83eb6304::turnofffx("stunbear");
		self namespace_83eb6304::function_3ecfde67("stunbear_fade");
		self stoploopsound(2);
	}
	wait(0.5);
	util::wait_network_frame();
	if(isdefined(self))
	{
		self namespace_e32bb68::function_ae271c0b("evt_doa_pickup_teddybear_active_lp");
		self namespace_e32bb68::function_3a59ec34("evt_doa_pickup_teddybear_active_end");
		self namespace_83eb6304::turnofffx("stunbear_fade");
	}
	if(isdefined(trigger))
	{
		trigger delete();
	}
}

