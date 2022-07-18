local tforward      = turtle.forward
local tright, tleft = turtle.turnRight, turtle.turnLeft
local tdig          = turtle.dig
local tattack       = turtle.attack

local titemd        = turtle.getItemDetail
local tselect       = turtle.select
local tdrop         = turtle.drop

local tfuel         = turtle.getFuelLevel
local tsuck         = turtle.suck
local trefuel      = turtle.refuel

-- ****************************************
-- ** Order Class
-- ****************************************
local function fmove(count)
    for cc in count do
        while not tforward() do
            if not tdig() then
                tattack()
            end
        end
    end
end

local Order = {
    go_forward = fmove,

    turn_right = tright,

    turn_left = tleft,

    turn_back = function()
        tleft()
        tleft()
    end,

    empty_inventory = function()
        for idx = 1, 16 do
            if titemd(idx) then
                tselect(idx)
                tdrop()
            end
        end
        tselect(1)
    end,

    refuel = function()
        tselect(16)
        tsuck()
        trefuel()
        tselect(1)
    end,
}

