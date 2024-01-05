#using scripts\core_common\struct.csc;

#namespace wz_firing_range;

/*
	Name: init_targets
	Namespace: wz_firing_range
	Checksum: 0x78FD9AA2
	Offset: 0x78
	Size: 0xC8
	Parameters: 1
	Flags: None
*/
function init_targets(targetname)
{
	targets = getdynentarray(targetname);
	foreach(target in targets)
	{
		if(target init_target())
		{
			target thread follow_path();
		}
	}
}

/*
	Name: init_target
	Namespace: wz_firing_range
	Checksum: 0x8F7C8244
	Offset: 0x148
	Size: 0x13A
	Parameters: 0
	Flags: Private
*/
function private init_target()
{
	if(!isdefined(self.target))
	{
		return false;
	}
	structs = [];
	var_3dc92b90 = 0;
	var_dc0e8c88 = struct::get(self.target, "targetname");
	struct = var_dc0e8c88;
	do
	{
		if(!isdefined(struct) || !isint(struct.script_int) || struct.script_int <= 0)
		{
			return false;
		}
		structs[structs.size] = struct;
		var_3dc92b90 = var_3dc92b90 + struct.script_int;
		struct = struct::get(struct.target, "targetname");
	}
	while(struct != var_dc0e8c88);
	/#
		assert(structs.size == 2);
	#/
	self.structs = structs;
	self.var_3dc92b90 = var_3dc92b90;
	return true;
}

/*
	Name: function_5bab934a
	Namespace: wz_firing_range
	Checksum: 0x8286DC9E
	Offset: 0x290
	Size: 0x94
	Parameters: 2
	Flags: Private
*/
function private function_5bab934a(struct, var_d1d733b4)
{
	var_32c844bb = var_d1d733b4 - getservertime(0);
	if(var_32c844bb <= 0)
	{
		var_32c844bb = int(1 * 1000);
	}
	movetime = float(var_32c844bb) / 1000;
	return movetime;
}

/*
	Name: follow_path
	Namespace: wz_firing_range
	Checksum: 0xB387E5DF
	Offset: 0x330
	Size: 0x1E0
	Parameters: 0
	Flags: Private
*/
function private follow_path()
{
	starttime = int(((floor(getservertime(0) / self.var_3dc92b90)) * self.var_3dc92b90) + self.var_3dc92b90);
	while(getservertime(0) < starttime)
	{
		waitframe(1);
	}
	endtime = starttime;
	while(true)
	{
		endtime = endtime + self.structs[0].script_int;
		movetime = function_5bab934a(self.structs[0], endtime);
		self function_49ed8678(self.structs[1].origin, movetime);
		wait(movetime);
		playsound(0, #"amb_target_stop", self.origin);
		endtime = endtime + self.structs[1].script_int;
		movetime = function_5bab934a(self.structs[1], endtime);
		self function_49ed8678(self.structs[0].origin, movetime);
		wait(movetime);
		playsound(0, #"amb_target_stop", self.origin);
	}
}

