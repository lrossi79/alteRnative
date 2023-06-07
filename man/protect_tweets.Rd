\name{protect_tweets}
\alias{protect_tweets}
\title{Protect Tweets}
\usage{
protect_tweets(data,remove_originals=F,preserve_language=F, preserve_handles=F)
}
\description{
The function prompts Chat-GPT 3.5 to produce a variation of the a tweet.
It allows to preserve or remove the original tweets, to preserve the original language and to redact usernames that are found in the tweets.
}

\arguments{
  \item{data}{a vector containing the tweets}
  \item{remove_originals}{if T the original tweet won't be added to the returned df}
  \item{preserve_language}{if T the prompt will include "please preserve the original language."}
  \item{preserve_handles}{if T the variation of the tweet will not contains username mentioned in the original tweets. Those will be replaced by @redacted_username"}
}
\examples{
# protect_tweets(df$tweets,remove_originals=T, preserve_language=T, preserve_handles=F)
}
