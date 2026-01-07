dt_dom <- glue(
    "<'row'<'col-sm-6'i><'col-sm-6'p>>",
    "<'row'<'col-sm-6'l><'col-sm-6'f>>",
    "<'row'<'col-sm-12'tr>>"
)
options(DT.options = list(pageLength = 10, dom=dt_dom, lengthMenu=c(5, 10, 20, 40)))
options(DT.fillContainer=TRUE)
tbcap_cls <- "bg-info"
## Set variables for tracking table and figure numbers.
tabN <- 0
figN <- 0

tabN <- tabN + 1
DT::datatable(
    rownames=FALSE,
    fillContainer=TRUE,
    class = "table table-bordered table-sm table-hover",
    filter = "top",
    extensions = c("Buttons", "FixedHeader", "FixedColumns"),
    caption=htmltools::tags$caption(class=tbcap_cls, glue::glue("Table {tabN}: table caption here")),
    options=list(
      autoWidth = TRUE,
      order = c(colIdx1, colIdx2) - 1,
      fixedHeader = TRUE,
      fixedColumns = list(leftColumns = 1, rightColumns = 0),
      buttons = list(
        list(extend = "colvis", className = "btn btn-sm btn-default"),
        list(extend = "copy"),
        list(extend = "csv", filename = "mycsvname"),
        list(extend = "excel", filename = "myexcelname")
      ),
      columnDefs = list(
        list(targets = colIdx3, width = "120px"),  # custom column width
        list(visible = FALSE, targets = "Full column name here")
      ),
      # Make filter boxes shorter and with minimal padding
      initComplete = JS(
        "function(settings, json) {",
        "$('.dataTables_filter').css({'height': '20px', 'padding': '1px'});",
        "}"
      )
    )
)
