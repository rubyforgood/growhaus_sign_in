ready = -> $('.dataTable').DataTable()

$(document).ready(ready)
$(document).on('page:load', ready)
