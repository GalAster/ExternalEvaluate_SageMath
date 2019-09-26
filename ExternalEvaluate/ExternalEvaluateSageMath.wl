(* ::Package:: *)

BeginPackage["ExternalEvaluateSageMath`"];
Begin["`Private`"];
Needs["ExternalEvaluate`"];
Needs["PacletManager`"];


ExternalEvaluate`RegisterSystem["SageMath",
	<|
		(*standard paths are possible install locations *)
		"ExecutablePathFunction" -> Function[{vers}, unimplementExecutablePathFunction[]],
		(*these are possible executable names, which like above are string templates with the configurable parameter of vers, which is the version of python*)
		(*the executable pattern function is a function that when given the pattern, returns a pattern that can be used with FileNames and the ExecutablePathFunction to attempt to locate a suitable executable*)
		"ExecutablePatternFunction" -> Function[{vers}, unimplementPatternFunction[]],
		(*the program file is what is actually run as a repl - this is a function that takes as it's argument the version string*)
		(*specified by the user*)
		"ProgramFileFunction" -> Function[{version}, PacletManager`PacletResource["ExternalEvaluate_SageMath", "REPL"]],
		(*we use the -u flag to stop python from buffering output so that Mathematica can read from the process immediately*)
		(*in addition we provide the location of where to find the wolframclient package that can be used to export python types to wl*)
		"ScriptExecCommandFunction" -> Function[{uuid, exec, file, opts}, unimplementCommandFunction[]],
		(*icon is just an image to display with the summary box*)

		"Icon" -> Import[PacletManager`PacletResource["ExternalEvaluate_SageMath", "Icon"]],
		"IconCell" -> ToBoxes@Import[PacletManager`PacletResource["ExternalEvaluate_SageMath", "IconCell"]],
		"ShowInFrontendCellQ" -> True,
		(*we can avoid any customization of the --version output screen by just evaluating the python code that tells us the version - this code works in all python versions*)
		(*for example anaconda will customize the --version so it's not easily parsable, but this sidesteps all of that*)

		"VersionExecCommandFunction" -> Function[{exec}, unimplementExecCommandFunction[]],
		(*make an automatic paclet name out of this*)
		"PacletName" -> Automatic,

		"DeserializationFunction" -> BinaryDeserialize,
		"SerializationFunction" -> BinarySerialize
	|>
];


End[];
EndPackage[]
