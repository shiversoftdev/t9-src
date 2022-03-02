#using script_18910f59cc847b42;
#using script_1b2f6ef7778cf920;
#using script_245f38df21b701ca;
#using script_30c7fb449869910;
#using script_30efbc1e0156ebae;
#using script_3314b730521b9666;
#using script_38635d174016f682;
#using script_41540e991952b0c1;
#using script_42cbbdcd1e160063;
#using script_4adf64e112e9afec;
#using script_60a2f38d6d37fd6a;
#using script_64e5d3ad71ce8140;
#using script_67049b48b589d81;
#using script_6b71c9befed901f2;
#using script_71603a58e2da0698;
#using script_75c3996cce8959f7;
#using script_75e0a2c8a5c12652;
#using script_76abb7986de59601;
#using script_77163d5a569e2071;
#using script_771f5bff431d8d57;
#using script_7bf1bd99605135bf;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\spawner_shared.csc;
#using scripts\core_common\spawning_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_a6ddb172;

/*
	Name: init
	Namespace: namespace_a6ddb172
	Checksum: 0xC74BBA1F
	Offset: 0x1A8
	Size: 0x220
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("world", "banner_event", 1, 6, "int", &function_778aa85f, 0, 0);
	clientfield::register("world", "banner_eventplayer", 1, 6, "int", &function_41109d42, 0, 0);
	level.doa.banner[0] = doa_bannerelement::function_5c1bb138();
	level.doa.var_5f94c071[0] = doa_textelement::function_5c1bb138();
	level.doa.var_75e2ed0d[0] = doa_textelement::function_5c1bb138();
	level.doa.var_4f001f48[0] = doa_textelement::function_5c1bb138();
	level.doa.var_51c724d6[0] = doa_textelement::function_5c1bb138();
	level.doa.banner[1] = doa_bannerelement::function_5c1bb138();
	level.doa.var_5f94c071[1] = doa_textelement::function_5c1bb138();
	level.doa.var_75e2ed0d[1] = doa_textelement::function_5c1bb138();
	level.doa.var_4f001f48[1] = doa_textelement::function_5c1bb138();
	level.doa.var_51c724d6[1] = doa_textelement::function_5c1bb138();
}

/*
	Name: function_32d5e898
	Namespace: namespace_a6ddb172
	Checksum: 0xF0C8D305
	Offset: 0x3D0
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_32d5e898(localclientnum)
{
	/#
		assert(localclientnum >= 0 && localclientnum <= 1);
	#/
	function_56821d13(localclientnum);
}

/*
	Name: function_41109d42
	Namespace: namespace_a6ddb172
	Checksum: 0xBBAAF2B7
	Offset: 0x430
	Size: 0x44C
	Parameters: 7
	Flags: Linked
*/
function function_41109d42(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(level.doa.banner))
	{
		return;
	}
	/#
		assert(fieldname >= 0 && fieldname <= 1);
	#/
	var_eb6dbadd = bwastimejump & 15;
	entnum = bwastimejump >> 4;
	color = namespace_7f5aeb59::function_144f26b2(entnum);
	switch(entnum)
	{
		case 0:
		{
			var_e429ef89 = level.doa.var_5f94c071[fieldname];
			break;
		}
		case 1:
		{
			var_e429ef89 = level.doa.var_75e2ed0d[fieldname];
			break;
		}
		case 2:
		{
			var_e429ef89 = level.doa.var_4f001f48[fieldname];
			break;
		}
		case 3:
		{
			var_e429ef89 = level.doa.var_51c724d6[fieldname];
			break;
		}
	}
	/#
		assert(isdefined(var_e429ef89));
	#/
	var_d6bac235 = spawnstruct();
	var_d6bac235.y = 200 + (entnum * 50);
	var_d6bac235.timeout = 5;
	var_d6bac235.color = color;
	var_d6bac235.scale = 0.4;
	switch(var_eb6dbadd)
	{
		case 0:
		{
			function_56821d13(fieldname);
			return;
		}
		case 63:
		{
			function_56821d13(fieldname);
			return;
		}
		case 2:
		{
			text = #"hash_29f2d2688d79b468";
			break;
		}
		case 3:
		{
			text = #"hash_33ee5da9fc46b6a5";
			break;
		}
		case 4:
		{
			text = #"hash_5bffd8a0e4b9f938";
			break;
		}
		case 5:
		{
			text = #"hash_4f7305231f2f2bb7";
			break;
		}
		case 6:
		{
			text = #"hash_2a1ca49779ad5f32";
			break;
		}
		case 7:
		{
			text = #"hash_7a1b01c3e3f1437";
			break;
		}
		case 1:
		{
			text = #"hash_549db2754f6c985f";
			break;
		}
		case 9:
		{
			text = #"hash_420476f9d6971298";
			var_d6bac235.scale = 0.6;
			break;
		}
		case 8:
		{
			text = #"hash_34cd5701c0b949b8";
			var_d6bac235.scale = 0.6;
			break;
		}
	}
	/#
		assert(isdefined(text));
	#/
	var_d6bac235.text = text;
	var_e429ef89 thread function_9a92c603(fieldname, var_d6bac235);
}

