#using scripts\core_common\flowgraph\flowgraph_core.gsc;

#namespace flowgraph_shared;

/*
	Name: function_4e721c12
	Namespace: flowgraph_shared
	Checksum: 0x4D720847
	Offset: 0x68
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4e721c12()
{
	level notify(887744806);
}

#namespace flowgraph_logic;

/*
	Name: iffunc
	Namespace: flowgraph_logic
	Checksum: 0x409378DC
	Offset: 0x88
	Size: 0x2A
	Parameters: 2
	Flags: None
*/
function iffunc(x, b)
{
	return array(b, !b);
}

/*
	Name: orfunc
	Namespace: flowgraph_logic
	Checksum: 0x3101CD8
	Offset: 0xC0
	Size: 0x4A
	Parameters: 3
	Flags: None
*/
function orfunc(x, b_a, b_b)
{
	return array(b_a || b_b, !(b_a || b_b));
}

/*
	Name: andfunc
	Namespace: flowgraph_logic
	Checksum: 0x6C9DC261
	Offset: 0x118
	Size: 0x4A
	Parameters: 3
	Flags: None
*/
function andfunc(x, b_a, b_b)
{
	return array(b_a && b_b, !(b_a && b_b));
}

/*
	Name: notfunc
	Namespace: flowgraph_logic
	Checksum: 0x6246E32F
	Offset: 0x170
	Size: 0x12
	Parameters: 1
	Flags: None
*/
function notfunc(b_value)
{
	return !b_value;
}

/*
	Name: lessthan
	Namespace: flowgraph_logic
	Checksum: 0xE1955B8C
	Offset: 0x190
	Size: 0x1A
	Parameters: 2
	Flags: None
*/
function lessthan(var_8b1a2ec6, var_d2073c9f)
{
	return var_8b1a2ec6 < var_d2073c9f;
}

/*
	Name: function_b457969e
	Namespace: flowgraph_logic
	Checksum: 0xBF9E648A
	Offset: 0x1B8
	Size: 0x1A
	Parameters: 2
	Flags: None
*/
function function_b457969e(var_8b1a2ec6, var_d2073c9f)
{
	return var_8b1a2ec6 <= var_d2073c9f;
}

/*
	Name: greaterthan
	Namespace: flowgraph_logic
	Checksum: 0x42F182B4
	Offset: 0x1E0
	Size: 0x1A
	Parameters: 2
	Flags: None
*/
function greaterthan(var_8b1a2ec6, var_d2073c9f)
{
	return var_8b1a2ec6 > var_d2073c9f;
}

/*
	Name: function_3743e19e
	Namespace: flowgraph_logic
	Checksum: 0x7E78A608
	Offset: 0x208
	Size: 0x1A
	Parameters: 2
	Flags: None
*/
function function_3743e19e(var_8b1a2ec6, var_d2073c9f)
{
	return var_8b1a2ec6 >= var_d2073c9f;
}

/*
	Name: equal
	Namespace: flowgraph_logic
	Checksum: 0xB1C7B131
	Offset: 0x230
	Size: 0x1A
	Parameters: 2
	Flags: None
*/
function equal(var_8b1a2ec6, var_d2073c9f)
{
	return var_8b1a2ec6 == var_d2073c9f;
}

/*
	Name: function_5cb6d7c8
	Namespace: flowgraph_logic
	Checksum: 0xA52C05CE
	Offset: 0x258
	Size: 0xAC
	Parameters: 3
	Flags: None
*/
function function_5cb6d7c8(x, b_1, b_2)
{
	if(is_true(b_1))
	{
		self flowgraph::kick(array(undefined, 1, 0), 1);
	}
	else if(is_true(b_2))
	{
		self flowgraph::kick(array(undefined, 0, 1), 1);
	}
}

