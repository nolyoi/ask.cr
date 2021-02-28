import Chart from 'chart.js';
require("./$.min.js");
var ctx = document.getElementById('users-chart');
var ctx2 = document.getElementById('questions-chart');
var ctx3 = document.getElementById('answers-chart');
var ctx4 = document.getElementById('tags-chart');

var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    datasets: [{
        data: [document.getElementById('users-chart').getAttribute('total-users'), document.getElementById('users-chart').getAttribute('new-users')],
        backgroundColor: [
          '#e05c1f',
          '#12c9c9',
        ]
    }],
  
    // These labels appear in the legend and in the tooltips when hovering different arcs
    labels: [
        'Existing Users',
        'New This Week',
    ]
  },
  options: {}
});

var myPieChart2 = new Chart(ctx2, {
  type: 'doughnut',
  data: {
    datasets: [{
        data: [document.getElementById('questions-chart').getAttribute('total-questions'), document.getElementById('questions-chart').getAttribute('new-questions')],
        backgroundColor: [
          '#e05c1f',
          '#12c9c9',
        ]
    }],
  
    // These labels appear in the legend and in the tooltips when hovering different arcs
    labels: [
        'Existing Questions',
        'New This Week',
    ]
  },
  options: {}
});

var myPieChart3 = new Chart(ctx3, {
  type: 'doughnut',
  data: {
    datasets: [{
      data: [document.getElementById('answers-chart').getAttribute('total-answers'), document.getElementById('answers-chart').getAttribute('new-answers')],
      backgroundColor: [
        '#e05c1f',
        '#12c9c9',
      ]
    }],
  
    // These labels appear in the legend and in the tooltips when hovering different arcs
    labels: [
        'Existing Answers',
        'New This Week',
    ]
  },
  options: {}
});

var myPieChart4 = new Chart(ctx4, {
  type: 'doughnut',
  data: {
    datasets: [{
      data: [document.getElementById('tags-chart').getAttribute('total-tags'), document.getElementById('tags-chart').getAttribute('new-tags')],
      backgroundColor: [
        '#e05c1f',
        '#12c9c9',
      ]
    }],
  
    // These labels appear in the legend and in the tooltips when hovering different arcs
    labels: [
        'Existing Tags',
        'New This Week',
    ]
  },
  options: {}
});