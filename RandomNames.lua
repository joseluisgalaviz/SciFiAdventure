local title = {"Commander", "Captain", "Lieutenant", "Pilot", "Engineer", "Navigator", "Medic", "Soldier"}
local predefinedPersonalNames = {"Zara", "Kael", "Jax", "Remy", "Kaida", "Aria", "Jaxon", "Landon", "Kian", "Talos"}
local spaceshipNames = {"Relentless", "Independence", "Proximo", "Infinity Nexus", "Black Sparrow", "Galatic Sabe", "Argonaut", "Eros", "Delta Hammerhead", "Kraken"}

RandomNames = {

}

function RandomNames.createCrewName(self)
    local titleIndex = math.random( (#title-1) ) + 1
    local nameIndex = math.random((#predefinedPersonalNames-1)) + 1

    return title[titleIndex] .. " " .. predefinedPersonalNames[nameIndex]

end

function RandomNames.createSpaceShipName(self)
    return spaceshipNames[math.random((#spaceshipNames-1)+1)]
end

return RandomNames
