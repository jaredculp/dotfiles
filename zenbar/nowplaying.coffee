command: "$HOME/now-playing"

refreshFrequency: 500

render: (output) ->
  "#{output}"

style: """
  -webkit-font-smoothing: antialiased
  font: 9px Menlo
  color: #eee
  top: 16px
  width: 100%
  text-align: center
  span
    color: #aaa
"""
