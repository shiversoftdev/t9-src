#using scripts\core_common\array_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_9ff9f642;

/*
	Name: function_54ddeaf0
	Namespace: namespace_9ff9f642
	Checksum: 0xADCB25B
	Offset: 0x120
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_54ddeaf0()
{
	level notify(535141822);
}

/*
	Name: function_89f2df9
	Namespace: namespace_9ff9f642
	Checksum: 0x3A7C6074
	Offset: 0x140
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_308dff40d53a7287", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_9ff9f642
	Checksum: 0xF3C27395
	Offset: 0x188
	Size: 0x5C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("actor", "" + #"hash_419c1c8da4dc53a9", 1, 1, "int", &function_f4515ba8, 0, 0);
}

/*
	Name: function_f4515ba8
	Namespace: namespace_9ff9f642
	Checksum: 0xDB9F7699
	Offset: 0x1F0
	Size: 0x1F2
	Parameters: 7
	Flags: Linked
*/
function function_f4515ba8(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		str_tag = "j_spinelower";
		if(!isdefined(self gettagorigin(str_tag)))
		{
			str_tag = "tag_origin";
		}
		if(isdefined(level._effect) && isdefined(level._effect[#"character_fire_death_torso"]))
		{
			self.var_62f2a054 = util::playfxontag(fieldname, level._effect[#"character_fire_death_torso"], self, str_tag);
		}
		self thread function_8847b8aa(fieldname);
		self.var_2be01485 = undefined;
	}
	else
	{
		self notify(#"hash_395dfda1274cd506");
		if(isdefined(self.var_62f2a054))
		{
			stopfx(fieldname, self.var_62f2a054);
			self.var_62f2a054 = undefined;
		}
		if(isdefined(self.var_803e161e))
		{
			foreach(n_fx_id in self.var_803e161e)
			{
				stopfx(fieldname, n_fx_id);
			}
			self.var_803e161e = undefined;
		}
	}
}

/*
	Name: function_8847b8aa
	Namespace: namespace_9ff9f642
	Checksum: 0xFC0A1BC4
	Offset: 0x3F0
	Size: 0x1F8
	Parameters: 1
	Flags: Linked, Private
*/
function private function_8847b8aa(localclientnum)
{
	self endon(#"death", #"hash_395dfda1274cd506");
	wait(1);
	a_str_tags = [];
	a_str_tags[0] = "j_elbow_le";
	a_str_tags[1] = "j_elbow_ri";
	a_str_tags[2] = "j_knee_ri";
	a_str_tags[3] = "j_knee_le";
	a_str_tags = array::randomize(a_str_tags);
	self.var_803e161e = [];
	self.var_803e161e[0] = util::playfxontag(localclientnum, level._effect[#"character_fire_death_sm"], self, a_str_tags[0]);
	wait(1);
	a_str_tags[0] = "j_wrist_ri";
	a_str_tags[1] = "j_wrist_le";
	if(!is_true(self.missinglegs))
	{
		a_str_tags[2] = "j_ankle_ri";
		a_str_tags[3] = "j_ankle_le";
	}
	a_str_tags = array::randomize(a_str_tags);
	self.var_803e161e[1] = util::playfxontag(localclientnum, level._effect[#"character_fire_death_sm"], self, a_str_tags[0]);
	self.var_803e161e[2] = util::playfxontag(localclientnum, level._effect[#"character_fire_death_sm"], self, a_str_tags[1]);
}

