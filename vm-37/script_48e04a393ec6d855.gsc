#using scripts\core_common\util_shared.gsc;

#namespace namespace_c9c45ed8;

/*
	Name: init
	Namespace: namespace_c9c45ed8
	Checksum: 0x61FBBE84
	Offset: 0xD8
	Size: 0x440
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level.doa.var_4bd98f7c = array({#type:-1, #hash_dd490566:1, #name:"invalid"}, {#type:0, #policy:0, #hash_d5ab2ea4:#"hash_3419b70eb1cb87d3", #name:"jungle_1_dungeon1"}, {#type:1, #policy:0, #hash_d5ab2ea4:#"hash_3419b80eb1cb8986", #name:"jungle_1_dungeon2"}, {#type:2, #policy:0, #hash_d5ab2ea4:#"hash_3419b90eb1cb8b39", #name:"jungle_1_dungeon3"}, {#type:-1, #hash_dd490566:1, #policy:0, #hash_d5ab2ea4:undefined, #name:"cellar"}, {#type:3, #policy:0, #hash_d5ab2ea4:#"hash_3419ba0eb1cb8cec", #name:"jungle_1_dungeon4"});
	level.doa.var_dfcf49f8 = 0;
	foreach(var_1c59693d in level.doa.var_4bd98f7c)
	{
		if(var_1c59693d.type == -1)
		{
			continue;
		}
		level.doa.var_dfcf49f8 = level.doa.var_dfcf49f8 | (1 << var_1c59693d.type);
	}
	/#
		var_663588d = "";
		foreach(var_1c59693d in level.doa.var_4bd98f7c)
		{
			if(is_true(var_1c59693d.var_dd490566))
			{
				continue;
			}
			name = function_9e72a96(var_1c59693d.name);
			locstr = function_9e72a96(var_1c59693d.var_d5ab2ea4);
			var_59ea00e = ("" + name) + "";
			util::add_devgui(var_663588d + name, var_59ea00e);
		}
	#/
}

