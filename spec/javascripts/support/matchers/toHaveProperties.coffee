beforeEach ->
	jasmine.addMatchers
		toHaveProperties: ->
			compare: (actual, expected) ->
				assertions =  for key, value of expected
					property: key, actual: actual[key], expected: value, isEqual: actual[key] == value

				nonEqualProperties = assertions.filter (it) -> !it.isEqual

				if nonEqualProperties.length == 0
					return pass: true, message: ""

				makeErrorMessage = (elem) ->
					"Expected #{elem.property} to be #{JSON.stringify elem.expected}, but found #{JSON.stringify elem.actual}."

				pass: false
				message: nonEqualProperties.map(makeErrorMessage).join " "