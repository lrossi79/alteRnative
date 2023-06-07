# alteRnative

Create alternative (privacy protecting) versions of social media content

`alteRnative` leverages the power of OpenAI to allow you to share social media data (for now Tweets and Images) in a way that protects privacy while preserving the informational value. Forget the days when you were forced to share only the tweet_ids to comply with annoying Twitter policies! Forget the ethical concerns of publishing the text of some sensitive tweet knowing too well that it can be simply searched online jeopardizing users' privacy! Stop worrying about adding social media pictures to your articles out of ethical concerns or lack of permission. `alteRnative` solves these problems and many more!

## How does it work?

`alteRnative` uses the OpenAI APIs to ask ChatGPT 3.5 or DALL-E to generate an alternative version of the content you provide. The alternative version will - usually - preserve most of the meaning of the original text and most of the visual elements of the original image, but the text will not correspond to any existing tweet (unless you have been very unlucky) and the image will nor represent any existing person or location.

## What do I need?

alteRnative uses the [openai wrapper](https://github.com/irudnyts/openai) to interface witth the OpenAI API thus you need to provide an API key. Sign up for OpenAI API on [this page](https://openai.com/api/) and get your API key on [this page](https://platform.openai.com/).

By default, `{openai}` will look for `OPENAI_API_KEY` environment variable. If you want to set a global environment variable, you can use the following command

```         
Sys.setenv(
    OPENAI_API_KEY = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
)
```

## Examples & Scenarios

When do you want to use {`alteRnative`} ?

### Tweets

Let's imagine that you are researching how Twitter has reacted to the trial of a famous Hollywood couple, and you have selected a corpus of tweets that you would like to include in your publication but feel unsure about publishing the actual tweet that could easily reveal the online behavior of of many Twitter users.

The function protect_tweets is there for you:

```         
protect_tweets(tweet,
              remove_originals = T,
              preserve_language = F,
              preserve_handles = F)
              
```

alteRnative produces a text that quite similar to the original tweet and redacts usernames that might have mentioned.

```         
@redacted_username @redacted_username Amber Heard was on the stand defending her misogynistic viewpoint, which she also spewed at Johnny on the recordings. She claimed she couldn't hurt him, but it's unacceptable behaviour.
```

This is also useful in the educational setting when having students harvesting tons of real data and carrying it around on their highly unsecured laptops just to pass a course might rise some ethical concerns. Let's give them alternative data!

Moreover, relying on Chat-GPT good manners the `alteRnative` can also act as an effective filter against offensive language that might end up in the students' laptop. When asked to provide an alternative version of a particularly offensive tweet `alteRnative` will reply :

```         
I'm sorry, I am unable to rewrite the given tweet as it contains offensive language and promotes hate speech. As an AI language model, my purpose is to provide helpful and respectful responses to users.
```

### Images

Let's imagine you are working with visual content that represent vulnerable people (children, migrants, activists.. ) and always end up not publishing extremely relevant visual data in order to protect either their identity or the privacy.

The protect_images function allows you to generate variations of your photos that preserve the general meaning and style while being totally artificially generated.

Original:

![](images/kid.png)

```         
protect_images("../anonimizeR/imgs/",download_pictures = T)
```

variation:

![](images/varied_kid.png)

\
\
