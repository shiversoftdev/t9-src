#using scripts\core_common\vehicles\auto_turret.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\core_common\turret_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\microwave_turret_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace guardian_turret;

/*
	Name: __init__system__
	Namespace: guardian_turret
	Checksum: 0xE8DE8E0F
	Offset: 0xE8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"guardian_turret", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: guardian_turret
	Checksum: 0xAE646F0C
	Offset: 0x130
	Size: 0x2C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	vehicle::add_main_callback("microwave_turret", &function_5dfbc20a);
}

/*
	Name: function_5dfbc20a
	Namespace: guardian_turret
	Checksum: 0xB87148D3
	Offset: 0x168
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5dfbc20a()
{
	auto_turret::function_f17009ff();
	guardian_init();
	function_4dc5ff34();
}

/*
	Name: function_4dc5ff34
	Namespace: guardian_turret
	Checksum: 0x1F8F2B64
	Offset: 0x1A8
	Size: 0xBC
	Parameters: 0
	Flags: None
*/
function function_4dc5ff34()
{
	guardian = self;
	guardian vehicle_ai::get_state_callbacks("combat").update_func = &function_21304ee6;
	guardian vehicle_ai::get_state_callbacks("combat").exit_func = &function_4ea89e5a;
	guardian vehicle_ai::get_state_callbacks("unaware").enter_func = &function_ab51fb9e;
	guardian vehicle_ai::set_state("unaware");
}

/*
	Name: function_ab51fb9e
	Namespace: guardian_turret
	Checksum: 0x659F5337
	Offset: 0x270
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function function_ab51fb9e(params)
{
	guardian = self;
	guardian clientfield::set("turret_microwave_open", 0);
}

/*
	Name: function_21304ee6
	Namespace: guardian_turret
	Checksum: 0x8ADEDB2F
	Offset: 0x2B8
	Size: 0x130
	Parameters: 1
	Flags: None
*/
function function_21304ee6(params)
{
	guardian = self;
	guardian endon(#"death", #"change_state");
	if(isdefined(guardian.enemy))
	{
		auto_turret::sentry_turret_alert_sound();
		wait(0.5);
	}
	guardian startmicrowave();
	while(true)
	{
		guardian.turretrotscale = 1;
		if(isdefined(guardian.enemy) && isalive(guardian.enemy) && guardian cansee(guardian.enemy))
		{
			guardian turretsettarget(0, guardian.enemy);
		}
		guardian vehicle_ai::evaluate_connections();
		wait(0.5);
	}
}

/*
	Name: function_4ea89e5a
	Namespace: guardian_turret
	Checksum: 0x6E5171B5
	Offset: 0x3F0
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_4ea89e5a(params)
{
	guardian = self;
	guardian stopmicrowave();
}

/*
	Name: startmicrowave
	Namespace: guardian_turret
	Checksum: 0x68ACC35C
	Offset: 0x428
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function startmicrowave()
{
	guardian = self;
	guardian clientfield::set("turret_microwave_open", 1);
	guardian microwave_turret::startmicrowave();
}

/*
	Name: stopmicrowave
	Namespace: guardian_turret
	Checksum: 0x469A5A8C
	Offset: 0x480
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function stopmicrowave()
{
	guardian = self;
	if(isdefined(guardian))
	{
		guardian clientfield::set("turret_microwave_open", 0);
	}
}

/*
	Name: function_e341abb9
	Namespace: guardian_turret
	Checksum: 0x4D7DEE20
	Offset: 0x4C8
	Size: 0xC4
	Parameters: 2
	Flags: None
*/
function function_e341abb9(totalfiretime, enemy)
{
	guardian = self;
	guardian endon(#"death", #"change_state");
	auto_turret::sentry_turret_alert_sound();
	wait(0.1);
	weapon = guardian seatgetweapon(0);
	firetime = weapon.firetime;
	time = 0;
	while(time < enemy)
	{
		wait(firetime);
		time = time + firetime;
	}
}

/*
	Name: guardian_init
	Namespace: guardian_turret
	Checksum: 0x212F00FC
	Offset: 0x598
	Size: 0x5A
	Parameters: 0
	Flags: None
*/
function guardian_init()
{
	guardian = self;
	guardian.maxsightdistsqrd = 450 * 450;
	guardian turret::set_on_target_angle(15, 0);
	guardian.soundmod = "hpm";
}

