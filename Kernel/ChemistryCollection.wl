BeginPackage["WolframExternalFunctions`ChemistryCollection`"];

ArrheniusEquation::usage = "ArrheniusEquation[frequencyFactor, activationEnergy, temperature] returns the rate constant for a reaction using the Arrhenius equation.";

Begin["`Private`"];

PythonSessionGet[id_String, deps_List, prolog_String : ""] := SelectFirst[
  ExternalSessions[],
  #["ID"] === id &,
  StartExternalSession[{
    { "Python", "StandardErrorFunction" -> Null },
    "ID" -> id,
    "Evaluator" -> <|
      "Dependencies" -> deps,
      "EnvironmentName" -> id,
      "PythonRuntime" -> "3.11"
      |>,
    "SessionProlog" -> prolog
    }]
  ]

LoadExternalFunction["Python", fun_String] := Module[{components, pkg, ctx, ef, wl, session},
  components = StringSplit[fun, "."];
  pkg = First[components];
  ctx = StringRiffle[Most[components], "."];
  session = PythonSessionGet["ChemistryCollection", $ChemistryCollection];
  ExternalEvaluate[session,"import " <> ctx];
  ef = ExternalFunction[session, fun];
  wl = StringReplace["WolframExternalFunctions`ChemistryCollection`" <> fun, {"." -> "`", "_" -> "\[LetterSpace]"}];
  With[{s = wl}, Quiet[Remove[s]]];
  With[{s = Symbol[wl], rhs = ef}, OwnValues[s] = {HoldPattern[s] :> rhs}];
  Symbol[wl]
  ]

$ChemistryCollection = { "chempy" };

(* ArrheniusEquation *)

ArrheniusEquation[frequencyFactor_, activationEnergy_, temperature_ ] := 
    LoadExternalFunction["Python", "chempy.kinetics.arrhenius.arrhenius_equation"][frequencyFactor, activationEnergy, temperature];

ArrheniusEquation::notes = ""; 

ArrheniusEquation::example = "ArrheniusEquation[1.0*^13, 40.0*^3, 298.0]";


End[];

EndPackage[];