/*
	Name: function_4902305f
	Namespace: flowgraph_logic
	Checksum: 0xD187AC63
	Offset: 0x310
	Size: 0x114
	Parameters: 4
	Flags: None
*/
function function_4902305f(x, b_1, b_2, b_3)
{
	if(is_true(b_1))
	{
		self flowgraph::kick(array(undefined, 1, 0, 0), 1);
	}
	else
	{
		if(is_true(b_2))
		{
			self flowgraph::kick(array(undefined, 0, 1, 0), 1);
		}
		else if(is_true(b_3))
		{
			self flowgraph::kick(array(undefined, 0, 0, 1), 1);
		}
	}
}

/*
	Name: function_3b225c4
	Namespace: flowgraph_logic
	Checksum: 0x1824A6B2
	Offset: 0x430
	Size: 0x16C
	Parameters: 5
	Flags: None
*/
function function_3b225c4(x, b_1, b_2, b_3, b_4)
{
	if(is_true(b_1))
	{
		self flowgraph::kick(array(undefined, 1, 0, 0, 0), 1);
	}
	else
	{
		if(is_true(b_2))
		{
			self flowgraph::kick(array(undefined, 0, 1, 0, 0), 1);
		}
		else
		{
			if(is_true(b_3))
			{
				self flowgraph::kick(array(undefined, 0, 0, 1, 0), 1);
			}
			else if(is_true(b_4))
			{
				self flowgraph::kick(array(undefined, 0, 0, 0, 1), 1);
			}
		}
	}
}

/*
	Name: function_f82f0ebe
	Namespace: flowgraph_logic
	Checksum: 0x1262D3D6
	Offset: 0x5A8
	Size: 0x1C4
	Parameters: 6
	Flags: None
*/
function function_f82f0ebe(x, b_1, b_2, b_3, b_4, b_5)
{
	if(is_true(b_1))
	{
		self flowgraph::kick(array(undefined, 1, 0, 0, 0, 0), 1);
	}
	else
	{
		if(is_true(b_2))
		{
			self flowgraph::kick(array(undefined, 0, 1, 0, 0, 0), 1);
		}
		else
		{
			if(is_true(b_3))
			{
				self flowgraph::kick(array(undefined, 0, 0, 1, 0, 0), 1);
			}
			else
			{
				if(is_true(b_4))
				{
					self flowgraph::kick(array(undefined, 0, 0, 0, 1, 0), 1);
				}
				else if(is_true(b_5))
				{
					self flowgraph::kick(array(undefined, 0, 0, 0, 0, 1), 1);
				}
			}
		}
	}
}

/*
	Name: function_3f431ce5
	Namespace: flowgraph_logic
	Checksum: 0x92B8CC0D
	Offset: 0x778
	Size: 0x21C
	Parameters: 7
	Flags: None
*/
function function_3f431ce5(x, b_1, b_2, b_3, b_4, b_5, b_6)
{
	if(is_true(b_1))
	{
		self flowgraph::kick(array(undefined, 1, 0, 0, 0, 0, 0), 1);
	}
	else
	{
		if(is_true(b_2))
		{
			self flowgraph::kick(array(undefined, 0, 1, 0, 0, 0, 0), 1);
		}
		else
		{
			if(is_true(b_3))
			{
				self flowgraph::kick(array(undefined, 0, 0, 1, 0, 0, 0), 1);
			}
			else
			{
				if(is_true(b_4))
				{
					self flowgraph::kick(array(undefined, 0, 0, 0, 1, 0, 0), 1);
				}
				else
				{
					if(is_true(b_5))
					{
						self flowgraph::kick(array(undefined, 0, 0, 0, 0, 1, 0), 1);
					}
					else if(is_true(b_6))
					{
						self flowgraph::kick(array(undefined, 0, 0, 0, 0, 0, 1), 1);
					}
				}
			}
		}
	}
}

