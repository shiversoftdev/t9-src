#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace array_shared;

/*
	Name: function_77fad99f
	Namespace: array_shared
	Checksum: 0xFD87B4BF
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_77fad99f()
{
	level notify(431468876);
}

#namespace array;

/*
	Name: filter
	Namespace: array
	Checksum: 0xA42EBB8E
	Offset: 0xB0
	Size: 0x190
	Parameters: 4
	Flags: Linked, Variadic
*/
function filter(&array, b_keep_keys, func_filter, ...)
{
	a_new = [];
	foreach(val in array)
	{
		a_args = arraycombine(array(val), vararg, 1, 0);
		if(util::single_func_argarray(undefined, func_filter, a_args))
		{
			if(isstring(key) || isweapon(key))
			{
				if(isdefined(b_keep_keys) && !b_keep_keys)
				{
					a_new[a_new.size] = val;
				}
				else
				{
					a_new[key] = val;
				}
				continue;
			}
			if(is_true(b_keep_keys))
			{
				a_new[key] = val;
				continue;
			}
			a_new[a_new.size] = val;
		}
	}
	return a_new;
}

/*
	Name: filter_classname
	Namespace: array
	Checksum: 0x1E60BB34
	Offset: 0x248
	Size: 0x3A
	Parameters: 3
	Flags: Linked
*/
function filter_classname(&array, b_keep_keys, str_classname)
{
	return filter(array, b_keep_keys, &_filter_classname, str_classname);
}

/*
	Name: function_f23011ac
	Namespace: array
	Checksum: 0xB645F975
	Offset: 0x290
	Size: 0x3A
	Parameters: 3
	Flags: None
*/
function function_f23011ac(&array, b_keep_keys, str_classname)
{
	return filter(array, b_keep_keys, &function_e01a747e, str_classname);
}

/*
	Name: get_touching
	Namespace: array
	Checksum: 0x700F76C4
	Offset: 0x2D8
	Size: 0xFA
	Parameters: 2
	Flags: Linked
*/
function get_touching(a_ents, e_volume)
{
	a_touching = [];
	foreach(e_ent in a_ents)
	{
		if(e_ent istouching(e_volume))
		{
			if(!isdefined(a_touching))
			{
				a_touching = [];
			}
			else if(!isarray(a_touching))
			{
				a_touching = array(a_touching);
			}
			a_touching[a_touching.size] = e_ent;
		}
	}
	return a_touching;
}

/*
	Name: remove_index
	Namespace: array
	Checksum: 0xAB88878C
	Offset: 0x3E0
	Size: 0xE0
	Parameters: 3
	Flags: Linked
*/
function remove_index(array, index, b_keep_keys)
{
	a_new = [];
	foreach(val in array)
	{
		if(key == index)
		{
			continue;
			continue;
		}
		if(is_true(b_keep_keys))
		{
			a_new[key] = val;
			continue;
		}
		a_new[a_new.size] = val;
	}
	return a_new;
}

/*
	Name: function_b1d17853
	Namespace: array
	Checksum: 0xDF0DBC24
	Offset: 0x4C8
	Size: 0x1EA
	Parameters: 1
	Flags: None
*/
function function_b1d17853(&array)
{
	remove = [];
	checked = [];
	foreach(key, item in array)
	{
		if(!isdefined(item))
		{
			add(remove, key);
			continue;
		}
		checked[key] = 1;
		foreach(var_cc6c9b0a in array)
		{
			if(var_279de89e != key && var_cc6c9b0a == item && !isdefined(checked[var_279de89e]))
			{
				add(remove, key);
				break;
			}
		}
	}
	foreach(key in remove)
	{
		array[key] = undefined;
	}
	return array;
}

