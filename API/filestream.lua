print(shell.path())
dofile(shell.dir().."/SUtilites.lua")
file_stream = {}


function file_stream:new(path, mode)
    --Path error handler
    if (fs.exists(path)) then
        if (fs.isDir(path)) then
            error("FileIsNotReadableException > "..path)
        end
    else
        error("FileIsNotExistsException > "..path)
    end
    --Mode error handler
    --if Super.

end