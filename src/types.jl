module Types
using Graphs: GenericIncidenceList, KeyVertex, ExEdge

typealias XiGraph GenericIncidenceList
typealias XiEdge ExEdge{KeyVertex{String}}
typealias XiVertex KeyVertex{String}
end