/*
	Name: delete_all
	Namespace: array
	Checksum: 0x550FF86B
	Offset: 0x6C0
	Size: 0x100
	Parameters: 1
	Flags: Linked
*/
function delete_all(&array)
{
	foreach(ent in array)
	{
		if(isdefined(ent))
		{
			if(isstruct(ent))
			{
				ent struct::delete();
				continue;
			}
			if(isdefined(ent.__vtable))
			{
				ent._deleted = 1;
				ent notify(#"death");
				ent = undefined;
				continue;
			}
			ent delete();
		}
	}
}

/*
	Name: notify_all
	Namespace: array
	Checksum: 0x2FE3DFF9
	Offset: 0x7C8
	Size: 0x8A
	Parameters: 2
	Flags: Linked
*/
function notify_all(&array, str_notify)
{
	foreach(elem in array)
	{
		elem notify(str_notify);
	}
}

/*
	Name: thread_all
	Namespace: array
	Checksum: 0x49F29B7E
	Offset: 0x860
	Size: 0x15C
	Parameters: 8
	Flags: Linked
*/
function thread_all(&entities, func, arg1, arg2, arg3, arg4, arg5, arg6)
{
	/#
		assert(isdefined(entities), "");
	#/
	/#
		assert(isdefined(func), "");
	#/
	if(isarray(entities))
	{
		foreach(ent in entities)
		{
			util::single_thread(ent, func, arg1, arg2, arg3, arg4, arg5, arg6);
		}
	}
	else
	{
		util::single_thread(entities, func, arg1, arg2, arg3, arg4, arg5, arg6);
	}
}

/*
	Name: thread_all_ents
	Namespace: array
	Checksum: 0x83EEF122
	Offset: 0x9C8
	Size: 0x14C
	Parameters: 7
	Flags: Linked
*/
function thread_all_ents(&entities, func, arg1, arg2, arg3, arg4, arg5)
{
	/#
		assert(isdefined(entities), "");
	#/
	/#
		assert(isdefined(func), "");
	#/
	if(isarray(entities))
	{
		foreach(v in entities)
		{
			util::single_thread(self, func, v, arg1, arg2, arg3, arg4, arg5);
		}
	}
	else
	{
		util::single_thread(self, func, entities, arg1, arg2, arg3, arg4, arg5);
	}
}

/*
	Name: run_all
	Namespace: array
	Checksum: 0x5AE58B95
	Offset: 0xB20
	Size: 0x15C
	Parameters: 8
	Flags: Linked
*/
function run_all(&entities, func, arg1, arg2, arg3, arg4, arg5, arg6)
{
	/#
		assert(isdefined(entities), "");
	#/
	/#
		assert(isdefined(func), "");
	#/
	if(isarray(entities))
	{
		foreach(ent in entities)
		{
			util::single_func(ent, func, arg1, arg2, arg3, arg4, arg5, arg6);
		}
	}
	else
	{
		util::single_func(entities, func, arg1, arg2, arg3, arg4, arg5, arg6);
	}
}

/*
	Name: exclude
	Namespace: array
	Checksum: 0x51A5118E
	Offset: 0xC88
	Size: 0xE0
	Parameters: 2
	Flags: Linked
*/
function exclude(array, array_exclude)
{
	newarray = array;
	if(isarray(array_exclude))
	{
		foreach(exclude_item in array_exclude)
		{
			arrayremovevalue(newarray, exclude_item);
		}
	}
	else
	{
		arrayremovevalue(newarray, array_exclude);
	}
	return newarray;
}

/*
	Name: add
	Namespace: array
	Checksum: 0x3F88C0A4
	Offset: 0xD70
	Size: 0x66
	Parameters: 3
	Flags: Linked
*/
function add(&array, item, allow_dupes)
{
	if(!isdefined(allow_dupes))
	{
		allow_dupes = 1;
	}
	if(isdefined(item))
	{
		if(allow_dupes || !isinarray(array, item))
		{
			array[array.size] = item;
		}
	}
}

/*
	Name: add_sorted
	Namespace: array
	Checksum: 0x4EE4643A
	Offset: 0xDE0
	Size: 0x118
	Parameters: 5
	Flags: None
*/
function add_sorted(&array, item, allow_dupes, func_compare, var_e19f0739)
{
	if(!isdefined(allow_dupes))
	{
		allow_dupes = 1;
	}
	if(!isdefined(var_e19f0739))
	{
		var_e19f0739 = 0;
	}
	if(isdefined(item))
	{
		if(allow_dupes || !isinarray(array, item))
		{
			for(i = 0; i <= array.size; i++)
			{
				if(i == array.size || (isdefined(func_compare) && ([[func_compare]](item, array[i]) || var_e19f0739)) || (!isdefined(func_compare) && (item <= array[i] || var_e19f0739)))
				{
					arrayinsert(array, item, i);
					break;
				}
			}
		}
	}
}

/*
	Name: wait_till
	Namespace: array
	Checksum: 0xA0756CBD
	Offset: 0xF00
	Size: 0x154
	Parameters: 3
	Flags: Linked
*/
function wait_till(&array, notifies, n_timeout)
{
	if(isdefined(n_timeout))
	{
		__s = spawnstruct();
		__s endon(#"timeout");
		__s util::delay_notify(n_timeout, "timeout");
	}
	s_tracker = spawnstruct();
	s_tracker._wait_count = 0;
	foreach(ent in array)
	{
		if(isdefined(ent))
		{
			ent thread util::timeout(n_timeout, &util::_waitlogic, s_tracker, notifies);
		}
	}
	if(s_tracker._wait_count > 0)
	{
		s_tracker waittill(#"waitlogic_finished");
	}
}

/*
	Name: wait_till_match
	Namespace: array
	Checksum: 0x4806FFC8
	Offset: 0x1060
	Size: 0x184
	Parameters: 4
	Flags: None
*/
function wait_till_match(&array, str_notify, str_match, n_timeout)
{
	if(isdefined(n_timeout))
	{
		__s = spawnstruct();
		__s endon(#"timeout");
		__s util::delay_notify(n_timeout, "timeout");
	}
	s_tracker = spawnstruct();
	s_tracker._array_wait_count = 0;
	foreach(ent in array)
	{
		if(isdefined(ent))
		{
			s_tracker._array_wait_count++;
			ent thread util::timeout(n_timeout, &_waitlogic_match, s_tracker, str_notify, str_match);
			ent thread util::timeout(n_timeout, &_waitlogic_death, s_tracker);
		}
	}
	if(s_tracker._array_wait_count > 0)
	{
		s_tracker waittill(#"array_wait");
	}
}

/*
	Name: _waitlogic_match
	Namespace: array
	Checksum: 0xD9CFDC1E
	Offset: 0x11F0
	Size: 0x54
	Parameters: 3
	Flags: Linked
*/
function _waitlogic_match(s_tracker, str_notify, str_match)
{
	self endon(#"death");
	self waittillmatch(str_match, str_notify);
	update_waitlogic_tracker(s_tracker);
}

/*
	Name: _waitlogic_death
	Namespace: array
	Checksum: 0xC548968A
	Offset: 0x1250
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function _waitlogic_death(s_tracker)
{
	self waittill(#"death");
	update_waitlogic_tracker(s_tracker);
}

/*
	Name: update_waitlogic_tracker
	Namespace: array
	Checksum: 0x70D91E88
	Offset: 0x1290
	Size: 0x40
	Parameters: 1
	Flags: Linked
*/
function update_waitlogic_tracker(s_tracker)
{
	s_tracker._array_wait_count--;
	if(s_tracker._array_wait_count == 0)
	{
		s_tracker notify(#"array_wait");
	}
}

/*
	Name: flag_wait
	Namespace: array
	Checksum: 0x26FA5969
	Offset: 0x12D8
	Size: 0x8C
	Parameters: 2
	Flags: Linked
*/
function flag_wait(&array, str_flag)
{
	for(i = 0; i < array.size; i++)
	{
		ent = array[i];
		if(isdefined(ent) && !ent flag::get(str_flag))
		{
			ent waittill(#"death", str_flag);
			i = -1;
		}
	}
}

/*
	Name: function_d77ef691
	Namespace: array
	Checksum: 0x3671BF9B
	Offset: 0x1370
	Size: 0x108
	Parameters: 2
	Flags: Variadic
*/
function function_d77ef691(&array, ...)
{
	for(i = 0; i < array.size; i++)
	{
		ent = array[i];
		if(isdefined(ent))
		{
			b_flag_set = 0;
			foreach(str_flag in vararg)
			{
				if(ent flag::get(str_flag))
				{
					b_flag_set = 1;
					break;
				}
			}
			if(!b_flag_set)
			{
				ent waittill(vararg);
				i = -1;
			}
		}
	}
}

/*
	Name: flag_wait_clear
	Namespace: array
	Checksum: 0x9E793DF1
	Offset: 0x1480
	Size: 0xC8
	Parameters: 3
	Flags: Linked
*/
function flag_wait_clear(&array, str_flag, n_timeout)
{
	if(isdefined(n_timeout))
	{
		__s = spawnstruct();
		__s endon(#"timeout");
		__s util::delay_notify(n_timeout, "timeout");
	}
	for(i = 0; i < array.size; i++)
	{
		ent = array[i];
		if(ent flag::get(str_flag))
		{
			ent waittill(str_flag);
			i = -1;
		}
	}
}

/*
	Name: wait_any
	Namespace: array
	Checksum: 0x8CE2E6B1
	Offset: 0x1550
	Size: 0x154
	Parameters: 3
	Flags: Linked
*/
function wait_any(array, msg, n_timeout)
{
	if(isdefined(n_timeout))
	{
		__s = spawnstruct();
		__s endon(#"timeout");
		__s util::delay_notify(n_timeout, "timeout");
	}
	s_tracker = spawnstruct();
	foreach(ent in array)
	{
		if(isdefined(ent))
		{
			level thread util::timeout(n_timeout, &_waitlogic2, s_tracker, ent, msg);
		}
	}
	s_tracker endon(#"array_wait");
	wait_till(array, "death");
}

/*
	Name: _waitlogic2
	Namespace: array
	Checksum: 0x58094023
	Offset: 0x16B0
	Size: 0x78
	Parameters: 3
	Flags: Linked
*/
function _waitlogic2(s_tracker, ent, msg)
{
	s_tracker endon(#"array_wait");
	if(msg != "death")
	{
		ent endon(#"death");
	}
	ent waittill(msg);
	s_tracker notify(#"array_wait");
}

/*
	Name: flag_wait_any
	Namespace: array
	Checksum: 0xB73B3BEC
	Offset: 0x1730
	Size: 0xD4
	Parameters: 2
	Flags: None
*/
function flag_wait_any(array, str_flag)
{
	self endon(#"death");
	foreach(ent in array)
	{
		if(ent flag::get(str_flag))
		{
			return ent;
		}
	}
	wait_any(array, str_flag);
}

/*
	Name: random
	Namespace: array
	Checksum: 0x3EA9F3FB
	Offset: 0x1810
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function random(&array)
{
	if(array.size > 0)
	{
		keys = getarraykeys(array);
		return array[keys[randomint(keys.size)]];
	}
}

/*
	Name: randomize
	Namespace: array
	Checksum: 0x55B5EE3F
	Offset: 0x1870
	Size: 0x7E
	Parameters: 1
	Flags: Linked
*/
function randomize(array)
{
	for(i = 0; i < array.size; i++)
	{
		j = randomint(array.size);
		temp = array[i];
		array[i] = array[j];
		array[j] = temp;
	}
	return array;
}

/*
	Name: function_20973c2b
	Namespace: array
	Checksum: 0x78265F8
	Offset: 0x18F8
	Size: 0x7E
	Parameters: 1
	Flags: None
*/
function function_20973c2b(array)
{
	for(i = 0; i < array.size; i++)
	{
		j = function_d59c2d03(array.size);
		temp = array[i];
		array[i] = array[j];
		array[j] = temp;
	}
	return array;
}

/*
	Name: reverse
	Namespace: array
	Checksum: 0xBA07CBC7
	Offset: 0x1980
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function reverse(array)
{
	a_array2 = [];
	for(i = array.size - 1; i >= 0; i--)
	{
		a_array2[a_array2.size] = array[i];
	}
	return a_array2;
}

/*
	Name: slice
	Namespace: array
	Checksum: 0xD220B1E0
	Offset: 0x19E8
	Size: 0xC2
	Parameters: 4
	Flags: Linked
*/
function slice(&array, var_12692bcf, var_d88b3814, n_increment)
{
	if(!isdefined(var_12692bcf))
	{
		var_12692bcf = 0;
	}
	if(!isdefined(var_d88b3814))
	{
		var_d88b3814 = 2147483647;
	}
	if(!isdefined(n_increment))
	{
		n_increment = 1;
	}
	var_d88b3814 = min(var_d88b3814, array.size - 1);
	a_ret = [];
	i = var_12692bcf;
	while(i <= var_d88b3814)
	{
		a_ret[a_ret.size] = array[i];
		i = i + n_increment;
	}
	return a_ret;
}

/*
	Name: remove_keys
	Namespace: array
	Checksum: 0x878B7E56
	Offset: 0x1AB8
	Size: 0x9E
	Parameters: 1
	Flags: None
*/
function remove_keys(array)
{
	a_new = [];
	foreach(val in array)
	{
		if(isdefined(val))
		{
			a_new[a_new.size] = val;
		}
	}
	return a_new;
}

/*
	Name: swap
	Namespace: array
	Checksum: 0x7A26D9E9
	Offset: 0x1B60
	Size: 0x98
	Parameters: 3
	Flags: Linked
*/
function swap(&array, index1, index2)
{
	/#
		assert(index1 < array.size, "");
	#/
	/#
		assert(index2 < array.size, "");
	#/
	temp = array[index1];
	array[index1] = array[index2];
	array[index2] = temp;
}

/*
	Name: pop
	Namespace: array
	Checksum: 0x7505293B
	Offset: 0x1C00
	Size: 0x92
	Parameters: 3
	Flags: Linked
*/
function pop(&array, index, b_keep_keys)
{
	if(!isdefined(b_keep_keys))
	{
		b_keep_keys = 1;
	}
	if(array.size > 0)
	{
		if(!isdefined(index))
		{
			index = getlastarraykey(array);
		}
		if(isdefined(array[index]))
		{
			ret = array[index];
			arrayremoveindex(array, index, b_keep_keys);
			return ret;
		}
	}
}

/*
	Name: pop_front
	Namespace: array
	Checksum: 0x1C606C8D
	Offset: 0x1CA0
	Size: 0x5A
	Parameters: 2
	Flags: Linked
*/
function pop_front(&array, b_keep_keys)
{
	if(!isdefined(b_keep_keys))
	{
		b_keep_keys = 1;
	}
	index = getfirstarraykey(array);
	return pop(array, index, b_keep_keys);
}

/*
	Name: function_a3b0f814
	Namespace: array
	Checksum: 0xB481C4A5
	Offset: 0x1D08
	Size: 0x5A
	Parameters: 2
	Flags: Linked
*/
function function_a3b0f814(&array, b_keep_keys)
{
	if(!isdefined(b_keep_keys))
	{
		b_keep_keys = 1;
	}
	return pop(array, random(getarraykeys(array)), b_keep_keys);
}

/*
	Name: push
	Namespace: array
	Checksum: 0xD74002A
	Offset: 0x1D70
	Size: 0x4C
	Parameters: 3
	Flags: Linked
*/
function push(&array, val, index)
{
	if(!isdefined(index))
	{
		index = array.size + 1;
	}
	arrayinsert(array, val, index);
}

/*
	Name: push_front
	Namespace: array
	Checksum: 0x228E37CF
	Offset: 0x1DC8
	Size: 0x2C
	Parameters: 2
	Flags: Linked
*/
function push_front(&array, val)
{
	push(array, val, 0);
}

/*
	Name: replace
	Namespace: array
	Checksum: 0xB070A75B
	Offset: 0x1E00
	Size: 0xA0
	Parameters: 3
	Flags: Linked
*/
function replace(array, value, replacement)
{
	foreach(val in array)
	{
		if(val === value)
		{
			array[i] = replacement;
		}
	}
	return array;
}

/*
	Name: function_80fe1cb6
	Namespace: array
	Checksum: 0xBCBD330D
	Offset: 0x1EA8
	Size: 0x1A
	Parameters: 2
	Flags: Linked, Private
*/
function private function_80fe1cb6(a, b)
{
	return a === b;
}

/*
	Name: find
	Namespace: array
	Checksum: 0xDA4C271E
	Offset: 0x1ED0
	Size: 0x72
	Parameters: 3
	Flags: Linked
*/
function find(&array, ent, func_compare)
{
	if(!isdefined(func_compare))
	{
		func_compare = &function_80fe1cb6;
	}
	for(i = 0; i < array.size; i++)
	{
		if([[func_compare]](array[i], ent))
		{
			return i;
		}
	}
}

/*
	Name: closerfunc
	Namespace: array
	Checksum: 0xB641B0CD
	Offset: 0x1F50
	Size: 0x1A
	Parameters: 2
	Flags: None
*/
function closerfunc(dist1, dist2)
{
	return dist1 >= dist2;
}

/*
	Name: fartherfunc
	Namespace: array
	Checksum: 0xFBF1CEDB
	Offset: 0x1F78
	Size: 0x1A
	Parameters: 2
	Flags: None
*/
function fartherfunc(dist1, dist2)
{
	return dist1 <= dist2;
}

/*
	Name: get_all_farthest
	Namespace: array
	Checksum: 0x5EAA70F0
	Offset: 0x1FA0
	Size: 0xAA
	Parameters: 5
	Flags: Linked
*/
function get_all_farthest(org, &array, a_exclude, n_max, n_maxdist)
{
	if(!isdefined(n_max))
	{
		n_max = array.size;
	}
	a_ret = exclude(array, a_exclude);
	if(isdefined(n_maxdist))
	{
		a_ret = arraysort(a_ret, org, 0, n_max, n_maxdist);
	}
	else
	{
		a_ret = arraysort(a_ret, org, 0, n_max);
	}
	return a_ret;
}

/*
	Name: get_all_closest
	Namespace: array
	Checksum: 0x3A8CCDAD
	Offset: 0x2058
	Size: 0xAA
	Parameters: 5
	Flags: Linked
*/
function get_all_closest(org, &array, a_exclude, n_max, n_maxdist)
{
	if(!isdefined(n_max))
	{
		n_max = array.size;
	}
	a_ret = exclude(array, a_exclude);
	if(isdefined(n_maxdist))
	{
		a_ret = arraysort(a_ret, org, 1, n_max, n_maxdist);
	}
	else
	{
		a_ret = arraysort(a_ret, org, 1, n_max);
	}
	return a_ret;
}

/*
	Name: alphabetize
	Namespace: array
	Checksum: 0x1DE63ACA
	Offset: 0x2110
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function alphabetize(&array)
{
	return sort_by_value(array, 1);
}

/*
	Name: sort_by_value
	Namespace: array
	Checksum: 0xC904D0CE
	Offset: 0x2140
	Size: 0x42
	Parameters: 2
	Flags: Linked
*/
function sort_by_value(&array, b_lowest_first)
{
	if(!isdefined(b_lowest_first))
	{
		b_lowest_first = 0;
	}
	return merge_sort(array, &_compare_value, b_lowest_first);
}

/*
	Name: sort_by_script_int
	Namespace: array
	Checksum: 0x74B46E28
	Offset: 0x2190
	Size: 0x42
	Parameters: 2
	Flags: Linked
*/
function sort_by_script_int(&a_ents, b_lowest_first)
{
	if(!isdefined(b_lowest_first))
	{
		b_lowest_first = 0;
	}
	return merge_sort(a_ents, &_compare_script_int, b_lowest_first);
}

/*
	Name: merge_sort
	Namespace: array
	Checksum: 0x60A17817
	Offset: 0x21E0
	Size: 0x1A2
	Parameters: 3
	Flags: Linked
*/
function merge_sort(&current_list, func_sort, param)
{
	if(current_list.size <= 1)
	{
		return current_list;
	}
	left = [];
	right = [];
	middle = current_list.size / 2;
	for(x = 0; x < middle; x++)
	{
		if(!isdefined(left))
		{
			left = [];
		}
		else if(!isarray(left))
		{
			left = array(left);
		}
		left[left.size] = current_list[x];
	}
	while(x < current_list.size)
	{
		if(!isdefined(right))
		{
			right = [];
		}
		else if(!isarray(right))
		{
			right = array(right);
		}
		right[right.size] = current_list[x];
		x++;
	}
	left = merge_sort(left, func_sort, param);
	right = merge_sort(right, func_sort, param);
	result = merge(left, right, func_sort, param);
	return result;
}

/*
	Name: merge
	Namespace: array
	Checksum: 0x7CAAFB0A
	Offset: 0x2390
	Size: 0x140
	Parameters: 4
	Flags: Linked
*/
function merge(left, right, func_sort, param)
{
	result = [];
	li = 0;
	ri = 0;
	while(li < left.size && ri < right.size)
	{
		b_result = undefined;
		if(isdefined(param))
		{
			b_result = [[func_sort]](left[li], right[ri], param);
		}
		else
		{
			b_result = [[func_sort]](left[li], right[ri]);
		}
		if(b_result)
		{
			result[result.size] = left[li];
			li++;
		}
		else
		{
			result[result.size] = right[ri];
			ri++;
		}
	}
	while(li < left.size)
	{
		result[result.size] = left[li];
		li++;
	}
	while(ri < right.size)
	{
		result[result.size] = right[ri];
		ri++;
	}
	return result;
}

/*
	Name: function_b63fcb3
	Namespace: array
	Checksum: 0xCABFE42F
	Offset: 0x24D8
	Size: 0x160
	Parameters: 2
	Flags: Linked
*/
function function_b63fcb3(&array, sort_func)
{
	start = 0;
	end = array.size;
	var_f9038db1 = 1;
	while(var_f9038db1 && start < end)
	{
		var_f9038db1 = 0;
		i = start;
		for(j = start + 1; j < end; j++)
		{
			if([[sort_func]](array[j], array[i]))
			{
				swap(array, j, i);
				var_f9038db1 = 1;
			}
			i++;
		}
		end--;
		if(var_f9038db1 && start < end)
		{
			var_f9038db1 = 0;
			i = end - 2;
			j = i + 1;
			while(i >= start)
			{
				if([[sort_func]](array[j], array[i]))
				{
					swap(array, j, i);
					var_f9038db1 = 1;
				}
				i--;
				j--;
			}
			start++;
		}
	}
}

/*
	Name: spread_all
	Namespace: array
	Checksum: 0xFAAC9A4E
	Offset: 0x2640
	Size: 0x18C
	Parameters: 7
	Flags: None
*/
function spread_all(&entities, func, arg1, arg2, arg3, arg4, arg5)
{
	/#
		assert(isdefined(entities), "");
	#/
	/#
		assert(isdefined(func), "");
	#/
	if(isarray(entities))
	{
		foreach(ent in entities)
		{
			if(isdefined(ent))
			{
				util::single_thread(ent, func, arg1, arg2, arg3, arg4, arg5);
			}
			wait(randomfloatrange(0.06666666, 0.1333333));
		}
	}
	else
	{
		util::single_thread(entities, func, arg1, arg2, arg3, arg4, arg5);
		wait(randomfloatrange(0.06666666, 0.1333333));
	}
}

/*
	Name: wait_till_touching
	Namespace: array
	Checksum: 0xBFE6C7B2
	Offset: 0x27D8
	Size: 0x38
	Parameters: 2
	Flags: None
*/
function wait_till_touching(&a_ents, e_volume)
{
	while(!is_touching(a_ents, e_volume))
	{
		waitframe(1);
	}
}

/*
	Name: is_touching
	Namespace: array
	Checksum: 0xA4F991D3
	Offset: 0x2818
	Size: 0xA2
	Parameters: 2
	Flags: Linked
*/
function is_touching(&a_ents, e_volume)
{
	foreach(e_ent in a_ents)
	{
		if(!e_ent istouching(e_volume))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: contains
	Namespace: array
	Checksum: 0x76299EB3
	Offset: 0x28C8
	Size: 0xB4
	Parameters: 2
	Flags: Linked
*/
function contains(array_or_val, value)
{
	if(isarray(array_or_val))
	{
		foreach(element in array_or_val)
		{
			if(element === value)
			{
				return 1;
			}
		}
		return 0;
	}
	return array_or_val === value;
}

/*
	Name: function_460f3c24
	Namespace: array
	Checksum: 0x25AABF28
	Offset: 0x2988
	Size: 0xE6
	Parameters: 2
	Flags: Linked
*/
function function_460f3c24(array1, array2)
{
	if(!isarray(array1) || !isarray(array2))
	{
		return false;
	}
	if(array1.size != array2.size)
	{
		return false;
	}
	foreach(v in array1)
	{
		if(v !== array2[key])
		{
			return false;
		}
	}
	return true;
}

/*
	Name: quick_sort
	Namespace: array
	Checksum: 0xE0C487D0
	Offset: 0x2A78
	Size: 0x60
	Parameters: 2
	Flags: None
*/
function quick_sort(&array, compare_func)
{
	sorted_array = arraycopy(array);
	quick_sort_mid(sorted_array, 0, sorted_array.size - 1, compare_func);
	return sorted_array;
}

/*
	Name: quick_sort_mid
	Namespace: array
	Checksum: 0x91FAA988
	Offset: 0x2AE0
	Size: 0x124
	Parameters: 4
	Flags: Linked
*/
function quick_sort_mid(&array, start, end, compare_func)
{
	if((end - start) >= 1)
	{
		if(!isdefined(compare_func))
		{
			compare_func = &_compare_value;
		}
		pivot = array[end];
		i = start;
		for(k = start; k < end; k++)
		{
			if([[compare_func]](array[k], pivot))
			{
				swap(array, i, k);
				i++;
			}
		}
		if(i != end)
		{
			swap(array, i, end);
		}
		quick_sort_mid(array, start, i - 1, compare_func);
		quick_sort_mid(array, i + 1, end, compare_func);
	}
}

/*
	Name: _compare_value
	Namespace: array
	Checksum: 0x9935426F
	Offset: 0x2C10
	Size: 0x46
	Parameters: 3
	Flags: Linked
*/
function _compare_value(val1, val2, b_lowest_first)
{
	if(!isdefined(b_lowest_first))
	{
		b_lowest_first = 1;
	}
	if(b_lowest_first)
	{
		return val1 <= val2;
	}
	return val1 > val2;
}

/*
	Name: function_5b554cb6
	Namespace: array
	Checksum: 0xBA713163
	Offset: 0x2C60
	Size: 0x1A
	Parameters: 2
	Flags: None
*/
function function_5b554cb6(val1, val2)
{
	return val1 > val2;
}

/*
	Name: _compare_script_int
	Namespace: array
	Checksum: 0xF0A36508
	Offset: 0x2C88
	Size: 0x60
	Parameters: 3
	Flags: Linked
*/
function _compare_script_int(e1, e2, b_lowest_first)
{
	if(!isdefined(b_lowest_first))
	{
		b_lowest_first = 1;
	}
	if(b_lowest_first)
	{
		return e1.script_int <= e2.script_int;
	}
	return e1.script_int > e2.script_int;
}

/*
	Name: _filter_undefined
	Namespace: array
	Checksum: 0x9045DAC7
	Offset: 0x2CF8
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function _filter_undefined(val)
{
	return isdefined(val);
}

/*
	Name: _filter_dead
	Namespace: array
	Checksum: 0x696A2329
	Offset: 0x2D10
	Size: 0x22
	Parameters: 1
	Flags: None
*/
function _filter_dead(val)
{
	return isalive(val);
}

/*
	Name: _filter_classname
	Namespace: array
	Checksum: 0xACDEBD76
	Offset: 0x2D40
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function _filter_classname(val, arg)
{
	return isdefined(val.classname) && issubstr(val.classname, arg);
}

/*
	Name: function_e01a747e
	Namespace: array
	Checksum: 0x50594871
	Offset: 0x2D90
	Size: 0x46
	Parameters: 2
	Flags: Linked
*/
function function_e01a747e(val, arg)
{
	return !(isdefined(val.classname) && issubstr(val.classname, arg));
}

/*
	Name: function_f2d037b1
	Namespace: array
	Checksum: 0xE791494E
	Offset: 0x2DE0
	Size: 0xC2
	Parameters: 0
	Flags: None
*/
function function_f2d037b1()
{
	/#
		wait(5);
		for(maxval = 0; maxval < 100; maxval++)
		{
			for(i = 0; i < 100; i++)
			{
				minval = function_21a3a673(0, maxval);
				function_d1f43a84(undefined, minval, maxval);
				function_d1f43a84(undefined, minval, maxval, &function_5b554cb6, 0);
				waitframe(1);
			}
		}
	#/
}

/*
	Name: function_d1f43a84
	Namespace: array
	Checksum: 0x9BADF286
	Offset: 0x2EB0
	Size: 0x274
	Parameters: 5
	Flags: None
*/
function function_d1f43a84(max_entries, minval, maxval, compare_func, var_c8e96eee)
{
	/#
		if(!isdefined(max_entries))
		{
			max_entries = 20;
		}
		if(!isdefined(minval))
		{
			minval = 0;
		}
		if(!isdefined(maxval))
		{
			maxval = 100;
		}
		if(!isdefined(compare_func))
		{
			compare_func = undefined;
		}
		if(!isdefined(var_c8e96eee))
		{
			var_c8e96eee = 1;
		}
		var_365f3054 = randomintrange(0, max_entries);
		println(((((("" + var_365f3054) + "") + minval) + "") + maxval) + "");
		source_array = [];
		for(i = 0; i < var_365f3054; i++)
		{
			if(!isdefined(source_array))
			{
				source_array = [];
			}
			else if(!isarray(source_array))
			{
				source_array = array(source_array);
			}
			source_array[source_array.size] = function_21a3a673(minval, maxval);
		}
		test_array = arraycopy(source_array);
		sorted_array = quick_sort(test_array, compare_func);
		if(var_c8e96eee)
		{
			for(i = 0; i < var_365f3054 - 1; i++)
			{
				/#
					assert(sorted_array[i] <= (sorted_array[i + 1]), "");
				#/
			}
		}
		else
		{
			for(i = 0; i < var_365f3054 - 1; i++)
			{
				/#
					assert(sorted_array[i] >= (sorted_array[i + 1]), "");
				#/
			}
		}
		println("");
	#/
}

/*
	Name: function_81d0d595
	Namespace: array
	Checksum: 0x104A52D4
	Offset: 0x3130
	Size: 0xCA
	Parameters: 0
	Flags: None
*/
function function_81d0d595()
{
	/#
		wait(5);
		for(maxval = 0; maxval < 100; maxval++)
		{
			for(i = 0; i < 100; i++)
			{
				minval = function_21a3a673(0, maxval);
				function_70daaa9d(undefined, minval, maxval, &_compare_value);
				function_70daaa9d(undefined, minval, maxval, &function_5b554cb6, 0);
				waitframe(1);
			}
		}
	#/
}

/*
	Name: function_70daaa9d
	Namespace: array
	Checksum: 0x9DD92D24
	Offset: 0x3208
	Size: 0x26C
	Parameters: 5
	Flags: None
*/
function function_70daaa9d(max_entries, minval, maxval, compare_func, var_c8e96eee)
{
	/#
		if(!isdefined(max_entries))
		{
			max_entries = 50;
		}
		if(!isdefined(minval))
		{
			minval = 0;
		}
		if(!isdefined(maxval))
		{
			maxval = 100;
		}
		if(!isdefined(compare_func))
		{
			compare_func = undefined;
		}
		if(!isdefined(var_c8e96eee))
		{
			var_c8e96eee = 1;
		}
		var_365f3054 = randomintrange(0, max_entries);
		println(((((("" + var_365f3054) + "") + minval) + "") + maxval) + "");
		source_array = [];
		for(i = 0; i < var_365f3054; i++)
		{
			if(!isdefined(source_array))
			{
				source_array = [];
			}
			else if(!isarray(source_array))
			{
				source_array = array(source_array);
			}
			source_array[source_array.size] = function_21a3a673(minval, maxval);
		}
		sorted_array = arraycopy(source_array);
		function_b63fcb3(sorted_array, compare_func);
		if(var_c8e96eee)
		{
			for(i = 0; i < var_365f3054 - 1; i++)
			{
				/#
					assert(sorted_array[i] <= (sorted_array[i + 1]), "");
				#/
			}
		}
		else
		{
			for(i = 0; i < var_365f3054 - 1; i++)
			{
				/#
					assert(sorted_array[i] >= (sorted_array[i + 1]), "");
				#/
			}
		}
		println("");
	#/
}

