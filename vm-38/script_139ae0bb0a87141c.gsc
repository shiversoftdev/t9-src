#using script_fe983bbff18d77f;
#using script_6f8610e78fdd3440;
#using script_1883fa4e60abbf9f;
#using script_7e3221b6c80d8cc4;
#using script_5450c003e8a913b7;
#using script_3072532951b5b4ae;
#using scripts\core_common\ai_shared.gsc;
#using script_7b68dad851540de;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace group;

/*
	Name: function_2e8983ef
	Namespace: group
	Checksum: 0x6CA4736E
	Offset: 0x178
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2e8983ef()
{
	level notify(-445160610);
}

/*
	Name: scalevolume
	Namespace: group
	Checksum: 0xCE1E8598
	Offset: 0x198
	Size: 0x14
	Parameters: 2
	Flags: None
*/
function scalevolume(ent, vol)
{
}

#namespace stealth_group;

/*
	Name: initgroup
	Namespace: stealth_group
	Checksum: 0x6F8A4A44
	Offset: 0x1B8
	Size: 0xF8
	Parameters: 1
	Flags: Linked
*/
function initgroup(groupname)
{
	if(!isdefined(level.stealth.groupdata))
	{
		level.stealth.groupdata = spawnstruct();
	}
	groupdata = level.stealth.groupdata;
	if(!isdefined(groupdata.groups))
	{
		groupdata.groups = [];
	}
	mygroup = groupdata.groups[groupname];
	if(!isdefined(mygroup))
	{
		mygroup = spawnstruct();
		groupdata.groups[groupname] = mygroup;
		mygroup.name = groupname;
		mygroup.members = [];
		mygroup.pods = [];
	}
	level.stealth.groupdata notify(groupname);
}

/*
	Name: addtogroup
	Namespace: stealth_group
	Checksum: 0xBBD34E67
	Offset: 0x2B8
	Size: 0xEC
	Parameters: 2
	Flags: Linked
*/
function addtogroup(groupname, guy)
{
	if(!isdefined(level.stealth.groupdata) || !isdefined(level.stealth.groupdata.groups) || !isdefined(level.stealth.groupdata.groups[groupname]))
	{
		initgroup(groupname);
	}
	mygroup = level.stealth.groupdata.groups[groupname];
	mygroup.members[mygroup.members.size] = guy;
	mygroup thread group_waitfordeath(guy);
}

/*
	Name: function_b6ebd4af
	Namespace: stealth_group
	Checksum: 0xE520E14C
	Offset: 0x3B0
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_b6ebd4af(guy)
{
	if(!isdefined(guy.script_stealthgroup))
	{
		return;
	}
	var_56952d23 = getgroup(guy.script_stealthgroup);
	if(isdefined(var_56952d23))
	{
		var_56952d23 function_34c06bfe(guy);
	}
}

/*
	Name: function_34c06bfe
	Namespace: stealth_group
	Checksum: 0xE897695B
	Offset: 0x420
	Size: 0x124
	Parameters: 1
	Flags: Linked
*/
function function_34c06bfe(guy)
{
	group_removefrompod(self, guy);
	var_da75a416 = self.members.size;
	for(var_774cf4d0 = 0; var_774cf4d0 < var_da75a416; var_774cf4d0++)
	{
		if(self.members[var_774cf4d0] == guy)
		{
			var_a47c95a3 = self.members.size - 1;
			self.members[var_774cf4d0] = self.members[var_a47c95a3];
			self.members[var_a47c95a3] = undefined;
			break;
		}
	}
	if(isdefined(guy.stealth) && isdefined(guy.stealth.cleardata))
	{
		region = guy.stealth.cleardata.curregion;
		guy namespace_5cd4acd8::huntunassignfromregion(region);
	}
}

