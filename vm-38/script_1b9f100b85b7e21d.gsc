#using script_1292451e284848cc;
#using script_3dc93ca9902a9cda;

#namespace namespace_33f8f0d7;

/*
	Name: function_209d785d
	Namespace: namespace_33f8f0d7
	Checksum: 0xC9CE6050
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_209d785d()
{
	level notify(1623105935);
}

#namespace snd;

/*
	Name: function_9ae4fc6f
	Namespace: snd
	Checksum: 0x953D0737
	Offset: 0x90
	Size: 0x2A
	Parameters: 2
	Flags: None
*/
function function_9ae4fc6f(soundalias, targets)
{
	return play(soundalias, targets);
}

/*
	Name: function_4286bd2c
	Namespace: snd
	Checksum: 0x64B493F
	Offset: 0xC8
	Size: 0x2C
	Parameters: 2
	Flags: None
*/
function function_4286bd2c(var_afe43979, var_24ea4e17)
{
	stop(var_afe43979, var_24ea4e17);
}

/*
	Name: function_2e9b6265
	Namespace: snd
	Checksum: 0x1A2E6E7
	Offset: 0x100
	Size: 0x34
	Parameters: 3
	Flags: None
*/
function function_2e9b6265(var_afe43979, var_1ed3fdf1, var_24ea4e17)
{
	function_d4e10f97(var_afe43979, var_1ed3fdf1, var_24ea4e17);
}

/*
	Name: function_b33d1cfe
	Namespace: snd
	Checksum: 0x72853D4A
	Offset: 0x140
	Size: 0x34
	Parameters: 3
	Flags: None
*/
function function_b33d1cfe(var_afe43979, volume, timeinseconds)
{
	function_db78159d(var_afe43979, volume, timeinseconds);
}

