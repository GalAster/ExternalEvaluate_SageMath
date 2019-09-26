(* ::Package:: *)

(* Paclet Info File *)

Paclet[
	Name -> "ExternalEvaluate_SageMath",
	Version -> "0.0.1",
	MathematicaVersion -> "12.0+",
	Extensions -> {
		{
			"Kernel",
			Root -> "ExternalEvaluate",
			Context -> {"ExternalEvaluateSageMath`"}
		},
		{
			"Resource",
			Root -> "ExternalEvaluate",
			Resources -> {
		    	{"System","ExternalEvaluateSageMath.wl"}
	    	}
		},
		{
			"Resource",
			Root -> "Resources",
			Resources -> {
		    	{"REPL",          "cli.py"},
		    	{"Icon",          "icon.png"},
		    	{"IconCell",      "IconCell.png"}
	    	}
		}	
	}
]
