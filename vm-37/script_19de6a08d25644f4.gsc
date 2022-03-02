#using script_59f07c660e6710a5;

#namespace namespace_835228b4;

/*
	Name: function_7304e94b
	Namespace: namespace_835228b4
	Checksum: 0x1FE3EE9A
	Offset: 0x68
	Size: 0x15C
	Parameters: 0
	Flags: Linked
*/
function function_7304e94b()
{
	ai::registermatchedinterface(#"dog", #"chaseenemyonspawn", 1, array(1, 0));
	ai::registermatchedinterface(#"dog", #"spacing_near_dist", 120);
	ai::registermatchedinterface(#"dog", #"spacing_far_dist", 480);
	ai::registermatchedinterface(#"dog", #"spacing_horz_dist", 144);
	ai::registermatchedinterface(#"dog", #"spacing_value", 0);
	ai::registermatchedinterface(#"dog", #"min_run_dist", 700);
}

