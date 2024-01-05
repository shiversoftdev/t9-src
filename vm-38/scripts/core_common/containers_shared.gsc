#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\struct.gsc;

class ccontainer 
{
	var m_e_container;

	/*
		Name: constructor
		Namespace: ccontainer
		Checksum: 0x80F724D1
		Offset: 0x188
		Size: 0x4
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: ccontainer
		Checksum: 0x80F724D1
		Offset: 0x198
		Size: 0x4
		Parameters: 0
		Flags: 128
	*/
	destructor()
	{
	}

	/*
		Name: init_xmodel
		Namespace: ccontainer
		Checksum: 0x67FC0AE0
		Offset: 0x1A8
		Size: 0x52
		Parameters: 3
		Flags: None
	*/
	function init_xmodel(str_xmodel, v_origin, v_angles)
	{
		if(!isdefined(str_xmodel))
		{
			str_xmodel = "script_origin";
		}
		self.m_e_container = util::spawn_model(str_xmodel, v_origin, v_angles);
		return m_e_container;
	}

}

#namespace containers_shared;

/*
	Name: function_ea51a590
	Namespace: containers_shared
	Checksum: 0x9789A2A
	Offset: 0x168
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ea51a590()
{
	level notify(-1969744097);
}

#namespace containers;

/*
	Name: __init__system__
	Namespace: containers
	Checksum: 0x3C920D0
	Offset: 0x2C0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"containers", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: containers
	Checksum: 0xD8E31D80
	Offset: 0x308
	Size: 0xCE
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	a_containers = struct::get_array("scriptbundle_containers", "classname");
	foreach(s_instance in a_containers)
	{
		c_container = s_instance init();
		if(isdefined(c_container))
		{
			s_instance.c_container = c_container;
		}
	}
}

/*
	Name: init
	Namespace: containers
	Checksum: 0xBED7F408
	Offset: 0x3E0
	Size: 0x52
	Parameters: 0
	Flags: None
*/
function init()
{
	if(!isdefined(self.angles))
	{
		self.angles = (0, 0, 0);
	}
	s_bundle = getscriptbundle(self.scriptbundlename);
	return setup_container_scriptbundle(s_bundle, self);
}

/*
	Name: setup_container_scriptbundle
	Namespace: containers
	Checksum: 0x6083C4DC
	Offset: 0x440
	Size: 0xB0
	Parameters: 2
	Flags: None
*/
function setup_container_scriptbundle(s_bundle, s_container_instance)
{
	c_container = new ccontainer();
	c_container.m_s_container_bundle = s_bundle;
	c_container.m_s_fxanim_bundle = getscriptbundle(s_bundle.theeffectbundle);
	c_container.m_s_container_instance = s_container_instance;
	self scene::init(s_bundle.theeffectbundle, c_container.m_e_container);
	level thread container_update(c_container);
	return c_container;
}

