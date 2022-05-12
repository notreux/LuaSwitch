local module = {}

function module.wrap(f, ...)
	local args = { ... }

	return function(...)
		local __args = { ... }
        for i, value in ipairs(args) do
			table.insert(__args, i, value)
		end

		return f(unpack(__args))
	end
end

return module