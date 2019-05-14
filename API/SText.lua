SText = {}
HorizontalAlignment = {
    Left = 1,
    Center = 2,
    Right = 3
}
VerticalAlignment = {
    Top = 1,
    Center = 2,
    Bottom = 3
}

function SText.Split(str, char_table)
    local array = {}
    local index = {}
    char_table = char_table or {' '}

    for i = 1, #str do
        for j = 1, #char_table do 
            if str:sub(i, i) == char_table[j] then table.insert( index, i ) end
        end
    end

    table.insert(array, str:sub(0, index[1] - 1))
    for i = 2, #index do
        table.insert( array, str:sub(index[i - 1] + 1, index[i] - 1) )
    end
    table.insert(array, str:sub(index[#index] + 1, str:len()))

    return array;
end



