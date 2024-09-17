_f = string.format

function ex1()
    local meta = {}
    local a = setmetatable({}, meta)
    print(getmetatable(a) == meta)
end

function ex2()
    local meta =
    {
        __tostring = function(self)
            return 'Nome: ' .. self.name
        end
    }
    local a = setmetatable({name = "Minha tabela"}, meta)
    print(a)
    a.name = 'Novo nome'
    print(a)
end

function ex_index()
    local meta = {
        age = 20,
        address = 'Rua B'
    }
    --meta.__index = function(t, key)
    --    print(_f('__index: O campo "%s" nao existe', key))
    --    return 'a'
    --end

    meta.__index = meta
    --meta.__index = function(t, key)
    --    return defaults[key]
    --end

    local a = setmetatable({name = 'Meu nome'}, meta)
    --print(a.name)
    a.age = 30
    print(a.age)
    print(rawget(a, 'age'))
    --print(a.address)
end


function ex_newindex()
    local values = {}
    local meta = {}
    meta.__newindex = values
    --function meta.__newindex(self, key, value)
    --    --print(_f('__newindex: Tentando atribuir "%s" ao campo "%s"', value, key))
    --    --rawset(self, key, value)
    --    values[key] = value
    --end
    local a = setmetatable({name = 'Meu nome'}, meta)
    a.__newindex = nil
    a.age = 30
    print(a.age)
    print(values.age)
    a.age = 31
    print(a.age)

end


function ex_str()
    --[[
    for k, v in pairs(getmetatable('').__index) do
        print(k, v)
    end

    print(string.format == getmetatable('').__index.format)
    ]]

    s = 'a,b'
    print(s:gsub(',', ''))
    print(string.gsub(s, ',', ''))

end

ex_str()
