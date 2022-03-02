#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace serverfaceanim_shared;

/*
	Name: function_4c8015f3
	Namespace: serverfaceanim_shared
	Checksum: 0x92A28AC1
	Offset: 0xC0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4c8015f3()
{
	level notify(311695163);
}

#namespace serverfaceanim;

/*
	Name: function_89f2df9
	Namespace: serverfaceanim
	Checksum: 0x3030ED3A
	Offset: 0xE0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"serverfaceanim", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: serverfaceanim
	Checksum: 0x3C49B72F
	Offset: 0x128
	Size: 0x44
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!is_true(level._use_faceanim))
	{
		return;
	}
	callback::on_spawned(&init_serverfaceanim);
}

/*
	Name: init_serverfaceanim
	Namespace: serverfaceanim
	Checksum: 0x52EF84D5
	Offset: 0x178
	Size: 0x1CC
	Parameters: 0
	Flags: None
*/
function init_serverfaceanim()
{
	self.do_face_anims = 1;
	if(!isdefined(level.face_event_handler))
	{
		level.face_event_handler = spawnstruct();
		level.face_event_handler.events = [];
		level.face_event_handler.events[#"death"] = "face_death";
		level.face_event_handler.events[#"hash_70bb20cec150f744"] = "face_alert";
		level.face_event_handler.events[#"bulletwhizby"] = "face_alert";
		level.face_event_handler.events[#"projectile_impact"] = "face_alert";
		level.face_event_handler.events[#"explode"] = "face_alert";
		level.face_event_handler.events[#"alert"] = "face_alert";
		level.face_event_handler.events[#"shoot"] = "face_shoot_single";
		level.face_event_handler.events[#"melee"] = "face_melee";
		level.face_event_handler.events[#"damage"] = "face_pain";
		level thread wait_for_face_event();
	}
}

/*
	Name: wait_for_face_event
	Namespace: serverfaceanim
	Checksum: 0x77130515
	Offset: 0x350
	Size: 0xD0
	Parameters: 0
	Flags: None
*/
function wait_for_face_event()
{
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"face");
		face_notify = waitresult.face_notify;
		ent = waitresult.entity;
		if(isdefined(ent) && isdefined(ent.do_face_anims) && ent.do_face_anims)
		{
			if(isdefined(level.face_event_handler.events[face_notify]))
			{
				ent sendfaceevent(level.face_event_handler.events[face_notify]);
			}
		}
	}
}