/*
	Name: container_update
	Namespace: containers
	Checksum: 0xB84E69AA
	Offset: 0x4F8
	Size: 0xEC
	Parameters: 1
	Flags: None
*/
function container_update(c_container)
{
	e_ent = c_container.m_e_container;
	s_bundle = c_container.m_s_container_bundle;
	targetname = c_container.m_s_container_instance.targetname;
	n_radius = s_bundle.trigger_radius;
	e_trigger = create_locker_trigger(c_container.m_s_container_instance.origin, n_radius, "Press [{+activate}] to open");
	e_trigger waittill(#"trigger");
	e_trigger delete();
	scene::play(targetname, "targetname");
}

/*
	Name: create_locker_trigger
	Namespace: containers
	Checksum: 0x6834A6AD
	Offset: 0x5F0
	Size: 0x110
	Parameters: 3
	Flags: None
*/
function create_locker_trigger(v_pos, n_radius, str_message)
{
	v_pos = (v_pos[0], v_pos[1], v_pos[2] + 50);
	e_trig = spawn("trigger_radius_use", v_pos, 0, n_radius, 100);
	e_trig triggerignoreteam();
	e_trig setvisibletoall();
	e_trig setteamfortrigger(#"none");
	e_trig usetriggerrequirelookat();
	e_trig setcursorhint("HINT_NOICON");
	e_trig sethintstring(str_message);
	return e_trig;
}

/*
	Name: setup_general_container_bundle
	Namespace: containers
	Checksum: 0xE4A2D6F8
	Offset: 0x708
	Size: 0x32C
	Parameters: 4
	Flags: None
*/
function setup_general_container_bundle(str_targetname, str_intel_vo, str_narrative_collectable_model, force_open)
{
	s_struct = struct::get(str_targetname, "targetname");
	if(!isdefined(s_struct))
	{
		return;
	}
	level flag::wait_till("all_players_spawned");
	e_trigger = create_locker_trigger(s_struct.origin, 64, "Press [{+activate}] to open");
	if(!isdefined(force_open) || force_open == 0)
	{
		waitresult = undefined;
		waitresult = e_trigger waittill(#"trigger");
		e_who = waitresult.activator;
	}
	else
	{
		rand_time = randomfloatrange(1, 1.5);
		wait(rand_time);
	}
	e_trigger delete();
	level thread scene::play(str_targetname, "targetname");
	if(isdefined(s_struct.a_entity))
	{
		for(i = 0; i < s_struct.a_entity.size; i++)
		{
			s_struct.a_entity[i] notify(#"opened");
		}
	}
	if(isdefined(str_narrative_collectable_model))
	{
		v_pos = s_struct.origin + vectorscale((0, 0, 1), 30);
		if(!isdefined(s_struct.angles))
		{
			v_angles = (0, 0, 0);
		}
		else
		{
			v_angles = s_struct.angles;
		}
		v_angles = (v_angles[0], v_angles[1] + 90, v_angles[2]);
		e_collectable = spawn("script_model", v_pos);
		e_collectable setmodel(#"p7_int_narrative_collectable");
		e_collectable.angles = v_angles;
		wait(1);
		e_trigger = create_locker_trigger(s_struct.origin, 64, "Press [{+activate}] to pickup collectable");
		waitresult = undefined;
		waitresult = e_trigger waittill(#"trigger");
		e_who = waitresult.activator;
		e_trigger delete();
		e_collectable delete();
	}
	if(isdefined(str_intel_vo))
	{
		e_who playsound(str_intel_vo);
	}
}

/*
	Name: setup_locker_double_doors
	Namespace: containers
	Checksum: 0x8FC6926E
	Offset: 0xA40
	Size: 0x154
	Parameters: 3
	Flags: None
*/
function setup_locker_double_doors(str_left_door_name, str_right_door_name, center_point_offset)
{
	a_left_doors = getentarray(str_left_door_name, "targetname");
	if(!isdefined(a_left_doors))
	{
		return;
	}
	a_right_doors = getentarray(str_right_door_name, "targetname");
	if(!isdefined(a_right_doors))
	{
		return;
	}
	for(i = 0; i < a_left_doors.size; i++)
	{
		e_left_door = a_left_doors[i];
		if(isdefined(center_point_offset))
		{
			v_forward = anglestoforward(e_left_door.angles);
			v_search_pos = e_left_door.origin + (v_forward * center_point_offset);
		}
		else
		{
			v_search_pos = e_left_door.origin;
		}
		e_right_door = get_closest_ent_from_array(v_search_pos, a_right_doors);
		level thread create_locker_doors(e_left_door, e_right_door, 120, 0.4);
	}
}

/*
	Name: get_closest_ent_from_array
	Namespace: containers
	Checksum: 0x567C4786
	Offset: 0xBA0
	Size: 0xA4
	Parameters: 2
	Flags: None
*/
function get_closest_ent_from_array(v_pos, a_ents)
{
	e_closest = undefined;
	n_closest_dist = 9999999;
	for(i = 0; i < a_ents.size; i++)
	{
		dist = distance(v_pos, a_ents[i].origin);
		if(dist < n_closest_dist)
		{
			n_closest_dist = dist;
			e_closest = a_ents[i];
		}
	}
	return e_closest;
}

/*
	Name: create_locker_doors
	Namespace: containers
	Checksum: 0xDF6DE6BB
	Offset: 0xC50
	Size: 0x174
	Parameters: 4
	Flags: None
*/
function create_locker_doors(e_left_door, e_right_door, door_open_angle, door_open_time)
{
	v_locker_pos = (e_left_door.origin + e_right_door.origin) / 2;
	n_trigger_radius = 48;
	e_trigger = create_locker_trigger(v_locker_pos, n_trigger_radius, "Press [{+activate}] to open");
	e_trigger waittill(#"trigger");
	e_left_door playsound(#"evt_cabinet_open");
	v_angle = (e_left_door.angles[0], e_left_door.angles[1] - door_open_angle, e_left_door.angles[2]);
	e_left_door rotateto(v_angle, door_open_time);
	v_angle = (e_right_door.angles[0], e_right_door.angles[1] + door_open_angle, e_right_door.angles[2]);
	e_right_door rotateto(v_angle, door_open_time);
	e_trigger delete();
}

