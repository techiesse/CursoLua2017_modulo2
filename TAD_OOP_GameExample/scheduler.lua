
local Scheduler = {}

local scheduler = {actions = {}}

function Scheduler.schedule(timeout, action)
    scheduler.actions[action] = love.timer.getTime() + timeout
end

function Scheduler.step()
    for action, expiry in pairs(scheduler.actions) do
        if expiry < love.timer.getTime() then
            action()
            scheduler.actions[action] = nil
        end
    end
end

function Scheduler.isEmpty()
    return next(scheduler.actions) == nil
end

return Scheduler