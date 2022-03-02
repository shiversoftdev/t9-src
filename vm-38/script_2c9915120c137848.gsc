#using script_164a456ce05c3483;
#using script_17dcb1172e441bf6;
#using script_1a9763988299e68d;
#using script_1b01e95a6b5270fd;
#using script_1b0b07ff57d1dde3;
#using script_1ce46999727f2f2b;
#using script_1ee011cd0961afd7;
#using script_2a5bf5b4a00cee0d;
#using script_2e9202713de2b353;
#using script_350cffecd05ef6cf;
#using script_40f967ad5d18ea74;
#using script_41fbdfb1149a433e;
#using script_47851dbeea22fe66;
#using script_47fb62300ac0bd60;
#using script_48e04a393ec6d855;
#using script_4d748e58ce25b60c;
#using script_5701633066d199f2;
#using script_5f20d3b434d24884;
#using script_73ad7687b437e468;
#using script_74a56359b7d02ab6;
#using script_77357b2d180aa2b8;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_a6056a45;

/*
	Name: function_5dbe5973
	Namespace: namespace_a6056a45
	Checksum: 0xDF06BAE8
	Offset: 0x198
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5dbe5973()
{
	level notify(727379329);
}

/*
	Name: init
	Namespace: namespace_a6056a45
	Checksum: 0xD2221B12
	Offset: 0x1B8
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level.doa.var_ecd679f7 = [];
	main();
}

/*
	Name: main
	Namespace: namespace_a6056a45
	Checksum: 0xDD75D757
	Offset: 0x1F0
	Size: 0x26
	Parameters: 0
	Flags: Linked
*/
function main()
{
	function_e2f97f03();
	level.doa.var_ecd679f7 = [];
}

/*
	Name: function_e2f97f03
	Namespace: namespace_a6056a45
	Checksum: 0x168203E9
	Offset: 0x220
	Size: 0xE4
	Parameters: 1
	Flags: Linked
*/
function function_e2f97f03(context)
{
	if(!isdefined(context))
	{
		context = 0;
	}
	foreach(item in level.doa.var_ecd679f7)
	{
		if(!isdefined(item))
		{
			continue;
		}
		if(context != 0 && item.context != context)
		{
			continue;
		}
		if(isdefined(item.var_28a48bb3))
		{
			item thread [[item.var_28a48bb3]]();
		}
	}
}

/*
	Name: function_de7fb95
	Namespace: namespace_a6056a45
	Checksum: 0x27BD7417
	Offset: 0x310
	Size: 0x638
	Parameters: 2
	Flags: Linked
*/
function function_de7fb95(var_c904ca7c, context)
{
	if(!isdefined(context))
	{
		context = 0;
	}
	var_872501ac = struct::get_array(var_c904ca7c + "_pressureplate_object", "script_noteworthy");
	foreach(target in var_872501ac)
	{
		action = 0;
		/#
			assert(isdefined(target.script_parameters) && isdefined(""));
		#/
		toks = strtok(target.script_parameters, ";");
		/#
			assert(toks.size > 0);
		#/
		switch(toks[0])
		{
			case "elevator":
			{
				action = 1;
				var_41157a40 = &function_9592df27;
				var_4af56c19 = &function_2efb907a;
				break;
			}
			case "door":
			{
				action = 2;
				var_41157a40 = &function_8a173823;
				var_4af56c19 = &function_1e0322f;
				break;
			}
		}
		target.type = action;
		target.var_41157a40 = var_41157a40;
		target.var_28a48bb3 = var_4af56c19;
		target.context = context;
		target.script_model = namespace_ec06fe4a::function_e22ae9b3(target.origin, target.model, target.angles, "pressure_plate_object");
		if(target.type == 2)
		{
			/#
				assert(toks.size > 1, "");
			#/
			target.doortype = int(toks[1]);
			/#
				assert(target.doortype >= 1 && target.doortype <= 3, "");
			#/
			target.script_model namespace_f63bdb08::function_94c7c0d9(target.doortype, 8, context);
		}
		else if(target.type == 1)
		{
			target.script_model setmovingplatformenabled(1);
			/#
				assert(toks.size > 2, "");
			#/
			target.var_77e68c20 = int(toks[1]);
			target.var_edf3aca7 = int(toks[2]);
			if(toks.size > 3)
			{
				switch(toks[3])
				{
					case "loot":
					{
						/#
							assert(isdefined(target.target), "");
						#/
						target.var_33957191 = struct::get_array(target.target, "targetname");
						/#
							assert(target.var_33957191.size, "");
						#/
						break;
					}
				}
			}
			if(toks.size > 4)
			{
				switch(toks[4])
				{
					case "pickone":
					{
						if(target.var_33957191.size > 1)
						{
							item = target.var_33957191[randomint(target.var_33957191.size)];
							target.var_33957191 = [];
							if(!isdefined(target.var_33957191))
							{
								target.var_33957191 = [];
							}
							else if(!isarray(target.var_33957191))
							{
								target.var_33957191 = array(target.var_33957191);
							}
							target.var_33957191[target.var_33957191.size] = item;
						}
						break;
					}
				}
			}
		}
		if(isdefined(target.var_41157a40))
		{
			target thread [[target.var_41157a40]]();
		}
		if(!isdefined(level.doa.var_ecd679f7))
		{
			level.doa.var_ecd679f7 = [];
		}
		else if(!isarray(level.doa.var_ecd679f7))
		{
			level.doa.var_ecd679f7 = array(level.doa.var_ecd679f7);
		}
		level.doa.var_ecd679f7[level.doa.var_ecd679f7.size] = target;
	}
}

