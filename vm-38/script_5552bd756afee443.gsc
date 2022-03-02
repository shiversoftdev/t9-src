#using script_3dc93ca9902a9cda;
#using script_85cd2e9a28ea8a1;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_830c8cc;

/*
	Name: function_ebaae292
	Namespace: namespace_830c8cc
	Checksum: 0xDB25B550
	Offset: 0x430
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ebaae292()
{
	level notify(66289044);
}

#namespace snd;

/*
	Name: isnumber
	Namespace: snd
	Checksum: 0xB581E2AD
	Offset: 0x450
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function isnumber(num)
{
	var_e6fa5c22 = isfloat(num) || isint(num);
	return var_e6fa5c22;
}

/*
	Name: function_a18ae88f
	Namespace: snd
	Checksum: 0xDF311B44
	Offset: 0x4A8
	Size: 0x62
	Parameters: 2
	Flags: None
*/
function function_a18ae88f(x, y)
{
	quotient = floor(x / y);
	remainder = float(x - (quotient * y));
	return remainder;
}

/*
	Name: function_efda2d6d
	Namespace: snd
	Checksum: 0xC595595F
	Offset: 0x518
	Size: 0xF8
	Parameters: 0
	Flags: Linked
*/
function function_efda2d6d()
{
	player = self;
	/#
		assert(function_e3a36342(self));
	#/
	vieworigin = undefined;
	if(isscriptfunctionptr(level.var_17e6189d._callbacks[#"player_view"]))
	{
		vieworigin = player [[level.var_17e6189d._callbacks[#"player_view"]]]();
	}
	else
	{
		vieworigin = player geteye();
	}
	/#
		assert(isvec(vieworigin));
	#/
	return vieworigin;
}

/*
	Name: function_3d31768f
	Namespace: snd
	Checksum: 0x1F26BCB7
	Offset: 0x618
	Size: 0xF8
	Parameters: 0
	Flags: Linked
*/
function function_3d31768f()
{
	player = self;
	/#
		assert(function_e3a36342(self));
	#/
	viewangles = undefined;
	if(isscriptfunctionptr(level.var_17e6189d._callbacks[#"player_angles"]))
	{
		viewangles = player [[level.var_17e6189d._callbacks[#"player_angles"]]]();
	}
	else
	{
		viewangles = player getplayerangles();
	}
	/#
		assert(isvec(viewangles));
	#/
	return viewangles;
}

/*
	Name: function_731299e5
	Namespace: snd
	Checksum: 0x60FAD77
	Offset: 0x718
	Size: 0x130
	Parameters: 0
	Flags: None
*/
function function_731299e5()
{
	player = self;
	/#
		assert(function_e3a36342(self));
	#/
	fov = undefined;
	if(isscriptfunctionptr(level.var_17e6189d._callbacks[#"player_fov"]))
	{
		fov = player [[level.var_17e6189d._callbacks[#"player_fov"]]]();
	}
	else
	{
		fov = getdvarfloat(#"cg_fov", 65);
	}
	/#
		assert(isfloat(fov));
	#/
	/#
		assert(fov <= 180);
	#/
	return fov;
}

/*
	Name: function_ea2f17d1
	Namespace: snd
	Checksum: 0x259B7D44
	Offset: 0x850
	Size: 0x50
	Parameters: 2
	Flags: Linked
*/
function function_ea2f17d1(variable, value)
{
	if(isdefined(variable) == 1)
	{
		return variable;
	}
	/#
		/#
			assert(isdefined(value) == 1);
		#/
	#/
	return value;
}

/*
	Name: function_154caeff
	Namespace: snd
	Checksum: 0xF94FBD8C
	Offset: 0x8A8
	Size: 0x17A
	Parameters: 1
	Flags: None
*/
function function_154caeff(v)
{
	if(isvec(v) == 1)
	{
		avg = 0;
		avg = avg + v[0];
		avg = avg + v[1];
		avg = avg + v[2];
		avg = avg / 3;
		return avg;
	}
	/#
		assert(isarray(v) == 1, "");
	#/
	avg = (0, 0, 0);
	if(v.size == 0)
	{
		return avg;
	}
	if(v.size == 1)
	{
		return v[0];
	}
	foreach(vec in v)
	{
		avg = avg + vec;
	}
	avg = avg / v.size;
	return avg;
}

/*
	Name: function_70dbede3
	Namespace: snd
	Checksum: 0xA5402AB1
	Offset: 0xA30
	Size: 0x70
	Parameters: 1
	Flags: None
*/
function function_70dbede3(angle)
{
	if(angle >= -180 && angle <= 180)
	{
		return angle;
	}
	while(angle < -180)
	{
		angle = angle + 360;
	}
	while(angle > 180)
	{
		angle = angle - 360;
	}
	return angle;
}

/*
	Name: getplayername
	Namespace: snd
	Checksum: 0x417D6FC9
	Offset: 0xAA8
	Size: 0x5A
	Parameters: 1
	Flags: Linked
*/
function getplayername(player)
{
	if(isdefined(player) == 1)
	{
		if(isdefined(player.name) == 1)
		{
			return player.name;
		}
		if(isdefined(player.playername) == 1)
		{
			return player.playername;
		}
	}
	return undefined;
}

/*
	Name: function_f4127447
	Namespace: snd
	Checksum: 0xF83168DD
	Offset: 0xB10
	Size: 0x102
	Parameters: 1
	Flags: Linked
*/
function function_f4127447(value)
{
	if(isarray(value) == 1)
	{
		if(value.size >= 2)
		{
			min = value[0];
			max = value[1];
			if(min > max)
			{
				temp = max;
				max = min;
				min = temp;
			}
			/#
				assert(max >= min);
			#/
			randomrange = randomfloatrange(min, max);
			return randomrange;
		}
		if(value.size == 1)
		{
			value = value[0];
		}
	}
	return float(value);
}

/*
	Name: function_83328b67
	Namespace: snd
	Checksum: 0x1A1FE386
	Offset: 0xC20
	Size: 0xA6
	Parameters: 3
	Flags: Linked
*/
function function_83328b67(var_f664a28b, var_20761299, var_94aa750c)
{
	if(isdefined(var_f664a28b) && isdefined(var_20761299))
	{
		if(var_f664a28b == var_20761299)
		{
			return var_f664a28b;
		}
		value = randomfloatrange(var_f664a28b, var_20761299);
		return value;
	}
	if(isdefined(var_f664a28b) == 1 && isdefined(var_20761299) == 0)
	{
		return var_f664a28b;
	}
	if(isdefined(var_94aa750c))
	{
		return var_94aa750c;
	}
	return undefined;
}

/*
	Name: function_84fc754d
	Namespace: snd
	Checksum: 0x1FFF8AB1
	Offset: 0xCD0
	Size: 0x16A
	Parameters: 2
	Flags: Linked
*/
function function_84fc754d(range, var_5d61faa6)
{
	randomrange = undefined;
	if(isarray(range) == 1)
	{
		if(range.size == 0)
		{
			return undefined;
		}
		if(range.size == 1)
		{
			return float(range[0]);
		}
		rangemin = range[0];
		rangemax = range[1];
		randomrange = function_83328b67(rangemin, rangemax);
		return float(randomrange);
	}
	if(isarray(range) == 0 && isdefined(var_5d61faa6) == 1)
	{
		randomrange = function_83328b67(var_5d61faa6, range);
	}
	else
	{
		randomrange = range;
	}
	/#
		assert(isdefined(randomrange) == 1, "");
	#/
	return float(randomrange);
}

/*
	Name: function_31bcd153
	Namespace: snd
	Checksum: 0xCD242FE
	Offset: 0xE48
	Size: 0x3E
	Parameters: 1
	Flags: Linked
*/
function function_31bcd153(arr)
{
	if(arr.size == 0)
	{
		return undefined;
	}
	if(arr.size == 1)
	{
		return arr[0];
	}
	return arr;
}

/*
	Name: function_f218bff5
	Namespace: snd
	Checksum: 0x700EF11E
	Offset: 0xE90
	Size: 0xC8
	Parameters: 1
	Flags: Linked
*/
function function_f218bff5(v)
{
	if(!isdefined(v))
	{
		return array();
	}
	if(isdefined(v) == 1 && function_3132f113(v) == 0 && isarray(v) == 1)
	{
	}
	else
	{
		return array(v);
	}
	/#
		/#
			assert(isarray(v) == 1);
		#/
	#/
	return v;
}

/*
	Name: function_4b879845
	Namespace: snd
	Checksum: 0xF9B661D3
	Offset: 0xF60
	Size: 0xF6
	Parameters: 2
	Flags: None
*/
function function_4b879845(var_7620540d, v)
{
	var_8c6d09f4 = isarray(var_7620540d);
	var_198b5115 = isdefined(v);
	if(function_81fac19d(!var_198b5115, "snd VarrayAdd undefined entity"))
	{
		return var_7620540d;
	}
	if(!var_8c6d09f4)
	{
		if(isdefined(var_7620540d))
		{
			var_7620540d = array(var_7620540d, v);
		}
		else
		{
			var_7620540d = array(v);
		}
	}
	else if(var_8c6d09f4)
	{
		var_44d6e1c4 = isinarray(var_7620540d, v);
		if(!var_44d6e1c4)
		{
			var_7620540d[var_7620540d.size] = v;
		}
	}
	return var_7620540d;
}

/*
	Name: function_16b5f116
	Namespace: snd
	Checksum: 0x56C11786
	Offset: 0x1060
	Size: 0xC8
	Parameters: 2
	Flags: None
*/
function function_16b5f116(var_7620540d, v)
{
	var_8c6d09f4 = isarray(var_7620540d);
	var_198b5115 = isdefined(v);
	if(function_81fac19d(!var_198b5115, "snd VarrayRemove undefined entity"))
	{
		return var_7620540d;
	}
	if(!var_8c6d09f4)
	{
		var_7620540d = undefined;
	}
	else if(var_8c6d09f4)
	{
		var_44d6e1c4 = isinarray(var_7620540d, v);
		if(var_44d6e1c4)
		{
			arrayremovevalue(var_7620540d, v);
		}
	}
	return var_7620540d;
}

/*
	Name: function_783b69
	Namespace: snd
	Checksum: 0xC0539C1
	Offset: 0x1130
	Size: 0xD0
	Parameters: 2
	Flags: Linked
*/
function function_783b69(s, wrap)
{
	s = function_ea2f17d1(s, "");
	wrap = function_ea2f17d1(wrap, "");
	str = "";
	/#
		if(function_7a600918(s))
		{
			if(wrap != "")
			{
				str = "";
			}
			s = function_9e72a96(s);
		}
	#/
	str = str + ((wrap + s) + wrap);
	return str;
}

/*
	Name: function_8cb4e540
	Namespace: snd
	Checksum: 0x587B060C
	Offset: 0x1208
	Size: 0xB6
	Parameters: 2
	Flags: None
*/
function function_8cb4e540(var_35087278, var_329bae03)
{
	/#
		prefix = "";
		outputstring = "";
		if(isstring(var_35087278) && var_35087278.size > 0 && var_35087278.size < var_329bae03)
		{
			for(var_329bae03 = var_329bae03 - var_35087278.size; var_329bae03 >= 0; var_329bae03--)
			{
				prefix = prefix + "";
			}
		}
		outputstring = prefix + var_35087278;
		return outputstring;
	#/
}

/*
	Name: function_dc4baa9
	Namespace: snd
	Checksum: 0xB79CC543
	Offset: 0x12C8
	Size: 0x13A
	Parameters: 1
	Flags: Linked
*/
function function_dc4baa9(s)
{
	if(isnumber(s) == 1)
	{
		return true;
	}
	if(isstring(s) == 1 && s[0] == "0" || s[0] == "1" || s[0] == "2" || s[0] == "3" || s[0] == "4" || s[0] == "5" || s[0] == "6" || s[0] == "7" || s[0] == "8" || s[0] == "9" || s[0] == ".")
	{
		return true;
	}
	return false;
}

/*
	Name: function_d6053a8f
	Namespace: snd
	Checksum: 0x80A7910
	Offset: 0x1410
	Size: 0x246
	Parameters: 2
	Flags: None
*/
function function_d6053a8f(var_e9082dc0, var_29a5aeda)
{
	if(isstring(var_e9082dc0))
	{
		return var_e9082dc0;
	}
	var_29a5aeda = function_ea2f17d1(var_29a5aeda, 0);
	var_29a5aeda = int(min(var_29a5aeda, 6));
	var_89b1fb20 = int(var_e9082dc0);
	fractional = var_e9082dc0 - var_89b1fb20;
	switch(var_29a5aeda)
	{
		case 0:
		{
			return "" + var_89b1fb20;
			break;
		}
		case 1:
		{
			fractional = int(fractional * 10);
			break;
		}
		case 2:
		{
			fractional = int(fractional * 100);
			break;
		}
		case 3:
		{
			fractional = int(fractional * 1000);
			break;
		}
		case 4:
		{
			fractional = int(fractional * 10000);
			break;
		}
		case 5:
		{
			fractional = int(fractional * 10000);
			break;
		}
		case 6:
		default:
		{
			fractional = int(fractional * 100000);
			break;
		}
	}
	var_dd5cb52a = (var_89b1fb20 + ".") + fractional;
	return var_dd5cb52a;
}

/*
	Name: function_6afe83c4
	Namespace: snd
	Checksum: 0x61853466
	Offset: 0x1660
	Size: 0xFC
	Parameters: 1
	Flags: None
*/
function function_6afe83c4(arr)
{
	foreach(i, item in arr)
	{
		var_4c1ba7d3 = isstring(item);
		var_e6fa5c22 = function_dc4baa9(item);
		if(var_4c1ba7d3 == 1 && var_e6fa5c22 == 1)
		{
			arr[i] = int(item);
		}
	}
	return arr;
}

/*
	Name: function_64a5440a
	Namespace: snd
	Checksum: 0x7D23FD73
	Offset: 0x1768
	Size: 0xFC
	Parameters: 1
	Flags: None
*/
function function_64a5440a(arr)
{
	foreach(i, item in arr)
	{
		var_4c1ba7d3 = isstring(item);
		var_e6fa5c22 = function_dc4baa9(item);
		if(var_4c1ba7d3 == 1 && var_e6fa5c22 == 1)
		{
			arr[i] = float(item);
		}
	}
	return arr;
}

/*
	Name: function_7284a22a
	Namespace: snd
	Checksum: 0x7290AA4B
	Offset: 0x1870
	Size: 0xD0
	Parameters: 1
	Flags: Linked
*/
function function_7284a22a(thing)
{
	position = undefined;
	if(function_3132f113(thing) == 0 && isdefined(thing.origin))
	{
		position = thing.origin;
	}
	else
	{
		if(isvec(thing) == 1)
		{
			position = thing;
		}
		else
		{
			/#
				assert(0);
			#/
		}
	}
	/#
		assert(isvec(position) == 1, "");
	#/
	return position;
}

/*
	Name: function_322e32be
	Namespace: snd
	Checksum: 0x8D93BDD4
	Offset: 0x1948
	Size: 0xD2
	Parameters: 1
	Flags: None
*/
function function_322e32be(array)
{
	/#
		assert(isarray(array) == 1, "");
	#/
	if(array.size == 1)
	{
		return array[0];
	}
	randomindex = randomintrange(1, array.size);
	randomindex = randomindex - 1;
	/#
		assert(randomindex >= 0 && randomindex < (array.size - 1));
	#/
	randomelement = array[randomindex];
	return randomelement;
}

/*
	Name: function_2ba9b0fd
	Namespace: snd
	Checksum: 0x9122CB2
	Offset: 0x1A28
	Size: 0x7E
	Parameters: 1
	Flags: None
*/
function function_2ba9b0fd(str)
{
	var_89b1fb20 = int(str);
	if(var_89b1fb20 > 0)
	{
		return true;
	}
	if(var_89b1fb20 < 0)
	{
		return true;
	}
	if(var_89b1fb20 == 0 && str == "0")
	{
		return true;
	}
	return false;
}

/*
	Name: function_1114d717
	Namespace: snd
	Checksum: 0xE4FA8F0C
	Offset: 0x1AB0
	Size: 0x82
	Parameters: 1
	Flags: Linked
*/
function function_1114d717(target)
{
	ents = getentarray(target, "targetname");
	structs = struct::get_array(target, "targetname");
	targets = arraycombine(ents, structs);
	return targets;
}

/*
	Name: function_e8185c19
	Namespace: snd
	Checksum: 0xE43FF3F1
	Offset: 0x1B40
	Size: 0xE6
	Parameters: 3
	Flags: None
*/
function function_e8185c19(currentvalue, var_2901828, var_dc0a4660)
{
	if(var_dc0a4660 == 0)
	{
		return currentvalue;
	}
	if(var_dc0a4660 == 1)
	{
		/#
			text = "";
			println(text);
			iprintlnbold(text);
		#/
		return var_2901828;
	}
	var_dc0a4660 = math::clamp(var_dc0a4660, 0, 1);
	var_bf1cf581 = 1 - var_dc0a4660;
	var_2901828 = (currentvalue * var_bf1cf581) + (var_2901828 * var_dc0a4660);
	return var_2901828;
}

/*
	Name: function_a5300865
	Namespace: snd
	Checksum: 0x528383F5
	Offset: 0x1C30
	Size: 0x3A
	Parameters: 3
	Flags: Linked
*/
function function_a5300865(value, minvalue, maxvalue)
{
	if(value >= minvalue && value <= maxvalue)
	{
		return true;
	}
	return false;
}

/*
	Name: function_6ecb085
	Namespace: snd
	Checksum: 0xE19D60AF
	Offset: 0x1C78
	Size: 0x52
	Parameters: 3
	Flags: None
*/
function function_6ecb085(value, midvalue, var_2c789a2)
{
	isinrange = function_a5300865(value, midvalue - var_2c789a2, midvalue + var_2c789a2);
	return isinrange;
}

/*
	Name: function_8f8470eb
	Namespace: snd
	Checksum: 0x61A1A9C0
	Offset: 0x1CD8
	Size: 0x6E
	Parameters: 0
	Flags: None
*/
function function_8f8470eb()
{
	/#
		assert(isdefined(self) == 1);
	#/
	while(function_3132f113(self) == 0)
	{
		self waittill(#"death", #"disconnect");
	}
}

/*
	Name: function_69fd73ba
	Namespace: snd
	Checksum: 0x78AEA258
	Offset: 0x1D50
	Size: 0x42E
	Parameters: 2
	Flags: None
*/
function function_69fd73ba(target, range)
{
	self endon(#"death");
	src = self;
	var_5f3e2817 = undefined;
	var_9d415208 = undefined;
	if(isarray(range))
	{
		/#
			assert(range.size == 2);
		#/
		var_5f3e2817 = float(range[0]);
		var_9d415208 = float(range[1]);
		/#
			assert(var_9d415208 >= var_5f3e2817);
		#/
	}
	else if(isnumber(range))
	{
		var_5f3e2817 = float(range);
	}
	/#
		assert(isfloat(var_5f3e2817));
	#/
	var_39e18923 = abs(var_5f3e2817);
	while(isdefined(src) && isdefined(target))
	{
		var_99f43abf = function_7284a22a(src);
		var_727198c5 = function_7284a22a(target);
		current_distance = distance(var_99f43abf, var_727198c5);
		if(isfloat(var_9d415208))
		{
			if(current_distance <= var_9d415208 && current_distance >= var_5f3e2817)
			{
				return;
			}
		}
		else
		{
			if(var_5f3e2817 > 0 && current_distance >= var_5f3e2817)
			{
				return;
			}
			if(var_5f3e2817 <= 0 && current_distance <= var_39e18923)
			{
				return;
			}
		}
		/#
			if(function_95c9af4b() > 0)
			{
				var_97fd701c = randomfloatrange(0.72974, 1);
				var_c1cc0d4 = randomfloatrange(0.5, 1);
				var_2078e37a = randomfloatrange(0.5, 1);
				var_c8cfc057 = (var_97fd701c, var_c1cc0d4, var_2078e37a);
				var_c8cfc057 = vectornormalize(var_c8cfc057);
				var_597aa60f = (function_d6053a8f(current_distance, 0) + "") + var_39e18923;
				if(isfloat(var_9d415208))
				{
					var_597aa60f = var_597aa60f + ("" + var_9d415208);
					if(var_9d415208 > 0)
					{
						function_b95b9a60(var_727198c5, var_9d415208, var_c8cfc057, 1, 1);
					}
				}
				if(var_39e18923 > 0)
				{
					function_b95b9a60(var_727198c5, var_39e18923, var_c8cfc057, 1, 1);
				}
				function_ac033c46(var_597aa60f, var_727198c5 + vectorscale((0, 0, 1), 4), -0.75, "", var_c8cfc057, 1, (0, 0, 0), 0.72974, (1, 1, 1), 0.72974);
			}
		#/
		waitframe(1);
	}
}

/*
	Name: function_e3a36342
	Namespace: snd
	Checksum: 0xE3600C07
	Offset: 0x2188
	Size: 0x50
	Parameters: 1
	Flags: Linked
*/
function function_e3a36342(player)
{
	if(isdefined(player) && isentity(player) && isplayer(player))
	{
		return true;
	}
	return false;
}

/*
	Name: function_2b2b83dc
	Namespace: snd
	Checksum: 0xCA88DA55
	Offset: 0x21E0
	Size: 0x142
	Parameters: 1
	Flags: Linked
*/
function function_2b2b83dc(team)
{
	if(is_true(level.var_17e6189d.var_8c37ff34))
	{
		players = getplayers(0, team);
		foreach(player in players)
		{
			if(!function_e3a36342(player))
			{
				arrayremovevalue(players, player);
			}
		}
		return players;
	}
	if(is_true(level.var_17e6189d.var_2dd09170))
	{
		players = getplayers(team);
		return players;
	}
	return array();
}

/*
	Name: function_a8210e43
	Namespace: snd
	Checksum: 0x97344205
	Offset: 0x2330
	Size: 0xBE
	Parameters: 1
	Flags: None
*/
function function_a8210e43(localclientnum)
{
	players = function_2b2b83dc();
	foreach(player in players)
	{
		if(isdefined(player.localclientnum) && player.localclientnum == localclientnum)
		{
			return player;
		}
	}
	return undefined;
}

/*
	Name: waitforplayers
	Namespace: snd
	Checksum: 0xB32C93EE
	Offset: 0x23F8
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function waitforplayers()
{
	while(true)
	{
		function_294cb4fa();
		players = function_2b2b83dc();
		if(isarray(players) && players.size > 0)
		{
			break;
		}
		waitframe(1);
	}
}

/*
	Name: function_da785aa8
	Namespace: snd
	Checksum: 0xEA1E9720
	Offset: 0x2470
	Size: 0x42
	Parameters: 1
	Flags: Linked
*/
function function_da785aa8(team)
{
	waitforplayers();
	players = function_2b2b83dc(team);
	return players;
}

/*
	Name: function_869cb8c6
	Namespace: snd
	Checksum: 0xF8783F17
	Offset: 0x24C0
	Size: 0x8A
	Parameters: 0
	Flags: None
*/
function function_869cb8c6()
{
	if(is_true(level.var_17e6189d.var_8c37ff34))
	{
		return int(60);
	}
	if(is_true(level.var_17e6189d.var_2dd09170))
	{
		return int(20);
	}
	return float(20);
}

/*
	Name: function_6cfa7975
	Namespace: snd
	Checksum: 0x33D1AC66
	Offset: 0x2558
	Size: 0x8A
	Parameters: 0
	Flags: Linked
*/
function function_6cfa7975()
{
	if(is_true(level.var_17e6189d.var_8c37ff34))
	{
		return float(0.01666667);
	}
	if(is_true(level.var_17e6189d.var_2dd09170))
	{
		return float(0.05);
	}
	return float(0.05);
}

/*
	Name: function_41df60ba
	Namespace: snd
	Checksum: 0x900A0DB3
	Offset: 0x25F0
	Size: 0xA4
	Parameters: 2
	Flags: None
*/
function function_41df60ba(framecount, var_5bc3280a)
{
	frametime = 0.03333334 * framecount;
	if(isdefined(var_5bc3280a) == 0)
	{
		var_5bc3280a = 0;
	}
	waittime = frametime + var_5bc3280a;
	if(waittime <= 0)
	{
		/#
			println(("" + waittime) + "");
		#/
		return;
	}
	wait(waittime);
}

/*
	Name: function_a0a15145
	Namespace: snd
	Checksum: 0x44992F1B
	Offset: 0x26A0
	Size: 0x92
	Parameters: 5
	Flags: Linked
*/
function function_a0a15145(var_20694abe, var_4bbb9191, var_79a551f0, var_50c632d3, var_338eef61)
{
	if(var_4bbb9191 == var_79a551f0)
	{
		var_79a551f0 = var_79a551f0 + 0.001;
	}
	if(var_50c632d3 == var_338eef61)
	{
		var_338eef61 = var_338eef61 + 0.001;
	}
	var_ff6041fe = mapfloat(var_4bbb9191, var_79a551f0, var_50c632d3, var_338eef61, var_20694abe);
	return var_ff6041fe;
}

/*
	Name: function_e17840b5
	Namespace: snd
	Checksum: 0xE5F518D9
	Offset: 0x2740
	Size: 0x80
	Parameters: 2
	Flags: Private
*/
function private function_e17840b5(vector, scale)
{
	/#
		assert(isvec(vector));
	#/
	/#
		assert(isnumber(scale));
	#/
	var_7dd54c4 = vector * (scale, scale, scale);
	return var_7dd54c4;
}

/*
	Name: function_afb43113
	Namespace: snd
	Checksum: 0x7A8301C4
	Offset: 0x27C8
	Size: 0xB6
	Parameters: 1
	Flags: Linked, Private
*/
function private function_afb43113(vector)
{
	largestindex = 0;
	var_d7a0aa89 = 0;
	mult = 1;
	var_35f90ba = vector;
	for(i = 0; i < 3; i++)
	{
		v = vector[i];
		if(v > var_d7a0aa89)
		{
			largestindex = i;
			var_d7a0aa89 = v;
		}
	}
	mult = 1 / var_d7a0aa89;
	var_35f90ba = vectorscale(var_35f90ba, mult);
	return var_35f90ba;
}

/*
	Name: function_d782c0a0
	Namespace: snd
	Checksum: 0xADF196AB
	Offset: 0x2888
	Size: 0xF4
	Parameters: 3
	Flags: Linked
*/
function function_d782c0a0(v, min, max)
{
	if(isnumber(min))
	{
		min = (min, min, min);
	}
	if(isnumber(max))
	{
		max = (max, max, max);
	}
	var_350ab2ee = v;
	var_350ab2ee = (math::clamp(var_350ab2ee[0], min[0], max[0]), math::clamp(var_350ab2ee[1], min[1], max[1]), math::clamp(var_350ab2ee[2], min[2], max[2]));
	return var_350ab2ee;
}

/*
	Name: function_e39f92b0
	Namespace: snd
	Checksum: 0xF91FD052
	Offset: 0x2988
	Size: 0x4A
	Parameters: 2
	Flags: None
*/
function function_e39f92b0(vector, scale)
{
	var_7dd54c4 = vectorscale(vector, scale);
	var_278d442d = function_afb43113(var_7dd54c4);
	return var_278d442d;
}

/*
	Name: function_2677a7e2
	Namespace: snd
	Checksum: 0xC93D2EC2
	Offset: 0x29E0
	Size: 0x52
	Parameters: 2
	Flags: None
*/
function function_2677a7e2(vector, scale)
{
	var_7dd54c4 = vectorscale(vector, scale);
	var_78886e0f = function_d782c0a0(var_7dd54c4, (0, 0, 0), (1, 1, 1));
	return var_78886e0f;
}

/*
	Name: function_27c74b9d
	Namespace: snd
	Checksum: 0x2448AA6
	Offset: 0x2A40
	Size: 0x6C
	Parameters: 1
	Flags: None
*/
function function_27c74b9d(inches)
{
	/#
		/#
			assert(isnumber(inches) == 1, "");
		#/
	#/
	return float(inches) * 0.08333334;
}

/*
	Name: function_5a06b6bd
	Namespace: snd
	Checksum: 0x4BADD599
	Offset: 0x2AB8
	Size: 0x6C
	Parameters: 1
	Flags: None
*/
function function_5a06b6bd(inches)
{
	/#
		/#
			assert(isnumber(inches) == 1, "");
		#/
	#/
	return float(inches) * 0.0254;
}

/*
	Name: function_c8caaab4
	Namespace: snd
	Checksum: 0x4DB46F00
	Offset: 0x2B30
	Size: 0x50
	Parameters: 3
	Flags: None
*/
function function_c8caaab4(point, sphere_origin, radius)
{
	dist = distance(point, sphere_origin);
	if(dist <= radius)
	{
		return true;
	}
	return false;
}

/*
	Name: function_160366e9
	Namespace: snd
	Checksum: 0x1C8846BD
	Offset: 0x2B88
	Size: 0x184
	Parameters: 4
	Flags: Linked
*/
function function_160366e9(centerorigin, dist, azimuth, elevation)
{
	if(isdefined(dist) == 0 || dist <= 0)
	{
		return centerorigin;
	}
	azimuth = function_ea2f17d1(azimuth, 0);
	elevation = function_ea2f17d1(elevation, 0);
	azimuth = azimuth + 180;
	elevation = elevation + 270;
	posx = centerorigin[0];
	posy = centerorigin[1];
	posz = centerorigin[2];
	posx = posx + (dist * sin(elevation)) * cos(azimuth);
	posy = posy + (dist * sin(elevation)) * sin(azimuth);
	posz = posz + (dist * cos(elevation));
	position = (posx, posy, posz);
	return position;
}

/*
	Name: function_bf7c949
	Namespace: snd
	Checksum: 0x3D7F96ED
	Offset: 0x2D18
	Size: 0xE8
	Parameters: 1
	Flags: Linked
*/
function function_bf7c949(var_aaa97ea4)
{
	ent = self;
	tagname = "";
	tagorigin = undefined;
	if(is_true(level.var_17e6189d.var_8c37ff34))
	{
		tagname = "tag_origin";
	}
	if(isdefined(var_aaa97ea4) == 1)
	{
		tagorigin = ent gettagorigin(var_aaa97ea4);
	}
	if(isdefined(tagorigin) == 1)
	{
		tagname = tolower(var_aaa97ea4);
	}
	/#
		assert(isdefined(tagname) == 1, "");
	#/
	return tagname;
}

/*
	Name: function_1666c97e
	Namespace: snd
	Checksum: 0xF128E108
	Offset: 0x2E08
	Size: 0x10C
	Parameters: 3
	Flags: None
*/
function function_1666c97e(origin, angles, extents)
{
	mins = origin - extents;
	maxs = origin + extents;
	delta = maxs - mins;
	var_765f4a63 = (randomfloat(delta[0]), randomfloat(delta[1]), randomfloat(delta[2]));
	if(angles != (0, 0, 0))
	{
		mins = origin - (rotatepoint(origin - mins, angles));
		var_765f4a63 = rotatepoint(var_765f4a63, angles);
	}
	randompoint = mins + var_765f4a63;
	return randompoint;
}

/*
	Name: function_827811b5
	Namespace: snd
	Checksum: 0x65FDC0C1
	Offset: 0x2F20
	Size: 0x1AA
	Parameters: 0
	Flags: Linked
*/
function function_827811b5()
{
	var_38c41a5e = 1920;
	var_c13d121d = 1080;
	if(ispc())
	{
		var_b21538d8 = getdvarint(#"r_fullscreen", 0);
		if(var_b21538d8)
		{
			mode = getdvar(#"r_fullscreenmode", "800x600");
			dims = strtok(mode, "x");
			if(isarray(dims) && dims.size >= 2)
			{
				var_38c41a5e = int(dims[0]);
				var_c13d121d = int(dims[1]);
			}
		}
		else
		{
			var_38c41a5e = getdvarint(#"hash_799d70a49cc79c0f", 1920);
			var_c13d121d = getdvarint(#"hash_526c340ae912bbd0", 1080);
		}
	}
	resolution = array(var_38c41a5e, var_c13d121d);
	return resolution;
}

/*
	Name: function_95c9af4b
	Namespace: snd
	Checksum: 0x37541C9B
	Offset: 0x30D8
	Size: 0x46
	Parameters: 0
	Flags: None
*/
function function_95c9af4b()
{
	/#
		if(isdefined(level.var_17e6189d._debug.debuglevel))
		{
			return level.var_17e6189d._debug.debuglevel;
		}
	#/
	return 0;
}

/*
	Name: function_d78e3644
	Namespace: snd
	Checksum: 0xDEF259F1
	Offset: 0x3128
	Size: 0x28
	Parameters: 0
	Flags: None
*/
function function_d78e3644()
{
	/#
		if(function_95c9af4b() > 0)
		{
			return true;
		}
	#/
	return false;
}

/*
	Name: function_f984063f
	Namespace: snd
	Checksum: 0xADF92AF3
	Offset: 0x3158
	Size: 0x2A
	Parameters: 0
	Flags: Linked
*/
function function_f984063f()
{
	/#
		if(function_95c9af4b() > 2)
		{
			return true;
		}
	#/
	return false;
}

/*
	Name: function_15ba1770
	Namespace: snd
	Checksum: 0x7FC974E2
	Offset: 0x3190
	Size: 0x4F6
	Parameters: 0
	Flags: None
*/
function function_15ba1770()
{
	var_15da6609 = [54:"wcornell", 53:"sjimmerson", 52:"seckert", 51:"rgarigliano", 50:"lstaples", 49:"ksherwood", 48:"jmccawley", 47:"hplunkard", 46:"cdinkel", 45:"cayers", 44:"btuey", 43:"bbitonti", 42:"rmcsweeney", 41:"midavies", 40:"mgrimm", 39:"mcaisley", 38:"kchau", 37:"flabarthe", 36:"elopez", 35:"dswenson", 34:"dveca", 33:"vnuniyants", 32:"jmiller", 31:"rsmsnjmiller", 30:"ndamato", 29:"kkozlowski", 28:"jtennies", 27:"jsypult", 26:"jharley", 25:"dblondin", 24:"bkreimeier", 23:"abrown", 22:"abayless", 21:"tstasica", 20:"tleeamies", 19:"sprovine", 18:"smiller", 17:"drowe", 16:"dprior", 15:"dnatale", 14:"cchristensen", 13:"cstaples", 12:"cegert", 11:"carya", 10:"tbader", 9:"jdrelick", 8:"imika", 7:"csakanai", 6:"cbello", 5:"vleroux", 4:"prenaud", 3:"plgrondines", 2:"ntremblay", 1:"mdenis", 0:"jgosselin"];
	players = function_2b2b83dc();
	if(isarray(players))
	{
		foreach(player in players)
		{
			playername = getplayername(player);
			if(isdefined(playername))
			{
				foreach(username in var_15da6609)
				{
					if(issubstr(playername, username))
					{
						setdvar(#"hash_7bf92664f192f2a2", "1");
						return;
					}
				}
			}
		}
	}
}

/*
	Name: function_81fac19d
	Namespace: snd
	Checksum: 0x9EB13944
	Offset: 0x3690
	Size: 0x58
	Parameters: 2
	Flags: Linked
*/
function function_81fac19d(condition, var_1ba2560d)
{
	/#
		if(condition)
		{
			if(function_d78e3644() == 1)
			{
				function_3ba3cecb(var_1ba2560d);
			}
		}
	#/
	return condition;
}

/*
	Name: function_7b45efc6
	Namespace: snd
	Checksum: 0xFF031CB2
	Offset: 0x36F0
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function function_7b45efc6(volume)
{
	var_aaa0f6d6 = log(float(volume)) / log(10);
	var_13be1590 = 20 * var_aaa0f6d6;
	return var_13be1590;
}

/*
	Name: function_359f7bac
	Namespace: snd
	Checksum: 0x5046476E
	Offset: 0x3770
	Size: 0x52
	Parameters: 1
	Flags: None
*/
function function_359f7bac(var_13be1590)
{
	volume = pow(10, float(var_13be1590) / 20);
	return volume;
}

/*
	Name: function_d8b24901
	Namespace: snd
	Checksum: 0xD630C1E5
	Offset: 0x37D0
	Size: 0x52
	Parameters: 1
	Flags: None
*/
function function_d8b24901(var_c787ff80)
{
	pitchscale = pow(2, float(var_c787ff80) / 12);
	return pitchscale;
}

/*
	Name: function_9bf57bf0
	Namespace: snd
	Checksum: 0x3159F07
	Offset: 0x3830
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function function_9bf57bf0(pitch)
{
	var_1183b32a = log(float(pitch)) / log(2);
	var_c787ff80 = 12 * var_1183b32a;
	return var_c787ff80;
}

/*
	Name: function_e75e9ba1
	Namespace: snd
	Checksum: 0xEACCB739
	Offset: 0x38B0
	Size: 0xB4
	Parameters: 4
	Flags: None
*/
function function_e75e9ba1(animname, animtree, notifyname, rate)
{
	if(isdefined(level.var_31efd858) == 0)
	{
		function_81fac19d(isdefined(level.var_31efd858) == 0, "rvPlayAnimation was not initialized!");
	}
	else
	{
		if(isdefined(notifyname) == 0)
		{
			notifyname = "animnotetrack";
		}
		if(isdefined(rate) == 0)
		{
			rate = 1;
		}
		self thread [[level.var_31efd858]](animname, animtree, notifyname, rate);
	}
}

/*
	Name: function_7395ea7
	Namespace: snd
	Checksum: 0x10459F1E
	Offset: 0x3970
	Size: 0x18
	Parameters: 0
	Flags: None
*/
function function_7395ea7()
{
	level notify(#"hash_6cc074e33d3d4045");
}

/*
	Name: function_225d1cb8
	Namespace: snd
	Checksum: 0x7923D97E
	Offset: 0x3990
	Size: 0x244
	Parameters: 0
	Flags: Linked, Private
*/
function private function_225d1cb8()
{
	level notify(#"hash_6cc074e33d3d4045");
	level endon(#"hash_6cc074e33d3d4045");
	level endon(#"game_ended");
	while(true)
	{
		foreach(dvar in level.var_ebd8d6b1)
		{
			callback = dvar.callback;
			key = dvar.key;
			value = getdvar(key);
			if(isdefined(callback) && isdefined(key) && isdefined(value) && dvar.value != value)
			{
				returnvalue = [[callback]](key, value);
				if(isdefined(returnvalue))
				{
					setdvar(key, returnvalue);
					dvar.value = returnvalue;
					continue;
				}
				dvar.value = value;
			}
		}
		waitframe(1);
		if(isdefined(level.hostmigrationtimer))
		{
			level waittill(#"host_migration_end");
			foreach(dvar in level.var_ebd8d6b1)
			{
				function_b7598ee(dvar.key, dvar.value);
			}
		}
	}
}

/*
	Name: function_d517905b
	Namespace: snd
	Checksum: 0x278FAA24
	Offset: 0x3BE0
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d517905b()
{
	if(isdefined(level.var_ebd8d6b1) == 0)
	{
		level.var_ebd8d6b1 = array();
		level thread function_225d1cb8();
	}
}

/*
	Name: function_3710d450
	Namespace: snd
	Checksum: 0x843D5747
	Offset: 0x3C38
	Size: 0xB4
	Parameters: 3
	Flags: Linked, Private
*/
function private function_3710d450(dvar, value, callback)
{
	function_32e7473e(dvar);
	level.var_ebd8d6b1[dvar] = spawnstruct();
	level.var_ebd8d6b1[dvar].callback = callback;
	level.var_ebd8d6b1[dvar].key = dvar;
	level.var_ebd8d6b1[dvar].value = value;
	function_b7598ee(dvar, value);
}

/*
	Name: function_b7598ee
	Namespace: snd
	Checksum: 0xB507D736
	Offset: 0x3CF8
	Size: 0x2C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_b7598ee(dvar, value)
{
	function_5ac4dc99(dvar, value);
}

/*
	Name: function_32e7473e
	Namespace: snd
	Checksum: 0x61EEA74D
	Offset: 0x3D30
	Size: 0x30
	Parameters: 1
	Flags: Linked
*/
function function_32e7473e(dvar)
{
	if(isdefined(level.var_ebd8d6b1[dvar]))
	{
		level.var_ebd8d6b1[dvar] = undefined;
	}
}

/*
	Name: dvar
	Namespace: snd
	Checksum: 0xBA2B9BFA
	Offset: 0x3D68
	Size: 0x44
	Parameters: 3
	Flags: None
*/
function dvar(dvar, value, callback)
{
	function_d517905b();
	function_3710d450(dvar, value, callback);
}

/*
	Name: function_98a0f33
	Namespace: snd
	Checksum: 0x61875585
	Offset: 0x3DB8
	Size: 0x206
	Parameters: 10
	Flags: Linked, Private
*/
function private function_98a0f33(callbackfunc, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
{
	/#
		assert(isdefined(self) == 1);
	#/
	/#
		assert(isdefined(callbackfunc) == 1);
	#/
	/#
		assert(isscriptfunctionptr(callbackfunc) == 1);
	#/
	if(isdefined(arg9))
	{
		self [[callbackfunc]](arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
	}
	if(isdefined(arg8))
	{
		self [[callbackfunc]](arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
	}
	if(isdefined(arg7))
	{
		self [[callbackfunc]](arg1, arg2, arg3, arg4, arg5, arg6, arg7);
	}
	if(isdefined(arg6))
	{
		self [[callbackfunc]](arg1, arg2, arg3, arg4, arg5, arg6);
	}
	if(isdefined(arg5))
	{
		self [[callbackfunc]](arg1, arg2, arg3, arg4, arg5);
	}
	if(isdefined(arg4))
	{
		self [[callbackfunc]](arg1, arg2, arg3, arg4);
	}
	if(isdefined(arg3))
	{
		self [[callbackfunc]](arg1, arg2, arg3);
	}
	else
	{
		if(isdefined(arg2))
		{
			self [[callbackfunc]](arg1, arg2);
		}
		else
		{
			if(isdefined(arg1))
			{
				self [[callbackfunc]](arg1);
			}
			else
			{
				self [[callbackfunc]]();
			}
		}
	}
}

/*
	Name: function_8a64a4ec
	Namespace: snd
	Checksum: 0x84212B73
	Offset: 0x3FC8
	Size: 0x1FE
	Parameters: 10
	Flags: Linked, Private
*/
function private function_8a64a4ec(callbackfunc, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
{
	/#
		assert(isdefined(self) == 1);
	#/
	/#
		assert(isdefined(callbackfunc) == 1);
	#/
	/#
		assert(iscodefunctionptr(callbackfunc) == 0);
	#/
	if(isdefined(arg9))
	{
		self [[callbackfunc]](arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
	}
	if(isdefined(arg8))
	{
		self [[callbackfunc]](arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
	}
	if(isdefined(arg7))
	{
		self [[callbackfunc]](arg1, arg2, arg3, arg4, arg5, arg6, arg7);
	}
	if(isdefined(arg6))
	{
		self [[callbackfunc]](arg1, arg2, arg3, arg4, arg5, arg6);
	}
	if(isdefined(arg5))
	{
		self [[callbackfunc]](arg1, arg2, arg3, arg4, arg5);
	}
	if(isdefined(arg4))
	{
		self [[callbackfunc]](arg1, arg2, arg3, arg4);
	}
	if(isdefined(arg3))
	{
		self [[callbackfunc]](arg1, arg2, arg3);
	}
	else
	{
		if(isdefined(arg2))
		{
			self [[callbackfunc]](arg1, arg2);
		}
		else
		{
			if(isdefined(arg1))
			{
				self [[callbackfunc]](arg1);
			}
			else
			{
				self [[callbackfunc]]();
			}
		}
	}
}

/*
	Name: function_df40860c
	Namespace: snd
	Checksum: 0x8C58C6C0
	Offset: 0x41D0
	Size: 0x124
	Parameters: 10
	Flags: Linked
*/
function function_df40860c(callbackfunc, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
{
	/#
		assert(isdefined(self) == 1);
	#/
	/#
		assert(isdefined(callbackfunc) == 1);
	#/
	if(isscriptfunctionptr(callbackfunc) == 1)
	{
		self function_98a0f33(callbackfunc, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
	}
	else if(iscodefunctionptr(callbackfunc) == 1)
	{
		self function_8a64a4ec(callbackfunc, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
	}
}

/*
	Name: function_b3acadc6
	Namespace: snd
	Checksum: 0x95A71D52
	Offset: 0x4300
	Size: 0x7C
	Parameters: 10
	Flags: None
*/
function function_b3acadc6(callbackfunc, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
{
	self thread function_df40860c(callbackfunc, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
}

/*
	Name: function_9cae113f
	Namespace: snd
	Checksum: 0xC9C449B7
	Offset: 0x4388
	Size: 0x1A6
	Parameters: 3
	Flags: Private
*/
function private function_9cae113f(soundalias, column, var_46195ad8)
{
	/#
		if(soundexists(soundalias) == 0)
		{
			return undefined;
		}
		var_7cfa497b = function_9119c373(soundalias, column);
		if(isdefined(var_7cfa497b) == 0 || ("" + var_7cfa497b) == "")
		{
			return undefined;
		}
		var_434eefbd = float(var_7cfa497b);
		var_ed113d34 = function_9119c373(soundalias, "");
		while(isdefined(var_ed113d34) == 1 && var_ed113d34 != "")
		{
			var_7cfa497b = function_9119c373(soundalias, column);
			var_7cfa497b = float(var_7cfa497b);
			if(var_46195ad8 == "")
			{
				var_434eefbd = min(var_434eefbd, var_7cfa497b);
			}
			else if(var_46195ad8 == "")
			{
				var_434eefbd = max(var_434eefbd, var_7cfa497b);
			}
			var_ed113d34 = function_9119c373(var_ed113d34, "");
		}
		return var_434eefbd;
	#/
}

/*
	Name: function_7139f5ae
	Namespace: snd
	Checksum: 0x1D875703
	Offset: 0x4538
	Size: 0x42
	Parameters: 2
	Flags: None
*/
function function_7139f5ae(soundalias, column)
{
	/#
		minvalue = function_9cae113f(soundalias, column, "");
		return minvalue;
	#/
}

/*
	Name: function_10120598
	Namespace: snd
	Checksum: 0xDB2D57BA
	Offset: 0x4588
	Size: 0x42
	Parameters: 2
	Flags: None
*/
function function_10120598(soundalias, column)
{
	/#
		maxvalue = function_9cae113f(soundalias, column, "");
		return maxvalue;
	#/
}

/*
	Name: function_636a2037
	Namespace: snd
	Checksum: 0xAED236AD
	Offset: 0x45D8
	Size: 0x9A
	Parameters: 1
	Flags: Linked
*/
function function_636a2037(decimal)
{
	var_c6e8bc8d = "0123456789ABCDEF";
	quotient = int(decimal);
	var_74c02394 = "";
	while(quotient != 0)
	{
		remainder = quotient % 16;
		var_74c02394 = var_c6e8bc8d[remainder] + var_74c02394;
		quotient = quotient >> 4;
	}
	return var_74c02394;
}

/*
	Name: function_cc1eeb91
	Namespace: snd
	Checksum: 0x6A615D39
	Offset: 0x4680
	Size: 0x292
	Parameters: 1
	Flags: Linked
*/
function function_cc1eeb91(hex)
{
	hex = string(hex);
	var_89b1fb20 = int(0);
	for(i = 0; i < hex.size; i++)
	{
		var_f7bc2b2f = hex[i];
		var_59c6ddd3 = 0;
		switch(var_f7bc2b2f)
		{
			case "5":
			case "4":
			case "7":
			case "6":
			case "1":
			case "0":
			case "3":
			case "2":
			case "9":
			case "8":
			{
				var_59c6ddd3 = int(var_f7bc2b2f);
				break;
			}
			case "a":
			case "a":
			{
				var_59c6ddd3 = 10;
				break;
			}
			case "b":
			case "b":
			{
				var_59c6ddd3 = 11;
				break;
			}
			case "c":
			case "c":
			{
				var_59c6ddd3 = 12;
				break;
			}
			case "d":
			case "d":
			{
				var_59c6ddd3 = 13;
				break;
			}
			case "e":
			case "e":
			{
				var_59c6ddd3 = 14;
				break;
			}
			case "f":
			case "f":
			{
				var_59c6ddd3 = 15;
				break;
			}
		}
		var_89b1fb20 = int((var_89b1fb20 << 4) | int(var_59c6ddd3));
	}
	return var_89b1fb20;
}

/*
	Name: function_c65c3de8
	Namespace: snd
	Checksum: 0xF6BDA9B0
	Offset: 0x4920
	Size: 0x52
	Parameters: 1
	Flags: None
*/
function function_c65c3de8(var_19040b20)
{
	var_89b1fb20 = int(var_19040b20);
	var_f76bdca5 = function_636a2037(var_89b1fb20);
	return var_f76bdca5;
}

/*
	Name: function_35dccf3f
	Namespace: snd
	Checksum: 0x332350C1
	Offset: 0x4980
	Size: 0x52
	Parameters: 1
	Flags: None
*/
function function_35dccf3f(hex)
{
	var_89b1fb20 = function_cc1eeb91(hex);
	var_19040b20 = hash(var_89b1fb20);
	return var_19040b20;
}

/*
	Name: function_cc5643b5
	Namespace: snd
	Checksum: 0x8BEE4799
	Offset: 0x49E0
	Size: 0x52
	Parameters: 1
	Flags: None
*/
function function_cc5643b5(str)
{
	var_19040b20 = hash(str);
	var_f76bdca5 = string(var_19040b20);
	return var_f76bdca5;
}

/*
	Name: function_3626f311
	Namespace: snd
	Checksum: 0xE0D69C35
	Offset: 0x4A40
	Size: 0x52
	Parameters: 1
	Flags: None
*/
function function_3626f311(hex)
{
	/#
		var_19040b20 = function_35dccf3f(hex);
		stringvalue = function_9e72a96(var_19040b20);
		return stringvalue;
	#/
}

/*
	Name: function_33ccce67
	Namespace: snd
	Checksum: 0x5E7A1A7A
	Offset: 0x4AA0
	Size: 0x2D0
	Parameters: 2
	Flags: Linked
*/
function function_33ccce67(scenedef, var_1465c5e2)
{
	var_1465c5e2 = function_ea2f17d1(var_1465c5e2, 1);
	instances = array();
	var_558dab14 = struct::get_array(scenedef, "scriptbundlename");
	instances = arraycombine(var_558dab14, instances, 0, 0);
	var_f57a8d58 = scene::get_active_scenes(scenedef);
	instances = arraycombine(var_f57a8d58, instances, 0, 0);
	var_2536a531 = scene::get_inactive_scenes(scenedef);
	instances = arraycombine(var_2536a531, instances, 0, 0);
	var_9f7f4078 = array();
	if(isarray(instances) && instances.size > 0)
	{
		foreach(i in instances)
		{
			if(isarray(i.scene_ents))
			{
				var_9f7f4078 = arraycombine(i.scene_ents, var_9f7f4078, 0, 0);
				arrayremovevalue(var_9f7f4078, undefined, 0);
				if(var_1465c5e2)
				{
					foreach(e in var_9f7f4078)
					{
						if(function_e3a36342(e))
						{
							arrayremovevalue(var_9f7f4078, e, 0);
						}
					}
				}
			}
		}
	}
	return var_9f7f4078;
}

