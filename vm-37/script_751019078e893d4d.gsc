#using script_1cd690a97dfca36e;
#using script_28e27ee9b45fd02d;
#using script_31671175564a93b7;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\util_shared.csc;

#namespace snd;

/*
	Name: function_8f9218ba
	Namespace: snd
	Checksum: 0x7C27624F
	Offset: 0xA8
	Size: 0x1CC
	Parameters: 1
	Flags: Private
*/
function private function_8f9218ba(hud)
{
	/#
		if(isdefined(hud.var_ca1ec566))
		{
			function_e23ba9aa(0, hud.var_ca1ec566, hud.var_708cbe39, "", hud.var_28f96332, hud.var_685ce76a);
			value = function_ea2f17d1(hud.value, 0);
			if(isdefined(value) && value > 0)
			{
				var_f7e32ef3 = hud.var_708cbe39 + (-2 * 2, -2 * 2, 0);
				var_dfa6f0d0 = hud.var_ca1ec566 + (2, 2, 0);
				if(hud.var_b1332cff == 1)
				{
					var_dfa6f0d0 = hud.var_ca1ec566 + (2, 2 + var_f7e32ef3[1], 0);
					var_f7e32ef3 = (var_f7e32ef3[0], var_f7e32ef3[1] * value, var_f7e32ef3[2]);
					var_dfa6f0d0 = var_dfa6f0d0 - (0, var_f7e32ef3[1], 0);
				}
				else
				{
					var_f7e32ef3 = (var_f7e32ef3[0] * value, var_f7e32ef3[1], var_f7e32ef3[2]);
				}
				function_e23ba9aa(0, var_dfa6f0d0, var_f7e32ef3, "", hud.var_4a70ec60, hud.var_e2c0fdcb);
			}
		}
	#/
}

/*
	Name: function_20b6bc92
	Namespace: snd
	Checksum: 0xBD05A0F4
	Offset: 0x280
	Size: 0x182
	Parameters: 0
	Flags: Private
*/
function private function_20b6bc92()
{
	/#
		assert(isdefined(level.var_a00c303b), "");
	#/
	level notify(#"hash_20f3988ee2416a3d");
	level endon(#"hash_20f3988ee2416a3d");
	level.var_a00c303b.var_43f854c3 = 1;
	while(isdefined(level.var_a00c303b))
	{
		foreach(var_dfd5412c in level.var_a00c303b.objects)
		{
			if(isfunctionptr(var_dfd5412c.callbackfunc))
			{
				target = var_dfd5412c.target;
				value = [[var_dfd5412c.callbackfunc]](target, var_dfd5412c.var_8e530837, var_dfd5412c);
				function_fee448d5(var_dfd5412c, value);
			}
			/#
				function_8f9218ba(var_dfd5412c);
			#/
		}
		waitframe(1);
	}
}

/*
	Name: function_b009fcc9
	Namespace: snd
	Checksum: 0x7E87A1EB
	Offset: 0x410
	Size: 0x2D8
	Parameters: 12
	Flags: None
*/
function function_b009fcc9(x, y, w, h, target, callbackfunc, var_8e530837, var_b1332cff, var_48a7a4bd, backgroundalpha, var_a2dbe44f, var_6a3d8755)
{
	var_b1332cff = function_ea2f17d1(var_b1332cff, 0);
	var_48a7a4bd = function_ea2f17d1(var_48a7a4bd, vectorscale((1, 1, 1), 0.72974));
	backgroundalpha = function_ea2f17d1(backgroundalpha, 0.72974);
	var_a2dbe44f = function_ea2f17d1(var_a2dbe44f, (0, 1, 0));
	var_6a3d8755 = function_ea2f17d1(var_6a3d8755, 0.72974);
	var_dfd5412c = spawnstruct();
	var_dfd5412c.var_b1332cff = var_b1332cff;
	var_dfd5412c.var_36dfeb2e = array(x, y);
	var_dfd5412c.var_1734a02c = array(w, h);
	var_dfd5412c.var_ca1ec566 = (x, y, 0);
	var_dfd5412c.var_708cbe39 = (w, h, 0);
	var_dfd5412c.var_28f96332 = var_48a7a4bd;
	var_dfd5412c.var_685ce76a = backgroundalpha;
	var_dfd5412c.var_4a70ec60 = var_a2dbe44f;
	var_dfd5412c.var_e2c0fdcb = var_6a3d8755;
	var_dfd5412c.target = target;
	var_dfd5412c.callbackfunc = callbackfunc;
	var_dfd5412c.var_8e530837 = var_8e530837;
	var_dfd5412c.var_c53c088d = gettime();
	var_fc6c677b = "white";
	/#
		hud = undefined;
		var_dfd5412c.var_8c127264 = hud;
	#/
	var_dfd5412c.valuehud = undefined;
	if(!isdefined(level.var_a00c303b))
	{
		level.var_a00c303b = spawnstruct();
		level.var_a00c303b.objects = array();
	}
	level.var_a00c303b.objects[level.var_a00c303b.objects.size] = var_dfd5412c;
	if(!isdefined(level.var_a00c303b.var_43f854c3))
	{
		level.var_a00c303b thread function_20b6bc92();
	}
	return var_dfd5412c;
}

/*
	Name: function_9b4ec5ed
	Namespace: snd
	Checksum: 0x6BB10BE4
	Offset: 0x6F0
	Size: 0xA0
	Parameters: 1
	Flags: None
*/
function function_9b4ec5ed(var_dfd5412c)
{
	arrayremovevalue(level.var_a00c303b.objects, var_dfd5412c, 1);
	if(isdefined(var_dfd5412c.valuehud))
	{
		var_dfd5412c.valuehud = undefined;
	}
	if(isdefined(var_dfd5412c.var_8c127264))
	{
		var_dfd5412c.var_8c127264 = undefined;
	}
	if(level.var_a00c303b.objects.size == 0)
	{
		level.var_a00c303b = undefined;
		level notify(#"hash_20f3988ee2416a3d");
	}
}

/*
	Name: function_fee448d5
	Namespace: snd
	Checksum: 0x3AC24E7E
	Offset: 0x798
	Size: 0xC4
	Parameters: 2
	Flags: None
*/
function function_fee448d5(var_dfd5412c, value)
{
	now = gettime();
	if(isdefined(var_dfd5412c.var_c53c088d) && var_dfd5412c.var_c53c088d == now)
	{
		return;
	}
	value = math::clamp(float(value), 0, 1);
	var_dfd5412c.var_c53c088d = now;
	var_dfd5412c.value = value;
	if(value <= 0)
	{
		if(isdefined(var_dfd5412c.valuehud))
		{
			var_dfd5412c.valuehud = undefined;
		}
		return;
	}
}

