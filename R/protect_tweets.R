#' protect_tweets
#'
#' @data data vector containing the tweets
#' @remove_originals if T the original tweets won't be added in the returned df
#' @preserve_language if T the prompt will ask to preserve the original language. The default behavior F produces outputs in English
#' @preserve_handles if T the @usernames mentioned in the original will be maintained. The default behavor replaced the usernames with @redacted_username.
#'
#' @return a df with two columns
#'
#'

protect_tweets <- function(data,remove_originals=F,preserve_language=F, preserve_handles=F){
  #require(openai)
  #require(stringr)

  token = Sys.getenv("OPENAI_API_KEY")

  textType="tweet"
  data=data
  if(is.null(remove_originals)){remove_originals=F}
  if(preserve_language == T){language="please preserve the original language."}
  if(preserve_language == F){language=" "}
  if(preserve_handles == F){
    data<- stringr::str_replace_all(data, "@\\w+", "@redacted_username")

  }

  mapping_table=data.frame(original=data,
                           privacy_preserving=NA)

  for (i in 1:length(data)){
    if(is.na(data[i])){next}

    output=openai::create_chat_completion(
      model = "gpt-3.5-turbo-0301",
      messages = list(
        list(
          "role" = "system",
          "content" = "You are a helpful assistant aiming at completing your task with precision"
        ),
        list(
          "role" = "user",
          "content" = paste0("Rewrite the following ",textType," :" ,data[i],". Try to not make it longer than 280 Characters",language,".")
        )
      )
    )

    mapping_table$privacy_preserving[i]= output$choices$message.content


  }

  if(remove_originals == T){mapping_table$original=NA}

  return(mapping_table)
}





