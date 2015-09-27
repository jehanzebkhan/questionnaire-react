# @cjsx React.DOM
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
    <form className='form' onSubmit=@handleSubmit>
      <div className='form-group'>
        <input
          type='text'
          className='form-control'
          placeholder='Label'
          name='label'
          value={@state.label}
          onChange={@handleChange} />
        <button
          type='submit'
          className='btn btn-primary'
          disabled={!@valid()}>Create Answer</button>
      </div>
    </form>
