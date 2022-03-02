#using scripts\core_common\doors_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\values_shared.gsc;

class class_65d2fd70 : cdoor
{
	var m_e_door;
	var var_a2f96f78;
	var m_s_bundle;

	/*
		Name: constructor
		Namespace: namespace_65d2fd70
		Checksum: 0x382DAEAD
		Offset: 0x328
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
		Namespace: namespace_65d2fd70
		Checksum: 0xAD021EE9
		Offset: 0x358
		Size: 0x14
		Parameters: 0
		Flags: 16
	*/
	destructor()
	{
	}

	/*
		Name: function_6c15ac46
		Namespace: namespace_65d2fd70
		Checksum: 0xA55917DF
		Offset: 0x988
		Size: 0x138
		Parameters: 0
		Flags: None
	*/
	function function_6c15ac46()
	{
		m_e_door endon(#"delete", #"hash_430683d292f4ba43");
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
		Namespace: namespace_65d2fd70
		Checksum: 0x16793CB9
		Offset: 0x378
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
		Namespace: namespace_65d2fd70
		Checksum: 0x9F94E1F0
		Offset: 0x5A8
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
						m_e_door notify(#"hash_430683d292f4ba43");
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
		Namespace: namespace_65d2fd70
		Checksum: 0x3823380
		Offset: 0x830
		Size: 0x14E
		Parameters: 0
		Flags: None
	*/
	function function_da5abae9()
	{
		m_e_door endon(#"delete", #"hash_430683d292f4ba43");
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

#namespace barricades;

/*
	Name: function_89f2df9
	Namespace: barricades
	Checksum: 0xAAA5F65E
	Offset: 0x130
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"barricades", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: barricades
	Checksum: 0x18FF21F1
	Offset: 0x188
	Size: 0xEE
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!isdefined(level.var_9c740bff))
	{
		level.var_9c740bff = [];
	}
	level.var_9c740bff = struct::get_array("scriptbundle_barricades", "classname");
	foreach(s_instance in level.var_9c740bff)
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
	Checksum: 0x2C718799
	Offset: 0x280
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
	var_2a44a7ed = new class_65d2fd70();
	var_2a44a7ed = [[ var_2a44a7ed ]]->init(var_9fecaae1, self);
	return var_2a44a7ed;
}

/*
	Name: function_8ac3bea9
	Namespace: barricades
	Checksum: 0xCDB96EC0
	Offset: 0x2F8
	Size: 0x24
	Parameters: 0
	Flags: Private
*/
function private function_8ac3bea9()
{
	level flag::wait_till("radiant_gameobjects_initialized");
}

