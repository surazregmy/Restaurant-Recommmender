package user

import grails.transaction.Transactional
import grails.web.context.ServletContextHolder
import org.springframework.web.multipart.MultipartFile

@Transactional
class OwnerService {

    def serviceMethod() {

    }
    def uploadFile(MultipartFile file, String name){

        String storagePath = ""
        def servletContext = ServletContextHolder.servletContext
        storagePath = servletContext.getRealPath("/")



        // Create storage path directory if it does not exist
        def storagePathDirectory = new File(storagePath,"images")

        if (!storagePathDirectory.exists()) {
            print "CREATING DIRECTORY ${storagePath}: "
            if (storagePathDirectory.mkdirs()) {
                println "SUCCESS"
            } else {
                println "FAILED"
            }
        }

        // Store file
        if (!file.isEmpty()) {
            println("I am here not emplty file")
            file.transferTo(new File("${storagePathDirectory}/${name}"))
            println "Saved file: ${storagePathDirectory}/${name}"
            return name;

        } else {
            println "File ${file.inspect()} was empty!"
            return null
        }
    }
}