/*
	Name: function_2d817962
	Namespace: flowgraph_logic
	Checksum: 0xD31ABD72
	Offset: 0x9A0
	Size: 0x2AC
	Parameters: 8
	Flags: None
*/
function function_2d817962(x, b_1, b_2, b_3, b_4, b_5, b_6, b_7)
{
	if(is_true(b_1))
	{
		self flowgraph::kick(array(undefined, 1, 0, 0, 0, 0, 0, 0), 1);
	}
	else
	{
		if(is_true(b_2))
		{
			self flowgraph::kick(array(undefined, 0, 1, 0, 0, 0, 0, 0), 1);
		}
		else
		{
			if(is_true(b_3))
			{
				self flowgraph::kick(array(undefined, 0, 0, 1, 0, 0, 0, 0), 1);
			}
			else
			{
				if(is_true(b_4))
				{
					self flowgraph::kick(array(undefined, 0, 0, 0, 1, 0, 0, 0), 1);
				}
				else
				{
					if(is_true(b_5))
					{
						self flowgraph::kick(array(undefined, 0, 0, 0, 0, 1, 0, 0), 1);
					}
					else
					{
						if(is_true(b_6))
						{
							self flowgraph::kick(array(undefined, 0, 0, 0, 0, 0, 1, 0), 1);
						}
						else if(is_true(b_7))
						{
							self flowgraph::kick(array(undefined, 0, 0, 0, 0, 0, 0, 1), 1);
						}
					}
				}
			}
		}
	}
}

/*
	Name: function_c8fcb052
	Namespace: flowgraph_logic
	Checksum: 0x27942847
	Offset: 0xC58
	Size: 0x30C
	Parameters: 9
	Flags: None
*/
function function_c8fcb052(x, b_1, b_2, b_3, b_4, b_5, b_6, b_7, b_8)
{
	if(is_true(b_1))
	{
		self flowgraph::kick(array(undefined, 1, 0, 0, 0, 0, 0, 0, 0), 1);
	}
	else
	{
		if(is_true(b_2))
		{
			self flowgraph::kick(array(undefined, 0, 1, 0, 0, 0, 0, 0, 0), 1);
		}
		else
		{
			if(is_true(b_3))
			{
				self flowgraph::kick(array(undefined, 0, 0, 1, 0, 0, 0, 0, 0), 1);
			}
			else
			{
				if(is_true(b_4))
				{
					self flowgraph::kick(array(undefined, 0, 0, 0, 1, 0, 0, 0, 0), 1);
				}
				else
				{
					if(is_true(b_5))
					{
						self flowgraph::kick(array(undefined, 0, 0, 0, 0, 1, 0, 0, 0), 1);
					}
					else
					{
						if(is_true(b_6))
						{
							self flowgraph::kick(array(undefined, 0, 0, 0, 0, 0, 1, 0, 0), 1);
						}
						else
						{
							if(is_true(b_7))
							{
								self flowgraph::kick(array(undefined, 0, 0, 0, 0, 0, 0, 1, 0), 1);
							}
							else if(is_true(b_8))
							{
								self flowgraph::kick(array(undefined, 0, 0, 0, 0, 0, 0, 0, 1), 1);
							}
						}
					}
				}
			}
		}
	}
}

#namespace flowgraph_loops;

/*
	Name: forloop
	Namespace: flowgraph_loops
	Checksum: 0x228D9896
	Offset: 0xF70
	Size: 0x92
	Parameters: 3
	Flags: None
*/
function forloop(x, i_begin, i_end)
{
	i_step = 1;
	if(i_end < i_begin)
	{
		i_step = -1;
	}
	i = i_begin;
	while(i != i_end)
	{
		self flowgraph::kick(array(1, i), 1);
		i = i + i_step;
	}
}

/*
	Name: foreachloop
	Namespace: flowgraph_loops
	Checksum: 0x3BCCA18A
	Offset: 0x1010
	Size: 0xB0
	Parameters: 2
	Flags: None
*/
function foreachloop(x, a_items)
{
	foreach(item in a_items)
	{
		self flowgraph::kick(array(1, item), 1);
	}
}

