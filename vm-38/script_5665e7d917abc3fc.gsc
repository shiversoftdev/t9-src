#using script_19f3d8b7a687a3f1;
#using script_3f2bc2eef03cbecc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\struct.csc;

#namespace namespace_dd7e54e3;

/*
	Name: function_5622bb00
	Namespace: namespace_dd7e54e3
	Checksum: 0xFAB540CF
	Offset: 0xF8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5622bb00()
{
	level notify(1033632727);
}

/*
	Name: __init__system__
	Namespace: namespace_dd7e54e3
	Checksum: 0xAB70601B
	Offset: 0x118
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_7da9887a9375293", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_dd7e54e3
	Checksum: 0x852A320E
	Offset: 0x170
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	level.var_2a994cc0 = sr_armor_menu::register();
	namespace_52c8f34d::function_70a657d8();
	clientfield::register("scriptmover", "" + #"hash_7dfc37315a4eff0", 1, 1, "int", &function_af3e97c, 0, 0);
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_dd7e54e3
	Checksum: 0x80F724D1
	Offset: 0x200
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_8ac3bea9()
{
}

/*
	Name: function_af3e97c
	Namespace: namespace_dd7e54e3
	Checksum: 0x4D2E6EE6
	Offset: 0x210
	Size: 0x48A
	Parameters: 7
	Flags: Linked
*/
function function_af3e97c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self playrenderoverridebundle(#"hash_67554d3a2940aec6");
		if(!isdefined(self.var_89e0f17d))
		{
			self.var_89e0f17d = playfx(fieldname, #"zombie/fx9_armor_station_idle", self.origin, anglestoforward(self.angles), anglestoup(self.angles));
		}
		if(!isdefined(self.var_6ceb8157))
		{
			self.var_6ceb8157 = util::playfxontag(fieldname, #"zombie/fx9_armor_station_light", self, "monitor_01_bulb_jnt");
		}
		if(!isdefined(self.var_b99f92dc))
		{
			self playsound(fieldname, #"hash_3626cdd4cac6748f");
			for(i = 0; i < 3; i++)
			{
				switch(i)
				{
					case 0:
					{
						var_395f162a = #"hash_1252cdeb68490a6d";
						str_tag = "monitor_01_jnt";
						break;
					}
					case 1:
					{
						var_395f162a = #"hash_41dc7c0724f35b12";
						str_tag = "monitor_02_jnt";
						break;
					}
					case 2:
					{
						var_395f162a = #"hash_60994b01519271ea";
						str_tag = "keyboard_jnt";
						break;
					}
				}
				var_1c0acf43 = util::spawn_model(fieldname, #"tag_origin", self gettagorigin(str_tag), self gettagangles(str_tag));
				if(!isdefined(self.var_b99f92dc))
				{
					self.var_b99f92dc = [];
				}
				else if(!isarray(self.var_b99f92dc))
				{
					self.var_b99f92dc = array(self.var_b99f92dc);
				}
				self.var_b99f92dc[self.var_b99f92dc.size] = var_1c0acf43;
				var_1c0acf43 linkto(self, str_tag);
				var_1c0acf43.var_f1bf92dc = var_1c0acf43 playloopsound(var_395f162a);
			}
		}
	}
	else
	{
		self stoprenderoverridebundle(#"hash_67554d3a2940aec6");
		if(isdefined(self.var_89e0f17d))
		{
			stopfx(fieldname, self.var_89e0f17d);
			self.var_89e0f17d = undefined;
		}
		if(isdefined(self.var_6ceb8157))
		{
			stopfx(fieldname, self.var_6ceb8157);
			self.var_6ceb8157 = undefined;
		}
		if(isdefined(self.var_b99f92dc))
		{
			foreach(var_1c0acf43 in self.var_b99f92dc)
			{
				if(isdefined(var_1c0acf43.var_f1bf92dc))
				{
					var_1c0acf43 stoploopsound(var_1c0acf43.var_f1bf92dc);
				}
				if(isdefined(var_1c0acf43))
				{
					var_1c0acf43 delete();
				}
			}
			self.var_b99f92dc = undefined;
		}
	}
}

