#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\struct.csc;

#namespace vehicle;

/*
	Name: init
	Namespace: vehicle
	Checksum: 0x103C7D51
	Offset: 0x180
	Size: 0x14
	Parameters: 0
	Flags: AutoExec
*/
function autoexec init()
{
	function_d64f1d30();
}

/*
	Name: function_d64f1d30
	Namespace: vehicle
	Checksum: 0x3B1D745D
	Offset: 0x1A0
	Size: 0x388
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d64f1d30()
{
	a_registered_fields = [];
	foreach(bundle in getscriptbundles("vehicleriders"))
	{
		foreach(object in bundle.objects)
		{
			if(isdefined(object.vehicleenteranim))
			{
				array::add(a_registered_fields, object.position + "_enter", 0);
			}
			if(isdefined(object.vehicleexitanim))
			{
				array::add(a_registered_fields, object.position + "_exit", 0);
				array::add(a_registered_fields, object.position + "_exit_restore", 0);
			}
			if(isdefined(object.var_cbf50c1d))
			{
				array::add(a_registered_fields, object.position + "_exit_combat", 0);
				array::add(a_registered_fields, object.position + "_exit_combat_restore", 0);
			}
			if(isdefined(object.vehiclecloseanim))
			{
				array::add(a_registered_fields, object.position + "_close", 0);
			}
			if(isdefined(object.var_b7605392))
			{
				array::add(a_registered_fields, object.position + "_close_combat", 0);
			}
			if(isdefined(object.vehicleriderdeathanim))
			{
				array::add(a_registered_fields, object.position + "_death", 0);
			}
		}
	}
	foreach(str_clientfield in a_registered_fields)
	{
		clientfield::register("vehicle", str_clientfield, 1, 1, "counter", &play_vehicle_anim, 0, 0);
	}
}

/*
	Name: play_vehicle_anim
	Namespace: vehicle
	Checksum: 0x79BD0C7A
	Offset: 0x530
	Size: 0x58C
	Parameters: 7
	Flags: Linked
*/
function play_vehicle_anim(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	s_bundle = getscriptbundle(self.vehicleridersbundle);
	str_pos = "";
	str_action = "";
	if(strendswith(bwastimejump, "_enter"))
	{
		str_pos = getsubstr(bwastimejump, 0, bwastimejump.size - 6);
		str_action = "enter";
	}
	else
	{
		if(strendswith(bwastimejump, "_exit"))
		{
			str_pos = getsubstr(bwastimejump, 0, bwastimejump.size - 5);
			str_action = "exit";
		}
		else
		{
			if(strendswith(bwastimejump, "_exit_combat"))
			{
				str_pos = getsubstr(bwastimejump, 0, bwastimejump.size - 12);
				str_action = "exit_combat";
			}
			else
			{
				if(strendswith(bwastimejump, "_close"))
				{
					str_pos = getsubstr(bwastimejump, 0, bwastimejump.size - 6);
					str_action = "close";
				}
				else
				{
					if(strendswith(bwastimejump, "_close_combat"))
					{
						str_pos = getsubstr(bwastimejump, 0, bwastimejump.size - 13);
						str_action = "close_combat";
					}
					else
					{
						if(strendswith(bwastimejump, "_death"))
						{
							str_pos = getsubstr(bwastimejump, 0, bwastimejump.size - 6);
							str_action = "death";
						}
						else
						{
							if(strendswith(bwastimejump, "_exit_restore"))
							{
								str_pos = getsubstr(bwastimejump, 0, bwastimejump.size - 13);
								str_action = "exit_restore";
							}
							else if(strendswith(bwastimejump, "_exit_combat_restore"))
							{
								str_pos = getsubstr(bwastimejump, 0, bwastimejump.size - 20);
								str_action = "exit_combat_restore";
							}
						}
					}
				}
			}
		}
	}
	str_vh_anim = undefined;
	foreach(s_rider in s_bundle.objects)
	{
		if(s_rider.position == str_pos)
		{
			switch(str_action)
			{
				case "enter":
				{
					str_vh_anim = s_rider.vehicleenteranim;
					break;
				}
				case "exit":
				{
					str_vh_anim = s_rider.vehicleexitanim;
					break;
				}
				case "exit_combat":
				{
					str_vh_anim = s_rider.var_cbf50c1d;
					break;
				}
				case "close":
				{
					str_vh_anim = s_rider.vehiclecloseanim;
					break;
				}
				case "close_combat":
				{
					str_vh_anim = s_rider.var_b7605392;
					break;
				}
				case "death":
				{
					str_vh_anim = s_rider.vehicleriderdeathanim;
					break;
				}
				case "exit_restore":
				{
					str_vh_anim = s_rider.vehicleexitanim;
					var_73ba4ab0 = 1;
					break;
				}
				case "exit_combat_restore":
				{
					str_vh_anim = s_rider.var_cbf50c1d;
					var_73ba4ab0 = 1;
					break;
				}
			}
			break;
		}
	}
	if(isdefined(str_vh_anim))
	{
		if(is_true(var_73ba4ab0))
		{
			self setanim(str_vh_anim, 1, 0, 1, undefined);
			self setanimtime(str_vh_anim, 1);
		}
		else
		{
			self setanimrestart(str_vh_anim);
		}
	}
}

/*
	Name: set_vehicleriders_bundle
	Namespace: vehicle
	Checksum: 0x2862A0D3
	Offset: 0xAC8
	Size: 0x2A
	Parameters: 1
	Flags: Linked
*/
function set_vehicleriders_bundle(str_bundlename)
{
	self.vehicleriders = getscriptbundle(str_bundlename);
}

