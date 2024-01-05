#using scripts\core_common\ai\archetype_utility.gsc;
#using scripts\core_common\ai\archetype_civilian.gsc;
#using script_59f07c660e6710a5;

#namespace civilianinterface;

/*
	Name: registercivilianinterfaceattributes
	Namespace: civilianinterface
	Checksum: 0xE11E449
	Offset: 0x98
	Size: 0x26C
	Parameters: 0
	Flags: Linked
*/
function registercivilianinterfaceattributes()
{
	ai::registermatchedinterface(#"civilian", #"disablearrivals", 0, array(1, 0), &aiutility::arrivalattributescallback);
	ai::registermatchedinterface(#"civilian", #"hash_78e762abc4fbf1de", "calm", array("calm", "panic", "riot", "run"));
	ai::registermatchedinterface(#"civilian", #"auto_escape", 1, array(1, 0));
	ai::registermatchedinterface(#"civilian", #"auto_wander", 0, array(1, 0));
	ai::registermatchedinterface(#"civilian", #"usegrenades", 1, array(1, 0));
	ai::registerentityinterface(#"civilian", #"follow", undefined, &archetypecivilian::function_49d80e54);
	ai::registermatchedinterface(#"civilian", #"stealth", 0, array(1, 0));
	ai::registermatchedinterface(#"civilian", #"coveridleonly", 0, array(1, 0));
}

