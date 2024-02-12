Plot[Sin[x],{x,0,2*Pi}]

Plot[Sin[x],{x,0,2*Pi},PlotRange->All]

Plot[Sin[x],{x,0,2*Pi},PlotRange->{{0,2*Pi},{-1,1}}]

Plot[Sin[x],{x,0,2*Pi},PlotRange->{{0,2*Pi},{-1,1}},AspectRatio->1]

Plot[Sin[x],{x,0,2*Pi},PlotRange->{{0,2*Pi},{-1,1}},AspectRatio->1,Frame->True]

Plot3D[Sin[x+y],{x,0,2*Pi},{y,0,2*Pi}]

Plot3D[Sin[x+y],{x,0,2*Pi},{y,0,2*Pi},PlotRange->All]

ListPlot3D[Table[Sin[x+y],{x,0,2*Pi,0.1},{y,0,2*Pi,0.1}]]

ListPlot3D[Table[Sin[x+y],{x,0,2*Pi,0.1},{y,0,2*Pi,0.1}],PlotRange->All]

ListPlot3D[Table[Sin[x+y],{x,0,2*Pi,0.1},{y,0,2*Pi,0.1}],PlotRange->All,Mesh->None]

ListPlot3D[Table[Sin[x+y],{x,0,2*Pi,0.1},{y,0,2*Pi,0.1}],PlotRange->All,Mesh->None,ColorFunction->"Rainbow"]


