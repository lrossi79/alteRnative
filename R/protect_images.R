#' protect_images
#'
#' @folder a folder containing .png images to variate
#' @download_pictures if T the variation of the image is downloaded into the working directory
#'
#' @return a df with two columns
#'
#'



require(httr)
require(openai)
require(magick)

protect_images <- function(folder,download_pictures=F){

  folder=paste0(folder)
  files=list.files(path = folder)
  skipped = 0

  mapping_table_pictures = data.frame(img=files,alternative_version=NA)

  for(i in 1:length(files)){
    check_img=magick::image_read(path = paste0(folder,files[i]))
    if(magick::image_info(check_img)$format != "PNG"){
      skipped = skipped + 1
      next
    }
    if(magick::image_info(check_img)$filesize > 4000000){
      skipped = skipped + 1
      next
    }


    image = paste0(folder,files[i])
    variation=openai::create_image_variation(
      image = image,
      n = 1,
      response_format = "url"
    )
    mapping_table_pictures$alternative_version[i] = variation$data$url

    if(download_pictures==T){
      httr::GET(variation$data$url, httr::write_disk(path = paste0("varied_",files[i]),overwrite = T))

    }

  }

  print(paste0("Result: ",skipped," images skipped due to wrong size or format, Images must be .png and smaller than 4Mb"))

  return(mapping_table_pictures)

}

