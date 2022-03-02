#namespace namespace_bc92b51a;

/*
	Name: function_7e1ea203
	Namespace: namespace_bc92b51a
	Checksum: 0x418AF80B
	Offset: 0xA0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7e1ea203()
{
	level notify(1152666243);
}

#namespace gametype;

/*
	Name: init
	Namespace: gametype
	Checksum: 0xBAA5E267
	Offset: 0xC0
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	bundle = function_302bd0b9();
	level.var_d1455682 = bundle;
	if(!isdefined(bundle))
	{
		return;
	}
	setvisiblescoreboardcolumns(bundle.var_6d99d15e, bundle.var_7be9edfe, bundle.var_8f7881b, bundle.var_1744a4b5, bundle.var_267a4320, bundle.var_d4259e74, bundle.var_54dd9ff6, bundle.var_5ee7b40a, bundle.var_6d3350a1, bundle.var_26d52900);
}

/*
	Name: function_788fb510
	Namespace: gametype
	Checksum: 0x36D4FA0F
	Offset: 0x168
	Size: 0x20
	Parameters: 1
	Flags: Linked, Private
*/
function private function_788fb510(value)
{
	if(!isdefined(value))
	{
		return "";
	}
	return value;
}

/*
	Name: setvisiblescoreboardcolumns
	Namespace: gametype
	Checksum: 0x16C876F3
	Offset: 0x190
	Size: 0x1C4
	Parameters: 10
	Flags: Linked
*/
function setvisiblescoreboardcolumns(col1, col2, col3, col4, col5, col6, var_15af6c19, var_217983ad, var_eabe9600, var_9af375c9)
{
	col1 = function_788fb510(col1);
	col2 = function_788fb510(col2);
	col3 = function_788fb510(col3);
	col4 = function_788fb510(col4);
	col5 = function_788fb510(col5);
	col6 = function_788fb510(col6);
	var_15af6c19 = function_788fb510(var_15af6c19);
	var_217983ad = function_788fb510(var_217983ad);
	var_eabe9600 = function_788fb510(var_eabe9600);
	var_9af375c9 = function_788fb510(var_9af375c9);
	if(!level.rankedmatch)
	{
		setscoreboardcolumns(col1, col2, col3, col4, col5, col6, var_15af6c19, var_217983ad, var_eabe9600, var_9af375c9, "sbtimeplayed", "shotshit", "shotsmissed", "victory");
	}
	else
	{
		setscoreboardcolumns(col1, col2, col3, col4, col5, col6, var_15af6c19, var_217983ad, var_eabe9600, var_9af375c9);
	}
}

