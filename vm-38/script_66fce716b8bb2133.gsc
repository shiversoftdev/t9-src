#using scripts\core_common\array_shared.csc;
#using scripts\core_common\vehicle_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\struct.csc;

#namespace namespace_81522b3c;

/*
	Name: function_35a42635
	Namespace: namespace_81522b3c
	Checksum: 0x41E617C
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_35a42635()
{
	level notify(941059724);
}

/*
	Name: init
	Namespace: namespace_81522b3c
	Checksum: 0x16FABFB1
	Offset: 0xF0
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	vehicle::add_vehicletype_callback("bat", &function_9b3fe343);
}

/*
	Name: function_9b3fe343
	Namespace: namespace_81522b3c
	Checksum: 0xE7532C9A
	Offset: 0x128
	Size: 0x74
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9b3fe343(localclientnum)
{
	self mapshaderconstant(localclientnum, 0, "scriptVector2", 0.1);
	util::playfxontag(localclientnum, #"hash_1cb1e3e527bd121c", self, "tag_eye");
}

