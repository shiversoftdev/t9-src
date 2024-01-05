#using script_1a9763988299e68d;
#using script_2a5bf5b4a00cee0d;
#using script_40f967ad5d18ea74;
#using script_47851dbeea22fe66;
#using script_164a456ce05c3483;
#using script_4d748e58ce25b60c;
#using script_5f20d3b434d24884;
#using script_1b0b07ff57d1dde3;
#using script_1ee011cd0961afd7;
#using script_350cffecd05ef6cf;
#using script_5701633066d199f2;
#using script_1b01e95a6b5270fd;
#using script_17dcb1172e441bf6;
#using script_74a56359b7d02ab6;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_dcd37093;

/*
	Name: function_d28e9b17
	Namespace: namespace_dcd37093
	Checksum: 0x6C719173
	Offset: 0x2B0
	Size: 0x494
	Parameters: 0
	Flags: Linked
*/
function function_d28e9b17()
{
	if(isplayer(self))
	{
		self endon(#"disconnect");
	}
	self notify(#"hash_562d458e34274132");
	waitframe(1);
	self endon(#"hash_1e2c098e8231a30f", #"hash_562d458e34274132");
	org = namespace_ec06fe4a::function_e22ae9b3(self.origin, "tag_origin");
	if(isdefined(org))
	{
		org.targetname = "boxingPickupUpdate";
		org.angles = (0, randomint(180), 0);
		org setmodel("tag_origin");
		self.doa.var_c3159deb = org;
	}
	else
	{
		return;
	}
	leftglove = namespace_ec06fe4a::function_e22ae9b3(self.origin + (0, 60, 32), "zombietron_boxing_gloves_lt");
	if(isdefined(leftglove))
	{
		leftglove.targetname = "leftglove";
		leftglove setplayercollision(0);
		leftglove linkto(org, "tag_origin", (0, 60, 32), vectorscale((1, 0, 0), 90));
		trigger = namespace_ec06fe4a::spawntrigger("trigger_radius", leftglove.origin, (1 | 512) | 8, 40, 50);
		if(isdefined(trigger))
		{
			trigger.targetname = "leftGlove";
			trigger enablelinkto();
			trigger linkto(leftglove);
			trigger thread function_7c757878(self, "MOD_IMPACT", &function_c2d94d61);
		}
	}
	org.var_f9c2f48c = leftglove;
	org.trigger1 = trigger;
	rightglove = namespace_ec06fe4a::function_e22ae9b3(self.origin + (0, -60, 32), "zombietron_boxing_gloves_rt");
	if(isdefined(rightglove))
	{
		rightglove.targetname = "rightGlove";
		rightglove setplayercollision(0);
		rightglove linkto(org, "tag_origin", (0, -60, 32), vectorscale((1, 0, 0), 90));
		trigger = namespace_ec06fe4a::spawntrigger("trigger_radius", rightglove.origin, (1 | 512) | 8, 40, 50);
		if(isdefined(trigger))
		{
			trigger.targetname = "rightGlove";
			trigger enablelinkto();
			trigger linkto(rightglove);
			trigger thread function_7c757878(self, "MOD_IMPACT", &function_c2d94d61);
		}
	}
	org.var_b981836 = rightglove;
	org.trigger2 = trigger;
	org linkto(self, "", vectorscale((0, 0, 1), 10), (0, 0, 0));
	self thread function_61888137(org);
	self thread function_f0855523(org);
	self waittill(#"hash_6733dfa48ff87a81");
	leftglove setmodel("zombietron_boxing_gloves_expiring_lt");
	rightglove setmodel("zombietron_boxing_gloves_expiring_rt");
}

/*
	Name: function_c2d94d61
	Namespace: namespace_dcd37093
	Checksum: 0xA20BAB8C
	Offset: 0x750
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function function_c2d94d61()
{
	self namespace_83eb6304::function_3ecfde67("boxing_stars");
	waitresult = undefined;
	waitresult = self waittilltimeout(2, #"actor_corpse", #"entitydeleted");
	if(isdefined(waitresult.corpse))
	{
		waitresult.corpse namespace_83eb6304::function_3ecfde67("boxing_stars");
	}
}

/*
	Name: function_7c757878
	Namespace: namespace_dcd37093
	Checksum: 0x795FADB4
	Offset: 0x7F0
	Size: 0x230
	Parameters: 3
	Flags: Linked, Private
*/
function private function_7c757878(player, mod, var_70c63791)
{
	if(!isdefined(mod))
	{
		mod = "MOD_CRUSH";
	}
	player endon(#"hash_1e2c098e8231a30f");
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
		if(isplayer(guy))
		{
			continue;
		}
		if(isvehicle(guy))
		{
			continue;
		}
		if(is_true(guy.var_b88e74c3) || is_true(guy.boss))
		{
			continue;
		}
		if(is_true(guy.knocked_out))
		{
			continue;
		}
		guy namespace_e32bb68::function_3a59ec34("evt_doa_pickup_boxers_active_impact");
		guy namespace_83eb6304::function_3ecfde67("boxing_pow");
		if(isdefined(var_70c63791))
		{
			guy thread [[var_70c63791]]();
		}
		guy.knocked_out = 1;
		dir = guy.origin - self.origin;
		guy thread namespace_ec06fe4a::function_5678f0d(dir, 50, 0.1, player);
		guy thread namespace_ec06fe4a::function_570729f0(0.05, player, mod);
		player playrumbleonentity("damage_light");
	}
}

/*
	Name: function_61888137
	Namespace: namespace_dcd37093
	Checksum: 0xA3CA3A2D
	Offset: 0xA28
	Size: 0x146
	Parameters: 1
	Flags: Linked, Private
*/
function private function_61888137(org)
{
	self endon(#"hash_1e2c098e8231a30f", #"hash_562d458e34274132");
	if(isplayer(self))
	{
		self endon(#"disconnect");
	}
	timeout = 30;
	if(self doa_fate::function_d438e371())
	{
		timeout = self doa_fate::function_4808b985(30);
	}
	if(self doa_fate::function_8a19ece())
	{
		timeout = int(48);
	}
	while(!doa_pickups::function_f759a457())
	{
		waitframe(1);
	}
	wait(timeout - 3);
	if(isdefined(self))
	{
		self notify(#"hash_6733dfa48ff87a81");
	}
	wait(3);
	self namespace_e32bb68::function_3a59ec34("evt_doa_pickup_boxers_active_end");
	self notify(#"hash_1e2c098e8231a30f");
}

/*
	Name: function_f0855523
	Namespace: namespace_dcd37093
	Checksum: 0xBF320801
	Offset: 0xB78
	Size: 0x334
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f0855523(org)
{
	result = undefined;
	result = self waittill(#"hash_1e2c098e8231a30f", #"entering_last_stand", #"hash_77af89fb2b44942f", #"hash_df25520ab279dff", #"hash_562d458e34274132", #"player_died", #"disconnect", #"enter_vehicle", #"death", #"clone_shutdown");
	self notify(#"hash_1e2c098e8231a30f");
	if(isdefined(org) && isdefined(org.trigger1))
	{
		org.trigger1 delete();
	}
	if(isdefined(org) && isdefined(org.trigger2))
	{
		org.trigger2 delete();
	}
	if(isdefined(org) && isdefined(org.var_f9c2f48c))
	{
		org.var_f9c2f48c unlink();
	}
	if(isdefined(org) && isdefined(org.var_b981836))
	{
		org.var_b981836 unlink();
	}
	if(isdefined(self))
	{
		if(isdefined(org) && isdefined(org.var_f9c2f48c))
		{
			vel = org.var_f9c2f48c.origin - self.origin;
			org.var_f9c2f48c physicslaunch(org.var_f9c2f48c.origin, vel);
		}
		if(isdefined(org) && isdefined(org.var_b981836))
		{
			vel = org.var_b981836.origin - self.origin;
			org.var_b981836 physicslaunch(org.var_b981836.origin, vel);
		}
		self.doa.var_c3159deb = undefined;
	}
	wait(5);
	if(isdefined(org) && isdefined(org.var_f9c2f48c))
	{
		org.var_f9c2f48c delete();
	}
	if(isdefined(org) && isdefined(org.var_b981836))
	{
		org.var_b981836 delete();
	}
	if(isdefined(org))
	{
		org delete();
	}
}

