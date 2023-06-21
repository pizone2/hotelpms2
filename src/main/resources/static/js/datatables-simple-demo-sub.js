window.addEventListener('DOMContentLoaded', event => {
    // Simple-DataTables
    // https://github.com/fiduswriter/Simple-DataTables/wiki

    const datatablesSimple = document.getElementById('datatablesSimple');
    if (datatablesSimple) {
        new simpleDatatables.DataTable(datatablesSimple, {
            perPageSelect: false,
            searchable: false,
            status: false
        });
    }

    // 제공된 테이블이 초기화된 후 "datatable-sorter" 클래스 제거
    $(document).ready(function() {
        $('a.datatable-sorter').removeClass('datatable-sorter');
    });
});

window.addEventListener('DOMContentLoaded', event => {
    // Simple-DataTables
    // https://github.com/fiduswriter/Simple-DataTables/wiki

    const datatablesSimple = document.getElementById('datatablesSimple2');
    if (datatablesSimple) {
        new simpleDatatables.DataTable(datatablesSimple, {
            perPageSelect: false,
            searchable: false,
            status: false
        });
    }

    // 제공된 테이블이 초기화된 후 "datatable-sorter" 클래스 제거
    $(document).ready(function() {
        $('a.datatable-sorter').removeClass('datatable-sorter');
    });
});
