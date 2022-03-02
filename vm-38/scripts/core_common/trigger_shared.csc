#namespace trigger_shared;

/*
	Name: function_8b203b48
	Namespace: trigger_shared
	Checksum: 0x80D43CEC
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8b203b48()
{
	level notify(35024089);
}

#namespace trigger;

/*
	Name: function_521edc64
	Namespace: trigger
	Checksum: 0xBF2E6296
	Offset: 0x90
	Size: 0x11C
	Parameters: 3
	Flags: Linked
*/
function function_521edc64(ent, on_enter_payload, on_exit_payload)
{
	ent endon(#"death");
	if(!isdefined(self))
	{
		return;
	}
	var_f911c758 = self getentitynumber();
	if(ent ent_already_in(var_f911c758))
	{
		return;
	}
	add_to_ent(ent, var_f911c758);
	if(isdefined(on_enter_payload))
	{
		[[on_enter_payload]](ent);
	}
	while(isdefined(ent) && isdefined(self) && ent istouching(self))
	{
		wait(0.1);
	}
	if(isdefined(ent))
	{
		if(isdefined(on_exit_payload))
		{
			[[on_exit_payload]](ent);
		}
		remove_from_ent(ent, var_f911c758);
	}
}

/*
	Name: ent_already_in
	Namespace: trigger
	Checksum: 0x4BF8E30E
	Offset: 0x1B8
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function ent_already_in(var_d35ff8d8)
{
	if(!isdefined(self._triggers))
	{
		return false;
	}
	if(!isdefined(self._triggers[var_d35ff8d8]))
	{
		return false;
	}
	if(!self._triggers[var_d35ff8d8])
	{
		return false;
	}
	return true;
}

/*
	Name: add_to_ent
	Namespace: trigger
	Checksum: 0x28F60467
	Offset: 0x210
	Size: 0x40
	Parameters: 2
	Flags: Linked
*/
function add_to_ent(ent, var_d35ff8d8)
{
	if(!isdefined(ent._triggers))
	{
		ent._triggers = [];
	}
	ent._triggers[var_d35ff8d8] = 1;
}

/*
	Name: remove_from_ent
	Namespace: trigger
	Checksum: 0x62EC0A94
	Offset: 0x258
	Size: 0x4C
	Parameters: 2
	Flags: Linked
*/
function remove_from_ent(ent, var_d35ff8d8)
{
	if(!isdefined(ent._triggers))
	{
		return;
	}
	if(!isdefined(ent._triggers[var_d35ff8d8]))
	{
		return;
	}
	ent._triggers[var_d35ff8d8] = 0;
}

/*
	Name: death_monitor
	Namespace: trigger
	Checksum: 0xDA12C962
	Offset: 0x2B0
	Size: 0x4C
	Parameters: 2
	Flags: None
*/
function death_monitor(ent, ender)
{
	ent waittill(#"death");
	self endon(ender);
	self remove_from_ent(ent);
}

/*
	Name: trigger_wait
	Namespace: trigger
	Checksum: 0xC7036E1C
	Offset: 0x308
	Size: 0x7C
	Parameters: 1
	Flags: None
*/
function trigger_wait(n_clientnum)
{
	self endon(#"trigger");
	if(isdefined(self.targetname))
	{
		trig = getent(n_clientnum, self.targetname, "target");
		if(isdefined(trig))
		{
			trig waittill(#"trigger");
		}
	}
}

