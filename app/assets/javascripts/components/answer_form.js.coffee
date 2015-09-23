@AnswerForm = React.createClass
  getInitialState: ->
    label: ''
    disabled: ''
  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
  valid: ->
    @state.label
  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', { answer: @state }, (data) =>
      @props.handleNewAnswer data
      @setState @getInitialState()
    , 'JSON'
  render: ->
    React.DOM.form
      className: 'form'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Label'
          name: 'label'
          value: @state.label
          onChange: @handleChange
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        'Create Answer'
