// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React, {Component} from 'react'
import List from './List'
import Question from './Question'


export default class Application extends Component{
	constructor(props){
		super(props)
		this.state = {
			questions: [],
			questionnaire_id: $('#questionnaire_id').val()
		}
		this.refresh()
		this.showQuestions = this.showQuestions.bind(this)
		this.refresh = this.refresh.bind(this)
	}
	openModal(){
		$('#modal1').modal('open');
	}
	refresh(){
		$.get(`/api/v1/questions/questionnaire/${this.state.questionnaire_id}.json`,{},(data) => {
			this.setState({questions: data}),
			console.log('app'+data)
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
			<h4 className="header2" onClick={this.showQuestions}>Perguntas</h4>
				<div className="row">
					<button type="submit" className="btn btn-waves  right green" onClick={this.openModal} href="#modal1">Adicionar</button>
				</div>
				<Question refresh={this.refresh}/>
				<List questions={this.state.questions}/>
			</div>
		</div>
		)
	}
}