/*
	Name: function_778aa85f
	Namespace: namespace_a6ddb172
	Checksum: 0x5F377991
	Offset: 0x888
	Size: 0x21BC
	Parameters: 7
	Flags: Linked
*/
function function_778aa85f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	/#
		assert(fieldname >= 0 && fieldname <= 1);
	#/
	if(!isdefined(level.doa.banner))
	{
		return;
	}
	var_d6bac235 = undefined;
	var_8d552f67 = undefined;
	var_c4241d08 = undefined;
	var_e8f666ac = undefined;
	var_936d31f7 = undefined;
	switch(bwastimejump)
	{
		case 0:
		{
			function_56821d13(fieldname);
			break;
		}
		case 63:
		{
			function_56821d13(fieldname);
			break;
		}
		case 14:
		{
			var_936d31f7 = spawnstruct();
			var_936d31f7.text = #"hash_6edbfd161005ab44";
			/#
				assert(isdefined(var_936d31f7.text));
			#/
			var_936d31f7.timeout = 4;
			var_936d31f7.color = (0.3, 0.84, 0.2);
			break;
		}
		case 15:
		{
			var_d6bac235 = spawnstruct();
			var_d6bac235.text = #"hash_3a07bfbf9fc8fe5e";
			/#
				assert(isdefined(var_d6bac235.text));
			#/
			var_d6bac235.y = 200;
			var_d6bac235.timeout = 3;
			var_d6bac235.color = (0.3, 0.84, 0.2);
			var_d6bac235.scale = 0.6;
			break;
		}
		case 13:
		{
			if(isdefined(level.doa))
			{
				var_d6bac235 = spawnstruct();
				var_d6bac235.text = #"hash_6a342a929b6bfca2";
				/#
					assert(isdefined(var_d6bac235.text));
				#/
				var_d6bac235.y = 200;
				/#
					assert(isdefined(level.doa.roundnumber), "");
				#/
				if(!isdefined(level.doa.roundnumber))
				{
					level.doa.roundnumber = 4;
				}
				var_d6bac235.payload = level.doa.roundnumber;
				var_d6bac235.timeout = 9999;
				var_d6bac235.color = (1, 0.84, 0);
			}
			var_8d552f67 = spawnstruct();
			var_8d552f67.text = #"hash_2bca86061b6767e4";
			/#
				assert(isdefined(var_8d552f67.text));
			#/
			var_8d552f67.y = 280;
			var_8d552f67.timeout = 9999;
			var_8d552f67.color = (1, 0.55, 0);
			var_8d552f67.delay = 2;
			var_8d552f67.scale = 0.6;
			break;
		}
		case 12:
		{
			if(isdefined(level.doa))
			{
				var_d6bac235 = spawnstruct();
				var_d6bac235.text = #"hash_6a342a929b6bfca2";
				/#
					assert(isdefined(var_d6bac235.text));
				#/
				var_d6bac235.y = 200;
				/#
					assert(isdefined(level.doa.roundnumber), "");
				#/
				if(isdefined(level.doa.roundnumber))
				{
					var_d6bac235.payload = level.doa.roundnumber;
				}
				var_d6bac235.timeout = 9999;
				var_d6bac235.color = (1, 0.84, 0);
			}
			var_8d552f67 = spawnstruct();
			var_8d552f67.text = #"hash_f123d93fac4c288";
			/#
				assert(isdefined(var_8d552f67.text));
			#/
			var_8d552f67.y = 280;
			var_8d552f67.timeout = 25;
			if(isdefined(level.doa.current_arena) && level.doa.current_arena.script_noteworthy == #"wintercave")
			{
				var_8d552f67.timeout = 9999;
			}
			var_8d552f67.color = (1, 0.55, 0);
			var_8d552f67.delay = 2;
			var_8d552f67.scale = 0.6;
			var_c4241d08 = spawnstruct();
			var_c4241d08.text = #"hash_5ac4e544985e273d";
			/#
				assert(isdefined(var_c4241d08.text));
			#/
			var_c4241d08.y = 330;
			var_c4241d08.timeout = 1;
			var_c4241d08.color = (1, 0.55, 0);
			var_c4241d08.delay = 3;
			var_c4241d08.scale = 0.6;
			var_c4241d08.text2 = #"hash_2bca86061b6767e4";
			/#
				assert(isdefined(var_c4241d08.text2));
			#/
			var_c4241d08.var_b6501bb5 = 9999;
			break;
		}
		case 16:
		{
			var_936d31f7 = spawnstruct();
			var_936d31f7.text = #"hash_53e517a90b3cd2e2";
			/#
				assert(isdefined(var_936d31f7.text));
			#/
			var_936d31f7.timeout = 6;
			var_936d31f7.color = (0.35, 0.35, 0.89);
			var_c4241d08 = spawnstruct();
			var_c4241d08.text = function_5a3210ac();
			/#
				assert(isdefined(var_c4241d08.text));
			#/
			var_c4241d08.y = 300;
			var_c4241d08.timeout = 4;
			var_c4241d08.color = (0.5, 0.5, 0.89);
			var_c4241d08.delay = 2;
			break;
		}
		case 10:
		{
			if(!isdefined(level.doa.roundnumber))
			{
				return;
			}
			var_aa7fba18 = 4 - (level.doa.roundnumber % 4);
			if(var_aa7fba18 == 1)
			{
				txt = #"hash_20cec1153efec555";
				var_aa7fba18 = undefined;
			}
			txt = #"hash_6547ed675c5dca52";
		}
		var_d6bac235 = spawnstruct();
		var_d6bac235.text = #"hash_6a342a929b6bfca2";
		assert(isdefined(var_d6bac235.text));
		var_d6bac235.y = 200;
		var_d6bac235.payload = level.doa.roundnumber;
		var_d6bac235.timeout = 9999;
		var_d6bac235.color = (1, 0.84, 0);
		var_8d552f67 = spawnstruct();
		var_8d552f67.text = (bwastimejump == 11 ? #"hash_f123d93fac4c288" : txt);
		assert(isdefined(var_8d552f67.text));
		var_8d552f67.y = 280;
		var_8d552f67.timeout = 9999;
		var_8d552f67.color = (1, 0.55, 0);
		var_8d552f67.delay = 2;
		var_8d552f67.scale = 0.6;
		var_8d552f67.payload = var_aa7fba18;
		break;
		case 61:
		{
			var_936d31f7 = spawnstruct();
			var_936d31f7.text = #"hash_64706df7d9dd7484";
			/#
				assert(isdefined(var_936d31f7.text));
			#/
			var_936d31f7.var_6dcbe6ee = 1.5;
			var_936d31f7.timeout = 6;
			break;
		}
		case 62:
		{
			var_936d31f7 = spawnstruct();
			var_936d31f7.text = #"hash_54f36d5e55ebd1a0";
			/#
				assert(isdefined(var_936d31f7.text));
			#/
			var_936d31f7.var_6dcbe6ee = 1.5;
			var_936d31f7.timeout = 8;
			break;
		}
		case 60:
		{
			var_936d31f7 = spawnstruct();
			var_936d31f7.text = #"hash_1f7c09e88239dac";
			/#
				assert(isdefined(var_936d31f7.text));
			#/
			var_936d31f7.timeout = 6;
			var_936d31f7.color = (1, 0.84, 0);
			var_d6bac235 = spawnstruct();
			var_d6bac235.text = #"hash_279b40f60bc50dc4";
			/#
				assert(isdefined(var_d6bac235.text));
			#/
			var_d6bac235.y = 320;
			var_d6bac235.timeout = 6;
			var_d6bac235.color = (1, 0.55, 0);
			var_d6bac235.delay = 1;
			var_d6bac235.scale = 0.6;
			break;
		}
		case 59:
		{
			var_936d31f7 = spawnstruct();
			var_936d31f7.text = #"hash_7841b2473599470";
			/#
				assert(isdefined(var_936d31f7.text));
			#/
			var_936d31f7.var_6dcbe6ee = 1.5;
			var_936d31f7.timeout = 15;
			var_936d31f7.color = (1, 0.1, 0.1);
			if(isdefined(level.doa))
			{
				var_8d552f67 = spawnstruct();
				var_8d552f67.text = #"hash_2294c09e27c1dd1a";
				/#
					assert(isdefined(var_8d552f67.text));
				#/
				var_8d552f67.y = 300;
				var_8d552f67.payload = level.doa.roundnumber;
				var_8d552f67.timeout = 15;
				var_8d552f67.color = (1, 0.55, 0);
				var_8d552f67.scale = 0.8;
			}
			break;
		}
		case 20:
		case 21:
		case 22:
		case 23:
		{
			level thread namespace_9fc66ac::announce(fieldname, 19);
			var_936d31f7 = spawnstruct();
			var_936d31f7.text = #"hash_30cfa520b05f1c31";
			/#
				assert(isdefined(var_936d31f7.text));
			#/
			var_936d31f7.timeout = 6;
			var_936d31f7.color = (1, 0.84, 0);
			var_d6bac235 = spawnstruct();
			var_d6bac235.text = function_4d2e3eaa(bwastimejump);
			/#
				assert(isdefined(var_d6bac235.text));
			#/
			var_d6bac235.announce = function_59dbb042(bwastimejump);
			var_d6bac235.y = 300;
			var_d6bac235.timeout = 6;
			var_d6bac235.color = (1, 0.55, 0);
			var_d6bac235.delay = 1;
			var_d6bac235.scale = 0.8;
			break;
		}
		case 17:
		case 18:
		case 19:
		case 24:
		case 26:
		case 27:
		{
			level thread namespace_9fc66ac::announce(fieldname, 12);
			var_936d31f7 = spawnstruct();
			var_936d31f7.text = #"hash_7baa5fa3bb1a720b";
			/#
				assert(isdefined(var_936d31f7.text));
			#/
			var_936d31f7.timeout = 6;
			var_936d31f7.color = (1, 0.84, 0);
			var_d6bac235 = spawnstruct();
			var_d6bac235.text = function_4d2e3eaa(bwastimejump);
			/#
				assert(isdefined(var_d6bac235.text));
			#/
			var_d6bac235.announce = function_59dbb042(bwastimejump);
			var_d6bac235.y = 300;
			var_d6bac235.timeout = 6;
			var_d6bac235.color = (1, 0.55, 0);
			var_d6bac235.delay = 1;
			var_d6bac235.scale = 0.8;
			break;
		}
		case 25:
		{
			var_d6bac235 = spawnstruct();
			var_d6bac235.text = #"hash_8bdf3c0ddafe15a";
			/#
				assert(isdefined(var_d6bac235.text));
			#/
			var_d6bac235.y = 200;
			var_d6bac235.timeout = 6;
			var_d6bac235.color = (1, 0.1, 0.1);
			var_d6bac235.scale = 0.7;
			var_8d552f67 = spawnstruct();
			var_8d552f67.text = #"hash_686dc889dc26ce9a";
			/#
				assert(isdefined(var_8d552f67.text));
			#/
			var_8d552f67.y = 280;
			var_8d552f67.timeout = 6;
			var_8d552f67.color = (1, 0.55, 0);
			var_8d552f67.delay = 2;
			var_8d552f67.scale = 0.5;
			break;
		}
		case 28:
		case 29:
		case 30:
		case 31:
		case 33:
		case 34:
		case 36:
		case 38:
		case 40:
		{
			var_d6bac235 = spawnstruct();
			var_d6bac235.text = #"hash_5cf341d25f5b6392";
			/#
				assert(isdefined(var_d6bac235.text));
			#/
			var_d6bac235.y = 200;
			var_d6bac235.timeout = 6;
			var_d6bac235.color = (1, 0.84, 0);
			var_8d552f67 = spawnstruct();
			var_8d552f67.text = function_b6e2bc81(bwastimejump);
			/#
				assert(isdefined(var_8d552f67.text));
			#/
			var_8d552f67.y = 280;
			var_8d552f67.timeout = 6;
			var_8d552f67.color = (1, 0.55, 0);
			var_8d552f67.delay = 2;
			var_8d552f67.scale = 0.6;
			break;
		}
		case 32:
		case 35:
		case 37:
		case 39:
		case 41:
		{
			var_d6bac235 = spawnstruct();
			var_d6bac235.text = #"hash_4efeacff23c592b7";
			/#
				assert(isdefined(var_d6bac235.text));
			#/
			var_d6bac235.y = 200;
			var_d6bac235.timeout = 6;
			var_d6bac235.color = (1, 0.84, 0);
			var_8d552f67 = spawnstruct();
			var_8d552f67.text = function_b6e2bc81(bwastimejump);
			/#
				assert(isdefined(var_8d552f67.text));
			#/
			var_8d552f67.y = 280;
			var_8d552f67.timeout = 6;
			var_8d552f67.color = (1, 0.55, 0);
			var_8d552f67.delay = 2;
			var_8d552f67.scale = 0.6;
			break;
		}
		case 50:
		{
			var_936d31f7 = spawnstruct();
			var_936d31f7.text = #"hash_34155d8ef62cacc3";
			/#
				assert(isdefined(var_936d31f7.text));
			#/
			var_936d31f7.timeout = 6;
			var_936d31f7.color = (0.35, 0.35, 0.89);
			var_c4241d08 = spawnstruct();
			var_c4241d08.text = #"hash_10f337afa86612b4";
			/#
				assert(isdefined(var_c4241d08.text));
			#/
			var_c4241d08.y = 300;
			var_c4241d08.timeout = 4;
			var_c4241d08.color = (0.5, 0.5, 0.89);
			var_c4241d08.delay = 2;
			var_c4241d08.scale = 0.6;
			break;
		}
		case 51:
		{
			var_c4241d08 = spawnstruct();
			var_c4241d08.text = #"hash_10f33aafa86617cd";
			/#
				assert(isdefined(var_c4241d08.text));
			#/
			var_c4241d08.y = 300;
			var_c4241d08.timeout = 4;
			var_c4241d08.color = (0.5, 0.5, 0.89);
			var_c4241d08.delay = 2;
			var_c4241d08.scale = 0.6;
			break;
		}
		case 52:
		{
			var_c4241d08 = spawnstruct();
			var_c4241d08.text = #"hash_10f339afa866161a";
			/#
				assert(isdefined(var_c4241d08.text));
			#/
			var_c4241d08.y = 300;
			var_c4241d08.timeout = 4;
			var_c4241d08.color = (0.5, 0.5, 0.89);
			var_c4241d08.delay = 2;
			var_c4241d08.scale = 0.6;
			break;
		}
		case 53:
		{
			var_936d31f7 = spawnstruct();
			var_936d31f7.text = #"hash_2754828e3e485547";
			/#
				assert(isdefined(var_936d31f7.text));
			#/
			var_936d31f7.timeout = 6;
			var_936d31f7.color = (0.35, 0.35, 0.89);
			var_c4241d08 = spawnstruct();
			var_c4241d08.text = #"hash_6c6bf5dfe635c87a";
			/#
				assert(isdefined(var_c4241d08.text));
			#/
			var_c4241d08.y = 300;
			var_c4241d08.timeout = 4;
			var_c4241d08.color = (0.5, 0.5, 0.89);
			var_c4241d08.delay = 2;
			var_c4241d08.scale = 0.6;
			break;
		}
		case 54:
		{
			var_936d31f7 = spawnstruct();
			var_936d31f7.text = #"hash_2754828e3e485547";
			/#
				assert(isdefined(var_936d31f7.text));
			#/
			var_936d31f7.timeout = 6;
			var_936d31f7.color = (0.35, 0.35, 0.89);
			var_c4241d08 = spawnstruct();
			var_c4241d08.text = #"hash_284b81f16c3d9e48";
			/#
				assert(isdefined(var_c4241d08.text));
			#/
			var_c4241d08.y = 300;
			var_c4241d08.timeout = 4;
			var_c4241d08.color = (0.5, 0.5, 0.89);
			var_c4241d08.delay = 2;
			var_c4241d08.scale = 0.6;
			break;
		}
		case 42:
		{
			var_936d31f7 = spawnstruct();
			var_936d31f7.text = #"hash_3415698ef62cc127";
			/#
				assert(isdefined(var_936d31f7.text));
			#/
			var_936d31f7.timeout = 6;
			var_936d31f7.color = (0.35, 0.35, 0.89);
			var_c4241d08 = spawnstruct();
			var_c4241d08.text = #"hash_220c6afbbdd6e391";
			/#
				assert(isdefined(var_c4241d08.text));
			#/
			var_c4241d08.y = 300;
			var_c4241d08.timeout = 4;
			var_c4241d08.color = (0.5, 0.5, 0.89);
			var_c4241d08.delay = 2;
			var_c4241d08.scale = 0.6;
			break;
		}
		case 47:
		{
			var_936d31f7 = spawnstruct();
			var_936d31f7.text = #"hash_6edbfd161005ab44";
			var_936d31f7.timeout = 4;
			var_936d31f7.color = (0.3, 0.84, 0.2);
			var_c4241d08 = spawnstruct();
			var_c4241d08.text = #"hash_241673ce039e1331";
			/#
				assert(isdefined(var_c4241d08.text));
			#/
			var_c4241d08.y = 300;
			var_c4241d08.timeout = 4;
			var_c4241d08.color = (0.3, 0.64, 0.2);
			var_c4241d08.delay = 2;
			var_c4241d08.scale = 0.6;
			break;
		}
		case 43:
		{
			var_c4241d08 = spawnstruct();
			var_c4241d08.text = #"hash_49bc9775ce122be2";
			/#
				assert(isdefined(var_c4241d08.text));
			#/
			var_c4241d08.y = 300;
			var_c4241d08.timeout = 5;
			var_c4241d08.color = (0.5, 0.5, 0.89);
			var_c4241d08.scale = 0.6;
			break;
		}
		case 44:
		{
			var_d6bac235 = spawnstruct();
			var_d6bac235.text = #"hash_155e552e57ff5998";
			/#
				assert(isdefined(var_d6bac235.text));
			#/
			var_d6bac235.y = 200;
			var_d6bac235.timeout = 5;
			var_d6bac235.color = (0.5, 0.5, 0.89);
			var_d6bac235.scale = 0.6;
			break;
		}
		case 45:
		{
			var_c4241d08 = spawnstruct();
			var_c4241d08.text = #"hash_653fc36b071285d5";
			/#
				assert(isdefined(var_c4241d08.text));
			#/
			var_c4241d08.y = 300;
			var_c4241d08.timeout = 4;
			var_c4241d08.color = (0.5, 0.5, 0.89);
			var_c4241d08.scale = 0.6;
			break;
		}
		case 46:
		{
			var_c4241d08 = spawnstruct();
			var_c4241d08.text = #"hash_5c99b98fb7538d89";
			/#
				assert(isdefined(var_c4241d08.text));
			#/
			var_c4241d08.y = 300;
			var_c4241d08.timeout = 4;
			var_c4241d08.color = (0.5, 0.5, 0.89);
			var_c4241d08.scale = 0.6;
			break;
		}
		case 48:
		{
			var_c4241d08 = spawnstruct();
			var_c4241d08.text = #"hash_35c9692834e646f8";
			/#
				assert(isdefined(var_c4241d08.text));
			#/
			var_c4241d08.y = 300;
			var_c4241d08.timeout = 999;
			var_c4241d08.color = (1, 1, 1);
			var_c4241d08.scale = 0.35;
			break;
		}
		case 49:
		{
			var_c4241d08 = spawnstruct();
			var_c4241d08.text = #"hash_485f00a41720d5b3";
			/#
				assert(isdefined(var_c4241d08.text));
			#/
			var_c4241d08.y = 300;
			var_c4241d08.timeout = 999;
			var_c4241d08.color = (1, 1, 1);
			var_c4241d08.scale = 0.35;
			break;
		}
		default:
		{
			break;
		}
	}
	if(isdefined(var_936d31f7))
	{
		level.doa.banner[fieldname] thread function_9a92c603(fieldname, var_936d31f7);
	}
	if(isdefined(var_d6bac235))
	{
		level.doa.var_5f94c071[fieldname] thread function_9a92c603(fieldname, var_d6bac235);
	}
	if(isdefined(var_8d552f67))
	{
		level.doa.var_75e2ed0d[fieldname] thread function_9a92c603(fieldname, var_8d552f67);
	}
	if(isdefined(var_c4241d08))
	{
		level.doa.var_4f001f48[fieldname] thread function_9a92c603(fieldname, var_c4241d08);
	}
	if(isdefined(var_e8f666ac))
	{
		level.doa.var_51c724d6[fieldname] thread function_9a92c603(fieldname, var_e8f666ac);
	}
}

/*
	Name: function_5a3210ac
	Namespace: namespace_a6ddb172
	Checksum: 0x8A7ED0C6
	Offset: 0x2A50
	Size: 0x2E
	Parameters: 0
	Flags: Linked
*/
function function_5a3210ac()
{
	return level.doa.var_4bd98f7c[level.doa.var_5d21548e].var_d5ab2ea4;
}

/*
	Name: function_4d2e3eaa
	Namespace: namespace_a6ddb172
	Checksum: 0xB72F3544
	Offset: 0x2A88
	Size: 0x15A
	Parameters: 1
	Flags: Linked
*/
function function_4d2e3eaa(roomtype)
{
	switch(roomtype)
	{
		case 26:
		{
			return #"hash_4c5468285fb9d826";
		}
		case 27:
		{
			return #"hash_5e61aab055d1b3c1";
		}
		case 17:
		{
			return #"hash_ced2d169408f6d5";
		}
		case 18:
		{
			return #"hash_388c4f923d12c58";
		}
		case 19:
		{
			return #"hash_53308d4150e5d0ac";
		}
		case 20:
		{
			return #"hash_7ae05eb6a354227d";
		}
		case 21:
		{
			return #"hash_48de9f961f66cd70";
		}
		case 22:
		{
			return #"hash_4b89013f738a43";
		}
		case 23:
		{
			return #"hash_124bdd4cf5c7dbac";
		}
		case 24:
		{
			return #"hash_7f3ef33a21a4f457";
		}
	}
}

/*
	Name: function_59dbb042
	Namespace: namespace_a6ddb172
	Checksum: 0x84CFB76B
	Offset: 0x2BF0
	Size: 0xFA
	Parameters: 1
	Flags: Linked
*/
function function_59dbb042(roomtype)
{
	switch(roomtype)
	{
		case 26:
		{
			return 13;
		}
		case 27:
		{
			return 14;
		}
		case 17:
		{
			return 18;
		}
		case 18:
		{
			return 16;
		}
		case 19:
		{
			return 15;
		}
		case 20:
		{
			return 23;
		}
		case 21:
		{
			return 22;
		}
		case 22:
		{
			return 20;
		}
		case 23:
		{
			return 21;
		}
		case 24:
		{
			return 17;
		}
	}
}

/*
	Name: function_b6e2bc81
	Namespace: namespace_a6ddb172
	Checksum: 0xAE50D9E6
	Offset: 0x2CF8
	Size: 0x1DA
	Parameters: 1
	Flags: Linked
*/
function function_b6e2bc81(roomtype)
{
	switch(roomtype)
	{
		case 30:
		{
			return #"hash_365152316e8cfc0";
		}
		case 40:
		{
			return #"hash_542d0557fc360dd2";
		}
		case 28:
		{
			return #"hash_3fbcd19e60d8cb42";
		}
		case 29:
		{
			return #"hash_16de0c0160ea3d28";
		}
		case 31:
		{
			return #"hash_170e061a597a50cd";
		}
		case 32:
		{
			return #"hash_19f4fc7186e4d11";
		}
		case 33:
		{
			return #"hash_2330795898a1425c";
		}
		case 34:
		{
			return #"hash_25bc2216bde1b571";
		}
		case 35:
		{
			return #"hash_370a31e0d0d75fdb";
		}
		case 36:
		{
			return #"hash_32dc81d6bb8c98e9";
		}
		case 37:
		{
			return #"hash_76e31dedd78dbc8d";
		}
		case 38:
		{
			return #"hash_3f343b77c7c30e0a";
		}
		case 39:
		{
			return #"hash_59f4c2a2c01c4b98";
		}
		case 41:
		{
			return #"hash_6bbf84b01f5e560c";
		}
	}
}

/*
	Name: function_56821d13
	Namespace: namespace_a6ddb172
	Checksum: 0xC30B2405
	Offset: 0x2EE0
	Size: 0x3E8
	Parameters: 1
	Flags: Linked
*/
function function_56821d13(localclientnum)
{
	/#
		assert(localclientnum >= 0 && localclientnum <= 1);
	#/
	/#
		assert(isdefined(level.doa.banner));
	#/
	/#
		assert(isdefined(level.doa.var_5f94c071));
	#/
	/#
		assert(isdefined(level.doa.var_75e2ed0d));
	#/
	/#
		assert(isdefined(level.doa.var_4f001f48));
	#/
	/#
		assert(isdefined(level.doa.var_51c724d6));
	#/
	if(level.doa.banner[localclientnum] doa_bannerelement::is_open(localclientnum))
	{
		level.doa.banner[localclientnum] doa_bannerelement::function_aa5c711d(localclientnum, 0);
		level.doa.banner[localclientnum] doa_bannerelement::close(localclientnum);
	}
	if(level.doa.var_5f94c071[localclientnum] doa_bannerelement::is_open(localclientnum))
	{
		level.doa.var_5f94c071[localclientnum] doa_bannerelement::function_aa5c711d(localclientnum, 0);
		level.doa.var_5f94c071[localclientnum] doa_bannerelement::close(localclientnum);
	}
	if(level.doa.var_75e2ed0d[localclientnum] doa_bannerelement::is_open(localclientnum))
	{
		level.doa.var_75e2ed0d[localclientnum] doa_bannerelement::function_aa5c711d(localclientnum, 0);
		level.doa.var_75e2ed0d[localclientnum] doa_bannerelement::close(localclientnum);
	}
	if(level.doa.var_4f001f48[localclientnum] doa_bannerelement::is_open(localclientnum))
	{
		level.doa.var_4f001f48[localclientnum] doa_bannerelement::function_aa5c711d(localclientnum, 0);
		level.doa.var_4f001f48[localclientnum] doa_bannerelement::close(localclientnum);
	}
	if(level.doa.var_51c724d6[localclientnum] doa_bannerelement::is_open(localclientnum))
	{
		level.doa.var_51c724d6[localclientnum] doa_bannerelement::function_aa5c711d(localclientnum, 0);
		level.doa.var_51c724d6[localclientnum] doa_bannerelement::close(localclientnum);
	}
	level notify(#"hash_75b2813809fa8394");
}

/*
	Name: function_9a92c603
	Namespace: namespace_a6ddb172
	Checksum: 0x9775DA11
	Offset: 0x32D0
	Size: 0x524
	Parameters: 2
	Flags: Linked
*/
function function_9a92c603(localclientnum, var_150143d0)
{
	/#
		assert(localclientnum >= 0 && localclientnum <= 1);
	#/
	if(!isdefined(self))
	{
		return;
	}
	self notify("5db9afb03d551ec1");
	self endon("5db9afb03d551ec1");
	level endon(#"hash_75b2813809fa8394");
	text = var_150143d0.text;
	if(!isdefined(text))
	{
		return;
	}
	text2 = var_150143d0.text2;
	x = (isdefined(var_150143d0.x) ? var_150143d0.x : 0);
	y = (isdefined(var_150143d0.y) ? var_150143d0.y : 200);
	var_42f603e1 = (isdefined(var_150143d0.var_42f603e1) ? var_150143d0.var_42f603e1 : 0.4);
	var_a5866ebf = (isdefined(var_150143d0.var_a5866ebf) ? var_150143d0.var_a5866ebf : 1);
	timeout = (isdefined(var_150143d0.timeout) ? var_150143d0.timeout : 10);
	color = (isdefined(var_150143d0.color) ? var_150143d0.color : (1, 0.2, 0.2));
	var_a4283692 = (isdefined(var_150143d0.var_a4283692) ? var_150143d0.var_a4283692 : 0);
	var_4659a519 = (isdefined(var_150143d0.var_4659a519) ? var_150143d0.var_4659a519 : 1);
	fadetime = (isdefined(var_150143d0.fadetime) ? var_150143d0.fadetime : 2);
	scale = (isdefined(var_150143d0.scale) ? var_150143d0.scale : 1);
	payload = var_150143d0.payload;
	var_6dcbe6ee = var_150143d0.var_6dcbe6ee;
	delay = var_150143d0.delay;
	var_b6501bb5 = var_150143d0.var_b6501bb5;
	if(isdefined(delay))
	{
		wait(delay);
		if(!isdefined(self))
		{
			return;
		}
	}
	if(isdefined(var_150143d0.announce))
	{
		level thread namespace_9fc66ac::announce(localclientnum, var_150143d0.announce);
	}
	if(!self doa_textelement::is_open(localclientnum) && isdefined(text))
	{
		self doa_textelement::open(localclientnum);
		if(isdefined(payload))
		{
			self doa_textelement::function_9e089af4(localclientnum, payload);
		}
		self doa_textelement::function_f50d5765(localclientnum, text);
		self doa_textelement::function_f97e9049(localclientnum, x, y);
		self doa_textelement::function_aa5c711d(localclientnum, 0);
		self doa_textelement::set_color(localclientnum, color[0], color[1], color[2]);
		self doa_textelement::function_bede6f52(localclientnum, scale);
		if(isdefined(var_6dcbe6ee))
		{
			self thread function_c11d702b(localclientnum, var_6dcbe6ee, var_42f603e1, var_a5866ebf);
		}
		else
		{
			self function_3ce17e62(localclientnum, var_a4283692, var_4659a519, fadetime);
		}
	}
	wait(timeout);
	if(!isdefined(self))
	{
		return;
	}
	self function_3ce17e62(localclientnum, var_4659a519, var_a4283692, fadetime);
	if(isdefined(text2))
	{
		self doa_textelement::function_f50d5765(localclientnum, text2);
		self function_3ce17e62(localclientnum, var_a4283692, var_4659a519, fadetime);
		if(isdefined(var_b6501bb5))
		{
			wait(var_b6501bb5);
			if(!isdefined(self))
			{
				return;
			}
		}
	}
	if(self doa_bannerelement::is_open(localclientnum))
	{
		self doa_bannerelement::function_aa5c711d(localclientnum, 0);
		self doa_bannerelement::close(localclientnum);
	}
}

/*
	Name: function_3ce17e62
	Namespace: namespace_a6ddb172
	Checksum: 0x9D58950B
	Offset: 0x3800
	Size: 0x12E
	Parameters: 4
	Flags: Linked
*/
function function_3ce17e62(localclientnum, var_ab7c878c, var_393b2936, durationseconds)
{
	/#
		assert(localclientnum >= 0 && localclientnum <= 1);
	#/
	n_time_start = gettime();
	n_time_end = gettime() + (int(durationseconds * 1000));
	n_timer = n_time_start;
	while(isdefined(self) && [[ self ]]->is_open(localclientnum))
	{
		n_timer = gettime();
		if(n_timer >= n_time_end)
		{
			[[ self ]]->function_aa5c711d(localclientnum, var_393b2936);
			return;
		}
		var_5db054c7 = mapfloat(n_time_start, n_time_end, var_ab7c878c, var_393b2936, n_timer);
		[[ self ]]->function_aa5c711d(localclientnum, var_5db054c7);
		waitframe(1);
	}
}

/*
	Name: function_c11d702b
	Namespace: namespace_a6ddb172
	Checksum: 0xBC86AFE3
	Offset: 0x3938
	Size: 0x19E
	Parameters: 4
	Flags: Linked
*/
function function_c11d702b(localclientnum, durationseconds, lowalpha, highalpha)
{
	/#
		assert(localclientnum >= 0 && localclientnum <= 1);
	#/
	n_time_start = gettime();
	n_time_end = gettime() + (int(durationseconds * 1000));
	n_timer = n_time_start;
	var_fc4d0311 = lowalpha;
	startalpha = highalpha;
	while(isdefined(self) && [[ self ]]->is_open(localclientnum))
	{
		n_timer = gettime();
		if(n_timer >= n_time_end)
		{
			[[ self ]]->function_aa5c711d(localclientnum, var_fc4d0311);
			n_time_start = gettime();
			n_time_end = gettime() + (int(durationseconds * 1000));
			n_timer = n_time_start;
			temp = startalpha;
			startalpha = var_fc4d0311;
			var_fc4d0311 = temp;
		}
		else
		{
			var_5db054c7 = mapfloat(n_time_start, n_time_end, startalpha, var_fc4d0311, n_timer);
			[[ self ]]->function_aa5c711d(localclientnum, var_5db054c7);
		}
		waitframe(1);
	}
}

