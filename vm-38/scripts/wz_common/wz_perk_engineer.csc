#using scripts\weapons\weaponobjects.csc;
#using scripts\core_common\renderoverridebundle.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace wz_perk_engineer;

/*
	Name: function_427803c7
	Namespace: wz_perk_engineer
	Checksum: 0xE1D9689A
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_427803c7()
{
	level notify(654836975);
}

/*
	Name: __init__system__
	Namespace: wz_perk_engineer
	Checksum: 0x539C1A09
	Offset: 0xD0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"wz_perk_engineer", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: wz_perk_engineer
	Checksum: 0x9789B7DF
	Offset: 0x118
	Size: 0x10C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(0)
	{
		renderoverridebundle::function_f72f089c(#"hash_f5de00feee70c13", (sessionmodeiscampaigngame() ? #"rob_sonar_set_friendlyequip_cp" : #"rob_sonar_set_friendlyequip_mp"), &function_8550d243);
	}
	renderoverridebundle::function_f72f089c(#"hash_77f7418d2f2a7890", #"rob_sonar_set_enemyequip", &function_62888a11);
	renderoverridebundle::function_f72f089c(#"hash_61c696df3d5a1765", #"hash_44adc567f9f60d61", &function_b52a94e5);
	callback::on_localplayer_spawned(&on_localplayer_spawned);
}

/*
	Name: on_localplayer_spawned
	Namespace: wz_perk_engineer
	Checksum: 0x4BB04908
	Offset: 0x230
	Size: 0x3C
	Parameters: 1
	Flags: Private
*/
function private on_localplayer_spawned(localclientnum)
{
	if(self function_21c0fa55())
	{
		self thread function_7800b9c2(localclientnum);
	}
}

/*
	Name: function_e446e567
	Namespace: wz_perk_engineer
	Checksum: 0x5E7EC02F
	Offset: 0x278
	Size: 0xBE
	Parameters: 1
	Flags: None
*/
function function_e446e567(notifyhash)
{
	if(!isdefined(self.var_100abb43) || !isarray(self.var_100abb43))
	{
		return;
	}
	foreach(item in self.var_100abb43)
	{
		if(isdefined(item))
		{
			item.var_f19b4afd = undefined;
		}
	}
}

/*
	Name: function_7800b9c2
	Namespace: wz_perk_engineer
	Checksum: 0x3C213357
	Offset: 0x340
	Size: 0x360
	Parameters: 1
	Flags: Private
*/
function private function_7800b9c2(localclientnum)
{
	level endon(#"game_ended");
	self endoncallback(&function_e446e567, #"death");
	if(!isdefined(self.var_100abb43))
	{
		self.var_100abb43 = [];
	}
	while(true)
	{
		var_94c264dd = self hasperk(localclientnum, #"specialty_showenemyequipment");
		if(!var_94c264dd && isdefined(self.var_53204996))
		{
			var_94c264dd = var_94c264dd | self [[self.var_53204996]](localclientnum);
		}
		if(!var_94c264dd && self.var_100abb43.size == 0)
		{
			wait(0.2);
			continue;
		}
		var_5ef114b0 = [];
		if(var_94c264dd)
		{
			items = array::filter(level.enemyequip, 0, &function_5118c0a3);
			arrayremovevalue(items, undefined, 0);
			var_5ef114b0 = arraysortclosest(items, self.origin, 5, 0, 7200);
		}
		foreach(item in self.var_100abb43)
		{
			if(isdefined(item))
			{
				item.var_f19b4afd = undefined;
			}
		}
		foreach(item in var_5ef114b0)
		{
			item.var_f19b4afd = 1;
		}
		var_2e2e2808 = arraycombine(self.var_100abb43, var_5ef114b0, 0, 0);
		foreach(item in var_2e2e2808)
		{
			if(isdefined(item))
			{
				if(isdefined(item.vehicletype))
				{
				}
				else
				{
					item weaponobjects::updateenemyequipment(localclientnum, undefined);
				}
			}
			waitframe(1);
		}
		self.var_100abb43 = var_5ef114b0;
		wait(0.2);
	}
}

/*
	Name: function_5118c0a3
	Namespace: wz_perk_engineer
	Checksum: 0x4E64A943
	Offset: 0x6A8
	Size: 0x2E
	Parameters: 1
	Flags: Private
*/
function private function_5118c0a3(item)
{
	return isdefined(item) && !item function_e9fc6a64();
}

/*
	Name: function_76a0624a
	Namespace: wz_perk_engineer
	Checksum: 0xAA6A94BB
	Offset: 0x6E0
	Size: 0x6A
	Parameters: 0
	Flags: Private
*/
function private function_76a0624a()
{
	if(!isdefined(self.owner) || !isdefined(self.owner.team))
	{
		return 0;
	}
	if(self.owner.team == #"neutral")
	{
		return 0;
	}
	return self.owner function_e9fc6a64();
}

/*
	Name: function_da8108ae
	Namespace: wz_perk_engineer
	Checksum: 0x9534E787
	Offset: 0x758
	Size: 0x6C
	Parameters: 0
	Flags: Private
*/
function private function_da8108ae()
{
	if(!isdefined(self.owner) || !isdefined(self.owner.team))
	{
		return 0;
	}
	if(self.owner.team == #"neutral")
	{
		return 0;
	}
	return !self.owner function_e9fc6a64();
}

/*
	Name: function_8550d243
	Namespace: wz_perk_engineer
	Checksum: 0x499FF830
	Offset: 0x7D0
	Size: 0xC0
	Parameters: 2
	Flags: Private
*/
function private function_8550d243(localclientnum, bundle)
{
	if(function_4e3684f2(bundle))
	{
		return false;
	}
	if(self.type === "vehicle" && isinvehicle(bundle, self))
	{
		return false;
	}
	if(self.type === "vehicle_corpse")
	{
		return false;
	}
	if(self function_76a0624a() && is_true(self.var_f19b4afd))
	{
		return true;
	}
	return false;
}

/*
	Name: function_62888a11
	Namespace: wz_perk_engineer
	Checksum: 0xC3577C92
	Offset: 0x898
	Size: 0xC0
	Parameters: 2
	Flags: Private
*/
function private function_62888a11(localclientnum, bundle)
{
	if(function_4e3684f2(bundle))
	{
		return false;
	}
	if(self.type === "vehicle" && isinvehicle(bundle, self))
	{
		return false;
	}
	if(self.type === "vehicle_corpse")
	{
		return false;
	}
	if(self function_da8108ae() && is_true(self.var_f19b4afd))
	{
		return true;
	}
	return false;
}

/*
	Name: function_b52a94e5
	Namespace: wz_perk_engineer
	Checksum: 0xC9C8C196
	Offset: 0x960
	Size: 0xE0
	Parameters: 2
	Flags: Private
*/
function private function_b52a94e5(localclientnum, bundle)
{
	if(function_4e3684f2(bundle))
	{
		return false;
	}
	if(self.type === "vehicle" && isinvehicle(bundle, self))
	{
		return false;
	}
	if(self.type === "vehicle_corpse")
	{
		return false;
	}
	if(!self function_76a0624a() && !self function_da8108ae() && is_true(self.var_f19b4afd))
	{
		return true;
	}
	return false;
}