/*
	Name: whileloop
	Namespace: flowgraph_loops
	Checksum: 0x3E58FE0
	Offset: 0x10C8
	Size: 0x6E
	Parameters: 2
	Flags: None
*/
function whileloop(x, b_condition)
{
	while(b_condition)
	{
		self flowgraph::kick(1, 1);
		inputs = self flowgraph::collect_inputs();
		b_condition = inputs[1];
	}
}

#namespace flowgraph_sequence;

/*
	Name: sequence2
	Namespace: flowgraph_sequence
	Checksum: 0x4513B686
	Offset: 0x1140
	Size: 0x6C
	Parameters: 1
	Flags: None
*/
function sequence2(x)
{
	self flowgraph::kick(array(1, 0), 1);
	self flowgraph::kick(array(0, 1), 1);
}

/*
	Name: sequence3
	Namespace: flowgraph_sequence
	Checksum: 0xAF7FBEFB
	Offset: 0x11B8
	Size: 0x9C
	Parameters: 1
	Flags: None
*/
function sequence3(x)
{
	self flowgraph::kick(array(1, 0, 0), 1);
	self flowgraph::kick(array(0, 1, 0), 1);
	self flowgraph::kick(array(0, 0, 1), 1);
}

/*
	Name: sequence4
	Namespace: flowgraph_sequence
	Checksum: 0x6767493
	Offset: 0x1260
	Size: 0xCC
	Parameters: 1
	Flags: None
*/
function sequence4(x)
{
	self flowgraph::kick(array(1, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 1, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 1, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 1), 1);
}

/*
	Name: sequence5
	Namespace: flowgraph_sequence
	Checksum: 0xF1A9CFF3
	Offset: 0x1338
	Size: 0x124
	Parameters: 1
	Flags: None
*/
function sequence5(x)
{
	self flowgraph::kick(array(1, 0, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 1, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 1, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 1, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 0, 1), 1);
}

/*
	Name: sequence6
	Namespace: flowgraph_sequence
	Checksum: 0x61C040AF
	Offset: 0x1468
	Size: 0x15C
	Parameters: 1
	Flags: None
*/
function sequence6(x)
{
	self flowgraph::kick(array(1, 0, 0, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 1, 0, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 1, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 1, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 0, 1, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 0, 0, 1), 1);
}

/*
	Name: sequence7
	Namespace: flowgraph_sequence
	Checksum: 0x655D4555
	Offset: 0x15D0
	Size: 0x194
	Parameters: 1
	Flags: None
*/
function sequence7(x)
{
	self flowgraph::kick(array(1, 0, 0, 0, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 1, 0, 0, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 1, 0, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 1, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 0, 1, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 0, 0, 1, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 0, 0, 0, 1), 1);
}

/*
	Name: sequence8
	Namespace: flowgraph_sequence
	Checksum: 0xB15FEAA3
	Offset: 0x1770
	Size: 0x1CC
	Parameters: 1
	Flags: None
*/
function sequence8(x)
{
	self flowgraph::kick(array(1, 0, 0, 0, 0, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 1, 0, 0, 0, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 1, 0, 0, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 1, 0, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 0, 1, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 0, 0, 1, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 0, 0, 0, 1, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 0, 0, 0, 0, 1), 1);
}

#namespace flowgraph_util;

/*
	Name: onflowgraphrun
	Namespace: flowgraph_util
	Checksum: 0xF7EA7234
	Offset: 0x1948
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function onflowgraphrun()
{
	self.owner waittill(#"flowgraph_run");
	return true;
}

/*
	Name: waitfunc
	Namespace: flowgraph_util
	Checksum: 0x60EB9D67
	Offset: 0x1978
	Size: 0x1E
	Parameters: 2
	Flags: None
*/
function waitfunc(x, f_seconds)
{
	wait(f_seconds);
	return true;
}

