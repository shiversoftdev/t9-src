#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace status_effect_pulse;

/*
	Name: function_b09ce6d
	Namespace: status_effect_pulse
	Checksum: 0xFDF802D2
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b09ce6d()
{
	level notify(1622660320);
}

/*
	Name: __init__system__
	Namespace: status_effect_pulse
	Checksum: 0x532523F6
	Offset: 0xF0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"status_effect_pulse", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: status_effect_pulse
	Checksum: 0xA091B61C
	Offset: 0x138
	Size: 0xBC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	status_effect::register_status_effect_callback_apply(9, &pulse_apply);
	status_effect::function_5bae5120(9, &pulse_end);
	status_effect::function_6f4eaf88(getstatuseffect("pulse"));
	clientfield::register("toplayer", "pulsed", 1, 1, "int");
	callback::on_spawned(&on_player_spawned);
}

/*
	Name: on_player_spawned
	Namespace: status_effect_pulse
	Checksum: 0x80F724D1
	Offset: 0x200
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
}

/*
	Name: pulse_apply
	Namespace: status_effect_pulse
	Checksum: 0x595DE3EE
	Offset: 0x210
	Size: 0x154
	Parameters: 3
	Flags: Linked
*/
function pulse_apply(var_756fda07, weapon, applicant)
{
	self.owner clientfield::set_to_player("pulsed", 1);
	shutdownpulserebootindicatormenu();
	pulserebootmenu = self.owner openluimenu("EmpRebootIndicator");
	self.owner setluimenudata(pulserebootmenu, #"endtime", int(self.endtime));
	self.owner setluimenudata(pulserebootmenu, #"starttime", int(self.endtime - self.duration));
	self thread pulse_rumble_loop(0.75);
	self.owner setempjammed(1);
}

/*
	Name: pulse_rumble_loop
	Namespace: status_effect_pulse
	Checksum: 0xB73139D6
	Offset: 0x370
	Size: 0xAE
	Parameters: 1
	Flags: Linked, Private
*/
function private pulse_rumble_loop(duration)
{
	self endon(#"pulse_rumble_loop");
	self notify(#"pulse_rumble_loop");
	self endon(#"endstatuseffect");
	goaltime = gettime() + (int(duration * 1000));
	while(gettime() < goaltime)
	{
		self.owner playrumbleonentity("damage_heavy");
		waitframe(1);
	}
}

/*
	Name: pulse_end
	Namespace: status_effect_pulse
	Checksum: 0xD1BE262B
	Offset: 0x428
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function pulse_end()
{
	if(isdefined(self))
	{
		shutdownpulserebootindicatormenu();
		if(isdefined(level.emp_shared.enemyempactivefunc))
		{
			if(self [[level.emp_shared.enemyempactivefunc]]())
			{
				return;
			}
		}
		self.owner setempjammed(0);
		self.owner clientfield::set_to_player("pulsed", 0);
	}
}

/*
	Name: shutdownpulserebootindicatormenu
	Namespace: status_effect_pulse
	Checksum: 0xF69908B8
	Offset: 0x4C0
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function shutdownpulserebootindicatormenu()
{
	emprebootmenu = self.owner getluimenu("EmpRebootIndicator");
	if(isdefined(emprebootmenu))
	{
		self.owner closeluimenu(emprebootmenu);
	}
}

