#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\doors_shared.gsc;

class cbarricade : cdoor
{
	var m_e_door;
	var var_a2f96f78;
	var m_s_bundle;

	/*
		Name: constructor
		Namespace: cbarricade
		Checksum: 0x882363E2
		Offset: 0x348
		Size: 0x22
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
		self.m_str_type = "barricade";
	}

	/*
		Name: destructor
		Namespace: cbarricade
		Checksum: 0x8E4C70AC
		Offset: 0x378
		Size: 0x14
		Parameters: 0
		Flags: 128
	*/
	destructor()
	{
	}

	/*
		Name: function_6c15ac46
		Namespace: cbarricade
		Checksum: 0xF2D9D29F
		Offset: 0x9A8
		Size: 0x138
		Parameters: 0
		Flags: None
	*/
	function function_6c15ac46()
	{
		m_e_door endon(#"delete", #"barricade_removed");
		while(true)
		{
			m_e_door endon(#"delete");
			m_e_door waittill(#"hash_923096b653062ea");
			if(isdefined(var_a2f96f78.target))
			{
				var_59746f25 = struct::get_array(var_a2f96f78.target, "targetname");
				foreach(s_door in var_59746f25)
				{
					s_door.c_door.var_7d28591d = 0;
				}
			}
			waitframe(1);
		}
	}

	/*
		Name: init
		Namespace: cbarricade
		Checksum: 0x72743651
		Offset: 0x398
		Size: 0x224
		Parameters: 2
		Flags: None
	*/
	function init(var_4a686ff8, s_instance)
	{
		self.m_s_bundle = var_4a686ff8;
		self.var_a2f96f78 = s_instance;
		m_s_bundle.door_start_open = s_instance.door_start_open;
		s_instance.c_door = doors::setup_door_info(m_s_bundle, s_instance, self);
		if(is_true(m_s_bundle.door_start_open))
		{
			if(isdefined(var_a2f96f78.target))
			{
				var_59746f25 = struct::get_array(var_a2f96f78.target, "targetname");
				foreach(s_door in var_59746f25)
				{
					s_door.c_door.var_7d28591d = 1;
					if([[ s_door.c_door ]]->is_open())
					{
						[[ s_door.c_door ]]->close();
					}
				}
			}
		}
		if(is_true(m_s_bundle.var_ccc6dafc))
		{
			m_e_door setcandamage(1);
			m_e_door val::set(#"hash_25bedd86747e41e1", "allowdeath", 0);
			thread function_b4a1f06a();
		}
		thread function_da5abae9();
		thread function_6c15ac46();
	}

	/*
		Name: function_b4a1f06a
		Namespace: cbarricade
		Checksum: 0xEC4627FD
		Offset: 0x5C8
		Size: 0x280
		Parameters: 0
		Flags: None
	*/
	function function_b4a1f06a()
	{
		m_e_door endon(#"delete");
		if(!isdefined(m_s_bundle.var_89af4052))
		{
			m_s_bundle.var_89af4052 = 0;
		}
		var_1913ccf5 = m_s_bundle.var_89af4052;
		while(true)
		{
			m_e_door waittill(#"damage");
			if(cdoor::is_open())
			{
				var_1913ccf5--;
				if(var_1913ccf5 < 0)
				{
					var_59746f25 = struct::get_array(var_a2f96f78.target, "targetname");
					foreach(s_door in var_59746f25)
					{
						s_door.c_door.var_7d28591d = 0;
					}
					if(is_true(m_s_bundle.var_170e4611))
					{
						if(isdefined(m_s_bundle.var_8124c17f))
						{
							m_e_door scene::play(m_s_bundle.var_8124c17f, m_e_door);
						}
						m_e_door notify(#"gameobject_deleted");
						m_e_door notify(#"barricade_removed");
						waitframe(1);
						m_e_door.mdl_gameobject delete();
						m_e_door delete();
						break;
					}
					else
					{
						if(cdoor::is_open())
						{
							cdoor::close();
						}
						var_1913ccf5 = m_s_bundle.var_89af4052;
					}
				}
			}
			waitframe(1);
		}
	}

	/*
		Name: function_da5abae9
		Namespace: cbarricade
		Checksum: 0xD4FD4E9E
		Offset: 0x850
		Size: 0x14E
		Parameters: 0
		Flags: None
	*/
	function function_da5abae9()
	{
		m_e_door endon(#"delete", #"barricade_removed");
		while(true)
		{
			m_e_door waittill(#"hash_7166c13e79b73f9");
			if(isdefined(var_a2f96f78.target))
			{
				var_59746f25 = struct::get_array(var_a2f96f78.target, "targetname");
				foreach(s_door in var_59746f25)
				{
					s_door.c_door.var_7d28591d = 1;
					if([[ s_door.c_door ]]->is_open())
					{
						[[ s_door.c_door ]]->close();
					}
				}
			}
			waitframe(1);
		}
	}

}

#namespace namespace_43b55000;

/*
	Name: function_f8c32aff
	Namespace: namespace_43b55000
	Checksum: 0xCEB36900
	Offset: 0x130
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f8c32aff()
{
	level notify(1057710662);
}

#namespace barricades;

/*
	Name: __init__system__
	Namespace: barricades
	Checksum: 0xBA520186
	Offset: 0x150
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"barricades", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: barricades
	Checksum: 0x40854415
	Offset: 0x1A8
	Size: 0xEE
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!isdefined(level.a_s_barricades))
	{
		level.a_s_barricades = [];
	}
	level.a_s_barricades = struct::get_array("scriptbundle_barricades", "classname");
	foreach(s_instance in level.a_s_barricades)
	{
		c_door = s_instance function_14354831();
		if(isdefined(c_door))
		{
			s_instance.c_door = c_door;
		}
	}
}

/*
	Name: function_14354831
	Namespace: barricades
	Checksum: 0x8C70E648
	Offset: 0x2A0
	Size: 0x6E
	Parameters: 0
	Flags: None
*/
function function_14354831()
{
	if(isdefined(self.scriptbundlename))
	{
		var_9fecaae1 = getscriptbundle(self.scriptbundlename);
	}
	var_2a44a7ed = new cbarricade();
	var_2a44a7ed = [[ var_2a44a7ed ]]->init(var_9fecaae1, self);
	return var_2a44a7ed;
}

/*
	Name: function_8ac3bea9
	Namespace: barricades
	Checksum: 0x4EAD9B76
	Offset: 0x318
	Size: 0x24
	Parameters: 0
	Flags: Private
*/
function private function_8ac3bea9()
{
	level flag::wait_till("radiant_gameobjects_initialized");
}

