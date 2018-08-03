command: "ESC=`printf \"\e\"`; ps -A -o %cpu | awk '{s+=$1} END {printf(\"%.2f\",s/8);}'"

refreshFrequency: 2000 # ms

render: (output) ->
  "cpu <span>#{output}</span>"

style: """
  right: 155px
  top: 18px
  font: 9px Menlo
  color: #b16286
  font-weight: bold
  span
    color: #ebdbb2
    font-weight: normal
"""
