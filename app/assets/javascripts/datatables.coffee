ready = ->
    $('.dataTable').DataTable()

    $('.dataTableAdminIndex').DataTable(
        "columns": [
            null, null, null, null,
            null, null, null, null,
            null, null, null, null,
            null,
            { "orderable": false },
            { "orderable": false },
            { "orderable": false }
        ]
    )

$(document).ready(ready)
$(document).on('page:load', ready)
