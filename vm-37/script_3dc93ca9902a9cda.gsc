#using script_1292451e284848cc;
#using script_5552bd756afee443;
#using script_85cd2e9a28ea8a1;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace snd;

/*
	Name: function_4e1ee82e
	Namespace: snd
	Checksum: 0x5620481B
	Offset: 0x878
	Size: 0x60
	Parameters: 0
	Flags: None
*/
function function_4e1ee82e()
{
	if(isdefined(level.var_17e6189d) && isdefined(level.var_17e6189d.var_d37e94ca) && is_true(level.var_17e6189d.var_a203d643))
	{
		return true;
	}
	return false;
}

/*
	Name: function_294cb4fa
	Namespace: snd
	Checksum: 0x25F1796
	Offset: 0x8E0
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_294cb4fa()
{
	while(function_4e1ee82e() == 0)
	{
		waitframe(1);
	}
}

/*
	Name: play
	Namespace: snd
	Checksum: 0x5D3FF866
	Offset: 0x910
	Size: 0x5A
	Parameters: 2
	Flags: None
*/
function play(soundalias, targets)
{
	soundtype = level.var_17e6189d.var_d37e94ca;
	var_afe43979 = function_2639b80c(soundtype, soundalias, targets);
	return var_afe43979;
}

/*
	Name: stop
	Namespace: snd
	Checksum: 0x5C6917A5
	Offset: 0x978
	Size: 0xB0
	Parameters: 2
	Flags: None
*/
function stop(var_afe43979, var_24ea4e17)
{
	foreach(var_d7ba9fdf in function_f218bff5(var_afe43979))
	{
		level thread function_f937a6f7(var_d7ba9fdf, var_24ea4e17);
	}
}

/*
	Name: function_1ac5032
	Namespace: snd
	Checksum: 0x3888BD8D
	Offset: 0xA30
	Size: 0x166
	Parameters: 3
	Flags: None
*/
function function_1ac5032(soundalias, targets, var_24ea4e17)
{
	if(function_81fac19d(!isdefined(soundalias), "snd_stop_alias with undefined soundalias"))
	{
		return 0;
	}
	soundalias = tolower(soundalias);
	var_2b6903e6 = function_33560b93(targets);
	var_a2d12888 = 0;
	foreach(var_d7ba9fdf in var_2b6903e6)
	{
		if(!isdefined(var_d7ba9fdf.soundalias))
		{
			continue;
		}
		if(issubstr(tolower(var_d7ba9fdf.soundalias), soundalias))
		{
			stop(var_d7ba9fdf, var_24ea4e17);
			var_a2d12888 = int(var_a2d12888 + 1);
		}
	}
	return var_a2d12888;
}

/*
	Name: function_2a2f26d4
	Namespace: snd
	Checksum: 0xFECFA4DE
	Offset: 0xBA0
	Size: 0x138
	Parameters: 4
	Flags: None
*/
function function_2a2f26d4(var_afe43979, notifyentity, notifystring, var_24ea4e17)
{
	if(function_81fac19d(!isdefined(var_afe43979), "snd_stop_on_ent_notify with undefined soundObject"))
	{
		return;
	}
	if(function_81fac19d(!isentity(notifyentity), "snd_stop_on_ent_notify notifyEntity is not an entity"))
	{
		return;
	}
	if(function_81fac19d(!isdefined(notifystring), "snd_stop_on_ent_notify with undefined levelNotifyString"))
	{
		return;
	}
	foreach(var_d7ba9fdf in function_f218bff5(var_afe43979))
	{
		notifyentity thread function_7b540bad(var_d7ba9fdf, notifyentity, notifystring, var_24ea4e17);
	}
}

/*
	Name: function_f4f3a2a
	Namespace: snd
	Checksum: 0xCE85AC20
	Offset: 0xCE0
	Size: 0x108
	Parameters: 3
	Flags: None
*/
function function_f4f3a2a(var_afe43979, var_7a0e40dd, var_24ea4e17)
{
	if(function_81fac19d(!isdefined(var_afe43979), "snd_stop_on_ent_death with undefined soundObject"))
	{
		return;
	}
	if(function_81fac19d(!isdefined(var_7a0e40dd), "snd_stop_on_ent_death with undefined linkedEntity"))
	{
		return;
	}
	foreach(var_d7ba9fdf in function_f218bff5(var_afe43979))
	{
		var_7a0e40dd thread function_7b540bad(var_d7ba9fdf, var_7a0e40dd, "death", var_24ea4e17);
	}
}

/*
	Name: function_d4e10f97
	Namespace: snd
	Checksum: 0x3900E29D
	Offset: 0xDF0
	Size: 0x100
	Parameters: 3
	Flags: None
*/
function function_d4e10f97(var_afe43979, var_1ed3fdf1, var_24ea4e17)
{
	if(function_81fac19d(!isdefined(var_afe43979), "snd_stop_on_level_notify: undefined soundObject"))
	{
		return;
	}
	if(function_81fac19d(!isdefined(var_1ed3fdf1), "snd_stop_on_level_notify: undefined levelNotifyString"))
	{
		return;
	}
	foreach(var_d7ba9fdf in function_f218bff5(var_afe43979))
	{
		level thread function_78a6b95b(var_d7ba9fdf, var_1ed3fdf1, var_24ea4e17);
	}
}

/*
	Name: function_2fdc4fb
	Namespace: snd
	Checksum: 0x7DFAEEE2
	Offset: 0xEF8
	Size: 0x174
	Parameters: 1
	Flags: None
*/
function function_2fdc4fb(var_afe43979)
{
	if(function_81fac19d(!isdefined(var_afe43979), "snd_wait with undefined soundObject"))
	{
		return 0;
	}
	starttime = gettime();
	waittime = 0;
	while(true)
	{
		var_d4337e5 = 0;
		var_2b6903e6 = function_f218bff5(var_afe43979);
		arrayremovevalue(var_2b6903e6, undefined);
		foreach(var_d7ba9fdf in var_2b6903e6)
		{
			if(function_a6779cbd(var_d7ba9fdf))
			{
				var_d4337e5 = 1;
				break;
			}
		}
		if(var_d4337e5 == 0)
		{
			break;
		}
		waitframe(1);
	}
	endtime = gettime();
	waittime = endtime - starttime;
	waittime = waittime / 1000;
	return waittime;
}

/*
	Name: function_a6779cbd
	Namespace: snd
	Checksum: 0x6C0FF16B
	Offset: 0x1078
	Size: 0x2E
	Parameters: 1
	Flags: None
*/
function function_a6779cbd(var_afe43979)
{
	if(isdefined(var_afe43979) && isdefined(var_afe43979.soundtype))
	{
		return true;
	}
	return false;
}

/*
	Name: function_33560b93
	Namespace: snd
	Checksum: 0xEFECFBE4
	Offset: 0x10B0
	Size: 0x12E
	Parameters: 1
	Flags: None
*/
function function_33560b93(targets)
{
	var_d16005d8 = [];
	foreach(target in function_f218bff5(targets))
	{
		if(!isdefined(target))
		{
			var_d16005d8 = arraycombine(var_d16005d8, level.var_17e6189d.var_3cc765a3);
			continue;
		}
		if(target == level)
		{
			var_d16005d8 = arraycombine(var_d16005d8, level.var_17e6189d.var_92f63ad0);
			continue;
		}
		if(isdefined(target.var_a415b6d6))
		{
			var_d16005d8 = arraycombine(var_d16005d8, target.var_a415b6d6);
		}
	}
	return var_d16005d8;
}

/*
	Name: function_8f5dfd03
	Namespace: snd
	Checksum: 0x78A6675B
	Offset: 0x11E8
	Size: 0x2AE
	Parameters: 2
	Flags: None
*/
function function_8f5dfd03(soundalias, targets)
{
	if(function_81fac19d(!isdefined(soundalias), "snd_get_alias_objects with undefined soundalias"))
	{
		return 0;
	}
	soundaliases = [];
	if(isarray(soundalias))
	{
		foreach(alias in soundalias)
		{
			soundaliases[soundaliases.size] = tolower(alias);
		}
	}
	else if(isstring(soundalias))
	{
		soundaliases = [0:tolower(soundalias)];
	}
	/#
		assert(isarray(soundaliases), "");
	#/
	var_2b6903e6 = function_33560b93(targets);
	var_68303cc7 = [];
	foreach(var_d7ba9fdf in var_2b6903e6)
	{
		if(!isdefined(var_d7ba9fdf.soundalias))
		{
			continue;
		}
		foreach(alias in soundaliases)
		{
			if(issubstr(tolower(var_d7ba9fdf.soundalias), alias))
			{
				var_68303cc7[var_68303cc7.size] = var_d7ba9fdf;
			}
		}
	}
	return var_68303cc7;
}

