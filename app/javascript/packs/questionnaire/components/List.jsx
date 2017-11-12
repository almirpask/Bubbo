import React, {Component} from 'react'



export default class List extends Component{
	constructor(props){
		super(props)
		this.state = {
			questions: [],
			questionnaire_id: $('#questionnaire_id').val()
		}
		this.renderRows = this.renderRows.bind(this)
		this.renderRows2 = this.renderRows2.bind(this)
		this.refresh()
	}
	
	renderRows(){
		
		
		return this.state.questions.map(list => (
			
			<tr key={list.id}>
				<td>{list.number}</td>
				<td>{list.description}</td>
				<td><i className="material-icons">edit</i></td>
			</tr>		
		))
	}
	renderRows2(){
		let list = this.props.questions || []
		
		return list.map(list => (
			
			<tr key={list.id}>
				<td>{list.number}</td>
				<td>{list.description}</td>
				<td><i className="material-icons">edit</i></td>
			</tr>		
		))
	}

	refresh(){
		$.get(`/api/v1/questions/questionnaire/${this.state.questionnaire_id}.json`,{},(data) => {
			this.setState({questions: data}),
			console.log(data)
		})
	}

	
	render(){
		return (
			<div>
				<table className="centered striped">
						<thead>
							<tr>
								<th>#</th>
								<th>Question</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							
							{this.renderRows2()}
						</tbody>
				</table>
			</div>
		)
	}
}