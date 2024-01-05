#namespace flowgraph;

/*
	Name: call_func
	Namespace: flowgraph
	Checksum: 0x44C8FE12
	Offset: 0x68
	Size: 0x6C2
	Parameters: 3
	Flags: Private
*/
function private call_func(func, arg_count, args)
{
	switch(arg_count)
	{
		case 0:
		{
			return self [[func]]();
			break;
		}
		case 1:
		{
			return self [[func]](args[0]);
			break;
		}
		case 2:
		{
			return self [[func]](args[0], args[1]);
			break;
		}
		case 3:
		{
			return self [[func]](args[0], args[1], args[2]);
			break;
		}
		case 4:
		{
			return self [[func]](args[0], args[1], args[2], args[3]);
			break;
		}
		case 5:
		{
			return self [[func]](args[0], args[1], args[2], args[3], args[4]);
			break;
		}
		case 6:
		{
			return self [[func]](args[0], args[1], args[2], args[3], args[4], args[5]);
			break;
		}
		case 7:
		{
			return self [[func]](args[0], args[1], args[2], args[3], args[4], args[5], args[6]);
			break;
		}
		case 8:
		{
			return self [[func]](args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7]);
			break;
		}
		case 9:
		{
			return self [[func]](args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8]);
			break;
		}
		case 10:
		{
			return self [[func]](args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9]);
			break;
		}
		case 11:
		{
			return self [[func]](args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9], args[10]);
			break;
		}
		case 12:
		{
			return self [[func]](args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9], args[10], args[11]);
			break;
		}
		case 13:
		{
			return self [[func]](args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9], args[10], args[11], args[12]);
			break;
		}
		case 14:
		{
			return self [[func]](args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9], args[10], args[11], args[12], args[13]);
			break;
		}
		case 15:
		{
			return self [[func]](args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9], args[10], args[11], args[12], args[13], args[14]);
			break;
		}
		case 16:
		{
			return self [[func]](args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9], args[10], args[11], args[12], args[13], args[14], args[15]);
			break;
		}
		default:
		{
			/#
				assertmsg("");
			#/
			break;
		}
	}
}

/*
	Name: evaluate_constant
	Namespace: flowgraph
	Checksum: 0x193392B
	Offset: 0x738
	Size: 0x3D6
	Parameters: 1
	Flags: Private
*/
function private evaluate_constant(input_def)
{
	/#
		assert(isdefined(input_def.constvalue));
	#/
	val = input_def.constvalue;
	switch(input_def.type)
	{
		case "fx":
		case "float":
		case "weapon":
		case "int":
		case "variant":
		case "scriptbundle":
		case "xmodel":
		case "xanim":
		case "bool":
		case "soundalias":
		case "vector":
		case "string":
		{
			return val;
		}
		case "entityarray":
		{
			/#
				assert(isstruct(val));
			#/
			/#
				assert(isdefined(val.value));
			#/
			/#
				assert(isdefined(val.key));
			#/
			return getentarray(val.value, val.key);
		}
		case "pathnode":
		case "spawner":
		case "ai":
		case "entity":
		case "vehicle":
		{
			/#
				assert(isstruct(val) || isstring(val));
			#/
			if(isstruct(val))
			{
				/#
					assert(isdefined(val.value));
				#/
				/#
					assert(isdefined(val.key));
				#/
				return getent(val.value, val.key);
			}
			else
			{
				/#
					assert(val == "" || val == "");
				#/
				if(val == "self")
				{
					return self.target;
				}
				else
				{
					return self.target.target;
				}
			}
		}
		case "struct":
		case "array":
		case "class":
		case "null":
		case "exec":
		{
			/#
				assertmsg("");
			#/
			return undefined;
		}
	}
	/#
		assertmsg(("" + input_def.type) + "");
	#/
	return undefined;
}

/*
	Name: get_node_output_param_index
	Namespace: flowgraph
	Checksum: 0xA7BDE575
	Offset: 0xB18
	Size: 0x80
	Parameters: 2
	Flags: Private
*/
function private get_node_output_param_index(node_def, param_name)
{
	for(i = 0; i < node_def.outputs.size; i++)
	{
		if(node_def.outputs[i].name == param_name)
		{
			return i;
		}
	}
	/#
		assertmsg("");
	#/
	return -1;
}

