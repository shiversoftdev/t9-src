#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace wz_firing_range;

/*
	Name: init_targets
	Namespace: wz_firing_range
	Checksum: 0x7FD8866C
	Offset: 0x80
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
	Checksum: 0x9F58B018
	Offset: 0x150
	Size: 0x14A
	Parameters: 0
	Flags: Private
*/
function private init_target()
{
	self.hitindex = 1;
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
	Checksum: 0xFB324112
	Offset: 0x2A8
	Size: 0x84
	Parameters: 2
	Flags: Private
*/
function private function_5bab934a(struct, var_d1d733b4)
{
	var_32c844bb = var_d1d733b4 - gettime();
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
	Checksum: 0xCCDC6065
	Offset: 0x338
	Size: 0x166
	Parameters: 0
	Flags: Private
*/
function private follow_path()
{
	starttime = int(((floor(gettime() / self.var_3dc92b90)) * self.var_3dc92b90) + self.var_3dc92b90);
	while(gettime() < starttime)
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
		endtime = endtime + self.structs[1].script_int;
		movetime = function_5bab934a(self.structs[1], endtime);
		self function_49ed8678(self.structs[0].origin, movetime);
		wait(movetime);
	}
}

/*
	Name: function_209450ae
	Namespace: wz_firing_range
	Checksum: 0xD9FB29C7
	Offset: 0x4A8
	Size: 0x1D2
	Parameters: 1
	Flags: Private, Event
*/
event private function_209450ae(eventstruct)
{
	dynent = eventstruct.ent;
	if(!isdefined(dynent.hitindex))
	{
		return;
	}
	dynent.health = 50;
	if(function_ffdbe8c2(dynent) != 0)
	{
		return;
	}
	angles = dynent.angles - vectorscale((0, 1, 0), 270);
	fwd = anglestoforward(angles);
	if((vectordot((0, 0, 0) - eventstruct.dir, fwd)) <= 0)
	{
		return;
	}
	bundle = function_489009c1(dynent);
	if(isstruct(bundle) && isarray(bundle.dynentstates))
	{
		var_daedea1b = bundle.dynentstates[dynent.hitindex];
		if(isdefined(var_daedea1b.var_879eb2ff))
		{
			function_e2a06860(dynent, dynent.hitindex);
			animlength = getanimlength(var_daedea1b.var_879eb2ff);
			wait(animlength);
			function_e2a06860(dynent, 0);
			dynent.hitindex = 1 + (dynent.hitindex % 2);
		}
	}
}

