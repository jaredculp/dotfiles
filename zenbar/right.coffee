command: "date +\"%a %H:%M\""

refreshFrequency: 1000

render: (output) ->
  "#{output}"

style: """
  top: 16px
  right: 20px
  font: 12px Ubuntu Mono
  color: #D8DEE9
"""
