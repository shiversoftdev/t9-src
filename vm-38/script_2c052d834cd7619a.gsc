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

#namespace namespace_2c7d0af1;

/*
	Name: function_f1e22244
	Namespace: namespace_2c7d0af1
	Checksum: 0x70414064
	Offset: 0x208
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f1e22244()
{
	level notify(-2033168986);
}

#namespace namespace_52ba5a8a;

/*
	Name: function_124c1a34
	Namespace: namespace_52ba5a8a
	Checksum: 0x4E4C33D8
	Offset: 0x228
	Size: 0x1AA
	Parameters: 3
	Flags: Linked
*/
function function_124c1a34(player, model, note)
{
	blade = namespace_ec06fe4a::function_e22ae9b3(self.origin, model);
	if(!isdefined(blade))
	{
		return false;
	}
	blade.targetname = "blade";
	blade setplayercollision(0);
	blade enablelinkto();
	blade linkto(self, undefined, vectorscale((0, -1, 0), 70));
	trigger = namespace_ec06fe4a::spawntrigger("trigger_radius", blade.origin, (1 | 512) | 8, 30, 50);
	if(!isdefined(trigger))
	{
		blade delete();
		return false;
	}
	trigger.targetname = "blade";
	trigger enablelinkto();
	trigger linkto(blade);
	trigger thread function_7daf5356(player, note);
	blade namespace_e32bb68::function_3a59ec34("evt_doa_pickup_sawblade_active_lp");
	self.blade = blade;
	self.trigger = trigger;
	return true;
}

/*
	Name: sawbladeupdate
	Namespace: namespace_52ba5a8a
	Checksum: 0x80FAB062
	Offset: 0x3E0
	Size: 0x228
	Parameters: 1
	Flags: Linked
*/
function sawbladeupdate(model)
{
	if(!isdefined(model))
	{
		model = "zombietron_sawblade";
	}
	note = namespace_ec06fe4a::function_7fcca25d("end_sawblad_pickup");
	self endon(note);
	if(isplayer(self))
	{
		self endon(#"disconnect");
	}
	waitframe(1);
	self endon(#"hash_5c1fd96dc1cc50e7");
	if(!isdefined(self.doa.var_1739bd8e))
	{
		self.doa.var_1739bd8e = [];
	}
	org = namespace_ec06fe4a::function_e22ae9b3(self.origin, "tag_origin");
	if(!isdefined(org))
	{
		return;
	}
	org.targetname = "sawbladeUpdate";
	org.angles = (0, randomint(180), 0);
	org enablelinkto();
	self.doa.var_1739bd8e[self.doa.var_1739bd8e.size] = org;
	org linkto(self, undefined, vectorscale((0, 0, 1), 32));
	self thread function_40fc311d(org, note);
	self thread function_20139eee(org, note);
	result = org function_124c1a34(self, model, note);
	if(result == 0)
	{
		self notify(note);
	}
	while(isdefined(org))
	{
		org rotateto(org.angles + vectorscale((0, 1, 0), 180), 0.4);
		wait(0.4);
	}
}

/*
	Name: function_7daf5356
	Namespace: namespace_52ba5a8a
	Checksum: 0xA2E3641F
	Offset: 0x610
	Size: 0x1F8
	Parameters: 2
	Flags: Linked, Private
*/
function private function_7daf5356(player, endnote)
{
	player endon(endnote);
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
		guy namespace_e32bb68::function_3a59ec34("evt_doa_pickup_sawblade_active_impact");
		if(isactor(guy))
		{
			vel = vectorscale(self.origin - player.origin, 0.2);
			if(!is_true(guy.no_gib))
			{
				guy namespace_ed80aead::function_1f275794(vel, player);
				guy thread namespace_ec06fe4a::function_570729f0(0.5, player);
			}
			else
			{
				guy thread namespace_ec06fe4a::function_570729f0(0.1, player);
			}
		}
		else
		{
			guy thread namespace_ec06fe4a::function_570729f0(0.1, player);
		}
	}
}

/*
	Name: function_40fc311d
	Namespace: namespace_52ba5a8a
	Checksum: 0xAC0C8A3B
	Offset: 0x810
	Size: 0xE6
	Parameters: 2
	Flags: Linked, Private
*/
function private function_40fc311d(org, endnote)
{
	self endon(endnote);
	if(isplayer(self))
	{
		self endon(#"disconnect");
	}
	timeout = 40;
	if(self doa_fate::function_d438e371())
	{
		timeout = self doa_fate::function_4808b985(40);
	}
	if(self doa_fate::function_8a19ece())
	{
		timeout = int(64);
	}
	while(!doa_pickups::function_f759a457())
	{
		waitframe(1);
	}
	wait(timeout);
	self notify(endnote);
}

/*
	Name: function_20139eee
	Namespace: namespace_52ba5a8a
	Checksum: 0xEFC91CCE
	Offset: 0x900
	Size: 0x214
	Parameters: 2
	Flags: Linked, Private
*/
function private function_20139eee(org, endnote)
{
	self waittill(endnote, #"player_died", #"hash_77af89fb2b44942f", #"disconnect", #"death", #"enter_vehicle", #"hash_df25520ab279dff", #"clone_shutdown");
	if(isdefined(self))
	{
		self notify(endnote);
	}
	util::wait_network_frame();
	if(isdefined(org.trigger))
	{
		org.trigger delete();
	}
	if(isdefined(org.blade))
	{
		org.blade unlink();
		vel = vectorscale((0, 0, 1), 20);
		if(isdefined(self))
		{
			vel = org.blade.origin - self.origin;
		}
		org.blade physicslaunch(org.blade.origin, vel);
		org.blade namespace_e32bb68::function_ae271c0b("evt_doa_pickup_sawblade_active_lp");
		org.blade namespace_e32bb68::function_3a59ec34("evt_doa_pickup_sawblade_lose_blade");
		wait(5);
		org.blade delete();
	}
	if(isdefined(self))
	{
		arrayremovevalue(self.doa.var_1739bd8e, org);
	}
	org delete();
}

