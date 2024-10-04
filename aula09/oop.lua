local class_mt = {}

local BaseClasses = {}

function class_mt.__index(cls, k)
    return BaseClasses[cls][k]
end


function class_mt.__call(cls, ...)
    local obj = setmetatable({}, cls)
    if cls.init ~= nil then
        cls.init(obj, ...)
    end
    return obj
end


function class(className, Base)
    local class_tb = newClass(Base)
    if className ~= nil then
        _G[className] = class_tb
    end
    return class_tb
end


function newClass(Base)
    local class_tb = setmetatable({}, class_mt)
    class_tb.__index = class_tb
    if type(Base) == 'table' then
        BaseClasses[class_tb] = Base
    end
    return class_tb
end