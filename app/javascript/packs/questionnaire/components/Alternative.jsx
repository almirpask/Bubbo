import React, {Component} from 'react'
import Axios from 'axios'
import AlternativesList from './AlternativesList'

export default class Question extends Component{
    constructor(props){
        super(props)
        this.state= {
            questionnaire_id: $('#questionnaire_id').val(),
            answer: false,
            description: '',
            edit: false,
            alternative_id: null
        }
        this.changeDescription = this.changeDescription.bind(this)
        this.changeAnswer = this.changeAnswer.bind(this)
        this.handleSubmit = this.handleSubmit.bind(this)
        this.handleEdit = this.handleEdit.bind(this)
    }

    changeDescription(event){
        console.log(event.target.value)
        this.setState({description: event.target.value})
    }
    changeAnswer(event){
        
        this.setState({answer: !this.state.answer })
        console.log(this.state.answer)
    }
    
    componentWillReceiveProps(nextProps){
        if(nextProps.question_id != 0 && nextProps.question_id != this.props.question_id){
            console.log('algo mudou')
            console.log(nextProps)
            this.props.refreshAlternatives()
        }
    }

    handleSubmit(){
        

        let alternative = {
            question_id: this.props.question_id,
            answer: this.state.answer,
            description: this.state.description
        }
        console.log(alternative)
        if(this.state.edit){
            Axios.put(`/backoffice/alternatives/${this.state.alternative_id}.json`, {alternative}).then((response)=>{
                this.setState({edit: false, alternative_id: null, description: ''}),
                console.log("erro:" + response),
                this.props.refreshAlternatives()
            })
        }else{
            console.log(alternative);
            $.post('/backoffice/alternatives', {alternative}, data => {console.log(data)}).done(()=> this.props.refreshAlternatives())
        }
        
    }

    handleEdit(id, update){
        
        if(update){
            this.setState({edit: true, alternative_id: id})
            $.get(`/backoffice/alternatives/${id}/edit.json`, {}, data => {console.log(data) , this.setState({answer: (data.aswer? true: false), description: data.description})}).done(()=>{console.log(this.state.description)})
        }else{
            this.setState({edit: false, alternative_id: null})
        }
        console.log(`id=${id} - update=${update}`)
    }
 
    componentDidMount(){
        $('.modal').modal();
    }
    render(){
        return(
            <div>
                <div id="alternative" className="modal modal-fixed-footer">
                    <div className="modal-content">
                        <h4>Alternativas </h4>
                        <div className="row border">
                            <div className="col s12">
                                <div className="col s4">
                                    <p>
                                        <input type="checkbox"  id="answer" value={this.state.answer} onChange={this.changeAnswer}/>
                                        <label htmlFor="answer">Alternativa Correta?</label>
                                    </p>
                                </div>
                                <div className="input-field col s8">
                                    <input type="text" id="description" value={this.state.description} onChange={this.changeDescription}/>
                                    <label htmlFor="description">Descrição</label>   
                                </div>
                            </div>
                        </div>
                        <AlternativesList alternatives={this.props.alternatives} handleEdit={this.handleEdit}/>
                    </div>
                    <div className="modal-footer">
                        <a className="modal-action modal-close waves-effect waves-red btn-flat yellow-text text-darken-4">Fechar</a>
                        <a className="modal-action waves-effect waves-green btn-flat green-text" onClick={this.handleSubmit}>Salvar</a>
                    </div>
                </div>
            </div>
        )
    }
}