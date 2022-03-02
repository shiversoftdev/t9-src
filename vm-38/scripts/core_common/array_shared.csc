#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\util_shared.csc;

#namespace array_shared;

/*
	Name: function_a4910fe0
	Namespace: array_shared
	Checksum: 0x92EA24BF
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a4910fe0()
{
	level notify(1876487236);
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
	Flags: None
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
	Flags: None
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
	Checksum: 0x2E266713
	Offset: 0x6C0
	Size: 0x108
	Parameters: 2
	Flags: None
*/
function delete_all(&array, is_struct)
{
	foreach(ent in array)
	{
		if(isdefined(ent))
		{
			if(is_true(is_struct))
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
	Checksum: 0xC28B5EB6
	Offset: 0x7D0
	Size: 0x8A
	Parameters: 2
	Flags: None
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
	Checksum: 0x246DFD20
	Offset: 0x868
	Size: 0x164
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
			if(!isdefined(ent))
			{
				continue;
			}
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
	Checksum: 0xC53057BA
	Offset: 0x9D8
	Size: 0x14C
	Parameters: 7
	Flags: None
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
	Checksum: 0xA3B72B38
	Offset: 0xB30
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
	Checksum: 0xC7A640F8
	Offset: 0xC98
	Size: 0xE0
	Parameters: 2
	Flags: None
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
	Checksum: 0xCB5AB40A
	Offset: 0xD80
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
	Checksum: 0x7BD41219
	Offset: 0xDF0
	Size: 0x118
	Parameters: 5
	Flags: None
*/
function add_sorted(&array, item, allow_dupes, var_13d5adf2, var_e19f0739)
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
				if(i == array.size || (isdefined(var_13d5adf2) && ([[var_13d5adf2]](item, array[i]) || var_e19f0739)) || (!isdefined(var_13d5adf2) && (item <= array[i] || var_e19f0739)))
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
	Checksum: 0x397874CE
	Offset: 0xF10
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
	Checksum: 0x16837B
	Offset: 0x1070
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
	Checksum: 0x7C8F1CBF
	Offset: 0x1200
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
	Checksum: 0x43BBD083
	Offset: 0x1260
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
	Checksum: 0xF661F85
	Offset: 0x12A0
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
	Checksum: 0x9AF1E486
	Offset: 0x12E8
	Size: 0x70
	Parameters: 2
	Flags: Linked
*/
function flag_wait(&array, str_flag)
{
	for(i = 0; i < array.size; i++)
	{
		ent = array[i];
		if(!ent flag::get(str_flag))
		{
			ent waittill(str_flag);
			i = -1;
		}
	}
}

/*
	Name: function_d77ef691
	Namespace: array
	Checksum: 0x6F935F8F
	Offset: 0x1360
	Size: 0x108
	Parameters: 2
	Flags: Linked, Variadic
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
	Checksum: 0x565AC355
	Offset: 0x1470
	Size: 0xC8
	Parameters: 3
	Flags: None
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
	Checksum: 0x13B17A76
	Offset: 0x1540
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
	Checksum: 0xACF0BC30
	Offset: 0x16A0
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
	Checksum: 0x3AB54725
	Offset: 0x1720
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
	Checksum: 0x58E3FACA
	Offset: 0x1800
	Size: 0x4A
	Parameters: 1
	Flags: Linked
*/
function random(array)
{
	keys = getarraykeys(array);
	return array[keys[randomint(keys.size)]];
}

/*
	Name: randomize
	Namespace: array
	Checksum: 0x1CA1155F
	Offset: 0x1858
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
	Checksum: 0xE8F91BC4
	Offset: 0x18E0
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
	Checksum: 0x52A3E9DE
	Offset: 0x1968
	Size: 0x5C
	Parameters: 1
	Flags: None
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
	Checksum: 0x5E5F5FFE
	Offset: 0x19D0
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
	Checksum: 0x382E318F
	Offset: 0x1AA0
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
	Checksum: 0xE5465627
	Offset: 0x1B48
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
	Checksum: 0xA2372A30
	Offset: 0x1BE8
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
	Checksum: 0x1C804EEC
	Offset: 0x1C88
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
	Name: push
	Namespace: array
	Checksum: 0x26244928
	Offset: 0x1CF0
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
	Checksum: 0x71DC9F8C
	Offset: 0x1D48
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
	Checksum: 0x4A5B9FB0
	Offset: 0x1D80
	Size: 0xA0
	Parameters: 3
	Flags: None
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
	Checksum: 0xE35E344F
	Offset: 0x1E28
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
	Checksum: 0x87C5DBAC
	Offset: 0x1E50
	Size: 0x72
	Parameters: 3
	Flags: Linked
*/
function find(&array, ent, var_13d5adf2)
{
	if(!isdefined(var_13d5adf2))
	{
		var_13d5adf2 = &function_80fe1cb6;
	}
	for(i = 0; i < array.size; i++)
	{
		if([[var_13d5adf2]](array[i], ent))
		{
			return i;
		}
	}
}

/*
	Name: closerfunc
	Namespace: array
	Checksum: 0xAB0445F7
	Offset: 0x1ED0
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
	Checksum: 0xA7C27DC2
	Offset: 0x1EF8
	Size: 0x1A
	Parameters: 2
	Flags: None
*/
function fartherfunc(dist1, dist2)
{
	return dist1 <= dist2;
}

/*
	Name: get_all_closest
	Namespace: array
	Checksum: 0x4DEDEFE1
	Offset: 0x1F20
	Size: 0x28C
	Parameters: 5
	Flags: None
*/
function get_all_closest(org, &array, excluders, max, maxdist)
{
	if(!isdefined(max))
	{
		max = array.size;
	}
	if(!isdefined(excluders))
	{
		excluders = [];
	}
	maxdists2rd = undefined;
	if(isdefined(maxdist))
	{
		maxdists2rd = maxdist * maxdist;
	}
	dist = [];
	index = [];
	for(i = 0; i < array.size; i++)
	{
		if(!isdefined(array[i]))
		{
			continue;
		}
		excluded = 0;
		for(p = 0; p < excluders.size; p++)
		{
			if(array[i] != excluders[p])
			{
				continue;
			}
			excluded = 1;
			break;
		}
		if(excluded)
		{
			continue;
		}
		length = distancesquared(org, array[i].origin);
		if(isdefined(maxdists2rd) && maxdists2rd < length)
		{
			continue;
		}
		dist[dist.size] = length;
		index[index.size] = i;
	}
	for(;;)
	{
		change = 0;
		for(i = 0; i < dist.size - 1; i++)
		{
			if(dist[i] <= (dist[i + 1]))
			{
				continue;
			}
			change = 1;
			temp = dist[i];
			dist[i] = dist[i + 1];
			dist[i + 1] = temp;
			temp = index[i];
			index[i] = index[i + 1];
			index[i + 1] = temp;
		}
		if(!change)
		{
			break;
		}
	}
	newarray = [];
	if(max > dist.size)
	{
		max = dist.size;
	}
	for(i = 0; i < max; i++)
	{
		newarray[i] = array[index[i]];
	}
	return newarray;
}

/*
	Name: alphabetize
	Namespace: array
	Checksum: 0xB8A828A6
	Offset: 0x21B8
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
	Checksum: 0x394C2B16
	Offset: 0x21E8
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
	Checksum: 0x3A80CA9F
	Offset: 0x2238
	Size: 0x42
	Parameters: 2
	Flags: None
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
	Checksum: 0x4008D78
	Offset: 0x2288
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
	Checksum: 0x33160858
	Offset: 0x2438
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
	Checksum: 0x7A8E946C
	Offset: 0x2580
	Size: 0x160
	Parameters: 2
	Flags: None
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
	Checksum: 0x1B07F5A1
	Offset: 0x26E8
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
	Checksum: 0x84FB5C35
	Offset: 0x2880
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
	Checksum: 0x7B37B433
	Offset: 0x28C0
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
	Checksum: 0xDE46E38
	Offset: 0x2970
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
	Name: quick_sort
	Namespace: array
	Checksum: 0x3C1BE394
	Offset: 0x2A30
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
	Checksum: 0x1DC69654
	Offset: 0x2A98
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
	Checksum: 0xEF2C8AA8
	Offset: 0x2BC8
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
	Checksum: 0x68FDE32B
	Offset: 0x2C18
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
	Checksum: 0x80303C8C
	Offset: 0x2C40
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
	Checksum: 0xE19892D6
	Offset: 0x2CB0
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
	Checksum: 0xC5C6872E
	Offset: 0x2CC8
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
	Checksum: 0x57872E5E
	Offset: 0x2CF8
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
	Checksum: 0xA91D5D6A
	Offset: 0x2D48
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
	Checksum: 0x3FE40B83
	Offset: 0x2D98
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
	Checksum: 0xB3A79DD6
	Offset: 0x2E68
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
	Checksum: 0x4144F519
	Offset: 0x30E8
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
	Checksum: 0x3F60DC62
	Offset: 0x31C0
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

