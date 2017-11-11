import React, {Component} from 'react'



export default class Table extends Component{

	render(){
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
						<tr>
							<td>Alvin</td>
							<td>Eclair</td>
							<td>$0.87</td>
							</tr>
							<tr>
							<td>Alan</td>
							<td>Jellybean</td>
							<td>$3.76</td>
							</tr>
							<tr>
							<td>Jonathan</td>
							<td>Lollipop</td>
							<td>$7.00</td>
						</tr>
					</tbody>
			</table>
		)
	}
}