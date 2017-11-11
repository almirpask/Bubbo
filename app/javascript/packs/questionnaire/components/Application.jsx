// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React, {Component} from 'react'
import Table from './Table'
import Modal from './Modal'


export default class Application extends Component{
  
  openModal(){
    $('#modal1').modal('open');
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
            <Table/>
        </div>
      </div>
    )
  }
}


