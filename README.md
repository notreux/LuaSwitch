## Usage Examples

```lua
local switch, case, default = require(LuaSwitch).getFunctions()
local myUnknownPet = if math.random(1, 2) == 1 then "dog" else "cat"

switch (myUnknownPet) {
    case "dog" (function(stop)
        warn("My pet is a dog!")
        --[[ 
            the stop method skip the default function and stop to check the other cases, 
            but doesn't stop the execution of the function
        ]]
        stop() 
    end)

    case "cat" (function(stop)
        warn("My pet is a cat!")
        stop() 
    end)

    default(function()
        print("I don't know what my pet is :(")
    end)
}
```

### case stacking
```lua
local switch, case, default = require(LuaSwitch).getFunctions()
local value = 0

switch("B") {
    case "A", -- Will execute case C
    case "B", -- Will execute case C
    case "C" (function()
        value = 2
    end),

    default (function()
        value -= 1
    end)
}
```

# If Comparison
### if
```lua
local value = "B"
if value == "A" then
    print("Case A")
elseif value == "B" then
    print("Case B")
elseif value == "C" then
    print("Case C")
else
    print("Executing default")
end
```

### switch
```lua
local switch, case, default = require(LuaSwitch).getFunctions()
local value = "B"

switch(value) {
    case "A" (function()
        print("Case A")
    end)

    case "B" (function()
        print("Case B")
    end)

    case "C" (function()
        print("Case C")
    end)

    default(function()
        print("Executing default")
    end)
}
```

# Style Comparison

### Parentheses
```lua
local switch, case, default = require(LuaSwitch).getFunctions()
local value = "B"

switch(value) {
    case "A" (function()
        print("Case A")
    end)

    case "B" (function()
        print("Case B")
    end)

    case "C" (function()
        print("Case C")
    end)

    default(function()
        print("Executing default")
    end)
}
```
### Brackets
```lua
local switch, case, default = require(LuaSwitch).getFunctions()
local value = "B"

switch(value) {
    case "A" {
        function()
            print("Case A")
        end
    }

    case "B" {
        function()
            print("Case B")
        end
    }

    case "C" {
        function()
            print("Case C")
        end
    }

    default { 
        function()
            print("Executing default")
        end
    }
}
```

# Benchmark
```lua
local switch, case, default = require(LuaSwitch).getFunctions()

local clock = os.clock
local c1 = clock()

local value = "C"
local switchTime 

switch(value) {
    case "A",
    case "B",
    case "C" (function(stop)
        print("Stacking cases!")
        stop()
    end)
}

switchTime = clock() - c1
c1 = clock()

if value == "A" or value == "B" or value == "C" or value == "D" then
    print("Stacking cases!")
end

print("If Time:", clock() - c1)
print("Switch Time:", switchTime)
```