/*
	Name: function_9592df27
	Namespace: namespace_a6056a45
	Checksum: 0xAF4EB1A1
	Offset: 0x950
	Size: 0x328
	Parameters: 0
	Flags: Linked
*/
function function_9592df27()
{
	self.script_model endon(#"death");
	if(isdefined(self.var_33957191))
	{
		foreach(item in self.var_33957191)
		{
			/#
				assert(isdefined(item.script_noteworthy), "");
			#/
			switch(item.script_noteworthy)
			{
				case "pickup_item":
				{
					if(!isdefined(self.var_152b081b))
					{
						self.var_152b081b = [];
					}
					/#
						assert(isdefined(item.script_parameters), "");
					#/
					def = doa_pickups::function_6265bde4(item.script_parameters);
					/#
						assert(isdefined(def), "");
					#/
					var_4981a43f = doa_pickups::function_d080f0db(def, item.origin, item.angles, undefined, 1);
					if(isdefined(var_4981a43f))
					{
						var_4981a43f thread namespace_ec06fe4a::function_73d79e7d(self.script_model, 1, vectorscale((0, 0, 1), 20));
						var_4981a43f notify(#"hash_2a866f50cc161ca8");
						if(!isdefined(self.var_152b081b))
						{
							self.var_152b081b = [];
						}
						else if(!isarray(self.var_152b081b))
						{
							self.var_152b081b = array(self.var_152b081b);
						}
						self.var_152b081b[self.var_152b081b.size] = var_4981a43f;
					}
					break;
				}
			}
		}
	}
	self.var_cb52058d = self.origin + (0, 0, self.var_77e68c20);
	var_d893beb9 = abs(self.var_77e68c20);
	while(true)
	{
		self waittill(#"plate_activated");
		self function_1efdf194(self.var_cb52058d[2], self.var_edf3aca7, var_d893beb9);
		self waittill(#"plate_deactivated");
		self function_1efdf194(self.origin[2], self.var_edf3aca7, var_d893beb9);
	}
}

/*
	Name: function_1efdf194
	Namespace: namespace_a6056a45
	Checksum: 0xDCE77DA7
	Offset: 0xC80
	Size: 0x12C
	Parameters: 3
	Flags: Linked
*/
function function_1efdf194(desiredz, totaltime, totaldist)
{
	if(desiredz == self.origin[2])
	{
		deltaz = abs(self.origin[2] - self.script_model.origin[2]);
		desiredpos = self.origin;
	}
	if(desiredz == self.var_cb52058d[2])
	{
		deltaz = abs(self.script_model.origin[2] - self.var_cb52058d[2]);
		desiredpos = self.var_cb52058d;
	}
	timedelta = math::clamp((deltaz / totaldist) * totaltime, 0.05, totaltime);
	self.script_model moveto(desiredpos, timedelta);
}

/*
	Name: function_2efb907a
	Namespace: namespace_a6056a45
	Checksum: 0xEA6F9F94
	Offset: 0xDB8
	Size: 0xFC
	Parameters: 0
	Flags: Linked
*/
function function_2efb907a()
{
	if(isdefined(self.var_152b081b))
	{
		foreach(item in self.var_152b081b)
		{
			if(!isdefined(item))
			{
				continue;
			}
			item delete();
		}
		self.var_152b081b = undefined;
	}
	if(isdefined(self.trigger))
	{
		self.trigger delete();
	}
	if(isdefined(self.script_model))
	{
		self.script_model delete();
	}
}

/*
	Name: function_8a173823
	Namespace: namespace_a6056a45
	Checksum: 0x9D64676B
	Offset: 0xEC0
	Size: 0xC0
	Parameters: 0
	Flags: Linked
*/
function function_8a173823()
{
	self.script_model endon(#"death");
	level.doa.var_b8ef1466[level.doa.var_b8ef1466.size] = self.script_model;
	while(true)
	{
		self waittill(#"plate_activated");
		self thread namespace_f63bdb08::function_49957ef3(self.script_model, 0);
		self waittill(#"plate_deactivated");
		self thread namespace_f63bdb08::function_4c065330(self.script_model);
	}
}

/*
	Name: function_1e0322f
	Namespace: namespace_a6056a45
	Checksum: 0xCDEC25D5
	Offset: 0xF88
	Size: 0x7C
	Parameters: 0
	Flags: Linked
*/
function function_1e0322f()
{
	if(isdefined(self.trigger))
	{
		self.trigger delete();
	}
	arrayremovevalue(level.doa.var_b8ef1466, self.script_model);
	if(isdefined(self.script_model))
	{
		self.script_model delete();
	}
}

