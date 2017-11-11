import React, {Component} from 'react'

export default class Modal extends Component{
    componentDidMount(){
        $('.modal').modal();
    }
    render(){
        return(
            <div>
                <div id="modal1" className="modal">
                    <div className="modal-content">
                        <h4>Modal Header</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</p>
                    </div>
                    <div className="modal-footer">
                        <a href="#!" className="modal-action modal-close waves-effect waves-red btn-flat ">Disagree</a>
                        <a href="#!" className="modal-action modal-close waves-effect waves-green btn-flat ">Agree</a>
                    </div>
                </div>
            </div>
        )
    }
}