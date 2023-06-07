\name{protect_images}
\alias{protect_images}
\title{Protect Images}
\usage{
protect_images(folder,download_pictures=F)
}
\description{
The function prompts DALL-E for variations of all the images that are in the 'folder'. Images must be in png format and smaller than 4Mb. The function returns a data frame with the images and link to the DALL-E variation of the image. IF download_pictures=T the variation will be downloaded in the working directory.
}

\arguments{
  \item{folder}{a folder containing .png images}
  \item{download_pictures}{if T the variations of the images will be saved locally}
}

\examples{
# protect_images(folder="imgs/")
}
