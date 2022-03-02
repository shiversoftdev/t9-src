#using script_35857c2f8d30b2a4;

#namespace flowgraph_trigger;

/*
	Name: function_d38a9e8f
	Namespace: flowgraph_trigger
	Checksum: 0x2E530AA9
	Offset: 0x68
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d38a9e8f()
{
	level notify(1181725334);
}

/*
	Name: ontriggerentered
	Namespace: flowgraph_trigger
	Checksum: 0xA0EC920
	Offset: 0x88
	Size: 0x98
	Parameters: 2
	Flags: None
*/
function ontriggerentered(x, e_trigger)
{
	e_trigger endon(#"death");
	while(true)
	{
		waitresult = undefined;
		waitresult = e_trigger waittill(#"trigger");
		e_entity = waitresult.activator;
		self flowgraph::kick(array(1, e_entity));
	}
}

