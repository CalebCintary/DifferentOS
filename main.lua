local os_path = shell.dir()

local file = fs.open("/os_path.txt", "w")
file.write(os_path)
file.close()
full_path = os_path.."/core/msdos.lua"
print(full_path)
dofile(full_path)

