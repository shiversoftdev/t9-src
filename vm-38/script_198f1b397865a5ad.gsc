#using script_85cd2e9a28ea8a1;
#using script_5552bd756afee443;
#using script_3dc93ca9902a9cda;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_d16177a1;

/*
	Name: function_89bfb1ac
	Namespace: namespace_d16177a1
	Checksum: 0x48E684E9
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_89bfb1ac()
{
	level notify(-1596626498);
}

#namespace snd;

/*
	Name: function_20b6bc92
	Namespace: snd
	Checksum: 0x39DD4352
	Offset: 0xC8
	Size: 0x15A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_20b6bc92()
{
	/#
		assert(isdefined(level.var_a00c303b), "");
	#/
	level endon(#"hash_20f3988ee2416a3d");
	level.var_a00c303b.var_43f854c3 = 1;
	while(isdefined(level.var_a00c303b))
	{
		foreach(var_dfd5412c in level.var_a00c303b.objects)
		{
			if(isfunctionptr(var_dfd5412c.callbackfunc))
			{
				target = var_dfd5412c.target;
				value = [[var_dfd5412c.callbackfunc]](target, var_dfd5412c.callbackdata, var_dfd5412c);
				function_fee448d5(var_dfd5412c, value);
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_b009fcc9
	Namespace: snd
	Checksum: 0xBDB47914
	Offset: 0x230
	Size: 0x3F0
	Parameters: 12
	Flags: None
*/
function function_b009fcc9(x, y, w, h, target, callbackfunc, callbackdata, var_b1332cff, backgroundcolor, backgroundalpha, var_a2dbe44f, var_6a3d8755)
{
	var_b1332cff = function_ea2f17d1(var_b1332cff, 0);
	backgroundcolor = function_ea2f17d1(backgroundcolor, 0.72974);
	backgroundalpha = function_ea2f17d1(backgroundalpha, 0.72974);
	var_a2dbe44f = function_ea2f17d1(var_a2dbe44f, (0, 1, 0));
	var_6a3d8755 = function_ea2f17d1(var_6a3d8755, 0.72974);
	var_dfd5412c = spawnstruct();
	var_dfd5412c.var_b1332cff = var_b1332cff;
	var_dfd5412c.var_36dfeb2e = array(x, y);
	var_dfd5412c.var_1734a02c = array(w, h);
	var_dfd5412c.var_ca1ec566 = function_da7b7c0e(array(x, y));
	var_dfd5412c.var_708cbe39 = function_df9f894b(array(w, h));
	var_dfd5412c.var_4a70ec60 = var_a2dbe44f;
	var_dfd5412c.var_e2c0fdcb = var_6a3d8755;
	var_dfd5412c.target = target;
	var_dfd5412c.callbackfunc = callbackfunc;
	var_dfd5412c.callbackdata = callbackdata;
	var_dfd5412c.var_c53c088d = gettime();
	var_dfd5412c.var_ca1ec566 = array(var_dfd5412c.var_ca1ec566[0], var_dfd5412c.var_ca1ec566[1] - var_dfd5412c.var_708cbe39[1]);
	var_fc6c677b = "white";
	/#
		hud = newdebughudelem();
		hud.x = var_dfd5412c.var_ca1ec566[0];
		hud.y = var_dfd5412c.var_ca1ec566[1];
		hud.alignx = "";
		hud.color = backgroundcolor;
		hud.alpha = backgroundalpha;
		hud.foreground = 0;
		hud.sort = -1;
		hud setshader(var_fc6c677b, var_dfd5412c.var_708cbe39[0], var_dfd5412c.var_708cbe39[1]);
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
	Checksum: 0x2E4DD135
	Offset: 0x628
	Size: 0xE0
	Parameters: 1
	Flags: None
*/
function function_9b4ec5ed(var_dfd5412c)
{
	arrayremovevalue(level.var_a00c303b.objects, var_dfd5412c, 1);
	if(isdefined(var_dfd5412c.valuehud))
	{
		/#
			var_dfd5412c.valuehud destroy();
		#/
		var_dfd5412c.valuehud = undefined;
	}
	if(isdefined(var_dfd5412c.var_8c127264))
	{
		/#
			var_dfd5412c.var_8c127264 destroy();
		#/
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
	Checksum: 0xFB896ADC
	Offset: 0x710
	Size: 0x3FC
	Parameters: 2
	Flags: Linked
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
	if(value <= 0)
	{
		if(isdefined(var_dfd5412c.valuehud))
		{
			/#
				var_dfd5412c.valuehud destroy();
			#/
			var_dfd5412c.valuehud = undefined;
		}
		return;
	}
	var_ca1ec566 = array(var_dfd5412c.var_ca1ec566[0] + 1, var_dfd5412c.var_ca1ec566[1] + 1);
	var_708cbe39 = var_dfd5412c.var_708cbe39;
	if(var_dfd5412c.var_b1332cff == 1)
	{
		height = var_dfd5412c.var_708cbe39[1] - 2;
		height = height * value;
		var_708cbe39 = array(var_dfd5412c.var_708cbe39[0] - 2, int(ceil(height)));
		var_ca1ec566 = array(var_dfd5412c.var_ca1ec566[0] + 1, (int(var_dfd5412c.var_ca1ec566[1] + (var_dfd5412c.var_708cbe39[1] - var_708cbe39[1]))) - 1);
	}
	else
	{
		width = var_dfd5412c.var_708cbe39[0] - 2;
		width = width * value;
		var_708cbe39 = array(int(width), var_dfd5412c.var_708cbe39[1] - 2);
	}
	if(var_708cbe39[0] <= 0 || var_708cbe39[1] <= 0)
	{
		return;
	}
	if(!isdefined(var_dfd5412c.valuehud))
	{
		/#
			hud = newdebughudelem();
			var_dfd5412c.valuehud = hud;
		#/
	}
	/#
		assert(isdefined(var_dfd5412c.valuehud));
	#/
	if(isdefined(var_dfd5412c.valuehud))
	{
		var_fc6c677b = "white";
		/#
			var_dfd5412c.valuehud.x = var_ca1ec566[0];
			var_dfd5412c.valuehud.y = var_ca1ec566[1];
			var_dfd5412c.valuehud.alignx = "";
			var_dfd5412c.valuehud.color = var_dfd5412c.var_4a70ec60;
			var_dfd5412c.valuehud.alpha = var_dfd5412c.var_e2c0fdcb;
			var_dfd5412c.valuehud.foreground = 0;
			var_dfd5412c.valuehud.sort = 1;
			var_dfd5412c.valuehud setshader(var_fc6c677b, var_708cbe39[0], var_708cbe39[1]);
		#/
	}
}

/*
	Name: function_ef6f1667
	Namespace: snd
	Checksum: 0x96C05EE1
	Offset: 0xB18
	Size: 0x1C2
	Parameters: 0
	Flags: Linked, Private
*/
function private function_ef6f1667()
{
	if(isdefined(level.var_25a33bf1) == 1)
	{
		return;
	}
	level.var_25a33bf1 = 1;
	/#
		while(isdefined(level.var_9c2f3e27) == 1)
		{
			now = gettime();
			var_4359175b = array();
			foreach(hud in level.var_9c2f3e27)
			{
				/#
					assert(function_3132f113(hud) == 0);
				#/
				if(hud.duration > 0)
				{
					var_4359175b[var_4359175b.size] = hud;
					if(hud.time == now)
					{
						continue;
					}
					hud.duration = hud.duration - 1;
					if(hud.var_1119082e <= now)
					{
						hud.alpha = 0;
						hud settext("");
					}
					continue;
				}
				hud destroy();
			}
			level.var_9c2f3e27 = var_4359175b;
			waitframe(1);
		}
	#/
}

/*
	Name: function_b506ee85
	Namespace: snd
	Checksum: 0x4BDA61D2
	Offset: 0xCE8
	Size: 0x180
	Parameters: 1
	Flags: Private
*/
function private function_b506ee85(duration)
{
	hud = undefined;
	now = gettime();
	var_1119082e = duration * 50;
	/#
		foreach(hud in level.var_9c2f3e27)
		{
			/#
				assert(function_3132f113(hud) == 0);
			#/
			if(now >= hud.var_1119082e)
			{
				hud.time = now;
				hud.var_1119082e = now + var_1119082e;
				hud.duration = duration;
				return hud;
			}
		}
		hud = newdebughudelem();
		hud.time = now;
		hud.var_1119082e = now + var_1119082e;
		hud.duration = duration;
		index = level.var_9c2f3e27.size;
		level.var_9c2f3e27[index] = hud;
	#/
	return hud;
}

/*
	Name: function_2f282ca2
	Namespace: snd
	Checksum: 0xA6344E48
	Offset: 0xE70
	Size: 0x27E
	Parameters: 7
	Flags: Linked, Private
*/
function private function_2f282ca2(posx, posy, text, color, alpha, scale, duration)
{
	var_51d80f45 = 640;
	var_a265fbc6 = 480;
	var_b03b36b6 = var_51d80f45 / var_a265fbc6;
	var_1790a507 = function_827811b5();
	var_38c41a5e = var_1790a507[0];
	var_c13d121d = var_1790a507[1];
	var_60d4d877 = var_38c41a5e / var_c13d121d;
	var_811b520c = -0.5 * ((var_a265fbc6 * var_60d4d877) - var_51d80f45);
	var_11ea799a = ((posx / var_38c41a5e) * var_51d80f45) + ((1 - (posx / (var_38c41a5e * 0.5))) * var_811b520c);
	var_39fdd05 = (posy / var_c13d121d) * var_a265fbc6;
	if(isdefined(level.var_9c2f3e27) == 0)
	{
		level.var_9c2f3e27 = array();
	}
	level thread function_ef6f1667();
	/#
		hud = function_b506ee85(duration);
		hud.x = var_11ea799a;
		hud.y = var_39fdd05;
		hud settext(text);
		hud.color = color;
		hud.alpha = alpha;
		hud.fontscale = scale * 0.5;
		hud.font = "";
		hud.alignx = "";
		hud.aligny = "";
		hud.horizalign = "";
		hud.vertalign = "";
		hud.xoffset = 0;
		hud.yoffset = 0;
		hud.xpadding = 0;
		hud.ypadding = 0;
	#/
}

/*
	Name: function_1f59f703
	Namespace: snd
	Checksum: 0x913F6DB7
	Offset: 0x10F8
	Size: 0x4A
	Parameters: 1
	Flags: None
*/
function function_1f59f703(var_eb7d70a5)
{
	if(isdefined(var_eb7d70a5) == 1 && var_eb7d70a5 != 0)
	{
		level.var_44a79f1b = &function_2f282ca2;
	}
	else
	{
		level.var_44a79f1b = undefined;
	}
}

