command: "date +\"%a %H:%M\""

refreshFrequency: 1000

render: (output) ->
  "#{output}"

style: """
  top: 17px
  right: 20px
  font: 9px Menlo
  color: #D8DEE9
"""
