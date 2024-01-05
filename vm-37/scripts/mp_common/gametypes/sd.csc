#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using script_13da4e6b98ca81a1;
#using scripts\core_common\struct.csc;

#namespace sd;

/*
	Name: main
	Namespace: sd
	Checksum: 0x9AB59087
	Offset: 0xE8
	Size: 0xFC
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	if(getgametypesetting(#"silentplant") != 0)
	{
		setsoundcontext("bomb_plant", "silent");
	}
	level.var_e4935474 = [];
	clientfield::function_5b7d846d("hudItems.war.attackingTeam", #"hash_11ea1e04b846f98e", #"attackingteam", 1, 2, "int", undefined, 0, 1);
	clientfield::register("scriptmover", "entityModelsNum", 1, 10, "int", &function_e116df6c, 0, 0);
}

/*
	Name: function_e116df6c
	Namespace: sd
	Checksum: 0xA08394C7
	Offset: 0x1F0
	Size: 0xEC
	Parameters: 7
	Flags: None
*/
function function_e116df6c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(level.var_e4935474))
	{
		level.var_e4935474 = [];
	}
	if(bwastimejump != fieldname)
	{
		entitynumber = self getentitynumber();
		if(bwastimejump != -1)
		{
			level.var_e4935474[entitynumber] = {};
			level.var_e4935474[entitynumber].var_eec7f99d = bwastimejump;
			level.var_e4935474[entitynumber].var_7c69bb09 = self.team;
		}
		codcaster::function_12acfa84();
	}
}

