

$(document).ready(function(){
    
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX



var ctx = document.getElementById("myChart").getContext('2d');

var incomes =  parseFloat(document.getElementById('ingresos').getAttribute('value'))
var expenses =  parseFloat(document.getElementById('gastos').getAttribute('value'))


var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ["Gastos", "Ingresos"],
        datasets: [{
            label: 'Gastos e Ingresos',
            data: [expenses,incomes],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)'
     
            ],
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});

var projects =  document.getElementById('proyectos').getAttribute('value')

var projObj = JSON.parse(projects)



console.log(projObj)
var labels = []
var data = []
projObj.forEach(function(element){
    labels.push(element.name)
    data.push(element.total_price)
})


var myLine = new Chart(document.getElementById("line-chart"), {
    type: 'line',
    data: {
      labels: labels,
      datasets: [{ 
          data: data,
          label: "Proyectos",
          borderColor: "#3e95cd",
          fill: false
        }]
    },
    options: {
      title: {
        display: true,
        text: 'Precio de Proyectos'
      }
    }
  });


// XXXXXXXXXXXXXXXXXXXXXXXXXXXX
})


