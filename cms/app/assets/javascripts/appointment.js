// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
function getDataHover(event){
    console.log(event);
    return "<h2>" + event.title + "</h2>"
}

function getDataClick(event){
    console.log(event);
    return "<h2>" + event.title + "</h2>"
}

function clickEvent(calEvent, jsEvent, view) {


}

function mouseOver(event, jsEvent, view) {
    $(this).popover({
        title: event.type,
        placement: 'top',
        trigger: 'manual',
        delay: { show: 200, hide: 100 },
        animation: true,
        container: '#calendar',
        html: true,
        content: function(){
            return getDataHover(event);
        }
    });
    $(this).popover('show');
    // change the border color just for fun
    $(this).css('border-color', 'red');
}

function mouseOut(event, jsEvent, view) {

    $(this).popover('hide');
    // change the border color just for fun
    $(this).css('border-color', 'default');
}

function eventReschedule (event,dayDelta,minuteDelta,allDay,revertFunc) {

    $.post( "/reschedule-appointment", { event: event, day_delta: dayDelta, min_delta: minuteDelta, allday: allDay })
        .done(function( data ) {
            if(data.success) {
                alert( "Event updated successfully.");
            }
            else{
                alert("Event updation failed.");
                revertFunc();
            }
        })
        .error(function(){
            alert("Event updation failed.");
            revertFunc();
         });
}

function eventResize (event,dayDelta,minuteDelta,revertFunc) {

    $.post( "/reschedule-appointment", { event: event, day_delta: dayDelta, min_delta: minuteDelta })
        .done(function( data ) {
            if(data.success) {
                alert( "Event updated successfully.");
            }
            else{
                alert("Event updation failed.");
                revertFunc();
            }
        })
        .error(function(){
            alert("Event updation failed.");
            revertFunc();
        });
}

var ready;
ready = function() {
    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();
    $("#patient_name").autocomplete({
        source: '/get-patients',
        minLength: 2,
        select: function(event, ui) {
            $("#patient_id").val(ui.item.id);
        },

        html: true
    });

    $( "#patient_name").autocomplete( "option", "appendTo", "#aptCreateModal" );

    $('#calendar').fullCalendar({

        header:
        {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },

        defaultView: 'agendaWeek',

        selectable: true,
        selectHelper: true,

        select: function(start, end, allDay)
        {

            $('#start_date').val(start);
            $('#end_date').val(end);
            $('#allday').val(allDay);
            $('#aptCreateModal').modal();
        },

        editable: true,

        eventClick: clickEvent,

        eventMouseover: mouseOver,

        eventMouseout: mouseOut,

        eventDrop: eventReschedule,

        eventResize: eventResize,

        events: '/get-appointments'
    });

};


$(document).ready(ready);
$(document).on('page:load', ready);