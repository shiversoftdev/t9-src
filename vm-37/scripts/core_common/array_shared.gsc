#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace array;

/*
	Name: filter
	Namespace: array
	Checksum: 0xBE73A3CE
	Offset: 0x90
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
	Checksum: 0x6A6E276E
	Offset: 0x228
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
	Checksum: 0x3AC3A727
	Offset: 0x270
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
	Checksum: 0x446CD6CC
	Offset: 0x2B8
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
	Checksum: 0xAD96CDDA
	Offset: 0x3C0
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
	Checksum: 0xB2BF90FA
	Offset: 0x4A8
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
	Checksum: 0xA655051F
	Offset: 0x6A0
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
	Checksum: 0x2BFB96AA
	Offset: 0x7A8
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
	Checksum: 0x63517001
	Offset: 0x840
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
	Checksum: 0xA567839D
	Offset: 0x9A8
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
	Checksum: 0x5BF8CBA8
	Offset: 0xB00
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
	Checksum: 0x43B28CD8
	Offset: 0xC68
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
	Checksum: 0xFA88B0EF
	Offset: 0xD50
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
	Checksum: 0xB0BE4F70
	Offset: 0xDC0
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
	Checksum: 0x1EFE629B
	Offset: 0xEE0
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
	Checksum: 0x88FB727A
	Offset: 0x1040
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
	Checksum: 0xA490DE0
	Offset: 0x11D0
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
	Checksum: 0xE4DCC919
	Offset: 0x1230
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
	Checksum: 0xD1EB9CBC
	Offset: 0x1270
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
	Checksum: 0xF52BE79
	Offset: 0x12B8
	Size: 0x8C
	Parameters: 2
	Flags: None
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
	Checksum: 0x693E9BC7
	Offset: 0x1350
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
	Checksum: 0xF1929042
	Offset: 0x1460
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
	Checksum: 0xCA96498C
	Offset: 0x1530
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
	Checksum: 0x1A935B79
	Offset: 0x1690
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
	Checksum: 0xB15FDFE8
	Offset: 0x1710
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
	Checksum: 0x329D9C70
	Offset: 0x17F0
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
	Checksum: 0xA5FB2F15
	Offset: 0x1850
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
	Checksum: 0xAB2C6D27
	Offset: 0x18D8
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
	Checksum: 0xFDC2D110
	Offset: 0x1960
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
	Checksum: 0x89A06F15
	Offset: 0x19C8
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
	Checksum: 0x51085705
	Offset: 0x1A98
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
	Checksum: 0xD9FFE277
	Offset: 0x1B40
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
	Checksum: 0xEBA63FE7
	Offset: 0x1BE0
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
	Checksum: 0x69A26EDB
	Offset: 0x1C80
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
	Checksum: 0x530A5C92
	Offset: 0x1CE8
	Size: 0x5A
	Parameters: 2
	Flags: None
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
	Checksum: 0x1C8C0FD4
	Offset: 0x1D50
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
	Checksum: 0xC372F3FE
	Offset: 0x1DA8
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
	Checksum: 0x53AB8E1F
	Offset: 0x1DE0
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
	Checksum: 0x58198232
	Offset: 0x1E88
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
	Checksum: 0x4FFB4732
	Offset: 0x1EB0
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
	Checksum: 0x36D5432C
	Offset: 0x1F30
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
	Checksum: 0x2C2D99B7
	Offset: 0x1F58
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
	Checksum: 0xFD610259
	Offset: 0x1F80
	Size: 0xAA
	Parameters: 5
	Flags: None
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
	Checksum: 0x77F0BED8
	Offset: 0x2038
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
	Checksum: 0x87653DF0
	Offset: 0x20F0
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
	Checksum: 0x14E46280
	Offset: 0x2120
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
	Checksum: 0xE4883BE5
	Offset: 0x2170
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
	Checksum: 0xFD517625
	Offset: 0x21C0
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
	Checksum: 0x20CA27E8
	Offset: 0x2370
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
	Checksum: 0xECB5A77E
	Offset: 0x24B8
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
	Checksum: 0x16C120C4
	Offset: 0x2620
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
	Checksum: 0xC50B1C71
	Offset: 0x27B8
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
	Checksum: 0xA33018C0
	Offset: 0x27F8
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
	Checksum: 0xE45EADB1
	Offset: 0x28A8
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
	Checksum: 0x22D82782
	Offset: 0x2968
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
	Checksum: 0xDB929931
	Offset: 0x2A58
	Size: 0x60
	Parameters: 2
	Flags: Linked
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
	Checksum: 0x55762208
	Offset: 0x2AC0
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
	Checksum: 0xAFF3EF4
	Offset: 0x2BF0
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
	Checksum: 0xD3752C2D
	Offset: 0x2C40
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
	Checksum: 0x58C839CE
	Offset: 0x2C68
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
	Checksum: 0xE0884EE
	Offset: 0x2CD8
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
	Checksum: 0xFC069ACF
	Offset: 0x2CF0
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
	Checksum: 0x6B856637
	Offset: 0x2D20
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
	Checksum: 0x600CCCCD
	Offset: 0x2D70
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
	Checksum: 0xD6746D0A
	Offset: 0x2DC0
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
	Checksum: 0x91528632
	Offset: 0x2E90
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
	Checksum: 0x38183A63
	Offset: 0x3110
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
	Checksum: 0xFEC62127
	Offset: 0x31E8
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

