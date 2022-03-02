#using script_5971282fa1e50330;

#namespace flowgraph_trigger;

/*
	Name: function_40a504de
	Namespace: flowgraph_trigger
	Checksum: 0x3C6521EE
	Offset: 0x68
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_40a504de()
{
	level notify(125858388);
}

/*
	Name: ontriggerentered
	Namespace: flowgraph_trigger
	Checksum: 0xF72D44A9
	Offset: 0x88
	Size: 0x88
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
		self flowgraph::kick(array(1, waitresult.activator));
	}
}

