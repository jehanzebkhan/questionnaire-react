# @cjsx React.DOM
Modal = ReactBootstrap.Modal
@AnswerForm = React.createClass
  getInitialState: ->
    label: ''
    disabled: ''
    showModal: false

  close: ->
    @setState showModal: false

  open: ->
    @setState showModal: true

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
    @close

  render: ->
    <div>
      <button className='btn btn-primary' onClick={@open}>
          Add New Answer
      </button>
      <Modal show={this.state.showModal} onHide={@close}>
        <Modal.Header closeButton>
          <Modal.Title>Add New Form</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <form className='form' onSubmit=@handleSubmit>
            <div className='form-group'>
              <input type='text' className='form-control' placeholder='Label'
                name='label' value={@state.label} onChange={@handleChange} />
              <button type='submit' className='btn btn-primary' disabled={!@valid()}>
                Create Answer
              </button>
            </div>
          </form>
        </Modal.Body>
      </Modal>
    </div>
