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

#namespace namespace_ad27dfd8;

/*
	Name: function_8dbbde01
	Namespace: namespace_ad27dfd8
	Checksum: 0x103CC566
	Offset: 0x280
	Size: 0x434
	Parameters: 2
	Flags: Linked
*/
function function_8dbbde01(player, origin)
{
	hitp = namespace_ec06fe4a::function_65ee50ba(origin);
	origin = (origin[0], origin[1], hitp[2]);
	coat = namespace_ec06fe4a::function_e22ae9b3(origin + vectorscale((0, 0, 1), 36));
	if(!isdefined(coat))
	{
		return;
	}
	org = namespace_ec06fe4a::function_e22ae9b3(origin + vectorscale((0, 0, 1), 36), "tag_origin");
	if(!isdefined(org))
	{
		coat delete();
		return;
	}
	trigger = namespace_ec06fe4a::spawntrigger("trigger_radius", coat.origin, (1 | 512) | 8, 245, 60);
	if(!isdefined(trigger))
	{
		coat delete();
		org delete();
		return;
	}
	coat.targetname = "coat_of_arms";
	coat setmodel("zombietron_coat_of_arms");
	coat setscale(3);
	coat.angles = (0, 270, 75);
	coat thread namespace_ec06fe4a::function_1ebe83a7(3, 0.1);
	coat thread namespace_ec06fe4a::function_2d920b3c();
	coat namespace_e32bb68::function_3a59ec34("evt_doa_pickup_coatofarms_active_start");
	coat namespace_e32bb68::function_3a59ec34("evt_doa_pickup_coatofarms_active_lp");
	trigger.owner = player;
	trigger.targetname = "timeShifterUpdate";
	trigger enablelinkto();
	trigger linkto(coat);
	trigger.opentime = 3000;
	trigger.var_6de1c43b = gettime() + trigger.opentime;
	trigger.radiussq = sqr(245);
	timetowait = player doa_fate::function_4808b985(3.1);
	/#
	#/
	org namespace_83eb6304::function_3ecfde67("teamshift");
	trigger thread function_7649c09d();
	waitresult = undefined;
	waitresult = player waittilltimeout(timetowait, #"death", #"entering_last_stand", #"doa_exit_taken", #"disconnect");
	org namespace_83eb6304::turnofffx("teamshift");
	coat namespace_e32bb68::function_ae271c0b("evt_doa_pickup_coatofarms_active_lp");
	coat namespace_e32bb68::function_3a59ec34("evt_doa_pickup_coatofarms_active_end");
	wait(1);
	if(isdefined(coat))
	{
		coat delete();
	}
	if(isdefined(trigger))
	{
		trigger delete();
	}
	if(isdefined(org))
	{
		org delete();
	}
}

/*
	Name: function_8ff2eaf3
	Namespace: namespace_ad27dfd8
	Checksum: 0x4979FE2
	Offset: 0x6C0
	Size: 0x25A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_8ff2eaf3(trigger)
{
	self endon(#"death");
	self notify("7dfb8ca7d01dea77");
	self endon("7dfb8ca7d01dea77");
	self.var_d55daa7c = 1;
	self namespace_83eb6304::function_3ecfde67("teamshift_contact");
	self namespace_e32bb68::function_3a59ec34("evt_doa_pickup_coatofarms_zombie_lp");
	self.oldteam = self.team;
	var_c5107c6c = self.meleedamage;
	self.meleedamage = 750;
	if(isdefined(trigger.owner))
	{
		self.team = trigger.owner.team;
	}
	else
	{
		self.team = "allies";
	}
	self.favoriteenemy = undefined;
	level.doa.var_e2e8967b[level.doa.var_e2e8967b.size] = self;
	self clearenemy();
	timeleft = gettime() + 20000;
	while(gettime() < timeleft)
	{
		result = undefined;
		result = self waittilltimeout(1, #"damage");
		if(isdefined(result.attacker) && isplayer(result.attacker))
		{
			break;
		}
	}
	self namespace_83eb6304::turnofffx("teamshift_contact");
	self namespace_e32bb68::function_ae271c0b("evt_doa_pickup_coatofarms_zombie_lp");
	arrayremovevalue(level.doa.var_e2e8967b, self);
	self clearenemy();
	self.favoriteenemy = undefined;
	self.var_d55daa7c = undefined;
	self.team = self.oldteam;
	self.meleedamage = var_c5107c6c;
}

/*
	Name: function_7649c09d
	Namespace: namespace_ad27dfd8
	Checksum: 0xF1CC78F
	Offset: 0x928
	Size: 0x208
	Parameters: 0
	Flags: Linked, Private
*/
function private function_7649c09d()
{
	self endon(#"death");
	while(true)
	{
		result = undefined;
		result = self waittill(#"trigger");
		guy = result.activator;
		if(is_true(guy.var_d55daa7c))
		{
			continue;
		}
		if(!isactor(guy))
		{
			continue;
		}
		if(is_true(guy.var_af545843) || is_true(guy.boss))
		{
			continue;
		}
		if(guy isragdoll())
		{
			continue;
		}
		if(!isalive(guy) || guy.health <= 0)
		{
			continue;
		}
		if(isdefined(self.var_6de1c43b))
		{
			time = gettime();
			if(time < self.var_6de1c43b)
			{
				distsq = distancesquared(guy.origin, self.origin);
				frac = distsq / self.radiussq;
				diff = time - self.birthtime;
				var_9794857f = diff / self.opentime;
				if(frac > var_9794857f)
				{
					continue;
				}
			}
		}
		guy thread function_8ff2eaf3(self);
		guy thread namespace_ec06fe4a::function_ad852085(level, "doa_exit_taken");
	}
}

