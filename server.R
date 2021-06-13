if(!require(shiny)){
  install.packages("shiny")
  require(shiny)
} 
if(!require(data.table)){
  install.packages("data.table")
  require(data.table)
} 
source("distributions.R")
source("measures.R")
source("planes.R")

a = NULL

shinyServer(
  
  function(input, output, session) {
    
    output$text <- renderText({
      choices = c("Bandt-Pompe", "Bandt-Pompe Weight", "Transition Graph", "Weighted Transition Graph")
      option.dist = which((choices == input$distribution))
      paste("You chose", option.dist == TRUE)
      
    })
    
    dataEntropy <- reactive({
      p = NULL
      if(!is.null(input$file1$datapath)){
        series = sapply(input$file1$datapath, read.csv, simplify = F)
        series = sapply(series, unlist, simplify = F) 
        
        choices.dist = c("Bandt-Pompe", "Bandt-Pompe Weight", "Transition Graph", "Weighted Transition Graph")
        option.dist = which((choices.dist == input$distribution))
        
        choices = c("Shannon", "Tsallis", "Renyi", "Fisher", "PmE", "SC")
        
        functions = c("shannon.entropy.normalized", "tsallis.normalized", "renyi.normalized", "fisher.entropy", "min.entropy", "Ccomplexity")
        
        aux = c(1:length(choices))
        option.functions = match(choices, input$EntropyForm)
        option.functions = aux[!is.na(option.functions)]
        
        prob = getDistribution(option.dist, series, input$dimension, input$delay)
        descriptors.values = matrix(ncol = length(option.functions)+1, nrow = length(series))
        series.name = unlist(strsplit(input$file1$name, split='.csv', fixed=TRUE))
        descriptors.values[,1] = series.name
        colnames(descriptors.values) = c("Series", choices[option.functions])
        
        for(i in 2:(length(option.functions)+1)){
          if(option.functions[i-1] == 2 ||option.functions[i-1] == 3)
            values = sapply(prob, functions[option.functions[i-1]], q = as.double(input$q1)) 
          else
            values = sapply(prob, functions[option.functions[i-1]])  
          descriptors.values[,i] = as.matrix(as.character(round(values, digits = 6)))
        }
        
        descriptors.values = data.frame(descriptors.values)
        p = descriptors.values
      }
      p
    })
    
    output$chooseEntropy <- renderDataTable({
      p = NULL
      if(!is.null(input$file1$datapath))
          p = DT::datatable(dataEntropy(), options = list(paging = FALSE, searching = FALSE))
      p
    })
    
    dataDistance <- reactive({
      p = NULL
      if(!is.null(input$file1$datapath)){
        series = sapply(input$file1$datapath, read.csv, simplify = F)
        series = sapply(series, unlist, simplify = F) 
        
        choices.dist = c("Bandt-Pompe", "Bandt-Pompe Weight", "Transition Graph", "Weighted Transition Graph")
        option.dist = which((choices.dist == input$distribution))
        
        choices = c("Euclidian",  "Quadratic", 
                    "Manhattan","Chebyshev", "Hellinger", "Jensen", "Wootter", "Kullback")
        
        functions = c("euclidian.distance", "squared.distance", "manhattan.distance", "chebyshev.distance", "hellinger.distance",
                      "jensen.divergence", "wootters.distance", "kullback.divergence")
        
        aux = c(1:length(choices))
        option.functions = match(choices, input$DistanceForm)
        option.functions = aux[!is.na(option.functions)]
        
        prob = getDistribution(option.dist, series, input$dimension, input$delay)
        descriptors.values = matrix(ncol = length(option.functions)+1, nrow = length(series))
        series.name = unlist(strsplit(input$file1$name, split='.csv', fixed=TRUE))
        descriptors.values[,1] = series.name
        colnames(descriptors.values) = c("Series", choices[option.functions])
        
        for(i in 2:(length(option.functions)+1)){
          values = sapply(prob, functions[option.functions[i-1]])  
          descriptors.values[,i] = as.matrix(as.character(round(values, digits = 6)))
        }
        
        descriptors.values = data.frame(descriptors.values)
        p = descriptors.values
      }
      p
    })
    
    output$chooseDistance <- renderDataTable({
      p = NULL
      if(!is.null(input$file1$datapath))
        p = DT::datatable(dataDistance(), options = list(paging = FALSE, searching = FALSE))
      p
    })
    
    ranges2 <- reactiveValues(x = NULL, y = NULL)
    
    buildPlane <- reactive({
      p = NULL
      if(!is.null(input$file1$datapath)){
        series = sapply(input$file1$datapath, read.csv, simplify = F)
        series = sapply(series, unlist, simplify = F) 
        
        choices.dist = c("Bandt-Pompe", "Bandt-Pompe Weight", "Transition Graph", "Weighted Transition Graph")
        option.dist = which((choices.dist == input$distribution))
        
        choices = c("HC", "FS")
        functions = c("HC.Plane", "FS.Plane")
        option.plot = which((choices == input$plotId))
        
        prob = getDistribution(option.dist, series, input$dimension, input$delay)
        
        d = input$dimension
        if(option.dist == 3 || option.dist == 4)
          d = factorial(d)^2
        else
          d = factorial(d)
        
        if(option.plot == 1)
          p = HC.Plane(prob, d, ranges2$x, ranges2$y, input$plane.theme)
        else
          p = FS.Plane(prob, d, ranges2$x, ranges2$y, input$plane.theme)
      }
      p
    })
    
    output$HC <- renderPlot(
      {
        p = buildPlane()
        p
      }
    )
    
    # When a double-click happens, check if there's a brush on the plot.
    # If so, zoom to the brush bounds; if not, reset the zoom.
    observeEvent(input$plot2_dblclick, {
      brush = input$plot2_brush
      if(!is.null(brush)) {
        ranges2$x = c(brush$xmin, brush$xmax)
        ranges2$y = c(brush$ymin, brush$ymax)
        
      } else {
        ranges2$x = NULL
        ranges2$y = NULL
      }
    })
    
    ranges <- reactiveValues(x = NULL, y = NULL)
    
    buildTimeSeries <- reactive({
      p = NULL
      if(!is.null(input$file1$datapath)){
        series.name = unlist(strsplit(input$file1$name, split='.csv', fixed=TRUE))
        series = sapply(input$file1$datapath, read.csv, simplify = F)
        series = matrix(unlist(series), ncol = length(series))
        series = series[,which(input$chosen.series == series.name)]
        
        if(input$pattern > 0 && input$pattern <= factorial(input$dimension)){
          p = patterns.on.graph(series, input$dimension, input$delay, input$pattern, ranges$x, ranges$y, input$ggplot.theme)
        }
        if(input$pattern == 0){
          p = time.series.plane(series, ranges$x, ranges$y, input$ggplot.theme)
        }
      }
      p
    })
    
    buildHistogram <- reactive({
      p = NULL
      if(!is.null(input$file1$datapath)){
        series.name = unlist(strsplit(input$file1$name, split='.csv', fixed=TRUE))
        series = sapply(input$file1$datapath, read.csv, simplify = F)
        series = matrix(unlist(series), ncol = length(series))
        series = series[,which(input$chosen.series == series.name)]
        p = histogram(series, input$dimension, input$delay, input$ggplot.theme)
      }
      p
      
    })
    
    output$timeSeriesPlot <- renderPlot(
      {
        p = NULL
        if(!is.null(input$file1$datapath))
          p = buildTimeSeries()
        p
      }
    )
    
    # When a double-click happens, check if there's a brush on the plot.
    # If so, zoom to the brush bounds; if not, reset the zoom.
    observeEvent(input$plot1_dblclick, {
      brush = input$plot1_brush
      if(!is.null(brush)) {
        ranges$x = c(brush$xmin, brush$xmax)
        ranges$y = c(brush$ymin, brush$ymax)
        
      } else {
        ranges$x = NULL
        ranges$y = NULL
      }
    })
    
    output$HistogramPlot <- renderPlot(
      {
        p = NULL
        if(!is.null(input$file1$datapath))
          p = buildHistogram()
        p
        
      }
    )
    
    # Allow user to download the data, simply save as csv
    output$downloadDistance <- downloadHandler(
      filename = function() { 
        "distances.csv"
      },
      
      content = function(file) {
        write.table(x = dataDistance(),
                    file = file,
                    quote = FALSE, sep = ",", row.names = FALSE)
      }
    )	
    
    
    # Allow user to download the data, simply save as csv
    output$downloadEntropy <- downloadHandler(
      filename = function() { 
        "entropies.csv"
      },
      
      content = function(file) {
        write.table(x = dataEntropy(),
                    file = file,
                    quote = FALSE, sep = ",", row.names = FALSE)
      }
    )
    
    
    # Allow user to download the plot
    output$downloadTimeSeries <- downloadHandler(
      filename = function() {
        "timeSeries.pdf"
      },
      
      content = function(file) {
        pdf(file = file,
            width = 12,
            height = 12)
        print(buildTimeSeries())
        dev.off()
      }
    )		
    
    output$downloadHistogram <- downloadHandler(
      filename = function() {
        "Histogram.pdf"
      },
      
      content = function(file) {
        pdf(file = file,
            width = 12,
            height = 12)
        print(buildHistogram())
        dev.off()
      }
    )			
    
    output$downloadPlane <- downloadHandler(
      filename = function() {
        "Plane.pdf"
      },
      
      content = function(file) {
        pdf(file = file,
            width = 12,
            height = 12)
        print(buildPlane())
        dev.off()
      }
    )		
    
    observeEvent(input$file1, {
      series.name = as.list(strsplit(input$file1$name, split='.csv', fixed=TRUE))
      updateSelectInput(session, "chosen.series", 
                        label =  "Series to be analyzed:",
                        choices = series.name)
    }, once = TRUE)
    
    observeEvent(input$reload, {
      series.name = as.list(strsplit(input$file1$name, split='.csv', fixed=TRUE))
      updateSelectInput(session, "chosen.series", 
                        label =  "Series to be analyzed:",
                        choices = series.name)
    })
    
    
    output$contents <- renderTable(
      {
        a = sapply(input$file1$datapath, read.csv, simplify = F)
        a = sapply(a, unlist, simplify = F)
        a = sapply(a, round, digits = 6, simplify = F)
        a = sapply(a, mean, simplify = F)
        a = sapply(a, as.character, simplify = F)
        a = as.matrix(a)
        data.frame("Series" = input$file1$name, "mean" = a)
      }
    )
    
  }
)