/*
	Name: get_node_input_param_index
	Namespace: flowgraph
	Checksum: 0x4F23D645
	Offset: 0xBA0
	Size: 0x80
	Parameters: 2
	Flags: Private
*/
function private get_node_input_param_index(node_def, param_name)
{
	for(i = 0; i < node_def.inputs.size; i++)
	{
		if(node_def.inputs[i].name == param_name)
		{
			return i;
		}
	}
	/#
		assertmsg("");
	#/
	return -1;
}

/*
	Name: is_auto_exec_node
	Namespace: flowgraph
	Checksum: 0x12C6880C
	Offset: 0xC28
	Size: 0xFC
	Parameters: 1
	Flags: Private
*/
function private is_auto_exec_node(node_def)
{
	if(node_def.nodeclass == #"event")
	{
		foreach(input_def in node_def.inputs)
		{
			if(input_def.type == #"exec")
			{
				if(isdefined(input_def.connections) && input_def.connections.size > 0)
				{
					return false;
				}
				continue;
			}
			if(!isdefined(input_def.constvalue))
			{
				return false;
			}
		}
		return true;
	}
	return false;
}

/*
	Name: get_graph_def
	Namespace: flowgraph
	Checksum: 0x34006D15
	Offset: 0xD30
	Size: 0x430
	Parameters: 2
	Flags: Private
*/
function private get_graph_def(graph_name, force_refresh)
{
	if(!isdefined(force_refresh))
	{
		force_refresh = 0;
	}
	if(!isdefined(level.flowgraphdefs))
	{
		level.flowgraphdefs = [];
	}
	if(isdefined(level.flowgraphdefs[graph_name]) && !force_refresh)
	{
		return level.flowgraphdefs[graph_name];
	}
	graph_def = getflowgraphdef(graph_name);
	indexed_nodes = [];
	foreach(node in graph_def.nodes)
	{
		indexed_nodes[node.uuid] = node;
	}
	graph_def.nodes = indexed_nodes;
	foreach(wire_def in graph_def.wires)
	{
		output_node = graph_def.nodes[wire_def.outputnodeuuid];
		/#
			assert(isdefined(output_node), ("" + graph_name) + "");
		#/
		input_node = graph_def.nodes[wire_def.inputnodeuuid];
		/#
			assert(isdefined(input_node), ("" + graph_name) + "");
		#/
		output_param_index = get_node_output_param_index(output_node, wire_def.outputparamname);
		input_param_index = get_node_input_param_index(input_node, wire_def.inputparamname);
		output_param = output_node.outputs[output_param_index];
		input_param = input_node.inputs[input_param_index];
		if(!isdefined(output_param.connections))
		{
			output_param.connections = [];
		}
		if(!isdefined(input_param.connections))
		{
			input_param.connections = [];
		}
		output_link = spawnstruct();
		output_link.node = input_node;
		output_link.paramindex = input_param_index;
		output_param.connections[output_param.connections.size] = output_link;
		input_link = spawnstruct();
		input_link.node = output_node;
		input_link.paramindex = output_param_index;
		input_param.connections[input_param.connections.size] = input_link;
	}
	graph_def.wires = undefined;
	foreach(node in graph_def.nodes)
	{
		node.is_auto_exec = is_auto_exec_node(node);
	}
	level.flowgraphdefs[graph_name] = graph_def;
	return graph_def;
}

/*
	Name: collect_outputs
	Namespace: flowgraph
	Checksum: 0xAA22949E
	Offset: 0x1168
	Size: 0x7A
	Parameters: 0
	Flags: Private
*/
function private collect_outputs()
{
	if(self.def.nodeclass == #"data" && self.evaluation_key != self.owner.evaluation_key)
	{
		self exec();
		self.evaluation_key = self.owner.evaluation_key;
	}
	return self.outputs;
}

/*
	Name: exec
	Namespace: flowgraph
	Checksum: 0xD4FFC168
	Offset: 0x11F0
	Size: 0xE4
	Parameters: 0
	Flags: Private
*/
function private exec()
{
	/#
		level endon(#"flowgraph_mychanges");
	#/
	if(self.def.nodeclass != #"thread")
	{
		self notify(#"kill_previous_exec");
		self endon(#"kill_previous_exec");
	}
	inputs = self collect_inputs();
	outputs = self call_func(self.def.func, self.def.inputs.size, inputs);
	if(isdefined(outputs))
	{
		self kick(outputs);
	}
}

/*
	Name: mychanges_watcher
	Namespace: flowgraph
	Checksum: 0x6066957C
	Offset: 0x12E0
	Size: 0xB4
	Parameters: 0
	Flags: Private
*/
function private mychanges_watcher()
{
	/#
		if(self.target != level)
		{
			self.target endon(#"death", #"delete");
		}
		level waittill(#"flowgraph_mychanges");
		get_graph_def(self.def.name, 1);
		self.target run({#flowgraph_asset:self.def.name});
	#/
}

/*
	Name: kick
	Namespace: flowgraph
	Checksum: 0x84C97977
	Offset: 0x13A0
	Size: 0x2A0
	Parameters: 2
	Flags: None
*/
function kick(outputs, block)
{
	if(!isdefined(block))
	{
		block = 0;
	}
	if(!isdefined(outputs))
	{
		outputs = [];
	}
	if(!isarray(outputs))
	{
		outputs = array(outputs);
	}
	/#
		assert(isarray(outputs), ("" + self.def.uuid) + "");
	#/
	/#
		assert(outputs.size == self.def.outputs.size, ((("" + self.def.uuid) + "") + self.def.outputs.size) + "");
	#/
	self.outputs = outputs;
	for(i = 0; i < self.def.outputs.size; i++)
	{
		output_def = self.def.outputs[i];
		if(output_def.type == #"exec" && self.outputs[i] && isdefined(output_def.connections))
		{
			foreach(connection_def in output_def.connections)
			{
				self.owner.evaluation_key++;
				node_inst = self.owner.nodes[connection_def.node.uuid];
				if(block)
				{
					node_inst exec();
					continue;
				}
				node_inst thread exec();
			}
		}
	}
}

/*
	Name: collect_inputs
	Namespace: flowgraph
	Checksum: 0xE67E7F6
	Offset: 0x1648
	Size: 0x2EC
	Parameters: 0
	Flags: None
*/
function collect_inputs()
{
	inputs = [];
	input_index = 0;
	foreach(input_def in self.def.inputs)
	{
		if(isdefined(input_def.constvalue))
		{
			inputs[input_index] = self evaluate_constant(input_def);
		}
		else
		{
			if(isdefined(input_def.connections))
			{
				if(input_def.type == #"exec")
				{
					result = 0;
					foreach(connection_def in input_def.connections)
					{
						node_inst = self.owner.nodes[connection_def.node.uuid];
						outputs = node_inst collect_outputs();
						result = result || outputs[connection_def.paramindex];
					}
					inputs[input_index] = result;
				}
				else
				{
					/#
						assert(input_def.connections.size == 1, ("" + input_def.name) + "");
					#/
					connection_def = input_def.connections[0];
					node_inst = self.owner.nodes[connection_def.node.uuid];
					outputs = node_inst collect_outputs();
					result = outputs[connection_def.paramindex];
					inputs[input_index] = result;
				}
			}
			else
			{
				if(input_def.type == #"exec" && self.def.is_auto_exec)
				{
					inputs[input_index] = 1;
				}
				else
				{
					inputs[input_index] = undefined;
				}
			}
		}
		input_index++;
	}
	return inputs;
}

/*
	Name: run
	Namespace: flowgraph
	Checksum: 0xFB97E94F
	Offset: 0x1940
	Size: 0x268
	Parameters: 1
	Flags: Event
*/
event run(eventstruct)
{
	graph_def = get_graph_def(eventstruct.flowgraph_asset);
	/#
		assert(isdefined(graph_def), ("" + eventstruct.flowgraph_asset) + "");
	#/
	graph_inst = spawnstruct();
	graph_inst.def = graph_def;
	graph_inst.nodes = [];
	if(isdefined(self))
	{
		graph_inst.target = self;
	}
	else
	{
		graph_inst.target = level;
	}
	graph_inst.evaluation_key = 0;
	foreach(node_def in graph_def.nodes)
	{
		node_inst = spawnstruct();
		node_inst.owner = graph_inst;
		node_inst.def = node_def;
		node_inst.target = graph_inst.target;
		node_inst.evaluation_key = 0;
		graph_inst.nodes[node_inst.def.uuid] = node_inst;
	}
	foreach(node_inst in graph_inst.nodes)
	{
		if(node_inst.def.is_auto_exec)
		{
			node_inst thread exec();
		}
	}
	/#
		graph_inst thread mychanges_watcher();
	#/
	graph_inst notify(#"flowgraph_run");
}

