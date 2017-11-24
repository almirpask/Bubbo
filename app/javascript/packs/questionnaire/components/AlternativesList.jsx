import React, {Component} from 'react'

export default class AlternativesList extends Component{
    constructor(props){
        super(props)

        this.renderRows = this.renderRows.bind(this)
    }
    renderRows(){
		let list = this.props.alternatives || []
		
		return list.map(list => (
			console.log(list),
			<tr key={list.id}>
				<td>{(list.answer)? "Verdadeira" : "Falsa"}</td>
				<td>{list.description}</td>
				<td><a href="javascript:void(0);"  onClick={() => (this.props.handleEdit(list.id, true))}><i className="material-icons">edit</i></a></td>
			</tr>		
		))
	}
    render(){
        return(
            <div>
                <table className="centered striped">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Alternativa</th>
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