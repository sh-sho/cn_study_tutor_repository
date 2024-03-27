package example.micronaut;

import io.micronaut.http.MediaType;
import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Get;
import io.micronaut.http.annotation.Produces;

@Controller("/hello") 
public class HelloController {
    @Get 
    @Produces(MediaType.APPLICATION_JSON) 
    public replayMessage getMessage() {
        replayMessage message = new replayMessage();
        message.setMessage("Hello World");
        return message; 
    }
}
