if Meteor.isClient

	@input = new Synaptic.Layer 2
	@output = new Synaptic.Layer 3

	input.project output

	trainingData = [
		input: [1, 0], output: [1, 0, 0]
	,
		input: [0, 1], output: [0, 1, 0]
	,
		input: [1, 1], output: [0, 0, 1]
	]

	train = (arr) -> _.map arr, (i) ->
		input.activate i.input
		output.activate()
		output.propagate 0.4, i.output

	_.map [1..1000], (i) ->
		train _.shuffle trainingData
