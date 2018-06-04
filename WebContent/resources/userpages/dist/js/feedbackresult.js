var donutData;
$(document).ready(function() {
	//var subId = $("#feedbackid").val();
	
	
		
$.ajax({
		
		url:"bargraphdata",
		type:"post",
		/*data:{
			fid: subId
			
		},*/
		
		datatype: "json",
		success:function(data){
			console.log(data);
			
			Morris.Bar({
		        element: 'morris-bar-chart',
		        data: data,
		        xkey: 'y',
		        ykeys: ['attr'],
		        labels: ['Percentage vote','Percentage vote','Percentage vote','Percentage vote','Percentage vote'],
		        hideHover: 'auto',
		        resize: true
		    });
			//alert("inside success"+data[0].fname);
		}
	});

   

    

});
