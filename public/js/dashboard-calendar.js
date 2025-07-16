// Simple calendar widget using FullCalendar.io
// This file assumes you have included FullCalendar CSS and JS in your Blade file

document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('dashboard-calendar');
    if (calendarEl) {
        // Pastikan elemen memiliki tinggi minimum agar grid tampil
        calendarEl.style.minHeight = '400px';

        // Tunggu FullCalendar JS benar-benar tersedia
        function renderCalendar() {
            if (typeof FullCalendar !== 'undefined' && FullCalendar.Calendar) {
                var calendar = new FullCalendar.Calendar(calendarEl, {
                    initialView: 'dayGridMonth',
                    height: 400,
                    headerToolbar: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'dayGridMonth,timeGridWeek,timeGridDay'
                    },
                    events: [],
                    dayMaxEventRows: true,
                    fixedWeekCount: false,
                    showNonCurrentDates: true,
                });
                calendar.render();
            } else {
                setTimeout(renderCalendar, 100);
            }
        }
        renderCalendar();
    }
});
