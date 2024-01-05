#namespace gametype;

/*
	Name: init
	Namespace: gametype
	Checksum: 0x959B21F5
	Offset: 0xA0
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
	setvisiblescoreboardcolumns(bundle.scoreboard_1, bundle.scoreboard_2, bundle.scoreboard_3, bundle.scoreboard_4, bundle.scoreboard_5, bundle.var_d4259e74, bundle.var_54dd9ff6, bundle.var_5ee7b40a, bundle.var_6d3350a1, bundle.var_26d52900);
}

/*
	Name: function_788fb510
	Namespace: gametype
	Checksum: 0x5EE74E40
	Offset: 0x148
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
	Checksum: 0x8A7738BA
	Offset: 0x170
	Size: 0x1C4
	Parameters: 10
	Flags: Linked
*/
function setvisiblescoreboardcolumns(col1, col2, col3, col4, col5, col6, col7, col8, col9, col10)
{
	col1 = function_788fb510(col1);
	col2 = function_788fb510(col2);
	col3 = function_788fb510(col3);
	col4 = function_788fb510(col4);
	col5 = function_788fb510(col5);
	col6 = function_788fb510(col6);
	col7 = function_788fb510(col7);
	col8 = function_788fb510(col8);
	col9 = function_788fb510(col9);
	col10 = function_788fb510(col10);
	if(!level.rankedmatch)
	{
		setscoreboardcolumns(col1, col2, col3, col4, col5, col6, col7, col8, col9, col10, "sbtimeplayed", "shotshit", "shotsmissed", "victory");
	}
	else
	{
		setscoreboardcolumns(col1, col2, col3, col4, col5, col6, col7, col8, col9, col10);
	}
}

