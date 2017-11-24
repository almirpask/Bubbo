import React, {Component} from 'react'
import Chart from 'chart.js'

export default class QuestionsAmount extends Component{
    constructor(props){
        super(props)
        this.state = {barC: "", datasets: []}
    }

    componentDidMount(){
        this.setState({datasets: this.props.total.map(a =>{
            console.log(a)
            return {
                label: a.description,
                backgroundColor: `rgb(${Math.floor(Math.random() * 255) + 1  },${Math.floor(Math.random() * 255) + 1  },${Math.floor(Math.random() * 255) + 1  })`,
                borderColor: `rgb(${Math.floor(Math.random() * 255) + 1  },${Math.floor(Math.random() * 255) + 1  },${Math.floor(Math.random() * 255) + 1  })`,
                data: [a.total],
                borderWidth: 1
            }
        })})
        setTimeout(()=>{

        
        var ctx = document.getElementById('barChart')
        this.setState({barC: new Chart(ctx, {
            // The type of chart we want to create
            type: 'bar',
        
            // The data for our dataset
            data:{
                datasets: this.state.datasets
            },
        
            // Configuration options go here
            options: { scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero:true
                    }
                }]
            }}
        })})
        },100)
    }
    render(){

        // setTimeout(() => {
        
        // },300)
        
        return(
            <div>
                <canvas id="barChart"></canvas>
            </div>
        )
    }
}