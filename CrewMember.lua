
namesGenerator = require("RandomNames")
randomEvents = require("RandomEvents")
ranks = require("Ranks")

local function CrewStats(self)
    return {
    HP = 50,
    DEF = 10,
    ATK = 20,
    SPD = 10,
    }
end

local function Crew(self) 
    return {
        rank = 5,
        name = "",
        specie = "",
        stats = CrewStats(),
        habilities = {}
    }
end

local function CreateCrewRank(rank)
       local rank = rank or 5
       sample = randomEvents:new(ranks:GetRankProb(rank))
       rank = ranks[sample()]
       --print(rank)
       return rank
end

Crews = {
}


function Crews:createNewCrew(rank)
     local newCrew = Crew()
     newCrew.name = namesGenerator.createCrewName()
     newCrew.rank = CreateCrewRank(rank)
     return newCrew
end





return Crews
