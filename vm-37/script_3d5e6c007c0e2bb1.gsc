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

#namespace namespace_bf41daf8;

/*
	Name: barrelupdate
	Namespace: namespace_bf41daf8
	Checksum: 0x3D3056AE
	Offset: 0x220
	Size: 0x568
	Parameters: 1
	Flags: Linked
*/
function barrelupdate(model_name)
{
	if(!isdefined(model_name))
	{
		model_name = "zombietron_barrel";
	}
	self notify(#"hash_562d458e34274132");
	if(isplayer(self))
	{
		self endon(#"disconnect");
	}
	waitframe(1);
	self endon(#"hash_3e2226cc328d43a7", #"hash_562d458e34274132");
	org = namespace_ec06fe4a::function_e22ae9b3(self.origin, "tag_origin");
	if(isdefined(org))
	{
		org.targetname = "barrelUpdate";
		org.angles = (0, randomint(180), 0);
		self.doa.var_ba83e9 = org;
		if(isplayer(self))
		{
			org thread namespace_ec06fe4a::function_ae010bb4(self);
		}
	}
	else
	{
		return;
	}
	barrel = namespace_ec06fe4a::function_e22ae9b3(self.origin + vectorscale((0, 1, 0), 90), model_name);
	if(isdefined(barrel))
	{
		barrel.targetname = "barrel1";
		barrel setplayercollision(0);
		barrel linkto(org, "tag_origin", vectorscale((0, 1, 0), 90));
		if(isplayer(self))
		{
			barrel thread namespace_ec06fe4a::function_ae010bb4(self);
		}
		trigger = namespace_ec06fe4a::spawntrigger("trigger_radius", barrel.origin, (1 | 512) | 8, 40, 50);
		if(isdefined(trigger))
		{
			if(isplayer(self))
			{
				trigger thread namespace_ec06fe4a::function_ae010bb4(self);
			}
			trigger.targetname = "barrel1";
			trigger enablelinkto();
			trigger linkto(barrel);
			trigger thread function_7c757878(self);
		}
	}
	org.barrel1 = barrel;
	org.trigger1 = trigger;
	barrel = namespace_ec06fe4a::function_e22ae9b3(self.origin + (vectorscale((0, -1, 0), 90)), model_name);
	if(isdefined(barrel))
	{
		if(isplayer(self))
		{
			barrel thread namespace_ec06fe4a::function_ae010bb4(self);
		}
		barrel.targetname = "barrel2";
		barrel setmodel(model_name);
		barrel setplayercollision(0);
		barrel linkto(org, "tag_origin", vectorscale((0, -1, 0), 90));
		trigger = namespace_ec06fe4a::spawntrigger("trigger_radius", barrel.origin, (1 | 512) | 8, 40, 50);
		if(isdefined(trigger))
		{
			if(isplayer(self))
			{
				trigger thread namespace_ec06fe4a::function_ae010bb4(self);
			}
			trigger.targetname = "barrel2";
			trigger enablelinkto();
			trigger linkto(barrel);
			trigger thread function_7c757878(self);
		}
	}
	org.barrel2 = barrel;
	org.trigger2 = trigger;
	org linkto(self, "", vectorscale((0, 0, 1), 10), (0, 0, 0));
	self namespace_e32bb68::function_3a59ec34("evt_doa_pickup_barrel_active_lp");
	self thread function_61888137(org);
	self thread function_f0855523(org);
	org thread function_6ad92846(self);
	while(isdefined(org) && isdefined(self))
	{
		org.origin = self.origin;
		org rotateto(org.angles + vectorscale((0, 1, 0), 180), 1.2);
		wait(1.2);
	}
}

/*
	Name: function_7c757878
	Namespace: namespace_bf41daf8
	Checksum: 0xF923B828
	Offset: 0x790
	Size: 0x270
	Parameters: 3
	Flags: Linked, Private
*/
function private function_7c757878(player, mod, var_70c63791)
{
	if(!isdefined(mod))
	{
		mod = "MOD_CRUSH";
	}
	player endon(#"hash_3e2226cc328d43a7");
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
		if(is_true(guy.var_b88e74c3) || is_true(guy.boss))
		{
			continue;
		}
		if(is_true(guy.knocked_out))
		{
			continue;
		}
		guy namespace_e32bb68::function_3a59ec34("evt_doa_pickup_barrel_active_impact");
		if(isdefined(var_70c63791))
		{
			guy thread [[var_70c63791]]();
		}
		guy.knocked_out = 1;
		if(isactor(guy))
		{
			dir = guy.origin - self.origin;
			guy thread namespace_ec06fe4a::function_5678f0d(dir, 50, 0.1, player);
			guy thread namespace_ec06fe4a::function_570729f0(0.05, player, mod, level.doa.default_weapon);
		}
		else
		{
			guy dodamage(guy.health + 1, guy.origin, player, player, "none", mod, 0, level.doa.default_weapon);
		}
		player playrumbleonentity("damage_light");
	}
}

/*
	Name: function_61888137
	Namespace: namespace_bf41daf8
	Checksum: 0x89E3F732
	Offset: 0xA08
	Size: 0x126
	Parameters: 1
	Flags: Linked, Private
*/
function private function_61888137(org)
{
	self endon(#"hash_3e2226cc328d43a7", #"hash_562d458e34274132");
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
	self notify(#"hash_3e2226cc328d43a7");
}

/*
	Name: function_6ad92846
	Namespace: namespace_bf41daf8
	Checksum: 0xC508D267
	Offset: 0xB38
	Size: 0x114
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6ad92846(player)
{
	self endon(#"death");
	if(isplayer(player))
	{
		player waittill(#"disconnect");
	}
	else
	{
		return;
	}
	if(isdefined(self.trigger1))
	{
		self.trigger1 delete();
	}
	if(isdefined(self.trigger2))
	{
		self.trigger2 delete();
	}
	if(isdefined(self.barrel1))
	{
		self.barrel1 delete();
	}
	if(isdefined(self.barrel2))
	{
		self.barrel2 delete();
	}
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: function_f0855523
	Namespace: namespace_bf41daf8
	Checksum: 0x4F03EE4
	Offset: 0xC58
	Size: 0x37C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f0855523(org)
{
	if(isplayer(self))
	{
		self endon(#"disconnect");
	}
	self waittill(#"hash_3e2226cc328d43a7", #"entering_last_stand", #"hash_77af89fb2b44942f", #"hash_df25520ab279dff", #"hash_562d458e34274132", #"player_died", #"enter_vehicle", #"clone_shutdown", #"death");
	if(isdefined(self))
	{
		self notify(#"hash_3e2226cc328d43a7");
	}
	if(isdefined(org) && isdefined(org.trigger1))
	{
		org.trigger1 delete();
	}
	if(isdefined(org) && isdefined(org.trigger2))
	{
		org.trigger2 delete();
	}
	if(isdefined(org) && isdefined(org.barrel1))
	{
		org.barrel1 unlink();
	}
	if(isdefined(org) && isdefined(org.barrel2))
	{
		org.barrel2 unlink();
	}
	if(isdefined(self))
	{
		if(isdefined(org) && isdefined(org.barrel1))
		{
			vel = org.barrel1.origin - self.origin;
			org.barrel1 physicslaunch(org.barrel1.origin, vel);
		}
		if(isdefined(org) && isdefined(org.barrel2))
		{
			vel = org.barrel2.origin - self.origin;
			org.barrel2 physicslaunch(org.barrel2.origin, vel);
		}
		self.doa.var_ba83e9 = undefined;
		self namespace_e32bb68::function_ae271c0b("evt_doa_pickup_barrel_active_lp");
		self namespace_e32bb68::function_3a59ec34("evt_doa_pickup_barrel_active_end");
	}
	wait(5);
	if(isdefined(org) && isdefined(org.barrel1))
	{
		org.barrel1 delete();
	}
	if(isdefined(org) && isdefined(org.barrel2))
	{
		org.barrel2 delete();
	}
	if(isdefined(org))
	{
		org delete();
	}
}

