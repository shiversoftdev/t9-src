#using script_35857c2f8d30b2a4;

#namespace flowgraph_trigger;

/*
	Name: ontriggerentered
	Namespace: flowgraph_trigger
	Checksum: 0xF68D8C0E
	Offset: 0x68
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

