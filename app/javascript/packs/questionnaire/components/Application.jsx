// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React, {Component} from 'react'
import List from './List'
import Modal from './Modal'


export default class Application extends Component{
  constructor(props){
    super(props)

    this.state = {questions: []}
  }
  openModal(){
    $('#modal1').modal('open');
  }

  componentDidMount() {
    
  }
  

  render(){
    return (
      <div className="row">
        <div className="col s12">
          <h4 className="header2">Perguntas</h4>
            <div className="row">
                <button type="submit" className="btn btn-waves  right green" onClick={this.openModal} href="#modal1">Adicionar</button>
            </div>
            <Modal/>
            <List questions={this.state.questions}/>
        </div>
      </div>
    )
  }
}


