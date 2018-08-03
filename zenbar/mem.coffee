command: "ESC=`printf \"\e\"`; ps -A -o %mem | awk '{s+=$1} END {print \"\" s}'"

refreshFrequency: 30000 # ms

render: (output) ->
  "mem <span>#{output}</span>"

style: """
  right: 90px
  top: 18px
  font: 9px Menlo
  color: #689d6a
  font-weight: bold
  span
    color: #ebdbb2
    font-weight: normal
"""
