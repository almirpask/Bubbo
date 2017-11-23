import React, {Component} from 'react'

export default class Question extends Component{
    constructor(props){
        super(props)
        this.state= {
            questionnaire_id: $('#questionnaire_id').val(),
            number: 0,
            description: ''
        }
        this.changeDescription = this.changeDescription.bind(this)
        this.changeNumber = this.changeNumber.bind(this)
        this.handleSubmit = this.handleSubmit.bind(this)
    }

    changeDescription(event){
        console.log(event.target.value)
        this.setState({description: event.target.value})
    }
    changeNumber(event){
        console.log(event.target.value)
        this.setState({number: event.target.value});
    }

    handleSubmit(){

        let question = {
            questionnaire_id: this.state.questionnaire_id,
            number: this.state.number,
            description: this.state.description
        }
        //alert(question)
        $.post('/backoffice/questions', {question}, data => {console.log(data), this.props.refresh()})

    }
    
    componentDidMount(){
        $('.modal').modal();
    }
    render(){
        
        return(
            <div>
                <div id="modal1" className="modal">
                    <div className="modal-content">
                        <h4>Pergunta</h4>
                        <div className="row border">
                            <div className="col s12">
                                <div className="input-field col s4">
                                    <input type="number" id="number" value={this.state.number} onChange={this.changeNumber}/>
                                    <label htmlFor="number" className="active">Numero da pergunta</label>
                                </div>
                                <div className="input-field col s8">
                                    <input type="text" id="description" value={this.state.description} onChange={this.changeDescription}/>
                                    <label htmlFor="description" className="active" >Descrição</label>   
                                </div>
                                
                                
                            </div>
                        </div>
                    </div>
                    <div className="modal-footer">
                        <a className="modal-action modal-close waves-effect waves-red btn-flat yellow-text text-darken-4">Fechar</a>
                        <a className="modal-action modal-close waves-effect waves-green btn-flat green-text" onClick={this.handleSubmit}>Salvar</a>
                    </div>
                </div>
            </div>
        )
    }
}