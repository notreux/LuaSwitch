local util = require(script.Util)

local function run(case, cases)
	local breakIt = false
	local default 

	local function stop()
		breakIt = true
	end

	for _, it in ipairs(cases) do
		if breakIt then 
			return 
		elseif it.sentence_type == "case" and it.condition == case then
			it.case(stop)
			continue
		end

		default = it.case
	end
	
	if default then
		default()
	end
end

local function return_it(sentence_type, condition, case)
	return {
		sentence_type = sentence_type,
		condition = condition,
		case = case
	}
end

local function switch(value)
	return util.wrap(run, value)
end

local function default(case)
	return return_it("default", 0, case)
end

local function case(condition)
	assert(condition ~= nil, "You must provide a condition")
	return util.wrap(return_it, "case", condition)
end

local function getFunctions()
	return switch, case, default
end

return {
	switch = switch,
	case = case, 
	default = default,
	getFunctions = getFunctions
}