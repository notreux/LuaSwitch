-- I know this is not necessary for such a small project, but I was bored and decided to put tests on it as well
local switch, case, default = require(script.Parent).getFunctions()

return function()
	describe("switch", function()
		it("should execute a case and break", function()
			local value = 0
			switch("B") {
				case "A" (function(stop)
					value += 1
					stop()
				end),
				
				case "B" (function(stop)
					value += 1 
					stop()
				end),

				default (function()
					value -= 1
				end)
			}

			expect(value).to.equal(1)
		end)

		it("should execute a case without break", function()
			local value = 0
			switch("A") {
				case "A" (function()
					value = 2
				end),

				default (function()
					value -= 1
				end)
			}

			expect(value).to.equal(1)
		end)

		it("should stack cases", function()
			local value = 0
			switch("A") {
				case "A",
				case "B" (function()
					value = 2
				end),

				default (function()
					value -= 1
				end)
			}

			expect(value).to.equal(1)
		end)
	end)

	describe("case", function()
		it("should return a function", function()
			expect(case("A")).to.be.a("function")
		end)
	end)

	describe("default", function()
		it("should return a table", function()
			expect(default(function()
				print("default case")
			end)).to.be.a("table")
		end)
	end)
end