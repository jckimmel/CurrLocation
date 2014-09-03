command: "curl -s http://freegeoip.net/json/"

refreshFrequency: 300000

style: """
  position: absolute
  top: 3%
  left: 8%
  color: #000
  font-family: Mistral


  .output, .location
    padding: 5px 10px
    width: 1000px
    font-size: 72px
    font-weight: lighter
	  font-smoothing: antialiased

"""

render: (output) -> """
	<div class = "output">
		<div class = "location"></div>
	</div>
"""

update: (output, domEl) ->
	
	dom = $(domEl)
	data = JSON.parse output
	
	state = data.region_code
	city = data.city

	text = city + ", " + state
	
	dom.find('.location').html text