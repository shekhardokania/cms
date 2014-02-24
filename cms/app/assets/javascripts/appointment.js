// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function clickEvent(calEvent, jsEvent, view) {

    alert('Event: ' + calEvent.title);

    // change the border color just for fun
    $(this).css('border-color', 'red');

}

function mouseOver(event, jsEvent, view) {
    //alert('Event: ' + event.title);
    // change the border color just for fun
    $(this).css('border-color', 'red');
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

        html: true,
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

        events: '/get-appointments'
    });

};


$(document).ready(ready);
$(document).on('page:load', ready);