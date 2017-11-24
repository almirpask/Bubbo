import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
// import Application from './components/Application'
import QuestionsAmount from './components/QuestionsAmount'


ReactDOM.render(
    
    <QuestionsAmount total={window.total_per_json}/>,
    document.getElementById('chart_students_questions'),
)