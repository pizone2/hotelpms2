
document.addEventListener('DOMContentLoaded', function() {
    let calendarEl = document.getElementById('calendar');
    let calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        timeZone: 'UTC',
        events: [

            {
                title: 'my event',
                start: '2023-06-01',
                end : '2023-07-40'
            }
        ]
    });
    calendar.render();
});