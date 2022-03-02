#using script_67049b48b589d81;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\lui_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_b7d49cfd;

/*
	Name: function_3fca8914
	Namespace: namespace_b7d49cfd
	Checksum: 0xC61CE2AA
	Offset: 0x110
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_3fca8914()
{
	level notify(2000092218);
}

/*
	Name: init
	Namespace: namespace_b7d49cfd
	Checksum: 0xE8519A53
	Offset: 0x130
	Size: 0x284
	Parameters: 0
	Flags: Linked
*/
function init()
{
	if(!isdefined(level.doa.var_258d537d))
	{
		level.doa.var_258d537d = spawnstruct();
		level.doa.var_258d537d.var_a6b0949b = [];
		shotnumber = 0;
		while(true)
		{
			shot = struct::get("podium_camera_shot" + shotnumber);
			if(!isdefined(shot))
			{
				break;
			}
			args = strtok(shot.script_parameters, ";");
			/#
				assert(args.size >= 4);
			#/
			shot.var_dd65e804 = float(args[0]);
			shot.var_411d90d0 = float(args[1]);
			shot.var_3e552258 = float(args[2]);
			shot.var_1c75c5b0 = int(args[3]);
			shot.targetstruct = struct::get(shot.target, "targetname");
			if(!isdefined(level.doa.var_258d537d.var_a6b0949b))
			{
				level.doa.var_258d537d.var_a6b0949b = [];
			}
			else if(!isarray(level.doa.var_258d537d.var_a6b0949b))
			{
				level.doa.var_258d537d.var_a6b0949b = array(level.doa.var_258d537d.var_a6b0949b);
			}
			level.doa.var_258d537d.var_a6b0949b[level.doa.var_258d537d.var_a6b0949b.size] = shot;
			shotnumber++;
		}
	}
}

/*
	Name: function_650e4410
	Namespace: namespace_b7d49cfd
	Checksum: 0x9CE003AD
	Offset: 0x3C0
	Size: 0xB4
	Parameters: 1
	Flags: Linked
*/
function function_650e4410(entity)
{
	self notify("71f4ed6e2d9065b8");
	self endon("71f4ed6e2d9065b8");
	entity endon(#"death");
	level endon(#"hash_713b04a42601792c", #"hash_2dc73ea9b586d104");
	while(true)
	{
		level.doa.var_b73cc08.origin = entity.origin;
		level.doa.var_b73cc08.angles = entity.angles;
		waitframe(1);
	}
}

/*
	Name: function_8d4cb2b
	Namespace: namespace_b7d49cfd
	Checksum: 0xD11A2077
	Offset: 0x480
	Size: 0x2FC
	Parameters: 1
	Flags: Linked
*/
function function_8d4cb2b(localclientnum)
{
	level endon(#"hash_2dc73ea9b586d104");
	self endon(#"disconnect");
	if(level.doa.var_258d537d.var_a6b0949b.size)
	{
		var_3dbe949b = namespace_ec06fe4a::function_e22ae9b3(localclientnum, self.origin, "tag_origin", self.angles, "outro dolly cam");
		var_3dbe949b thread namespace_ec06fe4a::function_d55f042c(level, "terminateCutScene");
		if(localclientnum == 0)
		{
			level thread function_650e4410(var_3dbe949b);
		}
		self.doa.var_10752c35 = 7;
		foreach(shot in level.doa.var_258d537d.var_a6b0949b)
		{
			var_3dbe949b.origin = shot.origin;
			var_3dbe949b.angles = shot.angles;
			lui::screen_fade_in(localclientnum, 0.5);
			if(shot.var_dd65e804 > 0)
			{
				wait(shot.var_dd65e804);
			}
			traveltime = shot.var_411d90d0;
			if(shot.var_3e552258 == 0)
			{
				traveltime = traveltime - 0.5;
			}
			if(isdefined(shot.targetstruct))
			{
				var_3dbe949b moveto(shot.targetstruct.origin, shot.var_411d90d0);
				var_3dbe949b rotateto(shot.targetstruct.angles, shot.var_411d90d0);
			}
			wait(traveltime);
			if(shot.var_3e552258 > 0)
			{
				wait(shot.var_3e552258);
			}
			if(shot.var_1c75c5b0)
			{
				lui::screen_fade_out(localclientnum, 0.5);
			}
		}
		level notify(#"hash_713b04a42601792c");
		if(isdefined(var_3dbe949b))
		{
			var_3dbe949b delete();
		}
		lui::screen_fade_in(localclientnum, 1);
	}
}

