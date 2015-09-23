@Answer = React.createClass

  getInitialState: ->
    edit: false

  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit

  handleDelete: (e) ->
    e.preventDefault()
    # yeah... jQuery doesn't have a $.delete shortcut method
    $.ajax
      method: 'DELETE'
      url: "/answers/#{ @props.answer.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteAnswer @props.answer

  handleEdit: (e) ->
    e.preventDefault()
    data =
      label: React.findDOMNode(@refs.label).value
    # jQuery doesn't have a $.put shortcut method either
    $.ajax
      method: 'PUT'
      url: "/answers/#{ @props.answer.id }"
      dataType: 'JSON'
      data:
        answer: data
      success: (data) =>
        @setState edit: false
        @props.handleUpdateAnswer @props.answer, data

  answerForm: ->
    React.DOM.tr null,
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.answer.label
          ref: 'label'
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleEdit
          'Update'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleToggle
          'Cancel'

  answerRow: ->
    React.DOM.tr null,
      React.DOM.td null, @props.answer.label
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleToggle
          'Edit'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'

  render: ->
    if @state.edit
      @answerForm()
    else
      @answerRow()
