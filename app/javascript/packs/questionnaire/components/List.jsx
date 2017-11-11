import React, {Component} from 'react'



export default class List extends Component{
	
	render(){
		let questions = this.props.questions.map(function(question){
			return(
				<div>
					<tr>
						<td>{question.number}</td>
						<td>{question.description.subjstring(0, 10)}</td>
						<td><i className="material-icons">edit</i></td>
					</tr>
				</div>
			)
		})
		return (
			<table className="centered striped">
					<thead>
						<tr>
							<th>#</th>
							<th>Question</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						{questions}
					</tbody>
			</table>
		)
	}
}