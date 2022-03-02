#using script_5971282fa1e50330;

#namespace flowgraph_entity;

/*
	Name: function_bc4caa77
	Namespace: flowgraph_entity
	Checksum: 0xB5AC819F
	Offset: 0x68
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_bc4caa77()
{
	level notify(1885917274);
}

/*
	Name: isentitydefinedfunc
	Namespace: flowgraph_entity
	Checksum: 0xB7E6CA5E
	Offset: 0x88
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function isentitydefinedfunc(e_entity)
{
	return isdefined(e_entity);
}

/*
	Name: getentityorigin
	Namespace: flowgraph_entity
	Checksum: 0x7F1090D2
	Offset: 0xA0
	Size: 0x16
	Parameters: 1
	Flags: None
*/
function getentityorigin(e_entity)
{
	return e_entity.origin;
}

/*
	Name: getentityangles
	Namespace: flowgraph_entity
	Checksum: 0x7A05BC97
	Offset: 0xC0
	Size: 0x16
	Parameters: 1
	Flags: None
*/
function getentityangles(e_entity)
{
	return e_entity.angles;
}

/*
	Name: onentityspawned
	Namespace: flowgraph_entity
	Checksum: 0x35BB9C01
	Offset: 0xE0
	Size: 0x28
	Parameters: 1
	Flags: None
*/
function onentityspawned(e_entity)
{
	e_entity waittill(#"spawned");
	return true;
}

/*
	Name: onentitydamaged
	Namespace: flowgraph_entity
	Checksum: 0x6078DCE2
	Offset: 0x110
	Size: 0xD8
	Parameters: 2
	Flags: None
*/
function onentitydamaged(x, e_entity)
{
	e_entity endon(#"death");
	while(true)
	{
		waitresult = undefined;
		waitresult = e_entity waittill(#"damage");
		self flowgraph::kick(array(1, e_entity, waitresult.amount, waitresult.attacker, waitresult.direction, waitresult.position, waitresult.mod, waitresult.model_name, waitresult.tag_name, waitresult.part_name, waitresult.weapon, waitresult.flags));
	}
}

/*
	Name: function_fd19ef53
	Namespace: flowgraph_entity
	Checksum: 0x42F1A9B9
	Offset: 0x1F0
	Size: 0x20
	Parameters: 2
	Flags: None
*/
function function_fd19ef53(e_entity, str_field)
{
	return e_entity.(str_field);
}

/*
	Name: function_7e40ae2d
	Namespace: flowgraph_entity
	Checksum: 0xC3BF4A96
	Offset: 0x218
	Size: 0x38
	Parameters: 4
	Flags: None
*/
function function_7e40ae2d(x, e_entity, str_field, var_b8003601)
{
	e_entity.(str_field) = var_b8003601;
	return true;
}

