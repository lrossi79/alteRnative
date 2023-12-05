

library(shiny)
require(httr)
require(openai)
require(magick)

protect_image=function(image_path){

  #folder=paste0(folder)
  #files=list.files(path = folder)
  #skipped = 0

  #mapping_table_pictures = data.frame(img=files,alternative_version=NA)

  check_img=magick::image_read(path = paste0(image_path))
  if(magick::image_info(check_img)$format != "PNG"){
    dir=dirname(image_path)
    image_tmp=image_read(image_path)
    image_png=image_convert(image_tmp,format = "png")
    image_write(image_png,path = image_path)
    }
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

function(input, output, session) {
  output$files <- renderTable({
    req(input$upload)
    input$upload
  })

  output$photo <- renderImage({
    req(input$upload)
    filename <- normalizePath(file.path(input$upload$datapath))
    list(src = filename, width = 500)
  }, deleteFile = FALSE)

  output$photo_alt <- renderImage({
    req(input$upload)
    photo_alt <- protect_image(normalizePath(file.path(input$upload$datapath)))
    filename <- normalizePath(file.path(paste0(input$upload$datapath,"_2.png")))
    list(src = filename, width = 500)
  }, deleteFile = FALSE)
}
