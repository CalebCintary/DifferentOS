os_path = shell.dir()

dofile(os_path.."/API/api_loader.lua")
load_api({})

dofile(os_path.."/core/msdos.lua")