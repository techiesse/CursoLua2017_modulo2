
function repeatStr(str, times)
    local buffer = {}
    for i = 1, times do
        table.insert(buffer, str)
    end
    local result = table.concat(buffer)
    return result
end

print(repeatStr('agua ', 4))