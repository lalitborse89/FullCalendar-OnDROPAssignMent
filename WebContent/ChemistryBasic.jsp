<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.io.Console"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DragCalendar</title>
<!-- <meta charset='utf-8' />
 -->
<link href='fullcalendar.css' rel='stylesheet' />
<link href='fullcalendar.print.css' rel='stylesheet' media='print' />
<script src='lib/moment.min.js'></script>
<script src='lib/jquery.min.js'></script>
<script src='lib/jquery-ui.custom.min.js'></script>
<script src='fullcalendar.min.js'></script>





<script>

    $(document).ready(function() {
    
        /* initialize the external events
        -----------------------------------------------------------------*/

        $('#external-events .fc-event').each(function() {
/* Show the ID of the element  */
        	
        	 alert($(this).attr("id"));

        	
            // store data so the calendar knows to render an event upon drop
            $(this).data('event', {
                title: $.trim($(this).text()), // use the element's text as the event title
                stick: true // maintain when user navigates (see docs on the renderEvent method)
            });

            // make the event draggable using jQuery UI
            $(this).draggable({
                zIndex: 999,
                revert: true,      // will cause the event to go back to its
                revertDuration: 0  //  original position after the drag
            });

        });


        /* initialize the calendar
        -----------------------------------------------------------------*/

        $('#calendar').fullCalendar({
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            editable: true,
            droppable: true, // this allows things to be dropped onto the calendar
            drop: function() {
            	
            	
            	
                // is the "remove after drop" checkbox checked?
                if ($('#drop-remove').is(':checked')) {
                    // if so, remove the element from the "Draggable Events" list
                    $(this).remove();
                }
            }
        });


    });

</script>








<style>

    body {
        margin-top: 40px;
        text-align: center;
        font-size: 14px;
        font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
    }
        
    #wrap {
        width: 1100px;
        margin: 0 auto;
    }
        
    #external-events {
        float: left;
        width: 150px;
        padding: 0 10px;
        border: 1px solid #ccc;
        background: #eee;
        text-align: left;
    }
        
    #external-events h4 {
        font-size: 16px;
        margin-top: 0;
        padding-top: 1em;
    }
        
    #external-events .fc-event {
        margin: 10px 0;
        cursor: pointer;
    }
        
    #external-events p {
        margin: 1.5em 0;
        font-size: 11px;
        color: #666;
    }
        
    #external-events p input {
        margin: 0;
        vertical-align: middle;
    }

    #calendar {
        float: right;
        width: 900px;
    }

</style>
</head>
<body>

    <div id='wrap'>

        <div id='external-events'>
            <h4>Draggable Events</h4>
            <div class='fc-event' id=1>Experiment 1</div>
            <div class='fc-event' id=2>Experiment 2</div>
            <div class='fc-event' id=3>Experiment 3</div>
            <div class='fc-event' id=4>Experiment 4</div>
            <div class='fc-event' id=5>Experiment 5</div>
            <p>
                <input type='checkbox' id='drop-remove' />
                <label for='drop-remove'>remove after drop</label>
            </p>
        </div>

        <div id='calendar'></div>

        <div style='clear:both'></div>

    </div>
    <div id='calendar'></div>
</body>
</html>