/*
	Name: function_880857eb
	Namespace: snd
	Checksum: 0xEA271513
	Offset: 0x14A0
	Size: 0x1BC
	Parameters: 1
	Flags: None
*/
function function_880857eb(var_932dabe2)
{
	var_932dabe2 = function_ea2f17d1(var_932dabe2, 1);
	if(!isdefined(level.var_17e6189d.fnplaysoundonentity))
	{
		level.var_17e6189d.fnplaysoundonentity = level.fnplaysoundonentity;
		level.var_17e6189d.fnplaysoundontag = level.fnplaysoundontag;
		level.var_17e6189d.fnnotetrackprefixhandler = level.fnnotetrackprefixhandler;
		level.var_17e6189d.var_2861a322 = level.animation.callbacks[#"playsoundatviewheight"];
	}
	if(var_932dabe2)
	{
		level.fnplaysoundonentity = &function_b7609ab;
		level.fnplaysoundontag = &function_e94a63b7;
		level.fnnotetrackprefixhandler = &function_95d9f208;
		level.animation.callbacks[#"playsoundatviewheight"] = &function_e9b666c7;
	}
	else
	{
		level.fnplaysoundonentity = level.var_17e6189d.fnplaysoundonentity;
		level.fnplaysoundontag = level.var_17e6189d.fnplaysoundontag;
		level.fnnotetrackprefixhandler = level.var_17e6189d.fnnotetrackprefixhandler;
		level.animation.callbacks[#"playsoundatviewheight"] = level.var_17e6189d.var_2861a322;
	}
}

/*
	Name: function_92d3587
	Namespace: snd
	Checksum: 0xA563E38
	Offset: 0x1668
	Size: 0x62
	Parameters: 1
	Flags: None
*/
function function_92d3587(var_afe43979)
{
	if(isdefined(level.var_17e6189d._callbacks[#"hash_1e1ac3f40eb876c"]))
	{
		return [[level.var_17e6189d._callbacks[#"hash_1e1ac3f40eb876c"]]](var_afe43979);
	}
	return 1;
}

/*
	Name: function_db78159d
	Namespace: snd
	Checksum: 0x7F84D72F
	Offset: 0x16D8
	Size: 0x82
	Parameters: 5
	Flags: None
*/
function function_db78159d(var_afe43979, volume, timeinseconds, curve, callbackfunc)
{
	if(isdefined(level.var_17e6189d._callbacks[#"hash_54be783edee16780"]))
	{
		[[level.var_17e6189d._callbacks[#"hash_54be783edee16780"]]](var_afe43979, volume, timeinseconds, curve, callbackfunc);
	}
}

/*
	Name: get_pitch
	Namespace: snd
	Checksum: 0xCDE4FA95
	Offset: 0x1768
	Size: 0x62
	Parameters: 1
	Flags: None
*/
function get_pitch(var_afe43979)
{
	if(isdefined(level.var_17e6189d._callbacks[#"hash_48cf16f271a9efa6"]))
	{
		return [[level.var_17e6189d._callbacks[#"hash_48cf16f271a9efa6"]]](var_afe43979);
	}
	return 1;
}

/*
	Name: set_pitch
	Namespace: snd
	Checksum: 0x87E2CCD2
	Offset: 0x17D8
	Size: 0x82
	Parameters: 5
	Flags: None
*/
function set_pitch(var_afe43979, pitch, timeinseconds, curve, callbackfunc)
{
	if(isdefined(level.var_17e6189d._callbacks[#"hash_2e4f12f2aa75ce4a"]))
	{
		[[level.var_17e6189d._callbacks[#"hash_2e4f12f2aa75ce4a"]]](var_afe43979, pitch, timeinseconds, curve, callbackfunc);
	}
}

/*
	Name: function_ccb932f2
	Namespace: snd
	Checksum: 0x6A31CE5A
	Offset: 0x1868
	Size: 0x42
	Parameters: 0
	Flags: None
*/
function function_ccb932f2()
{
	if(is_true(level.var_17e6189d.var_2dd09170))
	{
		return #"hash_72d0c119f969b755";
	}
	return #"hash_26f47d82e3ac7591";
}

/*
	Name: function_34595a23
	Namespace: snd
	Checksum: 0xC7B53F02
	Offset: 0x18B8
	Size: 0x16
	Parameters: 0
	Flags: None
*/
function function_34595a23()
{
	return level.var_17e6189d.var_d37e94ca;
}

/*
	Name: function_793ba430
	Namespace: snd
	Checksum: 0xCA09D7F3
	Offset: 0x18D8
	Size: 0x5A
	Parameters: 1
	Flags: None
*/
function function_793ba430(type)
{
	type = function_ea2f17d1(type, function_ccb932f2());
	level.var_17e6189d.var_d37e94ca = function_d14c9339(type);
}

/*
	Name: get_type
	Namespace: snd
	Checksum: 0x48BB781E
	Offset: 0x1940
	Size: 0x2E
	Parameters: 1
	Flags: None
*/
function get_type(var_afe43979)
{
	if(isdefined(var_afe43979.soundtype))
	{
		return var_afe43979.soundtype;
	}
	return "";
}

/*
	Name: function_d14c9339
	Namespace: snd
	Checksum: 0x6753C517
	Offset: 0x1978
	Size: 0x148
	Parameters: 1
	Flags: None
*/
function function_d14c9339(soundtype)
{
	var_db943b21 = undefined;
	switch(soundtype)
	{
		case 0:
		case "entity":
		case "e":
		case "ent":
		{
			var_db943b21 = #"hash_72d0c119f969b755";
			break;
		}
		case 1:
		case "hash_26f47d82e3ac7591":
		case "c":
		case "cent":
		{
			var_db943b21 = #"hash_26f47d82e3ac7591";
			break;
		}
		case "emitter":
		{
			var_db943b21 = #"emitter";
			break;
		}
		default:
		{
			var_db943b21 = undefined;
			break;
		}
	}
	/#
		assert(isdefined(var_db943b21), "" + soundtype);
	#/
	return var_db943b21;
}

/*
	Name: function_aaee1de3
	Namespace: snd
	Checksum: 0xF3911D6
	Offset: 0x1AC8
	Size: 0xF2
	Parameters: 3
	Flags: Private
*/
function private function_aaee1de3(var_db943b21, snd_key, item)
{
	/#
		assert(isdefined(level.var_17e6189d), "");
	#/
	/#
		assert(isdefined(level.var_17e6189d.var_3cc765a3), "");
	#/
	switch(var_db943b21)
	{
		default:
		{
			/#
				assert(0, "");
			#/
			break;
		}
		case "hash_26f47d82e3ac7591":
		case "hash_72d0c119f969b755":
		{
			level.var_17e6189d.var_3cc765a3[snd_key] = item;
			break;
		}
	}
}

/*
	Name: function_7e9752b7
	Namespace: snd
	Checksum: 0xA1C18495
	Offset: 0x1BC8
	Size: 0x13A
	Parameters: 3
	Flags: Private
*/
function private function_7e9752b7(var_db943b21, snd_key, item)
{
	/#
		assert(isdefined(level.var_17e6189d), "");
	#/
	/#
		assert(isdefined(level.var_17e6189d.var_3cc765a3), "");
	#/
	switch(var_db943b21)
	{
		default:
		{
			/#
				assert(0, "");
			#/
			break;
		}
		case "hash_26f47d82e3ac7591":
		case "hash_72d0c119f969b755":
		{
			/#
				assert(isinarray(level.var_17e6189d.var_3cc765a3, item), "");
			#/
			level.var_17e6189d.var_3cc765a3[snd_key] = undefined;
			break;
		}
	}
}

/*
	Name: function_e12570db
	Namespace: snd
	Checksum: 0x2713C9F
	Offset: 0x1D10
	Size: 0x5C
	Parameters: 0
	Flags: Private
*/
function private function_e12570db()
{
	var_db943b21 = self.soundtype;
	snd_key = self.soundkey;
	self waittill(#"death");
	function_7e9752b7(var_db943b21, snd_key, self);
}

/*
	Name: function_9a3d9ff2
	Namespace: snd
	Checksum: 0x86EB70E7
	Offset: 0x1D78
	Size: 0x172
	Parameters: 1
	Flags: Private
*/
function private function_9a3d9ff2(var_7483db1c)
{
	delaytime = 0;
	soundalias = undefined;
	var_6d232fb3 = undefined;
	if(isarray(var_7483db1c))
	{
		keys = var_7483db1c;
		soundalias = undefined;
		var_7c64d318 = keys.size + 1;
		for(i = 0; i < keys.size; i++)
		{
			key = keys[i];
			if(isstring(key))
			{
				soundalias = key;
				var_7c64d318 = i;
			}
			if(isnumber(key) && i < var_7c64d318)
			{
				delaytime = key;
			}
			if(isnumber(key) && i > var_7c64d318)
			{
				var_6d232fb3 = key;
			}
		}
	}
	else if(isstring(var_7483db1c))
	{
		soundalias = var_7483db1c;
	}
	var_aa8031af = array(delaytime, soundalias, var_6d232fb3);
	return var_aa8031af;
}

/*
	Name: function_75a3b79f
	Namespace: snd
	Checksum: 0x8A79597D
	Offset: 0x1EF8
	Size: 0x518
	Parameters: 1
	Flags: Private
*/
function private function_75a3b79f(targ)
{
	targets = [];
	if(!isdefined(targ))
	{
		foreach(player in function_2b2b83dc())
		{
			tagname = player function_bf7c949("j_head");
			if(player.model != "" && tagname != "")
			{
				targets[targets.size] = [1:tagname, 0:player];
				continue;
			}
			targets[targets.size] = player;
		}
	}
	else
	{
		if(isarray(targ))
		{
			if(function_81fac19d(targ.size == 0, "snd: zero-sized array used for targ"))
			{
				return undefined;
			}
			if(targ.size == 2)
			{
				if(isentity(targ[0]) && isstring(targ[1]))
				{
					targets = [0:targ];
				}
				else
				{
					if(isentity(targ[0]) && isvec(targ[1]))
					{
						targets = [0:targ];
					}
					else
					{
						if(isentity(targ[0]) && !isdefined(targ[1]))
						{
							targets = [0:targ[0]];
						}
						else
						{
							if(isstring(targ[0]) && isstring(targ[1]))
							{
								var_97a051a0 = function_1114d717(targ[0]);
								var_bdf30fa1 = function_1114d717(targ[1]);
								targets = arraycombine(var_97a051a0, var_bdf30fa1);
							}
							else
							{
								targets = targ;
							}
						}
					}
				}
			}
			else
			{
				targets = [];
				foreach(key in targ)
				{
					if(isentity(key) || (isstruct(key) && isdefined(key.origin)) || isvec(key) || isarray(key))
					{
						targets[targets.size] = key;
						continue;
					}
					if(isstring(key))
					{
						var_f7a0383c = function_1114d717(key);
						foreach(t in var_f7a0383c)
						{
							targets[targets.size] = t;
						}
					}
				}
			}
		}
		else
		{
			if(isstring(targ))
			{
				targets = function_1114d717(targ);
			}
			else
			{
				targets = [0:targ];
			}
		}
	}
	return targets;
}

/*
	Name: function_2639b80c
	Namespace: snd
	Checksum: 0xE036A323
	Offset: 0x2418
	Size: 0x9DA
	Parameters: 3
	Flags: Private
*/
function private function_2639b80c(soundtype, soundalias, var_9ab0e73a)
{
	if(function_81fac19d(!function_4e1ee82e(), "snd was not initialized!"))
	{
		/#
			if(function_f984063f())
			{
				debugbreak();
			}
		#/
		return undefined;
	}
	if(function_81fac19d(!isdefined(soundalias), "snd_play: sound alias undefined"))
	{
		return undefined;
	}
	level.var_17e6189d._callbacks[#"stop"] = &stop;
	/#
		assert(isdefined(level.var_17e6189d.var_d37e94ca), "");
	#/
	soundtype = function_ea2f17d1(soundtype, level.var_17e6189d.var_d37e94ca);
	var_2b6903e6 = [];
	targets = [];
	var_8e0014a9 = function_9a3d9ff2(soundalias);
	/#
		assert(isarray(var_8e0014a9) && var_8e0014a9.size == 3, "");
	#/
	delaytime = var_8e0014a9[0];
	soundalias = var_8e0014a9[1];
	var_6d232fb3 = var_8e0014a9[2];
	var_99e65ecf = undefined;
	if(function_81fac19d(isstring(soundalias) && soundalias == "", "snd_play: empty sound alias \"\""))
	{
		return undefined;
	}
	/#
		assert(isstring(soundalias) || function_7a600918(soundalias), "");
	#/
	islooping = soundislooping(soundalias);
	var_b0ef895d = soundexists(soundalias);
	if(function_81fac19d(!var_b0ef895d, ("snd: sound alias '" + soundalias) + "' does not exist!"))
	{
		/#
			if(function_f984063f())
			{
				debugbreak();
			}
		#/
		return undefined;
	}
	if(!isdefined(var_6d232fb3))
	{
		if(islooping)
		{
			var_6d232fb3 = level.var_17e6189d.var_90903fc0;
		}
		else
		{
			var_6d232fb3 = 0;
		}
	}
	if(isdefined(var_6d232fb3) && var_6d232fb3 > 0)
	{
		var_99e65ecf = 0;
	}
	/#
		assert(isdefined(var_6d232fb3));
	#/
	targets = function_75a3b79f(var_9ab0e73a);
	if(function_81fac19d(!isdefined(targets), "snd: undefined targets"))
	{
		return undefined;
	}
	foreach(t in targets)
	{
		var_605838f4 = undefined;
		var_e330010e = undefined;
		var_1d25915 = undefined;
		var_afe43979 = undefined;
		var_381a9100 = isentity(t);
		var_e464e992 = function_3132f113(t);
		var_f1d20474 = isstruct(t);
		var_e3d2e876 = isvec(t);
		isn = isstring(t);
		isa = isarray(t);
		if(var_381a9100)
		{
			var_605838f4 = t;
			var_1d25915 = (0, 0, 0);
		}
		else
		{
			if(function_81fac19d(var_e464e992, "snd: could not play on removed entity"))
			{
				continue;
			}
			else
			{
				if(var_f1d20474)
				{
					if(function_81fac19d(!isdefined(t.origin), ("snd: sound alias '" + soundalias) + "' played on struct with no origin!"))
					{
						continue;
					}
					else
					{
						var_1d25915 = t.origin;
					}
				}
				else
				{
					if(var_e3d2e876)
					{
						var_1d25915 = t;
					}
					else
					{
						if(isn)
						{
						}
						else if(isarray(t))
						{
							if(!isdefined(t[0]) || function_3132f113(t[0]))
							{
								continue;
							}
							else
							{
								if(isentity(t[0]) && isstring(t[1]))
								{
									var_605838f4 = t[0];
									var_e330010e = t[1];
									var_1d25915 = (0, 0, 0);
								}
								else
								{
									if(isentity(t[0]) && isvec(t[1]))
									{
										var_605838f4 = t[0];
										var_1d25915 = t[1];
									}
									else
									{
									}
								}
							}
						}
					}
				}
			}
		}
		switch(soundtype)
		{
			default:
			{
				/#
					assert(0, "");
				#/
				break;
			}
			case "hash_72d0c119f969b755":
			{
				var_afe43979 = namespace_afa8e18b::function_85daf9f0(soundalias, var_1d25915, var_605838f4, var_e330010e);
				namespace_afa8e18b::function_b5959278(var_afe43979, var_1d25915, var_605838f4, var_e330010e);
				function_aaee1de3(#"hash_72d0c119f969b755", var_afe43979.soundkey, var_afe43979);
				var_afe43979 thread function_e12570db();
				break;
			}
			case "hash_26f47d82e3ac7591":
			{
				var_afe43979 = namespace_afa8e18b::function_5275752c(soundalias, var_1d25915, var_605838f4, var_e330010e);
				namespace_afa8e18b::function_2761fc04(var_afe43979, var_1d25915, var_605838f4, var_e330010e);
				function_aaee1de3(#"hash_26f47d82e3ac7591", var_afe43979.soundkey, var_afe43979);
				var_afe43979 thread function_e12570db();
				break;
			}
		}
		if(isdefined(var_afe43979) && function_a6779cbd(var_afe43979))
		{
			switch(soundtype)
			{
				case "hash_72d0c119f969b755":
				default:
				{
					var_afe43979 thread namespace_afa8e18b::function_2dde45d9(var_afe43979, soundalias, var_99e65ecf, delaytime);
					break;
				}
				case "hash_26f47d82e3ac7591":
				{
					var_afe43979 thread namespace_afa8e18b::function_bb749fc3(var_afe43979, soundalias, var_99e65ecf, delaytime);
					break;
				}
			}
			if(var_6d232fb3 > 0)
			{
				if(soundtype == #"hash_72d0c119f969b755" && isdefined(var_605838f4))
				{
					delaytime = delaytime + 0.05;
				}
				var_afe43979 thread function_6f736cc1(var_afe43979, var_6d232fb3, delaytime);
			}
			var_2b6903e6[var_2b6903e6.size] = var_afe43979;
		}
	}
	if(function_81fac19d(var_2b6903e6.size == 0, "snd: zero sound objects played"))
	{
		return undefined;
	}
	return function_31bcd153(var_2b6903e6);
}

/*
	Name: function_f937a6f7
	Namespace: snd
	Checksum: 0x380C2B06
	Offset: 0x2E00
	Size: 0x32A
	Parameters: 2
	Flags: Private
*/
function private function_f937a6f7(var_afe43979, var_24ea4e17)
{
	if(function_81fac19d(!isdefined(level.var_17e6189d) || !isdefined(level.var_17e6189d.var_d37e94ca), "snd was not initialized"))
	{
		return;
	}
	if(function_81fac19d(!isdefined(var_afe43979) || function_3132f113(var_afe43979), "snd_stop with undefined soundObject"))
	{
		return;
	}
	if(function_81fac19d(!isdefined(var_afe43979.soundtype), "snd_stop with unknown type"))
	{
		return;
	}
	/#
		assert(isdefined(level.var_17e6189d.var_d37e94ca), "");
	#/
	/#
		assert(isdefined(var_afe43979), "");
	#/
	/#
		assert(isdefined(var_afe43979.soundtype), "");
	#/
	if(var_afe43979.soundtype == #"emitter")
	{
		var_afe43979 notify(#"hash_57df777459b5086");
		var_afe43979.soundtype = undefined;
		var_afe43979.soundalias = undefined;
		var_afe43979.var_90c86b97 = undefined;
		var_afe43979.origin = undefined;
		var_afe43979.angles = undefined;
		return;
	}
	var_afe43979 endon(#"death");
	soundtype = var_afe43979.soundtype;
	soundalias = var_afe43979.soundalias;
	if(isdefined(soundalias) && soundislooping(var_afe43979.soundalias) && !isdefined(var_24ea4e17))
	{
		var_24ea4e17 = level.var_17e6189d.var_90903fc0;
	}
	if(isdefined(soundalias) && isdefined(var_24ea4e17) && is_true(level.var_17e6189d.var_8c37ff34))
	{
		function_db78159d(var_afe43979, 0, var_24ea4e17);
		wait(var_24ea4e17);
		waitframe(1);
		if(function_3132f113(var_afe43979))
		{
			return;
		}
	}
	switch(soundtype)
	{
		case "hash_72d0c119f969b755":
		default:
		{
			namespace_afa8e18b::function_9f156b27(var_afe43979, var_24ea4e17);
			break;
		}
		case "hash_26f47d82e3ac7591":
		{
			namespace_afa8e18b::function_273d939b(var_afe43979, var_24ea4e17);
			break;
		}
	}
}

/*
	Name: function_7b540bad
	Namespace: snd
	Checksum: 0xE9AA2AD4
	Offset: 0x3138
	Size: 0x6C
	Parameters: 4
	Flags: Private
*/
function private function_7b540bad(var_afe43979, notifyentity, notifystring, var_24ea4e17)
{
	var_afe43979 endon(#"death");
	notifyentity waittill(#"death", notifystring);
	function_f937a6f7(var_afe43979, var_24ea4e17);
}

/*
	Name: function_78a6b95b
	Namespace: snd
	Checksum: 0x8F2C663A
	Offset: 0x31B0
	Size: 0x5C
	Parameters: 3
	Flags: Private
*/
function private function_78a6b95b(var_afe43979, var_1ed3fdf1, var_24ea4e17)
{
	var_afe43979 endon(#"death");
	level waittill(var_1ed3fdf1);
	function_f937a6f7(var_afe43979, var_24ea4e17);
}

/*
	Name: function_6f736cc1
	Namespace: snd
	Checksum: 0x18A73928
	Offset: 0x3218
	Size: 0x114
	Parameters: 3
	Flags: Private
*/
function private function_6f736cc1(var_afe43979, var_6d232fb3, delaytime)
{
	if(function_81fac19d(!isdefined(var_afe43979) || function_3132f113(var_afe43979), "snd: fade in on deleted gentity!"))
	{
		return;
	}
	/#
		assert(isdefined(var_afe43979));
	#/
	var_afe43979 endon(#"death");
	var_afe43979 endon(#"hash_501fa67f084af993");
	delaytime = function_ea2f17d1(delaytime, 0);
	function_db78159d(var_afe43979, 0, 0);
	if(delaytime > 0)
	{
		wait(delaytime);
	}
	function_db78159d(var_afe43979, 1, var_6d232fb3);
}

/*
	Name: function_5eb4c6d
	Namespace: snd
	Checksum: 0xBFA66DB7
	Offset: 0x3338
	Size: 0x100
	Parameters: 1
	Flags: Private
*/
function private function_5eb4c6d(target)
{
	position = undefined;
	if(function_e3a36342(target))
	{
		position = target function_efda2d6d();
	}
	else
	{
		if(!function_3132f113(target) && isdefined(target.origin))
		{
			position = target.origin;
		}
		else
		{
			if(isvec(target) == 1)
			{
				position = target;
			}
			else
			{
				/#
					assert(0);
				#/
			}
		}
	}
	/#
		assert(isvec(position) == 1, "");
	#/
	return position;
}

/*
	Name: function_cdc85ae5
	Namespace: snd
	Checksum: 0xAF860F74
	Offset: 0x3440
	Size: 0x262
	Parameters: 1
	Flags: Private
*/
function private function_cdc85ae5(var_4be7fc38)
{
	azimuth = randomfloatrange(-180, 180);
	rotation = 0;
	if(isarray(var_4be7fc38))
	{
		if(var_4be7fc38.size == 1)
		{
			var_4be7fc38 = var_4be7fc38[0];
		}
		else
		{
			if(var_4be7fc38.size == 2)
			{
				rotation = function_84fc754d(var_4be7fc38);
			}
			else
			{
				if(var_4be7fc38.size == 3)
				{
					azimuth = var_4be7fc38[0];
					rotation = function_84fc754d(var_4be7fc38);
					var_9b234989 = [1:var_4be7fc38[2], 0:var_4be7fc38[1]];
					rotation = function_84fc754d(var_9b234989);
				}
				else if(var_4be7fc38.size >= 4)
				{
					var_e0d0816c = [1:var_4be7fc38[1], 0:var_4be7fc38[0]];
					azimuth = function_84fc754d(var_e0d0816c);
					var_9b234989 = [1:var_4be7fc38[3], 0:var_4be7fc38[2]];
					rotation = function_84fc754d(var_9b234989);
				}
			}
		}
	}
	if(isnumber(var_4be7fc38) && var_4be7fc38 != 0)
	{
		var_242eda36 = abs(var_4be7fc38);
		min = -1 * var_242eda36;
		max = var_242eda36;
		rotation = randomfloatrange(min, max);
	}
	return array(azimuth, rotation);
}

/*
	Name: function_1ce48d0f
	Namespace: snd
	Checksum: 0x2FD36211
	Offset: 0x36B0
	Size: 0x330
	Parameters: 5
	Flags: Private
*/
function private function_1ce48d0f(target, dist, azimuth, elevation, rotation)
{
	self endon(#"death");
	self endon(#"sounddone");
	if(isdefined(rotation) == 0 || rotation == 0)
	{
		return;
	}
	/#
		assert(isentity(target) || (isstruct(target) && isdefined(target.origin)) || isvec(target), "");
	#/
	/#
		assert(isnumber(dist), "");
	#/
	/#
		assert(isnumber(azimuth), "");
	#/
	/#
		assert(isnumber(rotation), "");
	#/
	/#
		if(function_95c9af4b() > 2)
		{
			var_97fd701c = randomfloat(1);
			var_c1cc0d4 = randomfloat(1);
			var_2078e37a = randomfloat(1);
			var_c8cfc057 = (var_97fd701c, var_c1cc0d4, var_2078e37a);
			var_c8cfc057 = vectornormalize(var_c8cfc057);
			function_31d6fc52(self, var_c8cfc057);
		}
	#/
	movetime = function_6cfa7975() * 3;
	var_ea6c6b8e = rotation * movetime;
	centerorigin = function_5eb4c6d(target);
	while(isentity(self) && isdefined(target) && isdefined(target.origin))
	{
		centerorigin = function_5eb4c6d(target);
		position = function_160366e9(centerorigin, dist, azimuth, elevation);
		self moveto(position, movetime, 0, 0);
		azimuth = azimuth + var_ea6c6b8e;
		wait(movetime);
	}
}

/*
	Name: function_d1e7d514
	Namespace: snd
	Checksum: 0xC9F6DD67
	Offset: 0x39E8
	Size: 0x1B0
	Parameters: 1
	Flags: Private
*/
function private function_d1e7d514(emitter)
{
	var_f1d20474 = isstruct(emitter);
	var_7e461444 = isdefined(emitter.soundtype);
	ist = emitter.soundtype == #"emitter";
	var_69bd016 = var_f1d20474 && var_7e461444 && ist;
	if(function_81fac19d(var_69bd016 == 0, "snd emitter stop not an emitter"))
	{
		return;
	}
	/#
		assert(isdefined(emitter.soundkey), "");
	#/
	/#
		assert(isdefined(level.var_17e6189d.var_9e1f6b3e), "");
	#/
	/#
		assert(isdefined(level.var_17e6189d.var_90a7c764), "");
	#/
	level.var_17e6189d.var_90a7c764[emitter.soundkey] = undefined;
	emitter notify(#"hash_57df777459b5086");
	emitter.soundtype = undefined;
	emitter.soundalias = undefined;
	emitter.var_90c86b97 = undefined;
	emitter.origin = undefined;
	emitter.angles = undefined;
	emitter = undefined;
}

/*
	Name: function_dcc0344
	Namespace: snd
	Checksum: 0xCBDC2A98
	Offset: 0x3BA0
	Size: 0x500
	Parameters: 6
	Flags: Private
*/
function private function_dcc0344(soundalias, target, var_8fc5ff4a, var_6c6d0c21, var_4be7fc38, var_ad8975b4)
{
	self endon(#"hash_57df777459b5086");
	level endon(#"hash_57df777459b5086");
	/#
		assert(isdefined(target) && isarray(target) == 0, "");
	#/
	if(isvec(target))
	{
		target = self;
	}
	targetposition = undefined;
	position = undefined;
	dist = function_84fc754d(function_ea2f17d1(var_6c6d0c21, 0));
	var_a7685aa3 = function_cdc85ae5(var_4be7fc38);
	/#
		assert(isarray(var_a7685aa3) && var_a7685aa3.size != 0);
	#/
	azimuth = var_a7685aa3[0];
	rotation = var_a7685aa3[1];
	elevation = function_84fc754d(function_ea2f17d1(var_ad8975b4, 0));
	if(isarray(var_8fc5ff4a) && var_8fc5ff4a.size >= 4)
	{
		/#
			assert(var_8fc5ff4a.size == 4, "");
		#/
		var_f9baa88 = [1:var_8fc5ff4a[1], 0:var_8fc5ff4a[0]];
		spawntime = function_84fc754d(var_f9baa88, 0.05);
		wait(spawntime);
		targetposition = function_5eb4c6d(target);
		position = function_160366e9(targetposition, dist, azimuth, elevation);
		var_eabfdd64 = play(soundalias, position);
		if(isdefined(var_eabfdd64) && isdefined(dist) && dist > 0 && isdefined(rotation) && rotation != 0)
		{
			var_eabfdd64 thread function_1ce48d0f(target, dist, azimuth, rotation);
			var_8fc5ff4a = [1:var_8fc5ff4a[3], 0:var_8fc5ff4a[2]];
		}
	}
	while(true)
	{
		spawntime = function_84fc754d(var_8fc5ff4a, 0.05);
		wait(spawntime);
		if(!isdefined(target))
		{
			break;
		}
		dist = function_84fc754d(function_ea2f17d1(var_6c6d0c21, 0));
		var_a7685aa3 = function_cdc85ae5(var_4be7fc38);
		/#
			assert(isarray(var_a7685aa3) && var_a7685aa3.size != 0);
		#/
		azimuth = var_a7685aa3[0];
		rotation = var_a7685aa3[1];
		elevation = function_84fc754d(function_ea2f17d1(var_ad8975b4, 0));
		targetposition = function_5eb4c6d(target);
		position = function_160366e9(targetposition, dist, azimuth, elevation);
		var_eabfdd64 = play(soundalias, position);
		if(isdefined(var_eabfdd64) && isdefined(dist) && dist > 0 && isdefined(rotation) && rotation != 0)
		{
			var_eabfdd64 thread function_1ce48d0f(target, dist, azimuth, elevation, rotation);
		}
	}
}

/*
	Name: emitter
	Namespace: snd
	Checksum: 0x479EFF2F
	Offset: 0x40A8
	Size: 0x47A
	Parameters: 6
	Flags: None
*/
function emitter(soundalias, target, spawntime, var_6c6d0c21, rotation, elevation)
{
	emitters = [];
	targets = target;
	islooping = soundislooping(soundalias);
	var_f27b1688 = isdefined(islooping);
	if(function_81fac19d(!var_f27b1688, "snd_emitter soundalias does not exist: " + soundalias))
	{
		return undefined;
	}
	if(function_81fac19d(islooping, "snd_emitter cannot emit looping alias: " + soundalias))
	{
		return undefined;
	}
	if(!isdefined(level.var_17e6189d.var_9e1f6b3e))
	{
		level.var_17e6189d.var_9e1f6b3e = 1792;
		level.var_17e6189d.var_90a7c764 = [];
	}
	/#
		assert(isdefined(level.var_17e6189d.var_9e1f6b3e), "");
	#/
	/#
		assert(soundexists(soundalias), "" + soundalias);
	#/
	/#
		assert(isdefined(target), "");
	#/
	/#
		assert(isdefined(spawntime), "");
	#/
	if(isarray(targets) == 0)
	{
		targets = [0:target];
	}
	foreach(t in targets)
	{
		var_381a9100 = isentity(t);
		var_e3d2e876 = isvec(t);
		if(var_381a9100 || var_e3d2e876)
		{
			emitter = spawnstruct();
			emitter.soundtype = #"emitter";
			emitter.soundalias = soundalias;
			emitter.spawntime = spawntime;
			emitter.var_6c6d0c21 = var_6c6d0c21;
			emitter.rotation = rotation;
			emitter.elevation = elevation;
			level.var_17e6189d.var_9e1f6b3e = int(level.var_17e6189d.var_9e1f6b3e + 1);
			emitter.soundkey = "" + level.var_17e6189d.var_9e1f6b3e;
			level.var_17e6189d.var_90a7c764[emitter.soundkey] = emitter;
			if(var_381a9100)
			{
				emitter.var_90c86b97 = t;
			}
			if(var_e3d2e876)
			{
				emitter.origin = t;
				emitter.angles = (0, 0, 0);
			}
			emitter thread function_dcc0344(soundalias, t, spawntime, var_6c6d0c21, rotation, elevation);
			emitters[emitters.size] = emitter;
			continue;
		}
		function_81fac19d(var_381a9100 == 0 && var_e3d2e876 == 0, ("snd_emitter target '" + t) + "' was not an entity or vector.");
	}
	function_81fac19d(emitters.size == 0, "snd_emitter resulted in zero emitter targets");
	return function_31bcd153(emitters);
}

/*
	Name: function_e94a63b7
	Namespace: snd
	Checksum: 0xCFB4C49B
	Offset: 0x4530
	Size: 0x154
	Parameters: 5
	Flags: Private
*/
function private function_e94a63b7(alias, tag, ends_on_death, var_50bba55f, var_82ea274f)
{
	if(!isalive(self))
	{
		return;
	}
	target = [1:ends_on_death, 0:self];
	snd = function_2639b80c(level.var_17e6189d.var_d37e94ca, tag, target);
	/#
		if(isdefined(level.player_radio_emitter) && self == level.player_radio_emitter)
		{
			println("" + tag);
		}
	#/
	if(isdefined(var_50bba55f))
	{
		/#
			assert(var_50bba55f, "");
		#/
		function_f4f3a2a(snd, self);
	}
	function_2fdc4fb(snd);
	if(isdefined(var_82ea274f))
	{
		self notify(var_82ea274f);
	}
}

/*
	Name: function_b7609ab
	Namespace: snd
	Checksum: 0x918319B6
	Offset: 0x4690
	Size: 0x34
	Parameters: 2
	Flags: Private
*/
function private function_b7609ab(alias, var_50bba55f)
{
	self function_e94a63b7(alias, undefined, undefined, var_50bba55f);
}

/*
	Name: function_e9b666c7
	Namespace: snd
	Checksum: 0xBB159833
	Offset: 0x46D0
	Size: 0xEC
	Parameters: 3
	Flags: Private
*/
function private function_e9b666c7(soundalias, notifystring, var_741da363)
{
	var_741da363 = function_ea2f17d1(var_741da363, 0);
	if(!isalive(self))
	{
		return;
	}
	target = [1:"j_head", 0:self];
	snd = function_2639b80c(level.var_17e6189d.var_d37e94ca, soundalias, target);
	if(var_741da363)
	{
		function_f4f3a2a(snd, self);
	}
	if(isdefined(notifystring))
	{
		self thread function_61c048e7(snd, notifystring);
	}
}

/*
	Name: function_61c048e7
	Namespace: snd
	Checksum: 0xECD090CE
	Offset: 0x47C8
	Size: 0x34
	Parameters: 2
	Flags: Private
*/
function private function_61c048e7(snd, notifystring)
{
	function_2fdc4fb(snd);
	self notify(notifystring);
}

/*
	Name: function_95d9f208
	Namespace: snd
	Checksum: 0x6E1F11AF
	Offset: 0x4808
	Size: 0x1AE
	Parameters: 1
	Flags: Private
*/
function private function_95d9f208(notetrack)
{
	prefix = getsubstr(notetrack, 0, 3);
	if(prefix == "ps_")
	{
		alias = getsubstr(notetrack, 3);
		params = strtok(alias, ",");
		if(params.size < 2)
		{
			self thread function_e94a63b7(alias, undefined, 1);
		}
		else
		{
			self thread function_e94a63b7(params[0], params[1], 1);
		}
		return 1;
	}
	if(prefix == "vo_")
	{
		alias = getsubstr(notetrack, 3);
		if(isdefined(self.anim_playsound_func))
		{
			self thread [[self.anim_playsound_func]](alias, "j_head", 1);
		}
		else
		{
			self thread function_e94a63b7(alias, "j_head", 1, alias);
		}
		return 1;
	}
	if(isdefined(level.var_17e6189d.fnnotetrackprefixhandler))
	{
		return self [[level.var_17e6189d.fnnotetrackprefixhandler]](notetrack);
	}
	return 0;
}

/*
	Name: function_13b51154
	Namespace: snd
	Checksum: 0xA92B8259
	Offset: 0x49C0
	Size: 0x48A
	Parameters: 2
	Flags: None
*/
function function_13b51154(curve, size)
{
	var_c4f679d6 = [];
	step = 1 / (size - 1);
	for(i = 0; i < size; i++)
	{
		x = i * step;
		y = 0;
		switch(curve)
		{
			default:
			{
				/#
					assert(0);
				#/
				break;
			}
			case "default_vfcurve":
			case "linear":
			{
				var_c4f679d6[0] = 0;
				var_c4f679d6[1] = 1;
				return var_c4f679d6;
			}
			case "sine":
			{
				y = 0.5 + ((cos(x * 180)) * -0.5);
			}
			y = 1 - (cos(x * 90));
			break;
			case "easeout":
			{
				y = sin(x * 90);
				break;
			}
			case "easeinout":
			{
				y = (3 * pow(x, 2)) - (2 * pow(x, 3));
				break;
			}
			case "circularin":
			{
				y = 1 - (sqrt(1 - (x * x)));
				break;
			}
			case "circularout":
			{
				y = sqrt(1 - (1 - x) * (1 - x));
				break;
			}
			case "exponential_40db":
			{
				var_c4f679d6[0] = 0;
				var_c4f679d6[1] = 0.01584893;
				var_c4f679d6[2] = 0.02511887;
				var_c4f679d6[3] = 0.03981072;
				var_c4f679d6[4] = 0.06309573;
				var_c4f679d6[5] = 0.1;
				var_c4f679d6[6] = 0.1584893;
				var_c4f679d6[7] = 0.2511886;
				var_c4f679d6[8] = 0.3981072;
				var_c4f679d6[9] = 0.6309574;
				var_c4f679d6[10] = 1;
				return var_c4f679d6;
			}
			case "exponential_60db":
			{
				var_c4f679d6[0] = 0;
				var_c4f679d6[1] = 1.97531E-05;
				var_c4f679d6[2] = 0.0003160494;
				var_c4f679d6[3] = 0.0016;
				var_c4f679d6[4] = 0.00505679;
				var_c4f679d6[5] = 0.01234568;
				var_c4f679d6[6] = 0.0256;
				var_c4f679d6[7] = 0.04742716;
				var_c4f679d6[8] = 0.08090864;
				var_c4f679d6[9] = 0.1296;
				var_c4f679d6[10] = 0.1975309;
				var_c4f679d6[11] = 0.2892049;
				var_c4f679d6[12] = 0.4096;
				var_c4f679d6[13] = 0.5641679;
				var_c4f679d6[14] = 0.7588345;
				var_c4f679d6[15] = 1;
				return var_c4f679d6;
			}
		}
		var_c4f679d6[var_c4f679d6.size] = y;
	}
	return var_c4f679d6;
}

/*
	Name: function_3ffa0089
	Namespace: snd
	Checksum: 0xFE47CC87
	Offset: 0x4E58
	Size: 0x214
	Parameters: 1
	Flags: None
*/
function function_3ffa0089(size)
{
	size = function_ea2f17d1(size, 11);
	level.var_c386bd24 = [];
	level.var_c386bd24[#"linear"] = function_13b51154("linear", size);
	level.var_c386bd24[#"sine"] = function_13b51154("sine", size);
	level.var_c386bd24[#"easein"] = function_13b51154("easein", size);
	level.var_c386bd24[#"easeout"] = function_13b51154("easeout", size);
	level.var_c386bd24[#"easeinout"] = function_13b51154("easeinout", size);
	level.var_c386bd24[#"circularin"] = function_13b51154("circularin", size);
	level.var_c386bd24[#"circularout"] = function_13b51154("circularout", size);
	level.var_c386bd24[#"exponential_40db"] = function_13b51154("exponential_40db", size);
	level.var_c386bd24[#"exponential_60db"] = function_13b51154("exponential_60db", size);
	level.var_c386bd24[#"default_vfcurve"] = function_13b51154("default_vfcurve", size);
}

/*
	Name: function_d3f407d6
	Namespace: snd
	Checksum: 0x60CA4303
	Offset: 0x5078
	Size: 0x4E
	Parameters: 1
	Flags: Private
*/
function private function_d3f407d6(alias)
{
	if(isdefined(alias) == 0)
	{
		return "easeout";
	}
	switch(alias)
	{
		case "xfade":
		{
			return "easeout";
		}
	}
	return alias;
}

/*
	Name: function_fc955f31
	Namespace: snd
	Checksum: 0xC370613D
	Offset: 0x50D0
	Size: 0x4A
	Parameters: 1
	Flags: None
*/
function function_fc955f31(curve)
{
	var_c4f679d6 = level.var_c386bd24[function_d3f407d6(curve)];
	if(isdefined(var_c4f679d6))
	{
		return var_c4f679d6.size;
	}
	return 0;
}

/*
	Name: function_9020a959
	Namespace: snd
	Checksum: 0xB7D7B7D4
	Offset: 0x5128
	Size: 0x38
	Parameters: 1
	Flags: None
*/
function function_9020a959(curve)
{
	var_c4f679d6 = level.var_c386bd24[curve];
	if(isdefined(var_c4f679d6))
	{
		return true;
	}
	return false;
}

/*
	Name: function_b918d683
	Namespace: snd
	Checksum: 0xDBB15442
	Offset: 0x5168
	Size: 0x1F4
	Parameters: 2
	Flags: None
*/
function function_b918d683(var_7e1f6a77, curve)
{
	curve = function_d3f407d6(curve);
	var_c4f679d6 = level.var_c386bd24[curve];
	/#
		assert(isdefined(var_c4f679d6), "" + curve);
	#/
	var_7e1f6a77 = math::clamp(var_7e1f6a77, 0, 1);
	var_8c54d972 = 0;
	step = 1 / (var_c4f679d6.size - 1);
	if(var_7e1f6a77 == 0)
	{
		return 0;
	}
	if(var_7e1f6a77 == 1)
	{
		return 1;
	}
	for(i = 0; i < var_c4f679d6.size; i++)
	{
		var_a1c4b722 = i * step;
		var_aa208db = (i + 1) * step;
		if(var_7e1f6a77 >= var_a1c4b722 && var_7e1f6a77 <= var_aa208db)
		{
			diffx = var_7e1f6a77 - var_a1c4b722;
			var_5cf5d319 = var_aa208db - var_a1c4b722;
			diff = diffx / var_5cf5d319;
			var_eddc974c = var_c4f679d6[i];
			var_32cd2130 = var_c4f679d6[i + 1];
			var_b5540d92 = var_32cd2130 - var_eddc974c;
			var_8c54d972 = var_eddc974c + (var_b5540d92 * diff);
			break;
		}
	}
	return var_8c54d972;
}

/*
	Name: function_bc4f45dd
	Namespace: snd
	Checksum: 0xF659EE57
	Offset: 0x5368
	Size: 0x1BE
	Parameters: 1
	Flags: Private
*/
function private function_bc4f45dd(name)
{
	if(isdefined(self.var_3dc056c0) == 0)
	{
		return;
	}
	if(isdefined(name))
	{
		if(isdefined(self.var_3dc056c0[name]))
		{
			if(isdefined(self.var_3dc056c0[name].var_99b9dbe1))
			{
				self [[self.var_3dc056c0[name].var_99b9dbe1]](self.var_3dc056c0[name].userdata);
			}
			self.var_3dc056c0[name] = undefined;
		}
	}
	else
	{
		foreach(p in self.var_3dc056c0)
		{
			if(isdefined(p.var_99b9dbe1))
			{
				self [[p.var_99b9dbe1]](p.userdata);
			}
			self.var_3dc056c0 = undefined;
		}
	}
	if(isdefined(self.var_3dc056c0) == 0 || self.var_3dc056c0.size == 0)
	{
		arrayremovevalue(level.var_ba9b4ed, self, 1);
		arrayremovevalue(level.var_ba9b4ed, undefined, 1);
		self.var_3dc056c0 = undefined;
		self.var_b7790cd8 = undefined;
		self notify(#"hash_342a5e5858f5a58f");
	}
}

/*
	Name: function_edd37e50
	Namespace: snd
	Checksum: 0x61CFD9A8
	Offset: 0x5530
	Size: 0x4C
	Parameters: 0
	Flags: Private
*/
function private function_edd37e50()
{
	self endon(#"hash_342a5e5858f5a58f");
	self waittill(#"death", #"disconnect");
	self function_bc4f45dd();
}

/*
	Name: function_8eaaf665
	Namespace: snd
	Checksum: 0x55DB7839
	Offset: 0x5588
	Size: 0x314
	Parameters: 0
	Flags: Private
*/
function private function_8eaaf665()
{
	if(isdefined(self.var_b7790cd8))
	{
		return;
	}
	self.var_b7790cd8 = 1;
	self thread function_edd37e50();
	self endon(#"disconnect");
	self endon(#"hash_342a5e5858f5a58f");
	while(function_3132f113(self) == 0 && isdefined(self.var_3dc056c0) && self.var_3dc056c0.size > 0)
	{
		now = gettime();
		foreach(p in self.var_3dc056c0)
		{
			p.var_77f5577b = 1;
			if(isdefined(p.var_b90f380f))
			{
				/#
					assert(isentity(self), "");
				#/
				p.var_e9082dc0 = self [[p.var_b90f380f]](p.userdata);
				/#
					assert(gettime() == now, "");
				#/
			}
			if(isdefined(p.var_f171f012))
			{
				if(p.userdata.size > 0)
				{
					/#
						assert(p.var_f171f012.size == p.userdata.size, "");
					#/
				}
				foreach(var_1ad28f57 in p.var_f171f012)
				{
					if(isentity(self))
					{
						userdata = undefined;
						if(p.userdata.size > 0)
						{
							userdata = p.userdata[index];
						}
						self thread [[var_1ad28f57]](p.var_e9082dc0, userdata);
					}
				}
			}
			p.var_77f5577b = undefined;
		}
		waitframe(1);
	}
	if(function_3132f113(self))
	{
		self function_bc4f45dd();
	}
}

/*
	Name: function_ef12a0f5
	Namespace: snd
	Checksum: 0x6BDEA016
	Offset: 0x58A8
	Size: 0x124
	Parameters: 1
	Flags: Private
*/
function private function_ef12a0f5(name)
{
	if(isdefined(level.var_ba9b4ed) == 0)
	{
		level.var_ba9b4ed = [];
	}
	/#
		assert(isarray(level.var_ba9b4ed), "");
	#/
	if(isdefined(self.var_3dc056c0) == 0)
	{
		self.var_3dc056c0 = [];
	}
	/#
		assert(isarray(self.var_3dc056c0), "");
	#/
	if(isdefined(self.var_3dc056c0[name]) == 0)
	{
		self.var_3dc056c0[name] = spawnstruct();
	}
	if(isinarray(level.var_ba9b4ed, self) == 0)
	{
		level.var_ba9b4ed[level.var_ba9b4ed.size] = self;
	}
}

/*
	Name: function_67f723dd
	Namespace: snd
	Checksum: 0xA6D287D5
	Offset: 0x59D8
	Size: 0x6C
	Parameters: 2
	Flags: None
*/
function function_67f723dd(name, var_b90f380f)
{
	self function_ef12a0f5(name);
	self.var_3dc056c0[name].var_b90f380f = var_b90f380f;
	self.var_3dc056c0[name].var_e9082dc0 = undefined;
	self thread function_8eaaf665();
}

/*
	Name: function_fae704b2
	Namespace: snd
	Checksum: 0xF805623E
	Offset: 0x5A50
	Size: 0x244
	Parameters: 3
	Flags: None
*/
function function_fae704b2(name, var_1ad28f57, userdata)
{
	self function_ef12a0f5(name);
	if(isdefined(self.var_3dc056c0[name].var_f171f012) == 0)
	{
		self.var_3dc056c0[name].var_f171f012 = [];
	}
	/#
		assert(isdefined(self.var_3dc056c0[name]), ("" + name) + "");
	#/
	/#
		assert(isdefined(self.var_3dc056c0[name].var_f171f012), "");
	#/
	/#
		assert(isarray(self.var_3dc056c0[name].var_f171f012), "");
	#/
	var_68ec0ce1 = self.var_3dc056c0[name].var_f171f012.size;
	self.var_3dc056c0[name].var_f171f012[var_68ec0ce1] = var_1ad28f57;
	if(isdefined(self.var_3dc056c0[name].userdata) == 0)
	{
		self.var_3dc056c0[name].userdata = [];
	}
	if(isinarray(self.var_3dc056c0[name].userdata, userdata) == 0)
	{
		var_42547dd5 = self.var_3dc056c0[name].userdata.size;
		self.var_3dc056c0[name].userdata[var_42547dd5] = userdata;
	}
	else
	{
		/#
			debugbreak();
		#/
		if(function_d78e3644())
		{
		}
	}
	self thread function_8eaaf665();
}

/*
	Name: function_cb11f45c
	Namespace: snd
	Checksum: 0xF195174B
	Offset: 0x5CA0
	Size: 0x98
	Parameters: 3
	Flags: Private
*/
function private function_cb11f45c(name, var_74c67ede, var_99b9dbe1)
{
	self function_ef12a0f5(name);
	self.var_3dc056c0[name].var_74c67ede = var_74c67ede;
	self.var_3dc056c0[name].var_99b9dbe1 = var_99b9dbe1;
	if(isdefined(self.var_3dc056c0[name].var_74c67ede))
	{
		self [[self.var_3dc056c0[name].var_74c67ede]]();
	}
}

/*
	Name: function_79d9c57d
	Namespace: snd
	Checksum: 0xEA9AD13C
	Offset: 0x5D40
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function function_79d9c57d(name)
{
	self function_bc4f45dd(name);
}

/*
	Name: function_3e356217
	Namespace: snd
	Checksum: 0x46D1FE5E
	Offset: 0x5D70
	Size: 0x7C
	Parameters: 6
	Flags: None
*/
function function_3e356217(name, var_74c67ede, var_b90f380f, var_1ad28f57, var_99b9dbe1, userdata)
{
	self function_cb11f45c(name, var_74c67ede, var_99b9dbe1);
	self function_67f723dd(name, var_b90f380f);
	self function_fae704b2(name, var_1ad28f57, userdata);
}

/*
	Name: function_e6dfc446
	Namespace: snd
	Checksum: 0x42FB0178
	Offset: 0x5DF8
	Size: 0x9E
	Parameters: 1
	Flags: None
*/
function function_e6dfc446(name)
{
	if(isdefined(self.var_3dc056c0) && isdefined(self.var_3dc056c0[name]) && isdefined(self.var_3dc056c0[name].var_b90f380f))
	{
		p = self.var_3dc056c0[name];
		if(isdefined(p.var_e9082dc0))
		{
			return p.var_e9082dc0;
		}
		return self [[p.var_b90f380f]](p.userdata);
	}
	return undefined;
}

/*
	Name: function_e74190aa
	Namespace: snd
	Checksum: 0x48C1F4E1
	Offset: 0x5EA0
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function function_e74190aa(name)
{
	if(isdefined(self.var_3dc056c0) && isarray(self.var_3dc056c0) && isdefined(self.var_3dc056c0[name]))
	{
		return true;
	}
	return false;
}

/*
	Name: function_e94ea06d
	Namespace: snd
	Checksum: 0xBF35725F
	Offset: 0x5F00
	Size: 0xC0
	Parameters: 1
	Flags: None
*/
function function_e94ea06d(var_b90f380f)
{
	if(isdefined(self.var_3dc056c0) && isarray(self.var_3dc056c0))
	{
		foreach(p in self.var_3dc056c0)
		{
			if(p.var_b90f380f == var_b90f380f)
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: function_c0e3d9aa
	Namespace: snd
	Checksum: 0x51231696
	Offset: 0x5FC8
	Size: 0x122
	Parameters: 1
	Flags: None
*/
function function_c0e3d9aa(userdata)
{
	/#
		assert(isdefined(self.origin));
	#/
	now = gettime();
	if(isdefined(self.origin_velocity_time) && self.origin_velocity_time == now)
	{
		/#
			assert(isdefined(self.origin_velocity));
		#/
		return self.origin_velocity;
	}
	if(isdefined(self.origin_last) == 0)
	{
		self.origin_last = self.origin;
	}
	if(isentity(self))
	{
		self.origin_velocity = 0.01666667 * self getvelocity();
	}
	else
	{
		self.origin_velocity = self.origin - self.origin_last;
	}
	self.origin_velocity_time = now;
	self.origin_last = self.origin;
	return self.origin_velocity;
}

/*
	Name: function_8764d0b2
	Namespace: snd
	Checksum: 0x776608C3
	Offset: 0x60F8
	Size: 0x282
	Parameters: 1
	Flags: None
*/
function function_8764d0b2(userdata)
{
	/#
		assert(isdefined(self.origin));
	#/
	velocity = self function_c0e3d9aa();
	self.var_e6d478c5 = length(velocity);
	/#
		if(function_95c9af4b() >= 2)
		{
			var_8340e682 = self.var_e6d478c5;
			if(var_8340e682 < 0.001)
			{
				var_8340e682 = 0;
			}
			var_38f9ec40 = ((function_d6053a8f((var_8340e682 * function_869cb8c6()) * 0.05681818, 1)) + "") + function_d6053a8f(var_8340e682, 1) + "";
			debugcolor = getdvarvector(#"hash_3b9f89c8082a9915", (1, 1, 1));
			var_7afd95ae = 0.9;
			var_74500ef = var_7afd95ae * var_7afd95ae;
			var_c75cd11f = getdvarfloat(#"hash_182296346d138cf8");
			colorscale = getdvarfloat(#"hash_3944b771315157c1", 1);
			debugcolor = function_2677a7e2(debugcolor, colorscale * 10);
			var_5383e446 = 1;
			var_8764e9e6 = (0, 0, (4 * var_c75cd11f) * 24);
			function_ac033c46(var_38f9ec40, self.origin + var_8764e9e6, -1 * var_c75cd11f, "", debugcolor, var_7afd95ae, (0, 0, 0), var_74500ef, (1, 1, 1), var_74500ef, var_5383e446);
		}
	#/
	return self.var_e6d478c5;
}

/*
	Name: function_29584494
	Namespace: snd
	Checksum: 0xFE58066
	Offset: 0x6388
	Size: 0x1F2
	Parameters: 1
	Flags: None
*/
function function_29584494(userdata)
{
	/#
		assert(isdefined(self.angles));
	#/
	now = gettime();
	if(isdefined(self.var_9254021f) && self.var_9254021f == now)
	{
		/#
			assert(isdefined(self.var_c60cbb0f));
		#/
		return self.var_c60cbb0f;
	}
	angles = self.angles;
	if(function_e3a36342(self))
	{
		angles = self function_3d31768f();
	}
	else if(isdefined(self.model))
	{
		hastag = 0;
		if(hastag == 0)
		{
			angles = self gettagangles("tag_origin");
		}
	}
	if(angles[0] > 180)
	{
		angles = angles - vectorscale((1, 0, 0), 360);
	}
	if(angles[1] > 180)
	{
		angles = angles - vectorscale((0, 1, 0), 360);
	}
	if(angles[2] > 180)
	{
		angles = angles - vectorscale((0, 0, 1), 360);
	}
	if(isdefined(self.var_c60cbb0f) == 0)
	{
		self.var_c60cbb0f = angles;
	}
	if(isdefined(self.var_7ebe209e) == 0)
	{
		self.var_7ebe209e = angles;
	}
	self.var_7ebe209e = self.var_c60cbb0f;
	self.var_c60cbb0f = angles;
	return self.var_c60cbb0f;
}

/*
	Name: function_cf6a940f
	Namespace: snd
	Checksum: 0xC351E7E5
	Offset: 0x6588
	Size: 0x4E
	Parameters: 1
	Flags: None
*/
function function_cf6a940f(userdata)
{
	angles = function_29584494(userdata);
	self.var_1536fabb = angles - self.var_7ebe209e;
	return self.var_1536fabb;
}

/*
	Name: function_cebd7215
	Namespace: snd
	Checksum: 0x280570E3
	Offset: 0x65E0
	Size: 0x8C
	Parameters: 3
	Flags: Private
*/
function private function_cebd7215(var_67f427c4, var_99e65ecf, var_358f1599)
{
	var_67f427c4.snd = play(var_67f427c4.soundalias, var_67f427c4.target);
	function_db78159d(var_67f427c4.snd, var_99e65ecf, 0);
	set_pitch(var_67f427c4.snd, var_358f1599, 0);
}

/*
	Name: function_a3ee9bec
	Namespace: snd
	Checksum: 0xBBA085B7
	Offset: 0x6678
	Size: 0xE6
	Parameters: 3
	Flags: Private
*/
function private function_a3ee9bec(var_67f427c4, fadetime, var_a1c636fb)
{
	if(isdefined(var_67f427c4) && isdefined(var_67f427c4.snd))
	{
		fadetime = function_ea2f17d1(fadetime, 0);
		var_a1c636fb = function_ea2f17d1(var_a1c636fb, "easeinout");
		if(isdefined(fadetime) == 1 && fadetime > 0)
		{
			function_db78159d(var_67f427c4.snd, 0, fadetime, var_a1c636fb);
			wait(fadetime);
		}
		stop(var_67f427c4.snd);
		var_67f427c4.snd = undefined;
	}
}

/*
	Name: function_a04fdd
	Namespace: snd
	Checksum: 0x102A1118
	Offset: 0x6768
	Size: 0x37A
	Parameters: 2
	Flags: Private
*/
function private function_a04fdd(var_e9082dc0, userdata)
{
	speed = var_e9082dc0;
	v = userdata;
	if(speed < 0.01)
	{
		speed = 0;
	}
	var_53970876 = v.var_4da05e4e[#"speed"][0];
	var_56df0922 = v.var_4da05e4e[#"speed"][1];
	var_29305831 = v.var_4da05e4e[#"scale"][0];
	var_2b905459 = v.var_4da05e4e[#"scale"][1];
	var_bf018221 = v.var_4da05e4e[#"curve"][0];
	var_96fa4b31 = v.var_5c76982f[#"speed"][0];
	var_8d892f33 = v.var_5c76982f[#"speed"][1];
	var_f670290f = v.var_5c76982f[#"scale"][0];
	var_2f163596 = v.var_5c76982f[#"scale"][1];
	var_ede9da4b = v.var_5c76982f[#"curve"][0];
	volume = function_a0a15145(speed, var_53970876, var_56df0922, var_29305831, var_2b905459);
	pitch = function_a0a15145(speed, var_96fa4b31, var_8d892f33, var_f670290f, var_2f163596);
	if(isdefined(v.snd) == 1 && volume <= 0.001)
	{
		self thread function_a3ee9bec(v);
		return;
	}
	if(isdefined(v.snd) == 0 && volume > 0.001)
	{
		function_cebd7215(v, volume, pitch);
		v.var_ca7e4f27 = speed;
		return;
	}
	if(isdefined(v.snd) && isdefined(v.var_ca7e4f27))
	{
		var_7ea23e3e = abs(speed - v.var_ca7e4f27);
		if(var_7ea23e3e > 0.01)
		{
			function_db78159d(v.snd, volume, 0.05, var_bf018221);
			set_pitch(v.snd, pitch, 0.05, var_ede9da4b);
			v.var_ca7e4f27 = speed;
		}
	}
}

/*
	Name: function_caa62515
	Namespace: snd
	Checksum: 0xAC853DB4
	Offset: 0x6AF0
	Size: 0xEA
	Parameters: 1
	Flags: Private
*/
function private function_caa62515(userdata)
{
	fadeout = self.var_f2acbf06;
	var_df32d049 = self.var_436e97ed;
	if(isdefined(userdata) == 1)
	{
		foreach(v in userdata)
		{
			self thread function_a3ee9bec(v, fadeout, var_df32d049);
		}
	}
	self.var_a21eb7f9 = undefined;
	self.var_f2acbf06 = undefined;
	self.var_436e97ed = undefined;
	self.var_1ab997d2 = undefined;
}

/*
	Name: function_ebe7010d
	Namespace: snd
	Checksum: 0xFD2BD7B9
	Offset: 0x6BE8
	Size: 0x344
	Parameters: 4
	Flags: Private
*/
function private function_ebe7010d(target, soundalias, var_5c76982f, var_4da05e4e)
{
	ent = undefined;
	islooping = soundislooping(soundalias);
	if(!isarray(target))
	{
		ent = target;
	}
	else if(target.size > 0)
	{
		ent = target[0];
	}
	if(function_81fac19d(!isentity(ent), "snd_speed: target entity not found!"))
	{
		return;
	}
	if(function_81fac19d(!isdefined(islooping), ("snd_speed: alias " + function_783b69(soundalias, "'")) + " does not exist!"))
	{
		return;
	}
	if(function_81fac19d(!is_true(islooping), ("snd_speed: alias " + function_783b69(soundalias, "'")) + " is not looping!"))
	{
		return;
	}
	if(function_81fac19d(!isarray(var_5c76982f), "snd_speed: pitchDict is not an array!"))
	{
		return;
	}
	if(function_81fac19d(!isarray(var_4da05e4e), "snd_speed: volumeDict is not an array!"))
	{
		return;
	}
	var_67f427c4 = spawnstruct();
	var_67f427c4.soundalias = soundalias;
	var_67f427c4.target = target;
	var_67f427c4.var_5c76982f = var_5c76982f;
	var_67f427c4.var_4da05e4e = var_4da05e4e;
	var_67f427c4.var_5c76982f[#"curve"] = function_ea2f17d1(var_67f427c4.var_5c76982f[#"curve"], [0:"linear"]);
	var_67f427c4.var_4da05e4e[#"curve"] = function_ea2f17d1(var_67f427c4.var_4da05e4e[#"curve"], [0:"xfade"]);
	ent.var_1ab997d2 = function_ea2f17d1(ent.var_1ab997d2, array());
	ent.var_1ab997d2[ent.var_1ab997d2.size] = var_67f427c4;
	ent function_3e356217("speed", undefined, &function_8764d0b2, &function_a04fdd, &function_caa62515, var_67f427c4);
}

/*
	Name: function_c332cdba
	Namespace: snd
	Checksum: 0xA141C0A3
	Offset: 0x6F38
	Size: 0x9C
	Parameters: 3
	Flags: None
*/
function function_c332cdba(target, fadeout, var_df32d049)
{
	fadeout = function_ea2f17d1(fadeout, 0.05);
	var_df32d049 = function_ea2f17d1(var_df32d049, "easeinout");
	target.var_a21eb7f9 = 1;
	target.var_f2acbf06 = fadeout;
	target.var_436e97ed = var_df32d049;
	target function_79d9c57d("speed");
}

/*
	Name: speed
	Namespace: snd
	Checksum: 0xF6E2AB16
	Offset: 0x6FE0
	Size: 0x44
	Parameters: 4
	Flags: None
*/
function speed(target, alias, var_5c76982f, var_4da05e4e)
{
	level thread function_ebe7010d(target, alias, var_5c76982f, var_4da05e4e);
}

/*
	Name: function_d6d4a5d8
	Namespace: snd
	Checksum: 0x4E1EC87A
	Offset: 0x7030
	Size: 0x378
	Parameters: 7
	Flags: None
*/
function function_d6d4a5d8(var_86bf21bc, var_72585589, var_c5abb52c, var_538ddc9c, var_683a408d, var_d03e56e8, var_2982cf88)
{
	/#
		assert(isvec(var_86bf21bc));
	#/
	/#
		assert(isvec(var_72585589));
	#/
	/#
		assert(isvec(var_538ddc9c));
	#/
	/#
		assert(isvec(var_683a408d));
	#/
	var_c5abb52c = function_ea2f17d1(var_c5abb52c, 1);
	var_d03e56e8 = function_ea2f17d1(var_d03e56e8, 1);
	var_2982cf88 = function_ea2f17d1(var_2982cf88, 343.3);
	if(var_c5abb52c == 0 && var_d03e56e8 == 0 || var_2982cf88 == 0)
	{
		return [2:0, 1:0, 0:0];
	}
	var_ec47cb08 = float(var_2982cf88) * 39.37008;
	/#
		assert(isnumber(var_c5abb52c));
	#/
	/#
		assert(isnumber(var_d03e56e8));
	#/
	/#
		assert(isnumber(var_ec47cb08));
	#/
	var_452d5766 = var_86bf21bc - var_538ddc9c;
	len = length(var_452d5766);
	var_2c6a3dcc = 0;
	var_3619eb04 = 0;
	if(var_c5abb52c > 0 && var_72585589 != (0, 0, 0))
	{
		var_2c6a3dcc = vectordot(var_72585589, var_452d5766) / len;
		var_2c6a3dcc = var_2c6a3dcc * var_c5abb52c;
	}
	if(var_d03e56e8 > 0 && var_683a408d != (0, 0, 0))
	{
		var_3619eb04 = vectordot(var_683a408d, var_452d5766) / len;
		var_3619eb04 = var_3619eb04 * var_d03e56e8;
	}
	var_bcf5dfcc = (var_ec47cb08 - var_2c6a3dcc) / (var_ec47cb08 - var_3619eb04);
	return [2:var_3619eb04, 1:var_2c6a3dcc, 0:var_bcf5dfcc];
}

/*
	Name: function_6486ffc7
	Namespace: snd
	Checksum: 0x80F724D1
	Offset: 0x73B0
	Size: 0x4
	Parameters: 0
	Flags: Private
*/
function private function_6486ffc7()
{
}

/*
	Name: function_ea96deb8
	Namespace: snd
	Checksum: 0xE881A701
	Offset: 0x73C0
	Size: 0x1B8
	Parameters: 1
	Flags: Private
*/
function private function_ea96deb8(userdata)
{
	var_78c4228e = arraycopy(level.var_ba9b4ed);
	var_e309e90d = 0;
	var_8b774403 = [];
	arrayremovevalue(var_78c4228e, self, 1);
	foreach(var_b05cf605 in var_78c4228e)
	{
		if(var_b05cf605 function_e74190aa("doppler"))
		{
			var_e309e90d = var_e309e90d + 1;
			if(function_e3a36342(var_b05cf605))
			{
				var_8b774403[var_8b774403.size] = var_b05cf605;
			}
		}
	}
	if(var_e309e90d == var_8b774403.size)
	{
		foreach(player in var_8b774403)
		{
			player function_79d9c57d("doppler");
		}
	}
}

/*
	Name: function_344f3a4a
	Namespace: snd
	Checksum: 0x2EF59C4E
	Offset: 0x7580
	Size: 0x5DC
	Parameters: 2
	Flags: Private
*/
function private function_344f3a4a(var_e9082dc0, userdata)
{
	player = userdata;
	if(!function_e3a36342(player))
	{
		return;
	}
	/#
		assert(isdefined(player));
	#/
	/#
		assert(isdefined(player.var_9dad7949));
	#/
	/#
		assert(isdefined(self));
	#/
	/#
		assert(isdefined(self.var_9dad7949));
	#/
	/#
		assert(isdefined(self.var_9dad7949.scale));
	#/
	/#
		assert(isdefined(self.var_9dad7949.var_e8950a23));
	#/
	var_86bf21bc = self.origin;
	var_72585589 = var_e9082dc0;
	var_c5abb52c = self.var_9dad7949.scale;
	var_538ddc9c = player function_efda2d6d();
	var_683a408d = player function_e6dfc446("doppler");
	var_d03e56e8 = self.var_9dad7949.var_e8950a23;
	if(isdefined(var_683a408d) == 0 || self.var_9dad7949.var_e8950a23 == 0)
	{
		var_683a408d = (0, 0, 0);
	}
	/#
		assert(isvec(var_86bf21bc));
	#/
	/#
		assert(isvec(var_72585589));
	#/
	/#
		assert(isnumber(var_c5abb52c));
	#/
	/#
		assert(isvec(var_538ddc9c));
	#/
	/#
		assert(isvec(var_683a408d));
	#/
	/#
		assert(isnumber(var_d03e56e8));
	#/
	var_c9ea7ee3 = function_d6d4a5d8(var_86bf21bc, var_72585589, var_c5abb52c, var_538ddc9c, var_683a408d, var_d03e56e8);
	var_bcf5dfcc = var_c9ea7ee3[0];
	if(isdefined(self.var_9dad7949.pitchscale))
	{
		var_bcf5dfcc = var_bcf5dfcc * self.var_9dad7949.pitchscale;
	}
	var_bcf5dfcc = math::clamp(var_bcf5dfcc, 0.01, 2);
	set_pitch(self, var_bcf5dfcc, function_6cfa7975());
	/#
		if(function_95c9af4b() > 1)
		{
			var_c75cd11f = getdvarfloat(#"hash_182296346d138cf8");
			var_57cfcf52 = getdvarvector(#"hash_3b9f89c8082a9915", (1, 1, 1));
			colorscale = getdvarfloat(#"hash_3944b771315157c1", 1);
			var_ff7397dc = function_2677a7e2(var_57cfcf52, colorscale * 10);
			var_6a1e7792 = var_c9ea7ee3[1];
			dist = distance(var_86bf21bc, var_538ddc9c);
			var_7295dcac = dist * 0.002;
			scale = (var_c75cd11f * 0.666) * var_7295dcac;
			alpha = 1;
			var_8b9208e = alpha * alpha;
			var_c730c816 = "";
			var_f7bf2aa1 = (var_bcf5dfcc + "") + var_6a1e7792;
			function_ac033c46(var_c730c816, var_86bf21bc + (0, 0, -1 * scale * 24), scale, "", var_ff7397dc, alpha, (0, 0, 0), var_8b9208e, (1, 1, 1), var_8b9208e, 1);
			function_ac033c46(var_f7bf2aa1, var_86bf21bc + (0, 0, -1 * scale * 24), scale, "", var_ff7397dc, alpha, (0, 0, 0), var_8b9208e, (1, 1, 1), var_8b9208e, 1);
		}
	#/
}

/*
	Name: _snd_doppler_main
	Namespace: snd
	Checksum: 0x5F19FE45
	Offset: 0x7B68
	Size: 0x20C
	Parameters: 4
	Flags: Private
*/
function private _snd_doppler_main(player, var_bcf5dfcc, pitchscale, var_a47261d3)
{
	/#
		assert(function_e3a36342(player));
	#/
	var_bcf5dfcc = function_ea2f17d1(var_bcf5dfcc, 1);
	pitchscale = function_ea2f17d1(pitchscale, 1);
	var_a47261d3 = function_ea2f17d1(var_a47261d3, 1);
	/#
		assert(isdefined(player));
	#/
	if(isdefined(player.var_9dad7949) == 0)
	{
		player.var_9dad7949 = spawnstruct();
	}
	if(var_a47261d3 > 0)
	{
		player function_3e356217("doppler", undefined, &function_c0e3d9aa);
	}
	if(function_3132f113(self))
	{
		return;
	}
	while(isdefined(self.soundalias) == 0)
	{
		waitframe(1);
	}
	self.var_9dad7949 = spawnstruct();
	self.var_9dad7949.scale = var_bcf5dfcc;
	self.var_9dad7949.pitchscale = pitchscale;
	self.var_9dad7949.var_e8950a23 = var_a47261d3;
	self function_3e356217("doppler", undefined, &function_c0e3d9aa, &function_344f3a4a, &function_ea96deb8, player);
}

/*
	Name: doppler
	Namespace: snd
	Checksum: 0x7E9CD87A
	Offset: 0x7D80
	Size: 0xE8
	Parameters: 5
	Flags: None
*/
function doppler(var_afe43979, player, var_bcf5dfcc, pitchscale, var_a47261d3)
{
	if(function_81fac19d(isdefined(var_afe43979) == 0, "snd_doppler with undefined soundObject"))
	{
		return;
	}
	foreach(var_d7ba9fdf in function_f218bff5(var_afe43979))
	{
		var_d7ba9fdf thread _snd_doppler_main(player, var_bcf5dfcc, pitchscale, var_a47261d3);
	}
}

/*
	Name: function_b9f3bee9
	Namespace: snd
	Checksum: 0xC9763BF4
	Offset: 0x7E70
	Size: 0xC0
	Parameters: 1
	Flags: None
*/
function function_b9f3bee9(var_afe43979)
{
	if(function_81fac19d(isdefined(var_afe43979) == 0, "snd_doppler_stop with undefined soundObject"))
	{
		return;
	}
	foreach(var_d7ba9fdf in function_f218bff5(var_afe43979))
	{
		var_d7ba9fdf function_ea96deb8();
	}
}

/*
	Name: function_bdd32fcc
	Namespace: snd
	Checksum: 0x7CBB12D3
	Offset: 0x7F38
	Size: 0xFA
	Parameters: 0
	Flags: None
*/
function function_bdd32fcc()
{
	skiptos = getskiptos();
	/#
		assert(isstring(skiptos));
	#/
	skiptos = tolower(skiptos);
	skiptos = strtok(skiptos, ",");
	skipto = "";
	if(isarray(skiptos))
	{
		if(skiptos.size >= 1)
		{
			skipto = skiptos[0] + "";
		}
	}
	else if(isstring(skiptos))
	{
		skipto = skiptos;
	}
	return skipto;
}

/*
	Name: function_c2ddd53f
	Namespace: snd
	Checksum: 0xA0AF727A
	Offset: 0x8040
	Size: 0x152
	Parameters: 1
	Flags: Private
*/
function private function_c2ddd53f(callback)
{
	level notify(#"hash_163618840778df8c");
	level endon(#"hash_163618840778df8c");
	level endon(#"game_ended");
	/#
		assert(isscriptfunctionptr(callback));
	#/
	waitforplayers();
	while(true)
	{
		skipto = function_bdd32fcc();
		if(skipto != "")
		{
			break;
		}
		waitframe(1);
	}
	waittillframeend();
	objectives = [];
	while(true)
	{
		skipto = function_bdd32fcc();
		if(skipto == "")
		{
		}
		else if(!isdefined(objectives[skipto]))
		{
			level thread [[callback]](skipto);
			objectives[skipto] = 1;
		}
		level waittill(#"objective_changed");
		waittillframeend();
	}
}

/*
	Name: skipto_init
	Namespace: snd
	Checksum: 0x6A1960A1
	Offset: 0x81A0
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function skipto_init(callback)
{
	level thread function_c2ddd53f(callback);
}

/*
	Name: function_c66d3ce2
	Namespace: snd
	Checksum: 0x928F077B
	Offset: 0x81D0
	Size: 0xBC
	Parameters: 2
	Flags: Private
*/
function private function_c66d3ce2(trigger, player)
{
	istouching = 0;
	if(function_e3a36342(player))
	{
		if(isentity(trigger))
		{
			istouching = player istouching(trigger);
		}
		else if(trigger == level)
		{
			if(!isdefined(player.var_9a8a4923) || (isdefined(player.var_9a8a4923) && player.var_9a8a4923 == level))
			{
				istouching = 1;
			}
		}
	}
	return istouching;
}

/*
	Name: function_9588abe4
	Namespace: snd
	Checksum: 0x5B486186
	Offset: 0x8298
	Size: 0xBC
	Parameters: 0
	Flags: Private
*/
function private function_9588abe4()
{
	waitforplayers();
	waitframe(3);
	waittillframeend();
	foreach(player in function_2b2b83dc())
	{
		level notify(#"trigger", {#activator:player});
	}
}

/*
	Name: function_78013c7e
	Namespace: snd
	Checksum: 0xD74C8763
	Offset: 0x8360
	Size: 0x494
	Parameters: 1
	Flags: Private
*/
function private function_78013c7e(callback)
{
	level endon(#"game_ended");
	self endon(#"death");
	var_524d6318 = [0:level];
	trigger = self;
	/#
		assert(isdefined(trigger));
	#/
	while(true)
	{
		waitresult = undefined;
		waitresult = trigger waittill(#"trigger");
		player = waitresult.activator;
		istouching = function_c66d3ce2(trigger, player);
		if(istouching)
		{
			player.var_a1d98d00 = function_ea2f17d1(player.var_a1d98d00, var_524d6318);
			/#
				/#
					assert(isarray(player.var_a1d98d00) && isdefined(player.var_a1d98d00[0]) && player.var_a1d98d00[0] == level);
				#/
			#/
			if(trigger != level)
			{
				player.var_a1d98d00[player.var_a1d98d00.size] = trigger;
			}
			var_cecadbd0 = isdefined(player.var_9a8a4923.script_ambientpriority) && isdefined(trigger.script_ambientpriority);
			var_a4243a33 = var_cecadbd0 && int(player.var_9a8a4923.script_ambientpriority) <= int(trigger.script_ambientpriority);
			if(!isdefined(player.var_9a8a4923) || (var_cecadbd0 && var_a4243a33) || !var_cecadbd0)
			{
				player.var_9a8a4923 = trigger;
				trigger thread [[callback]](player, trigger, 1);
			}
			while(istouching)
			{
				istouching = function_c66d3ce2(trigger, player);
				waitframe(1);
			}
			if(!isdefined(player))
			{
				continue;
			}
			if(trigger != level)
			{
				arrayremovevalue(player.var_a1d98d00, trigger, 0);
			}
			if(player.var_9a8a4923 == trigger)
			{
				next_trigger = undefined;
				if(var_cecadbd0)
				{
					next_trigger = level;
					var_c0aa1fe7 = -1;
					for(i = player.var_a1d98d00.size - 1; i > 0; i--)
					{
						var_c41f0300 = player.var_a1d98d00[i];
						if(isdefined(var_c41f0300.script_ambientpriority))
						{
							var_271728fd = int(var_c41f0300.script_ambientpriority);
							if(var_271728fd > var_c0aa1fe7)
							{
								next_trigger = var_c41f0300;
								var_c0aa1fe7 = var_271728fd;
							}
						}
					}
				}
				else
				{
					/#
						assert(player.var_a1d98d00.size > 0);
					#/
					/#
					#/
					index = player.var_a1d98d00.size - 1;
					/#
						/#
							assert(index >= 0);
						#/
					#/
					next_trigger = player.var_a1d98d00[index];
				}
				if(isdefined(next_trigger))
				{
					player.var_9a8a4923 = next_trigger;
					next_trigger thread [[callback]](player, next_trigger, 0);
				}
				else
				{
					player.var_9a8a4923 = undefined;
					level notify(#"trigger", {#activator:player});
				}
			}
		}
	}
}

/*
	Name: function_a1961886
	Namespace: snd
	Checksum: 0xFF4ACC57
	Offset: 0x8800
	Size: 0x1E4
	Parameters: 3
	Flags: None
*/
function function_a1961886(callback, name, key)
{
	name = function_ea2f17d1(name, "ambient_package");
	key = function_ea2f17d1(key, "targetname");
	triggers = array(level);
	var_fea8faf7 = undefined;
	if(is_true(level.var_17e6189d.var_2dd09170))
	{
		var_fea8faf7 = getentarray(name, key);
	}
	else if(is_true(level.var_17e6189d.var_8c37ff34))
	{
		var_fea8faf7 = getentarray(0, name, key);
	}
	if(isarray(var_fea8faf7))
	{
		triggers = arraycombine(triggers, var_fea8faf7);
	}
	foreach(trigger in function_f218bff5(triggers))
	{
		trigger thread function_78013c7e(callback);
	}
	level thread function_9588abe4();
}

/*
	Name: function_b4de7637
	Namespace: snd
	Checksum: 0x67361A11
	Offset: 0x89F0
	Size: 0x220
	Parameters: 2
	Flags: None
*/
function function_b4de7637(name, elements)
{
	/#
		assert(function_4e1ee82e());
	#/
	var_ce0e8448 = isstring(name);
	var_a718b5db = isarray(elements) && elements.size > 0 && isarray(elements[0]);
	var_505293ad = isarray(elements) && elements.size >= 3 && isstring(elements[0]);
	var_8314d62 = isstring(elements);
	var_f7816d0b = var_ce0e8448 && (var_a718b5db || var_505293ad || var_8314d62);
	if(function_81fac19d(!var_f7816d0b, "snd: element_init invalid"))
	{
		/#
			if(function_f984063f())
			{
				debugbreak();
			}
		#/
	}
	if(var_8314d62 && !isdefined(level.var_17e6189d.var_9353c9dd[elements]))
	{
		/#
			if(function_f984063f())
			{
				debugbreak();
			}
		#/
	}
	if(var_505293ad)
	{
		elements = [0:elements];
	}
	level.var_17e6189d.var_9353c9dd[name] = elements;
}

/*
	Name: function_50601e7c
	Namespace: snd
	Checksum: 0x7D9980C0
	Offset: 0x8C18
	Size: 0xD8
	Parameters: 1
	Flags: None
*/
function function_50601e7c(element)
{
	if(isstring(element))
	{
		var_4f8ae73f = level.var_17e6189d.var_9353c9dd[element];
		var_36fc3b04 = isarray(var_4f8ae73f);
		var_e3ac0560 = isstring(var_4f8ae73f);
		if(var_36fc3b04)
		{
			return element;
		}
		if(var_e3ac0560 && isarray(level.var_17e6189d.var_9353c9dd[var_4f8ae73f]))
		{
			return var_4f8ae73f;
		}
	}
	return undefined;
}

/*
	Name: function_74c0fa84
	Namespace: snd
	Checksum: 0xB9695461
	Offset: 0x8CF8
	Size: 0xAE
	Parameters: 1
	Flags: None
*/
function function_74c0fa84(element)
{
	if(isarray(element))
	{
		return element;
	}
	if(isstring(element))
	{
		element = function_50601e7c(element);
		var_4f8ae73f = level.var_17e6189d.var_9353c9dd[element];
		var_a2dc2648 = isarray(var_4f8ae73f);
		if(var_a2dc2648)
		{
			return var_4f8ae73f;
		}
	}
	return undefined;
}

/*
	Name: function_645c2f9b
	Namespace: snd
	Checksum: 0xEF3CAA53
	Offset: 0x8DB0
	Size: 0x404
	Parameters: 2
	Flags: None
*/
function function_645c2f9b(player, element)
{
	isplayervalid = function_e3a36342(player);
	if(function_81fac19d(!isplayervalid, "snd: set_element invalid player"))
	{
		return;
	}
	var_a2dc2648 = isarray(element);
	var_8314d62 = isstring(element);
	var_c78e3536 = !isdefined(element);
	var_f7816d0b = var_a2dc2648 || var_8314d62 || var_c78e3536;
	if(function_81fac19d(!var_f7816d0b, "snd: set_element invalid element"))
	{
		return;
	}
	if(var_a2dc2648)
	{
		player.var_c0ee07ef = "**** custom ****";
	}
	else if(var_8314d62)
	{
		current = function_50601e7c(player.var_c0ee07ef);
		var_96f3d229 = function_50601e7c(element);
		var_26a5d170 = isstring(current) && isstring(var_96f3d229) && current == var_96f3d229;
		player.var_c0ee07ef = element;
		if(var_26a5d170)
		{
			return;
		}
	}
	if(isplayervalid && isarray(player.var_c6206b8b))
	{
		stop(player.var_c6206b8b);
		player.var_c6206b8b = undefined;
	}
	if(var_c78e3536)
	{
		player.var_c0ee07ef = undefined;
		return;
	}
	elements = function_74c0fa84(element);
	var_a718b5db = isarray(elements);
	if(function_81fac19d(!var_a718b5db, "snd: set_element unexpected"))
	{
		return;
	}
	/#
		assert(isplayervalid);
	#/
	/#
		assert(var_a718b5db);
	#/
	player.var_c6206b8b = array();
	foreach(e in elements)
	{
		alias = e[0];
		target = function_ea2f17d1(e[1], player);
		spawntime = e[2];
		var_6c6d0c21 = e[3];
		rotation = e[4];
		elevation = e[5];
		var_804d5d55 = emitter(alias, target, spawntime, var_6c6d0c21, rotation, elevation);
		if(isdefined(var_804d5d55))
		{
			player.var_c6206b8b[player.var_c6206b8b.size] = var_804d5d55;
		}
	}
}

/*
	Name: function_2fc1b3a7
	Namespace: snd
	Checksum: 0x725698B0
	Offset: 0x91C0
	Size: 0x336
	Parameters: 4
	Flags: Private
*/
function private function_2fc1b3a7(var_afe43979, player, var_8b0894e2, org_end)
{
	/#
		assert(function_a6779cbd(var_afe43979));
	#/
	var_afe43979 endon(#"death");
	var_afe43979 notify(#"hash_20f2dfe33da3f037");
	var_afe43979 endon(#"hash_20f2dfe33da3f037");
	while(function_e3a36342(player) && function_a6779cbd(var_afe43979))
	{
		var_fdf21d4f = player function_efda2d6d();
		org = pointonsegmentnearesttopoint(var_8b0894e2, org_end, var_fdf21d4f);
		var_afe43979.origin = org;
		/#
			if(function_95c9af4b() > 1)
			{
				var_97475451 = (0.97254, 0.72974, 0.72974);
				var_d7fd5061 = (0.72974, 0.97254, 0.72974);
				var_9b68d40d = (0.72974, 0.72974, 0.97254);
				line(var_8b0894e2, org_end, var_97475451, 1, 0, 1);
				var_ffa6d585 = vectortoangles(org_end - var_8b0894e2);
				var_f5ce500f = anglestoright(var_ffa6d585);
				var_e760c89c = anglestoup(var_ffa6d585);
				line(var_8b0894e2 - (var_f5ce500f * 24), var_8b0894e2 + (var_f5ce500f * 24), var_d7fd5061, 1, 0, 1);
				line(var_8b0894e2 - (var_e760c89c * 24), var_8b0894e2 + (var_e760c89c * 24), var_9b68d40d, 1, 0, 1);
				line(org_end - (var_f5ce500f * 24), org_end + (var_f5ce500f * 24), var_d7fd5061, 1, 0, 1);
				line(org_end - (var_e760c89c * 24), org_end + (var_e760c89c * 24), var_9b68d40d, 1, 0, 1);
			}
		#/
		waitframe(1);
	}
}

/*
	Name: function_39dae8d8
	Namespace: snd
	Checksum: 0x507A8504
	Offset: 0x9500
	Size: 0x64
	Parameters: 4
	Flags: None
*/
function function_39dae8d8(var_afe43979, player, var_8b0894e2, org_end)
{
	if(function_81fac19d(!isdefined(var_afe43979), "snd_line_attach with undefined soundObject"))
	{
		return;
	}
	var_afe43979 thread function_2fc1b3a7(var_afe43979, player, var_8b0894e2, org_end);
}

/*
	Name: function_ee110bf
	Namespace: snd
	Checksum: 0x160F872D
	Offset: 0x9570
	Size: 0x48
	Parameters: 1
	Flags: None
*/
function function_ee110bf(var_afe43979)
{
	if(function_81fac19d(!isdefined(var_afe43979), "snd_line_detach with undefined soundObject"))
	{
		return;
	}
	var_afe43979 notify(#"hash_20f2dfe33da3f037");
}