/*
	Name: createthread
	Namespace: flowgraph_util
	Checksum: 0xD866B3D2
	Offset: 0x19A0
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function createthread(x)
{
	return true;
}

#namespace flowgraph_random;

/*
	Name: randomfloatinrangefunc
	Namespace: flowgraph_random
	Checksum: 0x2DA3CABA
	Offset: 0x19B8
	Size: 0x2A
	Parameters: 2
	Flags: None
*/
function randomfloatinrangefunc(f_min, f_max)
{
	return randomfloatrange(f_min, f_max);
}

/*
	Name: randomunitvector
	Namespace: flowgraph_random
	Checksum: 0xDEE6D46A
	Offset: 0x19F0
	Size: 0x5A
	Parameters: 0
	Flags: None
*/
function randomunitvector()
{
	return vectornormalize((randomfloat(1), randomfloat(1), randomfloat(1)));
}

#namespace flowgraph_math;

/*
	Name: multiply
	Namespace: flowgraph_math
	Checksum: 0x42499414
	Offset: 0x1A58
	Size: 0x1A
	Parameters: 2
	Flags: None
*/
function multiply(var_d895ca40, var_3029f96f)
{
	return var_3029f96f * var_3029f96f;
}

/*
	Name: divide
	Namespace: flowgraph_math
	Checksum: 0x817DB9EF
	Offset: 0x1A80
	Size: 0x1A
	Parameters: 2
	Flags: None
*/
function divide(var_d895ca40, var_3029f96f)
{
	return var_d895ca40 / var_3029f96f;
}

/*
	Name: add
	Namespace: flowgraph_math
	Checksum: 0x62519D34
	Offset: 0x1AA8
	Size: 0x1A
	Parameters: 2
	Flags: None
*/
function add(var_d895ca40, var_3029f96f)
{
	return var_d895ca40 + var_3029f96f;
}

/*
	Name: subtract
	Namespace: flowgraph_math
	Checksum: 0x6ED8AEBD
	Offset: 0x1AD0
	Size: 0x1A
	Parameters: 2
	Flags: None
*/
function subtract(var_d895ca40, var_3029f96f)
{
	return var_d895ca40 - var_3029f96f;
}

/*
	Name: negate
	Namespace: flowgraph_math
	Checksum: 0x23345F7
	Offset: 0x1AF8
	Size: 0x16
	Parameters: 1
	Flags: None
*/
function negate(v)
{
	return v * -1;
}

/*
	Name: vectordotfunc
	Namespace: flowgraph_math
	Checksum: 0x236796DB
	Offset: 0x1B18
	Size: 0x2A
	Parameters: 2
	Flags: None
*/
function vectordotfunc(v_1, v_2)
{
	return vectordot(v_1, v_2);
}

#namespace flowgraph_level;

/*
	Name: function_35dc468d
	Namespace: flowgraph_level
	Checksum: 0xCDC37090
	Offset: 0x1B50
	Size: 0x18
	Parameters: 1
	Flags: None
*/
function function_35dc468d(str_field)
{
	return level.(str_field);
}

/*
	Name: function_f9d5c4b0
	Namespace: flowgraph_level
	Checksum: 0x7504DE3E
	Offset: 0x1B70
	Size: 0x32
	Parameters: 3
	Flags: None
*/
function function_f9d5c4b0(x, str_field, var_b8003601)
{
	level.(str_field) = var_b8003601;
	return true;
}

#namespace namespace_22752a75;

