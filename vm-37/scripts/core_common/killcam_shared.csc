#using script_13da4e6b98ca81a1;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace killcam;

/*
	Name: function_89f2df9
	Namespace: killcam
	Checksum: 0x9A6F157D
	Offset: 0x98
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"killcam", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: killcam
	Checksum: 0xA7BD59B2
	Offset: 0xE0
	Size: 0xCC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(sessionmodeiszombiesgame())
	{
		return;
	}
	callback::on_localclient_connect(&on_localclient_connect);
	callback::function_e9e16e2f(&function_e9e16e2f);
	callback::function_4f6cafea(&function_4f6cafea);
	callback::function_9fcd5f60(&function_9fcd5f60);
	callback::add_callback(#"hash_1184c2c2ed4c24b3", &function_c8bff20a);
}

/*
	Name: on_localclient_connect
	Namespace: killcam
	Checksum: 0x59307EE4
	Offset: 0x1B8
	Size: 0x50
	Parameters: 1
	Flags: Linked
*/
function on_localclient_connect(localclientnum)
{
	if(!isdefined(level.killcam))
	{
		level.killcam = [];
	}
	if(!isdefined(level.killcam[localclientnum]))
	{
		level.killcam[localclientnum] = {};
	}
}

/*
	Name: function_c8bff20a
	Namespace: killcam
	Checksum: 0xCDF0BB38
	Offset: 0x210
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_c8bff20a(eventstruct)
{
	if(eventstruct.gamestate === #"pregame")
	{
		function_bb763df8(eventstruct.localclientnum);
	}
}

/*
	Name: function_549a01b9
	Namespace: killcam
	Checksum: 0xBDE0BC37
	Offset: 0x260
	Size: 0x114
	Parameters: 1
	Flags: Linked
*/
function function_549a01b9(localclientnum)
{
	if(codcaster::function_b8fe9b52(localclientnum))
	{
		return;
	}
	if(function_56e2eaa8(self) && isdefined(level.killcam[localclientnum]) && game.state !== #"pregame")
	{
		level.killcam[localclientnum].var_57426003 = util::getnextobjid(localclientnum);
		objective_add(localclientnum, level.killcam[localclientnum].var_57426003, "active", #"hash_e8ccf98fcea7a36", vectorscale((0, 0, -1), 10000));
		objective_onentity(localclientnum, level.killcam[localclientnum].var_57426003, self, 0, 0, 0);
	}
}

/*
	Name: function_bb763df8
	Namespace: killcam
	Checksum: 0xA156E92D
	Offset: 0x380
	Size: 0xA6
	Parameters: 1
	Flags: Linked
*/
function function_bb763df8(localclientnum)
{
	if(isdefined(level.killcam[localclientnum]) && isdefined(level.killcam[localclientnum].var_57426003))
	{
		util::releaseobjid(localclientnum, level.killcam[localclientnum].var_57426003);
		objective_delete(localclientnum, level.killcam[localclientnum].var_57426003);
		level.killcam[localclientnum].var_57426003 = undefined;
	}
}

/*
	Name: function_e9e16e2f
	Namespace: killcam
	Checksum: 0x42CFAE5B
	Offset: 0x430
	Size: 0xEC
	Parameters: 1
	Flags: Linked
*/
function function_e9e16e2f(params)
{
	player = function_27673a7(params.localclientnum);
	if(!isdefined(player))
	{
		return;
	}
	number = player getentitynumber();
	test_player = getentbynum(params.localclientnum, number);
	if(test_player !== player)
	{
		return;
	}
	player function_2362a697(params.localclientnum, params.bundle);
	function_bb763df8(params.localclientnum);
	player function_549a01b9(params.localclientnum);
}

/*
	Name: function_4f6cafea
	Namespace: killcam
	Checksum: 0x4ECADC49
	Offset: 0x528
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function function_4f6cafea(params)
{
	function_bb763df8(params.localclientnum);
	player = function_27673a7(params.localclientnum);
	if(!isdefined(player))
	{
		return;
	}
	player function_dc3fa738(params.localclientnum);
}

/*
	Name: function_9fcd5f60
	Namespace: killcam
	Checksum: 0xB2F64C4D
	Offset: 0x5A0
	Size: 0xB4
	Parameters: 1
	Flags: Linked
*/
function function_9fcd5f60(params)
{
	player = function_27673a7(params.localclientnum);
	if(!isdefined(player))
	{
		return;
	}
	player function_dc3fa738(params.localclientnum);
	player function_2362a697(params.localclientnum, params.bundle);
	function_bb763df8(params.localclientnum);
	player function_549a01b9(params.localclientnum);
}

/*
	Name: function_2362a697
	Namespace: killcam
	Checksum: 0xF9FBE362
	Offset: 0x660
	Size: 0x86
	Parameters: 2
	Flags: Linked
*/
function function_2362a697(localclientnum, script_bundle)
{
	if(isdefined(level.killcam[localclientnum]) && isdefined(script_bundle))
	{
		var_c8b06dda = script_bundle.("posteffect");
		if(isdefined(var_c8b06dda))
		{
			self codeplaypostfxbundle(var_c8b06dda);
			level.killcam[localclientnum].var_c6128b93 = var_c8b06dda;
		}
	}
}

/*
	Name: function_dc3fa738
	Namespace: killcam
	Checksum: 0xF62B37D0
	Offset: 0x6F0
	Size: 0x6E
	Parameters: 1
	Flags: Linked
*/
function function_dc3fa738(localclientnum)
{
	if(isdefined(level.killcam[localclientnum].var_c6128b93))
	{
		self codestoppostfxbundle(level.killcam[localclientnum].var_c6128b93);
		level.killcam[localclientnum].var_c6128b93 = undefined;
	}
}

