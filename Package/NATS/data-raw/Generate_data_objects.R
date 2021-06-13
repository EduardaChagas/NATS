setwd("/home/eduarda/Desktop/Research/Repositories/nats/Data/trozos")


continua6 = "continuaN6.txt"
trozo6 = "trozosN6.txt"
curva.1.x6 = read.table(continua6, stringsAsFactors=FALSE, fileEncoding="latin1")[,1]
curva.1.y6 = read.table(continua6, stringsAsFactors=FALSE, fileEncoding="latin1")[,2]
curva.2.x6 = read.table(trozo6, stringsAsFactors=FALSE, fileEncoding="latin1")[,1]
curva.2.y6 = read.table(trozo6, stringsAsFactors=FALSE, fileEncoding="latin1")[,2]

continua24 = "continuaN24.txt"
trozo24 = "trozosN24.txt"
curva.1.x24 = read.table(continua24, stringsAsFactors=FALSE, fileEncoding="latin1")[,1]
curva.1.y24 = read.table(continua24, stringsAsFactors=FALSE, fileEncoding="latin1")[,2]
curva.2.x24 = read.table(trozo24, stringsAsFactors=FALSE, fileEncoding="latin1")[,1]
curva.2.y24 = read.table(trozo24, stringsAsFactors=FALSE, fileEncoding="latin1")[,2]

continua120 = "continuaN120.txt"
trozo120 = "trozosN120.txt"
curva.1.x120 = read.table(continua120, stringsAsFactors=FALSE, fileEncoding="latin1")[,1]
curva.1.y120 = read.table(continua120, stringsAsFactors=FALSE, fileEncoding="latin1")[,2]
curva.2.x120 = read.table(trozo120, stringsAsFactors=FALSE, fileEncoding="latin1")[,1]
curva.2.y120 = read.table(trozo120, stringsAsFactors=FALSE, fileEncoding="latin1")[,2]

continua720 = "continuaN720.txt"
trozo720 = "trozosN720.txt"
curva.1.x720 = read.table(continua720, stringsAsFactors=FALSE, fileEncoding="latin1")[,1]
curva.1.y720 = read.table(continua720, stringsAsFactors=FALSE, fileEncoding="latin1")[,2]
curva.2.x720 = read.table(trozo720, stringsAsFactors=FALSE, fileEncoding="latin1")[,1]
curva.2.y720 = read.table(trozo720, stringsAsFactors=FALSE, fileEncoding="latin1")[,2]

continua36 = "continuaN36.txt"
trozo36 = "trozosN36.txt"
curva.1.x36 = read.table(continua36, stringsAsFactors=FALSE, fileEncoding="latin1")[,1]
curva.1.y36 = read.table(continua36, stringsAsFactors=FALSE, fileEncoding="latin1")[,2]
curva.2.x36 = read.table(trozo36, stringsAsFactors=FALSE, fileEncoding="latin1")[,1]
curva.2.y36 = read.table(trozo36, stringsAsFactors=FALSE, fileEncoding="latin1")[,2]

continua576 = "continuaN576.txt"
trozo576 = "trozosN576.txt"
curva.1.x576 = read.table(continua576, stringsAsFactors=FALSE, fileEncoding="latin1")[,1]
curva.1.y576 = read.table(continua576, stringsAsFactors=FALSE, fileEncoding="latin1")[,2]
curva.2.x576 = read.table(trozo576, stringsAsFactors=FALSE, fileEncoding="latin1")[,1]
curva.2.y576 = read.table(trozo576, stringsAsFactors=FALSE, fileEncoding="latin1")[,2]

continua14400 = "continuaN14400.txt"
trozo14400 = "trozosN14400.txt"
curva.1.x14400 = read.table(continua14400, stringsAsFactors=FALSE, fileEncoding="latin1")[,1]
curva.1.y14400 = read.table(continua14400, stringsAsFactors=FALSE, fileEncoding="latin1")[,2]
curva.2.x14400 = read.table(trozo14400, stringsAsFactors=FALSE, fileEncoding="latin1")[,1]
curva.2.y14400 = read.table(trozo14400, stringsAsFactors=FALSE, fileEncoding="latin1")[,2]

continua518400 = "continuaN518400.txt"
trozo518400 = "trozosN518400.txt"
curva.1.x518400 = read.table(continua518400, stringsAsFactors=FALSE, fileEncoding="latin1")[,1]
curva.1.y518400 = read.table(continua518400, stringsAsFactors=FALSE, fileEncoding="latin1")[,2]
curva.2.x518400 = read.table(trozo518400, stringsAsFactors=FALSE, fileEncoding="latin1")[,1]
curva.2.y518400 = read.table(trozo518400, stringsAsFactors=FALSE, fileEncoding="latin1")[,2]

usethis::use_data(curva.1.x6, curva.1.y6, curva.2.x6, curva.2.y6,
                  curva.1.x24, curva.1.y24, curva.2.x24, curva.2.y24,
                  curva.1.x120, curva.1.y120, curva.2.x120, curva.2.y120,
                  curva.1.x720, curva.1.y720, curva.2.x720, curva.2.y720,
                  curva.1.x36, curva.1.y36, curva.2.x36, curva.2.y36,
                  curva.1.x576, curva.1.y576, curva.2.x576, curva.2.y576,
                  curva.1.x14400, curva.1.y14400, curva.2.x14400, curva.2.y14400,
                  curva.1.x518400, curva.1.y518400, curva.2.x518400, curva.2.y518400, internal = TRUE)
