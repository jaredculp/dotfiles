command: "/usr/local/bin/chunkc tiling::query --desktop id"

refreshFrequency: 100

renderSpace: (i, active) ->
  """
  <li class="#{if active then 'active' else ''}">
    #{i}
  </li>
  """

render: (output) ->
  active = parseInt(output)
  """
  <ul>
    #{(this.renderSpace(i, active is i) for i in [1..5]).join(' ')}
  </ul>
  """

style: """
  top: 12px
  left: 12px
  font: 12px Ubuntu Mono
  color: #D8DEE9
  ul
    list-style-type: none
    display: flex;
    margin: 0px
    padding: 0px
  li
    padding: 4px 8px
  li.active
    background: #434C5E
"""