/*
	Name: group_waitfordeath
	Namespace: stealth_group
	Checksum: 0x47A22F55
	Offset: 0x550
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function group_waitfordeath(guy)
{
	guy waittill(#"death");
	guy thread namespace_f1f700ac::death_cleanup();
	self function_34c06bfe(guy);
}

/*
	Name: clearallgroups
	Namespace: stealth_group
	Checksum: 0x63EDA8FC
	Offset: 0x5B0
	Size: 0x172
	Parameters: 0
	Flags: None
*/
function clearallgroups()
{
	if(!isdefined(level.stealth.groupdata))
	{
		return;
	}
	if(!isdefined(level.stealth.groupdata.groups))
	{
		return;
	}
	/#
		foreach(group in level.stealth.groupdata.groups)
		{
			if(isdefined(group.pods))
			{
				foreach(pod in group.pods)
				{
					pod notify(#"debug off");
				}
			}
		}
	#/
	level.stealth.groupdata.groups = undefined;
}

/*
	Name: getgroup
	Namespace: stealth_group
	Checksum: 0xC29BAE96
	Offset: 0x730
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function getgroup(groupname)
{
	/#
		assert(isdefined(level.stealth));
	#/
	/#
		assert(isdefined(level.stealth.groupdata));
	#/
	/#
		assert(isdefined(level.stealth.groupdata.groups));
	#/
	return level.stealth.groupdata.groups[groupname];
}

/*
	Name: function_957fac82
	Namespace: stealth_group
	Checksum: 0xCA509509
	Offset: 0x7E0
	Size: 0x2BC
	Parameters: 0
	Flags: None
*/
function function_957fac82()
{
	/#
		foreach(group in level.stealth.groupdata.groups)
		{
			println("" + group.name);
			println("");
			foreach(guy in group.members)
			{
				println("" + guy getentitynumber());
			}
			var_d78e3a4f = 0;
			println("");
			foreach(pod in group.pods)
			{
				println(("" + var_d78e3a4f) + "");
				foreach(guy in pod.members)
				{
					println("" + guy getentitynumber());
				}
				var_d78e3a4f++;
			}
		}
	#/
}

/*
	Name: makenewpod
	Namespace: stealth_group
	Checksum: 0xEDC6E61
	Offset: 0xAA8
	Size: 0x98
	Parameters: 3
	Flags: Linked
*/
function makenewpod(groupdata, state, origin)
{
	var_d04be568 = spawnstruct();
	var_d04be568.state = state;
	var_d04be568.members = [];
	var_d04be568.parentgroup = groupdata;
	groupdata.pods[groupdata.pods.size] = var_d04be568;
	if(isdefined(origin))
	{
		function_f6ab9430(var_d04be568, origin);
	}
	return var_d04be568;
}

/*
	Name: function_f6ab9430
	Namespace: stealth_group
	Checksum: 0x29BE02B3
	Offset: 0xB48
	Size: 0x8C
	Parameters: 3
	Flags: Linked
*/
function function_f6ab9430(pod, origin, var_ccf5f27b)
{
	/#
		assert(isdefined(origin));
	#/
	pod.origin = getclosestpointonnavmesh(origin, 500, 16);
	if(!isdefined(pod.origin))
	{
		pod.origin = origin;
	}
	function_4f3db9c6(pod, var_ccf5f27b);
}

/*
	Name: addtopod
	Namespace: stealth_group
	Checksum: 0xD5791CE4
	Offset: 0xBE0
	Size: 0x2C
	Parameters: 2
	Flags: Linked
*/
function addtopod(pod, guy)
{
	pod.members[pod.members.size] = guy;
}

/*
	Name: function_4f3db9c6
	Namespace: stealth_group
	Checksum: 0xAADF58CA
	Offset: 0xC18
	Size: 0x20C
	Parameters: 2
	Flags: Linked
*/
function function_4f3db9c6(pod, var_ccf5f27b)
{
	mindistsq = sqr(100);
	if(!isdefined(var_ccf5f27b))
	{
		var_ccf5f27b = 0;
	}
	/#
		assert(isdefined(pod));
	#/
	if(!isdefined(pod.origin))
	{
		return;
	}
	if(var_ccf5f27b > 3)
	{
		return;
	}
	foreach(group in level.stealth.groupdata.groups)
	{
		foreach(var_dff5abf9 in group.pods)
		{
			if(var_dff5abf9 === pod)
			{
				continue;
			}
			if(!isdefined(var_dff5abf9.origin))
			{
				continue;
			}
			if(distancesquared(var_dff5abf9.origin, pod.origin) < mindistsq)
			{
				var_85bca00c = getrandomnavpoint(pod.origin, 500);
				if(isdefined(var_85bca00c))
				{
					function_f6ab9430(pod, var_85bca00c, var_ccf5f27b + 1);
				}
			}
		}
	}
}

/*
	Name: group_trytojoinexistingpod
	Namespace: stealth_group
	Checksum: 0xD13139A7
	Offset: 0xE30
	Size: 0x136
	Parameters: 5
	Flags: Linked
*/
function group_trytojoinexistingpod(groupdata, var_b53645b0, var_87ae720e, guy, var_844650da)
{
	var_76bc7166 = 65536;
	foreach(pod in groupdata.pods)
	{
		if(isdefined(var_b53645b0) && var_b53645b0 == pod)
		{
			continue;
		}
		if(pod.state == var_87ae720e)
		{
			if(distancesquared(var_844650da, pod.origin) < var_76bc7166)
			{
				group_removefrompod(groupdata, guy);
				addtopod(pod, guy);
				return pod;
			}
		}
	}
}

/*
	Name: group_assigntoinvestigatepod
	Namespace: stealth_group
	Checksum: 0x2CAC26EF
	Offset: 0xF70
	Size: 0x170
	Parameters: 3
	Flags: Linked
*/
function group_assigntoinvestigatepod(groupdata, guy, var_844650da)
{
	var_76bc7166 = 65536;
	var_3a13d151 = group_trytojoinexistingpod(groupdata, undefined, 1, guy, var_844650da);
	if(isdefined(var_3a13d151))
	{
		var_3a13d151 pod_updateinvestigateorigin(guy, var_844650da);
		return false;
	}
	group_removefrompod(groupdata, guy);
	var_d04be568 = makenewpod(groupdata, 1, var_844650da);
	addtopod(var_d04be568, guy);
	group_generateinitialinvestigatepoints(var_d04be568, guy.script_stealthgroup, var_844650da);
	vol = level.stealth.investigate_volumes[self.script_stealthgroup];
	if(isdefined(vol))
	{
		var_d04be568.volume = vol;
		var_d04be568.borigininvolume = vol istouching(var_844650da);
	}
	/#
		thread function_f0edd2ed(var_d04be568);
	#/
	return true;
}

/*
	Name: group_assigntohuntpod
	Namespace: stealth_group
	Checksum: 0x9CF25B13
	Offset: 0x10E8
	Size: 0x304
	Parameters: 4
	Flags: Linked
*/
function group_assigntohuntpod(groupdata, guy, lastknownpos, lastknowntime)
{
	group_removefrompod(guy, lastknownpos);
	foreach(pod in guy.pods)
	{
		if(pod.state == 2)
		{
			if(!isdefined(lastknownpos.enemy) || !isdefined(pod.target) || pod.target == lastknownpos.enemy)
			{
				addtopod(pod, lastknownpos);
				if(!isdefined(pod.target))
				{
					pod.target = lastknownpos.enemy;
					if(isdefined(lastknowntime))
					{
						function_f6ab9430(pod, lastknowntime);
					}
				}
				return;
			}
		}
	}
	if(!isdefined(lastknowntime))
	{
		lastknowntime = lastknownpos.origin;
	}
	var_d04be568 = makenewpod(guy, 2, lastknowntime);
	addtopod(var_d04be568, lastknownpos);
	var_d04be568.target = lastknownpos.enemy;
	group_generateinitialinvestigatepoints(var_d04be568, lastknownpos.script_stealthgroup, lastknowntime);
	vol = level.stealth.hunt_volumes[self.script_stealthgroup];
	if(isdefined(vol))
	{
		var_d04be568.volume = vol;
		var_d04be568.borigininvolume = vol istouching(lastknowntime);
	}
	var_d04be568.lastannouncetime = gettime();
	level thread pod_hunt_vo();
	var_d04be568 thread pod_hunt_update();
	var_d04be568 thread pod_hunt_delayednotify();
	/#
		if(isdefined(var_d04be568.borigininvolume) && !var_d04be568.borigininvolume)
		{
			stealth_debug::function_65b21ab8(lastknownpos, "");
		}
		else
		{
			stealth_debug::function_65b21ab8(lastknownpos, "");
		}
	#/
	/#
		var_d04be568 thread function_f0edd2ed(var_d04be568);
	#/
}

/*
	Name: group_removefrompod
	Namespace: stealth_group
	Checksum: 0xD2799050
	Offset: 0x13F8
	Size: 0x164
	Parameters: 2
	Flags: Linked
*/
function group_removefrompod(groupdata, guy)
{
	if(!isdefined(groupdata))
	{
		groupdata = getgroup(guy.script_stealthgroup);
	}
	pod = group_findpod(groupdata, guy);
	if(!isdefined(pod))
	{
		return;
	}
	var_da75a416 = pod.members.size;
	for(var_774cf4d0 = 0; var_774cf4d0 < var_da75a416; var_774cf4d0++)
	{
		if(pod.members[var_774cf4d0] == guy)
		{
			var_a47c95a3 = pod.members.size - 1;
			pod.members[var_774cf4d0] = pod.members[var_a47c95a3];
			pod.members[var_a47c95a3] = undefined;
			break;
		}
	}
	if(pod.members.size == 0)
	{
		if(pod.state == 2)
		{
			guy namespace_979752dc::group_flag_clear("stealth_combat_hunting", guy.script_stealthgroup);
		}
		pod pod_delete();
	}
}

/*
	Name: drawcross
	Namespace: stealth_group
	Checksum: 0x8E4FF02D
	Offset: 0x1568
	Size: 0xFC
	Parameters: 1
	Flags: None
*/
function drawcross(origin)
{
	/#
		r = 6;
		forward = (r, 0, 0);
		left = (0, r, 0);
		up = (0, 0, r);
		color = (0, 1, 0);
		line(origin - forward, origin + forward, color, 1, 0, 1);
		line(origin - left, origin + left, color, 1, 0, 1);
		line(origin - up, origin + up, color, 1, 0, 1);
	#/
}

/*
	Name: function_f0edd2ed
	Namespace: stealth_group
	Checksum: 0xAB5D7B98
	Offset: 0x1670
	Size: 0x58E
	Parameters: 1
	Flags: None
*/
function function_f0edd2ed(pod)
{
	/#
		pod endon(#"state_change");
		up = vectorscale((0, 0, 1), 128);
		down = vectorscale((0, 0, -1), 12);
		while(true)
		{
			if(stealth_debug::debug_enabled() && isdefined(pod.origin))
			{
				zoffset = 0;
				var_5a7a026e = [];
				foreach(group in level.stealth.groupdata.groups)
				{
					foreach(var_dff5abf9 in group.pods)
					{
						if(!isdefined(var_dff5abf9.origin))
						{
							continue;
						}
						if(distancesquared(var_dff5abf9.origin, pod.origin) < sqr(20))
						{
							if(pod == var_dff5abf9)
							{
								zoffset = var_5a7a026e.size * 30;
							}
							var_5a7a026e[var_5a7a026e.size] = var_dff5abf9;
						}
					}
				}
				zoffset = (0, 0, zoffset);
				line(pod.origin + zoffset, (pod.origin + up) + zoffset, (0, 0, 1), 1, 0, 1);
				groupname = pod.parentgroup.name;
				if(isdefined(groupname))
				{
					print3d(pod.origin + zoffset, groupname, (1, 1, 0), 1, 0.8, 1);
				}
				var_887c25e4 = "";
				foreach(member in pod.members)
				{
					if(isalive(member))
					{
						var_887c25e4 = var_887c25e4 + ("" + member getentitynumber());
					}
				}
				if(pod.state == 1)
				{
					print3d((pod.origin + zoffset) + down, "" + var_887c25e4, (1, 1, 0), 1, 0.4, 1);
				}
				else if(pod.state == 2)
				{
					print3d((pod.origin + zoffset) + down, "" + var_887c25e4, (1, 1, 0), 1, 0.4, 1);
				}
				foreach(point in pod.investigatepoints)
				{
					drawcross(point.origin);
				}
				var_7c70464e = pod.members.size;
				var_f2e0ace0 = 360 / var_7c70464e;
				for(var_e4551d3f = 0; var_e4551d3f < var_7c70464e + 1; var_e4551d3f++)
				{
					angle = var_e4551d3f * var_f2e0ace0;
					line(pod.origin, pod.origin + (128 * (cos(angle - var_f2e0ace0), sin(angle - var_f2e0ace0), 0)), (0, 1, 0), 1, 0, 1);
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: group_findsomeotherguytoinvestigate
	Namespace: stealth_group
	Checksum: 0x3FD6B46C
	Offset: 0x1C08
	Size: 0x2EA
	Parameters: 2
	Flags: Linked
*/
function group_findsomeotherguytoinvestigate(pos, var_ae3b954a)
{
	var_3f2754d4 = 2304;
	otherguy = undefined;
	closestdistsq = 2359296;
	var_b588680 = [];
	foreach(group in level.stealth.groupdata.groups)
	{
		if(group.name == var_ae3b954a)
		{
			continue;
		}
		volume = level.stealth.investigate_volumes[group.name];
		if(isdefined(volume) && !volume istouching(pos))
		{
			continue;
		}
		foreach(pod in group.pods)
		{
			if(pod.state == 1 && distance2dsquared(pod.origin, pos) < var_3f2754d4)
			{
				return undefined;
			}
		}
		foreach(guy in group.members)
		{
			if([[self.fnisinstealthidle]]())
			{
				distsq = distancesquared(guy.origin, pos);
				if(distsq < closestdistsq)
				{
					var_b588680[var_b588680.size] = guy;
					if(var_b588680.size > 8)
					{
						break;
					}
				}
			}
		}
	}
	if(var_b588680.size > 0)
	{
		otherguy = findclosestpointbyapproxpathdist(var_b588680, pos);
	}
	return otherguy;
}

/*
	Name: group_checkrequestbackupoutsideofvolume
	Namespace: stealth_group
	Checksum: 0xC9C7F3D
	Offset: 0x1F00
	Size: 0x114
	Parameters: 1
	Flags: Linked
*/
function group_checkrequestbackupoutsideofvolume(e)
{
	volume = level.stealth.investigate_volumes[self.script_stealthgroup];
	if(isdefined(volume))
	{
		if(!volume istouching(e.investigate_pos))
		{
			otherguy = group_findsomeotherguytoinvestigate(e.investigate_pos, self.script_stealthgroup);
			if(isdefined(otherguy))
			{
				/#
					stealth_debug::function_65b21ab8(self, "");
				#/
				/#
					stealth_debug::function_65b21ab8(self, "");
				#/
				/#
					stealth_debug::function_65b21ab8(otherguy, "");
				#/
				otherguy function_a3fcf9e0("seek_backup", self, e.investigate_pos);
				return true;
			}
		}
	}
	return false;
}

/*
	Name: group_eventinvestigate
	Namespace: stealth_group
	Checksum: 0x67887362
	Offset: 0x2020
	Size: 0x84
	Parameters: 3
	Flags: Linked
*/
function group_eventinvestigate(groupname, guy, e)
{
	groupdata = getgroup(groupname);
	var_89808178 = group_assigntoinvestigatepod(groupdata, guy, e.investigate_pos);
	if(var_89808178)
	{
		guy thread group_investigate_seekbackup(e);
	}
}

/*
	Name: group_investigate_seekbackup
	Namespace: stealth_group
	Checksum: 0xCF68C8CB
	Offset: 0x20B0
	Size: 0x17C
	Parameters: 1
	Flags: Linked
*/
function group_investigate_seekbackup(e)
{
	self endon(#"death", #"hash_15ec42f1846ef9d0", #"takedown");
	waitframe(1);
	self group_checkrequestbackupoutsideofvolume(e);
	waitframe(1);
	group = getgroup(self.script_stealthgroup);
	pod = group_findpod(group, self);
	if(!isdefined(pod))
	{
		return;
	}
	if(pod.members.size == 1)
	{
		var_da75a416 = group.members.size;
		for(var_774cf4d0 = 0; var_774cf4d0 < var_da75a416; var_774cf4d0++)
		{
			otherguy = group.members[var_774cf4d0];
			if(otherguy.stealth.bsmstate == 0 && distancesquared(otherguy.origin, self.origin) < 10000)
			{
				otherguy ai::look_at(self, undefined, undefined, 0.55);
			}
		}
	}
}

/*
	Name: group_generateinitialinvestigatepoints
	Namespace: stealth_group
	Checksum: 0xBE442D64
	Offset: 0x2238
	Size: 0x25A
	Parameters: 3
	Flags: Linked
*/
function group_generateinitialinvestigatepoints(pod, groupname, origin)
{
	groupdata = getgroup(groupname);
	/#
		assert(pod.state == 1 || pod.state == 2);
	#/
	/#
		assert(!isdefined(pod.investigatepoints));
	#/
	var_804461ee = 1000000;
	var_c491acad = [];
	var_f5ea0eba = getnodearray("seek_patrol", "targetname");
	var_7e3b3cbc = struct::get_array("seek_patrol", "targetname");
	var_f5ea0eba = arraycombine(var_f5ea0eba, var_7e3b3cbc);
	var_e10e2e46 = 0;
	while(var_e10e2e46 < var_f5ea0eba.size)
	{
		var_594c1bc9 = 0;
		point = var_f5ea0eba[var_e10e2e46];
		if(distancesquared(point.origin, origin) > var_804461ee)
		{
			var_594c1bc9 = 1;
		}
		else if(isdefined(point.script_stealthgroup))
		{
			if(point.script_stealthgroup == groupname)
			{
				var_c491acad[var_c491acad.size] = point;
			}
			var_594c1bc9 = 1;
		}
		if(var_594c1bc9)
		{
			lastpoint = var_f5ea0eba.size - 1;
			var_f5ea0eba[var_e10e2e46] = var_f5ea0eba[lastpoint];
			var_f5ea0eba[lastpoint] = undefined;
		}
		else
		{
			var_e10e2e46++;
		}
	}
	var_c491acad = arraysortclosest(var_c491acad, origin);
	var_f5ea0eba = arraysortclosest(var_f5ea0eba, origin);
	pod.investigatepoints = arraycombine(var_c491acad, var_f5ea0eba);
}

/*
	Name: group_findpod
	Namespace: stealth_group
	Checksum: 0x7EA13FE8
	Offset: 0x24A0
	Size: 0xC8
	Parameters: 2
	Flags: Linked
*/
function group_findpod(groupdata, guy)
{
	if(!isdefined(groupdata.pods))
	{
		return;
	}
	var_7f61b3cb = groupdata.pods.size;
	for(var_87ea7ba7 = 0; var_87ea7ba7 < var_7f61b3cb; var_87ea7ba7++)
	{
		pod = groupdata.pods[var_87ea7ba7];
		var_da75a416 = pod.members.size;
		for(var_774cf4d0 = 0; var_774cf4d0 < var_da75a416; var_774cf4d0++)
		{
			if(pod.members[var_774cf4d0] == guy)
			{
				return pod;
			}
		}
	}
}

/*
	Name: pod_addusedpoint
	Namespace: stealth_group
	Checksum: 0x3391B7D7
	Offset: 0x2570
	Size: 0x6C
	Parameters: 2
	Flags: Linked
*/
function pod_addusedpoint(pod, point)
{
	if(!isdefined(pod.usedpoints))
	{
		pod.usedpoints = [];
	}
	pod.usedpoints[pod.usedpoints.size] = {#expire:gettime() + 5000, #origin:point};
}

/*
	Name: pod_cleanupusedpoints
	Namespace: stealth_group
	Checksum: 0x3EF553D
	Offset: 0x25E8
	Size: 0xDC
	Parameters: 1
	Flags: Linked
*/
function pod_cleanupusedpoints(pod)
{
	if(!isdefined(pod.usedpoints))
	{
		pod.usedpoints = [];
	}
	curtime = gettime();
	var_e10e2e46 = 0;
	while(var_e10e2e46 < pod.usedpoints.size)
	{
		if(isdefined(pod.usedpoints[var_e10e2e46].expire) && curtime >= pod.usedpoints[var_e10e2e46].expire)
		{
			pod.usedpoints[var_e10e2e46] = pod.usedpoints[pod.usedpoints.size - 1];
			pod.usedpoints[pod.usedpoints.size - 1] = undefined;
		}
		else
		{
			var_e10e2e46++;
		}
	}
}

/*
	Name: group_getinvestigatepoint
	Namespace: stealth_group
	Checksum: 0x5E7E3F4
	Offset: 0x26D0
	Size: 0x85E
	Parameters: 2
	Flags: Linked
*/
function group_getinvestigatepoint(guy, volume)
{
	/#
		assert(isdefined(volume.origin));
	#/
	if(!isdefined(volume.origin))
	{
		return (0, 0, 0);
	}
	groupdata = getgroup(volume.script_stealthgroup);
	pod = group_findpod(groupdata, volume);
	/#
		assert(isdefined(pod));
	#/
	/#
		assert(isdefined(pod.investigatepoints));
	#/
	/#
		assert(pod.state == 2 || pod.state == 1);
	#/
	/#
		assert(isdefined(pod.origin));
	#/
	if(!isdefined(pod.origin))
	{
		return volume.origin;
	}
	pod_cleanupusedpoints(pod);
	var_86a04485 = undefined;
	dots = [];
	arrayremovevalue(pod.members, undefined);
	foreach(member in pod.members)
	{
		data = spawnstruct();
		data.guy = member;
		var_5c185af = member.origin - pod.origin;
		data.angle = vectortoyaw(var_5c185af);
		dots[dots.size] = data;
		if(member == volume)
		{
			var_86a04485 = data.angle;
		}
	}
	/#
		assert(isdefined(var_86a04485));
	#/
	var_73f7fb2a = 0;
	foreach(dot in dots)
	{
		if(dot.angle < var_86a04485)
		{
			var_73f7fb2a++;
		}
	}
	var_5c185af = volume.origin - pod.origin;
	var_689e1c11 = length(var_5c185af);
	var_ee7f3a11 = 768;
	var_dc7be821 = 512;
	var_f64a59e = 256;
	var_5c49f737 = -128;
	var_29469527 = 64;
	var_f2e0ace0 = 360 / dots.size;
	var_941fad23 = var_73f7fb2a * var_f2e0ace0;
	foreach(point in pod.investigatepoints)
	{
		if(isdefined(point.lastinvestigatedtime))
		{
			continue;
		}
		if(ispointinlane(point, pod, var_941fad23, var_f2e0ace0, var_689e1c11, var_f64a59e))
		{
			point.lastinvestigatedtime = gettime();
			return point.origin;
		}
	}
	desireddist = var_689e1c11;
	if(var_689e1c11 > var_ee7f3a11)
	{
		desireddist = max(60, randomfloatrange(var_689e1c11 - (var_f64a59e * 2), var_689e1c11 - var_f64a59e));
	}
	else
	{
		if(var_689e1c11 > var_dc7be821)
		{
			desireddist = randomfloatrange(var_689e1c11 + var_5c49f737, var_689e1c11 + var_f64a59e);
		}
		else
		{
			desireddist = randomfloatrange(var_689e1c11, var_689e1c11 + var_f64a59e);
		}
	}
	var_dc04453c = (0.5 + var_73f7fb2a) + (randomfloatrange(-0.5, 0.5)) * var_f2e0ace0;
	var_8bfbd3f = (cos(var_dc04453c), sin(var_dc04453c), 0);
	desiredpos = pod.origin + (desireddist * var_8bfbd3f);
	var_9ea07d03 = pod.state == 2;
	smartobject = smart_object::function_ab981ed(desiredpos, pod.volume, 512, var_9ea07d03);
	if(isdefined(smartobject))
	{
		return self namespace_77fd5d41::function_4efdd16b(smartobject);
	}
	pod_addusedpoint(pod, self.origin);
	if(isdefined(pod.volume))
	{
		var_99400a59 = namespace_206491b4::findclosestnonlospointwithinvolume(pod.volume, volume.origin, desiredpos, pod.usedpoints, 12);
		if(isdefined(var_99400a59))
		{
			pod_addusedpoint(pod, var_99400a59);
			return var_99400a59;
		}
	}
	else if(volume.goalradius > 64 && isdefined(volume.scriptgoalpos))
	{
		var_99400a59 = namespace_206491b4::findclosestnonlospointwithinradius(volume.scriptgoalpos, volume.goalradius, volume.origin, desiredpos, pod.usedpoints, 12);
		if(isdefined(var_99400a59))
		{
			pod_addusedpoint(pod, var_99400a59);
			return var_99400a59;
		}
	}
	var_a212a37d = getclosestpointonnavmesh(desiredpos, 500, 16);
	if(!isdefined(var_a212a37d))
	{
		var_a212a37d = desiredpos;
	}
	var_e887f629 = undefined;
	if(isdefined(pod.volume))
	{
		var_e887f629 = self findlastpointonpathwithinvolume(var_a212a37d, pod.volume);
		if(!isdefined(var_e887f629))
		{
			var_e887f629 = getrandomnavpoint(pod.origin, var_29469527);
		}
	}
	if(!isdefined(var_e887f629))
	{
		var_e887f629 = getrandomnavpoint(var_a212a37d, var_29469527);
	}
	if(!isdefined(var_e887f629))
	{
		var_e887f629 = getclosestpointonnavmesh(pod.origin, 500, 16);
		if(!isdefined(var_e887f629))
		{
			var_e887f629 = pod.origin;
		}
	}
	return var_e887f629;
}

/*
	Name: ispointinlane
	Namespace: stealth_group
	Checksum: 0x62B0F510
	Offset: 0x2F38
	Size: 0xD6
	Parameters: 6
	Flags: Linked
*/
function ispointinlane(point, pod, var_941fad23, var_f2e0ace0, var_689e1c11, var_f64a59e)
{
	var_1a3a18a0 = point.origin - pod.origin;
	d = length(var_1a3a18a0);
	angle = vectortoyaw(var_1a3a18a0);
	diff = angle - var_941fad23;
	if(diff >= 0 && diff <= var_f2e0ace0)
	{
		if(var_689e1c11 + var_f64a59e > d)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: group_eventcoverblown
	Namespace: stealth_group
	Checksum: 0x112F3FC0
	Offset: 0x3018
	Size: 0xA4
	Parameters: 3
	Flags: Linked
*/
function group_eventcoverblown(groupname, guy, e)
{
	groupdata = getgroup(groupname);
	groupdata thread group_delayedcoverblownpropagation(guy);
	var_89808178 = group_assigntoinvestigatepod(groupdata, guy, e.investigate_pos);
	if(var_89808178)
	{
		self thread group_coverblown_seekbackup(groupdata, e);
	}
}

/*
	Name: group_delayedcoverblownpropagation
	Namespace: stealth_group
	Checksum: 0x657669D3
	Offset: 0x30C8
	Size: 0x3E
	Parameters: 1
	Flags: Linked
*/
function group_delayedcoverblownpropagation(guy)
{
	wait(2);
	if(isdefined(guy) && isalive(guy))
	{
		self.bcoverhasbeenblown = 1;
	}
}

/*
	Name: group_coverblown_seekbackup
	Namespace: stealth_group
	Checksum: 0xD9607EAD
	Offset: 0x3110
	Size: 0x22C
	Parameters: 2
	Flags: Linked
*/
function group_coverblown_seekbackup(groupdata, e)
{
	self endon(#"death", #"hash_15ec42f1846ef9d0", #"takedown");
	waitframe(1);
	pod = group_findpod(groupdata, self);
	if(!isdefined(pod))
	{
		return;
	}
	if(pod.members.size == 1)
	{
		var_da75a416 = groupdata.members.size;
		for(var_774cf4d0 = 0; var_774cf4d0 < var_da75a416; var_774cf4d0++)
		{
			otherguy = groupdata.members[var_774cf4d0];
			if(otherguy != self && otherguy.stealth.bsmstate == 0 && distancesquared(otherguy.origin, self.origin) < 10000)
			{
				otherguy ai::look_at(self, undefined, undefined, 0.55);
			}
		}
	}
	if(group_checkrequestbackupoutsideofvolume(e))
	{
		return;
	}
	if(groupdata.members.size > 1)
	{
		pod = group_findpod(groupdata, self);
		if(isdefined(pod) && pod.state == 1 && pod.members.size == 1 && (!isdefined(pod.borigininvolume) || pod.borigininvolume))
		{
			self thread namespace_979752dc::function_f5f4416f("stealth", "announce", "seek_backup", 2, undefined, 1);
		}
	}
}

/*
	Name: pod_updateinvestigateorigin
	Namespace: stealth_group
	Checksum: 0xF59D482B
	Offset: 0x3348
	Size: 0x80
	Parameters: 2
	Flags: Linked
*/
function pod_updateinvestigateorigin(guy, pos)
{
	/#
		assert(isdefined(pos));
	#/
	if(!isdefined(self))
	{
		return;
	}
	self.origin = pos;
	if(!isdefined(self.needsupdate))
	{
		self.needsupdate = [];
	}
	self.investigateoriginguy = guy;
	self.needsupdate[self.needsupdate.size] = guy;
}

/*
	Name: group_eventhunt
	Namespace: stealth_group
	Checksum: 0x5C8752E8
	Offset: 0x33D0
	Size: 0x11C
	Parameters: 2
	Flags: Linked
*/
function group_eventhunt(groupname, guy)
{
	groupdata = getgroup(groupname);
	lastknownpos = self.origin;
	lastknowntime = 0;
	if(isdefined(guy.enemy))
	{
		lastknownpos = guy lastknownpos(guy.enemy);
		lastknowntime = guy lastknowntime(guy.enemy);
		var_3951724e = getclosestpointonnavmesh(lastknownpos, 500, 16);
		if(!isdefined(var_3951724e))
		{
			var_3951724e = lastknownpos;
		}
		lastknownpos = var_3951724e;
	}
	group_removefrompod(groupdata, guy);
	group_assigntohuntpod(groupdata, guy, lastknownpos, lastknowntime);
}

/*
	Name: group_updatepodhuntorigin
	Namespace: stealth_group
	Checksum: 0xCA749914
	Offset: 0x34F8
	Size: 0x112
	Parameters: 2
	Flags: Linked
*/
function group_updatepodhuntorigin(guy, var_4af4ea3d)
{
	groupdata = getgroup(guy.script_stealthgroup);
	pod = group_findpod(groupdata, guy);
	/#
		assert(isdefined(pod));
	#/
	/#
		assert(pod.state == 2);
	#/
	/#
		assert(isdefined(var_4af4ea3d));
	#/
	function_f6ab9430(pod, var_4af4ea3d);
	pod.borigininvestigated = undefined;
	if(isdefined(pod.volume))
	{
		pod.borigininvolume = pod.volume istouching(pod.origin);
	}
	return pod.origin;
}

/*
	Name: pod_hunt_update
	Namespace: stealth_group
	Checksum: 0x46F48241
	Offset: 0x3618
	Size: 0xAA
	Parameters: 0
	Flags: Linked
*/
function pod_hunt_update()
{
	self endon(#"state_change");
	self thread pod_hunt_hunker_update();
	if(isdefined(level.stealth.hunttimeout) && level.stealth.hunttimeout[self.script_stealthgroup])
	{
		endtime = level.stealth.hunttimeout[self.script_stealthgroup];
		wait(endtime);
		self thread pod_settoidle();
	}
	else
	{
		return;
	}
}

/*
	Name: pod_hunt_hunker_update
	Namespace: stealth_group
	Checksum: 0x132C9D58
	Offset: 0x36D0
	Size: 0x106
	Parameters: 0
	Flags: Linked
*/
function pod_hunt_hunker_update()
{
	self endon(#"state_change");
	while(true)
	{
		var_65199be1 = isdefined(self.volume) && !is_true(self.borigininvolume);
		if(var_65199be1)
		{
			if(!isdefined(self.hunkerstarttime))
			{
				self.hunkerstarttime = gettime();
				self.bhunkering = 1;
			}
			else if(is_true(self.bhunkering) && gettime() > (self.hunkerstarttime + 20000))
			{
				self.bhunkering = undefined;
				self function_b55ead5e();
			}
		}
		else
		{
			self.bhunkering = undefined;
			self.hunkerstarttime = undefined;
			self function_b55ead5e();
		}
		waitframe(1);
	}
}

/*
	Name: function_b55ead5e
	Namespace: stealth_group
	Checksum: 0xD48F7FAD
	Offset: 0x37E0
	Size: 0xB0
	Parameters: 0
	Flags: Linked
*/
function function_b55ead5e()
{
	self.bhunkering = undefined;
	self.hunkerstarttime = undefined;
	foreach(member in self.members)
	{
		if(isalive(member))
		{
			member namespace_77fd5d41::hunt_hunker_terminate(member);
		}
	}
}

/*
	Name: pod_hunt_delayednotify
	Namespace: stealth_group
	Checksum: 0x7C99BA34
	Offset: 0x3898
	Size: 0x168
	Parameters: 0
	Flags: Linked
*/
function pod_hunt_delayednotify()
{
	self endon(#"state_change");
	wait(3);
	groupdata = self.parentgroup;
	foreach(guy in groupdata.members)
	{
		if(guy [[guy.fnisinstealthidle]]() || guy [[guy.fnisinstealthinvestigate]]())
		{
			var_d6fd5eab = 1;
			if(isdefined(guy.stealth.funcs) && isdefined(guy.stealth.funcs[#"hash_24243e64d705b92a"]))
			{
				var_d6fd5eab = guy [[guy.stealth.funcs[#"hash_24243e64d705b92a"]]]();
			}
			if(var_d6fd5eab)
			{
				guy namespace_f1f700ac::bt_set_stealth_state("hunt", undefined);
			}
		}
	}
}

/*
	Name: pod_hunt_vo
	Namespace: stealth_group
	Checksum: 0x8A9498D9
	Offset: 0x3A08
	Size: 0x4CA
	Parameters: 0
	Flags: Linked
*/
function pod_hunt_vo()
{
	if(!isdefined(level.bcs_stealthhuntthink))
	{
		level.bcs_stealthhuntthink = 1;
	}
	else
	{
		return;
	}
	first_lost = undefined;
	while(true)
	{
		hunters = [];
		foreach(group in level.stealth.groupdata.groups)
		{
			if(isdefined(group.pods))
			{
				foreach(pod in group.pods)
				{
					if(isdefined(pod.state) && pod.state == 2)
					{
						foreach(hunter in pod.members)
						{
							array::add(hunters, hunter);
						}
					}
				}
			}
		}
		if(hunters.size < 1)
		{
			break;
		}
		if(hunters.size > 1)
		{
			hunters = arraysortclosest(hunters, getplayers()[0].origin);
			if(!is_true(hunters[0].ignoreall))
			{
				leader = hunters[0];
				arrayremovevalue(hunters, leader);
				wait(randomfloatrange(2, 2.5));
				function_1eaaceab(hunters);
				hunters = arraysortclosest(hunters, getplayers()[0].origin);
				hunter = undefined;
				switch(hunters.size)
				{
					case 0:
					{
						break;
					}
					case 1:
					case 2:
					case 3:
					{
						hunter = hunters[randomint(hunters.size)];
						break;
					}
					default:
					{
						hunter = hunters[randomint(3)];
						break;
					}
				}
				if(!isdefined(hunter))
				{
					break;
				}
				array::add(hunters, leader);
				hunter thread namespace_979752dc::function_f5f4416f("stealth", "hunt", "lost_sight", undefined, undefined, 1);
			}
		}
		else
		{
			hunter = hunters[0];
			if(!is_true(hunter.ignoreall))
			{
				if(!isdefined(first_lost))
				{
					first_lost = 1;
					hunter thread namespace_979752dc::function_f5f4416f("stealth", "hunt", "first_lost");
				}
				else
				{
					hunter thread namespace_979752dc::function_f5f4416f("stealth", "hunt", "lost_sight");
				}
			}
		}
		wait(randomintrange(10, 15));
	}
	level.bcs_stealthhuntthink = undefined;
}

/*
	Name: group_assigntocombatpod
	Namespace: stealth_group
	Checksum: 0xF515A6C5
	Offset: 0x3EE0
	Size: 0x140
	Parameters: 2
	Flags: Linked
*/
function group_assigntocombatpod(groupdata, guy)
{
	group_removefrompod(groupdata, guy);
	foreach(pod in groupdata.pods)
	{
		if(pod.state == 3)
		{
			addtopod(pod, guy);
			return false;
		}
	}
	var_d04be568 = makenewpod(groupdata, 3, undefined);
	addtopod(var_d04be568, guy);
	var_d04be568 thread pod_combat_update_checklosttarget();
	var_d04be568 thread pod_combat_periodicping();
	return true;
}

/*
	Name: group_anyoneincombat
	Namespace: stealth_group
	Checksum: 0x5D280B69
	Offset: 0x4028
	Size: 0xB8
	Parameters: 1
	Flags: Linked
*/
function group_anyoneincombat(groupname)
{
	groupdata = getgroup(groupname);
	foreach(pod in groupdata.pods)
	{
		if(pod.state == 3)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: group_eventcombat
	Namespace: stealth_group
	Checksum: 0x6FEE2630
	Offset: 0x40E8
	Size: 0xDC
	Parameters: 3
	Flags: Linked
*/
function group_eventcombat(groupname, guy, target)
{
	var_23fa0e2d = getgroup(groupname);
	targetpos = undefined;
	if(isdefined(target))
	{
		targetpos = target.origin;
	}
	pod = group_findpod(var_23fa0e2d, guy);
	group_assigntocombatpod(var_23fa0e2d, guy);
	var_23fa0e2d thread group_delayedcombatpropagation(2, guy, target, targetpos);
	var_23fa0e2d thread group_delayedcombatpropagationfromhunt(3, guy, target, targetpos);
}

/*
	Name: group_delayedcombatpropagationfromhunt
	Namespace: stealth_group
	Checksum: 0x7849215E
	Offset: 0x41D0
	Size: 0x324
	Parameters: 4
	Flags: Linked
*/
function group_delayedcombatpropagationfromhunt(delaytime, guy, target, targetpos)
{
	wait(delaytime);
	if(!isdefined(guy) || !isalive(guy) || is_true(guy.in_melee_death))
	{
		return;
	}
	if(!isdefined(target))
	{
		return;
	}
	guy endon(#"death");
	target endon(#"death");
	var_5bc0b0ef = sqr(99999);
	foreach(groupdata in level.stealth.groupdata.groups)
	{
		var_760c584d = arraysort(groupdata.members, guy.origin);
		foreach(otherguy in var_760c584d)
		{
			if(!isdefined(otherguy))
			{
				continue;
			}
			if(guy == otherguy)
			{
				continue;
			}
			pod = group_findpod(groupdata, otherguy);
			if(!isdefined(pod))
			{
				continue;
			}
			if(pod.state == 1 || (pod.state == 2 && isdefined(pod.target) && pod.target == target))
			{
				if(guy.script_stealthgroup == otherguy.script_stealthgroup || distancesquared(guy.origin, otherguy.origin) < var_5bc0b0ef)
				{
					otherguy getenemyinfo(target);
					otherguy function_a3fcf9e0("combat", target, targetpos);
					/#
						stealth_debug::function_65b21ab8(otherguy, "");
					#/
					wait(0.5);
				}
			}
		}
	}
}

/*
	Name: group_delayedcombatpropagation
	Namespace: stealth_group
	Checksum: 0x622CEF40
	Offset: 0x4500
	Size: 0x4B4
	Parameters: 4
	Flags: Linked
*/
function group_delayedcombatpropagation(delaytime, guy, target, targetpos)
{
	initialwait = (float(function_60d95f53()) / 1000) * 2;
	wait(initialwait);
	if(is_true(guy.stealth.reacting))
	{
		guy waittill(#"hash_22ca87c523f21d6d");
	}
	if(delaytime > initialwait)
	{
		wait(delaytime - initialwait);
	}
	var_91239be5 = sqr(99999);
	if(!isdefined(guy) || !isalive(guy) || is_true(guy.in_melee_death))
	{
		return;
	}
	guy endon(#"death");
	self.bcoverhasbeenblown = 1;
	level notify(#"cover_blown");
	foreach(groupdata in level.stealth.groupdata.groups)
	{
		var_760c584d = arraysort(groupdata.members, guy.origin);
		foreach(otherguy in var_760c584d)
		{
			if(!isalive(otherguy))
			{
				continue;
			}
			if(guy == otherguy)
			{
				continue;
			}
			var_b288ad4a = 0;
			var_3f01ab8a = 0;
			pod = group_findpod(groupdata, otherguy);
			if(isdefined(pod) && pod.state == 3)
			{
				continue;
			}
			if(isdefined(target))
			{
				if(otherguy cansee(target))
				{
					var_b288ad4a = 1;
					var_3f01ab8a = 1;
					/#
						stealth_debug::function_65b21ab8(otherguy, "");
					#/
				}
			}
			if(!var_b288ad4a && otherguy cansee(guy))
			{
				var_b288ad4a = 1;
				/#
					stealth_debug::function_65b21ab8(otherguy, "");
				#/
			}
			if(!var_b288ad4a && distancesquared(otherguy.origin, guy.origin) < var_91239be5 && (!0 || otherguy util::has_tac_vis(guy)))
			{
				var_b288ad4a = 1;
				if(isdefined(target))
				{
					var_3f01ab8a = 1;
				}
				/#
					stealth_debug::function_65b21ab8(otherguy, "");
				#/
			}
			if(var_3f01ab8a)
			{
				otherguy getenemyinfo(target);
			}
			if(var_b288ad4a)
			{
				if(isdefined(target))
				{
					otherguy function_a3fcf9e0("combat", target, targetpos);
				}
				else
				{
					otherguy function_a3fcf9e0("combat", guy, guy.origin);
				}
				wait(0.5);
			}
		}
	}
}

/*
	Name: pod_settocombat
	Namespace: stealth_group
	Checksum: 0xA0952DB7
	Offset: 0x49C0
	Size: 0x100
	Parameters: 2
	Flags: None
*/
function pod_settocombat(var_3f01ab8a, enemy)
{
	/#
		assert(!var_3f01ab8a || isdefined(enemy));
	#/
	var_44edde10 = self.members;
	foreach(guy in var_44edde10)
	{
		if(var_3f01ab8a)
		{
			guy getenemyinfo(enemy);
		}
		guy function_a3fcf9e0("combat", enemy, enemy.origin);
	}
}

/*
	Name: groups_combat_checklosttarget
	Namespace: stealth_group
	Checksum: 0x3B1EC5D7
	Offset: 0x4AC8
	Size: 0x2E4
	Parameters: 0
	Flags: Linked
*/
function groups_combat_checklosttarget()
{
	level notify(#"hash_231bf1036978b7d8");
	level endon(#"hash_231bf1036978b7d8");
	waitframe(1);
	while(is_true(level.stealth.var_ffa24aff))
	{
		var_3b124a7f = [];
		var_2f7e139f = 1;
		foreach(groupdata in level.stealth.groupdata.groups)
		{
			foreach(pod in groupdata.pods)
			{
				if(pod.state == 3)
				{
					var_3b124a7f[var_3b124a7f.size] = pod;
					if(!isdefined(pod.bchecklosttarget) || !pod pod_haslostenemy())
					{
						var_2f7e139f = 0;
						break;
					}
				}
			}
			if(!var_2f7e139f)
			{
				break;
			}
		}
		if(var_2f7e139f)
		{
			foreach(var_49201461 in var_3b124a7f)
			{
				arrayremovevalue(var_49201461.members, undefined);
				if(var_49201461.members.size > 0)
				{
					var_62ac8068 = var_49201461.members[0];
					var_62ac8068 namespace_979752dc::group_flag_set("stealth_combat_hunting");
					var_49201461 pod_settohunt();
				}
				wait(randomfloatrange(0.5, 1));
			}
			return;
		}
		wait(2);
	}
}

/*
	Name: pod_combat_update_checklosttarget
	Namespace: stealth_group
	Checksum: 0xCB2D2CB4
	Offset: 0x4DB8
	Size: 0xEC
	Parameters: 0
	Flags: Linked
*/
function pod_combat_update_checklosttarget()
{
	self endon(#"state_change");
	wait(5);
	if(!self pod_haslostenemy() && isdefined(level.stealth.funcs) && isdefined(level.stealth.funcs[#"hash_6fddb66367e0a124"]))
	{
		self thread [[level.stealth.funcs[#"hash_6fddb66367e0a124"]]]();
	}
	if(!is_true(level.stealth.var_ffa24aff))
	{
		return;
	}
	self.bchecklosttarget = 1;
	level thread groups_combat_checklosttarget();
}

/*
	Name: pod_haslostenemy
	Namespace: stealth_group
	Checksum: 0x82A1047A
	Offset: 0x4EB0
	Size: 0x2E4
	Parameters: 0
	Flags: Linked
*/
function pod_haslostenemy()
{
	ctimetolose = 10000;
	var_36307b39 = 20000;
	var_e7b5c776 = 15000;
	cstillrighttheredistsq = 50625;
	curtime = gettime();
	var_2f31a4a5 = undefined;
	foreach(guy in self.members)
	{
		if(isdefined(guy.stealth.funcs) && isdefined(guy.stealth.funcs[#"hash_6fc6e860faaf2da5"]))
		{
			return guy [[guy.stealth.funcs[#"hash_6fc6e860faaf2da5"]]]();
		}
		enemy = guy.enemy;
		if(isdefined(enemy) && issentient(enemy) && isalive(enemy))
		{
			if(enemy.team != "allies")
			{
				return 0;
			}
			lasttime = guy lastknowntime(enemy);
			if(curtime < lasttime + ctimetolose)
			{
				return 0;
			}
			var_accfee47 = guy lastknownpos(enemy);
			if(curtime < (lasttime + var_36307b39) && distancesquared(enemy.origin, var_accfee47) < cstillrighttheredistsq)
			{
				return 0;
			}
			if(curtime < (lasttime + var_e7b5c776) && enemy util::has_tac_vis(var_accfee47))
			{
				return 0;
			}
			if(isdefined(self.benemyinlowcover))
			{
				return 0;
			}
			continue;
		}
		if(!isdefined(guy.enemy) && guy flag::exists("in_the_dark") && guy flag::get("in_the_dark") && (curtime - guy.lastenemysighttime) < ctimetolose)
		{
			return 0;
		}
	}
	return 1;
}

/*
	Name: pod_isclosetoanymembers
	Namespace: stealth_group
	Checksum: 0x7D88E8B5
	Offset: 0x51A0
	Size: 0x122
	Parameters: 3
	Flags: Linked
*/
function pod_isclosetoanymembers(otherguy, radius, var_2c0664ad)
{
	if(!var_2c0664ad)
	{
		var_2c0664ad = 0;
	}
	radiussq = radius * radius;
	function_1eaaceab(self.members);
	foreach(guy in self.members)
	{
		if(distancesquared(otherguy.origin, guy.origin) > radiussq)
		{
			continue;
		}
		if(var_2c0664ad && !otherguy util::has_tac_vis(guy))
		{
			continue;
		}
		return true;
	}
	return false;
}

/*
	Name: pod_combat_periodicping
	Namespace: stealth_group
	Checksum: 0x6FFF550A
	Offset: 0x52D0
	Size: 0x1DE
	Parameters: 0
	Flags: Linked
*/
function pod_combat_periodicping()
{
	self endon(#"state_change");
	var_69617fed = 1;
	var_26031df0 = 384;
	wait(var_69617fed);
	while(true)
	{
		foreach(group in level.stealth.groupdata.groups)
		{
			foreach(guy in group.members)
			{
				if(guy.stealth.bsmstate == 3 || guy.stealth.bsmstate == 2)
				{
					continue;
				}
				if(self pod_isclosetoanymembers(guy, var_26031df0, 1))
				{
					/#
						stealth_debug::function_65b21ab8(guy, "");
					#/
					guy function_a3fcf9e0("combat", guy, guy.origin);
				}
			}
		}
		wait(var_69617fed);
	}
}

/*
	Name: pod_settohunt
	Namespace: stealth_group
	Checksum: 0xD7197F1D
	Offset: 0x54B8
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function pod_settohunt()
{
	self thread function_b921795f();
}

/*
	Name: function_b921795f
	Namespace: stealth_group
	Checksum: 0x1F746ACE
	Offset: 0x54E0
	Size: 0x1D8
	Parameters: 0
	Flags: Linked, Private
*/
function private function_b921795f()
{
	self notify(#"pod_settohunt");
	self endon(#"pod_settohunt");
	var_44edde10 = arraycopy(self.members);
	var_44edde10 = arraysortclosest(var_44edde10, level.players[0].origin);
	foreach(guy in var_44edde10)
	{
		if(!isalive(guy))
		{
			continue;
		}
		var_d6fd5eab = 1;
		if(isdefined(guy.stealth.funcs) && isdefined(guy.stealth.funcs[#"hash_24243e64d705b92a"]))
		{
			var_d6fd5eab = guy [[guy.stealth.funcs[#"hash_24243e64d705b92a"]]]();
		}
		if(!var_d6fd5eab)
		{
			guy namespace_f1f700ac::bt_set_stealth_state("idle", undefined);
			continue;
		}
		guy namespace_f1f700ac::bt_set_stealth_state("hunt", undefined);
		wait(randomfloatrange(0.5, 1));
	}
}

/*
	Name: pod_settoidle
	Namespace: stealth_group
	Checksum: 0xA1631625
	Offset: 0x56C0
	Size: 0xA0
	Parameters: 0
	Flags: Linked
*/
function pod_settoidle()
{
	foreach(guy in self.members)
	{
		guy function_a3fcf9e0("reset", guy, guy.origin);
	}
}

/*
	Name: pod_isleader
	Namespace: stealth_group
	Checksum: 0xFC46CE3C
	Offset: 0x5768
	Size: 0x96
	Parameters: 1
	Flags: None
*/
function pod_isleader(guy)
{
	groupdata = getgroup(guy.script_stealthgroup);
	pod = group_findpod(groupdata, guy);
	if(!isdefined(pod))
	{
		return 0;
	}
	/#
		assert(pod.members.size > 0);
	#/
	return pod.members[0] == guy;
}

/*
	Name: pod_getclosestguy
	Namespace: stealth_group
	Checksum: 0x9376AD7C
	Offset: 0x5808
	Size: 0xFC
	Parameters: 1
	Flags: Linked
*/
function pod_getclosestguy(pos)
{
	closestguy = undefined;
	closestdistsq = 99999999;
	foreach(guy in self.members)
	{
		if(!isdefined(guy))
		{
			continue;
		}
		distsq = distancesquared(guy.origin, pos);
		if(!isdefined(closestguy) || distsq < closestdistsq)
		{
			closestguy = guy;
			closestdistsq = distsq;
		}
	}
	return closestguy;
}

/*
	Name: pod_delete
	Namespace: stealth_group
	Checksum: 0x4A59AAE8
	Offset: 0x5910
	Size: 0x108
	Parameters: 0
	Flags: Linked
*/
function pod_delete()
{
	self notify(#"state_change");
	/#
		assert(isdefined(self.parentgroup));
	#/
	/#
		assert(self.members.size == 0);
	#/
	groupdata = self.parentgroup;
	var_7f61b3cb = groupdata.pods.size;
	for(var_87ea7ba7 = 0; var_87ea7ba7 < var_7f61b3cb; var_87ea7ba7++)
	{
		if(groupdata.pods[var_87ea7ba7] == self)
		{
			var_542fc63d = groupdata.pods.size - 1;
			groupdata.pods[var_87ea7ba7] = groupdata.pods[var_542fc63d];
			groupdata.pods[var_542fc63d] = undefined;
			break;
		}
	}
}

