# My init script for the text editor Atom 0.175.0
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.

# Enables tab indention for list bullets in markdown
atom.commands.add 'atom-text-editor', 'custom:smart-indent', ->
  editor = atom.workspace.getActiveTextEditor()
  selections = editor.getSelections()
  indentRowMode = false
  if selections.length == 1
    selection = selections[0]
    range = selection.getBufferRange()
    if selection.isEmpty()
      precedingText = editor.getTextInBufferRange([[range.start.row, 0], [range.start.row, range.start.column]])
      RegExp = /^\s*\*\s*$/
      if RegExp.test(precedingText)
        indentRowMode = true
  if indentRowMode
    editor.indentSelectedRows()
  else
    editor.indent()
