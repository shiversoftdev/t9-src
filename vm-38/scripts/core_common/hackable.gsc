#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace hackable;

/*
	Name: function_abe6c067
	Namespace: hackable
	Checksum: 0x997C0D76
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_abe6c067()
{
	level notify(425721214);
}

/*
	Name: function_89f2df9
	Namespace: hackable
	Checksum: 0xBDBD323D
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hackable", &init, undefined, undefined, undefined);
}

/*
	Name: init
	Namespace: hackable
	Checksum: 0xE1FE1F02
	Offset: 0xD8
	Size: 0x20
	Parameters: 0
	Flags: None
*/
function init()
{
	if(!isdefined(level.hackable_items))
	{
		level.hackable_items = [];
	}
}

/*
	Name: add_hackable_object
	Namespace: hackable
	Checksum: 0x8780147E
	Offset: 0x100
	Size: 0x222
	Parameters: 5
	Flags: None
*/
function add_hackable_object(obj, test_callback, start_callback, fail_callback, complete_callback)
{
	cleanup_hackable_objects();
	if(!isdefined(level.hackable_items))
	{
		level.hackable_items = [];
	}
	else if(!isarray(level.hackable_items))
	{
		level.hackable_items = array(level.hackable_items);
	}
	level.hackable_items[level.hackable_items.size] = obj;
	if(!isdefined(obj.hackable_distance_sq))
	{
		obj.hackable_distance_sq = getdvarfloat(#"scr_hacker_default_distance", 0) * getdvarfloat(#"scr_hacker_default_distance", 0);
	}
	if(!isdefined(obj.hackable_angledot))
	{
		obj.hackable_angledot = getdvarfloat(#"scr_hacker_default_angledot", 0);
	}
	if(!isdefined(obj.hackable_timeout))
	{
		obj.hackable_timeout = getdvarfloat(#"scr_hacker_default_timeout", 0);
	}
	if(!isdefined(obj.hackable_progress_prompt))
	{
		obj.hackable_progress_prompt = #"hash_7080e1304a0ce47d";
	}
	if(!isdefined(obj.hackable_cost_mult))
	{
		obj.hackable_cost_mult = 1;
	}
	if(!isdefined(obj.hackable_hack_time))
	{
		obj.hackable_hack_time = getdvarfloat(#"scr_hacker_default_hack_time", 0);
	}
	obj.hackable_test_callback = test_callback;
	obj.hackable_start_callback = start_callback;
	obj.hackable_fail_callback = fail_callback;
	obj.hackable_hacked_callback = complete_callback;
}

/*
	Name: remove_hackable_object
	Namespace: hackable
	Checksum: 0xE508C698
	Offset: 0x330
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function remove_hackable_object(obj)
{
	arrayremovevalue(level.hackable_items, obj);
	cleanup_hackable_objects();
}

/*
	Name: cleanup_hackable_objects
	Namespace: hackable
	Checksum: 0x52F9550B
	Offset: 0x378
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function cleanup_hackable_objects()
{
	level.hackable_items = array::filter(level.hackable_items, 0, &filter_deleted);
}

/*
	Name: filter_deleted
	Namespace: hackable
	Checksum: 0x50F5AF93
	Offset: 0x3B8
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function filter_deleted(val)
{
	return isdefined(val);
}

/*
	Name: find_hackable_object
	Namespace: hackable
	Checksum: 0xAE596EA7
	Offset: 0x3D0
	Size: 0x156
	Parameters: 0
	Flags: None
*/
function find_hackable_object()
{
	cleanup_hackable_objects();
	candidates = [];
	origin = self.origin;
	forward = anglestoforward(self.angles);
	foreach(obj in level.hackable_items)
	{
		if(self is_object_hackable(obj, origin, forward))
		{
			if(!isdefined(candidates))
			{
				candidates = [];
			}
			else if(!isarray(candidates))
			{
				candidates = array(candidates);
			}
			candidates[candidates.size] = obj;
		}
	}
	if(candidates.size > 0)
	{
		return arraygetclosest(self.origin, candidates);
	}
	return undefined;
}

/*
	Name: is_object_hackable
	Namespace: hackable
	Checksum: 0x254D7A7C
	Offset: 0x530
	Size: 0xF4
	Parameters: 3
	Flags: None
*/
function is_object_hackable(obj, origin, forward)
{
	if(distancesquared(origin, obj.origin) < obj.hackable_distance_sq)
	{
		to_obj = obj.origin - origin;
		to_obj = (to_obj[0], to_obj[1], 0);
		to_obj = vectornormalize(to_obj);
		dot = vectordot(to_obj, forward);
		if(dot >= obj.hackable_angledot)
		{
			if(isdefined(obj.hackable_test_callback))
			{
				return obj [[obj.hackable_test_callback]](self);
			}
			return 1;
		}
		/#
		#/
	}
	return 0;
}

/*
	Name: start_hacking_object
	Namespace: hackable
	Checksum: 0x1D1FBF77
	Offset: 0x630
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function start_hacking_object(obj)
{
	obj.hackable_being_hacked = 1;
	obj.hackable_hacked_amount = 0;
	if(isdefined(obj.hackable_start_callback))
	{
		obj thread [[obj.hackable_start_callback]](self);
	}
}

/*
	Name: fail_hacking_object
	Namespace: hackable
	Checksum: 0xBA599EB
	Offset: 0x688
	Size: 0x60
	Parameters: 1
	Flags: None
*/
function fail_hacking_object(obj)
{
	if(isdefined(obj.hackable_fail_callback))
	{
		obj thread [[obj.hackable_fail_callback]](self);
	}
	obj.hackable_hacked_amount = 0;
	obj.hackable_being_hacked = 0;
	obj notify(#"hackable_watch_timeout");
}

/*
	Name: complete_hacking_object
	Namespace: hackable
	Checksum: 0xEED6E23E
	Offset: 0x6F0
	Size: 0x5E
	Parameters: 1
	Flags: None
*/
function complete_hacking_object(obj)
{
	obj notify(#"hackable_watch_timeout");
	if(isdefined(obj.hackable_hacked_callback))
	{
		obj thread [[obj.hackable_hacked_callback]](self);
	}
	obj.hackable_hacked_amount = 0;
	obj.hackable_being_hacked = 0;
}

/*
	Name: watch_timeout
	Namespace: hackable
	Checksum: 0xC5ACBE3A
	Offset: 0x758
	Size: 0x5C
	Parameters: 2
	Flags: None
*/
function watch_timeout(obj, time)
{
	obj notify(#"hackable_watch_timeout");
	obj endon(#"hackable_watch_timeout");
	wait(time);
	if(isdefined(obj))
	{
		fail_hacking_object(obj);
	}
}

/*
	Name: continue_hacking_object
	Namespace: hackable
	Checksum: 0xE3A2054A
	Offset: 0x7C0
	Size: 0x18A
	Parameters: 1
	Flags: None
*/
function continue_hacking_object(obj)
{
	origin = self.origin;
	forward = anglestoforward(self.angles);
	if(self is_object_hackable(obj, origin, forward))
	{
		if(!is_true(obj.hackable_being_hacked))
		{
			self start_hacking_object(obj);
		}
		if(isdefined(obj.hackable_timeout) && obj.hackable_timeout > 0)
		{
			self thread watch_timeout(obj, obj.hackable_timeout);
		}
		amt = 1 / (20 * obj.hackable_hack_time);
		obj.hackable_hacked_amount = obj.hackable_hacked_amount + amt;
		if(obj.hackable_hacked_amount > 1)
		{
			self complete_hacking_object(obj);
		}
		if(is_true(obj.hackable_being_hacked))
		{
			return obj.hackable_hacked_amount;
		}
	}
	return -1;
}

