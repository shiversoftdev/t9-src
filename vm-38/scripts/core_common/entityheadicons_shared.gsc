#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace entityheadicons_shared;

/*
	Name: function_a1decdb6
	Namespace: entityheadicons_shared
	Checksum: 0xE3344FDC
	Offset: 0x88
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a1decdb6()
{
	level notify(1471943214);
}

#namespace entityheadicons;

/*
	Name: init_shared
	Namespace: entityheadicons
	Checksum: 0xA88BDB78
	Offset: 0xA8
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function init_shared()
{
	callback::on_start_gametype(&start_gametype);
}

/*
	Name: start_gametype
	Namespace: entityheadicons
	Checksum: 0xF1572933
	Offset: 0xD8
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function start_gametype()
{
	if(!level.teambased)
	{
		return;
	}
	if(!isdefined(level.setentityheadicon))
	{
		level.setentityheadicon = &setentityheadicon;
	}
}

/*
	Name: setentityheadicon
	Namespace: entityheadicons
	Checksum: 0x7B9C5ACE
	Offset: 0x120
	Size: 0x1FC
	Parameters: 3
	Flags: Linked
*/
function setentityheadicon(team, owner, objective)
{
	if(!level.teambased && !isdefined(owner))
	{
		return;
	}
	if(!isdefined(self.entityheadiconteam))
	{
		self.entityheadiconteam = #"none";
		self.entityheadobjectives = [];
	}
	if(level.teambased && !isdefined(owner))
	{
		if(team == self.entityheadiconteam)
		{
			return;
		}
		self.entityheadiconteam = team;
	}
	destroyentityheadicons();
	self.entityheadobjectives = [];
	self notify(#"kill_entity_headicon_thread");
	if(isdefined(objective))
	{
		if(isdefined(owner) && !level.teambased)
		{
			if(!isplayer(owner))
			{
				/#
					assert(isdefined(owner.owner), "");
				#/
				owner = owner.owner;
			}
			if(isdefined(objective))
			{
				if(team !== #"none")
				{
					owner updateentityheadteamobjective(self, team, objective);
				}
				else
				{
					owner updateentityheadclientobjective(self, objective);
				}
			}
		}
		else if(isdefined(owner) && team != #"none")
		{
			if(isdefined(objective))
			{
				owner updateentityheadteamobjective(self, team, objective);
			}
		}
	}
	self thread destroyheadiconsondeath();
}

/*
	Name: updateentityheadteamobjective
	Namespace: entityheadicons
	Checksum: 0x7B9A75AA
	Offset: 0x328
	Size: 0xA4
	Parameters: 3
	Flags: Linked
*/
function updateentityheadteamobjective(entity, team, objective)
{
	headiconobjectiveid = gameobjects::get_next_obj_id();
	objective_add(headiconobjectiveid, "active", entity, objective);
	objective_setteam(headiconobjectiveid, team);
	function_29ef32ee(headiconobjectiveid, team);
	entity.entityheadobjectives[entity.entityheadobjectives.size] = headiconobjectiveid;
}

/*
	Name: updateentityheadclientobjective
	Namespace: entityheadicons
	Checksum: 0x940D6350
	Offset: 0x3D8
	Size: 0x9C
	Parameters: 2
	Flags: Linked
*/
function updateentityheadclientobjective(entity, objective)
{
	headiconobjectiveid = gameobjects::get_next_obj_id();
	objective_add(headiconobjectiveid, "active", entity, objective);
	function_56ad6a7a(headiconobjectiveid);
	objective_setvisibletoplayer(headiconobjectiveid, self);
	entity.entityheadobjectives[entity.entityheadobjectives.size] = headiconobjectiveid;
}

/*
	Name: destroyheadiconsondeath
	Namespace: entityheadicons
	Checksum: 0xC1660904
	Offset: 0x480
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function destroyheadiconsondeath()
{
	self notify(#"destroyheadiconsondeath_singleton");
	self endon(#"destroyheadiconsondeath_singleton");
	self waittill(#"death", #"hacked");
	destroyentityheadicons();
}

/*
	Name: destroyentityheadicons
	Namespace: entityheadicons
	Checksum: 0x727D36BE
	Offset: 0x4E8
	Size: 0x9E
	Parameters: 0
	Flags: Linked
*/
function destroyentityheadicons()
{
	if(isdefined(self.entityheadobjectives))
	{
		for(i = 0; i < self.entityheadobjectives.size; i++)
		{
			if(isdefined(self.entityheadobjectives[i]))
			{
				gameobjects::release_obj_id(self.entityheadobjectives[i]);
				objective_delete(self.entityheadobjectives[i]);
			}
		}
	}
	if(isdefined(self))
	{
		self.entityheadobjectives = [];
	}
}

