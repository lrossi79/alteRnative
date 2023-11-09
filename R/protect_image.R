#' protect_image
#'
#' @image a single .png image to variate the variation of the image is downloaded into the working directory
#'
#' @return a df with two columns
#'
#'



require(httr)
require(openai)
require(magick)

protect_image <- function(image_path){

  #folder=paste0(folder)
  #files=list.files(path = folder)
  #skipped = 0

  #mapping_table_pictures = data.frame(img=files,alternative_version=NA)

  check_img=magick::image_read(path = paste0(image_path))
    if(magick::image_info(check_img)$format != "PNG"){print("format not supported")}
    if(magick::image_info(check_img)$filesize > 4000000){print("file too large")}
    else{
      variation=openai::create_image_variation(
        image = image_path,
        n = 1,
        response_format = "url"
      )

      httr::GET(variation$data$url, httr::write_disk(path = paste0(image_path,"_2.png"),overwrite = T))
    }

}

