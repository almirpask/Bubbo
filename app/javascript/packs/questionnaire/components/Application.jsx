// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React, {Component} from 'react'
import List from './List'
import Question from './Question'
import Alternative from './Alternative'


export default class Application extends Component{
	constructor(props){
		super(props)
		this.state = {
			questions: [],
			alternatives: [],
			question_id: 0,
			questionnaire_id: $('#questionnaire_id').val()
		}
		this.refresh()
		this.showQuestions = this.showQuestions.bind(this)
		this.openAlternative = this.openAlternative.bind(this)
		this.refresh = this.refresh.bind(this)
		this.refreshAlternatives = this.refreshAlternatives.bind(this)
	}
	openModal(){
		$('#modal1').modal('open');
	}
	openAlternative(id){
		this.setState({question_id: id})
		setTimeout(() => {
			//this.refreshAlternatives();
			$('#alternative').modal('open');
        }, 100);
		
		
		
	}
	refresh(){
		$.get(`/api/v1/questions/questionnaire/${this.state.questionnaire_id}.json`,{},(data) => {
			this.setState({questions: data}),
			console.log('app'+data)
		})
	}
	refreshAlternatives(){
		$.get(`/api/v1/alternatives/question/${this.state.question_id}.json`,{},(data) => {
			this.setState({alternatives: data})
		})
	}
	
  
	showQuestions(){
		let questions = this.state.questions.concat(this.state.questions)
		this.setState({questions: questions})
		//this.setState({questions: questions})
	}


	render(){
		return (
		<div className="row">
			<div className="col s12">
			<h4 className="header2" onClick={this.openQuestion}>Perguntas</h4>
				<div className="row">
					<button type="submit" className="btn btn-waves  right green" onClick={this.openModal} href="#modal1">Adicionar</button>
				</div>
				<List questions={this.state.questions} openAlternative={this.openAlternative}/>
				<Question refresh={this.refresh}/>
				<Alternative question_id={this.state.question_id} alternatives={this.state.alternatives} refreshAlternatives={this.refreshAlternatives}/>
			</div>
		</div>
		)
	}
}


