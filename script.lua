-- Main Lua Script
-- This is a simple Lua script

function hello()
    print("Hello from Lua!")
end

function add(a, b)
    return a + b
end

-- Main execution
hello()
local result = add(5, 3)
print("5 + 3 = " .. result)