/*
	Name: function_8892c7a6
	Namespace: namespace_22752a75
	Checksum: 0x642242D3
	Offset: 0x1BB0
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_8892c7a6(i_value)
{
	return i_value;
}

/*
	Name: function_28c4ae67
	Namespace: namespace_22752a75
	Checksum: 0x5E1DB833
	Offset: 0x1BC8
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_28c4ae67(var_2eb63fd3)
{
	return var_2eb63fd3;
}

/*
	Name: function_36bf9c6c
	Namespace: namespace_22752a75
	Checksum: 0x7FA65163
	Offset: 0x1BE0
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_36bf9c6c(b_value)
{
	return b_value;
}

/*
	Name: function_fe4cf085
	Namespace: namespace_22752a75
	Checksum: 0x322E58B7
	Offset: 0x1BF8
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_fe4cf085(str_value)
{
	return str_value;
}

/*
	Name: function_3ece9d7e
	Namespace: namespace_22752a75
	Checksum: 0xE0935FBA
	Offset: 0x1C10
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_3ece9d7e(var_4cb0cd3c)
{
	return var_4cb0cd3c;
}

/*
	Name: function_68a5d644
	Namespace: namespace_22752a75
	Checksum: 0xC1B7EF28
	Offset: 0x1C28
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_68a5d644(var_30e9e231)
{
	return var_30e9e231;
}

/*
	Name: function_4e718879
	Namespace: namespace_22752a75
	Checksum: 0x54D9DE72
	Offset: 0x1C40
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_4e718879(v_value)
{
	return v_value;
}

/*
	Name: pathnodeconstant
	Namespace: namespace_22752a75
	Checksum: 0x7C87C3D9
	Offset: 0x1C58
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function pathnodeconstant(var_f4af12cc)
{
	return var_f4af12cc;
}

/*
	Name: function_9ef80b8b
	Namespace: namespace_22752a75
	Checksum: 0x709C2BEA
	Offset: 0x1C70
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_9ef80b8b(e_value)
{
	return e_value;
}

/*
	Name: introduction_minigun
	Namespace: namespace_22752a75
	Checksum: 0xD11DF391
	Offset: 0x1C88
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function introduction_minigun(ai_value)
{
	return ai_value;
}

/*
	Name: function_513da14e
	Namespace: namespace_22752a75
	Checksum: 0x7AF47523
	Offset: 0x1CA0
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_513da14e(var_162b6305)
{
	return var_162b6305;
}

/*
	Name: function_7cbb60c3
	Namespace: namespace_22752a75
	Checksum: 0x3F4271D4
	Offset: 0x1CB8
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_7cbb60c3(var_e7355b57)
{
	return var_e7355b57;
}

/*
	Name: function_f2357a4d
	Namespace: namespace_22752a75
	Checksum: 0x24778C91
	Offset: 0x1CD0
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_f2357a4d(var_52d6c2bd)
{
	return var_52d6c2bd;
}

/*
	Name: function_79f7d941
	Namespace: namespace_22752a75
	Checksum: 0x78C2962
	Offset: 0x1CE8
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_79f7d941(var_b8003601)
{
	return var_b8003601;
}

/*
	Name: function_fdafe394
	Namespace: namespace_22752a75
	Checksum: 0x5D9F4455
	Offset: 0x1D00
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_fdafe394(var_e477c3b)
{
	return var_e477c3b;
}

/*
	Name: function_28848a6a
	Namespace: namespace_22752a75
	Checksum: 0xD61F98B2
	Offset: 0x1D18
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_28848a6a(var_6b11d5a)
{
	return var_6b11d5a;
}

/*
	Name: function_8f5a9b3e
	Namespace: namespace_22752a75
	Checksum: 0x9853148E
	Offset: 0x1D30
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_8f5a9b3e(fx_value)
{
	return fx_value;
}

/*
	Name: function_a5f771ce
	Namespace: namespace_22752a75
	Checksum: 0x5BBE8D52
	Offset: 0x1D48
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_a5f771ce(var_e0bddaf5)
{
	return var_e0bddaf5;
}

/*
	Name: function_527fa489
	Namespace: namespace_22752a75
	Checksum: 0x1B3A8B3
	Offset: 0x1D60
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_527fa489(var_5ab747e5)
{
	return var_5ab747e5;
}

