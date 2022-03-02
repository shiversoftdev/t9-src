#using script_35598499769dbb3d;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\fx_shared.gsc;

#namespace zombie_death;

/*
	Name: on_fire_timeout
	Namespace: zombie_death
	Checksum: 0xAFA449F1
	Offset: 0x138
	Size: 0x76
	Parameters: 0
	Flags: Linked
*/
function on_fire_timeout()
{
	self endon(#"death");
	if(isdefined(self.flame_fx_timeout))
	{
		wait(self.flame_fx_timeout);
	}
	else
	{
		wait(8);
	}
	if(isdefined(self) && isalive(self))
	{
		self.is_on_fire = 0;
		self notify(#"stop_flame_damage");
	}
}

/*
	Name: flame_death_fx
	Namespace: zombie_death
	Checksum: 0xA39B6EBD
	Offset: 0x1B8
	Size: 0x42C
	Parameters: 0
	Flags: Linked
*/
function flame_death_fx()
{
	self endon(#"death");
	if(isdefined(self.is_on_fire) && self.is_on_fire)
	{
		return;
	}
	if(is_true(self.disable_flame_fx))
	{
		return;
	}
	self.is_on_fire = 1;
	self thread on_fire_timeout();
	if(isdefined(level._effect) && isdefined(level._effect[#"character_fire_death_torso"]))
	{
		fire_tag = "j_spinelower";
		fire_death_torso_fx = level._effect[#"character_fire_death_torso"];
		if(isdefined(self.weapon_specific_fire_death_torso_fx))
		{
			fire_death_torso_fx = self.weapon_specific_fire_death_torso_fx;
		}
		if(!isdefined(self gettagorigin(fire_tag)))
		{
			fire_tag = "tag_origin";
		}
		if(!isdefined(self.isdog) || !self.isdog)
		{
			self fx::play(fire_death_torso_fx, (0, 0, 0), (0, 0, 0), "stop_flame_damage", 1, fire_tag);
		}
		self.weapon_specific_fire_death_torso_fx = undefined;
	}
	else
	{
		/#
			println("");
		#/
	}
	if(isdefined(level._effect) && isdefined(level._effect[#"character_fire_death_sm"]))
	{
		if(!isvehicle(self) && self.archetype !== "raps" && self.archetype !== "spider")
		{
			fire_death_sm_fx = level._effect[#"character_fire_death_sm"];
			if(isdefined(self.weapon_specific_fire_death_sm_fx))
			{
				fire_death_sm_fx = self.weapon_specific_fire_death_sm_fx;
			}
			if(isdefined(self.weapon_specific_fire_death_torso_fx))
			{
				fire_death_torso_fx = self.weapon_specific_fire_death_torso_fx;
			}
			wait(1);
			tagarray = [];
			tagarray[0] = "j_elbow_le";
			tagarray[1] = "j_elbow_ri";
			tagarray[2] = "j_knee_ri";
			tagarray[3] = "j_knee_le";
			tagarray = array::randomize(tagarray);
			self fx::play(fire_death_sm_fx, (0, 0, 0), (0, 0, 0), "stop_flame_damage", 1, tagarray[0]);
			wait(1);
			tagarray[0] = "j_wrist_ri";
			tagarray[1] = "j_wrist_le";
			if(!isdefined(self.a.gib_ref) || self.a.gib_ref != "no_legs")
			{
				tagarray[2] = "j_ankle_ri";
				tagarray[3] = "j_ankle_le";
			}
			tagarray = array::randomize(tagarray);
			self fx::play(fire_death_sm_fx, (0, 0, 0), (0, 0, 0), "stop_flame_damage", 1, tagarray[0]);
			self fx::play(fire_death_sm_fx, (0, 0, 0), (0, 0, 0), "stop_flame_damage", 1, tagarray[1]);
			self.weapon_specific_fire_death_sm_fx = undefined;
		}
	}
	else
	{
		/#
			println("");
		#/
	}
}

/*
	Name: do_gib
	Namespace: zombie_death
	Checksum: 0xAEDBC254
	Offset: 0x5F0
	Size: 0x1AA
	Parameters: 0
	Flags: None
*/
function do_gib()
{
	if(!isdefined(self.a.gib_ref))
	{
		return;
	}
	if(isdefined(self.is_on_fire) && self.is_on_fire)
	{
		return;
	}
	switch(self.a.gib_ref)
	{
		case "right_arm":
		{
			gibserverutils::gibrightarm(self, 0);
			break;
		}
		case "left_arm":
		{
			gibserverutils::gibleftarm(self, 0);
			break;
		}
		case "right_leg":
		{
			gibserverutils::gibrightleg(self, 0);
			break;
		}
		case "left_leg":
		{
			gibserverutils::gibleftleg(self, 0);
			break;
		}
		case "no_legs":
		{
			gibserverutils::giblegs(self, 0);
			break;
		}
		case "head":
		{
			gibserverutils::gibhead(self, 0);
			break;
		}
		case "guts":
		{
			break;
		}
		default:
		{
			/#
				assertmsg(("" + self.a.gib_ref) + "");
			#/
			break;
		}
	}
}

