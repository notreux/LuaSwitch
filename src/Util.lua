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

function module.getNextCase(s, cases)
	for i = s, #cases do
		if typeof(cases[i]) == "table" and cases[i].case then
			return cases[i].case
		end
	end
end

return module