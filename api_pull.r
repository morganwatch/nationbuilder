
## How to pull data from Nationbuilder into a csv
library(RJSONIO)
library(RCurl)

json <- fromJSON(getURL('https://[YOURNATION].nationbuilder.com/api/v1/tags/[TAG]%20-%20Yes/people?limit=[HOW MANY]&access_token=[ACCESS_TOKEN]'))
final_data <- do.call(rbind, json)
write.csv(final_data, "final_data.csv")

tmp <- lapply( json$results, function(u) 
  lapply(u, function(x) if(is.null(x)) NA else x)
)
tmp <- lapply( tmp, as.data.frame )
tmp <- do.call( rbind, tmp )

write.csv(tmp, "final_data.csv")


