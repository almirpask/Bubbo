import React, {Component} from 'react'



export default class List extends Component{
	constructor(props){
		super(props)
		this.state = {
			questions: [],
			questionnaire_id: $('#questionnaire_id').val()
		}
		this.renderRows = this.renderRows.bind(this)
		this.openAlternative = this.openAlternative.bind(this)
		//this.refresh()
	}
	
	openAlternative(id){
		this.props.openAlternative(id)
	}
	renderRows(){
		let list = this.props.questions || []
		
		return list.map(list => (
			console.log(list.id),
			<tr key={list.id}>
				<td>{list.number}</td>
				<td>{list.description}</td>
				<td><a onClick={()=>(this.openAlternative(list.id))}><i className="material-icons" >border_color</i></a></td>
			</tr>		
		))
	}

	refresh(){
		$.get(`/backoffice/questions/questionnaire/${this.state.questionnaire_id}.json`,{},(data) => {
			this.setState({questions: data}),
			console.log("list" + data)
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
								<th></th>
							</tr>
						</thead>
						<tbody>
							
							{this.renderRows()}
						</tbody>
				</table>
			</div>
		)
	}
}