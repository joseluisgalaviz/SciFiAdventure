Ranks = {
    "S","A","B","C","D"
}

function Ranks:GetRankValue(rank)
    local rank  = rank or "D"
    if rank == "S" then
        return 1
    end
    if rank == "A" then
        return 2
    end
    if rank == "B" then
        return 3
    end
    if rank == "C" then
        return 4
    end
    return 5
end

function Ranks:GetRankProb(rank)
  local values = {
    { 80, 60, 20, 10, 5}, --S
    { 60, 80, 20, 10, 5}, --A
    { 20, 60, 80, 20, 10}, --B
    { 10, 20, 30, 80, 60}, --C
    {  5, 10, 20, 60, 80}  --D
  }
  return values[rank]
end

return Ranks