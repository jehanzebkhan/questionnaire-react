# @cjsx React.DOM
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
    <tr>
      <td>
        <input
          className='form-control'
          type='text'
          defaultValue=@props.answer.label
          ref='label' />
      </td>
      <td>
        <a className='btn btn-default' onClick={@handleEdit}>
          Update
        </a>
        <a className='btn btn-danger' onClick={@handleToggle}>
          Cancel
        </a>
      </td>
    </tr>
  answerRow: ->
    <tr>
      <td>{@props.answer.label}</td>
      <td>
        <a className='btn btn-default' onClick=@handleToggle>
          Edit
        </a>
        <a className='btn btn-danger' onClick=@handleDelete>
          Delete
        </a>
      </td>
    </tr>

  render: ->
    if @state.edit
      @answerForm()
    else
      @answerRow()
