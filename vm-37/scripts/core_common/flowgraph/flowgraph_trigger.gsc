#using scripts\core_common\flowgraph\flowgraph_core.gsc;

#namespace flowgraph_trigger;

/*
	Name: ontriggerentered
	Namespace: flowgraph_trigger
	Checksum: 0xFC16D7D3
	Offset: 0x68
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

