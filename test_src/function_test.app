%% This is the application resource file (.app file) for the 'base'
%% application.
{application, function_test,
[{description, "function_test  " },
{vsn, "1.0.0" },
{modules, 
	  [function_test_app,function_test_sup,function_test]},
{registered,[function_test]},
{applications, [kernel,stdlib]},
{mod, {function_test_app,[]}},
{start_phases, []}
]}.
